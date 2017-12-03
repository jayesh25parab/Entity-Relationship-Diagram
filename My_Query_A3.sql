DROP TABLE Audit_Log CASCADE CONSTRAINTS ;

DROP TABLE Configuration CASCADE CONSTRAINTS ;

DROP TABLE Connection CASCADE CONSTRAINTS ;

DROP TABLE Device CASCADE CONSTRAINTS ;

DROP TABLE Download CASCADE CONSTRAINTS ;

DROP TABLE Media_Player CASCADE CONSTRAINTS ;

DROP TABLE Member CASCADE CONSTRAINTS ;

DROP TABLE Physical_Dvd CASCADE CONSTRAINTS ;

DROP TABLE Rent CASCADE CONSTRAINTS ;

DROP TABLE Review CASCADE CONSTRAINTS ;

DROP TABLE Serve CASCADE CONSTRAINTS ;

DROP TABLE Title CASCADE CONSTRAINTS ;

DROP TABLE Video CASCADE CONSTRAINTS ;

DROP TABLE Video_Quality CASCADE CONSTRAINTS ;

DROP TABLE Warehouse CASCADE CONSTRAINTS ;

CREATE TABLE Audit_Log
  (
    Audit_Log_Id      NUMBER (6) NOT NULL ,
    Log_Time_Date     TIMESTAMP NOT NULL ,
    Is_Suspended      CHAR (1) NOT NULL ,
    Mofified_By_User  VARCHAR2 (20) NOT NULL ,
    Membership_Number NUMBER (7) NOT NULL
  ) ;
ALTER TABLE Audit_Log ADD CONSTRAINT Suspended_Constraint CHECK ( Is_Suspended IN ('Y','N')) ;
COMMENT ON COLUMN Audit_Log.Membership_Number
IS
  'Membership Number' ;
ALTER TABLE Audit_Log ADD CONSTRAINT Audit_Log_PK PRIMARY KEY ( Audit_Log_Id ) ;


CREATE TABLE Configuration
  (
    DeliveryConfigNo     NUMBER (7) NOT NULL ,
    MediaPlayer          VARCHAR2 (20) NOT NULL ,
    Media_Player_Version VARCHAR2 (20) NOT NULL ,
    Device_Name          VARCHAR2 (20) NOT NULL ,
    Device_Memory_Size   NUMBER (7) NOT NULL ,
    Video_Quality_Code   CHAR (3) NOT NULL ,
    Connection_Code      VARCHAR2 (6) NOT NULL
  ) ;
COMMENT ON COLUMN Configuration.DeliveryConfigNo
IS
  'Delivery Configuration Number' ;
  COMMENT ON COLUMN Configuration.MediaPlayer
IS
  'Media Player Name' ;
  COMMENT ON COLUMN Configuration.Media_Player_Version
IS
  'Version Of Media Player' ;
  COMMENT ON COLUMN Configuration.Device_Name
IS
  'Name Of Device' ;
  COMMENT ON COLUMN Configuration.Device_Memory_Size
IS
  'Memory Size Of Device' ;
  COMMENT ON COLUMN Configuration.Connection_Code
IS
  'Connection Code' ;
ALTER TABLE Configuration ADD CONSTRAINT Configuration_PK PRIMARY KEY ( DeliveryConfigNo ) ;


CREATE TABLE Connection
  (
    Connection_Code VARCHAR2 (6) NOT NULL ,
    Connection_Type VARCHAR2 (20) NOT NULL
  ) ;
COMMENT ON COLUMN Connection.Connection_Code
IS
  'Connection Code' ;
  COMMENT ON COLUMN Connection.Connection_Type
IS
  'Type of Connection' ;
ALTER TABLE Connection ADD CONSTRAINT Connection_PK PRIMARY KEY ( Connection_Code ) ;


CREATE TABLE Device
  (
    Device_Name        VARCHAR2 (20) NOT NULL ,
    Device_Memory_Size NUMBER (7) NOT NULL
  ) ;
