

create table Location(
	LocationID INT,
	Country VARCHAR(20) NOT NULL,
    State VARCHAR(20) NOT NULL,
    Zip  INT NOT NULL,
    StreetName VARCHAR(50) NOT NULL,
    StreetNo INT,
    constraint pk_Location primary key(LocationID)
);

INSERT INTO Location VALUES (1, 'India', 'Delhi',110018,'Bates Rd','196');
INSERT INTO Location VALUES (2, 'India', 'Mumbai',400004,'Andheri Versova Road','83');
INSERT INTO Location VALUES (3, 'India', 'Bangalore',560004,'Avenue Street','23');
INSERT INTO Location VALUES (4, 'US', 'Texas',75252,'Barnes','001');
INSERT INTO Location VALUES (5, 'US', 'New York',10005,'Broadway','152');
INSERT INTO Location VALUES (6, 'US', 'California',90002,'Adams Boulevard','382');
INSERT INTO Location VALUES (7, 'China', 'Shanghai',200010,'Dongmen Road','495');
INSERT INTO Location VALUES (8, 'China', 'Tianjin ',300041,'Wukang Road','105');
INSERT INTO Location VALUES (9, 'China', 'Beijing ',100015,'Yan an Road','110');
 

create table AccType(
	AccTypeID INT,
    AccName VARCHAR(50) NOT NULL,
    constraint pk_AccomType primary key(AccTypeID)
);
INSERT INTO AccType VALUES (0,'Apart-hotel');
INSERT INTO AccType VALUES (1,'Apartment');
INSERT INTO AccType VALUES (2,'Bed and Breakfast');
INSERT INTO AccType VALUES (3,'Guest House');
INSERT INTO AccType VALUES (4,'Hostel');
INSERT INTO AccType VALUES (5,'Hotel');
INSERT INTO AccType VALUES (6,'Inn');
INSERT INTO AccType VALUES (7,'Motel');
INSERT INTO AccType VALUES (8,'Resort');
INSERT INTO AccType VALUES (9,'Vacation home / Condo');
INSERT INTO AccType VALUES (10,'Villa');

create table Accomodation (
	AccID INT,
	NoOfRooms int,
	LocationID INT,
	PhoneNumber int,
	StarRating int,
	LandMark VARCHAR(20),
	AccTypeID INT,
    AccName VARCHAR(50) NOT NULL,
    Description VARCHAR(250),
    constraint pk_accomodation primary key(AccId),
    constraint fk_Accomodation_1 FOREIGN KEY (LocationID) REFERENCES Location(LocationID) ON DELETE CASCADE,
    constraint fk_Accomodation_2 FOREIGN KEY (AccTypeId) REFERENCES AccType(AccTypeId) ON DELETE CASCADE
);
INSERT INTO Accomodation VALUES (001,2,1,98765354,2,'Spring Valey Road',1,'Vans Apartment','Vans Apartment');
INSERT INTO Accomodation VALUES (002,4,1,98345354,2,'happ Road',1,'NY Apartmenrs','Ny Apartments');
INSERT INTO Accomodation VALUES (003,30,1,54765354,3,'Sp Road',5,'BGrea Hotel','Grea Hotel');
INSERT INTO Accomodation VALUES (004,40,1,676765354,4,'Hemple temple Road',5,'Richardson Hotel','Richardson Hotel');
INSERT INTO Accomodation VALUES (005,80,1,87865354,5,'Wang way',5,'SuperSource Hotel','SuperSource Hotel');
INSERT INTO Accomodation VALUES (006,20,1,985655354,4,'Super highway',5,'Britian Hotel','Britian Hotel');
INSERT INTO Accomodation VALUES (007,200,1,98325354,4,'NH 14 Main',8,'Water Resort','Water Resort');
INSERT INTO Accomodation VALUES (008,300,1,977775354,3,'Leftop Temple',8,'Stay Resort','Stay Resort');
INSERT INTO Accomodation VALUES (009,400,1,985575354,4,'Hellsing Road',8,'Calm Resort','Calm Resort');
INSERT INTO Accomodation VALUES (010,500,1,987565654,4,'Wayover bridge',8,'Sleeper Resort','Sleeper Resort');
INSERT INTO Accomodation VALUES (011,8,1,98765354,3,'KH52 Subway',3,'Wang Guest Hotel','Wang Guest Hotel');
INSERT INTO Accomodation VALUES (012,10,1,987656564,4,'MK14 Road',3,'Ulter comfort Guest Hotel','Ulter comfort Guest Hotel');

