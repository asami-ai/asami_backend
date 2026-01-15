# Merkado OS: Technical Architecture Overview

## Document Information
- **Version**: 1.0
- **Date**: January 15, 2026
- **Status**: Canonical Specification
- **Audience**: Engineering Team, Technical Leadership

---

## 1. System Architecture Philosophy

Merkado OS is built as a **multi-tenant, microservices-based economic operating system**. Every architectural decision prioritizes:

1. **Economic Continuity**: System must never destroy livelihoods through technical failures
2. **Tenant Isolation**: Complete data separation between tenants while sharing infrastructure
3. **Horizontal Scalability**: Auto-scale individual services based on load
4. **Stateless Operations**: Workers must be replaceable without data loss
5. **Intelligence Layer**: Centralized learning across tenants with strict privacy boundaries

---

## 2. High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     CLIENT APPLICATIONS                          │
│  Driply (Mobile/Web) | MyCut (Mobile/Web) | ItsYourDay | etc.   │
└────────────────────────────┬────────────────────────────────────┘
                             │
┌────────────────────────────▼────────────────────────────────────┐
│                      API GATEWAY LAYER                           │
│  Kong/AWS API Gateway - Routing, Auth, Rate Limiting             │
│  • Tenant ID Injection                                           │
│  • Platform ID Tagging (mobile/web/api)                          │
│  • JWT Validation & Session Management                           │
└────────────────────────────┬────────────────────────────────────┘
                             │
┌────────────────────────────▼────────────────────────────────────┐
│                    CORE MICROSERVICES LAYER                      │
│                                                                   │
│  ┌─────────────────┐  ┌─────────────────┐  ┌────────────────┐  │
│  │ Identity Service│  │Collaboration Svc│  │Transaction Svc │  │
│  │  (Auth, Users)  │  │ (Multi-party)   │  │ (Wallet/Escrow)│  │
│  └─────────────────┘  └─────────────────┘  └────────────────┘  │
│                                                                   │
│  ┌─────────────────┐  ┌─────────────────┐  ┌────────────────┐  │
│  │   Trust Service │  │  Asset Service  │  │Notification Svc│  │
│  │  (Reputation)   │  │  (UGC/Media)    │  │ (Multi-channel)│  │
│  └─────────────────┘  └─────────────────┘  └────────────────┘  │
│                                                                   │
│  ┌─────────────────┐  ┌─────────────────┐  ┌────────────────┐  │
│  │Recommendation   │  │  Search Service │  │ Dispute Service│  │
│  │    Engine       │  │  (Vector DB)    │  │  (Resolution)  │  │
│  └─────────────────┘  └─────────────────┘  └────────────────┘  │
└────────────────────────────┬────────────────────────────────────┘
                             │
┌────────────────────────────▼────────────────────────────────────┐
│                      EVENT BUS / MESSAGE QUEUE                   │
│  Apache Kafka / RabbitMQ - Asynchronous Communication            │
│  • Collaboration Events                                          │
│  • Transaction State Changes                                     │
│  • Trust Updates                                                 │
│  • Notification Triggers                                         │
└────────────────────────────┬────────────────────────────────────┘
                             │
┌────────────────────────────▼────────────────────────────────────┐
│                         DATA LAYER                               │
│                                                                   │
│  ┌─────────────────┐  ┌─────────────────┐  ┌────────────────┐  │
│  │   PostgreSQL    │  │     Redis       │  │   MongoDB      │  │
│  │ (Tenant Schemas)│  │  (Cache/State)  │  │  (Analytics)   │  │
│  └─────────────────┘  └─────────────────┘  └────────────────┘  │
│                                                                   │
│  ┌─────────────────┐  ┌─────────────────┐  ┌────────────────┐  │
│  │  Elasticsearch  │  │   Vector DB     │  │      S3        │  │
│  │    (Search)     │  │(Recommendations)│  │ (Media Storage)│  │
│  └─────────────────┘  └─────────────────┘  └────────────────┘  │
└───────────────────────────────────────────────────────────────────┘
```

---

## 3. Technology Stack Summary

### Backend Services
- **Primary Framework**: NestJS (TypeScript)
- **Alternative**: Serverpod (Dart) for real-time features
- **API Gateway**: Kong / AWS API Gateway
- **Message Queue**: Apache Kafka (high-throughput) / RabbitMQ (routing)

### Databases
- **Relational**: PostgreSQL with tenant schemas
- **Cache**: Redis (sessions, rate limiting, real-time state)
- **Search**: Elasticsearch (full-text search)
- **Analytics**: MongoDB (event streams)
- **Vector**: Pinecone / Weaviate (recommendations)
- **Object Storage**: AWS S3 / Azure Blob

### Frontend
- **Mobile**: Flutter (iOS/Android)
- **Web**: Next.js + React
- **Admin**: React + Vite

### Infrastructure
- **Cloud**: AWS (primary)
- **Container Orchestration**: Kubernetes (K8s)
- **CI/CD**: GitHub Actions / GitLab CI
- **Monitoring**: Prometheus + Grafana
- **Logging**: ELK Stack
- **Error Tracking**: Sentry

---

## 4. The 8 Pillars: Technical Implementation

### Pillar 1: Multi-Tenancy

**Implementation Pattern**: Shared Infrastructure, Logical Data Isolation

```typescript
// Every request carries tenant context
interface RequestContext {
  tenant_id: string;        // "driply" | "mycut" | "itsyourday"
  platform_id: string;      // "mobile_ios" | "mobile_android" | "web" | "api"
  user_id: string;
  session_id: string;
}

