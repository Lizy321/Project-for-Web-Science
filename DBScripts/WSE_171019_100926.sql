-- Researcher [User]
create table "public"."researcher" (
   "oid"  int4  not null,
   "name"  varchar(255),
   "password"  varchar(255),
   "admin"  bool,
   "university"  varchar(255),
   "keywords"  varchar(255),
   "username"  varchar(255),
  primary key ("oid")
);


-- Publication [ent1]
create table "public"."publication" (
   "oid"  int4  not null,
   "title"  varchar(255),
   "venue"  varchar(255),
   "year"  int4,
   "abstract"  text,
   "keywords"  varchar(255),
   "pdf"  varchar(255),
  primary key ("oid")
);


-- Writer and publication [rel1]
create table "public"."writer_and_publication" (
   "publication_oid"  int4 not null,
   "researcher_oid"  int4 not null,
  primary key ("publication_oid", "researcher_oid")
);
alter table "public"."writer_and_publication"   add constraint fk_writer_and_publication_publ foreign key ("publication_oid") references "public"."publication" ("oid");
alter table "public"."writer_and_publication"   add constraint fk_writer_and_publication_rese foreign key ("researcher_oid") references "public"."researcher" ("oid");
create index "idx_writer_and_publication_pub" on "public"."writer_and_publication"("publication_oid");
create index "idx_writer_and_publication_res" on "public"."writer_and_publication"("researcher_oid");


