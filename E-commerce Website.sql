
-- create database Ala_Alsalam;

DROP DATABASE IF EXISTS ala_alsalam;
CREATE DATABASE ala_alsalam;
use ala_alsalam;

DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (
    CustomerID int NOT NULL AUTO_INCREMENT,
    UserName varchar(45)  NOT NULL ,
    FirstName varchar(30)  NOT NULL ,
    LastName varchar(30)  NOT NULL ,
    Email varchar(45)  NOT NULL ,
    Password varchar(45)  NOT NULL ,
    Phone varchar(9)  NOT NULL ,
    Address varchar(45)  NULL ,
    add_Date Date  NOT NULL ,
    activatin TINYINT  NOT NULL ,
    image VARCHAR(255)  NULL ,
    PRIMARY KEY (
        CustomerID
    ),
    CONSTRAINT uc_Customer_Email UNIQUE (
        Email
    ),
    CONSTRAINT uc_Customer_Phone UNIQUE (
        Phone
    )
);

DROP TABLE IF EXISTS Product;
CREATE TABLE `Product` (
    `ProductID` int  NOT NULL ,
    `ProductName` varchar(200)  NOT NULL ,
    `Discription` varchar(45)  NOT NULL ,
    `Price` float  NOT NULL ,
    `Reduced_price` float  NULL ,
    `Cost` float  NULL ,
    `Stoke` int  NOT NULL ,
    `ProductBrand` int  NOT NULL ,
    `ProductCategory` int  NOT NULL ,
    `ProductStatus` varcharacter(10)  NOT NULL ,
    PRIMARY KEY (
        `ProductID`
    ),
    CONSTRAINT `uc_Product_ProductName` UNIQUE (
        `ProductName`
    )
);
DROP TABLE IF EXISTS Model;
CREATE TABLE `Model` (
    `ModelID` int  NOT NULL ,
    `ProductID` int  NOT NULL ,
    `ModelName` varchar(45)  NULL ,
    PRIMARY KEY (
        `ModelID`
    )
);
DROP TABLE IF EXISTS Brand;
CREATE TABLE `Brand` (
    `BrandID` int  NOT NULL ,
    `BrandName` varchar(45)  NOT NULL ,
    `orgin` varchar(45)  NOT NULL ,
    PRIMARY KEY (
        `BrandID`
    )
);
DROP TABLE IF EXISTS Category;
CREATE TABLE `Category` (
    `CategoryID` int  NOT NULL ,
    `CategoryName` varchar(45)  NOT NULL ,
    `CategoryType` varchar(45)  NOT NULL ,
    `add_Date` Date  NOT NULL ,
    `activatin` TINYINT  NOT NULL ,
    PRIMARY KEY (
        `CategoryID`
    ),
    CONSTRAINT `uc_Category_CategoryName` UNIQUE (
        `CategoryName`
    )
);

DROP TABLE IF EXISTS Options;
CREATE TABLE `Options` (
    `OptionsID` int  NOT NULL ,
    `ProductID` int  NOT NULL ,
    `OptionsName` varchar(45)  NOT NULL ,
    PRIMARY KEY (
        `OptionsID`
    ),
    CONSTRAINT `uc_Options_OptionsName` UNIQUE (
        `OptionsName`
    )
);
DROP TABLE IF EXISTS Options_Values;
CREATE TABLE `Options_Values` (
    `Value_ID` int  NOT NULL ,
    `OptionsID` int  NOT NULL ,
    `Quantity` int  NOT NULL ,
    `Price` int  NOT NULL ,
    PRIMARY KEY (
        `Value_ID`
    )
);
DROP TABLE IF EXISTS Media;
CREATE TABLE `Media` (
    `Media_id` int  NOT NULL ,
    `ProductID` int  NOT NULL ,
    `Url` varcharacter(255)  NOT NULL ,
    PRIMARY KEY (
        `Media_id`
    )
);
-- DROP TABLE IF EXISTS Order;-- 
CREATE TABLE `Order` (
    `OrderID` int  NOT NULL ,
    `CustomerID` int  NOT NULL ,
    `Ammount` float  NOT NULL ,
    `addDate` date  NOT NULL ,
    `saleDate` date  NOT NULL ,
    `OrderStatusID` int  NOT NULL ,
    PRIMARY KEY (
        `OrderID`
    )
);
DROP TABLE IF EXISTS OrderStatus;
CREATE TABLE `OrderStatus` (
    `OrderStatusID` int  NOT NULL ,
    `Status` varchar(45)  NOT NULL ,
    PRIMARY KEY (
        `OrderStatusID`
    )
);
DROP TABLE IF EXISTS OrderDetail;
CREATE TABLE `OrderDetail` (
    `OrderLineID` int  NOT NULL ,
    `OrderID` int  NOT NULL ,
    `ProductID` int  NOT NULL ,
    `Quantity` int  NOT NULL ,
    PRIMARY KEY (
        `OrderLineID`
    )
);
DROP TABLE IF EXISTS Payment;
CREATE TABLE `Payment` (
    `paymentID` int  NOT NULL ,
    `OrderID` int  NOT NULL ,
    `date` date  NOT NULL ,
    PRIMARY KEY (
        `paymentID`
    )
);
DROP TABLE IF EXISTS messages ;
CREATE TABLE `messages` (
    `messageID` int  NOT NULL ,
    `customerID` int  NOT NULL ,
    `massege` text  NOT NULL ,
    PRIMARY KEY (
        `messageID`
    )
);
DROP TABLE IF EXISTS evaluation ;
CREATE TABLE `evaluation` (
    `ProductID` int  NOT NULL ,
    `customerID` int  NOT NULL ,
    `evaluation` FLOAT  NOT NULL 
);
DROP TABLE IF EXISTS comment;
CREATE TABLE `comment` (
    `commentID` int  NOT NULL ,
    `ProductID` int  NOT NULL ,
    `customerID` int  NOT NULL ,
    `add_date` DATE  NOT NULL ,
    `comment` text  NOT NULL ,
    PRIMARY KEY (
        `commentID`
    )
);
DROP TABLE IF EXISTS Reports;
CREATE TABLE `Reports` (
    `report_ID` int  NOT NULL ,
    `customerID` int  NOT NULL ,
    `orderID` int  NOT NULL ,
    `ProductID` int  NOT NULL ,
    `paymentID` int  NOT NULL ,
    PRIMARY KEY (
        `report_ID`
    )
);

