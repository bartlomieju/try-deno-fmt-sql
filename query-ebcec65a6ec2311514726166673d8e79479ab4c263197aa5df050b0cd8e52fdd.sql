SELECT
  package_scope AS "package_scope: ScopeName",
  package_name AS "package_name: PackageName",
  package_version AS "package_version: Version",
  dependency_kind AS "dependency_kind: DependencyKind",
  dependency_name,
  dependency_constraint,
  dependency_path,
  updated_at,
  created_at
FROM
  package_version_dependencies
WHERE
  package_scope = $1
  AND package_name = $2
  AND package_version = $3
ORDER BY
  dependency_kind ASC,
  dependency_name ASC,
  dependency_constraint ASC,
  dependency_path ASC
