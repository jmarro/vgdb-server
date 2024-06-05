--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1 (Homebrew)

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
-- Name: AwardCategories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AwardCategories" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_main boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    award_category_id integer
);


ALTER TABLE public."AwardCategories" OWNER TO postgres;

--
-- Name: AwardCategories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."AwardCategories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."AwardCategories_id_seq" OWNER TO postgres;

--
-- Name: AwardCategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."AwardCategories_id_seq" OWNED BY public."AwardCategories".id;


--
-- Name: Awards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Awards" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_main boolean,
    main_img character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    wikipedia character varying(255)
);


ALTER TABLE public."Awards" OWNER TO postgres;

--
-- Name: Awards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Awards_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Awards_id_seq" OWNER TO postgres;

--
-- Name: Awards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Awards_id_seq" OWNED BY public."Awards".id;


--
-- Name: Character_People; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Character_People" (
    is_main_for_person boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "PersonId" integer NOT NULL,
    "CharacterId" integer NOT NULL
);


ALTER TABLE public."Character_People" OWNER TO postgres;

--
-- Name: Characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Characters" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    full_name character varying(255),
    alias character varying(255),
    alt_names character varying(255),
    main_img character varying(255),
    color character varying(255),
    role_in_franchise character varying(255),
    bio text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    franchise_id integer,
    creation_year integer,
    wikipedia character varying(255),
    is_main boolean
);


ALTER TABLE public."Characters" OWNER TO postgres;

--
-- Name: Characters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Characters_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Characters_id_seq" OWNER TO postgres;

--
-- Name: Characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Characters_id_seq" OWNED BY public."Characters".id;


--
-- Name: Companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Companies" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    country character varying(255),
    founding_year integer NOT NULL,
    active boolean DEFAULT true,
    defunct_year integer,
    defunct_reason character varying(255),
    previous_names character varying(255),
    color character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ownerId" integer,
    main_img character varying(255),
    wikipedia character varying(255),
    owner_relation character varying(255),
    notes character varying(255),
    is_main boolean
);


ALTER TABLE public."Companies" OWNER TO postgres;

--
-- Name: Companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Companies_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Companies_id_seq" OWNER TO postgres;

--
-- Name: Companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Companies_id_seq" OWNED BY public."Companies".id;


--
-- Name: Franchise_Franchises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Franchise_Franchises" (
    is_main boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    parent_id integer NOT NULL
);


ALTER TABLE public."Franchise_Franchises" OWNER TO postgres;

--
-- Name: Franchise_People; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Franchise_People" (
    is_main_for_person boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "PersonId" integer NOT NULL,
    "FranchiseId" integer NOT NULL
);


ALTER TABLE public."Franchise_People" OWNER TO postgres;

--
-- Name: Franchises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Franchises" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    main_img character varying(255),
    first_game_date date,
    color character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ownerId" integer,
    company_creator_id integer,
    wikipedia character varying(255),
    is_main boolean
);


ALTER TABLE public."Franchises" OWNER TO postgres;

--
-- Name: Franchises_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Franchises_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Franchises_id_seq" OWNER TO postgres;

--
-- Name: Franchises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Franchises_id_seq" OWNED BY public."Franchises".id;


--
-- Name: Game_Awards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Game_Awards" (
    result character varying(255) NOT NULL,
    year integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "GameId" integer NOT NULL,
    "AwardCategoryId" integer NOT NULL
);


ALTER TABLE public."Game_Awards" OWNER TO postgres;

--
-- Name: Game_Characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Game_Characters" (
    type character varying(255) NOT NULL,
    is_main_for_character boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CharacterId" integer NOT NULL,
    "GameId" integer NOT NULL
);


ALTER TABLE public."Game_Characters" OWNER TO postgres;

--
-- Name: Game_Companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Game_Companies" (
    type character varying(255) NOT NULL,
    is_main_for_company boolean,
    country character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CompanyId" integer NOT NULL,
    "GameId" integer NOT NULL
);


ALTER TABLE public."Game_Companies" OWNER TO postgres;

--
-- Name: Game_Genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Game_Genres" (
    is_main_for_genre boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "GameId" integer NOT NULL,
    "GenreId" integer NOT NULL
);


ALTER TABLE public."Game_Genres" OWNER TO postgres;

--
-- Name: Game_People; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Game_People" (
    is_main_for_person boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "PersonId" integer NOT NULL,
    "GameId" integer NOT NULL
);


ALTER TABLE public."Game_People" OWNER TO postgres;

--
-- Name: Game_Platforms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Game_Platforms" (
    is_main_for_platform boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "GameId" integer NOT NULL,
    "PlatformId" integer NOT NULL
);


ALTER TABLE public."Game_Platforms" OWNER TO postgres;

--
-- Name: Game_Themes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Game_Themes" (
    is_main_for_theme boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "GameId" integer NOT NULL,
    "ThemeId" integer NOT NULL
);


ALTER TABLE public."Game_Themes" OWNER TO postgres;

--
-- Name: Games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Games" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    main_img character varying(255),
    logo character varying(255),
    back_cover character varying(255),
    release_date date NOT NULL,
    score integer,
    format character varying(255),
    price double precision,
    num_players character varying(255),
    alt_name character varying(255),
    owned boolean DEFAULT false,
    personal_status character varying(255) DEFAULT 'NOT_PLAYED'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "franchiseId" integer,
    "serieId" integer,
    color character varying(255),
    wikipedia character varying(255),
    media character varying(255)
);


ALTER TABLE public."Games" OWNER TO postgres;

--
-- Name: Games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Games_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Games_id_seq" OWNER TO postgres;

--
-- Name: Games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Games_id_seq" OWNED BY public."Games".id;


--
-- Name: Genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Genres" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    main_img character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "parentId" integer,
    is_main boolean
);


ALTER TABLE public."Genres" OWNER TO postgres;

--
-- Name: Genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Genres_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Genres_id_seq" OWNER TO postgres;

--
-- Name: Genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Genres_id_seq" OWNED BY public."Genres".id;


--
-- Name: People; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."People" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    main_img character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    nationality character varying(255),
    birthday date,
    wikipedia character varying(255),
    is_main boolean
);


ALTER TABLE public."People" OWNER TO postgres;

--
-- Name: People_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."People_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."People_id_seq" OWNER TO postgres;

--
-- Name: People_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."People_id_seq" OWNED BY public."People".id;


--
-- Name: PlatformModels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PlatformModels" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    main_img character varying(255),
    release_date date NOT NULL,
    comments text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    platform_family_id integer
);


ALTER TABLE public."PlatformModels" OWNER TO postgres;

--
-- Name: PlatformModels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PlatformModels_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PlatformModels_id_seq" OWNER TO postgres;

--
-- Name: PlatformModels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PlatformModels_id_seq" OWNED BY public."PlatformModels".id;


--
-- Name: Platforms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Platforms" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    mini_logo character varying(255),
    img character varying(255),
    release_date date NOT NULL,
    gen integer NOT NULL,
    specs text,
    type character varying(255),
    alt_names text,
    color character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "manufacturerId" integer,
    main_img character varying(255),
    wikipedia character varying(255),
    is_main boolean
);


ALTER TABLE public."Platforms" OWNER TO postgres;

--
-- Name: Platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Platforms_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Platforms_id_seq" OWNER TO postgres;

--
-- Name: Platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Platforms_id_seq" OWNED BY public."Platforms".id;


--
-- Name: Series; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Series" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_main boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    franchise_id integer
);


ALTER TABLE public."Series" OWNER TO postgres;

--
-- Name: Series_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Series_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Series_id_seq" OWNER TO postgres;

--
-- Name: Series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Series_id_seq" OWNED BY public."Series".id;


--
-- Name: Themes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Themes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    main_img character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "parentId" integer,
    is_main boolean
);


ALTER TABLE public."Themes" OWNER TO postgres;

--
-- Name: Themes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Themes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Themes_id_seq" OWNER TO postgres;

--
-- Name: Themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Themes_id_seq" OWNED BY public."Themes".id;


--
-- Name: AwardCategories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AwardCategories" ALTER COLUMN id SET DEFAULT nextval('public."AwardCategories_id_seq"'::regclass);


--
-- Name: Awards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Awards" ALTER COLUMN id SET DEFAULT nextval('public."Awards_id_seq"'::regclass);


--
-- Name: Characters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Characters" ALTER COLUMN id SET DEFAULT nextval('public."Characters_id_seq"'::regclass);


--
-- Name: Companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Companies" ALTER COLUMN id SET DEFAULT nextval('public."Companies_id_seq"'::regclass);


--
-- Name: Franchises id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Franchises" ALTER COLUMN id SET DEFAULT nextval('public."Franchises_id_seq"'::regclass);


--
-- Name: Games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Games" ALTER COLUMN id SET DEFAULT nextval('public."Games_id_seq"'::regclass);


--
-- Name: Genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Genres" ALTER COLUMN id SET DEFAULT nextval('public."Genres_id_seq"'::regclass);


--
-- Name: People id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."People" ALTER COLUMN id SET DEFAULT nextval('public."People_id_seq"'::regclass);


--
-- Name: PlatformModels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PlatformModels" ALTER COLUMN id SET DEFAULT nextval('public."PlatformModels_id_seq"'::regclass);


--
-- Name: Platforms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Platforms" ALTER COLUMN id SET DEFAULT nextval('public."Platforms_id_seq"'::regclass);


--
-- Name: Series id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Series" ALTER COLUMN id SET DEFAULT nextval('public."Series_id_seq"'::regclass);


--
-- Name: Themes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Themes" ALTER COLUMN id SET DEFAULT nextval('public."Themes_id_seq"'::regclass);


--
-- Data for Name: AwardCategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AwardCategories" (id, name, is_main, "createdAt", "updatedAt", award_category_id) FROM stdin;
1	Game of the Year	t	2024-02-10 12:54:50.816+01	2024-04-13 13:24:50.317+02	3
3	Best Original Console Game	f	2024-04-22 15:59:30.21+02	2024-04-22 15:59:30.21+02	3
4	Promotional Campaign of the Year	f	2024-04-22 16:00:37.979+02	2024-04-22 16:00:37.979+02	3
5	Game of the Year	t	2024-04-22 16:06:40.833+02	2024-04-22 16:06:40.833+02	5
\.


--
-- Data for Name: Awards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Awards" (id, name, is_main, main_img, "createdAt", "updatedAt", wikipedia) FROM stdin;
1	Spike Video Game Awards	t	Spike_VGA.png	2024-02-10 12:19:42.387+01	2024-02-10 12:19:42.387+01	\N
2	The Game Awards	t	game_awards.png	2024-02-10 12:23:16.392+01	2024-02-10 12:23:16.392+01	\N
3	Golden Joystick Awards	t	Golden_Joystick_Award.png	2024-02-10 12:24:15.754+01	2024-04-13 13:21:58.786+02	\N
5	Electronic Gaming Monthly	f	EGM.png	2024-04-22 16:05:50.513+02	2024-04-22 16:05:50.513+02	https://es.wikipedia.org/wiki/Electronic_Gaming_Monthly
\.


--
-- Data for Name: Character_People; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Character_People" (is_main_for_person, "createdAt", "updatedAt", "PersonId", "CharacterId") FROM stdin;
\N	2024-01-04 13:37:57.327+01	2024-01-04 13:37:57.327+01	1	1
\N	2024-01-04 13:37:57.327+01	2024-01-04 13:37:57.327+01	2	1
\N	2024-01-04 13:39:48.011+01	2024-01-04 13:39:48.011+01	2	2
\N	2024-05-03 08:58:08.185+02	2024-05-03 08:58:08.185+02	22	5
\N	2024-05-03 10:26:31.502+02	2024-05-03 10:26:31.502+02	22	6
\N	2024-05-03 10:27:55.106+02	2024-05-03 10:27:55.106+02	22	7
\N	2024-05-03 10:29:13.688+02	2024-05-03 10:29:13.688+02	22	8
\N	2024-05-03 10:30:17.707+02	2024-05-03 10:30:17.707+02	22	9
\N	2024-05-25 10:41:19.962+02	2024-05-25 10:41:19.962+02	27	10
\N	2024-05-25 11:04:26.221+02	2024-05-25 11:04:26.221+02	27	11
\N	2024-05-25 11:23:01.956+02	2024-05-25 11:23:01.956+02	27	12
\N	2024-06-05 17:15:34.09+02	2024-06-05 17:15:34.09+02	27	18
\.


