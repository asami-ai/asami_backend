BEGIN;

--
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
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
-- ACTION ALTER TABLE
--
ALTER TABLE "products" ADD COLUMN "metaRetailerId" text;
ALTER TABLE "products" ADD COLUMN "metaSyncAttempts" bigint NOT NULL DEFAULT 0;
ALTER TABLE "products" ADD COLUMN "productUrl" text;
ALTER TABLE "products" ALTER COLUMN "quantity" SET DEFAULT 1;
ALTER TABLE "products" ALTER COLUMN "weightUnit" SET DEFAULT 'kg'::text;
CREATE INDEX "meta_retailer_idx" ON "products" USING btree ("metaRetailerId");
CREATE INDEX "quantity_idx" ON "products" USING btree ("quantity");
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "category_mappings"
    ADD CONSTRAINT "category_mappings_fk_0"
    FOREIGN KEY("simpleCategoryId")
    REFERENCES "product_categories"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "product_categories"
    ADD CONSTRAINT "product_categories_fk_0"
    FOREIGN KEY("parentId")
    REFERENCES "product_categories"("id")
    ON DELETE NO ACTION
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
