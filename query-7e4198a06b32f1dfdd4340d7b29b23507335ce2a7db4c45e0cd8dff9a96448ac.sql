UPDATE
  scopes
SET
  publish_attempts_per_week_limit = $1
WHERE
  scope = $2
