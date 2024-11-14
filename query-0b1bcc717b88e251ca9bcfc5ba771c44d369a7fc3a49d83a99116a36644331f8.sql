WITH usage AS (
  SELECT
    (SELECT COUNT(created_at) FROM packages WHERE scope = $1) AS package,
    (SELECT COUNT(created_at) FROM packages WHERE scope = $1 AND created_at > now() - '1 week'::interval) AS new_package_per_week,
    (SELECT COUNT(created_at) FROM publishing_tasks WHERE package_scope = $1 AND created_at > now() - '1 week'::interval) AS publish_attempts_per_week
)
SELECT
scopes.scope as "scope_scope: ScopeName",
scopes.creator as "scope_creator",
scopes.package_limit as "scope_package_limit",
scopes.new_package_per_week_limit as "scope_new_package_per_week_limit",
scopes.publish_attempts_per_week_limit as "scope_publish_attempts_per_week_limit",
scopes.verify_oidc_actor as "scope_verify_oidc_actor",
scopes.require_publishing_from_ci as "scope_require_publishing_from_ci",
scopes.updated_at as "scope_updated_at",
scopes.created_at as "scope_created_at",
users.id as "user_id", users.name as "user_name", users.avatar_url as "user_avatar_url", users.github_id as "user_github_id", users.updated_at as "user_updated_at", users.created_at as "user_created_at",
usage.package as "usage_package", usage.new_package_per_week as "usage_new_package_per_week", usage.publish_attempts_per_week as "usage_publish_attempts_per_week"
FROM scopes
LEFT JOIN users ON scopes.creator = users.id
CROSS JOIN usage
WHERE scopes.scope = $1
