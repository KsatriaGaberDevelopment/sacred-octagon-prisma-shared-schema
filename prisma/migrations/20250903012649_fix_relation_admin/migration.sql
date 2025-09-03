-- DropForeignKey
ALTER TABLE "AdminTransaction" DROP CONSTRAINT "AdminTransaction_adminId_fkey";

-- DropForeignKey
ALTER TABLE "Banner" DROP CONSTRAINT "Banner_adminId_fkey";

-- DropForeignKey
ALTER TABLE "ImportExport" DROP CONSTRAINT "ImportExport_adminId_fkey";

-- DropForeignKey
ALTER TABLE "RedeemCode" DROP CONSTRAINT "RedeemCode_adminId_fkey";

-- AlterTable
ALTER TABLE "AdminTransaction" ALTER COLUMN "adminId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Banner" ALTER COLUMN "adminId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "RedeemCode" ALTER COLUMN "adminId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Banner" ADD CONSTRAINT "Banner_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdminTransaction" ADD CONSTRAINT "AdminTransaction_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedeemCode" ADD CONSTRAINT "RedeemCode_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImportExport" ADD CONSTRAINT "ImportExport_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE CASCADE ON UPDATE CASCADE;
