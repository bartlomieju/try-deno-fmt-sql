SELECT exchange_token, code, challenge, permissions "permissions: _", approved, user_id, expires_at, created_at, updated_at
FROM authorizations
WHERE code = $1