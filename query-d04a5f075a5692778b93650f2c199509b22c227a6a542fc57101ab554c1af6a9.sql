UPDATE
  publishing_tasks
SET
  STATUS = $1,
  error = $2
WHERE
  id = $3
  AND STATUS = $4
RETURNING
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
