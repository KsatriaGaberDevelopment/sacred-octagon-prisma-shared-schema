-- DropForeignKey
ALTER TABLE "UserLogin" DROP CONSTRAINT "UserLogin_userId_fkey";

-- AddForeignKey
ALTER TABLE "UserLogin" ADD CONSTRAINT "UserLogin_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