create table BedType(
	BedTypeID INT,
    BedSize VARCHAR(10)NOT NULL,
    NoOfBeds int NOT NULL,
    constraint pk_BedType primary key(BedTypeID)
);

Insert into Bedtype values(00001,'Single',1);
Insert into Bedtype values(00002,'Single',2);
Insert into Bedtype values(00011,'Single',3);
Insert into Bedtype values(00003,'Twin',1);
Insert into Bedtype values(00004,'Twin',2);
Insert into Bedtype values(00005,'Double',1);
Insert into Bedtype values(00006,'Double',2);
Insert into Bedtype values(00007,'Queen',1);
Insert into Bedtype values(00008,'Queen',2);
Insert into Bedtype values(00009,'King',1);
Insert into Bedtype values(00010,'King',2);

create table RoomType (
	RoomTypeID INT,
    RoomTypeName VARCHAR(10) NOT NULL,
    Meal  VARCHAR(20)DEFAULT 'No',
    constraint pk_RoomType primary key(RoomTypeID)
);

Insert into RoomType Values(001,'Economy','No');
Insert into RoomType Values(002,'Premium','Yes');
Insert into RoomType Values(003,'Luxury','Yes');
Insert into RoomType Values(004,'Economy','No');
Insert into RoomType Values(005,'Premium','Yes');
Insert into RoomType Values(006,'Luxury','Yes');
Insert into RoomType Values(007,'Economy','No');
Insert into RoomType Values(008,'Premium','Yes');
Insert into RoomType Values(009,'Economy','No');
Insert into RoomType Values(010,'Premium','Yes');


create table RoomBeds (
	BedTypeId INT,
	RoomTypeID INT,
	Capacity  int NOT NULL,
	BasePrice FLOAT NOT NULL,
    constraint pk_RoomBeds primary key(BedTypeId,RoomTypeID),
    constraint fk_RoomBeds_1 FOREIGN KEY (BedTypeId) REFERENCES BedType(BedTypeId) ON DELETE SET NULL,
    constraint fk_RoomBeds_2 FOREIGN KEY (RoomTypeID) REFERENCES RoomType(RoomTypeID) ON DELETE SET NULL
);

Insert into RoomBeds values(00001,001,1,100);
Insert into RoomBeds values(00001,002,1,150);
Insert into RoomBeds values(00001,003,1,200);
Insert into RoomBeds values(00003,004,1,200);
Insert into RoomBeds values(00003,005,1,225);
Insert into RoomBeds values(00003,006,1,300);
Insert into RoomBeds values(00005,001,1,300);
Insert into RoomBeds values(00005,002,1,350);
Insert into RoomBeds values(00005,003,1,400);
Insert into RoomBeds values(00007,001,1,600);
Insert into RoomBeds values(00007,002,1,650);
Insert into RoomBeds values(00007,003,1,700);


create table Amenity(
	AmenityID INT,
    AmenityName VARCHAR(20) NOT NULL,
    constraint pk_Amenity primary key(AmenityID)
);

--insert into Amenity values(1,'Microwave,');
--insert into Amenity values(2,'Wifi');
--insert into Amenity values(1,'Microwave');



create table Room (
	RoomID INT,
	RoomNo VARCHAR(5) NOT NULL,
	BedTypeId INT,
	RoomTypeID INT,
	ActiveFrom DATE DEFAULT SYSDATE,
	ActiveTo DATE DEfAULT TO_DATE('01/01/9999', 'mm/dd/yyyy'),
    CurrentStatus VARCHAR2(10) DEFAULT 'GREEN' CHECK( CurrentStatus IN ('GREEN','RED','YELLOW')) ,
    constraint pk_Room primary key(RoomID),
    constraint fk_Room_1 FOREIGN KEY (BedTypeId) REFERENCES BedType(BedTypeId),
    constraint fk_Room_2 FOREIGN KEY (RoomTypeId) REFERENCES RoomType(RoomTypeId)
);

