IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Estado].[Insert]') AND
type in (N'P', N'PC'))
BEGIN 
	DROP PROCEDURE [Estado].[Insert]
END 
GO 
CREATE PROCEDURE [Estado].[Insert]
	@Estado		VARCHAR(50),
	@Clave			VARCHAR(5),
	@EstadoId	INT OUTPUT
AS
BEGIN 
		INSERT INTO Estado(Estado, Clave)
		VALUES (@Estado, @Clave)

		SET @EstadoId = SCOPE_IDENTITY()
END
GO
EXEC sp_recompile N'[Estado].[Insert]'


DECLARE @EstadoId INT 
EXEC [Estado].[Insert]
'TO DO', 'TD', @EstadoId OUTPUT

SELECT @EstadoId 