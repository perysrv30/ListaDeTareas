-- CREATE DATABASE ListaTareas


IF NOT EXISTS (SELECT  1 FROM dbo.sysobjects WHERE 
id = OBJECT_ID(N'[dbo].[Prioridad]') AND OBJECTPROPERTY(id, N'isUserTable') = 1) 
BEGIN
CREATE TABLE [Prioridad](
	IdPrioridad INT PRIMARY KEY IDENTITY(1,1),
	Prioridad VARCHAR(50) NOT NULL,
	Clave VARCHAR(5) NOT NULL
)
END

IF NOT EXISTS (SELECT  1 FROM dbo.sysobjects WHERE 
id = OBJECT_ID(N'[dbo].[Estado]') AND OBJECTPROPERTY(id, N'isUserTable') = 1) 
BEGIN
CREATE TABLE [Estado](
	IdEstado INT PRIMARY KEY IDENTITY(1,1),
	Estado VARCHAR(50) NOT NULL,
	Clave VARCHAR(5) NOT NULL
)
END

IF NOT EXISTS (SELECT  1 FROM dbo.sysobjects WHERE 
id = OBJECT_ID(N'[dbo].[Tarea]') AND OBJECTPROPERTY(id, N'isUserTable') = 1) 
BEGIN
CREATE TABLE [Tarea](
	IdTarea INT PRIMARY KEY IDENTITY(1,1),
	Tarea VARCHAR(255) NOT NULL,
	IdPrioridad INT,
	IdEstado INT, 
	FOREIGN KEY (IdPrioridad) REFERENCES Prioridad(IdPrioridad),
	FOREIGN KEY (IdEstado) REFERENCES Estado(IdEstado),

)
END

