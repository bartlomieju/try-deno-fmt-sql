SELECT
  packages.scope "package_scope: ScopeName",
  packages.name "package_name: PackageName",
  packages.description "package_description",
  packages.github_repository_id "package_github_repository_id",
  packages.runtime_compat AS "package_runtime_compat: RuntimeCompat",
  packages.when_featured "package_when_featured",
  packages.is_archived "package_is_archived",
  packages.updated_at "package_updated_at",
  packages.created_at "package_created_at",
  (
    SELECT
      COUNT(created_at)
    FROM
      package_versions
    WHERE
      scope = packages.scope
      AND name = packages.name
  ) AS "package_version_count!",
  (
    SELECT
      version
    FROM
      package_versions
    WHERE
      scope = packages.scope
      AND name = packages.name
      AND version NOT LIKE '%-%'
      AND is_yanked = false
    ORDER BY
      version DESC
    LIMIT
      1
  ) AS "package_latest_version",
  (
    SELECT
      meta
    FROM
      package_versions
    WHERE
      scope = packages.scope
      AND name = packages.name
      AND version NOT LIKE '%-%'
      AND is_yanked = false
    ORDER BY
      version DESC
    LIMIT
      1
  ) AS "package_version_meta: PackageVersionMeta",
  github_repositories.id "github_repository_id?",
  github_repositories.owner "github_repository_owner?",
  github_repositories.name "github_repository_name?",
  github_repositories.updated_at "github_repository_updated_at?",
  github_repositories.created_at "github_repository_created_at?"
FROM
  packages
  LEFT JOIN github_repositories ON packages.github_repository_id = github_repositories.id
WHERE
  packages.scope = $1
  AND (
    $2 = TRUE
    OR packages.is_archived = false
  )
ORDER BY
  packages.name OFFSET $3
LIMIT
  $4
