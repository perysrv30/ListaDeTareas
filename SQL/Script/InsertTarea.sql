IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Tarea].[Insert]') AND
type in (N'P', N'PC'))
BEGIN 
	DROP PROCEDURE [Tarea].[Insert]
END 
GO 
CREATE PROCEDURE [Tarea].[Insert]
	@Tarea				VARCHAR(255),
	@IdPrioridad		INT,
	@IdEstado			INT,
	@TareaId			INT OUTPUT
AS
BEGIN 
		INSERT INTO Tarea(Tarea, IdPrioridad, IdEstado)
		VALUES (@Tarea, @IdPrioridad, @IdEstado)

		SET @TareaId = SCOPE_IDENTITY()
END
GO
EXEC sp_recompile N'[Tarea].[Insert]'


DECLARE @TareaId INT 
EXEC [Tarea].[Insert]
'Presentacion de avances', 1, 1, @TareaId OUTPUT

SELECT @TareaId 