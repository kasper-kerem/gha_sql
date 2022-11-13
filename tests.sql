--- to test the concept ONLY


SELECT COUNT(ID) FROM games WHERE Status = “active” 

SELECT COUNT(ID) FROM games WHERE Status = “check”

SELECT count(game_players.game_id) FROM game_players JOIN player ON player.id = game_players.player_id GROUP by game_players.game_id HAVING COUNT(*) < 2;

SELECT player.rank_ FROM player JOIN game_players ON player.id = game_players.player_id WHERE player.first_name='Kasper'

SELECT count(id) FROM moves GROUP BY game_id
