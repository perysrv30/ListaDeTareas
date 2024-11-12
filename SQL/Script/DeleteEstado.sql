IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Estado].[Delete]') AND
type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [Estado].[Delete]
END
GO
CREATE PROCEDURE [Estado].[Delete]
	@IdEstado			INT
AS
BEGIN 
	DELETE Estado
	WHERE IdEstado = @IdEstado
END
GO
EXEC sp_recompile N'[Estado].[Delete]'

EXEC [Estado].[Delete]
2