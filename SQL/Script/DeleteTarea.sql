IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Tarea].[Delete]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Tarea].[Delete]
END
GO
CREATE PROCEDURE [Tarea].[Delete]
	@IdTarea			INT
AS
BEGIN 
	DELETE Tarea
	WHERE IdTarea = @IdTarea
END
GO
EXEC sp_recompile N'[Tarea].[Delete]'

EXEC [Tarea].[Delete]
2