--
-- Data for Name: Characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Characters" (id, name, full_name, alias, alt_names, main_img, color, role_in_franchise, bio, "createdAt", "updatedAt", franchise_id, creation_year, wikipedia, is_main) FROM stdin;
17	Donkey Kong Jr.	\N	\N	\N	donkey_kong/donkey-kong-junior.png	#663605	SECONDARY	\N	2024-06-04 16:49:28.986+02	2024-06-04 16:49:37.069+02	13	1982	\N	\N
18	Luigi	Luigi Mario	\N		mario/luigi.jpeg	#4cbb17	SECONDARY	\N	2024-06-05 17:14:23.601+02	2024-06-05 17:14:34.698+02	14	1983	https://es.wikipedia.org/wiki/Luigi	t
2	Doctor Robotnik	Doctor Ivo Robotnik	Eggman	Doctor Eggman	sonic/robotnik.png	#b60505	ANTAGONIST	\N	2024-01-04 13:07:51.716+01	2024-03-30 13:03:05.381+01	1	1991	https://es.wikipedia.org/wiki/Doctor_Eggman	\N
3	Tails	Miles Prower			sonic/tails.jpeg	#df3812	SECONDARY	\N	2024-03-30 10:56:57.077+01	2024-04-01 12:44:07.365+02	1	1992	https://es.wikipedia.org/wiki/Miles_%C2%ABTails%C2%BB_Prower	\N
6	Blinky	\N	\N	\N	pacman/blinky.jpeg	#ea0800	ANTAGONIST	\N	2024-05-03 10:26:11.6+02	2024-05-03 10:26:22.065+02	8	1980	\N	\N
7	Pinky	\N	\N	\N	pacman/pinky.jpeg	#f495c7	ANTAGONIST	\N	2024-05-03 10:27:31.272+02	2024-05-03 10:27:48.941+02	8	1980	\N	\N
8	Inky	\N	\N	\N	pacman/inky.jpeg	#00c7ea	ANTAGONIST	\N	2024-05-03 10:28:57.234+02	2024-05-03 10:29:05.945+02	8	1980	\N	\N
9	Clyde	\N	\N	\N	pacman/clyde.jpeg	#f86300	ANTAGONIST	\N	2024-05-03 10:30:04.346+02	2024-05-03 10:30:12.134+02	8	1980	\N	\N
1	Sonic	Sonic the Hedgehog	\N	\N	sonic/sonic.jpeg	#17569b	MAIN	\N	2024-01-04 12:42:22.196+01	2024-05-25 10:38:10.462+02	1	1991	https://es.wikipedia.org/wiki/Sonic_(personaje)	t
5	Pac-Man	\N	\N	\N	pacman/pacman.png	#ed6b0e	MAIN	\N	2024-05-03 08:55:45.988+02	2024-05-25 10:38:20.714+02	8	1980	https://es.wikipedia.org/wiki/Pac-Man_(personaje)	t
11	Donkey Kong	\N	\N	\N	donkey_kong/donkeykong.png	#663605	MAIN	\N	2024-05-25 11:04:01.891+02	2024-05-25 11:04:09.418+02	13	1981	https://es.wikipedia.org/wiki/Donkey_Kong_(personaje)	t
12	Pauline	\N	\N	Lady (Donkey Kong 1981)	donkey_kong/pauline.jpg	#ab2127	SECONDARY	\N	2024-05-25 11:22:38.592+02	2024-05-25 11:22:54.15+02	13	1981	https://es.wikipedia.org/wiki/Pauline	\N
10	Mario	Mario Mario		Jumpman  (Donkey Kong 1981)	mario/mario.png	#ee1c25	MAIN	\N	2024-05-25 10:34:29.98+02	2024-05-25 12:30:31.946+02	14	1981	https://es.wikipedia.org/wiki/Mario_(personaje)	t
14	Sue	\N	\N	\N	pacman/sue.jpeg	\N	ANTAGONIST	\N	2024-05-28 17:28:42.412+02	2024-05-28 17:28:50.432+02	8	1982	\N	\N
13	Ms. Pac-man	\N	\N	\N	pacman/mspacman.jpeg	\N	SECONDARY	\N	2024-05-28 17:28:01.159+02	2024-05-28 17:29:03.098+02	8	1982	https://en.wikipedia.org/wiki/Ms._Pac-Man_(character)	\N
15	Q*bert	\N	\N	\N	qbert/qbert.jpeg	\N	MAIN	\N	2024-05-30 17:13:17.642+02	2024-05-30 17:13:47.997+02	16	1982	\N	\N
16	E.T.	Zrek 	Extraterrestrial	\N	et/et.jpeg	\N	MAIN	\N	2024-06-02 11:51:51.349+02	2024-06-02 11:53:23.12+02	19	1982	https://en.wikipedia.org/wiki/E.T._(character)	\N
\.


--
-- Data for Name: Companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Companies" (id, name, country, founding_year, active, defunct_year, defunct_reason, previous_names, color, "createdAt", "updatedAt", "ownerId", main_img, wikipedia, owner_relation, notes, is_main) FROM stdin;
30	Konami	jp	1973	t	\N	\N	\N	#990313	2024-05-19 13:11:24.51+02	2024-05-24 14:03:32.194+02	\N	konami.png	https://es.wikipedia.org/wiki/Konami	\N	\N	t
3	Sega Technical Institute	us	1990	f	1996	Disuelta por Sega		#17569b	2024-03-24 19:39:25.503+01	2024-03-30 12:12:57.183+01	1	Sega_technical_institute.jpg	https://es.wikipedia.org/wiki/Sega_Technical_Institute	DIVISION	\N	\N
31	Nintendo R&D1	jp	1970	f	2005	Reestructuración dentro de los equipos de Nintendo	\N	#E60012	2024-05-24 13:42:06.403+02	2024-05-24 13:54:53.52+02	32	nintendord1.png	https://es.wikipedia.org/wiki/Nintendo_Research_%26_Development_1	DIVISION	\N	\N
27	WMS Industries	us	1974	f	2016	Disuelta por Scientific Games	Williams Electronics	\N	2024-05-12 13:44:34.127+02	2024-05-12 13:44:34.127+02	\N	WMS.png	https://es.wikipedia.org/wiki/WMS_Industries	\N	Fue comprada por Scientific Games (dedicada a pinballs y casinos) en 2013	\N
7	Softkey	ca	1986	f	1999	Disuelta por Mattel	The Learning Company	\N	2024-04-24 23:38:18.324+02	2024-04-24 23:44:14.669+02	8	softkey.png	https://en.wikipedia.org/wiki/SoftKey	ADQUISITION	\N	\N
32	Nintendo	jp	1889	t	\N	\N	Nintendo Koppai (1889)\nYamauchi Nintendo (1889–1933)\nYamauchi Nintendo & Co. (1933–1947)\nMarufuku Co., Ltd. (1947–1951)\nNintendo Playing Card Co. Ltd. (1951–1963)	#E60012	2024-05-24 13:53:58.743+02	2024-05-24 14:03:07.664+02	\N	Nintendo.png	https://es.wikipedia.org/wiki/Nintendo	\N	\N	t
37	Universal Studios	us	1912	t	\N	\N	\N	\N	2024-06-02 11:42:20.643+02	2024-06-02 11:42:20.643+02	\N	universal.png	https://es.wikipedia.org/wiki/Universal_Pictures	\N	\N	\N
14	Taito	jp	1953	t	\N	\N	\N	\N	2024-04-27 13:20:35.505+02	2024-04-27 13:28:13.671+02	15	taito.png	https://es.wikipedia.org/wiki/Taito_Corporation	ADQUISITION	Adquirida por Squarex Enix en 2015	\N
12	Atari SA	fr	1983	t	\N	\N	Infogrames Entertainment SA	\N	2024-04-26 10:47:51.064+02	2024-04-27 13:29:28.741+02	\N	atari.png	https://es.wikipedia.org/wiki/Atari_SA	\N	Cambio de nombre de Infogrames a Atari SA, al adquirir la totalidad de Atari	\N
13	Infogrames	fr	1983	f	2009	Cambió de nombre a Atari SA después de la adquisición de Atari	\N	\N	2024-04-26 10:52:26.345+02	2024-04-27 13:29:55.869+02	12	infogrames.png	hhttps://es.wikipedia.org/wiki/Atari_SA	DIVISION	\N	\N
34	General Computer Corporation	us	1981	f	2015	Disolución	\N	\N	2024-05-28 17:17:31.375+02	2024-05-28 17:17:31.375+02	\N	GCC_Technologies.png	https://en.wikipedia.org/wiki/General_Computer_Corporation	\N	\N	\N
9	Magnavox	us	1917	t	\N	\N	\N	\N	2024-04-25 15:55:56.695+02	2024-04-27 13:31:25.295+02	10	magnavox.png	https://es.wikipedia.org/wiki/Magnavox	ADQUISITION	Adquirida por Philips en 1974	\N
6	MECC	us	1973	f	1999	Cerrada por la venta de Softkey a Mattel	Minnesota Educational Computing Consortium	\N	2024-04-24 23:33:38.651+02	2024-04-27 13:32:26.016+02	7	MECC.png	https://en.wikipedia.org/wiki/MECC	ADQUISITION	Adquirida por Softkey en 1991	\N
16	Bally	us	1932	f	1996	Comprada por el grupo Hilton	Bally-Midway (1970-1980)	\N	2024-04-27 13:59:49.763+02	2024-04-27 13:59:49.763+02	\N	bally.png	https://en.wikipedia.org/wiki/Bally_Manufacturing	\N	\N	\N
2	Sonic Team	jp	1990	t	\N	\N	\N	#17569b	2024-01-05 12:08:27.595+01	2024-03-29 11:45:13.621+01	1	sonic_team.png	\N	DIVISION	\N	\N
26	Vivendi Games	us	1996	f	2008	Desaparecida en la fusión con Activision para fundar Activision Blizzard	CUC Software (1996–1997)\nCendant Software (1997–1998)\nHavas Interactive (1998–2001)\nVivendi Universal Interactive Publishing (2001)\nVivendi Universal Games (2001–2006)	\N	2024-05-01 13:27:55.721+02	2024-05-01 13:36:42.98+02	22	Vivendi_Games.png	https://es.wikipedia.org/wiki/Vivendi_Games	MERGE	Se fundó como CUC\nComo CUC adquirió Sierra y Blizzard\nFue comprada por la francesa Vivendi y se renombró como Vivendi Games\nSe fusionó con Activision para formar Activision Blizzard. En la fusión se mantuvo a Blizzard	\N
10	Philips	nl	1891	t	\N	\N	\N	#0b5ed7	2024-04-25 15:59:13.132+02	2024-05-18 19:49:32.37+02	\N	philips.png	https://es.wikipedia.org/wiki/Philips	\N	\N	\N
15	Square Enix	jp	2003	t	\N	\N	\N	\N	2024-04-27 13:24:14.309+02	2024-05-24 14:04:29.66+02	\N	square_enix.png	https://es.wikipedia.org/wiki/Square_Enix	\N	\N	t
8	Mattel	us	1945	t	\N	\N	\N	#FF0028	2024-04-24 23:43:53.419+02	2024-05-18 19:50:11.805+02	\N	mattel.png	https://es.wikipedia.org/wiki/Mattel	\N	\N	\N
17	Midway	us	1958	f	2010	Bancarrota	Bally Midway (1982–1988)	\N	2024-04-27 17:36:10.943+02	2024-04-27 17:44:12.125+02	\N	midway.png	https://es.wikipedia.org/wiki/Midway_Games	\N	Propiedad de Bally (1969–1988)\nPropiedad de WMS Industries (1988–1998)\nAl quebrar sus derechos los compró Warner Bros	\N
18	Namco	jp	1955	f	2006	Desaparecida en la fusión con Bandai	Nakamura Seisakusho Co.	#a51e23	2024-04-30 17:37:16.495+02	2024-05-30 17:03:07.754+02	19	namco.png	https://es.wikipedia.org/wiki/Namco	MERGE	\N	f
19	Bandai Namco	jp	2006	t	\N	\N	\N	#E60000	2024-04-30 17:43:10.605+02	2024-05-24 14:04:45.686+02	\N	Bandai_Namco.png	https://es.wikipedia.org/wiki/Bandai_Namco_Entertainment	\N	\N	t
20	Infocom	us	1979	f	1989	Cerrada por Activision 3 años después de su compra	\N	\N	2024-05-01 10:51:09.202+02	2024-05-01 11:12:21.735+02	21	infocom.png	https://es.wikipedia.org/wiki/Infocom	ADQUISITION	Comprada por Activision en 1986	\N
24	Epyx	us	1978	f	1993	Bancarrota	\N	\N	2024-05-01 12:45:14.274+02	2024-05-01 12:45:14.274+02	\N	Epyx.png	https://es.wikipedia.org/wiki/Epyx	\N	\N	\N
25	Sierra	us	1979	f	2008	Disuelta en la formación de Activision-Blizzard	On-Line Systems (1979–1982)	\N	2024-05-01 13:20:06.05+02	2024-05-01 13:22:48.175+02	22	sierra.png	https://es.wikipedia.org/wiki/Sierra_Entertainment	ADQUISITION	Fue comprada por Vivendi Games en 2006\nEn la fusión de Vivendi con Activision para formar Activision-Blizzard fue disuelta	\N
28	Origin Systems	us	1983	f	2004	Disuelta por Electronic Arts	\N	\N	2024-05-18 19:40:50.217+02	2024-05-18 19:54:53.241+02	29	Origin_Systems.png	https://es.wikipedia.org/wiki/Origin_Systems	ADQUISITION	Comprada por Electronic Arts en 1992	\N
1	Sega	jp	1960	t	\N	\N	\N	#17569b	2023-12-23 11:49:57.613+01	2024-05-24 14:03:18.615+02	\N	sega.png	\N	\N	\N	t
23	Microsoft	us	1975	t	\N	\N	\N	#7EB900	2024-05-01 11:07:15.752+02	2024-05-24 14:03:41.845+02	\N	microsoft.png	https://es.wikipedia.org/wiki/Microsoft	\N	\N	t
29	Electronic Arts	us	1982	t	\N	\N	\N	#6E34EB	2024-05-18 19:48:21.902+02	2024-05-24 14:03:52.288+02	\N	Electronic_Arts.png	https://es.wikipedia.org/wiki/Electronic_Arts	\N	\N	t
22	Activision Blizzard	us	2008	t	\N	\N	\N	\N	2024-05-01 11:02:06.678+02	2024-05-24 14:04:08.803+02	23	Activision_Blizzard.png	https://es.wikipedia.org/wiki/Activision_Blizzard	ADQUISITION	Adquirida por Microsoft en 2023	t
11	Atari	us	1972	t	\N	\N	Adquirida por Infogrames (ahora Atari SA) en 2009	\N	2024-04-26 10:43:24.491+02	2024-05-30 16:59:45.79+02	12	atari.png	https://es.wikipedia.org/wiki/Atari	ADQUISITION	\N	f
33	Coleco	us	1932	f	1989	Bancarrota	The Connecticut Leather Company	\N	2024-05-26 12:26:44.033+02	2024-05-26 12:26:44.033+02	\N	Coleco.png	https://es.wikipedia.org/wiki/Coleco	\N	\N	\N
35	Gottlieb	us	1927	f	1996	Bancarrota	D. Gottlieb & Co.	\N	2024-05-30 16:36:16.619+02	2024-05-30 16:36:57.777+02	\N	Gottlieb.png	https://es.wikipedia.org/wiki/Gottlieb	\N	Empresa dedicada mayormente a pinball	\N
36	Sony	jp	1946	t	\N	\N	Tokyo Tsushin Kogyo K.K. (1946–1957)	#003087	2024-05-30 16:50:51.947+02	2024-05-30 16:52:10.682+02	\N	sony.png	https://es.wikipedia.org/wiki/Sony	\N	\N	t
21	Activision	us	1979	t	\N	\N	Computer Arts, Inc. (1979)\nActivision, Inc. (1979–1988; 1992–2000)\nMediagenic (1988–1992)	\N	2024-05-01 10:55:09.353+02	2024-05-30 17:02:46.662+02	22	Activision.png	https://es.wikipedia.org/wiki/Activision	MERGE	Fusionada con Vivendi (Blizzard) en 2008	f
\.


