SELECT
  package_versions.scope AS "scope: ScopeName",
  package_versions.name AS "name: PackageName",
  package_versions.version AS "version: Version",
  package_versions.user_id,
  package_versions.readme_path AS "readme_path: PackagePath",
  package_versions.exports AS "exports: ExportsMap",
  package_versions.is_yanked,
  package_versions.uses_npm,
  package_versions.meta AS "meta: PackageVersionMeta",
  package_versions.updated_at,
  package_versions.created_at,
  package_versions.rekor_log_id,
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
  ) AS "newer_versions_count!",
  (
    SELECT
      COALESCE(SUM(dl.count), 0)
    FROM
      version_download_counts_24h AS dl
    WHERE
      dl.scope = package_versions.scope
      AND dl.package = package_versions.name
      AND dl.version = package_versions.version
  ) AS "lifetime_download_count!"
FROM
  package_versions
  JOIN packages ON packages.scope = package_versions.scope
  AND packages.name = package_versions.name
WHERE
  NOT packages.is_archived
ORDER BY
  package_versions.created_at DESC
LIMIT
  10
