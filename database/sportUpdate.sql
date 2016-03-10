create table Team(
	team_id number(6),
	team_name varchar2(40),
	team_leagueName varchar2(40),
	team_stadiumName varchar2(40),
	team_nickname varchar2(40),
	CONSTRAINT team_id_pk primary key (team_id)
);

create table Player(
	player_id number(6),
	player_firstname varchar2(40),
	player_lastname varchar2(40),
	player_country varchar2(40),
	player_position varchar2(40),
	hired_date date,
	player_salary number(10),
	team_id number(6),
	CONSTRAINT player_id_pk primary key (player_id),
	constraint fk_team foreign key (team_id) references team(team_id)

);


create table Standing(
	standing_id number(6),
	team_id number(6),
	match_played  number(6),
	team_point number(6),
	team_win number(6),
	team_lose number(6),
	team_tie number(6),
	team_goalScored number(6),
	team_goalTaken number(6),
	CONSTRAINT standing_id_pk primary key (standing_id),
	constraint fk_team_id foreign key (team_id) references team(team_id)
);

create table Match(
	match_id number(6),
	team_id number(6),
	match_date date,
	hometeam_id number(6),
	awayteam_id number(6),
	CONSTRAINT match_id_pk primary key (match_id),
	constraint fk_team_id2 foreign key (team_id) references team(team_id)
);

create table Match_Result(
	result_id number(6),
	match_id number(6),
	hometeam_scored number(6),
	awayteam_scored number(6),
	CONSTRAINT match_result_id_pk primary key (result_id),
	constraint fk_match foreign key (match_id) references match(match_id)
);

-- how to create hometeam and awayteam? what foreign key is used?
-- how to store big files in the database?
--insert data into team table--
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(1, 'Arsenal', 'EPL', 'Emirates', 'The Gunners');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(2, 'Chelsea', 'EPL', 'Stamford Bridge', 'The Blues');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(3, 'Manchester City', 'EPL', 'Etihad', 'The Citizens');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(4, 'Manchester United', 'EPL', 'Old Trafford', 'The Red Devils');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(5, 'Everton', 'EPL', 'Goodison Park', 'The Toffees');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(6, 'Tottenham', 'EPL', 'White Hart Lane', 'Spurs');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(7, 'Aston Villa', 'EPL', 'Villa Park', 'The Villans');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(8, 'AFC Bournemouth', 'EPL', 'Vitality Stadium', 'The Cherries');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(9, 'Crystal Palace', 'EPL', 'Selherst Park', 'The Eagles');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(10, 'Leicester City', 'EPL', 'King Power', 'The Foxes');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(11, 'Liverpool', 'EPL', 'Anfield', 'The Reds');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(12, 'Newcastle United', 'EPL', 'ST James Park', 'The Magpies');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(13, 'Norwich City', 'EPL', 'Carrow Road', 'The Canaries');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(14, 'Southampton', 'EPL', 'ST Mary', 'The Saints');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(15, 'Stoke City', 'EPL', 'Britannia', 'The Potters');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(16, 'Sunderland', 'EPL', 'Stadium of Light', 'The Black Cats');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(17, 'Swansea', 'EPL', 'The Liberty', 'The Swans');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(18, 'Watford', 'EPL', 'Vicarage Road', 'The Hornets');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(19, 'West Bromwich Albion', 'EPL', 'The Hawthorns', 'The Baggies');
insert into team(team_id, team_name, team_leagueName, team_stadiumName, team_nickname)
	values(20, 'West Ham United', 'EPL', 'Boleyn Ground', 'The Hammers');


--insert data into player table--
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(1, 'Alexis', 'Sanchez', 'Chile', 'Forward', to_date('07-07-2014', 'dd-mm-yyyy'), 120000, 1);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(2, 'Theo', 'Walcott', 'England', 'Forward', to_date('14-06-2006', 'dd-mm-yyyy'), 110000, 1);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(3, 'Jamie', 'Vardy', 'England', 'Forward', to_date('10-07-2007', 'dd-mm-yyyy'), 65000, 10);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(4, 'Romelu', 'Lukaku', 'Belgium', 'Forward', to_date('11-08-2013', 'dd-mm-yyyy'), 100000, 5);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(5, 'Sergio', 'Aguero', 'Argentina', 'Forward', to_date('12-06-2010', 'dd-mm-yyyy'), 200000, 3);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(6, 'Raheem', 'Sterling', 'England', 'Forward', to_date('13-07-2015', 'dd-mm-yyyy'), 180000, 3);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(7, 'Callum', 'Wilson', 'England', 'Forward', to_date('14-08-2011', 'dd-mm-yyyy'), 45000, 8);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(8, 'Wayne', 'Rooney', 'England', 'Forward', to_date('15-06-2007', 'dd-mm-yyyy'), 200000, 4);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(9, 'Bafetimbi', 'Gomis', 'France', 'Forward', to_date('16-07-2013', 'dd-mm-yyyy'), 65000, 17);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(10, 'Mame', 'Biram Diouf', 'Senegal', 'Forward', to_date('17-08-2012', 'dd-mm-yyyy'), 45000, 15);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(11, 'Graziano', 'Pelle', 'Netherland', 'Forward', to_date('18-06-2013', 'dd-mm-yyyy'), 85000, 14);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(12, 'Diafra', 'Sakho', 'Senegal', 'Forward', to_date('19-07-2011', 'dd-mm-yyyy'), 70000, 20);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(13, 'Harry', 'Kane', 'England', 'Forward', to_date('20-08-2009', 'dd-mm-yyyy'), 90000, 6);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(14, 'Anthony', 'Martial', 'France', 'Forward', to_date('21-06-2015', 'dd-mm-yyyy'), 95000, 4);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(15, 'Odion', 'Ighalo', 'Nigeria', 'Forward', to_date('22-07-2012', 'dd-mm-yyyy'), 65000, 18);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(16, 'Oliver', 'Giroud', 'France', 'Forward', to_date('23-08-2013', 'dd-mm-yyyy'), 90000, 1);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(17, 'Wilfried', 'Bony', 'Ivory Coast', 'Forward', to_date('24-06-2014', 'dd-mm-yyyy'), 110000, 3);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(18, 'Diego', 'Costa', 'Spain', 'Forward', to_date('26-07-2014', 'dd-mm-yyyy'), 140000, 2);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(19, 'Steven', 'Naismith', 'Scottland', 'Forward', to_date('27-08-2006', 'dd-mm-yyyy'), 70000, 5);
insert into player(player_id, player_firstname, player_lastname, player_country, player_position, hired_date, player_salary, team_id)
	values(20, 'Marko', 'Arnautovic', 'Austria', 'Forward', to_date('25-06-2012', 'dd-mm-yyyy'), 65000, 15);