// Database schema per tenant
// Schema: driply_production
// Schema: mycut_production
// Schema: itsyourday_production
```

**Database Strategy**:
- PostgreSQL schemas for tenant isolation
- Shared tables: `system.tenants`, `system.platform_config`
- Tenant-specific tables: `{tenant}.collaborations`, `{tenant}.transactions`

**Query Pattern**:
```sql
-- Every query scoped to tenant
SELECT * FROM collaborations 
WHERE tenant_id = :tenant_id 
  AND collaboration_id = :id;
```

**Key Benefits**:
- Cost-efficient (single database cluster)
- Strong data isolation
- Simplified backup/restore per tenant
- Easy tenant-specific migrations

---

### Pillar 2: Auto-Scaling

**Implementation**: Kubernetes Horizontal Pod Autoscaler (HPA)

**Scaling Triggers**:
- CPU utilization > 70%
- Memory utilization > 80%
- Custom metrics (request queue depth, collaboration load)

**Example Configuration**:
```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: collaboration-service-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: collaboration-service
  minReplicas: 3
  maxReplicas: 20
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
  - type: Pods
    pods:
      metric:
        name: collaboration_queue_depth
      target:
        type: AverageValue
        averageValue: "100"
```

**Service Independence**:
- Each microservice scales independently
- Transaction service can scale to 50 pods while Asset service runs 5 pods
- Load balancer distributes traffic across healthy pods

---

### Pillar 3: Microservices

**Service Boundaries** (Domain-Driven Design):

1. **Identity Service**
   - User authentication (OAuth 2.0, JWT)
   - Profile management
   - Role-based access control (RBAC)
   - KYC verification integration

2. **Collaboration Service**
   - Collaboration lifecycle management
   - Participant roles and permissions
   - Responsibility tracking
   - Failure containment

3. **Transaction Service**
   - Wallet management (virtual ledgers)
   - Escrow operations
   - Multi-party splits
   - Payment gateway integration (Paystack, Fincra)

4. **Trust Service**
   - Reputation scoring (behavioral memory)
   - Trust decay algorithms
   - Role-specific trust tracking
   - Propagation rules

5. **Asset Service**
   - UGC management
   - Media processing (FFmpeg)
   - CDN integration (Bunny CDN)
   - Licensing and ownership

6. **Notification Service**
   - Multi-channel delivery (Email, SMS, Push, In-app)
   - Context-aware triggers
   - Template management
   - Delivery tracking

7. **Recommendation Engine**
   - Vector embeddings
   - Cross-tenant learning
   - Cold-start strategies
   - Real-time personalization

8. **Search Service**
   - Full-text search (Elasticsearch)
   - Vector search integration
   - Faceted filtering
   - Autocomplete

9. **Dispute Service**
   - Case management
   - Evidence collection
   - Arbitration workflows
   - Resolution enforcement

**Inter-Service Communication**:
- **Synchronous**: REST APIs (client-facing), gRPC (service-to-service)
- **Asynchronous**: Event Bus (Kafka) for decoupled operations

---

### Pillar 4: Recommendation Engine

**Architecture**: Vector-Based Similarity Search

**Data Flow**:
```
User Action → Event Stream → Feature Extraction → Vector Embedding 
→ Vector DB → Similarity Search → Contextual Ranking → API Response
```

**Implementation**:

```typescript
// Event capture
interface UserInteractionEvent {
  tenant_id: string;
  user_id: string;
  platform_id: string;
  event_type: 'view' | 'search' | 'collaborate' | 'transact';
  asset_id?: string;
  collaboration_id?: string;
  search_query?: string;
  timestamp: number;
  session_id: string;
}

