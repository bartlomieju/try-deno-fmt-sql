DELETE FROM
  packages
WHERE
  scope = $1
  AND name = $2
