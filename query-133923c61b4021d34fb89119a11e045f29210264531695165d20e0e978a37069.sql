WITH ins_scope AS (
  INSERT INTO
    scopes (scope, creator)
  VALUES
    ($1, $2)
  RETURNING
    scope,
    creator,
    package_limit,
    new_package_per_week_limit,
    publish_attempts_per_week_limit,
    verify_oidc_actor,
    require_publishing_from_ci,
    updated_at,
    created_at
),
ins_member AS (
  INSERT INTO
    scope_members (scope, user_id, is_admin)
  VALUES
    ($1, $2, TRUE)
)
SELECT
  scope AS "scope: ScopeName",
  creator,
  package_limit,
  new_package_per_week_limit,
  publish_attempts_per_week_limit,
  verify_oidc_actor,
  require_publishing_from_ci,
  updated_at,
  created_at
FROM
  ins_scope
