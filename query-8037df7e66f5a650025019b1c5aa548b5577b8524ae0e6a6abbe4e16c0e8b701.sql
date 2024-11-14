INSERT INTO github_identities (github_id, access_token, access_token_expires_at, refresh_token, refresh_token_expires_at) VALUES ($1, $2, $3, $4, $5)
ON CONFLICT (github_id) DO
UPDATE SET access_token = $2, access_token_expires_at = $3, refresh_token = $4, refresh_token_expires_at = $5
RETURNING github_id, access_token, access_token_expires_at, refresh_token, refresh_token_expires_at, updated_at, created_at