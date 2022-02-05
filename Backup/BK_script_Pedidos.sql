USE [master]
GO
/****** Object:  Database [Pedidos]    Script Date: 5/02/2022 10:31:23 ******/
CREATE DATABASE [Pedidos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pedidos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Pedidos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pedidos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Pedidos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Pedidos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pedidos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pedidos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pedidos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pedidos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pedidos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pedidos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pedidos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pedidos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pedidos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pedidos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pedidos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pedidos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pedidos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pedidos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pedidos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pedidos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pedidos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pedidos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pedidos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pedidos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pedidos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pedidos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pedidos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pedidos] SET RECOVERY FULL 
GO
ALTER DATABASE [Pedidos] SET  MULTI_USER 
GO
ALTER DATABASE [Pedidos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pedidos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pedidos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pedidos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pedidos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pedidos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pedidos', N'ON'
GO
ALTER DATABASE [Pedidos] SET QUERY_STORE = OFF
GO
USE [Pedidos]
GO
/****** Object:  User [wilmer]    Script Date: 5/02/2022 10:31:23 ******/
CREATE USER [wilmer] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [hadoop]    Script Date: 5/02/2022 10:31:23 ******/
CREATE USER [hadoop] FOR LOGIN [hadoop] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [wilmer]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [wilmer]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [wilmer]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [wilmer]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [wilmer]
GO
ALTER ROLE [db_datareader] ADD MEMBER [wilmer]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [wilmer]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [wilmer]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [wilmer]
GO
/****** Object:  Schema [Comercial]    Script Date: 5/02/2022 10:31:23 ******/
CREATE SCHEMA [Comercial]
GO
/****** Object:  Schema [Logistica]    Script Date: 5/02/2022 10:31:23 ******/
CREATE SCHEMA [Logistica]
GO
/****** Object:  Schema [Web]    Script Date: 5/02/2022 10:31:23 ******/
CREATE SCHEMA [Web]
GO
/****** Object:  UserDefinedFunction [dbo].[fc_ClienteWeb]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fc_ClienteWeb](@DOCUMENTO NVARCHAR(20))  
RETURNS int   
AS   
BEGIN 
		DECLARE @ret int;  
		SELECT TOP 1 @ret = p.IdPersona
		FROM dbo.CO_Clientes p   
		WHERE p.Documento = @DOCUMENTO;  
 
		RETURN @ret;  
END

GO
/****** Object:  UserDefinedFunction [dbo].[fc_IdFamiliaLinea]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fc_IdFamiliaLinea](@id int)  
RETURNS int   
AS   
BEGIN 
		DECLARE @ret int;  
		SELECT @ret = MAX(p.Familia)+1
		FROM dbo.WH_ClaseFamilia p   
		WHERE p.Linea = @id;  
 
		RETURN @ret;  
END
GO
/****** Object:  Table [dbo].[CO_Clientes]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CO_Clientes](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](50) NULL,
	[Documento] [nvarchar](20) NULL,
	[Direccion] [nvarchar](100) NULL,
	[Distrito] [nvarchar](50) NULL,
	[Provincia] [nvarchar](20) NULL,
	[Telefono] [nvarchar](20) NULL,
	[Estado] [bit] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Comercial.Clientes] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CO_Estado]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CO_Estado](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](20) NOT NULL,
	[FlagEstado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CO_Pedido]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CO_Pedido](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodPedido]  AS ('P'+right('00000000'+CONVERT([varchar],[Id]),(4))),
	[Sucursal] [nvarchar](20) NULL,
	[IdCliente] [int] NULL,
	[FechaPedido] [datetime] NULL,
	[MontoTotal] [decimal](18, 2) NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CO_PedidoDetalle]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CO_PedidoDetalle](
	[IdPedido] [int] NOT NULL,
	[Item] [int] NOT NULL,
	[Cantidad] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CO_Tiendas]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CO_Tiendas](
	[CodTienda] [nvarchar](20) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Direccion] [nvarchar](100) NULL,
 CONSTRAINT [PK_Tiendas] PRIMARY KEY CLUSTERED 
(
	[CodTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WB_Usuario]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WB_Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Password] [varbinary](250) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[TipoUsuario] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NOT NULL,
	[Rol] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WH_ClaseFamilia]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WH_ClaseFamilia](
	[Linea] [int] NOT NULL,
	[Familia] [int] NOT NULL,
	[DescripcionLocal] [nvarchar](50) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__ClaseFam__A65DB3FE9BBA92C5] PRIMARY KEY CLUSTERED 
(
	[Linea] ASC,
	[Familia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WH_ClaseLinea]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WH_ClaseLinea](
	[Linea] [int] IDENTITY(10,10) NOT NULL,
	[DescripcionLocal] [nvarchar](50) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__ClaseLin__C9CF603C8AAED5D1] PRIMARY KEY CLUSTERED 
(
	[Linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WH_ClaseSubFamilia]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WH_ClaseSubFamilia](
	[Linea] [int] NOT NULL,
	[Familia] [int] NOT NULL,
	[SubFamilia] [int] NOT NULL,
	[DescripcionLocal] [nvarchar](50) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__ClaseSub__7397480C7DDA6184] PRIMARY KEY CLUSTERED 
(
	[Linea] ASC,
	[Familia] ASC,
	[SubFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WH_ItemMast]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WH_ItemMast](
	[Item] [int] IDENTITY(1000,1) NOT NULL,
	[Linea] [int] NULL,
	[Familia] [int] NULL,
	[SubFamilia] [int] NULL,
	[DescripcionLocal] [nvarchar](100) NULL,
	[UnidadCodigo] [nvarchar](20) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__ItemMast__9CBB9A4FE4E988EB] PRIMARY KEY CLUSTERED 
(
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CO_Clientes] ON 
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (1, N'BRUNO', N'LIZARRAGA MICHELINI', N'41205312', N'AV. 28 DE JULIO NRO. 801 DPTO. 1602 (CRUCE 28 CON GRIMALDO)', N'MIRAFLORES', N'LIMA', N'994055827', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (2, N'GIGLIANA MARIA JOSE', N'CATANZARO FOPPIANO', N'41846669', N'LA MOLINA - MALECON MONTE BELLO 430 RINCONADA ALTA', N'LA MOLINA', N'LIMA', N'999048759', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (3, N'JOSE DANIEL', N'VILLAR RODRIGUEZ', N'76170158', N'AV AMAZONAS 278', N'VILLA MARIA TRIUNFO', N'LIMA', N'982714582', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (4, N'CARMEN', N'RUIZ ELDREDGE', N'08237175', N'PUEBLO LIBRE', N'PUEBLO LIBRE', N'LIMA', N'953253694', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (5, N'SILVIA', N'MELGAREJO FERNANDEZ', N'10688176', N'PASEO DE LA REPUBLICA 5655 DPT 105 - MIRAFLORES', N'MIRAFLORES', N'LIMA', N'987216533', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (6, N'GLADYS', N'ALCEDO CHAVEZ', N'10790479', N'CALLE CARHUAQUERO 195 DPTO 302 REF. ALTRA CDRA 12 DE AV. LA FONTANA', N'LA MOLINA', N'LIMA', N'965761491', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (7, N'LUIS', N'ORUE ORUE', N'48201542', N'SURCO', N'SANTIAGO DE SURCO', N'LIMA', N'912115116', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (8, N'FLAVIA', N'CESPEDES DUFFO', N'74072988', N'SURCO', N'SANTIAGO DE SURCO', N'LIMA', N'987976690', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (9, N'SILVIA', N'MENDOZA LEE', N'09542864', N'AV, VICTOR ANDRES BELAUNDE 332 OF.301/CREUICE CON AV. LAS PALMERAS', N'SAN ISIDRO', N'LIMA', N'994508392', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (10, N'JUAN MARTIN', N'VELASQUEZ HUALINGA', N'45987811', N'AV.A MZ.L LT.3 A.H.VILLA LIMATAMBO', N'VILLA MARIA TRIUNFO', N'LIMA', N'941779197', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (11, N'PADY', N'TAPIA ROBLES', N'40921401', N'AV.FRANCISCO LAZO 220 VALLECITO BAJO', N'VILLA MARIA TRIUNFO', N'LIMA', N'984178149', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (12, N'GLADYS BETTY', N'LERMO GONZALES', N'10037833', N'MZ. H LT. 7 HIJOS ALOJADOS DEL BRILLANTE', N'SAN JUAN MIRAFLORES', N'LIMA', N'940249557', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (13, N'JACKELYN MARIA', N'JARUFE CHEHADE', N'41319106', N'AV. DOS DE MAYO 1790 DPTO 901', N'SAN ISIDRO', N'LIMA', N'998328234', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (14, N'CARLOS ALBERTO', N'MORENO FERREYRA', N'07732089', N'SAN ISIDRO', N'SAN ISIDRO', N'LIMA', N'986454022', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (15, N'ESTRELLA CONSUELO', N'BOZA NOVOA', N'71259880', N'AV LOS ALAMOS MZ B LT 6 URB PEDRO LAOZ HURTADO', N'SAN JUAN MIRAFLORES', N'LIMA', N'936798640', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (16, N'ELMER THOMAS', N'SAAVEDRA ROJA', N'40317301', N'JESUS MARIA  JR.HUASCAR 1982 DPT.602 REF.ENTRE LA 6 Y 7 DE LA AV.SAN FELIPE', N'MAGDALENA DEL MAR', N'LIMA', N'997904970', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (17, N'PATRICIA DEL PILAR', N'ACARO ACARO', N'40558939', N'CALLE JOSE OROZCO 123 DPTO 102 - REF PARARELA A CDRA 28 DE AV. AVIACIÓN', N'SAN BORJA', N'LIMA', N'990023716', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (18, N'LILA', N'LACA SALAS', N'25720262', N'CALLE DANIEL CRUZ 167 2DO PISO LA CALERA LA MERCED', N'SURQUILLO', N'LIMA', N'4491096', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (19, N'MARIA', N'LUDEÑAS LUDEÑAS', N'25747545', N'LOS CEDROS 227', N'SAN ISIDRO', N'LIMA', N'981227179', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (20, N'ANGELICA', N'TELLO HUAPAYA', N'46212254', N'CALLE TIAHUNACO 479 COO LOS CHANCAS DE ANDAHUAYLAS', N'SANTA ANITA', N'LIMA', N'941982563', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (21, N'MARIELA ALICIA', N'ESPINOZA BISBAL DE VERA', N'44179045', N'CA CLEMENTE X 110 DPTO 802', N'SAN ISIDRO', N'LIMA', N'981222748', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (22, N'VANESSA AMPARO', N'ERAZO TORRICO', N'25837680', N'CALLE MARCO POLO 197, SURQUILLO', N'SURQUILLO', N'LIMA', N'999912828', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (23, N'CARLOS ALBERTO', N'RUIZ PALMA', N'46740232', N'SECTOR 2 GRUPO 23A MZ. L LT. 07', N'VILLA EL SALVADOR', N'LIMA', N'992741266', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (24, N'BRISA', N'MAVILA OJEDA', N'46818422', N'SURCO', N'SAN ISIDRO', N'LIMA', N'2154132', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (25, N'MELISSA', N'CABANILLAS ESPINOZA', N'43670498', N'PROLONGACIÓN MARIANO DE LOS SANTOS 320', N'BARRANCO', N'LIMA', N'952362159', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (26, N'VIVIANA', N'BARRON WONG', N'41585944', N'AV. TOMAS MARSANO 2535', N'SURQUILLO', N'LIMA', N'937599926', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (27, N'VIRNA ROSA', N'PELAES CHACON', N'06670332', N'MALECON GRAU 315 DPTO 1503', N'MAGDALENA DEL MAR', N'LIMA', N'99455364', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (28, N'LUISA', N'PAREDES ARRIAGA', N'07719132', N'SURQUILLO', N'SURQUILLO', N'LIMA', N'965742229', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (29, N'KARINA', N'PUENTE DE LA VEGA', N'06297284', N'Avenida Coronel Portillo 170 dpto. 1402', N'SAN ISIDRO', N'LIMA', N'998184596', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (30, N'ELVIRA', N'GALVEZ DE RISGLOS', N'08259037', N'SAN ISIDRO- AV DEL PARQUE NORTE 312', N'SAN ISIDRO', N'LIMA', N'2242653', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (31, N'VIRGINIA', N'GARCIA CALDERON', N'07730954', N'MAGDALENA', N'MAGDALENA DEL MAR', N'LIMA', N'995223000', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (32, N'MARILYN MELIZA', N'MONTESINOS CHUNGA', N'42279250', N'CALLE LOS PERALES 248 DPTO 102 URB. EL PALMAR', N'SANTIAGO DE SURCO', N'LIMA', N'992709011', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (33, N'CATHERINE RITA', N'VILLANUEVA RAMIREZ', N'43547450', N'SAN ISIDRO- AV. JAVIER PRADO OESTE 140 TIENDA HIUNDAY', N'SAN ISIDRO', N'LIMA', N'989466220', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (34, N'INES', N'BAYON X', N'10587609', N'MAGDALENA - JR FELIX DIBOS 980 - ENTRE LA 8 Y 9 DE JAVIER PRADO OESTE', N'MAGDALENA DEL MAR', N'LIMA', N'994266780', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (35, N'CLADIA', N'HUALPA TAHUANA', N'75510794', N'SAN JUAN DE LURIGANCHO', N'SAN JUAN LURIGANCHO', N'LIMA', N'982115457', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (36, N'JOSE', N'ESPINOZA SALGUERO', N'07277100', N'SURQUILLO', N'SURQUILLO', N'LIMA', N'1', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (37, N'MILAGROS', N'QUINTEROS VELASQUEZ', N'41430030', N'PUEBLO LIBRE', N'PUEBLO LIBRE', N'LIMA', N'956384804', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (38, N'JUAN JOSE', N'ARENAS CARPIO', N'40215305', N'PSJ LOS ZAFIROS 480 BALCONCILLO LA VICTORIA', N'LA VICTORIA', N'LIMA', N'987792322', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (39, N'KARIN GREIS', N'VALDIVIEZO SALDARRIAGA', N'43685366', N'Calle don Pompeyo 164 timbre 201 santa rosa de surco', N'CHORRILLOS', N'LIMA', N'992189389', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (40, N'SHEYLA YOSHIE', N'GIL PAUCAR', N'71940585', N'GRUPO 21 SECTOR 1 MZP LT 24', N'VILLA EL SALVADOR', N'LIMA', N'953792010', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (41, N'HEIDI', N'CHAVEZ VALDIVIA', N'40510636', N'Jirón Los damascos 380 urbanización residencial monterrico', N'MAGDALENA DEL MAR', N'LIMA', N'997441980', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (42, N'WILLIAM', N'AGUILAR TORRES', N'72213738', N'MZD LT2 AAHH INCA PACHACUTEC', N'VILLA MARIA TRIUNFO', N'LIMA', N'986901189', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (43, N'EMILIA', N'OTAROLA AMBROSINI', N'08256219', N'MAGDALENA', N'MAGDALENA DEL MAR', N'LIMA', N'999656911', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (44, N'JUNIOR STEVEN', N'YEPES LA ROSA', N'47876088', N'CA.7 DE JUNIO 1547 URB NUEVA ESPERANZA', N'VILLA MARIA TRIUNFO', N'LIMA', N'916094650', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (45, N'MERCEDES', N'CORNEJO LOZADA', N'45232303', N'MAGDALENA', N'MAGDALENA DEL MAR', N'LIMA', N'947659098', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (46, N'CARMEN MILAGROS', N'PINEDO NUÑEZ', N'44730429', N'Avenida Republica Dominicana 116 Int. 2', N'MAGDALENA DEL MAR', N'LIMA', N'954781454', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (47, N'ANDREA ZULEMA', N'CRISOSTOMO CALDERON', N'73120646', N'Calle Las Acacias 5 MZ CH', N'SAN MIGUEL', N'LIMA', N'998177709', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (48, N'LUCIANA DEL MILAGRO', N'SIALER CAÑAMERO', N'44454667', N'CALLE ARTURO DURAY 168 DPTO 601', N'SURQUILLO', N'LIMA', N'987522013', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (49, N'GLADYS', N'NUÑEZ RODRIGUEZ', N'44363322', N'JESUS MARIA', N'JESUS MARIA', N'LIMA', N'978396226', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (50, N'LYN', N'RAMOS MATOS', N'20077684', N'CALLAO', N'SAN MIGUEL', N'LIMA', N'918807812', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (51, N'BRAYAN EDUARDO', N'CARPIO CASO', N'74618000', N'MZ S LT 6 AA HH HATARY LLACTA', N'EL AGUSTINO', N'LIMA', N'932114803', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (52, N'ANDREA', N'CADENAS DELGADO', N'45452556', N'Calle Jose Felix Olcay 215', N'MAGDALENA DEL MAR', N'LIMA', N'99797841', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (53, N'JAIME JESUS', N'VALDEZ PANTOJA', N'10798298', N'JR SAN MARTIN 260 INT 303', N'SAN MIGUEL', N'LIMA', N'933659831', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (54, N'LILIA JANETH', N'CAVERO PONCE', N'10473662', N'BRAHNS 184 SAN BORJA CUADRA 25', N'SAN LUIS', N'LIMA', N'996848931', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (55, N'DIANA PATRICIA', N'PAYALICH MANRIQUE', N'73241880', N'SURCO', N'SANTIAGO DE SURCO', N'LIMA', N'977258776', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (56, N'ALESSANDRA DESIRETH', N'ELCORROBARRUTIA KIAN', N'72039395', N'CALLE CIRO ALEGRIA 135 REF. ALTRA CDRA 8 DE AV. CONSTRUCTORES', N'LA MOLINA', N'LIMA', N'951508788', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (57, N'HENRRY', N'QUIÑONES MENDOZA', N'10652563', N'SURCO', N'SANTIAGO DE SURCO', N'LIMA', N'991305813', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (58, N'EDUARDO ALFREDO', N'MATOS CUERVO', N'10287859', N'Calle Martin Oviedo 142', N'PUEBLO LIBRE', N'LIMA', N'967750987', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (59, N'GABRIELA', N'AGUIRRE ROJAS', N'46335574', N'AV MANUEL CIPRIANO DULANTO 1275 DPTO 1204', N'PUEBLO LIBRE', N'LIMA', N'970484449', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (60, N'FRANCO ARTURO', N'IPARRAGUIRRE BERNALES', N'42097224', N'Calle Manuel Ascencio Segura 124 Int. 701', N'MIRAFLORES', N'LIMA', N'994001591', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (61, N'MARIA', N'RIVERA VUCETICH', N'08249443', N'MIRAFLORES', N'MIRAFLORES', N'LIMA', N'995147898', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (62, N'JANET', N'RENTERIA BERNUY', N'40647012', N'MAGDALENA', N'MAGDALENA DEL MAR', N'LIMA', N'959209100', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (63, N'ANGELICA MARIA', N'LOPEZ BALDERA', N'42386914', N'ANDRES REYES 489', N'SAN ISIDRO', N'LIMA', N'956297377', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (64, N'MARIANELA', N'SANCHEZ ZANELLI', N'10713200', N'SAN LUIS', N'SAN LUIS', N'LIMA', N'992723580', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (65, N'CONSUELO FELICITAS', N'PEREZ ALBELA GAMERO DE BERROCAL', N'07784353', N'GENERAL VIDAL 171 ALT 49 DE AV AREQUIPA  LADO DE HIRAOKA', N'MIRAFLORES', N'LIMA', N'992751866', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (66, N'JUANA', N'CARDENAS NEIRA', N'46926744', N'SAN MIGUEL', N'SAN MIGUEL', N'LIMA', N'959677785', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (67, N'OLINDA NOELIA DEL RO', N'ROJAS RUIZ', N'45447806', N'MIRAFLORES', N'MIRAFLORES', N'LIMA', N'999138090', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (68, N'CAROLAY WENDY', N'POMIANO RAMOS', N'48606525', N'CHORRILLOS', N'CHORRILLOS', N'LIMA', N'970023312', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (69, N'CAMILA', N'ALFARO PEQUEÑO', N'76183869', N'SURQUILLO', N'SURQUILLO', N'LIMA', N'987396322', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (70, N'FERNANDO', N'CERDAN ALIAGA', N'10102570', N'AV SAN MARTIN 776 VILLA MARIA', N'VILLA MARIA TRIUNFO', N'LIMA', N'990123256', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (71, N'TORIBIO JORGE', N'TEMPLE CUPEN', N'07596688', N'CALLE ALFREDO ICASA 240 DPTO 301', N'SAN MIGUEL', N'LIMA', N'5610895', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (72, N'JAKELINE', N'MANCHEGO MANCHEGO', N'44989415', N'Calle La conquista 340 casa 101 urb. El Derby', N'LA MOLINA', N'LIMA', N'959264723', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (73, N'MARIA', N'PACHECO PIEDRA', N'06645287', N'CHORRILLOS', N'CHORRILLOS', N'LIMA', N'2547179', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (74, N'MARIA', N'CHONG RODRIGUEZ', N'07209360', N'SAN ISIDRO', N'SAN ISIDRO', N'LIMA', N'999658605', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (75, N'KARINA CRISTINA', N'HERNANDEZ CORDOVA', N'40560116', N'CALLE JOHANN STRAUSS 220', N'SAN BORJA', N'LIMA', N'998731230', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (76, N'FLOR YSABEL', N'CHICCHON CHAVEZ', N'08154465', N'Calle PORTINARI  144 Int. Casa', N'SAN MIGUEL', N'LIMA', N'943418942', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (77, N'NANY', N'VALENCIA SULCA', N'09851541', N'PUEBLO LIBRE - AV.MANUEL SIPRIANO DULANTO 1126  DPT.502 REF.A MEDICA CUADRA DE S', N'PUEBLO LIBRE', N'LIMA', N'987034886', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (78, N'CLAUDIA GISELA', N'TADDEY GARCIA', N'10802821', N'Av San Martín 625', N'SAN ISIDRO', N'LIMA', N'987420369', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (79, N'NORA', N'NESTARES CASTRO', N'08724880', N'SAN MIGUEL', N'SAN MIGUEL', N'LIMA', N'999961122', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (80, N'OSCAR', N'SABALA SABALA', N'10472102', N'Calle Paseo de los Condes 171 Int. 102', N'LA MOLINA', N'LIMA', N'985609557', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (81, N'CRISTHIAM JOSE', N'CUBAS MATEO', N'42789812', N'URB SOL DE HUAMPANIO 3ERA ESTAPA MZ A LT38', N'CHACLACAYO', N'LIMA', N'992511757', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (82, N'ALMA ROSA SOLANGE', N'VILLAGARCIA ROMERO', N'74134740', N'J NICOLAS DE PIEROLA 117 DPTO 605', N'PUEBLO LIBRE', N'LIMA', N'922906721', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (83, N'MARCELO', N'OCHOA ZAPANA', N'70772029', N'CHORRILLOS', N'CHORRILLOS', N'LIMA', N'978213023', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (84, N'GIULIANA', N'LOLLI RAMIREZ', N'40990005', N'MAGDALENA', N'MAGDALENA DEL MAR', N'LIMA', N'988547444', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (85, N'CLAUDIA', N'CHAVEZ AGUERO', N'43844169', N'Avenida Canadá  1180 Int. 1705', N'LA VICTORIA', N'LIMA', N'966058735', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (86, N'RICADO JOSE', N'CORDON CORDON', N'00668187', N'LA VICTORIA', N'LA VICTORIA', N'LIMA', N'950626569', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (87, N'JONAS MIJAEL', N'AQUINO LOZANO', N'48047453', N'Calle Nogales 251 11 MZ A Int. 401', N'SAN JUAN MIRAFLORES', N'LIMA', N'949239058', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (88, N'LUIS', N'COSTA ARRIETA', N'07921619', N'SURCO', N'SANTIAGO DE SURCO', N'LIMA', N'986037067', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (89, N'MAYLI MAYUMI', N'PALACIOS ESPINOZA', N'47661337', N'LA MOLINA', N'LA MOLINA', N'LIMA', N'944245035', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (90, N'STEPHANIE GABRIELA', N'PECHO ANGELES', N'47875585', N'JR BOGOTA MZ I LT 16 SIWANI- ATE', N'ATE', N'LIMA', N'997934913', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (91, N'LUISMIGUEL', N'ZUÑIGA ZEGARRA', N'44223813', N'Calle Doña Delmira 270 Int. 301', N'PUEBLO LIBRE', N'LIMA', N'956229560', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (92, N'BASILIO ALFREDO', N'RUIZ FLORIAN', N'46086506', N'MZ S4 LT4 PSJ SICUARI SECTOR 12 DE NOVIEMBRE- PAMPLONA ALTA', N'SAN JUAN MIRAFLORES', N'LIMA', N'994755984', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (93, N'GUILIANA GISELLA', N'MORELLO ARCE', N'32938977', N'CALLE LOMA DE LAS GARDENIAS N°271 . SANTIAGO', N'SANTIAGO DE SURCO', N'LIMA', N'00000', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (94, N'MILAGROS MERCEDES', N'BASURTO VALLADARES', N'47134439', N'JR. AMAZONAS 130 TORRE B DPTO 803', N'PUEBLO LIBRE', N'LIMA', N'994491398', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (95, N'ANGELA CHRISTINA', N'GONZALES GIL', N'71951220', N'MZ B LT 30 GRUPO3 SECTOR 10 OASIS DE VILLA', N'VILLA EL SALVADOR', N'LIMA', N'916299874', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (96, N'JORGE ANTONIO', N'LUJAN PEÑAFIEL', N'70671541', N'CALLE GONZALEZ 446', N'SAN MIGUEL', N'LIMA', N'962992749', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (97, N'ROXANA', N'TAPIA NAVARRO', N'41251983', N'Avenida arnaldo marquez  1559 Int. b', N'JESUS MARIA', N'LIMA', N'981270850', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (98, N'SUSAN', N'ZEIDAN KAHHAT', N'45372047', N'SURCO', N'SANTIAGO DE SURCO', N'LIMA', N'946014875', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (99, N'ROSINA ALEJANDRA', N'HUAMAN CARNERO', N'43160800', N'XX', N'SAN BORJA', N'LIMA', N'993762432', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (100, N'ANA ELBA', N'HERNANDEZ BOCKOS', N'07274568', N'JR IGNACIO DE LOYOLA 106 DPT 802 -AL LADO PARK PLAZA MIRAFLORES', N'MIRAFLORES', N'LIMA', N'997142061', 1, CAST(N'2022-01-28T20:08:48.970' AS DateTime), CAST(N'2022-01-28T20:08:48.970' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (101, N'Wilmer Armando', N'Castro Carrasco', N'47479229', N'Av Independencia', N'SAN JUAN DE LURIGANCHO', N'LIMA', N'947998019', 1, CAST(N'2022-02-03T03:45:00.220' AS DateTime), CAST(N'2022-02-03T03:45:00.220' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (102, N'PRUEBA@HOTMAIL.COM', N'PRUEBA@HOTMAIL.COM', N'PRUEBA@HOTMAIL.COM', N'PRUEBA@HOTMAIL.COM', N'PRUEBA@HOTMAIL.COM', N'PRUEBA@HOTMAIL.COM', N'PRUEBA', 1, CAST(N'2022-02-04T23:10:31.277' AS DateTime), CAST(N'2022-02-04T23:10:31.277' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (103, N'prueba2', N'prueba2', N'98989898', N'prueba2', N'prueba2', N'prueba2', N'989898989', 1, CAST(N'2022-02-04T23:26:52.763' AS DateTime), CAST(N'2022-02-04T23:26:52.763' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (105, N'prueba3', N'prueba3', N'11111111', N'prueba3', N'prueba', N'prueba', N'111111111', 1, CAST(N'2022-02-04T23:38:27.700' AS DateTime), CAST(N'2022-02-04T23:38:27.700' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (106, N'prueba4', N'prueba4', N'2222222', N'prueba4', N'prueba4', N'prueba4', N'222222222', 1, CAST(N'2022-02-04T23:40:42.727' AS DateTime), CAST(N'2022-02-04T23:40:42.727' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (107, N'sis', N'sis', N'00000001', N'sis', N'sis', N'sis', N'112131211', 1, CAST(N'2022-02-04T23:52:48.333' AS DateTime), CAST(N'2022-02-04T23:52:48.333' AS DateTime))
GO
INSERT [dbo].[CO_Clientes] ([IdPersona], [Nombres], [Apellidos], [Documento], [Direccion], [Distrito], [Provincia], [Telefono], [Estado], [FechaCreacion], [FechaActualizacion]) VALUES (108, N'Jonas', N'Aquino', N'47478282', N'Av Independencia', N'SJL', N'LIMA', N'989858585', 1, CAST(N'2022-02-05T09:18:51.777' AS DateTime), CAST(N'2022-02-05T09:18:51.777' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CO_Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[CO_Estado] ON 
GO
INSERT [dbo].[CO_Estado] ([IdEstado], [Descripcion], [FlagEstado]) VALUES (1, N'PENDIENTE ENVIO', 1)
GO
INSERT [dbo].[CO_Estado] ([IdEstado], [Descripcion], [FlagEstado]) VALUES (2, N'EN PROCESO', 1)
GO
INSERT [dbo].[CO_Estado] ([IdEstado], [Descripcion], [FlagEstado]) VALUES (3, N'ENVIADO', 1)
GO
SET IDENTITY_INSERT [dbo].[CO_Estado] OFF
GO
SET IDENTITY_INSERT [dbo].[CO_Pedido] ON 
GO
INSERT [dbo].[CO_Pedido] ([Id], [Sucursal], [IdCliente], [FechaPedido], [MontoTotal], [Estado]) VALUES (1, N'1000', 5, CAST(N'2022-01-29T00:23:11.920' AS DateTime), CAST(226.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[CO_Pedido] ([Id], [Sucursal], [IdCliente], [FechaPedido], [MontoTotal], [Estado]) VALUES (2, N'1700', 41, CAST(N'2022-01-29T00:23:11.920' AS DateTime), CAST(80.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[CO_Pedido] ([Id], [Sucursal], [IdCliente], [FechaPedido], [MontoTotal], [Estado]) VALUES (3, N'1700', 41, CAST(N'2022-01-29T00:23:11.920' AS DateTime), CAST(152.50 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[CO_Pedido] ([Id], [Sucursal], [IdCliente], [FechaPedido], [MontoTotal], [Estado]) VALUES (4, N'0200', 59, CAST(N'2022-01-29T00:23:11.920' AS DateTime), CAST(28.50 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[CO_Pedido] ([Id], [Sucursal], [IdCliente], [FechaPedido], [MontoTotal], [Estado]) VALUES (5, N'0200', 63, CAST(N'2022-01-29T00:23:11.920' AS DateTime), CAST(124.00 AS Decimal(18, 2)), 3)
GO
SET IDENTITY_INSERT [dbo].[CO_Pedido] OFF
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (5, 3060, CAST(25.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (1, 3069, CAST(25.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (2, 3071, CAST(25.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (3, 3110, CAST(25.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (4, 3114, CAST(25.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (5, 3114, CAST(25.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (4, 2426, CAST(50.00 AS Decimal(18, 2)), CAST(12.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (1, 3085, CAST(25.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (5, 3086, CAST(25.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (3, 3086, CAST(25.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (2, 3086, CAST(25.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (2, 3087, CAST(25.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (3, 3087, CAST(25.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (1, 3462, CAST(25.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (1, 3390, CAST(25.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (5, 3486, CAST(25.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (3, 3486, CAST(25.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (1, 3508, CAST(25.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (3, 3530, CAST(25.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (5, 3418, CAST(25.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (1, 3418, CAST(25.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (1, 3420, CAST(25.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_PedidoDetalle] ([IdPedido], [Item], [Cantidad], [Total]) VALUES (3, 3309, CAST(1.00 AS Decimal(18, 2)), CAST(44.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'0100', N'Planta - San Luis', N'Felipe Salaverry 151')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'0200', N'Tienda - San Isidro', N'CC San Isidro - Av. Paseo de la Republica 3440')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'0300', N'Tienda - Galicia', N'Calle Galicia 106 - Surco')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'0400', N'Tienda - Mariscal Castilla', N'Av. Mariscal Castilla 768 - Surco')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'0500', N'Tienda - Casuarinas', N'Jr. Rivero Ustaruiz, Mariano 103 int 4')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'0600', N'Tienda - Benavides', N'Av. Benavides 4638 - Surco')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'0700', N'Tienda - Villa 1', N'Av. Hernando de Lavalle s/n Urb.C.Club de Villa')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'0800', N'Tienda - Villa 2', N'Av. Hernando de Lavalle s/n Urb.C.Club de Villa')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'0900', N'Tienda - Villa 3', N'Av. Hernando de Lavalle s/n Urb.C.Club de Villa')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'1000', N'Delivery', N'Calle Galicia 106 - Surco')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'1100', N'Tienda - Eloy Ureta', N'Calle Eloy Ureta 261 Urb. El Pino San Luis')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'1200', N'Tienda - Santa Rita', N'Av. Benavides 2088')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'1300', N'Tienda - Aviacion', N'Av. Aviacion 3327')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'1400', N'Tienda - Molicentro', N'Av. La Molina 2852, La Molina')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'1500', N'Tienda - Salaverry', N'Av. Salaverry 2007')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'1700', N'Tienda - Gonzalez Prada', N'Av. Javier Prado Oeste 335')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'2000', N'Tienda - Sol de la Molina', N'URB. Sol de la Molina Jr. San Sebastian 107')
GO
INSERT [dbo].[CO_Tiendas] ([CodTienda], [Descripcion], [Direccion]) VALUES (N'2100', N'Tienda - Aviacion 02', N'Av. Aviación N°A-58 Urbanización Papa Juan XXIII, Distrito San Borja')
GO
SET IDENTITY_INSERT [dbo].[WB_Usuario] ON 
GO
INSERT [dbo].[WB_Usuario] ([IdUsuario], [Password], [Email], [TipoUsuario], [Estado], [IdCliente], [FechaCreacion], [FechaActualizacion], [Rol]) VALUES (1, 0x02008E06B45E03AA021BB072EAD4B60C2754024075271D59F3AE1D0DF209D0FCFD3CF2D75A9E261852C69B465359F340975CE09D2911BB17F90497F815EEA1147C9B008A2A24, N'william@hotmail.com', 1, 1, 101, CAST(N'2022-02-03T03:57:59.603' AS DateTime), CAST(N'2022-02-03T03:57:59.603' AS DateTime), 1)
GO
INSERT [dbo].[WB_Usuario] ([IdUsuario], [Password], [Email], [TipoUsuario], [Estado], [IdCliente], [FechaCreacion], [FechaActualizacion], [Rol]) VALUES (2, 0x020029BFE613A0348F0887A94EC4AFCCE082EC14E60C905630054439F5BAEFF09465B28C5ED8F49814E215944F697EC9D39B6812B5E21AE4147BDB6E16CA4C25CE69C7EEF1AB, N'hernandez@hotmail.com', 1, 1, 100, CAST(N'2022-02-04T20:42:59.830' AS DateTime), CAST(N'2022-02-04T20:42:59.830' AS DateTime), 1)
GO
INSERT [dbo].[WB_Usuario] ([IdUsuario], [Password], [Email], [TipoUsuario], [Estado], [IdCliente], [FechaCreacion], [FechaActualizacion], [Rol]) VALUES (3, 0x02002019400FCD84FF2ACD7B25CCF42B677E08AA3623C435712B03AE20E93F65626B7E97A7A4CB2985A8E5C1C991C093D51D42378538D82954A2302FD0A1796E56F8619965D1, N'PRUEBA', 2, 1, 102, CAST(N'2022-02-04T23:10:31.277' AS DateTime), CAST(N'2022-02-05T08:41:03.030' AS DateTime), 2)
GO
INSERT [dbo].[WB_Usuario] ([IdUsuario], [Password], [Email], [TipoUsuario], [Estado], [IdCliente], [FechaCreacion], [FechaActualizacion], [Rol]) VALUES (4, 0x02008DC905B20830DE1258F62A1EE274E255E9ACD4C05FE58D0F7A3E3F83F5460EA96761F1233F94108991473ADFF3BDB3CCFD29C183F14A8A441A9828806148960FE1FD6474, N'prueba2@hotmail.com', 1, 1, 103, CAST(N'2022-02-04T23:26:52.763' AS DateTime), CAST(N'2022-02-04T23:26:52.763' AS DateTime), 2)
GO
INSERT [dbo].[WB_Usuario] ([IdUsuario], [Password], [Email], [TipoUsuario], [Estado], [IdCliente], [FechaCreacion], [FechaActualizacion], [Rol]) VALUES (6, 0x0200142297FC1C7AF6A9F40F9623C4F37732FBFD6D363B55927F458DAF9D4FA19F40B7C05B88529A80182968F8F448ED282A123D1B3CDEED192722145C86627D8B5DC21481C7, N'prueba3@hotmail.com', 1, 1, 105, CAST(N'2022-02-04T23:38:27.700' AS DateTime), CAST(N'2022-02-04T23:38:27.700' AS DateTime), 2)
GO
INSERT [dbo].[WB_Usuario] ([IdUsuario], [Password], [Email], [TipoUsuario], [Estado], [IdCliente], [FechaCreacion], [FechaActualizacion], [Rol]) VALUES (7, 0x02004027CAD430D056DBBE9F86F49A74C9F2D2BE537D1A0DA2C5D26756C35B81691C3F80E65BF023D08C233DB0308226EA0CCFEB7C901C5A16C45FB2007311135F79BA6764B8, N'prueba4@hotmail.com', 1, 1, 106, CAST(N'2022-02-04T23:40:42.727' AS DateTime), CAST(N'2022-02-04T23:40:42.727' AS DateTime), 2)
GO
INSERT [dbo].[WB_Usuario] ([IdUsuario], [Password], [Email], [TipoUsuario], [Estado], [IdCliente], [FechaCreacion], [FechaActualizacion], [Rol]) VALUES (8, 0x0200376D5D811DE5AEF901BC6ED4CF89E59C0934345028968EC9C3920B3B3BB113824A81ECDBFA816137340BEFC1B2A0FC258A3B484914C6C55DCB4C39766432F677BD1163DA, N'sis@hotmail.com', 1, 1, 107, CAST(N'2022-02-04T23:52:48.333' AS DateTime), CAST(N'2022-02-04T23:52:48.333' AS DateTime), 2)
GO
INSERT [dbo].[WB_Usuario] ([IdUsuario], [Password], [Email], [TipoUsuario], [Estado], [IdCliente], [FechaCreacion], [FechaActualizacion], [Rol]) VALUES (9, 0x0200CF6C2235985CED16CAA3EB05F251FFC702076BAF9C3E5ADEA37B1C4B61D9D2D32BE3DED2040D4F6845703989775098BBA8370A62256D294C6023CE86A7D5CAA3104C3CD8, N'prueba6@hotmail.com', 1, 1, 108, CAST(N'2022-02-05T09:18:51.777' AS DateTime), CAST(N'2022-02-05T09:18:51.777' AS DateTime), 2)
GO
SET IDENTITY_INSERT [dbo].[WB_Usuario] OFF
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (10, 10, N'ABARROTES', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (10, 11, N'BEBIDAS', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (10, 12, N'FRESCOS', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (20, 20, N'BOLSAS', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (20, 21, N'ENVASES', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (20, 22, N'LAMINAS Y FILMS', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (20, 23, N'MENAJERIA', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (20, 24, N'PISOS, BASES,PIROTINES Y CINTAS', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (30, 30, N'PANADERIA', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (30, 31, N'PANADERIA RB', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (30, 32, N'PASTAS RB', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (30, 33, N'PASTELERIA', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (30, 34, N'PASTELERIA RB', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (30, 35, N'POSTRES FINOS', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (30, 36, N'POSTRES FINOS RB', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (30, 37, N'SANGUCHITOS RB', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (30, 38, N'TORTAS ESPECIALES RB', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (30, 39, N'COCINA CENTRAL RB', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (40, 40, N'PANADERIA', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (40, 41, N'PASTAS', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (40, 42, N'PASTELERIA', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (40, 43, N'POSTRES FINOS', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (40, 44, N'SANDWICHES', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (40, 45, N'TORTAS ESPECIALES', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (40, 46, N'COCINA CENTRAL', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (50, 50, N'DESINFECCION', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (50, 51, N'LIMPIEZA', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (60, 60, N'PRODUCTOS INTERMEDIOS', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (60, 61, N'PRODUCTOS TERMINADOS', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (70, 70, N'PLANTA', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (70, 71, N'TIENDAS', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (80, 80, N'ABARROTES', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (80, 81, N'BEBIDAS', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (80, 82, N'FRESCOS', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (80, 83, N'SUMINISTROS', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (80, 84, N'DULCES PERSONALES', 1)
GO
INSERT [dbo].[WH_ClaseFamilia] ([Linea], [Familia], [DescripcionLocal], [Estado]) VALUES (80, 85, N'PRODUCTOS ECOLOGICOS', 1)
GO
SET IDENTITY_INSERT [dbo].[WH_ClaseLinea] ON 
GO
INSERT [dbo].[WH_ClaseLinea] ([Linea], [DescripcionLocal], [Estado]) VALUES (10, N'Materia prima', 1)
GO
INSERT [dbo].[WH_ClaseLinea] ([Linea], [DescripcionLocal], [Estado]) VALUES (20, N'Descartables', 1)
GO
INSERT [dbo].[WH_ClaseLinea] ([Linea], [DescripcionLocal], [Estado]) VALUES (30, N'Productos intermedios ', 1)
GO
INSERT [dbo].[WH_ClaseLinea] ([Linea], [DescripcionLocal], [Estado]) VALUES (40, N'Productos terminados', 1)
GO
INSERT [dbo].[WH_ClaseLinea] ([Linea], [DescripcionLocal], [Estado]) VALUES (50, N'Limpieza y desinfeccion', 1)
GO
INSERT [dbo].[WH_ClaseLinea] ([Linea], [DescripcionLocal], [Estado]) VALUES (60, N'Cafeteria', 1)
GO
INSERT [dbo].[WH_ClaseLinea] ([Linea], [DescripcionLocal], [Estado]) VALUES (70, N'Suministros', 1)
GO
INSERT [dbo].[WH_ClaseLinea] ([Linea], [DescripcionLocal], [Estado]) VALUES (80, N'Mercaderia', 1)
GO
INSERT [dbo].[WH_ClaseLinea] ([Linea], [DescripcionLocal], [Estado]) VALUES (90, NULL, 0)
GO
INSERT [dbo].[WH_ClaseLinea] ([Linea], [DescripcionLocal], [Estado]) VALUES (100, N'Cafeteria2', 0)
GO
INSERT [dbo].[WH_ClaseLinea] ([Linea], [DescripcionLocal], [Estado]) VALUES (110, N'12123', 0)
GO
INSERT [dbo].[WH_ClaseLinea] ([Linea], [DescripcionLocal], [Estado]) VALUES (120, N'sistemas', 1)
GO
INSERT [dbo].[WH_ClaseLinea] ([Linea], [DescripcionLocal], [Estado]) VALUES (130, N'prueba13', 1)
GO
INSERT [dbo].[WH_ClaseLinea] ([Linea], [DescripcionLocal], [Estado]) VALUES (140, N'prueba14', 1)
GO
SET IDENTITY_INSERT [dbo].[WH_ClaseLinea] OFF
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 100, N'AZÚCAR Y EDULCORANTES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 101, N'CAFÉ E INFUSIONES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 102, N'CARAMELOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 103, N'CHOCOLATES Y SUCEDANEOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 104, N'CONSERVAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 105, N'ENCURTIDOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 106, N'ESCENCIAS Y COLORANTES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 107, N'ESPECIAS Y SABORIZANTES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 108, N'FIDEOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 109, N'FRUTOS SECOS Y CONFITADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 110, N'GALLETAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 111, N'GEL Y TINTES PARA TORTA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 112, N'GRANOS Y MENESTRAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 113, N'GRASAS ALIMENTICIAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 114, N'HARINAS Y SUBPRODUCTOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 115, N'HIERBAS AROMÁTICAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 116, N'HONGOS SECOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 117, N'HUEVOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 118, N'INSUMOS DE PANADERIA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 119, N'INSUMOS DE PASTELERIA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 120, N'JALEAS, MERMELADAS Y MIEL', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 121, N'LECHE Y DERIVADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 122, N'OTROS INSUMOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 123, N'PREMEZCLAS PANADERIA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 124, N'PREMEZCLAS PASTELERIA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 10, 125, N'SALSAS Y CREMAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 11, 126, N'LICORES VARIADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 12, 127, N'CARNES Y EMBUTIDOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 12, 128, N'FRUTAS ENTERAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 12, 129, N'FRUTAS PROCESADAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 12, 130, N'HONGOS FRESCOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 12, 131, N'LACTEOS, QUESOS Y DERIVADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 12, 132, N'OTROS INSUMOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (10, 12, 133, N'VERDURAS, HORATLIZAS Y TUBERCULOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (20, 20, 200, N'BOLSAS DE PAPEL', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (20, 20, 201, N'BOLSAS PLASTICAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (20, 21, 202, N'ENVASES DE ALUMINIO Y TAPA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (20, 21, 203, N'ENVASES DE CARTÓN', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (20, 21, 204, N'ENVASES PLASTICOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (20, 21, 205, N'VASOS Y TAPAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (20, 22, 206, N'FILM', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (20, 22, 207, N'LÁMINAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (20, 23, 208, N'CUBIERTOS Y PLATOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (20, 24, 209, N'BASES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (20, 24, 210, N'CINTAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (20, 24, 211, N'PIROTINES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (20, 24, 212, N'PISOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 30, 300, N'PALOS DE HARINA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 30, 301, N'PAN MOLDE', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 30, 302, N'PANES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 30, 303, N'PANES DULCES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 31, 304, N'MASAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 32, 305, N'PASTA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 32, 306, N'RELLENOS SALADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 32, 307, N'SALSAS Y ALIÑOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 33, 308, N'BISCOCHOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 33, 309, N'DULCES ENTEROS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 33, 310, N'DULCES PERSONALES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 33, 311, N'EMPANADAS Y PIZZAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 33, 312, N'MINI DULCES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 33, 313, N'MINI SALADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 33, 314, N'SALADOS ENTEROS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 33, 335, N'SALADOS PERSONALES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 34, 315, N'CREMAS DULCES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 34, 316, N'CREMAS SALADAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 34, 317, N'MASAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 34, 318, N'MIEL, JALEAS Y JARABES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 34, 319, N'RELLENOS DUCES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 34, 320, N'RELLENOS SALADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 35, 321, N'DULCES ENTEROS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 35, 322, N'MASAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 36, 323, N'BISCOCHUELOS Y KEKES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 36, 324, N'CHOCOLATES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 36, 325, N'CREMAS DULCES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 36, 326, N'MASAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 36, 327, N'MIEL, JALEAS Y JARABES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 37, 328, N'CARNES RB', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 37, 329, N'CONCENTRADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 37, 330, N'RELLENOS DULCES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 37, 331, N'RELLENOS SALADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 38, 332, N'BISCOCHUELOS Y KEKES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 38, 333, N'CREMAS DULCES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 38, 334, N'MASA ELASTICA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (30, 39, 335, N'PREPARADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 40, 400, N'BOCADITOS CROCANTES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 40, 401, N'DULCES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 40, 402, N'MINI PANES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 40, 403, N'PAN DECORATIVO', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 40, 404, N'PAN DULCE', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 40, 405, N'PAN EMBOLSADO', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 40, 406, N'PAN MOLDE', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 40, 407, N'PAN MOLIDO', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 40, 408, N'PAN PIZZA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 40, 409, N'PAN SALADO', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 40, 410, N'PAN TIENDA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 41, 411, N'FETUCCINI', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 41, 412, N'LASAGÑAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 41, 413, N'PASTAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 41, 414, N'RAVIOLES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 41, 415, N'SALSAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 41, 455, N'JUGOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 41, 456, N'ENSALADAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 42, 416, N'DULCES ENTEROS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 42, 417, N'DULCES PERSONALES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 42, 418, N'DULCES POR KILO', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 42, 419, N'DULCES PORCIONADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 42, 420, N'EMPANADAS Y PIZZAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 42, 421, N'KEKES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 42, 422, N'MINI DULCES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 42, 423, N'MINI SALADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 42, 424, N'SALADOS ENTEROS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 42, 425, N'SALADOS PERSONALES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 42, 426, N'SALADOS PORCIONADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 42, 427, N'TORTAS BEEPER', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 42, 455, N'PACKS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 428, N'CHEESCAKE PORCION', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 429, N'CHEESECAKE ENTERO', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 430, N'COPITAS VARIADA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 431, N'CREMA VOLTEADA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 432, N'MANA Y TRUFAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 433, N'MERENGADO ENTERO', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 434, N'MERENGADO PORCION', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 435, N'POSTRES FINOS X KILOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 436, N'ROLLOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 437, N'ROLLOS PORCION', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 438, N'SOUFFLE PORCION', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 439, N'SOUFLE ENTERO', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 440, N'TIRAMISU', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 441, N'TORTAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 442, N'TORTAS BEEPER ENTERO', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 443, N'TORTAS BEEPER PORCION', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 444, N'TORTAS VARIAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 43, 445, N'TRES LECHES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 44, 446, N'MINI MOLDES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 44, 447, N'MINI PANCITOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 44, 448, N'MOLDE PERSONALES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 44, 449, N'PANES PERSONALES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 45, 450, N'MINI DULCES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 45, 451, N'TORTA DIFICULTAD', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 45, 452, N'TORTA ELASTICA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 45, 453, N'TORTA MERENGUE', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 45, 454, N'TORTAS VARIAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (40, 46, 455, N'ALIÑOS Y CARNES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 50, 500, N'CERAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 50, 501, N'DESINFECTANTES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 50, 502, N'DETERGENTES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 50, 503, N'GEL', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 50, 504, N'INSECTICIDA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 50, 505, N'JABONES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 50, 506, N'SANITISANTE', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 51, 507, N'AROMATIZADORES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 51, 508, N'BOLSAS LIMPIEZA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 51, 509, N'EPP', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 51, 510, N'PAPEL LIMPIEZA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 51, 511, N'UNIFORMES DESCARTABLES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 51, 512, N'UTILES DE ASEO', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 51, 513, N'UNIFORMES TIENDA AT', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 51, 514, N'UNIFORMES TIENDA COC', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (50, 51, 515, N'UNIFORMES PLANTA PROD', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 60, 600, N'ALIÑOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 60, 601, N'BEBIDAS RB', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 60, 602, N'CARNES RB', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 60, 603, N'CREMAS RB', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 60, 604, N'VERDURAS RB', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 60, 617, N'MASA RB', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 61, 605, N'CARTA ADICIONAL', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 61, 606, N'CARTA BEBIDAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 61, 607, N'CARTA CAFES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 61, 608, N'CARTA DESAYUNOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 61, 609, N'CARTA ENSALADAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 61, 610, N'CARTA JUGOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 61, 611, N'CARTA PLATO', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 61, 612, N'CARTA SANDWICHES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 61, 613, N'RECETAS PROPIEDAD ADICIONALES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 61, 614, N'RECETAS PROPIEDAD CON', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 61, 615, N'RECETAS PROPIEDAD SABOR', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (60, 61, 616, N'RECETAS PROPIEDAD SALSA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (70, 70, 700, N'ACCESORIOS PASTELERIA', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (70, 70, 701, N'CINTAS Y PRECINTOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (70, 70, 702, N'ENVASES PLASTICOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (70, 70, 703, N'ETIQUETAS Y ACCESORIOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (70, 70, 704, N'MANGAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (70, 71, 705, N'CONTOMETROS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (70, 71, 706, N'FORMATOS VARIOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 80, 800, N'ABARROTES VARIADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 80, 801, N'CONSERVAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 80, 802, N'GRANOS Y MENESTRAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 80, 803, N'GRASAS ALIMENTICIAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 80, 804, N'SALSAS, CREMAS Y SNACKS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 80, 805, N'SNACKS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 80, 826, N'CONDIMENTOS Y FRUTOS SECOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 81, 806, N'ENERGIZANTES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 81, 807, N'GASEOSAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 81, 808, N'JUGOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 81, 809, N'LICORES VARIADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 81, 810, N'VINOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 81, 811, N'CERVEZAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 82, 812, N'CARNES Y EMBUTIDOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 82, 813, N'ENRROLLADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 82, 814, N'FRUTAS ENTERAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 82, 815, N'LACTEOS, QUESOS Y DERIVADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 82, 816, N'TAMALES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 82, 817, N'VERDURAS, HORATLIZAS Y TUBERCULOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 83, 818, N'CONTOMETROS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 83, 819, N'VELITAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 83, 999, N'REVISAR', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 84, 821, N'BOMBONES', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 84, 822, N'BAÑADOS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 84, 823, N'TABLETAS', 1)
GO
INSERT [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia], [DescripcionLocal], [Estado]) VALUES (80, 85, 824, N'BOLSAS DE TELA', 1)
GO
SET IDENTITY_INSERT [dbo].[WH_ItemMast] ON 
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (2426, 40, 40, 402, N'MINI PETIPAN', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3060, 40, 42, 422, N'MINI ALFAJOR', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3069, 40, 42, 422, N'MINI CARROT CAKE', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3071, 40, 42, 422, N'MINI CHEESECAKE FRESA', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3085, 40, 42, 422, N'MINI PIE LIMON', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3086, 40, 42, 422, N'MINI PIE MANZANA', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3087, 40, 42, 422, N'MINI PIONONO MANJAR', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3110, 40, 42, 423, N'MINI EMPANADA CARNE', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3114, 40, 42, 423, N'MINI EMPANADA POLLO', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3309, 40, 43, 439, N'SOUFFLE GUANABANA ENTERO', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3390, 40, 44, 446, N'MINI SANDWICH HUEVO TOCINO', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3418, 40, 44, 446, N'MINI SANDWICH TRIPLE', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3420, 40, 44, 446, N'MINI SANDWICH TRIPLE JAMON QUESO POLLO', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3462, 40, 44, 447, N'MINI SANDWICH BUTIFARRA', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3486, 40, 44, 447, N'MINI SANDWICH JAMON QUESO CROISSANT', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3508, 40, 44, 447, N'MINI SANDWICH POLLO DURAZNO CROISSANT', N'UNIDAD', 1)
GO
INSERT [dbo].[WH_ItemMast] ([Item], [Linea], [Familia], [SubFamilia], [DescripcionLocal], [UnidadCodigo], [Estado]) VALUES (3530, 40, 44, 447, N'MINI SANDWICH POLLO PETIPAN', N'UNIDAD', 1)
GO
SET IDENTITY_INSERT [dbo].[WH_ItemMast] OFF
GO
ALTER TABLE [dbo].[CO_Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Clientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CO_Clientes] ([IdPersona])
GO
ALTER TABLE [dbo].[CO_Pedido] CHECK CONSTRAINT [FK_Pedido_Clientes]
GO
ALTER TABLE [dbo].[CO_Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Estado] FOREIGN KEY([Estado])
REFERENCES [dbo].[CO_Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[CO_Pedido] CHECK CONSTRAINT [FK_Pedido_Estado]
GO
ALTER TABLE [dbo].[CO_Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Tiendas] FOREIGN KEY([Sucursal])
REFERENCES [dbo].[CO_Tiendas] ([CodTienda])
GO
ALTER TABLE [dbo].[CO_Pedido] CHECK CONSTRAINT [FK_Pedido_Tiendas]
GO
ALTER TABLE [dbo].[CO_PedidoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidoDetalle_ItemMast] FOREIGN KEY([Item])
REFERENCES [dbo].[WH_ItemMast] ([Item])
GO
ALTER TABLE [dbo].[CO_PedidoDetalle] CHECK CONSTRAINT [FK_PedidoDetalle_ItemMast]
GO
ALTER TABLE [dbo].[CO_PedidoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PedidoDetalle_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[CO_Pedido] ([Id])
GO
ALTER TABLE [dbo].[CO_PedidoDetalle] CHECK CONSTRAINT [FK_PedidoDetalle_Pedido]
GO
ALTER TABLE [dbo].[WB_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Clientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CO_Clientes] ([IdPersona])
GO
ALTER TABLE [dbo].[WB_Usuario] CHECK CONSTRAINT [FK_Usuario_Clientes]
GO
ALTER TABLE [dbo].[WH_ClaseFamilia]  WITH CHECK ADD  CONSTRAINT [FK__ClaseFami__Linea__267ABA7A] FOREIGN KEY([Linea])
REFERENCES [dbo].[WH_ClaseLinea] ([Linea])
GO
ALTER TABLE [dbo].[WH_ClaseFamilia] CHECK CONSTRAINT [FK__ClaseFami__Linea__267ABA7A]
GO
ALTER TABLE [dbo].[WH_ClaseSubFamilia]  WITH CHECK ADD  CONSTRAINT [FK__ClaseSubFamilia__33D4B598] FOREIGN KEY([Linea], [Familia])
REFERENCES [dbo].[WH_ClaseFamilia] ([Linea], [Familia])
GO
ALTER TABLE [dbo].[WH_ClaseSubFamilia] CHECK CONSTRAINT [FK__ClaseSubFamilia__33D4B598]
GO
ALTER TABLE [dbo].[WH_ItemMast]  WITH NOCHECK ADD  CONSTRAINT [FK__WH_ItemMast__4376EBDB] FOREIGN KEY([Linea], [Familia], [SubFamilia])
REFERENCES [dbo].[WH_ClaseSubFamilia] ([Linea], [Familia], [SubFamilia])
GO
ALTER TABLE [dbo].[WH_ItemMast] CHECK CONSTRAINT [FK__WH_ItemMast__4376EBDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarUsuario]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ActualizarUsuario]
(
@email nvarchar(50),
@estado bit,
@rol int,
@id int
)
AS
DECLARE @Error NVARCHAR(100)
BEGIN TRY

UPDATE [dbo].WB_Usuario SET Email = @email, Rol = @rol ,Estado = @estado, FechaActualizacion = GETDATE()
WHERE IdUsuario = @id

END TRY
BEGIN CATCH
SET @Error = '2-Error en el procedimiento: ' + ERROR_PROCEDURE() + ', Mensaje: '+
ERROR_MESSAGE() + 'En la linea: ' + convert(varchar(20),ERROR_LINE())
ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearLinea]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CrearLinea]
(
@Descripcion nvarchar(50),
@Estado bit
)
AS
BEGIN TRY
IF NOT EXISTS(SELECT * FROM [dbo].WH_ClaseLinea where DescripcionLocal = @Descripcion)
BEGIN
BEGIN TRAN

INSERT INTO [dbo].WH_ClaseLinea(DescripcionLocal,Estado)
VALUES (@Descripcion,@Estado)
 --paso 2 insert
--paso 3 update
--paso 4 insert XXXXXXXX

COMMIT TRAN

DECLARE @OV_Message_Error nvarchar(50)
SET @OV_Message_Error = 'OK'
--SELECT DescripcionLocal,Estado
--From [dbo].WH_ClaseLinea
--where DescripcionLocal = @Descripcion
END
ELSE BEGIN
SET @OV_Message_Error = '1-El usuario ya existe'
END
END TRY
BEGIN CATCH
SET @OV_Message_Error = '2-Error en el procedimiento: ' + ERROR_PROCEDURE() + ', Mensaje: '+
ERROR_MESSAGE() + 'En la linea: ' + convert(varchar(20),ERROR_LINE())
ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearUsuarioWeb]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearUsuarioWeb]
(
	@Nombre nvarchar(50),
	@Apellido nvarchar(100),
	@Documento nvarchar(20),
	@Direccion nvarchar(150),
	@Distrito nvarchar(50),
	@Provincia nvarchar(50),
	@Telefono nvarchar(20),
	@Email nvarchar(50),
	@Password nvarchar(20),
	@Error varchar(200) output
)
AS 
BEGIN TRY
	IF NOT EXISTS(SELECT * FROM [dbo].WB_Usuario where Email = @Email)
	BEGIN
		BEGIN TRAN

			IF NOT EXISTS(SELECT * FROM [dbo].CO_Clientes where Documento = @Documento)
			BEGIN
				INSERT INTO CO_Clientes values	(@Nombre,@Apellido,@Documento,@Direccion,@Distrito,@Provincia,@Telefono,1,GETDATE(),GETDATE())
			END

			INSERT INTO [dbo].WB_Usuario ([Password],Email,TipoUsuario,Estado,IdCliente,FechaCreacion,FechaActualizacion,Rol)
			VALUES (PWDENCRYPT(@Password),@Email,1,1,[dbo].[fc_ClienteWeb](@Documento),Getdate(),GETDATE(),2)


		COMMIT TRAN

		SET @Error = '0-OK'

		SELECT Email,TipoUsuario,Estado
		From dbo.WB_Usuario
		where Email = @Email
		and PWDCOMPARE(@Password,[Password]) = 1

	END
	ELSE BEGIN
		SET @Error = '1-El usuario ya existe'
	END
END TRY
BEGIN CATCH
	SET @Error = '2-Error en el procedimiento: ' + ERROR_PROCEDURE() + ', Mensaje: '+
							ERROR_MESSAGE() + 'En la linea: ' + convert(varchar(20),ERROR_LINE())
	ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarFamilia]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarFamilia]
(
@Linea int,
@Descripcion nvarchar(50)
)
AS
BEGIN TRY

	BEGIN TRAN

	Insert into WH_ClaseFamilia(Linea,Familia,DescripcionLocal,Estado)
	Values(@Linea, dbo.fc_IdFamiliaLinea(@Linea),@Descripcion,1)

	COMMIT TRAN

END TRY

BEGIN CATCH

	ROLLBACK TRAN

END CATCH

GO
/****** Object:  StoredProcedure [dbo].[sp_ListarUsuarios]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ListarUsuarios]

AS
BEGIN

	SET NOCOUNT ON;

	Select IdUsuario,Email,TipoUsuario,IdCliente,FechaCreacion,FechaActualizacion,Estado from WB_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarLinea]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ModificarLinea]
(
@Descripcion nvarchar(50),
@Estado bit,
@Id int
)
AS
DECLARE @Error NVARCHAR(100)
BEGIN TRY

UPDATE [dbo].WH_ClaseLinea SET DescripcionLocal = @Descripcion, Estado = @Estado
WHERE Linea = @Id

END TRY
BEGIN CATCH
SET @Error = '2-Error en el procedimiento: ' + ERROR_PROCEDURE() + ', Mensaje: '+
ERROR_MESSAGE() + 'En la linea: ' + convert(varchar(20),ERROR_LINE())
ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_ValidarUsuario]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ValidarUsuario]
	@email varchar(100),
	@password varchar(10)
AS
BEGIN
	Select IdUsuario,Email,TipoUsuario,Estado,IdCliente,Rol
	From dbo.WB_Usuario  x 
	where Email = @email 
	--and [Password] = @password //si el password se guarda como string y no está encriptado
	and PWDCOMPARE(@password,[Password]) = 1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarClientes]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarClientes]
@Nombres nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT IdPersona,Nombres,Apellidos,Documento,Direccion,Distrito,Provincia,Telefono,Estado,FechaCreacion,FechaActualizacion from Comercial.Clientes 
	where Nombres like '%'+@Nombres+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[uspCrearUsuario]    Script Date: 5/02/2022 10:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspCrearUsuario]
(
	@UseName varchar(50),
	@Email varchar(100),
	@Password varchar(10),
	@OV_Message_Error varchar(200) output
)
AS 
BEGIN TRY
	IF NOT EXISTS(SELECT * FROM [dbo].WB_Usuario where Email = @Email)
	BEGIN
		BEGIN TRAN

			INSERT INTO [dbo].WB_Usuario (UserName,[Password],Email,TipoUsuario,Estado,IdCliente,FechaCreacion,FechaActualizacion,Rol)
			VALUES (@UseName,PWDENCRYPT(@Password),@Email,1,1,101,Getdate(),GETDATE(),1)

			--paso 2 insert
			--paso 3 update
			--paso 4 insert XXXXXXXX

		COMMIT TRAN

		SET @OV_Message_Error = '0-OK'

		SELECT Email,UserName,TipoUsuario,Estado
		From dbo.WB_Usuario
		where Email = @Email
		and PWDCOMPARE(@Password,[Password]) = 1

	END
	ELSE BEGIN
		SET @OV_Message_Error = '1-El usuario ya existe'
	END
END TRY
BEGIN CATCH
	SET @OV_Message_Error = '2-Error en el procedimiento: ' + ERROR_PROCEDURE() + ', Mensaje: '+
							ERROR_MESSAGE() + 'En la linea: ' + convert(varchar(20),ERROR_LINE())
	ROLLBACK TRAN
END CATCH
GO
USE [master]
GO
ALTER DATABASE [Pedidos] SET  READ_WRITE 
GO
