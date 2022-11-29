--1 SSNs of EMPLOYEEs who worked on Done Projects
-- @block 
SELECT EMP.SSN
FROM EMPLOYEE EMP
WHERE EXISTS(
    SELECT *
    FROM DEVELOPS D, ENGINEERS E, PROJECT P
    WHERE (D.Game_Dev_ID = EMP.SSN OR E.Sys_Eng_ID = EMP.SSN) AND 
        (D.Game_Proj_ID = P.Project_No OR E.Cons_Proj_ID = P.Project_No) AND
        P.Stat = 'Done'
    );
-- @block

--2 Provide Full Name of Managers for the "The Last of Us" Game Projects
-- @block
SELECT A.Fname, A.Lname
FROM EMPLOYEE A,
    GAME_PROJ B,
    GAME_DEV C,
    GAME D
WHERE A.SSN = C.Game_Dev_ID and C.Game_Dev_ID = B.Game_Proj_Mgr_SSN and B.GameID = D.GameID and D.Title = 'The Last of Us'
-- @block 

--3 Number of Players using Playstation 4
-- @block
SELECT COUNT(B.PlayerID)
FROM OWNED_CONSOLES A,
    PLAYER B,
    CONSOLE C
WHERE B.PlayerID = A.PlayerID and A.ConsoleID = C.ConsoleID and C.Title = 'Playstation 4';
-- @block

--4 Get the Name of Game_Dev with expertise in FPS Games
-- @block 
SELECT Fname, Lname
FROM EMPLOYEE, GAME_DEV
WHERE Game_Expertise = 'FPS' AND EMPLOYEE.SSN = GAME_DEV.Game_Dev_ID;

-- @block
--5 Number of players who own Spider-Man on the console Playstation 4
-- @block
SELECT COUNT(PlayerID)
FROM PLAYER X
WHERE PlayerID IN
    ( SELECT PlayerID
        FROM OWNED_GAME Y
        WHERE EXISTS ( 
            SELECT *
            FROM GAME Z
            WHERE X.PlayerID = Y.PlayerID and Y.GameID = Z.GameID and  Z.Title = 'Spider-Man'
        )
    );


