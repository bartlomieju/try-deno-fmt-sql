SELECT scope_members.scope as "scope_member_scope: ScopeName", scope_members.user_id as "scope_member_user_id", scope_members.is_admin as "scope_member_is_admin", scope_members.updated_at as "scope_member_updated_at", scope_members.created_at as "scope_member_created_at",
  users.id as "user_id", users.name as "user_name", users.avatar_url as "user_avatar_url", users.github_id as "user_github_id", users.updated_at as "user_updated_at", users.created_at as "user_created_at"
FROM scope_members
LEFT JOIN users ON scope_members.user_id = users.id
WHERE scope = $1
ORDER BY users.name ASC