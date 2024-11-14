SELECT
  scopes.scope AS "scope: ScopeName",
  scopes.creator,
  scopes.package_limit,
  scopes.new_package_per_week_limit,
  scopes.publish_attempts_per_week_limit,
  scopes.verify_oidc_actor,
  scopes.require_publishing_from_ci,
  scopes.updated_at,
  scopes.created_at
FROM
  scopes
  LEFT JOIN scope_members ON scope_members.scope = scopes.scope
WHERE
  user_id = $1
