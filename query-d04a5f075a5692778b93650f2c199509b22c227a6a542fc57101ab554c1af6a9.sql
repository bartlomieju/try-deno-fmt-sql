UPDATE publishing_tasks
SET status = $1, error = $2
WHERE id = $3 AND status = $4
RETURNING id, status as "status: PublishingTaskStatus", error as "error: PublishingTaskError", user_id, package_scope as "package_scope: ScopeName", package_name as "package_name: PackageName", package_version as "package_version: Version", config_file as "config_file: PackagePath", created_at, updated_at