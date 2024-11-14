INSERT INTO github_repositories (id, owner, name)
VALUES ($1, $2, $3)
ON CONFLICT(id) DO UPDATE
SET owner = $2, name = $3
RETURNING id, owner, name, updated_at, created_at