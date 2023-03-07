-- DropForeignKey
ALTER TABLE "People" DROP CONSTRAINT "People_speciesId_fkey";

-- AlterTable
ALTER TABLE "People" ALTER COLUMN "speciesId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "People" ADD CONSTRAINT "People_speciesId_fkey" FOREIGN KEY ("speciesId") REFERENCES "Species"("id") ON DELETE SET NULL ON UPDATE CASCADE;
