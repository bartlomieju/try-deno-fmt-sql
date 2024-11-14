SELECT
  name,
  major_version,
  target_jsr_scope AS "target_jsr_scope: ScopeName",
  target_jsr_name AS "target_jsr_name: PackageName",
  target_npm,
  updated_at,
  created_at
FROM
  aliases
WHERE
  name = $1
