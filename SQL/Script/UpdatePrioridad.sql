IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Prioridad].[Update]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Prioridad].[Update]
END
GO
CREATE PROCEDURE [Prioridad].[Update]
	@Prioridad		VARCHAR(50),
	@Clave		VARCHAR(5),
	@IdPrioridad	INT 
AS
BEGIN 
	UPDATE Prioridad
	SET Prioridad = @Prioridad, 
		Clave = @Clave 
	WHERE IdPrioridad = @IdPrioridad
END
GO
EXEC sp_recompile N'[Prioridad].[Update]'


EXEC [Prioridad].[Update]
'MEDIUM PRIORITY', 'MP', 3


Select * from Prioridad