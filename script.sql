USE [HotelDb]
GO
/****** Object:  Table [dbo].[tbHospedagem]    Script Date: 27/07/2018 14:24:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbHospedagem](
	[IdHospedagem] [int] IDENTITY(1,1) NOT NULL,
	[DataEntrada] [datetime] NULL,
	[DataSaida] [datetime] NULL,
	[ValorDiaria] [decimal](18, 2) NULL,
	[TotalDoConsumo] [decimal](18, 2) NULL,
	[NumeroDoQuarto] [int] NULL,
	[IdHospede] [int] NULL,
 CONSTRAINT [PK_tbHospedagem] PRIMARY KEY CLUSTERED 
(
	[IdHospedagem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbHospede]    Script Date: 27/07/2018 14:24:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbHospede](
	[IdHospede] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](500) NULL,
	[Idade] [int] NULL,
	[Sexo] [nvarchar](50) NULL,
	[Rg] [nvarchar](50) NULL,
	[Cpf] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbHospede] PRIMARY KEY CLUSTERED 
(
	[IdHospede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbProduto]    Script Date: 27/07/2018 14:24:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbProduto](
	[IdProduto] [int] IDENTITY(1,1) NOT NULL,
	[NomeProduto] [nvarchar](500) NULL,
	[Categoria] [nvarchar](500) NULL,
	[Preco] [decimal](18, 2) NULL,
	[Qtde] [int] NULL,
 CONSTRAINT [PK_tbProduto] PRIMARY KEY CLUSTERED 
(
	[IdProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbProduto_tbHospedagem]    Script Date: 27/07/2018 14:24:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbProduto_tbHospedagem](
	[IdTbProduto_tbHospedagem] [int] IDENTITY(1,1) NOT NULL,
	[IdProduto] [int] NULL,
	[IdHospedagem] [int] NULL,
 CONSTRAINT [PK_tbProduto_tbHospedagem] PRIMARY KEY CLUSTERED 
(
	[IdTbProduto_tbHospedagem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tbHospedagem]  WITH CHECK ADD  CONSTRAINT [FK_tbHospedagem_tbHospede] FOREIGN KEY([IdHospede])
REFERENCES [dbo].[tbHospede] ([IdHospede])
GO
ALTER TABLE [dbo].[tbHospedagem] CHECK CONSTRAINT [FK_tbHospedagem_tbHospede]
GO
ALTER TABLE [dbo].[tbProduto_tbHospedagem]  WITH CHECK ADD  CONSTRAINT [FK_tbProduto_tbHospedagem_tbHospedagem] FOREIGN KEY([IdHospedagem])
REFERENCES [dbo].[tbHospedagem] ([IdHospedagem])
GO
ALTER TABLE [dbo].[tbProduto_tbHospedagem] CHECK CONSTRAINT [FK_tbProduto_tbHospedagem_tbHospedagem]
GO
ALTER TABLE [dbo].[tbProduto_tbHospedagem]  WITH CHECK ADD  CONSTRAINT [FK_tbProduto_tbHospedagem_tbProduto] FOREIGN KEY([IdProduto])
REFERENCES [dbo].[tbProduto] ([IdProduto])
GO
ALTER TABLE [dbo].[tbProduto_tbHospedagem] CHECK CONSTRAINT [FK_tbProduto_tbHospedagem_tbProduto]
GO
