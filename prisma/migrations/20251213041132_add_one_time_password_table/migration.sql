-- CreateTable
CREATE TABLE "OneTimePassword" (
    "id" TEXT NOT NULL,
    "model" TEXT NOT NULL DEFAULT 'User',
    "modelId" TEXT NOT NULL,
    "code" CHAR(6) NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiresAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "OneTimePassword_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "OneTimePassword_model_modelId_idx" ON "OneTimePassword"("model", "modelId");

-- CreateIndex
CREATE INDEX "OneTimePassword_code_idx" ON "OneTimePassword"("code");
