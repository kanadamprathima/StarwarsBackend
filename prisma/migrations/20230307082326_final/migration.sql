/*
  Warnings:

  - The primary key for the `People` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `People` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `speciesId` column on the `People` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Species` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Species` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Added the required column `homeworldId` to the `People` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "People" DROP CONSTRAINT "People_speciesId_fkey";

-- AlterTable
ALTER TABLE "People" DROP CONSTRAINT "People_pkey",
ADD COLUMN     "homeworldId" INTEGER NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "speciesId",
ADD COLUMN     "speciesId" INTEGER,
ADD CONSTRAINT "People_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Species" DROP CONSTRAINT "Species_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Species_pkey" PRIMARY KEY ("id");

-- CreateTable
CREATE TABLE "Planet" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "terrain" TEXT,
    "gravity" TEXT,
    "diameter" INTEGER,
    "climate" TEXT,

    CONSTRAINT "Planet_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "People" ADD CONSTRAINT "People_homeworldId_fkey" FOREIGN KEY ("homeworldId") REFERENCES "Planet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "People" ADD CONSTRAINT "People_speciesId_fkey" FOREIGN KEY ("speciesId") REFERENCES "Species"("id") ON DELETE SET NULL ON UPDATE CASCADE;