Insert into room values(00001,001,001,001,TO_DATE('04/27/2019', 'mm/dd/yyyy'),TO_DATE('02/27/2020', 'mm/dd/yyyy'),'GREEN');
Insert into room values(00002,002,002,002,TO_DATE('01/27/2019', 'mm/dd/yyyy'),TO_DATE('02/27/2020', 'mm/dd/yyyy'),'GREEN');
Insert into room values(00003,003,003,002,TO_DATE('01/27/2019', 'mm/dd/yyyy'),TO_DATE('02/27/2030', 'mm/dd/yyyy'),'GREEN');
Insert into room values(00004,004,005,002,TO_DATE('01/27/2019', 'mm/dd/yyyy'),TO_DATE('02/27/2020', 'mm/dd/yyyy'),'GREEN');
Insert into room values(00005,005,002,003,TO_DATE('02/27/2019', 'mm/dd/yyyy'),TO_DATE('01/27/2020', 'mm/dd/yyyy'),'GREEN');
Insert into room values(00006,006,001,003,TO_DATE('03/27/2019', 'mm/dd/yyyy'),TO_DATE('01/27/2020', 'mm/dd/yyyy'),'GREEN');
Insert into room values(00007,004,002,003,TO_DATE('05/27/2019', 'mm/dd/yyyy'),TO_DATE('08/27/2019', 'mm/dd/yyyy'),'GREEN');
Insert into room values(00008,001,001,003,TO_DATE('06/27/2019', 'mm/dd/yyyy'),TO_DATE('06/27/2019', 'mm/dd/yyyy'),'GREEN');
create table RoomAmenity(
	RoomID INT,
    AmenityID INT,
    Quantiy int,
    constraint pk_RoomAmenity primary key(RoomID,AmenityID),
    constraint fk_RoomAmenity_1 FOREIGN KEY (AmenityID) REFERENCES Amenity(AmenityID) ON DELETE CASCADE,
    constraint fk_RoomAmenity_2 FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE CASCADE
);

create table Brand (
	BrandID INT,
	AccID INT,
    constraint pk_brand primary key(BrandID),
    constraint fk_Brand FOREIGN KEY (AccID) REFERENCES Accomodation(AccID) ON DELETE CASCADE
);

create table AccRooms (
	AccID INT,
	RoomID INT,
    Refundable int DEFAULT 0,
    constraint pk_accRooms primary key(AccID),
    constraint fk_AccRooms_1 FOREIGN KEY (AccID) REFERENCES Accomodation(AccID) ON DELETE CASCADE,
    constraint fk_AccRooms_2 FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE CASCADE
);

--Insert into AccRooms Values(1,1,1);
--Insert into AccRooms Values(1,2,1);
--Insert into AccRooms Values(1,3,1);
--Insert into AccRooms Values(2,4,1);
--Insert into AccRooms Values(2,5,1);
--Insert into AccRooms Values(2,6,1);

create table EventHalls (
	HallID int,
	AccID INT,
    HallName VARCHAR(10),
    Purpose  VARCHAR(20) NOT NULL,
    Capacity int NOT NULL,
    Price FLOAT NOT NULL,
    constraint pk_EventHalls primary key(HallID),
    constraint fk_EventHalls FOREIGN KEY (AccID) REFERENCES Accomodation(AccID) ON DELETE CASCADE
);

create table Payment (
	PaymentID INT,
	PaymentDate DATE DEFAULT SYSDATE,
    CardNumber INT,
    Amount  NUMERIC,
    constraint pk_Payment primary key(PaymentID)
);

create table CardNumType (
	CardNumber INT,
	CardType VARCHAR(5),
    constraint pk_CardNumType primary key(CardNumber)
);