--
-- Data for Name: Franchise_Franchises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Franchise_Franchises" (is_main, "createdAt", "updatedAt", parent_id) FROM stdin;
\.


--
-- Data for Name: Franchise_People; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Franchise_People" (is_main_for_person, "createdAt", "updatedAt", "PersonId", "FranchiseId") FROM stdin;
\N	2023-12-31 14:05:45.376+01	2023-12-31 14:05:45.376+01	1	1
\N	2023-12-31 14:05:45.376+01	2023-12-31 14:05:45.376+01	2	1
\N	2024-04-03 15:59:46.25+02	2024-04-03 15:59:46.25+02	3	1
\N	2024-04-28 11:37:03.568+02	2024-04-28 11:37:03.568+02	8	4
\N	2024-04-29 18:08:44.501+02	2024-04-29 18:08:44.501+02	12	5
\N	2024-04-29 18:08:44.501+02	2024-04-29 18:08:44.501+02	11	5
\N	2024-04-30 18:13:04.976+02	2024-04-30 18:13:04.976+02	14	6
\N	2024-05-01 11:30:23.1+02	2024-05-01 11:30:23.1+02	15	7
\N	2024-05-01 11:30:23.1+02	2024-05-01 11:30:23.1+02	16	7
\N	2024-05-01 11:30:23.1+02	2024-05-01 11:30:23.1+02	17	7
\N	2024-05-01 11:30:23.1+02	2024-05-01 11:30:23.1+02	18	7
\N	2024-05-03 08:25:13.574+02	2024-05-03 08:25:13.574+02	22	8
\N	2024-05-12 13:49:59.121+02	2024-05-12 13:49:59.121+02	23	9
\N	2024-05-18 19:59:11.307+02	2024-05-18 19:59:11.307+02	24	10
\N	2024-05-23 19:04:09.02+02	2024-05-23 19:04:09.02+02	26	12
\N	2024-05-24 18:42:05.423+02	2024-05-24 18:42:05.423+02	27	13
\N	2024-05-24 18:47:12.585+02	2024-05-24 18:47:12.585+02	27	14
\N	2024-05-26 13:33:00.401+02	2024-05-26 13:33:00.401+02	28	15
\N	2024-05-30 16:41:30.842+02	2024-05-30 16:41:30.842+02	29	16
\N	2024-05-31 14:20:43.852+02	2024-05-31 14:20:43.852+02	30	17
\N	2024-06-01 13:07:26.96+02	2024-06-01 13:07:26.96+02	23	18
\.


--
-- Data for Name: Franchises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Franchises" (id, name, main_img, first_game_date, color, "createdAt", "updatedAt", "ownerId", company_creator_id, wikipedia, is_main) FROM stdin;
19	E.T. el Extraterrestre	E_T.png	1982-12-02	\N	2024-06-02 11:44:59.664+02	2024-06-02 11:54:36.121+02	37	\N	https://en.wikipedia.org/wiki/E.T._the_Extra-Terrestrial_in_video_games	\N
3	The Oregon Trail	oregon_trail.png	1971-12-03	\N	2024-04-24 23:46:33.614+02	2024-04-24 23:47:00.862+02	\N	6	https://en.wikipedia.org/wiki/The_Oregon_Trail_(series)	\N
5	Asteroids	Asteroids.png	1979-11-01	#170e31	2024-04-29 18:08:17.931+02	2024-04-29 18:08:35.765+02	11	\N	\N	\N
6	Galaxian	Galaxian.png	1979-11-01	#023693	2024-04-30 18:03:31.473+02	2024-04-30 18:12:58.336+02	19	18	https://en.wikipedia.org/wiki/List_of_Galaxian_video_games	\N
7	Zork	zork.jpeg	1980-01-01	\N	2024-05-01 11:29:57.402+02	2024-05-01 11:30:53.489+02	21	20	\N	\N
9	Defender	Defender.png	1981-02-06	\N	2024-05-12 13:49:52.857+02	2024-05-12 13:51:20.941+02	27	\N	\N	\N
10	Ultima	Ultima.png	1981-06-01	\N	2024-05-18 19:58:57.383+02	2024-05-18 20:00:46.613+02	29	28	https://es.wikipedia.org/wiki/Ultima	\N
11	Frogger	frogger.png	1981-06-28	\N	2024-05-22 21:15:11.341+02	2024-05-22 21:19:09.887+02	30	\N	https://en.wikipedia.org/wiki/Frogger_(series)	\N
12	Centipede	centipede.png	1981-08-01	\N	2024-05-23 19:03:45.417+02	2024-05-23 19:04:02.55+02	11	\N	\N	\N
1	Sonic the Hedgehog	sonic_the_hedgehog.png	1991-06-23	#17569b	2023-12-31 13:13:50.45+01	2024-05-24 18:35:40.99+02	1	\N	\N	t
13	Donkey Kong	donkeykong.png	1981-06-09	#663605	2024-05-24 18:40:03.405+02	2024-05-24 18:41:57.159+02	32	\N	https://es.wikipedia.org/wiki/Donkey_Kong_(serie)	t
14	Mario	Mario.png	1983-07-14	#ee1c25	2024-05-24 18:46:53.968+02	2024-05-24 18:47:04.982+02	32	\N	https://es.wikipedia.org/wiki/Mario_(franquicia)	t
8	Pac-Man	pacman.png	1980-05-22	#ed6b0e	2024-05-03 08:23:14.569+02	2024-05-24 18:48:46.425+02	19	18	https://en.wikipedia.org/wiki/List_of_Pac-Man_video_games	t
4	Space Invaders	Space_invaders.png	1978-04-01	#02073f	2024-04-28 11:35:45.283+02	2024-05-24 18:49:00.786+02	14	\N	https://es.wikipedia.org/wiki/Space_Invaders_(serie)	t
15	Joust	joust.png	1982-07-16	\N	2024-05-26 13:31:53.402+02	2024-05-26 13:32:42.205+02	27	\N	\N	\N
16	Q*bert	Qbert.jpeg	1982-10-18	\N	2024-05-30 16:41:09.37+02	2024-05-30 17:04:52.035+02	36	35	\N	\N
17	Pitfall	Pitfall.png	1982-09-20	\N	2024-05-31 14:20:34.79+02	2024-05-31 14:21:27.21+02	21	\N	\N	\N
18	Robotron	Robotron.jpeg	1982-01-01	\N	2024-06-01 13:07:12.47+02	2024-06-01 13:07:33.985+02	27	\N	\N	\N
\.


--
-- Data for Name: Game_Awards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Game_Awards" (result, year, "createdAt", "updatedAt", "GameId", "AwardCategoryId") FROM stdin;
WINNER	1991	2024-02-10 13:32:01.193+01	2024-02-10 13:32:01.193+01	2	1
WINNER	1991	2024-04-22 16:06:58.243+02	2024-04-22 16:06:58.243+02	2	5
WINNER	1992	2024-04-22 16:14:51.555+02	2024-04-22 16:14:51.555+02	4	3
WINNER	1992	2024-04-22 16:15:06.721+02	2024-04-22 16:15:06.721+02	4	4
\.


--
-- Data for Name: Game_Characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Game_Characters" (type, is_main_for_character, "createdAt", "updatedAt", "CharacterId", "GameId") FROM stdin;
PLAYABLE	\N	2024-01-30 17:29:42.12+01	2024-01-30 17:29:42.12+01	1	2
ANTAGONIST	\N	2024-01-30 17:29:45.008+01	2024-01-30 17:29:45.008+01	2	2
PLAYABLE	\N	2024-04-21 12:49:13.786+02	2024-04-21 12:49:13.786+02	1	4
ANTAGONIST	\N	2024-04-21 12:53:57.267+02	2024-04-21 12:53:57.267+02	2	4
PLAYABLE	\N	2024-04-21 12:54:14.016+02	2024-04-21 12:54:14.016+02	3	4
PLAYABLE	\N	2024-05-03 11:32:11.759+02	2024-05-03 11:32:11.759+02	5	20
ANTAGONIST	\N	2024-05-03 11:32:36.223+02	2024-05-03 11:32:36.223+02	6	20
ANTAGONIST	\N	2024-05-03 11:32:36.223+02	2024-05-03 11:32:36.223+02	7	20
ANTAGONIST	\N	2024-05-03 11:32:36.223+02	2024-05-03 11:32:36.223+02	8	20
ANTAGONIST	\N	2024-05-03 11:32:36.223+02	2024-05-03 11:32:36.223+02	9	20
PLAYABLE	\N	2024-05-25 12:25:18.404+02	2024-05-25 12:25:18.404+02	10	26
SECONDARY	\N	2024-05-25 12:25:26.246+02	2024-05-25 12:25:26.246+02	12	26
ANTAGONIST	\N	2024-05-25 12:25:34.869+02	2024-05-25 12:25:34.869+02	11	26
PLAYABLE	\N	2024-05-28 17:39:30.587+02	2024-05-28 17:39:30.587+02	13	28
ANTAGONIST	\N	2024-05-28 17:40:23.401+02	2024-05-28 17:40:23.401+02	6	28
ANTAGONIST	\N	2024-05-28 17:40:23.401+02	2024-05-28 17:40:23.401+02	8	28
ANTAGONIST	\N	2024-05-28 17:40:23.401+02	2024-05-28 17:40:23.401+02	14	28
ANTAGONIST	\N	2024-05-28 17:40:23.401+02	2024-05-28 17:40:23.401+02	7	28
PLAYABLE	\N	2024-05-30 17:23:31.689+02	2024-05-30 17:23:31.689+02	15	29
PLAYABLE	\N	2024-06-02 12:02:44.225+02	2024-06-02 12:02:44.225+02	16	32
PLAYABLE	\N	2024-06-04 17:05:22.18+02	2024-06-04 17:05:22.18+02	17	33
SECONDARY	\N	2024-06-04 17:05:33.656+02	2024-06-04 17:05:33.656+02	11	33
ANTAGONIST	\N	2024-06-04 17:05:50.733+02	2024-06-04 17:05:50.733+02	10	33
PLAYABLE	\N	2024-06-05 17:40:26.356+02	2024-06-05 17:40:26.356+02	10	34
PLAYABLE	\N	2024-06-05 17:40:32.58+02	2024-06-05 17:40:32.58+02	18	34
\.


