SELECT
  COUNT(*) AS count_total,
  COUNT(
    CASE
      WHEN created_at >= NOW() - INTERVAL '1 DAY' THEN 1
    END
  ) AS count_1d,
  COUNT(
    CASE
      WHEN created_at >= NOW() - INTERVAL '7 DAY' THEN 1
    END
  ) AS count_7d,
  COUNT(
    CASE
      WHEN created_at >= NOW() - INTERVAL '30 DAY' THEN 1
    END
  ) AS count_30d
FROM
  package_versions;
