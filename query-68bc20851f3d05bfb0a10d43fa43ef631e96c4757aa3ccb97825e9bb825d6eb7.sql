INSERT INTO
  users (
    name,
    email,
    avatar_url,
    github_id,
    is_blocked,
    is_staff
  )
VALUES
  ($1, $2, $3, $4, $5, $6)
RETURNING
  id,
  name,
  email,
  avatar_url,
  updated_at,
  created_at,
  github_id,
  is_blocked,
  is_staff,
  scope_limit,
  (
    SELECT
      COUNT(created_at)
    FROM
      scope_invites
    WHERE
      target_user_id = id
  ) AS "invite_count!",
  (
    SELECT
      COUNT(created_at)
    FROM
      scopes
    WHERE
      creator = id
  ) AS "scope_usage!"
