SELECT area.name, count(*) as tot
FROM artist JOIN area on artist.area = area.id
WHERE artist.begin_date_year < 1850
GROUP BY area.name
ORDER BY tot DESC
LIMIT 10;