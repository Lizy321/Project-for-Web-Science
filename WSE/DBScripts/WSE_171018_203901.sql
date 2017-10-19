-- Owner of a Collection [rel4]
alter table "public"."collection"  add column  "researcher_oid"  int4;
alter table "public"."collection"   add constraint fk_collection_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");


