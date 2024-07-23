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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    size_in_ly integer,
    galaxy_type integer,
    has_life boolean,
    age_billions_years numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_universe_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_universe_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_km integer NOT NULL,
    orbital_period_days numeric(6,2) NOT NULL,
    composition text,
    planet_id integer NOT NULL,
    has_water boolean
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
    name character varying(30) NOT NULL,
    size_in_km integer,
    planet_type text,
    distance_from_star numeric(5,2),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_universe_id_seq OWNER TO freecodecamp;

--
-- Name: planet_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_universe_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    millions_of_km_traveled numeric(7,2),
    years_of_service integer,
    mission text
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellites_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellites_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellites_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    size_in_km integer,
    star_type character varying(20),
    age_billions_years numeric(4,1),
    num_of_planets integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_universe_id_seq OWNER TO freecodecamp;

--
-- Name: star_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_universe_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_universe_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_universe_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellites_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 100000, 3, true, 13.5);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 2200000, 1, false, 10);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 60000, 1, false, 3.0);
INSERT INTO public.galaxy VALUES (4, 'Messier 32', 7000, 0, false, 11.0);
INSERT INTO public.galaxy VALUES (5, 'Messier 110', 15000, 0, false, 11.0);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 14000, 2, false, 13.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 3474, 27.32, 'Rock', 3, true);
INSERT INTO public.moon VALUES (22, 'Phobos', 22, 0.32, 'Rock', 4, false);
INSERT INTO public.moon VALUES (23, 'Deimos', 12, 1.26, 'Rock', 4, false);
INSERT INTO public.moon VALUES (24, 'Ganymede', 5268, 7.15, 'Ice/Rock', 5, true);
INSERT INTO public.moon VALUES (25, 'Europa', 3121, 3.55, 'Ice', 5, true);
INSERT INTO public.moon VALUES (26, 'Callisto', 4820, 16.69, 'Ice/Rock', 5, true);
INSERT INTO public.moon VALUES (27, 'Io', 3642, 1.77, 'Rock', 5, false);
INSERT INTO public.moon VALUES (28, 'Titan', 5149, 15.95, 'Ice/Rock', 6, true);
INSERT INTO public.moon VALUES (29, 'Enceladus', 504, 1.37, 'Ice', 6, true);
INSERT INTO public.moon VALUES (30, 'Mimas', 396, 0.94, 'Ice', 6, false);
INSERT INTO public.moon VALUES (31, 'Tethys', 1060, 1.89, 'Ice', 6, false);
INSERT INTO public.moon VALUES (32, 'Dione', 1120, 2.74, 'Ice/Rock', 6, false);
INSERT INTO public.moon VALUES (33, 'Rhea', 1528, 4.52, 'Ice/Rock', 6, false);
INSERT INTO public.moon VALUES (34, 'Iapetus', 1469, 79.32, 'Ice/Rock', 6, false);
INSERT INTO public.moon VALUES (35, 'Triton', 2706, 5.88, 'Ice', 8, true);
INSERT INTO public.moon VALUES (36, 'Proxima Centauri b-I', 500, 0.10, 'Rock/Ice', 9, false);
INSERT INTO public.moon VALUES (37, 'Proxima Centauri c-I', 600, 1.50, 'Rock/Ice', 10, false);
INSERT INTO public.moon VALUES (38, 'Alpha Centauri Bb-I', 700, 0.05, 'Rock', 11, false);
INSERT INTO public.moon VALUES (39, 'Kepler-186b-I', 800, 0.20, 'Rock', 12, false);
INSERT INTO public.moon VALUES (40, 'Kepler-452b-I', 900, 1.05, 'Ice/Rock', 16, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, 'Terrestrial', 0.39, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 'Terrestrial', 0.72, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, 'Terrestrial', 1.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, 'Terrestrial', 1.52, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820, 'Gas Giant', 5.20, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 116460, 'Gas Giant', 9.58, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, 'Ice Giant', 19.22, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49244, 'Ice Giant', 30.05, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 11400, 'Terrestrial', 0.05, 7);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 12000, 'Terrestrial', 1.49, 7);
INSERT INTO public.planet VALUES (11, 'Alpha Centauri Bb', 14000, 'Terrestrial', 0.04, 2);
INSERT INTO public.planet VALUES (12, 'Kepler-186b', 13000, 'Terrestrial', 0.10, 8);
INSERT INTO public.planet VALUES (13, 'Kepler-186c', 13500, 'Terrestrial', 0.22, 8);
INSERT INTO public.planet VALUES (14, 'Kepler-186d', 14000, 'Terrestrial', 0.35, 8);
INSERT INTO public.planet VALUES (15, 'Kepler-186e', 14500, 'Terrestrial', 0.40, 8);
INSERT INTO public.planet VALUES (16, 'Kepler-452b', 17500, 'Super-Earth', 1.05, 9);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Telescope', 3, 10.90, 33, 'Observes distant galaxies and stars');
INSERT INTO public.satellite VALUES (2, 'Voyager 1', 5, 22900.00, 46, 'Interstellar space exploration');
INSERT INTO public.satellite VALUES (3, 'Curiosity Rover', 4, 0.03, 12, 'Exploring the surface of Mars');
INSERT INTO public.satellite VALUES (4, 'Juno Orbiter', 6, 10.40, 8, 'Studying Jupiter’s atmosphere');
INSERT INTO public.satellite VALUES (5, 'New Horizons', 7, 490.00, 14, 'Exploring Pluto and the Kuiper Belt');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1392700, 'G2V', 4.6, 8, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1210000, 'G2V', 5.0, 1, 1);
INSERT INTO public.star VALUES (3, 'Alnilam', 11800000, 'B0Ia', 4.0, 0, 1);
INSERT INTO public.star VALUES (4, 'Mintaka', 15400000, 'O9.5II', 6.0, 0, 1);
INSERT INTO public.star VALUES (5, 'Alnitak', 15500000, 'O9.5Ib', 6.5, 0, 1);
INSERT INTO public.star VALUES (6, 'Spica', 12600000, 'B1III-IV', 12.5, 0, 1);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 200000, 'M5.5V', 4.9, 2, 1);
INSERT INTO public.star VALUES (8, 'Kepler-186', 490000, 'M1V', 4.0, 5, 1);
INSERT INTO public.star VALUES (9, 'Kepler-452', 1400000, 'G2V', 6.0, 1, 1);


--
-- Name: galaxy_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_universe_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_universe_id_seq', 16, true);


--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellites_satellite_id_seq', 5, true);


--
-- Name: star_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_universe_id_seq', 9, true);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellites_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellites_name_key UNIQUE (name);


--
-- Name: satellite satellites_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellites_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_universe_id_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_universe_id_pk PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: planet unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: satellite satellites_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellites_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

