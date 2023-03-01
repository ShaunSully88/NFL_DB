--DROP DATABASE IF EXISTS nfldb;
--CREATE DATABASE nfldb;
--use nfldb;

-- DROP TABLES IF EXIST--
DROP TABLE IF EXISTS conference;
DROP TABLE IF EXISTS stadium;
DROP TABLE IF EXISTS state;
DROP TABLE IF EXISTS division;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS position;
DROP TABLE IF EXISTS college;


--CREATE TABLES--

--Conference Table--

CREATE TABLE conference (
    conf_id INT NOT NULL,
    conf_name char(3) NOT NULL,
    CONSTRAINT PK_Conference_ConferenceID PRIMARY KEY (conf_id)
);

--Division Table--

CREATE TABLE division (
    div_id INT NOT NULL,
    div_name char(5) NOT NULL,
    CONSTRAINT PK_Division_DivisionID PRIMARY KEY(div_id)
);

--U.S State Table--

CREATE TABLE state (
    state_id INT IDENTITY (1, 1) NOT NULL,
    state_name VARCHAR(20) NOT NULL,
    CONSTRAINT PK_State_StateID PRIMARY KEY (state_id),
);

--Stadium Table--

CREATE TABLE stadium (
    stadium_id INT NOT NULL,
    city char(30) NOT NULL,
    stadium_name char(30) NOT NULL,
    stadium_capacity INT NOT NULL,
    state_id INT,
    CONSTRAINT PK_Stadium_StadiumID PRIMARY KEY(stadium_id),
    CONSTRAINT FK_state_stateID FOREIGN KEY(state_id)
    REFERENCES state (state_id)
);

SELECT * FROM stadium;

--Teams Table--

CREATE TABLE teams (
    team_id INT NOT NULL,
    team_name char(30) NOT NULL,
    year_est char(4),
    conf_id INT,
    div_id INT,
    stadium_id INT,
    CONSTRAINT PK_Teams_TeamsID PRIMARY KEY (team_id),
    CONSTRAINT FK_conference_confID FOREIGN KEY (conf_id)
    REFERENCES conference (conf_id),
    CONSTRAINT FK_stadium_stadiumID FOREIGN KEY (stadium_id)
    REFERENCES stadium (stadium_id),
    CONSTRAINT FK_division_divID FOREIGN KEY (div_id)
    REFERENCES division (div_id)    
);

SELECT * FROM teams;
--Position Table--

CREATE TABLE position (
    pos_id INT IDENTITY(1,1),
    position VARCHAR(20) NOT NULL,
    CONSTRAINT PK_position_posID PRIMARY KEY (pos_id)
);

--College Table--

CREATE TABLE college (
    col_id INT IDENTITY(1,1),
    college VARCHAR(100) NOT NULL,
    CONSTRAINT PK_college_colID PRIMARY KEY (col_id)
);

--Player Table--

CREATE TABLE player (
    player_id INT IDENTITY(1, 1),
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    pos_id INT NOT NULL,
    team_id INT NOT NULL,
    height_cm INT NOT NULL,
    weight_lbs INT NOT NULL,
    birth_date DATE NOT NULL,
    col_id INT NOT NULL,
    CONSTRAINT PK_player_playerID PRIMARY KEY (player_id),
    CONSTRAINT FK_teams_teamID FOREIGN KEY (team_id)
    REFERENCES teams (team_id),
    CONSTRAINT FK_position_posID FOREIGN KEY (pos_id)
    REFERENCES position (pos_id),
    CONSTRAINT FK_college_colID FOREIGN KEY (col_id)
    REFERENCES college(col_id)
);


SELECT * FROM player;


SELECT 
    teams.team_name AS 'Team',
    stadium.stadium_name AS 'Stadium Name',
    stadium.stadium_capacity AS 'Capacity',
    stadium.city AS 'City',
    state.state_name AS 'State'   
FROM stadium
  INNER JOIN state ON stadium.state_id=state.state_id
  INNER JOIN teams ON stadium.stadium_id=teams.stadium_id
ORDER BY stadium_capacity DESC;  






