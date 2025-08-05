-- CreateEnum
CREATE TYPE "Role" AS ENUM ('Developer', 'SuperAdmin', 'Admin', 'SchoolAdmin', 'Teacher', 'User');

-- CreateEnum
CREATE TYPE "AccountType" AS ENUM ('LMS', 'Self');

-- CreateEnum
CREATE TYPE "ImportExportType" AS ENUM ('Import', 'Export');

-- CreateEnum
CREATE TYPE "ImportExportProgress" AS ENUM ('Waiting', 'Progress', 'Success', 'Fail');

-- CreateEnum
CREATE TYPE "VoucherType" AS ENUM ('Discount', 'FixedPrice');

-- CreateEnum
CREATE TYPE "QuestionType" AS ENUM ('Addition', 'Multiplication', 'Subtraction', 'Division', 'Bakalkubagi');

-- CreateEnum
CREATE TYPE "TestType" AS ENUM ('PreTest', 'PostTest', 'Contest');

-- CreateEnum
CREATE TYPE "Operation" AS ENUM ('None', 'Create', 'Update', 'Delete');

-- CreateEnum
CREATE TYPE "Transaction" AS ENUM ('Pending', 'Cancelled', 'Settlement', 'Deny', 'Expire', 'Failure', 'Refund', 'PartialRefund', 'Authorize');

-- CreateEnum
CREATE TYPE "EducationLevel" AS ENUM ('NONE', 'SD', 'SMP', 'SMA');

-- CreateEnum
CREATE TYPE "TeamType" AS ENUM ('None', 'Blue', 'Red');

-- CreateEnum
CREATE TYPE "MatchMode" AS ENUM ('Solo', 'Team');

-- CreateEnum
CREATE TYPE "MatchStatus" AS ENUM ('None', 'Win', 'Lose', 'Draw');

-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('None', 'Male', 'Female');

