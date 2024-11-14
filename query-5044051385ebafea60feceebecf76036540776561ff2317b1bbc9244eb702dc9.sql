SELECT
  COUNT(created_at) AS "count!"
FROM
  users
WHERE
  (
    name ILIKE $1
    OR email ILIKE $1
  )
  AND (
    id = $2
    OR $2 IS NULL
  );
