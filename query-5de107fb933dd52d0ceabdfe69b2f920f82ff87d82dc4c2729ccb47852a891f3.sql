SELECT id, status as "status: PublishingTaskStatus", error as "error: PublishingTaskError", user_id, package_scope as "package_scope: ScopeName", package_name as "package_name: PackageName", package_version as "package_version: Version", config_file as "config_file: PackagePath", created_at, updated_at
FROM publishing_tasks
WHERE package_scope = $1 AND package_name = $2 AND package_version = $3 AND status != 'failure'
LIMIT 1