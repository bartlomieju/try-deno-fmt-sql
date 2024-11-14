SELECT
  (
    SELECT
      COUNT(created_at)
    FROM
      packages
    WHERE
      scope = $1
      AND created_at > NOW() - '1 week' :: INTERVAL
  ) AS new_package_per_week,
  (
    SELECT
      COUNT(created_at)
    FROM
      packages
    WHERE
      scope = $1
  ) AS package,
  (
    SELECT
      COUNT(created_at)
    FROM
      publishing_tasks
    WHERE
      package_scope = $1
      AND created_at > NOW() - '1 week' :: INTERVAL
  ) AS publish_attempts_per_week;
