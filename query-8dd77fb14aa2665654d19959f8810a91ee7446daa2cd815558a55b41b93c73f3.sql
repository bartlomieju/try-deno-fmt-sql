INSERT INTO
  scope_members (scope, user_id)
VALUES
  ($1, $2)
RETURNING
  scope AS "scope: ScopeName",
  user_id,
  is_admin,
  updated_at,
  created_at