--drop table RegisteredUser;
create table RegisteredUser(
	RUID VARCHAR(5),
	Fname VARCHAR(10) NOT NULL,
    Minit VARCHAR(10),
    Lname VARCHAR(10) NOT NULL,
    UserAddress VARCHAR(10),
    PhoneNo NUMERIC,
    CardNo VARCHAR(15),
    RewardsAmt int DEFAULT 0,
    constraint pk_RegisteredUser primary key(RUID)
);
INSERT INTO RegisteredUser VALUES (100,'Baljeet','Singh','NA','MacCallum',987654210,4526568452,1000);
INSERT INTO RegisteredUser VALUES (101,'Meghna','Mathur','NA','Frankford',98994210,89668452,5000);
INSERT INTO RegisteredUser VALUES (102,'John','Map','NA','Waterview',88854210,916568452,8000);

create table Guest(
	GID INT,
    Fname VARCHAR(15) NOT NULL,
    Lname VARCHAR(15) NOT NULL,
    Minit VARCHAR(5),
    PhoneNo INT,
    constraint pk_Guest primary key(GID)
);

INSERT INTO Guest VALUES (200,'Yui','Wan','NA',999985410);
INSERT INTO Guest VALUES (201,'Won','Yang','NA',989655410);
INSERT INTO Guest VALUES (202,'Vedika','Dev','NA',997985410);
INSERT INTO Guest VALUES (203,'Kavya','Mehra','NA',941985410);



create table Customer(
	CustomerID VARCHAR(5),
    RUID VARCHAR(5),
    GID INT,
    constraint pk_Customer primary key(CustomerID), 
    constraint fk_Customer_1 FOREIGN KEY (RUID) REFERENCES RegisteredUser(RUID)ON DELETE CASCADE,
    constraint fk_Customer_2 FOREIGN KEY (GID) REFERENCES Guest(GID)ON DELETE CASCADE
    
);

INSERT INTO Customer VALUES (001,100,Null);
INSERT INTO Customer VALUES (002,101,Null);
INSERT INTO Customer VALUES (003,102,Null);
INSERT INTO Customer VALUES (004,Null,200);
INSERT INTO Customer VALUES (005,Null,201);
INSERT INTO Customer VALUES (006,Null,202);
INSERT INTO Customer VALUES (007,Null,203);

create table Booking (
	BookingID VARCHAR(8),
	BookingDate DATE DEFAULT SYSDATE,
    CustomerID VARCHAR(5),
    CheckIN  DATE NOT NULL,
    CheckOut DATE NOT NULL,
    NoOfAdults int,
    NoOfChildren int DEFAULT 0,
    RoomId INT NOT NULL,
    constraint pk_Booking primary key(BookingID),
    constraint fk_Booking_1 FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    constraint fk_Booking_2 FOREIGN KEY (RoomId) REFERENCES Room(RoomId)
);

--Insert into Booking values('00001', TO_DATE('04/27/2019', 'mm/dd/yyyy'), 1, TO_DATE('04/27/2019', 'mm/dd/yyyy'), TO_DATE('05/27/2019', 'mm/dd/yyyy'), 2, 3, 00002);

create table BookingPayment (
	BookingID VARCHAR(8),
    PaymentID VARCHAR(5),
    constraint pk_BookingPayment primary key(BookingID)
);

create table ZipCity(
	Zip INT,
	City VARCHAR(10)NOT NULL,
    constraint pk_ZipCity primary key(Zip)
);
create table Login(
	UserID VARCHAR(5),
    Password VARCHAR(15),
    constraint pk_Login primary key(UserID)
    
);

