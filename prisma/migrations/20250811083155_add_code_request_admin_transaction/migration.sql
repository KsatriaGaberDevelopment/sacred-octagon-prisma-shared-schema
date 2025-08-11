-- AlterTable
ALTER TABLE "AdminTransaction" ADD COLUMN     "codeRequest" CHAR(32),
ADD COLUMN     "subscriptionTime" INTEGER NOT NULL DEFAULT 1;
