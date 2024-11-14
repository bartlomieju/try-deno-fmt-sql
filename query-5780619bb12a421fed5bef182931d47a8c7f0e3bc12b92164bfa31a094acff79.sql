SELECT
  COUNT(created_at)
FROM
  publishing_tasks
WHERE
  package_scope = $1
  AND created_at > NOW() - '1 week' :: INTERVAL;
