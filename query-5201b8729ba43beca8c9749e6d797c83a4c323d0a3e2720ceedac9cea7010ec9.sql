INSERT INTO tokens (hash, user_id, type, description, expires_at, permissions)
VALUES ($1, $2, $3, $4, $5, $6)
RETURNING id, hash, user_id, type "type: _", description, expires_at, permissions "permissions: _", updated_at, created_at