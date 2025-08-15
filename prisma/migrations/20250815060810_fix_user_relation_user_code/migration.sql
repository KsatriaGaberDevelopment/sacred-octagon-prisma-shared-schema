/*
  Warnings:

  - You are about to drop the column `posttest` on the `Zone` table. All the data in the column will be lost.
  - You are about to drop the column `posttestTryCount` on the `Zone` table. All the data in the column will be lost.
  - You are about to drop the column `pretest` on the `Zone` table. All the data in the column will be lost.
  - You are about to drop the column `pretestTryCount` on the `Zone` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "UserTransaction" DROP CONSTRAINT "UserTransaction_userId_fkey";

-- AlterTable
ALTER TABLE "UserTransaction" ALTER COLUMN "userId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Zone" DROP COLUMN "posttest",
DROP COLUMN "posttestTryCount",
DROP COLUMN "pretest",
DROP COLUMN "pretestTryCount";

-- AddForeignKey
ALTER TABLE "UserTransaction" ADD CONSTRAINT "UserTransaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
