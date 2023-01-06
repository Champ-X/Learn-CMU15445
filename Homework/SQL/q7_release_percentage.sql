-- 位于07/2019至07/2020的release按月统计总数
WITH sr(y, m, cnt) as
	(
		SELECT release_info.date_year,
				(
				CASE
					WHEN release_info.date_month < 10 then '0' || CAST(release_info.date_month as char)
					else CAST(release_info.date_month as char)
				END
				),
				count(*)
		FROM release JOIN release_info on release.id = release_info.release
		WHERE release_info.date_year is not NULL AND release_info.date_month is not NULL AND
			  ((release_info.date_year = 2019 AND release_info.date_month >= 7) OR
			  (release_info.date_year = 2020 AND release_info.date_month <= 7))
		GROUP BY release_info.date_year, release_info.date_month
	)
	
SELECT sr.y || '.' || sr.m as date, 
		round(sr.cnt * 100.0 / (
			SELECT sum(cnt)
			FROM sr
		), 2) as percentage
FROM sr
ORDER BY sr.y, sr.m
