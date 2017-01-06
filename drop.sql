(
select
  'ALTER TABLE ' + tc.table_name + ' DROP CONSTRAINT ' + tc.constraint_name + ';'
from
  INFORMATION_SCHEMA.TABLES t
  ,INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
where
  t.table_name = tc.table_name
  and tc.constraint_name not like '%_pk'
  and tc.constraint_name not like 'pk_%'
  and t.table_catalog='samoloty'
) UNION (
select
  'DROP TABLE ' + t.table_name + ';'
from
  INFORMATION_SCHEMA.TABLES t
where
  t.table_catalog='samoloty'
)