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


--SEEDS--

--Conference Seeds--
INSERT INTO conference
VALUES (1, 'NFC'),
       (2, 'AFC');


--Division Seeds--
INSERT INTO division 
VALUES
(1, 'North'),
(2, 'South'),
(3, 'West'),
(4, 'East');

--State Seeds--
INSERT INTO  state 
VALUES ('Arizona'),
    ('Georgia'),
    ('Maryland'),
    ('New York'),
    ('North Carolina'),
    ('Illinois'),
    ('Ohio'),
    ('Texas'),
    ('Colorado'),
    ('Michigan'),
    ('Wisconsin'),
    ('Indiana'),
    ('Florida'),
    ('Missouri'),
    ('Las Vegas'),
    ('California'),
    ('Minnesota'),
    ('Massachusetts'),
    ('Louisiana'),
    ('New Jersey'),
    ('Pennsylvania'),
    ('Washington'),
    ('Tennessee');


--Stadium Seeds--
INSERT INTO stadium 
VALUES
(1, 'Phoenix', 'State Farm Stadium', 63400, 1),
(2, 'Atlanta', 'Mercedes Benz Stadium', 75000, 2),
(3, 'Baltimore', 'M&T Bank Stadium', 71008, 3),
(4, 'Orchard Park', 'Highmark Stadium', 71608, 4),
(5, 'Charlotte', 'Bank of America Stadium', 75412, 5),
(6, 'Chicago', 'Solider Field', 61500, 6),
(7, 'Cincinnati', 'Paycor Stadium', 65535, 7),
(8, 'Cleveland', 'FirstEnergy Stadium', 67895, 7),
(9, 'Arlington', 'AT&T Stadium', 80000, 8),
(10, 'Denver', 'Mile High Stadium', 76125, 9),
(11, 'Detroit', 'Ford Field', 65000, 10),
(12, 'Green Bay', 'Lambeau Field', 81441, 11),
(13, 'Houston', 'NRG Stadium', 72220, 8),
(14, 'Indianapolis', 'Lucas Oil Stadium', 70000, 12),
(15, 'Jacksonville', 'TIAA Bank Field', 67164, 13),
(16, 'Kansas City', 'Arrowhead Stadium', 76416, 14),
(17, 'Paradise', 'Allegiant Stadium', 65000, 15),
(18, 'Inglewood', 'Sofi Stadium', 70240, 16),
(19, 'Miami Gardens', 'Hard Rock Stadium', 65326, 13),
(20, 'Minneapolis', 'US Bank Stadium', 73000, 17),
(21, 'Foxborough', 'Gillette Stadium', 65878, 18),
(22, 'New Orleans', 'Caesars Superdome', 74295, 19),
(23, 'East Rutherford', 'MetLife Stadium', 82500, 20),
(24, 'Philadelphia', 'Lincoln Financial Field', 67594, 21),
(25, 'Pittsburgh', 'Acrisure Stadium', 68400, 21),
(26, 'Santa Clara', 'Levi''s Stadium', 68500, 16),
(27, 'Seattle', 'Lumen Field', 72000, 22),
(28, 'Tampa', 'Raymond James Stadium', 65890, 13),
(29, 'Nashville', 'Nissan Stadium', 69143, 23),
(30, 'Summerfield', 'FedEx Field', 82000, 3);


