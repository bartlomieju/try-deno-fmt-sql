SELECT id, hash, user_id, type "type: _", description, expires_at, permissions "permissions: _", updated_at, created_at FROM tokens WHERE hash = $1