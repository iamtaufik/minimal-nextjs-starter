/*
  Warnings:

  - You are about to drop the column `scientificId` on the `daily_inspections` table. All the data in the column will be lost.
  - You are about to drop the column `laboratoriumId` on the `scientific_names` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[animal_id]` on the table `daily_inspections` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[animal_id]` on the table `laboratorium` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[animal_id]` on the table `scientific_names` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `animal_id` to the `daily_inspections` table without a default value. This is not possible if the table is not empty.
  - Added the required column `animal_id` to the `laboratorium` table without a default value. This is not possible if the table is not empty.
  - Added the required column `animal_id` to the `scientific_names` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "daily_inspections" DROP CONSTRAINT "daily_inspections_scientificId_fkey";

-- DropForeignKey
ALTER TABLE "scientific_names" DROP CONSTRAINT "scientific_names_laboratoriumId_fkey";

-- DropIndex
DROP INDEX "daily_inspections_scientificId_key";

-- DropIndex
DROP INDEX "scientific_names_laboratoriumId_key";

-- AlterTable
ALTER TABLE "daily_inspections" DROP COLUMN "scientificId",
ADD COLUMN     "animal_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "laboratorium" ADD COLUMN     "animal_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "scientific_names" DROP COLUMN "laboratoriumId",
ADD COLUMN     "animal_id" TEXT NOT NULL,
ALTER COLUMN "date_of_discharge" DROP NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "daily_inspections_animal_id_key" ON "daily_inspections"("animal_id");

-- CreateIndex
CREATE UNIQUE INDEX "laboratorium_animal_id_key" ON "laboratorium"("animal_id");

-- CreateIndex
CREATE UNIQUE INDEX "scientific_names_animal_id_key" ON "scientific_names"("animal_id");
