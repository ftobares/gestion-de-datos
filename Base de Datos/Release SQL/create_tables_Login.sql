--   -------------------------------------------------- 
--   Generated by Enterprise Architect Version 9.3.932
--   Created On : martes, 05 junio, 2012 
--   DBMS       : SQL Server 2005 
--   -------------------------------------------------- 





--  Create Tables 
CREATE TABLE Pantalla ( 
	pantallaID varchar(255) NOT NULL,
	descripcion varchar(255) NOT NULL
)
;

CREATE TABLE Rol ( 
	rolID varchar(20) NOT NULL,
	descripcion varchar(50) NOT NULL,
	anulado varchar(1)    --  0: El rol est� activo 1: El rol esta inhabilitado 
)
;

CREATE TABLE RolPantalla ( 
	rolID varchar(20) NOT NULL,
	pantallaID varchar(255) NOT NULL,
	acceso varchar(1)    --  0 o null: no tiene acceso 1: tiene acceso 
)
;

CREATE TABLE RolUsuario ( 
	usuarioID varchar(20) NOT NULL,
	rolID varchar(20) NOT NULL
)
;

CREATE TABLE Usuario ( 
	usuarioID varchar(20) NOT NULL,
	nombre varchar(50) NOT NULL,
	apellido varchar(50) NOT NULL,
	email varchar(100),
	password varchar(50) NOT NULL,
	cantIntentosFallo numeric(18),
	cantMaxIntentos numeric(18),
	anulado varchar(1)
)
;


--  Create Primary Key Constraints 
ALTER TABLE Pantalla ADD CONSTRAINT PK_Pantalla 
	PRIMARY KEY CLUSTERED (pantallaID)
;

ALTER TABLE Rol ADD CONSTRAINT PK_Roles 
	PRIMARY KEY CLUSTERED (rolID)
;

ALTER TABLE RolPantalla ADD CONSTRAINT PK_RolesPantallas 
	PRIMARY KEY CLUSTERED (rolID, pantallaID)
;

ALTER TABLE RolUsuario ADD CONSTRAINT PK_RolesUsuarios 
	PRIMARY KEY CLUSTERED (usuarioID, rolID)
;

ALTER TABLE Usuario ADD CONSTRAINT PK_Usuarios 
	PRIMARY KEY CLUSTERED (usuarioID)
;



--  Create Foreign Key Constraints 
ALTER TABLE RolPantalla ADD CONSTRAINT FK_RolPantalla_Pantalla 
	FOREIGN KEY (pantallaID) REFERENCES Pantalla (pantallaID)
;

ALTER TABLE RolPantalla ADD CONSTRAINT FK_RolPantalla_Rol 
	FOREIGN KEY (rolID) REFERENCES Rol (rolID)
;

ALTER TABLE RolUsuario ADD CONSTRAINT FK_RolUsuario_Rol 
	FOREIGN KEY (rolID) REFERENCES Rol (rolID)
;

ALTER TABLE RolUsuario ADD CONSTRAINT FK_RolUsuario_Usuario 
	FOREIGN KEY (usuarioID) REFERENCES Usuario (usuarioID)
;













EXEC sp_addextendedproperty 'MS_Description', '0: El rol est� activo
1: El rol esta inhabilitado', 'Schema', dbo, 'table', Rol, 'column', anulado
;



EXEC sp_addextendedproperty 'MS_Description', '0 o null: no tiene acceso
1: tiene acceso', 'Schema', dbo, 'table', RolPantalla, 'column', acceso
;
