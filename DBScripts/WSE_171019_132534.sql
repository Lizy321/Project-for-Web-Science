-- Comment [ent3]
create table "public"."comment" (
   "oid"  int4  not null,
   "title"  varchar(255),
   "timestamp"  timestamp,
   "content"  text,
  primary key ("oid")
);


-- Comment_Publication [rel3]
alter table "public"."comment"  add column  "publication_oid"  int4;
alter table "public"."comment"   add constraint fk_comment_publication foreign key ("publication_oid") references "public"."publication" ("oid");


-- Researcher gives comments [rel4]
alter table "public"."comment"  add column  "researcher_oid"  int4;
alter table "public"."comment"   add constraint fk_comment_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");