create table UserRUIDMap(
	RUID VARCHAR(5),
    UserID VARCHAR(5),
    constraint pk_UserRUIDMap primary key(RUID),
    constraint fk_UserRUIDMap_1 FOREIGN KEY (UserID) REFERENCES Login(UserID) ON DELETE CASCADE,
    constraint fk_UserRUIDMap_2 FOREIGN KEY (RUID) REFERENCES RegisteredUser(RUID) ON DELETE CASCADE
);
create table Reviews(
	ReviewID VARCHAR(5),
    RUID VARCHAR(5),
    AccID INT,
    Feedback VARCHAR(50) NOT NULL,
    GuestRating INT,
    constraint pk_Reviews primary key(ReviewID),
    constraint fk_Reviews_1 FOREIGN KEY (RUID) REFERENCES RegisteredUser(RUID),
    constraint fk_Reviews_2 FOREIGN KEY (AccID) REFERENCES AccRooms(AccID) ON DELETE CASCADE
);

create table Deals(
	DealID VARCHAR(5),
    Discount NUMERIC DEFAULT 0,
    PromoCode VARCHAR(5) NOT NULL,
    ValidityStartDate DATE,
    ValidityEndDate DATE,
    constraint pk_Deals primary key(DealID)
);

create table Features(
	FeatureID VARCHAR(5),
    FeatureName VARCHAR(20) NOT NULL,
    constraint pk_Features primary key(FeatureID)
);

create table HotelFeatures(
	AccID INT,
    FeatureID VARCHAR(5),
    Quantiy int,
    constraint pk_HotelFeatures primary key(AccID,FeatureID),
    constraint fk_HotelFeatures_1 FOREIGN KEY (AccID) REFERENCES Accomodation(AccID) ON DELETE CASCADE,
    constraint fk_HotelFeatures_2 FOREIGN KEY (FeatureID) REFERENCES Features(FeatureID) ON DELETE CASCADE
);
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE proc_booking (
    bookingID VARCHAR,
	bookingDate DATE,
    customerID VARCHAR,
    checkIN  DATE,
    checkOut DATE,
    noOfAdults INT,
    noOfChildren INT,
    roomId INT
) IS
INVALID_CUSTOMER EXCEPTION;

BEGIN 
        INSERT into Booking values (bookingID, bookingDate, customerID, checkIN, checkOut, noOfAdults, noOfChildren, roomId);
        dbms_output.put_line('Booking Confirmed'); 

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Error!');
    WHEN OTHERS THEN
        IF(SQLCODE=-20319) THEN
            dbms_output.put_line('Error: Invalid_Customer');
        ELSIF(SQLCODE=-20320) THEN
            dbms_output.put_line('Error: Invalid ROOM');
        ELSIF(SQLCODE=-20321) THEN
            dbms_output.put_line('Error: Booking Date not available');
        ELSIF(SQLCODE=-20322) THEN
            dbms_output.put_line('Error: Room is not available for booking');
        ELSIF(SQLCODE=-20323) THEN
            dbms_output.put_line('Error: Checkin Date is more than CheckOut Data');
        ELSE
        NULL;
        END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_after_booking AFTER
    INSERT ON Booking
    FOR EACH ROW
DECLARE
before_status room.currentstatus%type;
after_status room.currentstatus%type;
v_Roomid room.roomid%type;
BEGIN
    SELECT ROOM.Currentstatus,roomid into before_status,v_roomid from room where roomid=:new.roomid;
    update ROOM
    SET 
        CurrentStatus='YELLOW'
    WHERE ROOMID =: new.Roomid;
    SELECT ROOM.Currentstatus into after_status from room where roomid=:new.roomid;
    dbms_output.proc_booking('Room Id:'||v_roomid ||' has been set from '|| before_status||' to ' ||after_status);

END;
/


CREATE OR REPLACE TRIGGER trg_before_booking BEFORE 
    INSERT ON Booking
    FOR EACH ROW
DECLARE
found_count_1 INT;
found_count_2 INT;
found_count_3 INT;

CURSOR checkinout_cur IS
        SELECT  CHECKIN,CHECKOUT 
        FROM    Booking
        WHERE   Roomid =:new.roomid;
    l_booking  checkinout_cur%ROWTYPE;

