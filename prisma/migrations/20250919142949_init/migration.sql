-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "daily_inspections" (
    "id" TEXT NOT NULL,
    "inspection_date" TIMESTAMP(3) NOT NULL,
    "animal_weight" DOUBLE PRECISION NOT NULL,
    "drug_name" TEXT NOT NULL,
    "dosage" TEXT NOT NULL,
    "food_given" TEXT NOT NULL,
    "balance_food_take_out" TEXT NOT NULL,
    "dopping_consistency" TEXT NOT NULL,
    "animal_behavior" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "scientificId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "daily_inspections_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "scientific_names" (
    "id" TEXT NOT NULL,
    "animal_type" TEXT NOT NULL,
    "common_name" TEXT NOT NULL,
    "cage_number" TEXT NOT NULL,
    "sex" TEXT NOT NULL,
    "reason_for_admission" TEXT NOT NULL,
    "date_of_entry" TIMESTAMP(3) NOT NULL,
    "date_of_discharge" TIMESTAMP(3) NOT NULL,
    "laboratoriumId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "scientific_names_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "laboratorium" (
    "id" TEXT NOT NULL,
    "test_type" TEXT NOT NULL,
    "diagnosis" TEXT NOT NULL,
    "attachment_file" TEXT NOT NULL,
    "test_date" TIMESTAMP(3) NOT NULL,
    "description" TEXT NOT NULL,
    "drug_name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "laboratorium_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "daily_inspections_scientificId_key" ON "daily_inspections"("scientificId");

-- CreateIndex
CREATE UNIQUE INDEX "scientific_names_laboratoriumId_key" ON "scientific_names"("laboratoriumId");

-- AddForeignKey
ALTER TABLE "daily_inspections" ADD CONSTRAINT "daily_inspections_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_inspections" ADD CONSTRAINT "daily_inspections_scientificId_fkey" FOREIGN KEY ("scientificId") REFERENCES "scientific_names"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "scientific_names" ADD CONSTRAINT "scientific_names_laboratoriumId_fkey" FOREIGN KEY ("laboratoriumId") REFERENCES "laboratorium"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
