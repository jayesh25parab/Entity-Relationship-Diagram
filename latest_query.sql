-- Generated by Oracle SQL Developer Data Modeler 4.1.1.888
--   at:        2015-10-20 18:16:12 IST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




DROP TABLE Audit_Log CASCADE CONSTRAINTS ;

DROP TABLE Config CASCADE CONSTRAINTS ;

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

DROP TABLE Video_Type CASCADE CONSTRAINTS ;

DROP TABLE Warehouse CASCADE CONSTRAINTS ;

CREATE TABLE Audit_Log
  (
    Audit_Log_Id             NUMBER (6) NOT NULL ,
    Log_Time_Date            TIMESTAMP NOT NULL ,
    Is_Suspended             CHAR (1) NOT NULL ,
    Mofified_By_User         VARCHAR2 (20) NOT NULL ,
    Member_Membership_Number NUMBER (7) NOT NULL
  ) ;
ALTER TABLE Audit_Log ADD CONSTRAINT Suspended_Constraint CHECK ( Is_Suspended IN ('Y','N')) ;
COMMENT ON COLUMN Audit_Log.Audit_Log_Id
IS
  'Unique Audit Log ID' ;
  COMMENT ON COLUMN Audit_Log.Log_Time_Date
IS
  'Date of Log' ;
  COMMENT ON COLUMN Audit_Log.Is_Suspended
IS
  'Flag of Suspension' ;
  COMMENT ON COLUMN Audit_Log.Mofified_By_User
IS
  'User Modified' ;
  COMMENT ON COLUMN Audit_Log.Member_Membership_Number
IS
  'Unique Membership Number' ;
ALTER TABLE Audit_Log ADD CONSTRAINT Audit_Log_PK PRIMARY KEY ( Audit_Log_Id ) ;


CREATE TABLE Config
  (
    DelConNo                NUMBER (7) NOT NULL ,
    Media_Player_Media_ID   NUMBER (7) NOT NULL ,
    Connection_Connect_Code VARCHAR2 (6) NOT NULL ,
    Device_Device_ID        NUMBER (7) NOT NULL ,
    Video_Type_Video_Code   CHAR (3) NOT NULL
  ) ;
COMMENT ON COLUMN Config.DelConNo
IS
  'Unique Delivery Configuration Number' ;
  COMMENT ON COLUMN Config.Media_Player_Media_ID
IS
  'Unique Identifier for Media Player' ;
  COMMENT ON COLUMN Config.Connection_Connect_Code
IS
  'Connection Code' ;
  COMMENT ON COLUMN Config.Device_Device_ID
IS
  'Unique Device Number' ;
  COMMENT ON COLUMN Config.Video_Type_Video_Code
IS
  'Unique Video Code' ;
ALTER TABLE Config ADD CONSTRAINT Config_PK PRIMARY KEY ( DelConNo ) ;


CREATE TABLE Connection
  (
    Connect_Code    VARCHAR2 (6) NOT NULL ,
    Connection_Type VARCHAR2 (20) NOT NULL
  ) ;
COMMENT ON COLUMN Connection.Connect_Code
IS
  'Connection Code' ;
  COMMENT ON COLUMN Connection.Connection_Type
IS
  'Type of Connection' ;
ALTER TABLE Connection ADD CONSTRAINT Connection_PK PRIMARY KEY ( Connect_Code ) ;


CREATE TABLE Device
  (
    Device_ID          NUMBER (7) NOT NULL ,
    Device_Name        VARCHAR2 (20) NOT NULL ,
    Device_Memory_Size NUMBER (7) NOT NULL
  ) ;
COMMENT ON COLUMN Device.Device_ID
IS
  'Unique Device Number' ;
  COMMENT ON COLUMN Device.Device_Name
IS
  'Name Of Device' ;
  COMMENT ON COLUMN Device.Device_Memory_Size
IS
  'Memory Size Of Device' ;
ALTER TABLE Device ADD CONSTRAINT Device_PK PRIMARY KEY ( Device_ID ) ;


CREATE TABLE Download
  (
    Download_ID              NUMBER (7) NOT NULL ,
    Download_Start_Date      DATE NOT NULL ,
    Download_Complete_Date   DATE NOT NULL ,
    Video_Title_Title_id     NUMBER (7) NOT NULL ,
    Video_Serve_Server_ID    NUMBER (7) NOT NULL ,
    Member_Membership_Number NUMBER (7) NOT NULL ,
    Video_Config_DelConNo    NUMBER (7) NOT NULL
  ) ;
COMMENT ON COLUMN Download.Download_ID
IS
  'Unique Download Identifier' ;
  COMMENT ON COLUMN Download.Download_Start_Date
IS
  'Download Start Date' ;
  COMMENT ON COLUMN Download.Download_Complete_Date
IS
  'Download End Date' ;
  COMMENT ON COLUMN Download.Video_Title_Title_id
IS
  'Unique Title Identifier' ;
  COMMENT ON COLUMN Download.Video_Serve_Server_ID
