INSERT INTO
  authorizations (
    exchange_token,
    code,
    challenge,
    permissions,
    expires_at
  )
VALUES
  ($1, $2, $3, $4, $5)
RETURNING
  exchange_token,
  code,
  challenge,
  permissions "permissions: _",
  approved,
  user_id,
  expires_at,
  created_at,
  updated_at