COMMENT ON COLUMN Device.Device_Name
IS
  'Name Of Device' ;
  COMMENT ON COLUMN Device.Device_Memory_Size
IS
  'Memory Size Of Device' ;
ALTER TABLE Device ADD CONSTRAINT Device_PK PRIMARY KEY ( Device_Name, Device_Memory_Size ) ;


CREATE TABLE Download
  (
    Download_ID            NUMBER (7) NOT NULL ,
    Download_Start_Date    DATE NOT NULL ,
    Download_Complete_Date DATE NOT NULL ,
    Title_id               NUMBER (7) NOT NULL ,
    Server_ID              NUMBER (7) NOT NULL ,
    Membership_Number      NUMBER (7) NOT NULL ,
    DeliveryConfigNo       NUMBER (7) NOT NULL
  ) ;
COMMENT ON COLUMN Download.Download_ID
IS
  'Warehouse Identifier' ;
  COMMENT ON COLUMN Download.Download_Start_Date
IS
  'Download Start Date' ;
  COMMENT ON COLUMN Download.Download_Complete_Date
IS
  'Download End Date' ;
  COMMENT ON COLUMN Download.Title_id
IS
  'Unique Title Identifier' ;
  COMMENT ON COLUMN Download.Server_ID
IS
  'Server Identifier' ;
  COMMENT ON COLUMN Download.Membership_Number
IS
  'Membership Number' ;
  COMMENT ON COLUMN Download.DeliveryConfigNo
IS
  'Delivery Configuration Number' ;
ALTER TABLE Download ADD CONSTRAINT Download_PK PRIMARY KEY ( Download_ID ) ;


CREATE TABLE Media_Player
  (
    MediaPlayer          VARCHAR2 (20) NOT NULL ,
    Media_Player_Version VARCHAR2 (20) NOT NULL
  ) ;
COMMENT ON COLUMN Media_Player.MediaPlayer
IS
  'Media Player Name' ;
  COMMENT ON COLUMN Media_Player.Media_Player_Version
IS
  'Version Of Media Player' ;
ALTER TABLE Media_Player ADD CONSTRAINT Media_Player_PK PRIMARY KEY ( MediaPlayer, Media_Player_Version ) ;


CREATE TABLE Member
  (
    Membership_Number       NUMBER (7) NOT NULL ,
    Member_Name             VARCHAR2 (50) NOT NULL ,
    Member_Delivery_Address VARCHAR2 (50) NOT NULL ,
    Member_Phone_Number     NUMBER (10) ,
    Member_Email_Address    VARCHAR2 (20) ,
    Membership_Level        CHAR (1) NOT NULL ,
    Membership_Start_Date   DATE NOT NULL ,
    Membership_Status       CHAR (1)
  ) ;
ALTER TABLE Member ADD CONSTRAINT membership_level_constraint CHECK ( Membership_Level   IN ('G', 'S', 'B')) ;
ALTER TABLE Member ADD CONSTRAINT membership_status_constraint CHECK ( Membership_Status IN ('C', 'S', 'I')) ;
COMMENT ON COLUMN Member.Membership_Number
IS
  'Membership Number' ;
  COMMENT ON COLUMN Member.Member_Name
IS
  'Member Name' ;
  COMMENT ON COLUMN Member.Member_Delivery_Address
IS
  'DVD Delivery Address' ;
  COMMENT ON COLUMN Member.Member_Phone_Number
IS
  'Member Contact Number' ;
  COMMENT ON COLUMN Member.Member_Email_Address
IS
  'Member Email Address' ;
  COMMENT ON COLUMN Member.Membership_Level
IS
  'Level of Membership' ;
  COMMENT ON COLUMN Member.Membership_Start_Date
IS
  'Starting Date of Membership' ;
  COMMENT ON COLUMN Member.Membership_Status
IS
  'Status of Membership' ;
ALTER TABLE Member ADD CONSTRAINT Member_PK PRIMARY KEY ( Membership_Number ) ;


