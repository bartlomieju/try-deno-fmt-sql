SELECT
      name, major_version,
      target_jsr_scope as "target_jsr_scope: ScopeName",
      target_jsr_name as "target_jsr_name: PackageName",
      target_npm,
      updated_at,
      created_at
FROM aliases
WHERE name = $1