SELECT id, hash, user_id, type "type: _", description, expires_at, permissions "permissions: _", updated_at, created_at
FROM tokens
WHERE user_id = $1 AND (expires_at > now() - interval '1 day' OR expires_at IS NULL)
ORDER BY expires_at DESC NULLS FIRST, created_at DESC
      