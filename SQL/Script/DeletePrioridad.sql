IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Prioridad].[Delete]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Prioridad].[Delete]
END
GO
CREATE PROCEDURE [Prioridad].[Delete]
	@IdPrioridad			INT
AS
BEGIN 
	DELETE Prioridad
	WHERE IdPrioridad = @IdPrioridad
END
GO
EXEC sp_recompile N'[Prioridad].[Delete]'

EXEC [Prioridad].[Delete]
2