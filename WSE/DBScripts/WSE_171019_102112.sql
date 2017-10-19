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
   "title"  varchar(255),
   "venue"  varchar(255),
   "year"  int4,
   "abstract"  text,
   "keywords"  varchar(255),
   "pdf"  varchar(255),
  primary key ("oid")
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


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"  add column  "module_oid"  int4;
alter table "public"."group"   add constraint fk_group_module foreign key ("module_oid") references "public"."module" ("oid");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid"  int4 not null,
   "module_oid"  int4 not null,
  primary key ("group_oid", "module_oid")
);
alter table "public"."group_module"   add constraint fk_group_module_group foreign key ("group_oid") references "public"."group" ("oid");
alter table "public"."group_module"   add constraint fk_group_module_module foreign key ("module_oid") references "public"."module" ("oid");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."researcher"  add column  "group_oid"  int4;
alter table "public"."researcher"   add constraint fk_researcher_group foreign key ("group_oid") references "public"."group" ("oid");


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "researcher_oid"  int4 not null,
   "group_oid"  int4 not null,
  primary key ("researcher_oid", "group_oid")
);
alter table "public"."user_group"   add constraint fk_user_group_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_oid") references "public"."group" ("oid");


-- Writer of a publication [rel1]
create table "public"."writer_and_publication" (
   "publication_oid"  int4 not null,
   "researcher_oid"  int4 not null,
  primary key ("publication_oid", "researcher_oid")
);
alter table "public"."writer_and_publication"   add constraint fk_writer_and_publication_publ foreign key ("publication_oid") references "public"."publication" ("oid");
alter table "public"."writer_and_publication"   add constraint fk_writer_and_publication_rese foreign key ("researcher_oid") references "public"."researcher" ("oid");


-- Author and publication [rel2]
alter table "public"."publication"  add column  "researcher_oid"  int4;
alter table "public"."publication"   add constraint fk_publication_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");


-- Creator of a collection [rel6]
alter table "public"."collection"  add column  "researcher_oid"  int4;
alter table "public"."collection"   add constraint fk_collection_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");


-- collectted in a collection [rel7]
create table "public"."publication_collection" (
   "publication_oid"  int4 not null,
   "collection_oid"  int4 not null,
  primary key ("publication_oid", "collection_oid")
);
alter table "public"."publication_collection"   add constraint fk_publication_collection_publ foreign key ("publication_oid") references "public"."publication" ("oid");
alter table "public"."publication_collection"   add constraint fk_publication_collection_coll foreign key ("collection_oid") references "public"."collection" ("oid");


