SELECT package_versions.scope as "scope: ScopeName", package_versions.name as "name: PackageName", package_versions.version as "version: Version", package_versions.user_id, package_versions.readme_path as "readme_path: PackagePath", package_versions.exports as "exports: ExportsMap", package_versions.is_yanked, package_versions.uses_npm, package_versions.meta as "meta: PackageVersionMeta", package_versions.updated_at, package_versions.created_at, package_versions.rekor_log_id,
(SELECT COUNT(*)
  FROM package_versions AS pv
  WHERE pv.scope = package_versions.scope
  AND pv.name = package_versions.name
  AND pv.version > package_versions.version
  AND pv.version NOT LIKE '%-%'
  AND pv.is_yanked = false) as "newer_versions_count!",
(SELECT COALESCE(SUM(dl.count), 0)
  FROM version_download_counts_24h as dl
  WHERE dl.scope = package_versions.scope
  AND dl.package = package_versions.name
  AND dl.version = package_versions.version) as "lifetime_download_count!"
FROM package_versions
JOIN packages ON packages.scope = package_versions.scope AND packages.name = package_versions.name
WHERE NOT packages.is_archived
ORDER BY package_versions.created_at DESC
LIMIT 10