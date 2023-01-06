-- Only releases in English are considered.
-- Both artists should be solo artists.
-- Alphabetically smaller one first. Use artist names (asc) as tie breaker. 
-- both started after 1960
WITH artist_solo(artist_credit, id, name) as 
	(
		SELECT artist_credit_name.artist_credit, artist_credit_name.artist, artist.name
		FROM artist_credit_name JOIN artist on artist_credit_name.artist = artist.id
		WHERE artist.type = 1 AND artist.begin_date_year > 1960
	),
	
	artist_release(aid, aname, rid) as 
	(
		SELECT artist_solo.id, artist_solo.name, release.id
		FROM artist_solo JOIN artist_credit on artist_solo.artist_credit = artist_credit.id
						 JOIN release on artist_credit.id = release.artist_credit
		WHERE release.language = 120
	),
	
	ranks(name1, name2, cnt) as
	(
		SELECT l.aname as name1, r.aname as name2, count(*) as cnt
		FROM artist_release as l JOIN artist_release as r on l.rid = r.rid
		WHERE l.aid <> r.aid AND l.aname < r.aname
		GROUP BY l.aname, r.aname
		ORDER BY cnt DESC
	)
SELECT *
FROM
	(SELECT row_number() OVER ( 
				ORDER BY 
					cnt desc,
					name1,
					name2
		   ) as rank_,
		   name1,
		   name2,
		   cnt
	FROM ranks)
WHERE name1 = 'Dr. Dre' AND name2 = 'Eminem'
