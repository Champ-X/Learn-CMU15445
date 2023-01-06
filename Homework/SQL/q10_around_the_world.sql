WITH alias(rank_, name) as
	(
		SELECT row_number() OVER (ORDER BY artist_alias.id) as rank_, artist_alias.name as name
		FROM artist_alias JOIN artist on artist_alias.artist = artist.id
		WHERE artist.name = 'The Beatles'
	),
	
	concat(rank_, name) as 
	(
		SELECT alias.rank_ as rank_, alias.name as name
		FROM alias
		WHERE alias.rank_ = 1
		UNION
		SELECT alias.rank_, concat.name || ', ' || alias.name
		FROM alias JOIN concat on alias.rank_ = concat.rank_ + 1
	)

SELECT name
FROM concat
ORDER BY rank_ DESC
LIMIT 1