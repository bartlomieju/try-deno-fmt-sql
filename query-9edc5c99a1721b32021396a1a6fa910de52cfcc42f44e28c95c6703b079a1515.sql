SELECT
  COUNT(scopes.created_at)
FROM
  scopes
  LEFT JOIN users ON scopes.creator = users.id
WHERE
  scopes.scope ILIKE $1
  OR users.name ILIKE $2;
