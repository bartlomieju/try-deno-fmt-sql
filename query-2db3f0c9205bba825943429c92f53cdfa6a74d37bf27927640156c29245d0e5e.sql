SELECT
  COUNT(created_at)
FROM
  publishing_tasks
WHERE
  package_scope ILIKE $1
  OR package_name ILIKE $1
  OR package_version ILIKE $1;
