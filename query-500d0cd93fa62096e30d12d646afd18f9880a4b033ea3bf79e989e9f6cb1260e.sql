SELECT
scope as "scope: ScopeName",
creator,
package_limit,
new_package_per_week_limit,
publish_attempts_per_week_limit,
verify_oidc_actor,
require_publishing_from_ci,
updated_at,
created_at
FROM scopes WHERE scope = $1