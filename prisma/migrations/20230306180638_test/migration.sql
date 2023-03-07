/*
  Warnings:

  - You are about to drop the column `speciesId` on the `People` table. All the data in the column will be lost.
  - You are about to drop the `Species` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "People" DROP CONSTRAINT "People_speciesId_fkey";

-- AlterTable
ALTER TABLE "People" DROP COLUMN "speciesId";

-- DropTable
DROP TABLE "Species";
