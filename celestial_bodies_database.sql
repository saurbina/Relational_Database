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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: black_holes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_holes (
    black_holes_id integer NOT NULL,
    name character varying(60) NOT NULL,
    type_of_black_hole text,
    galaxy_id integer
);


ALTER TABLE public.black_holes OWNER TO freecodecamp;

--
-- Name: black_holes_black_holea_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_holes_black_holea_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_holes_black_holea_id_seq OWNER TO freecodecamp;

--
-- Name: black_holes_black_holea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_holes_black_holea_id_seq OWNED BY public.black_holes.black_holes_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_life boolean,
    galaxy_types numeric NOT NULL,
    age_in_millions_of_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth_in_light_years numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth_in_light_years numeric,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth_in_light_years numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_holes black_holes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes ALTER COLUMN black_holes_id SET DEFAULT nextval('public.black_holes_black_holea_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_holes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_holes VALUES (1, 'Sagittarius A*', 'Supermassive', 2);
INSERT INTO public.black_holes VALUES (2, 'Cygnus X-1', 'Stellar', 1);
INSERT INTO public.black_holes VALUES (3, 'TON 618', 'Supermassive', NULL);
INSERT INTO public.black_holes VALUES (4, 'M87*', 'Supermassive', 3);
INSERT INTO public.black_holes VALUES (5, 'V404 Cygni', 'Stellar', 1);
INSERT INTO public.black_holes VALUES (6, 'XTE J1118+480', 'Intermediate-mass', NULL);
INSERT INTO public.black_holes VALUES (7, 'GRO J1655-40', 'Stellar', 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Alcyoneus', 'Alcyoneus is a low-excitation, Fanaroff–Riley class II radio galaxy', false, 2, 10000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.', true, 2, 1000000);
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxies', 'Two colliding galaxies', false, 2, 10000);
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', false, 1, 1000);
INSERT INTO public.galaxy VALUES (5, 'Barnard Galaxy', 'Named after Edward Emerson Barnard.', false, 2, 50000);
INSERT INTO public.galaxy VALUES (6, 'Bear Paw Galaxy', 'It resembles the appearance of a bear''s claw.', false, 1, 60000);
INSERT INTO public.galaxy VALUES (7, 'Eye Galaxy', 'It has a spectacular dark band of absorbing dust in front of the galaxy bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', false, 2, 5000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'M31-V1b-I', 'Large icy moon with cryovolcanic activity orbiting M31-V1b', false, true, 50, 700, 1);
INSERT INTO public.moon VALUES (2, 'M31-V1b-II', 'Rocky moon with thin atmosphere, shows evidence of ancient oceans', false, true, 48, 700, 1);
INSERT INTO public.moon VALUES (3, 'M31-RV-1-Luna', 'Tidally locked moon with extreme temperature variations', false, true, 105, 850, 2);
INSERT INTO public.moon VALUES (4, 'AE And-b-Alpha', 'Massive moon nearly large enough to be considered a binary planet', false, true, 44, 1000, 3);
INSERT INTO public.moon VALUES (5, 'AE And-b-Beta', 'Small irregular moon, likely captured asteroid', false, false, 45, 1000, 3);
INSERT INTO public.moon VALUES (6, 'NGC4038-P1-A', 'Young moon still accumulating mass from planetary debris disk', false, true, 8, 1750, 4);
INSERT INTO public.moon VALUES (7, 'NGC4039-P1-Titan', 'Large moon with dense hydrocarbon atmosphere', false, true, 14, 2000, 5);
INSERT INTO public.moon VALUES (8, 'M31-V15b-Triton', 'Retrograde moon with nitrogen geysers', false, true, 900, 80, 6);
INSERT INTO public.moon VALUES (9, 'M31-V1c-Luna', 'Heavily cratered moon stabilizing its host planet rotation', false, true, 49, 700, 7);
INSERT INTO public.moon VALUES (10, 'AE And-c-I', 'Small moon rapidly losing mass due to host planet proximity', false, true, 42, 1000, 8);
INSERT INTO public.moon VALUES (11, 'NGC4038-P2-Major', 'Largest moon in the NGC4038 system with subsurface ocean', false, true, 19, 1750, 9);
INSERT INTO public.moon VALUES (12, 'M31-V15c-I', 'Ice-covered moon with potential subsurface liquid water', false, true, 920, 80, 10);
INSERT INTO public.moon VALUES (13, 'M31-RV-2-A', 'Rocky moon with intense volcanic activity', false, true, 108, 850, 11);
INSERT INTO public.moon VALUES (14, 'NGC4039-P2-Ring', 'Moon forming from the planet ring system material', false, false, 9, 2000, 12);
INSERT INTO public.moon VALUES (15, 'M31-V1b-III', 'Small shepherd moon maintaining planet ring system', false, false, 50, 700, 1);
INSERT INTO public.moon VALUES (16, 'NGC4038-P2-Minor', 'Irregular captured asteroid in eccentric orbit', false, false, 20, 1750, 9);
INSERT INTO public.moon VALUES (17, 'M31-V15c-II', 'Binary moon system orbiting together around host planet', false, true, 950, 80, 10);
INSERT INTO public.moon VALUES (18, 'AE And-b-Gamma', 'Moon with magnetic field interacting with host planet', false, true, 45, 1000, 3);
INSERT INTO public.moon VALUES (19, 'M31-RV-1-II', 'Water-rich moon with potential for subsurface oceans', false, true, 110, 850, 2);
INSERT INTO public.moon VALUES (20, 'NGC4039-P1-Europa', 'Ice-covered moon showing signs of recent geological activity', false, true, 15, 2000, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'M31-V1b', 'A gas giant planet orbiting the Cepheid variable star M31_V1 in Andromeda. The planet experiences significant temperature variations due to its stars pulsations.', false, true, 50, 700, 1);
INSERT INTO public.planet VALUES (2, 'M31-RV-1', 'A massive rocky planet orbiting the luminous red variable star M31-RV. Its surface likely experiences extreme temperature swings due to its stars variability.', false, true, 110, 850, 2);
INSERT INTO public.planet VALUES (3, 'AE And-b', 'A super-Jupiter class planet in orbit around AE Andromedae. The intense stellar winds from its host star have likely stripped away much of its original atmosphere.', false, true, 45, 1000, 3);
INSERT INTO public.planet VALUES (4, 'NGC 4038-P1', 'A young planet forming in the turbulent environment of the Antennae Galaxies. Located in a star-forming region of NGC 4038.', false, true, 10, 1750, 4);
INSERT INTO public.planet VALUES (5, 'NGC 4039-P1', 'A massive gas giant in the Antennae Galaxies, orbiting a young star in NGC 4039. The planet shows signs of recent formation due to galactic collision.', false, true, 15, 2000, 5);
INSERT INTO public.planet VALUES (6, 'M31-V15b', 'A Neptune-sized planet orbiting the Cepheid variable star M31-V15. The planet orbit is highly stable despite its stars regular pulsations.', false, true, 950, 80, 6);
INSERT INTO public.planet VALUES (7, 'M31-V1c', 'A smaller rocky planet in the M31_V1 system, companion to M31-V1b. Shows evidence of significant volcanic activity.', false, true, 50, 700, 1);
INSERT INTO public.planet VALUES (8, 'AE And-c', 'A hot Jupiter-type planet extremely close to AE Andromedae. The planet is gradually losing its atmosphere due to intense stellar radiation.', false, true, 45, 1000, 3);
INSERT INTO public.planet VALUES (9, 'NGC 4038-P2', 'A large gas giant in a stable orbit within the chaotic environment of NGC 4038. Protected by strong magnetic fields.', false, true, 20, 1750, 4);
INSERT INTO public.planet VALUES (10, 'M31-V15c', 'An ice giant planet in a wide orbit around M31-V15. Contains significant quantities of frozen methane in its atmosphere.', false, true, 950, 80, 6);
INSERT INTO public.planet VALUES (11, 'M31-RV-2', 'A super-Earth class planet orbiting M31-RV at a relatively safe distance from its variable host star.', false, true, 110, 850, 2);
INSERT INTO public.planet VALUES (12, 'NGC 4039-P2', 'A young planet still in formation, showing signs of active accretion and a developing ring system.', false, true, 10, 2000, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'M31_V1', 'A famous Cepheid variable star', false, false, 50, 700, 2);
INSERT INTO public.star VALUES (2, 'M31-RV', 'A luminous red variable star', false, false, 110, 850, 2);
INSERT INTO public.star VALUES (3, 'AE Andromedae', 'Another luminous blue variable', false, false, 45, 1000, 2);
INSERT INTO public.star VALUES (4, 'NGC 4038', 'While we can see many super star clusters here, individual stars are harder to distinguish.', false, false, 2000, 1750, 3);
INSERT INTO public.star VALUES (5, 'NGC 4039', 'While we can see many super star clusters here, individual stars are harder to distinguish.', false, false, 2100, 2000, 3);
INSERT INTO public.star VALUES (6, 'M31-V15', 'A bright Cepheid variable star', false, false, 950, 80, 2);


--
-- Name: black_holes_black_holea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_holes_black_holea_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: black_holes black_holes_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_name_key UNIQUE (name);


--
-- Name: black_holes black_holes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_pkey PRIMARY KEY (black_holes_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: black_holes fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

