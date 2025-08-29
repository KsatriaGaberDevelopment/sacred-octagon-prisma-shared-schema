-- DropForeignKey
ALTER TABLE "CodeRedeemer" DROP CONSTRAINT "CodeRedeemer_userId_fkey";

-- AddForeignKey
ALTER TABLE "CodeRedeemer" ADD CONSTRAINT "CodeRedeemer_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
