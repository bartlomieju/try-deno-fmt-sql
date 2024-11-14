SELECT id, name, avatar_url, github_id, updated_at, created_at
FROM users
WHERE id = $1