--
-- Data for Name: Game_Companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Game_Companies" (type, is_main_for_company, country, "createdAt", "updatedAt", "CompanyId", "GameId") FROM stdin;
DEVELOPER	\N	\N	2024-01-21 11:32:30.569+01	2024-01-21 11:32:30.569+01	2	2
PUBLISHER	\N	\N	2024-01-21 11:32:39.018+01	2024-01-21 11:32:39.018+01	1	2
DEVELOPER	\N	\N	2024-04-19 14:08:41.26+02	2024-04-19 14:08:41.26+02	3	4
PUBLISHER	\N	\N	2024-04-19 14:10:16.596+02	2024-04-19 14:10:16.596+02	1	4
DEVELOPER	\N	\N	2024-04-25 00:17:26.642+02	2024-04-25 00:17:26.642+02	6	6
DEVELOPER	\N	\N	2024-04-26 13:26:20.957+02	2024-04-26 13:26:20.957+02	11	7
DEVELOPER	\N	\N	2024-04-27 18:09:25.521+02	2024-04-27 18:09:25.521+02	14	8
PUBLISHER	\N	\N	2024-04-27 18:09:31.783+02	2024-04-27 18:09:31.783+02	17	8
DEVELOPER	\N	\N	2024-04-27 18:48:40.146+02	2024-04-27 18:48:40.146+02	11	9
DEVELOPER	\N	\N	2024-04-28 12:02:16.371+02	2024-04-28 12:02:16.371+02	14	11
PUBLISHER	\N	\N	2024-04-28 12:02:24.406+02	2024-04-28 12:02:24.406+02	17	11
DEVELOPER	\N	\N	2024-04-28 13:22:36.575+02	2024-04-28 13:22:36.575+02	11	12
DEVELOPER	\N	\N	2024-04-29 18:17:45.783+02	2024-04-29 18:17:45.783+02	11	13
DEVELOPER	\N	\N	2024-04-30 18:24:17.081+02	2024-04-30 18:24:17.081+02	18	14
PUBLISHER	\N	\N	2024-04-30 18:24:26.553+02	2024-04-30 18:24:26.553+02	17	14
DEVELOPER	\N	\N	2024-05-01 11:40:10.388+02	2024-05-01 11:40:10.388+02	20	15
DEVELOPER	\N	\N	2024-05-01 11:48:39.91+02	2024-05-01 11:48:39.91+02	20	16
DEVELOPER	\N	\N	2024-05-01 11:54:11.035+02	2024-05-01 11:54:11.035+02	20	17
DEVELOPER	\N	\N	2024-05-01 12:56:34.323+02	2024-05-01 12:56:34.323+02	24	18
DEVELOPER	\N	\N	2024-05-01 20:04:29.419+02	2024-05-01 20:04:29.419+02	25	19
DEVELOPER	\N	\N	2024-05-03 11:31:37.746+02	2024-05-03 11:31:37.746+02	18	20
PUBLISHER	\N	\N	2024-05-03 11:31:56.654+02	2024-05-03 11:31:56.654+02	17	20
DEVELOPER	\N	\N	2024-05-12 14:01:21.279+02	2024-05-12 14:01:21.279+02	27	21
DEVELOPER	\N	\N	2024-05-18 20:09:21.282+02	2024-05-18 20:09:21.282+02	28	22
DEVELOPER	\N	\N	2024-05-19 12:42:14.42+02	2024-05-19 12:42:14.42+02	18	23
PUBLISHER	\N	\N	2024-05-19 12:42:20.089+02	2024-05-19 12:42:20.089+02	17	23
DEVELOPER	\N	\N	2024-05-22 21:38:40.868+02	2024-05-22 21:38:40.868+02	30	24
PUBLISHER	\N	\N	2024-05-22 21:38:46.223+02	2024-05-22 21:38:46.223+02	1	24
DEVELOPER	\N	\N	2024-05-23 19:13:40.059+02	2024-05-23 19:13:40.059+02	11	25
DEVELOPER	\N	\N	2024-05-25 12:24:51.098+02	2024-05-25 12:24:51.098+02	31	26
PUBLISHER	\N	\N	2024-05-25 12:24:57.394+02	2024-05-25 12:24:57.394+02	32	26
DEVELOPER	\N	\N	2024-05-26 13:39:38.267+02	2024-05-26 13:39:38.267+02	27	27
DEVELOPER	\N	\N	2024-05-28 17:39:09.338+02	2024-05-28 17:39:09.338+02	34	28
DEVELOPER	\N	\N	2024-05-28 17:39:09.338+02	2024-05-28 17:39:09.338+02	17	28
DEVELOPER	\N	\N	2024-05-30 17:22:40.534+02	2024-05-30 17:22:40.534+02	35	29
DEVELOPER	\N	\N	2024-05-31 14:31:42.539+02	2024-05-31 14:31:42.539+02	21	30
DEVELOPER	\N	\N	2024-06-01 13:14:20.322+02	2024-06-01 13:14:20.322+02	27	31
DEVELOPER	\N	\N	2024-06-02 12:02:12.401+02	2024-06-02 12:02:12.401+02	11	32
DEVELOPER	\N	\N	2024-06-04 17:04:57.69+02	2024-06-04 17:04:57.69+02	31	33
PUBLISHER	\N	\N	2024-06-04 17:05:04.682+02	2024-06-04 17:05:04.682+02	32	33
DEVELOPER	\N	\N	2024-06-05 17:39:34.549+02	2024-06-05 17:39:34.549+02	31	34
PUBLISHER	\N	\N	2024-06-05 17:39:40.995+02	2024-06-05 17:39:40.995+02	32	34
\.


--
-- Data for Name: Game_Genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Game_Genres" (is_main_for_genre, "createdAt", "updatedAt", "GameId", "GenreId") FROM stdin;
\N	2024-01-19 12:11:54.763+01	2024-01-19 12:11:54.763+01	2	2
\N	2024-04-19 13:20:12.71+02	2024-04-19 13:20:12.71+02	4	2
\N	2024-04-24 16:53:43.327+02	2024-04-24 16:53:43.327+02	5	6
\N	2024-04-24 16:53:43.327+02	2024-04-24 16:53:43.327+02	5	8
\N	2024-04-25 00:16:51.882+02	2024-04-25 00:16:51.882+02	6	12
\N	2024-04-25 00:16:51.882+02	2024-04-25 00:16:51.882+02	6	10
\N	2024-04-26 13:25:50.023+02	2024-04-26 13:25:50.023+02	7	14
\N	2024-04-27 18:08:40.264+02	2024-04-27 18:08:40.264+02	8	15
\N	2024-04-27 18:48:15.529+02	2024-04-27 18:48:15.529+02	9	17
\N	2024-04-27 19:30:39.978+02	2024-04-27 19:30:39.978+02	10	12
\N	2024-04-28 12:01:36.653+02	2024-04-28 12:01:36.653+02	11	8
\N	2024-04-28 13:22:21.344+02	2024-04-28 13:22:21.344+02	12	6
\N	2024-04-29 18:17:13.236+02	2024-04-29 18:17:13.236+02	13	8
\N	2024-04-30 18:23:37.443+02	2024-04-30 18:23:37.443+02	14	8
\N	2024-05-01 11:38:34.812+02	2024-05-01 11:38:34.812+02	15	12
\N	2024-05-01 11:47:55.76+02	2024-05-01 11:47:55.76+02	16	12
\N	2024-05-01 11:53:34.271+02	2024-05-01 11:53:34.271+02	17	12
\N	2024-05-01 12:55:57.769+02	2024-05-01 12:55:57.769+02	18	19
\N	2024-05-01 12:55:57.769+02	2024-05-01 12:55:57.769+02	18	20
\N	2024-05-01 12:55:57.769+02	2024-05-01 12:55:57.769+02	18	21
\N	2024-05-01 20:03:53.63+02	2024-05-01 20:03:53.63+02	19	22
\N	2024-05-01 20:03:53.63+02	2024-05-01 20:03:53.63+02	19	12
\N	2024-05-03 11:30:36.567+02	2024-05-03 11:30:36.567+02	20	23
\N	2024-05-12 14:00:46.501+02	2024-05-12 14:00:46.501+02	21	8
\N	2024-05-18 20:08:52.932+02	2024-05-18 20:08:52.932+02	22	20
\N	2024-05-19 12:33:58.832+02	2024-05-19 12:33:58.832+02	23	8
\N	2024-05-22 21:38:14.373+02	2024-05-22 21:38:14.373+02	24	26
\N	2024-05-23 19:12:55.164+02	2024-05-23 19:12:55.164+02	25	8
\N	2024-05-25 12:24:04.568+02	2024-05-25 12:24:04.568+02	26	2
\N	2024-05-26 13:38:41.441+02	2024-05-26 13:38:41.441+02	27	2
\N	2024-05-28 17:36:17.423+02	2024-05-28 17:36:17.423+02	28	23
\N	2024-05-30 17:19:00.167+02	2024-05-30 17:19:00.167+02	29	27
\N	2024-05-30 17:19:00.167+02	2024-05-30 17:19:00.167+02	29	2
\N	2024-05-31 14:30:50.391+02	2024-05-31 14:30:50.391+02	30	2
\N	2024-06-01 13:13:34.169+02	2024-06-01 13:13:34.169+02	31	8
\N	2024-06-02 12:01:29.122+02	2024-06-02 12:01:29.122+02	32	22
\N	2024-06-04 17:02:29.526+02	2024-06-04 17:02:29.526+02	33	2
\N	2024-06-05 17:38:13.109+02	2024-06-05 17:38:13.109+02	34	2
\.


--
-- Data for Name: Game_People; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Game_People" (is_main_for_person, "createdAt", "updatedAt", "PersonId", "GameId") FROM stdin;
\N	2024-01-19 13:51:29.108+01	2024-01-19 13:51:29.108+01	1	2
\N	2024-04-19 13:34:26.569+02	2024-04-19 13:34:26.569+02	4	4
\N	2024-04-24 16:53:20.006+02	2024-04-24 16:53:20.006+02	6	5
\N	2024-04-26 13:26:12.105+02	2024-04-26 13:26:12.105+02	7	7
\N	2024-04-27 18:08:55.537+02	2024-04-27 18:08:55.537+02	8	8
\N	2024-04-27 18:48:22.317+02	2024-04-27 18:48:22.317+02	9	9
\N	2024-04-27 19:30:47.378+02	2024-04-27 19:30:47.378+02	10	10
\N	2024-04-28 12:01:55.474+02	2024-04-28 12:01:55.474+02	8	11
\N	2024-04-29 18:17:28.246+02	2024-04-29 18:17:28.246+02	11	13
\N	2024-04-29 18:17:28.246+02	2024-04-29 18:17:28.246+02	12	13
\N	2024-04-30 18:23:51.74+02	2024-04-30 18:23:51.74+02	14	14
\N	2024-05-01 11:39:03.906+02	2024-05-01 11:39:03.906+02	15	15
\N	2024-05-01 11:39:03.906+02	2024-05-01 11:39:03.906+02	16	15
\N	2024-05-01 11:39:03.906+02	2024-05-01 11:39:03.906+02	17	15
\N	2024-05-01 11:39:03.906+02	2024-05-01 11:39:03.906+02	18	15
\N	2024-05-01 11:48:24.655+02	2024-05-01 11:48:24.655+02	15	16
\N	2024-05-01 11:48:24.655+02	2024-05-01 11:48:24.655+02	16	16
\N	2024-05-01 11:48:24.655+02	2024-05-01 11:48:24.655+02	17	16
\N	2024-05-01 11:48:24.655+02	2024-05-01 11:48:24.655+02	18	16
\N	2024-05-01 11:53:58.396+02	2024-05-01 11:53:58.396+02	15	17
\N	2024-05-01 11:53:58.396+02	2024-05-01 11:53:58.396+02	16	17
\N	2024-05-01 11:53:58.396+02	2024-05-01 11:53:58.396+02	17	17
\N	2024-05-01 11:53:58.396+02	2024-05-01 11:53:58.396+02	18	17
\N	2024-05-01 12:56:18.521+02	2024-05-01 12:56:18.521+02	19	18
\N	2024-05-01 20:04:14.216+02	2024-05-01 20:04:14.216+02	20	19
\N	2024-05-01 20:04:14.216+02	2024-05-01 20:04:14.216+02	21	19
\N	2024-05-03 11:30:59.887+02	2024-05-03 11:30:59.887+02	22	20
\N	2024-05-12 14:01:00.64+02	2024-05-12 14:01:00.64+02	23	21
\N	2024-05-18 20:09:07.819+02	2024-05-18 20:09:07.819+02	24	22
\N	2024-05-19 12:41:53.619+02	2024-05-19 12:41:53.619+02	25	23
\N	2024-05-23 19:13:08.574+02	2024-05-23 19:13:08.574+02	26	25
\N	2024-05-25 12:24:32.275+02	2024-05-25 12:24:32.275+02	27	26
\N	2024-05-26 13:39:00.826+02	2024-05-26 13:39:00.826+02	28	27
\N	2024-05-30 17:20:01.749+02	2024-05-30 17:20:01.749+02	29	29
\N	2024-05-31 14:30:57.932+02	2024-05-31 14:30:57.932+02	30	30
\N	2024-06-01 13:13:57.081+02	2024-06-01 13:13:57.081+02	23	31
\N	2024-06-02 12:02:04.323+02	2024-06-02 12:02:04.323+02	31	32
\N	2024-06-04 17:02:42.445+02	2024-06-04 17:02:42.445+02	27	33
\N	2024-06-05 17:38:23.886+02	2024-06-05 17:38:23.886+02	27	34
\N	2024-06-05 17:38:31.328+02	2024-06-05 17:38:31.328+02	32	34
\.


