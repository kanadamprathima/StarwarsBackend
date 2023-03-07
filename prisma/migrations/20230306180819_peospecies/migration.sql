/*
  Warnings:

  - You are about to drop the column `homeworldId` on the `People` table. All the data in the column will be lost.
  - You are about to drop the `Planet` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "People" DROP CONSTRAINT "People_homeworldId_fkey";

-- AlterTable
ALTER TABLE "People" DROP COLUMN "homeworldId",
ADD COLUMN     "speciesId" TEXT;

-- DropTable
DROP TABLE "Planet";

-- CreateTable
CREATE TABLE "Species" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "classification" TEXT,
    "language" TEXT,
    "designation" TEXT,

    CONSTRAINT "Species_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "People" ADD CONSTRAINT "People_speciesId_fkey" FOREIGN KEY ("speciesId") REFERENCES "Species"("id") ON DELETE SET NULL ON UPDATE CASCADE;
