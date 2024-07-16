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
7	Strategy Game of the Year	f	2024-06-07 11:10:52.809+02	2024-06-07 11:10:52.809+02	3
6	Best Arcade of the Year	f	2024-06-07 11:10:24.078+02	2024-06-07 11:11:37.452+02	3
8	Best Original Game of the Year	f	2024-06-07 11:11:43.922+02	2024-06-07 11:11:43.922+02	3
9	Best Adventure Game of the Year	f	2024-06-20 16:45:08.037+02	2024-06-20 16:45:08.037+02	3
10	Game of the Year	f	2024-07-04 16:37:55.141+02	2024-07-04 16:37:55.141+02	6
11	Best Arcade Game	f	2024-07-05 10:37:51.346+02	2024-07-05 10:37:51.346+02	6
12	Most Innovative Game	f	2024-07-06 11:30:36.904+02	2024-07-06 11:30:36.904+02	6
13	Videoconsole Game of the Year	f	2024-07-10 15:19:00.833+02	2024-07-10 15:19:00.833+02	6
14	Computer Game of the Year	f	2024-07-10 15:19:15.438+02	2024-07-10 15:19:15.438+02	6
\.


--
-- Data for Name: Awards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Awards" (id, name, is_main, main_img, "createdAt", "updatedAt", wikipedia) FROM stdin;
1	Spike Video Game Awards	t	Spike_VGA.png	2024-02-10 12:19:42.387+01	2024-02-10 12:19:42.387+01	\N
2	The Game Awards	t	game_awards.png	2024-02-10 12:23:16.392+01	2024-02-10 12:23:16.392+01	\N
3	Golden Joystick Awards	t	Golden_Joystick_Award.png	2024-02-10 12:24:15.754+01	2024-04-13 13:21:58.786+02	\N
5	Electronic Gaming Monthly	f	EGM.png	2024-04-22 16:05:50.513+02	2024-04-22 16:05:50.513+02	https://es.wikipedia.org/wiki/Electronic_Gaming_Monthly
6	Arkie Awards	f	Electronic_Games_Logo.png	2024-07-04 16:37:40.146+02	2024-07-04 16:37:40.146+02	https://en.wikipedia.org/wiki/Electronic_Games#Arcade_Awards
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
\N	2024-06-10 21:29:22.175+02	2024-06-10 21:29:22.175+02	35	19
\N	2024-06-13 15:44:21.632+02	2024-06-13 15:44:21.632+02	36	20
\N	2024-06-13 15:45:36.513+02	2024-06-13 15:45:36.513+02	36	21
\N	2024-06-13 15:46:34.51+02	2024-06-13 15:46:34.51+02	36	22
\N	2024-06-22 12:58:56.686+02	2024-06-22 12:58:56.686+02	37	23
\N	2024-06-22 12:58:56.686+02	2024-06-22 12:58:56.686+02	38	23
\N	2024-06-23 12:29:00.385+02	2024-06-23 12:29:00.385+02	46	24
\N	2024-07-11 16:16:40.951+02	2024-07-11 16:16:40.951+02	46	30
\N	2024-07-11 16:20:14.698+02	2024-07-11 16:20:14.698+02	46	31
\N	2024-07-15 12:43:24.771+02	2024-07-15 12:43:24.771+02	27	32
\N	2024-07-15 12:58:16.355+02	2024-07-15 12:58:16.355+02	27	33
\N	2024-07-16 16:20:12.608+02	2024-07-16 16:20:12.608+02	27	34
\.


--
-- Data for Name: Characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Characters" (id, name, full_name, alias, alt_names, main_img, color, role_in_franchise, bio, "createdAt", "updatedAt", franchise_id, creation_year, wikipedia, is_main) FROM stdin;
17	Donkey Kong Jr.	\N	\N	\N	donkey_kong/donkey-kong-junior.png	#663605	SECONDARY	\N	2024-06-04 16:49:28.986+02	2024-06-04 16:49:37.069+02	13	1982	\N	\N
18	Luigi	Luigi Mario	\N		mario/luigi.jpeg	#4cbb17	SECONDARY	\N	2024-06-05 17:14:23.601+02	2024-06-05 17:14:34.698+02	14	1983	https://es.wikipedia.org/wiki/Luigi	t
19	Miner Willy	\N	\N	\N	miner_willy/miner-willy.png	\N	MAIN	\N	2024-06-10 21:29:11.671+02	2024-06-10 21:29:30.629+02	21	1983	https://en.wikipedia.org/wiki/Miner_Willy	\N
2	Doctor Robotnik	Doctor Ivo Robotnik	Eggman	Doctor Eggman	sonic/robotnik.png	#b60505	ANTAGONIST	\N	2024-01-04 13:07:51.716+01	2024-03-30 13:03:05.381+01	1	1991	https://es.wikipedia.org/wiki/Doctor_Eggman	\N
32	Bowser	\N	Rey Koopa	Koopa	mario/bowser.jpeg	#10A30C	ANTAGONIST	\N	2024-07-15 12:43:13.783+02	2024-07-15 12:43:31.399+02	14	1985	https://es.wikipedia.org/wiki/Bowser	t
20	Dirk	\N	El Intrépido	\N	dragons_lair/dirk.png	\N	MAIN	\N	2024-06-13 15:43:24.809+02	2024-06-13 15:43:51.718+02	22	1983	\N	\N
3	Tails	Miles Prower			sonic/tails.jpeg	#df3812	SECONDARY	\N	2024-03-30 10:56:57.077+01	2024-04-01 12:44:07.365+02	1	1992	https://es.wikipedia.org/wiki/Miles_%C2%ABTails%C2%BB_Prower	\N
21	Daphne		Princesa Daphne	\N	dragons_lair/Daphne.png	\N	SECONDARY	\N	2024-06-13 15:45:11.191+02	2024-06-13 15:45:24.968+02	22	1983	\N	\N
22	Singe	\N	\N	\N	dragons_lair/singe.png	\N	ANTAGONIST	\N	2024-06-13 15:46:18.252+02	2024-06-13 15:46:28.248+02	22	1983	\N	\N
6	Blinky	\N	\N	\N	pacman/blinky.jpeg	#ea0800	ANTAGONIST	\N	2024-05-03 10:26:11.6+02	2024-05-03 10:26:22.065+02	8	1980	\N	\N
7	Pinky	\N	\N	\N	pacman/pinky.jpeg	#f495c7	ANTAGONIST	\N	2024-05-03 10:27:31.272+02	2024-05-03 10:27:48.941+02	8	1980	\N	\N
8	Inky	\N	\N	\N	pacman/inky.jpeg	#00c7ea	ANTAGONIST	\N	2024-05-03 10:28:57.234+02	2024-05-03 10:29:05.945+02	8	1980	\N	\N
9	Clyde	\N	\N	\N	pacman/clyde.jpeg	#f86300	ANTAGONIST	\N	2024-05-03 10:30:04.346+02	2024-05-03 10:30:12.134+02	8	1980	\N	\N
23	Sabreman	\N	\N	\N	sabreman/sabreman.jpeg	\N	MAIN	\N	2024-06-22 12:58:42.203+02	2024-06-22 12:58:48.648+02	29	1984	\N	\N
1	Sonic	Sonic the Hedgehog	\N	\N	sonic/sonic.jpeg	#17569b	MAIN	\N	2024-01-04 12:42:22.196+01	2024-05-25 10:38:10.462+02	1	1991	https://es.wikipedia.org/wiki/Sonic_(personaje)	t
5	Pac-Man	\N	\N	\N	pacman/pacman.png	#ed6b0e	MAIN	\N	2024-05-03 08:55:45.988+02	2024-05-25 10:38:20.714+02	8	1980	https://es.wikipedia.org/wiki/Pac-Man_(personaje)	t
24	Super Joe	Joseph Gibson	\N	\N	wolf_of_the_battlefield/super_joe.png	\N	MAIN	\N	2024-06-23 12:28:46.662+02	2024-06-23 12:28:53.897+02	33	1985	\N	\N
11	Donkey Kong	\N	\N	\N	donkey_kong/donkeykong.png	#663605	MAIN	\N	2024-05-25 11:04:01.891+02	2024-05-25 11:04:09.418+02	13	1981	https://es.wikipedia.org/wiki/Donkey_Kong_(personaje)	t
12	Pauline	\N	\N	Lady (Donkey Kong 1981)	donkey_kong/pauline.jpg	#ab2127	SECONDARY	\N	2024-05-25 11:22:38.592+02	2024-05-25 11:22:54.15+02	13	1981	https://es.wikipedia.org/wiki/Pauline	\N
10	Mario	Mario Mario		Jumpman  (Donkey Kong 1981)	mario/mario.png	#ee1c25	MAIN	\N	2024-05-25 10:34:29.98+02	2024-05-25 12:30:31.946+02	14	1981	https://es.wikipedia.org/wiki/Mario_(personaje)	t
14	Sue	\N	\N	\N	pacman/sue.jpeg	\N	ANTAGONIST	\N	2024-05-28 17:28:42.412+02	2024-05-28 17:28:50.432+02	8	1982	\N	\N
13	Ms. Pac-man	\N	\N	\N	pacman/mspacman.jpeg	\N	SECONDARY	\N	2024-05-28 17:28:01.159+02	2024-05-28 17:29:03.098+02	8	1982	https://en.wikipedia.org/wiki/Ms._Pac-Man_(character)	\N
15	Q*bert	\N	\N	\N	qbert/qbert.jpeg	\N	MAIN	\N	2024-05-30 17:13:17.642+02	2024-05-30 17:13:47.997+02	16	1982	\N	\N
16	E.T.	Zrek 	Extraterrestrial	\N	et/et.jpeg	\N	MAIN	\N	2024-06-02 11:51:51.349+02	2024-06-02 11:53:23.12+02	19	1982	https://en.wikipedia.org/wiki/E.T._(character)	\N
25	Superman	Clark Kent	El Hombre de Acero	Kal-El	superman/superman.jpeg	#0099F7	MAIN	\N	2024-07-05 11:01:39.46+02	2024-07-05 11:02:14.014+02	46	1979	https://es.wikipedia.org/wiki/Superman	\N
26	Lex Luthor	Alexander Joseph "Lex" Luthor	\N	\N	superman/Lex_Luthor.png	\N	ANTAGONIST	\N	2024-07-05 11:07:53.057+02	2024-07-05 11:08:22.136+02	46	1979	https://es.wikipedia.org/wiki/Lex_Luthor	\N
27	Dig Dug	Taizo Hori	Dig Dug	\N	dig_dug/taizo.jpeg	\N	MAIN	\N	2024-07-06 12:09:51.043+02	2024-07-06 12:10:10.811+02	49	1982	\N	\N
28	Mr. Do	\N	\N	\N	mr_do/Mr-do.jpeg	\N	MAIN	\N	2024-07-06 12:55:17.095+02	2024-07-06 12:55:24.029+02	51	1982	\N	\N
33	Peach	\N	Princesa Peach	Princesa Toadstool	mario/peach.png	#f6b1d0	SECONDARY	\N	2024-07-15 12:58:07.294+02	2024-07-15 12:59:14.896+02	14	1985	https://es.wikipedia.org/wiki/Princesa_Peach	f
29	Bomberman	\N	\N	\N	bomberman/Bomberman.png	\N	MAIN	\N	2024-07-07 19:07:07.903+02	2024-07-07 19:08:12.825+02	59	1983	\N	f
34	Toad	Toad Toadstool	\N	\N	mario/toad.png	\N	SECONDARY	\N	2024-07-16 16:19:55.579+02	2024-07-16 16:20:04.717+02	14	1985	https://es.wikipedia.org/wiki/Toad_(Nintendo)	\N
30	Sir Arthur	\N	\N	\N	ghosts_n_goblins/sir_arthur.jpeg	\N	MAIN	\N	2024-07-11 16:16:10.793+02	2024-07-11 16:18:56.607+02	67	1985	\N	f
31	Prin Prin		Princesa Prin Prin	Guinevere	ghosts_n_goblins/prin_prin.jpeg	\N	SECONDARY	\N	2024-07-11 16:19:58.894+02	2024-07-11 16:21:28.08+02	67	1985	\N	\N
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
38	Quicksilva	gb	1979	f	1990	Disolución	\N	\N	2024-06-07 11:22:52.568+02	2024-06-07 11:23:01.716+02	\N	quicksilva.png	https://en.wikipedia.org/wiki/Quicksilva	\N	\N	\N
39	Imagine Software	gb	1982	f	1984	Bancarrota	\N	\N	2024-06-07 13:02:13.856+02	2024-06-07 13:02:13.856+02	\N	ImagineSoftware.jpeg	https://en.wikipedia.org/wiki/Imagine_Software	\N	\N	\N
40	Middle-earth Enterprises	us	1977	t	\N	\N	Tolkien Enterprises	\N	2024-06-09 11:44:49.407+02	2024-06-09 11:44:49.407+02	\N	MiddleEarthEnterprises.jpeg	https://es.wikipedia.org/wiki/Middle-earth_Enterprises	\N	Propietaria de los derechos exclusivos a nivel mundial sobre ciertos elementos de los libros El Señor de los Anillos y El hobbit. 	\N
42	Krome Studios	au	1999	t	\N	\N	\N	\N	2024-06-09 12:12:06.981+02	2024-06-09 12:12:06.981+02	\N	Krome_Studios.png	https://es.wikipedia.org/wiki/Krome_Studios	\N	\N	\N
41	Melbourne House	au	1980	f	2010	Disuelta por Krome Studios	Beam Software (1980–1993)\nLaser Beam Entertainment (1993—1997)\nMelbourne House (1997–1999)\nInfogrames Melbourne House (1999–2003)\nAtari Melbourne House (2003–2006)	\N	2024-06-09 12:09:29.364+02	2024-06-09 12:12:45.84+02	42	Melbourne_House.png	https://en.wikipedia.org/wiki/Beam_Software	ADQUISITION	Perteneció a Infogrames/Atari (2000–2006)\ny comprada por Krome Studios (2006–2010)	\N
43	Bug-Byte	gb	1980	f	1985	Bancarrota	\N	\N	2024-06-10 21:09:57.688+02	2024-06-10 21:09:57.688+02	\N	Bug-byte.png	https://en.wikipedia.org/wiki/Bug-Byte	\N	\N	\N
44	Software Projects	gb	1983	f	1988	Disolución	\N	\N	2024-06-10 21:21:14.681+02	2024-06-10 21:21:14.681+02	\N	Software-projects.png	https://en.wikipedia.org/wiki/Software_Projects	\N	\N	\N
45	Digital Leisure	ca	1997	t	\N	\N	\N	\N	2024-06-13 15:26:07.708+02	2024-06-13 15:26:07.708+02	\N	DigitalLeisure.jpeg	https://en.wikipedia.org/wiki/Digital_Leisure	\N	\N	\N
46	RDI Video Systems	us	1982	f	1985	Bancarrota	Advanced Microcomputer Systems	\N	2024-06-13 15:29:32.169+02	2024-06-13 15:29:32.169+02	\N	rdi-video-systems.jpeg	https://es.wikipedia.org/wiki/RDI_Video_Systems	\N	\N	\N
62	Personal Software Services	gb	1981	f	1991	Disuelta por Mirrorsoft	\N	\N	2024-06-24 11:30:06.396+02	2024-06-24 11:36:30.373+02	63	Personal_Software_Services.jpeg	https://en.wikipedia.org/wiki/Personal_Software_Services	ADQUISITION	Adquirida por Mirrorsoft en 1987	\N
47	Ultimate Play the Game	gb	1982	t	\N	\N	\N	\N	2024-06-14 13:50:38.602+02	2024-06-15 11:39:49.437+02	48	ultimateplaythegame.jpeg	https://en.wikipedia.org/wiki/Ultimate_Play_the_Game	ADQUISITION	Fundada por los creadores de Rare, antes que esta y después traspasaron todos sus assets ahí.	\N
49	Xbox Game Studios	us	2000	t	\N	\N	Microsoft Games (2000–2001)\nMicrosoft Game Studios (2001–2011)\nMicrosoft Studios (2011–2019)	#9bc848	2024-06-15 11:48:12.012+02	2024-06-15 11:48:25.004+02	23	Xbox_Game_Studios.png	https://es.wikipedia.org/wiki/Xbox_Game_Studios	DIVISION		t
48	Rare	gb	1985	t	\N	\N	Rareware (1994 - 2003) 	\N	2024-06-15 11:37:46.406+02	2024-06-15 11:49:07.865+02	49	rare.png	https://es.wikipedia.org/wiki/Rare	ADQUISITION	Fundada por los fundadores de Ultimate Play the Game.\nAdquirida por Microsoft en 2002.	f
50	Erbe	es	1984	f	1994	Bancarrota	\N	\N	2024-06-15 12:00:23.238+02	2024-06-15 12:00:23.238+02	\N	erbe.png	https://es.wikipedia.org/wiki/Erbe_Software	\N	\N	\N
51	First Star Software	us	1982	f	2018	Disolución	\N	\N	2024-06-15 20:33:03.516+02	2024-06-15 20:33:03.516+02	\N	First_Star_Software.png	https://en.wikipedia.org/wiki/First_Star_Software	\N	\N	\N
52	Ocean Software	gb	1983	f	1998	Adquirida por Infogrames y renombrada a Infogrames UK	Spectrum Games	\N	2024-06-19 21:19:06.087+02	2024-06-19 21:19:06.087+02	\N	Ocean_Software.png	https://es.wikipedia.org/wiki/Ocean_Software	\N	\N	\N
54	Take-Two Interactive	us	1993	t	\N	\N	\N	\N	2024-06-20 16:09:19.334+02	2024-06-20 16:09:19.334+02	\N	Take-Two.png	https://es.wikipedia.org/wiki/Take-Two_Interactive	\N	\N	\N
53	Indie Built	us	1982	f	2006	Disuelta por Take Two	Access Software, Inc. (1982–2000)\nSalt Lake Games Studio (2000–2003)\nIndie Games (2003–2004)	\N	2024-06-20 16:04:28.491+02	2024-06-20 16:09:56.039+02	54	Indie_Built.png	https://es.wikipedia.org/wiki/Indie_Built	ADQUISITION	Comprada por Microsoft en 2000. Renombrada a Salt Lake Games.\nComprada por Take Two 2004. Renombrada a Indie Built	\N
55	Beyond Software	gb	1983	t	\N	\N	\N	\N	2024-06-20 16:33:25.207+02	2024-06-20 16:33:25.207+02	\N	Beyond_Software.jpeg	https://en.wikipedia.org/wiki/Beyond_Software	\N	\N	\N
56	Frontier Developments	gb	1994	t	\N	\N	\N	\N	2024-06-21 11:25:19.467+02	2024-06-21 11:25:19.467+02	\N	Frontier_Developments.png	https://es.wikipedia.org/wiki/Frontier_Developments	\N	\N	\N
57	Acornsoft	gb	1980	f	2013	Disolución	\N	\N	2024-06-21 11:28:46.973+02	2024-06-21 11:28:46.973+02	\N	Acornsoft.png	https://en.wikipedia.org/wiki/Acornsoft	\N	\N	\N
58	Sony Pictures	us	1987	t	\N	\N	Columbia Pictures Entertainment, Inc. (1987–1991)	\N	2024-06-21 13:20:04.808+02	2024-06-21 13:20:11.996+02	36	Sony_Pictures.png	https://es.wikipedia.org/wiki/Sony_Pictures	DIVISION	Fundada con la compra de Columbia Pictures	\N
59	The Tetris Company	us	1996	t	\N	\N	\N	\N	2024-06-22 16:15:49.749+02	2024-06-22 16:15:49.749+02	\N	The_Tetris_Company.png	https://en.wikipedia.org/wiki/The_Tetris_Company	\N	\N	\N
60	U.S. Gold	gb	1984	f	1996	Disuelta tras ser adquirida por Eidos	\N	\N	2024-06-23 10:47:36.124+02	2024-06-23 10:47:36.124+02	\N	US_gold.png	https://es.wikipedia.org/wiki/U.S._Gold	\N	\N	\N
61	Capcom	jp	1979	t	\N	\N	\N	#0c4da2	2024-06-23 12:14:28.759+02	2024-06-23 12:14:28.759+02	\N	capcom.png	https://es.wikipedia.org/wiki/Capcom	\N	\N	t
63	Mirrorsoft	gb	1983	f	1992	Disolución	\N	\N	2024-06-24 11:36:02.437+02	2024-06-24 11:36:02.437+02	\N	Mirrorsoft.jpeg	https://en.wikipedia.org/wiki/Mirrorsoft	\N	Sus licencias fueron compradas por Acclaim	\N
64	Warner Bros.	us	1923	t	\N	\N	\N	\N	2024-06-24 12:21:27.764+02	2024-06-24 12:21:27.764+02	\N	Warner_Bros.png	https://es.wikipedia.org/wiki/Warner_Bros.	\N	\N	\N
65	DC Comics	us	1937	t	\N	\N	\N	#0476F2	2024-06-24 13:13:50.053+02	2024-06-24 13:14:28.053+02	64	DC_Comics.png	https://es.wikipedia.org/wiki/DC_Comics	ADQUISITION	Aquirida por Warner Bros en 1967	\N
66	Rebellion Developments	gb	1992	t	\N	\N	\N	\N	2024-07-03 16:02:22.462+02	2024-07-03 16:02:22.462+02	\N	Rebellion_Developments.png	https://es.wikipedia.org/wiki/Rebellion_Developments	\N	\N	\N
67	Nichibutsu	jp	1970	f	2014	Disolución	Nihon Bussan	\N	2024-07-03 16:30:08.324+02	2024-07-03 16:30:08.324+02	\N	Nichibutsu.png	https://es.wikipedia.org/wiki/Nihon_Bussan	\N	\N	\N
68	Hudson Soft	jp	1973	f	2012	Disuelta por Konami	\N	\N	2024-07-03 19:57:55.033+02	2024-07-03 19:58:07.496+02	30	Hudson_Soft.png	https://es.wikipedia.org/wiki/Hudson_Soft	ADQUISITION	Comprada por Konami en 2011	\N
69	Kee Games	us	1973	f	1978	Disuelta por Atari	\N	\N	2024-07-03 20:11:11.273+02	2024-07-03 20:11:21.052+02	11	KeeGames.png	https://en.wikipedia.org/wiki/Kee_Games	ADQUISITION	Creada por Atari para hacer juegos clónicos suyos\nIntegrada dentro de Atari desde 1974	\N
72	NEC	jp	1899	t	\N	\N	Nippon Electric Company, Limited (1899-1983)	\N	2024-07-04 16:34:01.874+02	2024-07-04 16:34:01.874+02	\N	NEC.png	https://es.wikipedia.org/wiki/NEC_Corporation	\N	\N	\N
71	Fairchild Semiconductor	us	1957	t	\N	\N	\N	\N	2024-07-04 15:33:26.981+02	2024-07-04 15:33:26.981+02	\N	Fairchild_Semiconductor.png	https://es.wikipedia.org/wiki/Fairchild_Semiconductor	\N	\N	\N
70	Enix	jp	1975	f	2003	Fusión con SquareSoft para crear Square Enix	\N	\N	2024-07-03 20:51:26.027+02	2024-07-04 16:31:51.315+02	15	Enix.png	https://es.wikipedia.org/wiki/Enix_(empresa)	MERGE	\N	\N
73	Sir-Tech	us	1979	f	2003	Cierre	Sirotech Software	\N	2024-07-05 08:41:47.07+02	2024-07-05 08:42:02.586+02	\N	Sir-Tech.png	https://es.wikipedia.org/wiki/Sir-Tech	\N	\N	\N
74	The Walt Disney Company	us	1923	t	\N	\N	Disney Brothers Cartoon Studio (1923–1926)\nWalt Disney Studio (1926–1929)\nWalt Disney Productions (1929–1986)	#006e99	2024-07-05 12:38:32.146+02	2024-07-05 12:38:32.146+02	\N	The_Walt_Disney_company.png	https://es.wikipedia.org/wiki/The_Walt_Disney_Company	\N	\N	\N
75	Hasbro	us	1923	t	\N	\N	Hassenfeld Brothers (1923–1968)\nHasbro Industries (1968–1984)\nHasbro Bradley (1984–1985)	\N	2024-07-05 12:52:21.55+02	2024-07-05 12:52:21.55+02	\N	Hasbro.png	https://es.wikipedia.org/wiki/Hasbro	\N	\N	\N
76	Parker Brothers	us	1883	f	2006	Disuelto por Hasbro	\N	\N	2024-07-05 12:56:00.446+02	2024-07-05 12:56:09.621+02	75	Parker-Brothers.png	https://es.wikipedia.org/wiki/Parker_Brothers	ADQUISITION	Adquirido por Hasbro en 1998	\N
77	Universal Entertainment	jp	1969	t	\N	\N	Aruze Corporation (2005-2009)	\N	2024-07-06 12:50:18.685+02	2024-07-06 12:50:18.685+02	\N	Universal_Entertainment.png	https://en.wikipedia.org/wiki/Universal_Entertainment	\N	\N	\N
78	ADK Corporation	jp	1980	f	2003	Bancarrota	Alpha Denshi (1980-1993)	\N	2024-07-06 19:24:33.603+02	2024-07-06 19:24:33.603+02	\N	ADK_Corporation.png	https://es.wikipedia.org/wiki/ADK_Corporation	\N	Sus activos se los quedo SNK	\N
79	MB	us	1860	f	1998	Disuelta por Hasbro	Milton Bradley Company	\N	2024-07-07 11:05:33.115+02	2024-07-07 11:05:41.981+02	75	MB.png	https://es.wikipedia.org/wiki/Milton_Bradley_Company	ADQUISITION	Comprada por Hasbro en 1984	\N
80	Nintendo R&D3	jp	1970	f	2005	Reestructuración dentro de los equipos de Nintendo	\N	#E60012	2024-07-07 12:28:38.565+02	2024-07-07 12:28:46.253+02	32	nintendord1.png	https://es.wikipedia.org/wiki/Nintendo_Integrated_Research_%26_Development	DIVISION	\N	\N
81	Free Fall Associates	us	1981	f	2002	Disolución	\N	\N	2024-07-07 12:48:56.42+02	2024-07-07 12:48:56.42+02	\N	Freefall.png	https://en.wikipedia.org/wiki/Free_Fall_Associates	\N	\N	\N
82	Ozark Softscape	us	1982	f	1993	Disolución	\N	\N	2024-07-07 13:06:57.636+02	2024-07-07 13:06:57.636+02	\N	Ozark_Softscape.jpg	\N	\N	\N	\N
83	Muse Software	us	1978	f	1987	Bancarrota	\N	\N	2024-07-07 19:27:00.107+02	2024-07-07 19:27:00.107+02	\N	Muse_Software.jpeg	https://en.wikipedia.org/wiki/Muse_Software	\N	\N	\N
85	ZeniMax	us	1999	t	\N	\N	\N	\N	2024-07-07 19:42:34.298+02	2024-07-07 19:42:44.373+02	23	ZeniMax.png	https://es.wikipedia.org/wiki/ZeniMax_Media	ADQUISITION	Comprada por Microsoft en 2021	\N
84	id Software	us	1991	t	\N	\N	\N	\N	2024-07-07 19:31:20.877+02	2024-07-07 19:43:14.36+02	85	Id_Software.png	https://es.wikipedia.org/wiki/Id_Software	ADQUISITION	Comprado por Zenimax en 2009	\N
86	Nintendo R&D2	jp	1970	f	2005	Reestructuración dentro de los equipos de Nintendo	\N	#E60012	2024-07-08 15:24:59.91+02	2024-07-08 15:25:33.631+02	32	nintendord1.png	https://es.wikipedia.org/wiki/Nintendo_Research_%26_Development_2	DIVISION		\N
87	Broderbund	us	1980	f	1998	Disuelta por Softkey	\N	\N	2024-07-08 15:59:41.107+02	2024-07-08 15:59:53.446+02	7	Broderbund.png	https://es.wikipedia.org/wiki/Br%C3%B8derbund	ADQUISITION	Comprada por Softkey en 1998	\N
88	Imagic	us	1981	f	1986	Disolución	\N	\N	2024-07-08 16:11:12.718+02	2024-07-08 16:11:12.718+02	\N	Imagic.png	https://es.wikipedia.org/wiki/Imagic	\N	\N	\N
89	Tozai Games	jp	1996	t	\N	\N	\N	\N	2024-07-08 16:43:22.319+02	2024-07-08 16:43:22.319+02	\N	Tozai_Games.jpg	\N	\N	\N	\N
90	Data East	jp	1976	f	2003	Bancarrota	\N	\N	2024-07-09 16:00:37.152+02	2024-07-09 16:00:37.152+02	\N	Data_East.png	https://es.wikipedia.org/wiki/Data_East	\N	\N	\N
91	Technōs Japan	jp	1981	f	1996	Bancarrota	\N	\N	2024-07-09 16:19:14.561+02	2024-07-09 16:19:14.561+02	\N	Technos_Japan.png	https://es.wikipedia.org/wiki/Techn%C5%8Ds_Japan	\N	Sus propiedades las adquirió Arc System Works después de su bancarrota.	\N
93	Eizo	jp	1968	t	\N	\N	\N	\N	2024-07-09 16:36:48.701+02	2024-07-09 16:36:48.701+02	\N	EIZO.png	https://es.wikipedia.org/wiki/Eizo	\N	\N	\N
92	Irem	jp	1974	t	\N	\N	\N	\N	2024-07-09 16:34:53.229+02	2024-07-09 16:37:19.464+02	93	Irem.png	https://es.wikipedia.org/wiki/Irem	ADQUISITION	Comprada por Eizo en 1998	\N
94	Big Five Software	us	1980	f	1986	Disolución	\N	\N	2024-07-10 15:46:28.72+02	2024-07-10 15:46:28.72+02	\N	Big_Five_Software.jpg	https://en.wikipedia.org/wiki/Big_Five_Software	\N	\N	\N
95	Nintendo EAD	jp	1983	f	2005	Reestructuración dentro de los equipos de Nintendo	Nintendo R&D4	#E60012	2024-07-15 13:23:56.81+02	2024-07-15 13:23:56.81+02	\N	nintendord1.png	https://es.wikipedia.org/wiki/Nintendo_Entertainment_Analysis_and_Development	\N		\N
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
\N	2024-06-10 21:27:56.081+02	2024-06-10 21:27:56.081+02	35	21
\N	2024-06-13 15:36:26.373+02	2024-06-13 15:36:26.373+02	36	22
\N	2024-06-15 12:05:43.739+02	2024-06-15 12:05:43.739+02	38	23
\N	2024-06-15 12:05:43.739+02	2024-06-15 12:05:43.739+02	37	23
\N	2024-06-15 20:42:15.625+02	2024-06-15 20:42:15.625+02	39	24
\N	2024-06-20 16:15:26.878+02	2024-06-20 16:15:26.878+02	41	26
\N	2024-06-21 11:31:19.662+02	2024-06-21 11:31:19.662+02	43	27
\N	2024-06-22 12:53:45.52+02	2024-06-22 12:53:45.52+02	37	29
\N	2024-06-22 12:53:45.52+02	2024-06-22 12:53:45.52+02	38	29
\N	2024-06-22 16:18:23.059+02	2024-06-22 16:18:23.059+02	44	30
\N	2024-06-23 10:58:14.516+02	2024-06-23 10:58:14.516+02	45	31
\N	2024-06-23 12:20:37.648+02	2024-06-23 12:20:37.648+02	46	33
\N	2024-06-26 16:43:02.283+02	2024-06-26 16:43:02.283+02	12	38
\N	2024-06-28 09:28:12.656+02	2024-06-28 09:28:12.656+02	47	39
\N	2024-07-04 16:48:46.817+02	2024-07-04 16:48:46.817+02	50	43
\N	2024-07-05 08:45:20.247+02	2024-07-05 08:45:20.247+02	52	44
\N	2024-07-05 08:45:20.247+02	2024-07-05 08:45:20.247+02	51	44
\N	2024-07-05 09:04:37.192+02	2024-07-05 09:04:37.192+02	50	45
\N	2024-07-06 10:47:51.455+02	2024-07-06 10:47:51.455+02	55	48
\N	2024-07-06 13:30:12.99+02	2024-07-06 13:30:12.99+02	56	53
\N	2024-07-07 11:26:46.96+02	2024-07-07 11:26:46.96+02	57	56
\N	2024-07-07 12:21:22.701+02	2024-07-07 12:21:22.701+02	58	57
\N	2024-07-07 12:56:39.16+02	2024-07-07 12:56:39.16+02	59	58
\N	2024-07-08 16:45:04.013+02	2024-07-08 16:45:04.013+02	61	62
\N	2024-07-10 16:37:39.083+02	2024-07-10 16:37:39.083+02	64	65
\N	2024-07-11 16:17:11.355+02	2024-07-11 16:17:11.355+02	46	67
\N	2024-07-12 09:14:17.1+02	2024-07-12 09:14:17.1+02	66	68
\N	2024-07-12 13:20:32.844+02	2024-07-12 13:20:32.844+02	66	69
\N	2024-07-15 12:25:52.168+02	2024-07-15 12:25:52.168+02	27	70
\.


