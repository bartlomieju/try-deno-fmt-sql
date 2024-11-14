SELECT
  scope AS "scope: ScopeName",
  updated_at,
  (
    SELECT
      updated_at
    FROM
      packages
    WHERE
      scope = scope
    ORDER BY
      updated_At DESC
    LIMIT
      1
  ) AS "latest_package_created_at"
FROM
  scopes
ORDER BY
  scope ASC
LIMIT
  50000