IS
  'Unique Server Identifier' ;
  COMMENT ON COLUMN Download.Member_Membership_Number
IS
  'Unique Membership Number' ;
  COMMENT ON COLUMN Download.Video_Config_DelConNo
IS
  'Unique Delivery Configuration Number' ;
ALTER TABLE Download ADD CONSTRAINT Download_PK PRIMARY KEY ( Download_ID ) ;


CREATE TABLE Media_Player
  (
    Media_ID             NUMBER (7) NOT NULL ,
    MediaPlayer          VARCHAR2 (20) NOT NULL ,
    Media_Player_Version VARCHAR2 (20) NOT NULL
  ) ;
COMMENT ON COLUMN Media_Player.Media_ID
IS
  'Unique Identifier for Media Player' ;
  COMMENT ON COLUMN Media_Player.MediaPlayer
IS
  'Media Player Name' ;
  COMMENT ON COLUMN Media_Player.Media_Player_Version
IS
  'Version Of Media Player' ;
ALTER TABLE Media_Player ADD CONSTRAINT Media_Player_PK PRIMARY KEY ( Media_ID ) ;


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
  'Unique Membership Number' ;
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
    DVD_ID                 NUMBER (7) NOT NULL ,
    DVD_Format             VARCHAR2 (50) NOT NULL ,
    Warehouse_Warehouse_ID NUMBER (7) NOT NULL ,
    Title_Title_id         NUMBER (7) NOT NULL
  ) ;
COMMENT ON COLUMN Physical_Dvd.DVD_ID
IS
  'Unique DVD Identifier' ;
  COMMENT ON COLUMN Physical_Dvd.DVD_Format
IS
  'Format of DVD' ;
  COMMENT ON COLUMN Physical_Dvd.Warehouse_Warehouse_ID
IS
  'Warehouse Identifier' ;
  COMMENT ON COLUMN Physical_Dvd.Title_Title_id
IS
  'Unique Title Identifier' ;
ALTER TABLE Physical_Dvd ADD CONSTRAINT Physical_Dvd_PK PRIMARY KEY ( DVD_ID ) ;


CREATE TABLE Rent
  (
    Rent_Id                  NUMBER (7) NOT NULL ,
    Dispatch_Date            DATE NOT NULL ,
    Receive_Date             DATE NOT NULL ,
    Physical_Dvd_DVD_ID      NUMBER (7) NOT NULL ,
    Member_Membership_Number NUMBER (7) NOT NULL
  ) ;
COMMENT ON COLUMN Rent.Rent_Id
IS
  'Unique Rent Identifier' ;
  COMMENT ON COLUMN Rent.Dispatch_Date
IS
  'Dispatch Date Of Dvd' ;
  COMMENT ON COLUMN Rent.Receive_Date
IS
  'Receive Date Of Date' ;
  COMMENT ON COLUMN Rent.Physical_Dvd_DVD_ID
IS
  'Unique DVD Identifier' ;
  COMMENT ON COLUMN Rent.Member_Membership_Number
IS
  'Unique Membership Number' ;
ALTER TABLE Rent ADD CONSTRAINT Rent_PK PRIMARY KEY ( Rent_Id ) ;


CREATE TABLE Review
  (
    Review_Rating            NUMBER (1) NOT NULL ,
    Review_Comment           VARCHAR2 (50) NOT NULL ,
    Member_Membership_Number NUMBER (7) NOT NULL ,
    Title_Title_id           NUMBER (7) NOT NULL
  ) ;
ALTER TABLE Review ADD CONSTRAINT rating_between_1_to5 CHECK ( Review_Rating >=1 AND Review_Rating<=5) ;
COMMENT ON COLUMN Review.Review_Rating
IS
  'Review Rating' ;
  COMMENT ON COLUMN Review.Review_Comment
IS
  'Review Comment for Title' ;
  COMMENT ON COLUMN Review.Member_Membership_Number
IS
  'Unique Membership Number' ;
  COMMENT ON COLUMN Review.Title_Title_id
IS
  'Unique Title Identifier' ;
ALTER TABLE Review ADD CONSTRAINT Review_PK PRIMARY KEY ( Member_Membership_Number, Title_Title_id ) ;


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
  'Unique Server Identifier' ;
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
  COMMENT ON COLUMN Title.Title_Actress
IS
  'Lead Actress of Title' ;
  COMMENT ON COLUMN Title.Title_Genre
IS
  'Genre of Title' ;
  COMMENT ON COLUMN Title.Title_Language
IS
  'Language Of Title' ;
ALTER TABLE Title ADD CONSTRAINT Title_PK PRIMARY KEY ( Title_id ) ;


CREATE TABLE Video
  (
    Title_Title_id  NUMBER (7) NOT NULL ,
    Serve_Server_ID NUMBER (7) NOT NULL ,
    File_Size       NUMBER (7) NOT NULL ,
    Config_DelConNo NUMBER (7) NOT NULL
  ) ;
COMMENT ON COLUMN Video.Title_Title_id
IS
  'Unique Title Identifier' ;
  COMMENT ON COLUMN Video.Serve_Server_ID
