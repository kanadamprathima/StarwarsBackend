/*
  Warnings:

  - The primary key for the `People` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Planet` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Species` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Made the column `speciesId` on table `People` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "People" DROP CONSTRAINT "People_homeworldId_fkey";

-- DropForeignKey
ALTER TABLE "People" DROP CONSTRAINT "People_speciesId_fkey";

-- AlterTable
ALTER TABLE "People" DROP CONSTRAINT "People_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "homeworldId" SET DATA TYPE TEXT,
ALTER COLUMN "speciesId" SET NOT NULL,
ALTER COLUMN "speciesId" SET DATA TYPE TEXT,
ADD CONSTRAINT "People_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "People_id_seq";

-- AlterTable
ALTER TABLE "Planet" DROP CONSTRAINT "Planet_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Planet_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Planet_id_seq";

-- AlterTable
ALTER TABLE "Species" DROP CONSTRAINT "Species_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Species_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Species_id_seq";

-- AddForeignKey
ALTER TABLE "People" ADD CONSTRAINT "People_homeworldId_fkey" FOREIGN KEY ("homeworldId") REFERENCES "Planet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "People" ADD CONSTRAINT "People_speciesId_fkey" FOREIGN KEY ("speciesId") REFERENCES "Species"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