--
-- Data for Name: Game_Platforms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Game_Platforms" (is_main_for_platform, "createdAt", "updatedAt", "GameId", "PlatformId") FROM stdin;
\N	2024-01-20 12:23:16.507+01	2024-01-20 12:23:16.507+01	2	2
\N	2024-04-19 14:08:30.122+02	2024-04-19 14:08:30.122+02	4	2
\N	2024-04-24 16:59:14.636+02	2024-04-24 16:59:14.636+02	5	4
\N	2024-04-25 00:18:38.05+02	2024-04-25 00:18:38.05+02	6	4
\N	2024-04-26 13:44:23.116+02	2024-04-26 13:44:23.116+02	7	5
\N	2024-04-27 18:09:04.581+02	2024-04-27 18:09:04.581+02	8	5
\N	2024-04-27 18:09:11.917+02	2024-04-27 18:09:11.917+02	8	7
\N	2024-04-27 18:48:30.051+02	2024-04-27 18:48:30.051+02	9	5
\N	2024-04-27 18:48:30.051+02	2024-04-27 18:48:30.051+02	9	8
\N	2024-04-27 19:30:57.58+02	2024-04-27 19:30:57.58+02	10	4
\N	2024-04-28 12:03:00.616+02	2024-04-28 12:03:00.616+02	11	5
\N	2024-04-28 12:03:00.616+02	2024-04-28 12:03:00.616+02	11	8
\N	2024-04-28 13:22:30.084+02	2024-04-28 13:22:30.084+02	12	5
\N	2024-04-29 18:17:37.916+02	2024-04-29 18:17:37.916+02	13	5
\N	2024-04-29 18:17:37.916+02	2024-04-29 18:17:37.916+02	13	8
\N	2024-04-30 18:24:04.918+02	2024-04-30 18:24:04.918+02	14	5
\N	2024-04-30 18:24:04.918+02	2024-04-30 18:24:04.918+02	14	8
\N	2024-04-30 18:24:04.918+02	2024-04-30 18:24:04.918+02	14	7
\N	2024-05-01 11:39:11.749+02	2024-05-01 11:39:11.749+02	15	4
\N	2024-05-01 11:48:33.567+02	2024-05-01 11:48:33.567+02	16	4
\N	2024-05-01 11:54:04.835+02	2024-05-01 11:54:04.835+02	17	4
\N	2024-05-01 12:56:26.096+02	2024-05-01 12:56:26.096+02	18	4
\N	2024-05-01 20:04:21.28+02	2024-05-01 20:04:21.28+02	19	4
\N	2024-05-03 11:31:12.317+02	2024-05-03 11:31:12.317+02	20	5
\N	2024-05-03 11:31:12.317+02	2024-05-03 11:31:12.317+02	20	8
\N	2024-05-12 14:01:09.587+02	2024-05-12 14:01:09.587+02	21	5
\N	2024-05-12 14:01:09.587+02	2024-05-12 14:01:09.587+02	21	8
\N	2024-05-18 20:09:13.565+02	2024-05-18 20:09:13.565+02	22	4
\N	2024-05-19 12:42:01.394+02	2024-05-19 12:42:01.394+02	23	5
\N	2024-05-22 21:38:29.248+02	2024-05-22 21:38:29.248+02	24	5
\N	2024-05-22 21:38:29.248+02	2024-05-22 21:38:29.248+02	24	8
\N	2024-05-23 19:13:30.158+02	2024-05-23 19:13:30.158+02	25	5
\N	2024-05-23 19:13:30.158+02	2024-05-23 19:13:30.158+02	25	8
\N	2024-05-25 12:24:40.365+02	2024-05-25 12:24:40.365+02	26	5
\N	2024-05-25 12:24:40.365+02	2024-05-25 12:24:40.365+02	26	8
\N	2024-05-26 12:34:07.058+02	2024-05-26 12:34:07.058+02	26	10
\N	2024-05-26 12:44:03.725+02	2024-05-26 12:44:03.725+02	25	11
\N	2024-05-26 12:44:03.725+02	2024-05-26 12:44:03.725+02	25	9
\N	2024-05-26 12:44:03.725+02	2024-05-26 12:44:03.725+02	25	10
\N	2024-05-26 12:45:31.14+02	2024-05-26 12:45:31.14+02	21	11
\N	2024-05-26 12:45:31.14+02	2024-05-26 12:45:31.14+02	21	9
\N	2024-05-26 12:45:31.14+02	2024-05-26 12:45:31.14+02	21	10
\N	2024-05-26 12:49:03.158+02	2024-05-26 12:49:03.158+02	26	9
\N	2024-05-26 12:49:48.079+02	2024-05-26 12:49:48.079+02	24	11
\N	2024-05-26 12:49:48.079+02	2024-05-26 12:49:48.079+02	24	10
\N	2024-05-26 12:49:48.079+02	2024-05-26 12:49:48.079+02	24	9
\N	2024-05-26 12:54:57.82+02	2024-05-26 12:54:57.82+02	14	11
\N	2024-05-26 12:54:57.82+02	2024-05-26 12:54:57.82+02	14	10
\N	2024-05-26 13:01:02.926+02	2024-05-26 13:01:02.926+02	20	9
\N	2024-05-26 13:01:02.926+02	2024-05-26 13:01:02.926+02	20	11
\N	2024-05-26 13:05:46.831+02	2024-05-26 13:05:46.831+02	11	11
\N	2024-05-26 13:39:29.467+02	2024-05-26 13:39:29.467+02	27	5
\N	2024-05-26 13:39:29.467+02	2024-05-26 13:39:29.467+02	27	8
\N	2024-05-26 13:39:29.467+02	2024-05-26 13:39:29.467+02	27	11
\N	2024-05-28 17:38:49.47+02	2024-05-28 17:38:49.47+02	28	5
\N	2024-05-28 17:38:49.47+02	2024-05-28 17:38:49.47+02	28	8
\N	2024-05-28 17:38:49.47+02	2024-05-28 17:38:49.47+02	28	11
\N	2024-05-30 17:22:27.207+02	2024-05-30 17:22:27.207+02	29	5
\N	2024-05-30 17:22:27.207+02	2024-05-30 17:22:27.207+02	29	8
\N	2024-05-30 17:22:27.207+02	2024-05-30 17:22:27.207+02	29	11
\N	2024-05-30 17:22:27.207+02	2024-05-30 17:22:27.207+02	29	9
\N	2024-05-30 17:22:27.207+02	2024-05-30 17:22:27.207+02	29	10
\N	2024-05-31 14:31:09.458+02	2024-05-31 14:31:09.458+02	30	8
\N	2024-05-31 14:31:09.458+02	2024-05-31 14:31:09.458+02	30	11
\N	2024-05-31 14:31:26.924+02	2024-05-31 14:31:26.924+02	30	10
\N	2024-05-31 14:31:26.924+02	2024-05-31 14:31:26.924+02	30	9
\N	2024-06-01 13:14:07.291+02	2024-06-01 13:14:07.291+02	31	5
\N	2024-06-01 13:14:07.291+02	2024-06-01 13:14:07.291+02	31	11
\N	2024-06-02 12:02:19.656+02	2024-06-02 12:02:19.656+02	32	8
\N	2024-06-03 15:44:04.419+02	2024-06-03 15:44:04.419+02	11	12
\N	2024-06-03 17:00:34.891+02	2024-06-03 17:00:34.891+02	14	12
\N	2024-06-03 17:01:12.085+02	2024-06-03 17:01:12.085+02	20	12
\N	2024-06-03 17:01:59.715+02	2024-06-03 17:01:59.715+02	23	12
\N	2024-06-03 17:02:27.611+02	2024-06-03 17:02:27.611+02	26	12
\N	2024-06-03 17:02:53.42+02	2024-06-03 17:02:53.42+02	28	12
\N	2024-06-03 17:03:23.052+02	2024-06-03 17:03:23.052+02	29	12
\N	2024-06-03 17:03:55.446+02	2024-06-03 17:03:55.446+02	27	12
\N	2024-06-04 16:15:46.238+02	2024-06-04 16:15:46.238+02	11	13
\N	2024-06-04 16:16:37.352+02	2024-06-04 16:16:37.352+02	23	13
\N	2024-06-04 17:04:27.871+02	2024-06-04 17:04:27.871+02	33	5
\N	2024-06-04 17:04:27.871+02	2024-06-04 17:04:27.871+02	33	12
\N	2024-06-04 17:04:27.871+02	2024-06-04 17:04:27.871+02	33	8
\N	2024-06-04 17:04:27.871+02	2024-06-04 17:04:27.871+02	33	10
\N	2024-06-04 17:04:27.871+02	2024-06-04 17:04:27.871+02	33	9
\N	2024-06-05 17:39:10.357+02	2024-06-05 17:39:10.357+02	34	5
\N	2024-06-05 17:39:10.357+02	2024-06-05 17:39:10.357+02	34	12
\N	2024-06-05 17:39:10.357+02	2024-06-05 17:39:10.357+02	34	8
\N	2024-06-05 17:39:10.357+02	2024-06-05 17:39:10.357+02	34	11
\.


--
-- Data for Name: Game_Themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Game_Themes" (is_main_for_theme, "createdAt", "updatedAt", "GameId", "ThemeId") FROM stdin;
\N	2024-04-25 00:17:04.073+02	2024-04-25 00:17:04.073+02	6	3
\N	2024-04-27 18:08:46.164+02	2024-04-27 18:08:46.164+02	8	3
\N	2024-04-28 11:04:52.029+02	2024-04-28 11:04:52.029+02	10	5
\N	2024-04-28 12:01:45.592+02	2024-04-28 12:01:45.592+02	11	7
\N	2024-04-30 18:23:43.92+02	2024-04-30 18:23:43.92+02	14	7
\N	2024-05-01 11:38:41.586+02	2024-05-01 11:38:41.586+02	15	5
\N	2024-05-01 11:48:07.585+02	2024-05-01 11:48:07.585+02	16	5
\N	2024-05-01 11:53:40.672+02	2024-05-01 11:53:40.672+02	17	5
\N	2024-05-01 12:56:08.911+02	2024-05-01 12:56:08.911+02	18	5
\N	2024-05-01 20:04:01.725+02	2024-05-01 20:04:01.725+02	19	9
\N	2024-05-03 11:30:50.822+02	2024-05-03 11:30:50.822+02	20	11
\N	2024-05-12 14:00:54.212+02	2024-05-12 14:00:54.212+02	21	7
\N	2024-05-18 20:09:00.962+02	2024-05-18 20:09:00.962+02	22	5
\N	2024-05-19 12:34:05.043+02	2024-05-19 12:34:05.043+02	23	7
\N	2024-05-19 12:40:14.336+02	2024-05-19 12:40:14.336+02	13	12
\N	2024-05-19 12:40:28.334+02	2024-05-19 12:40:28.334+02	21	12
\N	2024-05-19 12:40:41.122+02	2024-05-19 12:40:41.122+02	14	12
\N	2024-05-19 12:40:52.782+02	2024-05-19 12:40:52.782+02	12	12
\N	2024-05-19 12:41:10.926+02	2024-05-19 12:41:10.926+02	11	12
\N	2024-05-19 12:41:23.185+02	2024-05-19 12:41:23.185+02	5	12
\N	2024-05-19 12:41:35.363+02	2024-05-19 12:41:35.363+02	23	12
\N	2024-05-23 19:13:01.873+02	2024-05-23 19:13:01.873+02	25	13
\N	2024-05-28 17:36:24.247+02	2024-05-28 17:36:24.247+02	28	11
\N	2024-06-01 13:13:48.18+02	2024-06-01 13:13:48.18+02	31	15
\N	2024-06-01 13:13:48.18+02	2024-06-01 13:13:48.18+02	31	14
\N	2024-06-02 12:01:51.928+02	2024-06-02 12:01:51.928+02	32	7
\N	2024-06-02 12:01:51.928+02	2024-06-02 12:01:51.928+02	32	17
\.


