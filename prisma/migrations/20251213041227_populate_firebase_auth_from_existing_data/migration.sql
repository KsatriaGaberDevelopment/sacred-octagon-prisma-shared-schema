-- Insert data from User table
INSERT INTO "FirebaseAuth" ("id", "model", "modelId", "firebaseUid", "createdAt", "updatedAt")
SELECT
    gen_random_uuid()::text,
    'User',
    "id",
    "authId",
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
FROM "User"
WHERE "authId" IS NOT NULL
ON CONFLICT ("firebaseUid") DO NOTHING;

-- Insert data from Admin table
INSERT INTO "FirebaseAuth" ("id", "model", "modelId", "firebaseUid", "createdAt", "updatedAt")
SELECT
    gen_random_uuid()::text,
    'Admin',
    "id",
    "authId",
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
FROM "Admin"
WHERE "authId" IS NOT NULL
ON CONFLICT ("firebaseUid") DO NOTHING;
