-- CreateTable
-- DROP TABLE IF EXISTS users
CREATE TABLE IF NOT EXISTS "users" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL UNIQUE,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NULL,
    "gravatar" TEXT,
    "signature" TEXT,
    "roletags" TEXT
);


-- CreateTable
-- DROP TABLE IF EXISTS posts
CREATE TABLE IF NOT EXISTS "posts" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT,
    "body" TEXT NOT NULL,
    "userId" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NULL,
    "istop" INTEGER,
    "isro" INTEGER,
    "viewtimes" INTEGER,
    "cattags" TEXT
);

-- CreateTable
-- DROP TABLE IF EXISTS comments
CREATE TABLE IF NOT EXISTS "comments" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "body" TEXT NOT NULL,
    "postId" TEXT,
    "userId" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NULL
);

-- CreateTable
-- DROP TABLE IF EXISTS notifies
CREATE TABLE IF NOT EXISTS "notifies" (
    "touserid" TEXT NOT NULL,
    "isreaded" INTEGER NOT NULL,
    "commenthappeningid" TEXT NOT NULL
);

-- CreateTable
-- DROP TABLE IF EXISTS regcodes
CREATE TABLE IF NOT EXISTS "regcodes" (
    "body" TEXT NOT NULL,
    "isredeemed" INTEGER NOT NULL,
    "redeemedto" TEXT
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");