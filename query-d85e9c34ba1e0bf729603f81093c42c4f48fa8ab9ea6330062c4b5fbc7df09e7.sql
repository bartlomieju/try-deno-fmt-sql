SELECT
  version AS "version: Version"
FROM
  package_versions
WHERE
  scope = $1
  AND name = $2
  AND version NOT LIKE '%-%'
  AND is_yanked = false
ORDER BY
  version DESC