// Vector embedding
interface AssetEmbedding {
  asset_id: string;
  tenant_id: string;
  vector: number[];  // 512-dimensional embedding
  metadata: {
    category: string;
    tags: string[];
    price_range: string;
  };
}

// Recommendation request
async getRecommendations(userId: string, tenantId: string, platformId: string) {
  const userProfile = await this.vectorDB.getUserVector(userId);
  const candidates = await this.vectorDB.similaritySearch(userProfile, {
    tenant_id: tenantId,
    limit: 50
  });
  
  return this.contextualRanking(candidates, { platformId, tenantId });
}
```

**Cold Start Strategy**:
1. **Global Embeddings**: Use cross-tenant behavioral patterns
2. **Content-Based**: Tag-based matching for new assets
3. **Popularity Baseline**: Show trending items until profile builds

**Technology**: Pinecone / Weaviate / Milvus

---

### Pillar 5: Platform Tracking

**Implementation**: Request Context Injection

**Platform IDs**:
- `mobile_ios` - iOS app
- `mobile_android` - Android app
- `web_desktop` - Web browser (desktop)
- `web_mobile` - Web browser (mobile)
- `api_external` - External API clients

**Tracking Mechanism**:

```typescript
// Middleware injection
class PlatformTrackingMiddleware {
  async use(req: Request, res: Response, next: NextFunction) {
    const platformId = this.detectPlatform(req);
    
    req.context = {
      tenant_id: req.headers['x-tenant-id'],
      platform_id: platformId,
      user_id: req.user.id,
      session_id: req.session.id,
      ip_address: req.ip,
      user_agent: req.headers['user-agent']
    };
    
    // Log to analytics
    await this.analytics.track({
      event: 'request',
      context: req.context,
      timestamp: Date.now()
    });
    
    next();
  }
  
  private detectPlatform(req: Request): string {
    const userAgent = req.headers['user-agent'];
    
    if (userAgent.includes('Driply-iOS')) return 'mobile_ios';
    if (userAgent.includes('Driply-Android')) return 'mobile_android';
    if (this.isMobileBrowser(userAgent)) return 'web_mobile';
    if (this.isDesktopBrowser(userAgent)) return 'web_desktop';
    
    return 'api_external';
  }
}
```

**Usage in Services**:
```typescript
// Notifications know where to send
async sendNotification(userId: string, context: RequestContext) {
  const channel = this.selectChannel(context.platform_id);
  // mobile_ios → Push (APNs)
  // web_desktop → In-app banner
}
```

---

### Pillar 6: Context-Aware Notifications

**Architecture**: Event-Driven Triggers

**Event Types**:
1. **Action-Based**: User performs an action (view, search, add-to-cart)
2. **Inactivity-Based**: User fails to act within timeframe
3. **Cross-Platform**: Activity on one platform triggers notification on another

**Implementation**:

```typescript
// Event stream processing
class NotificationTriggerService {
  async processEvent(event: UserInteractionEvent) {
    // Check for notification rules
    const rules = await this.getRulesForEvent(event);
    
    for (const rule of rules) {
      if (await this.evaluateCondition(rule, event)) {
        await this.scheduleNotification(rule, event);
      }
    }
  }
  
  private async evaluateCondition(rule: NotificationRule, event: UserInteractionEvent) {
    // Example: "If user views asset but doesn't collaborate within 4 hours"
    if (rule.type === 'incomplete_interest') {
      const hasCollaborated = await this.checkCollaboration(event.user_id, event.asset_id);
      const timeSinceView = Date.now() - event.timestamp;
      
      return !hasCollaborated && timeSinceView > rule.delay_ms;
    }
    
    // Example: "If user inactive for 72 hours"
    if (rule.type === 'inactivity') {
      const lastSeen = await this.getLastActivity(event.user_id);
      const inactiveDuration = Date.now() - lastSeen;
      
      return inactiveDuration > rule.threshold_ms;
    }
    
    return false;
  }
}
```

**Rule Configuration**:
```typescript
interface NotificationRule {
  id: string;
  tenant_id: string;
  name: string;
  type: 'incomplete_interest' | 'inactivity' | 'cross_platform';
  trigger_event: string;
  conditions: {
    delay_ms?: number;
    threshold_ms?: number;
    platforms?: string[];
  };
  notification_template_id: string;
  priority: 'high' | 'medium' | 'low';
  enabled: boolean;
}
```

---

### Pillar 7: Modular Post Office

**Architecture**: Pluggable Channel Adapters

**Channel Types**:
- Email (SendGrid, AWS SES)
- SMS (Twilio)
- Push Notifications (Firebase Cloud Messaging, APNs)
- In-App (WebSocket)
- Webhook (External systems)

**Implementation**:

```typescript
// Channel adapter interface
interface NotificationChannel {
  send(recipient: string, content: NotificationContent, context: RequestContext): Promise<DeliveryResult>;
  supports(platformId: string): boolean;
  priority: number;
}

