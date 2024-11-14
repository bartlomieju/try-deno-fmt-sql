SELECT package_versions.scope as "package_version_scope: ScopeName", package_versions.name as "package_version_name: PackageName", package_versions.version as "package_version_version: Version", package_versions.user_id as "package_version_user_id", package_versions.readme_path as "package_version_readme_path: PackagePath", package_versions.exports as "package_version_exports: ExportsMap", package_versions.is_yanked as "package_version_is_yanked", package_versions.uses_npm as "package_version_uses_npm", package_versions.meta as "package_version_meta: PackageVersionMeta", package_versions.updated_at as "package_version_updated_at", package_versions.created_at as "package_version_created_at", package_versions.rekor_log_id as "package_version_rekor_log_id",
(SELECT COUNT(*)
  FROM package_versions AS pv
  WHERE pv.scope = package_versions.scope
  AND pv.name = package_versions.name
  AND pv.version > package_versions.version
  AND pv.version NOT LIKE '%-%'
  AND pv.is_yanked = false) as "package_version_newer_versions_count!",
(SELECT COALESCE(SUM(dl.count), 0)
  FROM version_download_counts_24h as dl
  WHERE dl.scope = package_versions.scope
  AND dl.package = package_versions.name
  AND dl.version = package_versions.version) as "package_version_lifetime_download_count!",
users.id as "user_id?", users.name as "user_name?", users.avatar_url as "user_avatar_url?", users.github_id as "user_github_id", users.updated_at as "user_updated_at?", users.created_at as "user_created_at?"
FROM package_versions
LEFT JOIN users ON package_versions.user_id = users.id
WHERE package_versions.scope = $1 AND package_versions.name = $2
ORDER BY package_versions.version DESC