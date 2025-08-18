/*
  Warnings:

  - You are about to drop the column `cityId` on the `Admin` table. All the data in the column will be lost.
  - You are about to drop the column `provinceId` on the `Admin` table. All the data in the column will be lost.
  - You are about to drop the column `schoolId` on the `Admin` table. All the data in the column will be lost.
  - You are about to drop the column `subdistrictId` on the `Admin` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[createdById]` on the table `School` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[updatedById]` on the table `School` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Admin" DROP CONSTRAINT "Admin_cityId_fkey";

-- DropForeignKey
ALTER TABLE "Admin" DROP CONSTRAINT "Admin_provinceId_fkey";

-- DropForeignKey
ALTER TABLE "Admin" DROP CONSTRAINT "Admin_schoolId_fkey";

-- DropForeignKey
ALTER TABLE "Admin" DROP CONSTRAINT "Admin_subdistrictId_fkey";

-- AlterTable
ALTER TABLE "Admin" DROP COLUMN "cityId",
DROP COLUMN "provinceId",
DROP COLUMN "schoolId",
DROP COLUMN "subdistrictId";

-- AlterTable
ALTER TABLE "School" ADD COLUMN     "createdById" TEXT,
ADD COLUMN     "updatedById" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "School_createdById_key" ON "School"("createdById");

-- CreateIndex
CREATE UNIQUE INDEX "School_updatedById_key" ON "School"("updatedById");

-- AddForeignKey
ALTER TABLE "School" ADD CONSTRAINT "School_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "Admin"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "School" ADD CONSTRAINT "School_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "Admin"("id") ON DELETE SET NULL ON UPDATE CASCADE;
