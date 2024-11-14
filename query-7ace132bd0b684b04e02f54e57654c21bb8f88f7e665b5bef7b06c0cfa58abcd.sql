SELECT
  publishing_tasks.id,
  publishing_tasks.status AS "status: PublishingTaskStatus",
  publishing_tasks.error AS "error: PublishingTaskError",
  publishing_tasks.user_id,
  publishing_tasks.package_scope AS "package_scope: ScopeName",
  publishing_tasks.package_name AS "package_name: PackageName",
  publishing_tasks.package_version AS "package_version: Version",
  publishing_tasks.config_file AS "config_file: PackagePath",
  publishing_tasks.created_at,
  publishing_tasks.updated_at
FROM
  publishing_tasks
  JOIN packages ON publishing_tasks.package_scope = packages.scope
  AND publishing_tasks.package_name = packages.name
WHERE
  publishing_tasks.package_scope = $1
  AND publishing_tasks.package_name = $2
  AND publishing_tasks.created_at >= packages.created_at
ORDER BY
  publishing_tasks.package_version DESC
