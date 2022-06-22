DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league 

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    region TEXT UNIQUE,
    name TEXT UNIQUE
)

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players(id),
    match_id INTEGER REFERENCES matches(id),
    game_time INTEGER NOT NULL
)

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams(id),
    name TEXT NOT NULL,
    birthday DATE,
    height INTEGER
)

CREATE TABLE referees 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
)

CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    season_start DATE NOT NULL,
    season_end DATE NOT NULL
)

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    home_team TEXT REFERENCES teams(region),
    away_team TEXT REFERENCES teams(region),
    stadium TEXT NOT NULL,
    date DATE NOT NULL,
    start_time INTEGER,
    season_id INTEGER REFERENCES season(id),
    referee_id INTEGER REFERENCES referees(id)
)

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    team_id REFERENCES teams(id),
    match_id REFERENCES matches(id),
    result TEXT NOT NULL
)

CREATE TABLE lineups
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players(id),
    match_id INTEGER REFERENCES matches(id),
    team_id INTEGER REFERENCES teams(id)
)