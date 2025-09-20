/*
  Warnings:

  - You are about to drop the `scientific_names` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "scientific_names";

-- CreateTable
CREATE TABLE "scientific" (
    "id" TEXT NOT NULL,
    "animal_id" TEXT NOT NULL,
    "animal_type" TEXT NOT NULL,
    "common_name" TEXT NOT NULL,
    "cage_number" TEXT NOT NULL,
    "sex" TEXT NOT NULL,
    "reason_for_admission" TEXT NOT NULL,
    "date_of_entry" TIMESTAMP(3) NOT NULL,
    "date_of_discharge" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "scientific_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "scientific_animal_id_key" ON "scientific"("animal_id");
