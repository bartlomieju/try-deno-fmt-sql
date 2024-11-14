DELETE FROM
  authorizations
WHERE
  exchange_token = $1
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
