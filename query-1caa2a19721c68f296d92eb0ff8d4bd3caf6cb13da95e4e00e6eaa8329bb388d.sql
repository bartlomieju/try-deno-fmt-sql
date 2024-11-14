SELECT
  COUNT(DISTINCT (package_scope, package_name))
FROM
  package_version_dependencies
WHERE
  dependency_kind = $1
  AND dependency_name = $2;
