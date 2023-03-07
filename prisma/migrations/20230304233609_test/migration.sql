/*
  Warnings:

  - The `hair_color` column on the `People` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "People" DROP COLUMN "hair_color",
ADD COLUMN     "hair_color" TEXT[];
