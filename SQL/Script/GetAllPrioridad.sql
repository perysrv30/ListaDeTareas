IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Prioridad].[GetAll]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Prioridad].[GetAll]
END
GO
CREATE PROCEDURE [Prioridad].[GetAll]
	@IdPrioridad			INT  = NULL
AS
BEGIN 
	SELECT IdPrioridad,Prioridad , Clave FROM Prioridad
	WHERE @IdPrioridad IS NULL OR (IdPrioridad IS NOT NULL AND IdPrioridad= @IdPrioridad) --Tabla Chica
END
GO
EXEC sp_recompile N'[Prioridad].[GetAll]'

EXEC [Prioridad].[GetAll] 1