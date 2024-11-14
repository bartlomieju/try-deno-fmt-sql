SELECT
  publish_attempts_per_week_limit
FROM
  scopes
WHERE
  scope = $1;