--
-- Data for Name: Franchises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Franchises" (id, name, main_img, first_game_date, color, "createdAt", "updatedAt", "ownerId", company_creator_id, wikipedia, is_main) FROM stdin;
35	Gremlins	gremlins.png	1984-06-08	\N	2024-06-24 12:23:34.51+02	2024-06-24 12:23:47.39+02	64	\N	https://es.wikipedia.org/wiki/Gremlins	\N
19	E.T. el Extraterrestre	E_T.png	1982-12-02	\N	2024-06-02 11:44:59.664+02	2024-06-02 11:54:36.121+02	37	\N	https://en.wikipedia.org/wiki/E.T._the_Extra-Terrestrial_in_video_games	\N
20	El Señor de los Anillos	thelordoftherings.png	1982-11-01	#2b2f22	2024-06-09 11:48:06.123+02	2024-06-09 11:48:30.921+02	40	\N	\N	\N
6	Galaxian	Galaxian.png	1979-11-01	#023693	2024-04-30 18:03:31.473+02	2024-06-09 12:02:06.722+02	19	18	https://en.wikipedia.org/wiki/List_of_Galaxian_video_games	f
21	Miner Willy	miner-willy.jpeg	1983-01-01	\N	2024-06-10 21:24:05.113+02	2024-06-10 21:28:12.679+02	44	\N	https://en.wikipedia.org/wiki/Miner_Willy	\N
36	Spy vs. Spy	Spy_vs._Spy.png	1984-01-01	\N	2024-06-24 13:23:43.594+02	2024-06-24 13:23:49.809+02	65	\N	https://en.wikipedia.org/wiki/Spy_vs._Spy	\N
3	The Oregon Trail	oregon_trail.png	1971-12-03	\N	2024-04-24 23:46:33.614+02	2024-04-24 23:47:00.862+02	\N	6	https://en.wikipedia.org/wiki/The_Oregon_Trail_(series)	\N
37	Epyx Sports Games	epyx_sports_games.jpg	1984-01-01	\N	2024-06-26 15:50:19.426+02	2024-06-26 15:50:27.453+02	24	\N	\N	\N
22	Dragon's Lair	Dragons-lair.png	1983-06-19	\N	2024-06-13 15:35:36.075+02	2024-06-13 15:36:17.867+02	45	46	https://en.wikipedia.org/wiki/Dragon%27s_Lair	\N
5	Asteroids	Asteroids.png	1979-11-01	#170e31	2024-04-29 18:08:17.931+02	2024-04-29 18:08:35.765+02	11	\N	\N	\N
23	Jetman	Jetman.png	1983-05-01	\N	2024-06-15 12:05:14.161+02	2024-06-15 12:05:30.895+02	47	\N	\N	\N
7	Zork	zork.jpeg	1980-01-01	\N	2024-05-01 11:29:57.402+02	2024-05-01 11:30:53.489+02	21	20	\N	\N
24	Boulder Dash	boulder-dash.png	1984-03-01	\N	2024-06-15 20:41:56.249+02	2024-06-15 20:42:06.653+02	51	\N	\N	\N
25	Daley Thompson's	Daley_Thompson.jpg	1984-01-01	\N	2024-06-19 21:25:55.484+02	2024-06-19 21:26:07.292+02	52	\N	\N	\N
26	Beach-Head	beach-head.jpg	1983-01-01	\N	2024-06-20 16:15:06.53+02	2024-06-20 16:15:17.557+02	53	\N	\N	\N
27	Elite	elite.png	1984-09-20	\N	2024-06-21 11:30:51.551+02	2024-06-21 11:30:59.771+02	56	\N	https://en.wikipedia.org/wiki/Elite_(video_game_series)	\N
9	Defender	Defender.png	1981-02-06	\N	2024-05-12 13:49:52.857+02	2024-05-12 13:51:20.941+02	27	\N	\N	\N
47	Star Wars	star_wars.png	1982-06-01	#381010	2024-07-05 12:42:27.748+02	2024-07-05 12:42:41.152+02	74	\N	https://es.wikipedia.org/wiki/Star_Wars_(videojuegos)	\N
10	Ultima	Ultima.png	1981-06-01	\N	2024-05-18 19:58:57.383+02	2024-05-18 20:00:46.613+02	29	28	https://es.wikipedia.org/wiki/Ultima	\N
11	Frogger	frogger.png	1981-06-28	\N	2024-05-22 21:15:11.341+02	2024-05-22 21:19:09.887+02	30	\N	https://en.wikipedia.org/wiki/Frogger_(series)	\N
12	Centipede	centipede.png	1981-08-01	\N	2024-05-23 19:03:45.417+02	2024-05-23 19:04:02.55+02	11	\N	\N	\N
1	Sonic the Hedgehog	sonic_the_hedgehog.png	1991-06-23	#17569b	2023-12-31 13:13:50.45+01	2024-05-24 18:35:40.99+02	1	\N	\N	t
16	Q*bert	Qbert.jpeg	1982-10-18	\N	2024-05-30 16:41:09.37+02	2024-06-21 13:20:32.54+02	58	35	\N	\N
13	Donkey Kong	donkeykong.png	1981-06-09	#663605	2024-05-24 18:40:03.405+02	2024-05-24 18:41:57.159+02	32	\N	https://es.wikipedia.org/wiki/Donkey_Kong_(serie)	t
14	Mario	Mario.png	1983-07-14	#ee1c25	2024-05-24 18:46:53.968+02	2024-05-24 18:47:04.982+02	32	\N	https://es.wikipedia.org/wiki/Mario_(franquicia)	t
8	Pac-Man	pacman.png	1980-05-22	#ed6b0e	2024-05-03 08:23:14.569+02	2024-05-24 18:48:46.425+02	19	18	https://en.wikipedia.org/wiki/List_of_Pac-Man_video_games	t
4	Space Invaders	Space_invaders.png	1978-04-01	#02073f	2024-04-28 11:35:45.283+02	2024-05-24 18:49:00.786+02	14	\N	https://es.wikipedia.org/wiki/Space_Invaders_(serie)	t
15	Joust	joust.png	1982-07-16	\N	2024-05-26 13:31:53.402+02	2024-05-26 13:32:42.205+02	27	\N	\N	\N
38	Gauntlet	gauntlet.jpeg	1985-10-15	\N	2024-06-26 16:42:48.936+02	2024-06-26 16:43:22.232+02	64	11	\N	\N
17	Pitfall	Pitfall.png	1982-09-20	\N	2024-05-31 14:20:34.79+02	2024-05-31 14:21:27.21+02	21	\N	\N	\N
18	Robotron	Robotron.jpeg	1982-01-01	\N	2024-06-01 13:07:12.47+02	2024-06-01 13:07:33.985+02	27	\N	\N	\N
28	Ghostbusters	Ghostbusters.png	1984-10-26	\N	2024-06-21 13:22:34.02+02	2024-06-21 13:22:53.721+02	58	\N	https://en.wikipedia.org/wiki/List_of_Ghostbusters_video_games	\N
29	Sabreman	sabreman.jpeg	1984-01-01	\N	2024-06-22 12:53:19.951+02	2024-06-22 12:53:34.887+02	47	\N	https://en.wikipedia.org/wiki/Sabreman	\N
39	Gradius	gradius.png	1985-02-02	\N	2024-06-28 09:27:39.334+02	2024-06-28 09:28:04.766+02	30	\N	https://es.wikipedia.org/wiki/Gradius	\N
30	Tetris	tetris.png	1984-06-06	\N	2024-06-22 16:18:12.387+02	2024-06-22 16:18:55.359+02	59	\N	https://en.wikipedia.org/wiki/List_of_Tetris_variants	f
31	Dropzone	Dropzone.jpg	1984-01-01	\N	2024-06-23 10:58:04.17+02	2024-06-23 10:58:04.17+02	\N	\N	\N	\N
32	Track & Field	track_and_field.png	1983-09-01	\N	2024-06-23 11:15:20.731+02	2024-06-23 11:15:27.572+02	30	\N	\N	\N
33	Wolf of the Battlefield	wolf_of_battlefield.jpeg	1985-04-02	\N	2024-06-23 12:20:18.561+02	2024-06-23 12:20:30.097+02	61	\N	\N	\N
34	PSS Wargamers Series	pssWargamersSeries.jpeg	1985-01-01	\N	2024-06-24 11:39:13.47+02	2024-06-24 11:39:24.382+02	62	\N	\N	\N
40	Battlezone	battlezone.png	1980-11-01	\N	2024-07-03 16:09:26.905+02	2024-07-03 16:09:49.691+02	66	11	\N	\N
48	Star Raiders	Star_Raiders.jpeg	1980-03-01	\N	2024-07-06 10:46:31.245+02	2024-07-06 10:46:41.621+02	11	\N	\N	\N
41	Crazy Climber	crazy-climber.jpeg	1980-10-01	\N	2024-07-03 16:33:53.309+02	2024-07-03 16:34:43.947+02	67	\N	\N	\N
54	Elevator Action	Elevator_action.jpeg	1983-05-23	\N	2024-07-06 19:52:57.322+02	2024-07-06 19:53:08.002+02	14	\N	\N	\N
42	Tank	tank.jpg	1974-11-01	\N	2024-07-03 20:16:27.624+02	2024-07-03 20:17:00.412+02	11	69	\N	\N
43	Missile Command	missile_command.png	1980-07-01	\N	2024-07-04 16:48:32.555+02	2024-07-04 16:48:51.657+02	11	\N	\N	\N
44	Wizardry	Wizardry.png	1981-09-01	\N	2024-07-05 08:44:55.107+02	2024-07-05 08:45:07.143+02	73	\N	https://es.wikipedia.org/wiki/Wizardry	\N
45	Tempest	tempest.jpeg	1981-10-01	\N	2024-07-05 09:04:15.68+02	2024-07-05 09:04:28.464+02	11	\N	\N	\N
46	Superman	superman.png	1979-09-01	#0099F7	2024-07-05 10:55:52.02+02	2024-07-05 10:57:17.633+02	65	\N	https://es.wikipedia.org/wiki/Superman	\N
49	Dig Dug	dig_dug.jpeg	1982-02-20	\N	2024-07-06 12:03:25.997+02	2024-07-06 12:03:41.995+02	19	18	\N	\N
50	Pole Position	pole-position.jpeg	1982-09-16	\N	2024-07-06 12:25:57.056+02	2024-07-06 12:26:11.829+02	19	18	\N	\N
51	Mr. Do!	mr_do.jpeg	1982-09-01	\N	2024-07-06 12:54:07.869+02	2024-07-06 13:00:40.692+02	77	\N	\N	\N
52	Zaxxon	zaxxon.png	1982-01-01	\N	2024-07-06 13:09:41.366+02	2024-07-06 13:09:48.006+02	1	\N	\N	\N
53	Time Pilot	time-pilot.png	1982-11-01	\N	2024-07-06 13:29:59.438+02	2024-07-06 13:30:05.987+02	30	\N	\N	\N
57	Punch Out!!	Punch-Out!!.png	1984-02-17	\N	2024-07-07 12:19:19.451+02	2024-07-07 12:21:02.225+02	32	\N	https://es.wikipedia.org/wiki/Punch-Out!!	\N
55	Spy Hunter	spy_hunter.jpeg	1983-11-01	\N	2024-07-06 20:04:27.123+02	2024-07-06 20:09:19.59+02	37	17	https://es.wikipedia.org/wiki/Spy_Hunter	\N
56	Xevious	xevious.png	1983-01-01	\N	2024-07-07 11:26:14.84+02	2024-07-07 11:26:38.599+02	19	18	https://en.wikipedia.org/wiki/List_of_Xevious_media	\N
58	Archon	archon.png	1983-01-01	\N	2024-07-07 12:56:29.762+02	2024-07-07 12:56:55.554+02	81	\N	\N	\N
59	Bomberman	Bomberman.png	1983-07-01	\N	2024-07-07 18:59:34.459+02	2024-07-07 19:07:54.102+02	30	68	https://es.wikipedia.org/wiki/Bomberman	f
60	Wolfenstein	Wolfenstein.png	1981-09-01	\N	2024-07-07 19:45:47.07+02	2024-07-07 19:47:01.955+02	85	83	https://en.wikipedia.org/wiki/Wolfenstein	\N
61	Tron	tron.png	1982-05-01	\N	2024-07-08 16:24:28.532+02	2024-07-08 16:24:39.301+02	74	\N	https://en.wikipedia.org/wiki/Tron_(franchise)	\N
62	Lode Runner	lode_runner.jpeg	1983-06-23	\N	2024-07-08 16:44:35.479+02	2024-07-08 16:44:57.62+02	89	87	\N	\N
63	19xx	19xx.png	1984-11-30	\N	2024-07-09 15:33:09.003+02	2024-07-09 15:34:01.994+02	61	\N	\N	\N
64	Yie Ar Kung-Fu	Yie_Ar_Kung-Fu.jpeg	1984-10-25	\N	2024-07-09 16:58:44.588+02	2024-07-09 16:59:05.834+02	30	\N	\N	\N
65	Marble Madness	MarbleMadness.png	1984-12-15	\N	2024-07-10 16:37:27.386+02	2024-07-10 16:37:51.26+02	64	11	\N	\N
66	Ballon Fight	ballon_fight.png	1984-11-01	\N	2024-07-10 21:20:24.522+02	2024-07-10 21:21:09.53+02	32	\N	\N	\N
67	Ghosts 'n Goblins	ghostsngoblins.jpeg	1985-09-19	\N	2024-07-11 16:10:27.109+02	2024-07-11 16:17:00.236+02	61	\N	https://en.wikipedia.org/wiki/Ghosts_%27n_Goblins	\N
68	Hang On	Hang-On.png	1985-07-02	\N	2024-07-12 09:14:03.631+02	2024-07-12 09:14:10.59+02	1	\N	\N	\N
69	Space Harrier	Space_Harrier.jpeg	1985-10-02	\N	2024-07-12 13:20:22.041+02	2024-07-12 13:20:27.14+02	1	\N	\N	\N
70	Excitebike	excitebike.png	1984-11-30	\N	2024-07-15 12:25:39.553+02	2024-07-15 12:25:44.295+02	32	\N	\N	\N
71	Paperboy	Paperboy.jpeg	1985-02-01	\N	2024-07-16 16:27:24.872+02	2024-07-16 16:55:40.439+02	64	11	\N	\N
\.


