BEGIN;

--
-- Class Address as table addresses
--
CREATE TABLE "addresses" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "label" text NOT NULL,
    "recipientName" text NOT NULL,
    "phoneNumber" text NOT NULL,
    "addressLine1" text NOT NULL,
    "addressLine2" text,
    "city" text NOT NULL,
    "state" text NOT NULL,
    "country" text NOT NULL,
    "postalCode" text NOT NULL,
    "landmark" text,
    "isDefault" boolean NOT NULL DEFAULT false,
    "isActive" boolean NOT NULL DEFAULT true,
    "latitude" double precision,
    "longitude" double precision,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "user_default_idx" ON "addresses" USING btree ("userId", "isDefault");
CREATE INDEX "user_active_idx" ON "addresses" USING btree ("userId", "isActive");

--
-- Class AIConversationUsage as table ai_conversation_usage
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
-- Class AuthSession as table auth_sessions
--
CREATE TABLE "auth_sessions" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "platform" text NOT NULL,
    "platformUserId" text NOT NULL,
    "isActive" boolean NOT NULL DEFAULT true,
    "loginAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "logoutAt" timestamp without time zone,
    "expiresAt" timestamp without time zone,
    "deviceInfo" text,
    "ipAddress" text,
    "userAgent" text,
    "lastActivityAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "user_platform_idxx" ON "auth_sessions" USING btree ("userId", "platform", "isActive");
CREATE INDEX "platform_user_idxx" ON "auth_sessions" USING btree ("platform", "platformUserId");
CREATE INDEX "active_sessions_idx" ON "auth_sessions" USING btree ("isActive", "lastActivityAt");

--
-- Class BillingCycleSummary as table billing_cycle_summaries
--
CREATE TABLE "billing_cycle_summaries" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "vendorId" uuid NOT NULL,
    "periodStart" timestamp without time zone NOT NULL,
    "periodEnd" timestamp without time zone NOT NULL,
    "billingCycle" text NOT NULL,
    "subscriptionTier" text NOT NULL,
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
-- Class BotInteraction as table bot_interactions
--
CREATE TABLE "bot_interactions" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "conversationId" uuid NOT NULL,
    "userId" uuid NOT NULL,
    "messageId" uuid,
    "intent" text NOT NULL,
    "confidence" double precision NOT NULL,
    "entities" text,
    "userQuery" text,
    "botResponse" text,
    "functionName" text,
    "functionInput" text,
    "functionOutput" text,
    "executionTime" bigint,
    "isSuccess" boolean NOT NULL DEFAULT true,
    "errorMessage" text,
    "wasHelpful" boolean,
    "userFeedback" text,
    "feedbackAt" timestamp without time zone,
    "modelUsed" text,
    "promptTokens" bigint,
    "completionTokens" bigint,
    "totalTokens" bigint,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "conversation_idx" ON "bot_interactions" USING btree ("conversationId");
CREATE INDEX "intent_idx" ON "bot_interactions" USING btree ("intent");
CREATE INDEX "user_idx" ON "bot_interactions" USING btree ("userId");
CREATE INDEX "created_idx" ON "bot_interactions" USING btree ("createdAt");

