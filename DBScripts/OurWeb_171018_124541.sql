-- Publication [ent1]
create table "public"."publication" (
   "oid"  int4  not null,
   "pubtitle"  varchar(255),
   "pubauthor"  varchar(255),
   "description"  varchar(255),
   "reputation"  int4,
   "abstract"  varchar(255),
  primary key ("oid")
);


