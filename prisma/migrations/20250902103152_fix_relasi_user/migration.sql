-- DropForeignKey
ALTER TABLE "MatchHistoryMember" DROP CONSTRAINT "MatchHistoryMember_userId_fkey";

-- DropForeignKey
ALTER TABLE "MatchMember" DROP CONSTRAINT "MatchMember_userId_fkey";

-- AlterTable
ALTER TABLE "MatchHistoryMember" ALTER COLUMN "userId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "MatchMember" ALTER COLUMN "userId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "MatchMember" ADD CONSTRAINT "MatchMember_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MatchHistoryMember" ADD CONSTRAINT "MatchHistoryMember_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
