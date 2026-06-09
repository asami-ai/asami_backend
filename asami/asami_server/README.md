# Asami Server 🚀

Asami Server is the robust, scalable backend for the Asami ecosystem, built on the **Serverpod** framework. It orchestrates a sophisticated marketplace platform integrated with multi-provider AI, cross-platform messaging (WhatsApp & Telegram), and a full-featured e-commerce engine.

## 🌟 Key Features

### 🤖 AI-Powered Intelligence
- **Multi-Provider Support:** Seamlessly switch between or combine models from **Anthropic (Claude)**, **OpenAI (GPT)**, **Google (Gemini)**, and **xAI (Grok)**.
- **Conversational Bots:** Integrated WhatsApp and Telegram bots for automated customer interaction, support, and sales.
- **AI-Driven UI:** Dynamic UI generation capabilities for personalized user experiences.

### 🛒 E-commerce & Marketplace
- **Product Management:** Support for categories, variants, conditions, and reviews.
- **Ordering System:** Complete flow from cart management to order fulfillment.
- **Wishlist:** Personalized wishlists for buyers.
- **Meta Integration:** Sync with Meta Catalog for social commerce.

### 💳 Payments & Fintech
- **Paystack Integration:** Secure payment processing for transactions and subscriptions.
- **Wallet System:** In-app wallet for users to manage funds.
- **Withdrawals:** Automated and manual withdrawal workflows for vendors.
- **Subscriptions:** Tier-based subscription management with automated billing.

### 📱 Messaging & Notifications
- **WhatsApp Business API:** Direct integration for transactional messages and customer flows.
- **Telegram Bot API:** Rich interactive bot experiences.
- **Push Notifications:** Mobile messaging endpoints for real-time alerts.

### 📊 Analytics & Monitoring
- **Usage Tracking:** Detailed monitoring of API and AI feature usage.
- **Business Analytics:** Real-time insights into sales, user growth, and platform health.
- **Health Checks:** Dedicated endpoints for uptime monitoring.

---

## 🛠️ Tech Stack

- **Framework:** [Serverpod](https://serverpod.dev) (Dart)
- **Language:** Dart 3.5+
- **Database:** PostgreSQL
- **AI Providers:** Claude, GPT-4, Gemini 1.5, Grok
- **Payments:** Paystack
- **Messaging:** Meta Graph API, Telegram Bot API
- **Storage/CDN:** ImageKit.io
- **Infrastructure:** Docker & Docker Compose

---

## 🚀 Getting Started

### Prerequisites

- [Dart SDK](https://dart.dev/get-dart) (version >= 3.5.0)
- [Docker](https://www.docker.com/get-started)
- [Serverpod CLI](https://serverpod.dev/docs/getting-started/installing-the-cli) (`dart pub global activate serverpod_cli`)

### 1. Clone & Setup

```bash
# Clone the repository
git clone <repo-url>
cd asami/asami_server

# Install dependencies
dart pub get
```

### 2. Infrastructure

Start the PostgreSQL database using Docker:

```bash
docker compose up -d
```

### 3. Configuration

Configure your secrets in `config/passwords.yaml` (copy from `config/passwords.yaml.example` if available). Required keys include:

- `whatsappAccessToken` & `whatsappFromNumberId`
- `telegramBotToken`
- `aiProvider` (claude, openai, gemini, or grok)
- AI API Keys (e.g., `claudeApiKey`, `openaiApiKey`)
- `imagekitPrivateKey` & `imagekitPublicKey`

### 4. Database Migrations

Apply the latest database migrations:

```bash
serverpod generate
# Then run the server with --apply-migrations or use the CLI
```

### 5. Running the Server

```bash
# Development mode
dart bin/main.dart

# Production mode
dart bin/main.dart --mode production
```

---

## 🛣️ API & Webhooks

### Key Endpoints
- **Health Check:** `GET /health`
- **WhatsApp Webhook:** `POST /webhooks/whatsapp`
- **Telegram Webhook:** `POST /webhooks/telegram`
- **Paystack Webhook:** `POST /webhooks/paystack`

### Serverpod Insights
Access the Serverpod Insights dashboard (default port 8081) to monitor logs, database queries, and server performance.

---

## 🏗️ Project Structure

- `bin/`: Entry point for the server.
- `config/`: Configuration files for different environments.
- `lib/src/endpoints/`: Implementation of the API endpoints.
- `lib/src/models/`: Database models and protocol definitions (`.spy.yaml`).
- `lib/src/services/`: Core business logic and external integrations (AI, WhatsApp, etc.).
- `migrations/`: Database migration scripts.

---

## 🤝 Contributing

1. Create a feature branch.
2. Ensure `serverpod generate` is run after model changes.
3. Run tests: `dart test`.
4. Submit a Pull Request.

---

## 📄 License

This project is proprietary and confidential. Unauthorized copying of this file, via any medium, is strictly prohibited.