CREATE TABLE Physical_Dvd
  (
    DVD_ID       NUMBER (7) NOT NULL ,
    DVD_Format   VARCHAR2 (50) NOT NULL ,
    Warehouse_ID NUMBER (7) NOT NULL ,
    Title_id     NUMBER (7) NOT NULL
  ) ;
COMMENT ON COLUMN Physical_Dvd.DVD_ID
IS
  'DVD_ID Identifier' ;
  COMMENT ON COLUMN Physical_Dvd.DVD_Format
IS
  'Format of DVD' ;
  COMMENT ON COLUMN Physical_Dvd.Warehouse_ID
IS
  'Warehouse Identifier' ;
  COMMENT ON COLUMN Physical_Dvd.Title_id
IS
  'Unique Title Identifier' ;
ALTER TABLE Physical_Dvd ADD CONSTRAINT Physical_Dvd_PK PRIMARY KEY ( DVD_ID ) ;


CREATE TABLE Rent
  (
    Rent_Id           NUMBER (7) NOT NULL ,
    Dispatch_Date     DATE NOT NULL ,
    Receive_Date      DATE NOT NULL ,
    DVD_ID            NUMBER (7) NOT NULL ,
    Membership_Number NUMBER (7) NOT NULL
  ) ;
COMMENT ON COLUMN Rent.Rent_Id
IS
  'Rent Identifier' ;
  COMMENT ON COLUMN Rent.Dispatch_Date
IS
  'Dispatch Date Of Dvd' ;
  COMMENT ON COLUMN Rent.Receive_Date
IS
  'Receive Date Of Date' ;
  COMMENT ON COLUMN Rent.DVD_ID
IS
  'DVD_ID Identifier' ;
  COMMENT ON COLUMN Rent.Membership_Number
IS
  'Membership Number' ;
ALTER TABLE Rent ADD CONSTRAINT Rent_PK PRIMARY KEY ( Rent_Id ) ;


CREATE TABLE Review
  (
    Review_Rating     NUMBER (1) NOT NULL ,
    Review_Comment    VARCHAR2 (50) NOT NULL ,
    Membership_Number NUMBER (7) NOT NULL ,
    Title_id          NUMBER (7) NOT NULL
  ) ;
ALTER TABLE Review ADD CONSTRAINT rating_between_1_to5 CHECK ( Review_Rating >=1 AND Review_Rating<=5) ;
COMMENT ON COLUMN Review.Review_Rating
IS
  'Review Rating' ;
  COMMENT ON COLUMN Review.Review_Comment
IS
  'Review Comment for Title' ;
  COMMENT ON COLUMN Review.Membership_Number
IS
  'Membership Number' ;
  COMMENT ON COLUMN Review.Title_id
IS
  'Unique Title Identifier' ;
ALTER TABLE Review ADD CONSTRAINT Review_PK PRIMARY KEY ( Membership_Number, Title_id ) ;


CREATE TABLE Serve
  (
    Server_ID            NUMBER (7) NOT NULL ,
    Server_Ip_Address    VARCHAR2 (20) NOT NULL ,
    Server_Os            VARCHAR2 (20) NOT NULL ,
    Server_Location      VARCHAR2 (20) NOT NULL ,
    Server_Disk_Capacity VARCHAR2 (20) NOT NULL ,
    Server_Max_Bandwidth VARCHAR2 (20) NOT NULL
  ) ;
COMMENT ON COLUMN Serve.Server_ID
IS
  'Server Identifier' ;
  COMMENT ON COLUMN Serve.Server_Ip_Address
IS
  'Server IP Address' ;
  COMMENT ON COLUMN Serve.Server_Os
IS
  'Server Operating System' ;
  COMMENT ON COLUMN Serve.Server_Location
IS
  'Server Location' ;
  COMMENT ON COLUMN Serve.Server_Disk_Capacity
