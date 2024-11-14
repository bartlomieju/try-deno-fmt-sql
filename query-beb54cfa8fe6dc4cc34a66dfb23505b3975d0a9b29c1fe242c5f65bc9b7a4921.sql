DELETE FROM oauth_states
WHERE csrf_token = $1
RETURNING csrf_token, pkce_code_verifier, redirect_url, updated_at, created_at