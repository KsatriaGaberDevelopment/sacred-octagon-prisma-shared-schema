-- CreateTable
CREATE TABLE "Rank" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "totalPoint" INTEGER NOT NULL DEFAULT 0,
    "learningPoint" INTEGER NOT NULL DEFAULT 0,
    "championshipPoint" INTEGER NOT NULL DEFAULT 0,
    "totalRankNational" INTEGER NOT NULL DEFAULT 0,
    "totalRankProvince" INTEGER NOT NULL DEFAULT 0,
    "totalRankCity" INTEGER NOT NULL DEFAULT 0,
    "totalRankSubdistrict" INTEGER NOT NULL DEFAULT 0,
    "totalRankSchool" INTEGER NOT NULL DEFAULT 0,
    "totalRankGrade" INTEGER NOT NULL DEFAULT 0,
    "learningRankNational" INTEGER NOT NULL DEFAULT 0,
    "learningRankProvince" INTEGER NOT NULL DEFAULT 0,
    "learningRankCity" INTEGER NOT NULL DEFAULT 0,
    "learningRankSubdistrict" INTEGER NOT NULL DEFAULT 0,
    "learningRankSchool" INTEGER NOT NULL DEFAULT 0,
    "learningRankGrade" INTEGER NOT NULL DEFAULT 0,
    "championshipRankNational" INTEGER NOT NULL DEFAULT 0,
    "championshipRankProvince" INTEGER NOT NULL DEFAULT 0,
    "championshipRankCity" INTEGER NOT NULL DEFAULT 0,
    "championshipRankSubdistrict" INTEGER NOT NULL DEFAULT 0,
    "championshipRankSchool" INTEGER NOT NULL DEFAULT 0,
    "championshipRankGrade" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "Rank_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Rank_userId_key" ON "Rank"("userId");

-- AddForeignKey
ALTER TABLE "Rank" ADD CONSTRAINT "Rank_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
