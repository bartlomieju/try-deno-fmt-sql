SELECT
  id,
  STATUS AS "status: PublishingTaskStatus",
  error AS "error: PublishingTaskError",
  user_id,
  package_scope AS "package_scope: ScopeName",
  package_name AS "package_name: PackageName",
  package_version AS "package_version: Version",
  config_file AS "config_file: PackagePath",
  created_at,
  updated_at
FROM
  publishing_tasks
WHERE
  package_scope = $1
  AND package_name = $2
  AND package_version = $3
  AND STATUS != 'failure'
LIMIT
  1
