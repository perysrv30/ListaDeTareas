IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Tarea].[GetAll]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Tarea].[GetAll]
END
GO
CREATE PROCEDURE [Tarea].[GetAll]
	@IdTarea			INT  = NULL
AS
BEGIN 
	SELECT IdTarea,Tarea , IdPrioridad, IdEstado FROM Tarea
	WHERE @IdTarea IS NULL OR (IdTarea IS NOT NULL AND IdTarea= @IdTarea) --Tabla Chica
END
GO
EXEC sp_recompile N'[Tarea].[GetAll]'

EXEC [Tarea].[GetAll] 