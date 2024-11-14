UPDATE
  scopes
SET
  new_package_per_week_limit = $1
WHERE
  scope = $2
