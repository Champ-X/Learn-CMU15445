-- 最初版本：虽然答案集合正确 但 name的顺序不满足自动评分
-- WITH alias_num(artist_name, alias_num) as 
-- 	(
-- 		SELECT artist.name, count(distinct artist_alias.name)
-- 		FROM artist JOIN artist_alias on artist.id = artist_alias.artist
-- 		WHERE artist.area = 221 AND artist.begin_date_year > 1950
-- 		GROUP BY artist.id
-- 	)
-- 
-- SELECT artist_name as name, alias_num as num
-- FROM alias_num
-- ORDER BY num DESC
-- LIMIT 10;

SELECT artist.name, count(distinct artist_alias.name) as num
FROM artist JOIN artist_alias on artist.id = artist_alias.artist
WHERE artist.begin_date_year > 1950 AND area = 221
GROUP BY artist.id
ORDER BY num DESC
LIMIT 10;