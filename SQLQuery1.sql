CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    Role NVARCHAR(20) DEFAULT 'member'
);


CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    Price DECIMAL(10, 2) NOT NULL,
    ImageUrl NVARCHAR(200),
    Stock INT DEFAULT 0
);



CREATE TABLE CartItems (
    CartItemID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT NOT NULL,
    AddedDate DATETIME DEFAULT GETDATE()
);


CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    OrderDate DATETIME DEFAULT GETDATE(),
    DeliveryAddress NVARCHAR(255),
    PaymentMethod NVARCHAR(50), -- 'Credit Card' or 'Cash on Delivery'
    TotalAmount DECIMAL(10,2),
    Status NVARCHAR(20) DEFAULT 'Processing'
);


CREATE TABLE OrderItems (
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    UnitPrice DECIMAL(10,2)
);



CREATE TABLE Feedback (
    FeedbackID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100),
    Email NVARCHAR(100),
    Message NVARCHAR(MAX),
    SubmittedOn DATETIME DEFAULT GETDATE()
);




INSERT INTO Products (Name, Description, Price, ImageUrl, Stock) VALUES
(N'Handcrafted Bag 1', N'Eco-friendly handcrafted bag made of jute.', 12.99, N'Img/bag1.png', 15),
(N'Handcrafted Bag 2', N'Stylish black souvenir bag for daily use.', 14.99, N'Img/bag2.png', 20),
(N'Handcrafted Bag 3', N'Colorful travel bag with Nepali design.', 19.99, N'Img/bag3.png', 10),
(N'Handcrafted Bag 4', N'Modern souvenir bag made with local fabric.', 17.49, N'Img/bag4.png', 12),
(N'Handcrafted Bag 5', N'Durable shopping bag with floral print.', 16.25, N'Img/bag5.png', 8),

(N'Traditional Mask 1', N'Hand-carved wooden mask from Bhaktapur.', 29.99, N'Img/mask1.png', 5),
(N'Traditional Mask 2', N'Colorful ceremonial mask of Nepalese culture.', 25.50, N'Img/mask2.png', 7),
(N'Traditional Mask 3', N'Wall décor mask with ancient symbols.', 27.75, N'Img/mask3.png', 6),
(N'Traditional Mask 4', N'Wooden mask with bold artistic finish.', 23.49, N'Img/mask4.png', 4),
(N'Traditional Mask 5', N'Collector’s mask with intricate painting.', 31.00, N'Img/mask5.png', 3),

(N'Decorative Piece 1', N'Small handcrafted statue for souvenirs.', 9.99, N'Img/pic1.png', 25),
(N'Decorative Piece 2', N'Miniature model made of clay and wood.', 11.49, N'Img/pic2.png', 22),
(N'Decorative Piece 3', N'Souvenir piece representing Nepalese heritage.', 13.00, N'Img/pic3.png', 15),
(N'Decorative Piece 4', N'Cultural showpiece with mountain design.', 14.75, N'Img/pic4.png', 10),
(N'Decorative Piece 5', N'Handcrafted art with spiritual meaning.', 15.60, N'Img/pic5.png', 9),

(N'Statue Set 1', N'Trio of mini statues made of stone.', 34.99, N'Img/stat1.png', 6),
(N'Statue Set 2', N'Set of handcrafted Buddhist statues.', 39.50, N'Img/stat2.png', 5),
(N'Statue Set 3', N'Exclusive Nepalese god statues.', 42.00, N'Img/stat3.png', 4);




select * from Feedback;