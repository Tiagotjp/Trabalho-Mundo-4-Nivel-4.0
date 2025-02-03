
-- az configure --defaults group=mundo4 sql-server=ubuntu--fullstack

-- az sql db list

-- az sql db list | jq '[.[] | {name: .name}]'

-- az sql db show --name fullstack


-- az sql db show --name fullstack --resource-group mundo4 --server ubuntu-fullstack | jq '{name: .name, maxSizeBytes: .maxSizeBytes, status: .status}'


-- az sql db show-connection-string --client sqlcmd --name fullstack


-- sqlcmd -S tcp:ubuntu--fullstack.database.windows.net,1433 -d fullstack -U fullstack -P'Teste@123' -N -l 30


-- SCRIPS PARA O TRABALHO 4 NIVEL 4

CREATE DATABASE [MoveTransporteDB] (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE ='GP_Gen5_2', MAXSIZE = 32 GB) WITH CATALOG_COLLATION =SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;

GO

CREATE TABLE [Drivers]([DriverID] [int] NOT NULL, [Nome] [varchar](100) NULL,[CNH] [varchar](20) NULL, [Endereço] [varchar](200) NULL, [Contato] [varchar](50) NULL, PRIMARY KEY CLUSTERED ([DriverID] ASC) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY] ) ON [PRIMARY]

GO

CREATE TABLE [DriverQualifications]([QualificationID] [int] NOT NULL, [DriverID] [int] NULL, [Qualificação] [varchar](100) NULL, [DataObtenção] [date] NULL,[Validade] [date] NULL, PRIMARY KEY CLUSTERED ([QualificationID] ASC) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY]

GO

ALTER TABLE [DriverQualifications] WITH CHECK ADD FOREIGN KEY([DriverID]) REFERENCES [Drivers] ([DriverID])

GO

CREATE TABLE [DriverTravelHistory]([TravelID] [int] NOT NULL, [DriverID] [int] NULL, [DataViagem] [date] NULL, [Origem] [varchar](200) NULL, [Destino] [varchar](200) NULL, [DistanciaPercorrida] [float] NULL, PRIMARY KEY CLUSTERED ([TravelID] ASC) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY]

GO

ALTER TABLE [DriverTravelHistory] WITH CHECK ADD FOREIGN KEY([DriverID]) REFERENCES [Drivers] ([DriverID])

GO

CREATE TABLE [Clients]([ClientID] [int] NOT NULL,[Nome] [varchar](100) NULL,[Empresa] [varchar](100) NULL,[Endereço] [varchar](200) NULL, [Contato] [varchar](50) NULL, PRIMARY KEY CLUSTERED ([ClientID] ASC) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY]

GO