--Teams Seeds--
INSERT INTO teams 
VALUES
(1, 'Arizona Cardinals', 1898, 1, 3, 1),
(2, 'Atlanta Falcons', 1965, 1, 2, 2),
(3, 'Baltimore Ravens', 1996, 2, 1, 3),
(4, 'Buffalo Bills', 1960, 2, 4, 4),
(5, 'Carolina Panthers', 1993, 1, 2, 5),
(6, 'Chicago Bears', 1920, 1, 1, 6),
(7, 'Cincinnati Bengals', 1967, 2, 1, 7),
(8, 'Cleveland Browns', 1946, 2, 1, 8),
(9, 'Dallas Cowboys', 1960, 1, 4, 9),
(10, 'Denver Broncos', 1960, 2, 3, 10),
(11, 'Detroit Lions', 1929, 1, 1, 11),
(12, 'Green Bay Packers', 1919, 1, 1, 12),
(13, 'Houston Texans', 1999, 2, 2, 13 ),
(14, 'Indianapolis Colts', 1953, 2, 2, 14),
(15, 'Jacksonville Jaguars', 1993, 2, 2, 15),
(16, 'Kansas City Chiefs', 1960, 2, 3, 16),
(17, 'Las Vegas Raiders', 1960, 2, 3, 17),
(18, 'Los Angeles Chargers', 1960, 2, 3, 18),
(19, 'Los Angeles Rams', 1936, 1, 3, 18),
(20, 'Miami Dolphins', 1966, 2, 4, 19),
(21, 'Minnesota Vikings', 1960, 1, 1, 20),
(22, 'New England Patriots', 1960, 2, 4, 21),
(23, 'New Orleans Saints', 1967, 1, 2, 22),
(24, 'New York Giants', 1925, 1, 4, 23),
(25, 'New York Jets', 1960, 2, 4, 23),
(26, 'Philadelphia Eagles', 1933, 1, 4, 24),
(27, 'Pittsburgh Steelers', 1933, 2, 1, 25),
(28, 'San Francisco 49ers', 1946, 1, 3, 26),
(29, 'Seattle Seahawks', 1974, 1, 3, 27),
(30, 'Tampa Bay Buccaneers', 1976, 1, 2, 28),
(31, 'Tennessee Titans', 1959, 2, 2, 29),
(32, 'Washington Commanders', 1932, 1, 4, 30);


--Position Seeds--
INSERT INTO position
VALUES
('Quarterback'),
('Wide Receiver'),
('Running Back'),
('Tight End'),
('Left Tackle'),
('Right Tackle'),
('Left Guard'),
('Right Guard'),
('Center'),
('Defensive Tackle'),
('Defensive End'),
('Linebacker'),
('Cornerback'),
('Safety');

--College Seeds--
INSERT INTO college
VALUES
('University of Oklahoma'),
('University of Texas'),
('University of Oregon'),
('University of Cincinnati'),
('University of Louisville'),
('University of Utah'),
('University of Wyoming'),
('University of Houston'),
('University of Southern California'),
('Ohio State University'),
('Northwestern University'),
('Louisiana State University'),
('University of Arkansas'),
('Clemson University'),
('North Carolina State University'),
('Mississippi State University'),
('Central Michigan University'),
('Boise State University'),
('University of California'),
('Indiana University'),
('Utah State University'),
('Stanford University'),
('Texas A&M University'),
('Boston College'),
('University of Iowa'),
('Texas Tech University'),
('University of Michigan'),
('Fresno State'),
('Auburn University'),
('University of Missouri'),
('University of Georgia'),
('Wake Forest University'),
('University of Alabama'),
('Michigan State University'),
('University of Southern Mississippi'),
('Western Kentucky University'),
('Florida State University'),
('Texas Christian University'),
('Duke University'),
('Virginia Tech'),
('Brigham Young University'),
('Washington State University'),
('University of Pittsburgh'),
('University of North Carolina'),
('Eastern Illinois University'),
('Iowa State University'),
('North Dakota State University'),
('West Virginia'),
('Liberty University'),
('Old Dominion'),
('Temple University'),
('Purdue'),
('Arizona State University'),
('University of South Carolina'),
('University of Virginia'),
('University of Minnesota'),
('University of Florida'),
('University of Central Florida'),
('University of Maryland'),
('University of Colorado'),
('Notre Dame University'),
('Arizona State University'),
('Tulane University'),
('Colorado State University'),
('Southern Methodist University'),
('Penn State University'),
('College of the Holy Cross'),
('University of Nevada'),
('University of Kentucky'),
('Oregon State University'),
('University of Cincinnati'),
('University of Miami'),
('Malone University'),
('East Carolina University'),
('University of San Diego'),
('University of South Florida'),
('University of Pennsylvania'),
('Western Michigan University'),
('Kentucky Wesleyan College'),
('University of Tennessee'),
('California State University, Sacramento'),
('Eastern Washington University'),
('University of West Alabama'),
('Vanderbilt University'),
('Minnesota State University'),
('Baylor University'),
('Weber State University'),
('Middle Tennessee State University');


