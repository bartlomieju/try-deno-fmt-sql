INSERT INTO oauth_states (csrf_token, pkce_code_verifier, redirect_url)
VALUES ($1, $2, $3)
RETURNING csrf_token, pkce_code_verifier, redirect_url, updated_at, created_at