--
-- Data for Name: Games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Games" (id, name, main_img, logo, back_cover, release_date, score, format, price, num_players, alt_name, owned, personal_status, "createdAt", "updatedAt", "franchiseId", "serieId", color, wikipedia, media) FROM stdin;
5	Spacewar!	spacewar!/cover.png	spacewar!/logo.jpg	spacewar!/back.jpg	1962-01-01	\N	-	\N	2	\N	\N	NOT_PLAYED	2024-04-24 16:52:50.645+02	2024-04-24 16:55:13.325+02	\N	\N	\N	https://es.wikipedia.org/wiki/Spacewar!	https://www.youtube.com/embed/Rmvb4Hktv7U
14	Galaxian	galaxian/galaxian/cover.jpg	galaxian/galaxian/logo.png	galaxian/galaxian/back.jpg	1979-11-01	\N	NTSC	20	1-2	\N	\N	NOT_PLAYED	2024-04-30 18:23:03.915+02	2024-04-30 18:25:21.424+02	6	7	#023693	https://es.wikipedia.org/wiki/Galaxian	https://www.youtube.com/embed/XhYVcwhSWjI
21	Defender	defender/defender/cover.jpg	defender/defender/logo.png	defender/defender/back.jpg	1981-02-06	\N	NTSC	20	1-2	\N	\N	NOT_PLAYED	2024-05-12 13:58:55.068+02	2024-05-12 14:01:31.702+02	9	10	\N	https://es.wikipedia.org/wiki/Defender_(videojuego)	https://www.youtube.com/embed/qq_Zvg9KlII
15	Zork I	zork/zork_I/cover.jpg	zork/zork_I/logo.jpg	zork/zork_I/back.jpeg	1980-01-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-05-01 11:37:46.758+02	2024-05-01 11:40:28.5+02	7	8	\N	https://es.wikipedia.org/wiki/Zork	https://www.youtube.com/embed/PWQDccL0aXM
6	The Oregon Trail	oregon_trail/cover.jpeg	oregon_trail/logo.png	oregon_trail/back.jpeg	1971-12-03	\N	-	\N	1	\N	\N	NOT_PLAYED	2024-04-25 00:16:21.247+02	2024-04-25 15:40:01.055+02	3	4	\N	https://es.wikipedia.org/wiki/Oregon_Trail_(videojuego)	https://www.youtube.com/embed/g8B-JjzbthI
7	Pong	pong/cover.jpeg	pong/logo.jpg	pong/back.png	1972-11-29	\N	-	\N	2	\N	\N	COMPLETED	2024-04-26 13:25:08.872+02	2024-04-26 13:25:08.872+02	\N	\N	#fcd11c	https://es.wikipedia.org/wiki/Pong	https://www.youtube.com/embed/fiShX2pTz9A
8	Gun Fight	gun_fight/cover.jpg	gun_fight/logo.png	gun_fight/back.jpg	1975-11-01	\N	-	\N	2	Western Gun (Japón)	\N	NOT_PLAYED	2024-04-27 18:07:46.398+02	2024-04-27 18:08:06.301+02	\N	\N	\N	https://en.wikipedia.org/wiki/Gun_Fight	https://www.youtube.com/embed/xYa0G6KGayk
9	Breakout	breakout/cover.png	breakout/logo.jpeg	breakout/back.jpg	1976-05-13	\N	-	\N	1-2	\N	\N	COMPLETED	2024-04-27 18:47:46.931+02	2024-04-27 18:48:05.322+02	\N	\N	\N	https://es.wikipedia.org/wiki/Breakout_(videojuego)	https://www.youtube.com/embed/AMUv8KvVt08
2	Sonic the Hedgehog	sonic/sonic_the_hedgehog/cover.jpeg	sonic/sonic_the_hedgehog/logo.png	sonic/sonic_the_hedgehog/back.jpg	1991-07-26	86	PAL-EUR	15	1		t	COMPLETED	2024-01-15 17:09:43.807+01	2024-04-14 12:18:47.076+02	1	1	#17569b	https://es.wikipedia.org/wiki/Sonic_the_Hedgehog_(videojuego_de_1991)	https://www.youtube.com/embed/LMasV2b6OVA
10	Colossal Cave Adventure	colossal_cave_adventure/cover.jpg	colossal_cave_adventure/logo.jpeg	colossal_cave_adventure/back.jpg	1976-01-01	\N	-	\N	1	Adventure	\N	NOT_PLAYED	2024-04-27 19:28:45.604+02	2024-04-27 19:29:06.36+02	\N	\N	\N	https://es.wikipedia.org/wiki/Colossal_Cave_Adventure	https://www.youtube.com/embed/O3etkSoHrR8
11	Space Invaders	space_invaders/space_invaders/cover.jpg	space_invaders/space_invaders/logo.png	space_invaders/space_invaders/back.jpg	1978-04-01	\N	NTSC	20	1	\N	\N	PLAYED	2024-04-28 12:00:56.785+02	2024-04-28 12:30:08.474+02	4	5	#02073f	https://es.wikipedia.org/wiki/Space_Invaders	https://www.youtube.com/embed/uGjgxwiemms
12	Lunar Lander	lunar_lander/cover.jpg	lunar_lander/logo.png	lunar_lander/back.jpeg	1979-08-01	\N	-	\N	1		\N	PLAYED	2024-04-28 13:21:38.947+02	2024-04-28 13:22:04.275+02	\N	\N	\N	https://es.wikipedia.org/wiki/Lunar_Lander	https://www.youtube.com/embed/McAhSoAEbhM
4	Sonic the Hedgehog 2	sonic/sonic_the_hedgehog_2/cover.jpg	sonic/sonic_the_hedgehog_2/logo.png	sonic/sonic_the_hedgehog_2/back.jpg	1992-11-24	94	PAL-EUR	30	1-2	\N	t	PLAYED	2024-04-16 16:34:44.642+02	2024-04-20 14:02:35.148+02	1	1	#17569b	https://es.wikipedia.org/wiki/Sonic_the_Hedgehog_2_(Mega_Drive)	https://www.youtube.com/embed/oR2HjN_GEZ8
16	Zork II	zork/zork_II/cover.jpeg	zork/zork_II/logo.jpeg	zork/zork_II/back.jpg	1981-11-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-05-01 11:47:10.807+02	2024-05-01 11:48:50.353+02	7	8	\N	https://es.wikipedia.org/wiki/Zork	https://www.youtube.com/embed/NiAFTe76iwg
13	Asteroids	asteroids/asteroids/cover.jpg	asteroids/asteroids/logo.png	asteroids/asteroids/back.jpg	1979-11-01	\N	NTSC	15	1-2	\N	\N	PLAYED	2024-04-29 18:16:22.924+02	2024-04-29 18:17:00.792+02	5	6	#170e31	https://es.wikipedia.org/wiki/Asteroids	https://www.youtube.com/embed/9Ydu8UhIjeU
17	Zork III	zork/zork_III/cover.jpg	zork/zork_III/logo.jpeg	zork/zork_III/back.jpeg	1982-01-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-05-01 11:53:16.202+02	2024-05-01 11:54:18.167+02	7	8	\N	https://es.wikipedia.org/wiki/Zork	https://www.youtube.com/embed/pXyq4YrCoAc
18	Rogue	rogue/cover.jpeg	rogue/logo.jpg	rogue/back.jpeg	1980-01-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-05-01 12:55:34.513+02	2024-05-01 12:55:34.513+02	\N	\N	\N	https://es.wikipedia.org/wiki/Rogue	https://www.youtube.com/embed/vxF1osPkplA
19	Mystery House	mystery_house/cover.jpg	mystery_house/logo.jpeg	mystery_house/back.jpg	1980-05-05	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-05-01 20:03:18.912+02	2024-05-01 20:03:18.912+02	\N	\N	\N	https://es.wikipedia.org/wiki/Mystery_House	https://www.youtube.com/embed/kiwHwPvIHBs
22	Ultima I: The First Age of Darkness	ultima/ultima_i/cover.jpg	ultima/ultima_i/logo.jpeg	ultima/ultima_i/back.jpeg	1981-06-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-05-18 20:07:19.23+02	2024-05-18 20:09:29.189+02	10	11	\N	https://es.wikipedia.org/wiki/Ultima_I:_el_primer_a%C3%B1o_de_la_oscuridad	https://www.youtube.com/embed/NrQFzWO4pYo
23	Galaga	galaxian/galaga/cover.png	galaxian/galaga/logo.svg	galaxian/galaga/back.jpeg	1981-09-25	\N	PAL-EUR	150	1-2	\N	\N	NOT_PLAYED	2024-05-19 12:33:10.65+02	2024-05-19 12:42:31.058+02	6	7	\N	https://es.wikipedia.org/wiki/Galaga	https://www.youtube.com/embed/29VVkfuXkVI
24	Frogger	frogger/frogger/cover.jpeg	frogger/frogger/logo.png	frogger/frogger/back.jpg	1981-06-28	\N	NTSC	40	1-2	\N	\N	PLAYED	2024-05-22 21:37:32.483+02	2024-05-22 21:38:54.475+02	11	12	\N	https://es.wikipedia.org/wiki/Frogger	https://www.youtube.com/embed/WNrz9_Fe-Us
25	Centipede	centipede/centipede/cover.jpeg	centipede/centipede/logo.png	centipede/centipede/back.jpeg	1981-08-01	\N	NTSC	15	1-2	\N	\N	NOT_PLAYED	2024-05-23 19:12:30.747+02	2024-05-23 19:13:57.521+02	12	13	\N	https://es.wikipedia.org/wiki/Centipede_(videojuego)	https://www.youtube.com/embed/V7XEmf02zEM
20	Pac-Man	pacman/pacman/cover.jpg	pacman/pacman/logo.png	pacman/pacman/back.jpg	1980-12-01	\N	NTSC	20	1	Puck-man (Japón)	\N	PLAYED	2024-05-03 11:26:36.598+02	2024-05-26 12:57:11.498+02	8	9	#ed6b0e	https://es.wikipedia.org/wiki/Pac-Man	https://www.youtube.com/embed/dScq4P5gn4A
26	Donkey Kong	donkey_kong/donkey_kong/cover.jpeg	donkey_kong/donkey_kong/logo.png	donkey_kong/donkey_kong/back.jpg	1981-07-09	\N	PAL-EUR	25	1-2	\N	\N	PLAYED	2024-05-25 12:23:19.891+02	2024-05-25 12:25:07.818+02	13	14	#663605	https://es.wikipedia.org/wiki/Donkey_Kong_(videojuego)	https://www.youtube.com/embed/UBHJhla8TO4
27	Joust	joust/joust/cover.jpeg	joust/joust/logo.png	joust/joust/back.jpeg	1982-07-16	\N	PAL-EUR	25	1-2	\N	\N	NOT_PLAYED	2024-05-26 13:38:24.975+02	2024-05-26 13:39:52.322+02	15	15	\N	https://es.wikipedia.org/wiki/Joust	https://www.youtube.com/embed/BWoiLNri0OM
28	Ms. Pac-Man	pacman/ms-pacman/cover.jpg	pacman/ms-pacman/logo.png	pacman/ms-pacman/back.jpg	1982-02-01	\N	PAL-EUR	25	1-2	\N	\N	NOT_PLAYED	2024-05-28 17:35:57.266+02	2024-05-28 17:39:21.027+02	8	9	#ed6b0e	https://es.wikipedia.org/wiki/Ms._Pac-Man	https://www.youtube.com/embed/HQv0zAXDCo8
29	Q*bert	qbert/qbert/cover.jpeg	qbert/qbert/logo.jpeg	qbert/qbert/back.jpeg	1982-10-18	\N	PAL-EUR	30	1-2	\N	\N	NOT_PLAYED	2024-05-30 17:18:00.018+02	2024-05-30 17:23:19.659+02	16	16	\N	https://es.wikipedia.org/wiki/Q*bert	https://www.youtube.com/embed/HKIbhaQfs-A
30	Pitfall!	pitfall/pitfall/cover.jpeg	pitfall/pitfall/logo.png	pitfall/pitfall/back.jpeg	1982-09-20	\N	PAL-EUR	65	1	\N	\N	PLAYED	2024-05-31 14:30:35.242+02	2024-05-31 14:32:15.317+02	17	17	\N	https://es.wikipedia.org/wiki/Pitfall!	https://www.youtube.com/embed/pslbO6Fddhw
31	Robotron: 2084	robotron/robotron2084/cover.jpeg	robotron/robotron2084/logo.jpeg	robotron/robotron2084/back.jpeg	1982-01-01	\N	PAL-EUR	80	1-2	\N	\N	NOT_PLAYED	2024-06-01 13:13:20.346+02	2024-06-01 13:14:30.563+02	18	18	\N	https://es.wikipedia.org/wiki/Robotron:_2084	https://www.youtube.com/embed/l800GL6NQPY
32	E.T. the Extra-Terrestrial	et/et_the_extraterrestrial/cover.jpeg	et/et_the_extraterrestrial/logo.png	et/et_the_extraterrestrial/back.jpeg	1982-12-02	\N	NTSC	35	1	\N	\N	NOT_PLAYED	2024-06-02 12:01:05.699+02	2024-06-02 12:02:34.159+02	19	19	\N	https://es.wikipedia.org/wiki/E.T._the_Extra-Terrestrial_(videojuego)	https://www.youtube.com/embed/QmrQkQsM9FU
33	Donkey Kong Jr.	donkey_kong/donkey_kong_jr/cover.jpeg	donkey_kong/donkey_kong_jr/logo.jpeg	donkey_kong/donkey_kong_jr/back.jpeg	1982-06-30	\N	PAL-EUR	150	1-2	\N	\N	NOT_PLAYED	2024-06-04 17:00:43.618+02	2024-06-04 17:05:11.19+02	13	14	#663605	https://es.wikipedia.org/wiki/Donkey_Kong_Jr.	https://www.youtube.com/embed/2vL5aw6v8QI
34	Mario Bros.	mario/mario_bros/cover.jpeg	mario/mario_bros/logo.png	mario/mario_bros/back.jpeg	1983-07-14	\N	PAL-ES	150	1-2	\N	\N	NOT_PLAYED	2024-06-05 17:37:47.833+02	2024-06-05 17:40:16.936+02	14	20	#ee1c25	https://es.wikipedia.org/wiki/Mario_Bros.	https://www.youtube.com/embed/WFptXdODy7k
\.


--
-- Data for Name: Genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Genres" (id, name, main_img, "createdAt", "updatedAt", "parentId", is_main) FROM stdin;
2	Plataformas 2D	platforms/2d.jpg	2024-01-07 13:39:53.178+01	2024-04-10 16:16:38.262+02	1	\N
1	Plataformas	platforms/2d.jpg	2024-01-07 12:24:08.937+01	2024-04-10 16:16:47.321+02	\N	\N
4	Simulador de vehículos	vehicle-sim/airplane-sim.jpeg	2024-04-23 21:20:04.834+02	2024-04-23 21:20:04.834+02	\N	\N
5	Simulador de aviones	vehicle-sim/airplane-sim.jpeg	2024-04-23 21:27:25.851+02	2024-04-23 21:27:25.851+02	4	\N
6	Simulador de naves	vehicle-sim/space-sim.png	2024-04-23 21:34:25.986+02	2024-04-23 21:34:25.986+02	4	\N
7	Shooter	shooter/fps.png	2024-04-24 16:38:29.986+02	2024-04-24 16:38:29.986+02	\N	\N
8	Shoot 'em up	shooter/shootemup.jpg	2024-04-24 16:42:12.173+02	2024-04-24 16:42:12.173+02	7	\N
9	Educativo	educative/scholar.jpg	2024-04-24 23:57:39.16+02	2024-04-24 23:57:39.16+02	\N	\N
10	Escolar	educative/scholar.jpg	2024-04-24 23:59:01.518+02	2024-04-24 23:59:01.518+02	9	\N
11	Aventuras	adventure/adventure.jpg	2024-04-25 00:07:53.562+02	2024-04-25 00:07:53.562+02	\N	\N
12	Aventura de texto	adventure/textadv.jpeg	2024-04-25 00:09:02.387+02	2024-04-25 00:09:02.387+02	11	\N
13	Deportes	sports/sports.jpg	2024-04-26 13:06:53.214+02	2024-04-26 13:07:10.559+02	\N	\N
14	Ping pong	sports/pingpong.jpeg	2024-04-26 13:10:11.054+02	2024-04-26 13:10:11.054+02	13	\N
15	Shooter Multidireccional 2D	shooter/shoot2d.jpg	2024-04-27 17:57:27.051+02	2024-04-27 17:57:27.051+02	7	\N
16	Arcade	arcade/blockbreaker.jpg	2024-04-27 18:38:24.634+02	2024-04-27 18:38:24.634+02	\N	\N
17	Rompebloques	arcade/blockbreaker.jpg	2024-04-27 18:38:43.515+02	2024-04-27 18:38:55.375+02	16	\N
18	RPG	rpg/western.jpg	2024-05-01 12:28:16.613+02	2024-05-01 12:28:16.613+02	\N	\N
19	Roguelike	rpg/roguelike.png	2024-05-01 12:29:59.082+02	2024-05-01 12:29:59.082+02	18	\N
21	Dungeon crawler	rpg/dungeoncrawler.jpg	2024-05-01 12:49:32.363+02	2024-05-01 12:49:32.363+02	18	\N
20	Rol occidental	rpg/western.jpg	2024-05-01 12:34:23.514+02	2024-05-01 12:50:04.381+02	18	\N
22	Aventura gráfica	adventure/graphicadv.jpg	2024-05-01 13:39:49.209+02	2024-05-01 13:39:49.209+02	11	\N
23	Laberinto	arcade/maze.jpg	2024-05-02 16:26:49.439+02	2024-05-02 16:27:02.068+02	16	\N
24	Acción	action/Beatemup.jpg	2024-05-19 12:55:25.377+02	2024-05-19 12:55:25.377+02	\N	\N
25	Beat 'em up	action/Beatemup.jpg	2024-05-19 12:56:11.583+02	2024-05-19 12:56:11.583+02	24	\N
26	Obstaculos	action/obstacles.jpg	2024-05-19 12:58:31.112+02	2024-05-19 12:58:31.112+02	24	\N
27	Puzzle	arcade/puzzle.jpeg	2024-05-30 16:16:26.92+02	2024-05-30 16:16:40.179+02	16	\N
\.


