BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ai_conversation_usage" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "conversationId" uuid NOT NULL,
    "messageCount" bigint NOT NULL DEFAULT 0,
    "totalTokens" bigint NOT NULL DEFAULT 0,
    "inputTokens" bigint NOT NULL DEFAULT 0,
    "outputTokens" bigint NOT NULL DEFAULT 0,
    "toolCallsInConversation" bigint NOT NULL DEFAULT 0,
    "uniqueToolsUsed" text,
    "estimatedCost" double precision NOT NULL DEFAULT 0.0,
    "averageResponseTime" double precision NOT NULL DEFAULT 0.0,
    "userSatisfactionRating" double precision,
    "date" timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "user_ai_date_idx" ON "ai_conversation_usage" USING btree ("userId", "date");
CREATE INDEX "conversation_ai_idx" ON "ai_conversation_usage" USING btree ("conversationId");
CREATE INDEX "date_ai_idx" ON "ai_conversation_usage" USING btree ("date");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "billing_cycle_summaries" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "vendorId" uuid NOT NULL,
    "periodStart" timestamp without time zone NOT NULL,
    "periodEnd" timestamp without time zone NOT NULL,
    "billingCycle" text NOT NULL,
    "subscriptionTier" bigint NOT NULL,
    "baseSubscriptionAmount" double precision NOT NULL DEFAULT 0.0,
    "totalToolCalls" bigint NOT NULL DEFAULT 0,
    "toolCallsIncluded" bigint NOT NULL DEFAULT 0,
    "toolCallsOverage" bigint NOT NULL DEFAULT 0,
    "toolCallsOverageCost" double precision NOT NULL DEFAULT 0.0,
    "totalAIMessages" bigint NOT NULL DEFAULT 0,
    "aiMessagesIncluded" bigint NOT NULL DEFAULT 0,
    "aiMessagesOverage" bigint NOT NULL DEFAULT 0,
    "aiMessagesOverageCost" double precision NOT NULL DEFAULT 0.0,
    "totalProducts" bigint NOT NULL DEFAULT 0,
    "productsIncluded" bigint NOT NULL DEFAULT 0,
    "productsOverage" bigint NOT NULL DEFAULT 0,
    "productsOverageCost" double precision NOT NULL DEFAULT 0.0,
    "totalAIDescriptions" bigint NOT NULL DEFAULT 0,
    "aiDescriptionsIncluded" bigint NOT NULL DEFAULT 0,
    "aiDescriptionsOverage" bigint NOT NULL DEFAULT 0,
    "aiDescriptionsOverageCost" double precision NOT NULL DEFAULT 0.0,
    "totalTransactionFees" double precision NOT NULL DEFAULT 0.0,
    "totalUsageCost" double precision NOT NULL DEFAULT 0.0,
    "totalAmount" double precision NOT NULL DEFAULT 0.0,
    "status" text NOT NULL DEFAULT 'draft'::text,
    "invoiceId" uuid,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "vendor_billing_period_idx" ON "billing_cycle_summaries" USING btree ("vendorId", "periodStart", "periodEnd");
