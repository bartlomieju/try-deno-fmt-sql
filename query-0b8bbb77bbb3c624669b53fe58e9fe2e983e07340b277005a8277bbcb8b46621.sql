SELECT
  scope AS "scope: ScopeName",
  name AS "name: PackageName",
  version AS "version: Version"
FROM
  package_versions
WHERE
  NOT EXISTS (
    SELECT
      1
    FROM
      npm_tarballs
    WHERE
      npm_tarballs.scope = package_versions.scope
      AND npm_tarballs.name = package_versions.name
      AND npm_tarballs.version = package_versions.version
      AND npm_tarballs.revision = $1
  )
ORDER BY
  created_at ASC
LIMIT
  1000
