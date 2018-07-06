 create table Accounts (
        User_Name varchar(20) not null,
        Active bit not null,
        Password varchar(20) not null,
        User_Role varchar(20) not null,
        primary key (User_Name)
    );
 
    create table Order_Details (
        ID varchar(50) not null,
        Amount double precision not null,
        Price double precision not null,
        Quanity integer not null,
        ORDER_ID varchar(50) not null,
        PRODUCT_ID varchar(20) not null,
        primary key (ID)
    );
 
    create table Orders (
        ID varchar(50) not null,
        Amount double precision not null,
        Customer_Address varchar(255) not null,
        Customer_Email varchar(128) not null,
        Customer_Name varchar(255) not null,
        Customer_Phone varchar(128) not null,
        Order_Date datetime not null,
        Order_Num integer not null,
        primary key (ID)
    );
 
    create table Products (
        Code varchar(20) not null,
        Create_Date datetime not null,
        Image longblob,
        Name varchar(255) not null,
        Description varchar(255),
        Price double precision not null,
        primary key (Code)
    );
 
    alter table Orders
        add constraint UK_sxhpvsj665kmi4f7jdu9d2791  unique (Order_Num);
 
    alter table Order_Details
        add constraint ORDER_DETAIL_ORD_FK
        foreign key (ORDER_ID)
        references Orders (ID);
 
    alter table Order_Details
        add constraint ORDER_DETAIL_PROD_FK
        foreign key (PRODUCT_ID)
        references Products (Code);
        
insert into Accounts (USER_NAME, ACTIVE, PASSWORD, USER_ROLE) values ('employee1', 1, '123', 'EMPLOYEE');
insert into Accounts (USER_NAME, ACTIVE, PASSWORD, USER_ROLE) values ('manager1', 1, '123', 'MANAGER');

insert into Products (CODE, NAME, PRICE, CREATE_DATE, DESCRIPTION) values ('S001', 'Cannondale F-si Carbon 4 29er Mountain Bike  2019', 5000, current_timestamp(), 'The worlds best XC hardtail just got better. If going really really fast on dirt in lycra is your cup otea nothing lets you top em on the climbs and drop em on the descents like the all-new F-Si.');
insert into Products (CODE, NAME, PRICE, CREATE_DATE, DESCRIPTION) values ('S002', 'Specialized Epic Expert Mountain Bike  2018', 5500, current_timestamp(), 'An evolutionary leap forward from the Fargo, Cutthroat is all about speed and comfort.Racing-inspired geometry make for a quick bike that won’t leave you pummeled as you ride alongside a rising moon.');
insert into Products (CODE, NAME, PRICE, CREATE_DATE, DESCRIPTION) values ('S003', 'Cannondale F-si Carbon 2 29er Mountain Bike  2019', 4500, current_timestamp(), 'The worlds best XC hardtail just got better. If going really really fast on dirt in lycra is your cup o tea nothing lets you top em on the climbs and drop em on the descents like the all-new F-Si.');
insert into Products (CODE, NAME, PRICE, CREATE_DATE, DESCRIPTION) values ('S004', 'Specialized Rockhopper Sport Mountain Bike  201', 800, current_timestamp(), 'Maybe you are finding your legs on the singletrack or perhaps you are just dirt-curious? Either way the Rockhopper Sport is the only bike you need to live out your trail fantasies.');
insert into Products (CODE, NAME, PRICE, CREATE_DATE, DESCRIPTION) values ('S005', 'Kona Hei Hei Race Mountain Bike  2017', 1100, current_timestamp(),'Raced to the ends of the Earth by the Kona Endurance Team this 29-inch Fuse Independent Suspension design has conquered 24-hour races and survived a vicious World Cup schedule on progressively more aggressive courses.' );
