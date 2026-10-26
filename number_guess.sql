--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    number_of_guesses integer NOT NULL,
    CONSTRAINT games_number_of_guesses_check CHECK ((number_of_guesses > 0))
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 3, 32);
INSERT INTO public.games VALUES (2, 3, 342);
INSERT INTO public.games VALUES (3, 4, 554);
INSERT INTO public.games VALUES (4, 4, 888);
INSERT INTO public.games VALUES (5, 3, 263);
INSERT INTO public.games VALUES (6, 3, 649);
INSERT INTO public.games VALUES (7, 3, 21);
INSERT INTO public.games VALUES (8, 5, 270);
INSERT INTO public.games VALUES (9, 5, 341);
INSERT INTO public.games VALUES (10, 6, 815);
INSERT INTO public.games VALUES (11, 6, 68);
INSERT INTO public.games VALUES (12, 5, 698);
INSERT INTO public.games VALUES (13, 5, 186);
INSERT INTO public.games VALUES (14, 5, 159);
INSERT INTO public.games VALUES (15, 7, 10);
INSERT INTO public.games VALUES (16, 8, 145);
INSERT INTO public.games VALUES (17, 8, 343);
INSERT INTO public.games VALUES (18, 9, 585);
INSERT INTO public.games VALUES (19, 9, 364);
INSERT INTO public.games VALUES (20, 8, 404);
INSERT INTO public.games VALUES (21, 8, 754);
INSERT INTO public.games VALUES (22, 8, 767);
INSERT INTO public.games VALUES (23, 10, 810);
INSERT INTO public.games VALUES (24, 10, 719);
INSERT INTO public.games VALUES (25, 11, 348);
INSERT INTO public.games VALUES (26, 11, 337);
INSERT INTO public.games VALUES (27, 10, 588);
INSERT INTO public.games VALUES (28, 10, 198);
INSERT INTO public.games VALUES (29, 10, 700);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'user_1793048434652');
INSERT INTO public.players VALUES (2, 'user_1793048434651');
INSERT INTO public.players VALUES (3, 'user_1793048601663');
INSERT INTO public.players VALUES (4, 'user_1793048601662');
INSERT INTO public.players VALUES (5, 'user_1793049675801');
INSERT INTO public.players VALUES (6, 'user_1793049675800');
INSERT INTO public.players VALUES (7, 'Matti');
INSERT INTO public.players VALUES (8, 'user_1793050150836');
INSERT INTO public.players VALUES (9, 'user_1793050150835');
INSERT INTO public.players VALUES (10, 'user_1793050310791');
INSERT INTO public.players VALUES (11, 'user_1793050310790');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 29, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 11, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_name_key UNIQUE (name);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--