SELECT * FROM college;
SELECT * FROM teams;

--Player Seeds--
INSERT INTO player
VALUES
('Kyler', 'Murray', 1, 1, 178, 207, 1997-08-07, 1),
('Colt', 'McCoy', 1, 1, 185, 211, 1986-09-05, 2),
('Marcus', 'Mariota', 1, 2, 193, 220, 1993-10-30, 3),
('Desmond', 'Ridder', 1, 2, 193, 213, 1999-08-31, 4),
('Lamar', 'Jackson', 1, 3, 188, 211, 1997-01-07, 5),
('Tyler', 'Huntley', 1, 3, 185, 194, 1998-02-03, 6),
('Josh', 'Allen', 1, 4, 196, 235, 1996-05-21, 7),
('Case', 'Keenum', 1, 4, 185, 213, 1988-02-17, 8),
('Baker', 'Mayfield', 1, 5, 185, 213, 1995-04-14, 1),
('Sam', 'Darnold', 1, 5, 190, 225, 1997-06-05, 9),
('Justin', 'Fields', 1, 6, 190, 228, 1999-03-05, 10),
('Trevor', 'Siemian', 1, 6, 190, 220, 1991-12-26, 11),
('Joe', 'Burrow', 1, 7, 193, 221, 1996-12-10, 12),
('Brandon', 'Allen', 1, 7, 188, 209, 1992-09-05, 13),
('Deshaun', 'Watson', 1, 8, 188, 215, 1995-05-14, 14),
('Jacoby', 'Brissett', 1, 8, 193, 235, 1992-12-11, 15),
('Dak', 'Prescott', 1, 9, 188, 238, 1993-07-29, 16),
('Cooper', 'Rush', 1, 9, 190, 225, 1993-11-21, 17),
('Russell', 'Wilson', 1, 10, 180, 215, 1988-11-29, 15),
('Brett', 'Rypien', 1, 10, 188, 202, 1996-07-09, 18),
('Jared', 'Goff', 1, 11, 193, 217, 1994-10-14, 19),
('Nate', 'Sudfeld', 1, 11, 198, 227, 1993-10-07, 20),
('Aaron', 'Rodgers', 1, 12, 188, 225, 1983-12-02, 19),
('Jordan', 'Love', 1, 12, 193, 219, 1998-11-02, 21),
('Davis', 'Mills', 1, 13, 193, 225, 1998-10-21, 22),
('Kyle', 'Allen', 1, 13, 190, 210, 1996-03-08, 8),
('Matt', 'Ryan', 1, 14, 193, 217, 1985-05-17, 24),
('Sam', 'Ehlinger', 1, 14, 190, 225, 1998-09-30, 2),
('Trevor', 'Lawrence', 1, 15, 198, 213, 1999-10-06, 14),
('C.J', 'Beathard', 1, 15, 188, 215, 1993-11-16, 25),
('Patrick', 'Mahomes', 1, 16, 190, 227, 1995-09-17, 26),
('Chad', 'Henne', 1, 16, 190, 215, 1985-07-02, 27),
('Derek', 'Carr', 1, 17, 190, 210, 1991-03-28, 28),
('Jarrett', 'Stidham', 1, 17, 190, 214, 1996-08-08, 29),
('Justin', 'Herbert', 1, 18, 198, 237, 1998-03-10, 3),
('Chase', 'Daniel', 1, 18, 183, 218, 1986-10-07, 30),
('Matthew', 'Stafford', 1, 19, 190, 220, 1988-02-07, 31),
('John', 'Wolford', 1, 19, 185, 200, 1995-10-16, 32),
('Tua', 'Tagovailoa', 1, 20, 185, 217, 1998-03-02, 33),
('Teddy', 'Bridgewater', 1, 20, 188, 215, 1992-11-10, 5),
('Kirk', 'Cousins', 1, 21, 190, 205, 1988-08-19, 34),
('Nick', 'Mullens', 1, 21, 185, 210, 1995-03-21, 35),
('Mac', 'Jones', 1, 22, 190, 217, 1998-09-05, 33),
('Bailey', 'Zappe', 1, 22, 185, 220, 1999-04-26, 36),
('Jameis', 'Winston', 1, 23, 193, 231, 1994-01-06, 37),
('Andy', 'Dalton', 1, 23, 188, 219, 1987-10-29, 38),
('Daniel', 'Jones', 1, 24, 196, 221, 1997-05-27, 39),
('Tyrod', 'Taylor', 1, 24, 185, 217, 1989-08-03, 40),
('Zach', 'Wilson', 1, 25, 188, 214, 1999-08-03, 41),
('Mike', 'White', 1, 25, 193, 218, 1995-03-25, 36),
('Jalen', 'Hurts', 1, 26, 185, 223, 1998-08-07, 1),
('Gardner', 'Minshew', 1, 26, 185, 225, 1996-05-16, 42),
('Kenny', 'Pickett', 1, 27, 190, 220, 1998-06-06, 43),
('Mitch', 'Trubisky', 1, 27, 188, 220, 1994-08-20, 44),
('Jimmy', 'Garoppolo', 1, 28, 188, 225, 1991-11-02, 45),
('Brock', 'Purdy', 1, 28, 185, 220, 1999-12-27, 46),
('Trey', 'Lance', 1, 28, 193, 224, 2000-05-09, 47),
('Geno', 'Smith', 1, 29, 190, 221, 1990-10-10, 48),
('Drew', 'Lock', 1, 29, 193, 228, 1996-11-10, 30),
('Blaine', 'Gabbert', 1, 30, 196, 235, 1989-10-15, 30),
('Ryan', 'Tannehill', 1, 31, 193, 217, 1988-07-27, 23),
('Malik', 'Willis', 1, 31, 185, 215, 1999-05-25, 49),
('Taylor', 'Heinicke', 1, 32, 185, 210, 1993-03-15, 50),
('Sam', 'Howell', 1, 32, 185, 220, 2000-09-16, 44),
('Carson', 'Wentz', 1, 32, 196, 237, 1992-12-30, 47),
('Deandre', 'Hopkins', 2, 1, 185, 212, 1992-06-06, 14),
('A.J', 'Green', 2, 1, 193, 207, 1988-07-31, 31),
('Marquise', 'Brown', 2, 1, 175, 180, 1997-06-04, 1),
('Robbie', 'Anderson', 2, 1, 190, 190, 1993-04-09, 51),
('Rondale', 'Moore', 2, 1, 170, 180, 2000-06-09, 52),
('Drake', 'London', 2, 2, 196, 210, 2001-07-24, 9),
('Frank', 'Darby', 2, 2, 185, 200, 1997-09-08, 53),
('Damiere', 'Byrd', 2, 2, 175, 175, 1993-01-27, 54),
('Olamide', 'Zaccheaus', 2, 2, 173, 193, 1997-07-23, 55),
('Rashod', 'Bateman', 2, 3, 188, 210, 1999-11-29, 56),
('Sammy', 'Watkins', 2, 3, 185, 211, 1993-06-14, 14),
('Demarcus', 'Robinson', 2, 3, 185, 202, 1994-09-21, 57),
('Devin', 'Duvernay', 2, 3, 180, 210, 1997-09-12, 2),
('Gabe', 'Davis', 2, 4, 188, 210, 1999-04-01, 58),
('Isaiah', 'McKenzie', 2, 4, 173, 173, 1995-04-09, 31),
('Stefon', 'Diggs', 2, 4, 183, 191, 1993-11-29, 59),
('Khalil', 'Shakir', 2, 4, 183, 190, 2000-02-03, 18),
('Jamison', 'Crowder', 2, 4, 175, 177, 1993-06-17, 39),
('Terrace', 'Marshall Jr.', 2, 5, 188, 200, 2000-06-09, 12),
('DJ', 'Moore', 2, 5, 183, 210, 1997-04-14, 59),
('Laviska', 'Shenault Jr.', 2, 5, 185, 227, 1998-10-05, 60),
('Shi', 'Smith', 2, 5, 178, 190, 1998-10-26, 54),
('Equanimeous', 'St. Brown', 2, 6, 196, 214, 1996-09-30, 61),
('Chase', 'Claypool', 2, 6, 193, 238, 1998-07-07, 61),
('N''Keal', 'Harry', 2, 6, 193, 225, 1997-12-17, 62),
('Darnell', 'Mooney', 2, 6, 180, 173, 1997-10-29, 63),
('Ja''Marr', 'Chase', 2, 7, 185, 200, 2000-03-01, 12),
('Tee', 'Higgins', 2, 7, 193, 215, 1999-01-18, 14),
('Tyler', 'Boyd', 2, 7, 188, 203, 1994-11-15, 43),
('Trenton', 'Irwin', 2, 7, 188, 207, 1995-12-10, 22),
('Amari', 'Cooper', 2, 8, 185, 210, 1994-06-17, 33),
('Donovan', 'Peoples-Jones', 2, 8, 188, 204, 1999-02-19, 27),
('David', 'Bell', 2, 8, 188, 205, 2000-12-14, 52),
('Michael', 'Gallup', 2, 9, 185, 198, 1996-03-04, 64),
('Noah', 'Brown', 2, 9, 188, 225, 1996-01-06, 10),
('CeeDee', 'Lamb', 2, 9, 188, 189, 1999-04-08, 1),
('Courtland', 'Sutton', 2, 10, 193, 216, 1995-10-10, 65),
('Jerry', 'Jeudy', 2, 10, 185, 193, 1999-04-24, 33),
('KJ', 'Hamler', 2, 10, 175, 178, 1999-07-08, 66),
('Kendall', 'Hinton', 2, 10, 183, 195, 1997-02-19, 32),
('Amon-ra', 'St. Brown', 2, 11, 183, 197, 1999-10-24, 9),
('Kalif', 'Raymond', 2, 11, 173, 182, 1994-08-08, 67),
('DJ', 'Clark', 2, 11, 193, 198, 1996-09-23, 12),
('Josh', 'Reynolds', 2, 11, 190, 196, 1995-02-16, 23),
('Allen', 'Lazard', 2, 12, 196, 227, 1995-12-11, 46),
('Christian', 'Watson', 2, 12, 196, 200, 1999-05-12, 47),
('Romeo', 'Doubs', 2, 12, 188, 200, 2000-04-13, 68),
('Randall', 'Cobb', 2, 12, 178, 195, 1990-08-22, 69),
('Brandin', 'Cooks', 2, 13, 178, 183, 1993-09-25, 70),
('Chris', 'Moore', 2, 13, 185, 200, 1993-06-16, 71),
('Nico', 'Collins', 2, 13, 193, 215, 1999-03-19, 27),
('Phillip', 'Dorsett', 2, 13, 178, 192, 1993-01-05, 72),
('Amari', 'Rodgers', 2, 13, 175, 212, 1999-09-23, 14),
('Michael', 'Pittman Jr.', 2, 14, 193, 223, 1997-10-05, 9),
('Parris', 'Campbell', 2, 14, 183, 208, 1997-07-16, 10),
('Alec', 'Pierce', 2, 14, 190, 213, 2000-05-02, 71),
('Ashton', 'Dulin', 2, 14, 185, 215, 1997-05-15, 73),
('Christian', 'Kirk', 2, 15, 180, 200, 1996-11-18, 23),
('Zay', 'Zones', 2, 15, 188, 200, 1995-03-30, 74),
('Marvin', 'Jones', 2, 15, 188, 199, 1990-03-12, 19),
('Jamal', 'Agnew', 2, 15, 178, 190, 1995-04-03, 75),
('JuJu', 'Smith-Schuster', 2, 16, 185, 215, 1996-11-22, 9),
('Marquez', 'Valdes-Scantling', 2, 16, 193, 206, 1994-10-10, 76),
('Justin', 'Watson', 2, 16, 190, 215, 1996-04-04, 77),
('Mecole', 'Hardman', 2, 16, 178, 187, 1998-03-12, 31),
('Skyy', 'Moore', 2, 16, 178, 195, 2000-09-10, 78),
('Kadarius', 'Toney', 2, 16, 183, 193, 1999-01-27, 57),
('Davante', 'Adams', 2, 17, 185, 215, 1992-12-24, 28),
('Mack', 'Hollins', 2, 17, 193, 221, 1993-10-16, 44),
('Hunter', 'Renfrow', 2, 17, 178, 185, 1995-12-21, 14),
('Keelan', 'Cole', 2, 17, 185, 194, 1993-04-20, 79),
('Mike', 'Williams', 2, 18, 193, 218, 1994-10-04, 14),
('Josh', 'Palmer', 2, 18, 185, 210, 1998-09-22, 80),
('Keenan', 'Allen', 2, 18, 188, 211, 1992-04-27, 19),
('DeAndre', 'Carter', 2, 18, 173, 188, 1993-04-10, 81),
('Cooper', 'Kupp', 2, 19, 188, 208, 1993-06-15, 82),
('Ben', 'Skowronek', 2, 19, 190, 224, 1997-06-27, 61),
('Van', 'Jefferson', 2, 19, 185, 200, 1996-07-26, 57),
('Allen', 'Robinson', 2, 19, 188, 220, 1993-08-24, 66),
('Tutu', 'Atwell', 2, 19, 175, 165, 1999-10-07, 5),
('Brandon', 'Powell', 2, 19, 173, 188, 1995-09-12, 57),
('Tyreek', 'Hill', 2, 20, 178, 185, 1994-03-01, 83),
('Jaylen', 'Waddle', 2, 20, 178, 182, 1998-11-25, 33),
('Trent', 'Sherfield', 2, 20, 185, 219, 1996-02-26, 84),
('Cedric', 'Wilson Jr.', 2, 20, 188, 200, 1995-11-20, 18),
('River', 'Cracraft', 2, 20, 183, 198, 1994-11-01, 42),
('Justin', 'Jefferson', 2, 21, 185, 195, 1999-06-16, 12),
('Adam', 'Thielen', 2, 21, 188, 200, 1990-08-22, 85),
('K.J.', 'Osborn', 2, 21, 180, 203, 1997-06-10, 72),
('Jalen', 'Nailor', 2, 21, 183, 190, 1999-03-02, 34),
('Jalen', 'Reagor', 2, 21, 180, 197, 1999-01-02, 38),
('Jakobi', 'Meyers', 2, 22, 188, 200, 1996-11-09, 15),
('DeVante', 'Parker', 2, 22, 190, 219, 1993-01-20, 5),
('Kendrick', 'Bourne', 2, 22, 185, 203, 1995-08-04, 82),
('Nelson', 'Agholor', 2, 22, 183, 198, 1993-05-24, 54),
('Tyquan', 'Thornton', 2, 22, 190, 182, 2000-08-07, 86),
('Chris', 'Olave', 2, 23, 185, 188, 2000-06-27, 10),
('Rashid', 'Shaheed', 2, 23, 183, 180, 1998-08-31, 87),
('Tre''Quan', 'Smith', 2, 23, 188, 210, 1996-01-07, 58),
('Jarvis', 'Landry', 2, 23, 180, 196, 1992-11-28, 12),
('Michael', 'Thomas', 2, 23, 190, 212, 1993-03-03, 10),
('Marquez', 'Callaway', 2, 23, 188, 204, 1998-03-27, 80),
('Darius', 'Slayton', 2, 24, 185, 190, 1997-01-12, 29),
('Richie', 'James', 2, 24, 175, 185, 1995-09-05, 88),
('Isaiah', 'Hodgins', 2, 24, 193, 210, 1998-10-21, 70),
('Wan''Dale', 'Robinson', 2, 24, 173, 185, 2001-01-05, 69),
('Sterling', 'Shepard', 2, 24, 178, 201, 1993-02-10, 1)


--VIEWS--

--League Breakdown View--
 SELECT 
     teams.team_name AS 'Team Name',
     teams.year_est AS 'Year Established',
     conference.conf_name AS 'Conference',
     division.div_name AS 'Division',
     stadium.stadium_name AS 'Stadium'
 FROM teams
   INNER JOIN conference ON teams.conf_id=conference.conf_id
   INNER JOIN division ON teams.div_id=division.div_id
   INNER JOIN stadium ON teams.stadium_id=stadium.stadium_id
ORDER BY conference, division;









