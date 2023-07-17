-- =============================================
-- Modified:	04/22/219
-- Description:	Used to search the database 
-- EXEC dev_SearchFnAndProcs 'randomKeyWord'
-- =============================================
Create PROCEDURE [dbo].[dev_SearchFnAndProcs]
(
	@Search VARCHAR(MAX)
)
AS

BEGIN

	SELECT
	 O.object_id,
	 O.name,
	 O.type_desc,
	 O.create_date,
	 O.modify_date,
	 M.definition
	 FROM 
	SYS.objects AS o 
		INNER JOIN sys.sql_MODULES as M 
			ON o.object_id = m.object_id
		WHERE TYPE in ('P', 'FN', 'TF', 'IF', 'TT', 'TR')
		AND m.definition like '%'+@Search+'%'
		Order by o.object_id desc 

END
