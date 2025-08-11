/*
  Warnings:

  - You are about to drop the column `subscriptionTime` on the `AdminTransaction` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "AdminTransaction" DROP COLUMN "subscriptionTime",
ADD COLUMN     "expiredAt" TIMESTAMPTZ(3),
ADD COLUMN     "startedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "RedeemCode" ADD COLUMN     "startedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;
