--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: scores; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scores (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_score integer
);


ALTER TABLE public.scores OWNER TO freecodecamp;

--
-- Name: scores_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.scores_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scores_user_id_seq OWNER TO freecodecamp;

--
-- Name: scores_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.scores_user_id_seq OWNED BY public.scores.user_id;


--
-- Name: scores user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scores ALTER COLUMN user_id SET DEFAULT nextval('public.scores_user_id_seq'::regclass);


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scores VALUES (5, 'snopw', 0, 0);
INSERT INTO public.scores VALUES (6, 'user_1725537822621', 0, 0);
INSERT INTO public.scores VALUES (7, 'user_1725537822620', 0, 0);
INSERT INTO public.scores VALUES (8, 'user_1725537861219', 0, 0);
INSERT INTO public.scores VALUES (9, 'user_1725537861218', 0, 0);
INSERT INTO public.scores VALUES (11, '', 0, 0);
INSERT INTO public.scores VALUES (12, 'SNOW', 0, 0);
INSERT INTO public.scores VALUES (13, '100', 0, 0);
INSERT INTO public.scores VALUES (14, 'user_1725540702052', 0, 0);
INSERT INTO public.scores VALUES (15, 'user_1725540702051', 0, 0);
INSERT INTO public.scores VALUES (16, 'user_1725540832817', 0, 0);
INSERT INTO public.scores VALUES (17, 'user_1725540832816', 0, 0);
INSERT INTO public.scores VALUES (1, 'snow', 3, 2);
INSERT INTO public.scores VALUES (33, 'user_1725543443985', 2, 609);
INSERT INTO public.scores VALUES (19, 'user_1725541831180', 2, 0);
INSERT INTO public.scores VALUES (32, 'user_1725543443986', 5, 112);
INSERT INTO public.scores VALUES (18, 'user_1725541831181', 5, 0);
INSERT INTO public.scores VALUES (21, 'user_1725541964137', 2, 0);
INSERT INTO public.scores VALUES (20, 'user_1725541964138', 5, 0);
INSERT INTO public.scores VALUES (23, 'user_1725542043949', 2, 0);
INSERT INTO public.scores VALUES (22, 'user_1725542043950', 5, 0);
INSERT INTO public.scores VALUES (25, 'user_1725543026023', 2, 0);
INSERT INTO public.scores VALUES (24, 'user_1725543026024', 5, 0);
INSERT INTO public.scores VALUES (27, 'user_1725543038391', 2, 0);
INSERT INTO public.scores VALUES (26, 'user_1725543038392', 5, 0);
INSERT INTO public.scores VALUES (2, 'willow', 2, 6);
INSERT INTO public.scores VALUES (29, 'user_1725543222576', 2, 552);
INSERT INTO public.scores VALUES (28, 'user_1725543222577', 5, 40);
INSERT INTO public.scores VALUES (10, '1', 1, 7);
INSERT INTO public.scores VALUES (31, 'user_1725543343447', 2, 282);
INSERT INTO public.scores VALUES (30, 'user_1725543343448', 5, 70);


--
-- Name: scores_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.scores_user_id_seq', 33, true);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (user_id);


--
-- Name: scores scores_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