// Email adapter
class EmailChannel implements NotificationChannel {
  async send(recipient: string, content: NotificationContent, context: RequestContext) {
    return await this.emailProvider.send({
      to: recipient,
      subject: content.subject,
      html: content.body,
      tenant_id: context.tenant_id
    });
  }
  
  supports(platformId: string) {
    return true; // Email works everywhere
  }
  
  priority = 3; // Lower priority
}

// Push notification adapter
class PushChannel implements NotificationChannel {
  async send(recipient: string, content: NotificationContent, context: RequestContext) {
    if (context.platform_id === 'mobile_ios') {
      return await this.apns.send({ deviceToken: recipient, notification: content });
    }
    
    if (context.platform_id === 'mobile_android') {
      return await this.fcm.send({ deviceToken: recipient, notification: content });
    }
    
    throw new Error('Push not supported for platform');
  }
  
  supports(platformId: string) {
    return platformId.startsWith('mobile_');
  }
  
  priority = 1; // Highest priority
}

// Orchestrator
class NotificationOrchestrator {
  private channels: NotificationChannel[] = [
    new PushChannel(),
    new EmailChannel(),
    new SMSChannel(),
    new InAppChannel()
  ];
  
  async deliver(notification: Notification) {
    const context = notification.context;
    
    // Select best channel based on platform and availability
    const channel = this.channels
      .filter(c => c.supports(context.platform_id))
      .sort((a, b) => a.priority - b.priority)[0];
    
    if (!channel) {
      throw new Error('No suitable channel found');
    }
    
    return await channel.send(
      notification.recipient,
      notification.content,
      context
    );
  }
}
```

**Benefits**:
- Add new channels without modifying core logic
- Fallback mechanisms (Push → Email → SMS)
- A/B test different channels
- AI can plug into same system later

---

### Pillar 8: AI-Ready Architecture

**Philosophy**: Build slots for AI, operate with humans now

**Current State** (Human-Operated):
- Manual rule creation for notifications
- Admin-reviewed dispute resolutions
- Curator-selected trending items

**Future State** (AI-Augmented):
- AI generates notification timing and content
- AI suggests dispute resolutions
- AI predicts trending collaborations

**Implementation Strategy**:

```typescript
// Decision interface (human or AI)
interface DecisionMaker {
  decide(context: DecisionContext): Promise<Decision>;
}

// Human implementation (now)
class HumanDecisionMaker implements DecisionMaker {
  async decide(context: DecisionContext) {
    // Wait for admin input
    return await this.adminQueue.waitForDecision(context);
  }
}

// AI implementation (future)
class AIDecisionMaker implements DecisionMaker {
  async decide(context: DecisionContext) {
    const prediction = await this.model.predict(context);
    
    if (prediction.confidence > 0.95) {
      return prediction.decision; // Auto-decide
    }
    
    // Fallback to human for low confidence
    return await this.humanDecisionMaker.decide(context);
  }
}

// Notification timing (AI slot)
class NotificationScheduler {
  constructor(private decisionMaker: DecisionMaker) {}
  
