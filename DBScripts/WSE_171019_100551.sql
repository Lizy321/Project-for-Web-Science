-- Group [Group]
create table "public"."group" (
   "oid"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid")
);


-- Module [Module]
create table "public"."module" (
   "oid"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid")
);


-- Researcher [User]
create table "public"."researcher" (
   "oid"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "name"  varchar(255),
   "university"  varchar(255),
   "keywords"  varchar(255),
   "admin"  bool,
  primary key ("oid")
);


-- Publication [ent1]
create table "public"."publication" (
   "oid"  int4  not null,
   "title"  varchar(255)  not null,
   "venue"  varchar(255)  not null,
   "year"  int4  not null,
   "abstract"  text,
   "keywords"  varchar(255),
   "pdf"  varchar(255),
  primary key ("oid", "title", "venue", "year")
);


-- Collection [ent2]
create table "public"."collection" (
   "oid"  int4  not null,
   "title"  varchar(255),
   "description"  text,
   "number"  int4,
   "keywords"  varchar(255),
  primary key ("oid")
);