--insert data into standing table--
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(1, 3, 10, 22, 7, 2, 1, 24, 8);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(2, 1, 10, 22, 7, 2, 1, 18, 8);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(3, 20, 10, 20, 6, 2, 2, 22, 13);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(4, 4, 10, 20, 6, 2, 2, 15, 8);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(5, 10, 10, 19, 5, 1, 4, 20, 17);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(6, 6, 10, 17, 4, 1, 5, 16, 8);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(7, 9, 10, 15, 5, 5, 0, 12, 11);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(8, 14, 10, 14, 3, 2, 5, 16, 13);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(9, 11, 10, 14, 3, 2, 5, 9, 11);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(10, 19, 10, 14, 4, 4, 2, 8, 11);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(11, 5, 10, 13, 3, 3, 4, 13, 13);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(12, 17, 10, 13, 3, 3, 4, 12, 12);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(13, 18, 10, 13, 3, 3, 4, 8, 10);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(14, 15, 10, 12, 3, 4, 3, 9, 12);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(15, 2, 10, 11, 3, 5, 2, 15, 19);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(16, 13, 10, 9, 2, 5, 3, 14, 21);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(17, 8, 10, 8, 2, 6, 2, 12, 22);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(18, 16, 10, 6, 1, 6, 3, 11, 19);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(19, 12, 10, 6, 1, 6, 3, 12, 22);
insert into standing(standing_id, team_id, match_played, team_point, team_win, team_lose, team_tie, team_goalScored, team_goalTaken)
	values(20, 7, 10, 4, 1, 8, 1, 9, 17);


--insert data into match table--
insert into match(match_id, team_id, match_date, hometeam_id, awayteam_id)
	values(1, 20, to_date('10-24-2015', 'mm-dd-yyyy'), 20, 2);
insert into match(match_id, team_id, match_date, hometeam_id, awayteam_id)
	values(2, 10, to_date('10-24-2015', 'mm-dd-yyyy'), 10, 9);
insert into match(match_id, team_id, match_date, hometeam_id, awayteam_id)
	values(3, 13, to_date('10-24-2015', 'mm-dd-yyyy'), 13, 19);
insert into match(match_id, team_id, match_date, hometeam_id, awayteam_id)
	values(4, 15, to_date('10-24-2015', 'mm-dd-yyyy'), 15, 18);
insert into match(match_id, team_id, match_date, hometeam_id, awayteam_id)
	values(5, 7, to_date('10-24-2015', 'mm-dd-yyyy'), 7, 17);
insert into match(match_id, team_id, match_date, hometeam_id, awayteam_id)
	values(6, 1, to_date('10-24-2015', 'mm-dd-yyyy'), 1, 5);
insert into match(match_id, team_id, match_date, hometeam_id, awayteam_id)
	values(7, 16, to_date('10-25-2015', 'mm-dd-yyyy'), 16, 12);
insert into match(match_id, team_id, match_date, hometeam_id, awayteam_id)
	values(8, 8, to_date('10-25-2015', 'mm-dd-yyyy'), 8, 6);
insert into match(match_id, team_id, match_date, hometeam_id, awayteam_id)
	values(9, 4, to_date('10-25-2015', 'mm-dd-yyyy'), 4, 3);
insert into match(match_id, team_id, match_date, hometeam_id, awayteam_id)
	values(10, 11, to_date('10-25-2015', 'mm-dd-yyyy'), 11, 14);


--insert data into match_result table--
insert into match_result(result_id, match_id, hometeam_scored, awayteam_scored)
	values(1, 1, 2, 1);
insert into match_result(result_id, match_id, hometeam_scored, awayteam_scored)
	values(2, 2, 1, 0);
insert into match_result(result_id, match_id, hometeam_scored, awayteam_scored)
	values(3, 3, 0, 1);
insert into match_result(result_id, match_id, hometeam_scored, awayteam_scored)
	values(4, 4, 0, 2);
insert into match_result(result_id, match_id, hometeam_scored, awayteam_scored)
	values(5, 5, 1, 2);
insert into match_result(result_id, match_id, hometeam_scored, awayteam_scored)
	values(6, 6, 2, 1);
insert into match_result(result_id, match_id, hometeam_scored, awayteam_scored)
	values(7, 7, 3, 0);
insert into match_result(result_id, match_id, hometeam_scored, awayteam_scored)
	values(8, 8, 1, 5);
insert into match_result(result_id, match_id, hometeam_scored, awayteam_scored)
	values(9, 9, 0, 0);
insert into match_result(result_id, match_id, hometeam_scored, awayteam_scored)
	values(10, 10, 1, 1);


