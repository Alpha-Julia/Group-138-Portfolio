SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

/*Creates table Formats*/
CREATE OR REPLACE TABLE Formats(
    formatID int AUTO_INCREMENT,
    single_battle varchar(255) NOT NULL,
    double_battle varchar(255) NOT NULL,
    PRIMARY KEY (formatID)
);



/*Creates table Events*/
CREATE OR REPLACE TABLE Events(
    eventID varchar(255),
    formatID int,
    playerCount int,
    eventLocation varchar(255) NOT NULL,
    eventDate date NOT NULL,
    firstPlace varchar(255) NOT NULL,
    secondPlace varchar(255) NOT NULL,
    thirdPlace varchar(255) NOT NULL,
    PRIMARY KEY (eventID),
    FOREIGN KEY (formatID) REFERENCES Formats (formatID) ON DELETE CASCADE
);


/*Creates Table PokemonSpecies*/
CREATE OR REPLACE TABLE PokemonSpecies(
    speciesID int,
    speciesName varchar(255) NOT NULL,
    baseHP int NOT NULL,
    baseAtk int NOT NULL,
    baseDef int NOT NULL,
    baseSpAtk int NOT NULL,
    baseSpDef int NOT NULL,
    baseSpeed int NOT NULL,
    typing varchar(255) NOT NULL,
    PRIMARY KEY (speciesID)
);

/*Creates Table PokemonUsed*/
CREATE OR REPLACE TABLE PokemonUsed(
    pokemonID int AUTO_INCREMENT,
    speciesID int,
    usagePercentage varchar(255) NOT NULL,
    item varchar(255) NOT NULL,
    spreadEV varchar(255) NOT NULL,
    nature varchar(255) NOT NULL,
    move1 varchar(255) NOT NULL,
    move2 varchar(255) NOT NULL,
    move3 varchar(255) NOT NULL,
    move4 varchar(255) NOT NULL,
    PRIMARY KEY (pokemonID),
    FOREIGN KEY (speciesID) REFERENCES PokemonSpecies (speciesID) ON DELETE CASCADE
);



/*Creats Teams Table*/
CREATE OR REPLACE TABLE Teams (
    teamID int AUTO_INCREMENT,
    pokemon1 int,
    pokemon2 int,
    pokemon3 int,
    pokemon4 int,
    pokemon5 int,
    pokemon6 int,
    PRIMARY KEY (teamID),
    FOREIGN KEY (pokemon1) REFERENCES PokemonUsed(pokemonID) ON DELETE CASCADE,
    FOREIGN KEY (pokemon2) REFERENCES PokemonUsed(pokemonID) ON DELETE CASCADE,
    FOREIGN KEY (pokemon3) REFERENCES PokemonUsed(pokemonID) ON DELETE CASCADE,
    FOREIGN KEY (pokemon4) REFERENCES PokemonUsed(pokemonID) ON DELETE CASCADE,
    FOREIGN KEY (pokemon5) REFERENCES PokemonUsed(pokemonID) ON DELETE CASCADE,
    FOREIGN KEY (pokemon6) REFERENCES PokemonUsed(pokemonID) ON DELETE CASCADE
);



/*Creates Table Players*/
CREATE OR REPLACE TABLE Players(
    playerID int AUTO_INCREMENT,
    seeding int NOT NULL,
    placement varchar(255),
    pointTotal int NOT NULL,
    teamID int NOT NULL,
    PRIMARY KEY (playerID),
    FOREIGN KEY (teamID) REFERENCES Teams (teamID) ON DELETE CASCADE
);










/*Table for M:M relationship between Events and Formats
CREATE OR REPLACE TABLE Events_has_Formats(
    eventID varchar(255),
    formatID int,
    FOREIGN KEY (eventID) REFERENCES Events(eventID) ON DELETE CASCADE,
    FOREIGN KEY (formatID) REFERENCES Formats (formatID) ON DELETE CASCADE
);*/


