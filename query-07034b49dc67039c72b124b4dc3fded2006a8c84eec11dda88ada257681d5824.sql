UPDATE packages
SET github_repository_id = NULL
WHERE scope = $1 AND name = $2
RETURNING scope as "scope: ScopeName", name as "name: PackageName", description, github_repository_id, runtime_compat as "runtime_compat: RuntimeCompat", when_featured, is_archived, updated_at, created_at,
  (SELECT COUNT(created_at) FROM package_versions WHERE scope = scope AND name = name) as "version_count!",
  (SELECT version FROM package_versions WHERE scope = scope AND name = name ORDER BY version DESC LIMIT 1) as "latest_version"