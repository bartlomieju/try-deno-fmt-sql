DELETE FROM
  scope_invites
WHERE
  target_user_id = $1
  AND scope = $2