IS
  'Server Disk Capacity' ;
  COMMENT ON COLUMN Serve.Server_Max_Bandwidth
IS
  'Server Max Bandwidth' ;
ALTER TABLE Serve ADD CONSTRAINT Serve_PK PRIMARY KEY ( Server_ID ) ;


CREATE TABLE Title
  (
    Title_id             NUMBER (7) NOT NULL ,
    Title_Name           VARCHAR2 (50) NOT NULL ,
    Title_Classification CHAR (2) NOT NULL ,
    Number_Of_Minutes    NUMBER (3) NOT NULL ,
    Title_Director       VARCHAR2 (50) ,
    Title_Actor          VARCHAR2 (50) ,
    Title_Actress        VARCHAR2 (50) ,
    Title_Genre          VARCHAR2 (50) NOT NULL ,
    Title_Language       VARCHAR2 (50) NOT NULL
  ) ;
COMMENT ON COLUMN Title.Title_id
IS
  'Unique Title Identifier' ;
  COMMENT ON COLUMN Title.Title_Name
IS
  'Title Name' ;
  COMMENT ON COLUMN Title.Title_Classification
IS
  'Classification Of Title' ;
  COMMENT ON COLUMN Title.Number_Of_Minutes
IS
  'Length Of Title in Minutes' ;
  COMMENT ON COLUMN Title.Title_Director
IS
  'Director Of Title' ;
  COMMENT ON COLUMN Title.Title_Actor
IS
  'Lead Actor of Title' ;
  COMMENT ON COLUMN Title.Title_Genre
IS
  'Genre of Title' ;
  COMMENT ON COLUMN Title.Title_Language
IS
  'Language Of Title' ;
ALTER TABLE Title ADD CONSTRAINT Title_PK PRIMARY KEY ( Title_id ) ;


CREATE TABLE Video
  (
    Title_id         NUMBER (7) NOT NULL ,
    Server_ID        NUMBER (7) NOT NULL ,
    File_Size        NUMBER (7) NOT NULL ,
    DeliveryConfigNo NUMBER (7) NOT NULL
  ) ;
COMMENT ON COLUMN Video.Title_id
IS
  'Unique Title Identifier' ;
  COMMENT ON COLUMN Video.Server_ID
IS
  'Server Identifier' ;
  COMMENT ON COLUMN Video.File_Size
IS
  'Size Of File' ;
  COMMENT ON COLUMN Video.DeliveryConfigNo
IS
  'Delivery Configuration Number' ;
ALTER TABLE Video ADD CONSTRAINT Video_PK PRIMARY KEY ( Title_id, Server_ID, DeliveryConfigNo ) ;


CREATE TABLE Video_Quality
  (
    Video_Quality_Code CHAR (3) NOT NULL ,
    Video_Quality      VARCHAR2 (20) NOT NULL
  ) ;
COMMENT ON COLUMN Video_Quality.Video_Quality
IS
  'Video Quality' ;
ALTER TABLE Video_Quality ADD CONSTRAINT Video_Quality_PK PRIMARY KEY ( Video_Quality_Code ) ;


CREATE TABLE Warehouse
  (
    Warehouse_ID       NUMBER (7) NOT NULL ,
    Warehouse_Location VARCHAR2 (50)
  ) ;
COMMENT ON COLUMN Warehouse.Warehouse_ID
IS
  'Warehouse Identifier' ;
  COMMENT ON COLUMN Warehouse.Warehouse_Location
IS
  'Warehouse location' ;
ALTER TABLE Warehouse ADD CONSTRAINT Warehouse_PK PRIMARY KEY ( Warehouse_ID ) ;


ALTER TABLE Audit_Log ADD CONSTRAINT Audit_Log_Member_FK FOREIGN KEY ( Membership_Number ) REFERENCES Member ( Membership_Number ) ;

ALTER TABLE Configuration ADD CONSTRAINT Configuration_Connection_FK FOREIGN KEY ( Connection_Code ) REFERENCES Connection ( Connection_Code ) ;

