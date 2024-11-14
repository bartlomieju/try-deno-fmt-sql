SELECT id, name, email, avatar_url, updated_at, created_at, github_id, is_blocked, is_staff, scope_limit,
  (SELECT COUNT(created_at) FROM scope_invites WHERE target_user_id = id) as "invite_count!",
  (SELECT COUNT(created_at) FROM scopes WHERE creator = id) as "scope_usage!"
FROM users WHERE (name ILIKE $1 OR email ILIKE $1) AND (id = $2 OR $2 IS NULL) ORDER BY created_at DESC OFFSET $3 LIMIT $4