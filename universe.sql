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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    area_covered numeric NOT NULL,
    brightest_star character varying(255) NOT NULL
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
    name character varying(255) NOT NULL,
    description text,
    galaxy_type character varying(255) NOT NULL,
    distance_from_earth integer NOT NULL,
    has_life boolean NOT NULL
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
    name character varying(255) NOT NULL,
    description text,
    distance_from_planet integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer NOT NULL,
    surface_area integer NOT NULL
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
    name character varying(255) NOT NULL,
    description text,
    planet_type character varying(255) NOT NULL,
    orbit_radius integer NOT NULL,
    is_habitable boolean NOT NULL,
    star_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
    name character varying(255) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    galaxy_id integer NOT NULL,
    luminosity numeric NOT NULL,
    temperature integer NOT NULL
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

INSERT INTO public.constellation VALUES (1, 'Orion', 'A prominent constellation located on the celestial equator', 594.1, 'Rigel');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'Contains the Big Dipper asterism', 1279.7, 'Dubhe');
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 'Named after the queen in Greek mythology', 598.4, 'Schedar');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', 'Spiral', 10000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest galaxy to Milky Way', 'Spiral', 15000, false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Notable for its prominent dust lane', 'Spiral', 8000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting grand-design spiral galaxies', 'Spiral', 12000, true);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'A face-on spiral galaxy', 'Spiral', 11000, true);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Barred spiral galaxy', 'Spiral', 10500, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', NULL, 9380, false, true, 2, 11000000);
INSERT INTO public.moon VALUES (2, 'Deimos', NULL, 23460, false, true, 2, 6300000);
INSERT INTO public.moon VALUES (3, 'Ganymede', NULL, 1070, false, true, 3, 87000000);
INSERT INTO public.moon VALUES (4, 'Callisto', NULL, 1883, false, true, 3, 76000000);
INSERT INTO public.moon VALUES (5, 'Io', NULL, 421, false, true, 3, 41000000);
INSERT INTO public.moon VALUES (6, 'Europa', NULL, 671, false, true, 3, 31000000);
INSERT INTO public.moon VALUES (7, 'Titan', NULL, 1221, false, true, 4, 83000000);
INSERT INTO public.moon VALUES (8, 'Rhea', NULL, 527, false, true, 4, 7550000);
INSERT INTO public.moon VALUES (9, 'Iapetus', NULL, 3561, false, true, 4, 62300000);
INSERT INTO public.moon VALUES (10, 'Mimas', NULL, 185, false, true, 4, 1900000);
INSERT INTO public.moon VALUES (11, 'Enceladus', NULL, 238, false, true, 4, 8000000);
INSERT INTO public.moon VALUES (12, 'Triton', NULL, 354, false, true, 5, 24000000);
INSERT INTO public.moon VALUES (13, 'Charon', NULL, 19571, false, true, 9, 7500000);
INSERT INTO public.moon VALUES (14, 'Ariel', NULL, 191, false, true, 9, 8140000);
INSERT INTO public.moon VALUES (15, 'Umbriel', NULL, 266, false, true, 9, 7710000);
INSERT INTO public.moon VALUES (16, 'Titania', NULL, 435, false, true, 9, 7880000);
INSERT INTO public.moon VALUES (17, 'Oberon', NULL, 583, false, true, 9, 7610000);
INSERT INTO public.moon VALUES (18, 'Miranda', NULL, 130, false, true, 9, 2340000);
INSERT INTO public.moon VALUES (19, 'Proteus', NULL, 1176, false, true, 9, 5550000);
INSERT INTO public.moon VALUES (20, 'Luna', NULL, 384, false, true, 1, 38000000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Closest planet to the Sun', 'Terrestrial', 58, false, 1, 4500);
INSERT INTO public.planet VALUES (2, 'Venus', 'Similar in size to Earth', 'Terrestrial', 108, false, 1, 4500);
INSERT INTO public.planet VALUES (3, 'Mars', 'Known as the Red Planet', 'Terrestrial', 228, false, 1, 4500);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Largest planet in the Solar System', 'Gas Giant', 778, false, 1, 4500);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Known for its rings', 'Gas Giant', 1430, false, 1, 4500);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Rotates on its side', 'Ice Giant', 2871, false, 1, 4500);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Farthest planet from the Sun', 'Ice Giant', 4500, false, 1, 4500);
INSERT INTO public.planet VALUES (8, 'Kepler-186f', 'First Earth-sized planet discovered in the habitable zone of another star', 'Terrestrial', 53, true, 6, 500);
INSERT INTO public.planet VALUES (9, 'HD 209458 b', 'First exoplanet to be discovered transiting in front of its parent star', 'Gas Giant', 150, false, 6, 500);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 'Located in the habitable zone of the ultracool dwarf star TRAPPIST-1', 'Terrestrial', 41, true, 6, 500);
INSERT INTO public.planet VALUES (11, 'PSR B1257+12 A', 'First confirmed exoplanet around a pulsar', 'Terrestrial', 0, true, 6, 500);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 'Exoplanet orbiting Proxima Centauri, the closest star to the Sun', 'Terrestrial', 4, true, 2, 4000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', NULL, true, 4000, 2, 0.0017, 3042);
INSERT INTO public.star VALUES (2, 'Betelgeuse', NULL, false, 8000, 1, 130000, 3650);
INSERT INTO public.star VALUES (3, 'Rigel', NULL, false, 10000, 1, 120000, 12130);
INSERT INTO public.star VALUES (4, 'Antares', NULL, true, 12000, 1, 10000, 3600);
INSERT INTO public.star VALUES (5, 'Aldebaran', NULL, true, 6500, 1, 439, 3910);
INSERT INTO public.star VALUES (6, 'Sun', NULL, true, 5000, 1, 1.0, 5778);
INSERT INTO public.star VALUES (7, 'Sirius', NULL, true, 250, 1, 25.4, 9940);
INSERT INTO public.star VALUES (8, 'Alpha Centauri A', NULL, true, 6000, 1, 1.5, 5790);
INSERT INTO public.star VALUES (9, 'Arcturus', NULL, true, 7000, 1, 170, 4286);
INSERT INTO public.star VALUES (10, 'Vega', NULL, true, 400, 1, 40, 9602);
INSERT INTO public.star VALUES (11, 'Capella', NULL, true, 3000, 1, 90, 4940);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


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