--
-- Class CartItem as table cart_items
--
CREATE TABLE "cart_items" (
    "id" bigserial PRIMARY KEY,
    "cartId" uuid NOT NULL,
    "productId" uuid NOT NULL,
    "variantId" uuid,
    "quantity" bigint NOT NULL DEFAULT 1,
    "unitPrice" double precision NOT NULL,
    "subtotal" double precision NOT NULL,
    "customerNotes" text,
    "addedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "cart_product_idx" ON "cart_items" USING btree ("cartId", "productId");
CREATE INDEX "cart_idx" ON "cart_items" USING btree ("cartId");

--
-- Class Cart as table carts
--
CREATE TABLE "carts" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "customerId" uuid NOT NULL,
    "sessionId" text,
    "isActive" boolean NOT NULL DEFAULT true,
    "itemCount" bigint NOT NULL DEFAULT 0,
    "subtotal" double precision NOT NULL DEFAULT 0.0,
    "convertedToOrderId" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiresAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "customer_active_idx" ON "carts" USING btree ("customerId", "isActive");
CREATE INDEX "session_idx" ON "carts" USING btree ("sessionId");

--
-- Class Category as table categories
--
CREATE TABLE "categories" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "name" text NOT NULL,
    "slug" text NOT NULL,
    "description" text,
    "parentCategoryId" uuid,
    "iconUrl" text,
    "imageUrl" text,
    "displayOrder" bigint NOT NULL DEFAULT 0,
    "isActive" boolean NOT NULL DEFAULT true,
    "productCount" bigint NOT NULL DEFAULT 0,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "slug_idx" ON "categories" USING btree ("slug");
CREATE INDEX "parent_idx" ON "categories" USING btree ("parentCategoryId");
CREATE INDEX "active_order_idx" ON "categories" USING btree ("isActive", "displayOrder");

--
-- Class CategoryMapping as table category_mappings
--
CREATE TABLE "category_mappings" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "simpleCategoryId" uuid NOT NULL,
    "productNamePattern" text,
    "productDescriptionPattern" text,
    "facebookCategoryId" bigint NOT NULL,
    "facebookCategoryName" text NOT NULL,
    "googleTaxonomyId" bigint NOT NULL,
    "googleTaxonomyPath" text NOT NULL,
    "confidence" double precision NOT NULL DEFAULT 1.0,
    "matchCount" bigint NOT NULL DEFAULT 0,
    "lastUsedAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "simple_category_idx" ON "category_mappings" USING btree ("simpleCategoryId");
CREATE INDEX "facebook_cat_idx" ON "category_mappings" USING btree ("facebookCategoryId");

--
-- Class Conversation as table conversations
--
CREATE TABLE "conversations" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid,
    "platform" text NOT NULL,
    "platformUserId" text NOT NULL,
    "platformUsername" text,
    "userType" text NOT NULL,
    "status" text NOT NULL DEFAULT 'active'::text,
    "sessionData" text,
    "contextData" text,
    "activeCartId" text,
    "currentProductId" text,
    "currentVendorId" text,
    "lastIntent" text,
    "lastEntities" text,
    "agentState" text,
    "conversationSummary" text,
    "isEscalated" boolean NOT NULL DEFAULT false,
    "escalatedTo" text,
    "escalatedAt" timestamp without time zone,
    "escalationReason" text,
    "messageCount" bigint NOT NULL DEFAULT 0,
    "botResponseCount" bigint NOT NULL DEFAULT 0,
    "averageResponseTime" double precision,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastMessageAt" timestamp without time zone,
    "resolvedAt" timestamp without time zone,
    "archivedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "user_platform_idx" ON "conversations" USING btree ("userId", "platform");
CREATE INDEX "platform_user_idx" ON "conversations" USING btree ("platform", "platformUserId");
CREATE INDEX "conversation_status_idx" ON "conversations" USING btree ("status");
CREATE INDEX "escalated_idx" ON "conversations" USING btree ("isEscalated");

--
-- Class CustomerAIPolicy as table customer_ai_policies
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
-- Class CustomerProfile as table customer_profiles
--
CREATE TABLE "customer_profiles" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "preferredPaymentMethod" text,
    "savedAddresses" json,
    "favoriteVendors" json,
    "totalOrders" bigint NOT NULL DEFAULT 0,
    "totalSpent" double precision NOT NULL DEFAULT 0.0,
    "averageOrderValue" double precision NOT NULL DEFAULT 0.0,
    "lastOrderAt" timestamp without time zone,
    "wishlistCount" bigint NOT NULL DEFAULT 0,
    "reviewsGiven" bigint NOT NULL DEFAULT 0,
    "averageRating" double precision DEFAULT 0.0,
    "searchHistory" json,
    "viewedProducts" json,
    "preferredCategories" json,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Class CustomerUsagePattern as table customer_usage_patterns
--
CREATE TABLE "customer_usage_patterns" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "averageDailyMessages" double precision NOT NULL DEFAULT 0.0,
    "averageDailyToolCalls" double precision NOT NULL DEFAULT 0.0,
    "peakUsageHour" bigint,
    "usageClass" text NOT NULL,
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
-- Class DailyUsageTracker as table daily_usage_trackers
--
CREATE TABLE "daily_usage_trackers" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "userType" text NOT NULL,
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
    "subscriptionTier" text,
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
-- Class LimitBreachLog as table limit_breach_logs
--
CREATE TABLE "limit_breach_logs" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "userType" text NOT NULL,
    "limitType" text NOT NULL,
    "attemptedAction" text NOT NULL,
    "currentUsage" bigint NOT NULL,
    "limitValue" bigint NOT NULL,
    "subscriptionTier" text,
    "conversationId" uuid,
    "actionTaken" text NOT NULL,
    "userNotified" boolean NOT NULL DEFAULT false,
    "severity" text NOT NULL,
    "breachedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "user_breach_idx" ON "limit_breach_logs" USING btree ("userId", "breachedAt");
CREATE INDEX "limit_type_idx" ON "limit_breach_logs" USING btree ("limitType");
CREATE INDEX "severity_idx" ON "limit_breach_logs" USING btree ("severity");

--
-- Class Message as table messages
--
CREATE TABLE "messages" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "conversationId" uuid NOT NULL,
    "platform" text NOT NULL,
    "platformMessageId" text,
    "messageType" text NOT NULL,
    "content" text NOT NULL,
    "mediaUrl" text,
    "mediaType" text,
    "thumbnailUrl" text,
    "isFromBot" boolean NOT NULL DEFAULT false,
    "isFromUser" boolean NOT NULL DEFAULT true,
    "senderId" uuid,
    "isProcessedByAi" boolean NOT NULL DEFAULT false,
    "aiIntent" text,
    "aiEntities" text,
    "aiConfidence" double precision,
    "aiResponse" text,
    "processingTime" bigint,
    "functionCalled" text,
    "functionParams" text,
    "functionResult" text,
    "isDelivered" boolean NOT NULL DEFAULT false,
    "isRead" boolean NOT NULL DEFAULT false,
    "isFailed" boolean NOT NULL DEFAULT false,
    "errorMessage" text,
    "replyToMessageId" uuid,
    "metadata" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deliveredAt" timestamp without time zone,
    "readAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "conversation_created_idx" ON "messages" USING btree ("conversationId", "createdAt");
CREATE INDEX "platform_message_idx" ON "messages" USING btree ("platform", "platformMessageId");
CREATE INDEX "ai_processed_idx" ON "messages" USING btree ("isProcessedByAi");

--
-- Class Notification as table notifications
--
CREATE TABLE "notifications" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "title" text NOT NULL,
    "message" text NOT NULL,
    "type" text NOT NULL,
    "platform" text,
    "actionUrl" text,
    "actionData" text,
    "isSent" boolean NOT NULL DEFAULT false,
    "isDelivered" boolean NOT NULL DEFAULT false,
    "isRead" boolean NOT NULL DEFAULT false,
    "isFailed" boolean NOT NULL DEFAULT false,
    "errorMessage" text,
    "priority" bigint NOT NULL DEFAULT 0,
    "scheduledFor" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "sentAt" timestamp without time zone,
    "deliveredAt" timestamp without time zone,
    "readAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "user_read_idx" ON "notifications" USING btree ("userId", "isRead");
CREATE INDEX "type_idx" ON "notifications" USING btree ("type");
CREATE INDEX "scheduled_idx" ON "notifications" USING btree ("scheduledFor", "isSent");

--
-- Class OrderItem as table order_items
--
CREATE TABLE "order_items" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "orderId" uuid NOT NULL,
    "productId" uuid NOT NULL,
    "variantId" uuid,
    "productName" text NOT NULL,
    "productDescription" text,
    "productImageUrl" text,
    "sku" text,
    "variantName" text,
    "color" text,
    "size" text,
    "unitPrice" double precision NOT NULL,
    "discountPrice" double precision,
    "quantity" bigint NOT NULL,
    "subtotal" double precision NOT NULL,
    "taxAmount" double precision NOT NULL DEFAULT 0.0,
    "totalAmount" double precision NOT NULL,
    "status" text NOT NULL DEFAULT 'pending'::text,
    "isFulfilled" boolean NOT NULL DEFAULT false,
    "fulfilledAt" timestamp without time zone,
    "isReturnable" boolean NOT NULL DEFAULT true,
    "returnBy" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "order_idx" ON "order_items" USING btree ("orderId");
CREATE INDEX "product_idx" ON "order_items" USING btree ("productId");

--
-- Class Order as table orders
--
CREATE TABLE "orders" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "customerId" uuid NOT NULL,
    "vendorId" uuid NOT NULL,
    "orderNumber" text NOT NULL,
    "status" text NOT NULL DEFAULT 'pending'::text,
    "subtotal" double precision NOT NULL,
    "taxAmount" double precision NOT NULL DEFAULT 0.0,
    "shippingCost" double precision NOT NULL DEFAULT 0.0,
    "discountAmount" double precision NOT NULL DEFAULT 0.0,
    "platformFee" double precision NOT NULL DEFAULT 0.0,
    "totalAmount" double precision NOT NULL,
    "currency" text NOT NULL DEFAULT 'USD'::text,
    "shippingAddressId" uuid NOT NULL,
    "deliveryInstructions" text,
    "estimatedDeliveryDate" timestamp without time zone,
    "actualDeliveryDate" timestamp without time zone,
    "trackingNumber" text,
    "shippingProvider" text,
    "customerName" text NOT NULL,
    "customerPhone" text NOT NULL,
    "customerEmail" text,
    "paymentMethod" text NOT NULL,
    "paymentStatus" text NOT NULL DEFAULT 'pending'::text,
    "paidAt" timestamp without time zone,
    "customerNotes" text,
    "vendorNotes" text,
    "cancellationReason" text,
    "orderSource" text NOT NULL DEFAULT 'whatsapp'::text,
    "conversationId" uuid,
    "isGift" boolean NOT NULL DEFAULT false,
    "requiresSignature" boolean NOT NULL DEFAULT false,
    "isPriority" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "confirmedAt" timestamp without time zone,
    "shippedAt" timestamp without time zone,
    "deliveredAt" timestamp without time zone,
    "cancelledAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "customer_status_idx" ON "orders" USING btree ("customerId", "status");
CREATE INDEX "vendors_status_idx" ON "orders" USING btree ("vendorId", "status");
CREATE INDEX "order_number_idx" ON "orders" USING btree ("orderNumber");
CREATE INDEX "payments_status_idx" ON "orders" USING btree ("paymentStatus");
CREATE INDEX "created_at_idx" ON "orders" USING btree ("createdAt");

--
-- Class PaymentTransaction as table payment_transactions
--
CREATE TABLE "payment_transactions" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "orderId" uuid NOT NULL,
    "amount" double precision NOT NULL,
    "currency" text NOT NULL DEFAULT 'USD'::text,
    "paymentMethod" text NOT NULL,
    "paymentStatus" text NOT NULL,
    "gatewayName" text NOT NULL,
    "gatewayTransactionId" text,
    "gatewayResponse" text,
    "cryptoType" text,
    "cryptoAmount" double precision,
    "walletAddress" text,
    "transactionHash" text,
    "blockchainNetwork" text,
    "conversionRate" double precision,
    "platformFee" double precision NOT NULL DEFAULT 0.0,
    "gatewayFee" double precision NOT NULL DEFAULT 0.0,
    "isPending" boolean NOT NULL DEFAULT true,
    "isCompleted" boolean NOT NULL DEFAULT false,
    "isFailed" boolean NOT NULL DEFAULT false,
    "metadata" text,
    "failureReason" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completedAt" timestamp without time zone,
    "failedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "the_order_idx" ON "payment_transactions" USING btree ("orderId");
CREATE INDEX "gateway_transaction_idx" ON "payment_transactions" USING btree ("gatewayTransactionId");
CREATE INDEX "transaction_hash_idx" ON "payment_transactions" USING btree ("transactionHash");
CREATE INDEX "payment_status_idx" ON "payment_transactions" USING btree ("paymentStatus");

--
-- Class PlatformAnalytics as table platform_analytics
--
CREATE TABLE "platform_analytics" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "date" timestamp without time zone NOT NULL,
    "period" text NOT NULL,
    "totalUsers" bigint NOT NULL DEFAULT 0,
    "activeUsers" bigint NOT NULL DEFAULT 0,
    "newUsers" bigint NOT NULL DEFAULT 0,
    "totalCustomers" bigint NOT NULL DEFAULT 0,
    "totalVendors" bigint NOT NULL DEFAULT 0,
    "totalOrders" bigint NOT NULL DEFAULT 0,
    "totalRevenue" double precision NOT NULL DEFAULT 0.0,
    "averageOrderValue" double precision NOT NULL DEFAULT 0.0,
    "platformFeesCollected" double precision NOT NULL DEFAULT 0.0,
    "totalProducts" bigint NOT NULL DEFAULT 0,
    "activeProducts" bigint NOT NULL DEFAULT 0,
    "newProducts" bigint NOT NULL DEFAULT 0,
    "totalAiInteractions" bigint NOT NULL DEFAULT 0,
    "successfulAiResponses" bigint NOT NULL DEFAULT 0,
    "aiResponseTime" double precision NOT NULL DEFAULT 0.0,
    "aiCostsIncurred" double precision NOT NULL DEFAULT 0.0,
    "whatsappMessages" bigint NOT NULL DEFAULT 0,
    "telegramMessages" bigint NOT NULL DEFAULT 0,
    "totalConversations" bigint NOT NULL DEFAULT 0,
    "activeConversations" bigint NOT NULL DEFAULT 0,
    "fiatTransactions" bigint NOT NULL DEFAULT 0,
    "cryptoTransactions" bigint NOT NULL DEFAULT 0,
    "fiatVolume" double precision NOT NULL DEFAULT 0.0,
    "cryptoVolume" double precision NOT NULL DEFAULT 0.0,
    "freemiumVendors" bigint NOT NULL DEFAULT 0,
    "proVendors" bigint NOT NULL DEFAULT 0,
    "proMaxVendors" bigint NOT NULL DEFAULT 0,
    "subscriptionRevenue" double precision NOT NULL DEFAULT 0.0,
    "churnRate" double precision NOT NULL DEFAULT 0.0,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "date_period_idx" ON "platform_analytics" USING btree ("date", "period");

--
-- Class ProductAnalytics as table product_analytics
--
CREATE TABLE "product_analytics" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "productId" uuid NOT NULL,
    "vendorId" uuid NOT NULL,
    "date" timestamp without time zone NOT NULL,
    "period" text NOT NULL,
    "views" bigint NOT NULL DEFAULT 0,
    "uniqueViews" bigint NOT NULL DEFAULT 0,
    "wishlistAdds" bigint NOT NULL DEFAULT 0,
    "cartAdds" bigint NOT NULL DEFAULT 0,
    "orderCount" bigint NOT NULL DEFAULT 0,
    "quantitySold" bigint NOT NULL DEFAULT 0,
    "revenue" double precision NOT NULL DEFAULT 0.0,
    "conversionRate" double precision NOT NULL DEFAULT 0.0,
    "bounceRate" double precision NOT NULL DEFAULT 0.0,
    "averageTimeOnPage" double precision NOT NULL DEFAULT 0.0,
    "newReviews" bigint NOT NULL DEFAULT 0,
    "averageRating" double precision NOT NULL DEFAULT 0.0,
    "searchImpressions" bigint NOT NULL DEFAULT 0,
    "searchClicks" bigint NOT NULL DEFAULT 0,
    "searchRanking" double precision NOT NULL DEFAULT 0.0,
    "stockLevelStart" bigint NOT NULL DEFAULT 0,
    "stockLevelEnd" bigint NOT NULL DEFAULT 0,
    "stockOuts" bigint NOT NULL DEFAULT 0,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "product_date_idx" ON "product_analytics" USING btree ("productId", "date");
CREATE INDEX "vendors_date_idx" ON "product_analytics" USING btree ("vendorId", "date");
CREATE INDEX "date_periodic_idx" ON "product_analytics" USING btree ("date", "period");

--
-- Class ProductCategory as table product_categories
--
CREATE TABLE "product_categories" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "name" text NOT NULL,
    "slug" text NOT NULL,
    "description" text,
    "icon" text,
    "parentId" uuid,
    "level" bigint NOT NULL DEFAULT 0,
    "facebookCategoryId" bigint,
    "facebookCategoryName" text,
    "googleTaxonomyId" bigint,
    "googleTaxonomyPath" text,
    "displayOrder" bigint NOT NULL DEFAULT 0,
    "isActive" boolean NOT NULL DEFAULT true,
    "isFeatured" boolean NOT NULL DEFAULT false,
    "productCount" bigint NOT NULL DEFAULT 0,
    "keywords" json,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "name_idx" ON "product_categories" USING btree ("name");
CREATE INDEX "slug_cat_idx" ON "product_categories" USING btree ("slug");
CREATE INDEX "parent_cat_idx" ON "product_categories" USING btree ("parentId");
CREATE INDEX "facebook_idx" ON "product_categories" USING btree ("facebookCategoryId");
CREATE INDEX "google_idx" ON "product_categories" USING btree ("googleTaxonomyId");
CREATE INDEX "active_cat_order_idx" ON "product_categories" USING btree ("isActive", "displayOrder");

--
-- Class ProductReview as table product_reviews
--
CREATE TABLE "product_reviews" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "productId" uuid NOT NULL,
    "customerId" uuid NOT NULL,
    "orderId" uuid,
    "rating" bigint NOT NULL,
    "title" text,
    "comment" text NOT NULL,
    "images" json,
    "isVerifiedPurchase" boolean NOT NULL DEFAULT false,
    "isApproved" boolean NOT NULL DEFAULT false,
    "isFlagged" boolean NOT NULL DEFAULT false,
    "moderatedBy" text,
    "moderatedAt" timestamp without time zone,
    "helpfulCount" bigint NOT NULL DEFAULT 0,
    "reportCount" bigint NOT NULL DEFAULT 0,
    "vendorResponse" text,
    "vendorRespondedAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "product_approved_idx" ON "product_reviews" USING btree ("productId", "isApproved");
CREATE INDEX "customer_idx" ON "product_reviews" USING btree ("customerId");
CREATE INDEX "rating_idx" ON "product_reviews" USING btree ("rating");

--
-- Class ProductVariant as table product_variants
--
CREATE TABLE "product_variants" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "productId" uuid NOT NULL,
    "name" text NOT NULL,
    "sku" text,
    "barcode" text,
    "color" text,
    "size" text,
    "material" text,
    "style" text,
    "customAttributes" text,
    "price" double precision NOT NULL,
    "discountPrice" double precision,
    "quantity" bigint NOT NULL DEFAULT 0,
    "imageUrl" text,
    "images" json,
    "isActive" boolean NOT NULL DEFAULT true,
    "isDefault" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "product_active_idx" ON "product_variants" USING btree ("productId", "isActive");
CREATE INDEX "sku_idx" ON "product_variants" USING btree ("sku");

--
-- Class ProductView as table product_views
--
CREATE TABLE "product_views" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "productId" uuid NOT NULL,
    "platform" text NOT NULL,
    "source" text,
    "viewDurationSeconds" bigint,
    "addedToCart" boolean NOT NULL DEFAULT false,
    "purchased" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "user_product_idx" ON "product_views" USING btree ("userId", "productId");
CREATE INDEX "product_date_idxx" ON "product_views" USING btree ("productId", "createdAt");
CREATE INDEX "user_recent_idx" ON "product_views" USING btree ("userId", "createdAt");

--
-- Class Product as table products
--
CREATE TABLE "products" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "vendorId" uuid NOT NULL,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "shortDescription" text,
    "category" text NOT NULL,
    "subCategory" text,
    "tags" json,
    "facebookCategory" text,
    "facebookCategoryId" text,
    "googleCategory" text,
    "googleCategoryId" text,
    "basePrice" double precision NOT NULL,
    "discountPrice" double precision,
    "discountPercentage" double precision,
    "discountStartDate" timestamp without time zone,
    "discountEndDate" timestamp without time zone,
    "currency" text NOT NULL DEFAULT 'NGN'::text,
    "sku" text,
    "barcode" text,
    "quantity" bigint NOT NULL DEFAULT 1,
    "lowStockThreshold" bigint NOT NULL DEFAULT 5,
    "trackInventory" boolean NOT NULL DEFAULT true,
    "status" text NOT NULL DEFAULT 'draft'::text,
    "isActive" boolean NOT NULL DEFAULT true,
    "isFeatured" boolean NOT NULL DEFAULT false,
    "condition" text NOT NULL DEFAULT 'newItem'::text,
    "weight" double precision,
    "weightUnit" text DEFAULT 'kg'::text,
    "dimensions" text,
    "color" json,
    "size" json,
    "material" text,
    "brand" text,
    "images" json NOT NULL,
    "thumbnailUrl" text,
    "videoUrl" text,
    "videoThumbnailUrl" text,
    "whatsappMediaIds" json,
    "telegramFileIds" json,
    "cdnUploadStatus" text NOT NULL DEFAULT 'pending'::text,
    "cdnUploadedAt" timestamp without time zone,
    "originalMediaUrls" json,
    "metaCatalogId" text,
    "metaProductId" text,
    "metaRetailerId" text,
    "metaSyncStatus" text NOT NULL DEFAULT 'pending'::text,
    "metaSyncedAt" timestamp without time zone,
    "metaSyncError" text,
    "metaSyncAttempts" bigint NOT NULL DEFAULT 0,
    "productUrl" text,
    "isAiGenerated" boolean NOT NULL DEFAULT false,
    "aiGeneratedAt" timestamp without time zone,
    "aiConfidenceScore" double precision,
    "hasAiGeneratedImages" boolean NOT NULL DEFAULT false,
    "shippingRequired" boolean NOT NULL DEFAULT true,
    "estimatedDeliveryDays" bigint,
    "freeShipping" boolean NOT NULL DEFAULT false,
    "shippingCost" double precision NOT NULL DEFAULT 0.0,
    "viewCount" bigint NOT NULL DEFAULT 0,
    "orderCount" bigint NOT NULL DEFAULT 0,
    "wishlistCount" bigint NOT NULL DEFAULT 0,
    "averageRating" double precision NOT NULL DEFAULT 0.0,
    "totalReviews" bigint NOT NULL DEFAULT 0,
    "conversionRate" double precision NOT NULL DEFAULT 0.0,
    "searchKeywords" json,
    "metaTitle" text,
    "metaDescription" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "publishedAt" timestamp without time zone,
    "deletedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "vendor_status_idx" ON "products" USING btree ("vendorId", "status");
CREATE INDEX "prod_category_idx" ON "products" USING btree ("category", "subCategory");
CREATE INDEX "price_idx" ON "products" USING btree ("basePrice");
CREATE INDEX "featured_idx" ON "products" USING btree ("isFeatured", "isActive");
CREATE INDEX "search_idx" ON "products" USING btree ("name", "category");
CREATE INDEX "meta_sync_idx" ON "products" USING btree ("metaSyncStatus");
CREATE INDEX "cdn_upload_idx" ON "products" USING btree ("cdnUploadStatus");
CREATE INDEX "meta_retailer_idx" ON "products" USING btree ("metaRetailerId");
CREATE INDEX "quantity_idx" ON "products" USING btree ("quantity");

--
-- Class QuickReply as table quick_replies
--
CREATE TABLE "quick_replies" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "intent" text NOT NULL,
    "userType" text NOT NULL,
    "platform" text NOT NULL,
    "title" text NOT NULL,
    "payload" text NOT NULL,
    "description" text,
    "iconUrl" text,
    "displayOrder" bigint NOT NULL DEFAULT 0,
    "isActive" boolean NOT NULL DEFAULT true,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "intent_type_idx" ON "quick_replies" USING btree ("intent", "userType");
CREATE INDEX "platform_active_idx" ON "quick_replies" USING btree ("platform", "isActive");

--
-- Class Refund as table refunds
--
CREATE TABLE "refunds" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "orderId" uuid NOT NULL,
    "orderItemId" uuid,
    "amount" double precision NOT NULL,
    "currency" text NOT NULL DEFAULT 'USD'::text,
    "reason" text NOT NULL,
    "customerComment" text,
    "status" text NOT NULL DEFAULT 'requested'::text,
    "isApproved" boolean NOT NULL DEFAULT false,
    "approvedBy" text,
    "approvedAt" timestamp without time zone,
    "refundMethod" text NOT NULL,
    "refundTransactionId" text,
    "processedAt" timestamp without time zone,
    "vendorComment" text,
    "rejectionReason" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "orders_idx" ON "refunds" USING btree ("orderId");
CREATE INDEX "status_idx" ON "refunds" USING btree ("status");

--
-- Class SubscriptionEvent as table subscription_events
--
CREATE TABLE "subscription_events" (
    "id" bigserial PRIMARY KEY,
    "eventId" uuid NOT NULL,
    "subscriptionId" uuid NOT NULL,
    "vendorId" uuid NOT NULL,
    "eventType" text NOT NULL,
    "eventData" text,
    "createdAt" timestamp without time zone NOT NULL,
    "tier" text,
    "previousTier" text
);

--
-- Class SubscriptionInvoice as table subscription_invoices
--
CREATE TABLE "subscription_invoices" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "subscriptionId" uuid NOT NULL,
    "vendorId" uuid NOT NULL,
    "invoiceNumber" text NOT NULL,
    "amount" double precision NOT NULL,
    "currency" text NOT NULL DEFAULT 'USD'::text,
    "subscriptionAmount" double precision NOT NULL DEFAULT 0.0,
    "usageCharges" double precision NOT NULL DEFAULT 0.0,
    "taxAmount" double precision NOT NULL DEFAULT 0.0,
    "discountAmount" double precision NOT NULL DEFAULT 0.0,
    "status" text NOT NULL DEFAULT 'pending'::text,
    "isPaid" boolean NOT NULL DEFAULT false,
    "paymentMethod" text,
    "paymentTransactionId" text,
    "paidAt" timestamp without time zone,
    "periodStart" timestamp without time zone NOT NULL,
    "periodEnd" timestamp without time zone NOT NULL,
    "dueDate" timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "subscription_idx" ON "subscription_invoices" USING btree ("subscriptionId");
CREATE INDEX "the_vendor_status_idx" ON "subscription_invoices" USING btree ("vendorId", "status");
CREATE INDEX "invoice_number_idx" ON "subscription_invoices" USING btree ("invoiceNumber");
CREATE INDEX "due_date_idx" ON "subscription_invoices" USING btree ("dueDate");

--
-- Class Subscription as table subscriptions
--
CREATE TABLE "subscriptions" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "vendorId" uuid NOT NULL,
    "tier" text NOT NULL,
    "status" text NOT NULL DEFAULT 'active'::text,
    "billingCycle" text NOT NULL DEFAULT 'monthly'::text,
    "amount" double precision NOT NULL,
    "currency" text NOT NULL DEFAULT 'USD'::text,
    "currentPeriodStart" timestamp without time zone NOT NULL,
    "currentPeriodEnd" timestamp without time zone NOT NULL,
    "productLimit" bigint NOT NULL,
    "aiDescriptionsLimit" bigint NOT NULL,
    "platformTransactionFee" double precision NOT NULL,
    "autoRenew" boolean NOT NULL DEFAULT true,
    "cancelAtPeriodEnd" boolean NOT NULL DEFAULT false,
    "isTrialing" boolean NOT NULL DEFAULT false,
    "trialStart" timestamp without time zone,
    "trialEnd" timestamp without time zone,
    "cancelledAt" timestamp without time zone,
    "cancellationReason" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "vendor_statuses_idx" ON "subscriptions" USING btree ("vendorId", "status");
CREATE INDEX "tier_idx" ON "subscriptions" USING btree ("tier");
CREATE INDEX "period_end_idx" ON "subscriptions" USING btree ("currentPeriodEnd");

--
-- Class TemplateMessage as table template_messages
--
CREATE TABLE "template_messages" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "name" text NOT NULL,
    "category" text NOT NULL,
    "language" text NOT NULL DEFAULT 'en'::text,
    "header" text,
    "body" text NOT NULL,
    "footer" text,
    "variables" json,
    "sampleValues" text,
    "platform" text NOT NULL,
    "platformTemplateId" text,
    "isApproved" boolean NOT NULL DEFAULT false,
    "isActive" boolean NOT NULL DEFAULT true,
    "usageCount" bigint NOT NULL DEFAULT 0,
    "lastUsedAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "name_platform_idx" ON "template_messages" USING btree ("name", "platform");
CREATE INDEX "temp_category_idx" ON "template_messages" USING btree ("category");
CREATE INDEX "approved_active_idx" ON "template_messages" USING btree ("isApproved", "isActive");

--
-- Class TierFeature as table tier_features
--
CREATE TABLE "tier_features" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "tier" text NOT NULL,
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
-- Class ToolUsageLimit as table tool_usage_limits
--
CREATE TABLE "tool_usage_limits" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "tier" text NOT NULL,
    "limitType" text NOT NULL,
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
-- Class ToolUsageLog as table tool_usage_logs
--
CREATE TABLE "tool_usage_logs" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "userType" text NOT NULL,
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
-- Class UsageAlert as table usage_alerts
--
CREATE TABLE "usage_alerts" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "userType" text NOT NULL,
    "alertType" text NOT NULL,
    "limitType" text NOT NULL,
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
-- Class UsageRecord as table usage_records
--
CREATE TABLE "usage_records" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "vendorId" uuid NOT NULL,
    "subscriptionId" text,
    "usageType" text NOT NULL,
    "quantity" bigint NOT NULL DEFAULT 1,
    "unitPrice" double precision NOT NULL,
    "totalAmount" double precision NOT NULL,
    "currency" text NOT NULL DEFAULT 'USD'::text,
    "resourceId" text,
    "metadata" text,
    "billingPeriodStart" timestamp without time zone NOT NULL,
    "billingPeriodEnd" timestamp without time zone NOT NULL,
    "invoiceId" uuid,
    "isBilled" boolean NOT NULL DEFAULT false,
    "billedAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "vendors_period_idx" ON "usage_records" USING btree ("vendorId", "billingPeriodStart", "billingPeriodEnd");
CREATE INDEX "usage_type_idx" ON "usage_records" USING btree ("usageType");
CREATE INDEX "invoice_idx" ON "usage_records" USING btree ("invoiceId");
CREATE INDEX "billed_idx" ON "usage_records" USING btree ("isBilled");

--
-- Class UserActivity as table user_activity
--
CREATE TABLE "user_activity" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "activityType" text NOT NULL,
    "productId" uuid,
    "vendorId" uuid,
    "categoryName" text,
    "searchQuery" text,
    "platform" text NOT NULL,
    "conversationId" uuid,
    "latitude" double precision,
    "longitude" double precision,
    "city" text,
    "state" text,
    "country" text,
    "sessionId" text,
    "metadata" text,
    "durationSeconds" bigint,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "user_activity_type_idx" ON "user_activity" USING btree ("userId", "activityType");
CREATE INDEX "user_date_idx" ON "user_activity" USING btree ("userId", "createdAt");
CREATE INDEX "location_idx" ON "user_activity" USING btree ("city", "state");
CREATE INDEX "product_activity_idx" ON "user_activity" USING btree ("productId", "activityType");
CREATE INDEX "activity_type_date_idx" ON "user_activity" USING btree ("activityType", "createdAt");

--
-- Class User as table users
--
CREATE TABLE "users" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userType" text NOT NULL,
    "status" text NOT NULL DEFAULT 'active'::text,
    "email" text,
    "phoneNumber" text NOT NULL,
    "countryCode" text NOT NULL,
    "isPhoneVerified" boolean NOT NULL DEFAULT false,
    "whatsappId" text,
    "telegramId" text,
    "firstName" text,
    "lastName" text,
    "profileImageUrl" text,
    "language" text NOT NULL DEFAULT 'en'::text,
    "timezone" text NOT NULL DEFAULT 'UTC'::text,
    "city" text,
    "state" text,
    "country" text,
    "emailVerified" boolean NOT NULL DEFAULT false,
    "emailVerifiedAt" timestamp without time zone,
    "whatsappAuthenticated" boolean NOT NULL DEFAULT false,
    "telegramAuthenticated" boolean NOT NULL DEFAULT false,
    "webAuthenticated" boolean NOT NULL DEFAULT false,
    "lastWhatsappLogin" timestamp without time zone,
    "lastTelegramLogin" timestamp without time zone,
    "lastWebLogin" timestamp without time zone,
    "verificationCode" text,
    "verificationCodeExpiry" timestamp without time zone,
    "verificationAttempts" bigint NOT NULL DEFAULT 0,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastActiveAt" timestamp without time zone,
    "deletedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "user_type_status_idx" ON "users" USING btree ("userType", "status");
CREATE INDEX "phone_idx" ON "users" USING btree ("phoneNumber", "countryCode");
CREATE INDEX "whatsapp_idx" ON "users" USING btree ("whatsappId");
CREATE INDEX "telegram_idx" ON "users" USING btree ("telegramId");
CREATE INDEX "email_idx" ON "users" USING btree ("email");
CREATE INDEX "whatsapp_auth_idx" ON "users" USING btree ("whatsappId", "whatsappAuthenticated");
CREATE INDEX "telegram_auth_idx" ON "users" USING btree ("telegramId", "telegramAuthenticated");

--
-- Class VendorAnalytics as table vendor_analytics
--
CREATE TABLE "vendor_analytics" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "vendorId" uuid NOT NULL,
    "date" timestamp without time zone NOT NULL,
    "period" text NOT NULL,
    "totalOrders" bigint NOT NULL DEFAULT 0,
    "completedOrders" bigint NOT NULL DEFAULT 0,
    "cancelledOrders" bigint NOT NULL DEFAULT 0,
    "totalRevenue" double precision NOT NULL DEFAULT 0.0,
    "averageOrderValue" double precision NOT NULL DEFAULT 0.0,
    "totalProducts" bigint NOT NULL DEFAULT 0,
    "activeProducts" bigint NOT NULL DEFAULT 0,
    "outOfStockProducts" bigint NOT NULL DEFAULT 0,
    "newProductsAdded" bigint NOT NULL DEFAULT 0,
    "totalCustomers" bigint NOT NULL DEFAULT 0,
    "newCustomers" bigint NOT NULL DEFAULT 0,
    "returningCustomers" bigint NOT NULL DEFAULT 0,
    "productViews" bigint NOT NULL DEFAULT 0,
    "wishlistAdds" bigint NOT NULL DEFAULT 0,
    "cartAdds" bigint NOT NULL DEFAULT 0,
    "conversionRate" double precision NOT NULL DEFAULT 0.0,
    "aiDescriptionsGenerated" bigint NOT NULL DEFAULT 0,
    "aiQueriesProcessed" bigint NOT NULL DEFAULT 0,
    "aiCostsIncurred" double precision NOT NULL DEFAULT 0.0,
    "fiatPayments" double precision NOT NULL DEFAULT 0.0,
    "cryptoPayments" double precision NOT NULL DEFAULT 0.0,
    "platformFeesCollected" double precision NOT NULL DEFAULT 0.0,
    "newReviews" bigint NOT NULL DEFAULT 0,
    "averageRatingPeriod" double precision NOT NULL DEFAULT 0.0,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "vendor_date_idx" ON "vendor_analytics" USING btree ("vendorId", "date");
CREATE INDEX "vendor_period_idx" ON "vendor_analytics" USING btree ("vendorId", "period");
CREATE INDEX "date_idx" ON "vendor_analytics" USING btree ("date");

--
-- Class VendorProfile as table vendor_profiles
--
CREATE TABLE "vendor_profiles" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "userId" uuid NOT NULL,
    "businessName" text NOT NULL,
    "businessDescription" text,
    "businessCategory" text NOT NULL,
    "businessLogoUrl" text,
    "businessBannerUrl" text,
    "businessRegistrationNumber" text,
    "taxId" text,
    "isVerified" boolean NOT NULL DEFAULT false,
    "verifiedAt" timestamp without time zone,
    "subscriptionTier" text NOT NULL DEFAULT 'freemium'::text,
    "subscriptionStartDate" timestamp without time zone,
    "subscriptionEndDate" timestamp without time zone,
    "autoRenew" boolean NOT NULL DEFAULT true,
    "productLimit" bigint NOT NULL DEFAULT 20,
    "currentProductCount" bigint NOT NULL DEFAULT 0,
    "aiDescriptionsLimit" bigint NOT NULL DEFAULT 50,
    "aiDescriptionsUsed" bigint NOT NULL DEFAULT 0,
    "monthlyResetDate" timestamp without time zone,
    "totalProducts" bigint NOT NULL DEFAULT 0,
    "activeProducts" bigint NOT NULL DEFAULT 0,
    "totalOrders" bigint NOT NULL DEFAULT 0,
    "totalRevenue" double precision NOT NULL DEFAULT 0.0,
    "averageRating" double precision NOT NULL DEFAULT 0.0,
    "totalReviews" bigint NOT NULL DEFAULT 0,
    "platformTransactionFee" double precision NOT NULL DEFAULT 0.05,
    "totalPlatformFees" double precision NOT NULL DEFAULT 0.0,
    "pendingPayouts" double precision NOT NULL DEFAULT 0.0,
    "totalPayouts" double precision NOT NULL DEFAULT 0.0,
    "supportEmail" text,
    "supportPhone" text,
    "responseTime" bigint DEFAULT 24,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "business_name_idx" ON "vendor_profiles" USING btree ("businessName");
CREATE INDEX "subscription_tier_idx" ON "vendor_profiles" USING btree ("subscriptionTier");
CREATE INDEX "verified_idx" ON "vendor_profiles" USING btree ("isVerified");

--
-- Class WishlistItem as table wishlist_items
--
CREATE TABLE "wishlist_items" (
    "id" bigserial PRIMARY KEY,
    "wishlistId" uuid NOT NULL,
    "customerId" uuid NOT NULL,
    "productId" uuid NOT NULL,
    "variantId" uuid,
    "notes" text,
    "priority" bigint NOT NULL DEFAULT 0,
    "priceWhenAdded" double precision NOT NULL,
    "notifyOnPriceDrop" boolean NOT NULL DEFAULT false,
    "targetPrice" double precision,
    "addedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "wishlist_product_idx" ON "wishlist_items" USING btree ("wishlistId", "productId");
CREATE INDEX "customer_product_idx" ON "wishlist_items" USING btree ("customerId", "productId");

--
-- Class Wishlist as table wishlists
--
CREATE TABLE "wishlists" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    "customerId" uuid NOT NULL,
    "name" text NOT NULL DEFAULT 'My Wishlist'::text,
    "description" text,
    "isPublic" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Class CloudStorageEntry as table serverpod_cloud_storage
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- Class CloudStorageDirectUploadEntry as table serverpod_cloud_storage_direct_upload
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- Class FutureCallEntry as table serverpod_future_call
--
CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- Class ServerHealthConnectionInfo as table serverpod_health_connection_info
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- Class ServerHealthMetric as table serverpod_health_metric
--
CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- Class LogEntry as table serverpod_log
--
CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId");

--
-- Class MessageLogEntry as table serverpod_message_log
--
CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

--
-- Class MethodInfo as table serverpod_method
--
CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- Class DatabaseMigrationVersion as table serverpod_migrations
--
CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- Class QueryLogEntry as table serverpod_query_log
--
CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId");

--
-- Class ReadWriteTestEntry as table serverpod_readwrite_test
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

--
-- Class RuntimeSettings as table serverpod_runtime_settings
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- Class SessionLogEntry as table serverpod_session_log
--
CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "userId" text,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- Foreign relations for "addresses" table
--
ALTER TABLE ONLY "addresses"
    ADD CONSTRAINT "addresses_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "auth_sessions" table
--
ALTER TABLE ONLY "auth_sessions"
    ADD CONSTRAINT "auth_sessions_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "billing_cycle_summaries" table
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
-- Foreign relations for "bot_interactions" table
--
ALTER TABLE ONLY "bot_interactions"
    ADD CONSTRAINT "bot_interactions_fk_0"
    FOREIGN KEY("conversationId")
    REFERENCES "conversations"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "bot_interactions"
    ADD CONSTRAINT "bot_interactions_fk_1"
    FOREIGN KEY("messageId")
    REFERENCES "messages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "cart_items" table
--
ALTER TABLE ONLY "cart_items"
    ADD CONSTRAINT "cart_items_fk_0"
    FOREIGN KEY("cartId")
    REFERENCES "carts"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "cart_items"
    ADD CONSTRAINT "cart_items_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "cart_items"
    ADD CONSTRAINT "cart_items_fk_2"
    FOREIGN KEY("variantId")
    REFERENCES "product_variants"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "carts" table
--
ALTER TABLE ONLY "carts"
    ADD CONSTRAINT "carts_fk_0"
    FOREIGN KEY("customerId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "categories" table
--
ALTER TABLE ONLY "categories"
    ADD CONSTRAINT "categories_fk_0"
    FOREIGN KEY("parentCategoryId")
    REFERENCES "categories"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "category_mappings" table
--
ALTER TABLE ONLY "category_mappings"
    ADD CONSTRAINT "category_mappings_fk_0"
    FOREIGN KEY("simpleCategoryId")
    REFERENCES "product_categories"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "conversations" table
--
ALTER TABLE ONLY "conversations"
    ADD CONSTRAINT "conversations_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "customer_profiles" table
--
ALTER TABLE ONLY "customer_profiles"
    ADD CONSTRAINT "customer_profiles_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "messages" table
--
ALTER TABLE ONLY "messages"
    ADD CONSTRAINT "messages_fk_0"
    FOREIGN KEY("conversationId")
    REFERENCES "conversations"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "messages"
    ADD CONSTRAINT "messages_fk_1"
    FOREIGN KEY("replyToMessageId")
    REFERENCES "messages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "notifications" table
--
ALTER TABLE ONLY "notifications"
    ADD CONSTRAINT "notifications_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "order_items" table
--
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_0"
    FOREIGN KEY("orderId")
    REFERENCES "orders"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_2"
    FOREIGN KEY("variantId")
    REFERENCES "product_variants"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "orders" table
--
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_0"
    FOREIGN KEY("customerId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_1"
    FOREIGN KEY("vendorId")
    REFERENCES "vendor_profiles"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_2"
    FOREIGN KEY("shippingAddressId")
    REFERENCES "addresses"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "payment_transactions" table
--
ALTER TABLE ONLY "payment_transactions"
    ADD CONSTRAINT "payment_transactions_fk_0"
    FOREIGN KEY("orderId")
    REFERENCES "orders"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "product_analytics" table
--
ALTER TABLE ONLY "product_analytics"
    ADD CONSTRAINT "product_analytics_fk_0"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "product_categories" table
--
ALTER TABLE ONLY "product_categories"
    ADD CONSTRAINT "product_categories_fk_0"
    FOREIGN KEY("parentId")
    REFERENCES "product_categories"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "product_reviews" table
--
ALTER TABLE ONLY "product_reviews"
    ADD CONSTRAINT "product_reviews_fk_0"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "product_reviews"
    ADD CONSTRAINT "product_reviews_fk_1"
    FOREIGN KEY("customerId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "product_variants" table
--
ALTER TABLE ONLY "product_variants"
    ADD CONSTRAINT "product_variants_fk_0"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "product_views" table
--
ALTER TABLE ONLY "product_views"
    ADD CONSTRAINT "product_views_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "product_views"
    ADD CONSTRAINT "product_views_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "products" table
--
ALTER TABLE ONLY "products"
    ADD CONSTRAINT "products_fk_0"
    FOREIGN KEY("vendorId")
    REFERENCES "vendor_profiles"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "refunds" table
--
ALTER TABLE ONLY "refunds"
    ADD CONSTRAINT "refunds_fk_0"
    FOREIGN KEY("orderId")
    REFERENCES "orders"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "refunds"
    ADD CONSTRAINT "refunds_fk_1"
    FOREIGN KEY("orderItemId")
    REFERENCES "order_items"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "subscription_events" table
--
ALTER TABLE ONLY "subscription_events"
    ADD CONSTRAINT "subscription_events_fk_0"
    FOREIGN KEY("subscriptionId")
    REFERENCES "subscriptions"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "subscription_invoices" table
--
ALTER TABLE ONLY "subscription_invoices"
    ADD CONSTRAINT "subscription_invoices_fk_0"
    FOREIGN KEY("subscriptionId")
    REFERENCES "subscriptions"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "subscriptions" table
--
ALTER TABLE ONLY "subscriptions"
    ADD CONSTRAINT "subscriptions_fk_0"
    FOREIGN KEY("vendorId")
    REFERENCES "vendor_profiles"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "usage_records" table
--
ALTER TABLE ONLY "usage_records"
    ADD CONSTRAINT "usage_records_fk_0"
    FOREIGN KEY("vendorId")
    REFERENCES "vendor_profiles"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "usage_records"
    ADD CONSTRAINT "usage_records_fk_1"
    FOREIGN KEY("invoiceId")
    REFERENCES "subscription_invoices"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "user_activity" table
--
ALTER TABLE ONLY "user_activity"
    ADD CONSTRAINT "user_activity_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "user_activity"
    ADD CONSTRAINT "user_activity_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "user_activity"
    ADD CONSTRAINT "user_activity_fk_2"
    FOREIGN KEY("vendorId")
    REFERENCES "vendor_profiles"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "user_activity"
    ADD CONSTRAINT "user_activity_fk_3"
    FOREIGN KEY("conversationId")
    REFERENCES "conversations"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "vendor_analytics" table
--
ALTER TABLE ONLY "vendor_analytics"
    ADD CONSTRAINT "vendor_analytics_fk_0"
    FOREIGN KEY("vendorId")
    REFERENCES "vendor_profiles"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "vendor_profiles" table
--
ALTER TABLE ONLY "vendor_profiles"
    ADD CONSTRAINT "vendor_profiles_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "wishlist_items" table
--
ALTER TABLE ONLY "wishlist_items"
    ADD CONSTRAINT "wishlist_items_fk_0"
    FOREIGN KEY("wishlistId")
    REFERENCES "wishlists"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "wishlist_items"
    ADD CONSTRAINT "wishlist_items_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "wishlists" table
--
ALTER TABLE ONLY "wishlists"
    ADD CONSTRAINT "wishlists_fk_0"
    FOREIGN KEY("customerId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_log" table
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_message_log" table
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_query_log" table
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR asami
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('asami', '20251227112314044', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251227112314044', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();


COMMIT;
