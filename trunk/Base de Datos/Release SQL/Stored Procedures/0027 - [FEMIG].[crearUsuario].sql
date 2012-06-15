USE [GD1C2012]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*+++++++++++++++++++++++++++++++++++++++
* Grupo: FEMIG							*			
*                                       *
* Integrantes:                          *
*	Emiliano Marcelo Ibarrola           *
*	Marcos Andres Ibarrola              *
*	Ignacio Angel Tata                  *
*	Fernando N. Tobares Garcia          *
*+++++++++++++++++++++++++++++++++++++++*/
CREATE PROCEDURE [FEMIG].[crearUsuario] 
	@pUsuarioID			VARCHAR(10),
	@pNombre			VARCHAR(255),
	@pApellido			VARCHAR(255),
	@pEmail				VARCHAR(26),
	@pPassword			VARCHAR(10),
	@pCantMaxIntentos	NUMERIC(18,0),
	@pAnulado			BIT,
	@pRetCatchError		VARCHAR(1000) out
AS
BEGIN
	--Controlo que no haya duplicados de Patente
	if exists (select 1 from FEMIG.Usuario where usuarioID = @pUsuarioID)
	begin
		set @pRetCatchError = 'Ya existe el usuario ' + @pUsuarioID + '.'
		return
	end

	--Controlo que no haya 2 autos activos con el mismo reloj
	if exists (select 1 from FEMIG.Usuario where email = @pEmail and isnull(anulado,'0')='0')
	begin
		set @pRetCatchError = 'Ya existe un usuario con el email ' + cast(@pEmail as varchar) + '.'
		return
	END
	
	INSERT INTO [GD1C2012].[FEMIG].[Usuario]
           (usuarioID,nombre,apellido,email,password,cantIntentosFallo,cantMaxIntentos,anulado)
    VALUES
           (@pUsuarioID
           ,@pNombre
           ,@pApellido
           ,@pEmail
           ,@pPassword
           ,0
           ,@pCantMaxIntentos
           ,'0')
	
END