--
-- Data for Name: Game_Awards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Game_Awards" (result, year, "createdAt", "updatedAt", "GameId", "AwardCategoryId") FROM stdin;
WINNER	1991	2024-02-10 13:32:01.193+01	2024-02-10 13:32:01.193+01	2	1
WINNER	1991	2024-04-22 16:06:58.243+02	2024-04-22 16:06:58.243+02	2	5
WINNER	1992	2024-04-22 16:14:51.555+02	2024-04-22 16:14:51.555+02	4	3
WINNER	1992	2024-04-22 16:15:06.721+02	2024-04-22 16:15:06.721+02	4	4
RUNNERUP	1983	2024-06-07 11:12:36.983+02	2024-06-07 11:12:36.983+02	23	6
RUNNERUP	1983	2024-06-07 11:45:11.264+02	2024-06-07 11:45:11.264+02	35	8
WINNER	1983	2024-06-07 13:09:28.424+02	2024-06-07 13:09:28.424+02	36	8
WINNER	1983	2024-06-09 12:28:32.236+02	2024-06-09 12:28:32.236+02	37	7
RUNNERUP	1983	2024-06-09 12:28:59.059+02	2024-06-09 12:28:59.059+02	37	1
RUNNERUP	1983	2024-06-10 16:39:59.461+02	2024-06-10 16:39:59.461+02	38	1
RUNNERUP	1983	2024-06-10 16:40:18.742+02	2024-06-10 16:40:18.742+02	38	6
RUNNERUP	1983	2024-06-11 16:07:06.101+02	2024-06-11 16:07:06.101+02	39	1
WINNER	1983	2024-06-11 16:07:19.475+02	2024-06-11 16:07:19.475+02	39	6
WINNER	1983	2024-06-15 12:23:34.178+02	2024-06-15 12:23:34.178+02	42	1
RUNNERUP	1984	2024-06-15 20:51:27.726+02	2024-06-15 20:51:27.726+02	44	6
WINNER	1984	2024-06-19 21:32:50.149+02	2024-06-19 21:32:50.149+02	45	6
RUNNERUP	1984	2024-06-20 16:20:19.293+02	2024-06-20 16:20:19.293+02	46	7
WINNER	1984	2024-06-20 16:44:14.16+02	2024-06-20 16:44:14.16+02	47	7
WINNER	1984	2024-06-21 11:39:23.816+02	2024-06-21 11:39:23.816+02	48	8
RUNNERUP	1984	2024-06-21 13:33:16.391+02	2024-06-21 13:33:16.391+02	49	1
WINNER	1984	2024-06-22 13:05:59.547+02	2024-06-22 13:05:59.547+02	50	1
RUNNERUP	1985	2024-06-23 11:03:39.352+02	2024-06-23 11:03:39.352+02	53	6
RUNNERUP	1985	2024-06-23 11:55:41.969+02	2024-06-23 11:55:41.969+02	55	6
WINNER	1985	2024-06-23 12:38:45.907+02	2024-06-23 12:38:45.907+02	56	6
WINNER	1985	2024-06-24 11:58:09.181+02	2024-06-24 11:58:09.181+02	57	7
RUNNERUP	1985	2024-06-24 12:36:23.833+02	2024-06-24 12:36:23.833+02	58	9
RUNNERUP	1985	2024-06-24 13:51:09.69+02	2024-06-24 13:51:09.69+02	59	8
WINNER	1985	2024-06-25 16:53:42.304+02	2024-06-25 16:53:42.304+02	60	8
RUNNERUP	1985	2024-06-25 16:54:39.325+02	2024-06-25 16:54:39.325+02	48	1
RUNNERUP	1985	2024-06-26 15:57:34.445+02	2024-06-26 15:57:34.445+02	61	1
WINNER	1985	2024-06-26 16:12:27.892+02	2024-06-26 16:12:27.892+02	62	1
WINNER	1986	2024-06-27 15:27:10.585+02	2024-06-27 15:27:10.585+02	63	1
RUNNERUP	1986	2024-06-27 15:28:02.236+02	2024-06-27 15:28:02.236+02	63	6
WINNER	1980	2024-07-04 16:38:16.395+02	2024-07-04 16:38:16.395+02	11	10
WINNER	1981	2024-07-05 10:38:49.121+02	2024-07-05 10:38:49.121+02	13	11
WINNER	1981	2024-07-05 11:20:45.926+02	2024-07-05 11:20:45.926+02	79	10
WINNER	1982	2024-07-05 11:49:28.42+02	2024-07-05 11:49:28.42+02	20	11
WINNER	1980	2024-07-06 11:31:04.972+02	2024-07-06 11:31:04.972+02	82	12
WINNER	1981	2024-07-06 11:31:29.138+02	2024-07-06 11:31:29.138+02	67	12
WINNER	1982	2024-07-06 11:53:50.557+02	2024-07-06 11:53:50.557+02	83	12
WINNER	1982	2024-07-06 13:36:33.235+02	2024-07-06 13:36:33.235+02	77	12
WINNER	1983	2024-07-08 16:30:51.543+02	2024-07-08 16:30:51.543+02	106	11
WINNER	1982	2024-07-10 15:19:58.658+02	2024-07-10 15:19:58.658+02	13	13
WINNER	1982	2024-07-10 15:20:37.027+02	2024-07-10 15:20:37.027+02	81	14
WINNER	1983	2024-07-10 15:21:40.93+02	2024-07-10 15:21:40.93+02	105	13
WINNER	1983	2024-07-10 15:22:07.007+02	2024-07-10 15:22:07.007+02	104	14
WINNER	1984	2024-07-10 15:23:35.05+02	2024-07-10 15:23:35.05+02	85	11
WINNER	1984	2024-07-10 15:24:11.776+02	2024-07-10 15:24:11.776+02	28	13
WINNER	1984	2024-07-10 15:31:56+02	2024-07-10 15:31:56+02	113	13
WINNER	1984	2024-07-10 15:33:39.217+02	2024-07-10 15:33:39.217+02	107	14
WINNER	1984	2024-07-10 15:53:37.926+02	2024-07-10 15:53:37.926+02	114	10
WINNER	1985	2024-07-11 15:38:11.474+02	2024-07-11 15:38:11.474+02	96	11
WINNER	1984	2024-07-11 15:45:26.998+02	2024-07-11 15:45:26.998+02	122	14
WINNER	1985	2024-07-11 15:57:15.191+02	2024-07-11 15:57:15.191+02	123	10
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
PLAYABLE	\N	2024-06-11 16:06:11.869+02	2024-06-11 16:06:11.869+02	19	39
PLAYABLE	\N	2024-06-12 15:39:17.538+02	2024-06-12 15:39:17.538+02	19	40
PLAYABLE	\N	2024-06-13 16:10:20.552+02	2024-06-13 16:10:20.552+02	20	41
SECONDARY	\N	2024-06-13 16:10:29.228+02	2024-06-13 16:10:29.228+02	21	41
ANTAGONIST	\N	2024-06-13 16:10:40.61+02	2024-06-13 16:10:40.61+02	22	41
PLAYABLE	\N	2024-06-22 13:05:45.451+02	2024-06-22 13:05:45.451+02	23	50
PLAYABLE	\N	2024-06-23 12:38:28.825+02	2024-06-23 12:38:28.825+02	24	56
PLAYABLE	\N	2024-07-05 11:20:20.847+02	2024-07-05 11:20:20.847+02	25	79
ANTAGONIST	\N	2024-07-05 11:20:27.626+02	2024-07-05 11:20:27.626+02	26	79
PLAYABLE	\N	2024-07-06 12:16:55.925+02	2024-07-06 12:16:55.925+02	27	84
PLAYABLE	\N	2024-07-06 13:00:51.976+02	2024-07-06 13:00:51.976+02	28	86
PLAYABLE	\N	2024-07-07 19:17:07.619+02	2024-07-07 19:17:07.619+02	29	100
ANTAGONIST	\N	2024-07-08 15:29:22.231+02	2024-07-08 15:29:22.231+02	11	102
PLAYABLE	\N	2024-07-08 15:44:53.918+02	2024-07-08 15:44:53.918+02	17	103
SECONDARY	\N	2024-07-08 15:45:02.168+02	2024-07-08 15:45:02.168+02	11	103
PLAYABLE	\N	2024-07-10 16:21:02.636+02	2024-07-10 16:21:02.636+02	5	116
ANTAGONIST	\N	2024-07-10 16:22:18.377+02	2024-07-10 16:22:18.377+02	9	116
ANTAGONIST	\N	2024-07-10 16:22:18.377+02	2024-07-10 16:22:18.377+02	14	116
ANTAGONIST	\N	2024-07-10 16:22:18.377+02	2024-07-10 16:22:18.377+02	6	116
ANTAGONIST	\N	2024-07-10 16:22:18.377+02	2024-07-10 16:22:18.377+02	7	116
ANTAGONIST	\N	2024-07-10 16:22:18.377+02	2024-07-10 16:22:18.377+02	8	116
PLAYABLE	\N	2024-07-10 20:50:51.723+02	2024-07-10 20:50:51.723+02	23	118
PLAYABLE	\N	2024-07-11 16:32:29.059+02	2024-07-11 16:32:29.059+02	30	124
SECONDARY	\N	2024-07-11 16:32:40.719+02	2024-07-11 16:32:40.719+02	31	124
PLAYABLE	\N	2024-07-15 13:24:48.968+02	2024-07-15 13:24:48.968+02	10	128
PLAYABLE	\N	2024-07-15 13:25:10.593+02	2024-07-15 13:25:10.593+02	18	128
SECONDARY	\N	2024-07-15 13:25:21.992+02	2024-07-15 13:25:21.992+02	33	128
ANTAGONIST	\N	2024-07-15 13:25:28.581+02	2024-07-15 13:25:28.581+02	32	128
SECONDARY	\N	2024-07-16 16:20:38.014+02	2024-07-16 16:20:38.014+02	34	128
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
DEVELOPER	\N	\N	2024-06-07 11:44:44.567+02	2024-06-07 11:44:44.567+02	38	35
DEVELOPER	\N	\N	2024-06-07 13:09:10.344+02	2024-06-07 13:09:10.344+02	39	36
DEVELOPER	\N	\N	2024-06-09 12:27:03.342+02	2024-06-09 12:27:03.342+02	41	37
DEVELOPER	\N	\N	2024-06-10 16:39:20.222+02	2024-06-10 16:39:20.222+02	39	38
DEVELOPER	\N	\N	2024-06-11 16:05:44.274+02	2024-06-11 16:05:44.274+02	43	39
DEVELOPER	\N	\N	2024-06-12 15:38:25.446+02	2024-06-12 15:38:25.446+02	44	40
DEVELOPER	\N	\N	2024-06-13 16:10:00.299+02	2024-06-13 16:10:00.299+02	46	41
DEVELOPER	\N	\N	2024-06-15 12:22:53.9+02	2024-06-15 12:22:53.9+02	47	42
PUBLISHER	\N	\N	2024-06-15 12:23:01.607+02	2024-06-15 12:23:01.607+02	50	42
DEVELOPER	\N	\N	2024-06-15 20:25:41.984+02	2024-06-15 20:25:41.984+02	31	43
PUBLISHER	\N	\N	2024-06-15 20:25:47.82+02	2024-06-15 20:25:47.82+02	32	43
DEVELOPER	\N	\N	2024-06-15 20:49:57.8+02	2024-06-15 20:49:57.8+02	51	44
DEVELOPER	\N	\N	2024-06-19 21:32:23.957+02	2024-06-19 21:32:23.957+02	52	45
DEVELOPER	\N	\N	2024-06-20 16:19:43.013+02	2024-06-20 16:19:43.013+02	53	46
DEVELOPER	\N	\N	2024-06-20 16:43:54.953+02	2024-06-20 16:43:54.953+02	55	47
DEVELOPER	\N	\N	2024-06-21 11:38:45.058+02	2024-06-21 11:38:45.058+02	57	48
DEVELOPER	\N	\N	2024-06-21 13:32:51.511+02	2024-06-21 13:32:51.511+02	21	49
DEVELOPER	\N	\N	2024-06-22 13:05:26.109+02	2024-06-22 13:05:26.109+02	47	50
DEVELOPER	\N	\N	2024-06-22 15:59:15.908+02	2024-06-22 15:59:15.908+02	31	51
PUBLISHER	\N	\N	2024-06-22 15:59:23.365+02	2024-06-22 15:59:23.365+02	32	51
PUBLISHER	\N	\N	2024-06-23 11:03:02.695+02	2024-06-23 11:03:02.695+02	60	53
DEVELOPER	\N	\N	2024-06-23 11:46:29.308+02	2024-06-23 11:46:29.308+02	30	54
DEVELOPER	\N	\N	2024-06-23 11:55:18.778+02	2024-06-23 11:55:18.778+02	30	55
DEVELOPER	\N	\N	2024-06-23 12:38:05.166+02	2024-06-23 12:38:05.166+02	61	56
DEVELOPER	\N	\N	2024-06-24 11:57:30.51+02	2024-06-24 11:57:30.51+02	62	57
DEVELOPER	\N	\N	2024-06-24 12:35:56.932+02	2024-06-24 12:35:56.932+02	11	58
DEVELOPER	\N	\N	2024-06-24 13:50:40.263+02	2024-06-24 13:50:40.263+02	51	59
DEVELOPER	\N	\N	2024-06-25 16:53:26.655+02	2024-06-25 16:53:26.655+02	21	60
DEVELOPER	\N	\N	2024-06-26 15:57:04.324+02	2024-06-26 15:57:04.324+02	24	61
PUBLISHER	\N	\N	2024-06-26 15:57:11.033+02	2024-06-26 15:57:11.033+02	60	61
DEVELOPER	\N	\N	2024-06-26 16:12:14.444+02	2024-06-26 16:12:14.444+02	41	62
DEVELOPER	\N	\N	2024-06-27 15:26:29.508+02	2024-06-27 15:26:29.508+02	11	63
DEVELOPER	\N	\N	2024-06-28 09:38:22.561+02	2024-06-28 09:38:22.561+02	30	64
DEVELOPER	\N	\N	2024-07-03 16:17:35.458+02	2024-07-03 16:17:35.458+02	11	65
DEVELOPER	\N	\N	2024-07-03 16:38:59.193+02	2024-07-03 16:38:59.193+02	67	66
DEVELOPER	\N	\N	2024-07-03 16:59:03.142+02	2024-07-03 16:59:03.142+02	11	67
DEVELOPER	\N	\N	2024-07-03 19:50:02.501+02	2024-07-03 19:50:02.501+02	11	68
DEVELOPER	\N	\N	2024-07-03 20:20:58.065+02	2024-07-03 20:20:58.065+02	69	69
DEVELOPER	\N	\N	2024-07-03 20:43:38.028+02	2024-07-03 20:43:38.028+02	11	70
DEVELOPER	\N	\N	2024-07-04 15:48:44.434+02	2024-07-04 15:48:44.434+02	11	71
DEVELOPER	\N	\N	2024-07-04 16:02:38.707+02	2024-07-04 16:02:38.707+02	17	72
DEVELOPER	\N	\N	2024-07-04 16:16:33.193+02	2024-07-04 16:16:33.193+02	11	73
DEVELOPER	\N	\N	2024-07-04 16:30:15.055+02	2024-07-04 16:30:15.055+02	1	74
DEVELOPER	\N	\N	2024-07-04 16:52:19.515+02	2024-07-04 16:52:19.515+02	11	75
DEVELOPER	\N	\N	2024-07-05 08:54:24.949+02	2024-07-05 08:54:24.949+02	73	76
DEVELOPER	\N	\N	2024-07-05 09:10:31.59+02	2024-07-05 09:10:31.59+02	11	77
DEVELOPER	\N	\N	2024-07-05 10:26:47.486+02	2024-07-05 10:26:47.486+02	8	78
DEVELOPER	\N	\N	2024-07-05 11:20:00.604+02	2024-07-05 11:20:00.604+02	11	79
DEVELOPER	\N	\N	2024-07-05 13:16:49.736+02	2024-07-05 13:16:49.736+02	76	80
DEVELOPER	\N	\N	2024-07-06 10:53:55.78+02	2024-07-06 10:53:55.78+02	11	81
DEVELOPER	\N	\N	2024-07-06 11:10:00.551+02	2024-07-06 11:10:00.551+02	11	82
DEVELOPER	\N	\N	2024-07-06 11:53:26.695+02	2024-07-06 11:53:26.695+02	9	83
DEVELOPER	\N	\N	2024-07-06 12:16:23.973+02	2024-07-06 12:16:23.973+02	18	84
DEVELOPER	\N	\N	2024-07-06 12:35:44.648+02	2024-07-06 12:35:44.648+02	18	85
DEVELOPER	\N	\N	2024-07-06 13:00:20.884+02	2024-07-06 13:00:20.884+02	77	86
DEVELOPER	\N	\N	2024-07-06 13:16:49.615+02	2024-07-06 13:16:49.615+02	1	87
DEVELOPER	\N	\N	2024-07-06 13:35:02.339+02	2024-07-06 13:35:02.339+02	30	88
DEVELOPER	\N	\N	2024-07-06 19:03:07.666+02	2024-07-06 19:03:07.666+02	18	89
DEVELOPER	\N	\N	2024-07-06 19:16:10.855+02	2024-07-06 19:16:10.855+02	1	90
PUBLISHER	\N	\N	2024-07-06 19:16:20.259+02	2024-07-06 19:16:20.259+02	17	90
DEVELOPER	\N	\N	2024-07-06 19:43:58.308+02	2024-07-06 19:43:58.308+02	78	91
PUBLISHER	\N	\N	2024-07-06 19:44:04.627+02	2024-07-06 19:44:04.627+02	1	91
DEVELOPER	\N	\N	2024-07-06 20:00:09.905+02	2024-07-06 20:00:09.905+02	14	92
DEVELOPER	\N	\N	2024-07-06 20:13:44.901+02	2024-07-06 20:13:44.901+02	17	93
DEVELOPER	\N	\N	2024-07-07 11:21:35.181+02	2024-07-07 11:21:35.181+02	30	94
DEVELOPER	\N	\N	2024-07-07 11:34:53.953+02	2024-07-07 11:34:53.953+02	18	95
DEVELOPER	\N	\N	2024-07-07 12:00:51.184+02	2024-07-07 12:00:51.184+02	11	96
DEVELOPER	\N	\N	2024-07-07 12:35:35.815+02	2024-07-07 12:35:35.815+02	80	97
PUBLISHER	\N	\N	2024-07-07 12:35:41.445+02	2024-07-07 12:35:41.445+02	32	97
DEVELOPER	\N	\N	2024-07-07 13:02:34.143+02	2024-07-07 13:02:34.143+02	81	98
PUBLISHER	\N	\N	2024-07-07 13:02:39.94+02	2024-07-07 13:02:39.94+02	29	98
DEVELOPER	\N	\N	2024-07-07 13:22:03.634+02	2024-07-07 13:22:03.634+02	82	99
PUBLISHER	\N	\N	2024-07-07 13:22:08.482+02	2024-07-07 13:22:08.482+02	29	99
DEVELOPER	\N	\N	2024-07-07 19:16:42.304+02	2024-07-07 19:16:42.304+02	68	100
DEVELOPER	\N	\N	2024-07-07 19:52:38.592+02	2024-07-07 19:52:38.592+02	83	101
DEVELOPER	\N	\N	2024-07-08 15:27:01.459+02	2024-07-08 15:27:01.459+02	31	102
PUBLISHER	\N	\N	2024-07-08 15:27:09.012+02	2024-07-08 15:27:09.012+02	32	102
DEVELOPER	\N	\N	2024-07-08 15:44:32.41+02	2024-07-08 15:44:32.41+02	86	103
PUBLISHER	\N	\N	2024-07-08 15:44:39.439+02	2024-07-08 15:44:39.439+02	32	103
DEVELOPER	\N	\N	2024-07-08 16:06:14.392+02	2024-07-08 16:06:14.392+02	87	104
DEVELOPER	\N	\N	2024-07-08 16:20:49.771+02	2024-07-08 16:20:49.771+02	88	105
DEVELOPER	\N	\N	2024-07-08 16:30:29.389+02	2024-07-08 16:30:29.389+02	17	106
DEVELOPER	\N	\N	2024-07-08 16:51:51.671+02	2024-07-08 16:51:51.671+02	87	107
DEVELOPER	\N	\N	2024-07-09 15:42:52.623+02	2024-07-09 15:42:52.623+02	61	108
DEVELOPER	\N	\N	2024-07-09 16:09:25.313+02	2024-07-09 16:09:25.313+02	90	109
DEVELOPER	\N	\N	2024-07-09 16:25:07.417+02	2024-07-09 16:25:07.417+02	91	110
PUBLISHER	\N	\N	2024-07-09 16:25:11.88+02	2024-07-09 16:25:11.88+02	90	110
DEVELOPER	\N	\N	2024-07-09 16:49:20.582+02	2024-07-09 16:49:20.582+02	92	111
DEVELOPER	\N	\N	2024-07-09 17:04:39.751+02	2024-07-09 17:04:39.751+02	30	112
DEVELOPER	\N	\N	2024-07-10 15:31:42.059+02	2024-07-10 15:31:42.059+02	77	113
DEVELOPER	\N	\N	2024-07-10 15:53:28.067+02	2024-07-10 15:53:28.067+02	94	114
DEVELOPER	\N	\N	2024-07-10 16:01:12.274+02	2024-07-10 16:01:12.274+02	18	115
DEVELOPER	\N	\N	2024-07-10 16:19:28.837+02	2024-07-10 16:19:28.837+02	18	116
DEVELOPER	\N	\N	2024-07-10 16:47:39.6+02	2024-07-10 16:47:39.6+02	11	117
DEVELOPER	\N	\N	2024-07-10 20:50:39.746+02	2024-07-10 20:50:39.746+02	47	118
DEVELOPER	\N	\N	2024-07-10 21:09:40.876+02	2024-07-10 21:09:40.876+02	31	119
PUBLISHER	\N	\N	2024-07-10 21:09:46.574+02	2024-07-10 21:09:46.574+02	32	119
DEVELOPER	\N	\N	2024-07-10 21:29:16.223+02	2024-07-10 21:29:16.223+02	31	120
PUBLISHER	\N	\N	2024-07-10 21:29:21.753+02	2024-07-10 21:29:21.753+02	32	120
DEVELOPER	\N	\N	2024-07-11 15:30:56.55+02	2024-07-11 15:30:56.55+02	21	121
DEVELOPER	\N	\N	2024-07-11 15:44:47.136+02	2024-07-11 15:44:47.136+02	28	122
DEVELOPER	\N	\N	2024-07-11 15:57:02.745+02	2024-07-11 15:57:02.745+02	29	123
DEVELOPER	\N	\N	2024-07-11 16:31:45.143+02	2024-07-11 16:31:45.143+02	61	124
DEVELOPER	\N	\N	2024-07-12 09:22:34.5+02	2024-07-12 09:22:34.5+02	1	125
DEVELOPER	\N	\N	2024-07-12 13:41:17.846+02	2024-07-12 13:41:17.846+02	1	126
DEVELOPER	\N	\N	2024-07-15 12:33:16.775+02	2024-07-15 12:33:16.775+02	31	127
PUBLISHER	\N	\N	2024-07-15 12:33:23.809+02	2024-07-15 12:33:23.809+02	32	127
DEVELOPER	\N	\N	2024-07-15 13:24:35.453+02	2024-07-15 13:24:35.453+02	95	128
PUBLISHER	\N	\N	2024-07-15 13:24:41.17+02	2024-07-15 13:24:41.17+02	32	128
DEVELOPER	\N	\N	2024-07-16 16:58:42.489+02	2024-07-16 16:58:42.489+02	11	129
DEVELOPER	\N	\N	2024-07-16 22:58:09.323+02	2024-07-16 22:58:09.323+02	28	130
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
\N	2024-05-31 14:30:50.391+02	2024-05-31 14:30:50.391+02	30	2
\N	2024-06-01 13:13:34.169+02	2024-06-01 13:13:34.169+02	31	8
\N	2024-06-04 17:02:29.526+02	2024-06-04 17:02:29.526+02	33	2
\N	2024-06-05 17:38:13.109+02	2024-06-05 17:38:13.109+02	34	2
\N	2024-06-07 11:31:56.526+02	2024-06-07 11:31:56.526+02	29	28
\N	2024-06-07 11:43:56.748+02	2024-06-07 11:43:56.748+02	35	28
\N	2024-06-07 13:08:55.443+02	2024-06-07 13:08:55.443+02	36	27
\N	2024-06-09 12:26:17.491+02	2024-06-09 12:26:17.491+02	37	12
\N	2024-06-10 16:38:37.058+02	2024-06-10 16:38:37.058+02	38	8
\N	2024-06-11 16:05:20.197+02	2024-06-11 16:05:20.197+02	39	2
\N	2024-06-12 15:37:03.795+02	2024-06-12 15:37:03.795+02	40	2
\N	2024-06-13 16:08:27.472+02	2024-06-13 16:08:27.472+02	41	29
\N	2024-06-15 12:22:02.933+02	2024-06-15 12:22:02.933+02	42	8
\N	2024-06-15 12:22:02.933+02	2024-06-15 12:22:02.933+02	42	2
\N	2024-06-15 20:25:02.878+02	2024-06-15 20:25:02.878+02	43	31
\N	2024-06-15 20:49:43.652+02	2024-06-15 20:49:43.652+02	44	27
\N	2024-06-15 20:49:43.652+02	2024-06-15 20:49:43.652+02	44	23
\N	2024-06-19 21:32:05.52+02	2024-06-19 21:32:05.52+02	45	32
\N	2024-06-20 16:19:05.774+02	2024-06-20 16:19:05.774+02	46	8
\N	2024-06-20 16:43:36.957+02	2024-06-20 16:43:36.957+02	47	22
\N	2024-06-21 11:38:10.323+02	2024-06-21 11:38:10.323+02	48	35
\N	2024-06-21 11:38:10.323+02	2024-06-21 11:38:10.323+02	48	6
\N	2024-06-21 13:31:59.44+02	2024-06-21 13:31:59.44+02	49	37
\N	2024-06-22 13:04:31.15+02	2024-06-22 13:04:31.15+02	50	38
\N	2024-06-22 13:04:31.15+02	2024-06-22 13:04:31.15+02	50	28
\N	2024-06-22 15:54:36.247+02	2024-06-22 15:54:36.247+02	51	39
\N	2024-06-22 15:54:36.247+02	2024-06-22 15:54:36.247+02	51	40
\N	2024-06-22 16:35:18.209+02	2024-06-22 16:35:18.209+02	52	27
\N	2024-06-23 11:02:13.908+02	2024-06-23 11:02:13.908+02	53	8
\N	2024-06-23 11:45:20.523+02	2024-06-23 11:45:20.523+02	54	32
\N	2024-06-23 11:54:42.806+02	2024-06-23 11:54:42.806+02	55	32
\N	2024-06-23 12:36:41.238+02	2024-06-23 12:36:41.238+02	56	41
\N	2024-06-23 12:36:41.238+02	2024-06-23 12:36:41.238+02	56	15
\N	2024-06-24 11:56:41.914+02	2024-06-24 11:56:41.914+02	57	43
\N	2024-06-24 12:35:37.125+02	2024-06-24 12:35:37.125+02	58	45
\N	2024-06-24 13:49:18.307+02	2024-06-24 13:49:18.307+02	59	22
\N	2024-06-25 16:53:07.771+02	2024-06-25 16:53:07.771+02	60	46
\N	2024-06-26 15:56:38.42+02	2024-06-26 15:56:38.42+02	61	32
\N	2024-06-26 16:11:56.644+02	2024-06-26 16:11:56.644+02	62	48
\N	2024-06-27 15:25:56.953+02	2024-06-27 15:25:56.953+02	63	49
\N	2024-06-27 15:25:56.953+02	2024-06-27 15:25:56.953+02	63	21
\N	2024-06-28 09:36:15.811+02	2024-06-28 09:36:15.811+02	64	8
\N	2024-07-03 16:17:04.814+02	2024-07-03 16:17:04.814+02	65	50
\N	2024-07-03 16:38:39.565+02	2024-07-03 16:38:39.565+02	66	2
\N	2024-07-03 16:56:50.491+02	2024-07-03 16:56:50.491+02	67	38
\N	2024-07-03 19:49:26.691+02	2024-07-03 19:49:26.691+02	68	8
\N	2024-07-03 20:20:42.164+02	2024-07-03 20:20:42.164+02	69	15
\N	2024-07-03 20:20:42.164+02	2024-07-03 20:20:42.164+02	69	50
\N	2024-07-03 20:20:42.164+02	2024-07-03 20:20:42.164+02	69	23
\N	2024-07-03 20:43:18.164+02	2024-07-03 20:43:18.164+02	70	52
\N	2024-07-04 15:48:25.597+02	2024-07-04 15:48:25.597+02	71	52
\N	2024-07-04 16:02:18.107+02	2024-07-04 16:02:18.107+02	72	8
\N	2024-07-04 16:16:21.878+02	2024-07-04 16:16:21.878+02	73	50
\N	2024-07-04 16:16:21.878+02	2024-07-04 16:16:21.878+02	73	53
\N	2024-07-04 16:30:01.998+02	2024-07-04 16:30:01.998+02	74	23
\N	2024-07-04 16:51:51.444+02	2024-07-04 16:51:51.444+02	75	8
\N	2024-07-05 08:53:16.135+02	2024-07-05 08:53:16.135+02	76	54
\N	2024-07-05 08:53:37.406+02	2024-07-05 08:53:37.406+02	76	21
\N	2024-07-05 09:10:01.461+02	2024-07-05 09:10:01.461+02	77	8
\N	2024-07-05 10:26:08.407+02	2024-07-05 10:26:08.407+02	78	55
\N	2024-07-05 10:26:08.407+02	2024-07-05 10:26:08.407+02	78	44
\N	2024-07-05 11:19:31.998+02	2024-07-05 11:19:31.998+02	79	38
\N	2024-07-05 13:15:55.018+02	2024-07-05 13:15:55.018+02	80	8
\N	2024-07-06 10:52:34.861+02	2024-07-06 10:52:34.861+02	81	35
\N	2024-07-06 10:53:04.018+02	2024-07-06 10:53:04.018+02	81	6
\N	2024-07-06 11:09:45.587+02	2024-07-06 11:09:45.587+02	82	56
\N	2024-07-06 11:53:12.897+02	2024-07-06 11:53:12.897+02	83	57
\N	2024-07-06 12:15:17.467+02	2024-07-06 12:15:17.467+02	84	23
\N	2024-07-06 12:15:17.467+02	2024-07-06 12:15:17.467+02	84	38
\N	2024-07-06 12:34:41.945+02	2024-07-06 12:34:41.945+02	85	58
\N	2024-07-06 12:43:38.789+02	2024-07-06 12:43:38.789+02	32	38
\N	2024-07-06 12:59:23.697+02	2024-07-06 12:59:23.697+02	86	23
\N	2024-07-06 12:59:23.697+02	2024-07-06 12:59:23.697+02	86	38
\N	2024-07-06 13:15:55.806+02	2024-07-06 13:15:55.806+02	87	8
\N	2024-07-06 13:34:46.589+02	2024-07-06 13:34:46.589+02	88	8
\N	2024-07-06 19:02:16.521+02	2024-07-06 19:02:16.521+02	89	58
\N	2024-07-06 19:15:51.241+02	2024-07-06 19:15:51.241+02	90	59
\N	2024-07-06 19:15:51.241+02	2024-07-06 19:15:51.241+02	90	6
\N	2024-07-06 19:43:37.593+02	2024-07-06 19:43:37.593+02	91	60
\N	2024-07-06 19:58:50.992+02	2024-07-06 19:58:50.992+02	92	2
\N	2024-07-06 19:58:50.992+02	2024-07-06 19:58:50.992+02	92	38
\N	2024-07-06 20:13:04.89+02	2024-07-06 20:13:04.89+02	93	34
\N	2024-07-07 11:20:41.211+02	2024-07-07 11:20:41.211+02	94	8
\N	2024-07-07 11:33:47.482+02	2024-07-07 11:33:47.482+02	95	8
\N	2024-07-07 12:00:18.156+02	2024-07-07 12:00:18.156+02	96	59
\N	2024-07-07 12:35:13.058+02	2024-07-07 12:35:13.058+02	97	61
\N	2024-07-07 13:01:47.639+02	2024-07-07 13:01:47.639+02	98	43
\N	2024-07-07 13:20:17.15+02	2024-07-07 13:20:17.15+02	99	62
\N	2024-07-07 13:20:17.15+02	2024-07-07 13:20:17.15+02	99	43
\N	2024-07-07 19:15:47.603+02	2024-07-07 19:15:47.603+02	100	23
\N	2024-07-07 19:15:47.603+02	2024-07-07 19:15:47.603+02	100	38
\N	2024-07-07 19:52:03.738+02	2024-07-07 19:52:03.738+02	101	63
\N	2024-07-07 19:52:03.738+02	2024-07-07 19:52:03.738+02	101	15
\N	2024-07-08 15:23:13.688+02	2024-07-08 15:23:13.688+02	102	8
\N	2024-07-08 15:43:48.485+02	2024-07-08 15:43:48.485+02	103	10
\N	2024-07-08 16:05:51.072+02	2024-07-08 16:05:51.072+02	104	64
\N	2024-07-08 16:19:28.894+02	2024-07-08 16:19:28.894+02	105	8
\N	2024-07-08 16:30:10.56+02	2024-07-08 16:30:10.56+02	106	15
\N	2024-07-08 16:50:57.968+02	2024-07-08 16:50:57.968+02	107	27
\N	2024-07-08 16:50:57.968+02	2024-07-08 16:50:57.968+02	107	2
\N	2024-07-09 15:41:44.64+02	2024-07-09 15:41:44.64+02	108	8
\N	2024-07-09 16:08:56.483+02	2024-07-09 16:08:56.483+02	109	59
\N	2024-07-09 16:08:56.483+02	2024-07-09 16:08:56.483+02	109	29
\N	2024-07-09 16:24:42.23+02	2024-07-09 16:24:42.23+02	110	48
\N	2024-07-09 16:24:42.23+02	2024-07-09 16:24:42.23+02	110	65
\N	2024-07-09 16:26:43.695+02	2024-07-09 16:26:43.695+02	62	65
\N	2024-07-09 16:48:40.966+02	2024-07-09 16:48:40.966+02	111	25
\N	2024-07-09 17:04:22.879+02	2024-07-09 17:04:22.879+02	112	48
\N	2024-07-10 15:31:07.639+02	2024-07-10 15:31:07.639+02	113	23
\N	2024-07-10 15:51:55.232+02	2024-07-10 15:51:55.232+02	114	2
\N	2024-07-10 15:51:55.232+02	2024-07-10 15:51:55.232+02	114	27
\N	2024-07-10 16:00:49.214+02	2024-07-10 16:00:49.214+02	115	8
\N	2024-07-10 16:18:39.257+02	2024-07-10 16:18:39.257+02	116	2
\N	2024-07-10 16:46:52.675+02	2024-07-10 16:46:52.675+02	117	28
\N	2024-07-10 16:46:52.675+02	2024-07-10 16:46:52.675+02	117	27
\N	2024-07-10 20:50:21.445+02	2024-07-10 20:50:21.445+02	118	38
\N	2024-07-10 21:09:08.764+02	2024-07-10 21:09:08.764+02	119	2
\N	2024-07-10 21:27:53.117+02	2024-07-10 21:27:53.117+02	120	2
\N	2024-07-11 15:30:15.121+02	2024-07-11 15:30:15.121+02	121	2
\N	2024-07-11 15:44:08.463+02	2024-07-11 15:44:08.463+02	122	20
\N	2024-07-11 15:54:36.98+02	2024-07-11 15:54:36.98+02	123	56
\N	2024-07-11 16:30:50.203+02	2024-07-11 16:30:50.203+02	124	2
\N	2024-07-11 16:30:50.203+02	2024-07-11 16:30:50.203+02	124	38
\N	2024-07-12 09:10:17.622+02	2024-07-12 09:10:17.622+02	85	52
\N	2024-07-12 09:10:28.238+02	2024-07-12 09:10:28.238+02	89	52
\N	2024-07-12 09:10:58.769+02	2024-07-12 09:10:58.769+02	71	67
\N	2024-07-12 09:21:35.089+02	2024-07-12 09:21:35.089+02	125	52
\N	2024-07-12 09:21:35.089+02	2024-07-12 09:21:35.089+02	125	66
\N	2024-07-12 13:40:34.238+02	2024-07-12 13:40:34.238+02	126	59
\N	2024-07-15 12:32:08.171+02	2024-07-15 12:32:08.171+02	127	66
\N	2024-07-15 12:32:08.171+02	2024-07-15 12:32:08.171+02	127	52
\N	2024-07-15 13:20:09.496+02	2024-07-15 13:20:09.496+02	128	2
\N	2024-07-16 16:57:16.755+02	2024-07-16 16:57:16.755+02	129	37
\N	2024-07-16 16:57:16.755+02	2024-07-16 16:57:16.755+02	129	38
\N	2024-07-16 22:57:47.444+02	2024-07-16 22:57:47.444+02	130	20
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
\N	2024-06-07 11:44:37.254+02	2024-06-07 11:44:37.254+02	33	35
\N	2024-06-09 12:26:47.572+02	2024-06-09 12:26:47.572+02	34	37
\N	2024-06-11 16:05:28.432+02	2024-06-11 16:05:28.432+02	35	39
\N	2024-06-12 15:37:53.905+02	2024-06-12 15:37:53.905+02	35	40
\N	2024-06-13 16:09:03.677+02	2024-06-13 16:09:03.677+02	36	41
\N	2024-06-15 12:22:37.133+02	2024-06-15 12:22:37.133+02	37	42
\N	2024-06-15 12:22:37.133+02	2024-06-15 12:22:37.133+02	38	42
\N	2024-06-15 20:25:13.041+02	2024-06-15 20:25:13.041+02	27	43
\N	2024-06-15 20:49:51.733+02	2024-06-15 20:49:51.733+02	39	44
\N	2024-06-19 21:32:16.504+02	2024-06-19 21:32:16.504+02	40	45
\N	2024-06-20 16:19:23.711+02	2024-06-20 16:19:23.711+02	41	46
\N	2024-06-20 16:43:49.135+02	2024-06-20 16:43:49.135+02	42	47
\N	2024-06-21 11:38:25.512+02	2024-06-21 11:38:25.512+02	43	48
\N	2024-06-21 13:32:20.994+02	2024-06-21 13:32:20.994+02	30	49
\N	2024-06-22 13:05:03.895+02	2024-06-22 13:05:03.895+02	37	50
\N	2024-06-22 13:05:03.895+02	2024-06-22 13:05:03.895+02	38	50
\N	2024-06-22 16:35:24.762+02	2024-06-22 16:35:24.762+02	44	52
\N	2024-06-23 11:02:27.568+02	2024-06-23 11:02:27.568+02	45	53
\N	2024-06-23 12:37:04.652+02	2024-06-23 12:37:04.652+02	46	56
\N	2024-06-25 16:53:14.062+02	2024-06-25 16:53:14.062+02	30	60
\N	2024-06-27 15:26:23.168+02	2024-06-27 15:26:23.168+02	12	63
\N	2024-06-28 09:36:47.409+02	2024-06-28 09:36:47.409+02	47	64
\N	2024-07-03 16:58:41.909+02	2024-07-03 16:58:41.909+02	48	67
\N	2024-07-03 19:49:40.561+02	2024-07-03 19:49:40.561+02	9	68
\N	2024-07-04 16:02:24.826+02	2024-07-04 16:02:24.826+02	49	72
\N	2024-07-04 16:52:02.245+02	2024-07-04 16:52:02.245+02	50	75
\N	2024-07-05 08:54:05.069+02	2024-07-05 08:54:05.069+02	51	76
\N	2024-07-05 08:54:05.069+02	2024-07-05 08:54:05.069+02	52	76
\N	2024-07-05 09:10:16.737+02	2024-07-05 09:10:16.737+02	50	77
\N	2024-07-05 10:26:31.55+02	2024-07-05 10:26:31.55+02	53	78
\N	2024-07-05 11:19:44.207+02	2024-07-05 11:19:44.207+02	54	79
\N	2024-07-06 10:53:19.708+02	2024-07-06 10:53:19.708+02	55	81
\N	2024-07-06 13:34:54.143+02	2024-07-06 13:34:54.143+02	56	88
\N	2024-07-07 11:34:20.199+02	2024-07-07 11:34:20.199+02	57	95
\N	2024-07-07 12:35:20.465+02	2024-07-07 12:35:20.465+02	58	97
\N	2024-07-07 13:02:01.566+02	2024-07-07 13:02:01.566+02	59	98
\N	2024-07-08 15:26:17.155+02	2024-07-08 15:26:17.155+02	27	102
\N	2024-07-08 16:19:38.554+02	2024-07-08 16:19:38.554+02	60	105
\N	2024-07-08 16:51:13.959+02	2024-07-08 16:51:13.959+02	61	107
\N	2024-07-09 15:42:22.803+02	2024-07-09 15:42:22.803+02	56	108
\N	2024-07-09 16:09:10.464+02	2024-07-09 16:09:10.464+02	62	109
\N	2024-07-09 16:48:53.385+02	2024-07-09 16:48:53.385+02	63	111
\N	2024-07-10 16:19:40.456+02	2024-07-10 16:19:40.456+02	62	116
\N	2024-07-10 16:46:59.817+02	2024-07-10 16:46:59.817+02	64	117
\N	2024-07-10 20:50:29.455+02	2024-07-10 20:50:29.455+02	37	118
\N	2024-07-10 20:50:29.455+02	2024-07-10 20:50:29.455+02	38	118
\N	2024-07-10 21:28:36.586+02	2024-07-10 21:28:36.586+02	65	120
\N	2024-07-11 15:30:21.127+02	2024-07-11 15:30:21.127+02	30	121
\N	2024-07-11 15:44:21+02	2024-07-11 15:44:21+02	24	122
\N	2024-07-11 16:31:28.019+02	2024-07-11 16:31:28.019+02	46	124
\N	2024-07-12 09:21:45.509+02	2024-07-12 09:21:45.509+02	66	125
\N	2024-07-12 13:40:41.267+02	2024-07-12 13:40:41.267+02	66	126
\N	2024-07-15 12:32:19.461+02	2024-07-15 12:32:19.461+02	27	127
\N	2024-07-15 13:20:16.516+02	2024-07-15 13:20:16.516+02	27	128
\N	2024-07-16 22:58:01.477+02	2024-07-16 22:58:01.477+02	24	130
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
\N	2024-06-07 11:44:30.292+02	2024-06-07 11:44:30.292+02	35	4
\N	2024-06-07 13:09:04.533+02	2024-06-07 13:09:04.533+02	36	4
\N	2024-06-09 12:26:54.09+02	2024-06-09 12:26:54.09+02	37	4
\N	2024-06-10 16:39:13.955+02	2024-06-10 16:39:13.955+02	38	4
\N	2024-06-11 16:05:35.26+02	2024-06-11 16:05:35.26+02	39	4
\N	2024-06-12 15:38:14.109+02	2024-06-12 15:38:14.109+02	40	4
\N	2024-06-13 16:09:51.228+02	2024-06-13 16:09:51.228+02	41	5
\N	2024-06-13 16:09:51.228+02	2024-06-13 16:09:51.228+02	41	4
\N	2024-06-15 12:22:43.41+02	2024-06-15 12:22:43.41+02	42	4
\N	2024-06-15 20:25:27.555+02	2024-06-15 20:25:27.555+02	43	5
\N	2024-06-15 20:25:27.555+02	2024-06-15 20:25:27.555+02	43	12
\N	2024-06-15 20:50:48.602+02	2024-06-15 20:50:48.602+02	44	5
\N	2024-06-15 20:50:48.602+02	2024-06-15 20:50:48.602+02	44	4
\N	2024-06-15 20:50:48.602+02	2024-06-15 20:50:48.602+02	44	10
\N	2024-06-15 20:50:48.602+02	2024-06-15 20:50:48.602+02	44	12
\N	2024-06-20 16:19:30.148+02	2024-06-20 16:19:30.148+02	46	4
\N	2024-06-20 16:44:02.528+02	2024-06-20 16:44:02.528+02	47	4
\N	2024-06-21 11:38:36.383+02	2024-06-21 11:38:36.383+02	48	4
\N	2024-06-21 11:38:36.383+02	2024-06-21 11:38:36.383+02	48	12
\N	2024-06-21 13:32:37.273+02	2024-06-21 13:32:37.273+02	49	4
\N	2024-06-21 13:32:37.273+02	2024-06-21 13:32:37.273+02	49	12
\N	2024-06-21 13:32:37.273+02	2024-06-21 13:32:37.273+02	49	8
\N	2024-06-22 13:05:20.347+02	2024-06-22 13:05:20.347+02	50	4
\N	2024-06-22 15:59:49.683+02	2024-06-22 15:59:49.683+02	51	12
\N	2024-06-22 15:59:49.683+02	2024-06-22 15:59:49.683+02	51	5
\N	2024-06-22 16:35:33.118+02	2024-06-22 16:35:33.118+02	52	4
\N	2024-06-22 16:35:33.118+02	2024-06-22 16:35:33.118+02	52	12
\N	2024-06-22 16:49:39.061+02	2024-06-22 16:49:39.061+02	49	14
\N	2024-06-23 11:02:46.372+02	2024-06-23 11:02:46.372+02	53	4
\N	2024-06-23 11:02:46.372+02	2024-06-23 11:02:46.372+02	53	12
\N	2024-06-23 11:46:21.772+02	2024-06-23 11:46:21.772+02	54	5
\N	2024-06-23 11:46:21.772+02	2024-06-23 11:46:21.772+02	54	4
\N	2024-06-23 11:46:21.772+02	2024-06-23 11:46:21.772+02	54	8
\N	2024-06-23 11:46:21.772+02	2024-06-23 11:46:21.772+02	54	12
\N	2024-06-23 11:55:06.469+02	2024-06-23 11:55:06.469+02	55	5
\N	2024-06-23 11:55:06.469+02	2024-06-23 11:55:06.469+02	55	4
\N	2024-06-23 11:55:06.469+02	2024-06-23 11:55:06.469+02	55	13
\N	2024-06-23 12:37:23.515+02	2024-06-23 12:37:23.515+02	56	5
\N	2024-06-23 12:37:23.515+02	2024-06-23 12:37:23.515+02	56	8
\N	2024-06-23 12:37:23.515+02	2024-06-23 12:37:23.515+02	56	9
\N	2024-06-23 12:37:23.515+02	2024-06-23 12:37:23.515+02	56	12
\N	2024-06-23 12:37:44.539+02	2024-06-23 12:37:44.539+02	56	4
\N	2024-06-24 11:57:15.595+02	2024-06-24 11:57:15.595+02	57	4
\N	2024-06-24 12:35:49.983+02	2024-06-24 12:35:49.983+02	58	8
\N	2024-06-24 13:49:58.239+02	2024-06-24 13:49:58.239+02	59	4
\N	2024-06-24 13:49:58.239+02	2024-06-24 13:49:58.239+02	59	12
\N	2024-06-24 13:49:58.239+02	2024-06-24 13:49:58.239+02	59	14
\N	2024-06-25 16:53:20.8+02	2024-06-25 16:53:20.8+02	60	4
\N	2024-06-26 15:56:56.447+02	2024-06-26 15:56:56.447+02	61	4
\N	2024-06-26 16:12:05.243+02	2024-06-26 16:12:05.243+02	62	4
\N	2024-06-27 15:29:59.292+02	2024-06-27 15:29:59.292+02	63	5
\N	2024-06-27 15:29:59.292+02	2024-06-27 15:29:59.292+02	63	4
\N	2024-06-27 15:29:59.292+02	2024-06-27 15:29:59.292+02	63	12
\N	2024-06-27 15:29:59.292+02	2024-06-27 15:29:59.292+02	63	14
\N	2024-06-28 09:38:13.162+02	2024-06-28 09:38:13.162+02	64	5
\N	2024-06-28 09:38:13.162+02	2024-06-28 09:38:13.162+02	64	4
\N	2024-06-28 09:38:13.162+02	2024-06-28 09:38:13.162+02	64	12
\N	2024-07-03 16:17:29.314+02	2024-07-03 16:17:29.314+02	65	5
\N	2024-07-03 16:17:29.314+02	2024-07-03 16:17:29.314+02	65	8
\N	2024-07-03 16:38:47.709+02	2024-07-03 16:38:47.709+02	66	5
\N	2024-07-03 16:38:47.709+02	2024-07-03 16:38:47.709+02	66	8
\N	2024-07-03 16:59:10.272+02	2024-07-03 16:59:10.272+02	67	8
\N	2024-07-03 19:49:55.73+02	2024-07-03 19:49:55.73+02	68	5
\N	2024-07-03 20:20:51.443+02	2024-07-03 20:20:51.443+02	69	5
\N	2024-07-03 20:43:26.551+02	2024-07-03 20:43:26.551+02	70	5
\N	2024-07-04 15:48:33.759+02	2024-07-04 15:48:33.759+02	71	5
\N	2024-07-04 15:48:33.759+02	2024-07-04 15:48:33.759+02	71	8
\N	2024-07-04 16:02:59.824+02	2024-07-04 16:02:59.824+02	72	5
\N	2024-07-04 16:16:27.948+02	2024-07-04 16:16:27.948+02	73	8
\N	2024-07-04 16:30:09.442+02	2024-07-04 16:30:09.442+02	74	5
\N	2024-07-04 16:52:10.73+02	2024-07-04 16:52:10.73+02	75	5
\N	2024-07-04 16:52:10.73+02	2024-07-04 16:52:10.73+02	75	8
\N	2024-07-04 16:52:10.73+02	2024-07-04 16:52:10.73+02	75	11
\N	2024-07-05 08:54:14.302+02	2024-07-05 08:54:14.302+02	76	4
\N	2024-07-05 08:54:14.302+02	2024-07-05 08:54:14.302+02	76	12
\N	2024-07-05 09:10:24.943+02	2024-07-05 09:10:24.943+02	77	5
\N	2024-07-05 09:10:24.943+02	2024-07-05 09:10:24.943+02	77	4
\N	2024-07-05 10:26:38.257+02	2024-07-05 10:26:38.257+02	78	9
\N	2024-07-05 11:19:51.604+02	2024-07-05 11:19:51.604+02	79	8
\N	2024-07-05 13:16:37.806+02	2024-07-05 13:16:37.806+02	80	8
\N	2024-07-05 13:16:37.806+02	2024-07-05 13:16:37.806+02	80	9
\N	2024-07-06 10:53:32.145+02	2024-07-06 10:53:32.145+02	81	4
\N	2024-07-06 10:53:32.145+02	2024-07-06 10:53:32.145+02	81	8
\N	2024-07-06 10:53:32.145+02	2024-07-06 10:53:32.145+02	81	11
\N	2024-07-06 11:09:54.21+02	2024-07-06 11:09:54.21+02	82	8
\N	2024-07-06 11:09:54.21+02	2024-07-06 11:09:54.21+02	82	4
\N	2024-07-06 11:53:33.216+02	2024-07-06 11:53:33.216+02	83	16
\N	2024-07-06 12:16:08.052+02	2024-07-06 12:16:08.052+02	84	5
\N	2024-07-06 12:16:08.052+02	2024-07-06 12:16:08.052+02	84	8
\N	2024-07-06 12:16:08.052+02	2024-07-06 12:16:08.052+02	84	11
\N	2024-07-06 12:16:08.052+02	2024-07-06 12:16:08.052+02	84	12
\N	2024-07-06 12:16:08.052+02	2024-07-06 12:16:08.052+02	84	10
\N	2024-07-06 12:35:28.933+02	2024-07-06 12:35:28.933+02	85	5
\N	2024-07-06 12:35:28.933+02	2024-07-06 12:35:28.933+02	85	8
\N	2024-07-06 12:35:28.933+02	2024-07-06 12:35:28.933+02	85	11
\N	2024-07-06 12:35:28.933+02	2024-07-06 12:35:28.933+02	85	9
\N	2024-07-06 13:00:09.29+02	2024-07-06 13:00:09.29+02	86	5
\N	2024-07-06 13:00:09.29+02	2024-07-06 13:00:09.29+02	86	8
\N	2024-07-06 13:00:09.29+02	2024-07-06 13:00:09.29+02	86	4
\N	2024-07-06 13:00:09.29+02	2024-07-06 13:00:09.29+02	86	10
\N	2024-07-06 13:16:23.576+02	2024-07-06 13:16:23.576+02	87	5
\N	2024-07-06 13:16:23.576+02	2024-07-06 13:16:23.576+02	87	8
\N	2024-07-06 13:16:23.576+02	2024-07-06 13:16:23.576+02	87	11
\N	2024-07-06 13:16:23.576+02	2024-07-06 13:16:23.576+02	87	4
\N	2024-07-06 13:16:23.576+02	2024-07-06 13:16:23.576+02	87	10
\N	2024-07-06 13:16:23.576+02	2024-07-06 13:16:23.576+02	87	9
\N	2024-07-06 13:16:23.576+02	2024-07-06 13:16:23.576+02	87	13
\N	2024-07-06 13:35:33.514+02	2024-07-06 13:35:33.514+02	88	5
\N	2024-07-06 13:35:33.514+02	2024-07-06 13:35:33.514+02	88	8
\N	2024-07-06 13:35:33.514+02	2024-07-06 13:35:33.514+02	88	10
\N	2024-07-06 13:35:33.514+02	2024-07-06 13:35:33.514+02	88	4
\N	2024-07-06 19:02:35.442+02	2024-07-06 19:02:35.442+02	89	5
\N	2024-07-06 19:02:54.646+02	2024-07-06 19:02:54.646+02	89	4
\N	2024-07-06 19:16:02.938+02	2024-07-06 19:16:02.938+02	90	5
\N	2024-07-06 19:43:50.703+02	2024-07-06 19:43:50.703+02	91	5
\N	2024-07-06 19:43:50.703+02	2024-07-06 19:43:50.703+02	91	13
\N	2024-07-06 19:59:55.96+02	2024-07-06 19:59:55.96+02	92	5
\N	2024-07-06 19:59:55.96+02	2024-07-06 19:59:55.96+02	92	12
\N	2024-07-06 19:59:55.96+02	2024-07-06 19:59:55.96+02	92	13
\N	2024-07-06 19:59:55.96+02	2024-07-06 19:59:55.96+02	92	4
\N	2024-07-06 20:13:27.268+02	2024-07-06 20:13:27.268+02	93	5
\N	2024-07-06 20:13:27.268+02	2024-07-06 20:13:27.268+02	93	8
\N	2024-07-06 20:13:27.268+02	2024-07-06 20:13:27.268+02	93	4
\N	2024-07-06 20:13:27.268+02	2024-07-06 20:13:27.268+02	93	12
\N	2024-07-06 20:13:27.268+02	2024-07-06 20:13:27.268+02	93	10
\N	2024-07-07 11:11:08.395+02	2024-07-07 11:11:08.395+02	85	17
\N	2024-07-07 11:21:26.506+02	2024-07-07 11:21:26.506+02	94	5
\N	2024-07-07 11:21:26.506+02	2024-07-07 11:21:26.506+02	94	17
\N	2024-07-07 11:34:43.609+02	2024-07-07 11:34:43.609+02	95	5
\N	2024-07-07 11:34:43.609+02	2024-07-07 11:34:43.609+02	95	12
\N	2024-07-07 11:34:43.609+02	2024-07-07 11:34:43.609+02	95	4
\N	2024-07-07 12:00:38.337+02	2024-07-07 12:00:38.337+02	96	5
\N	2024-07-07 12:35:28.523+02	2024-07-07 12:35:28.523+02	97	5
\N	2024-07-07 13:02:26.36+02	2024-07-07 13:02:26.36+02	98	4
\N	2024-07-07 13:02:26.36+02	2024-07-07 13:02:26.36+02	98	12
\N	2024-07-07 13:21:50.191+02	2024-07-07 13:21:50.191+02	99	4
\N	2024-07-07 13:21:50.191+02	2024-07-07 13:21:50.191+02	99	12
\N	2024-07-07 19:16:31.039+02	2024-07-07 19:16:31.039+02	100	4
\N	2024-07-07 19:16:31.039+02	2024-07-07 19:16:31.039+02	100	12
\N	2024-07-07 19:52:32.044+02	2024-07-07 19:52:32.044+02	101	4
\N	2024-07-08 15:29:11.399+02	2024-07-08 15:29:11.399+02	102	5
\N	2024-07-08 15:29:11.399+02	2024-07-08 15:29:11.399+02	102	12
\N	2024-07-08 15:44:20.277+02	2024-07-08 15:44:20.277+02	103	12
\N	2024-07-08 16:06:08.203+02	2024-07-08 16:06:08.203+02	104	4
\N	2024-07-08 16:20:23.62+02	2024-07-08 16:20:23.62+02	105	8
\N	2024-07-08 16:20:23.62+02	2024-07-08 16:20:23.62+02	105	9
\N	2024-07-08 16:20:23.62+02	2024-07-08 16:20:23.62+02	105	16
\N	2024-07-08 16:20:23.62+02	2024-07-08 16:20:23.62+02	105	4
\N	2024-07-08 16:30:22.965+02	2024-07-08 16:30:22.965+02	106	5
\N	2024-07-08 16:51:32.379+02	2024-07-08 16:51:32.379+02	107	5
\N	2024-07-08 16:51:32.379+02	2024-07-08 16:51:32.379+02	107	12
\N	2024-07-08 16:51:32.379+02	2024-07-08 16:51:32.379+02	107	4
\N	2024-07-09 15:42:44.556+02	2024-07-09 15:42:44.556+02	108	5
\N	2024-07-09 15:42:44.556+02	2024-07-09 15:42:44.556+02	108	12
\N	2024-07-09 15:42:44.556+02	2024-07-09 15:42:44.556+02	108	4
\N	2024-07-09 16:09:18.774+02	2024-07-09 16:09:18.774+02	109	5
\N	2024-07-09 16:24:57.178+02	2024-07-09 16:24:57.178+02	110	5
\N	2024-07-09 16:24:57.178+02	2024-07-09 16:24:57.178+02	110	12
\N	2024-07-09 16:24:57.178+02	2024-07-09 16:24:57.178+02	110	4
\N	2024-07-09 16:49:14.142+02	2024-07-09 16:49:14.142+02	111	5
\N	2024-07-09 16:49:14.142+02	2024-07-09 16:49:14.142+02	111	8
\N	2024-07-09 16:49:14.142+02	2024-07-09 16:49:14.142+02	111	12
\N	2024-07-09 16:49:14.142+02	2024-07-09 16:49:14.142+02	111	4
\N	2024-07-09 17:04:33.07+02	2024-07-09 17:04:33.07+02	112	5
\N	2024-07-09 17:04:33.07+02	2024-07-09 17:04:33.07+02	112	4
\N	2024-07-10 15:31:36.265+02	2024-07-10 15:31:36.265+02	113	5
\N	2024-07-10 15:31:36.265+02	2024-07-10 15:31:36.265+02	113	10
\N	2024-07-10 15:31:36.265+02	2024-07-10 15:31:36.265+02	113	9
\N	2024-07-10 15:53:14.029+02	2024-07-10 15:53:14.029+02	114	10
\N	2024-07-10 15:53:14.029+02	2024-07-10 15:53:14.029+02	114	8
\N	2024-07-10 15:53:14.029+02	2024-07-10 15:53:14.029+02	114	11
\N	2024-07-10 15:53:14.029+02	2024-07-10 15:53:14.029+02	114	4
\N	2024-07-10 16:01:03.66+02	2024-07-10 16:01:03.66+02	115	5
\N	2024-07-10 16:18:56.524+02	2024-07-10 16:18:56.524+02	116	5
\N	2024-07-10 16:18:56.524+02	2024-07-10 16:18:56.524+02	116	4
\N	2024-07-10 16:18:56.524+02	2024-07-10 16:18:56.524+02	116	12
\N	2024-07-10 16:47:14.27+02	2024-07-10 16:47:14.27+02	117	5
\N	2024-07-10 16:47:14.27+02	2024-07-10 16:47:14.27+02	117	4
\N	2024-07-10 16:47:14.27+02	2024-07-10 16:47:14.27+02	117	12
\N	2024-07-10 16:47:14.27+02	2024-07-10 16:47:14.27+02	117	14
\N	2024-07-10 20:50:34.588+02	2024-07-10 20:50:34.588+02	118	4
\N	2024-07-10 21:10:20.016+02	2024-07-10 21:10:20.016+02	119	5
\N	2024-07-10 21:10:20.016+02	2024-07-10 21:10:20.016+02	119	12
\N	2024-07-10 21:10:20.016+02	2024-07-10 21:10:20.016+02	119	4
\N	2024-07-10 21:28:48.226+02	2024-07-10 21:28:48.226+02	120	5
\N	2024-07-10 21:28:48.226+02	2024-07-10 21:28:48.226+02	120	12
\N	2024-07-10 21:29:09.905+02	2024-07-10 21:29:09.905+02	120	4
\N	2024-07-11 15:30:46.951+02	2024-07-11 15:30:46.951+02	121	8
\N	2024-07-11 15:30:46.951+02	2024-07-11 15:30:46.951+02	121	11
\N	2024-07-11 15:30:46.951+02	2024-07-11 15:30:46.951+02	121	4
\N	2024-07-11 15:30:46.951+02	2024-07-11 15:30:46.951+02	121	10
\N	2024-07-11 15:44:36.424+02	2024-07-11 15:44:36.424+02	122	4
\N	2024-07-11 15:56:52.917+02	2024-07-11 15:56:52.917+02	123	4
\N	2024-07-11 16:31:37.92+02	2024-07-11 16:31:37.92+02	124	5
\N	2024-07-11 16:31:37.92+02	2024-07-11 16:31:37.92+02	124	4
\N	2024-07-11 16:31:37.92+02	2024-07-11 16:31:37.92+02	124	12
\N	2024-07-12 09:22:20.565+02	2024-07-12 09:22:20.565+02	125	5
\N	2024-07-12 09:22:20.565+02	2024-07-12 09:22:20.565+02	125	13
\N	2024-07-12 09:22:20.565+02	2024-07-12 09:22:20.565+02	125	14
\N	2024-07-12 09:22:20.565+02	2024-07-12 09:22:20.565+02	125	4
\N	2024-07-12 13:41:09.522+02	2024-07-12 13:41:09.522+02	126	5
\N	2024-07-12 13:41:09.522+02	2024-07-12 13:41:09.522+02	126	4
\N	2024-07-12 13:41:09.522+02	2024-07-12 13:41:09.522+02	126	14
\N	2024-07-15 12:33:05.986+02	2024-07-15 12:33:05.986+02	127	12
\N	2024-07-15 12:33:05.986+02	2024-07-15 12:33:05.986+02	127	5
\N	2024-07-15 13:26:08.652+02	2024-07-15 13:26:08.652+02	128	12
\N	2024-07-15 13:26:08.652+02	2024-07-15 13:26:08.652+02	128	5
\N	2024-07-16 16:58:34.786+02	2024-07-16 16:58:34.786+02	129	5
\N	2024-07-16 16:58:34.786+02	2024-07-16 16:58:34.786+02	129	4
\N	2024-07-16 16:58:34.786+02	2024-07-16 16:58:34.786+02	129	12
\N	2024-07-16 16:58:34.786+02	2024-07-16 16:58:34.786+02	129	14
\N	2024-07-16 22:48:01.934+02	2024-07-16 22:48:01.934+02	122	12
\N	2024-07-16 22:58:23.024+02	2024-07-16 22:58:23.024+02	130	4
\N	2024-07-16 22:58:23.024+02	2024-07-16 22:58:23.024+02	130	12
\N	2024-07-16 22:58:23.024+02	2024-07-16 22:58:23.024+02	130	14
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
\N	2024-06-07 11:44:12.727+02	2024-06-07 11:44:12.727+02	35	13
\N	2024-06-09 12:26:26.146+02	2024-06-09 12:26:26.146+02	37	18
\N	2024-06-09 12:26:37.117+02	2024-06-09 12:26:37.117+02	37	5
\N	2024-06-10 16:38:58.964+02	2024-06-10 16:38:58.964+02	38	12
\N	2024-06-13 16:08:52.302+02	2024-06-13 16:08:52.302+02	41	5
\N	2024-06-15 12:22:13.814+02	2024-06-15 12:22:13.814+02	42	12
\N	2024-06-20 16:19:12.953+02	2024-06-20 16:19:12.953+02	46	19
\N	2024-06-20 16:43:43.094+02	2024-06-20 16:43:43.094+02	47	5
\N	2024-06-21 11:38:17.048+02	2024-06-21 11:38:17.048+02	48	12
\N	2024-06-21 13:32:10.166+02	2024-06-21 13:32:10.166+02	49	11
\N	2024-06-21 13:32:10.166+02	2024-06-21 13:32:10.166+02	49	17
\N	2024-06-22 12:25:55.667+02	2024-06-22 12:25:55.667+02	46	21
\N	2024-06-22 13:04:44.877+02	2024-06-22 13:04:44.877+02	50	22
\N	2024-06-22 13:04:44.877+02	2024-06-22 13:04:44.877+02	50	5
\N	2024-06-23 11:02:21.476+02	2024-06-23 11:02:21.476+02	53	12
\N	2024-06-23 11:02:21.476+02	2024-06-23 11:02:21.476+02	53	7
\N	2024-06-23 12:36:57.592+02	2024-06-23 12:36:57.592+02	56	21
\N	2024-06-24 11:56:54.949+02	2024-06-24 11:56:54.949+02	57	21
\N	2024-06-24 11:56:54.949+02	2024-06-24 11:56:54.949+02	57	23
\N	2024-06-24 12:35:42.59+02	2024-06-24 12:35:42.59+02	58	17
\N	2024-06-24 13:49:25.434+02	2024-06-24 13:49:25.434+02	59	24
\N	2024-06-27 15:26:05.179+02	2024-06-27 15:26:05.179+02	63	5
\N	2024-06-28 09:36:39.115+02	2024-06-28 09:36:39.115+02	64	12
\N	2024-07-03 16:57:12.861+02	2024-07-03 16:57:12.861+02	67	5
\N	2024-07-03 19:49:34.736+02	2024-07-03 19:49:34.736+02	68	12
\N	2024-07-03 19:49:34.736+02	2024-07-03 19:49:34.736+02	68	7
\N	2024-07-04 16:51:55.886+02	2024-07-04 16:51:55.886+02	75	21
\N	2024-07-05 08:53:24.62+02	2024-07-05 08:53:24.62+02	76	5
\N	2024-07-05 09:10:09.488+02	2024-07-05 09:10:09.488+02	77	12
\N	2024-07-05 09:10:09.488+02	2024-07-05 09:10:09.488+02	77	7
\N	2024-07-05 11:19:38.624+02	2024-07-05 11:19:38.624+02	79	25
\N	2024-07-05 13:16:08.784+02	2024-07-05 13:16:08.784+02	80	17
\N	2024-07-05 13:16:08.784+02	2024-07-05 13:16:08.784+02	80	12
\N	2024-07-06 10:53:09.503+02	2024-07-06 10:53:09.503+02	81	12
\N	2024-07-06 11:53:18.495+02	2024-07-06 11:53:18.495+02	83	5
\N	2024-07-06 13:16:02.718+02	2024-07-06 13:16:02.718+02	87	12
\N	2024-07-06 19:15:57.104+02	2024-07-06 19:15:57.104+02	90	12
\N	2024-07-06 19:58:58.958+02	2024-07-06 19:58:58.958+02	92	26
\N	2024-07-07 11:20:54.164+02	2024-07-07 11:20:54.164+02	94	12
\N	2024-07-07 11:33:55.369+02	2024-07-07 11:33:55.369+02	95	7
\N	2024-07-07 11:34:11.026+02	2024-07-07 11:34:11.026+02	95	21
\N	2024-07-07 12:00:27.015+02	2024-07-07 12:00:27.015+02	96	12
\N	2024-07-07 12:00:27.015+02	2024-07-07 12:00:27.015+02	96	17
\N	2024-07-07 13:01:53.974+02	2024-07-07 13:01:53.974+02	98	5
\N	2024-07-07 19:52:13.088+02	2024-07-07 19:52:13.088+02	101	19
\N	2024-07-08 16:19:33.086+02	2024-07-08 16:19:33.086+02	105	27
\N	2024-07-08 16:30:16.651+02	2024-07-08 16:30:16.651+02	106	17
\N	2024-07-09 15:41:56.566+02	2024-07-09 15:41:56.566+02	108	19
\N	2024-07-09 15:42:12.735+02	2024-07-09 15:42:12.735+02	108	21
\N	2024-07-09 16:09:03.486+02	2024-07-09 16:09:03.486+02	109	28
\N	2024-07-10 15:31:16.367+02	2024-07-10 15:31:16.367+02	113	13
\N	2024-07-10 16:00:55.672+02	2024-07-10 16:00:55.672+02	115	12
\N	2024-07-10 16:02:20.664+02	2024-07-10 16:02:20.664+02	115	7
\N	2024-07-11 15:44:14.682+02	2024-07-11 15:44:14.682+02	122	5
\N	2024-07-11 16:30:59.912+02	2024-07-11 16:30:59.912+02	124	27
\N	2024-07-11 16:31:18.854+02	2024-07-11 16:31:18.854+02	124	5
\N	2024-07-16 22:57:54.202+02	2024-07-16 22:57:54.202+02	130	5
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
35	Ant Attack	ant_attack/cover.jpeg	ant_attack/logo.jpeg	ant_attack/back.jpeg	1983-01-01	\N	GLOBAL	15	1	\N	\N	NOT_PLAYED	2024-06-07 11:43:42.255+02	2024-06-07 11:43:42.255+02	\N	\N	\N	https://en.wikipedia.org/wiki/Ant_Attack	https://www.youtube.com/embed/Va5SKaYL3r8
36	Ah Diddums	ah_diddums/cover.jpeg	ah_diddums/logo.png	ah_diddums/back.jpeg	1983-01-01	\N	GLOBAL	3	1	\N	\N	NOT_PLAYED	2024-06-07 13:08:44.224+02	2024-06-07 13:08:44.224+02	\N	\N	\N	https://en.wikipedia.org/wiki/Ah_Diddums	https://www.youtube.com/embed/uX-jNPasffc
37	The Hobbit	lord_of_the_rings/the_hobbit_82/cover.jpeg	lord_of_the_rings/the_hobbit_82/logo.jpeg	lord_of_the_rings/the_hobbit_82/back.jpeg	1982-11-01	\N	GLOBAL	20	1	\N	\N	NOT_PLAYED	2024-06-09 12:25:44.387+02	2024-06-09 12:27:14.191+02	20	21	\N	https://es.wikipedia.org/wiki/El_hobbit_(videojuego_de_1982)	https://www.youtube.com/embed/D9qrZC7WUio
38	Arcadia	arcadia/cover.jpeg	arcadia/logo.jpeg	arcadia/back.jpeg	1983-01-01	\N	GLOBAL	10	1	\N	\N	NOT_PLAYED	2024-06-10 16:38:23.728+02	2024-06-10 16:38:23.728+02	\N	\N		https://en.wikipedia.org/wiki/Arcadia_(video_game)	https://www.youtube.com/embed/1JnKxByMo6Q
39	Manic Miner	miner_willy/manic_miner/cover.jpeg	miner_willy/manic_miner/logo.jpeg	miner_willy/manic_miner/back.jpeg	1983-06-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-06-11 16:05:05.776+02	2024-06-11 16:05:55.866+02	21	22	\N	https://es.wikipedia.org/wiki/Manic_Miner	https://www.youtube.com/embed/BgUzteADsRI
40	Jet Set Willy	miner_willy/jetset_willy/cover.jpg	miner_willy/jetset_willy/logo.png	miner_willy/jetset_willy/back.jpg	1984-01-01	\N	GLOBAL	20	1	\N	\N	NOT_PLAYED	2024-06-12 15:36:48.643+02	2024-06-12 15:39:06.122+02	21	22	\N	https://es.wikipedia.org/wiki/Jet_Set_Willy	https://www.youtube.com/embed/94Ywx6uVn9E
41	Dragon's Lair	dragons_lair/dragons_lair/cover.jpeg	dragons_lair/dragons_lair/logo.png	dragons_lair/dragons_lair/back.jpeg	1983-06-19	\N	GLOBAL	15	1	\N	\N	PLAYED	2024-06-13 16:06:48.643+02	2024-06-13 16:10:11.669+02	22	23	\N	https://es.wikipedia.org/wiki/Dragon%27s_Lair	https://www.youtube.com/embed/hdumVFgwgP8
42	Jetpac	jetman/jetpac/cover.jpeg	jetman/jetpac/logo.jpeg	jetman/jetpac/back.jpeg	1983-05-01	\N	GLOBAL	20	1	\N	\N	NOT_PLAYED	2024-06-15 12:21:31.981+02	2024-06-15 12:23:17.115+02	23	24	\N	https://es.wikipedia.org/wiki/Jetpac	https://www.youtube.com/embed/JF4n1NX1oOQ
43	Tennis	tennis_84/cover.jpeg	tennis_84/logo.jpeg	tennis_84/back.jpeg	1984-01-14	\N	PAL-ES	95	1-2	Vs. Tennis	\N	NOT_PLAYED	2024-06-15 20:23:24.575+02	2024-06-15 20:23:45.63+02	\N	\N	\N	https://es.wikipedia.org/wiki/Tennis_(videojuego)	https://www.youtube.com/embed/gOEeaKEyW98
44	Boulder Dash	boulder_dash/boulder_dash/cover.jpg	boulder_dash/boulder_dash/logo.png	boulder_dash/boulder_dash/back.jpg	1984-03-01	\N	GLOBAL	65	1-2	\N	\N	PLAYED	2024-06-15 20:49:27.821+02	2024-06-15 20:51:00.754+02	24	25	\N	https://es.wikipedia.org/wiki/Boulder_Dash	https://www.youtube.com/embed/XSpgwuMPkOE
50	Knight Lore	sabreman/knight-lore/cover.jpeg	sabreman/knight-lore/logo.jpeg	sabreman/knight-lore/back.jpeg	1984-11-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-06-22 13:04:01.088+02	2024-06-22 13:05:35.264+02	29	30	\N	https://es.wikipedia.org/wiki/Knight_Lore	https://www.youtube.com/embed/7n7qtErhF-A
45	Daley Thompson's Decathlon	daley_thompson/decathlon/cover.jpg	daley_thompson/decathlon/logo.jpg	daley_thompson/decathlon/back.jpeg	1984-01-01	\N	GLOBAL	15	1	\N	\N	NOT_PLAYED	2024-06-19 21:31:39.282+02	2024-06-19 21:32:32.736+02	25	26	\N	https://en.wikipedia.org/wiki/Daley_Thompson%27s_Decathlon	https://www.youtube.com/embed/1fnmuiVrQ2U
46	Beach-Head	beach-head/beach-head/cover.jpg	beach-head/beach-head/logo.jpg	beach-head/beach-head/back.jpeg	1983-01-01	\N	GLOBAL	20	1-2	\N	\N	NOT_PLAYED	2024-06-20 16:18:30.121+02	2024-06-20 16:19:53.396+02	26	27	\N	https://es.wikipedia.org/wiki/Beach-Head	https://www.youtube.com/embed/RyTq0lv7q3M
47	The Lords of Midnight	the_lords_of_midnight/cover.jpeg	the_lords_of_midnight/logo.jpeg	the_lords_of_midnight/back.jpeg	1984-04-01	\N	GLOBAL	20	1	\N	\N	NOT_PLAYED	2024-06-20 16:43:24.047+02	2024-06-20 16:43:24.047+02	\N	\N	\N	https://es.wikipedia.org/wiki/The_Lords_of_Midnight	https://www.youtube.com/embed/n251r73JIxY
48	Elite	elite/elite/cover.jpeg	elite/elite/logo.jpeg	elite/elite/back.jpeg	1984-09-20	\N	GLOBAL	60	1	\N	\N	NOT_PLAYED	2024-06-21 11:37:25.882+02	2024-06-21 11:38:54.087+02	27	28	\N	https://es.wikipedia.org/wiki/Elite_(videojuego)	https://www.youtube.com/embed/LhTTpV5qFrs
49	Ghostbusters	ghostbusters/ghostbusters_84/cover.jpeg	ghostbusters/ghostbusters_84/logo.png	ghostbusters/ghostbusters_84/back.jpg	1984-10-26	\N	GLOBAL	15	1	\N	\N	NOT_PLAYED	2024-06-21 13:31:45.365+02	2024-06-21 13:33:00.187+02	28	29		https://en.wikipedia.org/wiki/Ghostbusters_(1984_video_game)	https://www.youtube.com/embed/ElJNQxgKZPw
51	Duck Hunt	duck-hunt/cover.png	duck-hunt/logo.png	duck-hunt/back.jpeg	1984-04-21	\N	PAL-ES	95	1-2	Vs. Duck Hunt	\N	PLAYED	2024-06-22 15:53:35.659+02	2024-06-22 15:53:35.659+02	\N	\N	\N	https://es.wikipedia.org/wiki/Duck_Hunt	https://www.youtube.com/embed/J3sfsP9W048
52	Tetris	tetris/tetris/cover.jpeg	tetris/tetris/logo.png	tetris/tetris/back.jpeg	1984-06-06	\N	PAL-ES/IT	60	1-2	\N	\N	PLAYED	2024-06-22 16:34:37.882+02	2024-06-22 16:36:31.871+02	30	31		https://es.wikipedia.org/wiki/Tetris	https://www.youtube.com/embed/BQwohHgrk2s
53	Dropzone	dropzone/dropzone/cover.jpg	dropzone/dropzone/logo.jpg	dropzone/dropzone/back.jpeg	1984-01-01	\N	GLOBAL	100	1	\N	\N	NOT_PLAYED	2024-06-23 11:01:59.995+02	2024-06-23 11:03:13.583+02	31	32	\N	https://en.wikipedia.org/wiki/Dropzone	https://www.youtube.com/embed/6Z3kppgXqR8
54	Track & Field	track_and_field/track_and_field/cover.jpeg	track_and_field/track_and_field/logo.png	track_and_field/track_and_field/back.jpeg	1983-09-01	\N	GLOBAL	400	1-4	Hyper Olympic (Japón)	\N	NOT_PLAYED	2024-06-23 11:45:08.282+02	2024-06-23 11:46:38.361+02	32	33	\N	https://es.wikipedia.org/wiki/Track_%26_Field	https://www.youtube.com/embed/ozcE8qzTdHo
55	Hyper Sports	track_and_field/hyper_sports/cover.jpeg	track_and_field/hyper_sports/logo.png	track_and_field/hyper_sports/back.jpeg	1984-05-12	\N	GLOBAL	15	1-4	Hyper Olympic '84 (Japón)	\N	NOT_PLAYED	2024-06-23 11:54:27.234+02	2024-06-23 11:55:27.64+02	32	33	\N	https://es.wikipedia.org/wiki/Hyper_Sports	https://www.youtube.com/embed/R5XaB0uCL3w
56	Commando	wolf_of_the_battlefield/commando/cover.png	wolf_of_the_battlefield/commando/logo.jpeg	wolf_of_the_battlefield/commando/back.jpeg	1985-04-02	\N	GLOBAL	30	1	Wolf of the Battlefield (Japón)	\N	NOT_PLAYED	2024-06-23 12:36:20.932+02	2024-06-23 12:38:16.957+02	33	34	\N	https://es.wikipedia.org/wiki/Commando_(videojuego)	https://www.youtube.com/embed/xmlM1KS7txE
57	Theatre Europe	pss_wargamers_series/theatre_europe/cover.jpg	pss_wargamers_series/theatre_europe/logo.jpeg	pss_wargamers_series/theatre_europe/back.jpg	1985-11-01	\N	GLOBAL	15	1	\N	\N	NOT_PLAYED	2024-06-24 11:56:26.34+02	2024-06-24 11:57:43.239+02	34	35	\N	https://en.wikipedia.org/wiki/Theatre_Europe	https://www.youtube.com/embed/xQaDP8EUk9o
58	Gremlins	gremlins/gremlins_84/cover.jpg	gremlins/gremlins_84/logo.png	gremlins/gremlins_84/back.jpg	1984-06-08	\N	GLOBAL	200	1-2	\N	\N	NOT_PLAYED	2024-06-24 12:35:20.106+02	2024-06-24 12:36:05.277+02	35	36	\N	https://en.wikipedia.org/wiki/Gremlins_(video_game)	https://www.youtube.com/embed/aB2zpI7Wd1M
59	Spy vs. Spy	spy_vs_spy/spy_vs_spy_84/cover.jpeg	spy_vs_spy/spy_vs_spy_84/logo.png	spy_vs_spy/spy_vs_spy_84/back.jpeg	1984-01-01	\N	GLOBAL	40	1-2	\N	\N	NOT_PLAYED	2024-06-24 13:48:54.184+02	2024-06-24 13:50:53.062+02	36	37	\N	https://es.wikipedia.org/wiki/Spy_vs._Spy_(videojuego_de_1984)	https://www.youtube.com/embed/cEtDDoHNFuk
60	Little Computer People	little_computer_people/cover.jpeg	little_computer_people/logo.jpeg	little_computer_people/back.jpeg	1985-09-27	\N	GLOBAL	200	1	\N	\N	NOT_PLAYED	2024-06-25 16:52:53.431+02	2024-06-25 16:52:53.431+02	\N	\N	\N	https://es.wikipedia.org/wiki/Little_Computer_People	https://www.youtube.com/embed/SkTgX1mGmDg
61	Summer Games II	epyx_sports_games/summer_games_ii/cover.jpeg	epyx_sports_games/summer_games_ii/logo.jpeg	epyx_sports_games/summer_games_ii/back.jpeg	1985-06-01	\N	GLOBAL	40	1-2	\N	\N	NOT_PLAYED	2024-06-26 15:55:37.159+02	2024-06-26 15:57:19.182+02	37	38	\N	https://en.wikipedia.org/wiki/Summer_Games_II	https://www.youtube.com/embed/x3g2Zm2bMbs
62	The Way of the Exploding Fist	the_way_of_the_exploding_fist/cover.png	the_way_of_the_exploding_fist/logo.png	the_way_of_the_exploding_fist/back.jpeg	1985-06-01	\N	GLOBAL	20	1-2		\N	NOT_PLAYED	2024-06-26 16:11:37.081+02	2024-06-26 16:11:37.081+02	\N	\N	\N	https://en.wikipedia.org/wiki/The_Way_of_the_Exploding_Fist	https://www.youtube.com/embed/PA5b8Zhdb7c
63	Gauntlet	gauntlet/gauntlet/cover.jpeg	gauntlet/gauntlet/logo.jpeg	gauntlet/gauntlet/back.jpg	1985-10-15	\N	GLOBAL	20	1-4	\N	\N	NOT_PLAYED	2024-06-27 15:25:39.266+02	2024-06-27 15:26:50.658+02	38	39	\N	https://es.wikipedia.org/wiki/Gauntlet_(videojuego)	https://www.youtube.com/embed/fLnkCAFihqA
2	Sonic the Hedgehog	sonic/sonic_the_hedgehog/cover.jpeg	sonic/sonic_the_hedgehog/logo.png	sonic/sonic_the_hedgehog/back.jpg	1991-07-26	86	PAL-EUR	15	1		t	COMPLETED	2024-01-15 17:09:43.807+01	2024-06-29 23:07:04.001+02	1	1	#17569b	https://es.wikipedia.org/wiki/Sonic_the_Hedgehog_(videojuego_de_1991)	https://www.youtube.com/embed/LMasV2b6OVA
65	Battlezone	battlezone/battlezone/cover.jpg	battlezone/battlezone/logo.png	battlezone/battlezone/back.jpg	1980-11-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-07-03 16:16:56.113+02	2024-07-03 16:17:42.428+02	40	41	\N	https://es.wikipedia.org/wiki/Battlezone	https://www.youtube.com/embed/9X4_xy7rC1A
66	Crazy Climber	crazy_climber/crazy_climber/cover.jpg	crazy_climber/crazy_climber/logo.jpeg	crazy_climber/crazy_climber/back.jpg	1980-10-01	\N	GLOBAL	300	1-2	\N	\N	NOT_PLAYED	2024-07-03 16:38:27.56+02	2024-07-03 16:39:07.14+02	41	42	\N	https://es.wikipedia.org/wiki/Crazy_Climber	https://www.youtube.com/embed/QJAEmOtLZHg
67	Adventure	adventure/cover.png	adventure/logo.jpeg	adventure/back.jpg	1980-04-01	\N	GLOBAL	80	1	\N	\N	NOT_PLAYED	2024-07-03 16:56:34.059+02	2024-07-03 16:56:34.059+02	\N	\N	\N	https://es.wikipedia.org/wiki/Adventure_(Atari_2600)	https://www.youtube.com/embed/I6-zN_eaRd8
68	Computer Space	computer_space/cover.jpg	computer_space/logo.jpg	computer_space/back.jpeg	1971-11-01	\N	\N	\N	1-2	\N	\N	NOT_PLAYED	2024-07-03 19:48:44.917+02	2024-07-03 19:48:44.917+02	\N	\N	\N	https://es.wikipedia.org/wiki/Computer_Space	https://www.youtube.com/embed/b3BQsCCwo8w
69	Tank	tank/tank/cover.jpeg	tank/tank/logo.jpg	tank/tank/back.jpeg	1974-11-01	\N	\N	\N	1-2	\N	\N	COMPLETED	2024-07-03 20:20:07.536+02	2024-07-03 20:21:14.097+02	42	43	\N	https://en.wikipedia.org/wiki/Tank_(video_game)	https://www.youtube.com/embed/3OsBUzYBJgU
70	Gran Trak 10	gran_trak_10/cover.jpg	gran_trak_10/logo.jpg	gran_trak_10/back.jpg	1974-05-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-07-03 20:43:05.99+02	2024-07-03 20:43:05.99+02	\N	\N	\N	https://es.wikipedia.org/wiki/Gran_Trak_10	https://www.youtube.com/embed/KYcNvAAeu6k
71	Night Driver	night_driver/cover.png	night_driver/logo.png	night_driver/back.jpeg	1976-10-01	\N	GLOBAL	20	1	\N	\N	NOT_PLAYED	2024-07-04 15:48:11.429+02	2024-07-04 15:48:11.429+02	\N	\N	\N	https://es.wikipedia.org/wiki/Night_Driver_(videojuego)	https://www.youtube.com/embed/Wk-7BR9Dl9c
72	Sea Wolf	sea_wolf/cover.jpg	sea_wolf/logo.jpg	sea_wolf/back.jpeg	1976-04-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-07-04 16:02:07.365+02	2024-07-04 16:02:07.365+02	\N	\N	\N	https://en.wikipedia.org/wiki/Sea_Wolf_(video_game)	https://www.youtube.com/embed/T6kopmm1-Jw
73	Combat	combat/cover.jpg	combat/logo.jpg	combat/back.jpeg	1977-09-11	\N	GLOBAL	20	1-2	\N	\N	COMPLETED	2024-07-04 16:16:07.157+02	2024-07-04 16:16:07.157+02	\N	\N	\N	https://es.wikipedia.org/wiki/Combat_(videojuego)	https://www.youtube.com/embed/3m86ftny1uY
74	Head On	head_on/cover.jpg	head_on/logo.jpeg	head_on/back.jpg	1979-04-01	\N	\N	\N	1-2	\N	\N	NOT_PLAYED	2024-07-04 16:29:48.326+02	2024-07-04 16:29:48.326+02	\N	\N	\N	https://es.wikipedia.org/wiki/Head_On_(videojuego)	https://www.youtube.com/embed/nBrHAzV98Vg
75	Missile Command	missile_command/missile_command/cover.jpg	missile_command/missile_command/logo.png	missile_command/missile_command/back.jpg	1980-07-01	\N	GLOBAL	20	1-2	\N	\N	NOT_PLAYED	2024-07-04 16:51:36.467+02	2024-07-04 16:52:28.482+02	43	44	\N	https://es.wikipedia.org/wiki/Missile_Command	https://www.youtube.com/embed/nokIGklnBGY
76	Wizardry: Proving Grounds of the Mad Overlord	wizardry/wizardry/cover.jpg	wizardry/wizardry/logo.png	wizardry/wizardry/back.jpg	1981-09-01	\N	GLOBAL	80	1	\N	\N	NOT_PLAYED	2024-07-05 08:52:58.881+02	2024-07-05 08:54:37.931+02	44	45	\N	https://en.wikipedia.org/wiki/Wizardry:_Proving_Grounds_of_the_Mad_Overlord	https://www.youtube.com/embed/wKn0AdQ_2jw
77	Tempest	tempest/tempest/cover.jpg	tempest/tempest/logo.jpeg	tempest/tempest/back.jpg	1981-10-01	\N	GLOBAL	15	1-2	\N	\N	NOT_PLAYED	2024-07-05 09:09:36.329+02	2024-07-05 09:10:40.771+02	45	46	\N	https://es.wikipedia.org/wiki/Tempest_(videojuego)	https://www.youtube.com/embed/jfaCrdBABUY
78	Utopia	utopia/cover.jpg	utopia/logo.jpg	utopia/back.jpg	1982-06-03	\N	GLOBAL	15	2	\N	\N	NOT_PLAYED	2024-07-05 10:25:45.423+02	2024-07-05 10:26:21.602+02	\N	\N	\N	https://en.wikipedia.org/wiki/Utopia_(video_game)	https://www.youtube.com/embed/XjpoBR23IWs
79	Superman	superman/superman_79/cover.jpg	superman/superman_79/logo.jpg	superman/superman_79/back.jpg	1979-09-01	\N	GLOBAL	70	1	\N	\N	NOT_PLAYED	2024-07-05 11:17:53.9+02	2024-07-05 11:20:10.57+02	46	47	\N	https://es.wikipedia.org/wiki/Superman_(Atari_2600)	https://www.youtube.com/embed/r7U2TFIayos
64	Gradius	gradius/gradius/cover.jpg	gradius/gradius/logo.png	gradius/gradius/back.jpg	1985-02-02	\N	PAL-EUR	80	1-2	Nemesis (usa)	\N	NOT_PLAYED	2024-06-28 09:35:55.362+02	2024-07-16 17:00:12.08+02	39	40	\N	https://es.wikipedia.org/wiki/Gradius_(videojuego)	https://www.youtube.com/embed/Wmpi64_RpnE
80	Star Wars: The Empire Strikes Back	star_wars/the_empire_strikes_back/cover.jpeg	star_wars/the_empire_strikes_back/logo.png	star_wars/the_empire_strikes_back/back.jpg	1982-06-01	\N	GLOBAL	50	1-2	\N	\N	NOT_PLAYED	2024-07-05 13:14:51.617+02	2024-07-05 13:16:58.919+02	47	48		https://es.wikipedia.org/wiki/Star_Wars:_The_Empire_Strikes_Back_(videojuego_de_1982)	https://www.youtube.com/embed/NcWGvwYWHgY
81	Star Raiders	star_raiders/star_raiders/cover.png	star_raiders/star_raiders/logo.jpeg	star_raiders/star_raiders/back.jpg	1980-03-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-07-06 10:52:10.784+02	2024-07-06 10:54:06.005+02	48	49	\N	https://en.wikipedia.org/wiki/Star_Raiders	https://www.youtube.com/embed/L8YdO6PYViw
82	Basketball	basketball_78/cover.jpg	basketball_78/logo.jpg	basketball_78/back.jpg	1978-09-01	\N	GLOBAL	15	1-2	\N	\N	COMPLETED	2024-07-06 11:09:34.966+02	2024-07-06 11:09:34.966+02	\N	\N		https://en.wikipedia.org/wiki/Basketball_(1978_video_game)	https://www.youtube.com/embed/44Qhd52yT3A
83	Quest for the Rings	the_quest_for_the_rings/cover.jpeg	the_quest_for_the_rings/logo.jpg	the_quest_for_the_rings/back.jpeg	1981-01-01	\N	GLOBAL	50	1	\N	\N	NOT_PLAYED	2024-07-06 11:52:54.283+02	2024-07-06 11:52:54.283+02	\N	\N	\N	https://en.wikipedia.org/wiki/Quest_for_the_Rings	https://www.youtube.com/embed/JUPoXqqWAeM
84	Dig Dug	dig_dug/dig_dug/cover.jpg	dig_dug/dig_dug/logo.jpeg	dig_dug/dig_dug/back.jpg	1982-04-19	\N	GLOBAL	25	1-2	\N	\N	NOT_PLAYED	2024-07-06 12:14:12.175+02	2024-07-06 12:16:49.556+02	49	50	\N	https://es.wikipedia.org/wiki/Dig_Dug	https://www.youtube.com/embed/zOuLiKwHciw
85	Pole Position	pole_position/pole_position/cover.png	pole_position/pole_position/logo.jpeg	pole_position/pole_position/back.jpg	1982-07-30	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-07-06 12:34:29.353+02	2024-07-06 12:35:52.531+02	50	51	\N	https://es.wikipedia.org/wiki/Pole_Position_(videojuego)	https://www.youtube.com/embed/FFs1Xc82Q0U
86	Mr. Do!	mr_do/mr_do!/cover.jpg	mr_do/mr_do!/logo.jpeg	mr_do/mr_do!/back.jpg	1982-09-01	\N	GLOBAL	80	1	\N	\N	NOT_PLAYED	2024-07-06 12:59:07.673+02	2024-07-06 13:00:31.114+02	51	52	\N	https://en.wikipedia.org/wiki/Mr._Do!	https://www.youtube.com/embed/5_BBQWed8Vk
93	Spy Hunter	spy_hunter/spy_hunter/cover.png	spy_hunter/spy_hunter/logo.jpeg	spy_hunter/spy_hunter/back.jpg	1983-11-01	\N	GLOBAL	60	1	\N	\N	NOT_PLAYED	2024-07-06 20:12:54.818+02	2024-07-06 20:13:56.6+02	55	56	\N	https://en.wikipedia.org/wiki/Spy_Hunter	https://www.youtube.com/embed/93ds1VldZGI
87	Zaxxon	zaxxon/zaxxon/cover.jpg	zaxxon/zaxxon/logo.png	zaxxon/zaxxon/back.jpg	1982-01-01	\N	GLOBAL	40	1-2	\N	\N	NOT_PLAYED	2024-07-06 13:15:26.463+02	2024-07-06 13:17:00.846+02	52	53	\N	https://es.wikipedia.org/wiki/Zaxxon	https://www.youtube.com/embed/Ta0xVtQ_fnk
88	Time Pilot	time_pilot/time_pilot/cover.png	time_pilot/time_pilot/logo.png	time_pilot/time_pilot/back.jpg	1982-11-01	\N	GLOBAL	150	1-2	\N	\N	NOT_PLAYED	2024-07-06 13:34:34.279+02	2024-07-06 13:35:45.992+02	53	54	\N	https://es.wikipedia.org/wiki/Time_Pilot	https://www.youtube.com/embed/aixIzoIdCVM
89	Pole Position II	pole_position/pole_position_ii/cover.jpg	pole_position/pole_position_ii/logo.png	pole_position/pole_position_ii/back.jpg	1983-06-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-07-06 19:02:03.361+02	2024-07-06 19:03:15.212+02	50	51	\N	https://es.wikipedia.org/wiki/Pole_Position_II	https://www.youtube.com/embed/x0T4OUoCqw4
90	Astron Belt	astron_belt/cover.jpg	astron_belt/logo.jpg	astron_belt/back.jpeg	1983-03-16	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-07-06 19:15:32.098+02	2024-07-06 19:15:32.098+02	\N	\N	\N	https://en.wikipedia.org/wiki/Astron_Belt	https://www.youtube.com/embed/roCbZXqBDaE
91	Champion Baseball	champion_baseball/cover.jpeg	champion_baseball/logo.jpeg	champion_baseball/back.jpeg	1983-03-16	\N	\N	\N	1-2	\N	\N	NOT_PLAYED	2024-07-06 19:43:14.734+02	2024-07-06 19:44:28.744+02	\N	\N	\N	https://en.wikipedia.org/wiki/Champion_Baseball	https://www.youtube.com/embed/NCrd1dM8U44
92	Elevator Action	elevator_action/elevator_action/cover.jpg	elevator_action/elevator_action/logo.jpeg	elevator_action/elevator_action/back.jpg	1983-05-23	\N	NTSC	60	1-2	\N	\N	NOT_PLAYED	2024-07-06 19:58:09.592+02	2024-07-06 20:00:30.9+02	54	55		https://es.wikipedia.org/wiki/Elevator_Action	https://www.youtube.com/embed/LM5reigEnv4
94	Scramble	scramble/cover.jpg	scramble/logo.png	scramble/back.jpeg	1981-03-01	\N	GLOBAL	40	1-2	\N	\N	NOT_PLAYED	2024-07-07 11:20:26.092+02	2024-07-07 11:20:26.092+02	\N	\N	\N	https://es.wikipedia.org/wiki/Scramble	https://www.youtube.com/embed/3Vc-RIkpk40
95	Xevious	xevious/xevious/cover.jpg	xevious/xevious/logo.png	xevious/xevious/back.jpg	1983-01-01	\N	PAL-EUR	40	1-2	\N	\N	NOT_PLAYED	2024-07-07 11:33:35.244+02	2024-07-07 11:35:03.7+02	56	57	\N	https://es.wikipedia.org/wiki/Xevious	https://www.youtube.com/embed/W0uoQTMnzs4
96	Star Wars	star_wars/star_wars_83/cover.png	star_wars/star_wars_83/logo.png	star_wars/star_wars_83/back.jpeg	1983-05-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-07-07 12:00:04.211+02	2024-07-07 12:01:00.11+02	47	58	\N	https://es.wikipedia.org/wiki/Star_Wars_(videojuego_de_1983)	https://www.youtube.com/embed/nJv94FPRddA
97	Punch-Out!!	punch_out/punch_out_84/cover.jpeg	punch_out/punch_out_84/logo.jpg	punch_out/punch_out_84/back.jpeg	1984-02-17	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-07-07 12:35:01.859+02	2024-07-07 12:35:49.97+02	57	59	\N	https://es.wikipedia.org/wiki/Punch-Out!!_(arcade)	https://www.youtube.com/embed/XeQip05mDRc
98	Archon: The Light and the Dark	archon/archon_the_light_and_dark/cover.jpeg	archon/archon_the_light_and_dark/logo.png	archon/archon_the_light_and_dark/back.jpeg	1983-01-01	\N	GLOBAL	40	1-2	\N	\N	NOT_PLAYED	2024-07-07 13:01:35.25+02	2024-07-07 13:02:56.414+02	58	60	\N	https://es.wikipedia.org/wiki/Archon:_The_Light_and_the_Dark	https://www.youtube.com/embed/VD6mRUMU0S4
99	M.U.L.E.	mule/cover.jpg	mule/logo.jpeg	mule/back.jpg	1983-01-01	\N	GLOBAL	150	1-4	\N	\N	NOT_PLAYED	2024-07-07 13:19:58.165+02	2024-07-07 13:19:58.165+02	\N	\N	\N	https://es.wikipedia.org/wiki/M.U.L.E.	https://www.youtube.com/embed/Cs3G6dxx2FQ
100	Bomberman	bomberman/bomberman/cover.jpeg	bomberman/bomberman/logo.jpeg	bomberman/bomberman/back.jpeg	1983-07-01	\N	NTSC	120	1	Eric and the Floaters (MSX - EU)	\N	NOT_PLAYED	2024-07-07 19:15:26.676+02	2024-07-07 19:16:54.46+02	59	61	\N	https://es.wikipedia.org/wiki/Bomberman_(videojuego)	https://www.youtube.com/embed/mjizZJZtJuI
101	Castle Wolfenstein	wolfenstein/castle wolfenstein/cover.jpeg	wolfenstein/castle wolfenstein/logo.jpeg	wolfenstein/castle wolfenstein/back.jpg	1981-09-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-07-07 19:51:48.29+02	2024-07-07 19:52:49.721+02	60	62	\N	https://es.wikipedia.org/wiki/Castle_Wolfenstein	https://www.youtube.com/embed/SV5VzYHEC0c
102	Donkey Kong 3	donkey_kong/donkey_kong_3/cover.jpg	donkey_kong/donkey_kong_3/logo.jpeg	donkey_kong/donkey_kong_3/back.jpeg	1983-10-01	\N	PAL-EUR	180	1-2	\N	\N	NOT_PLAYED	2024-07-08 15:22:02.486+02	2024-07-08 15:23:00.675+02	13	14	#663605	https://es.wikipedia.org/wiki/Donkey_Kong_3	https://www.youtube.com/embed/oN5EGEfVXe4
104	David's Midnight Magic	David_Midnight_Magic/cover.png	David_Midnight_Magic/logo.png	David_Midnight_Magic/back.jpg	1982-01-01	\N	GLOBAL	25	1-4	\N	\N	NOT_PLAYED	2024-07-08 16:05:41.587+02	2024-07-08 16:05:41.587+02	\N	\N	\N	https://en.wikipedia.org/wiki/David%27s_Midnight_Magic	https://www.youtube.com/embed/rgFO3hbmqY0
103	Donkey Kong Jr. Math	donkey_kong/donkey_kong_jr_math/cover.jpeg	donkey_kong/donkey_kong_jr_math/logo.png	donkey_kong/donkey_kong_jr_math/back.jpeg	1983-12-12	32	PAL-ES	120	1-2	\N	\N	NOT_PLAYED	2024-07-08 15:42:26.347+02	2024-07-08 15:44:45.01+02	13	63	#663605	https://es.wikipedia.org/wiki/Donkey_Kong_Jr._Math	https://www.youtube.com/embed/GXGGe0wkZcI
105	Demon Attack	demon_attack/cover.jpg	demon_attack/logo.jpeg	demon_attack/back.jpeg	1982-04-01	\N	GLOBAL	25	1-2	\N	\N	NOT_PLAYED	2024-07-08 16:17:42.386+02	2024-07-08 16:17:42.386+02	\N	\N	\N	https://es.wikipedia.org/wiki/Demon_Attack	https://www.youtube.com/embed/5GwoSr12kxY
106	Tron	tron/tron_82/cover.jpeg	tron/tron_82/logo.jpg	tron/tron_82/back.jpeg	1982-05-01	\N	\N	\N	1-2	\N	\N	NOT_PLAYED	2024-07-08 16:29:28.511+02	2024-07-08 16:30:38.124+02	61	64	\N	https://en.wikipedia.org/wiki/Tron_(video_game)	https://www.youtube.com/embed/GmPbeHCkAmc
107	Lode Runner	lode_runner/lode_runner/cover.jpeg	lode_runner/lode_runner/logo.png	lode_runner/lode_runner/back.jpeg	1983-06-23	\N	NTSC	50	1	\N	\N	NOT_PLAYED	2024-07-08 16:50:45.968+02	2024-07-08 16:51:59.105+02	62	65	\N	https://es.wikipedia.org/wiki/Lode_Runner#Arcade	https://www.youtube.com/embed/P4exGV-XUbQ
120	Ballon Fight	ballon_fight/ballon_fight/cover.jpeg	ballon_fight/ballon_fight/logo.png	ballon_fight/ballon_fight/back.jpeg	1984-11-01	\N	PAL-ES	120	1-2	\N	\N	NOT_PLAYED	2024-07-10 21:27:42.443+02	2024-07-10 21:29:29.283+02	66	70	\N	https://es.wikipedia.org/wiki/Balloon_Fight	https://www.youtube.com/embed/i9cp4tlrGYY
108	1942	19xx/1942/cover.jpg	19xx/1942/logo.png	19xx/1942/back.jpg	1984-11-30	\N	NTSC	60	1	\N	\N	NOT_PLAYED	2024-07-09 15:40:53.992+02	2024-07-09 15:43:08.912+02	63	66	\N	https://es.wikipedia.org/wiki/1942_(videojuego)	https://www.youtube.com/embed/Em7UwOOBvlA
109	Cobra Command	cobra_command_84/cover.jpg	cobra_command_84/logo.jpg	cobra_command_84/back.jpeg	1984-02-01	\N	\N	\N	1	Thunder Storm (jp)	\N	NOT_PLAYED	2024-07-09 16:08:35.439+02	2024-07-09 16:08:35.439+02	\N	\N	\N	https://es.wikipedia.org/wiki/Cobra_Command_(videojuego_de_1984)	https://www.youtube.com/embed/Q7E7HGL0TWY
110	Karate Champ	karate_champ/cover.png	karate_champ/logo.png	karate_champ/back.jpeg	1984-05-01	\N	NTSC	28	1-2	\N	\N	NOT_PLAYED	2024-07-09 16:24:21.399+02	2024-07-09 16:24:21.399+02	\N	\N	\N	https://es.wikipedia.org/wiki/Karate_Champ	https://www.youtube.com/embed/gwV3xqS9_aQ
111	Kung-Fu Master	kung-fu_master/cover.jpg	kung-fu_master/logo.jpeg	kung-fu_master/back.jpg	1984-12-01	\N	GLOBAL	50	1-2	Spartan X (jp)	\N	NOT_PLAYED	2024-07-09 16:47:52.849+02	2024-07-09 16:49:53.86+02	\N	\N	\N	https://es.wikipedia.org/wiki/Kung-Fu_Master_(videojuego)	https://www.youtube.com/embed/EgO4HtWIJjQ
112	Yie Ar Kung-Fu	yie_ar_kung-fu/yie-ar_kung-fu/cover.jpg	yie_ar_kung-fu/yie-ar_kung-fu/logo.jpeg	yie_ar_kung-fu/yie-ar_kung-fu/back.jpeg	1984-10-25	\N	GLOBAL	15	\N	\N	\N	NOT_PLAYED	2024-07-09 17:04:10.611+02	2024-07-09 17:04:50.565+02	64	67	\N	https://es.wikipedia.org/wiki/Yie_Ar_Kung-Fu	https://www.youtube.com/embed/4MQqwW1dJSk
113	Lady Bug	lady_bug/cover.jpg	lady_bug/logo.jpeg	lady_bug/back.jpg	1981-10-01	\N	GLOBAL	20	1-2	\N	\N	NOT_PLAYED	2024-07-10 15:30:48.688+02	2024-07-10 15:30:48.688+02	\N	\N	\N	https://en.wikipedia.org/wiki/Lady_Bug_(video_game)	https://www.youtube.com/embed/_K7BHmrEsSk
114	Miner 2049er	miner_2049er/cover.jpeg	miner_2049er/logo.jpeg	miner_2049er/back.jpg	1982-12-01	\N	GLOBAL	60	1	\N	\N	NOT_PLAYED	2024-07-10 15:51:38.719+02	2024-07-10 15:51:38.719+02	\N	\N	\N	https://en.wikipedia.org/wiki/Miner_2049er	https://www.youtube.com/embed/UWszRjD_pY8
115	Gaplus	galaxian/gaplus/cover.jpeg	galaxian/gaplus/logo.jpeg	galaxian/gaplus/back.jpg	1984-01-08	\N	\N	\N	1-2	Galaga 3 (us)	\N	NOT_PLAYED	2024-07-10 16:00:36.583+02	2024-07-10 16:01:20.923+02	6	7	\N	https://es.wikipedia.org/wiki/Gaplus	https://www.youtube.com/embed/2SWqdUfv7J4
116	Pac-Land	pacman/pacland/cover.png	pacman/pacland/logo.jpeg	pacman/pacland/back.jpg	1984-08-01	\N	NTSC	20	1-2	\N	\N	NOT_PLAYED	2024-07-10 16:18:00.945+02	2024-07-10 16:18:31.116+02	8	68	#ed6b0e	https://es.wikipedia.org/wiki/Pac-Land	https://www.youtube.com/embed/yvHPE20pPPo
117	Marble Madness	marble_madness/marble_madness/cover.jpg	marble_madness/marble_madness/logo.jpeg	marble_madness/marble_madness/back.jpeg	1984-12-15	\N	PAL-EUR	60	1-2	\N	\N	NOT_PLAYED	2024-07-10 16:46:37.74+02	2024-07-10 16:47:48.817+02	65	69	\N	https://es.wikipedia.org/wiki/Marble_Madness	https://www.youtube.com/embed/XzlA1JTPMto
118	Sabre Wulf	sabreman/sabre_wulf/cover.jpg	sabreman/sabre_wulf/logo.png	sabreman/sabre_wulf/back.jpeg	1984-01-01	\N	GLOBAL	20	1	\N	\N	NOT_PLAYED	2024-07-10 20:50:11.566+02	2024-07-10 20:50:47.113+02	29	30	\N	https://es.wikipedia.org/wiki/Sabre_Wulf	https://www.youtube.com/embed/cJ_0KixP1ds
119	Ice Climber	ice_climber/cover.jpg	ice_climber/logo.png	ice_climber/back.jpeg	1985-01-30	\N	PAL-ES	60	1-2	\N	\N	NOT_PLAYED	2024-07-10 21:08:58.342+02	2024-07-10 21:08:58.342+02	\N	\N	\N	https://es.wikipedia.org/wiki/Ice_Climber	https://www.youtube.com/embed/3YGJLbasFDg
121	Pitfall II: Lost Caverns	pitfall/pitfall_ii/cover.png	pitfall/pitfall_ii/logo.png	pitfall/pitfall_ii/back.jpg	1984-02-17	\N	GLOBAL	80	1	\N	\N	NOT_PLAYED	2024-07-11 15:29:58.515+02	2024-07-11 15:31:08.309+02	17	17	\N	https://en.wikipedia.org/wiki/Pitfall_II:_Lost_Caverns	https://www.youtube.com/embed/ZZIMaJnzPzw
122	Ultima III: Exodus	ultima/ultima_iii/cover.jpg	ultima/ultima_iii/logo.jpeg	ultima/ultima_iii/back.jpeg	1983-08-23	\N	GLOBAL	60	1	\N	\N	NOT_PLAYED	2024-07-11 15:43:54.264+02	2024-07-11 15:44:58.406+02	10	11	\N	https://es.wikipedia.org/wiki/Ultima_III:_Exodus	https://www.youtube.com/embed/XFHpuc4yqzk
123	One on One: Dr. J vs. Larry Bird	one_on_one_basketball/cover.jpg	one_on_one_basketball/logo.jpg	one_on_one_basketball/back.jpg	1984-01-01	\N	GLOBAL	15	1-2	\N	\N	NOT_PLAYED	2024-07-11 15:53:40.838+02	2024-07-11 15:53:40.838+02	\N	\N	\N	https://en.wikipedia.org/wiki/One_on_One:_Dr._J_vs._Larry_Bird	https://www.youtube.com/embed/URobcuTcBFU
124	Ghosts 'n Goblins	ghosts_n_goblins/ghosts_n_goblins/cover.jpeg	ghosts_n_goblins/ghosts_n_goblins/logo.jpeg	ghosts_n_goblins/ghosts_n_goblins/back.jpeg	1985-09-19	\N	PAL-EUR	140	1	Makaimura (Demon World Village) (jp)	\N	PLAYED	2024-07-11 16:30:33.147+02	2024-07-11 16:31:54.721+02	67	71	\N	https://es.wikipedia.org/wiki/Ghosts_%27n_Goblins	https://www.youtube.com/embed/SugLAqaPhqA
125	Hang On	hang_on/hang_on/cover.jpeg	hang_on/hang_on/logo.png	hang_on/hang_on/back.jpg	1985-07-02	\N	PAL-EUR	20	1	\N	\N	PLAYED	2024-07-12 09:21:18.645+02	2024-07-12 09:24:03.952+02	68	72	\N	https://es.wikipedia.org/wiki/Hang-On	https://www.youtube.com/embed/TopLKeDqYhw
126	Space Harrier	space_harrier/space_harrier/cover.png	space_harrier/space_harrier/logo.jpeg	space_harrier/space_harrier/back.jpg	1985-10-02	\N	PAL-EUR	25	1	\N	\N	NOT_PLAYED	2024-07-12 13:40:18.479+02	2024-07-12 13:41:27.377+02	69	73	\N	https://es.wikipedia.org/wiki/Space_Harrier	https://www.youtube.com/embed/Hzgrb-mjLaM
127	Excitebike	excitebike/excitebike/cover.jpeg	excitebike/excitebike/logo.png	excitebike/excitebike/back.jpeg	1984-11-28	\N	PAL-ES	60	1-2	\N	\N	NOT_PLAYED	2024-07-15 12:31:47.657+02	2024-07-15 12:33:34.056+02	70	75	\N	https://es.wikipedia.org/wiki/Excitebike	https://www.youtube.com/embed/pkAtNjRSZds
128	Super Mario Bros.	mario/super_mario_bros/cover.jpeg	mario/super_mario_bros/logo.png	mario/super_mario_bros/back.jpeg	1985-09-13	86	PAL-ES	90	1	\N	\N	PLAYED	2024-07-15 13:18:01.608+02	2024-07-15 13:18:49.664+02	14	74	#ee1c25	https://es.wikipedia.org/wiki/Super_Mario_Bros.	https://www.youtube.com/embed/SgqTmKZ4-UA
129	Paperboy	paperboy/paperboy/cover.jpeg	paperboy/paperboy/logo.jpeg	paperboy/paperboy/back.jpeg	1985-02-01	\N	PAL-EUR	60	1	\N	\N	NOT_PLAYED	2024-07-16 16:57:02.862+02	2024-07-16 16:58:53.159+02	71	76	\N	https://es.wikipedia.org/wiki/Paperboy_(videojuego)	https://www.youtube.com/embed/l6DEL9GY-VU
130	Ultima IV: Quest of the Avatar	ultima/ultima_iv/cover.jpeg	ultima/ultima_iv/logo.jpeg	ultima/ultima_iv/back.jpeg	1985-09-16	\N	GLOBAL	90	1	\N	\N	NOT_PLAYED	2024-07-16 22:57:34.835+02	2024-07-16 22:58:32.703+02	10	11	\N	https://es.wikipedia.org/wiki/Ultima_IV:_Quest_of_the_Avatar	https://www.youtube.com/embed/bHfAE5tXHv4
\.