ALTER TABLE Configuration ADD CONSTRAINT Configuration_Device_FK FOREIGN KEY ( Device_Name, Device_Memory_Size ) REFERENCES Device ( Device_Name, Device_Memory_Size ) ;

ALTER TABLE Configuration ADD CONSTRAINT Configuration_Media_Player_FK FOREIGN KEY ( MediaPlayer, Media_Player_Version ) REFERENCES Media_Player ( MediaPlayer, Media_Player_Version ) ;

ALTER TABLE Configuration ADD CONSTRAINT Configuration_Video_Quality_FK FOREIGN KEY ( Video_Quality_Code ) REFERENCES Video_Quality ( Video_Quality_Code ) ;

ALTER TABLE Download ADD CONSTRAINT Download_Member_FK FOREIGN KEY ( Membership_Number ) REFERENCES Member ( Membership_Number ) ;

ALTER TABLE Download ADD CONSTRAINT Download_Video_FK FOREIGN KEY ( Title_id, Server_ID, DeliveryConfigNo ) REFERENCES Video ( Title_id, Server_ID, DeliveryConfigNo ) ;

ALTER TABLE Physical_Dvd ADD CONSTRAINT Physical_Dvd_Title_FK FOREIGN KEY ( Title_id ) REFERENCES Title ( Title_id ) ;

ALTER TABLE Physical_Dvd ADD CONSTRAINT Physical_Dvd_Warehouse_FK FOREIGN KEY ( Warehouse_ID ) REFERENCES Warehouse ( Warehouse_ID ) ;

ALTER TABLE Rent ADD CONSTRAINT Rent_Member_FK FOREIGN KEY ( Membership_Number ) REFERENCES Member ( Membership_Number ) ;

ALTER TABLE Rent ADD CONSTRAINT Rent_Physical_Dvd_FK FOREIGN KEY ( DVD_ID ) REFERENCES Physical_Dvd ( DVD_ID ) ;

ALTER TABLE Review ADD CONSTRAINT Review_Member_FK FOREIGN KEY ( Membership_Number ) REFERENCES Member ( Membership_Number ) ;

ALTER TABLE Review ADD CONSTRAINT Review_Title_FK FOREIGN KEY ( Title_id ) REFERENCES Title ( Title_id ) ;

ALTER TABLE Video ADD CONSTRAINT Video_Configuration_FK FOREIGN KEY ( DeliveryConfigNo ) REFERENCES Configuration ( DeliveryConfigNo ) ;

ALTER TABLE Video ADD CONSTRAINT Video_Serve_FK FOREIGN KEY ( Server_ID ) REFERENCES Serve ( Server_ID ) ;

ALTER TABLE Video ADD CONSTRAINT Video_Title_FK FOREIGN KEY ( Title_id ) REFERENCES Title ( Title_id ) ;

CREATE SEQUENCE Audit_Log_Audit_Log_Id_SEQ START WITH 1 NOCACHE ORDER ;

CREATE SEQUENCE Configuration_DeliveryConfigNo START WITH 1 NOCACHE ORDER ;

CREATE SEQUENCE Download_Download_ID_SEQ START WITH 1 NOCACHE ORDER ;

CREATE SEQUENCE Member_Membership_Number_SEQ START WITH 1 NOCACHE ORDER ;

CREATE SEQUENCE Physical_Dvd_DVD_ID_SEQ START WITH 1 NOCACHE ORDER ;

CREATE SEQUENCE Rent_Rent_Id_SEQ START WITH 1 NOCACHE ORDER ;

CREATE SEQUENCE Serve_Server_ID_SEQ START WITH 1 NOCACHE ORDER ;

CREATE SEQUENCE Title_Title_id_SEQ START WITH 1 NOCACHE ORDER ;

CREATE SEQUENCE Warehouse_Warehouse_ID_SEQ START WITH 1 NOCACHE ORDER ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             0
-- ALTER TABLE                             35
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          9
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0