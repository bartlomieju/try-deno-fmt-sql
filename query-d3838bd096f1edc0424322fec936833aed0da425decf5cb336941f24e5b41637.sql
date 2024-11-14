DELETE FROM
  scope_members
WHERE
  scope = $1
  AND user_id = $2
RETURNING
  scope AS "scope: ScopeName",
  user_id,
  is_admin,
  updated_at,
  created_at,
  (
    SELECT
      creator
    FROM
      scopes
    WHERE
      scope = $1
  ) AS "scope_creator!"
