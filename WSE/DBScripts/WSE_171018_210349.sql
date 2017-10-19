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


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."researcher"  add column  "group_oid"  int4;
alter table "public"."researcher"   add constraint fk_researcher_group foreign key ("group_oid") references "public"."group" ("oid");


-- Owner and publication [rel2]
alter table "public"."publication"  add column  "researcher_oid"  int4;
alter table "public"."publication"   add constraint fk_publication_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");


-- CollectionResearcher [rel6]
alter table "public"."collection"  add column  "researcher_oid"  int4;
alter table "public"."collection"   add constraint fk_collection_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");


-- Publication_Collection [rel7]
create table "public"."publication_collection" (
   "publication_oid"  int4 not null,
   "publication_title"  varchar(255) not null,
   "publication_venue_of_publicati"  varchar(255) not null,
   "publication_year_of_publicatio"  int4 not null,
   "collection_oid"  int4 not null,
  primary key ("publication_oid", "publication_title", "publication_venue_of_publicati", "publication_year_of_publicatio", "collection_oid")
);
alter table "public"."publication_collection"   add constraint fk_publication_collection_publ foreign key ("publication_oid", "publication_title", "publication_venue_of_publicati", "publication_year_of_publicatio") references "public"."publication" ("oid", "title", "venue", "year");
alter table "public"."publication_collection"   add constraint fk_publication_collection_coll foreign key ("collection_oid") references "public"."collection" ("oid");