  async scheduleNotification(notification: PendingNotification) {
    const context = {
      user_history: await this.getUserHistory(notification.user_id),
      notification_type: notification.type,
      current_time: Date.now()
    };
    
    const decision = await this.decisionMaker.decide(context);
    
    await this.queue.schedule(notification, decision.send_at);
  }
}
```

**Data Collection** (Building the Training Set):
```typescript
// Log every decision for future AI training
await this.trainingData.log({
  context: decisionContext,
  decision: humanDecision,
  outcome: {
    user_engaged: true,
    time_to_engagement: 3600000, // 1 hour
    conversion: true
  },
  timestamp: Date.now()
});
```

**AI Integration Points**:
1. **Notification Timing**: When to send based on user patterns
2. **Recommendation Ranking**: Personalized ordering of results
3. **Dispute Resolution**: Suggest outcomes based on similar cases
4. **Fraud Detection**: Flag suspicious collaborations
5. **Content Moderation**: Auto-flag policy violations

---

## 5. Security Architecture

### Authentication & Authorization
- **Protocol**: OAuth 2.0 + OpenID Connect
- **Tokens**: JWT (15-minute expiry) + Refresh tokens (30-day rotation)
- **MFA**: Optional for high-value transactions

### Data Protection
- **Encryption at Rest**: AES-256
- **Encryption in Transit**: TLS 1.3
- **PII Handling**: Tokenization for sensitive data
- **Database Encryption**: PostgreSQL pgcrypto

### API Security
- **Rate Limiting**: Kong rate limit plugin (1000 req/hour per user)
- **DDoS Protection**: CloudFlare / AWS Shield
- **Input Validation**: Schema validation on all endpoints
- **CORS**: Strict origin whitelisting

### Compliance
- **PCI-DSS**: Delegated to payment gateways (Paystack, Fincra)
- **GDPR/NDPR**: Data portability, right to deletion
- **KYC/AML**: Metamap integration

---

## 6. Disaster Recovery

### Backup Strategy
- **Frequency**: Daily automated backups
- **Retention**: 90 days
- **Storage**: Multi-region (AWS S3, Google Cloud Storage)
- **Testing**: Quarterly restore drills

### Recovery Objectives
- **RTO (Critical)**: < 30 minutes
- **RTO (Core)**: < 2 hours
- **RPO (Transactions)**: < 5 minutes
- **RPO (Content)**: < 24 hours

### Failure Scenarios
1. **Database Corruption**: Point-in-time recovery from backup
2. **Region Outage**: Failover to secondary AWS region
3. **CDN Failure**: Activate backup CDN (CloudFront)
4. **Service Outage**: Auto-restart pods, scale horizontally

---

## 7. Monitoring & Observability

### Metrics Collection
- **Application**: Prometheus (request rate, latency, errors)
- **Business**: Custom metrics (GMV, collaborations/min, trust scores)
- **Infrastructure**: CPU, memory, disk, network

### Logging
- **Structured Logging**: JSON format with correlation IDs
- **Centralized**: ELK Stack (Elasticsearch, Logstash, Kibana)
- **Retention**: 90 days (production), 30 days (staging)

### Alerting
- **Critical**: Page on-call engineer (payment failures, DB down)
- **Warning**: Slack notification (high CPU, slow APIs)
- **Info**: Daily digest (traffic patterns, revenue)

### Tracing
- **Distributed Tracing**: Jaeger / AWS X-Ray
- **Correlation**: Track requests across microservices
- **Performance**: Identify bottlenecks in service chains

---

## 8. Development Guidelines

### Code Standards
- **Language**: TypeScript (backend), Dart (Flutter), JavaScript/TypeScript (web)
- **Linting**: ESLint (JS/TS), Dart Analyzer
- **Formatting**: Prettier (JS/TS), dart format
- **Testing**: Jest (backend), Flutter Test, React Testing Library

### Git Workflow
- **Branching**: GitFlow (main, develop, feature/*, hotfix/*)
- **Commits**: Conventional Commits (feat, fix, docs, chore)
- **Reviews**: Mandatory PR reviews, 2 approvals for production

### Testing Strategy
- **Unit Tests**: > 80% coverage
- **Integration Tests**: Service interactions, database operations
- **E2E Tests**: Critical user flows
- **Load Tests**: k6 for performance validation

---

## 9. Deployment Strategy

### Environments
- **Development**: Local (Docker Compose)
- **Staging**: K8s cluster (mirrors production)
- **Production**: Multi-AZ K8s clusters

### CI/CD Pipeline
```
Code Commit → Run Tests → Build Docker Images → Push to Registry 
→ Deploy to Staging → E2E Tests → Manual Approval → Deploy to Production 
→ Monitor
```

### Deployment Patterns
- **Blue-Green**: Zero-downtime deployments
- **Canary**: Gradual rollout (10% → 50% → 100%)
- **Rollback**: Instant revert to previous version

---

## 10. Scalability Projections

### Year 1
- **Users**: 500 - 2,000
- **Tenants**: 3 - 5
- **Concurrent Users**: 50 - 200
- **Storage**: 500GB - 2TB
- **Bandwidth**: 5TB - 15TB/month

### Year 2
- **Users**: 5,000 - 15,000
- **Tenants**: 8 - 12
- **Concurrent Users**: 500 - 1,500
- **Storage**: 3TB - 10TB
- **Bandwidth**: 30TB - 80TB/month

### Year 3
- **Users**: 50,000 - 100,000
- **Tenants**: 20 - 30
- **Concurrent Users**: 5,000 - 10,000
- **Storage**: 20TB - 50TB
- **Bandwidth**: 150TB - 300TB/month

---

## Document Status

This is a **living document**. All architectural decisions must be documented here and versioned. Any deviations require explicit approval from CTO and documentation of rationale.

**Last Updated**: January 15, 2026  
**Next Review**: April 15, 2026  
**Owner**: Technical Leadership Team
