/*
  Warnings:

  - You are about to drop the column `content` on the `WebSetting` table. All the data in the column will be lost.
  - You are about to drop the column `title` on the `WebSetting` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "WebSetting" DROP COLUMN "content",
DROP COLUMN "title";
