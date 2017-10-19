-- Writer and publication [rel1]
create table "public"."writer_and_publication" (
   "publication_oid"  int4 not null,
   "researcher_oid"  int4 not null,
  primary key ("publication_oid", "researcher_oid")
);
alter table "public"."writer_and_publication"   add constraint fk_writer_and_publication_publ foreign key ("publication_oid") references "public"."publication" ("oid");
alter table "public"."writer_and_publication"   add constraint fk_writer_and_publication_rese foreign key ("researcher_oid") references "public"."researcher" ("oid");


