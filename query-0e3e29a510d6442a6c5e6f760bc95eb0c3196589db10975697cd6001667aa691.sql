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
