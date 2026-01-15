BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "webhook_events" DROP CONSTRAINT "webhook_events_fk_0";
ALTER TABLE "webhook_events" DROP COLUMN "transactionReference";
ALTER TABLE "webhook_events" ADD COLUMN "paymentTransactionId" uuid;
ALTER TABLE "webhook_events" ADD COLUMN "transactionReference" text;
CREATE INDEX "webhook_transaction_id_idx" ON "webhook_events" USING btree ("paymentTransactionId");
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "webhook_events"
    ADD CONSTRAINT "webhook_events_fk_0"
    FOREIGN KEY("paymentTransactionId")
    REFERENCES "payment_transactions"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR asami
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('asami', '20260114153119933', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260114153119933', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();


COMMIT;