IS
  'Unique Server Identifier' ;
  COMMENT ON COLUMN Video.File_Size
IS
  'Size Of File' ;
  COMMENT ON COLUMN Video.Config_DelConNo
IS
  'Unique Delivery Configuration Number' ;
ALTER TABLE Video ADD CONSTRAINT Video_PK PRIMARY KEY ( Title_Title_id, Serve_Server_ID, Config_DelConNo ) ;


CREATE TABLE Video_Type
  (
    Video_Code    CHAR (3) NOT NULL ,
    Video_Quality VARCHAR2 (20) NOT NULL
  ) ;
COMMENT ON COLUMN Video_Type.Video_Code
IS
  'Unique Video Code' ;
  COMMENT ON COLUMN Video_Type.Video_Quality
IS
  'Video Quality' ;
ALTER TABLE Video_Type ADD CONSTRAINT Video_Type_PK PRIMARY KEY ( Video_Code ) ;


CREATE TABLE Warehouse
  (
    Warehouse_ID       NUMBER (7) NOT NULL ,
    Warehouse_Address  VARCHAR2 (50) ,
    Warehouse_Capacity VARCHAR2 (20) ,
    City               VARCHAR2 (20)
  ) ;
COMMENT ON COLUMN Warehouse.Warehouse_ID
IS
  'Warehouse Identifier' ;
  COMMENT ON COLUMN Warehouse.Warehouse_Address
IS
  'Warehouse Address' ;
  COMMENT ON COLUMN Warehouse.Warehouse_Capacity
IS
  'Number of DVD it can store' ;
  COMMENT ON COLUMN Warehouse.City
IS
  'Warehouse City' ;
ALTER TABLE Warehouse ADD CONSTRAINT Warehouse_PK PRIMARY KEY ( Warehouse_ID ) ;


ALTER TABLE Audit_Log ADD CONSTRAINT Audit_Log_Member_FK FOREIGN KEY ( Member_Membership_Number ) REFERENCES Member ( Membership_Number ) ;

ALTER TABLE Config ADD CONSTRAINT Config_Connection_FK FOREIGN KEY ( Connection_Connect_Code ) REFERENCES Connection ( Connect_Code ) ;

ALTER TABLE Config ADD CONSTRAINT Config_Device_FK FOREIGN KEY ( Device_Device_ID ) REFERENCES Device ( Device_ID ) ;

ALTER TABLE Config ADD CONSTRAINT Config_Media_Player_FK FOREIGN KEY ( Media_Player_Media_ID ) REFERENCES Media_Player ( Media_ID ) ;

ALTER TABLE Config ADD CONSTRAINT Config_Video_Type_FK FOREIGN KEY ( Video_Type_Video_Code ) REFERENCES Video_Type ( Video_Code ) ;

ALTER TABLE Download ADD CONSTRAINT Download_Member_FK FOREIGN KEY ( Member_Membership_Number ) REFERENCES Member ( Membership_Number ) ;

ALTER TABLE Download ADD CONSTRAINT Download_Video_FK FOREIGN KEY ( Video_Title_Title_id, Video_Serve_Server_ID, Video_Config_DelConNo ) REFERENCES Video ( Title_Title_id, Serve_Server_ID, Config_DelConNo ) ;

ALTER TABLE Physical_Dvd ADD CONSTRAINT Physical_Dvd_Title_FK FOREIGN KEY ( Title_Title_id ) REFERENCES Title ( Title_id ) ;

ALTER TABLE Physical_Dvd ADD CONSTRAINT Physical_Dvd_Warehouse_FK FOREIGN KEY ( Warehouse_Warehouse_ID ) REFERENCES Warehouse ( Warehouse_ID ) ;

ALTER TABLE Rent ADD CONSTRAINT Rent_Member_FK FOREIGN KEY ( Member_Membership_Number ) REFERENCES Member ( Membership_Number ) ;

ALTER TABLE Rent ADD CONSTRAINT Rent_Physical_Dvd_FK FOREIGN KEY ( Physical_Dvd_DVD_ID ) REFERENCES Physical_Dvd ( DVD_ID ) ;

ALTER TABLE Review ADD CONSTRAINT Review_Member_FK FOREIGN KEY ( Member_Membership_Number ) REFERENCES Member ( Membership_Number ) ;

ALTER TABLE Review ADD CONSTRAINT Review_Title_FK FOREIGN KEY ( Title_Title_id ) REFERENCES Title ( Title_id ) ;

ALTER TABLE Video ADD CONSTRAINT Video_Config_FK FOREIGN KEY ( Config_DelConNo ) REFERENCES Config ( DelConNo ) ;

ALTER TABLE Video ADD CONSTRAINT Video_Serve_FK FOREIGN KEY ( Serve_Server_ID ) REFERENCES Serve ( Server_ID ) ;

ALTER TABLE Video ADD CONSTRAINT Video_Title_FK FOREIGN KEY ( Title_Title_id ) REFERENCES Title ( Title_id ) ;


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
-- CREATE SEQUENCE                          0
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
