WITH USAGE AS (
  SELECT
    (
      SELECT
        COUNT(created_at)
      FROM
        packages
      WHERE
        scope = $2
    ) AS package,
    (
      SELECT
        COUNT(created_at)
      FROM
        packages
      WHERE
        scope = $2
        AND created_at > NOW() - '1 week' :: INTERVAL
    ) AS new_package_per_week,
    (
      SELECT
        COUNT(created_at)
      FROM
        publishing_tasks
      WHERE
        package_scope = $2
        AND created_at > NOW() - '1 week' :: INTERVAL
    ) AS publish_attempts_per_week
)
SELECT
  scopes.scope AS "scope_scope: ScopeName",
  scopes.creator AS "scope_creator",
  scopes.package_limit AS "scope_package_limit",
  scopes.new_package_per_week_limit AS "scope_new_package_per_week_limit",
  scopes.publish_attempts_per_week_limit AS "scope_publish_attempts_per_week_limit",
  scopes.updated_at AS "scope_updated_at",
  scopes.verify_oidc_actor AS "scope_verify_oidc_actor",
  scopes.require_publishing_from_ci AS "scope_require_publishing_from_ci",
  scopes.created_at AS "scope_created_at",
  users.id AS "user_id",
  users.name AS "user_name",
  users.avatar_url AS "user_avatar_url",
  users.github_id AS "user_github_id",
  users.updated_at AS "user_updated_at",
  users.created_at AS "user_created_at",
  USAGE.package AS "usage_package",
  USAGE.new_package_per_week AS "usage_new_package_per_week",
  USAGE.publish_attempts_per_week AS "usage_publish_attempts_per_week"
FROM
  scopes
  LEFT JOIN users ON scopes.creator = users.id
  CROSS JOIN USAGE
WHERE
  scopes.scope ILIKE $1
  OR users.name ILIKE $2
ORDER BY
  scopes.created_at DESC OFFSET $3
LIMIT
  $4
