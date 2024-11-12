IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Prioridad].[Get]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Prioridad].[Get]
END
GO
CREATE PROCEDURE [Prioridad].[Get]
	@IdPrioridad			INT  = NULL
AS
BEGIN 
	SELECT IdPrioridad, Prioridad, Clave FROM Prioridad
	WHERE  IdPrioridad = @IdPrioridad
END
GO
EXEC sp_recompile N'[Prioridad].[Get]'


EXEC [Prioridad].[Get] 1