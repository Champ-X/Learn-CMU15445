-- 用artist而不是name因为同一个artist可能会有不同的name
SELECT count(DISTINCT artist_credit_name.artist) as cnt
FROM artist_credit_name JOIN artist_credit on artist_credit_name.artist_credit = artist_credit.id
WHERE artist_credit.name like '%Ariana Grande%'