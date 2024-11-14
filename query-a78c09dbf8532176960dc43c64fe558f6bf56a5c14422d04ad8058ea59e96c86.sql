INSERT INTO
  package_version_dependencies (
    package_scope,
    package_name,
    package_version,
    dependency_kind,
    dependency_name,
    dependency_constraint,
    dependency_path
  )
VALUES
  ($1, $2, $3, $4, $5, $6, $7)
RETURNING
  package_scope AS "package_scope: ScopeName",
  package_name AS "package_name: PackageName",
  package_version AS "package_version: Version",
  dependency_kind AS "dependency_kind: DependencyKind",
  dependency_name,
  dependency_constraint,
  dependency_path,
  updated_at,
  created_at
