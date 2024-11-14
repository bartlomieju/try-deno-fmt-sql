SELECT
  scope AS "scope: ScopeName",
  name AS "name: PackageName",
  version AS "version: Version",
  path AS "path: PackagePath",
  size,
  CHECKSUM,
  updated_at,
  created_at
FROM
  package_files
WHERE
  scope = $1
  AND name = $2
  AND version = $3
  AND path = $4
