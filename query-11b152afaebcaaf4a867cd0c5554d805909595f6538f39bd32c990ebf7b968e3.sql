UPDATE authorizations
SET approved = $1, user_id = $2
WHERE code = $3 AND approved IS NULL