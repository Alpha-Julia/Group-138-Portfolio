/*Events needs SELECT, INSERT, UPDATE, and DELETE*/
/*get all event names, format set ID, player count, location, dates, and placements for the browse Events page*/
SELECT eventID, formatID, playerCount, eventLocation, eventDate, firstPlace, secondPlace, thirdPlace AS eventID, eventLocation
    FROM Events

/*insert into Events page table a new row with values eventID, formatID, playerCount, eventLocation, eventDate, firstPlace, secondPlace, thirdPlace*/
INSERT INTO Events (eventID, formatID, playerCount, eventLocation, eventDate, firstPlace, secondPlace, thirdPlace)
    VALUES (:eventIDinput, :formatIDinput, :playerCountInput, :eventLocationInput, :eventDateInput, :firstPlaceInput, :secondPlaceInput, :thirdPlaceInput)

/*Update an event's data based on submission of the Update Event Form*/
SELECT eventID, formatID, playerCount, eventLocation, eventDate, firstPlace, secondPlace, thirdPlace
    FROM Events
    WHERE eventID = :eventID_selected_from_browse_events_page

UPDATE Events
    SET eventID = :eventIDinput, formatID = :formatIDinput, playerCount = :playerCountInput, eventLocation = :eventLocationInput, eventDate = :eventDateInput, firstPlace = :firstPlaceInput, secondPlace = :secondPlaceInput, thirdPlace = :thirdPlaceInput
    WHERE eventID = :eventID_from_the_update_form

/*Delete an event*/
DELETE FROM Events where eventID = :eventID_selected_from_browse_events_page


/*Formats entity only needs SELECT, INSERT*/
/*Get all formatID, singles, doubles for Formats page*/
SELECT formatID, singles, doubles
    FROM Formats

/*Inserts into Formats table a new row containing the formatID, singles, and doubles*/
INSERT INTO Formats (formatID, singles, doubles)
    VALUES (:formatIDinput, :singlesInput, :doublesInput)


/*Players entity needs SELECT, INSERT, UPDATE and DELETE*/
/*Get all playerID, playerName, rank/seeding, placement, totalPoints, and teamsID for Players page*/
SELECT playerID, playerName, rank/seeding, placement, totalPoints, teamsID AS playerID, playerName
    FROM Players

/*Inserts into Players table a new row containing playerID, playerName, rank/seeding, placement, totalPoints, and teamsID*/
INSERT INTO Players (playerID, playerName, rank/seeding, placement, totalPoints, teamsID)
    VALUES (:playerID, :playerName, :rank/seeding, :placement, :totalPoints, :teamsID)

/*Update a player's data based on submission of the Update Player Form*/
SELECT playerID, playerName, rank/seeding, placement, totalPoints, teamsID
    FROM Players
    WHERE playerID = :playerID_selected_from_browse_players_page

UPDATE Players
    SET playerID = :playerIDinput, playerName = :playerNameInput, rank/seeding = :rank/seedingInput, placement = :placementInput, totalPoints = :totalPointsInput, teamsID = :teamsIDinput
    WHERE playerID = :playerID_from_the_update_form

/*Delete a player*/
DELETE FROM Players where playerID = :playerID_selected_from_browse_players_page


/*PokemonUsed, PokemonSpecies, and Teams entities all require only SELECT and INSERT*/
/*Should be very similar to Formats Entity with selections based on the Primary Key ID for each entity and INSERTS adding every attribute*/

/*PokemonUsed entity needs SELECT and INSERT only*/
SELECT PokemonUsed, pokemonID, speciesID, teamsID, usagePercentage, item, spreadEV, nature, move1, move2, move3, move4 AS pokemonID, teamsID
    FROM PokemonUsed

/*Inserts into PokemonUsed table a new row containing the pokemonID, speciesID, teamsID, usagePercentage, item, spreadEV, nature, move1, move2, move3, and move4 values*/
INSERT INTO PokemonUsed (pokemonID, speciesID, teamsID, usagePercentage, item, spreadEV, nature, move1, move2, move3, move4)
    VALUES (:pokemonID, :speciesID, :teamsID, :usagePercentage, :item, :spreadEV, :nature, :move1, :move2, :move3, :move4)


/*PokemonSpecies entity needs SELECT and INSERT only*/
SELECT PokemonSpecies, speciesID, baseAtk, baseDef, baseSpAtk, baseSpDef, baseSpd, baseHP, typing AS speciesID, typing
    FROM PokemonSpecies

/*Inserts into PokemonSpecies table a new row containing speciesID, baseAtk, baseDef, baseSpAtk, baseSpDef, baseSpd, baseHP, and typing*/
INSERT INTO PokemonSpecies (speciesID, baseAtk, baseDef, baseSpAtk, baseSpDef, baseSpd, baseHP, typing)
    VALUES (:speciesID, :baseAtk, :baseDef, :baseSpAtk, :baseSpDef, :baseSpd, :baseHP, :typing)


/*Teams entity needs SELECT and INSERT only*/
SELECT Teams, teamsID, pokemonID, pokemonID, pokemonID, pokemonID, pokemonID, pokemonID AS teamsID
    FROM Teams

/*Inserts into Teams table a new row containing teamsID, pokemonID, pokemonID, pokemonID, pokemonID, pokemonID, pokemonID*/
INSERT INTO PokemonSpecies (teamsID, pokemonID, pokemonID, pokemonID, pokemonID, pokemonID, pokemonID)
    VALUES (:teamsID, :pokemonID, :pokemonID, :pokemonID, :pokemonID, :pokemonID, :pokemonID)    