SELECT
  COUNT(user_id)
FROM
  scope_members
WHERE
  scope = $1
  AND is_admin = TRUE
