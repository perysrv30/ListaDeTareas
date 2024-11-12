IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Tarea].[Update]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Tarea].[Update]
END
GO
CREATE PROCEDURE [Tarea].[Update]
	@Tarea				VARCHAR(255),
	@IdPrioridad		INT,
	@IdEstado			INT,
	@IdTarea			INT OUTPUT
AS
BEGIN 
	UPDATE Tarea
	SET Tarea = @Tarea, 
		IdPrioridad = @IdPrioridad,
		IdEstado = @IdEstado
	WHERE IdTarea = @IdTarea
END
GO
EXEC sp_recompile N'[Tarea].[Update]'


EXEC [Tarea].[Update]
'Presentacion de avances',3, 1, 4


Select * from Tarea