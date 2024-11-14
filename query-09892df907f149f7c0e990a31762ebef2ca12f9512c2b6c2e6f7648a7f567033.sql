INSERT INTO scope_invites (scope, target_user_id, requesting_user_id)
VALUES ($1, $2, $3)
RETURNING scope as "scope: ScopeName", target_user_id, requesting_user_id, updated_at, created_at