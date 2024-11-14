INSERT INTO
  version_download_counts_24h (
    scope,
    package,
    version,
    time_bucket,
    kind,
    count
  )
SELECT
  scope,
  package,
  version,
  date_trunc('day', time_bucket),
  kind,
  SUM(count)
FROM
  version_download_counts_4h
WHERE
  time_bucket >= date_trunc('day', $1 :: timestamptz)
  AND time_bucket < date_trunc('day', $2 :: timestamptz) + INTERVAL '1 day'
GROUP BY
  scope,
  package,
  version,
  date_trunc('day', time_bucket),
  kind ON CONFLICT (scope, package, version, time_bucket, kind) DO
UPDATE
SET
  count = EXCLUDED.count
