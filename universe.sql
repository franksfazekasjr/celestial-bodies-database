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
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth_lightyears numeric,
    num_of_stars_billions integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    orbit_distance_km numeric
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_star_au numeric,
    has_life boolean,
    in_habitable_zone boolean,
    number_moons integer
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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth_lightyears numeric,
    apparent_magnitude numeric
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (6, 1, 'Cygnus A', 'An extremely bright radio source.', 600000000, NULL);
INSERT INTO public.galaxy VALUES (4, 2, 'Andromeda Galaxy', 'Nearest major galaxy to the Milky Way.  Also known as Messier 31 or M31.', 2537000, 1000);
INSERT INTO public.galaxy VALUES (2, 2, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way.', 158200, 20);
INSERT INTO public.galaxy VALUES (3, 3, 'Small Magellanic Cloud', 'Dwarf irregular satellite galaxy of the Milky Way.', 199000, 3);
INSERT INTO public.galaxy VALUES (1, 2, 'Milky Way', 'We are here!', 0, 400);
INSERT INTO public.galaxy VALUES (5, 2, 'Black Eye Galaxy', 'They say it looks evil.', 17000000, 100);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Elliptical', 'Elliptical galaxies have semi-spherical or elliptical shapes.');
INSERT INTO public.galaxy_type VALUES (2, 'Spiral', 'Spiral galaxies have a central bulge, a flattened disk and arms that spiral around the central bulge.');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'Irregular galaxies have no defined structure and are just a glob of stars.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Luna (The Moon)', 'This is the single moon of planet Earth.', 384400);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 'Has the closest orbit of any moon in the solar system.', 6000);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 'Mars''s second, further moon.', 23458);
INSERT INTO public.moon VALUES (4, 5, 'Ganymede', 'Third of the Galilean moons.', 1070400);
INSERT INTO public.moon VALUES (5, 5, 'Callisto', 'Fourth of the Galilean moons.', 1882700);
INSERT INTO public.moon VALUES (6, 5, 'Io', 'First of the Galilean moons.', 421800);
INSERT INTO public.moon VALUES (7, 5, 'Europa', 'Second of the Galilean moons.', 671100);
INSERT INTO public.moon VALUES (8, 5, 'Amalthea', 'A tiny rock.', 181400);
INSERT INTO public.moon VALUES (9, 5, 'Himalia', 'Discovered in 1904.', 11440600);
INSERT INTO public.moon VALUES (10, 5, 'Pasiphae', 'Discovered in 1908.', 23468200);
INSERT INTO public.moon VALUES (11, 5, 'Elara', 'Discovered in 1905.', 11712300);
INSERT INTO public.moon VALUES (12, 5, 'Sinope', 'Discovered in 1914.', 23683900);
INSERT INTO public.moon VALUES (13, 5, 'Lysithea', 'Discovered in 1938.', 11700800);
INSERT INTO public.moon VALUES (14, 6, 'Mimas', 'Mostly water ice.', 185539);
INSERT INTO public.moon VALUES (15, 6, 'Enceladus', 'Fresh, clean ice.  Very reflective!', 237948);
INSERT INTO public.moon VALUES (16, 6, 'Tethys', 'Water ice. Second brightest moon of Saturn.', 294619);
INSERT INTO public.moon VALUES (17, 6, 'Dione', 'Fourth largest.  Ice cliffs.', 377396);
INSERT INTO public.moon VALUES (18, 6, 'Rhea', 'Second largest.  Surface area equal to Australia.', 527108);
INSERT INTO public.moon VALUES (19, 6, 'Titan', 'Largest moon of Saturn.  Surface liquid exists.', 1221870);
INSERT INTO public.moon VALUES (20, 6, 'Iapetus', 'Unusual coloring.  Has a light side and a dark side.', 3560820);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Closest planet to Sol (our Sun).', 0.39, false, false, 0);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'The second planet from Sol.  Some like it hot!', 0.72, false, true, 0);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'The only planet that has life as we know it...so far.', 1, true, true, 1);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'The Red Planet, fourth from the sun.', 1.52, false, true, 2);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Gas giant.  Maybe a failed star.', 5.2, false, false, 80);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Gas Giant, The ringed planet.  Beautiful!', 9.54, false, false, 83);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'It''s Uranus...you wipe it!', 19.22, false, false, 27);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Nothing matters after Uranus...', 30.06, false, false, 14);
INSERT INTO public.planet VALUES (9, 7, '51 Eridani b', 'Gas giant orbiting a F-type star.', 13.2, false, false, 0);
INSERT INTO public.planet VALUES (10, 8, 'Epsilon Eridani b', 'Gas giant orbiting a K-type star.', 3.53, false, false, 0);
INSERT INTO public.planet VALUES (11, 9, 'Proxima Centauri b', 'Terrestrial planet slightly larger than Earth.', 0.04856, false, true, 0);
INSERT INTO public.planet VALUES (12, 2, 'Vulcan', 'Homeworld of the Vulcan race in Star Trek.', 0.68, true, true, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol (The Sun)', 'Sol is the star we see when we look up in the daytime.', 0.00001581, -26.74);
INSERT INTO public.star VALUES (2, 1, '40 Eridani A', 'In Star Trek this is the star that the planet Vulcan orbits.', 16.26, 2.41);
INSERT INTO public.star VALUES (3, 1, 'Betelgeuse', 'The right shoulder of Orion.', 642.5, 0.58);
INSERT INTO public.star VALUES (4, 1, 'Sirius', 'The Dog Star in Canis Major.', 8.611, -1.46);
INSERT INTO public.star VALUES (5, 1, 'Rigel', 'Orion''s left foot. A winter constellation in the northern hemisphere.', 864.3, 0.12);
INSERT INTO public.star VALUES (6, 1, 'Vega', 'Bright white star that is nearby our solar system.', 25.05, 0.03);
INSERT INTO public.star VALUES (7, 1, '51 Eridani', '', 96, 5.22);
INSERT INTO public.star VALUES (8, 1, 'Epsilon Eridani', 'K-type star', 11, 3.73);
INSERT INTO public.star VALUES (9, 1, 'Proxima Centauri', 'Nearest star to the solar system.', 4.2465, 10.43);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

