IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Estado].[GetAll]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Estado].[GetAll]
END
GO
CREATE PROCEDURE [Estado].[GetAll]
	@IdEstado			INT  = NULL
AS
BEGIN 
	SELECT IdEstado,Estado , Clave FROM Estado
	WHERE @IdEstado IS NULL OR (IdEstado IS NOT NULL AND IdEstado= @IdEstado) --Tabla Chica
END
GO
EXEC sp_recompile N'[Estado].[GetAll]'

EXEC [Estado].[GetAll] 1