DROP TABLE IF EXISTS offers;
CREATE TABLE `offers` (
    `offersID` int  NOT NULL ,
    `ProductID` int  NOT NULL ,
    `start_date` DATE  NOT NULL ,
    `end_date` DATE  NOT NULL ,
    `new_Price` float  NOT NULL ,
    PRIMARY KEY (
        `offersID`
    )
);
DROP TABLE IF EXISTS Home;
CREATE TABLE `Home` (
    `titel` varchar(255)  NOT NULL ,
    `description` text  NOT NULL ,
    `Home_image` VARCHAR(255)  NOT NULL ,
    `logo_image` VARCHAR(255)  NOT NULL 
);
DROP TABLE IF EXISTS contact ;
CREATE TABLE `contact` (
    `contactID` int  NOT NULL ,
    `email` VARCHAR(50)  NOT NULL ,
    `name` varchar(255)  NOT NULL ,
    `adderss` varchar(255)  NULL ,
    `contact` text  NOT NULL ,
    PRIMARY KEY (
        `contactID`
    )
);

ALTER TABLE `Product` ADD CONSTRAINT `fk_Product_ProductBrand` FOREIGN KEY(`ProductBrand`)
REFERENCES `Brand` (`BrandID`);

ALTER TABLE `Product` ADD CONSTRAINT `fk_Product_ProductCategory` FOREIGN KEY(`ProductCategory`)
REFERENCES `Category` (`CategoryID`);

ALTER TABLE `Model` ADD CONSTRAINT `fk_Model_ProductID` FOREIGN KEY(`ProductID`)
REFERENCES `Product` (`ProductID`);

ALTER TABLE `Options` ADD CONSTRAINT `fk_Options_ProductID` FOREIGN KEY(`ProductID`)
REFERENCES `Product` (`ProductID`);

ALTER TABLE `Options_Values` ADD CONSTRAINT `fk_Options_Values_OptionsID` FOREIGN KEY(`OptionsID`)
REFERENCES `Options` (`OptionsID`);

ALTER TABLE `Media` ADD CONSTRAINT `fk_Media_ProductID` FOREIGN KEY(`ProductID`)
REFERENCES `Product` (`ProductID`);

ALTER TABLE `Order` ADD CONSTRAINT `fk_Order_CustomerID` FOREIGN KEY(`CustomerID`)
REFERENCES `Customer` (`CustomerID`);

ALTER TABLE `Order` ADD CONSTRAINT `fk_Order_OrderStatusID` FOREIGN KEY(`OrderStatusID`)
REFERENCES `OrderStatus` (`OrderStatusID`);


ALTER TABLE `OrderDetail` ADD CONSTRAINT `fk_OrderDetail_OrderID` FOREIGN KEY(`OrderID`)
REFERENCES `Order` (`OrderID`);

ALTER TABLE `OrderDetail` ADD CONSTRAINT `fk_OrderDetail_ProductID` FOREIGN KEY(`ProductID`)
REFERENCES `Product` (`ProductID`);

ALTER TABLE `Payment` ADD CONSTRAINT `fk_Payment_OrderID` FOREIGN KEY(`OrderID`)
REFERENCES `Order` (`OrderID`);

ALTER TABLE `Reports` ADD CONSTRAINT `fk_Reports_customerID` FOREIGN KEY(`customerID`)
REFERENCES `Customer` (`CustomerID`);

ALTER TABLE `Reports` ADD CONSTRAINT `fk_Reports_orderID` FOREIGN KEY(`orderID`)
REFERENCES `Order` (`OrderID`);

ALTER TABLE `Reports` ADD CONSTRAINT `fk_Reports_ProductID` FOREIGN KEY(`ProductID`)
REFERENCES `Product` (`ProductID`);

ALTER TABLE `Reports` ADD CONSTRAINT `fk_Reports_paymentID` FOREIGN KEY(`paymentID`)
REFERENCES `Payment` (`paymentID`);

ALTER TABLE `messages` ADD CONSTRAINT `fk_messages_customerID` FOREIGN KEY(`customerID`)
REFERENCES `Customer` (`CustomerID`);

ALTER TABLE `evaluation` ADD CONSTRAINT `fk_evaluation_ProductID` FOREIGN KEY(`ProductID`)
REFERENCES `Product` (`ProductID`);

ALTER TABLE `evaluation` ADD CONSTRAINT `fk_evaluation_customerID` FOREIGN KEY(`customerID`)
REFERENCES `Customer` (`CustomerID`);

ALTER TABLE `comment` ADD CONSTRAINT `fk_comment_ProductID` FOREIGN KEY(`ProductID`)
REFERENCES `Product` (`ProductID`);

ALTER TABLE `comment` ADD CONSTRAINT `fk_comment_customerID` FOREIGN KEY(`customerID`)
REFERENCES `Customer` (`CustomerID`);

ALTER TABLE `offers` ADD CONSTRAINT `fk_offers_ProductID` FOREIGN KEY(`ProductID`)
REFERENCES `Product` (`ProductID`);