-- CreateTable
CREATE TABLE "Province" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL,
    "geoId" TEXT NOT NULL DEFAULT '',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "Province_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "City" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL,
    "geoId" TEXT NOT NULL DEFAULT '',
    "provinceId" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "City_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subdistrict" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL,
    "geoId" TEXT NOT NULL DEFAULT '',
    "provinceId" TEXT NOT NULL,
    "cityId" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "Subdistrict_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "School" (
    "id" TEXT NOT NULL,
    "identity" TEXT NOT NULL,
    "level" "EducationLevel" NOT NULL DEFAULT 'NONE',
    "name" TEXT NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL,
    "cityId" TEXT,
    "provinceId" TEXT,
    "subdistrictId" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "School_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "authId" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" TEXT,
    "gender" "Gender" NOT NULL DEFAULT 'None',
    "role" "Role" NOT NULL DEFAULT 'User',
    "suspend" BOOLEAN NOT NULL DEFAULT false,
    "accountType" "AccountType" NOT NULL DEFAULT 'Self',
    "firstTest" BOOLEAN NOT NULL DEFAULT false,
    "fullname" TEXT NOT NULL DEFAULT '',
    "birthDate" TIMESTAMPTZ(3),
    "grade" INTEGER NOT NULL DEFAULT 0,
    "lastGradeUpdateAt" TIMESTAMPTZ(3),
    "schoolIdentity" TEXT NOT NULL,
    "loginAt" TIMESTAMPTZ(3),
    "logoutAt" TIMESTAMPTZ(3),
    "playTime" INTEGER NOT NULL DEFAULT 0,
    "characterUsed" TEXT NOT NULL DEFAULT '',
    "inventory" INTEGER[] DEFAULT ARRAY[0, 0, 0]::INTEGER[],
    "currentTransaction" TEXT,
    "schoolId" TEXT,
    "cityId" TEXT,
    "provinceId" TEXT,
    "subdistrictId" TEXT,
    "adminId" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "username" TEXT NOT NULL,
    "lastIdZoneUnlocked" TEXT NOT NULL DEFAULT '',
    "lastIdZonePosition" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Zone" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "isComplete" BOOLEAN NOT NULL DEFAULT false,
    "completedAt" TIMESTAMPTZ(3),
    "lastLevelId" TEXT NOT NULL DEFAULT '',
    "lastSubLevelId" TEXT NOT NULL DEFAULT '',
    "lastInnerLevelId" TEXT NOT NULL DEFAULT '',
    "lastLevelUnlock" TEXT NOT NULL DEFAULT '',
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "inGameId" TEXT NOT NULL,
    "posttest" INTEGER NOT NULL DEFAULT 0,
    "posttestTryCount" INTEGER NOT NULL DEFAULT 0,
    "pretest" INTEGER NOT NULL DEFAULT 0,
    "pretestTryCount" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "Zone_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Level" (
    "id" TEXT NOT NULL,
    "isUnlock" BOOLEAN NOT NULL DEFAULT false,
    "unlockedAt" TIMESTAMPTZ(3),
    "isComplete" BOOLEAN NOT NULL DEFAULT false,
    "completedAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "inGameId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "zoneInGameId" TEXT NOT NULL,

    CONSTRAINT "Level_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubLevel" (
    "id" TEXT NOT NULL,
    "isUnlock" BOOLEAN NOT NULL DEFAULT false,
    "unlockedAt" TIMESTAMPTZ(3),
    "isComplete" BOOLEAN NOT NULL DEFAULT false,
    "completedAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "inGameId" TEXT NOT NULL,
    "levelInGameId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "zoneInGameId" TEXT NOT NULL,

    CONSTRAINT "SubLevel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InnerLevel" (
    "id" TEXT NOT NULL,
    "isUnlock" BOOLEAN NOT NULL DEFAULT false,
    "unlockedAt" TIMESTAMPTZ(3),
    "isComplete" BOOLEAN NOT NULL DEFAULT false,
    "completedAt" TIMESTAMPTZ(3),
    "correctAttempt" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "correctAttemptCount" INTEGER NOT NULL DEFAULT 0,
    "maxAttempt" INTEGER NOT NULL DEFAULT 0,
    "playTime" INTEGER NOT NULL DEFAULT 0,
    "point" INTEGER NOT NULL DEFAULT 0,
    "played" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "inGameId" TEXT NOT NULL,
    "levelInGameId" TEXT NOT NULL,
    "subLevelInGameId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "zoneInGameId" TEXT NOT NULL,

    CONSTRAINT "InnerLevel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Gempo" (
    "id" TEXT NOT NULL,
    "isUnlock" BOOLEAN NOT NULL DEFAULT false,
    "unlockedAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "inGameId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "zoneInGameId" TEXT NOT NULL,

    CONSTRAINT "Gempo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Championship" (
    "id" TEXT NOT NULL,
    "isUnlock" BOOLEAN NOT NULL DEFAULT false,
    "unlockedAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "inGameId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "zoneInGameId" TEXT NOT NULL,

    CONSTRAINT "Championship_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GempoRecord" (
    "id" TEXT NOT NULL,
    "played" INTEGER NOT NULL DEFAULT 0,
    "point" INTEGER NOT NULL DEFAULT 0,
    "highestPoint" INTEGER NOT NULL DEFAULT 0,
    "lastPlayedAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "gempoInGameId" TEXT NOT NULL,
    "inGameId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "zoneInGameId" TEXT NOT NULL,
    "correctAttempt" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "correctAttemptCount" INTEGER NOT NULL DEFAULT 0,
    "maxAttempt" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "GempoRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChampionshipRecord" (
    "id" TEXT NOT NULL,
    "teamWin" INTEGER NOT NULL DEFAULT 0,
    "teamLose" INTEGER NOT NULL DEFAULT 0,
    "teamPlayed" INTEGER NOT NULL DEFAULT 0,
    "teamPoint" INTEGER NOT NULL DEFAULT 0,
    "teamLastPlayedAt" TIMESTAMPTZ(3),
    "soloWin" INTEGER NOT NULL DEFAULT 0,
    "soloLose" INTEGER NOT NULL DEFAULT 0,
    "soloPlayed" INTEGER NOT NULL DEFAULT 0,
    "soloPoint" INTEGER NOT NULL DEFAULT 0,
    "soloLastPlayedAt" TIMESTAMPTZ(3),
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "championshipInGameId" TEXT NOT NULL,
    "inGameId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "zoneInGameId" TEXT NOT NULL,

    CONSTRAINT "ChampionshipRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserLogin" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "loginDate" TIMESTAMPTZ(3) NOT NULL,
    "logoutDate" TIMESTAMPTZ(3),

    CONSTRAINT "UserLogin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Admin" (
    "id" TEXT NOT NULL,
    "authId" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "suspend" BOOLEAN NOT NULL DEFAULT false,
    "role" "Role",
    "provinceId" TEXT,
    "cityId" TEXT,
    "subdistrictId" TEXT,
    "schoolId" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "authenticatorEnabled" BOOLEAN NOT NULL DEFAULT false,
    "authenticatorQrUrl" TEXT,
    "authenticatorSecret" TEXT,

    CONSTRAINT "Admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdminLog" (
    "id" TEXT NOT NULL,
    "ipAddress" TEXT,
    "old" JSONB,
    "new" JSONB,
    "adminId" TEXT NOT NULL,
    "table" TEXT,
    "operation" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AdminLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdminOperationHistory" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "adminId" TEXT NOT NULL,
    "opAdminId" TEXT NOT NULL,
    "operation" "Operation" NOT NULL DEFAULT 'None',

    CONSTRAINT "AdminOperationHistory_pkey1" PRIMARY KEY ("id","createdAt")
);

-- CreateTable
CREATE TABLE "AdminAuthority" (
    "id" TEXT NOT NULL,
    "adminId" TEXT NOT NULL,
    "provinceId" TEXT NOT NULL,
    "grades" INTEGER[],

    CONSTRAINT "AdminAuthority_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Banner" (
    "id" TEXT NOT NULL,
    "title" TEXT,
    "thumbnail" TEXT NOT NULL,
    "thumbnailId" TEXT NOT NULL,
    "link" TEXT,
    "startedAt" TIMESTAMPTZ(3),
    "endedAt" TIMESTAMPTZ(3),
    "isHide" BOOLEAN NOT NULL DEFAULT false,
    "nextBroadcastedAt" TIMESTAMP(3),
    "notificationDescription" TEXT,
    "adminId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Banner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BannerVisitor" (
    "id" TEXT NOT NULL,
    "bannerId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "traffic" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "BannerVisitor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Test" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "question" "QuestionType" NOT NULL,
    "duration" INTEGER NOT NULL DEFAULT 0,
    "passedPoint" INTEGER NOT NULL DEFAULT 0,
    "remidialCount" INTEGER NOT NULL DEFAULT -1,
    "type" "TestType" NOT NULL,
    "quota" INTEGER NOT NULL DEFAULT -1,
    "currentQuota" INTEGER NOT NULL DEFAULT 0,
    "code" TEXT,
    "zoneId" TEXT,
    "startedAt" TIMESTAMPTZ(3) NOT NULL,
    "endedAt" TIMESTAMPTZ(3),
    "description" TEXT,
    "category" "Role" NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "adminId" TEXT NOT NULL,

    CONSTRAINT "Test_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TestParticipant" (
    "id" TEXT NOT NULL,
    "testId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "highscore" DOUBLE PRECISION NOT NULL DEFAULT 0,

    CONSTRAINT "TestParticipant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TestParticipantRecord" (
    "id" TEXT NOT NULL,
    "participantId" TEXT NOT NULL,
    "startedAt" TIMESTAMPTZ(3),
    "endedAt" TIMESTAMPTZ(3),
    "score" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "answers" JSONB NOT NULL,

    CONSTRAINT "TestParticipantRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Background" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "thumbnail" TEXT NOT NULL,
    "isUse" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "thumbnailId" TEXT NOT NULL,

    CONSTRAINT "Background_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Setting" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "Setting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdminTransaction" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "quantity" INTEGER NOT NULL DEFAULT 0,
    "zones" TEXT[],
    "adminId" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "description" TEXT,
    "name" TEXT NOT NULL,
    "subscriptionTime" INTEGER NOT NULL,
    "transactionImageId" TEXT,
    "transactionImageUrl" TEXT,
    "transactionRef" TEXT,
    "status" "Transaction" NOT NULL DEFAULT 'Pending',
    "processedAt" TIMESTAMPTZ(3),
    "processedById" TEXT,

    CONSTRAINT "AdminTransaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RedeemCode" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "adminId" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "expiredAt" TIMESTAMPTZ(3),
    "currentAmount" INTEGER NOT NULL,
    "maxAmount" INTEGER NOT NULL,
    "data" TEXT[],
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "suspend" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "RedeemCode_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserRedeemCode" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expiredAt" TIMESTAMPTZ(3),
    "data" TEXT[],
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "suspend" BOOLEAN NOT NULL DEFAULT false,
    "transactionId" TEXT NOT NULL,

    CONSTRAINT "UserRedeemCode_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CodeRedeemer" (
    "id" TEXT NOT NULL,
    "banned" BOOLEAN NOT NULL DEFAULT false,
    "userId" TEXT NOT NULL,
    "codeId" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "CodeRedeemer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChampionshipMatch" (
    "id" TEXT NOT NULL,
    "max" INTEGER NOT NULL DEFAULT 2,
    "zoneInGameId" TEXT NOT NULL,
    "gameplayId" TEXT NOT NULL,
    "botOwner" TEXT,
    "mode" "MatchMode" NOT NULL,
    "endTime" INTEGER NOT NULL DEFAULT 0,
    "startedAt" TIMESTAMPTZ(3),
    "endedAt" TIMESTAMPTZ(3),
    "expiredAt" TIMESTAMPTZ(3),
    "isStarted" BOOLEAN NOT NULL DEFAULT false,
    "isEnded" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "currentMember" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "ChampionshipMatch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MatchMember" (
    "id" TEXT NOT NULL,
    "roomId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "slot" INTEGER NOT NULL DEFAULT 0,
    "status" "MatchStatus" NOT NULL DEFAULT 'None',
    "answerPoint" INTEGER NOT NULL DEFAULT 0,
    "point" INTEGER NOT NULL DEFAULT 0,
    "bonusPoint" INTEGER NOT NULL DEFAULT 0,
    "teamType" "TeamType" NOT NULL DEFAULT 'None',
    "isReady" BOOLEAN NOT NULL DEFAULT false,
    "isComplete" BOOLEAN NOT NULL DEFAULT false,
    "isBot" BOOLEAN NOT NULL DEFAULT false,
    "joinedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "finishedAt" TIMESTAMPTZ(3),
    "isDisconnect" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "MatchMember_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChampionshipHistory" (
    "id" TEXT NOT NULL,
    "max" INTEGER NOT NULL DEFAULT 2,
    "zoneInGameId" TEXT NOT NULL,
    "gameplayId" TEXT NOT NULL,
    "botOwner" TEXT,
    "currentPoint" INTEGER[] DEFAULT ARRAY[0, 0]::INTEGER[],
    "mode" "MatchMode" NOT NULL,
    "endTime" INTEGER NOT NULL DEFAULT 0,
    "startedAt" TIMESTAMPTZ(3),
    "endedAt" TIMESTAMPTZ(3),
    "expiredAt" TIMESTAMPTZ(3),
    "isStarted" BOOLEAN NOT NULL DEFAULT false,
    "isEnded" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,
    "currentMember" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "ChampionshipHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MatchHistoryMember" (
    "id" TEXT NOT NULL,
    "roomId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "slot" INTEGER NOT NULL DEFAULT 0,
    "status" "MatchStatus" NOT NULL DEFAULT 'None',
    "point" INTEGER NOT NULL DEFAULT 0,
    "bonusPoint" INTEGER NOT NULL DEFAULT 0,
    "correctAttempt" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "correctAttemptCount" INTEGER NOT NULL DEFAULT 0,
    "maxAttempt" INTEGER NOT NULL DEFAULT 0,
    "teamType" "TeamType" NOT NULL DEFAULT 'None',
    "isReady" BOOLEAN NOT NULL DEFAULT false,
    "isComplete" BOOLEAN NOT NULL DEFAULT false,
    "isBot" BOOLEAN NOT NULL DEFAULT false,
    "joinedAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "finishedAt" TIMESTAMPTZ(3),
    "isDisconnect" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "MatchHistoryMember_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "data" TEXT[],
    "price" INTEGER NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "subscriptionTime" INTEGER NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Voucher" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "voucher" TEXT NOT NULL,
    "voucherType" "VoucherType" NOT NULL,
    "amount" INTEGER NOT NULL,
    "quota" INTEGER NOT NULL,
    "currentQuota" INTEGER NOT NULL,
    "expiredAt" TIMESTAMP(3),
    "conditions" TEXT[],
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Voucher_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserTransaction" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,
    "finalPrice" INTEGER NOT NULL,
    "transactionRef" TEXT NOT NULL,
    "transactionActionRef" JSONB NOT NULL,
    "voucherId" TEXT,
    "productId" TEXT,
    "status" "Transaction" NOT NULL DEFAULT 'Pending',

    CONSTRAINT "UserTransaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ImportExport" (
    "id" TEXT NOT NULL,
    "adminId" TEXT NOT NULL,
    "expiredAt" TIMESTAMPTZ(3),
    "method" "ImportExportType" NOT NULL,
    "status" "ImportExportProgress" NOT NULL DEFAULT 'Waiting',
    "queueName" TEXT NOT NULL DEFAULT '',
    "maxCount" INTEGER NOT NULL DEFAULT 0,
    "errorCount" INTEGER NOT NULL DEFAULT 0,
    "fileId" TEXT,
    "fileUrl" TEXT,
    "createdAt" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "ImportExport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_AdminAuthorityToCity" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_AdminAuthorityToCity_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_AdminAuthorityToSubdistrict" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_AdminAuthorityToSubdistrict_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_AdminAuthorityToSchool" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_AdminAuthorityToSchool_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_BannerToProvince" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_BannerToProvince_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_BannerToCity" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_BannerToCity_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_BannerToSubdistrict" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_BannerToSubdistrict_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "Province_id_idx" ON "Province"("id");

-- CreateIndex
CREATE INDEX "Province_name_idx" ON "Province"("name");

-- CreateIndex
CREATE INDEX "Province_id_name_idx" ON "Province"("id", "name");

-- CreateIndex
CREATE INDEX "City_provinceId_idx" ON "City"("provinceId");

-- CreateIndex
CREATE INDEX "Subdistrict_provinceId_idx" ON "Subdistrict"("provinceId");

-- CreateIndex
CREATE INDEX "Subdistrict_cityId_idx" ON "Subdistrict"("cityId");

-- CreateIndex
CREATE UNIQUE INDEX "School_identity_key" ON "School"("identity");

-- CreateIndex
CREATE INDEX "School_cityId_idx" ON "School"("cityId");

-- CreateIndex
CREATE INDEX "School_provinceId_idx" ON "School"("provinceId");

-- CreateIndex
CREATE INDEX "School_subdistrictId_idx" ON "School"("subdistrictId");

-- CreateIndex
CREATE UNIQUE INDEX "User_authId_key" ON "User"("authId");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_schoolIdentity_key" ON "User"("schoolIdentity");

-- CreateIndex
CREATE UNIQUE INDEX "User_adminId_key" ON "User"("adminId");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE INDEX "User_provinceId_idx" ON "User"("provinceId");

-- CreateIndex
CREATE INDEX "User_cityId_idx" ON "User"("cityId");

-- CreateIndex
CREATE INDEX "User_schoolId_idx" ON "User"("schoolId");

-- CreateIndex
CREATE INDEX "User_authId_idx" ON "User"("authId");

-- CreateIndex
CREATE INDEX "User_subdistrictId_idx" ON "User"("subdistrictId");

-- CreateIndex
CREATE INDEX "Zone_inGameId_idx" ON "Zone"("inGameId");

-- CreateIndex
CREATE INDEX "Zone_userId_idx" ON "Zone"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Zone_userId_inGameId_key" ON "Zone"("userId", "inGameId");

-- CreateIndex
CREATE INDEX "Level_zoneInGameId_idx" ON "Level"("zoneInGameId");

-- CreateIndex
CREATE INDEX "Level_inGameId_idx" ON "Level"("inGameId");

-- CreateIndex
CREATE INDEX "Level_userId_idx" ON "Level"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Level_userId_inGameId_key" ON "Level"("userId", "inGameId");

-- CreateIndex
CREATE INDEX "SubLevel_zoneInGameId_idx" ON "SubLevel"("zoneInGameId");

-- CreateIndex
CREATE INDEX "SubLevel_levelInGameId_idx" ON "SubLevel"("levelInGameId");

-- CreateIndex
CREATE INDEX "SubLevel_inGameId_idx" ON "SubLevel"("inGameId");

-- CreateIndex
CREATE INDEX "SubLevel_userId_idx" ON "SubLevel"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "SubLevel_userId_inGameId_key" ON "SubLevel"("userId", "inGameId");

-- CreateIndex
CREATE INDEX "InnerLevel_zoneInGameId_idx" ON "InnerLevel"("zoneInGameId");

-- CreateIndex
CREATE INDEX "InnerLevel_levelInGameId_idx" ON "InnerLevel"("levelInGameId");

-- CreateIndex
CREATE INDEX "InnerLevel_subLevelInGameId_idx" ON "InnerLevel"("subLevelInGameId");

-- CreateIndex
CREATE INDEX "InnerLevel_inGameId_idx" ON "InnerLevel"("inGameId");

-- CreateIndex
CREATE INDEX "InnerLevel_userId_idx" ON "InnerLevel"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "InnerLevel_userId_inGameId_key" ON "InnerLevel"("userId", "inGameId");

-- CreateIndex
CREATE INDEX "Gempo_zoneInGameId_inGameId_idx" ON "Gempo"("zoneInGameId", "inGameId");

-- CreateIndex
CREATE INDEX "Gempo_zoneInGameId_idx" ON "Gempo"("zoneInGameId");

-- CreateIndex
CREATE INDEX "Gempo_inGameId_idx" ON "Gempo"("inGameId");

-- CreateIndex
CREATE INDEX "Gempo_userId_idx" ON "Gempo"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Gempo_userId_inGameId_key" ON "Gempo"("userId", "inGameId");

-- CreateIndex
CREATE INDEX "Championship_zoneInGameId_inGameId_idx" ON "Championship"("zoneInGameId", "inGameId");

-- CreateIndex
CREATE INDEX "Championship_zoneInGameId_idx" ON "Championship"("zoneInGameId");

-- CreateIndex
CREATE INDEX "Championship_inGameId_idx" ON "Championship"("inGameId");

-- CreateIndex
CREATE INDEX "Championship_userId_idx" ON "Championship"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Championship_userId_inGameId_key" ON "Championship"("userId", "inGameId");

-- CreateIndex
CREATE INDEX "GempoRecord_zoneInGameId_gempoInGameId_idx" ON "GempoRecord"("zoneInGameId", "gempoInGameId");

-- CreateIndex
CREATE INDEX "GempoRecord_gempoInGameId_inGameId_idx" ON "GempoRecord"("gempoInGameId", "inGameId");

-- CreateIndex
CREATE INDEX "GempoRecord_gempoInGameId_idx" ON "GempoRecord"("gempoInGameId");

-- CreateIndex
CREATE INDEX "GempoRecord_zoneInGameId_idx" ON "GempoRecord"("zoneInGameId");

-- CreateIndex
CREATE INDEX "GempoRecord_inGameId_idx" ON "GempoRecord"("inGameId");

-- CreateIndex
CREATE INDEX "GempoRecord_userId_idx" ON "GempoRecord"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "GempoRecord_userId_inGameId_key" ON "GempoRecord"("userId", "inGameId");

-- CreateIndex
CREATE INDEX "ChampionshipRecord_zoneInGameId_championshipInGameId_idx" ON "ChampionshipRecord"("zoneInGameId", "championshipInGameId");

-- CreateIndex
CREATE INDEX "ChampionshipRecord_championshipInGameId_inGameId_idx" ON "ChampionshipRecord"("championshipInGameId", "inGameId");

-- CreateIndex
CREATE INDEX "ChampionshipRecord_championshipInGameId_idx" ON "ChampionshipRecord"("championshipInGameId");

-- CreateIndex
CREATE INDEX "ChampionshipRecord_zoneInGameId_idx" ON "ChampionshipRecord"("zoneInGameId");

-- CreateIndex
CREATE INDEX "ChampionshipRecord_inGameId_idx" ON "ChampionshipRecord"("inGameId");

-- CreateIndex
CREATE INDEX "ChampionshipRecord_userId_idx" ON "ChampionshipRecord"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "ChampionshipRecord_userId_inGameId_key" ON "ChampionshipRecord"("userId", "inGameId");

-- CreateIndex
CREATE INDEX "UserLogin_userId_idx" ON "UserLogin"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Admin_authId_key" ON "Admin"("authId");

-- CreateIndex
CREATE UNIQUE INDEX "Admin_email_key" ON "Admin"("email");

-- CreateIndex
CREATE INDEX "AdminLog_adminId_idx" ON "AdminLog"("adminId");

-- CreateIndex
CREATE INDEX "AdminAuthority_provinceId_idx" ON "AdminAuthority"("provinceId");

-- CreateIndex
CREATE INDEX "Banner_isHide_idx" ON "Banner"("isHide");

-- CreateIndex
CREATE INDEX "Banner_startedAt_idx" ON "Banner"("startedAt");

-- CreateIndex
CREATE INDEX "Banner_endedAt_idx" ON "Banner"("endedAt");

-- CreateIndex
CREATE INDEX "Banner_adminId_idx" ON "Banner"("adminId");

-- CreateIndex
CREATE INDEX "Banner_startedAt_endedAt_isHide_idx" ON "Banner"("startedAt", "endedAt", "isHide");

-- CreateIndex
CREATE INDEX "BannerVisitor_bannerId_idx" ON "BannerVisitor"("bannerId");

-- CreateIndex
CREATE INDEX "BannerVisitor_userId_idx" ON "BannerVisitor"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "BannerVisitor_bannerId_userId_key" ON "BannerVisitor"("bannerId", "userId");

-- CreateIndex
CREATE INDEX "Test_category_idx" ON "Test"("category");

-- CreateIndex
CREATE INDEX "Test_type_idx" ON "Test"("type");

-- CreateIndex
CREATE INDEX "Test_type_question_idx" ON "Test"("type", "question");

-- CreateIndex
CREATE INDEX "Test_type_question_category_idx" ON "Test"("type", "question", "category");

-- CreateIndex
CREATE INDEX "Test_category_type_question_startedAt_endedAt_idx" ON "Test"("category", "type", "question", "startedAt", "endedAt");

-- CreateIndex
CREATE INDEX "Test_zoneId_type_idx" ON "Test"("zoneId", "type");

-- CreateIndex
CREATE INDEX "TestParticipant_testId_idx" ON "TestParticipant"("testId");

-- CreateIndex
CREATE INDEX "TestParticipant_userId_idx" ON "TestParticipant"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "TestParticipant_testId_userId_key" ON "TestParticipant"("testId", "userId");

-- CreateIndex
CREATE INDEX "TestParticipantRecord_participantId_idx" ON "TestParticipantRecord"("participantId");

-- CreateIndex
CREATE INDEX "AdminTransaction_name_idx" ON "AdminTransaction"("name");

-- CreateIndex
CREATE INDEX "AdminTransaction_status_idx" ON "AdminTransaction"("status");

-- CreateIndex
CREATE INDEX "AdminTransaction_adminId_idx" ON "AdminTransaction"("adminId");

-- CreateIndex
CREATE INDEX "AdminTransaction_transactionRef_idx" ON "AdminTransaction"("transactionRef");

-- CreateIndex
CREATE INDEX "AdminTransaction_archived_idx" ON "AdminTransaction"("archived");

-- CreateIndex
CREATE UNIQUE INDEX "RedeemCode_transactionId_key" ON "RedeemCode"("transactionId");

-- CreateIndex
CREATE UNIQUE INDEX "RedeemCode_code_key" ON "RedeemCode"("code");

-- CreateIndex
CREATE INDEX "RedeemCode_adminId_idx" ON "RedeemCode"("adminId");

-- CreateIndex
CREATE UNIQUE INDEX "UserRedeemCode_transactionId_key" ON "UserRedeemCode"("transactionId");

-- CreateIndex
CREATE INDEX "UserRedeemCode_expiredAt_idx" ON "UserRedeemCode"("expiredAt");

-- CreateIndex
CREATE INDEX "CodeRedeemer_codeId_idx" ON "CodeRedeemer"("codeId");

-- CreateIndex
CREATE INDEX "CodeRedeemer_userId_idx" ON "CodeRedeemer"("userId");

-- CreateIndex
CREATE INDEX "CodeRedeemer_banned_idx" ON "CodeRedeemer"("banned");

-- CreateIndex
CREATE INDEX "CodeRedeemer_codeId_userId_idx" ON "CodeRedeemer"("codeId", "userId");

-- CreateIndex
CREATE INDEX "CodeRedeemer_codeId_banned_idx" ON "CodeRedeemer"("codeId", "banned");

-- CreateIndex
CREATE UNIQUE INDEX "CodeRedeemer_id_userId_key" ON "CodeRedeemer"("id", "userId");

-- CreateIndex
CREATE UNIQUE INDEX "CodeRedeemer_codeId_userId_key" ON "CodeRedeemer"("codeId", "userId");

-- CreateIndex
CREATE INDEX "ChampionshipMatch_gameplayId_idx" ON "ChampionshipMatch"("gameplayId");

-- CreateIndex
CREATE INDEX "ChampionshipMatch_max_idx" ON "ChampionshipMatch"("max");

-- CreateIndex
CREATE INDEX "ChampionshipMatch_expiredAt_idx" ON "ChampionshipMatch"("expiredAt");

-- CreateIndex
CREATE INDEX "ChampionshipMatch_max_startedAt_idx" ON "ChampionshipMatch"("max", "startedAt");

-- CreateIndex
CREATE INDEX "ChampionshipMatch_max_startedAt_currentMember_idx" ON "ChampionshipMatch"("max", "startedAt", "currentMember");

-- CreateIndex
CREATE INDEX "ChampionshipMatch_isStarted_expiredAt_gameplayId_max_curren_idx" ON "ChampionshipMatch"("isStarted", "expiredAt", "gameplayId", "max", "currentMember");

-- CreateIndex
CREATE UNIQUE INDEX "MatchMember_roomId_slot_key" ON "MatchMember"("roomId", "slot");

-- CreateIndex
CREATE UNIQUE INDEX "MatchMember_roomId_userId_key" ON "MatchMember"("roomId", "userId");

-- CreateIndex
CREATE INDEX "ChampionshipHistory_gameplayId_idx" ON "ChampionshipHistory"("gameplayId");

-- CreateIndex
CREATE INDEX "ChampionshipHistory_max_idx" ON "ChampionshipHistory"("max");

-- CreateIndex
CREATE INDEX "ChampionshipHistory_max_startedAt_idx" ON "ChampionshipHistory"("max", "startedAt");

-- CreateIndex
CREATE INDEX "ChampionshipHistory_max_startedAt_currentMember_idx" ON "ChampionshipHistory"("max", "startedAt", "currentMember");

-- CreateIndex
CREATE UNIQUE INDEX "Voucher_voucher_key" ON "Voucher"("voucher");

-- CreateIndex
CREATE UNIQUE INDEX "UserTransaction_transactionRef_key" ON "UserTransaction"("transactionRef");

-- CreateIndex
CREATE INDEX "UserTransaction_status_idx" ON "UserTransaction"("status");

-- CreateIndex
CREATE INDEX "_AdminAuthorityToCity_B_index" ON "_AdminAuthorityToCity"("B");

-- CreateIndex
CREATE INDEX "_AdminAuthorityToSubdistrict_B_index" ON "_AdminAuthorityToSubdistrict"("B");

-- CreateIndex
CREATE INDEX "_AdminAuthorityToSchool_B_index" ON "_AdminAuthorityToSchool"("B");

-- CreateIndex
CREATE INDEX "_BannerToProvince_B_index" ON "_BannerToProvince"("B");

-- CreateIndex
CREATE INDEX "_BannerToCity_B_index" ON "_BannerToCity"("B");

-- CreateIndex
CREATE INDEX "_BannerToSubdistrict_B_index" ON "_BannerToSubdistrict"("B");

-- AddForeignKey
ALTER TABLE "City" ADD CONSTRAINT "City_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES "Province"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subdistrict" ADD CONSTRAINT "Subdistrict_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES "Province"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subdistrict" ADD CONSTRAINT "Subdistrict_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "City"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "School" ADD CONSTRAINT "School_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "City"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "School" ADD CONSTRAINT "School_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES "Province"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "School" ADD CONSTRAINT "School_subdistrictId_fkey" FOREIGN KEY ("subdistrictId") REFERENCES "Subdistrict"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "City"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES "Province"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_subdistrictId_fkey" FOREIGN KEY ("subdistrictId") REFERENCES "Subdistrict"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Zone" ADD CONSTRAINT "Zone_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Level" ADD CONSTRAINT "Level_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubLevel" ADD CONSTRAINT "SubLevel_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InnerLevel" ADD CONSTRAINT "InnerLevel_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Gempo" ADD CONSTRAINT "Gempo_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Championship" ADD CONSTRAINT "Championship_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GempoRecord" ADD CONSTRAINT "GempoRecord_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChampionshipRecord" ADD CONSTRAINT "ChampionshipRecord_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserLogin" ADD CONSTRAINT "UserLogin_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Admin" ADD CONSTRAINT "Admin_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES "Province"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Admin" ADD CONSTRAINT "Admin_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "City"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Admin" ADD CONSTRAINT "Admin_subdistrictId_fkey" FOREIGN KEY ("subdistrictId") REFERENCES "Subdistrict"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Admin" ADD CONSTRAINT "Admin_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdminLog" ADD CONSTRAINT "AdminLog_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdminOperationHistory" ADD CONSTRAINT "AdminOperationHistory_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdminOperationHistory" ADD CONSTRAINT "AdminOperationHistory_opAdminId_fkey" FOREIGN KEY ("opAdminId") REFERENCES "Admin"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdminAuthority" ADD CONSTRAINT "AdminAuthority_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdminAuthority" ADD CONSTRAINT "AdminAuthority_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES "Province"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Banner" ADD CONSTRAINT "Banner_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BannerVisitor" ADD CONSTRAINT "BannerVisitor_bannerId_fkey" FOREIGN KEY ("bannerId") REFERENCES "Banner"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BannerVisitor" ADD CONSTRAINT "BannerVisitor_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Test" ADD CONSTRAINT "Test_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TestParticipant" ADD CONSTRAINT "TestParticipant_testId_fkey" FOREIGN KEY ("testId") REFERENCES "Test"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TestParticipant" ADD CONSTRAINT "TestParticipant_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TestParticipantRecord" ADD CONSTRAINT "TestParticipantRecord_participantId_fkey" FOREIGN KEY ("participantId") REFERENCES "TestParticipant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdminTransaction" ADD CONSTRAINT "AdminTransaction_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdminTransaction" ADD CONSTRAINT "AdminTransaction_processedById_fkey" FOREIGN KEY ("processedById") REFERENCES "Admin"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedeemCode" ADD CONSTRAINT "RedeemCode_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedeemCode" ADD CONSTRAINT "RedeemCode_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "AdminTransaction"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserRedeemCode" ADD CONSTRAINT "UserRedeemCode_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserRedeemCode" ADD CONSTRAINT "UserRedeemCode_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "UserTransaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CodeRedeemer" ADD CONSTRAINT "CodeRedeemer_codeId_fkey" FOREIGN KEY ("codeId") REFERENCES "RedeemCode"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CodeRedeemer" ADD CONSTRAINT "CodeRedeemer_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MatchMember" ADD CONSTRAINT "MatchMember_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "ChampionshipMatch"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MatchMember" ADD CONSTRAINT "MatchMember_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MatchHistoryMember" ADD CONSTRAINT "MatchHistoryMember_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "ChampionshipHistory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MatchHistoryMember" ADD CONSTRAINT "MatchHistoryMember_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserTransaction" ADD CONSTRAINT "UserTransaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserTransaction" ADD CONSTRAINT "UserTransaction_voucherId_fkey" FOREIGN KEY ("voucherId") REFERENCES "Voucher"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserTransaction" ADD CONSTRAINT "UserTransaction_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImportExport" ADD CONSTRAINT "ImportExport_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AdminAuthorityToCity" ADD CONSTRAINT "_AdminAuthorityToCity_A_fkey" FOREIGN KEY ("A") REFERENCES "AdminAuthority"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AdminAuthorityToCity" ADD CONSTRAINT "_AdminAuthorityToCity_B_fkey" FOREIGN KEY ("B") REFERENCES "City"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AdminAuthorityToSubdistrict" ADD CONSTRAINT "_AdminAuthorityToSubdistrict_A_fkey" FOREIGN KEY ("A") REFERENCES "AdminAuthority"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AdminAuthorityToSubdistrict" ADD CONSTRAINT "_AdminAuthorityToSubdistrict_B_fkey" FOREIGN KEY ("B") REFERENCES "Subdistrict"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AdminAuthorityToSchool" ADD CONSTRAINT "_AdminAuthorityToSchool_A_fkey" FOREIGN KEY ("A") REFERENCES "AdminAuthority"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AdminAuthorityToSchool" ADD CONSTRAINT "_AdminAuthorityToSchool_B_fkey" FOREIGN KEY ("B") REFERENCES "School"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BannerToProvince" ADD CONSTRAINT "_BannerToProvince_A_fkey" FOREIGN KEY ("A") REFERENCES "Banner"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BannerToProvince" ADD CONSTRAINT "_BannerToProvince_B_fkey" FOREIGN KEY ("B") REFERENCES "Province"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BannerToCity" ADD CONSTRAINT "_BannerToCity_A_fkey" FOREIGN KEY ("A") REFERENCES "Banner"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BannerToCity" ADD CONSTRAINT "_BannerToCity_B_fkey" FOREIGN KEY ("B") REFERENCES "City"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BannerToSubdistrict" ADD CONSTRAINT "_BannerToSubdistrict_A_fkey" FOREIGN KEY ("A") REFERENCES "Banner"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BannerToSubdistrict" ADD CONSTRAINT "_BannerToSubdistrict_B_fkey" FOREIGN KEY ("B") REFERENCES "Subdistrict"("id") ON DELETE CASCADE ON UPDATE CASCADE;
