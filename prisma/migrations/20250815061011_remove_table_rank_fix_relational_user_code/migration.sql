/*
  Warnings:

  - You are about to drop the `Rank` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Rank" DROP CONSTRAINT "Rank_userId_fkey";

-- DropForeignKey
ALTER TABLE "UserRedeemCode" DROP CONSTRAINT "UserRedeemCode_userId_fkey";

-- AlterTable
ALTER TABLE "UserRedeemCode" ALTER COLUMN "userId" DROP NOT NULL;

-- DropTable
DROP TABLE "Rank";

-- AddForeignKey
ALTER TABLE "UserRedeemCode" ADD CONSTRAINT "UserRedeemCode_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
