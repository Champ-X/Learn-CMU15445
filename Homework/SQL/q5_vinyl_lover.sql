WITH vinly_format(id, release_) as
	(
		SELECT medium.id, medium.release
		FROM medium JOIN medium_format on medium.format = medium_format.id
		WHERE medium_format.name like '%Vinyl' AND 
			  medium_format.name not like '%VinylDisc%'
	)

SELECT DISTINCT release.name
FROM vinly_format JOIN release on vinly_format.release_ = release.id
				  JOIN artist_credit on release.artist_credit = artist_credit.id AND
								    artist_credit.id = 2129
				  JOIN release_info on release.id = release_info.release
ORDER BY release_info.date_year,
		 release_info.date_month,
		 release_info.date_day;