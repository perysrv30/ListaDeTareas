IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Tarea].[Get]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Tarea].[Get]
END
GO
CREATE PROCEDURE [Tarea].[Get]
	@IdTarea			INT  = NULL
AS
BEGIN 
	SELECT IdTarea, Tarea, IdEstado, IdPrioridad FROM Tarea
	WHERE  IdTarea = @IdTarea
END
GO
EXEC sp_recompile N'[Tarea].[Get]'


EXEC [Tarea].[Get] 1

