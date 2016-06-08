CREATE TABLE "api" (
"id" INTEGER NOT NULL,
"authname" TEXT NOT NULL,
"url" TEXT NOT NULL,
"describe" TEXT,
PRIMARY KEY ("id") 
);

CREATE TABLE "articles" (
"id" INTEGER NOT NULL,
"title" TEXT NOT NULL,
"content" TEXT,
"userid" INTEGER NOT NULL,
"create_date" INTEGER,
"modify_date" INTEGER,
PRIMARY KEY ("id") ,
CONSTRAINT "fk_articles_user_1" FOREIGN KEY ("userid") REFERENCES "user" ("id")
);

CREATE TABLE "comment" (
"id" INTEGER NOT NULL DEFAULT NULL,
"articleid" INTEGER NOT NULL,
"userid" INTEGER NOT NULL,
"comment" TEXT(120) NOT NULL,
"createdate" INTEGER,
PRIMARY KEY ("id") ,
CONSTRAINT "c_a_fk" FOREIGN KEY ("articleid") REFERENCES "articles" ("id"),
CONSTRAINT "fk_comment_user_1" FOREIGN KEY ("userid") REFERENCES "user" ("id")
);

CREATE TABLE "setting" (
"id" INTEGER NOT NULL,
"key" TEXT,
"value" TEXT,
PRIMARY KEY ("id") ,
CONSTRAINT "key_unq" UNIQUE ("key" ASC)
);

CREATE UNIQUE INDEX "key" ON "setting" ("key"  ASC);

CREATE TABLE "sqlite_sequence" (
"name" ,
"seq" 
);

CREATE TABLE "user" (
"id" INTEGER NOT NULL,
"username" TEXT(32) NOT NULL,
"passwd" TEXT(32) NOT NULL,
"usertype" INTEGER NOT NULL DEFAULT 4,
"nickname" TEXT,
"comment" TEXT(100),
"lastlogindate" INTEGER,
"lastloginip" TEXT,
PRIMARY KEY ("id") ,
CONSTRAINT "usertyep_fk" FOREIGN KEY ("usertype") REFERENCES "usertype" ("id"),
CONSTRAINT "username_unq" UNIQUE ("username" ASC)
);

CREATE UNIQUE INDEX "password" ON "user" ("username"  ASC, "passwd"  ASC);

CREATE TABLE "usertype" (
"id" INTEGER NOT NULL,
"usertype" TEXT(20) NOT NULL,
"descripe" TEXT,
PRIMARY KEY ("id") 
);

CREATE TABLE "usertypeapi" (
"id" INTEGER NOT NULL,
"usertypeid" INTEGER NOT NULL,
"apiid" INTEGER NOT NULL,
PRIMARY KEY ("id") ,
CONSTRAINT "fk_usertypyauth_usertype_1" FOREIGN KEY ("usertypeid") REFERENCES "usertype" ("id"),
CONSTRAINT "fk_usertypyauth_auth_1" FOREIGN KEY ("apiid") REFERENCES "api" ("id")
);

CREATE TABLE "usertypeview" (
"id" INTEGER NOT NULL,
"usertypeid" INTEGER NOT NULL,
"viewid" INTEGER NOT NULL,
PRIMARY KEY ("id") ,
CONSTRAINT "usertype_fk" FOREIGN KEY ("usertypeid") REFERENCES "usertype" ("id"),
CONSTRAINT "view_fk" FOREIGN KEY ("viewid") REFERENCES "view" ("id")
);

CREATE TABLE "view" (
"id" INTEGER NOT NULL,
"viewname" TEXT NOT NULL,
"url" TEXT NOT NULL,
"descripe" TEXT,
PRIMARY KEY ("id") 
);

