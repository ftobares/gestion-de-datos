USE [GD1C2012]
GO
/****** Object:  StoredProcedure [FEMIG].[editarCliente]    Script Date: 06/11/2012 02:19:42 ******/
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
CREATE PROCEDURE [FEMIG].[eliminarCliente] 
	@pDniCliente			NUMERIC(18)
AS
BEGIN
	update femig.cliente set anulado = '1' where dniCliente = @pDniCliente
END
