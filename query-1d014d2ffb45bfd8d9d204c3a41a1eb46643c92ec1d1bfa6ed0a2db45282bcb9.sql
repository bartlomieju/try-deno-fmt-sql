UPDATE
  packages
SET
  when_featured = $3
WHERE
  scope = $1
  AND name = $2
RETURNING
  scope AS "scope: ScopeName",
  name AS "name: PackageName",
  description,
  github_repository_id,
  runtime_compat AS "runtime_compat: RuntimeCompat",
  when_featured,
  is_archived,
  updated_at,
  created_at,
  (
    SELECT
      COUNT(created_at)
    FROM
      package_versions
    WHERE
      scope = scope
      AND name = name
  ) AS "version_count!",
  (
    SELECT
      version
    FROM
      package_versions
    WHERE
      scope = scope
      AND name = name
    ORDER BY
      version DESC
    LIMIT
      1
  ) AS "latest_version"
