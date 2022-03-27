--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    symbolism character varying(60),
    main_stars integer,
    messier_objects integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    constellation_id integer NOT NULL,
    size_in_ly numeric(9,0),
    distance_to_center_in_kly numeric(9,0)
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
    discovery_year integer,
    discovered_by text,
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
    semi_major_axis_in_au numeric(5,2),
    discovery_date date,
    galaxy_id integer,
    star_id integer,
    classical_planet boolean
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
    constellation_id integer,
    distance_in_ly integer,
    spectral_type character varying(60),
    star_system boolean,
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 'The Archer', 12, 15);
INSERT INTO public.constellation VALUES (2, 'Andromeda', 'The Chained Woman, Andromeda', 16, 3);
INSERT INTO public.constellation VALUES (3, 'Corvus', 'The Crow/Raven', 4, 0);
INSERT INTO public.constellation VALUES (4, 'Hercules', 'Heracles', 14, 2);
INSERT INTO public.constellation VALUES (5, 'Perseus', 'Perseus', 19, 2);
INSERT INTO public.constellation VALUES (6, 'Coma Berenices', 'Berenices Hair', 3, 8);
INSERT INTO public.constellation VALUES (7, 'Dorado', 'The Dolphinfish', 3, 0);
INSERT INTO public.constellation VALUES (8, 'Pavo', 'The Peacock', 7, 0);
INSERT INTO public.constellation VALUES (9, 'Triangulum', 'The Triangle', 3, 1);
INSERT INTO public.constellation VALUES (10, 'Canis Major', 'The Greater Dog', 8, 1);
INSERT INTO public.constellation VALUES (11, 'Ursa Major', 'The Great Bear', 7, 7);
INSERT INTO public.constellation VALUES (12, 'Ursa Minor', 'The Little Bear', 7, 0);
INSERT INTO public.constellation VALUES (13, 'Orion', 'Orion, The Hunter', 7, 3);
INSERT INTO public.constellation VALUES (14, 'Octans', 'The Octant', 3, 0);
INSERT INTO public.constellation VALUES (15, 'Cancer', 'The Crab', 5, 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 185000, 27);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2, 220000, 2450);
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxies', 3, 500000, 45000);
INSERT INTO public.galaxy VALUES (4, 'Markarian 501', 4, 210000, 456000);
INSERT INTO public.galaxy VALUES (5, 'UGC 2885', 5, 463000, 71100);
INSERT INTO public.galaxy VALUES (6, 'Mice Galaxies', 6, 760000, 290000);
INSERT INTO public.galaxy VALUES (7, 'Malin 1', 6, 700000, 1190000);
INSERT INTO public.galaxy VALUES (8, 'Large Magellanic Cloud', 7, 14000, 163);
INSERT INTO public.galaxy VALUES (9, 'Condor Galaxy', 8, 522000, 212000);
INSERT INTO public.galaxy VALUES (10, 'Triangulum Galaxy', 9, 60000, 3200);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1877, NULL, 11);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 'Asaph Hall', 12);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 'Asaph Hall', 12);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 'Galileo Galilei', 13);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, 'Galileo Galilei', 13);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, 'Galileo Galilei', 13);
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, 'Galileo Galilei', 13);
INSERT INTO public.moon VALUES (8, 'Amalthea', 1892, 'Edward Emerson Barnard', 13);
INSERT INTO public.moon VALUES (9, 'Himalia', 1904, 'Charles Dillon Perrine', 13);
INSERT INTO public.moon VALUES (10, 'Elara', 1905, 'Charles Dillon Perrine', 13);
INSERT INTO public.moon VALUES (11, 'Mimas', 1789, 'William Herschel', 14);
INSERT INTO public.moon VALUES (12, 'Enceladus', 1789, 'William Herschel', 14);
INSERT INTO public.moon VALUES (13, 'Tethys', 1684, 'Giovanni Domenico Cassini', 14);
INSERT INTO public.moon VALUES (14, 'Dione', 1684, 'Giovanni Domenico Cassini', 14);
INSERT INTO public.moon VALUES (15, 'Rhea', 1672, 'Giovanni Domenico Cassini', 14);
INSERT INTO public.moon VALUES (16, 'Iapetus', 1671, 'Giovanni Domenico Cassini', 14);
INSERT INTO public.moon VALUES (17, 'Ariel', 1851, 'William Lassell', 15);
INSERT INTO public.moon VALUES (18, 'Umbriel', 1851, 'William Lassell', 15);
INSERT INTO public.moon VALUES (19, 'Titania', 1787, 'William Herschel', 15);
INSERT INTO public.moon VALUES (20, 'Oberon', 1787, 'William Herschel', 15);
INSERT INTO public.moon VALUES (21, 'Miranda', 1948, 'Gerard Kuiper', 15);
INSERT INTO public.moon VALUES (22, 'Triton', 1846, 'William Lassell', 16);
INSERT INTO public.moon VALUES (23, 'Nereid', 1949, 'Gerard Kuiper', 16);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Taphao Thong', 2.10, '1996-01-17', 1, 14, false);
INSERT INTO public.planet VALUES (2, 'Taphao Kaew', 3.60, '2001-08-15', 1, 14, false);
INSERT INTO public.planet VALUES (3, '47 Urrsae Majoris d', 11.60, '2010-03-06', 1, 14, false);
INSERT INTO public.planet VALUES (4, 'Galileo', 0.12, '1996-04-12', 1, 15, false);
INSERT INTO public.planet VALUES (5, 'Brahe', 0.24, '2002-06-13', 1, 15, false);
INSERT INTO public.planet VALUES (6, 'Lipperhey', 5.77, '2002-06-13', 1, 15, false);
INSERT INTO public.planet VALUES (7, 'Janssen', 0.02, '2004-08-30', 1, 15, false);
INSERT INTO public.planet VALUES (8, 'Harriot', 0.78, '2005-04-11', 1, 15, false);
INSERT INTO public.planet VALUES (9, 'Mercury', 0.39, NULL, 1, 16, true);
INSERT INTO public.planet VALUES (10, 'Venus', 0.72, NULL, 1, 16, true);
INSERT INTO public.planet VALUES (11, 'Earth', 1.00, NULL, 1, 16, false);
INSERT INTO public.planet VALUES (12, 'Mars', 1.52, NULL, 1, 16, true);
INSERT INTO public.planet VALUES (13, 'Jupiter', 5.20, NULL, 1, 16, true);
INSERT INTO public.planet VALUES (14, 'Saturn', 9.58, NULL, 1, 16, true);
INSERT INTO public.planet VALUES (15, 'Uranus', 19.19, '1781-03-13', 1, 16, false);
INSERT INTO public.planet VALUES (16, 'Neptune', 30.07, '1846-09-23', 1, 16, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (16, 'Sun', NULL, NULL, 'G2V', false, 1);
INSERT INTO public.star VALUES (1, 'Sirius', 10, 9, 'A0mA1 Va, DA2', true, 1);
INSERT INTO public.star VALUES (2, 'Polarius', 12, 323, 'F7Ib, F6V, F3V', true, 1);
INSERT INTO public.star VALUES (3, 'Alpheratz', 2, 97, 'B8IVpMnHg, A3V', true, 2);
INSERT INTO public.star VALUES (7, 'Mirach', 2, 197, 'M0 III', false, 2);
INSERT INTO public.star VALUES (4, 'M33-013406.63', 9, 2380000, 'O', false, 10);
INSERT INTO public.star VALUES (5, 'BAT99-98', 7, 165000, 'WN6', false, 8);
INSERT INTO public.star VALUES (6, 'WOH G64', 7, 160000, 'M5/M7.5', false, 8);
INSERT INTO public.star VALUES (8, 'Mizar', 11, 83, 'A2Vp/A2Vp, kA1h(eA)mA7IV-V', true, 1);
INSERT INTO public.star VALUES (9, 'Dubhe', 11, 123, 'K0III, F0V', true, 1);
INSERT INTO public.star VALUES (10, 'Alioth', 11, 83, 'A1III-IVp kB9', false, 1);
INSERT INTO public.star VALUES (14, '47 Ursae Majoris', 11, 46, 'G1V', false, 1);
INSERT INTO public.star VALUES (11, 'Rigel', 13, 863, 'B8 Ia, B9V + B9V', true, 1);
INSERT INTO public.star VALUES (12, 'Betelgeuse', 13, 548, 'M1–M2 Ia–ab', false, 1);
INSERT INTO public.star VALUES (13, 'Polaris Australis', 14, 294, 'F0 III', false, 1);
INSERT INTO public.star VALUES (15, '55 Cancri', 15, 41, 'K0IV–V, M4.5V', true, 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 15, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 13, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 16, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

