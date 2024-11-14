SELECT
  COUNT(created_at)
FROM
  packages
WHERE
  scope = $1
  AND created_at > NOW() - '1 week' :: INTERVAL;
