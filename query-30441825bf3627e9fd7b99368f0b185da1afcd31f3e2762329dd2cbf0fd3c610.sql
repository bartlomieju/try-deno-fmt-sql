INSERT INTO package_versions (scope, name, version, user_id, readme_path, exports, uses_npm, meta)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
RETURNING scope as "scope: ScopeName", name as "name: PackageName", version as "version: Version", user_id, readme_path as "readme_path: PackagePath", exports as "exports: ExportsMap", is_yanked, uses_npm, meta as "meta: PackageVersionMeta", updated_at, created_at, rekor_log_id,
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