IF EXISTS(SELECT 1 FROM sys.objects
WHERE object_id = OBJECT_ID(N'[Prioridad].[Insert]') AND
type in (N'P', N'PC'))
BEGIN 
	DROP PROCEDURE [Prioridad].[Insert]
END 
GO 
CREATE PROCEDURE [Prioridad].[Insert]
	@Prioridad		VARCHAR(50),
	@Clave			VARCHAR(5),
	@PrioridadId	INT OUTPUT
AS
BEGIN 
		INSERT INTO Prioridad(Prioridad, Clave)
		VALUES (@Prioridad, @Clave)

		SET @PrioridadId = SCOPE_IDENTITY()
END
GO
EXEC sp_recompile N'[Prioridad].[Insert]'


DECLARE @PrioridadId INT 
EXEC [Prioridad].[Insert]
'HIGH PRIORITY', 'HP', @PrioridadId OUTPUT

SELECT @PrioridadId 