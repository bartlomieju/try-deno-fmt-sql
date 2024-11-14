INSERT INTO package_files (scope, name, version, path, size, checksum)
VALUES ($1, $2, $3, $4, $5, $6)
RETURNING scope as "scope: ScopeName", name as "name: PackageName", version as "version: Version", path as "path: PackagePath", size, checksum, updated_at, created_at