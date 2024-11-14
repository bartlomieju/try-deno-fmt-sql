SELECT
  COUNT(created_at)
FROM
  packages
WHERE
  scope = $1
  AND (
    $2 = TRUE
    OR packages.is_archived = false
  );
