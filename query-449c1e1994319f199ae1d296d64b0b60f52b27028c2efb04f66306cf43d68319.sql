SELECT
  user_id
FROM
  (
    SELECT
      scope_members.user_id AS "user_id",
      users.scope_limit AS "scope_limit",
      scope_members.created_at AS "created_at",
      (
        SELECT
          COUNT(created_at)
        FROM
          scopes
        WHERE
          creator = users.id
      ) AS "scope_usage"
    FROM
      scope_members
      LEFT JOIN users ON scope_members.user_id = users.id
    WHERE
      scope_members.scope = $1
      AND scope_members.is_admin = TRUE
  ) AS subquery
WHERE
  "scope_usage" < scope_limit
ORDER BY
  created_at
LIMIT
  1;
