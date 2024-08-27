USE [dbSistema]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NOT NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](25) NULL,
	[zip_code] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_items]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[order_status] [tinyint] NOT NULL,
	[order_date] [date] NOT NULL,
	[required_date] [date] NOT NULL,
	[shipped_date] [date] NULL,
	[store_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[brand_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[model_year] [smallint] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[active] [tinyint] NOT NULL,
	[store_id] [int] NOT NULL,
	[manager_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stocks]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stocks](
	[store_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[store_id] [int] IDENTITY(1,1) NOT NULL,
	[store_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](10) NULL,
	[zip_code] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUser](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[pass] [varchar](10) NOT NULL,
	[rol] [varchar](20) NULL,
	[staff_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](100) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[rol] [varchar](20) NULL,
	[staff_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (1, N'Sony')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (2, N'Samsung')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (3, N'Apple')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (4, N'Nike')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (5, N'Adidas')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (6, N'LG')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (7, N'Huawei')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (8, N'Microsoft')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (9, N'Canon')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (10, N'Panasonic')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (11, N'Sony')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (12, N'Samsung')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (13, N'Apple')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (14, N'Nike')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (15, N'Adidas')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (16, N'LG')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (17, N'Huawei')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (18, N'Microsoft')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (19, N'Canon')
INSERT [dbo].[Brands] ([brand_id], [brand_name]) VALUES (20, N'Panasonic')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (1, N'Electronics')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (2, N'Clothing')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (3, N'Books')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (4, N'Furniture')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (5, N'Toys')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (6, N'Jewelry')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (7, N'Sports')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (8, N'Appliances')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (9, N'Office Supplies')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (10, N'Beauty & Personal Care')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1, N'Emma', N'Johnson', N'1231231231', N'emma.johnson@example.com', N'123 Elm St', N'Quito', N'ST', N'12345')
INSERT [dbo].[Customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (2, N'Liam', N'Williams', N'3213214321', N'liam.williams@example.com', N'456 Oak St', N'Guayaquil', N'ST', N'67890')
INSERT [dbo].[Customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (3, N'Olivia', N'Brown', N'1234567890', N'olivia.brown@example.com', N'789 Pine St', N'Loja', N'ST', N'13579')
INSERT [dbo].[Customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (4, N'Noah', N'Jones', N'0987654321', N'noah.jones@example.com', N'101 Maple St', N'Quito', N'ST', N'24680')
INSERT [dbo].[Customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (5, N'Ava', N'Garcia', N'4564566544', N'ava.garcia@example.com', N'202 Birch St', N'Salinas', N'ST', N'11223')
INSERT [dbo].[Customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (6, N'Mason', N'Martinez', N'5675675678', N'mason.martinez@example.com', N'303 Cedar St', N'Quito', N'ST', N'54321')
INSERT [dbo].[Customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (7, N'Isabella', N'Hernandez', N'6786786789', N'isabella.hernandez@example.com', N'404 Willow St', N'Guayaquil', N'ST', N'98765')
INSERT [dbo].[Customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (8, N'Ethan', N'Lopez', N'7897897890', N'ethan.lopez@example.com', N'505 Redwood St', N'Loja', N'ST', N'67890')
INSERT [dbo].[Customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (9, N'Sophia', N'Garcia', N'8908908901', N'sophia.garcia@example.com', N'606 Palm St', N'Quito', N'ST', N'13579')
INSERT [dbo].[Customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (10, N'James', N'Wilson', N'9019019012', N'james.wilson@example.com', N'707 Oak St', N'Salinas', N'ST', N'24680')
INSERT [dbo].[Customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (11, N'Andres', N'GUADALUPE', N'0994187869', N'andresus1990@gmail.com', N'456', N'Shushufindi', N'pichincha', N'001')
INSERT [dbo].[Customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (12, N'Byron', N'Yarpaz', N'0994187869', N'byronyarpaz6@gmail.com', N'Barrio Central', N'Shushufindi', N'pichincha', N'0001')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[Order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (3, 1, 1, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[Order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (4, 2, 2, 1, CAST(799.99 AS Decimal(10, 2)), CAST(10.00 AS Decimal(4, 2)))
INSERT [dbo].[Order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (5, 1, 3, 3, CAST(499.99 AS Decimal(10, 2)), CAST(5.00 AS Decimal(4, 2)))
INSERT [dbo].[Order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (6, 2, 4, 2, CAST(149.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[Order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (7, 1, 5, 1, CAST(199.99 AS Decimal(10, 2)), CAST(15.00 AS Decimal(4, 2)))
INSERT [dbo].[Order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (8, 2, 1, 4, CAST(999.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
INSERT [dbo].[Order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (9, 1, 2, 1, CAST(799.99 AS Decimal(10, 2)), CAST(20.00 AS Decimal(4, 2)))
INSERT [dbo].[Order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (10, 2, 3, 2, CAST(499.99 AS Decimal(10, 2)), CAST(10.00 AS Decimal(4, 2)))
INSERT [dbo].[Order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (11, 1, 4, 3, CAST(149.99 AS Decimal(10, 2)), CAST(5.00 AS Decimal(4, 2)))
INSERT [dbo].[Order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (12, 2, 5, 1, CAST(199.99 AS Decimal(10, 2)), CAST(10.00 AS Decimal(4, 2)))
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (3, 1, 1, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-05' AS Date), CAST(N'2024-01-04' AS Date), 1, 1)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (4, 2, 2, CAST(N'2024-01-02' AS Date), CAST(N'2024-01-06' AS Date), CAST(N'2024-01-05' AS Date), 2, 2)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (5, 3, 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-01-07' AS Date), CAST(N'2024-01-06' AS Date), 3, 3)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (6, 4, 3, CAST(N'2024-01-04' AS Date), CAST(N'2024-01-08' AS Date), NULL, 4, 4)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (7, 5, 1, CAST(N'2024-01-05' AS Date), CAST(N'2024-01-09' AS Date), CAST(N'2024-01-08' AS Date), 5, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (8, 6, 2, CAST(N'2024-02-01' AS Date), CAST(N'2024-02-05' AS Date), CAST(N'2024-02-04' AS Date), 1, 2)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (9, 7, 1, CAST(N'2024-02-02' AS Date), CAST(N'2024-02-06' AS Date), CAST(N'2024-02-05' AS Date), 2, 3)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (10, 8, 3, CAST(N'2024-02-03' AS Date), CAST(N'2024-02-07' AS Date), NULL, 3, 4)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (11, 9, 2, CAST(N'2024-02-04' AS Date), CAST(N'2024-02-08' AS Date), CAST(N'2024-02-07' AS Date), 4, 1)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (12, 10, 1, CAST(N'2024-02-05' AS Date), CAST(N'2024-02-09' AS Date), CAST(N'2024-02-08' AS Date), 5, 2)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (13, 1, 1, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-05' AS Date), CAST(N'2024-01-04' AS Date), 1, 1)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (14, 2, 2, CAST(N'2024-01-02' AS Date), CAST(N'2024-01-06' AS Date), CAST(N'2024-01-05' AS Date), 2, 2)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (15, 3, 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-01-07' AS Date), CAST(N'2024-01-06' AS Date), 3, 3)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (16, 4, 3, CAST(N'2024-01-04' AS Date), CAST(N'2024-01-08' AS Date), NULL, 4, 4)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (17, 5, 1, CAST(N'2024-01-05' AS Date), CAST(N'2024-01-09' AS Date), CAST(N'2024-01-08' AS Date), 5, 5)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (18, 6, 2, CAST(N'2024-02-01' AS Date), CAST(N'2024-02-05' AS Date), CAST(N'2024-02-04' AS Date), 1, 2)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (19, 7, 1, CAST(N'2024-02-02' AS Date), CAST(N'2024-02-06' AS Date), CAST(N'2024-02-05' AS Date), 2, 3)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (20, 8, 3, CAST(N'2024-02-03' AS Date), CAST(N'2024-02-07' AS Date), NULL, 3, 4)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (21, 9, 2, CAST(N'2024-02-04' AS Date), CAST(N'2024-02-08' AS Date), CAST(N'2024-02-07' AS Date), 4, 1)
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (22, 10, 1, CAST(N'2024-02-05' AS Date), CAST(N'2024-02-09' AS Date), CAST(N'2024-02-08' AS Date), 5, 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (1, N'Sony Headphones', 1, 1, 2023, CAST(199.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (2, N'Samsung Tablet', 2, 1, 2024, CAST(299.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (3, N'Apple Watch', 3, 1, 2023, CAST(399.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (4, N'Nike Socks', 4, 2, 2022, CAST(29.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (5, N'Adidas Shorts', 5, 2, 2023, CAST(49.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (6, N'Dell Laptop', 1, 1, 2023, CAST(799.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (7, N'HP Printer', 2, 1, 2023, CAST(129.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (8, N'Sony Camera', 3, 1, 2024, CAST(899.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (9, N'Puma Backpack', 4, 2, 2023, CAST(89.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (10, N'Under Armour Hoodie', 5, 2, 2022, CAST(69.99 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Staffs] ON 

INSERT [dbo].[Staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (1, N'Daniel', N'Martinez', N'daniel.martinez@example.com', N'5559876543', 1, 1, NULL)
INSERT [dbo].[Staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (2, N'Sophia', N'Garcia', N'sophia.garcia@example.com', N'5558765432', 1, 2, 1)
INSERT [dbo].[Staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (3, N'Lucas', N'Hernandez', N'lucas.hernandez@example.com', N'5557654321', 1, 3, 2)
INSERT [dbo].[Staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (4, N'Mia', N'Rodriguez', N'mia.rodriguez@example.com', N'5556543210', 1, 4, 3)
INSERT [dbo].[Staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (5, N'Ethan', N'Lopez', N'ethan.lopez@example.com', N'5555432109', 1, 5, 4)
INSERT [dbo].[Staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (6, N'Isabella', N'Miller', N'isabella.miller@example.com', N'5554321098', 1, 1, 2)
INSERT [dbo].[Staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (7, N'Oliver', N'Wilson', N'oliver.wilson@example.com', N'5553210987', 1, 2, 3)
INSERT [dbo].[Staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (8, N'Ava', N'Taylor', N'ava.taylor@example.com', N'5552109876', 1, 3, 4)
INSERT [dbo].[Staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (9, N'James', N'Anderson', N'james.anderson@example.com', N'5551098765', 1, 4, 5)
INSERT [dbo].[Staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (10, N'Emily', N'Thomas', N'emily.thomas@example.com', N'5550987654', 1, 5, 1)
SET IDENTITY_INSERT [dbo].[Staffs] OFF
GO
INSERT [dbo].[Stocks] ([store_id], [product_id], [quantity]) VALUES (1, 1, 50)
INSERT [dbo].[Stocks] ([store_id], [product_id], [quantity]) VALUES (1, 2, 75)
INSERT [dbo].[Stocks] ([store_id], [product_id], [quantity]) VALUES (1, 3, 30)
INSERT [dbo].[Stocks] ([store_id], [product_id], [quantity]) VALUES (1, 4, 100)
INSERT [dbo].[Stocks] ([store_id], [product_id], [quantity]) VALUES (1, 5, 60)
INSERT [dbo].[Stocks] ([store_id], [product_id], [quantity]) VALUES (2, 6, 40)
INSERT [dbo].[Stocks] ([store_id], [product_id], [quantity]) VALUES (2, 7, 20)
INSERT [dbo].[Stocks] ([store_id], [product_id], [quantity]) VALUES (2, 8, 10)
INSERT [dbo].[Stocks] ([store_id], [product_id], [quantity]) VALUES (2, 9, 90)
INSERT [dbo].[Stocks] ([store_id], [product_id], [quantity]) VALUES (2, 10, 80)
GO
SET IDENTITY_INSERT [dbo].[Stores] ON 

INSERT [dbo].[Stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1, N'Central Store', N'5551234567', N'central@store.com', N'500 Central Ave', N'Quito', N'ST', N'54321')
INSERT [dbo].[Stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (2, N'Downtown Store', N'5552345678', N'downtown@store.com', N'100 Downtown Blvd', N'Guayaquil', N'ST', N'65432')
INSERT [dbo].[Stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (3, N'Suburb Store', N'5553456789', N'suburb@store.com', N'200 Suburb St', N'Loja', N'ST', N'76543')
INSERT [dbo].[Stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (4, N'South End Store', N'5554567890', N'southend@store.com', N'300 South End Rd', N'Salinas', N'ST', N'87654')
INSERT [dbo].[Stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (5, N'North End Store', N'5555678901', N'northend@store.com', N'400 North End Ave', N'Quito', N'ST', N'98765')
INSERT [dbo].[Stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (6, N'Eastside Store', N'5556789012', N'eastside@store.com', N'500 Eastside Dr', N'Guayaquil', N'ST', N'09876')
INSERT [dbo].[Stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (7, N'Westside Store', N'5557890123', N'westside@store.com', N'600 Westside Blvd', N'Loja', N'ST', N'10987')
INSERT [dbo].[Stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (8, N'Central Plaza Store', N'5558901234', N'plaza@store.com', N'700 Central Plaza', N'Salinas', N'ST', N'21098')
INSERT [dbo].[Stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (9, N'Village Store', N'5559012345', N'village@store.com', N'800 Village Ln', N'Quito', N'ST', N'32109')
INSERT [dbo].[Stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (10, N'Market Store', N'5550123456', N'market@store.com', N'900 Market St', N'Guayaquil', N'ST', N'43210')
SET IDENTITY_INSERT [dbo].[Stores] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemUser] ON 

INSERT [dbo].[SystemUser] ([id_user], [usuario], [pass], [rol], [staff_id]) VALUES (1, N'jdoe', N'pass123', N'admin', 1)
INSERT [dbo].[SystemUser] ([id_user], [usuario], [pass], [rol], [staff_id]) VALUES (2, N'asmith', N'pass456', N'user', 2)
INSERT [dbo].[SystemUser] ([id_user], [usuario], [pass], [rol], [staff_id]) VALUES (3, N'mjones', N'pass789', N'user', 3)
INSERT [dbo].[SystemUser] ([id_user], [usuario], [pass], [rol], [staff_id]) VALUES (4, N'ldavis', N'pass101', N'admin', 4)
INSERT [dbo].[SystemUser] ([id_user], [usuario], [pass], [rol], [staff_id]) VALUES (5, N'krobinson', N'pass202', N'user', 5)
INSERT [dbo].[SystemUser] ([id_user], [usuario], [pass], [rol], [staff_id]) VALUES (6, N'bthomas', N'pass303', N'user', 6)
INSERT [dbo].[SystemUser] ([id_user], [usuario], [pass], [rol], [staff_id]) VALUES (7, N'clark', N'pass404', N'admin', 7)
INSERT [dbo].[SystemUser] ([id_user], [usuario], [pass], [rol], [staff_id]) VALUES (8, N'djones', N'pass505', N'user', 8)
INSERT [dbo].[SystemUser] ([id_user], [usuario], [pass], [rol], [staff_id]) VALUES (9, N'emartin', N'pass606', N'user', 9)
INSERT [dbo].[SystemUser] ([id_user], [usuario], [pass], [rol], [staff_id]) VALUES (10, N'fwhite', N'pass707', N'admin', 10)
SET IDENTITY_INSERT [dbo].[SystemUser] OFF
GO
ALTER TABLE [dbo].[Order_items]  WITH CHECK ADD  CONSTRAINT [FK_Order_items_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Order_items] CHECK CONSTRAINT [FK_Order_items_Orders]
GO
ALTER TABLE [dbo].[Order_items]  WITH CHECK ADD  CONSTRAINT [FK_Order_items_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Order_items] CHECK CONSTRAINT [FK_Order_items_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Staffs] FOREIGN KEY([staff_id])
REFERENCES [dbo].[Staffs] ([staff_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Staffs]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Stores] FOREIGN KEY([store_id])
REFERENCES [dbo].[Stores] ([store_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Stores]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brands] ([brand_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK_Staffs_Manager] FOREIGN KEY([manager_id])
REFERENCES [dbo].[Staffs] ([staff_id])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK_Staffs_Manager]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK_Staffs_Stores] FOREIGN KEY([store_id])
REFERENCES [dbo].[Stores] ([store_id])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK_Staffs_Stores]
GO
ALTER TABLE [dbo].[Stocks]  WITH CHECK ADD  CONSTRAINT [FK_Stocks_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Stocks] CHECK CONSTRAINT [FK_Stocks_Products]
GO
ALTER TABLE [dbo].[Stocks]  WITH CHECK ADD  CONSTRAINT [FK_Stocks_Stores] FOREIGN KEY([store_id])
REFERENCES [dbo].[Stores] ([store_id])
GO
ALTER TABLE [dbo].[Stocks] CHECK CONSTRAINT [FK_Stocks_Stores]
GO
ALTER TABLE [dbo].[SystemUser]  WITH CHECK ADD  CONSTRAINT [fk_SystemUser_Staffs] FOREIGN KEY([staff_id])
REFERENCES [dbo].[Staffs] ([staff_id])
GO
ALTER TABLE [dbo].[SystemUser] CHECK CONSTRAINT [fk_SystemUser_Staffs]
GO
/****** Object:  StoredProcedure [dbo].[sp_AuthenticateUser]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AuthenticateUser]
    @usuario varchar(100),
    @clave varchar(100),
    @idFlag int output,
    @idStaff int output,
    @mensaje varchar(100) output
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @IsStaff INT = NULL;
    DECLARE @StaffActivo INT = NULL;

    IF EXISTS (SELECT * FROM SystemUser WHERE usuario = @usuario AND pass = @clave)
    BEGIN
        SET @IsStaff = (SELECT s.staff_id 
                        FROM Staffs s 
                        JOIN SystemUser u ON s.staff_id = u.staff_id 
                        WHERE u.usuario = @usuario AND u.pass = @clave);
    END

    IF @IsStaff IS NOT NULL
    BEGIN
        SET @mensaje = 'Código 1. Autenticación exitosa, El Usuario está Activo';
        SET @idFlag = 1;
        SET @idStaff = @IsStaff;
        SET @StaffActivo = (SELECT s.active 
                            FROM Staffs s 
                            JOIN SystemUser u ON s.staff_id = u.staff_id 
                            WHERE u.usuario = @usuario AND u.pass = @clave);
        IF NOT @StaffActivo = 1
        BEGIN
            SET @idFlag = 2;
            SET @mensaje = 'Código 2. Autenticación exitosa, El Usuario está Inactivo';
        END
    END
    ELSE
    BEGIN
        SET @mensaje = 'Código 0. El usuario no existe o ha ingresado mal la clave';
        SET @idFlag = 0;
        SET @idStaff = 0;
    END

    SELECT @idFlag, @idStaff, @mensaje;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStoreList]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetStoreList] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 -- Seleccionar customer_id y la concatenación de first_name y last_name como cliente
    SELECT 
        store_id, 
        store_name
    FROM 
        Stores;
END
GO
/****** Object:  StoredProcedure [dbo].[spGetCustomers]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCustomers]
AS
BEGIN
    -- Seleccionar todos los clientes de la tabla Customers
    SELECT customer_id, first_name, last_name, phone, email, street, city, state, zip_code
    FROM Customers;
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetProductById]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetProductById]
    @product_id INT
AS
BEGIN
    -- Selecciona los detalles del producto basado en el product_id proporcionado
    SELECT 
        [product_id],
        [product_name],
        [brand_id],
        [category_id],
        [model_year],
        [list_price]
    FROM [dbSistema].[dbo].[Products]
    WHERE [product_id] = @product_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetStaffByStore]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetStaffByStore]
    @store_id INT
AS
BEGIN
    -- Seleccionar los miembros del staff según el ID de la tienda
    SELECT 
        [staff_id],
        [first_name],
        [last_name],
        [email],
        [phone],
        [active],
        [store_id],
        [manager_id]
    FROM [dbSistema].[dbo].[Staffs]
    WHERE [store_id] = @store_id;
END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarCliente]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarCliente]
    @first_name VARCHAR(255),
    @last_name VARCHAR(255),
    @phone VARCHAR(25),
    @email VARCHAR(255),
    @street VARCHAR(255),
    @city VARCHAR(50),
    @state VARCHAR(25),
    @zip_code VARCHAR(5)
AS
BEGIN
    -- Verificar si ya existe un cliente con el mismo email
    IF EXISTS (SELECT 1 FROM Customers WHERE email = @email)
    BEGIN
        PRINT 'El cliente con este correo electrónico ya existe.';
    END
    ELSE
    BEGIN
        -- Insertar un nuevo cliente
        INSERT INTO Customers (first_name, last_name, phone, email, street, city, state, zip_code)
        VALUES (@first_name, @last_name, @phone, @email, @street, @city, @state, @zip_code);
        
        PRINT 'Cliente registrado exitosamente.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarDetalleOrden]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarDetalleOrden]
    @order_id INT,
    @product_id INT,
    @quantity INT,
    @list_price DECIMAL(10, 2),
    @discount DECIMAL(4, 2)
AS
BEGIN
    -- Variable para verificar la disponibilidad de stock
    DECLARE @available_quantity INT;

    -- Obtener la cantidad de stock disponible para el producto en la tienda
    SELECT @available_quantity = quantity
    FROM Stocks
    WHERE store_id = (SELECT store_id FROM Orders WHERE order_id = @order_id) AND product_id = @product_id;

    -- Verificar si hay suficiente stock
    IF @available_quantity >= @quantity
    BEGIN
        -- Iniciar una transacción
        BEGIN TRANSACTION;

        -- Registrar el ítem de la orden
        INSERT INTO Order_items (order_id, item_id, product_id, quantity, list_price, discount)
        VALUES (@order_id, (SELECT ISNULL(MAX(item_id), 0) + 1 FROM Order_items WHERE order_id = @order_id), @product_id, @quantity, @list_price, @discount);

        -- Actualizar la cantidad de stock
        UPDATE Stocks
        SET quantity = quantity - @quantity
        WHERE store_id = (SELECT store_id FROM Orders WHERE order_id = @order_id) AND product_id = @product_id;

        -- Confirmar la transacción
        COMMIT TRANSACTION;
    END
    ELSE
    BEGIN
        -- Si no hay suficiente stock, mostrar mensaje
        RAISERROR('No hay stock suficiente para el producto %d', 16, 1, @product_id);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarOrdenCompra]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarOrdenCompra]
    @customer_id INT,
    @store_id INT,
    @staff_id INT,
    @product_id INT,
    @quantity INT,
    @list_price DECIMAL(10, 2),
    @discount DECIMAL(4, 2),
    @order_status TINYINT
AS
BEGIN
    -- Variable para verificar la disponibilidad de stock
    DECLARE @available_quantity INT;

    -- Obtener la cantidad de stock disponible para el producto en la tienda
    SELECT @available_quantity = quantity
    FROM Stocks
    WHERE store_id = @store_id AND product_id = @product_id;

    -- Verificar si hay suficiente stock
    IF @available_quantity >= @quantity
    BEGIN
        -- Iniciar una transacción
        BEGIN TRANSACTION;

        -- Registrar la orden de compra
        INSERT INTO Orders (customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
        VALUES (@customer_id, @order_status, GETDATE(), DATEADD(DAY, 5, GETDATE()), NULL, @store_id, @staff_id);

        -- Obtener el ID de la orden recién creada
        DECLARE @order_id INT;
        SET @order_id = SCOPE_IDENTITY();

        -- Registrar los ítems de la orden
        INSERT INTO Order_items (order_id, item_id, product_id, quantity, list_price, discount)
        VALUES (@order_id, 1, @product_id, @quantity, @list_price, @discount);

        -- Actualizar la cantidad de stock
        UPDATE Stocks
        SET quantity = quantity - @quantity
        WHERE store_id = @store_id AND product_id = @product_id;

        -- Confirmar la transacción
        COMMIT TRANSACTION;
    END
    ELSE
    BEGIN
        -- Si no hay suficiente stock, mostrar mensaje
        RAISERROR('No hay stock suficiente para el producto %d', 16, 1, @product_id);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarUsuario]    Script Date: 27/8/2024 9:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Luego creamos el nuevo procedimiento almacenado
CREATE PROCEDURE [dbo].[spRegistrarUsuario]
    @usuario VARCHAR(100),
    @pass VARCHAR(50),
    @rol VARCHAR(20),
    @staff_id INT = NULL, -- Este parámetro es opcional
    @Status INT OUTPUT,
    @Message NVARCHAR(255) OUTPUT
AS
BEGIN
    -- Inicializar variables de salida
    SET @Status = 0
    SET @Message = 'Usuario registrado exitosamente.'

    -- Comprobar si el usuario ya existe
    IF EXISTS (SELECT 1 FROM [dbo].[usuario] WHERE [usuario] = @usuario)
    BEGIN
        SET @Status = 1
        SET @Message = 'El usuario ya existe.'
        RETURN
    END

    BEGIN TRY
        -- Insertar el nuevo usuario
        INSERT INTO [dbo].[usuario] ([usuario], [pass], [rol], [staff_id])
        VALUES (@usuario, @pass, @rol, @staff_id)
    END TRY
    BEGIN CATCH
        -- Capturar errores y establecer el mensaje de error
        SET @Status = 2
        SET @Message = ERROR_MESSAGE()
    END CATCH
END
GO
