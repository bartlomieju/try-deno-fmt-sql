SELECT
  COUNT(created_at)
FROM
  packages
WHERE
  (
    packages.scope ILIKE $1
    OR packages.name ILIKE $2
  )
  AND (
    packages.github_repository_id = $3
    OR $3 IS NULL
  );
