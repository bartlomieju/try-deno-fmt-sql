SELECT
  package_versions.scope AS "package_version_scope: ScopeName",
  package_versions.name AS "package_version_name: PackageName",
  package_versions.version AS "package_version_version: Version",
  package_versions.user_id AS "package_version_user_id",
  package_versions.readme_path AS "package_version_readme_path: PackagePath",
  package_versions.exports AS "package_version_exports: ExportsMap",
  package_versions.is_yanked AS "package_version_is_yanked",
  package_versions.uses_npm AS "package_version_uses_npm",
  package_versions.meta AS "package_version_meta: PackageVersionMeta",
  package_versions.updated_at AS "package_version_updated_at",
  package_versions.created_at AS "package_version_created_at",
  package_versions.rekor_log_id AS "package_version_rekor_log_id",
  (
    SELECT
      COUNT(*)
    FROM
      package_versions AS pv
    WHERE
      pv.scope = package_versions.scope
      AND pv.name = package_versions.name
      AND pv.version > package_versions.version
      AND pv.version NOT LIKE '%-%'
      AND pv.is_yanked = false
  ) AS "package_version_newer_versions_count!",
  (
    SELECT
      COALESCE(SUM(dl.count), 0)
    FROM
      version_download_counts_24h AS dl
    WHERE
      dl.scope = package_versions.scope
      AND dl.package = package_versions.name
      AND dl.version = package_versions.version
  ) AS "package_version_lifetime_download_count!",
  users.id AS "user_id?",
  users.name AS "user_name?",
  users.avatar_url AS "user_avatar_url?",
  users.github_id AS "user_github_id",
  users.updated_at AS "user_updated_at?",
  users.created_at AS "user_created_at?"
FROM
  package_versions
  LEFT JOIN users ON package_versions.user_id = users.id
WHERE
  package_versions.scope = $1
  AND package_versions.name = $2
ORDER BY
  package_versions.version DESC
