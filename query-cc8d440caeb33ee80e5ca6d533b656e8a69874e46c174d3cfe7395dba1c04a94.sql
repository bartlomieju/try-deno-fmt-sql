SELECT scope as "scope: ScopeName", user_id, is_admin, updated_at, created_at
    FROM scope_members WHERE scope = $1 AND user_id = $2