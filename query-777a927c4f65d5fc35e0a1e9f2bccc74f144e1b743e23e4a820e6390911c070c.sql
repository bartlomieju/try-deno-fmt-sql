SELECT scope as "scope: ScopeName", name as "name: PackageName", version as "version: Version", path as "path: PackagePath", size, checksum, updated_at, created_at
FROM package_files
WHERE scope = $1 AND name = $2 AND version = $3 AND path = $4