--
-- Data for Name: Genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Genres" (id, name, main_img, "createdAt", "updatedAt", "parentId", is_main) FROM stdin;
66	Motociclismo	racing/motorcycle.jpeg	2024-07-12 09:01:42.48+02	2024-07-12 09:01:42.48+02	51	\N
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
28	Plataformas isométrico	platforms/isometric.png	2024-06-07 11:31:36.265+02	2024-06-07 11:31:36.265+02	1	\N
29	Película interactiva	adventure/interactiveMovie.jpeg	2024-06-12 16:09:08.259+02	2024-06-12 16:09:08.259+02	11	\N
30	First Person Shooter	shooter/fps.png	2024-06-15 12:15:54.832+02	2024-06-15 12:15:54.832+02	7	\N
52	Carreras arcade	racing/arcade-racing.jpeg	2024-07-03 20:37:12.191+02	2024-07-12 09:04:51.646+02	51	\N
31	Tennis	sports/tennis.jpeg	2024-06-15 20:15:08.554+02	2024-06-15 20:15:31.598+02	13	\N
32	Olimpíadas	sports/Olympics.png	2024-06-15 20:56:48.03+02	2024-06-15 20:57:05.325+02	13	\N
33	Combate en vehículos	vehicle-combat/car-combat.jpeg	2024-06-21 11:17:30.139+02	2024-06-21 11:17:40.658+02	\N	\N
34	Combate en automóvil	vehicle-combat/car-combat.jpeg	2024-06-21 11:18:04.664+02	2024-06-21 11:18:04.664+02	33	\N
35	Combate espacial	vehicle-combat/space-combat.jpeg	2024-06-21 11:21:03.781+02	2024-06-21 11:21:03.781+02	33	\N
36	Simulador	simulator/job-simulator.jpeg	2024-06-21 13:03:20.812+02	2024-06-21 13:03:20.812+02	\N	\N
37	Simulador de empleo	simulator/job-simulator.jpeg	2024-06-21 13:05:14.629+02	2024-06-21 13:05:14.629+02	36	\N
38	Acción y aventura	adventure/adventure.jpg	2024-06-22 12:09:59.511+02	2024-06-22 12:09:59.511+02	11	\N
39	Lightgun Shooter	shooter/light-gun-shooter.jpeg	2024-06-22 13:30:20.135+02	2024-06-22 13:30:20.135+02	7	\N
40	Caza	sports/hunt.jpeg	2024-06-22 13:37:57.94+02	2024-06-22 13:37:57.94+02	13	\N
41	Run and Gun	shooter/runandgun.jpg	2024-06-23 12:02:11.372+02	2024-06-23 12:02:11.372+02	7	\N
42	Estrategia	strategy/rts.jpeg	2024-06-24 11:23:37.37+02	2024-06-24 11:23:37.37+02	\N	\N
43	Estrategia por turnos	strategy/tbs.jpg	2024-06-24 11:24:13.709+02	2024-06-24 11:24:23.142+02	42	\N
44	Estrategia en tiempo real	strategy/rts.jpeg	2024-06-24 11:25:09.799+02	2024-06-24 11:25:09.799+02	42	\N
45	Atrapar y esquivar	action/dodgecatch.jpeg	2024-06-24 12:32:05.031+02	2024-06-24 12:32:15.499+02	24	\N
46	Simulador de vida	simulator/life-sim.jpeg	2024-06-25 16:42:07.502+02	2024-06-25 16:42:07.502+02	36	\N
47	Lucha	fight/fight2d.jpeg	2024-06-26 16:05:16.562+02	2024-06-26 16:05:16.562+02	\N	\N
48	Lucha 2D	fight/fight2d.jpeg	2024-06-26 16:05:38.611+02	2024-06-26 16:05:38.611+02	47	\N
49	Hack and slash	action/hacknslash.jpg	2024-06-26 16:37:31.228+02	2024-06-26 16:37:31.228+02	24	\N
50	Combate en tanque	vehicle-combat/tank-combat.jpg	2024-07-03 15:56:58.301+02	2024-07-03 15:56:58.301+02	33	\N
51	Carreras	racing/arcade-racing.jpeg	2024-07-03 20:36:59.098+02	2024-07-03 20:36:59.098+02	\N	\N
53	Combate aéreo	vehicle-combat/air-combat.jpg	2024-07-04 16:12:31.622+02	2024-07-04 16:12:31.622+02	33	\N
54	RPG por turnos	rpg/turnbased.jpg	2024-07-05 08:35:17.975+02	2024-07-05 08:35:17.975+02	18	\N
55	Construcción de ciudades	simulator/citybuilding.jpg	2024-07-05 10:18:54.015+02	2024-07-05 10:18:54.015+02	36	\N
56	Basket	sports/basketball.jpg	2024-07-06 11:02:58.842+02	2024-07-06 11:02:58.842+02	13	\N
57	Action RPG	rpg/action-rpg.png	2024-07-06 11:37:14.133+02	2024-07-06 11:37:14.133+02	18	\N
59	Shooter sobre raíles	shooter/rail-shooter.jpg	2024-07-06 19:11:19.852+02	2024-07-06 19:11:19.852+02	7	\N
60	Béisbol	sports/baseball.jpg	2024-07-06 19:19:40.678+02	2024-07-06 19:19:40.678+02	13	\N
61	Boxeo	fight/boxing.jpeg	2024-07-07 12:15:04.094+02	2024-07-07 12:15:04.094+02	47	\N
62	Tycoon	simulator/tycoon.jpeg	2024-07-07 13:14:58.758+02	2024-07-07 13:14:58.758+02	36	\N
63	Sigilo	action/stealth.jpg	2024-07-07 19:23:36.989+02	2024-07-07 19:23:36.989+02	24	\N
64	Pinball	arcade/pinball.jpg	2024-07-08 15:55:39.685+02	2024-07-08 15:55:39.685+02	16	\N
65	Karate	fight/karate.jpeg	2024-07-09 16:15:05.934+02	2024-07-09 16:15:05.934+02	47	\N
67	Turismos	racing/touring.jpg	2024-07-12 09:09:54.003+02	2024-07-12 09:09:54.003+02	51	\N
58	F1	racing/f1.jpg	2024-07-06 12:22:56.868+02	2024-07-12 09:10:06.643+02	51	\N
\.


