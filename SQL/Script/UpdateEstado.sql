IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Estado].[Update]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Estado].[Update]
END
GO
CREATE PROCEDURE [Estado].[Update]
	@Estado		VARCHAR(50),
	@Clave		VARCHAR(5),
	@IdEstado	INT 
AS
BEGIN 
	UPDATE Estado
	SET Estado = @Estado, 
		Clave = @Clave 
	WHERE IdEstado = @IdEstado
END
GO
EXEC sp_recompile N'[Estado].[Update]'


EXEC [Estado].[Update]
'IN PROGRESS', 'IP', 3


Select * from Estado