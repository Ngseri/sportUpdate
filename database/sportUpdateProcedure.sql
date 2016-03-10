--Procedure: list the players filtering by the highest income
create or replace procedure highest_salary is
	cursor player_cursor is
		select player_firstname, player_salary
		from players
		order by player_salary desc;
	player_salary_info player_cursor%rowtype;

	Begin
	open player_cursor;
	loop
		fetch player_cursor into player_salary_info;
		exit when player_cursor%notfound;
		dbms_output.put_line('Player Name: ' || player_salary_info.player_firstname ||
							' : ' || 'Salary: ' || player_salary_info.player_salary);
	end loop;
	close player_cursor;
	end;


--Function #1: return the number of goals scored for a selected team
create function goal_scored(team_id in number)
	return number
	is goalScored number(6);
	Begin
		select team_goalScored
		into goalScored
		from standing, team
		where team.team_id = standing.team_id and team.team_id = team_id;
		return(goalScored);
	end;

--Function #2: return the hometeam and away team in any match
create function team_play(gameNo in number)
	return varchar2(40)
	as hometeam varchar2(40);
	awayteam varchar2(40);
	Begin
		select team_name
		into hometeam, awayteam
		from team, match
		where team.team_id = match.team_id and match.match_id = gameNo;
		return(hometeam, awayteam);
	end;


--Function #3: return the result of each match
create function team_play(resultNo in number)
	return varchar2(40), number
	as hometeam varchar2(40);
	awayteam varchar2(40);
	hometeam_goalScored number(6);
	awayteam_goalScored number(6);
	Begin
		select team_name, hometeam_scored, awayteam_scored
		into hometeam, awayteam, hometeam_goalScored, awayteam_goalScored
		from team, match, match_result
		where team.team_id = match.team_id and match_result.match_id = match.match_id = resultNo;
		return(hometeam, awayteam, hometeam_goalScored, awayteam_goalScored);
	end;



--Trigger #1: update the position of each team in the team standing
create or replace trigger team_standing
	before update on standing
	for each row
	when (NEW.standing_id > 0)

	declare
		new_position number;
		old_position number;

		Begin
		new_position := :NEW.standing_id;
		old_position := :OLD.standing_id;
		dbms_output.put_line('Prevoius Position: ' || :OLD.standing_id);
		dbms_output.put_line('Current Position: ' || :NEW.standing_id);
		End;


--Trigger #2: update the position of each player
create or replace trigger player_role
	before delete or insert or update on player
	for each row
	when (NEW.player_id > 0)

	declare
		new_role varchar2(40);
		old_role varchar2(40);

		Begin
		new_role := :NEW.player_position;
		old_role := :OLD.player_position;
		dbms_output.put_line('Prevoius Role: ' || :OLD.player_position);
		dbms_output.put_line('Current Role: ' || :NEW.player_position);
		End;

--Trigger #3: update the salary of each player
CREATE OR REPLACE TRIGGER salary_update
	BEFORE DELETE OR INSERT OR UPDATE ON player
	FOR EACH ROW
	WHEN (NEW.player_id > 0)
	DECLARE
   		new_salary number;
		old_salary number;
	BEGIN
   		new_salary := :NEW.player_salary;
   		old_salary := :OLD.player_salary;
		dbms_output.put_line('Old salary: ' || :OLD.player_salary);
		dbms_output.put_line('New salary: ' || :NEW.player_salary);

	END;

