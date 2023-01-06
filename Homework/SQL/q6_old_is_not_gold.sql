SELECT (release_info.date_year / 10) || '0s' as decade, count(*) as cnt
FROM release_status JOIN release on release_status.id = release.status
					JOIN release_info on release.id = release_info.release
WHERE release.status = 1 AND release_info.date_year is NOT NULL AND release_info.date_year >= 1900
GROUP BY release_info.date_year / 10
ORDER BY cnt DESC, decade DESC