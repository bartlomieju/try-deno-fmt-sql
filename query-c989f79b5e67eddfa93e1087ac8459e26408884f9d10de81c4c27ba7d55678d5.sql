SELECT
  scope_invites.scope AS "scope_invite_scope: ScopeName",
  scope_invites.target_user_id AS "scope_invite_target_user_id",
  scope_invites.requesting_user_id AS "scope_invite_requesting_user_id",
  scope_invites.updated_at AS "scope_invite_updated_at",
  scope_invites.created_at AS "scope_invite_created_at",
  target_user.id AS "target_user_id",
  target_user.name AS "target_user_name",
  target_user.github_id AS "target_user_github_id",
  target_user.avatar_url AS "target_user_avatar_url",
  target_user.updated_at AS "target_user_updated_at",
  target_user.created_at AS "target_user_created_at",
  requesting_user.id AS "requesting_user_id",
  requesting_user.name AS "requesting_user_name",
  requesting_user.github_id AS "requesting_user_github_id",
  requesting_user.avatar_url AS "requesting_user_avatar_url",
  requesting_user.updated_at AS "requesting_user_updated_at",
  requesting_user.created_at AS "requesting_user_created_at"
FROM
  scope_invites
  LEFT JOIN users AS target_user ON scope_invites.target_user_id = target_user.id
  LEFT JOIN users AS requesting_user ON scope_invites.requesting_user_id = requesting_user.id
WHERE
  target_user_id = $1