--
-- Data for Name: People; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."People" (id, name, main_img, "createdAt", "updatedAt", nationality, birthday, wikipedia, is_main) FROM stdin;
4	Masaharu Yoshii	Masaharu_Yoshii.png	2024-03-29 13:32:09.931+01	2024-03-29 13:54:31.505+01	jp	1948-04-01	\N	\N
2	Naoto Ōshima	Naoto_Ohshima.jpeg	2023-12-29 18:25:18.962+01	2024-03-30 13:03:32.329+01	jp	1964-02-26	https://es.wikipedia.org/wiki/Naoto_%C5%8Cshima	\N
3	Hirokazu Yasuhara	Hirokazu_Yasuhara.jpeg	2023-12-29 18:27:49.063+01	2024-03-30 13:04:10.415+01	jp	1965-10-12	https://es.wikipedia.org/wiki/Hirokazu_Yasuhara	\N
6	Stephen Russell	Stephen_Russell.jpeg	2024-04-23 20:58:47.549+02	2024-04-23 20:58:47.549+02	us	1937-05-12	https://es.wikipedia.org/wiki/Steve_Russell	\N
7	Allan Alcorn	Al_Alcorn.jpg	2024-04-26 10:26:27.527+02	2024-04-26 10:26:27.527+02	us	1948-01-01	https://es.wikipedia.org/wiki/Allan_Alcorn	\N
10	Will Crowther	Will_Crowther.jpeg	2024-04-27 19:02:35.416+02	2024-04-27 19:02:35.416+02	us	1936-01-01	https://es.wikipedia.org/wiki/William_Crowther	\N
11	Lyle Rains	lyle-rains.jpeg	2024-04-29 18:04:23.511+02	2024-04-29 18:04:23.511+02	us	1948-01-01	https://en.wikipedia.org/wiki/Lyle_Rains	\N
12	Ed Logg	Ed_Logg.jpg	2024-04-29 18:05:50.729+02	2024-04-29 18:05:50.729+02	us	1948-01-01	https://en.wikipedia.org/wiki/Ed_Logg	\N
14	Kazunori Sawano	person.png	2024-04-30 18:12:44.102+02	2024-04-30 18:12:44.102+02	jp	1940-01-01	\N	\N
15	Tim Anderson	person.png	2024-05-01 10:39:22.315+02	2024-05-01 10:39:22.315+02	us	1954-02-01	https://en.wikipedia.org/wiki/Tim_Anderson_(programmer)	\N
16	Marc Blank	marc_blank.jpg	2024-05-01 10:42:11.623+02	2024-05-01 10:42:11.623+02	us	1956-01-01	https://en.wikipedia.org/wiki/Marc_Blank	\N
17	Dave Lebling	Dave_Lebling.jpg	2024-05-01 10:43:40.733+02	2024-05-01 10:43:40.733+02	us	1949-10-30	https://en.wikipedia.org/wiki/Dave_Lebling	\N
18	Bruce Daniels	Bruce_Daniels.jpg	2024-05-01 10:45:44.049+02	2024-05-01 10:45:44.049+02	us	1950-01-01	https://en.wikipedia.org/wiki/Bruce_Daniels	\N
19	Glenn Wichman	person.png	2024-05-01 12:35:35.389+02	2024-05-01 12:35:35.389+02	us	1960-01-01	https://en.wikipedia.org/wiki/Glenn_Wichman	\N
20	Roberta Williams	Roberta_Williams.jpeg	2024-05-01 19:56:21.887+02	2024-05-01 19:56:21.887+02	us	1953-02-16	https://es.wikipedia.org/wiki/Roberta_Williams	\N
21	Ken Williams	Ken_Williams.jpg	2024-05-01 19:57:54.675+02	2024-05-01 19:57:54.675+02	us	1954-10-30	https://es.wikipedia.org/wiki/Ken_Williams	\N
23	Eugene Jarvis	Eugene_Jarvis.jpg	2024-05-12 13:34:24.151+02	2024-05-12 13:34:24.151+02	us	1955-01-01	https://es.wikipedia.org/wiki/Eugene_Jarvis	\N
24	Richard Garriott	Richard_Garriott.jpeg	2024-05-18 19:34:43.522+02	2024-05-18 19:34:55.742+02	gb	1962-07-04	https://es.wikipedia.org/wiki/Richard_Garriott	\N
25	Shigeru Yokoyama	Shigeru_Yokoyama.jpeg	2024-05-19 12:22:39.154+02	2024-05-19 12:22:39.154+02	jp	1940-01-01	\N	\N
26	Dona Bailey	Dona_Bailey.jpg	2024-05-23 18:54:29.679+02	2024-05-23 18:54:29.679+02	us	1955-01-01	https://es.wikipedia.org/wiki/Dona_Bailey	\N
27	Shigeru Miyamoto	Shigeru_Miyamoto.jpeg	2024-05-24 13:14:25.989+02	2024-05-24 13:32:07.447+02	jp	1952-11-16	https://es.wikipedia.org/wiki/Shigeru_Miyamoto	t
8	Tomohiro Nishikado	Tomohiro-nishikado.jpg	2024-04-27 13:07:06.967+02	2024-05-24 13:32:58.228+02	jp	1944-03-31	https://es.wikipedia.org/wiki/Toshihiro_Nishikado	t
9	Nolan Bushnell	Nolan_Bushnell.jpeg	2024-04-27 18:32:03.513+02	2024-05-24 13:34:04.577+02	us	1943-02-05	https://es.wikipedia.org/wiki/Nolan_Bushnell	t
22	Tōru Iwatani	Toru_Iwatani.png	2024-05-02 16:21:33.668+02	2024-05-24 13:34:20.153+02	jp	1955-01-25	https://es.wikipedia.org/wiki/T%C5%8Dru_Iwatani	t
1	Yūji Naka	Yuji_Naka.jpeg	2023-12-29 17:09:32.911+01	2024-05-24 13:34:39.254+02	jp	1965-09-17	https://es.wikipedia.org/wiki/Y%C5%ABji_Naka	t
28	John Newcomer	person.png	2024-05-26 13:29:39.47+02	2024-05-26 13:29:39.47+02	us	1954-01-01	https://en.wikipedia.org/wiki/John_Newcomer	\N
29	Warren Davis	Warren_Davis.jpg	2024-05-30 16:20:42.058+02	2024-05-30 16:20:42.058+02	us	1952-01-01	https://es.wikipedia.org/wiki/Warren_Davis_(actor)	\N
30	David Crane	David_Crane.jpeg	2024-05-31 14:04:28.792+02	2024-05-31 14:04:38.43+02	us	1953-01-01	https://es.wikipedia.org/wiki/David_Crane_(programador)	\N
31	Howard Scott Warshaw	Howard_Scott_Warshaw.jpeg	2024-06-02 11:20:52.681+02	2024-06-02 11:20:58.377+02	us	1957-09-30	https://es.wikipedia.org/wiki/Howard_Scott_Warshaw	\N
32	Gunpei Yokoi	Gunpei_Yokoi.jpg	2024-06-04 16:33:36.603+02	2024-06-04 16:33:36.603+02	jp	1941-09-10	https://es.wikipedia.org/wiki/Gunpei_Yokoi	t
\.


--
-- Data for Name: PlatformModels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PlatformModels" (id, name, main_img, release_date, comments, "createdAt", "updatedAt", platform_family_id) FROM stdin;
1	Mega Drive EU	sega/megadrive/platform_img.jpeg	1990-09-01	\N	2023-12-29 17:51:23+01	2024-04-06 13:21:02.351+02	2
3	Mega Drive II EU	sega/megadrive/SegaMegadrive2EU.jpg	1993-01-01	\N	2024-04-06 13:24:23.5+02	2024-04-06 13:24:23.5+02	2
4	Intellivision II	intellivision/Intellivision-II.jpeg	1983-03-01	\N	2024-05-26 11:34:34.536+02	2024-05-26 11:35:36.278+02	9
5	Atari 2800	atari/2600/Atari-2800.jpeg	1983-10-01	\N	2024-05-26 12:16:13.086+02	2024-05-26 12:16:13.086+02	8
6	Atari 2600 Jr	atari/2600/Atari-2600-Jr.jpeg	1986-01-01	\N	2024-05-26 12:17:34.631+02	2024-05-26 12:17:34.631+02	8
7	Famicom	nintendo/nes/famicom.jpeg	1983-07-15	\N	2024-06-03 16:56:53.888+02	2024-06-03 16:56:53.888+02	12
8	New-Style NES	nintendo/nes/new-style-nes.jpeg	1993-01-01	\N	2024-06-03 16:59:00.631+02	2024-06-03 16:59:17.106+02	12
9	New Famicom	nintendo/nes/new-famicom.jpeg	1993-01-01	\N	2024-06-03 17:05:30.55+02	2024-06-03 17:05:30.55+02	12
10	SG-1000 II	sega/sg-1000/sg-1000-II.jpg	1984-07-31	\N	2024-06-04 16:15:03.51+02	2024-06-04 16:15:03.51+02	13
\.


--
-- Data for Name: Platforms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Platforms" (id, name, mini_logo, img, release_date, gen, specs, type, alt_names, color, "createdAt", "updatedAt", "manufacturerId", main_img, wikipedia, is_main) FROM stdin;
12	NES	nintendo/nes/logo.png	nintendo/nes/platform-img.png	1983-07-15	3	8 bits\nCartuchos	desktop	Famicom (Japón)	#8c8694	2024-06-03 15:43:07.073+02	2024-06-03 15:43:31.343+02	32	nintendo/nes/logo.png	https://es.wikipedia.org/wiki/Nintendo_Entertainment_System	t
13	SG-1000	sega/sg-1000/logo.png	sega/sg-1000/platform-img.png	1983-07-15	3	8 bits\nCartucho	desktop	\N	\N	2024-06-04 16:13:06.461+02	2024-06-04 16:13:34.925+02	1	sega/sg-1000/logo.png	https://es.wikipedia.org/wiki/SG-1000	\N
4	PC	pc/mini_logo.jpg	pc/platform_img.jpg	1970-01-01	1	\N	hybrid	\N	\N	2024-04-23 16:20:38.458+02	2024-04-23 16:20:38.458+02	\N	pc/logo.png	https://es.wikipedia.org/wiki/Computadora	\N
5	Arcade	arcade/games-icon.png	arcade/main-img.jpg	1971-09-01	1	\N	desktop	\N	\N	2024-04-23 16:31:18.883+02	2024-04-23 16:33:41.146+02	\N	arcade/logo.jpg	https://es.wikipedia.org/wiki/Arcade	\N
6	Magnavox Odyssey	magnavox/odyssey/mini-logo.jpeg	magnavox/odyssey/platform-img.png	1972-09-01	1	Cartuchos	desktop	\N	\N	2024-04-25 16:11:12.816+02	2024-04-25 16:11:24.412+02	9	magnavox/odyssey/logo.png	https://es.wikipedia.org/wiki/Magnavox_Odyssey	\N
7	Bally Astrocade	astrocade/mini-logo.jpg	astrocade/platform-img.jpg	1978-04-01	2	Cartuchos	desktop	Astrovision	\N	2024-04-27 14:06:57.88+02	2024-04-27 14:07:48.841+02	16	astrocade/logo.png	https://es.wikipedia.org/wiki/Bally_Astrocade	\N
8	Atari 2600	atari/2600/mini-logo.png	atari/2600/platform-img.jpg	1977-09-11	2	Cartucho\n8 bits	desktop	Atari VCS	\N	2024-04-27 18:24:15.824+02	2024-04-27 18:52:42.275+02	11	atari/2600/logo.png	https://es.wikipedia.org/wiki/Atari_2600	\N
9	Intellivision	intellivision/minilogo.jpg	intellivision/platform_img.jpg	1979-01-01	2	8 bits	desktop	\N	\N	2024-05-26 11:32:48.235+02	2024-05-26 11:32:57.212+02	8	intellivision/logo.png	https://es.wikipedia.org/wiki/Intellivision	\N
2	Mega Drive	sega/megadrive/mini_logo.png	sega/megadrive/platform_img.jpeg	1988-10-29	4	16bits\nCartuchos	desktop	Genesis (América)	#4d4d4d	2023-12-24 13:36:13.927+01	2024-05-26 12:11:55.229+02	1	sega/megadrive/logo.png	https://es.wikipedia.org/wiki/Mega_Drive	t
10	ColecoVision	colecovision/minilogo.jpeg	colecovision/platform-img.jpeg	1982-08-01	2	8 bits\nCartucho	desktop	\N	\N	2024-05-26 12:33:05.034+02	2024-05-26 12:33:37.596+02	33	colecovision/logo.png	https://es.wikipedia.org/wiki/ColecoVision	\N
11	Atari 5200	atari/5200/minilogo.jpeg	atari/5200/platform-img.jpeg	1982-11-01	2	8 bits\nCartuchos	desktop	\N	\N	2024-05-26 12:41:37.671+02	2024-05-26 12:41:37.671+02	\N	atari/5200/logo.png	https://es.wikipedia.org/wiki/Atari_5200	\N
\.


