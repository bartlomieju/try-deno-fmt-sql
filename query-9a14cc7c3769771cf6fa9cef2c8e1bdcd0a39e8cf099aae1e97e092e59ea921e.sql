SELECT
  COUNT(DISTINCT (packages.name, packages.scope)) AS count_total,
  COUNT(
    DISTINCT CASE
      WHEN package_versions.created_at >= NOW() - INTERVAL '1 day' THEN (packages.name, packages.scope)
    END
  ) AS count_1d,
  COUNT(
    DISTINCT CASE
      WHEN package_versions.created_at >= NOW() - INTERVAL '7 day' THEN (packages.name, packages.scope)
    END
  ) AS count_7d,
  COUNT(
    DISTINCT CASE
      WHEN package_versions.created_at >= NOW() - INTERVAL '30 day' THEN (packages.name, packages.scope)
    END
  ) AS count_30d
FROM
  packages
  LEFT JOIN package_versions ON packages.name = package_versions.name
  AND packages.scope = package_versions.scope
WHERE
  package_versions.name IS NOT NULL
