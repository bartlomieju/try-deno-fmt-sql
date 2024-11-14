SELECT
  time_bucket,
  kind AS "kind: DownloadKind",
  count
FROM
  version_download_counts_24h
WHERE
  scope = $1
  AND package = $2
  AND version = $3
  AND time_bucket >= $4
  AND time_bucket < $5
ORDER BY
  time_bucket ASC
