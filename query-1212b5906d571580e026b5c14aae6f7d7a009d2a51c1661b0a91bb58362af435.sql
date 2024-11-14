SELECT
  scope AS "scope: ScopeName",
  name AS "name: PackageName",
  version AS "version: Version",
  revision,
  sha1,
  sha512,
  size,
  updated_at,
  created_at
FROM
  npm_tarballs
WHERE
  scope = $1
  AND name = $2
  AND version = $3
ORDER BY
  revision DESC
LIMIT
  1
