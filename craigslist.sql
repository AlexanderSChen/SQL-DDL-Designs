DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist 

CREATE TABLE region 
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE
)

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    preferred_region INTEGER REFERENCES region(id),
    username TEXT UNIQUE,
    password TEXT NOT NULL
)

CREATE TABLE category
(
    id SERIAL PRIMARY KEY,
    type TEXT UNIQUE
)

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    user INTEGER REFERENCES users(id),
    location TEXT,
    region INTEGER REFERENCES region(id),
    title TEXT,
    content TEXT,
    category INTEGER REFERENCES category(id)
)