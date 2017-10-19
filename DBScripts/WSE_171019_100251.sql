-- REL FK: groups [User2Group]
alter table "public"."user_group"   add constraint fk_user_group_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");


-- REL FK: Writer [rel1#role1]
alter table "public"."writer_and_publication"   add constraint fk_writer_and_publication_publ foreign key ("publication_oid") references "public"."publication" ("oid");


-- REL FK: Writes [rel1#role2]
alter table "public"."writer_and_publication"   add constraint fk_writer_and_publication_rese foreign key ("researcher_oid") references "public"."researcher" ("oid");


-- REL FK: Owner [rel2#role3]
alter table "public"."publication"   add constraint fk_researcher_publication foreign key ("oid") references "public"."publication" ("oid");