INVALID_CUSTOMER EXCEPTION;
INVALID_ROOM EXCEPTION;
BOOK_NOT_AVAILABLE EXCEPTION;
NOT_AVAILABLE_ROOM EXCEPTION;
DATE_INVALID EXCEPTION;
BEGIN
--    dbms_output.proc_booking('Room Number is not Valid');
    SELECT COUNT(*) INTO found_count_1 FROM CUSTOMER WHERE CUSTOMERID=:new.CUSTOMERID;
    SELECT COUNT(*) INTO found_count_2 FROM ROOM WHERE ROOMID=:new.ROOMID;
    SELECT COUNT(*) INTO found_count_3 FROM ROOM WHERE ROOMID=:new.ROOMID and ROOM.CURRENTSTATUS = 'YELLOW' OR ROOM.CURRENTSTATUS = 'GREEN';

    IF(found_count_1=0) THEN
    RAISE  INVALID_CUSTOMER;
    ELSIF (found_count_2=0) THEN
    RAISE INVALID_ROOM;
    ELSIF (found_count_3=0) THEN
    RAISE NOT_AVAILABLE_ROOM;
    ELSIF (:new.checkin>:new.checkout) THEN
    RAISE DATE_INVALID;
    ELSE
        NULL;
    END IF;
    OPEN  checkinout_cur;
    LOOP
    FETCH checkinout_cur INTO l_booking;
    EXIT WHEN checkinout_cur%NOTFOUND;
    if ((l_booking.checkin<=:new.checkin and l_booking.checkout>=:new.checkin) or (l_booking.checkin<=:new.checkout and l_booking.checkout>=:new.checkout) ) THEN
    RAISE BOOK_NOT_AVAILABLE;
    END if;
    END Loop;
    CLOSE checkinout_cur;
EXCEPTION
    WHEN INVALID_CUSTOMER THEN
    Raise_application_error(-20319, 'Invalid_Customer');
    WHEN INVALID_ROOM THEN
    Raise_application_error(-20320, 'Invalid ROOM');
    WHEN BOOK_NOT_AVAILABLE THEN
    Raise_application_error(-20321, 'Booking Date not available'); 
    WHEN NOT_AVAILABLE_ROOM THEN
    Raise_application_error(-20322, 'Room is not available for booking'); 
    WHEN DATE_INVALID THEN
    Raise_application_error(-20323, 'Checkin Date can not be more than checkout date'); 
    
END;
/

EXECUTE proc_booking(3, TO_DATE(SYSDATE), 1, TO_DATE('06/20/2019', 'mm/dd/yyyy'), TO_DATE('06/20/2019', 'mm/dd/yyyy'), 2, 3, 00001);

--Insert into booking values(13, TO_DATE(SYSDATE),001, TO_DATE('07/15/2020', 'mm/dd/yyyy'), TO_DATE('07/30/2020', 'mm/dd/yyyy'), 2, 3,0002);




CREATE OR REPLACE PROCEDURE proc_available_room_count (
    input_date IN DATE
) IS
INVALID_CUSTOMER EXCEPTION;
roomCount INT;
rtn room.currentstatus%type;

CURSOR available_room_count_cur IS
        SELECT  Room.RoomTypeID,RoomTypeName Rn,COUNT(*) cnt
        FROM    ROOM,RoomType
        WHERE   Room.RoomTypeID = RoomType.RoomTypeID 
        AND Room.ActiveFrom<input_date 
        AND Room.ActiveTo>input_date 
        AND (CurrentStatus = 'GREEN' OR CurrentStatus = 'YELLOW')
        AND Room.RoomID not in (select roomid from booking where Booking.checkin>=input_date AND Booking.checkout<=input_date and Booking.roomid = room.roomid )
        GROUP BY Room.RoomTypeID, RoomTypeName;
        
        l_available  available_room_count_cur%ROWTYPE;
    
BEGIN 
    OPEN  available_room_count_cur;
    LOOP
    FETCH available_room_count_cur INTO l_available;
    EXIT WHEN available_room_count_cur%NOTFOUND;
    dbms_output.put_line(l_available.rn ||' '|| l_available.cnt);

  
    END Loop;
    CLOSE available_room_count_cur;
     
END;
/

EXECUTE proc_available_room_count(TO_DATE('06/20/2019', 'mm/dd/yyyy'));
