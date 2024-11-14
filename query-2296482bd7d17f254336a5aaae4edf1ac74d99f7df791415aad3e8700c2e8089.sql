
SELECT COUNT(created_at) FROM packages WHERE scope = $1 AND created_at > now() - '1 week'::interval;
    