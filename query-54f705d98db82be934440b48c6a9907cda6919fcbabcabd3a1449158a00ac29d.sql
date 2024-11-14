SELECT scope as "scope: ScopeName", name as "name: PackageName", version as "version: Version", revision, sha1, sha512, size, updated_at, created_at
FROM npm_tarballs
WHERE scope = $1 AND name = $2 AND version = $3 AND revision = $4
LIMIT 1