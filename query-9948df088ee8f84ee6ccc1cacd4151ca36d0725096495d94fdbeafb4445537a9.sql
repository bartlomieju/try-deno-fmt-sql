SELECT github_id, access_token, access_token_expires_at, refresh_token, refresh_token_expires_at, updated_at, created_at
FROM github_identities
WHERE github_id = $1