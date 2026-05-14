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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1778783741292', 0, NULL);
INSERT INTO public.users VALUES (3, 'user_1778783741291', 0, NULL);
INSERT INTO public.users VALUES (46, 'Janek', 0, NULL);
INSERT INTO public.users VALUES (31, 'user_1778784739450', 5, 282);
INSERT INTO public.users VALUES (47, 'Romek', 0, NULL);
INSERT INTO public.users VALUES (24, 'user_1778784400845', 2, 618);
INSERT INTO public.users VALUES (10, 'user_1778784005345', 2, NULL);
INSERT INTO public.users VALUES (23, 'user_1778784400846', 5, 96);
INSERT INTO public.users VALUES (8, 'user_1778784005346', 5, NULL);
INSERT INTO public.users VALUES (34, 'user_1778784749853', 2, 257);
INSERT INTO public.users VALUES (16, 'user_1778784091344', 2, NULL);
INSERT INTO public.users VALUES (49, 'user_1778785232264', 2, 157);
INSERT INTO public.users VALUES (15, 'user_1778784091345', 5, NULL);
INSERT INTO public.users VALUES (26, 'user_1778784462073', 2, 150);
INSERT INTO public.users VALUES (33, 'user_1778784749854', 5, 25);
INSERT INTO public.users VALUES (25, 'user_1778784462074', 5, 553);
INSERT INTO public.users VALUES (18, 'user_1778784144934', 2, 180);
INSERT INTO public.users VALUES (35, 'user_1778784782374', 0, 46);
INSERT INTO public.users VALUES (17, 'user_1778784144935', 4, 392);
INSERT INTO public.users VALUES (36, 'user_1778784782373', 0, 126);
INSERT INTO public.users VALUES (20, 'user_1778784212466', 2, 234);
INSERT INTO public.users VALUES (28, 'user_1778784585943', 2, 344);
INSERT INTO public.users VALUES (48, 'user_1778785232265', 5, 62);
INSERT INTO public.users VALUES (38, 'user_1778784823311', 2, NULL);
INSERT INTO public.users VALUES (19, 'user_1778784212467', 5, 165);
INSERT INTO public.users VALUES (27, 'user_1778784585944', 5, 175);
INSERT INTO public.users VALUES (37, 'user_1778784823312', 5, NULL);
INSERT INTO public.users VALUES (22, 'user_1778784266986', 2, 507);
INSERT INTO public.users VALUES (50, 'user_1778785353035', 1, 876);
INSERT INTO public.users VALUES (21, 'user_1778784266987', 5, 221);
INSERT INTO public.users VALUES (30, 'user_1778784697769', 2, 48);
INSERT INTO public.users VALUES (51, 'user_1778785353034', 1, 305);
INSERT INTO public.users VALUES (29, 'user_1778784697770', 5, 447);
INSERT INTO public.users VALUES (40, 'user_1778784888231', 2, 469);
INSERT INTO public.users VALUES (32, 'user_1778784739449', 2, 84);
INSERT INTO public.users VALUES (39, 'user_1778784888232', 5, 60);
INSERT INTO public.users VALUES (53, 'user_1778785511345', 2, 365);
INSERT INTO public.users VALUES (52, 'user_1778785511346', 5, 277);
INSERT INTO public.users VALUES (42, 'user_1778784911785', 2, 23);
INSERT INTO public.users VALUES (41, 'user_1778784911786', 5, 62);
INSERT INTO public.users VALUES (43, 'Tomek', 0, NULL);
INSERT INTO public.users VALUES (55, 'user_1778785544034', 2, 439);
INSERT INTO public.users VALUES (45, 'user_1778784959454', 2, 94);
INSERT INTO public.users VALUES (44, 'user_1778784959455', 5, 315);
INSERT INTO public.users VALUES (54, 'user_1778785544035', 5, 186);
INSERT INTO public.users VALUES (57, 'user_1778785679854', 2, 512);
INSERT INTO public.users VALUES (56, 'user_1778785679855', 5, 287);
INSERT INTO public.users VALUES (59, 'user_1778785726344', 2, 819);
INSERT INTO public.users VALUES (58, 'user_1778785726345', 5, 430);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 59, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

