PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"

echo "$($PSQL "SELECT COUNT(*) FROM games")"

echo "$($PSQL "SELECT COUNT(*) FROM games WHERE round='Final'")"

echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > opponent_goals")"

echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"

echo "$($PSQL "SELECT AVG(winner_goals)::numeric(10,2) FROM games")"

echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games")"

echo "$($PSQL "SELECT MAX(winner_goals) FROM games")"

echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals >= 3")"

echo "$($PSQL "SELECT name FROM teams WHERE team_id IN (SELECT winner_id FROM games WHERE round='Final' AND year=2018)")"

echo "$($PSQL "SELECT name FROM teams WHERE team_id IN (SELECT opponent_id FROM games WHERE round='Final' AND year=2014)")"

echo "$($PSQL "SELECT round, year FROM games WHERE winner_id = (SELECT team_id FROM teams WHERE name='Germany') ORDER BY year")"

echo "$($PSQL "SELECT DISTINCT(name) FROM teams JOIN games ON teams.team_id=games.winner_id WHERE games.winner_goals>=3 ORDER BY name")"

echo "$($PSQL "SELECT name FROM teams WHERE team_id IN (
  SELECT winner_id FROM games WHERE round='Final'
  UNION
  SELECT opponent_id FROM games WHERE round='Final'
) ORDER BY name")"

echo "$($PSQL "SELECT name, COUNT(*) FROM teams LEFT JOIN games ON teams.team_id=games.winner_id GROUP BY name HAVING COUNT(*)>0 ORDER BY COUNT(*) DESC")"