--
-- Data for Name: People; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."People" (id, name, main_img, "createdAt", "updatedAt", nationality, birthday, wikipedia, is_main) FROM stdin;
42	Mike Singleton	Mike_Singleton.jpeg	2024-06-20 16:35:11.452+02	2024-06-20 16:35:11.452+02	gv	1951-02-21	https://es.wikipedia.org/wiki/Mike_Singleton	\N
43	David Braben	David_Braben.jpg	2024-06-21 11:03:05.759+02	2024-06-21 11:03:05.759+02	gb	1964-01-02	https://es.wikipedia.org/wiki/David_Braben	\N
4	Masaharu Yoshii	Masaharu_Yoshii.png	2024-03-29 13:32:09.931+01	2024-03-29 13:54:31.505+01	jp	1948-04-01	\N	\N
44	Alexey Pajitnov	Alexey_Pajitnov.jpeg	2024-06-22 16:07:18.132+02	2024-06-22 16:07:18.132+02	ru	1955-04-16	https://es.wikipedia.org/wiki/Aleks%C3%A9i_P%C3%A1zhitnov	\N
2	Naoto Ōshima	Naoto_Ohshima.jpeg	2023-12-29 18:25:18.962+01	2024-03-30 13:03:32.329+01	jp	1964-02-26	https://es.wikipedia.org/wiki/Naoto_%C5%8Cshima	\N
3	Hirokazu Yasuhara	Hirokazu_Yasuhara.jpeg	2023-12-29 18:27:49.063+01	2024-03-30 13:04:10.415+01	jp	1965-10-12	https://es.wikipedia.org/wiki/Hirokazu_Yasuhara	\N
6	Stephen Russell	Stephen_Russell.jpeg	2024-04-23 20:58:47.549+02	2024-04-23 20:58:47.549+02	us	1937-05-12	https://es.wikipedia.org/wiki/Steve_Russell	\N
7	Allan Alcorn	Al_Alcorn.jpg	2024-04-26 10:26:27.527+02	2024-04-26 10:26:27.527+02	us	1948-01-01	https://es.wikipedia.org/wiki/Allan_Alcorn	\N
10	Will Crowther	Will_Crowther.jpeg	2024-04-27 19:02:35.416+02	2024-04-27 19:02:35.416+02	us	1936-01-01	https://es.wikipedia.org/wiki/William_Crowther	\N
11	Lyle Rains	lyle-rains.jpeg	2024-04-29 18:04:23.511+02	2024-04-29 18:04:23.511+02	us	1948-01-01	https://en.wikipedia.org/wiki/Lyle_Rains	\N
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
33	Sandy White	person.png	2024-06-07 11:34:41.796+02	2024-06-07 11:34:41.796+02	gb	1960-01-01	\N	\N
34	Veronika Megler	person.png	2024-06-09 12:01:29.531+02	2024-06-09 12:01:29.531+02	au	1960-10-14	https://en.wikipedia.org/wiki/Veronika_Megler	\N
35	Matthew Smith	Matthew_Smith.jpeg	2024-06-10 21:07:23.333+02	2024-06-10 21:07:23.333+02	gb	1966-01-01	https://en.wikipedia.org/wiki/Matthew_Smith_(games_programmer)	\N
36	Don Bluth	Don_Bluth.jpeg	2024-06-12 16:26:35.853+02	2024-06-12 16:26:35.853+02	us	1937-09-13	https://es.wikipedia.org/wiki/Don_Bluth	\N
37	Chris Stamper	Chris_Stamper.jpeg	2024-06-15 11:54:16.172+02	2024-06-15 11:54:23.493+02	gb	1958-01-01	https://es.wikipedia.org/wiki/Hermanos_Stamper	f
38	Tim Stamper	Tim_Stamper.jpeg	2024-06-15 11:55:12.936+02	2024-06-15 11:55:17.19+02	gb	1961-01-01	https://es.wikipedia.org/wiki/Hermanos_Stamper	f
39	Peter Liepa	person.png	2024-06-15 20:35:12.827+02	2024-06-15 20:35:12.827+02	ca	1960-01-01	\N	\N
40	Paul Owens	person.png	2024-06-19 21:22:21.894+02	2024-06-19 21:22:21.894+02	gb	1960-01-01	https://en.wikipedia.org/wiki/Paul_Owens_(games_programmer)	\N
41	Bruce Carver	person.png	2024-06-20 16:14:13.701+02	2024-06-20 16:14:13.701+02	us	1948-05-04	https://en.wikipedia.org/wiki/Bruce_Carver	\N
45	Archer Maclean	person.png	2024-06-23 10:49:04.699+02	2024-06-23 10:49:04.699+02	gb	1962-01-28	https://en.wikipedia.org/wiki/Archer_Maclean	\N
46	Tokuro Fujiwara	Tokuro_Fujiwara.jpeg	2024-06-23 12:05:30.085+02	2024-06-23 12:05:35.297+02	jp	1961-04-07	https://es.wikipedia.org/wiki/Tokuro_Fujiwara	f
12	Ed Logg	Ed_Logg.jpg	2024-04-29 18:05:50.729+02	2024-06-26 16:44:06.756+02	us	1948-01-01	https://en.wikipedia.org/wiki/Ed_Logg	f
47	Machiguchi Hiroyasu	person.png	2024-06-28 09:27:00.388+02	2024-06-28 09:27:00.388+02	jp	1960-01-01	\N	\N
48	Warren Robinett	Warren_Robinett.jpg	2024-07-03 16:47:56.262+02	2024-07-03 16:48:03.271+02	us	1951-12-25	https://es.wikipedia.org/wiki/Warren_Robinett	\N
49	Dave Nutting	person.png	2024-07-04 15:55:46.401+02	2024-07-04 15:55:46.401+02	us	1930-12-26	https://en.wikipedia.org/wiki/Dave_Nutting	\N
50	Dave Theurer	person.png	2024-07-04 16:47:16.351+02	2024-07-04 16:47:16.351+02	us	1960-01-01	https://en.wikipedia.org/wiki/Dave_Theurer	\N
51	Andrew C. Greenberg	person.png	2024-07-05 08:36:43.978+02	2024-07-05 08:36:43.978+02	us	1957-01-01	https://en.wikipedia.org/wiki/Andrew_C._Greenberg	\N
52	Robert Woodhead	person.png	2024-07-05 08:37:57.573+02	2024-07-05 08:37:57.573+02	us	1958-01-01	https://en.wikipedia.org/wiki/Robert_Woodhead	\N
53	Don Daglow	Don_Daglow.jpg	2024-07-05 10:12:34.309+02	2024-07-05 10:12:41.822+02	us	1958-01-01	https://en.wikipedia.org/wiki/Don_Daglow	\N
54	John Dunn	person.png	2024-07-05 11:19:17.326+02	2024-07-05 11:19:17.326+02	us	1943-06-07	https://es.wikipedia.org/wiki/John_Dunn_(computer)	\N
55	Doug Neubauer	person.png	2024-07-06 10:46:02.369+02	2024-07-06 10:46:02.369+02	us	1953-01-01	https://en.wikipedia.org/wiki/Doug_Neubauer	\N
56	Yoshiki Okamoto	person.png	2024-07-06 13:28:00.133+02	2024-07-06 13:28:00.133+02	jp	1961-06-10	https://es.wikipedia.org/wiki/Yoshiki_Okamoto	\N
57	Masanobu Endō	person.png	2024-07-07 11:24:25.976+02	2024-07-07 11:24:25.976+02	jp	1959-02-23	https://en.wikipedia.org/wiki/Masanobu_End%C5%8D	\N
58	Genyo Takeda	Genyo_Takeda.jpeg	2024-07-07 12:16:53.315+02	2024-07-07 12:16:53.315+02	jp	1949-03-07	https://es.wikipedia.org/wiki/Genyo_Takeda	\N
59	Anne Westfall	person.png	2024-07-07 12:50:16.196+02	2024-07-07 12:50:16.196+02	us	1954-01-01	https://en.wikipedia.org/wiki/Anne_Westfall	\N
60	Rob Fulop	person.png	2024-07-08 16:09:13.766+02	2024-07-08 16:09:13.766+02	us	1959-01-01	https://es.wikipedia.org/wiki/Rob_Fulop	\N
61	Douglas E. Smith	Douglas_E._Smith.jpg	2024-07-08 16:35:05.903+02	2024-07-08 16:35:05.903+02	us	1960-10-28	https://en.wikipedia.org/wiki/Douglas_E._Smith	\N
62	Yoshihisa Kishimoto	Yoshihisa_Kishimoto.jpg	2024-07-09 15:56:11.067+02	2024-07-09 15:57:23.707+02	jp	1961-09-17	https://es.wikipedia.org/wiki/Yoshihisa_Kishimoto	\N
63	Takashi Nishiyama	Takashi_Nishiyama.jpeg	2024-07-09 16:32:40.369+02	2024-07-09 16:32:40.369+02	jp	1960-01-01	https://en.wikipedia.org/wiki/Takashi_Nishiyama	\N
64	Mark Cerny	Mark_Cerny.jpg	2024-07-10 16:25:21.998+02	2024-07-10 16:25:27.571+02	us	1964-08-24	https://es.wikipedia.org/wiki/Mark_Cerny	f
65	Satoru Iwata	Satoru_Iwata.jpg	2024-07-10 21:18:20.364+02	2024-07-10 21:18:20.364+02	jp	1959-12-06	https://es.wikipedia.org/wiki/Satoru_Iwata	t
66	Yu Suzuki	Yu_Suzuki.jpg	2024-07-12 08:56:51.838+02	2024-07-12 09:14:23.302+02	jp	1958-06-10	https://es.wikipedia.org/wiki/Y%C5%AB_Suzuki	\N
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
11	Sega Mark III	sega/master_system/Sega_Mark_III.jpg	1985-10-20	\N	2024-06-22 16:47:52.214+02	2024-06-22 16:47:52.214+02	14
12	Master System II	sega/master_system/Master_System_II.jpg	1990-01-01	\N	2024-06-22 16:49:01.469+02	2024-06-22 16:49:01.469+02	14
\.


