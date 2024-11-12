IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Estado].[Get]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Estado].[Get]
END
GO
CREATE PROCEDURE [Estado].[Get]
	@IdEstado			INT  = NULL
AS
BEGIN 
	SELECT IdEstado, Estado, Clave FROM Estado
	WHERE  IdEstado = @IdEstado
END
GO
EXEC sp_recompile N'[Estado].[Get]'


EXEC [Estado].[Get] 1