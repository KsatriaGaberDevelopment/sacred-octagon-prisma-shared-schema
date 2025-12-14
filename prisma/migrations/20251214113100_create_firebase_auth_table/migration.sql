-- CreateTable
CREATE TABLE "FirebaseAuth" (
    "id" TEXT NOT NULL,
    "model" TEXT NOT NULL DEFAULT 'User',
    "modelId" TEXT NOT NULL,
    "firebaseUid" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "FirebaseAuth_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "FirebaseAuth_firebaseUid_key" ON "FirebaseAuth"("firebaseUid");

-- CreateIndex
CREATE INDEX "FirebaseAuth_firebaseUid_idx" ON "FirebaseAuth"("firebaseUid");

-- CreateIndex
CREATE INDEX "FirebaseAuth_model_modelId_idx" ON "FirebaseAuth"("model", "modelId");
