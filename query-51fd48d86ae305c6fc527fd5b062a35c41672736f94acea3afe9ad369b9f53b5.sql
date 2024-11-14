INSERT INTO
  package_files (scope, name, version, path, size, CHECKSUM)
VALUES
  ($1, $2, $3, $4, $5, $6)
RETURNING
  scope AS "scope: ScopeName",
  name AS "name: PackageName",
  version AS "version: Version",
  path AS "path: PackagePath",
  size,
  CHECKSUM,
  updated_at,
  created_at
