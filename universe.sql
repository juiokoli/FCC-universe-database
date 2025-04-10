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
    type character varying(20) NOT NULL,
    discovered_year integer,
    planets_inside character varying(10)
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
    name character varying(40) NOT NULL,
    planet_id integer,
    size numeric,
    gravity numeric
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
    name character varying(40) NOT NULL,
    number_of_moons integer,
    mass numeric,
    description text,
    has_rings boolean,
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
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    name character varying(100) NOT NULL,
    location character varying(100),
    crew_size integer,
    distance_from_earth numeric,
    space_station_id integer NOT NULL
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_space_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_space_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_space_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    is_active boolean,
    galaxy_id integer,
    size numeric
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
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_space_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'Barred spiral', 1700, '100B');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred spiral', -961, 'trillions');
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Elliptical', 1781, 'billions');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 1773, 'billions');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 1781, '800B');
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Spiral', 1654, 'billions');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 3474.2, 1.62);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.2, 0.0057);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.6, 0.003);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643.2, 1.796);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3121.6, 1.315);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5268.2, 1.428);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4820.6, 1.235);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 5149.5, 1.352);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 504.2, 0.113);
INSERT INTO public.moon VALUES (10, 'Mimas', 4, 396.4, 0.064);
INSERT INTO public.moon VALUES (11, 'Rhea', 4, 1527.6, 0.264);
INSERT INTO public.moon VALUES (12, 'Iapetus', 4, 1468.6, 0.223);
INSERT INTO public.moon VALUES (13, 'Tethys', 4, 1062.2, 0.146);
INSERT INTO public.moon VALUES (14, 'Dione', 4, 1122.8, 0.232);
INSERT INTO public.moon VALUES (15, 'Hyperion', 4, 270.0, 0.02);
INSERT INTO public.moon VALUES (16, 'Betel-1', 6, 2345.6, 1.24);
INSERT INTO public.moon VALUES (17, 'Betel-2', 6, 1543.2, 0.87);
INSERT INTO public.moon VALUES (18, 'Arcturus Moon Prime', 8, 4567.8, 2.1);
INSERT INTO public.moon VALUES (19, 'Andromeda Minor', 9, 567.3, 0.45);
INSERT INTO public.moon VALUES (20, 'Sirius Moon Alpha', 12, 890.5, 0.67);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 5.97, 'Blue planet with abundant water and life', false, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 2, 0.642, 'Red planet with thin atmosphere', false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 79, 1898, 'Largest planet in our solar system with a giant red spot', true, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 82, 568, 'Beautiful planet with prominent ring system', true, 1);
INSERT INTO public.planet VALUES (5, 'Proxima Centauri b', 0, 1.27, 'Potentially habitable exoplanet orbiting Proxima Centauri', false, 1);
INSERT INTO public.planet VALUES (6, 'Betelgeuse I', 5, 2543, 'Giant hot planet orbiting the red supergiant', false, 2);
INSERT INTO public.planet VALUES (7, 'Betelgeuse II', 3, 1125, 'Rocky world with extreme temperatures', false, 2);
INSERT INTO public.planet VALUES (8, 'Arcturus Prime', 12, 857, 'Gas giant with complex weather systems', true, 3);
INSERT INTO public.planet VALUES (9, 'Andromeda Major', 8, 1235, 'Distant exoplanet with methane atmosphere', true, 4);
INSERT INTO public.planet VALUES (10, 'Alcyone III', 2, 2.5, 'Small rocky world with unusual magnetic field', false, 5);
INSERT INTO public.planet VALUES (11, 'Sirius A-1', 0, 0.5, 'Hot terrestrial planet close to its star', false, 6);
INSERT INTO public.planet VALUES (12, 'Sirius A-2', 4, 15.3, 'Cool gas giant far from its star', true, 6);


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES ('International Space Station', 'Earth Orbit', 7, 408, 1);
INSERT INTO public.space_station VALUES ('New Horizons Station', 'Jupiter Orbit', 15, 778500000, 2);
INSERT INTO public.space_station VALUES ('Andromeda Research Base', 'Andromeda Galaxy', 35, 2537000000000000, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', true, 1, 1.22);
INSERT INTO public.star VALUES (2, 'Betelgeuse', true, 1, 1000);
INSERT INTO public.star VALUES (3, 'Arcturus', true, 1, 25.4);
INSERT INTO public.star VALUES (4, 'Andromeda I', true, 2, 1.2);
INSERT INTO public.star VALUES (5, 'Alcyone', true, 1, 2.9);
INSERT INTO public.star VALUES (6, 'Sirius', true, 1, 1.71);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_space_station_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id PRIMARY KEY (planet_id);


--
-- Name: space_station space_station_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_id PRIMARY KEY (space_station_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: moon unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy uniqueg_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uniqueg_name UNIQUE (name);


--
-- Name: planet uniquep_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uniquep_name UNIQUE (name);


--
-- Name: star uniques_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uniques_name UNIQUE (name);


--
-- Name: space_station uniquess_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT uniquess_name UNIQUE (name);


--
-- Name: star galaxy_id_ref; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id_ref FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id_ref; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id_ref FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id_ref; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id_ref FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

