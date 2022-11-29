--1 Hired new Game Developer Darren Martin on 2/21/2014 with Expertise in RPGs 
    -- SSN = 168219837
-- @block
INSERT INTO EMPLOYEE VALUES (168219837, 'Darren', 'Martin', '2014-2-21');
INSERT INTO GAME_DEV VALUES (168219837, 'RPG');

--2 Update Status of Project named 'Project_Sky' to 'Done'
-- @block
UPDATE PROJECT
SET Stat = 'Done'
WHERE Pname = 'Project_Sky';

--3 The Game 'Spider-Man' is on Sale for 30$ off
-- @block 
UPDATE GAME
SET Price = Price - 30
WHERE Title = 'Spider-Man'; 

-- @block 
--4 A new Player joined with ID 'palogamer' named Trina Handley 
INSERT INTO PLAYER VALUES ('palogamer', 'Trina', 'Handley');

--5 Player 'palogamer' bought a Playstation 4 Console, and the games 'Spider-Man' and 'Death Stranding' to play on the console

-- @block
INSERT INTO OWNED_CONSOLES(PlayerID, ConsoleID)
    SELECT PlayerID, ConsoleID
    FROM CONSOLE, PLAYER
    WHERE CONSOLE.Title = 'Playstation 4' AND PLAYER.PlayerID = 'palogamer';
