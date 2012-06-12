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
CREATE PROCEDURE [FEMIG].[crearTurno] 
	@pTurnoId			NUMERIC(18,0),
	@pDescripcion		VARCHAR(10),
	@pHoraInicio		VARCHAR(255),
	@pHoraFin			VARCHAR(255),
	@pValorFicha		VARCHAR(26),
	@pValorBandera		VARCHAR(10),
	@pAnulado			BIT,
	@pRetCatchError		VARCHAR(1000) out
AS
BEGIN

	--Controlo si 2 turnos activos solapan horarios
	iF exists	(SELECT	1 FROM femig.turnos
				WHERE	ISNULL(anulado,'0')='0'
						AND ((@pHoraInicio >= horaInicio AND @pHoraInicio <= horaFin)
						OR (@pHoraFin >= horaInicio AND @pHoraFin <= horaFin)))
	begin
		set @pRetCatchError = 'El turno que intenta ingresar se solapa con otros horarios.'
		return
	END
	
	INSERT INTO [GD1C2012].[FEMIG].[turnos]
           (horaInicio,horaFin,descripcion,valorFicha,valorBandera,anulado)
    VALUES
           (@pHoraInicio
           ,@pHoraFin
           ,@pDescripcion
           ,@pValorFicha
           ,@pValorBandera
           ,'0')
	
END
