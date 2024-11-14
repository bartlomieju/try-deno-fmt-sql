UPDATE package_versions
SET rekor_log_id = $1, meta = jsonb_set_lax(meta, '{hasProvenance}', 'true'::jsonb, true)
WHERE scope = $2 AND name = $3 AND version = $4 AND rekor_log_id IS NULL AND created_at > now() - '2 minute'::interval