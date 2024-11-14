
INSERT INTO version_download_counts_4h (scope, package, version, time_bucket, kind, count)
SELECT * FROM UNNEST($1::TEXT[], $2::TEXT[], $3::TEXT[], $4::TIMESTAMPTZ[], $5::download_kind[], $6::INT[]) as temp(scope, package, version, time_bucket, kind, count)
WHERE (SELECT COUNT(*) FROM package_versions WHERE package_versions.scope = temp.scope AND package_versions.name = temp.package AND version = temp.version) > 0
ON CONFLICT (scope, package, version, time_bucket, kind) DO UPDATE SET count = EXCLUDED.count
      