--
-- Data for Name: Platforms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Platforms" (id, name, mini_logo, img, release_date, gen, specs, type, alt_names, color, "createdAt", "updatedAt", "manufacturerId", main_img, wikipedia, is_main) FROM stdin;
12	NES	nintendo/nes/logo.png	nintendo/nes/platform-img.png	1983-07-15	3	8 bits\nCartuchos	desktop	Famicom (Japón)	#8c8694	2024-06-03 15:43:07.073+02	2024-06-03 15:43:31.343+02	32	nintendo/nes/logo.png	https://es.wikipedia.org/wiki/Nintendo_Entertainment_System	t
13	SG-1000	sega/sg-1000/logo.png	sega/sg-1000/platform-img.png	1983-07-15	3	8 bits\nCartucho	desktop	\N	\N	2024-06-04 16:13:06.461+02	2024-06-04 16:13:34.925+02	1	sega/sg-1000/logo.png	https://es.wikipedia.org/wiki/SG-1000	\N
4	PC	pc/mini_logo.jpg	pc/platform_img.jpg	1970-01-01	1	\N	hybrid	\N	\N	2024-04-23 16:20:38.458+02	2024-04-23 16:20:38.458+02	\N	pc/logo.png	https://es.wikipedia.org/wiki/Computadora	\N
14	Master System	sega/master_system/mini-logo.png	sega/master_system/platform-img.jpeg	1985-10-20	3	Cartuchos\n8 bits	desktop	Sega Mark III (jp)	#2c2c30	2024-06-22 16:46:53.597+02	2024-06-22 16:47:13.324+02	1	sega/master_system/logo.png	https://es.wikipedia.org/wiki/Master_System	f
5	Arcade	arcade/games-icon.png	arcade/main-img.jpg	1971-09-01	1	\N	desktop	\N	\N	2024-04-23 16:31:18.883+02	2024-04-23 16:33:41.146+02	\N	arcade/logo.jpg	https://es.wikipedia.org/wiki/Arcade	\N
7	Bally Astrocade	astrocade/mini-logo.jpg	astrocade/platform-img.jpg	1978-04-01	2	Cartuchos	desktop	Astrovision	\N	2024-04-27 14:06:57.88+02	2024-04-27 14:07:48.841+02	16	astrocade/logo.png	https://es.wikipedia.org/wiki/Bally_Astrocade	\N
6	Magnavox Odyssey	magnavox/odyssey/mini-logo.jpeg	magnavox/odyssey/platform-img.png	1972-09-01	1	Tarjetas	desktop	\N	\N	2024-04-25 16:11:12.816+02	2024-07-04 15:29:40.153+02	9	magnavox/odyssey/logo.png	https://es.wikipedia.org/wiki/Magnavox_Odyssey	\N
8	Atari 2600	atari/2600/mini-logo.png	atari/2600/platform-img.jpg	1977-09-11	2	Cartucho\n8 bits	desktop	Atari VCS	\N	2024-04-27 18:24:15.824+02	2024-04-27 18:52:42.275+02	11	atari/2600/logo.png	https://es.wikipedia.org/wiki/Atari_2600	\N
9	Intellivision	intellivision/minilogo.jpg	intellivision/platform_img.jpg	1979-01-01	2	8 bits	desktop	\N	\N	2024-05-26 11:32:48.235+02	2024-05-26 11:32:57.212+02	8	intellivision/logo.png	https://es.wikipedia.org/wiki/Intellivision	\N
2	Mega Drive	sega/megadrive/mini_logo.png	sega/megadrive/platform_img.jpeg	1988-10-29	4	16bits\nCartuchos	desktop	Genesis (América)	#4d4d4d	2023-12-24 13:36:13.927+01	2024-05-26 12:11:55.229+02	1	sega/megadrive/logo.png	https://es.wikipedia.org/wiki/Mega_Drive	t
15	Fairchild Channel F	fairchild/mini-logo.png	fairchild/platform-img.jpg	1976-11-01	2	Cartuchos	desktop	\N	\N	2024-07-04 15:38:01.831+02	2024-07-04 15:38:40.968+02	71	fairchild/logo.png	https://es.wikipedia.org/wiki/Fairchild_Channel_F	\N
10	ColecoVision	colecovision/minilogo.jpeg	colecovision/platform-img.jpeg	1982-08-01	2	8 bits\nCartucho	desktop	\N	\N	2024-05-26 12:33:05.034+02	2024-05-26 12:33:37.596+02	33	colecovision/logo.png	https://es.wikipedia.org/wiki/ColecoVision	\N
11	Atari 5200	atari/5200/minilogo.jpeg	atari/5200/platform-img.jpeg	1982-11-01	2	8 bits\nCartuchos	desktop	\N	\N	2024-05-26 12:41:37.671+02	2024-07-06 10:56:38.207+02	11	atari/5200/logo.png	https://es.wikipedia.org/wiki/Atari_5200	\N
16	Magnavox Odyssey 2	magnavox/odyssey_2/mini-logo.png	magnavox/odyssey_2/platform-img.jpg	1978-09-01	2	Cartuchos	desktop	Videopac	\N	2024-07-06 11:17:03.515+02	2024-07-06 11:19:09.129+02	9	magnavox/odyssey_2/logo.png	https://es.wikipedia.org/wiki/Magnavox_Odyssey%C2%B2	\N
17	Vectrex	mb/vectrex/mini-logo.png	mb/vectrex/platform-img.jpg	1982-11-01	2	Cartuchos	desktop	\N	\N	2024-07-07 11:10:43.899+02	2024-07-07 11:10:50.608+02	79	mb/vectrex/logo.png	https://es.wikipedia.org/wiki/Vectrex	\N
18	Microvision	mb/microvision/logo.png	mb/microvision/platform-img.jpg	1979-11-01	2	Cartuchos	portable	\N	\N	2024-07-07 11:16:11.411+02	2024-07-07 11:16:18.278+02	79	mb/microvision/logo.png	https://es.wikipedia.org/wiki/Milton_Bradley_Microvision	\N
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
21	Text adventures	\N	2024-06-09 11:49:24.414+02	2024-06-09 12:28:01.459+02	20
22	Principal	t	2024-06-10 21:28:20.527+02	2024-06-10 21:28:20.527+02	21
23	Principal	t	2024-06-13 15:44:01.506+02	2024-06-13 15:44:01.506+02	22
24	Principal	t	2024-06-15 12:05:52.443+02	2024-06-15 12:05:52.443+02	23
25	Principal	t	2024-06-15 20:42:21.363+02	2024-06-15 20:42:21.363+02	24
26	Principal	t	2024-06-19 21:26:13.982+02	2024-06-19 21:26:13.982+02	25
27	Principal	t	2024-06-20 16:15:35.53+02	2024-06-20 16:15:35.53+02	26
28	Principal	t	2024-06-21 11:31:08.524+02	2024-06-21 11:31:08.524+02	27
29	1984	t	2024-06-21 13:23:01.616+02	2024-06-21 13:23:22.381+02	28
30	Principal	t	2024-06-22 12:53:50.454+02	2024-06-22 12:53:50.454+02	29
31	Principal	t	2024-06-22 16:18:30.576+02	2024-06-22 16:18:30.576+02	30
32	Principal	t	2024-06-23 10:58:23.561+02	2024-06-23 10:58:23.561+02	31
33	Principal	t	2024-06-23 11:15:34.09+02	2024-06-23 11:15:34.09+02	32
34	Principal	t	2024-06-23 12:20:44.052+02	2024-06-23 12:20:44.052+02	33
35	Principal	t	2024-06-24 11:44:59.045+02	2024-06-24 11:46:00.406+02	34
36	Principal	t	2024-06-24 12:23:57.875+02	2024-06-24 12:23:57.875+02	35
37	Principal	t	2024-06-24 13:23:59.446+02	2024-06-24 13:23:59.446+02	36
38	Principal	t	2024-06-26 15:50:41.204+02	2024-06-26 15:50:41.204+02	37
39	Principal	t	2024-06-26 16:43:29.724+02	2024-06-26 16:43:29.724+02	38
40	Principal	t	2024-06-28 09:28:17.882+02	2024-06-28 09:28:17.882+02	39
41	Principal	t	2024-07-03 16:09:55.671+02	2024-07-03 16:09:55.671+02	40
42	Principal	t	2024-07-03 16:34:01.34+02	2024-07-03 16:34:01.34+02	41
43	Principal	t	2024-07-03 20:16:41.138+02	2024-07-03 20:16:41.138+02	42
44	Principal	t	2024-07-04 16:48:39.115+02	2024-07-04 16:48:39.115+02	43
45	Principal	t	2024-07-05 08:45:32.188+02	2024-07-05 08:45:32.188+02	44
46	Principal	t	2024-07-05 09:04:42.995+02	2024-07-05 09:04:42.995+02	45
47	Atari	t	2024-07-05 10:57:07.981+02	2024-07-05 10:57:07.981+02	46
48	Trilogía original	t	2024-07-05 12:44:26.987+02	2024-07-05 12:44:26.987+02	47
49	Principal	t	2024-07-06 10:47:56.996+02	2024-07-06 10:47:56.996+02	48
50	Principal	t	2024-07-06 12:03:51.077+02	2024-07-06 12:03:51.077+02	49
51	Principal	t	2024-07-06 12:26:18.475+02	2024-07-06 12:26:18.475+02	50
52	Principal	t	2024-07-06 12:54:21.129+02	2024-07-06 12:54:21.129+02	51
53	Principal	t	2024-07-06 13:10:32.427+02	2024-07-06 13:10:32.427+02	52
54	Principal	t	2024-07-06 13:30:18.058+02	2024-07-06 13:30:18.058+02	53
55	Principal	t	2024-07-06 19:53:14.303+02	2024-07-06 19:53:14.303+02	54
56	Principal	t	2024-07-06 20:09:24.763+02	2024-07-06 20:09:24.763+02	55
57	Principal	t	2024-07-07 11:26:52.343+02	2024-07-07 11:26:52.343+02	56
58	Arcade	t	2024-07-07 11:54:42.384+02	2024-07-07 11:54:42.384+02	47
59	Arcade	t	2024-07-07 12:21:14.247+02	2024-07-07 12:21:14.247+02	57
60	Principal	t	2024-07-07 12:56:46.51+02	2024-07-07 12:56:46.51+02	58
61	Primera generación	t	2024-07-07 19:00:10.534+02	2024-07-07 19:00:10.534+02	59
62	Era Muse Sofware	t	2024-07-07 19:47:21.185+02	2024-07-07 19:47:21.185+02	60
63	Educativa	\N	2024-07-08 15:43:01.727+02	2024-07-08 15:43:01.727+02	13
64	Arcade	t	2024-07-08 16:24:48.363+02	2024-07-08 16:24:48.363+02	61
65	Arcade	t	2024-07-08 16:45:10.723+02	2024-07-08 16:45:10.723+02	62
66	Principal	t	2024-07-09 15:34:07.431+02	2024-07-09 15:34:07.431+02	63
67	Principal	t	2024-07-09 16:59:13.129+02	2024-07-09 16:59:13.129+02	64
9	Arcade - Laberinto	t	2024-05-03 08:27:01.148+02	2024-07-10 16:12:14.892+02	8
68	Arcade - Plataformas	t	2024-07-10 16:12:36.659+02	2024-07-10 16:12:36.659+02	8
69	Principal	t	2024-07-10 16:37:33.682+02	2024-07-10 16:37:33.682+02	65
70	Principal	t	2024-07-10 21:21:05.628+02	2024-07-10 21:21:05.628+02	66
71	Principal	t	2024-07-11 16:16:53.243+02	2024-07-11 16:16:53.243+02	67
72	Principal	t	2024-07-12 09:23:18.894+02	2024-07-12 09:23:18.894+02	68
73	Principal	t	2024-07-12 13:20:38.537+02	2024-07-12 13:20:38.537+02	69
74	Super Mario Bros	t	2024-07-15 12:20:14.484+02	2024-07-15 12:20:14.484+02	14
75	Principal	t	2024-07-15 12:25:56.566+02	2024-07-15 12:25:56.566+02	70
76	Principal	t	2024-07-16 16:55:46.599+02	2024-07-16 16:55:46.599+02	71
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
11	Fantasmas	creatures/ghost.jpeg	2024-05-02 16:34:19.409+02	2024-05-02 16:34:19.409+02	10	\N
12	Espacio	scifi/space.png	2024-05-19 12:39:52.025+02	2024-05-19 12:40:01.956+02	6	\N
13	Insectos	creatures/bugs.jpg	2024-05-23 18:59:25.625+02	2024-05-23 18:59:25.625+02	10	\N
14	Robots	creatures/robot.jpg	2024-06-01 12:50:53.035+02	2024-06-01 12:50:53.035+02	10	\N
15	Distopía	scifi/Dystopia.png	2024-06-01 12:52:53.152+02	2024-06-01 12:52:53.152+02	6	\N
16	Adaptación	adaptation/movie.jpeg	2024-06-02 11:26:27.89+02	2024-06-02 11:26:27.89+02	\N	\N
17	Basado en película	adaptation/movie.jpeg	2024-06-02 11:27:38.483+02	2024-06-02 11:27:38.483+02	16	\N
18	Basado en libro	adaptation/book.jpg	2024-06-09 11:32:30.322+02	2024-06-09 11:32:30.322+02	16	\N
19	Segunda Guerra Mundial	historical/2ww.jpeg	2024-06-20 15:56:02.963+02	2024-06-20 15:56:02.963+02	1	\N
20	Militar	military/war.jpeg	2024-06-22 12:23:22.145+02	2024-06-22 12:23:26.876+02	\N	\N
21	Guerra	military/war.jpeg	2024-06-22 12:23:57.843+02	2024-06-22 12:23:57.843+02	20	\N
22	Hombre Lobo	creatures/werewolf.jpeg	2024-06-22 12:24:27.73+02	2024-06-22 12:24:33.355+02	10	\N
23	Guerra Fría	historical/cold_war.jpeg	2024-06-24 11:54:30.548+02	2024-06-24 11:54:30.548+02	1	\N
24	Basado en cómic	adaptation/comic.jpeg	2024-06-24 13:21:21.543+02	2024-06-24 13:21:21.543+02	16	\N
10	Personajes	creatures/ghost.jpeg	2024-05-02 16:34:06.711+02	2024-07-05 10:41:20.073+02	\N	\N
25	Superheroes	creatures/superheroes.jpeg	2024-07-05 10:46:07.584+02	2024-07-05 10:46:07.584+02	10	\N
26	Espionaje	military/spy.jpg	2024-07-06 19:47:46.367+02	2024-07-06 19:47:46.367+02	20	\N
27	Demonios	creatures/demon.jpg	2024-07-08 16:13:34.678+02	2024-07-08 16:13:47.968+02	10	\N
28	Terrorismo	crime/terrorism.jpeg	2024-07-09 15:52:45.741+02	2024-07-09 15:52:55.507+02	8	\N
29	Fantasía oscura	fantasy/dark.jpeg	2024-07-11 16:27:28.122+02	2024-07-11 16:27:37.157+02	4	\N
\.


--
-- Name: AwardCategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AwardCategories_id_seq"', 14, true);


--
-- Name: Awards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Awards_id_seq"', 6, true);


--
-- Name: Characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Characters_id_seq"', 34, true);


--
-- Name: Companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Companies_id_seq"', 95, true);


--
-- Name: Franchises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Franchises_id_seq"', 71, true);


--
-- Name: Games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Games_id_seq"', 130, true);


--
-- Name: Genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Genres_id_seq"', 67, true);


--
-- Name: People_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."People_id_seq"', 66, true);


--
-- Name: PlatformModels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PlatformModels_id_seq"', 12, true);


--
-- Name: Platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Platforms_id_seq"', 18, true);


--
-- Name: Series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Series_id_seq"', 76, true);


--
-- Name: Themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Themes_id_seq"', 29, true);


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

