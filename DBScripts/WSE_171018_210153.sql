-- Publication_Collection [rel7]
create table "public"."publication_collection" (
   "publication_oid"  int4 not null,
   "publication_title"  varchar(255) not null,
   "publication_venue_of_publicati"  varchar(255) not null,
   "publication_year_of_publicatio"  int4 not null,
   "collection_oid"  int4 not null,
  primary key ("publication_oid", "publication_title", "publication_venue_of_publicati", "publication_year_of_publicatio", "collection_oid")
);
alter table "public"."publication_collection"   add constraint fk_publication_collection_publ foreign key ("publication_oid", "publication_title", "publication_venue_of_publicati", "publication_year_of_publicatio") references "public"."publication" ("oid", "title", "venue_of_publication", "year_of_publication");
alter table "public"."publication_collection"   add constraint fk_publication_collection_coll foreign key ("collection_oid") references "public"."collection" ("oid");


