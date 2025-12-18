BEGIN;


--
-- MIGRATION VERSION FOR asami
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('asami', '20251212030957251', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251212030957251', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
