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
-- Name: classification; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.classification (
    classification_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    criteria text
);


ALTER TABLE public.classification OWNER TO freecodecamp;

--
-- Name: classification_classification_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.classification_classification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classification_classification_id_seq OWNER TO freecodecamp;

--
-- Name: classification_classification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.classification_classification_id_seq OWNED BY public.classification.classification_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying,
    description text,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    galaxy_types character varying
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
    name character varying,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric NOT NULL,
    planet_id integer NOT NULL
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
    name character varying,
    description text,
    distance_from_earth integer NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric NOT NULL,
    star_id integer NOT NULL
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
    name character varying,
    description text,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: classification classification_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.classification ALTER COLUMN classification_id SET DEFAULT nextval('public.classification_classification_id_seq'::regclass);


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
-- Data for Name: classification; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.classification VALUES (1, 'Star', 'A celestial body that generates light and heat', 'A massive, luminous sphere of plasma primarily composed of hydrogen and helium, undergoing nuclear fusion in its core.');
INSERT INTO public.classification VALUES (2, 'Planet', 'A celestial body orbiting a star that is massive enough to have cleared the neighborhood around its orbit and is not a satellite', 'A celestial body that orbits a star, is massive enough to have cleared the neighborhood around its orbit, and is not a satellite.');
INSERT INTO public.classification VALUES (3, 'Dwarf Planet', 'A celestial body orbiting a star that is massive enough to have cleared the neighborhood around its orbit and is not a satellite', 'A celestial body that orbits a star, is massive enough to have cleared the neighborhood around its orbit, and is not a satellite.');
INSERT INTO public.classification VALUES (4, 'Asteroid', 'A small, rocky celestial body orbiting the Sun', 'A small, rocky celestial body orbiting the Sun.');
INSERT INTO public.classification VALUES (5, 'Comet', 'A small, icy celestial body that orbits the Sun', 'A small, icy celestial body that orbits the Sun, often developing a tail as it approaches the Sun.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 0, 13.6, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large spiral galaxy', 3, 10, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Magellanic Clouds', 'Dwarf galaxies orbiting the Milky Way', 160, 11, 'Irregular');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'Spiral galaxy with prominent arms', 23, 100, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Lens-shaped galaxy with a prominent dust lane', 29, 100, 'Lenticular');
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 'Third-largest galaxy in the Local Group', 3, 10, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth only natural satellite', false, true, 4.5, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars larger moon', false, false, 4.5, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars smaller moon', false, false, 4.5, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter innermost moon', false, true, 4.5, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter moon with a subsurface ocean', false, true, 4.5, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the solar system', false, true, 4.5, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Jupiter second-largest moon', false, true, 4.5, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn largest moon with an atmosphere', false, true, 4.5, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Saturn moon with geysers', false, true, 4.5, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Saturn moon with a large crater', false, true, 4.5, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Saturn second-largest moon', false, true, 4.5, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 'Saturn moon with icy cliffs', false, true, 4.5, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 'Saturn moon with a large equatorial ridge', false, true, 4.5, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Saturn moon with a dark hemisphere', false, true, 4.5, 6);
INSERT INTO public.moon VALUES (15, 'Hyperion', 'Irregular moon of Saturn', false, false, 4.5, 6);
INSERT INTO public.moon VALUES (16, 'Miranda', 'Uranus moon with strange terrain', false, true, 4.5, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Uranus second-largest moon', false, true, 4.5, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'Uranus third-largest moon', false, true, 4.5, 7);
INSERT INTO public.moon VALUES (19, 'Titania', 'Uranus largest moon', false, true, 4.5, 7);
INSERT INTO public.moon VALUES (20, 'Oberon', 'Uranus outermost moon', false, true, 4.5, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Closest planet to the Sun', 58, false, true, 4.5, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second closest planet to the Sun', 41, false, true, 4.5, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet', 0, true, true, 4.5, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Red Planet', 56, false, true, 4.5, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet in the solar system', 588, false, true, 4.5, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Ringed planet', 1275, false, true, 4.5, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant planet', 2872, false, true, 4.5, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Outermost planet in the solar system', 4495, false, true, 4.5, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Exoplanet orbiting Proxima Centauri', 4, false, true, 4.8, 4);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 'Exoplanet similar to Earth', 1400, false, true, 6, 2);
INSERT INTO public.planet VALUES (11, 'Trappist-1e', 'Exoplanet in the habitable zone of Trappist-1', 40, false, true, 5, 5);
INSERT INTO public.planet VALUES (12, 'Kepler-186f', 'First Earth-sized exoplanet in the habitable zone of a star', 500, false, true, 4, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our star', 0, 4.6, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', 9, 230, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant star', 640, 10, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Nearest star to the Sun', 4, 4.8, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'Brightest star in the constellation Lyra', 25, 450, 1);
INSERT INTO public.star VALUES (6, 'Polaris', 'North Star', 430, 100, 1);


--
-- Name: classification_classification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.classification_classification_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: classification classification_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_name_key UNIQUE (name);


--
-- Name: classification classification_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (classification_id);


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

