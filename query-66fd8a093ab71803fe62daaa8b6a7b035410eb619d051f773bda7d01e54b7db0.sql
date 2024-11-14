SELECT
  scope AS "scope: ScopeName",
  name AS "name: PackageName",
  updated_at,
  (
    SELECT
      created_at
    FROM
      package_versions
    WHERE
      scope = scope
      AND name = name
    ORDER BY
      version DESC
    LIMIT
      1
  ) AS "latest_version_updated_at!"
FROM
  packages
WHERE
  (
    SELECT
      version
    FROM
      package_versions
    WHERE
      scope = scope
      AND name = name
    ORDER BY
      version DESC
    LIMIT
      1
  ) IS NOT NULL
ORDER BY
  scope ASC,
  name ASC
LIMIT
  50000
