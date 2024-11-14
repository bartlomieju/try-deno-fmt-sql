
SELECT time_bucket, kind as "kind: DownloadKind", SUM(count) as "count!"
FROM version_download_counts_24h
WHERE scope = $1 AND package = $2 AND time_bucket >= $3 AND time_bucket < $4
GROUP BY time_bucket, kind
ORDER BY time_bucket ASC
    