SELECT
  count(*)
FROM
  publishing_tasks
WHERE
  package_scope = $1
  AND package_name = $2
  AND STATUS != 'failure'