--
-- Data for Name: Series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Series" (id, name, is_main, "createdAt", "updatedAt", franchise_id) FROM stdin;
3	sonic rush	\N	2024-04-12 09:36:39.35+02	2024-04-12 09:36:39.35+02	1
1	Genesis	t	2024-01-01 14:17:45.219+01	2024-04-13 13:28:00.919+02	1
4	Principal	t	2024-04-25 00:18:04.035+02	2024-04-25 00:18:04.035+02	3
5	Principal	t	2024-04-28 11:37:13.964+02	2024-04-28 11:37:13.964+02	4
6	Principal	t	2024-04-29 18:08:54.23+02	2024-04-29 18:08:54.23+02	5
7	Principal	t	2024-04-30 18:25:02.065+02	2024-04-30 18:25:02.065+02	6
8	Principal	t	2024-05-01 11:30:39.378+02	2024-05-01 11:30:39.378+02	7
9	Arcade	t	2024-05-03 08:27:01.148+02	2024-05-03 08:27:01.148+02	8
10	Principal	t	2024-05-12 13:50:29.75+02	2024-05-12 13:50:29.75+02	9
11	Principal	t	2024-05-18 19:59:18.748+02	2024-05-18 19:59:18.748+02	10
12	Arcade	t	2024-05-22 21:19:02.006+02	2024-05-22 21:19:02.006+02	11
13	Principal	t	2024-05-23 19:04:17.681+02	2024-05-23 19:04:17.681+02	12
14	Arcade	t	2024-05-24 18:42:15.829+02	2024-05-24 18:42:15.829+02	13
15	Principal	t	2024-05-26 13:33:07.627+02	2024-05-26 13:33:07.627+02	15
16	Principal	t	2024-05-30 17:23:02.202+02	2024-05-30 17:23:02.202+02	16
17	Principal	t	2024-05-31 14:32:03.389+02	2024-05-31 14:32:03.389+02	17
18	Principal	t	2024-06-01 13:07:41.052+02	2024-06-01 13:07:41.052+02	18
19	Principal	t	2024-06-02 11:45:09.267+02	2024-06-02 11:45:09.267+02	19
20	Arcade	\N	2024-06-05 17:04:33.958+02	2024-06-05 17:04:33.958+02	14
\.


--
-- Data for Name: Themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Themes" (id, name, main_img, "createdAt", "updatedAt", "parentId", is_main) FROM stdin;
1	Histórico	historical/historical.jpg	2024-01-07 13:36:15.63+01	2024-01-07 13:36:15.63+01	\N	\N
3	Western	historical/western.jpeg	2024-04-24 23:52:01.544+02	2024-04-24 23:52:01.544+02	1	\N
4	Fantasía	fantasy/epic.png	2024-04-28 11:03:50.897+02	2024-04-28 11:04:03.359+02	\N	\N
5	Fantasía épica	fantasy/epic.png	2024-04-28 11:04:35.493+02	2024-04-28 11:04:35.493+02	4	\N
6	Ciencia ficción	scifi/alien.jpg	2024-04-28 11:56:09.375+02	2024-04-28 11:56:09.375+02	\N	\N
7	Alien	scifi/alien.jpg	2024-04-28 11:56:29.664+02	2024-04-28 11:56:29.664+02	6	\N
8	Crimen	crime/detective.jpg	2024-05-01 19:53:23.004+02	2024-05-01 19:53:23.004+02	\N	\N
9	Detectivesca	crime/detective.jpg	2024-05-01 19:54:16.961+02	2024-05-01 19:54:16.961+02	8	\N
10	Criaturas	creatures/ghost.jpeg	2024-05-02 16:34:06.711+02	2024-05-02 16:34:06.711+02	\N	\N
11	Fantasmas	creatures/ghost.jpeg	2024-05-02 16:34:19.409+02	2024-05-02 16:34:19.409+02	10	\N
12	Espacio	scifi/space.png	2024-05-19 12:39:52.025+02	2024-05-19 12:40:01.956+02	6	\N
13	Insectos	creatures/bugs.jpg	2024-05-23 18:59:25.625+02	2024-05-23 18:59:25.625+02	10	\N
14	Robots	creatures/robot.jpg	2024-06-01 12:50:53.035+02	2024-06-01 12:50:53.035+02	10	\N
15	Distopía	scifi/Dystopia.png	2024-06-01 12:52:53.152+02	2024-06-01 12:52:53.152+02	6	\N
16	Adaptación	adaptation/movie.jpeg	2024-06-02 11:26:27.89+02	2024-06-02 11:26:27.89+02	\N	\N
17	Basado en película	adaptation/movie.jpeg	2024-06-02 11:27:38.483+02	2024-06-02 11:27:38.483+02	16	\N
\.


--
-- Name: AwardCategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AwardCategories_id_seq"', 5, true);


--
-- Name: Awards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Awards_id_seq"', 5, true);


--
-- Name: Characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Characters_id_seq"', 18, true);


--
-- Name: Companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Companies_id_seq"', 37, true);


--
-- Name: Franchises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Franchises_id_seq"', 19, true);


--
-- Name: Games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Games_id_seq"', 34, true);


--
-- Name: Genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Genres_id_seq"', 27, true);


--
-- Name: People_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."People_id_seq"', 32, true);


--
-- Name: PlatformModels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PlatformModels_id_seq"', 10, true);


--
-- Name: Platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Platforms_id_seq"', 13, true);


--
-- Name: Series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Series_id_seq"', 20, true);


--
-- Name: Themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Themes_id_seq"', 17, true);


--
-- Name: AwardCategories AwardCategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AwardCategories"
    ADD CONSTRAINT "AwardCategories_pkey" PRIMARY KEY (id);


--
-- Name: Awards Awards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Awards"
    ADD CONSTRAINT "Awards_pkey" PRIMARY KEY (id);


--
-- Name: Character_People Character_People_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Character_People"
    ADD CONSTRAINT "Character_People_pkey" PRIMARY KEY ("PersonId", "CharacterId");


--
-- Name: Characters Characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Characters"
    ADD CONSTRAINT "Characters_pkey" PRIMARY KEY (id);


--
-- Name: Companies Companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Companies"
    ADD CONSTRAINT "Companies_pkey" PRIMARY KEY (id);


--
-- Name: Franchise_Franchises Franchise_Franchises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Franchise_Franchises"
    ADD CONSTRAINT "Franchise_Franchises_pkey" PRIMARY KEY (parent_id);


--
-- Name: Franchise_People Franchise_People_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Franchise_People"
    ADD CONSTRAINT "Franchise_People_pkey" PRIMARY KEY ("PersonId", "FranchiseId");


--
-- Name: Franchises Franchises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Franchises"
    ADD CONSTRAINT "Franchises_pkey" PRIMARY KEY (id);


--
-- Name: Game_Awards Game_Awards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Awards"
    ADD CONSTRAINT "Game_Awards_pkey" PRIMARY KEY ("GameId", "AwardCategoryId");


--
-- Name: Game_Characters Game_Characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Characters"
    ADD CONSTRAINT "Game_Characters_pkey" PRIMARY KEY ("CharacterId", "GameId");


--
-- Name: Game_Companies Game_Companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Companies"
    ADD CONSTRAINT "Game_Companies_pkey" PRIMARY KEY ("CompanyId", "GameId");


--
-- Name: Game_Genres Game_Genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Genres"
    ADD CONSTRAINT "Game_Genres_pkey" PRIMARY KEY ("GameId", "GenreId");


--
-- Name: Game_People Game_People_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_People"
    ADD CONSTRAINT "Game_People_pkey" PRIMARY KEY ("PersonId", "GameId");


--
-- Name: Game_Platforms Game_Platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Platforms"
    ADD CONSTRAINT "Game_Platforms_pkey" PRIMARY KEY ("GameId", "PlatformId");


--
-- Name: Game_Themes Game_Themes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Themes"
    ADD CONSTRAINT "Game_Themes_pkey" PRIMARY KEY ("GameId", "ThemeId");


--
-- Name: Games Games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Games"
    ADD CONSTRAINT "Games_pkey" PRIMARY KEY (id);


--
-- Name: Genres Genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Genres"
    ADD CONSTRAINT "Genres_pkey" PRIMARY KEY (id);


--
-- Name: People People_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."People"
    ADD CONSTRAINT "People_pkey" PRIMARY KEY (id);


--
-- Name: PlatformModels PlatformModels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PlatformModels"
    ADD CONSTRAINT "PlatformModels_pkey" PRIMARY KEY (id);


--
-- Name: Platforms Platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Platforms"
    ADD CONSTRAINT "Platforms_pkey" PRIMARY KEY (id);


--
-- Name: Series Series_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Series"
    ADD CONSTRAINT "Series_pkey" PRIMARY KEY (id);


--
-- Name: Themes Themes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Themes"
    ADD CONSTRAINT "Themes_pkey" PRIMARY KEY (id);


--
-- Name: AwardCategories AwardCategories_award_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AwardCategories"
    ADD CONSTRAINT "AwardCategories_award_category_id_fkey" FOREIGN KEY (award_category_id) REFERENCES public."Awards"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Character_People Character_People_CharacterId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Character_People"
    ADD CONSTRAINT "Character_People_CharacterId_fkey" FOREIGN KEY ("CharacterId") REFERENCES public."Characters"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Character_People Character_People_PersonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Character_People"
    ADD CONSTRAINT "Character_People_PersonId_fkey" FOREIGN KEY ("PersonId") REFERENCES public."People"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Characters Characters_franchise_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Characters"
    ADD CONSTRAINT "Characters_franchise_id_fkey" FOREIGN KEY (franchise_id) REFERENCES public."Franchises"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Companies Companies_ownerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Companies"
    ADD CONSTRAINT "Companies_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Franchise_Franchises Franchise_Franchises_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Franchise_Franchises"
    ADD CONSTRAINT "Franchise_Franchises_parent_id_fkey" FOREIGN KEY (parent_id) REFERENCES public."Franchises"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Franchise_People Franchise_People_FranchiseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Franchise_People"
    ADD CONSTRAINT "Franchise_People_FranchiseId_fkey" FOREIGN KEY ("FranchiseId") REFERENCES public."Franchises"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Franchise_People Franchise_People_PersonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Franchise_People"
    ADD CONSTRAINT "Franchise_People_PersonId_fkey" FOREIGN KEY ("PersonId") REFERENCES public."People"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Franchises Franchises_company_creator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Franchises"
    ADD CONSTRAINT "Franchises_company_creator_id_fkey" FOREIGN KEY (company_creator_id) REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Franchises Franchises_ownerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Franchises"
    ADD CONSTRAINT "Franchises_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Game_Awards Game_Awards_AwardCategoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Awards"
    ADD CONSTRAINT "Game_Awards_AwardCategoryId_fkey" FOREIGN KEY ("AwardCategoryId") REFERENCES public."AwardCategories"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Game_Awards Game_Awards_GameId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Awards"
    ADD CONSTRAINT "Game_Awards_GameId_fkey" FOREIGN KEY ("GameId") REFERENCES public."Games"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Game_Characters Game_Characters_CharacterId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Characters"
    ADD CONSTRAINT "Game_Characters_CharacterId_fkey" FOREIGN KEY ("CharacterId") REFERENCES public."Characters"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Game_Characters Game_Characters_GameId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Characters"
    ADD CONSTRAINT "Game_Characters_GameId_fkey" FOREIGN KEY ("GameId") REFERENCES public."Games"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Game_Companies Game_Companies_CompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Companies"
    ADD CONSTRAINT "Game_Companies_CompanyId_fkey" FOREIGN KEY ("CompanyId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Game_Companies Game_Companies_GameId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Companies"
    ADD CONSTRAINT "Game_Companies_GameId_fkey" FOREIGN KEY ("GameId") REFERENCES public."Games"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Game_Genres Game_Genres_GameId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Genres"
    ADD CONSTRAINT "Game_Genres_GameId_fkey" FOREIGN KEY ("GameId") REFERENCES public."Games"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Game_Genres Game_Genres_GenreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Genres"
    ADD CONSTRAINT "Game_Genres_GenreId_fkey" FOREIGN KEY ("GenreId") REFERENCES public."Genres"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Game_People Game_People_GameId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_People"
    ADD CONSTRAINT "Game_People_GameId_fkey" FOREIGN KEY ("GameId") REFERENCES public."Games"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Game_People Game_People_PersonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_People"
    ADD CONSTRAINT "Game_People_PersonId_fkey" FOREIGN KEY ("PersonId") REFERENCES public."People"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Game_Platforms Game_Platforms_GameId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Platforms"
    ADD CONSTRAINT "Game_Platforms_GameId_fkey" FOREIGN KEY ("GameId") REFERENCES public."Games"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Game_Platforms Game_Platforms_PlatformId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Platforms"
    ADD CONSTRAINT "Game_Platforms_PlatformId_fkey" FOREIGN KEY ("PlatformId") REFERENCES public."Platforms"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Game_Themes Game_Themes_GameId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Themes"
    ADD CONSTRAINT "Game_Themes_GameId_fkey" FOREIGN KEY ("GameId") REFERENCES public."Games"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Game_Themes Game_Themes_ThemeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Themes"
    ADD CONSTRAINT "Game_Themes_ThemeId_fkey" FOREIGN KEY ("ThemeId") REFERENCES public."Themes"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Games Games_franchiseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Games"
    ADD CONSTRAINT "Games_franchiseId_fkey" FOREIGN KEY ("franchiseId") REFERENCES public."Franchises"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Games Games_serieId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Games"
    ADD CONSTRAINT "Games_serieId_fkey" FOREIGN KEY ("serieId") REFERENCES public."Series"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Genres Genres_parentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Genres"
    ADD CONSTRAINT "Genres_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES public."Genres"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PlatformModels PlatformModels_platform_family_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PlatformModels"
    ADD CONSTRAINT "PlatformModels_platform_family_id_fkey" FOREIGN KEY (platform_family_id) REFERENCES public."Platforms"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Platforms Platforms_manufacturerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Platforms"
    ADD CONSTRAINT "Platforms_manufacturerId_fkey" FOREIGN KEY ("manufacturerId") REFERENCES public."Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Series Series_franchise_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Series"
    ADD CONSTRAINT "Series_franchise_id_fkey" FOREIGN KEY (franchise_id) REFERENCES public."Franchises"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Themes Themes_parentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Themes"
    ADD CONSTRAINT "Themes_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES public."Themes"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

