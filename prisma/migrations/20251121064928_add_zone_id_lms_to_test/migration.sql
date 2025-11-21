-- AlterTable
ALTER TABLE "Test" ADD COLUMN     "ZoneIdLMS" TEXT;

-- CreateIndex
CREATE INDEX "Test_ZoneIdLMS_idx" ON "Test"("ZoneIdLMS");