/*Table for M:M relationship between Players and Events*/
CREATE OR REPLACE TABLE Players_has_Events(
    playerID int,
    eventID varchar(255),
    FOREIGN KEY (playerID) REFERENCES Players(playerID) ON DELETE CASCADE,
    FOREIGN KEY (eventID) REFERENCES Events(eventID) ON DELETE CASCADE
);



/*Inserts
Formats, Events, Teams, Players, PokemonUsed, PokemonSpecies, Events_has_Formats*/

INSERT INTO Formats (formatID, single_battle, double_battle) VALUES (1, 'yes', 'no');
INSERT INTO Formats (formatID, single_battle, double_battle) VALUES (2, 'yes', 'yes');

INSERT INTO Events (eventID, formatID, playerCount, eventLocation, eventDate, firstPlace, secondPlace, thirdPlace) VALUES ("Austin Playins", 1, 16, "Austin, Texas", '2023/04/01', "Smith, Paul", "Twist, Oliver", "Cheung, Aaron");
INSERT INTO Events (eventID, formatID, playerCount, eventLocation, eventDate, firstPlace, secondPlace, thirdPlace) VALUES ("California Dreams", 2, 32, "Los Angeles, California", '2023/06/17', "Chen, Emily", "Herrera, Jose", "Chan, Erik");
INSERT INTO Events (eventID, formatID, playerCount, eventLocation, eventDate, firstPlace, secondPlace, thirdPlace) VALUES ("Crazy Canada", 1, 64, "Quebec, Canada", '2023/08/24', "Martinez, Aaron", "Jefferson, Thomas", "Liao, Hazel");


INSERT INTO PokemonSpecies (speciesID, speciesName, baseHP, baseAtk, baseDef, baseSpAtk, baseSpDef, baseSpeed, typing) VALUES (39, "Terrakion", 80, 120, 70, 50, 70, 100, "Rock, Fighting");
INSERT INTO PokemonSpecies (speciesID, speciesName, baseHP, baseAtk, baseDef, baseSpAtk, baseSpDef, baseSpeed, typing) VALUES (40, "Suicune", 100, 50, 100, 80, 100, 90, "Water");
INSERT INTO PokemonSpecies (speciesID, speciesName, baseHP, baseAtk, baseDef, baseSpAtk, baseSpDef, baseSpeed, typing) VALUES (41, "PorygonZ", 60, 50, 50, 130, 80, 100, "Normal");


INSERT INTO PokemonUsed (speciesID, usagePercentage, item, spreadEV, nature, move1, move2, move3, move4) VALUES (39, "50", "leftovers", "252 atk, 252 speed, 4hp", "Jolly", "Swords Dance", "Earthquake", "Stone Edge", "Close Combat");
INSERT INTO PokemonUsed (speciesID, usagePercentage, item, spreadEV, nature, move1, move2, move3, move4) VALUES (40, "100", "life orb", "252 hp, 160 def, 96 spdef", "Bold", "Toxic", "Calm Mind", "Rest", "Sleep Talk");
INSERT INTO PokemonUsed (speciesID, usagePercentage, item, spreadEV, nature, move1, move2, move3, move4) VALUES (41, "0", "choice scarf", "252 spatk, 252 hp, 4speed", "Modest", "Nasty Plot", "Hyper Beam", "Ice Beam", "Thunderbolt");

INSERT INTO Teams (pokemon1, pokemon2, pokemon3, pokemon4, pokemon5, pokemon6) VALUES (1, 1, 1, 1, 1, 1);
INSERT INTO Teams (pokemon1, pokemon2, pokemon3, pokemon4, pokemon5, pokemon6) VALUES (2, 2, 2, 1, 1, 1);
INSERT INTO Teams (pokemon1, pokemon2, pokemon3, pokemon4, pokemon5, pokemon6) VALUES (3, 3, 3, 3, 3, 3);


INSERT INTO Players (seeding, placement, pointTotal, teamID) VALUES (1, 'first', 100, 1);
INSERT INTO Players (seeding, placement, pointTotal, teamID) VALUES (2, 'third', 50, 2);
INSERT INTO Players (seeding, placement, pointTotal, teamID) VALUES (3, 'second', 25, 3);

SET FOREIGN_KEY_CHECKS=1;
COMMIT;