CREATE TABLE [ClientPreferences]([PreferenceID] [int] NOT NULL, [ClientID] [int] NULL, [Preferencia] [text] NULL, PRIMARY KEY CLUSTERED ([PreferenceID] ASC) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [ClientPreferences] WITH CHECK ADD FOREIGN KEY([ClientID]) REFERENCES [Clients] ([ClientID])

GO

CREATE TABLE [Orders]([OrderID] [int] NOT NULL, [ClientID] [int] NULL,[DriverID] [int] NULL, [DetalhesPedido] [text] NULL, [DataEntrega] [date] NULL, [Status] [varchar](50) NULL, PRIMARY KEY CLUSTERED ([OrderID] ASC) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [Orders] WITH CHECK ADD FOREIGN KEY([ClientID]) REFERENCES [Clients]([ClientID])

GO

ALTER TABLE [Orders] WITH CHECK ADD FOREIGN KEY([DriverID]) REFERENCES [Drivers] ([DriverID])

GO

CREATE TABLE [OrderStatusHistory]([StatusHistoryID] [int] NOT NULL, [OrderID] [int] NULL, [StatusAnterior] [varchar](50) NULL, [StatusAtual] [varchar](50) NULL, [DataMudança] [date] NULL, PRIMARY KEY CLUSTERED ([StatusHistoryID] ASC) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY]

GO

ALTER TABLE [OrderStatusHistory] WITH CHECK ADD FOREIGN KEY([OrderID]) REFERENCES [Orders] ([OrderID])

GO

CREATE TABLE [ClientOrderHistory] ([HistoryID] [int] NOT NULL, [OrderID] [int] NULL, [ClientID] [int] NULL, [DataPedido] [date] NULL, [ResumoPedido] [text] NULL, PRIMARY KEY CLUSTERED ([HistoryID] ASC) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [ClientOrderHistory] WITH CHECK ADD FOREIGN KEY([ClientID]) REFERENCES [Clients] ([ClientID])

GO

ALTER TABLE [ClientOrderHistory] WITH CHECK ADD FOREIGN KEY([OrderID]) REFERENCES [Orders] ([OrderID])

GO

-- Adição dos motoristas

INSERT INTO Drivers (DriverID, Nome, CNH, Endereço, Contato) VALUES (1, 'Bruno Costa', '123455788', 'Rua Madacena, 67', '11987653322'), (2, 'Ana Moreira', '889654321', 'Rua Joao Nunes, 118', '11476583210');

GO

-- Adiciona as qualificações dos motoristas

INSERT INTO DriverQualifications (QualificationID, DriverID, Qualificação, DataObtenção, Validade) VALUES (1, 1, 'Transporte de Combustiveis', '2024-12-14', '2025-01-15'), (2, 2, 'Transporte de Granito tipo 2', '2024-12-20', '2025-01-20');

GO

-- Adiciona o histórico de viagens

INSERT INTO DriverTravelHistory (TravelID, DriverID, DataViagem, Origem, Destino, DistanciaPercorrida) VALUES (1, 1, '2025-01-15', 'Porto Alegre', 'Espirito Santo', 2.261), (2, 2, '2025-01-20', 'São Paulo', 'João Pessoa', 2.764);

GO

-- Adiciona novos clientes

INSERT INTO Clients (ClientID, Nome, Empresa, Endereço, Contato) VALUES (1,'Empresa Vespor', 'VesporAuto Ltda', 'Rua Jairo Pena, 88', '11333885544'), (2, 'Empresa SOSGranito', 'S O.S.','Avenida darly santos, 40', '11222554644');

GO
-- Adiciona as demandas dos clientes

INSERT INTO ClientPreferences (PreferenceID, ClientID, Preferencia) VALUES (1,1, 'Preferência por transportes rápidos e seguros'), (2, 2, 'Preferência por custo baixo');

GO
-- Adiciona os  de pedidos

INSERT INTO Orders (OrderID, ClientID, DriverID, DetalhesPedido,DataEntrega,Status) VALUES (1, 1, 1, '2000 amortecedores ','2025-01-12', 'Entregue'), (2, 2, 2, '100 unidades de Explosivos tipo C','2025-01-06', 'Em trânsito');

GO

-- Adiciona o histórico de status dos pedidos

INSERT INTO OrderStatusHistory (StatusHistoryID, OrderID, StatusAnterior, StatusAtual, DataMudança) VALUES (1, 1, 'Em preparação', 'Entregue', '2025-12-10'),(2, 2, 'Aguardando coleta', 'Em trânsito', '2024-12-15');

GO

-- Adiciona do histórico de pedidos dos clientes

INSERT INTO ClientOrderHistory (HistoryID, OrderID, ClientID, DataPedido, ResumoPedido) VALUES (1, 1, 1, '2025-01-11', 'Pedido de 70 caixas de Sapatos'), (2, 2, 2, '2025-01-12', 'Pedido de 200 unidades de vassoura');

-- Consulta para ver as credencias dos motoristas

SELECT d.Nome, dq.Qualificação, dq.DataObtenção, dq.Validade FROM Drivers d JOIN DriverQualifications dq ON d.DriverID = dq.DriverID;

GO


-- Consulta de pedidos disponiveis

SELECT o.OrderID, c.Nome as Cliente, d.Nome as Motorista, o.DetalhesPedido, o.Status FROM Orders o JOIN Clients c ON o.ClientID = c.ClientID JOIN Drivers d ON o.DriverID = d.DriverID;

GO

-- Consulta do historico de viagens realizadas por data 

SELECT dt.DataViagem, dt.Origem, dt.Destino, dt.DistanciaPercorrida FROM DriverTravelHistory dt WHERE dt.DataViagem BETWEEN '2025-01-15' AND '2025-01-30';


GO
