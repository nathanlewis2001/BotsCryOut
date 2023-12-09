CREATE TABLE `User` (
    `ID` int  NOT NULL ,
    `Full_Name` text  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `Tags` (
    `ID` int  NOT NULL ,
    `Tag` text  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `Prayer` (
    `ID` int  NOT NULL ,
    `Prompt` mediumtext  NOT NULL ,
    `Body` longtext  NOT NULL ,
    `Cover_Image` text  NOT NULL ,
    `Audio_File` text  NOT NULL ,
    `Human_Creator` int  NOT NULL ,
    `AI_Creator` text  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `Prayer_Tag` (
    `ID` int  NOT NULL ,
    `TagID` int  NOT NULL ,
    `PrayerID` int  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `Scripture` (
    `ID` int  NOT NULL ,
    `Reference` text  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `Scripture_Tag` (
    `ID` int  NOT NULL ,
    `ScriptureID` int  NOT NULL ,
    `PrayerId` int  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `User_Likes` (
    `ID` int  NOT NULL ,
    `User` int  NOT NULL ,
    `Prayer_Liked` int  NOT NULL ,
    `Timestamp` DATETIME  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `User_Saves` (
    `ID` int  NOT NULL ,
    `User` int  NOT NULL ,
    `Prayer_Saved` int  NOT NULL ,
    `Timestamp` DATETIME  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

ALTER TABLE `Prayer` ADD CONSTRAINT `fk_Prayer_Human_Creator` FOREIGN KEY(`Human_Creator`)
REFERENCES `User` (`ID`);

ALTER TABLE `Prayer_Tag` ADD CONSTRAINT `fk_Prayer_Tag_TagID` FOREIGN KEY(`TagID`)
REFERENCES `Tags` (`ID`);

ALTER TABLE `Prayer_Tag` ADD CONSTRAINT `fk_Prayer_Tag_PrayerID` FOREIGN KEY(`PrayerID`)
REFERENCES `Prayer` (`ID`);

ALTER TABLE `Scripture_Tag` ADD CONSTRAINT `fk_Scripture_Tag_ScriptureID` FOREIGN KEY(`ScriptureID`)
REFERENCES `Scripture` (`ID`);

ALTER TABLE `Scripture_Tag` ADD CONSTRAINT `fk_Scripture_Tag_PrayerId` FOREIGN KEY(`PrayerId`)
REFERENCES `Prayer` (`ID`);

ALTER TABLE `User_Likes` ADD CONSTRAINT `fk_User_Likes_User` FOREIGN KEY(`User`)
REFERENCES `User` (`ID`);

ALTER TABLE `User_Likes` ADD CONSTRAINT `fk_User_Likes_Prayer_Liked` FOREIGN KEY(`Prayer_Liked`)
REFERENCES `Prayer` (`ID`);

ALTER TABLE `User_Saves` ADD CONSTRAINT `fk_User_Saves_User` FOREIGN KEY(`User`)
REFERENCES `User` (`ID`);

ALTER TABLE `User_Saves` ADD CONSTRAINT `fk_User_Saves_Prayer_Saved` FOREIGN KEY(`Prayer_Saved`)
REFERENCES `Prayer` (`ID`);

