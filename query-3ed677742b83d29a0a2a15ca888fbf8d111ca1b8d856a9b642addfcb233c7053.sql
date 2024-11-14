INSERT INTO npm_tarballs (scope, name, version, revision, sha1, sha512, size)
VALUES ($1, $2, $3, $4, $5, $6, $7)
RETURNING scope as "scope: ScopeName", name as "name: PackageName", version as "version: Version", revision, sha1, sha512, size, updated_at, created_at