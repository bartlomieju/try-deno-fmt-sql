SELECT
  COUNT(created_at)
FROM
  packages
WHERE
  scope = $1;
