UPDATE scope_members
SET is_admin = $1
WHERE scope = $2 AND user_id = $3
RETURNING scope as "scope: ScopeName", user_id, is_admin, updated_at, created_at,
(SELECT creator FROM scopes WHERE scope = $2) AS "scope_creator!"