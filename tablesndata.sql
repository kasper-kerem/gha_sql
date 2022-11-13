
--- create tables        

CREATE TABLE game
(
  id             SERIAL PRIMARY KEY,
  status         TEXT      NULL    ,
  game_ident     TEXT      NULL    ,
  game_added_ts  TIMESTAMP NULL    ,
  game_start_ts  TIMESTAMP NULL    ,
  game_finish_ts TIMESTAMP NULL    
);

CREATE TABLE game_players
(
  id        SERIAL PRIMARY KEY,
  player_id INT  NOT NULL,
  game_id   INT  NOT NULL,
  result    TEXT NULL    
);

CREATE TABLE moves
(
  id      SERIAL PRIMARY KEY,
  game_id INT       NOT NULL,
  player_id INT     NOT NULL,
  piece   TEXT      NULL    ,
  colour  TEXT      NULL    ,
  from_   TEXT      NULL    ,
  to_     TEXT      NULL    ,
  move_ts TIMESTAMP NULL    
);

CREATE TABLE player
(
  id         SERIAL PRIMARY KEY,
  rank_      INTEGER   NULL    ,
  first_name TEXT      NULL    ,
  last_name  TEXT      NULL    ,
  add_name   TEXT      NULL    ,
  gender     TEXT      NULL    ,
  language   TEXT      NULL    ,
  type_      TEXT      NULL    ,
  dob        DATE      NULL    ,
  local_time TIMESTAMP NULL 
);

ALTER TABLE moves
  ADD CONSTRAINT FK_game_TO_moves
    FOREIGN KEY (game_id)
    REFERENCES game (id);

ALTER TABLE game_players
  ADD CONSTRAINT FK_game_TO_game_players
    FOREIGN KEY (game_id)
    REFERENCES game (id);

ALTER TABLE game_players
  ADD CONSTRAINT FK_player_TO_game_players
    FOREIGN KEY (player_id)
    REFERENCES player (id);

ALTER TABLE moves
  ADD CONSTRAINT FK_player_TO_moves
    FOREIGN KEY (player_id)
    REFERENCES player (id);

--- ADD DATA
--- players

INSERT INTO player
( first_name, last_name, type_, dob, local_time, tz, gender)
VALUES
('Magnus', 'Carlsen', 'grandmaster', '1990-11-30' ,current_timestamp, 'Europe/Norway',  'm');

INSERT INTO player
( first_name, last_name, type_, dob, local_time, tz, gender)
VALUES
('John', 'Smith', 'player', '1933-12-31' ,current_timestamp, 'Europe/UK',  'm');

INSERT INTO player
( first_name, last_name, type_, dob, local_time, tz, gender)
VALUES
('Kasper', 'Kerem', 'player', '1981-02-26' ,current_timestamp, 'Europe/Estonia', 'm');

--- Game

INSERT INTO game
( status, game_added_ts)
VALUES
('waiting', current_timestamp);

--- game players

INSERT INTO game_players
( player_id, game_id)
VALUES
(1, 1);

INSERT INTO game_players
( player_id, game_id)
VALUES
(2, 1);

INSERT INTO game_players
( player_id, game_id)
VALUES
(3, 2);

--- one more game game with is active

INSERT INTO game
( status, game_added_ts, game_start_ts)
VALUES
('active', current_timestamp, current_timestamp + (5 * interval '1 minute'));


--- add two moves

INSERT INTO moves
( game_id, player_id, piece, colour, from_, to_, move_ts)
VALUES
(1, 2, 'pawn', 'w', 'e2', 'e4', current_timestamp);

INSERT INTO moves
( game_id, player_id, piece, colour, from_, to_, move_ts)
VALUES
(1, 1, 'pawn', 'b', 'e7', 'e5', current_timestamp);
