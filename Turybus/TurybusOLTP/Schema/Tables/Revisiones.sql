CREATE TABLE [Seguridad].[Revisiones] (
    [id_revision]       INT           IDENTITY (1, 1) NOT NULL,
    [matricula_autobus] VARCHAR (20)  NOT NULL,
    [fecha_revision]    DATE          NOT NULL,
    [diagnostico]       VARCHAR (500) NOT NULL,
    [rowversion] TIMESTAMP NOT NULL, 
    PRIMARY KEY CLUSTERED ([id_revision] ASC),
    CONSTRAINT [FK_Revisiones_Autobus] FOREIGN KEY ([matricula_autobus]) REFERENCES [Operaciones].[Autobuses] ([matricula])
);