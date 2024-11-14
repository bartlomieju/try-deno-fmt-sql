INSERT INTO
  publishing_tasks (
    user_id,
    package_scope,
    package_name,
    package_version,
    config_file
  )
VALUES
  ($1, $2, $3, $4, $5)
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
