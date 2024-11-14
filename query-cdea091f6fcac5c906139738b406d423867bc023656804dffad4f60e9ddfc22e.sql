SELECT
  package_scope AS "scope: ScopeName",
  package_name AS "name: PackageName",
  (ARRAY_AGG(DISTINCT package_version)) [:$5] AS "versions!: Vec<Version>",
  COUNT(DISTINCT package_version) AS "total_versions!"
FROM
  package_version_dependencies
WHERE
  dependency_kind = $1
  AND dependency_name = $2
GROUP BY
  package_scope,
  package_name
ORDER BY
  package_scope ASC,
  package_name ASC OFFSET $3
LIMIT
  $4;
