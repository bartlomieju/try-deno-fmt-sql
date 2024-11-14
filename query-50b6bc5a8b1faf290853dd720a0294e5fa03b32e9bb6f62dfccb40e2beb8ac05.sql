SELECT scope_invites.scope as "scope_invite_scope: ScopeName", scope_invites.target_user_id as "scope_invite_target_user_id", scope_invites.requesting_user_id as "scope_invite_requesting_user_id", scope_invites.updated_at as "scope_invite_updated_at", scope_invites.created_at as "scope_invite_created_at",
  target_user.id as "target_user_id", target_user.name as "target_user_name", target_user.avatar_url as "target_user_avatar_url", target_user.github_id as "target_user_github_id", target_user.updated_at as "target_user_updated_at", target_user.created_at as "target_user_created_at",
  requesting_user.id as "requesting_user_id", requesting_user.name as "requesting_user_name", requesting_user.avatar_url as "requesting_user_avatar_url", requesting_user.github_id as "requesting_user_github_id", requesting_user.updated_at as "requesting_user_updated_at", requesting_user.created_at as "requesting_user_created_at"
FROM scope_invites
LEFT JOIN users AS target_user ON scope_invites.target_user_id = target_user.id
LEFT JOIN users AS requesting_user ON scope_invites.requesting_user_id = requesting_user.id
WHERE scope = $1