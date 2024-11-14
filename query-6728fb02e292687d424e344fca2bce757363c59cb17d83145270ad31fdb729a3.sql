INSERT INTO
  aliases (
    name,
    major_version,
    target_jsr_scope,
    target_jsr_name,
    target_npm
  )
VALUES
  ($1, $2, $3, $4, $5)
RETURNING
  name,
  major_version,
  target_jsr_scope AS "target_jsr_scope: ScopeName",
  target_jsr_name AS "target_jsr_name: PackageName",
  target_npm,
  updated_at,
  created_at
