WITH f AS (
 SELECT
    state,
    SUM(number) as total,
    year,
    name,
    RANK() OVER(PARTITION BY state, year ORDER BY SUM(number) DESC) as rnk
  FROM
    `bigquery-public-data.usa_names.usa_1910_current`
  WHERE
    gender = "M"
  GROUP BY
    state, 
    year,
    name
  ORDER BY
    total DESC
)

SELECT
  state,
  name,
  year
FROM
  f
WHERE
  rnk = 1
ORDER BY
  year,
  state
;