CREATE INDEX "status_billing_idx" ON "billing_cycle_summaries" USING btree ("status");
CREATE INDEX "invoice_billing_idx" ON "billing_cycle_summaries" USING btree ("invoiceId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "customer_ai_policies" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "policyName" text NOT NULL,
    "description" text,
    "dailyMessageLimit" bigint NOT NULL DEFAULT 100,
    "dailyToolCallLimit" bigint NOT NULL DEFAULT 20,
    "requireExplicitIntent" boolean NOT NULL DEFAULT true,
    "minimumConfidenceScore" double precision NOT NULL DEFAULT 0.8,
    "throttleAfterCount" bigint NOT NULL DEFAULT 50,
    "throttleDelaySeconds" bigint NOT NULL DEFAULT 2,
    "enableProgressiveRestrictions" boolean NOT NULL DEFAULT true,
    "restrictionThresholds" text,
    "maxDailyCost" double precision NOT NULL DEFAULT 1.0,
    "warnAtCostPercentage" double precision NOT NULL DEFAULT 0.8,
    "isActive" boolean NOT NULL DEFAULT true,
    "isDefault" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "policy_name_idx" ON "customer_ai_policies" USING btree ("policyName");
CREATE INDEX "active_idx" ON "customer_ai_policies" USING btree ("isActive");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "customer_usage_patterns" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "averageDailyMessages" double precision NOT NULL DEFAULT 0.0,
    "averageDailyToolCalls" double precision NOT NULL DEFAULT 0.0,
    "peakUsageHour" bigint,
    "usageClass" bigint NOT NULL,
    "isAbuser" boolean NOT NULL DEFAULT false,
    "abuseScore" double precision NOT NULL DEFAULT 0.0,
    "toolSuccessRate" double precision NOT NULL DEFAULT 1.0,
    "averageToolExecutionTime" double precision NOT NULL DEFAULT 0.0,
    "averageConversationLength" double precision NOT NULL DEFAULT 0.0,
    "repetitiveQueryScore" double precision NOT NULL DEFAULT 0.0,
    "shouldThrottle" boolean NOT NULL DEFAULT false,
    "throttleReason" text,
    "currentThrottleDelay" bigint NOT NULL DEFAULT 0,
    "lastAnalyzedAt" timestamp without time zone,
    "analysisCount" bigint NOT NULL DEFAULT 0,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "user_c_idx" ON "customer_usage_patterns" USING btree ("userId");
CREATE INDEX "usage_class_idx" ON "customer_usage_patterns" USING btree ("usageClass");
CREATE INDEX "abuse_idx" ON "customer_usage_patterns" USING btree ("isAbuser");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "daily_usage_trackers" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "userType" bigint NOT NULL,
    "date" timestamp without time zone NOT NULL,
    "resetAt" timestamp without time zone NOT NULL,
    "toolCallsCount" bigint NOT NULL DEFAULT 0,
    "toolCallsLimit" bigint NOT NULL,
    "aiMessagesCount" bigint NOT NULL DEFAULT 0,
    "aiMessagesLimit" bigint NOT NULL,
    "productsCreatedCount" bigint NOT NULL DEFAULT 0,
    "productsCreatedLimit" bigint NOT NULL,
    "aiDescriptionsCount" bigint NOT NULL DEFAULT 0,
    "aiDescriptionsLimit" bigint NOT NULL,
    "analyticsQueriesCount" bigint NOT NULL DEFAULT 0,
    "analyticsQueriesLimit" bigint NOT NULL,
    "isInGracePeriod" boolean NOT NULL DEFAULT false,
    "gracePeriodUsed" bigint NOT NULL DEFAULT 0,
    "gracePeriodLimit" bigint NOT NULL DEFAULT 5,
    "subscriptionTier" bigint,
    "softLimitWarned" boolean NOT NULL DEFAULT false,
    "hardLimitReached" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "user_daily_date_idx" ON "daily_usage_trackers" USING btree ("userId", "date");
CREATE INDEX "date_daily_idx" ON "daily_usage_trackers" USING btree ("date");
CREATE INDEX "reset_idx" ON "daily_usage_trackers" USING btree ("resetAt");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "limit_breach_logs" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "userType" bigint NOT NULL,
    "limitType" bigint NOT NULL,
    "attemptedAction" text NOT NULL,
    "currentUsage" bigint NOT NULL,
    "limitValue" bigint NOT NULL,
    "subscriptionTier" bigint,
    "conversationId" uuid,
    "actionTaken" text NOT NULL,
    "userNotified" boolean NOT NULL DEFAULT false,
    "severity" bigint NOT NULL,
    "breachedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "user_breach_idx" ON "limit_breach_logs" USING btree ("userId", "breachedAt");
CREATE INDEX "limit_type_idx" ON "limit_breach_logs" USING btree ("limitType");
CREATE INDEX "severity_idx" ON "limit_breach_logs" USING btree ("severity");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tier_features" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "tier" bigint NOT NULL,
    "dailyToolCallLimit" bigint NOT NULL,
    "monthlyToolCallLimit" bigint NOT NULL,
    "dailyAIMessageLimit" bigint NOT NULL,
    "monthlyAIMessageLimit" bigint NOT NULL,
    "productLimit" bigint NOT NULL,
    "aiDescriptionLimit" bigint NOT NULL,
    "allowBulkOperations" boolean NOT NULL DEFAULT false,
    "allowAdvancedAnalytics" boolean NOT NULL DEFAULT false,
    "allowAPIAccess" boolean NOT NULL DEFAULT false,
    "allowWhiteLabel" boolean NOT NULL DEFAULT false,
    "supportPriority" text NOT NULL DEFAULT 'standard'::text,
    "supportResponseTime" bigint NOT NULL DEFAULT 24,
    "monthlyPrice" double precision NOT NULL,
    "yearlyPrice" double precision NOT NULL,
    "platformTransactionFee" double precision NOT NULL,
    "overageToolCallPrice" double precision NOT NULL DEFAULT 0.01,
    "overageAIMessagePrice" double precision NOT NULL DEFAULT 0.001,
    "overageProductPrice" double precision NOT NULL DEFAULT 1.0,
    "overageAIDescriptionPrice" double precision NOT NULL DEFAULT 0.1,
    "isActive" boolean NOT NULL DEFAULT true,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "tier_sub_idx" ON "tier_features" USING btree ("tier");
CREATE INDEX "active_tier_idx" ON "tier_features" USING btree ("isActive");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tool_usage_limits" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "tier" bigint NOT NULL,
    "limitType" bigint NOT NULL,
    "dailyLimit" bigint NOT NULL,
    "monthlyLimit" bigint,
    "allowGracePeriod" boolean NOT NULL DEFAULT true,
    "gracePeriodActions" bigint NOT NULL DEFAULT 5,
    "restrictedTools" text,
    "allowedToolsAfterLimit" text,
    "costPerUsage" double precision NOT NULL DEFAULT 0.0,
    "isActive" boolean NOT NULL DEFAULT true,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "tier_type_idx" ON "tool_usage_limits" USING btree ("tier", "limitType");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tool_usage_logs" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "userType" bigint NOT NULL,
    "conversationId" uuid,
    "toolName" text NOT NULL,
    "toolCategory" text,
    "arguments" text,
    "success" boolean NOT NULL DEFAULT true,
    "executionTimeMs" bigint NOT NULL,
    "errorMessage" text,
    "costIncurred" double precision NOT NULL DEFAULT 0.0,
    "isBillable" boolean NOT NULL DEFAULT false,
    "billingPeriodStart" timestamp without time zone,
    "billingPeriodEnd" timestamp without time zone,
    "wasWithinLimit" boolean NOT NULL DEFAULT true,
    "usedGracePeriod" boolean NOT NULL DEFAULT false,
    "deniedDueToLimit" boolean NOT NULL DEFAULT false,
    "platform" text,
    "ipAddress" text,
    "userAgent" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "user_created_idx" ON "tool_usage_logs" USING btree ("userId", "createdAt");
CREATE INDEX "tool_name_idx" ON "tool_usage_logs" USING btree ("toolName");
CREATE INDEX "conversation_tool_idx" ON "tool_usage_logs" USING btree ("conversationId");
CREATE INDEX "billing_period_idx" ON "tool_usage_logs" USING btree ("userId", "billingPeriodStart", "billingPeriodEnd");
CREATE INDEX "success_idx" ON "tool_usage_logs" USING btree ("success");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "usage_alerts" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "userType" bigint NOT NULL,
    "alertType" bigint NOT NULL,
    "limitType" bigint NOT NULL,
    "thresholdPercentage" bigint NOT NULL,
    "currentUsage" bigint NOT NULL,
    "limitValue" bigint NOT NULL,
    "title" text NOT NULL,
    "message" text NOT NULL,
    "actionRequired" boolean NOT NULL DEFAULT false,
    "actionUrl" text,
    "isRead" boolean NOT NULL DEFAULT false,
    "isDismissed" boolean NOT NULL DEFAULT false,
    "deliveryMethod" text,
    "sentAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "user_type_idx" ON "usage_alerts" USING btree ("userId", "alertType");
CREATE INDEX "read_idx" ON "usage_alerts" USING btree ("isRead");
CREATE INDEX "usage_created_idx" ON "usage_alerts" USING btree ("createdAt");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "billing_cycle_summaries"
    ADD CONSTRAINT "billing_cycle_summaries_fk_0"
    FOREIGN KEY("vendorId")
    REFERENCES "vendor_profiles"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "billing_cycle_summaries"
    ADD CONSTRAINT "billing_cycle_summaries_fk_1"
    FOREIGN KEY("invoiceId")
    REFERENCES "subscription_invoices"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR asami
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('asami', '20251215043444052', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251215043444052', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
