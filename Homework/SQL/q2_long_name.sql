-- 临时关系用来记录每一个work_type里最长work.name的长度
WITH max_len_table(type_name,type_id,max_len) as
	(SELECT work_type.name,work.type,max(length(work.name))
	FROM work JOIN work_type on work.type = work_type.id
	GROUP BY work_type.name)

SELECT work.name, max_len_table.type_name
FROM work JOIN max_len_table on work.type = max_len_table.type_id
WHERE length(work.name) = max_len_table.max_len
ORDER BY work.type asc,work.name asc;