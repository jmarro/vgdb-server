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
    id integer NOT NULL,
    "subFranchiseId" integer,
    "parentFranchiseId" integer
);


ALTER TABLE public."Franchise_Franchises" OWNER TO postgres;

--
-- Name: Franchise_Franchises_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Franchise_Franchises_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Franchise_Franchises_id_seq" OWNER TO postgres;

--
-- Name: Franchise_Franchises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Franchise_Franchises_id_seq" OWNED BY public."Franchise_Franchises".id;


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
-- Name: Game_Games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Game_Games" (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "parentGameId" integer,
    "subGameId" integer
);


ALTER TABLE public."Game_Games" OWNER TO postgres;

--
-- Name: Game_Games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Game_Games_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Game_Games_id_seq" OWNER TO postgres;

--
-- Name: Game_Games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Game_Games_id_seq" OWNED BY public."Game_Games".id;


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
    media character varying(255),
    dlc text
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
-- Name: Franchise_Franchises id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Franchise_Franchises" ALTER COLUMN id SET DEFAULT nextval('public."Franchise_Franchises_id_seq"'::regclass);


--
-- Name: Franchises id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Franchises" ALTER COLUMN id SET DEFAULT nextval('public."Franchises_id_seq"'::regclass);


--
-- Name: Game_Games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Games" ALTER COLUMN id SET DEFAULT nextval('public."Game_Games_id_seq"'::regclass);


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
8	Best Original Game of the Year	f	2024-06-07 11:11:43.922+02	2024-06-07 11:11:43.922+02	3
9	Best Adventure Game of the Year	f	2024-06-20 16:45:08.037+02	2024-06-20 16:45:08.037+02	3
10	Game of the Year	f	2024-07-04 16:37:55.141+02	2024-07-04 16:37:55.141+02	6
11	Best Arcade Game	f	2024-07-05 10:37:51.346+02	2024-07-05 10:37:51.346+02	6
12	Most Innovative Game	f	2024-07-06 11:30:36.904+02	2024-07-06 11:30:36.904+02	6
13	Videoconsole Game of the Year	f	2024-07-10 15:19:00.833+02	2024-07-10 15:19:00.833+02	6
14	Computer Game of the Year	f	2024-07-10 15:19:15.438+02	2024-07-10 15:19:15.438+02	6
6	Best Arcade-Style of the Year	f	2024-06-07 11:10:24.078+02	2024-07-24 16:41:42.039+02	3
15	Game of the Year	t	2024-07-24 16:49:48.238+02	2024-07-24 16:49:48.238+02	7
16	Best Computer Game of the Year	f	2024-08-09 10:32:05.865+02	2024-08-09 10:32:05.865+02	3
17	Best Console Game of the Year	f	2024-08-09 10:32:16.305+02	2024-08-09 10:32:16.305+02	3
18	Best Coin-Op Conversion	f	2024-08-09 10:33:44.286+02	2024-08-09 10:33:44.286+02	3
19	Best Soundtrack of the Year	f	2024-08-09 10:34:44.695+02	2024-08-09 10:34:44.695+02	3
20	Best Graphics	f	2024-08-19 14:21:36.332+02	2024-08-19 14:21:36.332+02	3
24	Handheld Game of the Year	f	2024-08-27 17:16:52.607+02	2024-08-27 17:16:52.607+02	7
25	Genesis Game of the Year	f	2024-08-29 17:34:04.253+02	2024-08-29 17:34:04.253+02	5
26	Master System Game of the Year	f	2024-08-29 17:34:11.059+02	2024-08-29 17:34:11.059+02	5
27	Nintendo Game of the Year	f	2024-08-29 17:34:21.428+02	2024-08-29 17:34:21.428+02	5
28	Best Original Computer Game	f	2024-09-20 15:57:35.621+02	2024-09-20 15:57:35.621+02	3
29	Best Licensed Console Game	f	2024-09-20 15:59:01.03+02	2024-09-20 15:59:01.03+02	3
30	Best Licensed Computer Game	f	2024-09-20 15:59:08.56+02	2024-09-20 15:59:08.56+02	3
31	Handheld Game of the Year	f	2024-09-20 16:13:15.465+02	2024-09-20 16:13:15.465+02	3
32	Portable Game of the Year	f	2024-09-21 11:04:05.462+02	2024-09-21 11:04:05.462+02	6
33	Multimedia Game of the Year	f	2024-09-21 11:04:14.997+02	2024-09-21 11:04:14.997+02	6
34	Best Electronic Game Graphics	f	2024-09-21 11:04:57.144+02	2024-09-21 11:04:57.144+02	6
35	Best Action Video Game\t	f	2024-09-21 11:05:21.785+02	2024-09-21 11:05:21.785+02	6
36	Best Action Computer Game	f	2024-09-21 11:05:54.842+02	2024-09-21 11:05:54.842+02	6
37	Best Adventure/RPG Video Game\t	f	2024-09-21 11:06:11.916+02	2024-09-21 11:06:11.916+02	6
38	Best Adventure/RPG Computer Game\t	f	2024-09-21 11:06:22.764+02	2024-09-21 11:06:22.764+02	6
39	Best Strategy Video Game\t	f	2024-09-21 11:06:40.675+02	2024-09-21 11:06:40.675+02	6
40	Best Strategy Computer Game\t	f	2024-09-21 11:06:47.772+02	2024-09-21 11:06:47.772+02	6
41	Best Sports Video Game\t	f	2024-09-21 11:07:18.213+02	2024-09-21 11:07:18.213+02	6
42	Best Sports Computer Game\t	f	2024-09-21 11:07:26.918+02	2024-09-21 11:07:26.918+02	6
43	Most Humorous Electronic Game\t	f	2024-09-21 11:07:54.371+02	2024-09-21 11:07:54.371+02	6
44	Best Science Fiction or Fantasy Electronic Game	f	2024-09-21 11:21:05.731+02	2024-09-21 11:21:05.731+02	6
45	Game of the Year	f	2024-09-25 16:49:40.547+02	2024-09-25 16:49:40.547+02	8
\.


--
-- Data for Name: Awards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Awards" (id, name, is_main, main_img, "createdAt", "updatedAt", wikipedia) FROM stdin;
1	Spike Video Game Awards	t	Spike_VGA.png	2024-02-10 12:19:42.387+01	2024-02-10 12:19:42.387+01	\N
2	The Game Awards	t	game_awards.png	2024-02-10 12:23:16.392+01	2024-02-10 12:23:16.392+01	\N
5	Electronic Gaming Monthly	f	EGM.png	2024-04-22 16:05:50.513+02	2024-04-22 16:05:50.513+02	https://es.wikipedia.org/wiki/Electronic_Gaming_Monthly
6	Arkie Awards	f	Electronic_Games_Logo.png	2024-07-04 16:37:40.146+02	2024-07-04 16:37:40.146+02	https://en.wikipedia.org/wiki/Electronic_Games#Arcade_Awards
7	Famitsu Awards	f	famitsu.png	2024-07-24 16:49:15.426+02	2024-07-24 16:49:15.426+02	https://en.wikipedia.org/wiki/Famitsu_scores#Famitsu_Awards
3	Golden Joystick Awards	t	Golden_Joystick_Award.png	2024-02-10 12:24:15.754+01	2024-08-09 10:34:24.726+02	https://en.wikipedia.org/wiki/Golden_Joystick_Awards
8	Game Informer	f	Game_Informer.png	2024-09-25 16:49:33.064+02	2024-09-25 16:49:33.064+02	https://en.wikipedia.org/wiki/Game_Informer#Game_of_the_Year_winners
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
\N	2024-07-17 20:27:16.821+02	2024-07-17 20:27:16.821+02	27	35
\N	2024-07-17 20:47:56.194+02	2024-07-17 20:47:56.194+02	27	36
\N	2024-07-17 20:50:36.975+02	2024-07-17 20:50:36.975+02	27	37
\N	2024-07-18 17:09:09.564+02	2024-07-18 17:09:09.564+02	68	38
\N	2024-07-18 17:10:10.683+02	2024-07-18 17:10:10.683+02	68	39
\N	2024-07-21 11:54:14.974+02	2024-07-21 11:54:14.974+02	71	40
\N	2024-07-21 11:55:10.779+02	2024-07-21 11:55:10.779+02	71	41
\N	2024-07-21 13:04:42.585+02	2024-07-21 13:04:42.585+02	74	42
\N	2024-07-21 13:07:11.966+02	2024-07-21 13:07:11.966+02	74	43
\N	2024-07-21 13:11:05.235+02	2024-07-21 13:11:05.235+02	73	44
\N	2024-07-23 16:12:13.567+02	2024-07-23 16:12:13.567+02	77	48
\N	2024-07-23 16:39:01.766+02	2024-07-23 16:39:01.766+02	32	49
\N	2024-07-28 12:06:21.397+02	2024-07-28 12:06:21.397+02	82	58
\N	2024-07-28 12:34:33.348+02	2024-07-28 12:34:33.348+02	83	59
\N	2024-07-28 12:45:03.136+02	2024-07-28 12:45:03.136+02	83	60
\N	2024-07-28 23:00:03.654+02	2024-07-28 23:00:03.654+02	63	61
\N	2024-07-28 23:11:08.313+02	2024-07-28 23:11:08.313+02	63	62
\N	2024-07-28 23:16:01.505+02	2024-07-28 23:16:01.505+02	63	63
\N	2024-07-30 15:31:07.374+02	2024-07-30 15:31:07.374+02	58	64
\N	2024-07-31 16:13:35.448+02	2024-07-31 16:13:35.448+02	86	65
\N	2024-07-31 16:18:11.724+02	2024-07-31 16:18:11.724+02	87	66
\N	2024-08-02 12:33:58.858+02	2024-08-02 12:33:58.858+02	62	68
\N	2024-08-03 13:34:45.513+02	2024-08-03 13:34:45.513+02	46	69
\N	2024-08-06 16:34:48.17+02	2024-08-06 16:34:48.17+02	92	79
\N	2024-08-11 12:29:20.791+02	2024-08-11 12:29:20.791+02	94	92
\N	2024-08-23 16:09:49.417+02	2024-08-23 16:09:49.417+02	100	102
\N	2024-08-24 13:28:45.079+02	2024-08-24 13:28:45.079+02	84	103
\N	2024-08-24 13:31:38.152+02	2024-08-24 13:31:38.152+02	84	104
\N	2024-08-24 13:34:35.686+02	2024-08-24 13:34:35.686+02	84	105
\N	2024-08-25 10:38:59.046+02	2024-08-25 10:38:59.046+02	102	106
\N	2024-08-25 11:45:36.755+02	2024-08-25 11:45:36.755+02	103	107
\N	2024-08-30 12:33:11.005+02	2024-08-30 12:33:11.005+02	107	111
\N	2024-08-30 12:44:09.323+02	2024-08-30 12:44:09.323+02	107	112
\N	2024-08-30 12:48:07.38+02	2024-08-30 12:48:07.38+02	107	113
\N	2024-08-30 13:04:06.351+02	2024-08-30 13:04:06.351+02	108	114
\N	2024-08-30 13:07:14.014+02	2024-08-30 13:07:14.014+02	107	115
\N	2024-08-30 13:09:55.407+02	2024-08-30 13:09:55.407+02	107	116
\N	2024-08-30 13:18:46.305+02	2024-08-30 13:18:46.305+02	107	118
\N	2024-08-30 13:22:46.082+02	2024-08-30 13:22:46.082+02	56	119
\N	2024-09-02 15:43:09.738+02	2024-09-02 15:43:09.738+02	63	120
\N	2024-09-02 15:48:10.574+02	2024-09-02 15:48:10.574+02	63	121
\N	2024-09-02 15:56:00.045+02	2024-09-02 15:56:00.045+02	63	123
\N	2024-09-08 10:54:37.927+02	2024-09-08 10:54:37.927+02	75	143
\N	2024-09-08 10:55:14.218+02	2024-09-08 10:55:14.218+02	75	144
\N	2024-09-12 16:34:13.632+02	2024-09-12 16:34:13.632+02	117	146
\N	2024-09-12 16:37:57.481+02	2024-09-12 16:37:57.481+02	117	147
\N	2024-09-13 10:11:55.013+02	2024-09-13 10:11:55.013+02	118	148
\N	2024-09-13 13:29:51.65+02	2024-09-13 13:29:51.65+02	120	149
\N	2024-09-15 12:05:48.528+02	2024-09-15 12:05:48.528+02	124	154
\N	2024-09-15 12:05:48.528+02	2024-09-15 12:05:48.528+02	125	154
\N	2024-09-15 12:10:05.505+02	2024-09-15 12:10:05.505+02	125	155
\N	2024-09-15 12:10:05.505+02	2024-09-15 12:10:05.505+02	124	155
\N	2024-09-15 12:13:33.153+02	2024-09-15 12:13:33.153+02	125	156
\N	2024-09-15 12:18:05.499+02	2024-09-15 12:18:05.499+02	124	157
\N	2024-09-15 12:18:05.499+02	2024-09-15 12:18:05.499+02	125	157
\N	2024-09-15 12:21:54.604+02	2024-09-15 12:21:54.604+02	124	158
\N	2024-09-15 12:21:54.604+02	2024-09-15 12:21:54.604+02	125	158
\N	2024-09-15 12:24:57.974+02	2024-09-15 12:24:57.974+02	124	159
\N	2024-09-15 12:24:57.974+02	2024-09-15 12:24:57.974+02	125	159
\N	2024-09-15 12:29:48.534+02	2024-09-15 12:29:48.534+02	124	160
\N	2024-09-15 12:29:48.534+02	2024-09-15 12:29:48.534+02	125	160
\N	2024-09-15 12:32:43.777+02	2024-09-15 12:32:43.777+02	124	161
\N	2024-09-15 12:32:43.777+02	2024-09-15 12:32:43.777+02	125	161
\N	2024-09-15 12:39:45.673+02	2024-09-15 12:39:45.673+02	124	162
\N	2024-09-15 12:39:45.673+02	2024-09-15 12:39:45.673+02	125	162
\N	2024-09-15 12:42:47.802+02	2024-09-15 12:42:47.802+02	124	163
\N	2024-09-15 12:42:47.802+02	2024-09-15 12:42:47.802+02	125	163
\N	2024-09-16 15:24:00.366+02	2024-09-16 15:24:00.366+02	74	164
\N	2024-09-17 16:12:47.5+02	2024-09-17 16:12:47.5+02	128	165
\N	2024-09-18 16:15:10.831+02	2024-09-18 16:15:10.831+02	129	166
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
38	Boy	\N	Wonder Boy	Tom-Tom	wonder_boy/Boy.jpeg	\N	MAIN	\N	2024-07-18 17:08:35.738+02	2024-07-18 17:09:16.891+02	74	1986	\N	\N
26	Lex Luthor	Alexander Joseph "Lex" Luthor	\N	\N	superman/Lex_Luthor.png	\N	ANTAGONIST	\N	2024-07-05 11:07:53.057+02	2024-07-05 11:08:22.136+02	46	1979	https://es.wikipedia.org/wiki/Lex_Luthor	\N
27	Dig Dug	Taizo Hori	Dig Dug	\N	dig_dug/taizo.jpeg	\N	MAIN	\N	2024-07-06 12:09:51.043+02	2024-07-06 12:10:10.811+02	49	1982	\N	\N
28	Mr. Do	\N	\N	\N	mr_do/Mr-do.jpeg	\N	MAIN	\N	2024-07-06 12:55:17.095+02	2024-07-06 12:55:24.029+02	51	1982	\N	\N
33	Peach	\N	Princesa Peach	Princesa Toadstool	mario/peach.png	#f6b1d0	SECONDARY	\N	2024-07-15 12:58:07.294+02	2024-07-15 12:59:14.896+02	14	1985	https://es.wikipedia.org/wiki/Princesa_Peach	f
29	Bomberman	\N	\N	\N	bomberman/Bomberman.png	\N	MAIN	\N	2024-07-07 19:07:07.903+02	2024-07-07 19:08:12.825+02	59	1983	\N	f
34	Toad	Toad Toadstool	\N	\N	mario/toad.png	\N	SECONDARY	\N	2024-07-16 16:19:55.579+02	2024-07-16 16:20:04.717+02	14	1985	https://es.wikipedia.org/wiki/Toad_(Nintendo)	\N
30	Sir Arthur	\N	\N	\N	ghosts_n_goblins/sir_arthur.jpeg	\N	MAIN	\N	2024-07-11 16:16:10.793+02	2024-07-11 16:18:56.607+02	67	1985	\N	f
31	Prin Prin		Princesa Prin Prin	Guinevere	ghosts_n_goblins/prin_prin.jpeg	\N	SECONDARY	\N	2024-07-11 16:19:58.894+02	2024-07-11 16:21:28.08+02	67	1985	\N	\N
39	Tanya	\N	\N	Tina	wonder_boy/Tanya.jpeg	\N	SECONDARY	\N	2024-07-18 17:10:05.263+02	2024-07-18 17:10:20.167+02	74	1986	\N	\N
35	Link	\N	\N	\N	the_legend_of_zelda/link.jpg	#026012	MAIN	\N	2024-07-17 20:06:47.422+02	2024-07-17 20:26:28.493+02	73	1986	https://es.wikipedia.org/wiki/Link_(personaje)	t
40	Bob	\N	\N	\N	bubble_bobble/Bob.jpg	\N	MAIN	\N	2024-07-21 11:54:08.575+02	2024-07-21 11:54:21.508+02	77	1986	\N	\N
36	Zelda	Princesa Zelda	\N	\N	the_legend_of_zelda/zelda.png	#026012	SECONDARY	\N	2024-07-17 20:47:18.977+02	2024-07-17 20:47:49.578+02	73	1986	https://es.wikipedia.org/wiki/Princesa_Zelda	f
37	Ganon	\N	\N	Ganondorf	the_legend_of_zelda/ganon.jpg	\N	ANTAGONIST	\N	2024-07-17 20:50:09.972+02	2024-07-17 20:50:25.123+02	73	1986	https://es.wikipedia.org/wiki/Ganondorf	\N
41	Bub	\N	\N	\N	bubble_bobble/Bub.jpg	\N	MAIN	\N	2024-07-21 11:54:56.073+02	2024-07-21 11:55:03.296+02	77	1986	\N	\N
44	Mother Brain	\N	\N	\N	metroid/Mother-brain.jpg	\N	ANTAGONIST	\N	2024-07-21 13:10:31.124+02	2024-07-21 13:11:13.371+02	78	1986	https://es.wikipedia.org/wiki/Mother_Brain	\N
42	Samus Aran	\N	\N	\N	metroid/Samus.jpg	#bf191e	MAIN	\N	2024-07-21 13:03:59.683+02	2024-07-21 13:04:35.598+02	78	1986	https://es.wikipedia.org/wiki/Samus_Aran	t
43	Ridley	\N	Geoforma 187	\N	metroid/Ridley.jpg	\N	ANTAGONIST	\N	2024-07-21 13:07:06.157+02	2024-07-21 13:07:18.576+02	78	1986	https://es.wikipedia.org/wiki/Ridley_(Metroid)	\N
45	Master Higgins	\N	\N	Takahashi Meijin (jp)	adventure_islands/master_higgins.png	\N	MAIN	\N	2024-07-22 15:57:20.151+02	2024-07-22 15:57:27.51+02	81	1986	\N	\N
47	Drácula	Dracula Vlad Țepeș	\N	\N	castlevania/dracula.jpg	\N	ANTAGONIST	\N	2024-07-22 16:50:28.464+02	2024-07-22 16:50:36.249+02	82	1986	https://es.wikipedia.org/wiki/Dr%C3%A1cula_(Castlevania)	\N
46	Simon Belmont	\N	\N	\N	castlevania/simon_belmont.jpg	\N	MAIN	\N	2024-07-22 16:43:27.484+02	2024-07-22 16:47:42.702+02	82	1986	https://es.wikipedia.org/wiki/Simon_Belmont	f
48	Alex Kidd	\N	\N	\N	alex_kidd/AlexKidd.jpg	\N	MAIN	\N	2024-07-23 16:12:05.99+02	2024-07-23 16:12:19.621+02	83	1986	https://es.wikipedia.org/wiki/Alex_Kidd	\N
49	Pit	\N	\N	\N	kid_icarus/Pit.jpg	\N	MAIN	\N	2024-07-23 16:38:56.021+02	2024-07-23 16:39:10.359+02	84	1986	https://es.wikipedia.org/wiki/Pit_(Kid_Icarus)	\N
50	Son Goku	\N	\N	Kakarotto	dragon_ball/son_goku.jpg	\N	MAIN	\N	2024-07-25 17:34:55.175+02	2024-07-25 17:35:07.903+02	86	1986	https://es.wikipedia.org/wiki/Son_Gok%C5%AB	\N
51	Pilaf	\N	\N	\N	dragon_ball/Pilaf.jpg	\N	VILLAIN	\N	2024-07-25 17:36:51.72+02	2024-07-25 17:36:59.356+02	86	1986	https://es.wikipedia.org/wiki/Pilaf_(personaje_de_Dragon_Ball)	\N
52	Batman	Bruce Wayne	El caballero oscuro	\N	batman/batman.jpg	#505c7c	MAIN	\N	2024-07-26 09:30:51.68+02	2024-07-26 09:31:53.357+02	87	1986	https://es.wikipedia.org/wiki/Batman	\N
53	Robin	\N	\N	\N	batman/robin.jpg	\N	SECONDARY	\N	2024-07-26 09:34:34.898+02	2024-07-26 09:34:42.972+02	87	\N	https://es.wikipedia.org/wiki/Robin_(DC_Comics)	\N
54	Billy Lee	\N	Hammer	\N	double_dragon/Billy_Lee.jpg	\N	MAIN	\N	2024-07-27 13:32:15.582+02	2024-07-27 13:32:26.294+02	89	1987	\N	\N
55	Jimmy Lee	\N	Spike	\N	double_dragon/Jimmy_Lee.jpg	\N	MAIN	\N	2024-07-27 13:32:58.666+02	2024-07-27 13:33:08.665+02	89	1987	\N	\N
56	Marian	\N	\N	\N	double_dragon/Marian.jpg	\N	SECONDARY	\N	2024-07-27 13:33:47.226+02	2024-07-27 13:33:55.625+02	89	1987	\N	\N
57	Adol Christin	\N	Adol the Red	Aron Christian (Ys I Sega Master System)	ys/Adol_Christin.jpg	\N	MAIN	\N	2024-07-27 14:13:53.723+02	2024-07-27 14:14:01.631+02	90	1987	\N	\N
58	Larry Laffer	\N	\N	\N	leisure_suit_larry/larry.jpg	\N	MAIN	\N	2024-07-28 12:06:08.115+02	2024-07-28 12:06:16.059+02	92	1987	https://es.wikipedia.org/wiki/Larry_Laffer	\N
59	Solid Snake	\N	\N	\N	metal_gear/Solid-Snake.jpg	#505050	MAIN	\N	2024-07-28 12:34:27.442+02	2024-07-28 12:34:39.954+02	93	1987	https://es.wikipedia.org/wiki/Solid_Snake	t
60	Big Boss	\N	Naked Snake	\N	metal_gear/big_boss.jpg	\N	MAIN	\N	2024-07-28 12:44:50.939+02	2024-07-28 12:45:10.551+02	93	1987	https://es.wikipedia.org/wiki/Big_Boss	f
61	Ryu	\N	\N	\N	street_fighter/ryu.jpg	\N	MAIN	\N	2024-07-28 22:59:56.3+02	2024-07-28 23:00:22.164+02	95	1987	https://es.wikipedia.org/wiki/Ryu_(Street_Fighter)	f
81	Daisy	\N	Princesa Daisy	\N	mario/daisy.png	\N	SECONDARY	\N	2024-08-09 13:50:38.293+02	2024-08-09 13:51:45.198+02	14	1989	https://es.wikipedia.org/wiki/Princesa_Daisy	\N
62	Ken	Ken Masters	\N	\N	street_fighter/ken.jpg		MAIN	\N	2024-07-28 23:10:12.551+02	2024-07-28 23:11:16.323+02	95	1987	https://es.wikipedia.org/wiki/Ken_Masters	f
63	Sagat	\N	\N	\N	street_fighter/Sagat.jpg	\N	VILLAIN	\N	2024-07-28 23:15:45.701+02	2024-07-28 23:15:55.132+02	95	1987	https://es.wikipedia.org/wiki/Sagat	\N
64	Little Mac	\N	\N	\N	punch_out/little_mac.jpg	\N	MAIN	\N	2024-07-30 15:30:55.186+02	2024-07-30 15:31:01.571+02	57	1987	https://en.wikipedia.org/wiki/Little_Mac	\N
65	Mega Man	\N	Blue Bomber	Rockman (jp)	mega_man/megaman.jpeg	#0400f8	MAIN	\N	2024-07-31 16:13:24.492+02	2024-07-31 16:13:59.236+02	98	1987	https://es.wikipedia.org/wiki/Mega_Man_(personaje)	t
66	Dr. Wily	Dr. Albert W. Wily	\N	\N	mega_man/drWily.jpg	\N	ANTAGONIST	\N	2024-07-31 16:17:40.152+02	2024-07-31 16:18:19.088+02	98	1987	https://es.wikipedia.org/wiki/Dr._Albert_W._Wily	\N
67	Joe Musashi	\N	\N	\N	shinobi/Joe_Musashi.jpg	\N	MAIN	\N	2024-08-02 11:53:32.278+02	2024-08-02 11:53:39.239+02	104	1987	\N	\N
68	Kunio	\N	\N	\N	kunio-kun/Kunio.jpg	\N	MAIN	\N	2024-08-02 12:33:52.945+02	2024-08-02 12:34:04.349+02	106	1986	\N	\N
69	Rad Spencer	Nathan Spencer	Rad	Ladd (NES)	bionic_commando/RadSpencer.jpg	\N	MAIN	\N	2024-08-03 13:34:31.969+02	2024-08-03 13:34:39.837+02	110	1988	\N	\N
70	Wart	\N	Rey Wart	\N	mario/King_Wart.png	\N	VILLAIN	\N	2024-08-04 13:20:31.017+02	2024-08-04 13:20:40.21+02	14	1988	\N	\N
71	Larry Koopa	\N	\N	\N	mario/Larry_Koopa.jpg	\N	VILLAIN	\N	2024-08-04 20:36:03.723+02	2024-08-04 20:36:11.744+02	14	1988	\N	\N
72	Morton Koopa Jr.	\N	\N	\N	mario/morton.jpg	\N	VILLAIN	\N	2024-08-04 20:39:22.122+02	2024-08-04 20:39:29.504+02	14	1988	\N	\N
73	Wendy O. Koopa	\N	\N	\N	mario/Wendy_O_Koopa.jpg	\N	VILLAIN	\N	2024-08-04 20:41:56.261+02	2024-08-04 20:42:04.031+02	14	1988	\N	\N
74	Iggy Koopa\t	\N	\N	\N	mario/iggy_koopa.jpg	\N	VILLAIN	\N	2024-08-04 20:44:14.652+02	2024-08-04 20:44:21.442+02	14	1988	\N	\N
75	Roy Koopa	\N	\N	\N	mario/Roy_Koopa.jpg	\N	VILLAIN	\N	2024-08-04 20:46:25.538+02	2024-08-04 20:46:32.761+02	14	1988	\N	\N
76	Lemmy Koopa	\N	\N	\N	mario/Lemmy.jpg	\N	VILLAIN	\N	2024-08-04 20:48:37.974+02	2024-08-04 20:48:46.202+02	14	1988	\N	\N
77	Ludwig von Koopa	\N	\N	\N	mario/Ludwig.jpg	\N	VILLAIN	\N	2024-08-04 20:51:52.852+02	2024-08-04 20:51:59.157+02	14	1988	\N	\N
78	Rick Taylor	\N	\N	\N	splatterhouse/rick_taylor.jpg	\N	MAIN	\N	2024-08-05 16:21:16.795+02	2024-08-05 16:21:23.908+02	111	1988	\N	\N
79	Ryu Hayabusa	\N	\N	\N	ninja_gaiden/Ryu_Hayabusa.jpg	\N	MAIN	\N	2024-08-06 16:34:40.274+02	2024-08-06 16:34:54.298+02	113	1988	https://es.wikipedia.org/wiki/Ryu_Hayabusa	\N
80	RoboCop	Alex James Murphy	\N	\N	roboCop/RoboCop.jpg	\N	MAIN	\N	2024-08-07 16:19:24.712+02	2024-08-07 16:19:32.492+02	114	1988	https://es.wikipedia.org/wiki/RoboCop_(personaje)	\N
82	Tatanga	\N	\N	\N	mario/Tatanga.jpg	\N	VILLAIN	\N	2024-08-09 13:54:38.626+02	2024-08-09 13:54:45.18+02	14	1989	\N	\N
83	Gilius Thunderhead	\N	\N	\N	golden_axe/gilius_thunderhead.jpg	\N	MAIN	\N	2024-08-10 11:20:15.892+02	2024-08-10 11:20:25.142+02	118	1989	https://es.wikipedia.org/wiki/Gilius_Thunderhead	\N
84	Ax Battler	\N	\N	Tarik	golden_axe/AxBattle.jpg	\N	MAIN	\N	2024-08-10 11:23:07.177+02	2024-08-10 11:23:18.358+02	118	1989	https://es.wikipedia.org/wiki/Ax_Battler	\N
85	Tyris Flare	\N	\N	\N	golden_axe/TyrisFlare.jpg	\N	MAIN	\N	2024-08-10 11:29:46.88+02	2024-08-10 11:29:55.948+02	118	1989	\N	\N
86	Death Adder	\N	\N	\N	golden_axe/DeathAdder.jpg	\N	ANTAGONIST	\N	2024-08-10 11:35:24.715+02	2024-08-10 11:35:39.955+02	118	1989	\N	\N
87	Leonardo	\N	\N	\N	teenage_mutant_ninja_turtles/leonardo.jpg	#3d85c6	MAIN	\N	2024-08-10 12:14:24.142+02	2024-08-10 12:14:33.008+02	119	1989	https://es.wikipedia.org/wiki/Leonardo_(Tortugas_ninja)	\N
88	Raphael	\N	\N	\N	teenage_mutant_ninja_turtles/raphael.jpg	#cc0000	MAIN	\N	2024-08-10 12:17:08.198+02	2024-08-10 12:17:21.379+02	119	1989	https://es.wikipedia.org/wiki/Raphael_(Tortugas_ninja)	\N
89	Michelangelo	\N	\N	\N	teenage_mutant_ninja_turtles/michelangelo.jpg	#ce7e00	MAIN	\N	2024-08-10 12:19:39.318+02	2024-08-10 12:19:48.713+02	119	1989	https://es.wikipedia.org/wiki/Michelangelo_(Tortugas_ninja)	\N
90	Donatello	\N	\N	\N	teenage_mutant_ninja_turtles/Donatello.jpg	#6a329f	MAIN	\N	2024-08-10 12:22:22.111+02	2024-08-10 12:22:31.163+02	119	1989	https://es.wikipedia.org/wiki/Donatello_(Tortugas_ninja)	\N
92	Ninten	\N	\N	\N	mother/Ninten.jpg	\N	MAIN	\N	2024-08-11 12:29:07.319+02	2024-08-11 12:29:14.372+02	122	1989	\N	\N
91	Shredder	Oroku Saki		\N	teenage_mutant_ninja_turtles/Shredder.jpg	\N	ANTAGONIST	\N	2024-08-10 12:27:38.25+02	2024-08-10 12:27:57.614+02	119	1989	https://es.wikipedia.org/wiki/Shredder	\N
93	Scrooge McDuck	\N	\N	Tío Gilito	ducktales/Scrooge_McDuck.jpg	\N	MAIN	\N	2024-08-11 13:12:36.902+02	2024-08-11 13:12:43.864+02	123	1989	https://es.wikipedia.org/wiki/Scrooge_McDuck	\N
94	Bonk	\N	PC Kid	PC Genjin (JP)	bonk/Bonk.jpg	\N	MAIN	\N	2024-08-12 17:05:50.882+02	2024-08-12 17:06:02.906+02	126	1989	\N	\N
95	Alucard	Adrian Fahrenheit Țepeș	\N	\N	castlevania/Alucard.jpg	\N	MAIN	\N	2024-08-13 16:11:57.549+02	2024-08-13 16:12:09.954+02	82	1989	https://es.wikipedia.org/wiki/Alucard_(Castlevania)	f
96	Trevor Belmont	Trevor C. Belmont	\N	\N	castlevania/trevor-belmont.jpg	\N	MAIN	\N	2024-08-13 16:18:54.197+02	2024-08-13 16:19:01.046+02	82	1989	\N	\N
97	Guy	\N	\N	\N	final_fight/guy.png	\N	MAIN	\N	2024-08-14 16:47:37.646+02	2024-08-14 16:47:50.81+02	128	1989	https://es.wikipedia.org/wiki/Guy_(Final_Fight)	\N
98	Cody	Cody Travers	\N	\N	final_fight/cody.jpg	\N	MAIN	\N	2024-08-14 16:51:38.368+02	2024-08-14 16:51:48.229+02	128	1989	https://es.wikipedia.org/wiki/Cody_Travers	\N
99	Mike Haggar	\N		\N	final_fight/haggar.jpg	\N	MAIN	\N	2024-08-14 16:57:46.794+02	2024-08-14 16:57:55.72+02	128	1989	https://es.wikipedia.org/wiki/Mike_Haggar	\N
100	Strider Hiryu	\N	\N	\N	strider_hiryu/Strider_Hiryu.jpg	\N	MAIN	\N	2024-08-18 13:23:29.235+02	2024-08-18 13:23:36.367+02	129	1989	\N	\N
101	Indiana Jones	Henry Walton Jones, Jr.	\N	\N	indiana_jones/indiana_ jones.jpg	\N	MAIN	\N	2024-08-19 14:09:20.354+02	2024-08-19 14:09:27.209+02	131	1982	https://es.wikipedia.org/wiki/Indiana_Jones_(personaje)	\N
102	Marth	\N	\N	\N	fire_emblem/Marth.jpg	\N	MAIN	\N	2024-08-23 16:09:38.236+02	2024-08-23 16:09:55.367+02	136	1990	https://es.wikipedia.org/wiki/Marth_(Fire_Emblem)	\N
103	Guybrush Threepwood	\N	\N	\N	monkey_island/Guybrush_Threepwood.jpg	\N	MAIN	\N	2024-08-24 13:28:26.457+02	2024-08-24 13:28:35.243+02	139	1990	https://es.wikipedia.org/wiki/Guybrush_Threepwood	t
104	Elaine Marley	\N	\N	\N	monkey_island/Elaine_Marley.jpg	\N	SECONDARY	\N	2024-08-24 13:31:23.761+02	2024-08-24 13:31:32.588+02	139	1990	https://es.wikipedia.org/wiki/Elaine_Marley	\N
105	LeChuck	\N	Pirata Fantasma	\N	monkey_island/LeChuck.jpeg	\N	ANTAGONIST	\N	2024-08-24 13:34:20.795+02	2024-08-24 13:34:30.781+02	139	1990	https://es.wikipedia.org/wiki/LeChuck	\N
106	Yoshi	Yoshisaur T. Munchakoopas	\N	\N	mario/Yoshi.jpg	#6fd251	SECONDARY	\N	2024-08-25 10:38:45.389+02	2024-08-25 10:39:23.741+02	14	1990	https://es.wikipedia.org/wiki/Yoshi	f
107	Captain Falcon	Captain Douglas Jay Falcon	\N	\N	f-zero/Captain_Falcon.jpg	\N	MAIN	\N	2024-08-25 11:43:33.493+02	2024-08-25 11:45:44.365+02	140	1990	https://es.wikipedia.org/wiki/Captain_Falcon	\N
108	Joker	\N	\N	\N	batman/Joker.jpg	\N	ANTAGONIST	\N	2024-08-27 17:06:55.07+02	2024-08-27 17:07:02.569+02	87	1988	https://es.wikipedia.org/wiki/Joker_(personaje)	\N
109	Mickey Mouse	\N	\N	\N	mickey_mouse_&_friends/Mickey_Mouse.jpg	#f20505	MAIN	\N	2024-08-28 16:21:59.502+02	2024-08-28 16:22:06.807+02	142	1981	https://es.wikipedia.org/wiki/Mickey_Mouse	\N
130	Homer Simpson	Homer Jay Simpson	\N	\N	the_simpsons/homer_simpson.jpg	\N	MAIN	\N	2024-09-06 12:45:15.614+02	2024-09-06 12:45:25.648+02	161	1991	https://es.wikipedia.org/wiki/Homer_Simpson	\N
110	Minnie Mouse	Minerva Mouse	\N	\N	mickey_mouse_&_friends/minnie_mouse.jpg	#f20505	SECONDARY	\N	2024-08-28 16:24:53.255+02	2024-08-28 16:25:17.363+02	142	1981	https://es.wikipedia.org/wiki/Minnie_Mouse	\N
111	E. Honda	Edmond Honda	\N	\N	street_fighter/E_Honda.jpg	\N	SECONDARY	\N	2024-08-30 12:31:20.74+02	2024-08-30 12:33:38.062+02	95	1991	https://en.wikipedia.org/wiki/E._Honda	\N
112	Blanka	Jimmy	\N	\N	street_fighter/Blanka.jpg	\N	SECONDARY	\N	2024-08-30 12:43:05.568+02	2024-08-30 12:44:17.419+02	95	1991	https://es.wikipedia.org/wiki/Blanka	\N
113	Guile	William F. Guile	\N	\N	street_fighter/Guile.jpg	\N	SECONDARY	\N	2024-08-30 12:48:01.428+02	2024-08-30 12:48:15.672+02	95	1991	https://es.wikipedia.org/wiki/Guile_(Street_Fighter)	\N
114	Chun-Li	\N	\N	\N	street_fighter/Chun-Li.jpg	\N	SECONDARY	\N	2024-08-30 13:03:57.462+02	2024-08-30 13:04:13.855+02	95	1991	https://es.wikipedia.org/wiki/Chun-Li	\N
115	Zangief	\N	\N	\N	street_fighter/zangief.jpg	\N	SECONDARY	\N	2024-08-30 13:07:09.116+02	2024-08-30 13:07:21.854+02	95	1991	https://es.wikipedia.org/wiki/Zangief	\N
116	Dhalsim	\N	\N	\N	street_fighter/Dhalsim.jpg	\N	SECONDARY	\N	2024-08-30 13:09:50.548+02	2024-08-30 13:10:02.452+02	95	1991	https://es.wikipedia.org/wiki/Dhalsim	\N
117	Balrog	\N	\N	M. Bison (jp)	street_fighter/Balrog.jpg	\N	VILLAIN	\N	2024-08-30 13:13:32.351+02	2024-08-30 13:13:42.091+02	95	1991	https://es.wikipedia.org/wiki/Balrog_(Street_Fighter)	\N
118	Vega	\N	\N	Balrog (jp)	street_fighter/Vega.jpg	\N	VILLAIN	\N	2024-08-30 13:18:30.114+02	2024-08-30 13:18:41.377+02	95	1991	https://es.wikipedia.org/wiki/Vega_(Street_Fighter)	\N
119	M. Bison	\N	\N	Vega (jp)	street_fighter/m-bison.jpg	\N	ANTAGONIST	\N	2024-08-30 13:22:22.809+02	2024-08-30 13:22:30.3+02	95	1991	https://es.wikipedia.org/wiki/M._Bison	\N
120	Terry Bogard	\N	\N	\N	fatal_fury/terry-bogard.jpg	\N	MAIN	\N	2024-09-02 15:42:57.328+02	2024-09-02 15:43:15.646+02	152	1991	https://es.wikipedia.org/wiki/Terry_Bogard	f
121	Andy Bogard	\N	\N	\N	fatal_fury/Andy_Bogard.jpg	\N	MAIN	\N	2024-09-02 15:48:03.459+02	2024-09-02 15:48:37.957+02	152	1991	https://es.wikipedia.org/wiki/Andy_Bogard	\N
122	Joe Higashi	\N	\N	\N	fatal_fury/JoeHigashi.jpg	\N	MAIN	\N	2024-09-02 15:52:27.269+02	2024-09-02 15:52:40.894+02	152	1991	https://en.wikipedia.org/wiki/Characters_of_the_Fatal_Fury_series#Joe_Higashi	\N
123	Geese Howard	\N	\N	\N	fatal_fury/Geese_howard.jpg	\N	ANTAGONIST	\N	2024-09-02 15:55:43.882+02	2024-09-02 15:55:51.85+02	152	1991	https://es.wikipedia.org/wiki/Geese_Howard	\N
124	Christopher Belmont	\N	\N	\N	castlevania/Christopher_Belmont.jpg	\N	SECONDARY	\N	2024-09-02 17:25:36.413+02	2024-09-02 17:25:45.355+02	82	1989	\N	\N
125	Rash	\N	\N	\N	battletoads/Rash.jpg	\N	MAIN	\N	2024-09-04 16:57:48.238+02	2024-09-04 16:57:56.867+02	155	1991	\N	\N
126	Zitz	\N	\N	\N	battletoads/Zitz.jpg	\N	MAIN	\N	2024-09-04 16:58:29.983+02	2024-09-04 16:58:36.893+02	155	1991	\N	\N
127	Pimple	\N	\N	\N	battletoads/Pimple.jpg	\N	MAIN	\N	2024-09-04 17:00:26.079+02	2024-09-04 17:00:33.122+02	155	1991	\N	\N
128	Dark Queen	Evelyn Volkmire	\N	\N	battletoads/DarkQueen.jpg	\N	ANTAGONIST	\N	2024-09-04 17:07:26.989+02	2024-09-04 17:07:36.052+02	155	1991	\N	\N
131	Bart Simpson	Bartholomew J. Simpson	\N	\N	the_simpsons/Bart_SImpson.jpg	\N	MAIN	\N	2024-09-06 12:48:26.729+02	2024-09-06 12:48:35.4+02	161	1991	https://es.wikipedia.org/wiki/Bart_Simpson	\N
129	Duke Nukem	\N	\N	\N	duke_nukem/duke-nukem.jpg	\N	MAIN	\N	2024-09-05 17:06:04.564+02	2024-09-05 17:06:14.165+02	156	1991	https://en.wikipedia.org/wiki/Duke_Nukem_(character)	f
132	Lisa Simpson	Lisa Marie Simpson	\N	\N	the_simpsons/Lisa_Simpson.jpg	\N	MAIN	\N	2024-09-06 12:51:39.188+02	2024-09-06 12:51:47.009+02	161	1991	https://es.wikipedia.org/wiki/Lisa_Simpson	\N
133	Marge Simpson	Marjorie Jacqueline Simpson	\N	\N	the_simpsons/MargeSimpson.jpg	\N	MAIN	\N	2024-09-06 12:54:01.306+02	2024-09-06 12:54:10.464+02	161	1991	https://es.wikipedia.org/wiki/Marge_Simpson	\N
134	Maggie Simpson	Margaret Lenny Simpson	\N	\N	the_simpsons/Maggie_Simpson.jpg	\N	MAIN	\N	2024-09-06 12:57:03.871+02	2024-09-06 12:57:12+02	161	1991	https://es.wikipedia.org/wiki/Maggie_Simpson	\N
135	Montgomery Burns	Charles Montgomery Burns	\N	\N	the_simpsons/Montgomery_Burns.jpg	\N	SECONDARY	\N	2024-09-06 12:59:23.775+02	2024-09-06 12:59:34.999+02	161	1991	https://es.wikipedia.org/wiki/Montgomery_Burns	\N
136	Spider-Man	Peter Benjamin Parker	Spidey	\N	spider-man/spiderman.png	#ac0202	MAIN	\N	2024-09-06 13:25:54.087+02	2024-09-06 13:26:05.032+02	162	1982	https://es.wikipedia.org/wiki/Spider-Man	\N
137	Duende Verde	\N	\N	Green Goblin	spider-man/green_goblin.jpg	\N	ANTAGONIST	\N	2024-09-06 13:31:46.576+02	2024-09-06 13:31:53.832+02	162	1982	https://es.wikipedia.org/wiki/Duende_Verde	\N
138	Goemon	\N	\N	\N	ganbare_goemon/Goemon.jpg	\N	MAIN	\N	2024-09-06 16:45:46.956+02	2024-09-06 16:45:54.166+02	164	1986	\N	\N
139	Donald	Donald Duck	\N	Pato Donald (es)	mickey_mouse_&_friends/Donald-duck.jpg	\N	MAIN	\N	2024-09-07 13:08:30.684+02	2024-09-07 13:09:28.211+02	142	1984	https://es.wikipedia.org/wiki/Pato_Donald	\N
141	Pete	\N	Bad Pete	\N	mickey_mouse_&_friends/Pete.jpg	\N	ANTAGONIST	\N	2024-09-07 13:38:23.877+02	2024-09-07 13:38:30.661+02	142	1987	Bad Pete	\N
142	James Pond	\N	\N	\N	james_pond/james_pond.jpg	\N	MAIN	\N	2024-09-08 09:25:55.852+02	2024-09-08 09:26:01.49+02	166	1990	\N	\N
143	ToeJam	\N	\N	\N	toejam_&_earl/toejam.jpg	\N	MAIN	\N	2024-09-08 10:54:32.613+02	2024-09-08 10:54:43.992+02	167	1991	\N	\N
144	Earl	\N	\N	\N	toejam_&_earl/earl.jpg	\N	MAIN	\N	2024-09-08 10:55:08.533+02	2024-09-08 10:55:23.661+02	167	1991	\N	\N
145	Terminator T-800	\N	\N	\N	terminator/t800.jpg		MAIN	\N	2024-09-11 13:44:25.977+02	2024-09-11 13:44:36.102+02	173	1990	https://es.wikipedia.org/wiki/Terminator_T-800	\N
146	Kirby	\N	\N	\N	kirby/kirby.jpg	#df6da9	MAIN	\N	2024-09-12 16:34:05.754+02	2024-09-12 16:34:19.602+02	176	1992	https://es.wikipedia.org/wiki/Kirby_(personaje)	t
147	Rey Dedede	\N	\N	\N	kirby/Rey_Dedede.jpg	\N	ANTAGONIST	\N	2024-09-12 16:37:46.364+02	2024-09-12 16:38:04.682+02	176	1992	https://es.wikipedia.org/wiki/Rey_Dedede	\N
148	B.J. Blazkowicz	William Joseph Blazkowicz	\N	\N	wolfenstein/BJ_Blazkowicz.jpg	\N	MAIN	\N	2024-09-13 10:11:46.406+02	2024-09-13 10:12:03.092+02	60	1992	https://es.wikipedia.org/wiki/William_%22B.J.%22_Blazkowicz	\N
149	Ecco	\N	\N	\N	ecco_the_dolphin/Ecco.jpg	\N	MAIN	\N	2024-09-13 13:29:46.166+02	2024-09-13 13:29:56.23+02	177	1992	\N	\N
150	Ryo Sakazaki	\N	\N	\N	art_of_fighting/ryo-sakazaki.jpg	\N	MAIN	\N	2024-09-15 09:33:06.351+02	2024-09-15 09:33:15.097+02	180	1992	https://es.wikipedia.org/wiki/Ryo_Sakazaki	\N
151	Robert Garcia	\N	\N	\N	art_of_fighting/Robert_Garcia.jpg	\N	MAIN	\N	2024-09-15 09:35:54.374+02	2024-09-15 09:36:04.682+02	180	1992	https://es.wikipedia.org/wiki/Robert_Garcia_(Art_of_Fighting)	\N
152	Yuri Sakazaki	\N	\N	\N	art_of_fighting/yuri_sakazaki.jpg	\N	SECONDARY	\N	2024-09-15 09:39:24.069+02	2024-09-15 09:39:31.743+02	180	1992	https://es.wikipedia.org/wiki/Yuri_Sakazaki	\N
153	Zool	\N	\N	\N	zool/zool.jpg	\N	MAIN	\N	2024-09-15 10:52:05.905+02	2024-09-15 10:52:38.797+02	181	1992	\N	\N
154	Liu Kang	\N	\N	\N	mortal_kombat/liu_kang.jpg	\N	MAIN	\N	2024-09-15 12:05:31.498+02	2024-09-15 12:05:40.64+02	182	1992	https://es.wikipedia.org/wiki/Liu_Kang	\N
155	Raiden	\N	\N	\N	mortal_kombat/Raiden.jpg	\N	SECONDARY	\N	2024-09-15 12:09:34.618+02	2024-09-15 12:09:44.172+02	182	1992	https://es.wikipedia.org/wiki/Raiden_(Mortal_Kombat)	\N
156	Johnny Cage	Jonathan Carlton	\N	\N	mortal_kombat/Johnnycage.jpg	\N	SECONDARY	\N	2024-09-15 12:13:24.764+02	2024-09-15 12:13:41.119+02	182	1992	https://es.wikipedia.org/wiki/Johnny_Cage	\N
157	Sonya Blade	\N	\N	\N	mortal_kombat/Sonya_Blade.jpg	\N	SECONDARY	\N	2024-09-15 12:17:56.837+02	2024-09-15 12:18:14.381+02	182	1992	https://es.wikipedia.org/wiki/Sonya_Blade	\N
158	Kano	\N	\N	\N	mortal_kombat/kano.jpg	\N	SECONDARY	\N	2024-09-15 12:20:45.117+02	2024-09-15 12:22:03.58+02	182	1992	https://es.wikipedia.org/wiki/Kano_(Mortal_Kombat)	\N
159	Scorpion	Hanzo Hasashi	\N	\N	mortal_kombat/scorpion.jpg	\N	SECONDARY	\N	2024-09-15 12:24:50.163+02	2024-09-15 12:25:07.594+02	182	1992	https://es.wikipedia.org/wiki/Scorpion_(Mortal_Kombat)	\N
160	Sub-Zero	Bi-Han / Kuai Liang	\N	\N	mortal_kombat/sub-zero.jpg	\N	SECONDARY	\N	2024-09-15 12:29:38.771+02	2024-09-15 12:29:56.16+02	182	1992	https://es.wikipedia.org/wiki/Sub-Zero	\N
161	Goro	\N	\N	\N	mortal_kombat/Goro.jpg	\N	VILLAIN	\N	2024-09-15 12:32:31.356+02	2024-09-15 12:32:51.897+02	182	1992	https://es.wikipedia.org/wiki/Goro_(personaje)	\N
162	Reptile	Syzoth	\N	\N	mortal_kombat/Reptile.jpg	\N	SECONDARY	\N	2024-09-15 12:39:38.035+02	2024-09-15 12:39:53.083+02	182	1992	https://es.wikipedia.org/wiki/Reptile_(Mortal_Kombat)	\N
163	Shang Tsung	\N	\N	\N	mortal_kombat/Shang_Tsung .jpg	\N	ANTAGONIST	\N	2024-09-15 12:42:31.458+02	2024-09-15 12:42:40.661+02	182	1992	https://es.wikipedia.org/wiki/Shang_Tsung	\N
164	Wario	\N	\N	\N	mario/wario.jpg	\N	VILLAIN	\N	2024-09-16 15:23:37.804+02	2024-09-16 15:23:51.006+02	14	1992	https://es.wikipedia.org/wiki/Wario	f
165	Conrad	Conrad B. Hart	\N	\N	flashback/conrad.jpg	\N	MAIN	\N	2024-09-17 16:12:40.244+02	2024-09-17 16:12:53.398+02	184	1992	\N	\N
166	Edward Carnby	\N	\N	\N	alone_in_the_dark/edward_carnby.jpg	\N	MAIN	\N	2024-09-18 16:14:56.242+02	2024-09-18 16:15:04.584+02	185	1992	https://es.wikipedia.org/wiki/Edward_Carnby	\N
167	Mai Shiranui	\N	\N	\N	fatal_fury/mai.jpg	\N	SECONDARY	\N	2024-09-20 12:36:58.065+02	2024-09-20 12:37:05.965+02	152	1992	https://es.wikipedia.org/wiki/Mai_Shiranui	\N
168	Correcaminos	\N	\N	Road Runner	looney_tunes/Road-runner.jpg	\N	MAIN	\N	2024-09-21 12:57:13.961+02	2024-09-21 12:57:24.947+02	189	1979	https://es.wikipedia.org/wiki/El_Coyote_y_el_Correcaminos	\N
169	Coyote	Wile E. Coyote	\N	\N	looney_tunes/Wile_e_coyote.jpg	\N	ANTAGONIST	\N	2024-09-21 12:59:15.655+02	2024-09-21 12:59:22.875+02	189	1979	https://es.wikipedia.org/wiki/El_Coyote_y_el_Correcaminos	\N
170	Krusty	Herschel Krustofsky	\N	\N	the_simpsons/krusty.jpg	\N	SECONDARY	\N	2024-09-24 15:41:42.035+02	2024-09-24 15:41:51.598+02	161	1992	https://es.wikipedia.org/wiki/Krusty_el_payaso	\N
171	Taz	\N	Demonio de Tasmania	\N	looney_tunes/Taz.jpg	\N	MAIN	\N	2024-09-24 16:05:31.638+02	2024-09-24 16:05:57.9+02	189	1983	https://es.wikipedia.org/wiki/Taz_(Looney_Tunes)	\N
172	Xenomorfo	\N	\N	\N	alien/xenomorph.jpg	\N	ANTAGONIST	\N	2024-09-24 16:51:22.432+02	2024-09-24 16:51:28.99+02	193	1982	https://es.wikipedia.org/wiki/Xenomorfo	\N
173	Astérix	\N	\N	\N	asterix/Asterix.jpg	\N	MAIN	\N	2024-09-26 16:53:57.289+02	2024-09-26 16:54:05.367+02	194	1983	https://es.wikipedia.org/wiki/Ast%C3%A9rix_(Ast%C3%A9rix_el_Galo)	\N
174	Obélix	\N	\N	\N	asterix/obelix.jpg	\N	MAIN	\N	2024-09-26 16:54:40.106+02	2024-09-26 16:54:47.735+02	194	1983	https://es.wikipedia.org/wiki/Ob%C3%A9lix	\N
175	Chip	\N	\N	\N	chip_n_dale/chip.jpg	\N	MAIN	\N	2024-09-26 17:23:51.051+02	2024-09-26 17:23:57.065+02	195	1990	https://en.wikipedia.org/wiki/Chip_%27n%27_Dale	\N
176	Dale	\N	\N	Chop (ES)	chip_n_dale/dale.jpg	\N	MAIN	\N	2024-09-26 17:24:29.006+02	2024-09-26 17:24:36.92+02	195	1990	https://en.wikipedia.org/wiki/Chip_%27n%27_Dale	\N
177	Pingüino	Oswald Chesterfield Cobblepot	\N	\N	batman/Penguin.jpg	\N	VILLAIN	\N	2024-09-27 08:57:04.955+02	2024-09-27 08:57:11.619+02	87	1988	https://es.wikipedia.org/wiki/Ping%C3%BCino_(personaje)	\N
\.


--
-- Data for Name: Companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Companies" (id, name, country, founding_year, active, defunct_year, defunct_reason, previous_names, color, "createdAt", "updatedAt", "ownerId", main_img, wikipedia, owner_relation, notes, is_main) FROM stdin;
30	Konami	jp	1973	t	\N	\N	\N	#990313	2024-05-19 13:11:24.51+02	2024-05-24 14:03:32.194+02	\N	konami.png	https://es.wikipedia.org/wiki/Konami	\N	\N	t
3	Sega Technical Institute	us	1990	f	1996	Disuelta por Sega		#17569b	2024-03-24 19:39:25.503+01	2024-03-30 12:12:57.183+01	1	Sega_technical_institute.jpg	https://es.wikipedia.org/wiki/Sega_Technical_Institute	DIVISION	\N	\N
31	Nintendo R&D1	jp	1970	f	2005	Reestructuración dentro de los equipos de Nintendo	\N	#E60012	2024-05-24 13:42:06.403+02	2024-05-24 13:54:53.52+02	32	nintendord1.png	https://es.wikipedia.org/wiki/Nintendo_Research_%26_Development_1	DIVISION	\N	\N
27	WMS Industries	us	1974	f	2016	Disuelta por Scientific Games	Williams Electronics	\N	2024-05-12 13:44:34.127+02	2024-05-12 13:44:34.127+02	\N	WMS.png	https://es.wikipedia.org/wiki/WMS_Industries	\N	Fue comprada por Scientific Games (dedicada a pinballs y casinos) en 2013	\N
20	Infocom	us	1979	f	1989	Cerrada por Activision	\N	\N	2024-05-01 10:51:09.202+02	2024-09-07 11:46:41.833+02	21	infocom.png	https://es.wikipedia.org/wiki/Infocom	ADQUISITION	Comprada por Activision en 1986	\N
32	Nintendo	jp	1889	t	\N	\N	Nintendo Koppai (1889)\nYamauchi Nintendo (1889–1933)\nYamauchi Nintendo & Co. (1933–1947)\nMarufuku Co., Ltd. (1947–1951)\nNintendo Playing Card Co. Ltd. (1951–1963)	#E60012	2024-05-24 13:53:58.743+02	2024-05-24 14:03:07.664+02	\N	Nintendo.png	https://es.wikipedia.org/wiki/Nintendo	\N	\N	t
37	Universal Studios	us	1912	t	\N	\N	\N	\N	2024-06-02 11:42:20.643+02	2024-06-02 11:42:20.643+02	\N	universal.png	https://es.wikipedia.org/wiki/Universal_Pictures	\N	\N	\N
14	Taito	jp	1953	t	\N	\N	\N	\N	2024-04-27 13:20:35.505+02	2024-04-27 13:28:13.671+02	15	taito.png	https://es.wikipedia.org/wiki/Taito_Corporation	ADQUISITION	Adquirida por Squarex Enix en 2015	\N
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
22	Activision Blizzard	us	2008	t	\N	\N	\N	\N	2024-05-01 11:02:06.678+02	2024-08-11 13:42:45.071+02	23	Activision_Blizzard.png	https://es.wikipedia.org/wiki/Activision_Blizzard	ADQUISITION	Adquirida por Microsoft en 2023	f
11	Atari	us	1972	t	\N	\N		\N	2024-04-26 10:43:24.491+02	2024-09-12 15:18:40.313+02	12	atari.png	https://es.wikipedia.org/wiki/Atari	ADQUISITION	Parte de Warner Communications (1976–1995)\nParte de Hasbro (1995–2001)\nAdquirida por Infogrames (ahora Atari SA) en 2001	f
24	Epyx	us	1978	f	1993	Bancarrota	\N	\N	2024-05-01 12:45:14.274+02	2024-05-01 12:45:14.274+02	\N	Epyx.png	https://es.wikipedia.org/wiki/Epyx	\N	\N	\N
25	Sierra	us	1979	f	2008	Disuelta en la formación de Activision-Blizzard	On-Line Systems (1979–1982)	\N	2024-05-01 13:20:06.05+02	2024-05-01 13:22:48.175+02	22	sierra.png	https://es.wikipedia.org/wiki/Sierra_Entertainment	ADQUISITION	Fue comprada por Vivendi Games en 2006\nEn la fusión de Vivendi con Activision para formar Activision-Blizzard fue disuelta	\N
28	Origin Systems	us	1983	f	2004	Disuelta por Electronic Arts	\N	\N	2024-05-18 19:40:50.217+02	2024-05-18 19:54:53.241+02	29	Origin_Systems.png	https://es.wikipedia.org/wiki/Origin_Systems	ADQUISITION	Comprada por Electronic Arts en 1992	\N
1	Sega	jp	1960	t	\N	\N	\N	#17569b	2023-12-23 11:49:57.613+01	2024-05-24 14:03:18.615+02	\N	sega.png	\N	\N	\N	t
23	Microsoft	us	1975	t	\N	\N	\N	#7EB900	2024-05-01 11:07:15.752+02	2024-05-24 14:03:41.845+02	\N	microsoft.png	https://es.wikipedia.org/wiki/Microsoft	\N	\N	t
29	Electronic Arts	us	1982	t	\N	\N	\N	#6E34EB	2024-05-18 19:48:21.902+02	2024-05-24 14:03:52.288+02	\N	Electronic_Arts.png	https://es.wikipedia.org/wiki/Electronic_Arts	\N	\N	t
36	Sony	jp	1946	t	\N	\N	Tokyo Tsushin Kogyo K.K. (1946–1957)	#003087	2024-05-30 16:50:51.947+02	2024-08-22 15:23:58.352+02	\N	sony.png	https://es.wikipedia.org/wiki/Sony	\N	\N	f
33	Coleco	us	1932	f	1989	Bancarrota	The Connecticut Leather Company	\N	2024-05-26 12:26:44.033+02	2024-05-26 12:26:44.033+02	\N	Coleco.png	https://es.wikipedia.org/wiki/Coleco	\N	\N	\N
35	Gottlieb	us	1927	f	1996	Bancarrota	D. Gottlieb & Co.	\N	2024-05-30 16:36:16.619+02	2024-05-30 16:36:57.777+02	\N	Gottlieb.png	https://es.wikipedia.org/wiki/Gottlieb	\N	Empresa dedicada mayormente a pinball	\N
7	Softkey	ca	1986	f	1999	Disuelta por Mattel	The Learning Company (1995–1999)	\N	2024-04-24 23:38:18.324+02	2024-08-31 12:55:15.628+02	146	softkey.png	https://en.wikipedia.org/wiki/SoftKey	ADQUISITION	\N	\N
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
47	Ultimate Play the Game	gb	1982	t	\N	\N	\N	\N	2024-06-14 13:50:38.602+02	2024-09-07 11:38:08.261+02	48	ultimateplaythegame.jpeg	https://en.wikipedia.org/wiki/Ultimate_Play_the_Game	DIVISION	Fundada por los creadores de Rare, antes que esta y después traspasaron todos sus assets ahí.	\N
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
117	Team Ninja	jp	1995	t	\N	\N	\N	\N	2024-08-06 16:23:10.617+02	2024-08-06 16:23:17.794+02	115	Team_Ninja.png	https://es.wikipedia.org/wiki/Team_Ninja	DIVISION	\N	\N
116	MachineGames	se	2009	t	\N	\N	\N	\N	2024-08-06 16:17:27.524+02	2024-08-06 16:18:15.964+02	85	MachineGames.png	https://es.wikipedia.org/wiki/MachineGames	ADQUISITION	Adquirida por ZeniMax en 2010	\N
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
88	Imagic	us	1981	f	1986	Disolución	\N	\N	2024-07-08 16:11:12.718+02	2024-07-08 16:11:12.718+02	\N	Imagic.png	https://es.wikipedia.org/wiki/Imagic	\N	\N	\N
89	Tozai Games	jp	1996	t	\N	\N	\N	\N	2024-07-08 16:43:22.319+02	2024-07-08 16:43:22.319+02	\N	Tozai_Games.jpg	\N	\N	\N	\N
90	Data East	jp	1976	f	2003	Bancarrota	\N	\N	2024-07-09 16:00:37.152+02	2024-07-09 16:00:37.152+02	\N	Data_East.png	https://es.wikipedia.org/wiki/Data_East	\N	\N	\N
91	Technōs Japan	jp	1981	f	1996	Bancarrota	\N	\N	2024-07-09 16:19:14.561+02	2024-07-09 16:19:14.561+02	\N	Technos_Japan.png	https://es.wikipedia.org/wiki/Techn%C5%8Ds_Japan	\N	Sus propiedades las adquirió Arc System Works después de su bancarrota.	\N
93	Eizo	jp	1968	t	\N	\N	\N	\N	2024-07-09 16:36:48.701+02	2024-07-09 16:36:48.701+02	\N	EIZO.png	https://es.wikipedia.org/wiki/Eizo	\N	\N	\N
102	Graftgold	gb	1983	f	1998	Disolución	\N	\N	2024-07-24 16:35:10.213+02	2024-07-24 16:35:10.213+02	\N	Graftgold.jpg	https://en.wikipedia.org/wiki/Graftgold	\N	\N	\N
92	Irem	jp	1974	t	\N	\N	\N	\N	2024-07-09 16:34:53.229+02	2024-07-09 16:37:19.464+02	93	Irem.png	https://es.wikipedia.org/wiki/Irem	ADQUISITION	Comprada por Eizo en 1998	\N
94	Big Five Software	us	1980	f	1986	Disolución	\N	\N	2024-07-10 15:46:28.72+02	2024-07-10 15:46:28.72+02	\N	Big_Five_Software.jpg	https://en.wikipedia.org/wiki/Big_Five_Software	\N	\N	\N
95	Nintendo EAD	jp	1983	f	2005	Reestructuración dentro de los equipos de Nintendo	Nintendo R&D4	#E60012	2024-07-15 13:23:56.81+02	2024-07-16 23:11:50.567+02	32	nintendord1.png	https://es.wikipedia.org/wiki/Nintendo_Entertainment_Analysis_and_Development	DIVISION		\N
96	SNK	jp	1978	t	\N	\N	Shin Nihon Kikaku(1978–1986)\nSNK Corporation(1986–2001)\nPlaymore Corporation (2001–2003)\nSNK Playmore Corporation (2003–2016)	\N	2024-07-17 16:20:45.671+02	2024-07-17 16:20:55.45+02	\N	SNK.png	https://es.wikipedia.org/wiki/SNK	\N	Se disolvió en el 2001 y volvió como Playmore Corporation	f
97	Westone Bit Entertainment	jp	1986	f	2014	Bancarrota	Escape	\N	2024-07-18 16:34:34.609+02	2024-07-18 16:34:34.609+02	\N	Westone_bit.jpg	https://en.wikipedia.org/wiki/Westone_Bit_Entertainment	\N	\N	\N
98	Spike Chunsoft	jp	2012	t	\N	\N	\N	\N	2024-07-19 17:02:54.132+02	2024-07-19 17:02:54.132+02	\N	Spike_Chunsoft.png	https://es.wikipedia.org/wiki/Spike_Chunsoft	\N	\N	\N
99	Chunsoft	jp	1984	t	\N	\N	\N	\N	2024-07-19 17:04:18.739+02	2024-07-19 17:04:27.587+02	98	Chunsoft.png	\N	MERGE	Creo Spike Chunsoft al fusionarse con Spike en 2012	\N
87	Broderbund	us	1980	f	1998	Disuelta por Softkey	\N	\N	2024-07-08 15:59:41.107+02	2024-08-31 12:47:47.993+02	7	Broderbund.png	https://es.wikipedia.org/wiki/Br%C3%B8derbund	ADQUISITION	Comprada por Softkey en 1998\nSoftkey fue comprado por Mattel Interactive en 1999\nMattel disuelve Mattel Interactive y vende las licencias a Ubisoft en 2001	\N
103	Bandai	jp	1950	t	\N	\N	Bandai-ya\n	#da3732	2024-07-25 17:00:24.085+02	2024-07-25 17:00:36.737+02	19	bandai.png	https://es.wikipedia.org/wiki/Bandai	MERGE	La unión con Namco propició Bandai Namco en 2005	\N
104	Tose	jp	1979	t	\N	\N	\N	\N	2024-07-25 17:14:11.259+02	2024-07-25 17:14:11.259+02	\N	Tose.png	https://es.wikipedia.org/wiki/Tose_(empresa)	\N	\N	\N
105	Arc System Works	jp	1988	t	\N	\N	\N	\N	2024-07-27 13:18:12.731+02	2024-07-27 13:18:12.731+02	\N	Arc_System_Works.png	https://es.wikipedia.org/wiki/Arc_System_Works	\N	En 2015 adquirió todas las licencias de Technōs Japan	\N
106	Nihon Falcom	jp	1981	t	\N	\N	\N	\N	2024-07-27 14:03:50.999+02	2024-07-27 14:03:50.999+02	\N	nihon_falcom.png	https://es.wikipedia.org/wiki/Nihon_Falcom	\N	\N	\N
107	Lucasfilm Games	us	1982	t	\N	\N	LucasArts Entertainment (1990–2021)	\N	2024-07-29 20:44:30.934+02	2024-07-29 20:44:42.347+02	74	Lucasfilm_Games.png	https://es.wikipedia.org/wiki/Lucasfilm_Games	ADQUISITION	Cerrada en 2013, reabierta por Disney en 2017	\N
108	FTL Games	us	1982	f	1996	Disolución	\N	\N	2024-07-30 16:28:25.474+02	2024-07-30 16:28:25.474+02	\N	FTL_Games.png	https://es.wikipedia.org/wiki/FTL_Games	\N	\N	\N
109	Squaresoft	jp	1986	f	2003	Se fusionó con Enix para formar Square Enix	Square Co. en Japón	\N	2024-08-01 15:43:11.91+02	2024-08-01 15:43:25.928+02	15	Square.png	https://es.wikipedia.org/wiki/Squaresoft	MERGE	\N	\N
110	System 3	gb	1982	t	\N	\N	Studio 3 (1999-2003)	\N	2024-08-02 09:02:12.358+02	2024-08-02 09:02:12.358+02	\N	system-3.png	https://es.wikipedia.org/wiki/System_3	\N	\N	\N
111	MicroProse	us	1982	t	\N	\N	Infogrames Interactive Hunt Valley Studio (2001–2003)\nAtari Interactive Hunt Valley Studio (2003)	\N	2024-08-02 09:57:28.755+02	2024-08-02 09:59:37.589+02	\N	MicroProse.png	https://es.wikipedia.org/wiki/MicroProse	\N	Firaxis Games de Take 2 se quedó con los derechos de los juegos cuando la empresa fue vendida en 1998.\nLa empresa estuvo desaparecida entre 2013 y 2018. Volvió como empresa independiente de nuevo.	\N
112	EA Sports	us	1991	t	\N	\N	Electronic Arts Sports Network (1991–1993)	\N	2024-08-03 12:03:57.277+02	2024-08-03 12:04:10.613+02	29	EA_Sports.png	https://es.wikipedia.org/wiki/EA_Sports	DIVISION	\N	\N
115	Koei Tecmo	jp	2009	t	\N	\N	\N	\N	2024-08-06 16:08:31.191+02	2024-08-06 16:08:31.191+02	\N	Koei_Tecmo.png	https://es.wikipedia.org/wiki/Koei_Tecmo	\N	\N	\N
114	Koei	jp	1978	f	2010	Fusionada con Tecmo para formar Koei Tecmo	\N	\N	2024-08-06 16:04:56.906+02	2024-08-06 16:09:03.216+02	115	Koei.png	https://es.wikipedia.org/wiki/Koei	MERGE	\N	\N
113	Tecmo	jp	1967	f	2010	Fusionada con Koei para formar Koei Tecmo	\N	\N	2024-08-06 16:02:14.477+02	2024-08-06 16:09:25.649+02	115	Tecmo.png	https://es.wikipedia.org/wiki/Tecmo	MERGE	\N	\N
118	Amazon MGM Studio	us	2010	t	\N	\N	Amazon Studios (2010-2023)	\N	2024-08-07 16:13:09.647+02	2024-08-07 16:13:09.647+02	\N	Amazon_MGM_Studio.png	https://es.wikipedia.org/wiki/Amazon_MGM_Studios	\N	Creada tras la adquisición de MGM por Amazon en 2022	\N
119	The Bitmap Brothers	gb	1987	f	2019	Disolución	\N	\N	2024-08-09 11:47:44.034+02	2024-08-09 11:47:44.034+02	\N	Bitmap_Brothers.png	https://es.wikipedia.org/wiki/The_Bitmap_Brothers	\N	\N	\N
120	Paramount	us	1912	t	\N	\N	Famous Players Film Company (1912–1916)\nFamous Players–Lasky Corporation (1916–1927)\nParamount Famous Lasky  (1927–1930)\nParamount Publix Corporation (1930–1935)\nParamount Pictures Inc. (1935–1950)	\N	2024-08-10 12:10:18.211+02	2024-08-10 12:10:18.211+02	\N	Paramount.png	https://es.wikipedia.org/wiki/Paramount_Global	\N	\N	\N
121	Empire Interactive	gb	1987	f	2009	Bancarrota	\N	\N	2024-08-10 13:14:03.824+02	2024-08-10 13:14:03.824+02	\N	empire_interactive.png	https://es.wikipedia.org/wiki/Empire_Interactive	\N	\N	\N
123	Creatures Inc.	jp	1989	t	\N	\N	Ape Inc. (1989-1995)	\N	2024-08-11 12:42:30.634+02	2024-08-11 12:42:30.634+02	\N	Creatures_Inc..png	https://es.wikipedia.org/wiki/Creatures_(compa%C3%B1%C3%ADa)	\N	Afiliada y propietaria de un tercio The Pokemon Company	\N
124	Ubisoft	fr	1986	t	\N	\N	Ubi Soft Entertainment SA (1986–2003)	\N	2024-08-11 13:41:05.801+02	2024-08-11 13:41:05.801+02	\N	Ubisoft.png	https://es.wikipedia.org/wiki/Ubisoft	\N	\N	t
19	Bandai Namco	jp	2006	t	\N	\N	\N	#E60000	2024-04-30 17:43:10.605+02	2024-08-11 13:42:05.76+02	\N	Bandai_Namco.png	https://es.wikipedia.org/wiki/Bandai_Namco_Entertainment	\N	\N	f
100	Bethesda	us	1986	t	\N	\N	\N	\N	2024-07-21 12:18:26.236+02	2024-08-11 13:42:22.354+02	85	Bethesda.png	https://es.wikipedia.org/wiki/Bethesda_Softworks	ADQUISITION	Crea ZeniMax en 1999 para tener un grupo empresarial	f
49	Xbox Game Studios	us	2000	t	\N	\N	Microsoft Games (2000–2001)\nMicrosoft Game Studios (2001–2011)\nMicrosoft Studios (2011–2019)	#9bc848	2024-06-15 11:48:12.012+02	2024-08-11 13:42:59.343+02	23	Xbox_Game_Studios.png	https://es.wikipedia.org/wiki/Xbox_Game_Studios	DIVISION		f
125	Maxis	us	1987	t	\N	\N	\N	\N	2024-08-12 15:35:22.459+02	2024-08-12 15:35:33.329+02	29	Maxis.png	https://es.wikipedia.org/wiki/Maxis	ADQUISITION	Adquirida por Electronic Arts en 1997	\N
126	Atlus	jp	1986	t	\N	\N	Sega Dream Corporation (2013-2014)	\N	2024-08-12 16:44:30.713+02	2024-08-12 16:44:38.693+02	1	Atlus.png	https://es.wikipedia.org/wiki/Atlus	ADQUISITION	Desaparecida entre 2010 y 2013 hasta que Sega la compró en ese año para retomar la actividad.	\N
127	Red Entertainment	jp	1985	t	\N	\N	Red Company (1985-2000)	\N	2024-08-12 16:51:13.446+02	2024-08-12 16:51:24.527+02	\N	red_entertainment.jpg	https://es.wikipedia.org/wiki/Red_Entertainment	\N	\N	\N
129	Tradewest	us	1985	f	1994	Comprada por WMS	\N	\N	2024-08-18 14:02:19.799+02	2024-08-18 14:02:28.092+02	27	Tradewest.png	https://es.wikipedia.org/wiki/Tradewest	ADQUISITION	\N	\N
128	Leland Corporation	us	1987	f	1997	Disuelta por WMS	\N	\N	2024-08-18 13:57:59.329+02	2024-08-18 14:03:20.201+02	129	Leland_Corporation.png	https://en.wikipedia.org/wiki/Leland_Corporation	ADQUISITION	Creada por Tradewest	\N
130	Ubisoft Reflections	gb	1984	t	\N	\N	Reflections (1984–1998)\nReflections Interactive (1998–2006)	\N	2024-08-22 15:09:26.005+02	2024-09-07 11:40:52.633+02	124	Ubisoft_Reflections.png	https://es.wikipedia.org/wiki/Ubisoft_Reflections	DIVISION	Creada tras la compra de Reflections por Ubisoft	\N
131	Reflections	gb	1984	f	2006	Comprada por Ubisoft	Reflections (1984–1998)\nReflections Interactive Limited (1998–2006)	\N	2024-08-22 15:13:22.854+02	2024-09-07 11:40:39.449+02	130	reflections.jpg	https://es.wikipedia.org/wiki/Ubisoft_Reflections	ADQUISITION	Fue adquirida por Ubisoft en 2006 y cambió de nombre a Ubisoft Reflections	\N
133	Sony Interactive Entertainment	jp	1993	t	\N	\N	Sony Computer Entertainment (1993-2016)	#003087	2024-08-22 15:23:39.433+02	2024-08-22 15:23:47.931+02	36	Sony_Interactive_Entertainment.png	https://es.wikipedia.org/wiki/Sony_Interactive_Entertainment	DIVISION	\N	t
132	Psygnosis	gb	1984	f	1999	Absorción total en Sony Computer y renombrada SCE Studio Liverpool		\N	2024-08-22 15:17:46.988+02	2024-09-07 14:18:24.124+02	169	Psygnosis.png	https://es.wikipedia.org/wiki/Psygnosis	ADQUISITION	Comprada por Sony Computer Entertainment en 1993	\N
178	Game Arts	jp	1985	t	\N	\N	\N	\N	2024-09-10 15:24:18.366+02	2024-09-10 15:24:18.366+02	\N	Game_Arts.png	https://es.wikipedia.org/wiki/Game_Arts	\N	\N	\N
134	Anco Software	gb	1982	f	2003	Disolución	\N	\N	2024-08-22 16:11:14.653+02	2024-08-22 16:11:14.653+02	\N	anco-software.jpg	\N	\N	\N	\N
140	DMA Design	gb	1988	f	2002	Cambió de nombre a Rockstar North	\N		2024-08-30 13:59:33.679+02	2024-09-07 11:40:05.386+02	141	DMA_Design.png	https://es.wikipedia.org/wiki/Rockstar_North	ADQUISITION	Comprada por Take-Two en 1999 y puesta bajo Rockstar Games	\N
136	Firaxis Games	us	1996	t	\N	\N	\N	\N	2024-08-23 10:36:11.256+02	2024-08-23 10:38:00.567+02	135	Firaxis_Games.png	https://es.wikipedia.org/wiki/Firaxis_Games	ADQUISITION	Fundada por Sid Meier tras salir de Micropose\nComprada por Take-Two en 2005 y puesta bajo 2K	\N
122	Bullfrog	gb	1987	f	2001	Disuelta por Electronic Arts	\N	\N	2024-08-11 10:40:09.236+02	2024-08-23 10:39:12.051+02	29	Bullfrog.png	https://es.wikipedia.org/wiki/Bullfrog_Productions	ADQUISITION	Fundada por Peter Molyneux\nAdquirida por Electronic Arts en 1995	\N
101	Intelligent Systems	jp	1986	t	\N	\N	\N	\N	2024-07-21 12:37:33.522+02	2024-08-23 13:45:42.907+02	\N	Intelligent_Systems.png	https://es.wikipedia.org/wiki/Intelligent_Systems	\N	Es independiente pero solo desarrolla juegos para Nintendo.\nActualmente a cargo de FireEmblem, Paper Mario, WarioWare y Advance Wars	\N
137	Mitchell Corporation	jp	1960	f	2012	Disolución	\N	\N	2024-08-25 13:34:19.504+02	2024-08-25 13:34:19.504+02	\N	Mitchell-Corporation.jpg	https://es.wikipedia.org/wiki/Mitchell_Corporation	\N	\N	\N
138	Sunsoft	jp	1978	t	\N	\N	Sun Corporation\n	\N	2024-08-27 16:46:59.061+02	2024-08-27 16:46:59.061+02	\N	Sunsoft.png	https://es.wikipedia.org/wiki/Sunsoft	\N	\N	\N
139	Core Design	gb	1988	f	2010	Disuelta por Rebellion	\N	\N	2024-08-29 17:02:26.519+02	2024-08-29 17:02:38.609+02	66	Core_Design.png	https://es.wikipedia.org/wiki/Core_Design	ADQUISITION	Comprada por Eidos en 1996\nComprada por Rebellion en 2006	\N
142	Rockstar Games	us	1998	t	\N	\N	\N	\N	2024-08-30 14:06:49.724+02	2024-08-30 14:08:23.911+02	54	Rockstar_Games.png	https://es.wikipedia.org/wiki/Rockstar_Games	DIVISION	Fundada por Take-two para administrar las licencias adquiridas de BGM	t
143	Stormfront Studios	us	1988	f	2008	Disolución	Beyond Software (1988–1993)	\N	2024-08-31 11:48:23.957+02	2024-08-31 11:48:23.957+02	\N	Stormfront_Studios.jpg	https://en.wikipedia.org/wiki/Stormfront_Studios	\N	\N	\N
141	Rockstar North	gb	1988	t	\N	\N	DMA Design Limited (1988–2002)\nRockstar North Limited (2002–2021)	\N	2024-08-30 14:02:20.645+02	2024-08-30 14:11:05.885+02	142	Rockstar_North.png	https://es.wikipedia.org/wiki/Rockstar_North	DIVISION	Fundada como DMA Design, cambió de nombre en 2002 tal ser adquirida por Take-two en 1999 y puesta como división bajo Rockstar Games	\N
144	Wizards of the Coast	us	1990	t	\N	\N	\N	\N	2024-08-31 12:16:52.738+02	2024-08-31 12:17:03.101+02	75	Wizards_of_the_coast.png	https://es.wikipedia.org/wiki/Wizards_of_the_Coast	ADQUISITION	Adquirida por Hasbro en 1999	\N
145	Strategic Simulations	us	1979	f	2001	Disuelta por Ubisoft	\N	\N	2024-08-31 12:29:19.885+02	2024-08-31 12:57:51.108+02	147	Strategic_Simulations.png	https://es.wikipedia.org/wiki/Strategic_Simulations	ADQUISITION	Adquirida por Mindscape en 1994\nMindscape fue adquirida por Softkey en 1998\nSoftkey fue adquirida por Mattel Interactive en 1999\nMattel vendió a Ubisoft en 2001.\nUbisoft disolvió el nombre de la marca.	\N
135	2K Games	us	2005	t	\N	\N	\N	\N	2024-08-23 10:30:34.446+02	2024-09-05 16:56:46.083+02	54	2K.png	https://es.wikipedia.org/wiki/2K_Games	DIVISION	Fundada tras la adquisición de Visual Concepts (creadores de las sagas deportivas 2k) por parte de Take-Two	\N
179	McDonald's	us	1940	t	\N	\N	\N	\N	2024-09-10 15:41:11.954+02	2024-09-10 15:41:11.954+02	\N	McDonald's.png	McDonald's.png	\N	\N	\N
146	Mattel Interactive	us	1996	f	2001	Disuelta por Mattel	Mattel Media (1996-1999)	#FF0028	2024-08-31 12:45:46.977+02	2024-08-31 12:46:16.484+02	8	Mattel_Interactive.png	https://en.wikipedia.org/wiki/Mattel_Interactive	DIVISION	División creada por Mattel para explotar franquicias de videojuegos.\nLas franquicias adquiridas de otras compañias fueron vendidas a Ubisoft en 2001.	\N
163	Magnetic Fields	gb	1982	f	2000	Disolución	\N	\N	2024-09-07 11:22:03.511+02	2024-09-07 11:22:11.764+02	\N	Magnetic_Fields.png	https://es.wikipedia.org/wiki/Magnetic_Fields_(empresa)	\N	\N	\N
147	Mindscape	us	1983	f	2001	Disolución	\N	\N	2024-08-31 12:54:21.19+02	2024-08-31 12:55:35.132+02	7	Mindscape.png	https://es.wikipedia.org/wiki/Mindscape_(empresa)	ADQUISITION	Comprada por Softkey 1998	\N
148	Delphine Software International	fr	1988	f	2004	Bancarrota	\N	\N	2024-09-01 12:32:37.68+02	2024-09-01 12:32:37.68+02	\N	Delphine_Software.png	https://es.wikipedia.org/wiki/Delphine_Software	\N	\N	f
149	Thinking Rabbit	jp	1982	f	1996	Disolución	\N	\N	2024-09-03 16:56:39.876+02	2024-09-03 16:56:39.876+02	\N	Thinking_Rabbit.png	https://en.wikipedia.org/wiki/Thinking_Rabbit	\N	\N	\N
150	Apogee Software	us	1987	f	1996	Renombrada como 3D Realms	\N	\N	2024-09-05 16:10:08.647+02	2024-09-05 16:15:51.043+02	151	Apogee_Software.png	https://en.wikipedia.org/wiki/3D_Realms#The_Apogee_Model_(1987%E2%80%931996)	DIVISION	Crearon una división para hacer juegos 3D llamada 3D Realms.\nEn 1996 deciden renombrar toda la compañia como 3D Realms.	\N
152	Saber Interactive	us	2001	t	\N	\N	\N	\N	2024-09-05 16:46:55.045+02	2024-09-05 16:46:55.045+02	\N	Saber_Interactive.png	https://es.wikipedia.org/wiki/Saber_Interactive	\N	Perteneció a Embracer Group desde 2021 a 2024	\N
151	3D Realms	us	1987	t	\N	\N	Apogee Software (1987-1996)	\N	2024-09-05 16:15:34.138+02	2024-09-05 16:47:55.059+02	152	3D_Realms.png	https://es.wikipedia.org/wiki/3D_Realms	ADQUISITION	Creada en un principio como división de Apogee para hacer juegos 3D. Finalmente se acabó renombrando toda la compañia como esta división.\nFue comprada en 2004 por SDN Invest.\nFue comprada en 2021 por Saber Interactive.	\N
166	Millennium Interactive	gb	1989	f	1997	Adquirida por Sony Interactive y refundada como SCE Cambridge	\N	\N	2024-09-07 13:59:28.058+02	2024-09-07 14:05:23.296+02	167	Millennium_interactive.jpg	\N	ADQUISITION	\N	\N
153	Gearbox Software	us	1999	t	\N	\N	\N	\N	2024-09-05 16:56:16.829+02	2024-09-05 16:57:09.254+02	135	Gearbox_Software.png	https://es.wikipedia.org/wiki/Gearbox_Software	ADQUISITION	Adquirido por Embracer Group en 2021.\nAdquirido por Take-Two en 2024 y puesto bajo 2K	\N
154	Ancient	jp	1990	t	\N	\N	\N	\N	2024-09-05 17:43:54.638+02	2024-09-05 17:44:03.446+02	\N	Ancient.jpg	https://en.wikipedia.org/wiki/Ancient_(company)	\N	\N	\N
155	TAD Corporation	jp	1988	f	1993	Disolución	\N	\N	2024-09-06 08:59:24.12+02	2024-09-06 08:59:24.12+02	\N	TAD_Corporation.png	https://en.wikipedia.org/wiki/TAD_Corporation	\N	\N	\N
156	Seibu Kaihatsu	jp	1982	f	1998	Disolución	Seibu Denshi (1982-1984)	\N	2024-09-06 09:15:17.035+02	2024-09-06 09:15:17.035+02	\N	Seibu_Kaihatsu.png	https://en.wikipedia.org/wiki/Seibu_Kaihatsu	\N	Sus empleados y franquicias fueron a MOSS	\N
157	MOSS	jp	1993	t	\N	\N	\N	\N	2024-09-06 09:18:47.101+02	2024-09-06 09:18:47.101+02	\N	moss.png	https://en.wikipedia.org/wiki/MOSS_(company)	\N	Adquirieron los trabajadores y franquicias de Seibu Kahaitsu tras su disolución	\N
158	20th Century Studios	us	1935	t	\N	\N	Twentieth Century-Fox (1935–1985)\nTwentieth Century Fox (1985–2020)	\N	2024-09-06 12:37:09.248+02	2024-09-06 12:37:17.349+02	74	20th_Century_Studios.png	https://es.wikipedia.org/wiki/20th_Century_Studios	ADQUISITION	Creada por Fox Films\nVendida a Disney en 2020	\N
159	Marvel Comics	us	1939	t	\N	\N	Timely Comics (1939 - 1947)\nAtlas Comics (1947 -1961)	#F0131E	2024-09-06 13:17:03.898+02	2024-09-06 13:17:14.192+02	74	Marvel.png	https://es.wikipedia.org/wiki/Marvel_Comics	ADQUISITION	Comprada por Disney en 2009	\N
160	Game Freak	jp	1989	t	\N	\N	\N	\N	2024-09-06 14:05:04.07+02	2024-09-06 14:05:17.28+02	\N	Game_freak.jpg	https://es.wikipedia.org/wiki/Game_Freak	\N	\N	f
161	HAL Laboratory	jp	1980	t	\N	\N	\N	\N	2024-09-07 10:36:15.801+02	2024-09-07 10:36:15.801+02	\N	HAL_Laboratory.png	https://es.wikipedia.org/wiki/HAL_Laboratory	\N	Second party de Nintendo	\N
162	NCS Corporation	jp	1985	t	\N	\N	Masaya	\N	2024-09-07 10:51:33.984+02	2024-09-07 10:51:33.984+02	\N	ncs.png	\N	\N	\N	\N
165	Infogrames Sheffield House	gb	1984	f	2003	Cerrado por Infogrames	Gremlin Graphics Software Limited (1984–1994)\nGremlin Interactive Limited (1994–2000)	\N	2024-09-07 11:44:32.744+02	2024-09-07 11:45:07.517+02	13	infogrames_Sheffield_House.png	https://es.wikipedia.org/wiki/Gremlin_Interactive	DIVISION	Infogrames compró en 1999 a Gremlin Interactive y le puso este nombre	\N
167	SCE Cambridge Studio	gb	1997	f	2013	Reestructuración dentro de Sony	\N	\N	2024-09-07 14:04:48.602+02	2024-09-07 14:08:23.868+02	168	SCE_Cambridge.jpg	https://es.wikipedia.org/wiki/SCE_Cambridge_Studio	DIVISION	Fue fundada tras la adquisición de Millennium Interactive por parte de Sony.\nReestructurada en 2013 dentro de Guerrilla Games y renombrada Guerrilla Cambridge	\N
164	Gremlin Interactive	gb	1984	f	2003	Disuelta por Infogrames	Gremlin Graphics Software Limited (1984–1994)\nGremlin Interactive Limited (1994–2000)	\N	2024-09-07 11:29:08.39+02	2024-09-07 11:47:39.924+02	165	Gremlin_Interactive.png	https://es.wikipedia.org/wiki/Gremlin_Interactive	ADQUISITION	Adquirida por Infogrames en 1999 y renombrada como Infogrames Sheffield House.\nSus empleados se fueron a Sumo Digital tras el cierre	\N
168	Guerrilla Cambridge	gb	1997	f	2017	Disuelta por restructuración dentro de Sony Interactive	SCE Studio Cambridge (1997–2012)	\N	2024-09-07 14:07:58.228+02	2024-09-07 14:29:20.249+02	171	GuerrillaCambridge.png	https://en.wikipedia.org/wiki/Guerrilla_Cambridge	DIVISION	Creada con este nombre en 2012 después de mover SCE Cambrige Studio bajo Guerrilla Games	\N
170	PlayStation Studios	jp	2005	t	\N	\N	SCE Worldwide Studios (2005–2016)\nSIE Worldwide Studios (2016–2020)	#003087	2024-09-07 14:22:54.582+02	2024-09-07 14:23:17.808+02	133	PlayStation_Studios.png	https://es.wikipedia.org/wiki/PlayStation_Studios	DIVISION	\N	\N
172	ToeJam & Earl Productions	us	1989	f	2003	Disolución	Johnson Voorsanger Productions (JVP) (1989-1993)	\N	2024-09-08 10:41:55.249+02	2024-09-08 10:41:55.249+02	\N	ToeJam_&_Earl_Productions.jpg	https://en.wikipedia.org/wiki/ToeJam_%26_Earl_Productions	\N	Despues del éxito de los dos primeros ToeJam & Earl decidieron cambiar el nombre de la compañia de JVP a ToeJam & Earl Productions	\N
169	SCE Studio Liverpool	gb	1999	f	2012	Disuelto por Sony Computer	Psygnosis (1984–1999)	\N	2024-09-07 14:15:42.931+02	2024-09-07 14:23:49.544+02	170	Studio_Liverpool.png	https://en.wikipedia.org/wiki/Psygnosis	DIVISION	Creada tras la compra de Psygnosis por Sony Computer en 1999	\N
171	Guerrilla Games	nl	2000	t	\N	\N	Lost Boys Games (2000–2003)	\N	2024-09-07 14:27:21.742+02	2024-09-07 14:28:54.737+02	170	Guerrilla_Games.png	https://es.wikipedia.org/wiki/Guerrilla_Games	ADQUISITION	Comprada por Sony Computer en 2005	\N
173	HumaNature Studios	us	2006	t	\N	\N	\N	\N	2024-09-08 10:45:16.354+02	2024-09-08 10:46:00.872+02	\N	HumaNature_Studios.jpg	https://en.wikipedia.org/wiki/Greg_Johnson_(game_designer)#HumaNature_Studios	\N	Creada por el fundador de ToeJam & Earl Productions, después de que esta cerrara	\N
174	Codemasters	gb	1986	t	\N	\N	\N	\N	2024-09-08 11:30:46.206+02	2024-09-08 11:30:55.886+02	29	Codemasters.png	https://es.wikipedia.org/wiki/Codemasters	ADQUISITION	Estuvo desde 2010 a 2018 bajo Reliance Entertainment.\nComprado en 2020 por Electronic Arts	\N
175	Now Production	jp	1986	t	\N	\N	\N	\N	2024-09-09 15:41:29.972+02	2024-09-09 15:41:29.972+02	\N	Now_Production.png	https://es.wikipedia.org/wiki/Now_Production	\N	\N	\N
176	Produce!	jp	1990	f	2015	Disolución	\N	\N	2024-09-09 16:23:18.23+02	2024-09-09 16:23:18.23+02	\N	produce!.png	https://en.wikipedia.org/wiki/Produce!	\N	\N	\N
177	Quintet	jp	1989	f	2002	Disolución	\N	\N	2024-09-09 17:37:51.474+02	2024-09-09 17:37:51.474+02	\N	Quintet.png	https://es.wikipedia.org/wiki/Quintet	\N	\N	\N
193	Compile	jp	1982	f	2003	Bancarrota	\N	\N	2024-09-12 16:05:46.216+02	2024-09-12 16:05:46.216+02	\N	Compile.png	https://es.wikipedia.org/wiki/Compile	\N	Sus empleados fundaron Compile Heart tras la bancarrota y se quedaron con sus assets excepto la franquicia Puyo Puyo que la adquirió Sega.	\N
180	Virgin Interactive	gb	1983	f	2003	Renombrada como Avalon Interactive	Virgin Games (1983-1993)	\N	2024-09-10 16:00:25.832+02	2024-09-10 16:04:18.356+02	181	Virgin_Interactive.png	https://es.wikipedia.org/wiki/Virgin_Interactive	ADQUISITION	Comprada en 1999 por Titus Software y renombrada en 2003 como Avalon Interactive.	\N
194	Visco Corporation	jp	1982	t	\N	\N	\N	\N	2024-09-13 11:26:47.155+02	2024-09-13 11:26:47.155+02	\N	Visco_Corporation.png	https://es.wikipedia.org/wiki/Visco_Corporation	\N	Actualmente dedicada a los slots	\N
182	Titus Interactive	fr	1985	f	2005	Bancarrota	\N	\N	2024-09-10 16:09:18.453+02	2024-09-10 16:09:18.453+02	\N	TitusInteractive.jpg	https://es.wikipedia.org/wiki/Titus_Interactive	\N	Todos sus assets fueron comprado por Interplay Entertainment después de su bancarrota.	\N
181	Avalon Interactive	gb	2003	f	2005	Disuelta tras la bancarrota de Titus Interactive.	\N	\N	2024-09-10 16:04:02.499+02	2024-09-10 16:09:50.301+02	182	Avalon_Interactive.png	https://es.wikipedia.org/wiki/Avalon_Interactive	DIVISION	Nombre que obtuvo Virgin Interactive en 2003 después de que anteriormente, en 1999, fuese adquirida por Titus Interactive.	\N
183	Interplay Entertainment	us	1983	t	\N	\N	Interplay Productions (1983–1998)	\N	2024-09-10 16:28:31.14+02	2024-09-10 16:28:31.14+02	\N	Interplay_Entertainment.png	https://es.wikipedia.org/wiki/Interplay_Entertainment	\N	\N	\N
186	Acclaim Entertainment	us	1987	f	2004	Bancarrota	\N	\N	2024-09-11 12:39:04.485+02	2024-09-11 12:40:20.779+02	\N	Acclaim.png	https://es.wikipedia.org/wiki/Acclaim_Entertainment	\N	Todos sus assets fueron subastados tras la bancarrota y acabaron divididos en numerosas compañias.	\N
195	Appaloosa Interactive	hu	1983	f	2006	Disolución	Novotrade (1983-1996)	\N	2024-09-13 13:21:59.542+02	2024-09-13 13:21:59.542+02	\N	AppaloosaInteractive.png	https://es.wikipedia.org/wiki/Appaloosa_Interactive	\N	\N	\N
185	Acclaim Studios London	gb	1995	f	2000	Disuelta por Acclaim	Probe Entertainment (1984-1995)	\N	2024-09-11 12:36:08.174+02	2024-09-11 12:41:45.143+02	186	acclaimStudiosLondon.png	https://en.wikipedia.org/wiki/List_of_Acclaim_Entertainment_subsidiaries#Acclaim_Studios_London	DIVISION	Fundada como Probe Entertainment y renombrada tras la compra por parte de Acclaim	\N
184	Probe Entertainment	gb	1984	f	1995	Renombrada como Acclaim Studios London	\N	\N	2024-09-11 12:33:25.171+02	2024-09-11 12:42:11.447+02	185	ProbeEntertainment.jpg	https://en.wikipedia.org/wiki/List_of_Acclaim_Entertainment_subsidiaries#Acclaim_Studios_London	ADQUISITION	Comprada por Acclaim y renombrada como Acclaim Studios London	\N
187	Vivendi	fr	1853	t	\N	\N	Compagnie Générale des Eaux (1853–1998)	\N	2024-09-11 13:02:13.793+02	2024-09-11 13:02:13.793+02	\N	Vivendi.png	https://es.wikipedia.org/wiki/Vivendi	\N	\N	\N
188	StudioCanal	fr	1984	t	\N	\N	Canal+ Production	\N	2024-09-11 13:04:49.304+02	2024-09-11 13:04:57.651+02	187	Studiocanal.png	https://es.wikipedia.org/wiki/StudioCanal	DIVISION	\N	\N
189	Climax Entertainment	jp	1990	f	2015	Bancarrota	\N	\N	2024-09-11 16:55:29.005+02	2024-09-11 16:55:29.005+02	\N	Climax_Entertainment.png	https://en.wikipedia.org/wiki/Climax_Entertainment	\N	\N	\N
191	Camelot Software Planning	jp	1994	t	\N	\N	\N	\N	2024-09-11 17:12:14.28+02	2024-09-11 17:12:14.28+02	\N	Camelot_Software_Planning.png	https://es.wikipedia.org/wiki/Camelot_Software_Planning	\N	Fundada tras la separación de la división Sonic! Software Planning de Sega	\N
190	Sonic! Software Planning	jp	1991	f	1998	Disuelta por Camelot	\N	\N	2024-09-11 17:08:34.621+02	2024-09-11 17:12:36.974+02	191	Sonic!_Software_Planning.png	https://es.wikipedia.org/wiki/Camelot_Software_Planning	DIVISION	Compañia fundada dentro de Sega, que pasa a formar parte de otro compañia externa llamada Camelot en 1995, aunque sigue realizando trabajos para Sega hasta ser completamentamente absorbida por Camelot	\N
196	Sports Interactive	gb	1994	t	\N	\N	\N	\N	2024-09-14 12:53:23.679+02	2024-09-14 12:53:30.906+02	1	Sports_Interactive.png	https://en.wikipedia.org/wiki/Sports_Interactive	ADQUISITION	Adquirida por Sega en 2006	\N
192	Tengen	us	1987	f	1994	Disuelto por Warner Bros cuando decidió reestructurar en 1994. Su plantilla pasó a formar parte de Time Warner.	\N	\N	2024-09-12 15:12:31.673+02	2024-09-12 15:19:29.035+02	11	Tengen.png	https://es.wikipedia.org/wiki/Tengen	DIVISION	\N	\N
197	Domark	gb	1984	f	1994	Absorbida por Eidos	\N	\N	2024-09-14 13:00:43.537+02	2024-09-14 13:06:41.516+02	198	Domark.png	https://en.wikipedia.org/wiki/Eidos_Interactive#Founding_of_publisher_Domark_(1984%E2%80%931994)	ADQUISITION	Absorbida por Eidos que hasta aquel momento era una empresa de compresión de software, para pasar a ser una distribuidora de software.	\N
198	Eidos Interactive	gb	1995	f	2009	Disuelta por Square Enix cuando esta compró SCi		\N	2024-09-14 13:06:23.123+02	2024-09-14 13:12:46.034+02	199	Eidos_Interactive.png	https://es.wikipedia.org/wiki/Eidos_Interactive	ADQUISITION	Fundada tras la adquisición de Domark en 1994\nComprada por SCi en 2006	\N
199	SCi Games	gb	1988	f	2009	Comprada por Square Enix	The Sales Curve Limited (1988–1994)\nSales Curve Interactive	\N	2024-09-14 13:12:24.786+02	2024-09-14 13:13:03.013+02	15	SCi.png	https://es.wikipedia.org/wiki/SCi_Games	ADQUISITION	\N	\N
200	Sega AM2	jp	1992	t	\N	\N	Sega AM R&D Dept. #2\nSega Software R&D Dept #2 (AM2)\nAM2 of CRI\nSEGA-AM2 Co., Ltd.\nAM R&D Dept. #2\nSega R&D2\nSega Interactive R&D2	\N	2024-09-15 10:00:33.655+02	2024-09-15 10:01:05.505+02	1	Sega_AM2.png	https://es.wikipedia.org/wiki/Sega-AM2	DIVISION	\N	\N
201	Sumo Group	gb	2017	t	\N	\N	\N	\N	2024-09-15 10:26:59.469+02	2024-09-15 10:41:23.034+02	202	Sumo_Group.png	https://es.wikipedia.org/wiki/Sumo_Group	ADQUISITION	Fundada por Sumo Digital para funcionar como su empresa matriz.\nComprada en 2022 por Tencent.	\N
202	Tencent	cn	1998	t	\N	\N	\N	\N	2024-09-15 10:31:48.252+02	2024-09-15 10:43:08.436+02	\N	Tencent.png	https://es.wikipedia.org/wiki/Tencent	\N	\N	f
203	Sumo Digital	gb	2003	t	\N	\N	\N	\N	2024-09-15 10:46:09.137+02	2024-09-15 10:46:21.692+02	201	Sumo_Digital.png	https://es.wikipedia.org/wiki/Sumo_Digital	DIVISION	Fundada por exmiembros de Gremlin después de su adquisición y posterior cierre por parte de Infogrames	\N
205	Warner Bros. Games	us	2004	t	\N	\N	Warner Bros. Interactive Entertainment (2004–2021)	\N	2024-09-15 11:50:34.45+02	2024-09-15 11:50:41.944+02	64	Warner_Bros._Games.png	https://es.wikipedia.org/wiki/Warner_Bros._Games	DIVISION	\N	\N
204	NetherRealm Studios	us	2010	t	\N	\N	WB Games Chicago	\N	2024-09-15 11:45:38.705+02	2024-09-15 11:51:48.232+02	205	NetherRealm_Studios.png	https://es.wikipedia.org/wiki/NetherRealm_Studios	DIVISION	Con el cierre de Midway, Warnes Bros se quedó los assets y el equipo que hizo Mortal Kombat. Ese equipo lo renombró primero como WB Chicago y luego como NetherRealm	\N
206	Digital Pictures	us	1991	f	1996	Disolución	\N	\N	2024-09-15 13:25:46.576+02	2024-09-15 13:25:46.576+02	\N	Digital_Pictures.png	https://en.wikipedia.org/wiki/Digital_Pictures	\N	\N	\N
207	Toys For Bob	us	1989	t	\N	\N	\N	\N	2024-09-16 15:58:20.874+02	2024-09-16 15:58:20.874+02	\N	ToysForBob.png	https://es.wikipedia.org/wiki/Toys_for_Bob	\N	Adquiridos por Crystal Dynamics (1993–2000)\nIndependientes de 2000 al 2005\nAdquiridos por Activision (2005–2024)\nIndependientes de nuevo desde mayo de 2024	\N
208	Accolade	us	1984	f	2000	Disuelta por Infogrames	\N	\N	2024-09-16 16:03:43.56+02	2024-09-16 16:03:51.677+02	13	Accolade.png	https://es.wikipedia.org/wiki/Accolade	ADQUISITION	Adquirida por Infogrames en 1999	\N
219	Minakuchi Engineering	jp	1984	f	2002	Disolución	\N	\N	2024-09-20 10:47:46.659+02	2024-09-20 10:47:46.659+02	\N	Minakuchi_Engineering.jpg	https://en.wikipedia.org/wiki/Minakuchi_Engineering	\N	\N	\N
12	Atari SA	fr	2009	t	\N	\N	Infogrames Entertainment SA (1983–2009)	\N	2024-04-26 10:47:51.064+02	2024-09-16 16:09:16.666+02	\N	atari.png	https://es.wikipedia.org/wiki/Atari_SA	\N	En 2009 cambió de nombre de Infogrames a Atari SA, al adquirir la totalidad de Atari.\nEn 2013 entró en bancarrota teniendo que vender muchas de sus IPs para poder sobrevivir.	\N
209	Stardock	us	1991	t	\N	\N	\N	\N	2024-09-16 16:12:46.235+02	2024-09-16 16:17:17.935+02	\N	Stardock.jpg	https://en.wikipedia.org/wiki/Stardock	\N	Adquirió la franquicia Star Control en subasta, tras Atari SA (Infogrames) venderla tras su bancarrota en 2013, que previamente habia adquirido Accolade	\N
210	Aspect	jp	1991	f	2018	Bancarrota	\N	\N	2024-09-16 16:56:02.638+02	2024-09-16 16:56:02.638+02	\N	Aspect_Co.png	https://es.wikipedia.org/wiki/Aspect	\N	\N	\N
211	Microids	fr	1985	t	\N	\N	Microïds (1985–2003; 2007–2019)\nMC2-Microïds (2003–2005)\nMC2 (2005–2007)	\N	2024-09-17 16:09:28.647+02	2024-09-17 16:09:28.647+02	\N	Microids.png	https://es.wikipedia.org/wiki/Microids	\N	\N	\N
220	Sensible Software	gb	1986	f	1999	Disuelta por Codemasters	\N	\N	2024-09-20 16:26:00.71+02	2024-09-20 16:26:09.875+02	174	Sensible_Software.png	https://en.wikipedia.org/wiki/Sensible_Software	ADQUISITION	Comprada en 1999 por Codemaster	\N
230	Éditions Albert René	fr	1979	t	\N	\N	\N		2024-09-26 16:46:29.937+02	2024-09-26 16:46:29.937+02	\N	editions_albert_rene.jpg	https://en.wikipedia.org/wiki/%C3%89ditions_Albert_Ren%C3%A9	\N	\N	\N
222	JVCKenwood	jp	2008	t	\N	\N	\N	\N	2024-09-21 11:37:05.165+02	2024-09-21 11:37:05.165+02	\N	JVC_Kenwood.png	https://es.wikipedia.org/wiki/JVCKenwood	\N	\N	\N
213	Nordic Games	at	2011	f	2016	Cambió de nombre en 2016 al comprar todas las ips de THQ tras su bancarrota.	\N	\N	2024-09-18 15:46:22.018+02	2024-09-18 15:57:27.824+02	212	Nordic_Games.png	https://es.wikipedia.org/wiki/THQ_Nordic#Como_Nordic_Games_GmbH_(2011%E2%80%932016)	DIVISION	Creada como compañia sueca en 1994 tuvo bancarrota en 2004. Se refundó con el mismo nombre y en 2011 compro JoWooD y fundó esta subsidiaria en Austria. La empresa matriz permaneció en Suecia con un nuevo nombre Embracer.	\N
221	JVC	jp	1927	t	\N	\N	Japan Victor Company	\N	2024-09-21 11:34:35.255+02	2024-09-21 11:37:31.207+02	222	JVC.png	https://es.wikipedia.org/wiki/JVC	MERGE	Fusionada en 2008 con Kenwood para formar JVCKenwood	\N
214	Embracer Group	se	2011	t	\N	\N		\N	2024-09-18 15:50:19.85+02	2024-09-18 15:59:28.607+02	\N	Embracer_Group.png	https://es.wikipedia.org/wiki/Embracer_Group	\N	Fundada como Nordic Games en 1994. Sufrió una bancarrota en 2004. Volvió a crear la empresa y en 2011 la movió a Austria la publisher con el antiguo nombre y la empresa matriz se renombró a Embracer.	\N
215	THQ	us	1990	f	2013	Bancarrota	\N	\N	2024-09-18 16:03:47.119+02	2024-09-18 16:03:47.119+02	\N	THQ.png	https://es.wikipedia.org/wiki/THQ	\N	Sus ips fueron compradas por Nordic Games tras su bancarrota. La cual incluso cambió de nombre mas adelante a THQ Nordic para aprovechar la buena reputación de THQ.	\N
212	THQ Nordic	at	2016	t	\N	\N	Nordic Games GmbH (2011–2016)	\N	2024-09-18 15:41:32.621+02	2024-09-18 16:09:30.945+02	214	THQ_Nordic.png	https://es.wikipedia.org/wiki/THQ_Nordic	DIVISION	Fundada en 2011 como Nordic Games como subsidiaria de Embracer, fue renombrada a THQ tras la adquisición de las ips de THQ por Embracer.	\N
216	Westwood Studios	us	1985	f	2003	Cerrada por Electronic Arts	\N	\N	2024-09-18 16:28:06.279+02	2024-09-18 16:28:30.517+02	29	Westwood_Studios.png	https://es.wikipedia.org/wiki/Westwood_Studios	ADQUISITION	Propiedad de Virgin Interactive (1992-1998)\nPropiedad de Electronic Arts (1998-2003)	\N
217	Herbert Properties	us	1965	t	\N	\N	Herbert Limited Partnership	\N	2024-09-18 16:42:09.454+02	2024-09-18 16:42:09.454+02	\N	Herbert_Properties.png		\N	\N	\N
218	Cryo Interactive	fr	1990	f	2002	Bancarrota	\N	\N	2024-09-18 16:48:08.717+02	2024-09-18 16:48:20.758+02	\N	Cryo_Interactive.jpeg	https://es.wikipedia.org/wiki/Cryo_Interactive	\N	Tras su bancarrota sus assets acabaron primero en DreamCatcher y luego en Microids	\N
223	Kenwood	jp	1946	t	\N	\N	Kasuga Radio Co., Ltd. (1946–1986)	\N	2024-09-21 11:39:03.951+02	2024-09-21 11:39:11.859+02	222	Kenwood.png	https://es.wikipedia.org/wiki/Kenwood_Corporation	MERGE	Fusionada con JVC en 2011	\N
224	Dynamix	us	1984	f	2001	Disuelta por Sierra	\N	\N	2024-09-21 12:09:22.322+02	2024-09-21 12:09:30.359+02	25	Dynamix.jpg	https://en.wikipedia.org/wiki/Dynamix	ADQUISITION	Comprada por Sierra en 1990	\N
225	ICOM Simulations	us	1991	f	1998	Disolución	\N	\N	2024-09-21 13:03:05.748+02	2024-09-21 13:03:05.748+02	\N	ICOM_Simulations.png	https://en.wikipedia.org/wiki/ICOM_Simulations	\N	\N	\N
226	Looking Glass Studios	us	1990	f	2000	Disolución	\t\nBlue Sky Productions (1990–1992)\nLookingGlass Technologies, Inc. (1992–1997)	\N	2024-09-22 10:46:48.336+02	2024-09-22 10:46:55.112+02	\N	Looking_Glass_Studios.jpg	https://es.wikipedia.org/wiki/Looking_Glass_Studios	\N	\N	\N
227	Software Creations	gb	1985	f	2004	Disuelta por Acclaim	\N	\N	2024-09-22 12:49:33.017+02	2024-09-22 12:49:42.631+02	186	Software_Creations.png	https://en.wikipedia.org/wiki/Software_Creations	ADQUISITION	Comprada por Acclaim en 2002 	\N
231	Malibu Comics	us	1986	f	1994	Disuelta por Marvel	\N	\N	2024-09-27 09:04:00.939+02	2024-09-27 09:04:08.778+02	159	Malibu_Comics.png	https://en.wikipedia.org/wiki/Malibu_Comics	ADQUISITION	Fue una editora de comics que tuvo una pequeña sección de desarrollo de software llamado Malibu Interactive.\nComprada por Marvel en 1994	\N
228	Sony Imagesoft	us	1989	f	1995	Disuelto dentro de Sony Computer Entertainment	\N	\N	2024-09-22 13:44:36.725+02	2024-09-22 13:45:45.475+02	133	Sony_Imagesoft.png	https://es.wikipedia.org/wiki/Sony_Imagesoft	DIVISION	Distribuidora de juegos en USA	\N
229	Audiogenic	gb	1975	t	\N	\N	\N	\N	2024-09-24 15:45:34.71+02	2024-09-24 15:45:34.71+02	\N	Audiogenic.png	https://en.wikipedia.org/wiki/Audiogenic	\N	\N	\N
\.


--
-- Data for Name: Franchise_Franchises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Franchise_Franchises" (is_main, "createdAt", "updatedAt", id, "subFranchiseId", "parentFranchiseId") FROM stdin;
\N	2024-08-31 13:49:09.394+02	2024-08-31 13:49:09.394+02	3	149	148
\N	2024-09-06 16:20:24.227+02	2024-09-06 16:20:24.227+02	4	163	14
\N	2024-09-14 11:17:16.443+02	2024-09-14 11:17:16.443+02	5	178	14
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
\N	2024-07-17 19:55:39.023+02	2024-07-17 19:55:39.023+02	27	73
\N	2024-07-17 19:55:39.023+02	2024-07-17 19:55:39.023+02	67	73
\N	2024-07-18 17:03:07.618+02	2024-07-18 17:03:07.618+02	68	74
\N	2024-07-19 16:55:40.793+02	2024-07-19 16:55:40.793+02	69	76
\N	2024-07-21 11:33:12.467+02	2024-07-21 11:33:12.467+02	71	77
\N	2024-07-21 12:51:21.401+02	2024-07-21 12:51:21.401+02	73	78
\N	2024-07-21 12:51:21.401+02	2024-07-21 12:51:21.401+02	72	78
\N	2024-07-21 12:51:21.401+02	2024-07-21 12:51:21.401+02	74	78
\N	2024-07-21 12:51:21.401+02	2024-07-21 12:51:21.401+02	32	78
\N	2024-07-21 13:43:18.444+02	2024-07-21 13:43:18.444+02	75	79
\N	2024-07-22 15:22:25.598+02	2024-07-22 15:22:25.598+02	66	80
\N	2024-07-22 16:39:35.063+02	2024-07-22 16:39:35.063+02	76	82
\N	2024-07-23 16:07:04.419+02	2024-07-23 16:07:04.419+02	77	83
\N	2024-07-27 13:21:18.223+02	2024-07-27 13:21:18.223+02	62	89
\N	2024-07-28 12:02:11.906+02	2024-07-28 12:02:11.906+02	82	92
\N	2024-07-28 12:30:39.36+02	2024-07-28 12:30:39.36+02	83	93
\N	2024-07-28 22:52:46.588+02	2024-07-28 22:52:46.588+02	63	95
\N	2024-07-29 20:51:09.063+02	2024-07-29 20:51:09.063+02	84	96
\N	2024-07-30 16:32:37.132+02	2024-07-30 16:32:37.132+02	85	97
\N	2024-07-31 16:06:26.411+02	2024-07-31 16:06:26.411+02	86	98
\N	2024-07-31 16:06:26.411+02	2024-07-31 16:06:26.411+02	87	98
\N	2024-08-01 15:46:34.256+02	2024-08-01 15:46:34.256+02	88	99
\N	2024-08-01 16:38:27.493+02	2024-08-01 16:38:27.493+02	89	100
\N	2024-08-01 16:38:27.493+02	2024-08-01 16:38:27.493+02	1	100
\N	2024-08-01 16:38:27.493+02	2024-08-01 16:38:27.493+02	77	100
\N	2024-08-02 11:24:16.308+02	2024-08-02 11:24:16.308+02	66	103
\N	2024-08-02 12:29:38.007+02	2024-08-02 12:29:38.007+02	62	106
\N	2024-08-03 13:31:05.691+02	2024-08-03 13:31:05.691+02	46	110
\N	2024-08-06 16:28:18.186+02	2024-08-06 16:28:18.186+02	92	113
\N	2024-08-11 11:53:35.934+02	2024-08-11 11:53:35.934+02	93	121
\N	2024-08-11 12:19:59.927+02	2024-08-11 12:19:59.927+02	94	122
\N	2024-08-11 13:46:46.883+02	2024-08-11 13:46:46.883+02	95	124
\N	2024-08-12 15:40:27.954+02	2024-08-12 15:40:27.954+02	96	125
\N	2024-08-22 16:16:02.443+02	2024-08-22 16:16:02.443+02	98	133
\N	2024-08-22 17:03:32.86+02	2024-08-22 17:03:32.86+02	99	134
\N	2024-08-23 09:35:37.084+02	2024-08-23 09:35:37.084+02	90	135
\N	2024-08-23 16:02:22.894+02	2024-08-23 16:02:22.894+02	100	136
\N	2024-08-24 11:14:58.889+02	2024-08-24 11:14:58.889+02	101	137
\N	2024-08-24 13:23:43.67+02	2024-08-24 13:23:43.67+02	84	139
\N	2024-08-25 11:36:35.969+02	2024-08-25 11:36:35.969+02	27	140
\N	2024-08-25 11:36:35.969+02	2024-08-25 11:36:35.969+02	103	140
\N	2024-08-28 17:20:54.045+02	2024-08-28 17:20:54.045+02	104	143
\N	2024-08-29 17:06:42.008+02	2024-08-29 17:06:42.008+02	105	144
\N	2024-08-30 09:18:20.201+02	2024-08-30 09:18:20.201+02	73	146
\N	2024-08-31 11:31:57.17+02	2024-08-31 11:31:57.17+02	109	147
\N	2024-09-01 12:34:08.648+02	2024-09-01 12:34:08.648+02	111	151
\N	2024-09-02 15:36:09.403+02	2024-09-02 15:36:09.403+02	63	152
\N	2024-09-04 15:20:31.65+02	2024-09-04 15:20:31.65+02	90	154
\N	2024-09-04 16:50:24.705+02	2024-09-04 16:50:24.705+02	37	155
\N	2024-09-04 16:50:24.705+02	2024-09-04 16:50:24.705+02	38	155
\N	2024-09-08 10:48:54.264+02	2024-09-08 10:48:54.264+02	75	167
\N	2024-09-11 17:23:09.427+02	2024-09-11 17:23:09.427+02	116	174
\N	2024-09-12 16:28:19.236+02	2024-09-12 16:28:19.236+02	117	176
\N	2024-09-13 13:26:25.096+02	2024-09-13 13:26:25.096+02	120	177
\N	2024-09-14 11:16:57.771+02	2024-09-14 11:16:57.771+02	27	178
\N	2024-09-14 11:16:57.771+02	2024-09-14 11:16:57.771+02	80	178
\N	2024-09-14 11:16:57.771+02	2024-09-14 11:16:57.771+02	121	178
\N	2024-09-14 13:25:26.076+02	2024-09-14 13:25:26.076+02	123	179
\N	2024-09-14 13:25:26.076+02	2024-09-14 13:25:26.076+02	122	179
\N	2024-09-15 11:56:26.768+02	2024-09-15 11:56:26.768+02	124	182
\N	2024-09-15 11:56:26.768+02	2024-09-15 11:56:26.768+02	125	182
\N	2024-09-16 16:15:31.689+02	2024-09-16 16:15:31.689+02	127	183
\N	2024-09-16 16:15:31.689+02	2024-09-16 16:15:31.689+02	126	183
\N	2024-09-17 15:56:37.414+02	2024-09-17 15:56:37.414+02	128	184
\N	2024-09-18 16:08:07.057+02	2024-09-18 16:08:07.057+02	129	185
\N	2024-09-20 16:31:11.827+02	2024-09-20 16:31:11.827+02	130	188
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
15	Joust	joust.png	1982-07-16	\N	2024-05-26 13:31:53.402+02	2024-09-15 11:52:21.724+02	205	27	\N	\N
14	Mario	Mario.png	1983-07-14	#ee1c25	2024-05-24 18:46:53.968+02	2024-05-24 18:47:04.982+02	32	\N	https://es.wikipedia.org/wiki/Mario_(franquicia)	t
13	Donkey Kong	donkeykong.png	1981-06-09	#663605	2024-05-24 18:40:03.405+02	2024-07-31 16:07:56.125+02	32	\N	https://es.wikipedia.org/wiki/Donkey_Kong_(serie)	f
8	Pac-Man	pacman.png	1980-05-22	#ed6b0e	2024-05-03 08:23:14.569+02	2024-07-28 22:54:45.347+02	19	18	https://en.wikipedia.org/wiki/List_of_Pac-Man_video_games	f
38	Gauntlet	gauntlet.jpeg	1985-10-15	\N	2024-06-26 16:42:48.936+02	2024-09-15 11:53:31.09+02	205	11	\N	\N
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
55	Spy Hunter	spy_hunter.jpeg	1983-11-01	\N	2024-07-06 20:04:27.123+02	2024-09-15 11:52:52.784+02	205	17	https://es.wikipedia.org/wiki/Spy_Hunter	\N
56	Xevious	xevious.png	1983-01-01	\N	2024-07-07 11:26:14.84+02	2024-07-07 11:26:38.599+02	19	18	https://en.wikipedia.org/wiki/List_of_Xevious_media	\N
58	Archon	archon.png	1983-01-01	\N	2024-07-07 12:56:29.762+02	2024-07-07 12:56:55.554+02	81	\N	\N	\N
59	Bomberman	Bomberman.png	1983-07-01	\N	2024-07-07 18:59:34.459+02	2024-07-07 19:07:54.102+02	30	68	https://es.wikipedia.org/wiki/Bomberman	f
60	Wolfenstein	Wolfenstein.png	1981-09-01	\N	2024-07-07 19:45:47.07+02	2024-08-06 16:18:54.468+02	116	83	https://en.wikipedia.org/wiki/Wolfenstein	\N
61	Tron	tron.png	1982-05-01	\N	2024-07-08 16:24:28.532+02	2024-07-08 16:24:39.301+02	74	\N	https://en.wikipedia.org/wiki/Tron_(franchise)	\N
62	Lode Runner	lode_runner.jpeg	1983-06-23	\N	2024-07-08 16:44:35.479+02	2024-07-08 16:44:57.62+02	89	87	\N	\N
63	19xx	19xx.png	1984-11-30	\N	2024-07-09 15:33:09.003+02	2024-07-09 15:34:01.994+02	61	\N	\N	\N
64	Yie Ar Kung-Fu	Yie_Ar_Kung-Fu.jpeg	1984-10-25	\N	2024-07-09 16:58:44.588+02	2024-07-09 16:59:05.834+02	30	\N	\N	\N
65	Marble Madness	MarbleMadness.png	1984-12-15	\N	2024-07-10 16:37:27.386+02	2024-09-15 11:53:54.805+02	205	11	\N	\N
66	Ballon Fight	ballon_fight.png	1984-11-01	\N	2024-07-10 21:20:24.522+02	2024-07-10 21:21:09.53+02	32	\N	\N	\N
4	Space Invaders	Space_invaders.png	1978-04-01	#02073f	2024-04-28 11:35:45.283+02	2024-07-23 16:03:32.578+02	14	\N	https://es.wikipedia.org/wiki/Space_Invaders_(serie)	f
67	Ghosts 'n Goblins	ghostsngoblins.jpeg	1985-09-19	\N	2024-07-11 16:10:27.109+02	2024-07-11 16:17:00.236+02	61	\N	https://en.wikipedia.org/wiki/Ghosts_%27n_Goblins	\N
69	Space Harrier	Space_Harrier.jpeg	1985-10-02	\N	2024-07-12 13:20:22.041+02	2024-07-12 13:20:27.14+02	1	\N	\N	\N
70	Excitebike	excitebike.png	1984-11-30	\N	2024-07-15 12:25:39.553+02	2024-07-15 12:25:44.295+02	32	\N	\N	\N
71	Paperboy	Paperboy.jpeg	1985-02-01	\N	2024-07-16 16:27:24.872+02	2024-09-15 11:54:15.037+02	205	11	\N	\N
72	Ikari	ikari.jpeg	1986-02-19	\N	2024-07-17 16:26:41.768+02	2024-07-17 16:26:49.218+02	96	\N	\N	\N
91	R-Type	R-Type.jpg	1987-07-01	\N	2024-07-28 11:28:13.517+02	2024-07-28 11:31:31.053+02	92	\N	https://en.wikipedia.org/wiki/List_of_R-Type_video_games	\N
73	The Legend of Zelda	The_Legend_of_Zelda.png	1986-02-21	#026012	2024-07-17 19:55:06.163+02	2024-07-17 19:55:22.928+02	32	\N	https://es.wikipedia.org/wiki/The_Legend_of_Zelda	t
92	Leisure Suit Larry	Leisure_Suit_Larry.jpg	1987-07-05	\N	2024-07-28 12:01:56.397+02	2024-07-28 12:02:06.183+02	\N	25	https://es.wikipedia.org/wiki/Leisure_Suit_Larry	\N
74	Wonder Boy	Wonder_Boy.jpg	1986-03-03	\N	2024-07-18 16:41:31.995+02	2024-07-18 16:41:54.211+02	1	97	https://en.wikipedia.org/wiki/Wonder_Boy	\N
75	Arkanoid	Arkanoid.png	1986-04-26	\N	2024-07-19 15:38:11.95+02	2024-07-19 15:38:22.622+02	14	\N	\N	\N
93	Metal Gear	Metal_Gear.png	1987-07-13	#505050	2024-07-28 12:30:20.694+02	2024-07-28 12:30:33.036+02	30	\N	https://es.wikipedia.org/wiki/Metal_Gear	t
76	Dragon Quest	Dragon_quest.png	1986-05-27	#af382f	2024-07-19 16:55:07.285+02	2024-07-19 16:59:24.715+02	15	70	https://es.wikipedia.org/wiki/Dragon_Quest	t
77	Bubble Bobble	Bubble_Bobble.png	1986-06-16	\N	2024-07-21 11:32:56.999+02	2024-07-21 11:33:05.989+02	14	\N	https://es.wikipedia.org/wiki/Bubble_Bobble_(serie)	\N
78	Metroid	Metroid.png	1986-08-06	#bf191e	2024-07-21 12:50:29.788+02	2024-07-21 12:50:37.626+02	32	\N	https://es.wikipedia.org/wiki/Metroid	t
79	Starflight	Starflight.png	1986-08-15	\N	2024-07-21 13:43:03.358+02	2024-07-21 13:43:11.462+02	29	\N	\N	\N
80	OutRun	outrun.png	1986-09-04	\N	2024-07-22 15:22:11.039+02	2024-07-22 15:22:19.212+02	1	\N	\N	\N
94	Operation Wolf	Operation-wolf.jpg	1987-07-16	\N	2024-07-28 13:03:01.349+02	2024-07-28 13:03:14.008+02	14	\N	\N	\N
81	Adventure Island	AdventureIsland.jpg	1986-09-12	\N	2024-07-22 15:50:18.876+02	2024-07-22 15:50:32.817+02	30	68	\N	\N
103	After Burner	after_burner.jpg	1987-07-17	\N	2024-08-02 11:24:02.658+02	2024-08-02 11:24:10.978+02	1	\N	\N	\N
83	Alex Kidd	Alex-Kidd.jpg	1986-11-01	\N	2024-07-23 16:02:05.458+02	2024-07-23 16:03:10.604+02	1	\N	https://en.wikipedia.org/wiki/Alex_Kidd	\N
84	Kid Icarus	Kid_Icarus.png	1986-12-19	\N	2024-07-23 16:31:54.711+02	2024-07-23 16:32:00.041+02	32	\N	https://en.wikipedia.org/wiki/Kid_Icarus_(series)	\N
85	Family Stadium	Family_Stadium.png	1986-12-10	\N	2024-07-24 15:33:58.595+02	2024-07-24 15:34:33.26+02	19	18	https://en.wikipedia.org/wiki/Family_Stadium	\N
86	Dragon Ball	Dragon_Ball.png	1986-09-27	\N	2024-07-25 17:02:21.183+02	2024-07-25 17:02:33.485+02	19	\N	https://es.wikipedia.org/wiki/Anexo:Videojuegos_de_Dragon_Ball	\N
87	Batman	batman.jpg	1986-01-01	#505c7c	2024-07-26 09:18:09.75+02	2024-07-26 09:18:43.526+02	65	\N	https://es.wikipedia.org/wiki/Anexo:Videojuegos_de_Batman#Videojuegos_protagonizados_por_Batman	\N
88	Contra	Contra.png	1987-02-20	\N	2024-07-27 12:52:57.847+02	2024-07-27 12:53:03.862+02	30	\N	https://es.wikipedia.org/wiki/Contra_(serie)	\N
89	Double Dragon	Double_Dragon.png	1987-04-22	\N	2024-07-27 13:21:11.716+02	2024-07-27 13:21:33.615+02	105	91	https://es.wikipedia.org/wiki/Double_Dragon_(serie)	\N
90	Ys	Ys.png	1987-06-21	\N	2024-07-27 14:08:08.803+02	2024-07-27 14:08:22.5+02	106	\N	https://es.wikipedia.org/wiki/Ys_(serie)	\N
96	Maniac Mansion	maniac_mansion.png	1987-10-05	\N	2024-07-29 20:51:02.237+02	2024-07-29 20:51:24.038+02	107	\N	\N	\N
97	Dungeon Master	Dungeon_Master.png	1987-12-15	\N	2024-07-30 16:32:30.137+02	2024-07-30 16:35:15.63+02	108	\N	\N	\N
104	Shinobi	Shinobi.png	1987-11-16	\N	2024-08-02 11:44:51.126+02	2024-08-02 11:45:16.86+02	1	\N	https://es.wikipedia.org/wiki/Shinobi_(serie)	\N
99	Final Fantasy	Final_Fantasy.png	1987-12-18	#5499b5	2024-08-01 15:46:05.505+02	2024-08-01 15:46:27.384+02	15	109	https://es.wikipedia.org/wiki/Final_Fantasy_(franquicia)	t
95	Street Fighter	Street_Fighter.png	1987-08-30	#ff7600	2024-07-28 22:52:06.491+02	2024-08-01 15:48:42.124+02	61	\N	https://es.wikipedia.org/wiki/Street_Fighter	t
82	Castlevania	Castlevania.png	1986-09-26	\N	2024-07-22 16:38:24.279+02	2024-08-01 15:49:15.332+02	30	\N	https://es.wikipedia.org/wiki/Castlevania	f
100	Phantasy Star	Phantasy_Star.png	1987-12-20	\N	2024-08-01 16:37:50.168+02	2024-08-01 16:38:36.481+02	1	\N	https://es.wikipedia.org/wiki/Phantasy_Star	\N
101	The Last Ninja	the_last_ninja.png	1987-01-08	\N	2024-08-02 09:04:55.265+02	2024-08-02 09:08:57.154+02	110	\N	https://en.wikipedia.org/wiki/Last_Ninja	\N
105	Fantasy Zone	Fantasy_zone.jpg	1986-03-28	\N	2024-08-02 12:08:03.785+02	2024-08-02 12:09:53.253+02	1	\N	\N	\N
102	Final Lap	final_lap.jpg	1987-09-01	\N	2024-08-02 11:04:08.358+02	2024-08-02 11:04:47.848+02	19	18	\N	\N
106	Kunio-kun	Kuniokun.jpg	1986-05-01	\N	2024-08-02 12:29:24.002+02	2024-08-02 12:31:09.284+02	105	91	https://es.wikipedia.org/wiki/Kunio-kun	\N
107	R.C. Pro-Am	rc_pro-am.jpg	1988-03-01	\N	2024-08-03 11:28:33.386+02	2024-08-03 11:28:42.476+02	48	\N	\N	\N
108	Madden NFL	Madden_NFL.png	1988-06-01	\N	2024-08-03 12:12:00.775+02	2024-08-03 12:12:24.19+02	112	\N	https://es.wikipedia.org/wiki/Madden_NFL	\N
109	Altered Beast	Alteredbeast.jpg	1988-06-14	\N	2024-08-03 13:00:59.943+02	2024-08-03 13:01:07.519+02	1	\N	\N	\N
110	Bionic Commando	Bionic-Commando.jpg	1988-07-20	\N	2024-08-03 13:27:56.561+02	2024-08-03 13:28:44.471+02	61	\N	https://en.wikipedia.org/wiki/Bionic_Commando	\N
115	Chase H.Q.	CHASEHQ.jpg	1988-11-01	\N	2024-08-08 16:00:35.747+02	2024-08-08 16:00:44.219+02	14	\N	\N	\N
112	Winning Run	winning_run.png	1988-12-01	\N	2024-08-05 16:54:06.282+02	2024-08-05 16:54:47.782+02	19	18	\N	\N
111	Splatterhouse	splatterhouse.png	1988-11-01	\N	2024-08-05 16:14:50.832+02	2024-08-05 16:15:47.239+02	19	18	\N	\N
116	Thunder Blade	thunder_blade.jpg	1987-12-01	\N	2024-08-09 11:21:53.668+02	2024-08-09 11:22:56.716+02	1	\N	\N	\N
113	Ninja Gaiden	Ninja_Gaiden.png	1988-12-06	\N	2024-08-06 16:25:56.73+02	2024-08-06 16:28:03.319+02	117	113	https://es.wikipedia.org/wiki/Ninja_Gaiden	f
114	RoboCop	robocop.png	1988-01-01	\N	2024-08-07 16:14:19.053+02	2024-08-07 16:14:41.864+02	118	\N	https://en.wikipedia.org/wiki/List_of_RoboCop_video_games	\N
117	Speedball	speedball.jpg	1988-01-01	\N	2024-08-09 11:49:14.206+02	2024-08-09 11:49:21.901+02	119	\N	\N	\N
118	Golden Axe	Golden_Axe.png	1989-01-27	\N	2024-08-10 11:14:52.514+02	2024-08-10 11:15:31.992+02	1	\N	https://es.wikipedia.org/wiki/Saga_Golden_Axe	\N
119	Teenage Mutant Ninja Turtles	Teenage-Mutant-Ninja-Turtles.png	1989-05-12	#38761d	2024-08-10 12:01:38.456+02	2024-08-10 12:10:43.161+02	120	\N	https://en.wikipedia.org/wiki/List_of_Teenage_Mutant_Ninja_Turtles_video_games	\N
120	Pipe Mania	pipe_mania.jpeg	1989-06-01	\N	2024-08-10 13:15:58.024+02	2024-08-10 13:16:23.481+02	121	\N	\N	\N
121	Populous	populous.jpg	1989-03-01	\N	2024-08-11 11:53:08.643+02	2024-08-11 11:53:29.486+02	29	122	https://es.wikipedia.org/wiki/Populous_(serie)	\N
122	Mother	Mother.png	1989-07-27	\N	2024-08-11 12:19:44.479+02	2024-08-11 12:19:53.271+02	32	\N	https://es.wikipedia.org/wiki/EarthBound_(serie)	\N
123	DuckTales	ducktales.jpg	1989-09-14	\N	2024-08-11 13:05:48.913+02	2024-08-11 13:06:00.372+02	74	\N	\N	\N
98	Mega Man	Mega_Man.png	1987-12-17	#0400f8	2024-07-31 16:05:45.328+02	2024-08-11 13:46:09.707+02	61	\N	https://es.wikipedia.org/wiki/Mega_Man	f
68	Hang-On	Hang-On.png	1985-07-02	\N	2024-07-12 09:14:03.631+02	2024-08-26 15:27:35.444+02	1	\N	\N	\N
125	SimCity	SimCity.png	1989-02-02	\N	2024-08-12 15:40:20.856+02	2024-09-08 11:31:42.765+02	125	\N	https://es.wikipedia.org/wiki/SimCity	\N
126	Bonk	Bonk.jpg	1989-12-15	\N	2024-08-12 17:01:45.407+02	2024-08-12 17:02:06.033+02	30	68	https://en.wikipedia.org/wiki/Bonk_(series)	\N
127	Monaco GP	monaco-gp.jpg	1979-11-01	\N	2024-08-13 16:38:46.035+02	2024-08-13 16:38:55.613+02	1	\N	\N	\N
128	Final Fight	Final_Fight.png	1989-12-01	\N	2024-08-14 16:31:03.98+02	2024-08-14 16:31:29.528+02	61	\N	https://es.wikipedia.org/wiki/Anexo:Personajes_de_Final_Fight	\N
129	Strider Hiryu	Strider_hiryu.jpg	1989-03-07	\N	2024-08-18 13:21:20.464+02	2024-08-18 13:22:03.277+02	61	\N	\N	\N
130	Super Off Road	super_off_road.jpg	1989-01-01	\N	2024-08-18 14:06:46.297+02	2024-08-18 14:06:57.149+02	129	\N	\N	\N
131	Indiana Jones	indiana_jones.png	1982-11-01	\N	2024-08-19 14:00:55.104+02	2024-08-19 14:01:04.12+02	74	\N	https://es.wikipedia.org/wiki/Anexo:Videojuegos_de_Indiana_Jones	\N
149	Gold Box - Dungeons & Dragons	gold_box_dungeons_and_dragons.jpg	1988-06-01	\N	2024-08-31 13:48:42.764+02	2024-08-31 13:49:01.445+02	145	\N	https://en.wikipedia.org/wiki/Gold_Box	\N
132	Shadow of the Beast	shadow_of_the_beast.png	1989-01-01	\N	2024-08-22 15:31:32.137+02	2024-08-22 15:31:56.797+02	133	132		\N
133	Kick Off	Kick_Off.png	1989-01-01	\N	2024-08-22 16:15:51.073+02	2024-08-22 16:15:57.894+02	134	\N	https://en.wikipedia.org/wiki/Kick_Off_(series)	\N
134	SaGa	SaGa.png	1989-12-15	\N	2024-08-22 17:03:15.723+02	2024-08-22 17:03:42.401+02	15	109	https://es.wikipedia.org/wiki/SaGa_(serie_de_videojuegos)	\N
150	Road Rash	Road_Rash.png	1991-09-01	\N	2024-09-01 10:35:14.706+02	2024-09-01 10:35:22.838+02	29	\N	https://es.wikipedia.org/wiki/Road_Rash	\N
135	Railroad Tycoon	Railroad_Tycoon.png	1990-01-01	\N	2024-08-23 09:35:28.283+02	2024-08-23 10:37:22.994+02	136	111	https://en.wikipedia.org/wiki/Railroad_Tycoon	\N
136	Fire Emblem	Fire_Emblem.png	1990-04-20	\N	2024-08-23 16:01:49.066+02	2024-08-23 16:02:13.946+02	32	101	https://es.wikipedia.org/wiki/Fire_Emblem	\N
151	Another World	Another_World.png	1991-11-01	\N	2024-09-01 12:33:48.914+02	2024-09-01 12:33:55.851+02	148	\N	\N	\N
137	Wing Commander	Wing_Commander.png	1990-09-26	\N	2024-08-24 11:14:51.776+02	2024-08-24 11:15:15.656+02	29	28	https://en.wikipedia.org/wiki/Wing_Commander_(franchise)	\N
138	Columns	Columns.jpg	1990-03-01	\N	2024-08-24 12:01:42.352+02	2024-08-24 12:01:51.93+02	1	\N	\N	\N
152	Fatal Fury	Fatalfury.png	1991-11-25	\N	2024-09-02 15:35:53.139+02	2024-09-02 15:36:00.66+02	96	\N	https://es.wikipedia.org/wiki/Fatal_Fury_(serie)	\N
124	Prince of Persia	Prince_of_Persia.png	1989-10-03	\N	2024-08-11 13:37:22.54+02	2024-08-24 13:24:47.046+02	124	87	https://es.wikipedia.org/wiki/Prince_of_Persia	f
139	Monkey Island	Monkey_Island.png	1990-10-01	\N	2024-08-24 13:23:34.262+02	2024-08-24 13:24:54.494+02	107	\N	https://es.wikipedia.org/wiki/Monkey_Island	t
140	F-Zero	F-Zero.png	1990-11-21	\N	2024-08-25 11:36:10.814+02	2024-08-25 11:36:17.842+02	32	\N	https://es.wikipedia.org/wiki/F-Zero	\N
141	Pang	pang.png	1989-11-01	\N	2024-08-25 13:36:35.653+02	2024-08-25 13:36:48.979+02	137	\N	\N	\N
142	Mickey Mouse & Friends	Mickey_Mouse_&_Friends.png	1981-01-01	#f20505	2024-08-28 16:01:11.261+02	2024-08-28 16:01:35.863+02	74	\N	https://en.wikipedia.org/wiki/List_of_Mickey_Mouse_universe_media#Mickey_Mouse_games	\N
143	Shin Megami Tensei	ShinMegamiTensei.jpg	1987-09-11	\N	2024-08-28 17:18:01.728+02	2024-08-28 17:21:01.222+02	126	\N	https://es.wikipedia.org/wiki/Megami_Tensei	\N
144	Rick Dangerous	rick_dangerous.png	1989-01-01	\N	2024-08-29 17:06:23.449+02	2024-08-29 17:06:30.493+02	139	\N	https://es.wikipedia.org/wiki/Rick_Dangerous	\N
145	PGA Tour	PGA_Tour.jpg	1990-12-01	\N	2024-08-30 07:53:10.942+02	2024-08-30 07:53:24.757+02	112	\N	https://es.wikipedia.org/wiki/PGA_Tour_(serie_de_videojuegos)	\N
146	Famicom Detective Club	Famicom_Detective_Club.png	1988-04-27	\N	2024-08-30 09:16:45.478+02	2024-08-30 09:17:02.379+02	32	\N	\N	\N
153	Tecmo Bowl	tecmo_bowl.png	1987-12-01	\N	2024-09-03 17:19:59.418+02	2024-09-03 17:20:09.013+02	113	\N	\N	\N
147	Lemmings	Lemmings.jpg	1991-02-14	\N	2024-08-31 11:31:45.97+02	2024-08-31 11:32:13.69+02	133	132	\N	\N
148	Dungeons & Dragons	Dungeons_&_Dragons.png	1988-06-01	\N	2024-08-31 12:24:20.941+02	2024-08-31 12:24:41.638+02	144	\N	https://es.wikipedia.org/wiki/Anexo:Videojuegos_de_Dungeons_%26_Dragons	\N
161	The Simpsons	The_Simpsons.png	1991-03-01	\N	2024-09-06 12:39:21.035+02	2024-09-06 12:39:30.255+02	158	\N	https://es.wikipedia.org/wiki/Anexo:Videojuegos_de_Los_Simpson	\N
162	Spider-Man	Spider-Man.png	1982-11-01	#ac0202	2024-09-06 13:21:24.127+02	2024-09-06 13:21:47.043+02	159	\N	https://es.wikipedia.org/wiki/Anexo:Videojuegos_de_Spider-Man	\N
154	Civilization	Civilization.png	1991-09-01	\N	2024-09-04 15:20:22.255+02	2024-09-04 15:22:07.365+02	136	111	https://es.wikipedia.org/wiki/Civilization_(serie)	f
155	Battletoads	Battletoads.png	1991-06-01	\N	2024-09-04 16:50:12.182+02	2024-09-04 16:50:17.398+02	48	\N	https://es.wikipedia.org/wiki/Battletoads_(franquicia)	\N
156	Duke Nukem	DukeNukem.png	1991-07-01	\N	2024-09-05 16:59:07.98+02	2024-09-05 16:59:57.78+02	153	150	https://es.wikipedia.org/wiki/Duke_Nukem_(serie)	\N
157	Streets of Rage	Streets_of_Rage.png	1991-08-02	\N	2024-09-05 17:25:05.459+02	2024-09-05 17:25:20.667+02	1	\N	https://es.wikipedia.org/wiki/Streets_of_Rage	\N
158	Heimdall	heimdall.jpg	1991-01-01	\N	2024-09-06 08:44:41.539+02	2024-09-06 08:44:55.684+02	139	\N	\N	\N
168	Micro Machines	Micro_Machines.png	1991-01-01	\N	2024-09-08 11:49:59.158+02	2024-09-08 11:50:07.099+02	174	\N	https://es.wikipedia.org/wiki/Micro_Machines_(serie_de_videojuegos)	\N
159	Raiden	Raiden.png	1990-04-01	\N	2024-09-06 09:20:05.592+02	2024-09-06 09:20:18.466+02	157	156	https://es.wikipedia.org/wiki/Raiden_(series)	\N
160	Darius	Darius.png	1987-02-01	\N	2024-09-06 10:06:04.791+02	2024-09-06 10:07:33.744+02	14	\N	https://en.wikipedia.org/wiki/Darius_(series)	\N
163	Yoshi	Yoshi.png	1991-12-14	#6fd251	2024-09-06 16:19:24.239+02	2024-09-06 16:20:08.086+02	32	\N	https://en.wikipedia.org/wiki/List_of_Yoshi_video_games	\N
164	Ganbare Goemon	Ganbare_Goemon.png	1986-05-01	\N	2024-09-06 16:42:24.897+02	2024-09-06 16:42:37.83+02	30	\N	https://es.wikipedia.org/wiki/Ganbare_Goemon	\N
165	Lotus	Lotus.png	1990-01-01	\N	2024-09-07 12:08:06.68+02	2024-09-07 12:08:24.538+02	164	163	https://es.wikipedia.org/wiki/Lotus_(serie)	\N
169	McDonald's	McDonald's.png	1988-01-29	\N	2024-09-10 15:39:17.128+02	2024-09-10 15:41:29.217+02	179	\N	\N	\N
166	James Pond	james_pond.jpg	1990-12-01	\N	2024-09-08 09:21:39.29+02	2024-09-08 09:22:11.344+02	110	166	\N	\N
167	ToeJam & Earl	toejam&earl.png	1991-10-01	\N	2024-09-08 10:47:02.61+02	2024-09-08 10:47:25.174+02	173	172	\N	\N
170	Star Trek	Star_Trek.png	1971-01-01	\N	2024-09-10 16:32:02.417+02	2024-09-10 16:32:21.127+02	120	\N	https://en.wikipedia.org/wiki/List_of_Star_Trek_games#Video_games	\N
171	Tiny Toon Adventures	Tiny_Toon_Adventures.png	1991-12-01	\N	2024-09-11 10:31:41.552+02	2024-09-11 10:34:17.649+02	64	\N	https://en.wikipedia.org/wiki/List_of_Tiny_Toon_Adventures_video_games	\N
172	Strike	strike.jpg	1992-03-01	\N	2024-09-11 11:58:50.382+02	2024-09-11 11:58:57.275+02	29	\N	https://en.wikipedia.org/wiki/Strike_(video_game_series)	\N
173	Terminator	Terminator.png	1990-01-01	\N	2024-09-11 13:05:54.489+02	2024-09-11 13:06:21.5+02	188	\N	https://es.wikipedia.org/wiki/Anexo:Videojuegos_de_Terminator	\N
174	Shining	shining.jpg	1991-03-29	\N	2024-09-11 17:13:31.55+02	2024-09-11 17:14:33.8+02	1	\N	https://es.wikipedia.org/wiki/Shining_(serie_de_videojuegos)	\N
175	Puyo Puyo	Puyo_Puyo.png	1991-10-25	\N	2024-09-12 16:07:45.541+02	2024-09-12 16:09:33.488+02	1	193	https://es.wikipedia.org/wiki/Puyo_Puyo_(serie)	\N
176	Kirby	Kirby.png	1992-04-27	#df6da9	2024-09-12 16:27:56.656+02	2024-09-12 16:34:46.026+02	32	161	https://es.wikipedia.org/wiki/Kirby_(serie)	f
177	Ecco the Dolphin	Eccothedolphin.jpg	1992-07-31	\N	2024-09-13 13:25:12.652+02	2024-09-13 13:26:14.094+02	1	195	https://es.wikipedia.org/wiki/Ecco_the_Dolphin	\N
178	Mario Kart	Mario_Kart.png	1992-08-27	#ee1c25	2024-09-14 11:16:26.483+02	2024-09-14 11:17:50.284+02	32	\N	https://es.wikipedia.org/wiki/Mario_Kart	\N
179	Championship Manager	Championship_Manager.png	1992-05-15	\N	2024-09-14 13:25:14.434+02	2024-09-14 13:25:39.282+02	15	196	https://en.wikipedia.org/wiki/Championship_Manager	\N
180	Art of Fighting	art_of_fighting.jpg	1992-09-24	\N	2024-09-15 09:25:17.032+02	2024-09-15 09:27:31.836+02	96	\N	https://es.wikipedia.org/wiki/Art_of_Fighting_(serie)	\N
181	Zool	zool.jpg	1992-10-01	\N	2024-09-15 10:48:07.074+02	2024-09-15 10:48:40.12+02	203	164	\N	\N
182	Mortal Kombat	Mortal_Kombat.png	1992-10-08	\N	2024-09-15 11:56:11+02	2024-09-15 11:56:48.073+02	204	17	https://es.wikipedia.org/wiki/Mortal_Kombat_(franquicia)	f
183	Star Control	star_control.jpg	1990-07-01	\N	2024-09-16 16:15:21.989+02	2024-09-16 16:15:46.843+02	209	208	\N	\N
184	Flashback	flashback.jpg	1992-11-01	\N	2024-09-17 15:56:29.901+02	2024-09-17 16:10:01.599+02	211	148	\N	\N
185	Alone in the Dark	Alone_in_the_dark.png	1992-11-01	\N	2024-09-18 16:07:58.373+02	2024-09-18 16:08:23.515+02	212	13	https://es.wikipedia.org/wiki/Alone_in_the_Dark_(serie)	\N
186	Dune	Dune.png	1992-01-01	\N	2024-09-18 16:43:27.431+02	2024-09-18 16:44:20.444+02	217	\N	https://en.wikipedia.org/wiki/List_of_games_based_on_Dune	f
187	Lethal Enforcers	lethal_enforcers.jpg	1992-10-08	\N	2024-09-20 15:48:25.478+02	2024-09-20 15:48:33.098+02	30	\N	\N	\N
188	Sensible Soccer	sensible_soccer.jpg	1992-01-01	\N	2024-09-20 16:30:46.704+02	2024-09-20 16:31:00.397+02	174	220	https://en.wikipedia.org/wiki/Sensible_Soccer	\N
189	Looney Tunes	Looney_Tunes.png	1979-01-01	\N	2024-09-21 12:53:32.473+02	2024-09-21 12:53:46.062+02	64	\N	https://en.wikipedia.org/wiki/List_of_Looney_Tunes_video_games	\N
190	NHL	Easports_nhl.png	1991-09-01	\N	2024-09-21 13:38:44.345+02	2024-09-21 13:39:00.332+02	112	\N	https://es.wikipedia.org/wiki/NHL_(serie)	\N
191	Solstice	solstice.jpg	1990-06-01	\N	2024-09-22 12:59:03.208+02	2024-09-22 12:59:14.596+02	227	\N	\N	\N
192	Lunar	Lunar.png	1992-06-16	\N	2024-09-23 18:37:19.698+02	2024-09-23 18:37:34.073+02	178	\N	https://es.wikipedia.org/wiki/Lunar_(juegos_de_rol)	\N
193	Alien	alien.png	1982-01-01	\N	2024-09-24 16:45:53.306+02	2024-09-24 16:46:04.709+02	158	\N	https://en.wikipedia.org/wiki/List_of_Alien,_Predator,_and_Alien_vs._Predator_games	\N
194	Astérix	Asterix.png	1983-01-01	\N	2024-09-26 16:47:41.46+02	2024-09-26 16:51:25.757+02	230	\N	https://en.wikipedia.org/wiki/List_of_Asterix_games#Video_games	\N
195	Chip 'n Dale: Rescue Rangers	Chip_'n'_Dale_Rescue_Rangers.png	1990-06-08	\N	2024-09-26 17:20:03.145+02	2024-09-26 17:20:09.002+02	74	\N	https://es.wikipedia.org/wiki/Chip_%27n_Dale:_Rescue_Rangers#Videojuegos	\N
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
RUNNERUP	1986	2024-07-23 17:10:17.551+02	2024-07-23 17:10:17.551+02	126	1
WINNER	1986	2024-07-24 16:42:12.89+02	2024-07-24 16:42:12.89+02	146	6
RUNNERUP	1986	2024-07-24 16:42:37.19+02	2024-07-24 16:42:37.19+02	124	6
RUNNERUP	1986	2024-07-24 16:46:26.002+02	2024-07-24 16:46:26.002+02	146	1
WINNER	1986	2024-07-24 16:53:40.183+02	2024-07-24 16:53:40.183+02	135	15
WINNER	1987	2024-08-02 12:16:05.301+02	2024-08-02 12:16:05.301+02	169	15
RUNNERUP	1987	2024-08-02 12:41:33.166+02	2024-08-02 12:41:33.166+02	174	1
RUNNERUP	1987	2024-08-02 12:42:44.8+02	2024-08-02 12:42:44.8+02	167	1
WINNER	1987	2024-08-02 12:43:20.854+02	2024-08-02 12:43:20.854+02	140	6
WINNER	1987	2024-08-02 12:43:29.949+02	2024-08-02 12:43:29.949+02	140	1
RUNNERUP	1987	2024-08-02 12:44:07.572+02	2024-08-02 12:44:07.572+02	174	6
RUNNERUP	1987	2024-08-02 12:44:31.66+02	2024-08-02 12:44:31.66+02	137	6
WINNER	1988	2024-08-09 10:20:59.326+02	2024-08-09 10:20:59.326+02	176	15
WINNER	1988	2024-08-09 10:22:36.169+02	2024-08-09 10:22:36.169+02	151	5
WINNER	1988	2024-08-09 10:36:44.578+02	2024-08-09 10:36:44.578+02	156	16
WINNER	1988	2024-08-09 10:37:00.228+02	2024-08-09 10:37:00.228+02	156	18
RUNNERUP	1988	2024-08-09 10:37:51.659+02	2024-08-09 10:37:51.659+02	191	19
WINNER	1988	2024-08-09 10:38:13.322+02	2024-08-09 10:38:13.322+02	180	19
RUNNERUP	1988	2024-08-09 10:38:59.03+02	2024-08-09 10:38:59.03+02	153	17
WINNER	1988	2024-08-09 11:28:35.138+02	2024-08-09 11:28:35.138+02	195	17
RUNNERUP	1988	2024-08-09 11:36:38.793+02	2024-08-09 11:36:38.793+02	196	16
WINNER	1988	2024-08-09 11:54:26.36+02	2024-08-09 11:54:26.36+02	197	16
RUNNERUP	1988	2024-08-09 11:55:16.071+02	2024-08-09 11:55:16.071+02	159	18
RUNNERUP	1988	2024-08-09 11:55:38.615+02	2024-08-09 11:55:38.615+02	153	18
WINNER	1989	2024-08-18 14:24:24.021+02	2024-08-18 14:24:24.021+02	189	15
WINNER	1989	2024-08-18 14:24:51.947+02	2024-08-18 14:24:51.947+02	52	15
WINNER	1989	2024-08-19 13:47:43.764+02	2024-08-19 13:47:43.764+02	205	8
WINNER	1989	2024-08-19 14:16:55.54+02	2024-08-19 14:16:55.54+02	219	16
WINNER	1989	2024-08-19 14:18:03.907+02	2024-08-19 14:18:03.907+02	193	19
WINNER	1989	2024-08-19 14:18:18.319+02	2024-08-19 14:18:18.319+02	193	18
WINNER	1989	2024-08-19 14:18:43.166+02	2024-08-19 14:18:43.166+02	198	18
WINNER	1989	2024-08-22 15:40:14.744+02	2024-08-22 15:40:14.744+02	220	20
WINNER	1989	2024-08-22 16:21:57.67+02	2024-08-22 16:21:57.67+02	221	1
WINNER	1989	2024-08-22 16:34:03.788+02	2024-08-22 16:34:03.788+02	222	1
WINNER	1990	2024-08-27 17:17:19.388+02	2024-08-27 17:17:19.388+02	255	24
WINNER	1990	2024-08-27 17:17:40.772+02	2024-08-27 17:17:40.772+02	242	15
WINNER	1990	2024-08-29 15:43:31.843+02	2024-08-29 15:43:31.843+02	261	18
WINNER	1990	2024-08-29 15:44:02.467+02	2024-08-29 15:44:02.467+02	226	16
WINNER	1990	2024-08-29 15:44:28.903+02	2024-08-29 15:44:28.903+02	201	18
WINNER	1990	2024-08-29 15:57:55.984+02	2024-08-29 15:57:55.984+02	262	19
WINNER	1990	2024-08-29 16:13:54.717+02	2024-08-29 16:13:54.717+02	263	19
WINNER	1990	2024-08-29 16:23:51.914+02	2024-08-29 16:23:51.914+02	264	20
WINNER	1990	2024-08-29 16:35:35.44+02	2024-08-29 16:35:35.44+02	265	20
WINNER	1990	2024-08-29 16:36:11.746+02	2024-08-29 16:36:11.746+02	163	17
WINNER	1990	2024-08-29 16:51:36.433+02	2024-08-29 16:51:36.433+02	266	17
WINNER	1990	2024-08-29 17:19:42.801+02	2024-08-29 17:19:42.801+02	268	1
WINNER	1990	2024-08-29 17:27:38.388+02	2024-08-29 17:27:38.388+02	269	1
WINNER	1990	2024-08-29 17:29:22.38+02	2024-08-29 17:29:22.38+02	214	5
WINNER	1989	2024-08-29 17:34:45.571+02	2024-08-29 17:34:45.571+02	181	5
WINNER	1989	2024-08-29 17:34:56.67+02	2024-08-29 17:34:56.67+02	181	25
WINNER	1989	2024-08-29 17:35:24.448+02	2024-08-29 17:35:24.448+02	218	26
WINNER	1989	2024-08-29 17:35:45.454+02	2024-08-29 17:35:45.454+02	188	27
WINNER	1990	2024-08-29 17:36:32.634+02	2024-08-29 17:36:32.634+02	211	27
WINNER	1991	2024-09-05 17:58:22.658+02	2024-09-05 17:58:22.658+02	279	15
WINNER	1990	2024-09-05 17:59:34.549+02	2024-09-05 17:59:34.549+02	239	19
WINNER	1991	2024-09-06 08:49:43.856+02	2024-09-06 08:49:43.856+02	302	20
WINNER	1991	2024-09-06 08:49:58.863+02	2024-09-06 08:49:58.863+02	302	16
WINNER	1991	2024-09-06 09:05:28.729+02	2024-09-06 09:05:28.729+02	303	18
WINNER	1992	2024-09-20 15:56:56.135+02	2024-09-20 15:56:56.135+02	346	8
WINNER	1992	2024-09-20 15:59:55.726+02	2024-09-20 15:59:55.726+02	377	28
WINNER	1992	2024-09-20 16:00:26.272+02	2024-09-20 16:00:26.272+02	361	30
WINNER	1992	2024-09-20 16:00:56.372+02	2024-09-20 16:00:56.372+02	276	1
WINNER	1992	2024-09-20 16:01:12.664+02	2024-09-20 16:01:12.664+02	276	17
WINNER	1992	2024-09-20 16:01:24.371+02	2024-09-20 16:01:24.371+02	276	29
WINNER	1992	2024-09-20 16:13:38.42+02	2024-09-20 16:13:38.42+02	387	31
WINNER	1992	2024-09-20 16:34:16.243+02	2024-09-20 16:34:16.243+02	388	16
WINNER	1992	2024-09-21 11:20:18.96+02	2024-09-21 11:20:18.96+02	389	14
RUNNERUP	1992	2024-09-21 11:21:30.816+02	2024-09-21 11:21:30.816+02	389	44
WINNER	1992	2024-09-21 11:49:20.261+02	2024-09-21 11:49:20.261+02	390	44
RUNNERUP	1992	2024-09-21 12:15:03.433+02	2024-09-21 12:15:03.433+02	391	43
WINNER	1992	2024-09-21 13:08:56.91+02	2024-09-21 13:08:56.91+02	392	43
WINNER	1992	2024-09-21 13:28:05.756+02	2024-09-21 13:28:05.756+02	394	41
RUNNERUP	1992	2024-09-21 13:54:50.856+02	2024-09-21 13:54:50.856+02	396	41
RUNNERUP	1992	2024-09-22 09:55:57.617+02	2024-09-22 09:55:57.617+02	397	39
RUNNERUP	1992	2024-09-22 10:15:13.008+02	2024-09-22 10:15:13.008+02	398	40
WINNER	1992	2024-09-22 10:15:59.929+02	2024-09-22 10:15:59.929+02	295	40
RUNNERUP	1992	2024-09-22 10:16:45.637+02	2024-09-22 10:16:45.637+02	361	38
WINNER	1992	2024-09-22 10:34:08.738+02	2024-09-22 10:34:08.738+02	399	38
RUNNERUP	1992	2024-09-22 13:53:48.63+02	2024-09-22 13:53:48.63+02	403	37
WINNER	1992	2024-09-23 16:05:53.991+02	2024-09-23 16:05:53.991+02	404	37
WINNER	1992	2024-09-23 16:07:37.074+02	2024-09-23 16:07:37.074+02	359	36
WINNER	1992	2024-09-23 16:08:18.727+02	2024-09-23 16:08:18.727+02	4	34
RUNNERUP	1992	2024-09-23 16:21:45.097+02	2024-09-23 16:21:45.097+02	405	32
WINNER	1992	2024-09-23 16:42:05.334+02	2024-09-23 16:42:05.334+02	407	32
RUNNERUP	1992	2024-09-23 16:43:06.407+02	2024-09-23 16:43:06.407+02	271	33
WINNER	1992	2024-09-23 16:43:29.52+02	2024-09-23 16:43:29.52+02	371	33
RUNNERUP	1992	2024-09-23 16:44:14.657+02	2024-09-23 16:44:14.657+02	361	14
WINNER	1992	2024-09-23 16:45:03.405+02	2024-09-23 16:45:03.405+02	276	13
RUNNERUP	1992	2024-09-23 16:45:35.998+02	2024-09-23 16:45:35.998+02	4	13
WINNER	1992	2024-09-23 16:46:40.086+02	2024-09-23 16:46:40.086+02	276	5
WINNER	1992	2024-09-25 16:49:56.62+02	2024-09-25 16:49:56.62+02	276	45
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
PLAYABLE	\N	2024-07-17 21:06:22.85+02	2024-07-17 21:06:22.85+02	35	132
SECONDARY	\N	2024-07-17 21:06:33.667+02	2024-07-17 21:06:33.667+02	36	132
ANTAGONIST	\N	2024-07-17 21:06:46.06+02	2024-07-17 21:06:46.06+02	37	132
PLAYABLE	\N	2024-07-18 17:25:56.15+02	2024-07-18 17:25:56.15+02	38	133
SECONDARY	\N	2024-07-18 17:26:11.576+02	2024-07-18 17:26:11.576+02	39	133
SECONDARY	\N	2024-07-21 11:17:51.381+02	2024-07-21 11:17:51.381+02	33	136
SECONDARY	\N	2024-07-21 11:17:51.381+02	2024-07-21 11:17:51.381+02	34	136
PLAYABLE	\N	2024-07-21 11:18:00.135+02	2024-07-21 11:18:00.135+02	18	136
PLAYABLE	\N	2024-07-21 11:18:15.902+02	2024-07-21 11:18:15.902+02	10	136
ANTAGONIST	\N	2024-07-21 11:18:27.887+02	2024-07-21 11:18:27.887+02	32	136
PLAYABLE	\N	2024-07-21 11:59:42.825+02	2024-07-21 11:59:42.825+02	41	137
PLAYABLE	\N	2024-07-21 11:59:49.651+02	2024-07-21 11:59:49.651+02	40	137
PLAYABLE	\N	2024-07-21 13:25:22.527+02	2024-07-21 13:25:22.527+02	42	138
VILLAIN	\N	2024-07-21 13:25:31.315+02	2024-07-21 13:25:31.315+02	43	138
ANTAGONIST	\N	2024-07-21 13:25:37.848+02	2024-07-21 13:25:37.848+02	44	138
PLAYABLE	\N	2024-07-22 16:09:25.969+02	2024-07-22 16:09:25.969+02	45	141
PLAYABLE	\N	2024-07-22 17:06:10.321+02	2024-07-22 17:06:10.321+02	46	142
ANTAGONIST	\N	2024-07-22 17:06:16.872+02	2024-07-22 17:06:16.872+02	47	142
PLAYABLE	\N	2024-07-23 16:19:54.477+02	2024-07-23 16:19:54.477+02	48	143
PLAYABLE	\N	2024-07-23 17:06:31.098+02	2024-07-23 17:06:31.098+02	49	144
PLAYABLE	\N	2024-07-25 17:41:40.969+02	2024-07-25 17:41:40.969+02	50	147
ANTAGONIST	\N	2024-07-25 17:41:50.652+02	2024-07-25 17:41:50.652+02	51	147
PLAYABLE	\N	2024-07-26 09:44:23.493+02	2024-07-26 09:44:23.493+02	52	148
PLAYABLE	\N	2024-07-27 12:42:13.188+02	2024-07-27 12:42:13.188+02	35	149
SECONDARY	\N	2024-07-27 12:42:20.395+02	2024-07-27 12:42:20.395+02	36	149
PLAYABLE	\N	2024-07-27 13:53:49.496+02	2024-07-27 13:53:49.496+02	54	151
PLAYABLE	\N	2024-07-27 13:53:49.496+02	2024-07-27 13:53:49.496+02	55	151
SECONDARY	\N	2024-07-27 13:54:00.827+02	2024-07-27 13:54:00.827+02	56	151
PLAYABLE	\N	2024-07-27 15:33:42.124+02	2024-07-27 15:33:42.124+02	57	152
PLAYABLE	\N	2024-07-28 12:14:17.894+02	2024-07-28 12:14:17.894+02	58	154
PLAYABLE	\N	2024-07-28 12:55:49.584+02	2024-07-28 12:55:49.584+02	59	155
ANTAGONIST	\N	2024-07-28 12:55:57.061+02	2024-07-28 12:55:57.061+02	60	155
PLAYABLE	\N	2024-07-28 13:35:14.008+02	2024-07-28 13:35:14.008+02	46	157
ANTAGONIST	\N	2024-07-28 13:35:20.245+02	2024-07-28 13:35:20.245+02	47	157
PLAYABLE	\N	2024-07-28 23:25:55.347+02	2024-07-28 23:25:55.347+02	61	158
PLAYABLE	\N	2024-07-28 23:25:55.347+02	2024-07-28 23:25:55.347+02	62	158
ANTAGONIST	\N	2024-07-28 23:26:03.368+02	2024-07-28 23:26:03.368+02	63	158
PLAYABLE	\N	2024-07-28 23:50:43.859+02	2024-07-28 23:50:43.859+02	5	159
ANTAGONIST	\N	2024-07-28 23:51:15.185+02	2024-07-28 23:51:15.185+02	9	159
ANTAGONIST	\N	2024-07-28 23:51:15.185+02	2024-07-28 23:51:15.185+02	6	159
ANTAGONIST	\N	2024-07-28 23:51:15.185+02	2024-07-28 23:51:15.185+02	8	159
ANTAGONIST	\N	2024-07-28 23:51:15.185+02	2024-07-28 23:51:15.185+02	14	159
ANTAGONIST	\N	2024-07-28 23:51:15.185+02	2024-07-28 23:51:15.185+02	7	159
PLAYABLE	\N	2024-07-30 15:57:26.484+02	2024-07-30 15:57:26.484+02	64	161
PLAYABLE	\N	2024-07-31 16:29:41.381+02	2024-07-31 16:29:41.381+02	65	163
ANTAGONIST	\N	2024-07-31 16:29:47.189+02	2024-07-31 16:29:47.189+02	66	163
PLAYABLE	\N	2024-08-02 12:01:32.366+02	2024-08-02 12:01:32.366+02	67	172
PLAYABLE	\N	2024-08-02 12:41:19.269+02	2024-08-02 12:41:19.269+02	68	174
PLAYABLE	\N	2024-08-03 13:44:19.925+02	2024-08-03 13:44:19.925+02	69	180
SECONDARY	\N	2024-08-03 13:44:28.333+02	2024-08-03 13:44:28.333+02	24	180
PLAYABLE	\N	2024-08-04 12:09:02.412+02	2024-08-04 12:09:02.412+02	30	181
SECONDARY	\N	2024-08-04 12:09:09.412+02	2024-08-04 12:09:09.412+02	31	181
PLAYABLE	\N	2024-08-04 13:43:48.682+02	2024-08-04 13:43:48.682+02	10	183
PLAYABLE	\N	2024-08-04 13:43:48.682+02	2024-08-04 13:43:48.682+02	18	183
PLAYABLE	\N	2024-08-04 13:43:48.682+02	2024-08-04 13:43:48.682+02	33	183
PLAYABLE	\N	2024-08-04 13:43:48.682+02	2024-08-04 13:43:48.682+02	34	183
ANTAGONIST	\N	2024-08-04 13:44:00.149+02	2024-08-04 13:44:00.149+02	70	183
PLAYABLE	\N	2024-08-04 21:05:55.408+02	2024-08-04 21:05:55.408+02	10	184
PLAYABLE	\N	2024-08-04 21:05:55.408+02	2024-08-04 21:05:55.408+02	18	184
ANTAGONIST	\N	2024-08-04 21:06:04.373+02	2024-08-04 21:06:04.373+02	32	184
SECONDARY	\N	2024-08-04 21:06:17.235+02	2024-08-04 21:06:17.235+02	33	184
SECONDARY	\N	2024-08-04 21:06:17.235+02	2024-08-04 21:06:17.235+02	34	184
VILLAIN	\N	2024-08-04 21:06:40.079+02	2024-08-04 21:06:40.079+02	74	184
VILLAIN	\N	2024-08-04 21:06:40.079+02	2024-08-04 21:06:40.079+02	71	184
VILLAIN	\N	2024-08-04 21:06:40.079+02	2024-08-04 21:06:40.079+02	76	184
VILLAIN	\N	2024-08-04 21:06:40.079+02	2024-08-04 21:06:40.079+02	77	184
VILLAIN	\N	2024-08-04 21:06:40.079+02	2024-08-04 21:06:40.079+02	72	184
VILLAIN	\N	2024-08-04 21:06:40.079+02	2024-08-04 21:06:40.079+02	75	184
VILLAIN	\N	2024-08-04 21:06:40.079+02	2024-08-04 21:06:40.079+02	73	184
PLAYABLE	\N	2024-08-05 16:44:40.979+02	2024-08-05 16:44:40.979+02	78	185
PLAYABLE	\N	2024-08-05 17:19:42.243+02	2024-08-05 17:19:42.243+02	54	187
PLAYABLE	\N	2024-08-05 17:19:42.243+02	2024-08-05 17:19:42.243+02	55	187
SECONDARY	\N	2024-08-05 17:19:50.304+02	2024-08-05 17:19:50.304+02	56	187
PLAYABLE	\N	2024-08-06 16:45:43.353+02	2024-08-06 16:45:43.353+02	79	188
PLAYABLE	\N	2024-08-07 15:51:01.988+02	2024-08-07 15:51:01.988+02	65	190
ANTAGONIST	\N	2024-08-07 15:51:08.73+02	2024-08-07 15:51:08.73+02	66	190
PLAYABLE	\N	2024-08-07 16:35:52.319+02	2024-08-07 16:35:52.319+02	80	191
PLAYABLE	\N	2024-08-09 13:56:19.053+02	2024-08-09 13:56:19.053+02	10	200
SECONDARY	\N	2024-08-09 13:56:25.387+02	2024-08-09 13:56:25.387+02	81	200
ANTAGONIST	\N	2024-08-09 13:56:34.838+02	2024-08-09 13:56:34.838+02	82	200
PLAYABLE	\N	2024-08-10 11:52:55.308+02	2024-08-10 11:52:55.308+02	84	201
PLAYABLE	\N	2024-08-10 11:52:55.308+02	2024-08-10 11:52:55.308+02	83	201
PLAYABLE	\N	2024-08-10 11:52:55.308+02	2024-08-10 11:52:55.308+02	85	201
ANTAGONIST	\N	2024-08-10 11:53:07.916+02	2024-08-10 11:53:07.916+02	86	201
PLAYABLE	\N	2024-08-10 12:46:19.184+02	2024-08-10 12:46:19.184+02	87	202
PLAYABLE	\N	2024-08-10 12:46:19.184+02	2024-08-10 12:46:19.184+02	88	202
PLAYABLE	\N	2024-08-10 12:46:19.184+02	2024-08-10 12:46:19.184+02	89	202
PLAYABLE	\N	2024-08-10 12:46:19.184+02	2024-08-10 12:46:19.184+02	90	202
ANTAGONIST	\N	2024-08-10 12:46:28.311+02	2024-08-10 12:46:28.311+02	91	202
PLAYABLE	\N	2024-08-10 13:04:47.932+02	2024-08-10 13:04:47.932+02	87	203
PLAYABLE	\N	2024-08-10 13:04:47.932+02	2024-08-10 13:04:47.932+02	88	203
PLAYABLE	\N	2024-08-10 13:04:47.932+02	2024-08-10 13:04:47.932+02	89	203
PLAYABLE	\N	2024-08-10 13:04:47.932+02	2024-08-10 13:04:47.932+02	90	203
ANTAGONIST	\N	2024-08-10 13:04:55.122+02	2024-08-10 13:04:55.122+02	91	203
PLAYABLE	\N	2024-08-11 12:51:09.051+02	2024-08-11 12:51:09.051+02	92	206
PLAYABLE	\N	2024-08-11 13:25:21.407+02	2024-08-11 13:25:21.407+02	93	207
PLAYABLE	\N	2024-08-12 17:13:03.835+02	2024-08-12 17:13:03.835+02	94	210
PLAYABLE	\N	2024-08-13 16:28:15.312+02	2024-08-13 16:28:15.312+02	96	211
PLAYABLE	\N	2024-08-13 16:28:15.312+02	2024-08-13 16:28:15.312+02	95	211
ANTAGONIST	\N	2024-08-13 16:28:25.686+02	2024-08-13 16:28:25.686+02	47	211
PLAYABLE	\N	2024-08-14 17:07:46.38+02	2024-08-14 17:07:46.38+02	99	213
PLAYABLE	\N	2024-08-14 17:07:46.38+02	2024-08-14 17:07:46.38+02	98	213
PLAYABLE	\N	2024-08-14 17:07:46.38+02	2024-08-14 17:07:46.38+02	97	213
PLAYABLE	\N	2024-08-18 13:34:34.382+02	2024-08-18 13:34:34.382+02	100	214
PLAYABLE	\N	2024-08-19 14:16:00.999+02	2024-08-19 14:16:00.999+02	101	219
PLAYABLE	\N	2024-08-22 17:29:02.44+02	2024-08-22 17:29:02.44+02	57	224
PLAYABLE	\N	2024-08-23 12:51:41.329+02	2024-08-23 12:51:41.329+02	87	227
PLAYABLE	\N	2024-08-23 12:51:41.329+02	2024-08-23 12:51:41.329+02	88	227
PLAYABLE	\N	2024-08-23 12:51:41.329+02	2024-08-23 12:51:41.329+02	89	227
PLAYABLE	\N	2024-08-23 12:51:41.329+02	2024-08-23 12:51:41.329+02	90	227
ANTAGONIST	\N	2024-08-23 12:51:50.382+02	2024-08-23 12:51:50.382+02	91	227
PLAYABLE	\N	2024-08-23 13:22:30.317+02	2024-08-23 13:22:30.317+02	59	229
PLAYABLE	\N	2024-08-23 16:19:10.65+02	2024-08-23 16:19:10.65+02	102	231
PLAYABLE	\N	2024-08-23 16:47:37.971+02	2024-08-23 16:47:37.971+02	59	233
ANTAGONIST	\N	2024-08-23 16:47:46.271+02	2024-08-23 16:47:46.271+02	60	233
PLAYABLE	\N	2024-08-24 11:41:30.178+02	2024-08-24 11:41:30.178+02	65	237
ANTAGONIST	\N	2024-08-24 11:41:37.552+02	2024-08-24 11:41:37.552+02	66	237
PLAYABLE	\N	2024-08-24 13:44:18.185+02	2024-08-24 13:44:18.185+02	103	239
SECONDARY	\N	2024-08-24 13:44:25.174+02	2024-08-24 13:44:25.174+02	104	239
ANTAGONIST	\N	2024-08-24 13:44:35.707+02	2024-08-24 13:44:35.707+02	105	239
PLAYABLE	\N	2024-08-25 10:57:09.556+02	2024-08-25 10:57:09.556+02	10	240
PLAYABLE	\N	2024-08-25 10:57:09.556+02	2024-08-25 10:57:09.556+02	18	240
ANTAGONIST	\N	2024-08-25 10:57:19.932+02	2024-08-25 10:57:19.932+02	32	240
SECONDARY	\N	2024-08-25 10:57:33.551+02	2024-08-25 10:57:33.551+02	106	240
SECONDARY	\N	2024-08-25 10:57:33.551+02	2024-08-25 10:57:33.551+02	33	240
VILLAIN	\N	2024-08-25 10:58:00.988+02	2024-08-25 10:58:00.988+02	74	240
VILLAIN	\N	2024-08-25 10:58:00.988+02	2024-08-25 10:58:00.988+02	71	240
VILLAIN	\N	2024-08-25 10:58:00.988+02	2024-08-25 10:58:00.988+02	76	240
VILLAIN	\N	2024-08-25 10:58:00.988+02	2024-08-25 10:58:00.988+02	77	240
VILLAIN	\N	2024-08-25 10:58:00.988+02	2024-08-25 10:58:00.988+02	72	240
VILLAIN	\N	2024-08-25 10:58:00.988+02	2024-08-25 10:58:00.988+02	75	240
VILLAIN	\N	2024-08-25 10:58:00.988+02	2024-08-25 10:58:00.988+02	73	240
PLAYABLE	\N	2024-08-25 11:57:18.921+02	2024-08-25 11:57:18.921+02	107	241
PLAYABLE	\N	2024-08-26 15:39:02.516+02	2024-08-26 15:39:02.516+02	67	249
PLAYABLE	\N	2024-08-26 16:05:34.866+02	2024-08-26 16:05:34.866+02	54	251
PLAYABLE	\N	2024-08-26 16:05:34.866+02	2024-08-26 16:05:34.866+02	55	251
SECONDARY	\N	2024-08-26 16:05:46.527+02	2024-08-26 16:05:46.527+02	56	251
PLAYABLE	\N	2024-08-27 17:02:58.51+02	2024-08-27 17:02:58.51+02	52	254
ANTAGONIST	\N	2024-08-27 17:07:16.62+02	2024-08-27 17:07:16.62+02	108	254
PLAYABLE	\N	2024-08-28 16:35:59.848+02	2024-08-28 16:35:59.848+02	109	257
SECONDARY	\N	2024-08-28 16:36:12.776+02	2024-08-28 16:36:12.776+02	110	257
PLAYABLE	\N	2024-08-29 15:43:07.682+02	2024-08-29 15:43:07.682+02	41	261
PLAYABLE	\N	2024-08-29 15:43:07.682+02	2024-08-29 15:43:07.682+02	40	261
PLAYABLE	\N	2024-08-29 16:13:36.657+02	2024-08-29 16:13:36.657+02	80	263
PLAYABLE	\N	2024-08-29 21:00:17.188+02	2024-08-29 21:00:17.188+02	79	270
PLAYABLE	\N	2024-08-30 13:38:03.402+02	2024-08-30 13:38:03.402+02	61	276
PLAYABLE	\N	2024-08-30 13:38:03.402+02	2024-08-30 13:38:03.402+02	62	276
PLAYABLE	\N	2024-08-30 13:38:03.402+02	2024-08-30 13:38:03.402+02	111	276
PLAYABLE	\N	2024-08-30 13:38:03.402+02	2024-08-30 13:38:03.402+02	114	276
PLAYABLE	\N	2024-08-30 13:38:03.402+02	2024-08-30 13:38:03.402+02	113	276
PLAYABLE	\N	2024-08-30 13:38:03.402+02	2024-08-30 13:38:03.402+02	116	276
PLAYABLE	\N	2024-08-30 13:38:03.402+02	2024-08-30 13:38:03.402+02	112	276
PLAYABLE	\N	2024-08-30 13:38:03.402+02	2024-08-30 13:38:03.402+02	115	276
VILLAIN	\N	2024-08-30 13:38:27.944+02	2024-08-30 13:38:27.944+02	63	276
VILLAIN	\N	2024-08-30 13:38:27.944+02	2024-08-30 13:38:27.944+02	117	276
VILLAIN	\N	2024-08-30 13:38:27.944+02	2024-08-30 13:38:27.944+02	118	276
ANTAGONIST	\N	2024-08-30 13:38:38.854+02	2024-08-30 13:38:38.854+02	119	276
PLAYABLE	\N	2024-09-01 11:20:11.152+02	2024-09-01 11:20:11.152+02	42	282
PLAYABLE	\N	2024-09-01 13:24:37.85+02	2024-09-01 13:24:37.85+02	35	284
SECONDARY	\N	2024-09-01 13:24:44.813+02	2024-09-01 13:24:44.813+02	36	284
ANTAGONIST	\N	2024-09-01 13:24:51.931+02	2024-09-01 13:24:51.931+02	37	284
PLAYABLE	\N	2024-09-02 16:04:45.365+02	2024-09-02 16:04:45.365+02	120	285
PLAYABLE	\N	2024-09-02 16:04:45.365+02	2024-09-02 16:04:45.365+02	121	285
PLAYABLE	\N	2024-09-02 16:04:45.365+02	2024-09-02 16:04:45.365+02	122	285
ANTAGONIST	\N	2024-09-02 16:04:59.445+02	2024-09-02 16:04:59.445+02	123	285
PLAYABLE	\N	2024-09-02 16:17:13.817+02	2024-09-02 16:17:13.817+02	103	286
SECONDARY	\N	2024-09-02 16:17:25.662+02	2024-09-02 16:17:25.662+02	104	286
ANTAGONIST	\N	2024-09-02 16:17:35.621+02	2024-09-02 16:17:35.621+02	105	286
PLAYABLE	\N	2024-09-02 17:07:55.831+02	2024-09-02 17:07:55.831+02	46	287
ANTAGONIST	\N	2024-09-02 17:08:04.194+02	2024-09-02 17:08:04.194+02	47	287
PLAYABLE	\N	2024-09-02 17:26:59.73+02	2024-09-02 17:26:59.73+02	124	288
ANTAGONIST	\N	2024-09-02 17:27:08.741+02	2024-09-02 17:27:08.741+02	47	288
PLAYABLE	\N	2024-09-02 17:44:56.738+02	2024-09-02 17:44:56.738+02	124	289
ANTAGONIST	\N	2024-09-02 17:45:04.946+02	2024-09-02 17:45:04.946+02	47	289
PLAYABLE	\N	2024-09-03 16:30:05.614+02	2024-09-03 16:30:05.614+02	65	290
ANTAGONIST	\N	2024-09-03 16:30:12.605+02	2024-09-03 16:30:12.605+02	66	290
PLAYABLE	\N	2024-09-03 16:39:16.348+02	2024-09-03 16:39:16.348+02	65	291
PLAYABLE	\N	2024-09-03 16:58:01.565+02	2024-09-03 16:58:01.565+02	65	292
ANTAGONIST	\N	2024-09-03 16:58:13.146+02	2024-09-03 16:58:13.146+02	66	292
PLAYABLE	\N	2024-09-04 16:17:00.876+02	2024-09-04 16:17:00.876+02	30	296
SECONDARY	\N	2024-09-04 16:17:09.529+02	2024-09-04 16:17:09.529+02	31	296
PLAYABLE	\N	2024-09-04 17:23:43.163+02	2024-09-04 17:23:43.163+02	125	297
PLAYABLE	\N	2024-09-04 17:23:43.163+02	2024-09-04 17:23:43.163+02	126	297
SECONDARY	\N	2024-09-04 17:23:50.936+02	2024-09-04 17:23:50.936+02	127	297
ANTAGONIST	\N	2024-09-04 17:23:58.472+02	2024-09-04 17:23:58.472+02	128	297
PLAYABLE	\N	2024-09-05 17:13:54.101+02	2024-09-05 17:13:54.101+02	129	299
PLAYABLE	\N	2024-09-05 17:54:34.069+02	2024-09-05 17:54:34.069+02	1	301
ANTAGONIST	\N	2024-09-05 17:54:40.491+02	2024-09-05 17:54:40.491+02	2	301
PLAYABLE	\N	2024-09-06 10:58:22.944+02	2024-09-06 10:58:22.944+02	24	308
PLAYABLE	\N	2024-09-06 13:05:20.056+02	2024-09-06 13:05:20.056+02	130	312
PLAYABLE	\N	2024-09-06 13:05:20.056+02	2024-09-06 13:05:20.056+02	131	312
PLAYABLE	\N	2024-09-06 13:05:20.056+02	2024-09-06 13:05:20.056+02	132	312
PLAYABLE	\N	2024-09-06 13:05:20.056+02	2024-09-06 13:05:20.056+02	133	312
ANTAGONIST	\N	2024-09-06 13:05:29.016+02	2024-09-06 13:05:29.016+02	135	312
SECONDARY	\N	2024-09-06 13:05:35.959+02	2024-09-06 13:05:35.959+02	134	312
PLAYABLE	\N	2024-09-06 13:40:02.955+02	2024-09-06 13:40:02.955+02	136	313
ANTAGONIST	\N	2024-09-06 13:40:10.062+02	2024-09-06 13:40:10.062+02	137	313
PLAYABLE	\N	2024-09-06 16:35:22.41+02	2024-09-06 16:35:22.41+02	10	314
SECONDARY	\N	2024-09-06 16:35:30.59+02	2024-09-06 16:35:30.59+02	106	314
PLAYABLE	\N	2024-09-06 16:51:38.899+02	2024-09-06 16:51:38.899+02	138	315
PLAYABLE	\N	2024-09-06 17:03:18.768+02	2024-09-06 17:03:18.768+02	138	316
PLAYABLE	\N	2024-09-07 10:45:39.811+02	2024-09-07 10:45:39.811+02	10	318
PLAYABLE	\N	2024-09-07 10:45:39.811+02	2024-09-07 10:45:39.811+02	18	318
SECONDARY	\N	2024-09-07 10:45:53.501+02	2024-09-07 10:45:53.501+02	33	318
SECONDARY	\N	2024-09-07 10:45:53.501+02	2024-09-07 10:45:53.501+02	81	318
SECONDARY	\N	2024-09-07 10:45:53.501+02	2024-09-07 10:45:53.501+02	11	318
PLAYABLE	\N	2024-09-07 13:44:25.365+02	2024-09-07 13:44:25.365+02	139	323
ANTAGONIST	\N	2024-09-07 13:44:32.152+02	2024-09-07 13:44:32.152+02	141	323
PLAYABLE	\N	2024-09-08 09:31:42.748+02	2024-09-08 09:31:42.748+02	142	324
PLAYABLE	\N	2024-09-08 09:41:14.614+02	2024-09-08 09:41:14.614+02	142	325
PLAYABLE	\N	2024-09-08 09:48:50.595+02	2024-09-08 09:48:50.595+02	94	326
PLAYABLE	\N	2024-09-08 11:08:36.5+02	2024-09-08 11:08:36.5+02	143	328
PLAYABLE	\N	2024-09-08 11:08:36.5+02	2024-09-08 11:08:36.5+02	144	328
PLAYABLE	\N	2024-09-09 15:39:19.457+02	2024-09-09 15:39:19.457+02	45	330
PLAYABLE	\N	2024-09-09 16:29:09.454+02	2024-09-09 16:29:09.454+02	45	331
PLAYABLE	\N	2024-09-09 16:38:00.508+02	2024-09-09 16:38:00.508+02	45	332
ANTAGONIST	\N	2024-09-11 13:54:49.847+02	2024-09-11 13:54:49.847+02	145	348
PLAYABLE	\N	2024-09-12 17:03:24.506+02	2024-09-12 17:03:24.506+02	146	356
ANTAGONIST	\N	2024-09-12 17:03:33.733+02	2024-09-12 17:03:33.733+02	147	356
PLAYABLE	\N	2024-09-13 10:28:41.993+02	2024-09-13 10:28:41.993+02	148	359
PLAYABLE	\N	2024-09-13 11:02:03.68+02	2024-09-13 11:02:03.68+02	101	361
PLAYABLE	\N	2024-09-13 13:37:41.063+02	2024-09-13 13:37:41.063+02	149	363
PLAYABLE	\N	2024-09-14 11:50:12.155+02	2024-09-14 11:50:12.155+02	10	364
PLAYABLE	\N	2024-09-14 11:50:12.155+02	2024-09-14 11:50:12.155+02	18	364
PLAYABLE	\N	2024-09-14 11:50:12.155+02	2024-09-14 11:50:12.155+02	33	364
PLAYABLE	\N	2024-09-14 11:50:12.155+02	2024-09-14 11:50:12.155+02	34	364
PLAYABLE	\N	2024-09-14 11:50:12.155+02	2024-09-14 11:50:12.155+02	106	364
PLAYABLE	\N	2024-09-14 11:50:12.155+02	2024-09-14 11:50:12.155+02	32	364
PLAYABLE	\N	2024-09-14 11:50:12.155+02	2024-09-14 11:50:12.155+02	17	364
PLAYABLE	\N	2024-09-15 09:45:38.671+02	2024-09-15 09:45:38.671+02	150	367
PLAYABLE	\N	2024-09-15 09:45:38.671+02	2024-09-15 09:45:38.671+02	151	367
SECONDARY	\N	2024-09-15 09:45:49.869+02	2024-09-15 09:45:49.869+02	152	367
PLAYABLE	\N	2024-09-15 10:57:57.188+02	2024-09-15 10:57:57.188+02	153	369
PLAYABLE	\N	2024-09-15 12:50:17.823+02	2024-09-15 12:50:17.823+02	154	370
PLAYABLE	\N	2024-09-15 12:50:17.823+02	2024-09-15 12:50:17.823+02	155	370
PLAYABLE	\N	2024-09-15 12:50:17.823+02	2024-09-15 12:50:17.823+02	156	370
PLAYABLE	\N	2024-09-15 12:50:17.823+02	2024-09-15 12:50:17.823+02	157	370
PLAYABLE	\N	2024-09-15 12:50:17.823+02	2024-09-15 12:50:17.823+02	160	370
PLAYABLE	\N	2024-09-15 12:50:17.823+02	2024-09-15 12:50:17.823+02	159	370
PLAYABLE	\N	2024-09-15 12:50:17.823+02	2024-09-15 12:50:17.823+02	158	370
SECONDARY	\N	2024-09-15 12:50:26.402+02	2024-09-15 12:50:26.402+02	162	370
VILLAIN	\N	2024-09-15 12:50:39.367+02	2024-09-15 12:50:39.367+02	161	370
ANTAGONIST	\N	2024-09-15 12:50:49.262+02	2024-09-15 12:50:49.262+02	163	370
PLAYABLE	\N	2024-09-16 15:35:41.93+02	2024-09-16 15:35:41.93+02	10	372
ANTAGONIST	\N	2024-09-16 15:35:48.744+02	2024-09-16 15:35:48.744+02	164	372
PLAYABLE	\N	2024-09-16 17:04:52.9+02	2024-09-16 17:04:52.9+02	1	375
SECONDARY	\N	2024-09-16 17:05:00.123+02	2024-09-16 17:05:00.123+02	3	375
ANTAGONIST	\N	2024-09-16 17:05:06.719+02	2024-09-16 17:05:06.719+02	2	375
PLAYABLE	\N	2024-09-17 16:24:19.411+02	2024-09-17 16:24:19.411+02	165	376
PLAYABLE	\N	2024-09-18 16:23:35.033+02	2024-09-18 16:23:35.033+02	166	377
PLAYABLE	\N	2024-09-20 10:41:05.902+02	2024-09-20 10:41:05.902+02	65	380
ANTAGONIST	\N	2024-09-20 10:42:30.306+02	2024-09-20 10:42:30.306+02	66	380
PLAYABLE	\N	2024-09-20 10:59:13.486+02	2024-09-20 10:59:13.486+02	65	381
ANTAGONIST	\N	2024-09-20 10:59:34.101+02	2024-09-20 10:59:34.101+02	66	381
PLAYABLE	\N	2024-09-20 13:02:47.091+02	2024-09-20 13:02:47.091+02	121	382
PLAYABLE	\N	2024-09-20 13:02:47.091+02	2024-09-20 13:02:47.091+02	120	382
PLAYABLE	\N	2024-09-20 13:02:47.091+02	2024-09-20 13:02:47.091+02	122	382
PLAYABLE	\N	2024-09-20 13:02:47.091+02	2024-09-20 13:02:47.091+02	167	382
PLAYABLE	\N	2024-09-20 13:55:21.039+02	2024-09-20 13:55:21.039+02	61	384
PLAYABLE	\N	2024-09-20 13:55:21.039+02	2024-09-20 13:55:21.039+02	62	384
PLAYABLE	\N	2024-09-20 13:55:21.039+02	2024-09-20 13:55:21.039+02	114	384
PLAYABLE	\N	2024-09-20 13:55:21.039+02	2024-09-20 13:55:21.039+02	63	384
PLAYABLE	\N	2024-09-20 13:55:21.039+02	2024-09-20 13:55:21.039+02	117	384
PLAYABLE	\N	2024-09-20 13:55:21.039+02	2024-09-20 13:55:21.039+02	112	384
PLAYABLE	\N	2024-09-20 13:55:21.039+02	2024-09-20 13:55:21.039+02	111	384
PLAYABLE	\N	2024-09-20 13:55:21.039+02	2024-09-20 13:55:21.039+02	119	384
PLAYABLE	\N	2024-09-20 13:55:21.039+02	2024-09-20 13:55:21.039+02	116	384
PLAYABLE	\N	2024-09-20 13:55:21.039+02	2024-09-20 13:55:21.039+02	115	384
PLAYABLE	\N	2024-09-20 13:55:21.039+02	2024-09-20 13:55:21.039+02	118	384
PLAYABLE	\N	2024-09-20 13:55:21.039+02	2024-09-20 13:55:21.039+02	113	384
PLAYABLE	\N	2024-09-20 15:38:52.847+02	2024-09-20 15:38:52.847+02	61	385
PLAYABLE	\N	2024-09-20 15:38:52.847+02	2024-09-20 15:38:52.847+02	62	385
PLAYABLE	\N	2024-09-20 15:38:52.847+02	2024-09-20 15:38:52.847+02	114	385
PLAYABLE	\N	2024-09-20 15:38:52.847+02	2024-09-20 15:38:52.847+02	113	385
PLAYABLE	\N	2024-09-20 15:38:52.847+02	2024-09-20 15:38:52.847+02	111	385
PLAYABLE	\N	2024-09-20 15:38:52.847+02	2024-09-20 15:38:52.847+02	116	385
PLAYABLE	\N	2024-09-20 15:38:52.847+02	2024-09-20 15:38:52.847+02	112	385
PLAYABLE	\N	2024-09-20 15:38:52.847+02	2024-09-20 15:38:52.847+02	63	385
PLAYABLE	\N	2024-09-20 15:38:52.847+02	2024-09-20 15:38:52.847+02	117	385
PLAYABLE	\N	2024-09-20 15:38:52.847+02	2024-09-20 15:38:52.847+02	118	385
PLAYABLE	\N	2024-09-20 15:38:52.847+02	2024-09-20 15:38:52.847+02	115	385
PLAYABLE	\N	2024-09-20 15:38:52.847+02	2024-09-20 15:38:52.847+02	119	385
PLAYABLE	\N	2024-09-21 13:08:28.902+02	2024-09-21 13:08:28.902+02	168	392
ANTAGONIST	\N	2024-09-21 13:08:35.492+02	2024-09-21 13:08:35.492+02	169	392
PLAYABLE	\N	2024-09-23 16:36:00.193+02	2024-09-23 16:36:00.193+02	67	406
PLAYABLE	\N	2024-09-23 16:41:45.655+02	2024-09-23 16:41:45.655+02	67	407
PLAYABLE	\N	2024-09-24 15:50:54.024+02	2024-09-24 15:50:54.024+02	170	409
SECONDARY	\N	2024-09-24 15:51:29.519+02	2024-09-24 15:51:29.519+02	130	409
SECONDARY	\N	2024-09-24 15:51:29.519+02	2024-09-24 15:51:29.519+02	131	409
PLAYABLE	\N	2024-09-24 16:16:38.645+02	2024-09-24 16:16:38.645+02	171	410
ANTAGONIST	\N	2024-09-24 17:26:02.702+02	2024-09-24 17:26:02.702+02	172	412
PLAYABLE	\N	2024-09-25 15:31:19.253+02	2024-09-25 15:31:19.253+02	87	413
PLAYABLE	\N	2024-09-25 15:31:19.253+02	2024-09-25 15:31:19.253+02	88	413
PLAYABLE	\N	2024-09-25 15:31:19.253+02	2024-09-25 15:31:19.253+02	89	413
PLAYABLE	\N	2024-09-25 15:31:19.253+02	2024-09-25 15:31:19.253+02	90	413
ANTAGONIST	\N	2024-09-25 15:31:30.717+02	2024-09-25 15:31:30.717+02	91	413
PLAYABLE	\N	2024-09-25 15:42:28.181+02	2024-09-25 15:42:28.181+02	87	414
PLAYABLE	\N	2024-09-25 15:42:28.181+02	2024-09-25 15:42:28.181+02	88	414
PLAYABLE	\N	2024-09-25 15:42:28.181+02	2024-09-25 15:42:28.181+02	89	414
PLAYABLE	\N	2024-09-25 15:42:28.181+02	2024-09-25 15:42:28.181+02	90	414
ANTAGONIST	\N	2024-09-25 15:42:34.446+02	2024-09-25 15:42:34.446+02	91	414
PLAYABLE	\N	2024-09-25 15:51:45.246+02	2024-09-25 15:51:45.246+02	87	415
PLAYABLE	\N	2024-09-25 15:51:45.246+02	2024-09-25 15:51:45.246+02	90	415
PLAYABLE	\N	2024-09-25 15:51:45.246+02	2024-09-25 15:51:45.246+02	89	415
PLAYABLE	\N	2024-09-25 15:51:45.246+02	2024-09-25 15:51:45.246+02	88	415
ANTAGONIST	\N	2024-09-25 15:51:52.027+02	2024-09-25 15:51:52.027+02	91	415
PLAYABLE	\N	2024-09-25 16:00:12.34+02	2024-09-25 16:00:12.34+02	87	416
PLAYABLE	\N	2024-09-25 16:00:12.34+02	2024-09-25 16:00:12.34+02	88	416
PLAYABLE	\N	2024-09-25 16:00:12.34+02	2024-09-25 16:00:12.34+02	89	416
PLAYABLE	\N	2024-09-25 16:00:12.34+02	2024-09-25 16:00:12.34+02	90	416
ANTAGONIST	\N	2024-09-25 16:00:19.35+02	2024-09-25 16:00:19.35+02	91	416
PLAYABLE	\N	2024-09-25 16:20:10.564+02	2024-09-25 16:20:10.564+02	109	417
PLAYABLE	\N	2024-09-25 16:20:10.564+02	2024-09-25 16:20:10.564+02	139	417
ANTAGONIST	\N	2024-09-25 16:20:17.008+02	2024-09-25 16:20:17.008+02	141	417
PLAYABLE	\N	2024-09-26 17:00:11.7+02	2024-09-26 17:00:11.7+02	173	424
PLAYABLE	\N	2024-09-26 17:00:11.7+02	2024-09-26 17:00:11.7+02	174	424
PLAYABLE	\N	2024-09-26 17:31:59.974+02	2024-09-26 17:31:59.974+02	175	425
PLAYABLE	\N	2024-09-26 17:31:59.974+02	2024-09-26 17:31:59.974+02	176	425
PLAYABLE	\N	2024-09-27 09:13:36.74+02	2024-09-27 09:13:36.74+02	52	426
ANTAGONIST	\N	2024-09-27 09:15:00.664+02	2024-09-27 09:15:00.664+02	177	426
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
DEVELOPER	\N	\N	2024-07-17 16:39:44.795+02	2024-07-17 16:39:44.795+02	96	131
DEVELOPER	\N	\N	2024-07-17 21:06:08.014+02	2024-07-17 21:06:08.014+02	95	132
PUBLISHER	\N	\N	2024-07-17 21:06:14.024+02	2024-07-17 21:06:14.024+02	32	132
DEVELOPER	\N	\N	2024-07-18 17:25:22.505+02	2024-07-18 17:25:22.505+02	97	133
PUBLISHER	\N	\N	2024-07-18 17:25:34.838+02	2024-07-18 17:25:34.838+02	1	133
DEVELOPER	\N	\N	2024-07-19 15:44:28.085+02	2024-07-19 15:44:28.085+02	14	134
DEVELOPER	\N	\N	2024-07-19 17:15:55.72+02	2024-07-19 17:15:55.72+02	99	135
PUBLISHER	\N	\N	2024-07-19 17:16:00.856+02	2024-07-19 17:16:00.856+02	70	135
DEVELOPER	\N	\N	2024-07-21 11:16:49.218+02	2024-07-21 11:16:49.218+02	95	136
PUBLISHER	\N	\N	2024-07-21 11:16:54.095+02	2024-07-21 11:16:54.095+02	32	136
DEVELOPER	\N	\N	2024-07-21 11:59:34.209+02	2024-07-21 11:59:34.209+02	14	137
DEVELOPER	\N	\N	2024-07-21 13:25:08.433+02	2024-07-21 13:25:08.433+02	31	138
DEVELOPER	\N	\N	2024-07-21 13:25:08.433+02	2024-07-21 13:25:08.433+02	101	138
PUBLISHER	\N	\N	2024-07-21 13:25:16.043+02	2024-07-21 13:25:16.043+02	32	138
DEVELOPER	\N	\N	2024-07-21 13:51:10.917+02	2024-07-21 13:51:10.917+02	29	139
DEVELOPER	\N	\N	2024-07-22 15:30:12.073+02	2024-07-22 15:30:12.073+02	1	140
DEVELOPER	\N	\N	2024-07-22 16:09:12.196+02	2024-07-22 16:09:12.196+02	68	141
DEVELOPER	\N	\N	2024-07-22 17:05:56.166+02	2024-07-22 17:05:56.166+02	30	142
DEVELOPER	\N	\N	2024-07-23 16:19:40.555+02	2024-07-23 16:19:40.555+02	1	143
DEVELOPER	\N	\N	2024-07-23 17:06:03.924+02	2024-07-23 17:06:03.924+02	31	144
PUBLISHER	\N	\N	2024-07-23 17:06:10.029+02	2024-07-23 17:06:10.029+02	32	144
DEVELOPER	\N	\N	2024-07-24 16:06:24.589+02	2024-07-24 16:06:24.589+02	18	145
DEVELOPER	\N	\N	2024-07-24 16:40:47.783+02	2024-07-24 16:40:47.783+02	102	146
DEVELOPER	\N	\N	2024-07-25 17:41:18.952+02	2024-07-25 17:41:18.952+02	104	147
PUBLISHER	\N	\N	2024-07-25 17:41:24.225+02	2024-07-25 17:41:24.225+02	103	147
DEVELOPER	\N	\N	2024-07-26 09:44:07.608+02	2024-07-26 09:44:07.608+02	52	148
DEVELOPER	\N	\N	2024-07-27 12:41:46.057+02	2024-07-27 12:41:46.057+02	95	149
PUBLISHER	\N	\N	2024-07-27 12:41:51.222+02	2024-07-27 12:41:51.222+02	32	149
DEVELOPER	\N	\N	2024-07-27 13:07:20.101+02	2024-07-27 13:07:20.101+02	30	150
DEVELOPER	\N	\N	2024-07-27 13:53:22.727+02	2024-07-27 13:53:22.727+02	91	151
PUBLISHER	\N	\N	2024-07-27 13:53:31.228+02	2024-07-27 13:53:31.228+02	14	151
DEVELOPER	\N	\N	2024-07-27 15:33:22.119+02	2024-07-27 15:33:22.119+02	106	152
DEVELOPER	\N	\N	2024-07-28 11:44:16.654+02	2024-07-28 11:44:16.654+02	92	153
DEVELOPER	\N	\N	2024-07-28 12:14:04.347+02	2024-07-28 12:14:04.347+02	25	154
DEVELOPER	\N	\N	2024-07-28 12:55:31.41+02	2024-07-28 12:55:31.41+02	30	155
DEVELOPER	\N	\N	2024-07-28 13:11:54.188+02	2024-07-28 13:11:54.188+02	14	156
DEVELOPER	\N	\N	2024-07-28 13:34:42.98+02	2024-07-28 13:34:42.98+02	30	157
DEVELOPER	\N	\N	2024-07-28 23:25:34.112+02	2024-07-28 23:25:34.112+02	61	158
DEVELOPER	\N	\N	2024-07-28 23:49:31.53+02	2024-07-28 23:49:31.53+02	18	159
DEVELOPER	\N	\N	2024-07-29 21:13:06.372+02	2024-07-29 21:13:06.372+02	107	160
DEVELOPER	\N	\N	2024-07-30 15:38:59.596+02	2024-07-30 15:38:59.596+02	80	161
PUBLISHER	\N	\N	2024-07-30 15:39:07.029+02	2024-07-30 15:39:07.029+02	32	161
DEVELOPER	\N	\N	2024-07-30 16:48:02.366+02	2024-07-30 16:48:02.366+02	108	162
DEVELOPER	\N	\N	2024-07-31 16:29:34.706+02	2024-07-31 16:29:34.706+02	61	163
DEVELOPER	\N	\N	2024-08-01 16:00:02.614+02	2024-08-01 16:00:02.614+02	109	164
DEVELOPER	\N	\N	2024-08-01 17:00:19.387+02	2024-08-01 17:00:19.387+02	1	165
DEVELOPER	\N	\N	2024-08-02 08:42:19.524+02	2024-08-02 08:42:19.524+02	52	166
DEVELOPER	\N	\N	2024-08-02 09:32:06.811+02	2024-08-02 09:32:06.811+02	110	167
PUBLISHER	\N	\N	2024-08-02 09:32:13.833+02	2024-08-02 09:32:13.833+02	21	167
DEVELOPER	\N	\N	2024-08-02 10:24:31.396+02	2024-08-02 10:24:31.396+02	111	168
DEVELOPER	\N	\N	2024-08-02 10:41:12.369+02	2024-08-02 10:41:12.369+02	99	169
PUBLISHER	\N	\N	2024-08-02 10:41:16.928+02	2024-08-02 10:41:16.928+02	70	169
DEVELOPER	\N	\N	2024-08-02 11:09:32.789+02	2024-08-02 11:09:32.789+02	18	170
DEVELOPER	\N	\N	2024-08-02 11:32:10.616+02	2024-08-02 11:32:10.616+02	1	171
DEVELOPER	\N	\N	2024-08-02 12:01:14.556+02	2024-08-02 12:01:14.556+02	1	172
DEVELOPER	\N	\N	2024-08-02 12:14:33.692+02	2024-08-02 12:14:33.692+02	1	173
DEVELOPER	\N	\N	2024-08-02 12:41:05.244+02	2024-08-02 12:41:05.244+02	91	174
PUBLISHER	\N	\N	2024-08-02 12:41:11.5+02	2024-08-02 12:41:11.5+02	14	174
DEVELOPER	\N	\N	2024-08-03 10:26:55.683+02	2024-08-03 10:26:55.683+02	30	175
DEVELOPER	\N	\N	2024-08-03 11:15:07.309+02	2024-08-03 11:15:07.309+02	99	176
PUBLISHER	\N	\N	2024-08-03 11:15:12.232+02	2024-08-03 11:15:12.232+02	70	176
DEVELOPER	\N	\N	2024-08-03 11:35:55.713+02	2024-08-03 11:35:55.713+02	48	177
PUBLISHER	\N	\N	2024-08-03 11:36:19.654+02	2024-08-03 11:36:19.654+02	32	177
DEVELOPER	\N	\N	2024-08-03 12:21:51.33+02	2024-08-03 12:21:51.33+02	29	178
DEVELOPER	\N	\N	2024-08-03 13:08:32.609+02	2024-08-03 13:08:32.609+02	1	179
DEVELOPER	\N	\N	2024-08-03 13:44:05.596+02	2024-08-03 13:44:05.596+02	61	180
DEVELOPER	\N	\N	2024-08-04 12:08:45.438+02	2024-08-04 12:08:45.438+02	61	181
DEVELOPER	\N	\N	2024-08-04 12:23:51.626+02	2024-08-04 12:23:51.626+02	28	182
DEVELOPER	\N	\N	2024-08-04 13:42:29.363+02	2024-08-04 13:42:29.363+02	95	183
PUBLISHER	\N	\N	2024-08-04 13:42:36.007+02	2024-08-04 13:42:36.007+02	32	183
DEVELOPER	\N	\N	2024-08-04 21:05:05.246+02	2024-08-04 21:05:05.246+02	95	184
PUBLISHER	\N	\N	2024-08-04 21:05:10.888+02	2024-08-04 21:05:10.888+02	32	184
DEVELOPER	\N	\N	2024-08-05 16:44:23.623+02	2024-08-05 16:44:23.623+02	18	185
DEVELOPER	\N	\N	2024-08-05 16:59:18.789+02	2024-08-05 16:59:18.789+02	18	186
DEVELOPER	\N	\N	2024-08-05 17:19:06.515+02	2024-08-05 17:19:06.515+02	91	187
DEVELOPER	\N	\N	2024-08-06 16:45:14.676+02	2024-08-06 16:45:14.676+02	113	188
DEVELOPER	\N	\N	2024-08-07 15:35:20.249+02	2024-08-07 15:35:20.249+02	109	189
DEVELOPER	\N	\N	2024-08-07 15:50:39.438+02	2024-08-07 15:50:39.438+02	61	190
DEVELOPER	\N	\N	2024-08-07 16:35:24.412+02	2024-08-07 16:35:24.412+02	90	191
DEVELOPER	\N	\N	2024-08-07 16:45:15.425+02	2024-08-07 16:45:15.425+02	30	192
DEVELOPER	\N	\N	2024-08-08 16:06:42.76+02	2024-08-08 16:06:42.76+02	14	193
PUBLISHER	\N	\N	2024-08-08 17:30:26.382+02	2024-08-08 17:30:26.382+02	32	194
DEVELOPER	\N	\N	2024-08-09 11:28:14.544+02	2024-08-09 11:28:14.544+02	1	195
DEVELOPER	\N	\N	2024-08-09 11:36:14.438+02	2024-08-09 11:36:14.438+02	110	196
PUBLISHER	\N	\N	2024-08-09 11:36:19.072+02	2024-08-09 11:36:19.072+02	21	196
DEVELOPER	\N	\N	2024-08-09 11:54:05.445+02	2024-08-09 11:54:05.445+02	119	197
DEVELOPER	\N	\N	2024-08-09 12:32:52.73+02	2024-08-09 12:32:52.73+02	11	198
DEVELOPER	\N	\N	2024-08-09 12:51:31.923+02	2024-08-09 12:51:31.923+02	1	199
DEVELOPER	\N	\N	2024-08-09 13:46:49.817+02	2024-08-09 13:46:49.817+02	31	200
PUBLISHER	\N	\N	2024-08-09 13:46:55.253+02	2024-08-09 13:46:55.253+02	32	200
DEVELOPER	\N	\N	2024-08-10 11:52:35.724+02	2024-08-10 11:52:35.724+02	1	201
DEVELOPER	\N	\N	2024-08-10 12:44:49.425+02	2024-08-10 12:44:49.425+02	30	202
DEVELOPER	\N	\N	2024-08-10 13:01:56.642+02	2024-08-10 13:01:56.642+02	30	203
DEVELOPER	\N	\N	2024-08-10 13:19:39.679+02	2024-08-10 13:19:39.679+02	121	204
DEVELOPER	\N	\N	2024-08-11 12:05:30.159+02	2024-08-11 12:05:30.159+02	122	205
PUBLISHER	\N	\N	2024-08-11 12:05:38.641+02	2024-08-11 12:05:38.641+02	29	205
DEVELOPER	\N	\N	2024-08-11 12:50:48.921+02	2024-08-11 12:50:48.921+02	123	206
PUBLISHER	\N	\N	2024-08-11 12:50:53.837+02	2024-08-11 12:50:53.837+02	32	206
DEVELOPER	\N	\N	2024-08-11 13:25:00.554+02	2024-08-11 13:25:00.554+02	61	207
DEVELOPER	\N	\N	2024-08-11 16:51:35.358+02	2024-08-11 16:51:35.358+02	87	208
DEVELOPER	\N	\N	2024-08-12 16:12:41.182+02	2024-08-12 16:12:41.182+02	125	209
DEVELOPER	\N	\N	2024-08-12 17:12:42.632+02	2024-08-12 17:12:42.632+02	127	210
PUBLISHER	\N	\N	2024-08-12 17:12:47.671+02	2024-08-12 17:12:47.671+02	68	210
DEVELOPER	\N	\N	2024-08-13 16:27:57.952+02	2024-08-13 16:27:57.952+02	30	211
DEVELOPER	\N	\N	2024-08-14 17:07:24.017+02	2024-08-14 17:07:24.017+02	61	213
DEVELOPER	\N	\N	2024-08-18 13:34:21.549+02	2024-08-18 13:34:21.549+02	61	214
DEVELOPER	\N	\N	2024-08-18 14:22:51.303+02	2024-08-18 14:22:51.303+02	128	215
PUBLISHER	\N	\N	2024-08-18 14:22:57.382+02	2024-08-18 14:22:57.382+02	129	215
DEVELOPER	\N	\N	2024-08-19 13:11:48.412+02	2024-08-19 13:11:48.412+02	97	216
PUBLISHER	\N	\N	2024-08-19 13:12:33.955+02	2024-08-19 13:12:33.955+02	1	216
DEVELOPER	\N	\N	2024-08-19 13:31:06.094+02	2024-08-19 13:31:06.094+02	97	217
PUBLISHER	\N	\N	2024-08-19 13:31:12.005+02	2024-08-19 13:31:12.005+02	1	217
DEVELOPER	\N	\N	2024-08-19 13:43:29.609+02	2024-08-19 13:43:29.609+02	97	218
PUBLISHER	\N	\N	2024-08-19 13:43:37.64+02	2024-08-19 13:43:37.64+02	1	218
DEVELOPER	\N	\N	2024-08-19 14:15:41.286+02	2024-08-19 14:15:41.286+02	107	219
DEVELOPER	\N	\N	2024-08-22 15:39:20.094+02	2024-08-22 15:39:20.094+02	131	220
PUBLISHER	\N	\N	2024-08-22 15:39:26.08+02	2024-08-22 15:39:26.08+02	132	220
DEVELOPER	\N	\N	2024-08-22 16:21:07.915+02	2024-08-22 16:21:07.915+02	134	221
DEVELOPER	\N	\N	2024-08-22 16:33:40.073+02	2024-08-22 16:33:40.073+02	52	222
DEVELOPER	\N	\N	2024-08-22 17:10:18.084+02	2024-08-22 17:10:18.084+02	109	223
DEVELOPER	\N	\N	2024-08-22 17:28:54.37+02	2024-08-22 17:28:54.37+02	106	224
DEVELOPER	\N	\N	2024-08-22 17:38:11.536+02	2024-08-22 17:38:11.536+02	106	225
PUBLISHER	\N	\N	2024-08-22 17:38:21.131+02	2024-08-22 17:38:21.131+02	68	225
DEVELOPER	\N	\N	2024-08-23 10:52:50.917+02	2024-08-23 10:52:50.917+02	111	226
DEVELOPER	\N	\N	2024-08-23 12:51:10.576+02	2024-08-23 12:51:10.576+02	30	227
DEVELOPER	\N	\N	2024-08-23 13:06:45.886+02	2024-08-23 13:06:45.886+02	1	228
DEVELOPER	\N	\N	2024-08-23 13:22:23.583+02	2024-08-23 13:22:23.583+02	30	229
DEVELOPER	\N	\N	2024-08-23 13:38:34.757+02	2024-08-23 13:38:34.757+02	27	230
DEVELOPER	\N	\N	2024-08-23 16:18:44.272+02	2024-08-23 16:18:44.272+02	101	231
PUBLISHER	\N	\N	2024-08-23 16:18:49.45+02	2024-08-23 16:18:49.45+02	32	231
DEVELOPER	\N	\N	2024-08-23 16:31:55.352+02	2024-08-23 16:31:55.352+02	28	232
DEVELOPER	\N	\N	2024-08-23 16:47:24.081+02	2024-08-23 16:47:24.081+02	30	233
DEVELOPER	\N	\N	2024-08-24 10:45:47.542+02	2024-08-24 10:45:47.542+02	31	234
PUBLISHER	\N	\N	2024-08-24 10:45:53.678+02	2024-08-24 10:45:53.678+02	32	234
DEVELOPER	\N	\N	2024-08-24 10:55:57.284+02	2024-08-24 10:55:57.284+02	18	235
DEVELOPER	\N	\N	2024-08-24 11:23:02.036+02	2024-08-24 11:23:02.036+02	28	236
DEVELOPER	\N	\N	2024-08-24 12:07:28.703+02	2024-08-24 12:07:28.703+02	1	238
DEVELOPER	\N	\N	2024-08-24 13:43:56.312+02	2024-08-24 13:43:56.312+02	107	239
DEVELOPER	\N	\N	2024-08-25 10:56:33.703+02	2024-08-25 10:56:33.703+02	95	240
PUBLISHER	\N	\N	2024-08-25 10:56:39.21+02	2024-08-25 10:56:39.21+02	32	240
DEVELOPER	\N	\N	2024-08-25 11:56:58.126+02	2024-08-25 11:56:58.126+02	95	241
PUBLISHER	\N	\N	2024-08-25 11:57:04.07+02	2024-08-25 11:57:04.07+02	32	241
DEVELOPER	\N	\N	2024-08-25 12:59:40.048+02	2024-08-25 12:59:40.048+02	99	242
PUBLISHER	\N	\N	2024-08-25 12:59:45.336+02	2024-08-25 12:59:45.336+02	70	242
DEVELOPER	\N	\N	2024-08-25 13:11:35.756+02	2024-08-25 13:11:35.756+02	109	243
DEVELOPER	\N	\N	2024-08-25 13:26:25.73+02	2024-08-25 13:26:25.73+02	61	244
DEVELOPER	\N	\N	2024-08-25 13:42:48.015+02	2024-08-25 13:42:48.015+02	137	245
DEVELOPER	\N	\N	2024-08-25 13:51:29.839+02	2024-08-25 13:51:29.839+02	137	246
PUBLISHER	\N	\N	2024-08-25 13:51:34.25+02	2024-08-25 13:51:34.25+02	61	246
DEVELOPER	\N	\N	2024-08-26 15:17:32.525+02	2024-08-26 15:17:32.525+02	1	247
DEVELOPER	\N	\N	2024-08-26 15:26:32.244+02	2024-08-26 15:26:32.244+02	1	248
DEVELOPER	\N	\N	2024-08-26 15:38:19.099+02	2024-08-26 15:38:19.099+02	1	249
DEVELOPER	\N	\N	2024-08-26 15:48:50.104+02	2024-08-26 15:48:50.104+02	1	250
DEVELOPER	\N	\N	2024-08-26 16:04:54.407+02	2024-08-26 16:04:54.407+02	91	251
DEVELOPER	\N	\N	2024-08-26 16:56:05.838+02	2024-08-26 16:56:05.838+02	14	252
DEVELOPER	\N	\N	2024-08-27 16:16:37.837+02	2024-08-27 16:16:37.837+02	1	253
DEVELOPER	\N	\N	2024-08-27 17:02:22.459+02	2024-08-27 17:02:22.459+02	138	254
DEVELOPER	\N	\N	2024-08-27 17:16:01.032+02	2024-08-27 17:16:01.032+02	109	255
DEVELOPER	\N	\N	2024-08-28 15:55:26.294+02	2024-08-28 15:55:26.294+02	30	256
DEVELOPER	\N	\N	2024-08-28 16:35:19.8+02	2024-08-28 16:35:19.8+02	1	257
DEVELOPER	\N	\N	2024-08-28 16:47:54.322+02	2024-08-28 16:47:54.322+02	92	258
DEVELOPER	\N	\N	2024-08-28 17:50:16.936+02	2024-08-28 17:50:16.936+02	126	259
PUBLISHER	\N	\N	2024-08-28 17:50:22.999+02	2024-08-28 17:50:22.999+02	18	259
DEVELOPER	\N	\N	2024-08-28 17:57:55.903+02	2024-08-28 17:57:55.903+02	126	260
PUBLISHER	\N	\N	2024-08-28 17:58:15.526+02	2024-08-28 17:58:15.526+02	18	260
DEVELOPER	\N	\N	2024-08-29 15:42:58.418+02	2024-08-29 15:42:58.418+02	14	261
DEVELOPER	\N	\N	2024-08-29 15:57:38.12+02	2024-08-29 15:57:38.12+02	119	262
DEVELOPER	\N	\N	2024-08-29 16:11:57.678+02	2024-08-29 16:11:57.678+02	90	263
DEVELOPER	\N	\N	2024-08-29 16:23:30.13+02	2024-08-29 16:23:30.13+02	90	264
DEVELOPER	\N	\N	2024-08-29 16:34:50.625+02	2024-08-29 16:34:50.625+02	131	265
PUBLISHER	\N	\N	2024-08-29 16:34:56.803+02	2024-08-29 16:34:56.803+02	132	265
DEVELOPER	\N	\N	2024-08-29 16:51:01.294+02	2024-08-29 16:51:01.294+02	29	266
DEVELOPER	\N	\N	2024-08-29 17:10:42.757+02	2024-08-29 17:10:42.757+02	139	267
DEVELOPER	\N	\N	2024-08-29 17:19:04.246+02	2024-08-29 17:19:04.246+02	139	268
PUBLISHER	\N	\N	2024-08-29 17:19:23.489+02	2024-08-29 17:19:23.489+02	111	268
DEVELOPER	\N	\N	2024-08-29 17:27:00.867+02	2024-08-29 17:27:00.867+02	134	269
DEVELOPER	\N	\N	2024-08-29 20:58:47.785+02	2024-08-29 20:58:47.785+02	113	270
DEVELOPER	\N	\N	2024-08-29 21:15:45.798+02	2024-08-29 21:15:45.798+02	107	271
DEVELOPER	\N	\N	2024-08-30 08:06:47.564+02	2024-08-30 08:06:47.564+02	29	272
DEVELOPER	\N	\N	2024-08-30 09:02:22.26+02	2024-08-30 09:02:22.26+02	1	273
DEVELOPER	\N	\N	2024-08-30 09:28:31.328+02	2024-08-30 09:28:31.328+02	31	274
PUBLISHER	\N	\N	2024-08-30 09:28:36.49+02	2024-08-30 09:28:36.49+02	32	274
DEVELOPER	\N	\N	2024-08-30 09:35:55.338+02	2024-08-30 09:35:55.338+02	31	275
PUBLISHER	\N	\N	2024-08-30 09:35:59.969+02	2024-08-30 09:35:59.969+02	32	275
DEVELOPER	\N	\N	2024-08-30 13:37:01.821+02	2024-08-30 13:37:01.821+02	61	276
DEVELOPER	\N	\N	2024-08-31 11:42:21.434+02	2024-08-31 11:42:21.434+02	140	277
PUBLISHER	\N	\N	2024-08-31 11:42:27.616+02	2024-08-31 11:42:27.616+02	132	277
DEVELOPER	\N	\N	2024-08-31 14:06:29.616+02	2024-08-31 14:06:29.616+02	143	278
PUBLISHER	\N	\N	2024-08-31 14:06:46.926+02	2024-08-31 14:06:46.926+02	145	278
DEVELOPER	\N	\N	2024-09-01 10:12:27.894+02	2024-09-01 10:12:27.894+02	109	279
DEVELOPER	\N	\N	2024-09-01 10:27:33.185+02	2024-09-01 10:27:33.185+02	18	280
DEVELOPER	\N	\N	2024-09-01 10:43:06.75+02	2024-09-01 10:43:06.75+02	29	281
DEVELOPER	\N	\N	2024-09-01 11:19:55.464+02	2024-09-01 11:19:55.464+02	31	282
PUBLISHER	\N	\N	2024-09-01 11:20:00.453+02	2024-09-01 11:20:00.453+02	32	282
DEVELOPER	\N	\N	2024-09-01 12:46:43.449+02	2024-09-01 12:46:43.449+02	148	283
DEVELOPER	\N	\N	2024-09-01 13:24:24.87+02	2024-09-01 13:24:24.87+02	95	284
PUBLISHER	\N	\N	2024-09-01 13:24:29.907+02	2024-09-01 13:24:29.907+02	32	284
DEVELOPER	\N	\N	2024-09-02 16:03:57.503+02	2024-09-02 16:03:57.503+02	96	285
DEVELOPER	\N	\N	2024-09-02 16:16:15.342+02	2024-09-02 16:16:15.342+02	107	286
DEVELOPER	\N	\N	2024-09-02 17:07:47.861+02	2024-09-02 17:07:47.861+02	30	287
DEVELOPER	\N	\N	2024-09-02 17:27:40.837+02	2024-09-02 17:27:40.837+02	30	288
DEVELOPER	\N	\N	2024-09-02 17:44:42.551+02	2024-09-02 17:44:42.551+02	30	289
DEVELOPER	\N	\N	2024-09-03 16:29:53.727+02	2024-09-03 16:29:53.727+02	61	290
DEVELOPER	\N	\N	2024-09-03 16:39:00.528+02	2024-09-03 16:39:00.528+02	61	291
DEVELOPER	\N	\N	2024-09-03 16:57:40.179+02	2024-09-03 16:57:40.179+02	149	292
PUBLISHER	\N	\N	2024-09-03 16:57:44.721+02	2024-09-03 16:57:44.721+02	61	292
DEVELOPER	\N	\N	2024-09-03 17:24:21.752+02	2024-09-03 17:24:21.752+02	113	293
DEVELOPER	\N	\N	2024-09-03 17:35:52.646+02	2024-09-03 17:35:52.646+02	113	294
DEVELOPER	\N	\N	2024-09-04 15:30:33.575+02	2024-09-04 15:30:33.575+02	111	295
DEVELOPER	\N	\N	2024-09-04 16:17:42.483+02	2024-09-04 16:17:42.483+02	61	296
DEVELOPER	\N	\N	2024-09-04 17:23:26.103+02	2024-09-04 17:23:26.103+02	48	297
PUBLISHER	\N	\N	2024-09-04 17:23:31.566+02	2024-09-04 17:23:31.566+02	129	297
DEVELOPER	\N	\N	2024-09-05 15:53:45.227+02	2024-09-05 15:53:45.227+02	30	298
DEVELOPER	\N	\N	2024-09-05 17:12:34.686+02	2024-09-05 17:12:34.686+02	150	299
DEVELOPER	\N	\N	2024-09-05 17:37:45.136+02	2024-09-05 17:37:45.136+02	1	300
DEVELOPER	\N	\N	2024-09-05 17:54:10.127+02	2024-09-05 17:54:10.127+02	154	301
PUBLISHER	\N	\N	2024-09-05 17:54:16.051+02	2024-09-05 17:54:16.051+02	1	301
DEVELOPER	\N	\N	2024-09-06 08:49:14.523+02	2024-09-06 08:49:14.523+02	139	302
DEVELOPER	\N	\N	2024-09-06 09:05:07.497+02	2024-09-06 09:05:07.497+02	155	303
DEVELOPER	\N	\N	2024-09-06 09:43:58.152+02	2024-09-06 09:43:58.152+02	156	304
DEVELOPER	\N	\N	2024-09-06 10:25:59.26+02	2024-09-06 10:25:59.26+02	14	305
DEVELOPER	\N	\N	2024-09-06 10:36:17.102+02	2024-09-06 10:36:17.102+02	14	306
DEVELOPER	\N	\N	2024-09-06 10:47:44.642+02	2024-09-06 10:47:44.642+02	14	307
DEVELOPER	\N	\N	2024-09-06 10:57:16.041+02	2024-09-06 10:57:16.041+02	61	308
DEVELOPER	\N	\N	2024-09-06 11:11:21.952+02	2024-09-06 11:11:21.952+02	1	309
DEVELOPER	\N	\N	2024-09-06 11:22:59.092+02	2024-09-06 11:22:59.092+02	1	310
DEVELOPER	\N	\N	2024-09-06 11:31:32.122+02	2024-09-06 11:31:32.122+02	1	311
DEVELOPER	\N	\N	2024-09-06 13:04:56.796+02	2024-09-06 13:04:56.796+02	30	312
DEVELOPER	\N	\N	2024-09-06 13:39:41.75+02	2024-09-06 13:39:41.75+02	76	313
DEVELOPER	\N	\N	2024-09-06 16:35:01.367+02	2024-09-06 16:35:01.367+02	160	314
PUBLISHER	\N	\N	2024-09-06 16:35:10.745+02	2024-09-06 16:35:10.745+02	32	314
DEVELOPER	\N	\N	2024-09-06 16:51:16.932+02	2024-09-06 16:51:16.932+02	30	315
DEVELOPER	\N	\N	2024-09-06 17:03:06.443+02	2024-09-06 17:03:06.443+02	30	316
DEVELOPER	\N	\N	2024-09-06 17:13:10.81+02	2024-09-06 17:13:10.81+02	109	317
DEVELOPER	\N	\N	2024-09-07 10:45:12.429+02	2024-09-07 10:45:12.429+02	86	318
DEVELOPER	\N	\N	2024-09-07 10:45:12.429+02	2024-09-07 10:45:12.429+02	161	318
PUBLISHER	\N	\N	2024-09-07 10:45:18.181+02	2024-09-07 10:45:18.181+02	32	318
DEVELOPER	\N	\N	2024-09-07 11:01:38.564+02	2024-09-07 11:01:38.564+02	162	319
DEVELOPER	\N	\N	2024-09-07 12:14:32.369+02	2024-09-07 12:14:32.369+02	163	320
PUBLISHER	\N	\N	2024-09-07 12:14:37.563+02	2024-09-07 12:14:37.563+02	164	320
DEVELOPER	\N	\N	2024-09-07 12:24:32.866+02	2024-09-07 12:24:32.866+02	163	321
PUBLISHER	\N	\N	2024-09-07 12:24:38.816+02	2024-09-07 12:24:38.816+02	164	321
DEVELOPER	\N	\N	2024-09-07 12:39:18.622+02	2024-09-07 12:39:18.622+02	163	322
PUBLISHER	\N	\N	2024-09-07 12:39:27.531+02	2024-09-07 12:39:27.531+02	164	322
PUBLISHER	\N	\N	2024-09-07 12:39:27.531+02	2024-09-07 12:39:27.531+02	29	322
DEVELOPER	\N	\N	2024-09-07 13:44:10.854+02	2024-09-07 13:44:10.854+02	1	323
DEVELOPER	\N	\N	2024-09-08 09:31:08.369+02	2024-09-08 09:31:08.369+02	166	324
PUBLISHER	\N	\N	2024-09-08 09:31:20.678+02	2024-09-08 09:31:20.678+02	29	324
DEVELOPER	\N	\N	2024-09-08 09:40:54.969+02	2024-09-08 09:40:54.969+02	166	325
PUBLISHER	\N	\N	2024-09-08 09:41:00.434+02	2024-09-08 09:41:00.434+02	29	325
DEVELOPER	\N	\N	2024-09-08 09:50:10.557+02	2024-09-08 09:50:10.557+02	127	326
PUBLISHER	\N	\N	2024-09-08 09:50:15.734+02	2024-09-08 09:50:15.734+02	68	326
DEVELOPER	\N	\N	2024-09-08 10:14:20.396+02	2024-09-08 10:14:20.396+02	1	327
DEVELOPER	\N	\N	2024-09-08 11:08:06.118+02	2024-09-08 11:08:06.118+02	172	328
PUBLISHER	\N	\N	2024-09-08 11:08:14.082+02	2024-09-08 11:08:14.082+02	1	328
DEVELOPER	\N	\N	2024-09-08 12:02:57.056+02	2024-09-08 12:02:57.056+02	174	329
DEVELOPER	\N	\N	2024-09-09 15:43:58.91+02	2024-09-09 15:43:58.91+02	175	330
PUBLISHER	\N	\N	2024-09-09 15:44:04.317+02	2024-09-09 15:44:04.317+02	68	330
DEVELOPER	\N	\N	2024-09-09 16:28:45.645+02	2024-09-09 16:28:45.645+02	176	331
PUBLISHER	\N	\N	2024-09-09 16:28:50.961+02	2024-09-09 16:28:50.961+02	68	331
DEVELOPER	\N	\N	2024-09-09 16:37:42.723+02	2024-09-09 16:37:42.723+02	175	332
PUBLISHER	\N	\N	2024-09-09 16:37:46.848+02	2024-09-09 16:37:46.848+02	68	332
DEVELOPER	\N	\N	2024-09-09 16:54:35.326+02	2024-09-09 16:54:35.326+02	1	333
DEVELOPER	\N	\N	2024-09-09 17:01:37.055+02	2024-09-09 17:01:37.055+02	138	334
PUBLISHER	\N	\N	2024-09-09 17:02:35.805+02	2024-09-09 17:02:35.805+02	1	334
DEVELOPER	\N	\N	2024-09-09 17:24:49.487+02	2024-09-09 17:24:49.487+02	109	335
DEVELOPER	\N	\N	2024-09-09 17:34:01.85+02	2024-09-09 17:34:01.85+02	96	336
DEVELOPER	\N	\N	2024-09-09 17:49:38.664+02	2024-09-09 17:49:38.664+02	177	337
PUBLISHER	\N	\N	2024-09-09 17:49:44.701+02	2024-09-09 17:49:44.701+02	70	337
DEVELOPER	\N	\N	2024-09-10 15:25:18.724+02	2024-09-10 15:25:18.724+02	178	338
PUBLISHER	\N	\N	2024-09-10 15:25:23.656+02	2024-09-10 15:25:23.656+02	1	338
DEVELOPER	\N	\N	2024-09-10 16:20:52.589+02	2024-09-10 16:20:52.589+02	180	339
PUBLISHER	\N	\N	2024-09-10 16:20:57.486+02	2024-09-10 16:20:57.486+02	52	339
DEVELOPER	\N	\N	2024-09-10 16:46:59.809+02	2024-09-10 16:46:59.809+02	183	340
PUBLISHER	\N	\N	2024-09-10 16:47:08.808+02	2024-09-10 16:47:08.808+02	30	340
DEVELOPER	\N	\N	2024-09-11 10:44:34.361+02	2024-09-11 10:44:34.361+02	30	341
DEVELOPER	\N	\N	2024-09-11 10:58:47.348+02	2024-09-11 10:58:47.348+02	30	342
DEVELOPER	\N	\N	2024-09-11 11:08:39.314+02	2024-09-11 11:08:39.314+02	30	343
DEVELOPER	\N	\N	2024-09-11 11:18:41.464+02	2024-09-11 11:18:41.464+02	96	344
DEVELOPER	\N	\N	2024-09-11 11:39:02.587+02	2024-09-11 11:39:02.587+02	30	345
DEVELOPER	\N	\N	2024-09-11 12:04:58.583+02	2024-09-11 12:04:58.583+02	29	346
DEVELOPER	\N	\N	2024-09-11 12:17:10.399+02	2024-09-11 12:17:10.399+02	1	347
DEVELOPER	\N	\N	2024-09-11 13:54:26.807+02	2024-09-11 13:54:26.807+02	184	348
PUBLISHER	\N	\N	2024-09-11 13:54:31.961+02	2024-09-11 13:54:31.961+02	180	348
DEVELOPER	\N	\N	2024-09-11 14:12:24.859+02	2024-09-11 14:12:24.859+02	1	349
DEVELOPER	\N	\N	2024-09-11 17:22:43.675+02	2024-09-11 17:22:43.675+02	189	350
DEVELOPER	\N	\N	2024-09-11 17:22:43.675+02	2024-09-11 17:22:43.675+02	190	350
PUBLISHER	\N	\N	2024-09-11 17:22:49.686+02	2024-09-11 17:22:49.686+02	1	350
DEVELOPER	\N	\N	2024-09-11 17:32:07.873+02	2024-09-11 17:32:07.873+02	189	351
DEVELOPER	\N	\N	2024-09-11 17:32:07.873+02	2024-09-11 17:32:07.873+02	190	351
PUBLISHER	\N	\N	2024-09-11 17:32:12.786+02	2024-09-11 17:32:12.786+02	1	351
DEVELOPER	\N	\N	2024-09-12 15:26:20.199+02	2024-09-12 15:26:20.199+02	192	352
DEVELOPER	\N	\N	2024-09-12 15:35:57.656+02	2024-09-12 15:35:57.656+02	73	353
DEVELOPER	\N	\N	2024-09-12 15:43:38.33+02	2024-09-12 15:43:38.33+02	73	354
DEVELOPER	\N	\N	2024-09-12 16:24:24.389+02	2024-09-12 16:24:24.389+02	193	355
DEVELOPER	\N	\N	2024-09-12 17:03:04.354+02	2024-09-12 17:03:04.354+02	161	356
PUBLISHER	\N	\N	2024-09-12 17:03:09.221+02	2024-09-12 17:03:09.221+02	32	356
DEVELOPER	\N	\N	2024-09-13 07:52:42.471+02	2024-09-13 07:52:42.471+02	78	357
DEVELOPER	\N	\N	2024-09-13 10:01:43.062+02	2024-09-13 10:01:43.062+02	83	358
DEVELOPER	\N	\N	2024-09-13 10:28:15.799+02	2024-09-13 10:28:15.799+02	84	359
PUBLISHER	\N	\N	2024-09-13 10:28:21.843+02	2024-09-13 10:28:21.843+02	150	359
DEVELOPER	\N	\N	2024-09-13 10:41:00.577+02	2024-09-13 10:41:00.577+02	110	360
PUBLISHER	\N	\N	2024-09-13 10:41:07.172+02	2024-09-13 10:41:07.172+02	186	360
DEVELOPER	\N	\N	2024-09-13 11:01:22.099+02	2024-09-13 11:01:22.099+02	107	361
DEVELOPER	\N	\N	2024-09-13 11:30:42.091+02	2024-09-13 11:30:42.091+02	194	362
DEVELOPER	\N	\N	2024-09-13 13:37:19.703+02	2024-09-13 13:37:19.703+02	195	363
PUBLISHER	\N	\N	2024-09-13 13:37:25.749+02	2024-09-13 13:37:25.749+02	1	363
DEVELOPER	\N	\N	2024-09-14 11:49:27.708+02	2024-09-14 11:49:27.708+02	95	364
PUBLISHER	\N	\N	2024-09-14 11:49:33.06+02	2024-09-14 11:49:33.06+02	32	364
DEVELOPER	\N	\N	2024-09-14 12:27:32.399+02	2024-09-14 12:27:32.399+02	99	365
PUBLISHER	\N	\N	2024-09-14 12:27:40.819+02	2024-09-14 12:27:40.819+02	70	365
DEVELOPER	\N	\N	2024-09-14 13:32:02.379+02	2024-09-14 13:32:02.379+02	196	366
PUBLISHER	\N	\N	2024-09-14 13:32:07.931+02	2024-09-14 13:32:07.931+02	197	366
DEVELOPER	\N	\N	2024-09-15 09:45:20.101+02	2024-09-15 09:45:20.101+02	96	367
DEVELOPER	\N	\N	2024-09-15 10:08:43.941+02	2024-09-15 10:08:43.941+02	200	368
PUBLISHER	\N	\N	2024-09-15 10:08:50.054+02	2024-09-15 10:08:50.054+02	1	368
DEVELOPER	\N	\N	2024-09-15 10:57:33.341+02	2024-09-15 10:57:33.341+02	164	369
PUBLISHER	\N	\N	2024-09-15 10:57:40.065+02	2024-09-15 10:57:40.065+02	29	369
DEVELOPER	\N	\N	2024-09-15 12:49:05.028+02	2024-09-15 12:49:05.028+02	17	370
DEVELOPER	\N	\N	2024-09-15 13:31:41.784+02	2024-09-15 13:31:41.784+02	206	371
PUBLISHER	\N	\N	2024-09-15 13:31:46.797+02	2024-09-15 13:31:46.797+02	1	371
DEVELOPER	\N	\N	2024-09-16 15:34:12.277+02	2024-09-16 15:34:12.277+02	31	372
PUBLISHER	\N	\N	2024-09-16 15:34:20.219+02	2024-09-16 15:34:20.219+02	32	372
DEVELOPER	\N	\N	2024-09-16 16:28:33.001+02	2024-09-16 16:28:33.001+02	207	373
PUBLISHER	\N	\N	2024-09-16 16:28:38.801+02	2024-09-16 16:28:38.801+02	208	373
DEVELOPER	\N	\N	2024-09-16 16:43:03.146+02	2024-09-16 16:43:03.146+02	207	374
PUBLISHER	\N	\N	2024-09-16 16:43:08.706+02	2024-09-16 16:43:08.706+02	208	374
DEVELOPER	\N	\N	2024-09-16 17:04:40.452+02	2024-09-16 17:04:40.452+02	210	375
PUBLISHER	\N	\N	2024-09-16 17:04:44.852+02	2024-09-16 17:04:44.852+02	1	375
DEVELOPER	\N	\N	2024-09-17 16:21:43.777+02	2024-09-17 16:21:43.777+02	148	376
PUBLISHER	\N	\N	2024-09-17 16:21:49.933+02	2024-09-17 16:21:49.933+02	60	376
DEVELOPER	\N	\N	2024-09-18 16:23:20.821+02	2024-09-18 16:23:20.821+02	13	377
DEVELOPER	\N	\N	2024-09-18 16:55:53.718+02	2024-09-18 16:55:53.718+02	218	378
PUBLISHER	\N	\N	2024-09-18 16:55:59.489+02	2024-09-18 16:55:59.489+02	180	378
DEVELOPER	\N	\N	2024-09-18 17:06:31.009+02	2024-09-18 17:06:31.009+02	216	379
PUBLISHER	\N	\N	2024-09-18 17:06:37.293+02	2024-09-18 17:06:37.293+02	180	379
DEVELOPER	\N	\N	2024-09-20 10:40:58.485+02	2024-09-20 10:40:58.485+02	61	380
DEVELOPER	\N	\N	2024-09-20 10:58:56.219+02	2024-09-20 10:58:56.219+02	219	381
PUBLISHER	\N	\N	2024-09-20 10:59:03.006+02	2024-09-20 10:59:03.006+02	61	381
DEVELOPER	\N	\N	2024-09-20 13:02:18.324+02	2024-09-20 13:02:18.324+02	96	382
DEVELOPER	\N	\N	2024-09-20 13:35:12.116+02	2024-09-20 13:35:12.116+02	109	383
DEVELOPER	\N	\N	2024-09-20 13:52:35.686+02	2024-09-20 13:52:35.686+02	61	384
DEVELOPER	\N	\N	2024-09-20 15:37:54.701+02	2024-09-20 15:37:54.701+02	61	385
DEVELOPER	\N	\N	2024-09-20 15:53:19.657+02	2024-09-20 15:53:19.657+02	30	386
DEVELOPER	\N	\N	2024-09-20 16:12:30.974+02	2024-09-20 16:12:30.974+02	134	387
PUBLISHER	\N	\N	2024-09-20 16:12:35.494+02	2024-09-20 16:12:35.494+02	60	387
DEVELOPER	\N	\N	2024-09-20 16:33:44.006+02	2024-09-20 16:33:44.006+02	220	388
DEVELOPER	\N	\N	2024-09-21 11:19:37.741+02	2024-09-21 11:19:37.741+02	28	389
DEVELOPER	\N	\N	2024-09-21 11:48:50.849+02	2024-09-21 11:48:50.849+02	107	390
PUBLISHER	\N	\N	2024-09-21 11:48:55.559+02	2024-09-21 11:48:55.559+02	221	390
DEVELOPER	\N	\N	2024-09-21 12:14:18.873+02	2024-09-21 12:14:18.873+02	224	391
PUBLISHER	\N	\N	2024-09-21 12:14:23.629+02	2024-09-21 12:14:23.629+02	25	391
DEVELOPER	\N	\N	2024-09-21 13:08:06.041+02	2024-09-21 13:08:06.041+02	225	392
PUBLISHER	\N	\N	2024-09-21 13:08:11.391+02	2024-09-21 13:08:11.391+02	138	392
DEVELOPER	\N	\N	2024-09-21 13:18:57.802+02	2024-09-21 13:18:57.802+02	29	393
DEVELOPER	\N	\N	2024-09-21 13:27:21.324+02	2024-09-21 13:27:21.324+02	29	394
PUBLISHER	\N	\N	2024-09-21 13:27:26.464+02	2024-09-21 13:27:26.464+02	112	394
DEVELOPER	\N	\N	2024-09-21 13:46:09.747+02	2024-09-21 13:46:09.747+02	29	395
PUBLISHER	\N	\N	2024-09-21 13:46:14.176+02	2024-09-21 13:46:14.176+02	112	395
DEVELOPER	\N	\N	2024-09-21 13:54:23.783+02	2024-09-21 13:54:23.783+02	29	396
PUBLISHER	\N	\N	2024-09-21 13:54:28.572+02	2024-09-21 13:54:28.572+02	112	396
DEVELOPER	\N	\N	2024-09-22 09:55:20.925+02	2024-09-22 09:55:20.925+02	11	397
DEVELOPER	\N	\N	2024-09-22 10:14:44.919+02	2024-09-22 10:14:44.919+02	125	398
DEVELOPER	\N	\N	2024-09-22 10:35:28.66+02	2024-09-22 10:35:28.66+02	28	399
DEVELOPER	\N	\N	2024-09-22 10:48:53.016+02	2024-09-22 10:48:53.016+02	226	400
PUBLISHER	\N	\N	2024-09-22 10:49:01.422+02	2024-09-22 10:49:01.422+02	28	400
DEVELOPER	\N	\N	2024-09-22 10:56:01.485+02	2024-09-22 10:56:01.485+02	28	401
DEVELOPER	\N	\N	2024-09-22 13:09:05.055+02	2024-09-22 13:09:05.055+02	227	402
PUBLISHER	\N	\N	2024-09-22 13:09:11.232+02	2024-09-22 13:09:11.232+02	32	402
DEVELOPER	\N	\N	2024-09-22 13:52:55.673+02	2024-09-22 13:52:55.673+02	227	403
PUBLISHER	\N	\N	2024-09-22 13:53:01.617+02	2024-09-22 13:53:01.617+02	228	403
DEVELOPER	\N	\N	2024-09-23 16:05:35.206+02	2024-09-23 16:05:35.206+02	109	404
DEVELOPER	\N	\N	2024-09-23 16:20:41.585+02	2024-09-23 16:20:41.585+02	41	405
DEVELOPER	\N	\N	2024-09-23 16:20:41.585+02	2024-09-23 16:20:41.585+02	107	405
PUBLISHER	\N	\N	2024-09-23 16:20:47.905+02	2024-09-23 16:20:47.905+02	221	405
DEVELOPER	\N	\N	2024-09-23 16:35:47.627+02	2024-09-23 16:35:47.627+02	1	406
DEVELOPER	\N	\N	2024-09-23 16:41:29.298+02	2024-09-23 16:41:29.298+02	1	407
DEVELOPER	\N	\N	2024-09-23 19:02:11.61+02	2024-09-23 19:02:11.61+02	178	408
DEVELOPER	\N	\N	2024-09-24 15:50:31.521+02	2024-09-24 15:50:31.521+02	229	409
PUBLISHER	\N	\N	2024-09-24 15:50:36.708+02	2024-09-24 15:50:36.708+02	186	409
DEVELOPER	\N	\N	2024-09-24 16:16:22.642+02	2024-09-24 16:16:22.642+02	1	410
DEVELOPER	\N	\N	2024-09-24 16:34:50.443+02	2024-09-24 16:34:50.443+02	127	411
PUBLISHER	\N	\N	2024-09-24 16:34:55.002+02	2024-09-24 16:34:55.002+02	68	411
DEVELOPER	\N	\N	2024-09-24 17:25:37.104+02	2024-09-24 17:25:37.104+02	184	412
PUBLISHER	\N	\N	2024-09-24 17:25:48.522+02	2024-09-24 17:25:48.522+02	186	412
DEVELOPER	\N	\N	2024-09-25 15:31:01.336+02	2024-09-25 15:31:01.336+02	30	413
DEVELOPER	\N	\N	2024-09-25 15:42:12.683+02	2024-09-25 15:42:12.683+02	30	414
DEVELOPER	\N	\N	2024-09-25 15:51:25.858+02	2024-09-25 15:51:25.858+02	30	415
DEVELOPER	\N	\N	2024-09-25 15:59:45.016+02	2024-09-25 15:59:45.016+02	30	416
DEVELOPER	\N	\N	2024-09-25 16:19:43.502+02	2024-09-25 16:19:43.502+02	1	417
DEVELOPER	\N	\N	2024-09-25 16:37:51.834+02	2024-09-25 16:37:51.834+02	1	418
DEVELOPER	\N	\N	2024-09-25 16:47:35.372+02	2024-09-25 16:47:35.372+02	139	419
PUBLISHER	\N	\N	2024-09-25 16:47:42.287+02	2024-09-25 16:47:42.287+02	221	419
DEVELOPER	\N	\N	2024-09-26 15:33:58.177+02	2024-09-26 15:33:58.177+02	126	420
DEVELOPER	\N	\N	2024-09-26 15:48:55.996+02	2024-09-26 15:48:55.996+02	31	421
PUBLISHER	\N	\N	2024-09-26 15:49:27.011+02	2024-09-26 15:49:27.011+02	32	421
DEVELOPER	\N	\N	2024-09-26 16:06:37.041+02	2024-09-26 16:06:37.041+02	61	422
DEVELOPER	\N	\N	2024-09-26 16:18:31.042+02	2024-09-26 16:18:31.042+02	29	423
DEVELOPER	\N	\N	2024-09-26 16:59:57.539+02	2024-09-26 16:59:57.539+02	1	424
DEVELOPER	\N	\N	2024-09-26 17:31:44.864+02	2024-09-26 17:31:44.864+02	61	425
DEVELOPER	\N	\N	2024-09-27 09:13:18.29+02	2024-09-27 09:13:18.29+02	231	426
PUBLISHER	\N	\N	2024-09-27 09:13:24.79+02	2024-09-27 09:13:24.79+02	1	426
\.


--
-- Data for Name: Game_Games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Game_Games" (id, type, "createdAt", "updatedAt", "parentGameId", "subGameId") FROM stdin;
2	COLLECTION	2024-08-09 09:30:05.943+02	2024-08-09 09:30:05.943+02	128	194
3	COLLECTION	2024-08-09 09:51:56.136+02	2024-08-09 09:51:56.136+02	51	194
4	COLLECTION	2024-08-22 17:37:53.21+02	2024-08-22 17:37:53.21+02	152	225
5	COLLECTION	2024-08-22 17:37:53.21+02	2024-08-22 17:37:53.21+02	224	225
6	SPINOFF	2024-09-20 13:50:41.538+02	2024-09-20 13:50:41.538+02	276	384
7	SPINOFF	2024-09-20 15:36:12.804+02	2024-09-20 15:36:12.804+02	276	385
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
\N	2024-07-17 16:39:02.494+02	2024-07-17 16:39:02.494+02	131	15
\N	2024-07-17 16:39:02.494+02	2024-07-17 16:39:02.494+02	131	41
\N	2024-07-17 21:04:49.777+02	2024-07-17 21:04:49.777+02	132	38
\N	2024-07-18 17:18:28.055+02	2024-07-18 17:18:28.055+02	133	2
\N	2024-07-19 15:44:01.696+02	2024-07-19 15:44:01.696+02	134	17
\N	2024-07-19 17:14:47.495+02	2024-07-19 17:14:47.495+02	135	54
\N	2024-07-21 11:15:48.658+02	2024-07-21 11:15:48.658+02	136	2
\N	2024-07-21 11:58:33.096+02	2024-07-21 11:58:33.096+02	137	2
\N	2024-07-21 13:23:08.951+02	2024-07-21 13:23:08.951+02	138	68
\N	2024-07-21 13:41:18.027+02	2024-07-21 13:41:18.027+02	132	71
\N	2024-07-21 13:50:12.187+02	2024-07-21 13:50:12.187+02	139	6
\N	2024-07-21 13:50:45.732+02	2024-07-21 13:50:45.732+02	139	35
\N	2024-07-21 13:50:45.732+02	2024-07-21 13:50:45.732+02	139	70
\N	2024-07-22 15:29:38.845+02	2024-07-22 15:29:38.845+02	140	52
\N	2024-07-22 15:30:01.354+02	2024-07-22 15:30:01.354+02	140	67
\N	2024-07-22 16:08:34.854+02	2024-07-22 16:08:34.854+02	141	2
\N	2024-07-22 17:04:44.176+02	2024-07-22 17:04:44.176+02	142	2
\N	2024-07-22 17:04:44.176+02	2024-07-22 17:04:44.176+02	142	38
\N	2024-07-23 16:18:54.92+02	2024-07-23 16:18:54.92+02	143	2
\N	2024-07-23 17:05:05.409+02	2024-07-23 17:05:05.409+02	144	2
\N	2024-07-24 16:06:15.048+02	2024-07-24 16:06:15.048+02	145	60
\N	2024-07-24 16:40:12.425+02	2024-07-24 16:40:12.425+02	146	8
\N	2024-07-25 17:40:43.926+02	2024-07-25 17:40:43.926+02	147	38
\N	2024-07-26 09:43:43.312+02	2024-07-26 09:43:43.312+02	148	38
\N	2024-07-26 09:43:43.312+02	2024-07-26 09:43:43.312+02	148	28
\N	2024-07-27 12:40:44.994+02	2024-07-27 12:40:44.994+02	149	38
\N	2024-07-27 12:40:44.994+02	2024-07-27 12:40:44.994+02	149	57
\N	2024-07-27 13:06:16.56+02	2024-07-27 13:06:16.56+02	150	41
\N	2024-07-27 13:52:19.022+02	2024-07-27 13:52:19.022+02	151	25
\N	2024-07-27 15:32:53.147+02	2024-07-27 15:32:53.147+02	152	57
\N	2024-07-28 11:42:29.352+02	2024-07-28 11:42:29.352+02	153	8
\N	2024-07-28 12:13:24.971+02	2024-07-28 12:13:24.971+02	154	22
\N	2024-07-28 12:53:23.544+02	2024-07-28 12:53:23.544+02	155	38
\N	2024-07-28 12:53:23.544+02	2024-07-28 12:53:23.544+02	155	63
\N	2024-07-28 13:11:16.659+02	2024-07-28 13:11:16.659+02	156	39
\N	2024-07-28 13:11:16.659+02	2024-07-28 13:11:16.659+02	156	59
\N	2024-07-28 13:34:00.088+02	2024-07-28 13:34:00.088+02	157	2
\N	2024-07-28 13:34:00.088+02	2024-07-28 13:34:00.088+02	157	38
\N	2024-07-28 23:25:06.167+02	2024-07-28 23:25:06.167+02	158	48
\N	2024-07-28 23:48:34.595+02	2024-07-28 23:48:34.595+02	159	23
\N	2024-07-29 21:12:40.65+02	2024-07-29 21:12:40.65+02	160	22
\N	2024-07-30 15:38:28.088+02	2024-07-30 15:38:28.088+02	161	61
\N	2024-07-30 16:47:28.83+02	2024-07-30 16:47:28.83+02	162	20
\N	2024-07-31 16:28:18.462+02	2024-07-31 16:28:18.462+02	163	2
\N	2024-07-31 16:28:34.17+02	2024-07-31 16:28:34.17+02	163	38
\N	2024-08-01 15:59:04.696+02	2024-08-01 15:59:04.696+02	164	54
\N	2024-08-01 16:56:36.459+02	2024-08-01 16:56:36.459+02	165	54
\N	2024-08-01 16:56:51.548+02	2024-08-01 16:56:51.548+02	165	21
\N	2024-08-02 08:41:55.887+02	2024-08-02 08:41:55.887+02	166	28
\N	2024-08-02 08:41:55.887+02	2024-08-02 08:41:55.887+02	166	27
\N	2024-08-02 09:31:51.607+02	2024-08-02 09:31:51.607+02	167	38
\N	2024-08-02 10:24:06.573+02	2024-08-02 10:24:06.573+02	168	71
\N	2024-08-02 10:40:32.933+02	2024-08-02 10:40:32.933+02	169	54
\N	2024-08-02 11:09:10.652+02	2024-08-02 11:09:10.652+02	170	58
\N	2024-08-02 11:09:10.652+02	2024-08-02 11:09:10.652+02	170	52
\N	2024-08-02 11:31:54.131+02	2024-08-02 11:31:54.131+02	171	59
\N	2024-08-02 11:31:54.131+02	2024-08-02 11:31:54.131+02	171	53
\N	2024-08-02 12:00:54.753+02	2024-08-02 12:00:54.753+02	172	49
\N	2024-08-02 12:14:01.115+02	2024-08-02 12:14:01.115+02	173	8
\N	2024-08-02 12:40:11.145+02	2024-08-02 12:40:11.145+02	174	25
\N	2024-08-03 10:25:03.239+02	2024-08-03 10:25:03.239+02	175	41
\N	2024-08-03 11:14:41.794+02	2024-08-03 11:14:41.794+02	176	54
\N	2024-08-03 11:35:40.086+02	2024-08-03 11:35:40.086+02	177	52
\N	2024-08-03 11:35:40.086+02	2024-08-03 11:35:40.086+02	177	34
\N	2024-08-03 12:21:36.246+02	2024-08-03 12:21:36.246+02	178	73
\N	2024-08-03 13:07:54.078+02	2024-08-03 13:07:54.078+02	179	25
\N	2024-08-03 13:43:25.357+02	2024-08-03 13:43:25.357+02	180	2
\N	2024-08-03 13:43:25.357+02	2024-08-03 13:43:25.357+02	180	38
\N	2024-08-04 12:06:59.141+02	2024-08-04 12:06:59.141+02	181	2
\N	2024-08-04 12:06:59.141+02	2024-08-04 12:06:59.141+02	181	38
\N	2024-08-04 12:21:32.253+02	2024-08-04 12:21:32.253+02	182	20
\N	2024-08-04 13:41:53.882+02	2024-08-04 13:41:53.882+02	183	2
\N	2024-08-04 21:04:13.154+02	2024-08-04 21:04:13.154+02	184	2
\N	2024-08-05 16:43:40.078+02	2024-08-05 16:43:40.078+02	185	25
\N	2024-08-05 16:43:40.078+02	2024-08-05 16:43:40.078+02	185	75
\N	2024-08-05 16:59:06.204+02	2024-08-05 16:59:06.204+02	186	76
\N	2024-08-05 16:59:06.204+02	2024-08-05 16:59:06.204+02	186	58
\N	2024-08-05 17:18:24.643+02	2024-08-05 17:18:24.643+02	187	25
\N	2024-08-06 16:43:47.693+02	2024-08-06 16:43:47.693+02	172	2
\N	2024-08-06 16:44:19.644+02	2024-08-06 16:44:19.644+02	188	2
\N	2024-08-06 16:44:19.644+02	2024-08-06 16:44:19.644+02	188	49
\N	2024-08-07 15:34:32.472+02	2024-08-07 15:34:32.472+02	189	54
\N	2024-08-07 15:49:30.86+02	2024-08-07 15:49:30.86+02	190	38
\N	2024-08-07 15:49:30.86+02	2024-08-07 15:49:30.86+02	190	2
\N	2024-08-07 16:34:19.557+02	2024-08-07 16:34:19.557+02	191	25
\N	2024-08-07 16:34:19.557+02	2024-08-07 16:34:19.557+02	191	41
\N	2024-08-07 16:43:57.54+02	2024-08-07 16:43:57.54+02	192	8
\N	2024-08-08 16:05:20.252+02	2024-08-08 16:05:20.252+02	193	34
\N	2024-08-08 16:05:20.252+02	2024-08-08 16:05:20.252+02	193	52
\N	2024-08-09 11:27:34.424+02	2024-08-09 11:27:34.424+02	195	59
\N	2024-08-09 11:27:34.424+02	2024-08-09 11:27:34.424+02	195	53
\N	2024-08-09 11:35:02.503+02	2024-08-09 11:35:02.503+02	196	38
\N	2024-08-09 11:53:09.921+02	2024-08-09 11:53:09.921+02	197	77
\N	2024-08-09 12:32:06.215+02	2024-08-09 12:32:06.215+02	198	76
\N	2024-08-09 12:32:36.709+02	2024-08-09 12:32:36.709+02	198	67
\N	2024-08-09 12:50:09.46+02	2024-08-09 12:50:09.46+02	199	54
\N	2024-08-09 13:45:44.996+02	2024-08-09 13:45:44.996+02	200	2
\N	2024-08-10 12:44:03.602+02	2024-08-10 12:44:03.602+02	202	2
\N	2024-08-10 12:44:03.602+02	2024-08-10 12:44:03.602+02	202	38
\N	2024-08-10 12:58:49.803+02	2024-08-10 12:58:49.803+02	203	25
\N	2024-08-10 13:19:28.127+02	2024-08-10 13:19:28.127+02	204	27
\N	2024-08-11 10:56:54.005+02	2024-08-11 10:56:54.005+02	78	78
\N	2024-08-11 12:04:42.426+02	2024-08-11 12:04:42.426+02	205	78
\N	2024-08-11 12:45:13.141+02	2024-08-11 12:45:13.141+02	206	54
\N	2024-08-11 13:24:05.829+02	2024-08-11 13:24:05.829+02	207	2
\N	2024-08-11 16:49:32.426+02	2024-08-11 16:49:32.426+02	208	79
\N	2024-08-12 16:11:48.119+02	2024-08-12 16:11:48.119+02	209	55
\N	2024-08-12 17:11:59.627+02	2024-08-12 17:11:59.627+02	210	2
\N	2024-08-13 16:27:00.05+02	2024-08-13 16:27:00.05+02	211	38
\N	2024-08-13 16:27:00.05+02	2024-08-13 16:27:00.05+02	211	2
\N	2024-08-13 16:47:44.289+02	2024-08-13 16:47:44.289+02	212	76
\N	2024-08-13 16:47:44.289+02	2024-08-13 16:47:44.289+02	212	58
\N	2024-08-14 17:06:38.681+02	2024-08-14 17:06:38.681+02	213	25
\N	2024-08-18 13:32:26.236+02	2024-08-18 13:32:26.236+02	214	2
\N	2024-08-18 13:32:26.236+02	2024-08-18 13:32:26.236+02	214	49
\N	2024-08-18 14:21:19.579+02	2024-08-18 14:21:19.579+02	215	52
\N	2024-08-18 14:21:19.579+02	2024-08-18 14:21:19.579+02	215	80
\N	2024-08-19 13:12:04.175+02	2024-08-19 13:12:04.175+02	216	2
\N	2024-08-19 13:12:04.175+02	2024-08-19 13:12:04.175+02	216	38
\N	2024-08-19 13:30:12.37+02	2024-08-19 13:30:12.37+02	217	41
\N	2024-08-19 13:30:12.37+02	2024-08-19 13:30:12.37+02	217	2
\N	2024-08-19 13:43:00.836+02	2024-08-19 13:43:00.836+02	218	68
\N	2024-08-19 14:14:56.517+02	2024-08-19 14:14:56.517+02	219	22
\N	2024-08-22 15:37:50.616+02	2024-08-22 15:37:50.616+02	220	38
\N	2024-08-22 15:37:50.616+02	2024-08-22 15:37:50.616+02	220	2
\N	2024-08-22 16:20:51.552+02	2024-08-22 16:20:51.552+02	221	72
\N	2024-08-22 16:33:20.475+02	2024-08-22 16:33:20.475+02	222	41
\N	2024-08-22 17:09:28.696+02	2024-08-22 17:09:28.696+02	223	54
\N	2024-08-22 17:27:51.053+02	2024-08-22 17:27:51.053+02	224	57
\N	2024-08-23 10:52:07.137+02	2024-08-23 10:52:07.137+02	226	81
\N	2024-08-23 10:52:12.318+02	2024-08-23 10:52:12.318+02	226	62
\N	2024-08-23 12:50:51.35+02	2024-08-23 12:50:51.35+02	227	2
\N	2024-08-23 12:50:51.35+02	2024-08-23 12:50:51.35+02	227	25
\N	2024-08-23 13:06:09.779+02	2024-08-23 13:06:09.779+02	228	53
\N	2024-08-23 13:06:09.779+02	2024-08-23 13:06:09.779+02	228	59
\N	2024-08-23 13:21:39.312+02	2024-08-23 13:21:39.312+02	229	38
\N	2024-08-23 13:21:39.312+02	2024-08-23 13:21:39.312+02	229	63
\N	2024-08-23 13:38:07+02	2024-08-23 13:38:07+02	230	15
\N	2024-08-23 16:17:44.253+02	2024-08-23 16:17:44.253+02	231	82
\N	2024-08-23 16:31:27.351+02	2024-08-23 16:31:27.351+02	232	20
\N	2024-08-23 16:46:48.397+02	2024-08-23 16:46:48.397+02	233	63
\N	2024-08-23 16:47:03.186+02	2024-08-23 16:47:03.186+02	233	38
\N	2024-08-24 10:44:35.966+02	2024-08-24 10:44:35.966+02	234	27
\N	2024-08-24 10:55:40.763+02	2024-08-24 10:55:40.763+02	235	52
\N	2024-08-24 10:55:40.763+02	2024-08-24 10:55:40.763+02	235	58
\N	2024-08-24 11:22:02.033+02	2024-08-24 11:22:02.033+02	236	35
\N	2024-08-24 11:22:02.033+02	2024-08-24 11:22:02.033+02	236	6
\N	2024-08-24 11:40:45.905+02	2024-08-24 11:40:45.905+02	237	38
\N	2024-08-24 11:40:45.905+02	2024-08-24 11:40:45.905+02	237	2
\N	2024-08-24 12:07:10.118+02	2024-08-24 12:07:10.118+02	238	27
\N	2024-08-24 13:43:15.334+02	2024-08-24 13:43:15.334+02	239	22
\N	2024-08-25 10:55:36.025+02	2024-08-25 10:55:36.025+02	240	2
\N	2024-08-25 11:56:23.572+02	2024-08-25 11:56:23.572+02	241	83
\N	2024-08-25 12:58:55.633+02	2024-08-25 12:58:55.633+02	242	54
\N	2024-08-25 13:11:14.145+02	2024-08-25 13:11:14.145+02	243	54
\N	2024-08-25 13:25:07.846+02	2024-08-25 13:25:07.846+02	244	49
\N	2024-08-25 13:25:57.411+02	2024-08-25 13:25:57.411+02	201	49
\N	2024-08-25 13:42:12.67+02	2024-08-25 13:42:12.67+02	245	8
\N	2024-08-25 13:42:12.67+02	2024-08-25 13:42:12.67+02	245	2
\N	2024-08-25 13:51:04.604+02	2024-08-25 13:51:04.604+02	246	8
\N	2024-08-25 13:51:04.604+02	2024-08-25 13:51:04.604+02	246	2
\N	2024-08-26 15:17:06.016+02	2024-08-26 15:17:06.016+02	247	72
\N	2024-08-26 15:26:01.337+02	2024-08-26 15:26:01.337+02	248	52
\N	2024-08-26 15:26:01.337+02	2024-08-26 15:26:01.337+02	248	66
\N	2024-08-26 15:37:43.87+02	2024-08-26 15:37:43.87+02	249	49
\N	2024-08-26 15:37:43.87+02	2024-08-26 15:37:43.87+02	249	2
\N	2024-08-26 15:48:32.72+02	2024-08-26 15:48:32.72+02	250	49
\N	2024-08-26 15:48:32.72+02	2024-08-26 15:48:32.72+02	250	2
\N	2024-08-26 16:04:26.508+02	2024-08-26 16:04:26.508+02	251	25
\N	2024-08-26 16:55:33.055+02	2024-08-26 16:55:33.055+02	252	2
\N	2024-08-27 16:16:15.796+02	2024-08-27 16:16:15.796+02	253	2
\N	2024-08-27 16:16:15.796+02	2024-08-27 16:16:15.796+02	253	38
\N	2024-08-27 17:01:49.615+02	2024-08-27 17:01:49.615+02	254	25
\N	2024-08-27 17:15:25.936+02	2024-08-27 17:15:25.936+02	255	54
\N	2024-08-28 15:54:55.388+02	2024-08-28 15:54:55.388+02	256	8
\N	2024-08-28 16:34:00.415+02	2024-08-28 16:34:00.415+02	257	2
\N	2024-08-28 16:47:16.698+02	2024-08-28 16:47:16.698+02	258	8
\N	2024-08-28 17:49:09.957+02	2024-08-28 17:49:09.957+02	259	54
\N	2024-08-28 17:49:09.957+02	2024-08-28 17:49:09.957+02	259	84
\N	2024-08-28 17:49:09.957+02	2024-08-28 17:49:09.957+02	259	21
\N	2024-08-28 17:57:25.021+02	2024-08-28 17:57:25.021+02	260	54
\N	2024-08-28 17:57:25.021+02	2024-08-28 17:57:25.021+02	260	84
\N	2024-08-28 17:57:25.021+02	2024-08-28 17:57:25.021+02	260	21
\N	2024-08-29 15:41:04.696+02	2024-08-29 15:41:04.696+02	261	2
\N	2024-08-29 15:56:43.327+02	2024-08-29 15:56:43.327+02	262	77
\N	2024-08-29 16:11:26.028+02	2024-08-29 16:11:26.028+02	263	41
\N	2024-08-29 16:23:13.244+02	2024-08-29 16:23:13.244+02	264	41
\N	2024-08-29 16:34:25.237+02	2024-08-29 16:34:25.237+02	265	38
\N	2024-08-29 16:34:25.237+02	2024-08-29 16:34:25.237+02	265	2
\N	2024-08-29 16:50:33.649+02	2024-08-29 16:50:33.649+02	266	73
\N	2024-08-29 17:10:23.435+02	2024-08-29 17:10:23.435+02	267	2
\N	2024-08-29 17:18:38.949+02	2024-08-29 17:18:38.949+02	268	2
\N	2024-08-29 17:18:38.949+02	2024-08-29 17:18:38.949+02	268	38
\N	2024-08-29 17:26:43.899+02	2024-08-29 17:26:43.899+02	269	72
\N	2024-08-29 20:58:15.13+02	2024-08-29 20:58:15.13+02	270	2
\N	2024-08-29 20:58:15.13+02	2024-08-29 20:58:15.13+02	270	49
\N	2024-08-29 21:14:21.911+02	2024-08-29 21:14:21.911+02	271	22
\N	2024-08-30 08:06:00.279+02	2024-08-30 08:06:00.279+02	272	85
\N	2024-08-30 09:01:10.36+02	2024-08-30 09:01:10.36+02	273	25
\N	2024-08-30 09:27:32.591+02	2024-08-30 09:27:32.591+02	274	86
\N	2024-08-30 09:35:27.473+02	2024-08-30 09:35:27.473+02	275	86
\N	2024-08-30 13:36:07.974+02	2024-08-30 13:36:07.974+02	276	48
\N	2024-08-31 11:41:09.098+02	2024-08-31 11:41:09.098+02	277	27
\N	2024-08-31 14:06:05.741+02	2024-08-31 14:06:05.741+02	278	87
\N	2024-09-01 10:11:47.627+02	2024-09-01 10:11:47.627+02	279	54
\N	2024-09-01 10:26:36.039+02	2024-09-01 10:26:36.039+02	280	59
\N	2024-09-01 10:26:36.039+02	2024-09-01 10:26:36.039+02	280	6
\N	2024-09-01 10:27:01.667+02	2024-09-01 10:27:01.667+02	280	35
\N	2024-09-01 10:42:30.356+02	2024-09-01 10:42:30.356+02	281	66
\N	2024-09-01 10:42:30.356+02	2024-09-01 10:42:30.356+02	281	52
\N	2024-09-01 10:42:30.356+02	2024-09-01 10:42:30.356+02	281	34
\N	2024-09-01 11:19:04.646+02	2024-09-01 11:19:04.646+02	282	68
\N	2024-09-01 12:45:16.855+02	2024-09-01 12:45:16.855+02	283	79
\N	2024-09-01 13:23:14.946+02	2024-09-01 13:23:14.946+02	284	38
\N	2024-09-02 16:02:51.157+02	2024-09-02 16:02:51.157+02	285	48
\N	2024-09-02 16:15:47.168+02	2024-09-02 16:15:47.168+02	286	22
\N	2024-09-02 17:06:35.416+02	2024-09-02 17:06:35.416+02	287	2
\N	2024-09-02 17:06:35.416+02	2024-09-02 17:06:35.416+02	287	38
\N	2024-09-02 17:26:22.541+02	2024-09-02 17:26:22.541+02	288	2
\N	2024-09-02 17:26:22.541+02	2024-09-02 17:26:22.541+02	288	38
\N	2024-09-02 17:44:05.761+02	2024-09-02 17:44:05.761+02	289	2
\N	2024-09-02 17:44:05.761+02	2024-09-02 17:44:05.761+02	289	38
\N	2024-09-03 16:28:08.709+02	2024-09-03 16:28:08.709+02	290	2
\N	2024-09-03 16:28:08.709+02	2024-09-03 16:28:08.709+02	290	38
\N	2024-09-03 16:38:13.593+02	2024-09-03 16:38:13.593+02	291	2
\N	2024-09-03 16:38:13.593+02	2024-09-03 16:38:13.593+02	291	38
\N	2024-09-03 16:57:19.898+02	2024-09-03 16:57:19.898+02	292	2
\N	2024-09-03 16:57:19.898+02	2024-09-03 16:57:19.898+02	292	38
\N	2024-09-03 17:23:49.715+02	2024-09-03 17:23:49.715+02	293	73
\N	2024-09-03 17:34:47.676+02	2024-09-03 17:34:47.676+02	294	73
\N	2024-09-04 15:30:15.948+02	2024-09-04 15:30:15.948+02	295	43
\N	2024-09-04 16:14:35.867+02	2024-09-04 16:14:35.867+02	296	2
\N	2024-09-04 16:14:35.867+02	2024-09-04 16:14:35.867+02	296	38
\N	2024-09-04 17:21:57.776+02	2024-09-04 17:21:57.776+02	297	25
\N	2024-09-05 15:53:06.037+02	2024-09-05 15:53:06.037+02	298	41
\N	2024-09-05 17:12:10.905+02	2024-09-05 17:12:10.905+02	299	2
\N	2024-09-05 17:12:10.905+02	2024-09-05 17:12:10.905+02	299	38
\N	2024-09-05 17:36:15.083+02	2024-09-05 17:36:15.083+02	300	25
\N	2024-09-05 17:53:47.556+02	2024-09-05 17:53:47.556+02	301	2
\N	2024-09-06 08:48:46.111+02	2024-09-06 08:48:46.111+02	302	20
\N	2024-09-06 09:04:38.667+02	2024-09-06 09:04:38.667+02	303	2
\N	2024-09-06 09:30:17.651+02	2024-09-06 09:30:17.651+02	304	8
\N	2024-09-06 10:25:17.206+02	2024-09-06 10:25:17.206+02	305	8
\N	2024-09-06 10:35:04.974+02	2024-09-06 10:35:04.974+02	306	8
\N	2024-09-06 10:47:26.116+02	2024-09-06 10:47:26.116+02	307	8
\N	2024-09-06 10:56:35.657+02	2024-09-06 10:56:35.657+02	308	15
\N	2024-09-06 11:10:43.643+02	2024-09-06 11:10:43.643+02	309	52
\N	2024-09-06 11:10:43.643+02	2024-09-06 11:10:43.643+02	309	67
\N	2024-09-06 11:22:40.929+02	2024-09-06 11:22:40.929+02	310	52
\N	2024-09-06 11:22:40.929+02	2024-09-06 11:22:40.929+02	310	67
\N	2024-09-06 11:31:09.954+02	2024-09-06 11:31:09.954+02	311	52
\N	2024-09-06 11:31:09.954+02	2024-09-06 11:31:09.954+02	311	34
\N	2024-09-06 13:04:25.523+02	2024-09-06 13:04:25.523+02	312	25
\N	2024-09-06 13:39:13.038+02	2024-09-06 13:39:13.038+02	313	38
\N	2024-09-06 16:34:30.95+02	2024-09-06 16:34:30.95+02	314	27
\N	2024-09-06 16:50:52.611+02	2024-09-06 16:50:52.611+02	315	2
\N	2024-09-06 17:02:37.417+02	2024-09-06 17:02:37.417+02	316	25
\N	2024-09-06 17:02:37.417+02	2024-09-06 17:02:37.417+02	316	2
\N	2024-09-06 17:12:40.579+02	2024-09-06 17:12:40.579+02	317	54
\N	2024-09-07 10:44:31.157+02	2024-09-07 10:44:31.157+02	318	85
\N	2024-09-07 11:00:48.178+02	2024-09-07 11:00:48.178+02	319	8
\N	2024-09-07 12:14:18.687+02	2024-09-07 12:14:18.687+02	320	52
\N	2024-09-07 12:14:18.687+02	2024-09-07 12:14:18.687+02	320	67
\N	2024-09-07 12:39:03.055+02	2024-09-07 12:39:03.055+02	322	52
\N	2024-09-07 12:39:03.055+02	2024-09-07 12:39:03.055+02	322	67
\N	2024-09-07 13:43:18.459+02	2024-09-07 13:43:18.459+02	323	2
\N	2024-09-07 13:44:49.497+02	2024-09-07 13:44:49.497+02	323	38
\N	2024-09-08 09:30:37.257+02	2024-09-08 09:30:37.257+02	324	2
\N	2024-09-08 09:30:37.257+02	2024-09-08 09:30:37.257+02	324	38
\N	2024-09-08 09:39:27.683+02	2024-09-08 09:39:27.683+02	325	2
\N	2024-09-08 09:49:33.168+02	2024-09-08 09:49:33.168+02	326	2
\N	2024-09-08 10:12:21.665+02	2024-09-08 10:12:21.665+02	327	63
\N	2024-09-08 10:12:21.665+02	2024-09-08 10:12:21.665+02	327	38
\N	2024-09-08 11:07:10.191+02	2024-09-08 11:07:10.191+02	328	19
\N	2024-09-08 11:07:26.216+02	2024-09-08 11:07:26.216+02	328	38
\N	2024-09-08 12:02:09.182+02	2024-09-08 12:02:09.182+02	329	52
\N	2024-09-09 15:42:32.344+02	2024-09-09 15:42:32.344+02	330	2
\N	2024-09-09 16:28:23.732+02	2024-09-09 16:28:23.732+02	331	2
\N	2024-09-09 16:37:06.769+02	2024-09-09 16:37:06.769+02	332	2
\N	2024-09-09 16:53:39.257+02	2024-09-09 16:53:39.257+02	333	8
\N	2024-09-09 17:01:22.739+02	2024-09-09 17:01:22.739+02	334	8
\N	2024-09-09 17:23:58.871+02	2024-09-09 17:23:58.871+02	335	54
\N	2024-09-09 17:32:59.84+02	2024-09-09 17:32:59.84+02	336	73
\N	2024-09-09 17:48:51.872+02	2024-09-09 17:48:51.872+02	337	57
\N	2024-09-10 15:24:49.862+02	2024-09-10 15:24:49.862+02	338	41
\N	2024-09-10 16:20:12.613+02	2024-09-10 16:20:12.613+02	339	2
\N	2024-09-10 16:42:09.638+02	2024-09-10 16:42:09.638+02	340	22
\N	2024-09-11 10:44:16.111+02	2024-09-11 10:44:16.111+02	341	2
\N	2024-09-11 10:58:30.95+02	2024-09-11 10:58:30.95+02	342	2
\N	2024-09-11 11:08:22.247+02	2024-09-11 11:08:22.247+02	343	2
\N	2024-09-11 11:18:04.31+02	2024-09-11 11:18:04.31+02	344	72
\N	2024-09-11 11:38:21.683+02	2024-09-11 11:38:21.683+02	345	41
\N	2024-09-11 12:03:52.941+02	2024-09-11 12:03:52.941+02	346	53
\N	2024-09-11 12:03:52.941+02	2024-09-11 12:03:52.941+02	346	8
\N	2024-09-11 12:16:34.401+02	2024-09-11 12:16:34.401+02	347	2
\N	2024-09-11 13:51:00.246+02	2024-09-11 13:51:00.246+02	348	41
\N	2024-09-11 14:11:45.754+02	2024-09-11 14:11:45.754+02	349	54
\N	2024-09-11 17:19:24.402+02	2024-09-11 17:19:24.402+02	350	54
\N	2024-09-11 17:19:24.402+02	2024-09-11 17:19:24.402+02	350	21
\N	2024-09-11 17:30:54.107+02	2024-09-11 17:30:54.107+02	351	82
\N	2024-09-12 15:26:09.087+02	2024-09-12 15:26:09.087+02	352	38
\N	2024-09-12 15:26:09.087+02	2024-09-12 15:26:09.087+02	352	37
\N	2024-09-12 15:35:20.373+02	2024-09-12 15:35:20.373+02	353	21
\N	2024-09-12 15:35:20.373+02	2024-09-12 15:35:20.373+02	353	20
\N	2024-09-12 15:43:10.892+02	2024-09-12 15:43:10.892+02	354	21
\N	2024-09-12 15:43:10.892+02	2024-09-12 15:43:10.892+02	354	20
\N	2024-09-12 16:23:01.173+02	2024-09-12 16:23:01.173+02	355	27
\N	2024-09-12 17:02:09.318+02	2024-09-12 17:02:09.318+02	356	2
\N	2024-09-13 07:53:44.239+02	2024-09-13 07:53:44.239+02	357	8
\N	2024-09-13 10:01:26.799+02	2024-09-13 10:01:26.799+02	358	38
\N	2024-09-13 10:01:26.799+02	2024-09-13 10:01:26.799+02	358	63
\N	2024-09-13 10:27:04.755+02	2024-09-13 10:27:04.755+02	359	30
\N	2024-09-13 10:40:38.935+02	2024-09-13 10:40:38.935+02	360	76
\N	2024-09-13 10:40:38.935+02	2024-09-13 10:40:38.935+02	360	58
\N	2024-09-13 11:00:53.264+02	2024-09-13 11:00:53.264+02	361	22
\N	2024-09-13 11:30:14.34+02	2024-09-13 11:30:14.34+02	362	8
\N	2024-09-13 13:36:30.039+02	2024-09-13 13:36:30.039+02	363	38
\N	2024-09-14 11:48:19.396+02	2024-09-14 11:48:19.396+02	364	88
\N	2024-09-14 11:48:19.396+02	2024-09-14 11:48:19.396+02	364	52
\N	2024-09-14 12:26:28.115+02	2024-09-14 12:26:28.115+02	365	54
\N	2024-09-14 13:31:31.537+02	2024-09-14 13:31:31.537+02	366	89
\N	2024-09-14 13:31:43.249+02	2024-09-14 13:31:43.249+02	366	72
\N	2024-09-15 09:44:57.629+02	2024-09-15 09:44:57.629+02	367	48
\N	2024-09-15 10:07:33.049+02	2024-09-15 10:07:33.049+02	368	76
\N	2024-09-15 10:07:33.049+02	2024-09-15 10:07:33.049+02	368	58
\N	2024-09-15 10:56:17.779+02	2024-09-15 10:56:17.779+02	369	2
\N	2024-09-15 12:47:50.966+02	2024-09-15 12:47:50.966+02	370	48
\N	2024-09-15 13:30:44.038+02	2024-09-15 13:30:44.038+02	371	90
\N	2024-09-15 13:30:44.038+02	2024-09-15 13:30:44.038+02	371	29
\N	2024-09-15 13:30:44.038+02	2024-09-15 13:30:44.038+02	371	75
\N	2024-09-16 15:33:16.791+02	2024-09-16 15:33:16.791+02	372	2
\N	2024-09-16 16:27:52.845+02	2024-09-16 16:27:52.845+02	373	35
\N	2024-09-16 16:27:52.845+02	2024-09-16 16:27:52.845+02	373	6
\N	2024-09-16 16:42:24.622+02	2024-09-16 16:42:24.622+02	374	22
\N	2024-09-16 16:42:24.622+02	2024-09-16 16:42:24.622+02	374	35
\N	2024-09-16 17:03:25.998+02	2024-09-16 17:03:25.998+02	375	2
\N	2024-09-17 16:20:43.926+02	2024-09-17 16:20:43.926+02	376	79
\N	2024-09-17 16:20:55.555+02	2024-09-17 16:20:55.555+02	376	38
\N	2024-09-18 16:22:42.994+02	2024-09-18 16:22:42.994+02	377	91
\N	2024-09-18 16:55:26.338+02	2024-09-18 16:55:26.338+02	378	22
\N	2024-09-18 16:55:26.338+02	2024-09-18 16:55:26.338+02	378	44
\N	2024-09-18 17:05:15.777+02	2024-09-18 17:05:15.777+02	379	44
\N	2024-09-20 10:40:23.594+02	2024-09-20 10:40:23.594+02	380	38
\N	2024-09-20 10:40:23.594+02	2024-09-20 10:40:23.594+02	380	2
\N	2024-09-20 10:58:18.36+02	2024-09-20 10:58:18.36+02	381	2
\N	2024-09-20 10:58:18.36+02	2024-09-20 10:58:18.36+02	381	38
\N	2024-09-20 13:01:20.881+02	2024-09-20 13:01:20.881+02	382	48
\N	2024-09-20 13:34:37.467+02	2024-09-20 13:34:37.467+02	383	54
\N	2024-09-20 13:51:07.76+02	2024-09-20 13:51:07.76+02	384	48
\N	2024-09-20 15:35:57.316+02	2024-09-20 15:35:57.316+02	385	48
\N	2024-09-20 15:52:33.821+02	2024-09-20 15:52:33.821+02	386	39
\N	2024-09-20 15:52:48.108+02	2024-09-20 15:52:48.108+02	386	59
\N	2024-09-20 16:12:04.372+02	2024-09-20 16:12:04.372+02	387	72
\N	2024-09-20 16:33:25.776+02	2024-09-20 16:33:25.776+02	388	72
\N	2024-09-21 11:18:41.999+02	2024-09-21 11:18:41.999+02	389	35
\N	2024-09-21 11:19:12.451+02	2024-09-21 11:19:12.451+02	389	6
\N	2024-09-21 11:48:28.308+02	2024-09-21 11:48:28.308+02	390	41
\N	2024-09-21 12:13:30.751+02	2024-09-21 12:13:30.751+02	391	22
\N	2024-09-21 13:07:44.391+02	2024-09-21 13:07:44.391+02	392	2
\N	2024-09-21 13:18:38.512+02	2024-09-21 13:18:38.512+02	393	73
\N	2024-09-21 13:27:07.22+02	2024-09-21 13:27:07.22+02	394	73
\N	2024-09-21 13:45:53.986+02	2024-09-21 13:45:53.986+02	395	92
\N	2024-09-21 13:54:09.737+02	2024-09-21 13:54:09.737+02	396	92
\N	2024-09-22 09:51:47.859+02	2024-09-22 09:51:47.859+02	397	93
\N	2024-09-22 10:13:20.307+02	2024-09-22 10:13:20.307+02	398	46
\N	2024-09-22 10:33:06.652+02	2024-09-22 10:33:06.652+02	399	20
\N	2024-09-22 10:33:06.652+02	2024-09-22 10:33:06.652+02	399	71
\N	2024-09-22 10:47:28.603+02	2024-09-22 10:47:28.603+02	400	20
\N	2024-09-22 10:47:28.603+02	2024-09-22 10:47:28.603+02	400	21
\N	2024-09-22 10:55:43.8+02	2024-09-22 10:55:43.8+02	401	20
\N	2024-09-22 13:01:58.367+02	2024-09-22 13:01:58.367+02	402	28
\N	2024-09-22 13:01:58.367+02	2024-09-22 13:01:58.367+02	402	27
\N	2024-09-22 13:52:15.543+02	2024-09-22 13:52:15.543+02	403	28
\N	2024-09-22 13:52:15.543+02	2024-09-22 13:52:15.543+02	403	27
\N	2024-09-23 16:05:14.77+02	2024-09-23 16:05:14.77+02	404	54
\N	2024-09-23 16:19:55.274+02	2024-09-23 16:19:55.274+02	405	2
\N	2024-09-23 16:19:55.274+02	2024-09-23 16:19:55.274+02	405	38
\N	2024-09-23 16:35:29.07+02	2024-09-23 16:35:29.07+02	406	2
\N	2024-09-23 16:35:29.07+02	2024-09-23 16:35:29.07+02	406	49
\N	2024-09-23 16:41:11.461+02	2024-09-23 16:41:11.461+02	407	2
\N	2024-09-23 16:41:11.461+02	2024-09-23 16:41:11.461+02	407	49
\N	2024-09-23 19:01:23.449+02	2024-09-23 19:01:23.449+02	408	54
\N	2024-09-24 15:49:40.927+02	2024-09-24 15:49:40.927+02	409	2
\N	2024-09-24 15:49:40.927+02	2024-09-24 15:49:40.927+02	409	27
\N	2024-09-24 16:15:38.052+02	2024-09-24 16:15:38.052+02	410	2
\N	2024-09-24 16:34:31.819+02	2024-09-24 16:34:31.819+02	411	8
\N	2024-09-24 17:24:31.436+02	2024-09-24 17:24:31.436+02	412	2
\N	2024-09-24 17:24:31.436+02	2024-09-24 17:24:31.436+02	412	41
\N	2024-09-25 15:30:29.02+02	2024-09-25 15:30:29.02+02	413	25
\N	2024-09-25 15:41:32.594+02	2024-09-25 15:41:32.594+02	414	25
\N	2024-09-25 15:51:13.186+02	2024-09-25 15:51:13.186+02	415	2
\N	2024-09-25 15:51:13.186+02	2024-09-25 15:51:13.186+02	415	25
\N	2024-09-25 15:58:51.764+02	2024-09-25 15:58:51.764+02	416	25
\N	2024-09-25 16:19:18.757+02	2024-09-25 16:19:18.757+02	417	2
\N	2024-09-25 16:37:13.957+02	2024-09-25 16:37:13.957+02	418	25
\N	2024-09-25 16:46:56.488+02	2024-09-25 16:46:56.488+02	419	2
\N	2024-09-26 15:32:06.44+02	2024-09-26 15:32:06.44+02	420	54
\N	2024-09-26 15:32:21.98+02	2024-09-26 15:32:21.98+02	420	84
\N	2024-09-26 15:38:50.492+02	2024-09-26 15:38:50.492+02	398	10
\N	2024-09-26 15:39:35.222+02	2024-09-26 15:39:35.222+02	364	34
\N	2024-09-26 15:48:30.49+02	2024-09-26 15:48:30.49+02	421	94
\N	2024-09-26 16:05:58.242+02	2024-09-26 16:05:58.242+02	422	25
\N	2024-09-26 16:18:03.597+02	2024-09-26 16:18:03.597+02	423	66
\N	2024-09-26 16:18:03.597+02	2024-09-26 16:18:03.597+02	423	52
\N	2024-09-26 16:18:03.597+02	2024-09-26 16:18:03.597+02	423	34
\N	2024-09-26 16:59:34.528+02	2024-09-26 16:59:34.528+02	424	2
\N	2024-09-26 17:30:57.455+02	2024-09-26 17:30:57.455+02	425	2
\N	2024-09-27 09:12:38.224+02	2024-09-27 09:12:38.224+02	426	38
\N	2024-09-27 09:12:38.224+02	2024-09-27 09:12:38.224+02	426	2
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
\N	2024-07-17 21:05:37.172+02	2024-07-17 21:05:37.172+02	27	132
\N	2024-07-17 21:05:37.172+02	2024-07-17 21:05:37.172+02	67	132
\N	2024-07-18 17:24:11.521+02	2024-07-18 17:24:11.521+02	68	133
\N	2024-07-19 17:15:03.897+02	2024-07-19 17:15:03.897+02	70	135
\N	2024-07-21 11:16:08.654+02	2024-07-21 11:16:08.654+02	67	136
\N	2024-07-21 11:16:08.654+02	2024-07-21 11:16:08.654+02	27	136
\N	2024-07-21 11:58:52.814+02	2024-07-21 11:58:52.814+02	71	137
\N	2024-07-21 13:23:45.441+02	2024-07-21 13:23:45.441+02	73	138
\N	2024-07-21 13:23:45.441+02	2024-07-21 13:23:45.441+02	72	138
\N	2024-07-21 13:51:02.832+02	2024-07-21 13:51:02.832+02	75	139
\N	2024-07-22 15:30:06.267+02	2024-07-22 15:30:06.267+02	66	140
\N	2024-07-22 17:05:23.85+02	2024-07-22 17:05:23.85+02	76	142
\N	2024-07-23 16:19:04.224+02	2024-07-23 16:19:04.224+02	77	143
\N	2024-07-23 17:05:29.122+02	2024-07-23 17:05:29.122+02	72	144
\N	2024-07-24 16:40:41.674+02	2024-07-24 16:40:41.674+02	78	146
\N	2024-07-26 09:44:01.702+02	2024-07-26 09:44:01.702+02	79	148
\N	2024-07-27 12:41:15.326+02	2024-07-27 12:41:15.326+02	80	149
\N	2024-07-27 12:41:15.326+02	2024-07-27 12:41:15.326+02	81	149
\N	2024-07-27 13:52:51.307+02	2024-07-27 13:52:51.307+02	62	151
\N	2024-07-28 12:13:41.738+02	2024-07-28 12:13:41.738+02	82	154
\N	2024-07-28 12:55:18.483+02	2024-07-28 12:55:18.483+02	83	155
\N	2024-07-28 13:34:37.901+02	2024-07-28 13:34:37.901+02	76	157
\N	2024-07-28 23:25:17.414+02	2024-07-28 23:25:17.414+02	63	158
\N	2024-07-28 23:48:59.896+02	2024-07-28 23:48:59.896+02	22	159
\N	2024-07-29 21:12:51.504+02	2024-07-29 21:12:51.504+02	84	160
\N	2024-07-30 15:38:40.816+02	2024-07-30 15:38:40.816+02	58	161
\N	2024-07-30 16:47:45.776+02	2024-07-30 16:47:45.776+02	85	162
\N	2024-07-31 16:28:49.155+02	2024-07-31 16:28:49.155+02	86	163
\N	2024-08-01 15:59:32.639+02	2024-08-01 15:59:32.639+02	88	164
\N	2024-08-01 16:56:28.923+02	2024-08-01 16:56:28.923+02	1	165
\N	2024-08-01 16:56:28.923+02	2024-08-01 16:56:28.923+02	77	165
\N	2024-08-02 08:42:08.104+02	2024-08-02 08:42:08.104+02	79	166
\N	2024-08-02 10:24:19.519+02	2024-08-02 10:24:19.519+02	90	168
\N	2024-08-02 10:40:56.206+02	2024-08-02 10:40:56.206+02	70	169
\N	2024-08-02 11:32:05.7+02	2024-08-02 11:32:05.7+02	66	171
\N	2024-08-02 12:40:22.62+02	2024-08-02 12:40:22.62+02	62	174
\N	2024-08-03 11:14:54.734+02	2024-08-03 11:14:54.734+02	70	176
\N	2024-08-03 13:43:39.906+02	2024-08-03 13:43:39.906+02	46	180
\N	2024-08-04 12:07:26.175+02	2024-08-04 12:07:26.175+02	46	181
\N	2024-08-04 12:23:41.317+02	2024-08-04 12:23:41.317+02	24	182
\N	2024-08-04 13:41:42.845+02	2024-08-04 13:41:42.845+02	91	183
\N	2024-08-04 21:04:47.468+02	2024-08-04 21:04:47.468+02	27	184
\N	2024-08-04 21:04:57.769+02	2024-08-04 21:04:57.769+02	67	184
\N	2024-08-05 17:18:41.809+02	2024-08-05 17:18:41.809+02	62	187
\N	2024-08-06 16:44:33.982+02	2024-08-06 16:44:33.982+02	92	188
\N	2024-08-07 15:34:48.36+02	2024-08-07 15:34:48.36+02	88	189
\N	2024-08-07 15:50:00.096+02	2024-08-07 15:50:00.096+02	86	190
\N	2024-08-07 16:44:44.78+02	2024-08-07 16:44:44.78+02	47	192
\N	2024-08-09 13:46:21.365+02	2024-08-09 13:46:21.365+02	72	200
\N	2024-08-11 12:04:48.39+02	2024-08-11 12:04:48.39+02	93	205
\N	2024-08-11 12:50:30.017+02	2024-08-11 12:50:30.017+02	94	206
\N	2024-08-11 13:24:32.073+02	2024-08-11 13:24:32.073+02	46	207
\N	2024-08-11 16:49:50.496+02	2024-08-11 16:49:50.496+02	95	208
\N	2024-08-12 16:12:01.109+02	2024-08-12 16:12:01.109+02	96	209
\N	2024-08-13 16:27:33.357+02	2024-08-13 16:27:33.357+02	76	211
\N	2024-08-13 16:47:57.321+02	2024-08-13 16:47:57.321+02	97	212
\N	2024-08-19 13:11:57.025+02	2024-08-19 13:11:57.025+02	68	216
\N	2024-08-19 14:15:23.442+02	2024-08-19 14:15:23.442+02	84	219
\N	2024-08-22 16:21:02.211+02	2024-08-22 16:21:02.211+02	98	221
\N	2024-08-22 17:09:54.514+02	2024-08-22 17:09:54.514+02	99	223
\N	2024-08-23 10:52:31.138+02	2024-08-23 10:52:31.138+02	90	226
\N	2024-08-23 13:06:27.85+02	2024-08-23 13:06:27.85+02	66	228
\N	2024-08-23 13:38:23.422+02	2024-08-23 13:38:23.422+02	23	230
\N	2024-08-23 16:31:38.731+02	2024-08-23 16:31:38.731+02	24	232
\N	2024-08-23 16:47:14.615+02	2024-08-23 16:47:14.615+02	83	233
\N	2024-08-24 11:22:34.629+02	2024-08-24 11:22:34.629+02	101	236
\N	2024-08-24 13:43:40.919+02	2024-08-24 13:43:40.919+02	84	239
\N	2024-08-25 10:56:01.773+02	2024-08-25 10:56:01.773+02	67	240
\N	2024-08-25 12:59:24.932+02	2024-08-25 12:59:24.932+02	70	242
\N	2024-08-25 13:11:24.599+02	2024-08-25 13:11:24.599+02	88	243
\N	2024-08-25 13:42:26.865+02	2024-08-25 13:42:26.865+02	56	245
\N	2024-08-26 15:26:10.168+02	2024-08-26 15:26:10.168+02	66	248
\N	2024-08-27 17:15:50.248+02	2024-08-27 17:15:50.248+02	99	255
\N	2024-08-28 15:55:05.811+02	2024-08-28 15:55:05.811+02	47	256
\N	2024-08-28 17:49:32.304+02	2024-08-28 17:49:32.304+02	104	259
\N	2024-08-28 17:57:49.852+02	2024-08-28 17:57:49.852+02	104	260
\N	2024-08-29 15:40:24.075+02	2024-08-29 15:40:24.075+02	71	261
\N	2024-08-29 17:10:30.476+02	2024-08-29 17:10:30.476+02	105	267
\N	2024-08-29 17:18:52.605+02	2024-08-29 17:18:52.605+02	105	268
\N	2024-08-29 17:26:54.683+02	2024-08-29 17:26:54.683+02	98	269
\N	2024-08-29 20:59:02.685+02	2024-08-29 20:59:02.685+02	92	270
\N	2024-08-29 21:14:44.094+02	2024-08-29 21:14:44.094+02	106	271
\N	2024-08-30 09:28:02.324+02	2024-08-30 09:28:02.324+02	72	274
\N	2024-08-30 09:35:41.714+02	2024-08-30 09:35:41.714+02	72	275
\N	2024-08-30 13:36:33.647+02	2024-08-30 13:36:33.647+02	56	276
\N	2024-08-31 11:41:17.877+02	2024-08-31 11:41:17.877+02	109	277
\N	2024-08-31 14:06:20.262+02	2024-08-31 14:06:20.262+02	53	278
\N	2024-09-01 10:12:11.54+02	2024-09-01 10:12:11.54+02	88	279
\N	2024-09-01 11:19:39.674+02	2024-09-01 11:19:39.674+02	74	282
\N	2024-09-01 11:19:39.674+02	2024-09-01 11:19:39.674+02	110	282
\N	2024-09-01 12:45:45.544+02	2024-09-01 12:45:45.544+02	111	283
\N	2024-09-01 13:23:48.487+02	2024-09-01 13:23:48.487+02	67	284
\N	2024-09-02 16:03:06.725+02	2024-09-02 16:03:06.725+02	63	285
\N	2024-09-02 16:16:03.201+02	2024-09-02 16:16:03.201+02	84	286
\N	2024-09-03 16:28:39.42+02	2024-09-03 16:28:39.42+02	46	290
\N	2024-09-03 17:35:20.016+02	2024-09-03 17:35:20.016+02	112	294
\N	2024-09-04 15:30:07.476+02	2024-09-04 15:30:07.476+02	90	295
\N	2024-09-04 16:17:32.308+02	2024-09-04 16:17:32.308+02	46	296
\N	2024-09-04 17:22:43.747+02	2024-09-04 17:22:43.747+02	37	297
\N	2024-09-04 17:22:43.747+02	2024-09-04 17:22:43.747+02	38	297
\N	2024-09-06 11:10:49.717+02	2024-09-06 11:10:49.717+02	66	309
\N	2024-09-06 16:34:43.444+02	2024-09-06 16:34:43.444+02	113	314
\N	2024-09-08 11:07:39.944+02	2024-09-08 11:07:39.944+02	75	328
\N	2024-09-09 17:24:33.888+02	2024-09-09 17:24:33.888+02	99	335
\N	2024-09-11 13:54:08.213+02	2024-09-11 13:54:08.213+02	115	348
\N	2024-09-11 17:22:12.991+02	2024-09-11 17:22:12.991+02	116	350
\N	2024-09-11 17:31:30.785+02	2024-09-11 17:31:30.785+02	116	351
\N	2024-09-12 15:35:43.083+02	2024-09-12 15:35:43.083+02	51	353
\N	2024-09-12 15:35:50.812+02	2024-09-12 15:35:50.812+02	52	353
\N	2024-09-12 15:43:26.668+02	2024-09-12 15:43:26.668+02	51	354
\N	2024-09-12 15:43:26.668+02	2024-09-12 15:43:26.668+02	52	354
\N	2024-09-12 17:02:44.775+02	2024-09-12 17:02:44.775+02	117	356
\N	2024-09-13 10:27:30.549+02	2024-09-13 10:27:30.549+02	119	359
\N	2024-09-14 11:49:09.024+02	2024-09-14 11:49:09.024+02	80	364
\N	2024-09-14 11:49:09.024+02	2024-09-14 11:49:09.024+02	121	364
\N	2024-09-14 13:31:56.217+02	2024-09-14 13:31:56.217+02	123	366
\N	2024-09-14 13:31:56.217+02	2024-09-14 13:31:56.217+02	122	366
\N	2024-09-15 10:07:48.206+02	2024-09-15 10:07:48.206+02	66	368
\N	2024-09-15 12:48:03.347+02	2024-09-15 12:48:03.347+02	124	370
\N	2024-09-15 12:48:03.347+02	2024-09-15 12:48:03.347+02	125	370
\N	2024-09-16 15:33:40.861+02	2024-09-16 15:33:40.861+02	74	372
\N	2024-09-16 16:28:15.384+02	2024-09-16 16:28:15.384+02	127	373
\N	2024-09-16 16:28:15.384+02	2024-09-16 16:28:15.384+02	126	373
\N	2024-09-16 16:43:14.762+02	2024-09-16 16:43:14.762+02	127	374
\N	2024-09-16 16:43:14.762+02	2024-09-16 16:43:14.762+02	126	374
\N	2024-09-17 16:21:38.469+02	2024-09-17 16:21:38.469+02	128	376
\N	2024-09-18 16:23:04.788+02	2024-09-18 16:23:04.788+02	129	377
\N	2024-09-20 13:34:54.491+02	2024-09-20 13:34:54.491+02	88	383
\N	2024-09-20 13:51:53.766+02	2024-09-20 13:51:53.766+02	56	384
\N	2024-09-20 15:37:13.049+02	2024-09-20 15:37:13.049+02	56	385
\N	2024-09-20 16:12:09.842+02	2024-09-20 16:12:09.842+02	98	387
\N	2024-09-20 16:33:32.451+02	2024-09-20 16:33:32.451+02	130	388
\N	2024-09-21 11:19:24.044+02	2024-09-21 11:19:24.044+02	101	389
\N	2024-09-21 12:13:43.349+02	2024-09-21 12:13:43.349+02	131	391
\N	2024-09-22 10:14:31.101+02	2024-09-22 10:14:31.101+02	96	398
\N	2024-09-22 10:33:25.2+02	2024-09-22 10:33:25.2+02	24	399
\N	2024-09-22 10:48:40.732+02	2024-09-22 10:48:40.732+02	24	400
\N	2024-09-22 10:55:56.33+02	2024-09-22 10:55:56.33+02	24	401
\N	2024-09-26 15:33:40.603+02	2024-09-26 15:33:40.603+02	104	420
\N	2024-09-26 17:31:15.984+02	2024-09-26 17:31:15.984+02	46	425
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
\N	2024-07-17 15:32:16.574+02	2024-07-17 15:32:16.574+02	110	19
\N	2024-07-17 15:34:21.91+02	2024-07-17 15:34:21.91+02	95	19
\N	2024-07-17 15:34:59.246+02	2024-07-17 15:34:59.246+02	84	19
\N	2024-07-17 15:45:08.009+02	2024-07-17 15:45:08.009+02	13	20
\N	2024-07-17 15:45:40.866+02	2024-07-17 15:45:40.866+02	123	20
\N	2024-07-17 15:46:18.534+02	2024-07-17 15:46:18.534+02	23	20
\N	2024-07-17 15:46:41.587+02	2024-07-17 15:46:41.587+02	26	20
\N	2024-07-17 15:47:05.331+02	2024-07-17 15:47:05.331+02	28	20
\N	2024-07-17 15:47:27.817+02	2024-07-17 15:47:27.817+02	27	20
\N	2024-07-17 15:48:05.903+02	2024-07-17 15:48:05.903+02	31	20
\N	2024-07-17 15:48:28.307+02	2024-07-17 15:48:28.307+02	25	20
\N	2024-07-17 15:48:44.633+02	2024-07-17 15:48:44.633+02	84	20
\N	2024-07-17 15:49:11.233+02	2024-07-17 15:49:11.233+02	111	20
\N	2024-07-17 15:49:35.285+02	2024-07-17 15:49:35.285+02	95	20
\N	2024-07-17 15:49:49.02+02	2024-07-17 15:49:49.02+02	89	20
\N	2024-07-17 15:50:13.834+02	2024-07-17 15:50:13.834+02	33	20
\N	2024-07-17 15:50:37.783+02	2024-07-17 15:50:37.783+02	34	20
\N	2024-07-17 15:51:11.975+02	2024-07-17 15:51:11.975+02	56	20
\N	2024-07-17 16:39:34.979+02	2024-07-17 16:39:34.979+02	131	5
\N	2024-07-17 16:39:34.979+02	2024-07-17 16:39:34.979+02	131	4
\N	2024-07-17 16:39:34.979+02	2024-07-17 16:39:34.979+02	131	12
\N	2024-07-17 21:05:59.07+02	2024-07-17 21:05:59.07+02	132	12
\N	2024-07-17 21:05:59.07+02	2024-07-17 21:05:59.07+02	132	19
\N	2024-07-18 17:25:07.875+02	2024-07-18 17:25:07.875+02	133	5
\N	2024-07-18 17:25:07.875+02	2024-07-18 17:25:07.875+02	133	13
\N	2024-07-18 17:25:07.875+02	2024-07-18 17:25:07.875+02	133	14
\N	2024-07-18 17:25:07.875+02	2024-07-18 17:25:07.875+02	133	4
\N	2024-07-19 15:44:18.013+02	2024-07-19 15:44:18.013+02	134	5
\N	2024-07-19 15:44:18.013+02	2024-07-19 15:44:18.013+02	134	4
\N	2024-07-19 15:44:18.013+02	2024-07-19 15:44:18.013+02	134	12
\N	2024-07-19 15:49:31.887+02	2024-07-19 15:49:31.887+02	127	19
\N	2024-07-19 17:15:11.279+02	2024-07-19 17:15:11.279+02	135	12
\N	2024-07-19 17:15:41.539+02	2024-07-19 17:15:41.539+02	135	4
\N	2024-07-21 11:16:31.457+02	2024-07-21 11:16:31.457+02	136	19
\N	2024-07-21 11:59:11.537+02	2024-07-21 11:59:11.537+02	137	5
\N	2024-07-21 11:59:11.537+02	2024-07-21 11:59:11.537+02	137	4
\N	2024-07-21 11:59:11.537+02	2024-07-21 11:59:11.537+02	137	12
\N	2024-07-21 11:59:11.537+02	2024-07-21 11:59:11.537+02	137	19
\N	2024-07-21 13:23:57.244+02	2024-07-21 13:23:57.244+02	138	12
\N	2024-07-21 13:23:57.244+02	2024-07-21 13:23:57.244+02	138	19
\N	2024-07-21 13:49:34.664+02	2024-07-21 13:49:34.664+02	139	4
\N	2024-07-21 13:49:34.664+02	2024-07-21 13:49:34.664+02	139	2
\N	2024-07-22 15:30:24.29+02	2024-07-22 15:30:24.29+02	140	5
\N	2024-07-22 15:30:24.29+02	2024-07-22 15:30:24.29+02	140	14
\N	2024-07-22 15:30:24.29+02	2024-07-22 15:30:24.29+02	140	4
\N	2024-07-22 15:30:24.29+02	2024-07-22 15:30:24.29+02	140	2
\N	2024-07-22 16:08:58.824+02	2024-07-22 16:08:58.824+02	141	12
\N	2024-07-22 17:05:48.915+02	2024-07-22 17:05:48.915+02	142	19
\N	2024-07-22 17:05:48.915+02	2024-07-22 17:05:48.915+02	142	12
\N	2024-07-22 17:05:48.915+02	2024-07-22 17:05:48.915+02	142	4
\N	2024-07-23 16:19:18.121+02	2024-07-23 16:19:18.121+02	143	14
\N	2024-07-23 17:05:49.715+02	2024-07-23 17:05:49.715+02	144	12
\N	2024-07-23 17:05:49.715+02	2024-07-23 17:05:49.715+02	144	19
\N	2024-07-24 16:06:53.318+02	2024-07-24 16:06:53.318+02	145	12
\N	2024-07-24 16:06:53.318+02	2024-07-24 16:06:53.318+02	145	5
\N	2024-07-24 16:42:00.528+02	2024-07-24 16:42:00.528+02	146	4
\N	2024-07-25 17:41:02.715+02	2024-07-25 17:41:02.715+02	147	12
\N	2024-07-26 08:51:10.459+02	2024-07-26 08:51:10.459+02	116	21
\N	2024-07-26 09:04:41.848+02	2024-07-26 09:04:41.848+02	107	21
\N	2024-07-26 09:05:08.368+02	2024-07-26 09:05:08.368+02	126	21
\N	2024-07-26 09:05:32.415+02	2024-07-26 09:05:32.415+02	140	21
\N	2024-07-26 09:06:16.751+02	2024-07-26 09:06:16.751+02	64	21
\N	2024-07-26 09:43:56.324+02	2024-07-26 09:43:56.324+02	148	4
\N	2024-07-27 12:41:33.066+02	2024-07-27 12:41:33.066+02	149	12
\N	2024-07-27 12:41:33.066+02	2024-07-27 12:41:33.066+02	149	19
\N	2024-07-27 13:07:01.964+02	2024-07-27 13:07:01.964+02	150	5
\N	2024-07-27 13:07:01.964+02	2024-07-27 13:07:01.964+02	150	12
\N	2024-07-27 13:53:12.741+02	2024-07-27 13:53:12.741+02	151	5
\N	2024-07-27 13:53:12.741+02	2024-07-27 13:53:12.741+02	151	12
\N	2024-07-27 13:53:12.741+02	2024-07-27 13:53:12.741+02	151	14
\N	2024-07-27 15:33:11.013+02	2024-07-27 15:33:11.013+02	152	4
\N	2024-07-27 15:33:11.013+02	2024-07-27 15:33:11.013+02	152	14
\N	2024-07-28 11:44:02.576+02	2024-07-28 11:44:02.576+02	153	5
\N	2024-07-28 11:44:02.576+02	2024-07-28 11:44:02.576+02	153	14
\N	2024-07-28 11:44:02.576+02	2024-07-28 11:44:02.576+02	153	21
\N	2024-07-28 11:44:02.576+02	2024-07-28 11:44:02.576+02	153	4
\N	2024-07-28 12:13:48.382+02	2024-07-28 12:13:48.382+02	154	4
\N	2024-07-28 12:55:25.343+02	2024-07-28 12:55:25.343+02	155	4
\N	2024-07-28 12:55:25.343+02	2024-07-28 12:55:25.343+02	155	12
\N	2024-07-28 13:11:32.337+02	2024-07-28 13:11:32.337+02	156	5
\N	2024-07-28 13:11:32.337+02	2024-07-28 13:11:32.337+02	156	12
\N	2024-07-28 13:11:32.337+02	2024-07-28 13:11:32.337+02	156	14
\N	2024-07-28 13:11:47.281+02	2024-07-28 13:11:47.281+02	156	4
\N	2024-07-28 13:35:05.363+02	2024-07-28 13:35:05.363+02	157	12
\N	2024-07-28 13:35:05.363+02	2024-07-28 13:35:05.363+02	157	19
\N	2024-07-28 23:25:26.59+02	2024-07-28 23:25:26.59+02	158	5
\N	2024-07-28 23:25:26.59+02	2024-07-28 23:25:26.59+02	158	4
\N	2024-07-28 23:49:19.501+02	2024-07-28 23:49:19.501+02	159	5
\N	2024-07-28 23:49:19.501+02	2024-07-28 23:49:19.501+02	159	4
\N	2024-07-28 23:49:19.501+02	2024-07-28 23:49:19.501+02	159	14
\N	2024-07-28 23:49:19.501+02	2024-07-28 23:49:19.501+02	159	12
\N	2024-07-28 23:49:19.501+02	2024-07-28 23:49:19.501+02	159	2
\N	2024-07-29 21:13:00.571+02	2024-07-29 21:13:00.571+02	160	12
\N	2024-07-29 21:13:00.571+02	2024-07-29 21:13:00.571+02	160	4
\N	2024-07-30 15:39:23.813+02	2024-07-30 15:39:23.813+02	161	12
\N	2024-07-30 16:47:54.633+02	2024-07-30 16:47:54.633+02	162	4
\N	2024-07-31 16:29:05.818+02	2024-07-31 16:29:05.818+02	163	12
\N	2024-08-01 15:59:39.495+02	2024-08-01 15:59:39.495+02	164	12
\N	2024-08-01 15:59:55.987+02	2024-08-01 15:59:55.987+02	164	4
\N	2024-08-01 17:00:00.573+02	2024-08-01 17:00:00.573+02	165	14
\N	2024-08-02 08:42:13.528+02	2024-08-02 08:42:13.528+02	166	4
\N	2024-08-02 09:31:45.737+02	2024-08-02 09:31:45.737+02	167	4
\N	2024-08-02 10:24:25.13+02	2024-08-02 10:24:25.13+02	168	4
\N	2024-08-02 10:41:46.585+02	2024-08-02 10:41:46.585+02	169	12
\N	2024-08-02 10:41:46.585+02	2024-08-02 10:41:46.585+02	169	4
\N	2024-08-02 11:09:25.337+02	2024-08-02 11:09:25.337+02	170	5
\N	2024-08-02 11:09:25.337+02	2024-08-02 11:09:25.337+02	170	12
\N	2024-08-02 12:01:08.901+02	2024-08-02 12:01:08.901+02	172	5
\N	2024-08-02 12:01:08.901+02	2024-08-02 12:01:08.901+02	172	14
\N	2024-08-02 12:14:25.884+02	2024-08-02 12:14:25.884+02	173	14
\N	2024-08-02 12:14:25.884+02	2024-08-02 12:14:25.884+02	173	21
\N	2024-08-02 12:14:25.884+02	2024-08-02 12:14:25.884+02	173	5
\N	2024-08-02 12:14:25.884+02	2024-08-02 12:14:25.884+02	173	4
\N	2024-08-02 12:40:45.078+02	2024-08-02 12:40:45.078+02	174	5
\N	2024-08-02 12:40:45.078+02	2024-08-02 12:40:45.078+02	174	4
\N	2024-08-02 12:40:45.078+02	2024-08-02 12:40:45.078+02	174	14
\N	2024-08-03 10:25:33.4+02	2024-08-03 10:25:33.4+02	175	5
\N	2024-08-03 10:25:33.4+02	2024-08-03 10:25:33.4+02	175	12
\N	2024-08-03 10:25:55.271+02	2024-08-03 10:25:55.271+02	175	4
\N	2024-08-03 11:15:01.575+02	2024-08-03 11:15:01.575+02	176	12
\N	2024-08-03 11:35:51.356+02	2024-08-03 11:35:51.356+02	177	12
\N	2024-08-03 12:21:42.867+02	2024-08-03 12:21:42.867+02	178	4
\N	2024-08-03 13:08:21.772+02	2024-08-03 13:08:21.772+02	179	5
\N	2024-08-03 13:08:21.772+02	2024-08-03 13:08:21.772+02	179	2
\N	2024-08-03 13:08:21.772+02	2024-08-03 13:08:21.772+02	179	21
\N	2024-08-03 13:08:21.772+02	2024-08-03 13:08:21.772+02	179	4
\N	2024-08-03 13:08:21.772+02	2024-08-03 13:08:21.772+02	179	14
\N	2024-08-03 13:43:45.433+02	2024-08-03 13:43:45.433+02	180	12
\N	2024-08-04 12:08:13.541+02	2024-08-04 12:08:13.541+02	181	5
\N	2024-08-04 12:08:13.541+02	2024-08-04 12:08:13.541+02	181	2
\N	2024-08-04 12:08:13.541+02	2024-08-04 12:08:13.541+02	181	21
\N	2024-08-04 12:08:13.541+02	2024-08-04 12:08:13.541+02	181	4
\N	2024-08-04 12:08:13.541+02	2024-08-04 12:08:13.541+02	181	14
\N	2024-08-04 12:23:23.153+02	2024-08-04 12:23:23.153+02	182	4
\N	2024-08-04 12:23:23.153+02	2024-08-04 12:23:23.153+02	182	12
\N	2024-08-04 13:42:11.035+02	2024-08-04 13:42:11.035+02	183	12
\N	2024-08-04 21:05:44.921+02	2024-08-04 21:05:44.921+02	184	12
\N	2024-08-05 16:43:50.961+02	2024-08-05 16:43:50.961+02	185	5
\N	2024-08-05 16:43:50.961+02	2024-08-05 16:43:50.961+02	185	21
\N	2024-08-05 16:59:13.134+02	2024-08-05 16:59:13.134+02	186	5
\N	2024-08-05 17:18:59.246+02	2024-08-05 17:18:59.246+02	187	5
\N	2024-08-05 17:18:59.246+02	2024-08-05 17:18:59.246+02	187	12
\N	2024-08-05 17:18:59.246+02	2024-08-05 17:18:59.246+02	187	2
\N	2024-08-05 17:18:59.246+02	2024-08-05 17:18:59.246+02	187	4
\N	2024-08-05 17:18:59.246+02	2024-08-05 17:18:59.246+02	187	21
\N	2024-08-06 16:45:02.76+02	2024-08-06 16:45:02.76+02	188	12
\N	2024-08-06 16:45:02.76+02	2024-08-06 16:45:02.76+02	188	21
\N	2024-08-07 15:35:13.196+02	2024-08-07 15:35:13.196+02	189	12
\N	2024-08-07 15:50:23.802+02	2024-08-07 15:50:23.802+02	190	12
\N	2024-08-07 16:34:56.283+02	2024-08-07 16:34:56.283+02	191	5
\N	2024-08-07 16:34:56.283+02	2024-08-07 16:34:56.283+02	191	12
\N	2024-08-07 16:34:56.283+02	2024-08-07 16:34:56.283+02	191	4
\N	2024-08-07 16:45:06.539+02	2024-08-07 16:45:06.539+02	192	12
\N	2024-08-07 16:45:06.539+02	2024-08-07 16:45:06.539+02	192	5
\N	2024-08-07 16:45:06.539+02	2024-08-07 16:45:06.539+02	192	4
\N	2024-08-08 16:06:31.122+02	2024-08-08 16:06:31.122+02	193	5
\N	2024-08-08 16:06:31.122+02	2024-08-08 16:06:31.122+02	193	4
\N	2024-08-08 16:06:31.122+02	2024-08-08 16:06:31.122+02	193	21
\N	2024-08-08 16:06:31.122+02	2024-08-08 16:06:31.122+02	193	14
\N	2024-08-08 17:30:13.473+02	2024-08-08 17:30:13.473+02	194	12
\N	2024-08-09 11:28:04.502+02	2024-08-09 11:28:04.502+02	195	14
\N	2024-08-09 11:28:04.502+02	2024-08-09 11:28:04.502+02	195	5
\N	2024-08-09 11:28:04.502+02	2024-08-09 11:28:04.502+02	195	21
\N	2024-08-09 11:28:04.502+02	2024-08-09 11:28:04.502+02	195	4
\N	2024-08-09 11:35:55.88+02	2024-08-09 11:35:55.88+02	196	4
\N	2024-08-09 11:53:55.039+02	2024-08-09 11:53:55.039+02	197	4
\N	2024-08-09 11:53:55.039+02	2024-08-09 11:53:55.039+02	197	14
\N	2024-08-09 12:33:15.144+02	2024-08-09 12:33:15.144+02	198	5
\N	2024-08-09 12:33:15.144+02	2024-08-09 12:33:15.144+02	198	2
\N	2024-08-09 12:51:22.125+02	2024-08-09 12:51:22.125+02	199	2
\N	2024-08-09 13:18:48.61+02	2024-08-09 13:18:48.61+02	117	22
\N	2024-08-09 13:22:03.093+02	2024-08-09 13:22:03.093+02	20	22
\N	2024-08-09 13:22:30.273+02	2024-08-09 13:22:30.273+02	129	22
\N	2024-08-09 13:22:53.247+02	2024-08-09 13:22:53.247+02	111	22
\N	2024-08-09 13:23:26.188+02	2024-08-09 13:23:26.188+02	54	22
\N	2024-08-09 13:23:38.665+02	2024-08-09 13:23:38.665+02	43	22
\N	2024-08-09 13:24:00.614+02	2024-08-09 13:24:00.614+02	191	22
\N	2024-08-09 13:24:16.311+02	2024-08-09 13:24:16.311+02	48	22
\N	2024-08-09 13:24:41.387+02	2024-08-09 13:24:41.387+02	53	22
\N	2024-08-09 13:25:03.825+02	2024-08-09 13:25:03.825+02	64	22
\N	2024-08-09 13:25:27.031+02	2024-08-09 13:25:27.031+02	153	22
\N	2024-08-10 11:52:13.718+02	2024-08-10 11:52:13.718+02	201	5
\N	2024-08-10 11:52:13.718+02	2024-08-10 11:52:13.718+02	201	2
\N	2024-08-10 11:52:13.718+02	2024-08-10 11:52:13.718+02	201	14
\N	2024-08-10 11:52:22.652+02	2024-08-10 11:52:22.652+02	201	4
\N	2024-08-10 12:45:42.087+02	2024-08-10 12:45:42.087+02	202	12
\N	2024-08-10 12:45:42.087+02	2024-08-10 12:45:42.087+02	202	4
\N	2024-08-10 13:04:30.473+02	2024-08-10 13:04:30.473+02	203	5
\N	2024-08-10 13:04:30.473+02	2024-08-10 13:04:30.473+02	203	12
\N	2024-08-10 13:04:30.473+02	2024-08-10 13:04:30.473+02	203	4
\N	2024-08-10 13:19:34.12+02	2024-08-10 13:19:34.12+02	204	4
\N	2024-08-11 12:05:07.921+02	2024-08-11 12:05:07.921+02	205	4
\N	2024-08-11 12:05:07.921+02	2024-08-11 12:05:07.921+02	205	14
\N	2024-08-11 12:05:07.921+02	2024-08-11 12:05:07.921+02	205	2
\N	2024-08-11 12:05:07.921+02	2024-08-11 12:05:07.921+02	205	22
\N	2024-08-11 12:50:44.543+02	2024-08-11 12:50:44.543+02	206	12
\N	2024-08-11 13:24:39.592+02	2024-08-11 13:24:39.592+02	207	12
\N	2024-08-11 13:24:53.77+02	2024-08-11 13:24:53.77+02	207	22
\N	2024-08-11 16:51:24.723+02	2024-08-11 16:51:24.723+02	208	4
\N	2024-08-11 16:51:24.723+02	2024-08-11 16:51:24.723+02	208	21
\N	2024-08-11 16:51:24.723+02	2024-08-11 16:51:24.723+02	208	12
\N	2024-08-11 16:51:24.723+02	2024-08-11 16:51:24.723+02	208	22
\N	2024-08-11 16:51:24.723+02	2024-08-11 16:51:24.723+02	208	2
\N	2024-08-11 16:51:24.723+02	2024-08-11 16:51:24.723+02	208	14
\N	2024-08-12 16:12:25.068+02	2024-08-12 16:12:25.068+02	209	4
\N	2024-08-12 16:22:15.323+02	2024-08-12 16:22:15.323+02	129	23
\N	2024-08-12 16:23:41.522+02	2024-08-12 16:23:41.522+02	116	23
\N	2024-08-12 17:12:33.576+02	2024-08-12 17:12:33.576+02	210	21
\N	2024-08-12 17:12:33.576+02	2024-08-12 17:12:33.576+02	210	4
\N	2024-08-12 17:12:33.576+02	2024-08-12 17:12:33.576+02	210	12
\N	2024-08-12 17:12:33.576+02	2024-08-12 17:12:33.576+02	210	5
\N	2024-08-12 17:12:33.576+02	2024-08-12 17:12:33.576+02	210	22
\N	2024-08-13 16:27:52.705+02	2024-08-13 16:27:52.705+02	211	12
\N	2024-08-13 16:48:21.995+02	2024-08-13 16:48:21.995+02	212	5
\N	2024-08-13 16:48:21.995+02	2024-08-13 16:48:21.995+02	212	14
\N	2024-08-13 16:48:21.995+02	2024-08-13 16:48:21.995+02	212	2
\N	2024-08-13 16:48:21.995+02	2024-08-13 16:48:21.995+02	212	4
\N	2024-08-14 17:06:57.303+02	2024-08-14 17:06:57.303+02	213	5
\N	2024-08-14 17:07:17.504+02	2024-08-14 17:07:17.504+02	213	4
\N	2024-08-18 13:34:11.277+02	2024-08-18 13:34:11.277+02	214	5
\N	2024-08-18 13:34:11.277+02	2024-08-18 13:34:11.277+02	214	2
\N	2024-08-18 13:34:11.277+02	2024-08-18 13:34:11.277+02	214	14
\N	2024-08-18 13:34:11.277+02	2024-08-18 13:34:11.277+02	214	4
\N	2024-08-18 14:22:36.916+02	2024-08-18 14:22:36.916+02	215	5
\N	2024-08-18 14:22:36.916+02	2024-08-18 14:22:36.916+02	215	4
\N	2024-08-18 14:22:36.916+02	2024-08-18 14:22:36.916+02	215	22
\N	2024-08-18 14:22:36.916+02	2024-08-18 14:22:36.916+02	215	23
\N	2024-08-18 14:22:36.916+02	2024-08-18 14:22:36.916+02	215	14
\N	2024-08-18 14:22:36.916+02	2024-08-18 14:22:36.916+02	215	2
\N	2024-08-18 14:22:36.916+02	2024-08-18 14:22:36.916+02	215	12
\N	2024-08-19 13:13:16.561+02	2024-08-19 13:13:16.561+02	216	5
\N	2024-08-19 13:13:16.561+02	2024-08-19 13:13:16.561+02	216	14
\N	2024-08-19 13:13:16.561+02	2024-08-19 13:13:16.561+02	216	21
\N	2024-08-19 13:30:56.988+02	2024-08-19 13:30:56.988+02	217	5
\N	2024-08-19 13:30:56.988+02	2024-08-19 13:30:56.988+02	217	2
\N	2024-08-19 13:43:21.697+02	2024-08-19 13:43:21.697+02	218	14
\N	2024-08-19 13:43:21.697+02	2024-08-19 13:43:21.697+02	218	21
\N	2024-08-19 14:15:29.172+02	2024-08-19 14:15:29.172+02	219	4
\N	2024-08-22 15:39:11.163+02	2024-08-22 15:39:11.163+02	220	4
\N	2024-08-22 15:39:11.163+02	2024-08-22 15:39:11.163+02	220	14
\N	2024-08-22 15:39:11.163+02	2024-08-22 15:39:11.163+02	220	2
\N	2024-08-22 15:39:11.163+02	2024-08-22 15:39:11.163+02	220	23
\N	2024-08-22 16:21:27.676+02	2024-08-22 16:21:27.676+02	221	4
\N	2024-08-22 16:21:27.676+02	2024-08-22 16:21:27.676+02	221	12
\N	2024-08-22 16:33:34.96+02	2024-08-22 16:33:34.96+02	222	4
\N	2024-08-22 17:10:02.035+02	2024-08-22 17:10:02.035+02	223	22
\N	2024-08-22 17:19:23.473+02	2024-08-22 17:19:23.473+02	217	24
\N	2024-08-22 17:28:43.569+02	2024-08-22 17:28:43.569+02	224	4
\N	2024-08-22 17:28:43.569+02	2024-08-22 17:28:43.569+02	224	12
\N	2024-08-22 17:37:40.973+02	2024-08-22 17:37:40.973+02	225	24
\N	2024-08-23 10:52:44.827+02	2024-08-23 10:52:44.827+02	226	4
\N	2024-08-23 12:51:04.099+02	2024-08-23 12:51:04.099+02	227	22
\N	2024-08-23 13:06:37.03+02	2024-08-23 13:06:37.03+02	228	5
\N	2024-08-23 13:06:37.03+02	2024-08-23 13:06:37.03+02	228	14
\N	2024-08-23 13:06:37.03+02	2024-08-23 13:06:37.03+02	228	2
\N	2024-08-23 13:22:16.061+02	2024-08-23 13:22:16.061+02	229	12
\N	2024-08-23 13:39:31.686+02	2024-08-23 13:39:31.686+02	230	5
\N	2024-08-23 13:39:31.686+02	2024-08-23 13:39:31.686+02	230	14
\N	2024-08-23 13:39:31.686+02	2024-08-23 13:39:31.686+02	230	2
\N	2024-08-23 13:39:31.686+02	2024-08-23 13:39:31.686+02	230	4
\N	2024-08-23 16:18:09.632+02	2024-08-23 16:18:09.632+02	231	12
\N	2024-08-23 16:31:48.943+02	2024-08-23 16:31:48.943+02	232	4
\N	2024-08-23 16:47:29.084+02	2024-08-23 16:47:29.084+02	233	4
\N	2024-08-24 10:44:50.05+02	2024-08-24 10:44:50.05+02	234	12
\N	2024-08-24 10:44:50.05+02	2024-08-24 10:44:50.05+02	234	22
\N	2024-08-24 10:44:50.05+02	2024-08-24 10:44:50.05+02	234	5
\N	2024-08-24 10:55:47.088+02	2024-08-24 10:55:47.088+02	235	5
\N	2024-08-24 11:22:43.845+02	2024-08-24 11:22:43.845+02	236	4
\N	2024-08-24 11:41:19.641+02	2024-08-24 11:41:19.641+02	237	12
\N	2024-08-24 11:50:56.281+02	2024-08-24 11:50:56.281+02	133	25
\N	2024-08-24 11:51:28.992+02	2024-08-24 11:51:28.992+02	212	25
\N	2024-08-24 11:52:03.471+02	2024-08-24 11:52:03.471+02	215	25
\N	2024-08-24 11:52:18.809+02	2024-08-24 11:52:18.809+02	126	25
\N	2024-08-24 11:52:43.207+02	2024-08-24 11:52:43.207+02	140	25
\N	2024-08-24 11:53:10.413+02	2024-08-24 11:53:10.413+02	117	25
\N	2024-08-24 11:53:31.172+02	2024-08-24 11:53:31.172+02	208	25
\N	2024-08-24 11:53:54.382+02	2024-08-24 11:53:54.382+02	23	25
\N	2024-08-24 11:54:13.49+02	2024-08-24 11:54:13.49+02	230	25
\N	2024-08-24 11:54:35.675+02	2024-08-24 11:54:35.675+02	228	25
\N	2024-08-24 11:55:02.706+02	2024-08-24 11:55:02.706+02	53	25
\N	2024-08-24 11:55:25.242+02	2024-08-24 11:55:25.242+02	201	24
\N	2024-08-24 12:07:22.252+02	2024-08-24 12:07:22.252+02	238	5
\N	2024-08-24 12:07:22.252+02	2024-08-24 12:07:22.252+02	238	2
\N	2024-08-24 12:07:22.252+02	2024-08-24 12:07:22.252+02	238	14
\N	2024-08-24 12:07:22.252+02	2024-08-24 12:07:22.252+02	238	25
\N	2024-08-24 13:43:50.527+02	2024-08-24 13:43:50.527+02	239	4
\N	2024-08-24 14:07:51.416+02	2024-08-24 14:07:51.416+02	208	26
\N	2024-08-24 14:10:28.811+02	2024-08-24 14:10:28.811+02	213	26
\N	2024-08-24 14:10:52.45+02	2024-08-24 14:10:52.45+02	215	26
\N	2024-08-24 14:11:18.3+02	2024-08-24 14:11:18.3+02	209	26
\N	2024-08-24 14:11:49.7+02	2024-08-24 14:11:49.7+02	236	26
\N	2024-08-24 14:12:45.433+02	2024-08-24 14:12:45.433+02	173	25
\N	2024-08-25 10:56:18.587+02	2024-08-25 10:56:18.587+02	240	26
\N	2024-08-25 11:56:45.768+02	2024-08-25 11:56:45.768+02	241	26
\N	2024-08-25 13:01:28.449+02	2024-08-25 13:01:28.449+02	242	12
\N	2024-08-25 13:11:30.137+02	2024-08-25 13:11:30.137+02	243	12
\N	2024-08-25 13:26:19.14+02	2024-08-25 13:26:19.14+02	244	5
\N	2024-08-25 13:26:19.14+02	2024-08-25 13:26:19.14+02	244	26
\N	2024-08-25 13:42:36.766+02	2024-08-25 13:42:36.766+02	245	5
\N	2024-08-25 13:42:36.766+02	2024-08-25 13:42:36.766+02	245	4
\N	2024-08-25 13:51:22.102+02	2024-08-25 13:51:22.102+02	246	5
\N	2024-08-25 13:51:22.102+02	2024-08-25 13:51:22.102+02	246	26
\N	2024-08-26 15:17:16.162+02	2024-08-26 15:17:16.162+02	247	14
\N	2024-08-26 15:17:16.162+02	2024-08-26 15:17:16.162+02	247	2
\N	2024-08-26 15:26:18.231+02	2024-08-26 15:26:18.231+02	248	5
\N	2024-08-26 15:26:18.231+02	2024-08-26 15:26:18.231+02	248	2
\N	2024-08-26 15:38:40.272+02	2024-08-26 15:38:40.272+02	249	2
\N	2024-08-26 15:48:43.565+02	2024-08-26 15:48:43.565+02	250	14
\N	2024-08-26 16:05:15.259+02	2024-08-26 16:05:15.259+02	251	5
\N	2024-08-26 16:05:15.259+02	2024-08-26 16:05:15.259+02	251	4
\N	2024-08-26 16:05:15.259+02	2024-08-26 16:05:15.259+02	251	12
\N	2024-08-26 16:05:15.259+02	2024-08-26 16:05:15.259+02	251	22
\N	2024-08-26 16:05:15.259+02	2024-08-26 16:05:15.259+02	251	2
\N	2024-08-26 16:55:58.977+02	2024-08-26 16:55:58.977+02	252	5
\N	2024-08-26 16:55:58.977+02	2024-08-26 16:55:58.977+02	252	12
\N	2024-08-26 16:55:58.977+02	2024-08-26 16:55:58.977+02	252	4
\N	2024-08-26 16:55:58.977+02	2024-08-26 16:55:58.977+02	252	21
\N	2024-08-26 16:55:58.977+02	2024-08-26 16:55:58.977+02	252	14
\N	2024-08-27 16:16:43.175+02	2024-08-27 16:16:43.175+02	253	2
\N	2024-08-27 17:02:07.432+02	2024-08-27 17:02:07.432+02	254	2
\N	2024-08-27 17:15:55.153+02	2024-08-27 17:15:55.153+02	255	22
\N	2024-08-28 15:55:18.643+02	2024-08-28 15:55:18.643+02	256	5
\N	2024-08-28 15:55:18.643+02	2024-08-28 15:55:18.643+02	256	26
\N	2024-08-28 16:35:12.952+02	2024-08-28 16:35:12.952+02	257	2
\N	2024-08-28 16:35:12.952+02	2024-08-28 16:35:12.952+02	257	14
\N	2024-08-28 16:35:12.952+02	2024-08-28 16:35:12.952+02	257	25
\N	2024-08-28 16:47:48.905+02	2024-08-28 16:47:48.905+02	258	5
\N	2024-08-28 16:47:48.905+02	2024-08-28 16:47:48.905+02	258	22
\N	2024-08-28 16:47:48.905+02	2024-08-28 16:47:48.905+02	258	4
\N	2024-08-28 17:49:43.846+02	2024-08-28 17:49:43.846+02	259	12
\N	2024-08-28 17:49:43.846+02	2024-08-28 17:49:43.846+02	259	4
\N	2024-08-29 15:42:45.876+02	2024-08-29 15:42:45.876+02	261	5
\N	2024-08-29 15:42:45.876+02	2024-08-29 15:42:45.876+02	261	4
\N	2024-08-29 15:42:45.876+02	2024-08-29 15:42:45.876+02	261	12
\N	2024-08-29 15:42:45.876+02	2024-08-29 15:42:45.876+02	261	2
\N	2024-08-29 15:42:45.876+02	2024-08-29 15:42:45.876+02	261	14
\N	2024-08-29 15:42:45.876+02	2024-08-29 15:42:45.876+02	261	24
\N	2024-08-29 15:57:26.384+02	2024-08-29 15:57:26.384+02	262	4
\N	2024-08-29 15:57:26.384+02	2024-08-29 15:57:26.384+02	262	2
\N	2024-08-29 15:57:26.384+02	2024-08-29 15:57:26.384+02	262	22
\N	2024-08-29 15:57:26.384+02	2024-08-29 15:57:26.384+02	262	14
\N	2024-08-29 16:11:52.302+02	2024-08-29 16:11:52.302+02	263	4
\N	2024-08-29 16:11:52.302+02	2024-08-29 16:11:52.302+02	263	12
\N	2024-08-29 16:11:52.302+02	2024-08-29 16:11:52.302+02	263	22
\N	2024-08-29 16:12:36.281+02	2024-08-29 16:12:36.281+02	263	5
\N	2024-08-29 16:23:25.144+02	2024-08-29 16:23:25.144+02	264	5
\N	2024-08-29 16:23:25.144+02	2024-08-29 16:23:25.144+02	264	4
\N	2024-08-29 16:34:41.98+02	2024-08-29 16:34:41.98+02	265	4
\N	2024-08-29 16:34:41.98+02	2024-08-29 16:34:41.98+02	265	2
\N	2024-08-29 16:50:52.41+02	2024-08-29 16:50:52.41+02	266	2
\N	2024-08-29 16:50:52.41+02	2024-08-29 16:50:52.41+02	266	26
\N	2024-08-29 16:50:52.41+02	2024-08-29 16:50:52.41+02	266	4
\N	2024-08-29 17:10:36.337+02	2024-08-29 17:10:36.337+02	267	4
\N	2024-08-29 17:18:58.354+02	2024-08-29 17:18:58.354+02	268	4
\N	2024-08-29 17:27:17.711+02	2024-08-29 17:27:17.711+02	269	4
\N	2024-08-29 20:59:30.593+02	2024-08-29 20:59:30.593+02	270	12
\N	2024-08-29 20:59:30.593+02	2024-08-29 20:59:30.593+02	270	5
\N	2024-08-29 20:59:30.593+02	2024-08-29 20:59:30.593+02	270	4
\N	2024-08-29 21:14:54.061+02	2024-08-29 21:14:54.061+02	271	4
\N	2024-08-30 08:06:32.889+02	2024-08-30 08:06:32.889+02	272	4
\N	2024-08-30 08:06:32.889+02	2024-08-30 08:06:32.889+02	272	25
\N	2024-08-30 08:06:32.889+02	2024-08-30 08:06:32.889+02	272	2
\N	2024-08-30 08:06:32.889+02	2024-08-30 08:06:32.889+02	272	14
\N	2024-08-30 08:06:32.889+02	2024-08-30 08:06:32.889+02	272	26
\N	2024-08-30 09:01:56.429+02	2024-08-30 09:01:56.429+02	273	2
\N	2024-08-30 09:01:56.429+02	2024-08-30 09:01:56.429+02	273	14
\N	2024-08-30 09:01:56.429+02	2024-08-30 09:01:56.429+02	273	5
\N	2024-08-30 09:02:15.795+02	2024-08-30 09:02:15.795+02	273	4
\N	2024-08-30 09:28:10.115+02	2024-08-30 09:28:10.115+02	274	19
\N	2024-08-30 09:35:49.327+02	2024-08-30 09:35:49.327+02	275	19
\N	2024-08-30 09:35:49.327+02	2024-08-30 09:35:49.327+02	275	26
\N	2024-08-30 13:36:42.278+02	2024-08-30 13:36:42.278+02	276	5
\N	2024-08-30 13:36:42.278+02	2024-08-30 13:36:42.278+02	276	26
\N	2024-08-30 13:36:55.174+02	2024-08-30 13:36:55.174+02	276	4
\N	2024-08-31 11:42:04.055+02	2024-08-31 11:42:04.055+02	277	4
\N	2024-08-31 11:42:04.055+02	2024-08-31 11:42:04.055+02	277	2
\N	2024-08-31 11:42:04.055+02	2024-08-31 11:42:04.055+02	277	14
\N	2024-08-31 11:42:04.055+02	2024-08-31 11:42:04.055+02	277	25
\N	2024-08-31 11:42:04.055+02	2024-08-31 11:42:04.055+02	277	26
\N	2024-08-31 11:42:04.055+02	2024-08-31 11:42:04.055+02	277	22
\N	2024-08-31 11:42:04.055+02	2024-08-31 11:42:04.055+02	277	23
\N	2024-08-31 11:42:04.055+02	2024-08-31 11:42:04.055+02	277	12
\N	2024-09-01 10:12:19.703+02	2024-09-01 10:12:19.703+02	279	26
\N	2024-09-01 10:27:39.002+02	2024-09-01 10:27:39.002+02	280	5
\N	2024-09-01 10:42:58.171+02	2024-09-01 10:42:58.171+02	281	2
\N	2024-09-01 10:42:58.171+02	2024-09-01 10:42:58.171+02	281	22
\N	2024-09-01 10:42:58.171+02	2024-09-01 10:42:58.171+02	281	14
\N	2024-09-01 10:42:58.171+02	2024-09-01 10:42:58.171+02	281	4
\N	2024-09-01 11:19:47.265+02	2024-09-01 11:19:47.265+02	282	22
\N	2024-09-01 12:46:33.456+02	2024-09-01 12:46:33.456+02	283	4
\N	2024-09-01 12:46:33.456+02	2024-09-01 12:46:33.456+02	283	2
\N	2024-09-01 12:46:33.456+02	2024-09-01 12:46:33.456+02	283	26
\N	2024-09-01 13:22:53.659+02	2024-09-01 13:22:53.659+02	284	26
\N	2024-09-02 16:03:46.276+02	2024-09-02 16:03:46.276+02	285	28
\N	2024-09-02 16:03:46.276+02	2024-09-02 16:03:46.276+02	285	2
\N	2024-09-02 16:03:46.276+02	2024-09-02 16:03:46.276+02	285	5
\N	2024-09-02 16:03:46.276+02	2024-09-02 16:03:46.276+02	285	26
\N	2024-09-02 16:03:46.276+02	2024-09-02 16:03:46.276+02	285	4
\N	2024-09-02 16:16:09.133+02	2024-09-02 16:16:09.133+02	286	4
\N	2024-09-02 17:07:36.936+02	2024-09-02 17:07:36.936+02	287	26
\N	2024-09-02 17:27:53.06+02	2024-09-02 17:27:53.06+02	288	22
\N	2024-09-02 17:44:37.019+02	2024-09-02 17:44:37.019+02	289	22
\N	2024-09-03 16:29:47.799+02	2024-09-03 16:29:47.799+02	290	22
\N	2024-09-03 16:38:55.551+02	2024-09-03 16:38:55.551+02	291	12
\N	2024-09-03 16:57:34.473+02	2024-09-03 16:57:34.473+02	292	22
\N	2024-09-03 17:24:12.734+02	2024-09-03 17:24:12.734+02	293	5
\N	2024-09-03 17:24:12.734+02	2024-09-03 17:24:12.734+02	293	12
\N	2024-09-03 17:24:12.734+02	2024-09-03 17:24:12.734+02	293	22
\N	2024-09-03 17:35:44.197+02	2024-09-03 17:35:44.197+02	294	12
\N	2024-09-03 17:35:44.197+02	2024-09-03 17:35:44.197+02	294	26
\N	2024-09-03 17:35:44.197+02	2024-09-03 17:35:44.197+02	294	2
\N	2024-09-04 15:30:26.227+02	2024-09-04 15:30:26.227+02	295	4
\N	2024-09-04 15:30:26.227+02	2024-09-04 15:30:26.227+02	295	26
\N	2024-09-04 16:17:47.34+02	2024-09-04 16:17:47.34+02	296	26
\N	2024-09-04 17:23:17.353+02	2024-09-04 17:23:17.353+02	297	12
\N	2024-09-04 17:23:17.353+02	2024-09-04 17:23:17.353+02	297	2
\N	2024-09-04 17:23:17.353+02	2024-09-04 17:23:17.353+02	297	22
\N	2024-09-04 17:23:17.353+02	2024-09-04 17:23:17.353+02	297	25
\N	2024-09-04 17:23:17.353+02	2024-09-04 17:23:17.353+02	297	4
\N	2024-09-05 15:53:37.636+02	2024-09-05 15:53:37.636+02	298	5
\N	2024-09-05 15:53:37.636+02	2024-09-05 15:53:37.636+02	298	2
\N	2024-09-05 15:53:37.636+02	2024-09-05 15:53:37.636+02	298	26
\N	2024-09-05 17:12:29.938+02	2024-09-05 17:12:29.938+02	299	4
\N	2024-09-05 17:37:31.781+02	2024-09-05 17:37:31.781+02	300	2
\N	2024-09-05 17:37:31.781+02	2024-09-05 17:37:31.781+02	300	29
\N	2024-09-05 17:37:31.781+02	2024-09-05 17:37:31.781+02	300	14
\N	2024-09-05 17:37:31.781+02	2024-09-05 17:37:31.781+02	300	25
\N	2024-09-05 17:54:00.845+02	2024-09-05 17:54:00.845+02	301	14
\N	2024-09-05 17:54:00.845+02	2024-09-05 17:54:00.845+02	301	25
\N	2024-09-06 08:49:07.822+02	2024-09-06 08:49:07.822+02	302	4
\N	2024-09-06 08:49:07.822+02	2024-09-06 08:49:07.822+02	302	29
\N	2024-09-06 09:04:54.078+02	2024-09-06 09:04:54.078+02	303	5
\N	2024-09-06 09:04:54.078+02	2024-09-06 09:04:54.078+02	303	2
\N	2024-09-06 09:05:14.813+02	2024-09-06 09:05:14.813+02	303	12
\N	2024-09-06 09:43:42.004+02	2024-09-06 09:43:42.004+02	304	21
\N	2024-09-06 09:43:42.004+02	2024-09-06 09:43:42.004+02	304	23
\N	2024-09-06 09:43:42.004+02	2024-09-06 09:43:42.004+02	304	5
\N	2024-09-06 10:25:49.638+02	2024-09-06 10:25:49.638+02	305	5
\N	2024-09-06 10:25:49.638+02	2024-09-06 10:25:49.638+02	305	21
\N	2024-09-06 10:25:49.638+02	2024-09-06 10:25:49.638+02	305	24
\N	2024-09-06 10:35:27.94+02	2024-09-06 10:35:27.94+02	306	5
\N	2024-09-06 10:35:27.94+02	2024-09-06 10:35:27.94+02	306	24
\N	2024-09-06 10:35:53.212+02	2024-09-06 10:35:53.212+02	306	2
\N	2024-09-06 10:47:38.927+02	2024-09-06 10:47:38.927+02	307	26
\N	2024-09-06 10:57:09.746+02	2024-09-06 10:57:09.746+02	308	5
\N	2024-09-06 10:57:09.746+02	2024-09-06 10:57:09.746+02	308	2
\N	2024-09-06 10:57:09.746+02	2024-09-06 10:57:09.746+02	308	14
\N	2024-09-06 11:11:16.677+02	2024-09-06 11:11:16.677+02	309	5
\N	2024-09-06 11:11:16.677+02	2024-09-06 11:11:16.677+02	309	2
\N	2024-09-06 11:11:16.677+02	2024-09-06 11:11:16.677+02	309	4
\N	2024-09-06 11:22:47.38+02	2024-09-06 11:22:47.38+02	310	14
\N	2024-09-06 11:31:25.891+02	2024-09-06 11:31:25.891+02	311	14
\N	2024-09-06 13:04:50.166+02	2024-09-06 13:04:50.166+02	312	5
\N	2024-09-06 13:04:50.166+02	2024-09-06 13:04:50.166+02	312	4
\N	2024-09-06 13:39:35.972+02	2024-09-06 13:39:35.972+02	313	8
\N	2024-09-06 16:34:50.735+02	2024-09-06 16:34:50.735+02	314	12
\N	2024-09-06 16:34:50.735+02	2024-09-06 16:34:50.735+02	314	22
\N	2024-09-06 17:03:00.38+02	2024-09-06 17:03:00.38+02	316	26
\N	2024-09-06 17:13:03.905+02	2024-09-06 17:13:03.905+02	317	22
\N	2024-09-07 10:44:52.965+02	2024-09-07 10:44:52.965+02	318	12
\N	2024-09-07 11:01:03.222+02	2024-09-07 11:01:03.222+02	319	2
\N	2024-09-07 12:14:24.878+02	2024-09-07 12:14:24.878+02	320	4
\N	2024-09-07 12:24:57.12+02	2024-09-07 12:24:57.12+02	321	4
\N	2024-09-07 12:24:57.12+02	2024-09-07 12:24:57.12+02	321	2
\N	2024-09-07 12:39:11.95+02	2024-09-07 12:39:11.95+02	322	4
\N	2024-09-07 12:39:11.95+02	2024-09-07 12:39:11.95+02	322	2
\N	2024-09-07 13:43:58.704+02	2024-09-07 13:43:58.704+02	323	2
\N	2024-09-08 09:30:59.605+02	2024-09-08 09:30:59.605+02	324	4
\N	2024-09-08 09:30:59.605+02	2024-09-08 09:30:59.605+02	324	2
\N	2024-09-08 09:40:18.286+02	2024-09-08 09:40:18.286+02	325	4
\N	2024-09-08 09:40:18.286+02	2024-09-08 09:40:18.286+02	325	2
\N	2024-09-08 09:40:18.286+02	2024-09-08 09:40:18.286+02	325	25
\N	2024-09-08 09:40:18.286+02	2024-09-08 09:40:18.286+02	325	22
\N	2024-09-08 09:40:18.286+02	2024-09-08 09:40:18.286+02	325	14
\N	2024-09-08 09:40:18.286+02	2024-09-08 09:40:18.286+02	325	26
\N	2024-09-08 09:49:49.306+02	2024-09-08 09:49:49.306+02	326	21
\N	2024-09-08 09:50:03.374+02	2024-09-08 09:50:03.374+02	326	22
\N	2024-09-08 10:13:31.526+02	2024-09-08 10:13:31.526+02	327	2
\N	2024-09-08 10:13:31.526+02	2024-09-08 10:13:31.526+02	327	14
\N	2024-09-08 10:13:31.526+02	2024-09-08 10:13:31.526+02	327	4
\N	2024-09-08 10:13:31.526+02	2024-09-08 10:13:31.526+02	327	5
\N	2024-09-08 10:13:31.526+02	2024-09-08 10:13:31.526+02	327	24
\N	2024-09-08 11:07:57.526+02	2024-09-08 11:07:57.526+02	328	2
\N	2024-09-08 12:02:44.552+02	2024-09-08 12:02:44.552+02	329	12
\N	2024-09-08 12:02:44.552+02	2024-09-08 12:02:44.552+02	329	25
\N	2024-09-08 12:02:44.552+02	2024-09-08 12:02:44.552+02	329	14
\N	2024-09-08 12:02:44.552+02	2024-09-08 12:02:44.552+02	329	22
\N	2024-09-08 12:02:44.552+02	2024-09-08 12:02:44.552+02	329	2
\N	2024-09-08 12:02:44.552+02	2024-09-08 12:02:44.552+02	329	26
\N	2024-09-08 12:02:51.928+02	2024-09-08 12:02:51.928+02	329	4
\N	2024-09-09 15:44:26.226+02	2024-09-09 15:44:26.226+02	330	12
\N	2024-09-09 15:44:26.226+02	2024-09-09 15:44:26.226+02	330	22
\N	2024-09-09 16:28:38.85+02	2024-09-09 16:28:38.85+02	331	26
\N	2024-09-09 16:37:28.169+02	2024-09-09 16:37:28.169+02	332	12
\N	2024-09-09 16:37:28.169+02	2024-09-09 16:37:28.169+02	332	22
\N	2024-09-09 16:54:29.186+02	2024-09-09 16:54:29.186+02	333	14
\N	2024-09-09 16:54:29.186+02	2024-09-09 16:54:29.186+02	333	5
\N	2024-09-09 16:54:29.186+02	2024-09-09 16:54:29.186+02	333	4
\N	2024-09-09 17:01:31.84+02	2024-09-09 17:01:31.84+02	334	2
\N	2024-09-09 17:24:43.796+02	2024-09-09 17:24:43.796+02	335	26
\N	2024-09-09 17:33:34.454+02	2024-09-09 17:33:34.454+02	336	5
\N	2024-09-09 17:33:34.454+02	2024-09-09 17:33:34.454+02	336	28
\N	2024-09-09 17:49:23.964+02	2024-09-09 17:49:23.964+02	337	26
\N	2024-09-10 15:25:35.241+02	2024-09-10 15:25:35.241+02	338	2
\N	2024-09-10 15:26:28.226+02	2024-09-10 15:26:28.226+02	13	22
\N	2024-09-10 16:20:31.435+02	2024-09-10 16:20:31.435+02	339	12
\N	2024-09-10 16:20:31.435+02	2024-09-10 16:20:31.435+02	339	22
\N	2024-09-10 16:20:31.435+02	2024-09-10 16:20:31.435+02	339	4
\N	2024-09-10 16:22:03.089+02	2024-09-10 16:22:03.089+02	29	22
\N	2024-09-11 10:44:55.585+02	2024-09-11 10:44:55.585+02	341	12
\N	2024-09-11 10:58:41.448+02	2024-09-11 10:58:41.448+02	342	22
\N	2024-09-11 11:08:33.695+02	2024-09-11 11:08:33.695+02	343	12
\N	2024-09-11 11:18:21.839+02	2024-09-11 11:18:21.839+02	344	5
\N	2024-09-11 11:18:21.839+02	2024-09-11 11:18:21.839+02	344	28
\N	2024-09-11 11:38:49.983+02	2024-09-11 11:38:49.983+02	345	26
\N	2024-09-11 11:38:49.983+02	2024-09-11 11:38:49.983+02	345	22
\N	2024-09-11 12:04:50.971+02	2024-09-11 12:04:50.971+02	346	2
\N	2024-09-11 12:04:50.971+02	2024-09-11 12:04:50.971+02	346	22
\N	2024-09-11 12:04:50.971+02	2024-09-11 12:04:50.971+02	346	25
\N	2024-09-11 12:04:50.971+02	2024-09-11 12:04:50.971+02	346	14
\N	2024-09-11 12:04:50.971+02	2024-09-11 12:04:50.971+02	346	26
\N	2024-09-11 12:04:50.971+02	2024-09-11 12:04:50.971+02	346	4
\N	2024-09-11 12:04:50.971+02	2024-09-11 12:04:50.971+02	346	23
\N	2024-09-11 12:17:04.573+02	2024-09-11 12:17:04.573+02	347	2
\N	2024-09-11 13:51:33.302+02	2024-09-11 13:51:33.302+02	348	25
\N	2024-09-11 13:51:33.302+02	2024-09-11 13:51:33.302+02	348	2
\N	2024-09-11 13:51:33.302+02	2024-09-11 13:51:33.302+02	348	14
\N	2024-09-11 14:12:01.604+02	2024-09-11 14:12:01.604+02	349	2
\N	2024-09-11 17:22:33.255+02	2024-09-11 17:22:33.255+02	350	2
\N	2024-09-11 17:31:56.451+02	2024-09-11 17:31:56.451+02	351	2
\N	2024-09-12 15:26:41.792+02	2024-09-12 15:26:41.792+02	352	2
\N	2024-09-12 15:26:41.792+02	2024-09-12 15:26:41.792+02	352	22
\N	2024-09-12 15:26:41.792+02	2024-09-12 15:26:41.792+02	352	25
\N	2024-09-12 15:26:41.792+02	2024-09-12 15:26:41.792+02	352	12
\N	2024-09-12 15:26:41.792+02	2024-09-12 15:26:41.792+02	352	26
\N	2024-09-12 15:26:41.792+02	2024-09-12 15:26:41.792+02	352	4
\N	2024-09-12 15:36:25.771+02	2024-09-12 15:36:25.771+02	353	4
\N	2024-09-12 15:43:32.837+02	2024-09-12 15:43:32.837+02	354	4
\N	2024-09-12 16:24:14.345+02	2024-09-12 16:24:14.345+02	355	5
\N	2024-09-12 16:24:14.345+02	2024-09-12 16:24:14.345+02	355	2
\N	2024-09-12 16:24:14.345+02	2024-09-12 16:24:14.345+02	355	19
\N	2024-09-12 16:24:14.345+02	2024-09-12 16:24:14.345+02	355	21
\N	2024-09-12 16:24:14.345+02	2024-09-12 16:24:14.345+02	355	24
\N	2024-09-12 16:24:14.345+02	2024-09-12 16:24:14.345+02	355	4
\N	2024-09-12 16:24:14.345+02	2024-09-12 16:24:14.345+02	355	26
\N	2024-09-12 16:24:14.345+02	2024-09-12 16:24:14.345+02	355	25
\N	2024-09-12 17:02:57.884+02	2024-09-12 17:02:57.884+02	356	22
\N	2024-09-13 07:54:01.431+02	2024-09-13 07:54:01.431+02	357	5
\N	2024-09-13 07:54:01.431+02	2024-09-13 07:54:01.431+02	357	28
\N	2024-09-13 10:01:38.371+02	2024-09-13 10:01:38.371+02	358	4
\N	2024-09-13 10:28:04.643+02	2024-09-13 10:28:04.643+02	359	4
\N	2024-09-13 10:28:04.643+02	2024-09-13 10:28:04.643+02	359	26
\N	2024-09-13 10:40:50.978+02	2024-09-13 10:40:50.978+02	360	2
\N	2024-09-13 10:40:50.978+02	2024-09-13 10:40:50.978+02	360	22
\N	2024-09-13 10:40:50.978+02	2024-09-13 10:40:50.978+02	360	12
\N	2024-09-13 11:01:07.081+02	2024-09-13 11:01:07.081+02	361	4
\N	2024-09-13 11:30:35.447+02	2024-09-13 11:30:35.447+02	362	5
\N	2024-09-13 11:30:35.447+02	2024-09-13 11:30:35.447+02	362	28
\N	2024-09-13 13:37:09.691+02	2024-09-13 13:37:09.691+02	363	2
\N	2024-09-13 13:37:09.691+02	2024-09-13 13:37:09.691+02	363	29
\N	2024-09-13 13:37:58.049+02	2024-09-13 13:37:58.049+02	363	25
\N	2024-09-14 11:49:18.455+02	2024-09-14 11:49:18.455+02	364	26
\N	2024-09-14 12:27:06.591+02	2024-09-14 12:27:06.591+02	365	26
\N	2024-09-15 09:45:12.34+02	2024-09-15 09:45:12.34+02	367	5
\N	2024-09-15 09:45:12.34+02	2024-09-15 09:45:12.34+02	367	28
\N	2024-09-15 10:07:58.554+02	2024-09-15 10:07:58.554+02	368	5
\N	2024-09-15 10:07:58.554+02	2024-09-15 10:07:58.554+02	368	2
\N	2024-09-15 10:56:49.926+02	2024-09-15 10:56:49.926+02	369	4
\N	2024-09-15 10:56:49.926+02	2024-09-15 10:56:49.926+02	369	2
\N	2024-09-15 10:56:49.926+02	2024-09-15 10:56:49.926+02	369	26
\N	2024-09-15 10:56:49.926+02	2024-09-15 10:56:49.926+02	369	22
\N	2024-09-15 10:56:49.926+02	2024-09-15 10:56:49.926+02	369	25
\N	2024-09-15 10:57:14.681+02	2024-09-15 10:57:14.681+02	369	14
\N	2024-09-15 12:48:47.865+02	2024-09-15 12:48:47.865+02	370	5
\N	2024-09-15 12:48:47.865+02	2024-09-15 12:48:47.865+02	370	2
\N	2024-09-15 12:48:47.865+02	2024-09-15 12:48:47.865+02	370	4
\N	2024-09-15 12:48:47.865+02	2024-09-15 12:48:47.865+02	370	22
\N	2024-09-15 12:48:47.865+02	2024-09-15 12:48:47.865+02	370	25
\N	2024-09-15 12:48:47.865+02	2024-09-15 12:48:47.865+02	370	14
\N	2024-09-15 12:48:47.865+02	2024-09-15 12:48:47.865+02	370	26
\N	2024-09-15 13:31:33.172+02	2024-09-15 13:31:33.172+02	371	4
\N	2024-09-15 13:31:33.172+02	2024-09-15 13:31:33.172+02	371	29
\N	2024-09-16 15:34:48.812+02	2024-09-16 15:34:48.812+02	372	22
\N	2024-09-16 16:28:25.25+02	2024-09-16 16:28:25.25+02	373	4
\N	2024-09-16 16:28:25.25+02	2024-09-16 16:28:25.25+02	373	2
\N	2024-09-16 16:42:49.603+02	2024-09-16 16:42:49.603+02	374	4
\N	2024-09-16 17:04:34.634+02	2024-09-16 17:04:34.634+02	375	14
\N	2024-09-16 17:04:34.634+02	2024-09-16 17:04:34.634+02	375	25
\N	2024-09-17 16:22:30.593+02	2024-09-17 16:22:30.593+02	376	4
\N	2024-09-17 16:22:30.593+02	2024-09-17 16:22:30.593+02	376	2
\N	2024-09-17 16:22:30.593+02	2024-09-17 16:22:30.593+02	376	26
\N	2024-09-17 16:23:12.249+02	2024-09-17 16:23:12.249+02	376	29
\N	2024-09-17 16:23:40.006+02	2024-09-17 16:23:40.006+02	376	30
\N	2024-09-18 16:23:11.668+02	2024-09-18 16:23:11.668+02	377	4
\N	2024-09-18 16:55:45.898+02	2024-09-18 16:55:45.898+02	378	4
\N	2024-09-18 16:55:45.898+02	2024-09-18 16:55:45.898+02	378	29
\N	2024-09-18 17:06:11.616+02	2024-09-18 17:06:11.616+02	379	4
\N	2024-09-18 17:06:11.616+02	2024-09-18 17:06:11.616+02	379	2
\N	2024-09-20 10:40:51.282+02	2024-09-20 10:40:51.282+02	380	12
\N	2024-09-20 10:58:37.306+02	2024-09-20 10:58:37.306+02	381	22
\N	2024-09-20 13:02:08.43+02	2024-09-20 13:02:08.43+02	382	5
\N	2024-09-20 13:02:08.43+02	2024-09-20 13:02:08.43+02	382	28
\N	2024-09-20 13:02:08.43+02	2024-09-20 13:02:08.43+02	382	26
\N	2024-09-20 13:02:08.43+02	2024-09-20 13:02:08.43+02	382	24
\N	2024-09-20 13:35:06.122+02	2024-09-20 13:35:06.122+02	383	26
\N	2024-09-20 13:52:00.569+02	2024-09-20 13:52:00.569+02	384	5
\N	2024-09-20 13:52:26.79+02	2024-09-20 13:52:26.79+02	384	2
\N	2024-09-20 13:52:26.79+02	2024-09-20 13:52:26.79+02	384	4
\N	2024-09-20 13:52:26.79+02	2024-09-20 13:52:26.79+02	384	21
\N	2024-09-20 15:37:22.132+02	2024-09-20 15:37:22.132+02	385	5
\N	2024-09-20 15:37:22.132+02	2024-09-20 15:37:22.132+02	385	26
\N	2024-09-20 15:53:07.434+02	2024-09-20 15:53:07.434+02	386	5
\N	2024-09-20 15:53:07.434+02	2024-09-20 15:53:07.434+02	386	26
\N	2024-09-20 15:53:07.434+02	2024-09-20 15:53:07.434+02	386	2
\N	2024-09-20 15:53:07.434+02	2024-09-20 15:53:07.434+02	386	29
\N	2024-09-20 16:12:21.506+02	2024-09-20 16:12:21.506+02	387	2
\N	2024-09-20 16:12:21.506+02	2024-09-20 16:12:21.506+02	387	26
\N	2024-09-20 16:12:21.506+02	2024-09-20 16:12:21.506+02	387	25
\N	2024-09-20 16:12:21.506+02	2024-09-20 16:12:21.506+02	387	22
\N	2024-09-20 16:33:38.097+02	2024-09-20 16:33:38.097+02	388	4
\N	2024-09-21 11:19:56.786+02	2024-09-21 11:19:56.786+02	389	4
\N	2024-09-21 11:48:45.753+02	2024-09-21 11:48:45.753+02	390	26
\N	2024-09-21 12:13:58.289+02	2024-09-21 12:13:58.289+02	391	4
\N	2024-09-21 12:13:58.289+02	2024-09-21 12:13:58.289+02	391	29
\N	2024-09-21 13:07:58.933+02	2024-09-21 13:07:58.933+02	392	26
\N	2024-09-21 13:18:51.583+02	2024-09-21 13:18:51.583+02	393	2
\N	2024-09-21 13:27:15.323+02	2024-09-21 13:27:15.323+02	394	2
\N	2024-09-21 13:27:15.323+02	2024-09-21 13:27:15.323+02	394	26
\N	2024-09-21 13:46:04.526+02	2024-09-21 13:46:04.526+02	395	2
\N	2024-09-21 13:54:18.462+02	2024-09-21 13:54:18.462+02	396	2
\N	2024-09-21 13:54:18.462+02	2024-09-21 13:54:18.462+02	396	26
\N	2024-09-22 09:55:06.905+02	2024-09-22 09:55:06.905+02	397	5
\N	2024-09-22 09:55:06.905+02	2024-09-22 09:55:06.905+02	397	14
\N	2024-09-22 09:55:06.905+02	2024-09-22 09:55:06.905+02	397	22
\N	2024-09-22 09:55:06.905+02	2024-09-22 09:55:06.905+02	397	12
\N	2024-09-22 09:55:06.905+02	2024-09-22 09:55:06.905+02	397	4
\N	2024-09-22 10:14:37.532+02	2024-09-22 10:14:37.532+02	398	4
\N	2024-09-22 10:33:44.826+02	2024-09-22 10:33:44.826+02	399	4
\N	2024-09-22 10:48:47.984+02	2024-09-22 10:48:47.984+02	400	4
\N	2024-09-22 10:56:05.802+02	2024-09-22 10:56:05.802+02	401	4
\N	2024-09-22 13:02:18.772+02	2024-09-22 13:02:18.772+02	402	12
\N	2024-09-22 13:52:49.203+02	2024-09-22 13:52:49.203+02	403	26
\N	2024-09-23 16:05:27.708+02	2024-09-23 16:05:27.708+02	404	26
\N	2024-09-23 16:20:28.433+02	2024-09-23 16:20:28.433+02	405	12
\N	2024-09-23 16:20:28.433+02	2024-09-23 16:20:28.433+02	405	25
\N	2024-09-23 16:20:28.433+02	2024-09-23 16:20:28.433+02	405	22
\N	2024-09-23 16:20:28.433+02	2024-09-23 16:20:28.433+02	405	14
\N	2024-09-23 16:35:41.682+02	2024-09-23 16:35:41.682+02	406	25
\N	2024-09-23 16:41:23.892+02	2024-09-23 16:41:23.892+02	407	25
\N	2024-09-23 19:02:04.344+02	2024-09-23 19:02:04.344+02	408	29
\N	2024-09-24 15:50:14.493+02	2024-09-24 15:50:14.493+02	409	2
\N	2024-09-24 15:50:14.493+02	2024-09-24 15:50:14.493+02	409	26
\N	2024-09-24 15:50:14.493+02	2024-09-24 15:50:14.493+02	409	4
\N	2024-09-24 15:50:14.493+02	2024-09-24 15:50:14.493+02	409	12
\N	2024-09-24 15:50:14.493+02	2024-09-24 15:50:14.493+02	409	14
\N	2024-09-24 16:16:16.657+02	2024-09-24 16:16:16.657+02	410	2
\N	2024-09-24 16:16:16.657+02	2024-09-24 16:16:16.657+02	410	25
\N	2024-09-24 16:16:16.657+02	2024-09-24 16:16:16.657+02	410	14
\N	2024-09-24 16:34:44.968+02	2024-09-24 16:34:44.968+02	411	21
\N	2024-09-24 17:25:27.721+02	2024-09-24 17:25:27.721+02	412	2
\N	2024-09-24 17:25:27.721+02	2024-09-24 17:25:27.721+02	412	26
\N	2024-09-24 17:25:27.721+02	2024-09-24 17:25:27.721+02	412	4
\N	2024-09-25 15:30:52.154+02	2024-09-25 15:30:52.154+02	413	12
\N	2024-09-25 15:41:47.753+02	2024-09-25 15:41:47.753+02	414	5
\N	2024-09-25 15:41:47.753+02	2024-09-25 15:41:47.753+02	414	26
\N	2024-09-25 15:59:39.585+02	2024-09-25 15:59:39.585+02	416	2
\N	2024-09-25 16:19:35.035+02	2024-09-25 16:19:35.035+02	417	2
\N	2024-09-25 16:37:45.747+02	2024-09-25 16:37:45.747+02	418	2
\N	2024-09-25 16:37:45.747+02	2024-09-25 16:37:45.747+02	418	14
\N	2024-09-25 16:37:45.747+02	2024-09-25 16:37:45.747+02	418	25
\N	2024-09-25 16:47:05.358+02	2024-09-25 16:47:05.358+02	419	29
\N	2024-09-26 15:33:20.651+02	2024-09-26 15:33:20.651+02	420	26
\N	2024-09-26 15:49:17.715+02	2024-09-26 15:49:17.715+02	421	26
\N	2024-09-26 16:06:23.289+02	2024-09-26 16:06:23.289+02	422	5
\N	2024-09-26 16:06:23.289+02	2024-09-26 16:06:23.289+02	422	26
\N	2024-09-26 16:18:23.532+02	2024-09-26 16:18:23.532+02	423	2
\N	2024-09-26 16:59:52.333+02	2024-09-26 16:59:52.333+02	424	14
\N	2024-09-26 17:31:35.834+02	2024-09-26 17:31:35.834+02	425	12
\N	2024-09-27 09:13:12.045+02	2024-09-27 09:13:12.045+02	426	2
\N	2024-09-27 09:13:12.045+02	2024-09-27 09:13:12.045+02	426	29
\N	2024-09-27 09:13:12.045+02	2024-09-27 09:13:12.045+02	426	25
\N	2024-09-27 09:13:12.045+02	2024-09-27 09:13:12.045+02	426	14
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
\N	2024-07-17 16:39:07.369+02	2024-07-17 16:39:07.369+02	131	21
\N	2024-07-17 21:05:13.111+02	2024-07-17 21:05:13.111+02	132	5
\N	2024-07-18 17:24:01.795+02	2024-07-18 17:24:01.795+02	133	30
\N	2024-07-19 17:14:55.546+02	2024-07-19 17:14:55.546+02	135	5
\N	2024-07-21 13:23:21.104+02	2024-07-21 13:23:21.104+02	138	7
\N	2024-07-21 13:23:21.104+02	2024-07-21 13:23:21.104+02	138	12
\N	2024-07-21 13:50:54.185+02	2024-07-21 13:50:54.185+02	139	7
\N	2024-07-21 13:50:54.185+02	2024-07-21 13:50:54.185+02	139	12
\N	2024-07-22 16:08:40.375+02	2024-07-22 16:08:40.375+02	141	30
\N	2024-07-22 17:04:57.288+02	2024-07-22 17:04:57.288+02	142	29
\N	2024-07-22 17:04:57.288+02	2024-07-22 17:04:57.288+02	142	33
\N	2024-07-22 17:04:57.288+02	2024-07-22 17:04:57.288+02	142	31
\N	2024-07-23 17:05:09.807+02	2024-07-23 17:05:09.807+02	144	34
\N	2024-07-24 16:40:20.662+02	2024-07-24 16:40:20.662+02	146	12
\N	2024-07-24 16:40:20.662+02	2024-07-24 16:40:20.662+02	146	7
\N	2024-07-25 17:40:49.815+02	2024-07-25 17:40:49.815+02	147	35
\N	2024-07-26 09:43:48.586+02	2024-07-26 09:43:48.586+02	148	25
\N	2024-07-27 12:40:52.842+02	2024-07-27 12:40:52.842+02	149	5
\N	2024-07-27 13:06:34.095+02	2024-07-27 13:06:34.095+02	150	7
\N	2024-07-27 13:52:24.51+02	2024-07-27 13:52:24.51+02	151	36
\N	2024-07-27 15:33:00.169+02	2024-07-27 15:33:00.169+02	152	5
\N	2024-07-28 11:42:46.397+02	2024-07-28 11:42:46.397+02	153	12
\N	2024-07-28 11:42:46.397+02	2024-07-28 11:42:46.397+02	153	7
\N	2024-07-28 12:54:58.605+02	2024-07-28 12:54:58.605+02	155	26
\N	2024-07-28 13:11:21.846+02	2024-07-28 13:11:21.846+02	156	21
\N	2024-07-28 13:34:12.913+02	2024-07-28 13:34:12.913+02	157	33
\N	2024-07-28 13:34:12.913+02	2024-07-28 13:34:12.913+02	157	29
\N	2024-07-28 13:34:12.913+02	2024-07-28 13:34:12.913+02	157	31
\N	2024-07-30 16:47:36.961+02	2024-07-30 16:47:36.961+02	162	5
\N	2024-07-31 16:28:39.436+02	2024-07-31 16:28:39.436+02	163	14
\N	2024-08-01 15:59:17.142+02	2024-08-01 15:59:17.142+02	164	5
\N	2024-08-02 08:42:01.818+02	2024-08-02 08:42:01.818+02	166	14
\N	2024-08-02 09:31:57.874+02	2024-08-02 09:31:57.874+02	167	37
\N	2024-08-02 09:31:57.874+02	2024-08-02 09:31:57.874+02	167	38
\N	2024-08-02 10:24:13.159+02	2024-08-02 10:24:13.159+02	168	39
\N	2024-08-02 10:40:38.046+02	2024-08-02 10:40:38.046+02	169	5
\N	2024-08-02 12:01:00.192+02	2024-08-02 12:01:00.192+02	172	37
\N	2024-08-02 12:40:16.012+02	2024-08-02 12:40:16.012+02	174	36
\N	2024-08-03 10:25:14.626+02	2024-08-03 10:25:14.626+02	175	7
\N	2024-08-03 11:14:47.006+02	2024-08-03 11:14:47.006+02	176	5
\N	2024-08-03 13:08:01.755+02	2024-08-03 13:08:01.755+02	179	34
\N	2024-08-03 13:08:01.755+02	2024-08-03 13:08:01.755+02	179	22
\N	2024-08-03 13:26:13.279+02	2024-08-03 13:26:13.279+02	165	41
\N	2024-08-03 13:43:31.751+02	2024-08-03 13:43:31.751+02	180	40
\N	2024-08-04 12:07:09.407+02	2024-08-04 12:07:09.407+02	181	27
\N	2024-08-04 12:07:09.407+02	2024-08-04 12:07:09.407+02	181	5
\N	2024-08-04 12:21:37.518+02	2024-08-04 12:21:37.518+02	182	5
\N	2024-08-05 17:18:29.577+02	2024-08-05 17:18:29.577+02	187	36
\N	2024-08-06 16:44:11.638+02	2024-08-06 16:44:11.638+02	188	37
\N	2024-08-07 15:34:37.944+02	2024-08-07 15:34:37.944+02	189	5
\N	2024-08-07 15:49:16.934+02	2024-08-07 15:49:16.934+02	163	41
\N	2024-08-07 15:49:40.092+02	2024-08-07 15:49:40.092+02	190	14
\N	2024-08-07 15:49:40.092+02	2024-08-07 15:49:40.092+02	190	41
\N	2024-08-07 16:34:35.799+02	2024-08-07 16:34:35.799+02	191	42
\N	2024-08-07 16:34:35.799+02	2024-08-07 16:34:35.799+02	191	15
\N	2024-08-07 16:44:02.906+02	2024-08-07 16:44:02.906+02	192	12
\N	2024-08-08 15:56:57.24+02	2024-08-08 15:56:57.24+02	191	17
\N	2024-08-08 16:05:30.976+02	2024-08-08 16:05:30.976+02	193	42
\N	2024-08-09 11:27:40.593+02	2024-08-09 11:27:40.593+02	195	21
\N	2024-08-09 11:35:10.229+02	2024-08-09 11:35:10.229+02	196	37
\N	2024-08-09 11:53:15.763+02	2024-08-09 11:53:15.763+02	197	41
\N	2024-08-09 12:50:27.502+02	2024-08-09 12:50:27.502+02	199	41
\N	2024-08-10 11:51:02.865+02	2024-08-10 11:51:02.865+02	201	5
\N	2024-08-10 12:44:09.54+02	2024-08-10 12:44:09.54+02	202	43
\N	2024-08-10 13:01:47.052+02	2024-08-10 13:01:47.052+02	203	43
\N	2024-08-11 12:46:36.439+02	2024-08-11 12:46:36.439+02	206	7
\N	2024-08-11 13:24:10.803+02	2024-08-11 13:24:10.803+02	207	43
\N	2024-08-12 17:12:05.284+02	2024-08-12 17:12:05.284+02	210	30
\N	2024-08-13 16:27:15.596+02	2024-08-13 16:27:15.596+02	211	33
\N	2024-08-13 16:27:15.596+02	2024-08-13 16:27:15.596+02	211	31
\N	2024-08-13 16:27:15.596+02	2024-08-13 16:27:15.596+02	211	29
\N	2024-08-14 17:06:46.926+02	2024-08-14 17:06:46.926+02	213	36
\N	2024-08-18 13:32:35.986+02	2024-08-18 13:32:35.986+02	214	15
\N	2024-08-18 13:32:35.986+02	2024-08-18 13:32:35.986+02	214	37
\N	2024-08-19 13:12:11.396+02	2024-08-19 13:12:11.396+02	216	5
\N	2024-08-19 13:30:20.418+02	2024-08-19 13:30:20.418+02	217	5
\N	2024-08-19 14:15:09.105+02	2024-08-19 14:15:09.105+02	219	17
\N	2024-08-22 16:33:28.547+02	2024-08-22 16:33:28.547+02	222	17
\N	2024-08-22 16:33:28.547+02	2024-08-22 16:33:28.547+02	222	44
\N	2024-08-22 17:09:34.531+02	2024-08-22 17:09:34.531+02	223	5
\N	2024-08-22 17:27:56.719+02	2024-08-22 17:27:56.719+02	224	5
\N	2024-08-23 12:50:57.905+02	2024-08-23 12:50:57.905+02	227	43
\N	2024-08-23 13:21:49.489+02	2024-08-23 13:21:49.489+02	229	26
\N	2024-08-23 13:38:12.129+02	2024-08-23 13:38:12.129+02	230	15
\N	2024-08-23 16:17:52.736+02	2024-08-23 16:17:52.736+02	231	5
\N	2024-08-23 16:31:32.9+02	2024-08-23 16:31:32.9+02	232	5
\N	2024-08-23 16:47:07.908+02	2024-08-23 16:47:07.908+02	233	26
\N	2024-08-24 11:22:07.234+02	2024-08-24 11:22:07.234+02	236	12
\N	2024-08-24 11:40:52.455+02	2024-08-24 11:40:52.455+02	237	41
\N	2024-08-24 11:40:52.455+02	2024-08-24 11:40:52.455+02	237	14
\N	2024-08-24 13:43:25.857+02	2024-08-24 13:43:25.857+02	239	39
\N	2024-08-25 11:56:28.684+02	2024-08-25 11:56:28.684+02	241	41
\N	2024-08-25 12:59:15.092+02	2024-08-25 12:59:15.092+02	242	5
\N	2024-08-25 13:11:19.112+02	2024-08-25 13:11:19.112+02	243	5
\N	2024-08-25 13:26:10.78+02	2024-08-25 13:26:10.78+02	244	5
\N	2024-08-26 15:37:48.202+02	2024-08-26 15:37:48.202+02	249	37
\N	2024-08-26 15:48:37.944+02	2024-08-26 15:48:37.944+02	250	37
\N	2024-08-26 16:04:33.507+02	2024-08-26 16:04:33.507+02	251	36
\N	2024-08-27 16:16:22.807+02	2024-08-27 16:16:22.807+02	253	17
\N	2024-08-27 16:16:32.101+02	2024-08-27 16:16:32.101+02	253	11
\N	2024-08-27 17:01:57.31+02	2024-08-27 17:01:57.31+02	254	25
\N	2024-08-27 17:01:57.31+02	2024-08-27 17:01:57.31+02	254	17
\N	2024-08-27 17:15:38.706+02	2024-08-27 17:15:38.706+02	255	5
\N	2024-08-28 15:55:00.075+02	2024-08-28 15:55:00.075+02	256	12
\N	2024-08-28 16:34:05.136+02	2024-08-28 16:34:05.136+02	257	43
\N	2024-08-28 16:47:23.838+02	2024-08-28 16:47:23.838+02	258	12
\N	2024-08-28 16:47:23.838+02	2024-08-28 16:47:23.838+02	258	7
\N	2024-08-28 17:49:24.042+02	2024-08-28 17:49:24.042+02	259	45
\N	2024-08-28 17:57:37.528+02	2024-08-28 17:57:37.528+02	260	45
\N	2024-08-29 15:56:48.4+02	2024-08-29 15:56:48.4+02	262	41
\N	2024-08-29 16:11:37.236+02	2024-08-29 16:11:37.236+02	263	17
\N	2024-08-29 16:11:37.236+02	2024-08-29 16:11:37.236+02	263	42
\N	2024-08-29 16:11:37.236+02	2024-08-29 16:11:37.236+02	263	15
\N	2024-08-29 17:18:47.071+02	2024-08-29 17:18:47.071+02	268	7
\N	2024-08-29 20:58:32.668+02	2024-08-29 20:58:32.668+02	270	37
\N	2024-08-29 21:14:32.806+02	2024-08-29 21:14:32.806+02	271	5
\N	2024-08-29 21:14:32.806+02	2024-08-29 21:14:32.806+02	271	29
\N	2024-08-30 09:01:30.109+02	2024-08-30 09:01:30.109+02	273	17
\N	2024-08-30 09:27:37.413+02	2024-08-30 09:27:37.413+02	274	9
\N	2024-08-30 09:35:33.094+02	2024-08-30 09:35:33.094+02	275	9
\N	2024-08-31 14:06:13.236+02	2024-08-31 14:06:13.236+02	278	5
\N	2024-09-01 10:12:02.35+02	2024-09-01 10:12:02.35+02	279	5
\N	2024-09-01 10:27:07.721+02	2024-09-01 10:27:07.721+02	280	12
\N	2024-09-01 11:19:18.568+02	2024-09-01 11:19:18.568+02	282	7
\N	2024-09-01 11:19:18.568+02	2024-09-01 11:19:18.568+02	282	12
\N	2024-09-01 12:45:31.331+02	2024-09-01 12:45:31.331+02	283	41
\N	2024-09-01 12:45:38.39+02	2024-09-01 12:45:38.39+02	283	7
\N	2024-09-01 13:23:31.592+02	2024-09-01 13:23:31.592+02	284	5
\N	2024-09-02 16:15:54.2+02	2024-09-02 16:15:54.2+02	286	39
\N	2024-09-02 17:07:17.544+02	2024-09-02 17:07:17.544+02	287	29
\N	2024-09-02 17:07:17.544+02	2024-09-02 17:07:17.544+02	287	31
\N	2024-09-02 17:07:17.544+02	2024-09-02 17:07:17.544+02	287	33
\N	2024-09-02 17:26:35.249+02	2024-09-02 17:26:35.249+02	288	29
\N	2024-09-02 17:26:35.249+02	2024-09-02 17:26:35.249+02	288	31
\N	2024-09-02 17:26:35.249+02	2024-09-02 17:26:35.249+02	288	33
\N	2024-09-02 17:44:19.049+02	2024-09-02 17:44:19.049+02	289	29
\N	2024-09-02 17:44:19.049+02	2024-09-02 17:44:19.049+02	289	31
\N	2024-09-02 17:44:19.049+02	2024-09-02 17:44:19.049+02	289	33
\N	2024-09-03 16:28:13.828+02	2024-09-03 16:28:13.828+02	290	14
\N	2024-09-03 16:28:25.038+02	2024-09-03 16:28:25.038+02	290	41
\N	2024-09-03 16:38:20.903+02	2024-09-03 16:38:20.903+02	291	14
\N	2024-09-03 16:38:20.903+02	2024-09-03 16:38:20.903+02	291	41
\N	2024-09-03 16:57:28.808+02	2024-09-03 16:57:28.808+02	292	14
\N	2024-09-03 16:57:28.808+02	2024-09-03 16:57:28.808+02	292	41
\N	2024-09-04 16:14:47.869+02	2024-09-04 16:14:47.869+02	296	5
\N	2024-09-04 16:14:47.869+02	2024-09-04 16:14:47.869+02	296	27
\N	2024-09-04 17:22:05.11+02	2024-09-04 17:22:05.11+02	297	12
\N	2024-09-05 15:53:14.885+02	2024-09-05 15:53:14.885+02	298	3
\N	2024-09-05 17:12:23.782+02	2024-09-05 17:12:23.782+02	299	41
\N	2024-09-05 17:36:24.618+02	2024-09-05 17:36:24.618+02	300	36
\N	2024-09-06 08:48:51.529+02	2024-09-06 08:48:51.529+02	302	46
\N	2024-09-06 09:04:44.703+02	2024-09-06 09:04:44.703+02	303	30
\N	2024-09-06 09:33:21.016+02	2024-09-06 09:33:21.016+02	304	41
\N	2024-09-06 10:25:29.359+02	2024-09-06 10:25:29.359+02	305	7
\N	2024-09-06 10:25:29.359+02	2024-09-06 10:25:29.359+02	305	12
\N	2024-09-06 10:35:14.721+02	2024-09-06 10:35:14.721+02	306	12
\N	2024-09-06 10:35:14.721+02	2024-09-06 10:35:14.721+02	306	7
\N	2024-09-06 10:47:32.53+02	2024-09-06 10:47:32.53+02	307	7
\N	2024-09-06 10:47:32.53+02	2024-09-06 10:47:32.53+02	307	12
\N	2024-09-06 10:56:39.997+02	2024-09-06 10:56:39.997+02	308	21
\N	2024-09-06 13:04:32.696+02	2024-09-06 13:04:32.696+02	312	43
\N	2024-09-06 13:39:30.441+02	2024-09-06 13:39:30.441+02	313	25
\N	2024-09-06 13:39:30.441+02	2024-09-06 13:39:30.441+02	313	24
\N	2024-09-06 16:51:01.776+02	2024-09-06 16:51:01.776+02	315	38
\N	2024-09-06 16:51:01.776+02	2024-09-06 16:51:01.776+02	315	37
\N	2024-09-06 17:02:45.734+02	2024-09-06 17:02:45.734+02	316	38
\N	2024-09-06 17:02:45.734+02	2024-09-06 17:02:45.734+02	316	37
\N	2024-09-06 17:12:53.8+02	2024-09-06 17:12:53.8+02	317	5
\N	2024-09-07 11:00:53.804+02	2024-09-07 11:00:53.804+02	319	27
\N	2024-09-07 13:43:51.827+02	2024-09-07 13:43:51.827+02	323	43
\N	2024-09-08 09:49:27.086+02	2024-09-08 09:49:27.086+02	326	30
\N	2024-09-08 10:12:28.062+02	2024-09-08 10:12:28.062+02	327	47
\N	2024-09-08 11:07:32.211+02	2024-09-08 11:07:32.211+02	328	7
\N	2024-09-09 15:43:29.248+02	2024-09-09 15:43:29.248+02	330	30
\N	2024-09-09 16:28:32.12+02	2024-09-09 16:28:32.12+02	331	30
\N	2024-09-09 16:37:20.139+02	2024-09-09 16:37:20.139+02	332	30
\N	2024-09-09 16:37:20.139+02	2024-09-09 16:37:20.139+02	332	7
\N	2024-09-09 17:49:02.634+02	2024-09-09 17:49:02.634+02	337	5
\N	2024-09-10 15:24:59.432+02	2024-09-10 15:24:59.432+02	338	5
\N	2024-09-10 16:46:10.139+02	2024-09-10 16:46:10.139+02	340	48
\N	2024-09-10 16:46:16.712+02	2024-09-10 16:46:16.712+02	340	12
\N	2024-09-11 10:44:21.994+02	2024-09-11 10:44:21.994+02	341	43
\N	2024-09-11 10:58:36.277+02	2024-09-11 10:58:36.277+02	342	43
\N	2024-09-11 11:08:27.272+02	2024-09-11 11:08:27.272+02	343	43
\N	2024-09-11 11:18:09.967+02	2024-09-11 11:18:09.967+02	344	41
\N	2024-09-11 11:38:30.639+02	2024-09-11 11:38:30.639+02	345	7
\N	2024-09-11 12:03:59.169+02	2024-09-11 12:03:59.169+02	346	21
\N	2024-09-11 13:51:09.788+02	2024-09-11 13:51:09.788+02	348	17
\N	2024-09-11 13:51:09.788+02	2024-09-11 13:51:09.788+02	348	14
\N	2024-09-11 13:51:17.44+02	2024-09-11 13:51:17.44+02	348	15
\N	2024-09-11 14:11:50.873+02	2024-09-11 14:11:50.873+02	349	41
\N	2024-09-11 17:19:33.522+02	2024-09-11 17:19:33.522+02	350	5
\N	2024-09-11 17:31:07.877+02	2024-09-11 17:31:07.877+02	351	5
\N	2024-09-12 15:35:29.441+02	2024-09-12 15:35:29.441+02	353	5
\N	2024-09-12 15:43:18.316+02	2024-09-12 15:43:18.316+02	354	5
\N	2024-09-13 07:53:49.574+02	2024-09-13 07:53:49.574+02	357	37
\N	2024-09-13 10:01:31.227+02	2024-09-13 10:01:31.227+02	358	19
\N	2024-09-13 10:27:15.618+02	2024-09-13 10:27:15.618+02	359	19
\N	2024-09-13 11:30:26.219+02	2024-09-13 11:30:26.219+02	362	12
\N	2024-09-13 13:36:36.607+02	2024-09-13 13:36:36.607+02	363	7
\N	2024-09-13 13:36:43.791+02	2024-09-13 13:36:43.791+02	363	41
\N	2024-09-14 12:26:38.318+02	2024-09-14 12:26:38.318+02	365	5
\N	2024-09-15 10:56:30.306+02	2024-09-15 10:56:30.306+02	369	37
\N	2024-09-15 12:47:55.891+02	2024-09-15 12:47:55.891+02	370	29
\N	2024-09-15 13:30:53.215+02	2024-09-15 13:30:53.215+02	371	31
\N	2024-09-16 16:28:02.058+02	2024-09-16 16:28:02.058+02	373	12
\N	2024-09-16 16:28:02.058+02	2024-09-16 16:28:02.058+02	373	7
\N	2024-09-16 16:42:42.15+02	2024-09-16 16:42:42.15+02	374	7
\N	2024-09-16 16:42:42.15+02	2024-09-16 16:42:42.15+02	374	12
\N	2024-09-17 16:21:03.513+02	2024-09-17 16:21:03.513+02	376	45
\N	2024-09-17 16:21:31.197+02	2024-09-17 16:21:31.197+02	376	7
\N	2024-09-18 16:22:57.834+02	2024-09-18 16:22:57.834+02	377	9
\N	2024-09-18 16:55:34.187+02	2024-09-18 16:55:34.187+02	378	12
\N	2024-09-18 16:55:34.187+02	2024-09-18 16:55:34.187+02	378	18
\N	2024-09-18 17:05:23.69+02	2024-09-18 17:05:23.69+02	379	12
\N	2024-09-18 17:05:23.69+02	2024-09-18 17:05:23.69+02	379	18
\N	2024-09-20 10:40:40.651+02	2024-09-20 10:40:40.651+02	380	41
\N	2024-09-20 10:40:40.651+02	2024-09-20 10:40:40.651+02	380	14
\N	2024-09-20 10:58:26.741+02	2024-09-20 10:58:26.741+02	381	41
\N	2024-09-20 10:58:26.741+02	2024-09-20 10:58:26.741+02	381	14
\N	2024-09-20 13:34:47.772+02	2024-09-20 13:34:47.772+02	383	5
\N	2024-09-20 15:52:54.072+02	2024-09-20 15:52:54.072+02	386	42
\N	2024-09-21 11:19:05.284+02	2024-09-21 11:19:05.284+02	389	12
\N	2024-09-21 11:48:39.371+02	2024-09-21 11:48:39.371+02	390	17
\N	2024-09-21 11:48:39.371+02	2024-09-21 11:48:39.371+02	390	12
\N	2024-09-21 11:48:39.371+02	2024-09-21 11:48:39.371+02	390	7
\N	2024-09-21 13:07:49.359+02	2024-09-21 13:07:49.359+02	392	43
\N	2024-09-22 09:54:16.068+02	2024-09-22 09:54:16.068+02	397	49
\N	2024-09-22 10:13:33.08+02	2024-09-22 10:13:33.08+02	398	13
\N	2024-09-22 10:33:12.752+02	2024-09-22 10:33:12.752+02	399	5
\N	2024-09-22 10:47:42.209+02	2024-09-22 10:47:42.209+02	400	5
\N	2024-09-22 10:55:50.468+02	2024-09-22 10:55:50.468+02	401	5
\N	2024-09-22 13:02:02.814+02	2024-09-22 13:02:02.814+02	402	5
\N	2024-09-22 13:52:37.757+02	2024-09-22 13:52:37.757+02	403	5
\N	2024-09-23 16:05:22.202+02	2024-09-23 16:05:22.202+02	404	5
\N	2024-09-23 16:20:02.607+02	2024-09-23 16:20:02.607+02	405	17
\N	2024-09-23 16:20:02.607+02	2024-09-23 16:20:02.607+02	405	12
\N	2024-09-23 16:35:34.773+02	2024-09-23 16:35:34.773+02	406	37
\N	2024-09-23 16:41:16.497+02	2024-09-23 16:41:16.497+02	407	37
\N	2024-09-23 19:01:30.614+02	2024-09-23 19:01:30.614+02	408	5
\N	2024-09-24 15:49:45.456+02	2024-09-24 15:49:45.456+02	409	43
\N	2024-09-24 16:15:44.307+02	2024-09-24 16:15:44.307+02	410	43
\N	2024-09-24 16:34:36.956+02	2024-09-24 16:34:36.956+02	411	14
\N	2024-09-24 17:24:40.739+02	2024-09-24 17:24:40.739+02	412	17
\N	2024-09-24 17:24:40.739+02	2024-09-24 17:24:40.739+02	412	7
\N	2024-09-25 15:30:38.612+02	2024-09-25 15:30:38.612+02	413	43
\N	2024-09-25 15:30:38.612+02	2024-09-25 15:30:38.612+02	413	37
\N	2024-09-25 15:41:39.82+02	2024-09-25 15:41:39.82+02	414	43
\N	2024-09-25 15:41:39.82+02	2024-09-25 15:41:39.82+02	414	37
\N	2024-09-25 15:51:05.916+02	2024-09-25 15:51:05.916+02	415	43
\N	2024-09-25 15:51:05.916+02	2024-09-25 15:51:05.916+02	415	37
\N	2024-09-25 15:58:58.738+02	2024-09-25 15:58:58.738+02	416	43
\N	2024-09-25 15:58:58.738+02	2024-09-25 15:58:58.738+02	416	37
\N	2024-09-25 16:19:28.586+02	2024-09-25 16:19:28.586+02	417	43
\N	2024-09-25 16:37:18.765+02	2024-09-25 16:37:18.765+02	418	36
\N	2024-09-26 15:32:12.977+02	2024-09-26 15:32:12.977+02	420	29
\N	2024-09-26 16:06:03.24+02	2024-09-26 16:06:03.24+02	422	41
\N	2024-09-26 16:59:41.291+02	2024-09-26 16:59:41.291+02	424	24
\N	2024-09-26 17:31:02.187+02	2024-09-26 17:31:02.187+02	425	43
\N	2024-09-27 09:12:43.317+02	2024-09-27 09:12:43.317+02	426	17
\N	2024-09-27 09:12:51.804+02	2024-09-27 09:12:51.804+02	426	25
\.


--
-- Data for Name: Games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Games" (id, name, main_img, logo, back_cover, release_date, score, format, price, num_players, alt_name, owned, personal_status, "createdAt", "updatedAt", "franchiseId", "serieId", color, wikipedia, media, dlc) FROM stdin;
5	Spacewar!	spacewar!/cover.png	spacewar!/logo.jpg	spacewar!/back.jpg	1962-01-01	\N	-	\N	2	\N	\N	NOT_PLAYED	2024-04-24 16:52:50.645+02	2024-04-24 16:55:13.325+02	\N	\N	\N	https://es.wikipedia.org/wiki/Spacewar!	https://www.youtube.com/embed/Rmvb4Hktv7U	\N
14	Galaxian	galaxian/galaxian/cover.jpg	galaxian/galaxian/logo.png	galaxian/galaxian/back.jpg	1979-11-01	\N	NTSC	20	1-2	\N	\N	NOT_PLAYED	2024-04-30 18:23:03.915+02	2024-04-30 18:25:21.424+02	6	7	#023693	https://es.wikipedia.org/wiki/Galaxian	https://www.youtube.com/embed/XhYVcwhSWjI	\N
26	Donkey Kong	donkey_kong/donkey_kong/cover.jpeg	donkey_kong/donkey_kong/logo.png	donkey_kong/donkey_kong/back.jpg	1981-07-09	\N	PAL-EUR	25	1 (2 alternando)	\N	\N	PLAYED	2024-05-25 12:23:19.891+02	2024-07-19 16:05:52.902+02	13	14	#663605	https://es.wikipedia.org/wiki/Donkey_Kong_(videojuego)	https://www.youtube.com/embed/UBHJhla8TO4	\N
15	Zork I	zork/zork_I/cover.jpg	zork/zork_I/logo.jpg	zork/zork_I/back.jpeg	1980-01-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-05-01 11:37:46.758+02	2024-05-01 11:40:28.5+02	7	8	\N	https://es.wikipedia.org/wiki/Zork	https://www.youtube.com/embed/PWQDccL0aXM	\N
6	The Oregon Trail	oregon_trail/cover.jpeg	oregon_trail/logo.png	oregon_trail/back.jpeg	1971-12-03	\N	-	\N	1	\N	\N	NOT_PLAYED	2024-04-25 00:16:21.247+02	2024-04-25 15:40:01.055+02	3	4	\N	https://es.wikipedia.org/wiki/Oregon_Trail_(videojuego)	https://www.youtube.com/embed/g8B-JjzbthI	\N
7	Pong	pong/cover.jpeg	pong/logo.jpg	pong/back.png	1972-11-29	\N	-	\N	2	\N	\N	COMPLETED	2024-04-26 13:25:08.872+02	2024-04-26 13:25:08.872+02	\N	\N	#fcd11c	https://es.wikipedia.org/wiki/Pong	https://www.youtube.com/embed/fiShX2pTz9A	\N
8	Gun Fight	gun_fight/cover.jpg	gun_fight/logo.png	gun_fight/back.jpg	1975-11-01	\N	-	\N	2	Western Gun (Japón)	\N	NOT_PLAYED	2024-04-27 18:07:46.398+02	2024-04-27 18:08:06.301+02	\N	\N	\N	https://en.wikipedia.org/wiki/Gun_Fight	https://www.youtube.com/embed/xYa0G6KGayk	\N
4	Sonic the Hedgehog 2	sonic/sonic_the_hedgehog_2/cover.jpg	sonic/sonic_the_hedgehog_2/logo.png	sonic/sonic_the_hedgehog_2/back.jpg	1992-11-24	90	PAL-EUR	30	1-2	\N	t	PLAYED	2024-04-16 16:34:44.642+02	2024-09-05 17:45:00.799+02	1	1	#17569b	https://es.wikipedia.org/wiki/Sonic_the_Hedgehog_2_(Mega_Drive)	https://www.youtube.com/embed/oR2HjN_GEZ8	\N
10	Colossal Cave Adventure	colossal_cave_adventure/cover.jpg	colossal_cave_adventure/logo.jpeg	colossal_cave_adventure/back.jpg	1976-01-01	\N	-	\N	1	Adventure	\N	NOT_PLAYED	2024-04-27 19:28:45.604+02	2024-04-27 19:29:06.36+02	\N	\N	\N	https://es.wikipedia.org/wiki/Colossal_Cave_Adventure	https://www.youtube.com/embed/O3etkSoHrR8	\N
11	Space Invaders	space_invaders/space_invaders/cover.jpg	space_invaders/space_invaders/logo.png	space_invaders/space_invaders/back.jpg	1978-04-01	\N	NTSC	20	1	\N	\N	PLAYED	2024-04-28 12:00:56.785+02	2024-04-28 12:30:08.474+02	4	5	#02073f	https://es.wikipedia.org/wiki/Space_Invaders	https://www.youtube.com/embed/uGjgxwiemms	\N
12	Lunar Lander	lunar_lander/cover.jpg	lunar_lander/logo.png	lunar_lander/back.jpeg	1979-08-01	\N	-	\N	1		\N	PLAYED	2024-04-28 13:21:38.947+02	2024-04-28 13:22:04.275+02	\N	\N	\N	https://es.wikipedia.org/wiki/Lunar_Lander	https://www.youtube.com/embed/McAhSoAEbhM	\N
13	Asteroids	asteroids/asteroids/cover.jpg	asteroids/asteroids/logo.png	asteroids/asteroids/back.jpg	1979-11-01	\N	NTSC	15	1 (2 alternando)	\N	\N	PLAYED	2024-04-29 18:16:22.924+02	2024-07-19 15:54:25.947+02	5	6	#170e31	https://es.wikipedia.org/wiki/Asteroids	https://www.youtube.com/embed/9Ydu8UhIjeU	\N
16	Zork II	zork/zork_II/cover.jpeg	zork/zork_II/logo.jpeg	zork/zork_II/back.jpg	1981-11-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-05-01 11:47:10.807+02	2024-05-01 11:48:50.353+02	7	8	\N	https://es.wikipedia.org/wiki/Zork	https://www.youtube.com/embed/NiAFTe76iwg	\N
25	Centipede	centipede/centipede/cover.jpeg	centipede/centipede/logo.png	centipede/centipede/back.jpeg	1981-08-01	\N	NTSC	15	1 (2 alternando)	\N	\N	NOT_PLAYED	2024-05-23 19:12:30.747+02	2024-07-19 16:04:27.485+02	12	13	\N	https://es.wikipedia.org/wiki/Centipede_(videojuego)	https://www.youtube.com/embed/V7XEmf02zEM	\N
17	Zork III	zork/zork_III/cover.jpg	zork/zork_III/logo.jpeg	zork/zork_III/back.jpeg	1982-01-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-05-01 11:53:16.202+02	2024-05-01 11:54:18.167+02	7	8	\N	https://es.wikipedia.org/wiki/Zork	https://www.youtube.com/embed/pXyq4YrCoAc	\N
18	Rogue	rogue/cover.jpeg	rogue/logo.jpg	rogue/back.jpeg	1980-01-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-05-01 12:55:34.513+02	2024-05-01 12:55:34.513+02	\N	\N	\N	https://es.wikipedia.org/wiki/Rogue	https://www.youtube.com/embed/vxF1osPkplA	\N
19	Mystery House	mystery_house/cover.jpg	mystery_house/logo.jpeg	mystery_house/back.jpg	1980-05-05	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-05-01 20:03:18.912+02	2024-05-01 20:03:18.912+02	\N	\N	\N	https://es.wikipedia.org/wiki/Mystery_House	https://www.youtube.com/embed/kiwHwPvIHBs	\N
22	Ultima I: The First Age of Darkness	ultima/ultima_i/cover.jpg	ultima/ultima_i/logo.jpeg	ultima/ultima_i/back.jpeg	1981-06-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-05-18 20:07:19.23+02	2024-05-18 20:09:29.189+02	10	11	\N	https://es.wikipedia.org/wiki/Ultima_I:_el_primer_a%C3%B1o_de_la_oscuridad	https://www.youtube.com/embed/NrQFzWO4pYo	\N
23	Galaga	galaxian/galaga/cover.png	galaxian/galaga/logo.svg	galaxian/galaga/back.jpeg	1981-09-25	80	PAL-EUR	150	1 (2 alternando)	\N	\N	NOT_PLAYED	2024-05-19 12:33:10.65+02	2024-07-19 15:51:30.119+02	6	7	\N	https://es.wikipedia.org/wiki/Galaga	https://www.youtube.com/embed/29VVkfuXkVI	\N
9	Breakout	breakout/cover.png	breakout/logo.jpeg	breakout/back.jpg	1976-05-13	\N	-	\N	1 (2 alternando)	\N	\N	COMPLETED	2024-04-27 18:47:46.931+02	2024-07-19 17:29:33.541+02	\N	\N	\N	https://es.wikipedia.org/wiki/Breakout_(videojuego)	https://www.youtube.com/embed/AMUv8KvVt08	\N
21	Defender	defender/defender/cover.jpg	defender/defender/logo.png	defender/defender/back.jpg	1981-02-06	\N	NTSC	20	1 (2 alternando)	\N	\N	NOT_PLAYED	2024-05-12 13:58:55.068+02	2024-07-19 16:05:19.875+02	9	10	\N	https://es.wikipedia.org/wiki/Defender_(videojuego)	https://www.youtube.com/embed/qq_Zvg9KlII	\N
20	Pac-Man	pacman/pacman/cover.jpg	pacman/pacman/logo.png	pacman/pacman/back.jpg	1980-12-01	\N	NTSC	20	1	Puck-man (Japón)	\N	PLAYED	2024-05-03 11:26:36.598+02	2024-05-26 12:57:11.498+02	8	9	#ed6b0e	https://es.wikipedia.org/wiki/Pac-Man	https://www.youtube.com/embed/dScq4P5gn4A	\N
24	Frogger	frogger/frogger/cover.jpeg	frogger/frogger/logo.png	frogger/frogger/back.jpg	1981-06-28	\N	NTSC	40	1 (2 alternando)	\N	\N	PLAYED	2024-05-22 21:37:32.483+02	2024-07-19 16:08:14.478+02	11	12	\N	https://es.wikipedia.org/wiki/Frogger	https://www.youtube.com/embed/WNrz9_Fe-Us	\N
27	Joust	joust/joust/cover.jpeg	joust/joust/logo.png	joust/joust/back.jpeg	1982-07-16	\N	PAL-EUR	25	1-2	\N	\N	NOT_PLAYED	2024-05-26 13:38:24.975+02	2024-05-26 13:39:52.322+02	15	15	\N	https://es.wikipedia.org/wiki/Joust	https://www.youtube.com/embed/BWoiLNri0OM	\N
28	Ms. Pac-Man	pacman/ms-pacman/cover.jpg	pacman/ms-pacman/logo.png	pacman/ms-pacman/back.jpg	1982-02-01	\N	PAL-EUR	25	1-2	\N	\N	NOT_PLAYED	2024-05-28 17:35:57.266+02	2024-05-28 17:39:21.027+02	8	9	#ed6b0e	https://es.wikipedia.org/wiki/Ms._Pac-Man	https://www.youtube.com/embed/HQv0zAXDCo8	\N
29	Q*bert	qbert/qbert/cover.jpeg	qbert/qbert/logo.jpeg	qbert/qbert/back.jpeg	1982-10-18	\N	PAL-EUR	30	1-2	\N	\N	NOT_PLAYED	2024-05-30 17:18:00.018+02	2024-05-30 17:23:19.659+02	16	16	\N	https://es.wikipedia.org/wiki/Q*bert	https://www.youtube.com/embed/HKIbhaQfs-A	\N
30	Pitfall!	pitfall/pitfall/cover.jpeg	pitfall/pitfall/logo.png	pitfall/pitfall/back.jpeg	1982-09-20	\N	PAL-EUR	65	1	\N	\N	PLAYED	2024-05-31 14:30:35.242+02	2024-05-31 14:32:15.317+02	17	17	\N	https://es.wikipedia.org/wiki/Pitfall!	https://www.youtube.com/embed/pslbO6Fddhw	\N
31	Robotron: 2084	robotron/robotron2084/cover.jpeg	robotron/robotron2084/logo.jpeg	robotron/robotron2084/back.jpeg	1982-01-01	\N	PAL-EUR	80	1-2	\N	\N	NOT_PLAYED	2024-06-01 13:13:20.346+02	2024-06-01 13:14:30.563+02	18	18	\N	https://es.wikipedia.org/wiki/Robotron:_2084	https://www.youtube.com/embed/l800GL6NQPY	\N
32	E.T. the Extra-Terrestrial	et/et_the_extraterrestrial/cover.jpeg	et/et_the_extraterrestrial/logo.png	et/et_the_extraterrestrial/back.jpeg	1982-12-02	\N	NTSC	35	1	\N	\N	NOT_PLAYED	2024-06-02 12:01:05.699+02	2024-06-02 12:02:34.159+02	19	19	\N	https://es.wikipedia.org/wiki/E.T._the_Extra-Terrestrial_(videojuego)	https://www.youtube.com/embed/QmrQkQsM9FU	\N
44	Boulder Dash	boulder_dash/boulder_dash/cover.jpg	boulder_dash/boulder_dash/logo.png	boulder_dash/boulder_dash/back.jpg	1984-03-01	\N	GLOBAL	65	1	\N	\N	PLAYED	2024-06-15 20:49:27.821+02	2024-07-19 17:30:30.835+02	24	25	\N	https://es.wikipedia.org/wiki/Boulder_Dash	https://www.youtube.com/embed/XSpgwuMPkOE	\N
34	Mario Bros.	mario/mario_bros/cover.jpeg	mario/mario_bros/logo.png	mario/mario_bros/back.jpeg	1983-07-14	81	PAL-ES	150	1-2	\N	\N	NOT_PLAYED	2024-06-05 17:37:47.833+02	2024-07-18 16:12:28.459+02	14	20	#ee1c25	https://es.wikipedia.org/wiki/Mario_Bros.	https://www.youtube.com/embed/WFptXdODy7k	\N
35	Ant Attack	ant_attack/cover.jpeg	ant_attack/logo.jpeg	ant_attack/back.jpeg	1983-01-01	\N	GLOBAL	15	1	\N	\N	NOT_PLAYED	2024-06-07 11:43:42.255+02	2024-06-07 11:43:42.255+02	\N	\N	\N	https://en.wikipedia.org/wiki/Ant_Attack	https://www.youtube.com/embed/Va5SKaYL3r8	\N
36	Ah Diddums	ah_diddums/cover.jpeg	ah_diddums/logo.png	ah_diddums/back.jpeg	1983-01-01	\N	GLOBAL	3	1	\N	\N	NOT_PLAYED	2024-06-07 13:08:44.224+02	2024-06-07 13:08:44.224+02	\N	\N	\N	https://en.wikipedia.org/wiki/Ah_Diddums	https://www.youtube.com/embed/uX-jNPasffc	\N
37	The Hobbit	lord_of_the_rings/the_hobbit_82/cover.jpeg	lord_of_the_rings/the_hobbit_82/logo.jpeg	lord_of_the_rings/the_hobbit_82/back.jpeg	1982-11-01	\N	GLOBAL	20	1	\N	\N	NOT_PLAYED	2024-06-09 12:25:44.387+02	2024-06-09 12:27:14.191+02	20	21	\N	https://es.wikipedia.org/wiki/El_hobbit_(videojuego_de_1982)	https://www.youtube.com/embed/D9qrZC7WUio	\N
38	Arcadia	arcadia/cover.jpeg	arcadia/logo.jpeg	arcadia/back.jpeg	1983-01-01	\N	GLOBAL	10	1	\N	\N	NOT_PLAYED	2024-06-10 16:38:23.728+02	2024-06-10 16:38:23.728+02	\N	\N		https://en.wikipedia.org/wiki/Arcadia_(video_game)	https://www.youtube.com/embed/1JnKxByMo6Q	\N
39	Manic Miner	miner_willy/manic_miner/cover.jpeg	miner_willy/manic_miner/logo.jpeg	miner_willy/manic_miner/back.jpeg	1983-06-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-06-11 16:05:05.776+02	2024-06-11 16:05:55.866+02	21	22	\N	https://es.wikipedia.org/wiki/Manic_Miner	https://www.youtube.com/embed/BgUzteADsRI	\N
40	Jet Set Willy	miner_willy/jetset_willy/cover.jpg	miner_willy/jetset_willy/logo.png	miner_willy/jetset_willy/back.jpg	1984-01-01	\N	GLOBAL	20	1	\N	\N	NOT_PLAYED	2024-06-12 15:36:48.643+02	2024-06-12 15:39:06.122+02	21	22	\N	https://es.wikipedia.org/wiki/Jet_Set_Willy	https://www.youtube.com/embed/94Ywx6uVn9E	\N
41	Dragon's Lair	dragons_lair/dragons_lair/cover.jpeg	dragons_lair/dragons_lair/logo.png	dragons_lair/dragons_lair/back.jpeg	1983-06-19	\N	GLOBAL	15	1	\N	\N	PLAYED	2024-06-13 16:06:48.643+02	2024-06-13 16:10:11.669+02	22	23	\N	https://es.wikipedia.org/wiki/Dragon%27s_Lair	https://www.youtube.com/embed/hdumVFgwgP8	\N
42	Jetpac	jetman/jetpac/cover.jpeg	jetman/jetpac/logo.jpeg	jetman/jetpac/back.jpeg	1983-05-01	\N	GLOBAL	20	1	\N	\N	NOT_PLAYED	2024-06-15 12:21:31.981+02	2024-06-15 12:23:17.115+02	23	24	\N	https://es.wikipedia.org/wiki/Jetpac	https://www.youtube.com/embed/JF4n1NX1oOQ	\N
43	Tennis	tennis_84/cover.jpeg	tennis_84/logo.jpeg	tennis_84/back.jpeg	1984-01-14	\N	PAL-ES	95	1-2	Vs. Tennis	\N	NOT_PLAYED	2024-06-15 20:23:24.575+02	2024-06-15 20:23:45.63+02	\N	\N	\N	https://es.wikipedia.org/wiki/Tennis_(videojuego)	https://www.youtube.com/embed/gOEeaKEyW98	\N
50	Knight Lore	sabreman/knight-lore/cover.jpeg	sabreman/knight-lore/logo.jpeg	sabreman/knight-lore/back.jpeg	1984-11-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-06-22 13:04:01.088+02	2024-06-22 13:05:35.264+02	29	30	\N	https://es.wikipedia.org/wiki/Knight_Lore	https://www.youtube.com/embed/7n7qtErhF-A	\N
45	Daley Thompson's Decathlon	daley_thompson/decathlon/cover.jpg	daley_thompson/decathlon/logo.jpg	daley_thompson/decathlon/back.jpeg	1984-01-01	\N	GLOBAL	15	1	\N	\N	NOT_PLAYED	2024-06-19 21:31:39.282+02	2024-06-19 21:32:32.736+02	25	26	\N	https://en.wikipedia.org/wiki/Daley_Thompson%27s_Decathlon	https://www.youtube.com/embed/1fnmuiVrQ2U	\N
46	Beach-Head	beach-head/beach-head/cover.jpg	beach-head/beach-head/logo.jpg	beach-head/beach-head/back.jpeg	1983-01-01	\N	GLOBAL	20	1-2	\N	\N	NOT_PLAYED	2024-06-20 16:18:30.121+02	2024-06-20 16:19:53.396+02	26	27	\N	https://es.wikipedia.org/wiki/Beach-Head	https://www.youtube.com/embed/RyTq0lv7q3M	\N
47	The Lords of Midnight	the_lords_of_midnight/cover.jpeg	the_lords_of_midnight/logo.jpeg	the_lords_of_midnight/back.jpeg	1984-04-01	\N	GLOBAL	20	1	\N	\N	NOT_PLAYED	2024-06-20 16:43:24.047+02	2024-06-20 16:43:24.047+02	\N	\N	\N	https://es.wikipedia.org/wiki/The_Lords_of_Midnight	https://www.youtube.com/embed/n251r73JIxY	\N
33	Donkey Kong Jr.	donkey_kong/donkey_kong_jr/cover.jpeg	donkey_kong/donkey_kong_jr/logo.jpeg	donkey_kong/donkey_kong_jr/back.jpeg	1982-06-30	\N	PAL-EUR	150	1 (2 alternando)	\N	\N	NOT_PLAYED	2024-06-04 17:00:43.618+02	2024-07-19 16:06:14.91+02	13	14	#663605	https://es.wikipedia.org/wiki/Donkey_Kong_Jr.	https://www.youtube.com/embed/2vL5aw6v8QI	\N
49	Ghostbusters	ghostbusters/ghostbusters_84/cover.jpeg	ghostbusters/ghostbusters_84/logo.png	ghostbusters/ghostbusters_84/back.jpg	1984-10-26	\N	GLOBAL	15	1	\N	\N	NOT_PLAYED	2024-06-21 13:31:45.365+02	2024-06-21 13:33:00.187+02	28	29		https://en.wikipedia.org/wiki/Ghostbusters_(1984_video_game)	https://www.youtube.com/embed/ElJNQxgKZPw	\N
51	Duck Hunt	duck-hunt/cover.png	duck-hunt/logo.png	duck-hunt/back.jpeg	1984-04-21	\N	PAL-ES	95	1-2	Vs. Duck Hunt	\N	PLAYED	2024-06-22 15:53:35.659+02	2024-06-22 15:53:35.659+02	\N	\N	\N	https://es.wikipedia.org/wiki/Duck_Hunt	https://www.youtube.com/embed/J3sfsP9W048	\N
52	Tetris	tetris/tetris/cover.jpeg	tetris/tetris/logo.png	tetris/tetris/back.jpeg	1984-06-06	90	PAL-ES/IT	60	1 (2 alternando)	\N	\N	PLAYED	2024-06-22 16:34:37.882+02	2024-07-19 15:46:37.667+02	30	31		https://es.wikipedia.org/wiki/Tetris	https://www.youtube.com/embed/BQwohHgrk2s	\N
53	Dropzone	dropzone/dropzone/cover.jpg	dropzone/dropzone/logo.jpg	dropzone/dropzone/back.jpeg	1984-01-01	\N	GLOBAL	100	1	\N	\N	NOT_PLAYED	2024-06-23 11:01:59.995+02	2024-06-23 11:03:13.583+02	31	32	\N	https://en.wikipedia.org/wiki/Dropzone	https://www.youtube.com/embed/6Z3kppgXqR8	\N
54	Track & Field	track_and_field/track_and_field/cover.jpeg	track_and_field/track_and_field/logo.png	track_and_field/track_and_field/back.jpeg	1983-09-01	\N	GLOBAL	400	1-4	Hyper Olympic (Japón)	\N	NOT_PLAYED	2024-06-23 11:45:08.282+02	2024-06-23 11:46:38.361+02	32	33	\N	https://es.wikipedia.org/wiki/Track_%26_Field	https://www.youtube.com/embed/ozcE8qzTdHo	\N
55	Hyper Sports	track_and_field/hyper_sports/cover.jpeg	track_and_field/hyper_sports/logo.png	track_and_field/hyper_sports/back.jpeg	1984-05-12	\N	GLOBAL	15	1-4	Hyper Olympic '84 (Japón)	\N	NOT_PLAYED	2024-06-23 11:54:27.234+02	2024-06-23 11:55:27.64+02	32	33	\N	https://es.wikipedia.org/wiki/Hyper_Sports	https://www.youtube.com/embed/R5XaB0uCL3w	\N
48	Elite	elite/elite/cover.jpeg	elite/elite/logo.jpeg	elite/elite/back.jpeg	1984-09-20	82	GLOBAL	60	1	\N	\N	NOT_PLAYED	2024-06-21 11:37:25.882+02	2024-07-18 15:58:15.594+02	27	28	\N	https://es.wikipedia.org/wiki/Elite_(videojuego)	https://www.youtube.com/embed/LhTTpV5qFrs	\N
57	Theatre Europe	pss_wargamers_series/theatre_europe/cover.jpg	pss_wargamers_series/theatre_europe/logo.jpeg	pss_wargamers_series/theatre_europe/back.jpg	1985-11-01	\N	GLOBAL	15	1	\N	\N	NOT_PLAYED	2024-06-24 11:56:26.34+02	2024-06-24 11:57:43.239+02	34	35	\N	https://en.wikipedia.org/wiki/Theatre_Europe	https://www.youtube.com/embed/xQaDP8EUk9o	\N
58	Gremlins	gremlins/gremlins_84/cover.jpg	gremlins/gremlins_84/logo.png	gremlins/gremlins_84/back.jpg	1984-06-08	\N	GLOBAL	200	1-2	\N	\N	NOT_PLAYED	2024-06-24 12:35:20.106+02	2024-06-24 12:36:05.277+02	35	36	\N	https://en.wikipedia.org/wiki/Gremlins_(video_game)	https://www.youtube.com/embed/aB2zpI7Wd1M	\N
59	Spy vs. Spy	spy_vs_spy/spy_vs_spy_84/cover.jpeg	spy_vs_spy/spy_vs_spy_84/logo.png	spy_vs_spy/spy_vs_spy_84/back.jpeg	1984-01-01	\N	GLOBAL	40	1-2	\N	\N	NOT_PLAYED	2024-06-24 13:48:54.184+02	2024-06-24 13:50:53.062+02	36	37	\N	https://es.wikipedia.org/wiki/Spy_vs._Spy_(videojuego_de_1984)	https://www.youtube.com/embed/cEtDDoHNFuk	\N
60	Little Computer People	little_computer_people/cover.jpeg	little_computer_people/logo.jpeg	little_computer_people/back.jpeg	1985-09-27	\N	GLOBAL	200	1	\N	\N	NOT_PLAYED	2024-06-25 16:52:53.431+02	2024-06-25 16:52:53.431+02	\N	\N	\N	https://es.wikipedia.org/wiki/Little_Computer_People	https://www.youtube.com/embed/SkTgX1mGmDg	\N
61	Summer Games II	epyx_sports_games/summer_games_ii/cover.jpeg	epyx_sports_games/summer_games_ii/logo.jpeg	epyx_sports_games/summer_games_ii/back.jpeg	1985-06-01	\N	GLOBAL	40	1-2	\N	\N	NOT_PLAYED	2024-06-26 15:55:37.159+02	2024-06-26 15:57:19.182+02	37	38	\N	https://en.wikipedia.org/wiki/Summer_Games_II	https://www.youtube.com/embed/x3g2Zm2bMbs	\N
62	The Way of the Exploding Fist	the_way_of_the_exploding_fist/cover.png	the_way_of_the_exploding_fist/logo.png	the_way_of_the_exploding_fist/back.jpeg	1985-06-01	\N	GLOBAL	20	1-2		\N	NOT_PLAYED	2024-06-26 16:11:37.081+02	2024-06-26 16:11:37.081+02	\N	\N	\N	https://en.wikipedia.org/wiki/The_Way_of_the_Exploding_Fist	https://www.youtube.com/embed/PA5b8Zhdb7c	\N
64	Gradius	gradius/gradius/cover.jpg	gradius/gradius/logo.png	gradius/gradius/back.jpg	1985-02-02	89	PAL-EUR	80	1-2	Nemesis (usa)	\N	NOT_PLAYED	2024-06-28 09:35:55.362+02	2024-07-18 16:11:01.909+02	39	40	\N	https://es.wikipedia.org/wiki/Gradius_(videojuego)	https://www.youtube.com/embed/Wmpi64_RpnE	\N
63	Gauntlet	gauntlet/gauntlet/cover.jpeg	gauntlet/gauntlet/logo.jpeg	gauntlet/gauntlet/back.jpg	1985-10-15	87	GLOBAL	20	1-4	\N	\N	NOT_PLAYED	2024-06-27 15:25:39.266+02	2024-07-18 16:09:20.996+02	38	39	\N	https://es.wikipedia.org/wiki/Gauntlet_(videojuego)	https://www.youtube.com/embed/fLnkCAFihqA	\N
56	Commando	wolf_of_the_battlefield/commando/cover.png	wolf_of_the_battlefield/commando/logo.jpeg	wolf_of_the_battlefield/commando/back.jpeg	1985-04-02	\N	GLOBAL	30	1	Wolf of the Battlefield (Japón)	\N	NOT_PLAYED	2024-06-23 12:36:20.932+02	2024-07-18 16:14:25.893+02	33	34	\N	https://es.wikipedia.org/wiki/Commando_(videojuego)	https://www.youtube.com/embed/xmlM1KS7txE	\N
65	Battlezone	battlezone/battlezone/cover.jpg	battlezone/battlezone/logo.png	battlezone/battlezone/back.jpg	1980-11-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-07-03 16:16:56.113+02	2024-07-03 16:17:42.428+02	40	41	\N	https://es.wikipedia.org/wiki/Battlezone	https://www.youtube.com/embed/9X4_xy7rC1A	\N
66	Crazy Climber	crazy_climber/crazy_climber/cover.jpg	crazy_climber/crazy_climber/logo.jpeg	crazy_climber/crazy_climber/back.jpg	1980-10-01	\N	GLOBAL	300	1-2	\N	\N	NOT_PLAYED	2024-07-03 16:38:27.56+02	2024-07-03 16:39:07.14+02	41	42	\N	https://es.wikipedia.org/wiki/Crazy_Climber	https://www.youtube.com/embed/QJAEmOtLZHg	\N
67	Adventure	adventure/cover.png	adventure/logo.jpeg	adventure/back.jpg	1980-04-01	\N	GLOBAL	80	1	\N	\N	NOT_PLAYED	2024-07-03 16:56:34.059+02	2024-07-03 16:56:34.059+02	\N	\N	\N	https://es.wikipedia.org/wiki/Adventure_(Atari_2600)	https://www.youtube.com/embed/I6-zN_eaRd8	\N
68	Computer Space	computer_space/cover.jpg	computer_space/logo.jpg	computer_space/back.jpeg	1971-11-01	\N	\N	\N	1-2	\N	\N	NOT_PLAYED	2024-07-03 19:48:44.917+02	2024-07-03 19:48:44.917+02	\N	\N	\N	https://es.wikipedia.org/wiki/Computer_Space	https://www.youtube.com/embed/b3BQsCCwo8w	\N
69	Tank	tank/tank/cover.jpeg	tank/tank/logo.jpg	tank/tank/back.jpeg	1974-11-01	\N	\N	\N	1-2	\N	\N	COMPLETED	2024-07-03 20:20:07.536+02	2024-07-03 20:21:14.097+02	42	43	\N	https://en.wikipedia.org/wiki/Tank_(video_game)	https://www.youtube.com/embed/3OsBUzYBJgU	\N
70	Gran Trak 10	gran_trak_10/cover.jpg	gran_trak_10/logo.jpg	gran_trak_10/back.jpg	1974-05-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-07-03 20:43:05.99+02	2024-07-03 20:43:05.99+02	\N	\N	\N	https://es.wikipedia.org/wiki/Gran_Trak_10	https://www.youtube.com/embed/KYcNvAAeu6k	\N
71	Night Driver	night_driver/cover.png	night_driver/logo.png	night_driver/back.jpeg	1976-10-01	\N	GLOBAL	20	1	\N	\N	NOT_PLAYED	2024-07-04 15:48:11.429+02	2024-07-04 15:48:11.429+02	\N	\N	\N	https://es.wikipedia.org/wiki/Night_Driver_(videojuego)	https://www.youtube.com/embed/Wk-7BR9Dl9c	\N
72	Sea Wolf	sea_wolf/cover.jpg	sea_wolf/logo.jpg	sea_wolf/back.jpeg	1976-04-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-07-04 16:02:07.365+02	2024-07-04 16:02:07.365+02	\N	\N	\N	https://en.wikipedia.org/wiki/Sea_Wolf_(video_game)	https://www.youtube.com/embed/T6kopmm1-Jw	\N
73	Combat	combat/cover.jpg	combat/logo.jpg	combat/back.jpeg	1977-09-11	\N	GLOBAL	20	1-2	\N	\N	COMPLETED	2024-07-04 16:16:07.157+02	2024-07-04 16:16:07.157+02	\N	\N	\N	https://es.wikipedia.org/wiki/Combat_(videojuego)	https://www.youtube.com/embed/3m86ftny1uY	\N
74	Head On	head_on/cover.jpg	head_on/logo.jpeg	head_on/back.jpg	1979-04-01	\N	\N	\N	1-2	\N	\N	NOT_PLAYED	2024-07-04 16:29:48.326+02	2024-07-04 16:29:48.326+02	\N	\N	\N	https://es.wikipedia.org/wiki/Head_On_(videojuego)	https://www.youtube.com/embed/nBrHAzV98Vg	\N
76	Wizardry: Proving Grounds of the Mad Overlord	wizardry/wizardry/cover.jpg	wizardry/wizardry/logo.png	wizardry/wizardry/back.jpg	1981-09-01	\N	GLOBAL	80	1	\N	\N	NOT_PLAYED	2024-07-05 08:52:58.881+02	2024-07-05 08:54:37.931+02	44	45	\N	https://en.wikipedia.org/wiki/Wizardry:_Proving_Grounds_of_the_Mad_Overlord	https://www.youtube.com/embed/wKn0AdQ_2jw	\N
77	Tempest	tempest/tempest/cover.jpg	tempest/tempest/logo.jpeg	tempest/tempest/back.jpg	1981-10-01	\N	GLOBAL	15	1-2	\N	\N	NOT_PLAYED	2024-07-05 09:09:36.329+02	2024-07-05 09:10:40.771+02	45	46	\N	https://es.wikipedia.org/wiki/Tempest_(videojuego)	https://www.youtube.com/embed/jfaCrdBABUY	\N
78	Utopia	utopia/cover.jpg	utopia/logo.jpg	utopia/back.jpg	1982-06-03	\N	GLOBAL	15	2	\N	\N	NOT_PLAYED	2024-07-05 10:25:45.423+02	2024-07-05 10:26:21.602+02	\N	\N	\N	https://en.wikipedia.org/wiki/Utopia_(video_game)	https://www.youtube.com/embed/XjpoBR23IWs	\N
79	Superman	superman/superman_79/cover.jpg	superman/superman_79/logo.jpg	superman/superman_79/back.jpg	1979-09-01	\N	GLOBAL	70	1	\N	\N	NOT_PLAYED	2024-07-05 11:17:53.9+02	2024-07-05 11:20:10.57+02	46	47	\N	https://es.wikipedia.org/wiki/Superman_(Atari_2600)	https://www.youtube.com/embed/r7U2TFIayos	\N
2	Sonic the Hedgehog	sonic/sonic_the_hedgehog/cover.jpeg	sonic/sonic_the_hedgehog/logo.png	sonic/sonic_the_hedgehog/back.jpg	1991-07-26	95	PAL-EUR	15	1		t	COMPLETED	2024-01-15 17:09:43.807+01	2024-07-18 16:07:28.124+02	1	1	#17569b	https://es.wikipedia.org/wiki/Sonic_the_Hedgehog_(videojuego_de_1991)	https://www.youtube.com/embed/LMasV2b6OVA	\N
75	Missile Command	missile_command/missile_command/cover.jpg	missile_command/missile_command/logo.png	missile_command/missile_command/back.jpg	1980-07-01	\N	GLOBAL	20	1 (2 alternando)	\N	\N	NOT_PLAYED	2024-07-04 16:51:36.467+02	2024-07-19 16:14:04.103+02	43	44	\N	https://es.wikipedia.org/wiki/Missile_Command	https://www.youtube.com/embed/nokIGklnBGY	\N
80	Star Wars: The Empire Strikes Back	star_wars/the_empire_strikes_back/cover.jpeg	star_wars/the_empire_strikes_back/logo.png	star_wars/the_empire_strikes_back/back.jpg	1982-06-01	\N	GLOBAL	50	1-2	\N	\N	NOT_PLAYED	2024-07-05 13:14:51.617+02	2024-07-05 13:16:58.919+02	47	48		https://es.wikipedia.org/wiki/Star_Wars:_The_Empire_Strikes_Back_(videojuego_de_1982)	https://www.youtube.com/embed/NcWGvwYWHgY	\N
81	Star Raiders	star_raiders/star_raiders/cover.png	star_raiders/star_raiders/logo.jpeg	star_raiders/star_raiders/back.jpg	1980-03-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-07-06 10:52:10.784+02	2024-07-06 10:54:06.005+02	48	49	\N	https://en.wikipedia.org/wiki/Star_Raiders	https://www.youtube.com/embed/L8YdO6PYViw	\N
82	Basketball	basketball_78/cover.jpg	basketball_78/logo.jpg	basketball_78/back.jpg	1978-09-01	\N	GLOBAL	15	1-2	\N	\N	COMPLETED	2024-07-06 11:09:34.966+02	2024-07-06 11:09:34.966+02	\N	\N		https://en.wikipedia.org/wiki/Basketball_(1978_video_game)	https://www.youtube.com/embed/44Qhd52yT3A	\N
83	Quest for the Rings	the_quest_for_the_rings/cover.jpeg	the_quest_for_the_rings/logo.jpg	the_quest_for_the_rings/back.jpeg	1981-01-01	\N	GLOBAL	50	1	\N	\N	NOT_PLAYED	2024-07-06 11:52:54.283+02	2024-07-06 11:52:54.283+02	\N	\N	\N	https://en.wikipedia.org/wiki/Quest_for_the_Rings	https://www.youtube.com/embed/JUPoXqqWAeM	\N
84	Dig Dug	dig_dug/dig_dug/cover.jpg	dig_dug/dig_dug/logo.jpeg	dig_dug/dig_dug/back.jpg	1982-04-19	\N	GLOBAL	25	1-2	\N	\N	NOT_PLAYED	2024-07-06 12:14:12.175+02	2024-07-06 12:16:49.556+02	49	50	\N	https://es.wikipedia.org/wiki/Dig_Dug	https://www.youtube.com/embed/zOuLiKwHciw	\N
85	Pole Position	pole_position/pole_position/cover.png	pole_position/pole_position/logo.jpeg	pole_position/pole_position/back.jpg	1982-07-30	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-07-06 12:34:29.353+02	2024-07-06 12:35:52.531+02	50	51	\N	https://es.wikipedia.org/wiki/Pole_Position_(videojuego)	https://www.youtube.com/embed/FFs1Xc82Q0U	\N
86	Mr. Do!	mr_do/mr_do!/cover.jpg	mr_do/mr_do!/logo.jpeg	mr_do/mr_do!/back.jpg	1982-09-01	\N	GLOBAL	80	1	\N	\N	NOT_PLAYED	2024-07-06 12:59:07.673+02	2024-07-06 13:00:31.114+02	51	52	\N	https://en.wikipedia.org/wiki/Mr._Do!	https://www.youtube.com/embed/5_BBQWed8Vk	\N
93	Spy Hunter	spy_hunter/spy_hunter/cover.png	spy_hunter/spy_hunter/logo.jpeg	spy_hunter/spy_hunter/back.jpg	1983-11-01	\N	GLOBAL	60	1	\N	\N	NOT_PLAYED	2024-07-06 20:12:54.818+02	2024-07-06 20:13:56.6+02	55	56	\N	https://en.wikipedia.org/wiki/Spy_Hunter	https://www.youtube.com/embed/93ds1VldZGI	\N
87	Zaxxon	zaxxon/zaxxon/cover.jpg	zaxxon/zaxxon/logo.png	zaxxon/zaxxon/back.jpg	1982-01-01	\N	GLOBAL	40	1-2	\N	\N	NOT_PLAYED	2024-07-06 13:15:26.463+02	2024-07-06 13:17:00.846+02	52	53	\N	https://es.wikipedia.org/wiki/Zaxxon	https://www.youtube.com/embed/Ta0xVtQ_fnk	\N
88	Time Pilot	time_pilot/time_pilot/cover.png	time_pilot/time_pilot/logo.png	time_pilot/time_pilot/back.jpg	1982-11-01	\N	GLOBAL	150	1-2	\N	\N	NOT_PLAYED	2024-07-06 13:34:34.279+02	2024-07-06 13:35:45.992+02	53	54	\N	https://es.wikipedia.org/wiki/Time_Pilot	https://www.youtube.com/embed/aixIzoIdCVM	\N
89	Pole Position II	pole_position/pole_position_ii/cover.jpg	pole_position/pole_position_ii/logo.png	pole_position/pole_position_ii/back.jpg	1983-06-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-07-06 19:02:03.361+02	2024-07-06 19:03:15.212+02	50	51	\N	https://es.wikipedia.org/wiki/Pole_Position_II	https://www.youtube.com/embed/x0T4OUoCqw4	\N
90	Astron Belt	astron_belt/cover.jpg	astron_belt/logo.jpg	astron_belt/back.jpeg	1983-03-16	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-07-06 19:15:32.098+02	2024-07-06 19:15:32.098+02	\N	\N	\N	https://en.wikipedia.org/wiki/Astron_Belt	https://www.youtube.com/embed/roCbZXqBDaE	\N
102	Donkey Kong 3	donkey_kong/donkey_kong_3/cover.jpg	donkey_kong/donkey_kong_3/logo.jpeg	donkey_kong/donkey_kong_3/back.jpeg	1983-10-01	\N	PAL-EUR	180	1 (2 alternando)	\N	\N	NOT_PLAYED	2024-07-08 15:22:02.486+02	2024-07-19 16:06:39.61+02	13	14	#663605	https://es.wikipedia.org/wiki/Donkey_Kong_3	https://www.youtube.com/embed/oN5EGEfVXe4	\N
94	Scramble	scramble/cover.jpg	scramble/logo.png	scramble/back.jpeg	1981-03-01	\N	GLOBAL	40	1-2	\N	\N	NOT_PLAYED	2024-07-07 11:20:26.092+02	2024-07-07 11:20:26.092+02	\N	\N	\N	https://es.wikipedia.org/wiki/Scramble	https://www.youtube.com/embed/3Vc-RIkpk40	\N
95	Xevious	xevious/xevious/cover.jpg	xevious/xevious/logo.png	xevious/xevious/back.jpg	1983-01-01	\N	PAL-EUR	40	1-2	\N	\N	NOT_PLAYED	2024-07-07 11:33:35.244+02	2024-07-07 11:35:03.7+02	56	57	\N	https://es.wikipedia.org/wiki/Xevious	https://www.youtube.com/embed/W0uoQTMnzs4	\N
96	Star Wars	star_wars/star_wars_83/cover.png	star_wars/star_wars_83/logo.png	star_wars/star_wars_83/back.jpeg	1983-05-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-07-07 12:00:04.211+02	2024-07-07 12:01:00.11+02	47	58	\N	https://es.wikipedia.org/wiki/Star_Wars_(videojuego_de_1983)	https://www.youtube.com/embed/nJv94FPRddA	\N
97	Punch-Out!!	punch_out/punch_out_84/cover.jpeg	punch_out/punch_out_84/logo.jpg	punch_out/punch_out_84/back.jpeg	1984-02-17	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-07-07 12:35:01.859+02	2024-07-07 12:35:49.97+02	57	59	\N	https://es.wikipedia.org/wiki/Punch-Out!!_(arcade)	https://www.youtube.com/embed/XeQip05mDRc	\N
98	Archon: The Light and the Dark	archon/archon_the_light_and_dark/cover.jpeg	archon/archon_the_light_and_dark/logo.png	archon/archon_the_light_and_dark/back.jpeg	1983-01-01	\N	GLOBAL	40	1-2	\N	\N	NOT_PLAYED	2024-07-07 13:01:35.25+02	2024-07-07 13:02:56.414+02	58	60	\N	https://es.wikipedia.org/wiki/Archon:_The_Light_and_the_Dark	https://www.youtube.com/embed/VD6mRUMU0S4	\N
99	M.U.L.E.	mule/cover.jpg	mule/logo.jpeg	mule/back.jpg	1983-01-01	\N	GLOBAL	150	1-4	\N	\N	NOT_PLAYED	2024-07-07 13:19:58.165+02	2024-07-07 13:19:58.165+02	\N	\N	\N	https://es.wikipedia.org/wiki/M.U.L.E.	https://www.youtube.com/embed/Cs3G6dxx2FQ	\N
100	Bomberman	bomberman/bomberman/cover.jpeg	bomberman/bomberman/logo.jpeg	bomberman/bomberman/back.jpeg	1983-07-01	\N	NTSC	120	1	Eric and the Floaters (MSX - EU)	\N	NOT_PLAYED	2024-07-07 19:15:26.676+02	2024-07-07 19:16:54.46+02	59	61	\N	https://es.wikipedia.org/wiki/Bomberman_(videojuego)	https://www.youtube.com/embed/mjizZJZtJuI	\N
101	Castle Wolfenstein	wolfenstein/castle wolfenstein/cover.jpeg	wolfenstein/castle wolfenstein/logo.jpeg	wolfenstein/castle wolfenstein/back.jpg	1981-09-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-07-07 19:51:48.29+02	2024-07-07 19:52:49.721+02	60	62	\N	https://es.wikipedia.org/wiki/Castle_Wolfenstein	https://www.youtube.com/embed/SV5VzYHEC0c	\N
92	Elevator Action	elevator_action/elevator_action/cover.jpg	elevator_action/elevator_action/logo.jpeg	elevator_action/elevator_action/back.jpg	1983-05-23	\N	NTSC	60	1 (2 alternando)	\N	\N	NOT_PLAYED	2024-07-06 19:58:09.592+02	2024-07-19 16:07:14.481+02	54	55		https://es.wikipedia.org/wiki/Elevator_Action	https://www.youtube.com/embed/LM5reigEnv4	\N
104	David's Midnight Magic	David_Midnight_Magic/cover.png	David_Midnight_Magic/logo.png	David_Midnight_Magic/back.jpg	1982-01-01	\N	GLOBAL	25	1-4	\N	\N	NOT_PLAYED	2024-07-08 16:05:41.587+02	2024-07-08 16:05:41.587+02	\N	\N	\N	https://en.wikipedia.org/wiki/David%27s_Midnight_Magic	https://www.youtube.com/embed/rgFO3hbmqY0	\N
103	Donkey Kong Jr. Math	donkey_kong/donkey_kong_jr_math/cover.jpeg	donkey_kong/donkey_kong_jr_math/logo.png	donkey_kong/donkey_kong_jr_math/back.jpeg	1983-12-12	32	PAL-ES	120	1-2	\N	\N	NOT_PLAYED	2024-07-08 15:42:26.347+02	2024-07-08 15:44:45.01+02	13	63	#663605	https://es.wikipedia.org/wiki/Donkey_Kong_Jr._Math	https://www.youtube.com/embed/GXGGe0wkZcI	\N
105	Demon Attack	demon_attack/cover.jpg	demon_attack/logo.jpeg	demon_attack/back.jpeg	1982-04-01	\N	GLOBAL	25	1-2	\N	\N	NOT_PLAYED	2024-07-08 16:17:42.386+02	2024-07-08 16:17:42.386+02	\N	\N	\N	https://es.wikipedia.org/wiki/Demon_Attack	https://www.youtube.com/embed/5GwoSr12kxY	\N
106	Tron	tron/tron_82/cover.jpeg	tron/tron_82/logo.jpg	tron/tron_82/back.jpeg	1982-05-01	\N	\N	\N	1-2	\N	\N	NOT_PLAYED	2024-07-08 16:29:28.511+02	2024-07-08 16:30:38.124+02	61	64	\N	https://en.wikipedia.org/wiki/Tron_(video_game)	https://www.youtube.com/embed/GmPbeHCkAmc	\N
107	Lode Runner	lode_runner/lode_runner/cover.jpeg	lode_runner/lode_runner/logo.png	lode_runner/lode_runner/back.jpeg	1983-06-23	\N	NTSC	50	1	\N	\N	NOT_PLAYED	2024-07-08 16:50:45.968+02	2024-07-08 16:51:59.105+02	62	65	\N	https://es.wikipedia.org/wiki/Lode_Runner#Arcade	https://www.youtube.com/embed/P4exGV-XUbQ	\N
120	Ballon Fight	ballon_fight/ballon_fight/cover.jpeg	ballon_fight/ballon_fight/logo.png	ballon_fight/ballon_fight/back.jpeg	1984-11-01	\N	PAL-ES	120	1-2	\N	\N	NOT_PLAYED	2024-07-10 21:27:42.443+02	2024-07-10 21:29:29.283+02	66	70	\N	https://es.wikipedia.org/wiki/Balloon_Fight	https://www.youtube.com/embed/i9cp4tlrGYY	\N
108	1942	19xx/1942/cover.jpg	19xx/1942/logo.png	19xx/1942/back.jpg	1984-11-30	\N	NTSC	60	1	\N	\N	NOT_PLAYED	2024-07-09 15:40:53.992+02	2024-07-09 15:43:08.912+02	63	66	\N	https://es.wikipedia.org/wiki/1942_(videojuego)	https://www.youtube.com/embed/Em7UwOOBvlA	\N
109	Cobra Command	cobra_command_84/cover.jpg	cobra_command_84/logo.jpg	cobra_command_84/back.jpeg	1984-02-01	\N	\N	\N	1	Thunder Storm (jp)	\N	NOT_PLAYED	2024-07-09 16:08:35.439+02	2024-07-09 16:08:35.439+02	\N	\N	\N	https://es.wikipedia.org/wiki/Cobra_Command_(videojuego_de_1984)	https://www.youtube.com/embed/Q7E7HGL0TWY	\N
110	Karate Champ	karate_champ/cover.png	karate_champ/logo.png	karate_champ/back.jpeg	1984-05-01	\N	NTSC	28	1-2	\N	\N	NOT_PLAYED	2024-07-09 16:24:21.399+02	2024-07-09 16:24:21.399+02	\N	\N	\N	https://es.wikipedia.org/wiki/Karate_Champ	https://www.youtube.com/embed/gwV3xqS9_aQ	\N
112	Yie Ar Kung-Fu	yie_ar_kung-fu/yie-ar_kung-fu/cover.jpg	yie_ar_kung-fu/yie-ar_kung-fu/logo.jpeg	yie_ar_kung-fu/yie-ar_kung-fu/back.jpeg	1984-10-25	\N	GLOBAL	15	1 (2 alternando)	\N	\N	NOT_PLAYED	2024-07-09 17:04:10.611+02	2024-07-19 16:11:40.043+02	64	67	\N	https://es.wikipedia.org/wiki/Yie_Ar_Kung-Fu	https://www.youtube.com/embed/4MQqwW1dJSk	\N
116	Pac-Land	pacman/pacland/cover.png	pacman/pacland/logo.jpeg	pacman/pacland/back.jpg	1984-08-01	\N	NTSC	20	1 (2 alternando)	\N	\N	NOT_PLAYED	2024-07-10 16:18:00.945+02	2024-07-19 16:13:09.126+02	8	68	#ed6b0e	https://es.wikipedia.org/wiki/Pac-Land	https://www.youtube.com/embed/yvHPE20pPPo	\N
113	Lady Bug	lady_bug/cover.jpg	lady_bug/logo.jpeg	lady_bug/back.jpg	1981-10-01	\N	GLOBAL	20	1-2	\N	\N	NOT_PLAYED	2024-07-10 15:30:48.688+02	2024-07-10 15:30:48.688+02	\N	\N	\N	https://en.wikipedia.org/wiki/Lady_Bug_(video_game)	https://www.youtube.com/embed/_K7BHmrEsSk	\N
114	Miner 2049er	miner_2049er/cover.jpeg	miner_2049er/logo.jpeg	miner_2049er/back.jpg	1982-12-01	\N	GLOBAL	60	1	\N	\N	NOT_PLAYED	2024-07-10 15:51:38.719+02	2024-07-10 15:51:38.719+02	\N	\N	\N	https://en.wikipedia.org/wiki/Miner_2049er	https://www.youtube.com/embed/UWszRjD_pY8	\N
115	Gaplus	galaxian/gaplus/cover.jpeg	galaxian/gaplus/logo.jpeg	galaxian/gaplus/back.jpg	1984-01-08	\N	\N	\N	1 (2 alternando)	Galaga 3 (USA)	\N	NOT_PLAYED	2024-07-10 16:00:36.583+02	2024-07-19 17:33:53.926+02	6	7	\N	https://es.wikipedia.org/wiki/Gaplus	https://www.youtube.com/embed/2SWqdUfv7J4	\N
117	Marble Madness	marble_madness/marble_madness/cover.jpg	marble_madness/marble_madness/logo.jpeg	marble_madness/marble_madness/back.jpeg	1984-12-15	\N	PAL-EUR	60	1-2	\N	\N	NOT_PLAYED	2024-07-10 16:46:37.74+02	2024-07-10 16:47:48.817+02	65	69	\N	https://es.wikipedia.org/wiki/Marble_Madness	https://www.youtube.com/embed/XzlA1JTPMto	\N
118	Sabre Wulf	sabreman/sabre_wulf/cover.jpg	sabreman/sabre_wulf/logo.png	sabreman/sabre_wulf/back.jpeg	1984-01-01	\N	GLOBAL	20	1	\N	\N	NOT_PLAYED	2024-07-10 20:50:11.566+02	2024-07-10 20:50:47.113+02	29	30	\N	https://es.wikipedia.org/wiki/Sabre_Wulf	https://www.youtube.com/embed/cJ_0KixP1ds	\N
119	Ice Climber	ice_climber/cover.jpg	ice_climber/logo.png	ice_climber/back.jpeg	1985-01-30	\N	PAL-ES	60	1-2	\N	\N	NOT_PLAYED	2024-07-10 21:08:58.342+02	2024-07-10 21:08:58.342+02	\N	\N	\N	https://es.wikipedia.org/wiki/Ice_Climber	https://www.youtube.com/embed/3YGJLbasFDg	\N
121	Pitfall II: Lost Caverns	pitfall/pitfall_ii/cover.png	pitfall/pitfall_ii/logo.png	pitfall/pitfall_ii/back.jpg	1984-02-17	\N	GLOBAL	80	1	\N	\N	NOT_PLAYED	2024-07-11 15:29:58.515+02	2024-07-11 15:31:08.309+02	17	17	\N	https://en.wikipedia.org/wiki/Pitfall_II:_Lost_Caverns	https://www.youtube.com/embed/ZZIMaJnzPzw	\N
123	One on One: Dr. J vs. Larry Bird	one_on_one_basketball/cover.jpg	one_on_one_basketball/logo.jpg	one_on_one_basketball/back.jpg	1984-01-01	\N	GLOBAL	15	1-2	\N	\N	NOT_PLAYED	2024-07-11 15:53:40.838+02	2024-07-11 15:53:40.838+02	\N	\N	\N	https://en.wikipedia.org/wiki/One_on_One:_Dr._J_vs._Larry_Bird	https://www.youtube.com/embed/URobcuTcBFU	\N
124	Ghosts 'n Goblins	ghosts_n_goblins/ghosts_n_goblins/cover.jpeg	ghosts_n_goblins/ghosts_n_goblins/logo.jpeg	ghosts_n_goblins/ghosts_n_goblins/back.jpeg	1985-09-19	\N	PAL-EUR	140	1	Makaimura (Demon World Village) (jp)	\N	PLAYED	2024-07-11 16:30:33.147+02	2024-07-11 16:31:54.721+02	67	71	\N	https://es.wikipedia.org/wiki/Ghosts_%27n_Goblins	https://www.youtube.com/embed/SugLAqaPhqA	\N
111	Kung-Fu Master	kung-fu_master/cover.jpg	kung-fu_master/logo.jpeg	kung-fu_master/back.jpg	1984-12-01	85	GLOBAL	50	1 (2 alternando)	Spartan X (jp)	\N	NOT_PLAYED	2024-07-09 16:47:52.849+02	2024-07-19 16:10:13.078+02	\N	\N	\N	https://es.wikipedia.org/wiki/Kung-Fu_Master_(videojuego)	https://www.youtube.com/embed/EgO4HtWIJjQ	\N
153	R-Type	r-type/r-type/cover.jpeg	r-type/r-type/logo.jpg	r-type/r-type/back.jpeg	1987-07-01	89	PAL-EUR	45	1	\N	\N	NOT_PLAYED	2024-07-28 11:42:15.295+02	2024-08-28 16:48:17.65+02	91	97	\N	https://es.wikipedia.org/wiki/R-Type	https://www.youtube.com/embed/pVWtI0426mU	\N
129	Paperboy	paperboy/paperboy/cover.jpeg	paperboy/paperboy/logo.jpeg	paperboy/paperboy/back.jpeg	1985-02-01	83	PAL-EUR	60	1	\N	\N	NOT_PLAYED	2024-07-16 16:57:02.862+02	2024-07-18 16:03:30.529+02	71	76	\N	https://es.wikipedia.org/wiki/Paperboy_(videojuego)	https://www.youtube.com/embed/l6DEL9GY-VU	\N
126	Space Harrier	space_harrier/space_harrier/cover.png	space_harrier/space_harrier/logo.jpeg	space_harrier/space_harrier/back.jpg	1985-10-02	82	PAL-EUR	25	1	\N	\N	NOT_PLAYED	2024-07-12 13:40:18.479+02	2024-07-18 16:25:34.928+02	69	73	\N	https://es.wikipedia.org/wiki/Space_Harrier	https://www.youtube.com/embed/Hzgrb-mjLaM	\N
127	Excitebike	excitebike/excitebike/cover.jpeg	excitebike/excitebike/logo.png	excitebike/excitebike/back.jpeg	1984-11-28	82	PAL-ES	60	1-2	\N	\N	NOT_PLAYED	2024-07-15 12:31:47.657+02	2024-07-18 16:11:49.153+02	70	75	\N	https://es.wikipedia.org/wiki/Excitebike	https://www.youtube.com/embed/pkAtNjRSZds	\N
130	Ultima IV: Quest of the Avatar	ultima/ultima_iv/cover.jpeg	ultima/ultima_iv/logo.jpeg	ultima/ultima_iv/back.jpeg	1985-09-16	\N	GLOBAL	90	1	\N	\N	NOT_PLAYED	2024-07-16 22:57:34.835+02	2024-09-22 10:57:28.175+02	10	11	\N	https://es.wikipedia.org/wiki/Ultima_IV:_Quest_of_the_Avatar	https://www.youtube.com/embed/bHfAE5tXHv4	\N
131	Ikari Warriors	ikari/ikari_warriors/cover.jpeg	ikari/ikari_warriors/logo.jpg	ikari/ikari_warriors/back.jpeg	1986-02-19	\N	PAL-EUR	60	1-2	Ikari (jp)	\N	NOT_PLAYED	2024-07-17 16:38:44.624+02	2024-07-17 16:39:52.836+02	72	77	\N	https://es.wikipedia.org/wiki/Ikari_Warriors	https://www.youtube.com/embed/8ECiZUWoz8c	\N
245	Pang	pang/pang/cover.png	pang/pang/logo.png	pang/pang/back.jpg	1989-11-01	\N	GLOBAL	30	1-2	Buster Bros. (USA)	\N	PLAYED	2024-08-25 13:41:54.944+02	2024-08-25 13:42:57.822+02	141	155	\N	https://es.wikipedia.org/wiki/Pang	https://www.youtube.com/embed/UyhP6uLk9Fg	\N
136	Super Mario Bros.: The Lost Levels	mario/super_mario_bros_lost_levels/cover.jpg	mario/super_mario_bros_lost_levels/logo.png	mario/super_mario_bros_lost_levels/back.jpeg	1986-06-03	\N	NTSC-J	55	1	Super Mario Bros. 2 (jp)	\N	NOT_PLAYED	2024-07-21 11:14:51.814+02	2024-07-21 11:15:24.024+02	14	82	#ee1c25	https://es.wikipedia.org/wiki/Super_Mario_Bros.:_The_Lost_Levels	https://www.youtube.com/embed/YhG9MYcmyqs	\N
128	Super Mario Bros.	mario/super_mario_bros/cover.jpeg	mario/super_mario_bros/logo.png	mario/super_mario_bros/back.jpeg	1985-09-13	93	PAL-ES	90	1	\N	\N	PLAYED	2024-07-15 13:18:01.608+02	2024-07-18 16:04:17.547+02	14	74	#ee1c25	https://es.wikipedia.org/wiki/Super_Mario_Bros.	https://www.youtube.com/embed/SgqTmKZ4-UA	\N
133	Wonder Boy	wonder_boy/wonder_boy/cover.jpg	wonder_boy/wonder_boy/logo.jpg	wonder_boy/wonder_boy/back.jpeg	1986-03-03	80	PAL-EUR	40	1	Super Wonder Boy (jp)	\N	NOT_PLAYED	2024-07-18 17:18:13.935+02	2024-07-18 17:25:45.386+02	74	79	\N	https://es.wikipedia.org/wiki/Wonder_Boy_(videojuego)	https://www.youtube.com/embed/Rj3cyTBTkSg	\N
134	Arkanoid	arkanoid/arkanoid/cover.png	arkanoid/arkanoid/logo.png	arkanoid/arkanoid/back.jpeg	1986-04-26	\N	NTSC	200	1 (2 alternando)	\N	\N	NOT_PLAYED	2024-07-19 15:43:45.448+02	2024-07-19 15:44:36.75+02	75	80	\N	https://en.wikipedia.org/wiki/Arkanoid	https://www.youtube.com/embed/Th-Z6QQ5AOQ	\N
91	Champion Baseball	champion_baseball/cover.jpeg	champion_baseball/logo.jpeg	champion_baseball/back.jpeg	1983-03-16	\N	\N	\N	1 (2 alternando)	\N	\N	NOT_PLAYED	2024-07-06 19:43:14.734+02	2024-07-19 15:52:35.968+02	\N	\N	\N	https://en.wikipedia.org/wiki/Champion_Baseball	https://www.youtube.com/embed/NCrd1dM8U44	\N
137	Bubble Bobble	bubble_bobble/bubble_bobble/cover.jpg	bubble_bobble/bubble_bobble/logo.png	bubble_bobble/bubble_bobble/back.jpg	1986-06-16	\N	PAL-EUR	75	1-2	\N	\N	NOT_PLAYED	2024-07-21 11:57:56.455+02	2024-07-21 11:59:24.414+02	77	83	\N	https://es.wikipedia.org/wiki/Bubble_Bobble	https://www.youtube.com/embed/BuXOSBb4hQw	\N
143	Alex Kidd in Miracle World	alex_kidd/miracle_world/cover.jpg	alex_kidd/miracle_world/logo.png	alex_kidd/miracle_world/back.jpg	1986-11-01	80	PAL-EUR	130	1	\N	\N	PLAYED	2024-07-23 16:18:41.374+02	2024-07-23 16:19:47.386+02	83	89	\N	https://es.wikipedia.org/wiki/Alex_Kidd_in_Miracle_World	https://www.youtube.com/embed/yasiyS7dkcU	\N
138	Metroid	metroid/metroid/cover.jpeg	metroid/metroid/logo.png	metroid/metroid/back.jpeg	1986-08-06	80	PAL-ES	200	1	\N	\N	PLAYED	2024-07-21 13:21:11.682+02	2024-07-21 13:21:47.558+02	78	84	#bf191e	https://es.wikipedia.org/wiki/Metroid_(videojuego)	https://www.youtube.com/embed/EhnWKcO1byU	\N
139	Starflight	starflight/starflight/cover.jpeg	starflight/starflight/logo.png	starflight/starflight/back.jpeg	1986-08-15	\N	PAL-EUR	35	1	\N	\N	NOT_PLAYED	2024-07-21 13:49:21.997+02	2024-07-21 13:51:21.033+02	79	85	\N	https://es.wikipedia.org/wiki/Starflight	https://www.youtube.com/embed/6_gel9bu19g	\N
132	The Legend of Zelda	the_legend_of_zelda/the_legend_of_zelda/cover.jpeg	the_legend_of_zelda/the_legend_of_zelda/logo.png	the_legend_of_zelda/the_legend_of_zelda/back.jpeg	1986-02-21	88	PAL-ES	250	1	\N	f	NOT_PLAYED	2024-07-17 21:04:06.549+02	2024-07-20 18:51:10.434+02	73	78	#026012	https://es.wikipedia.org/wiki/The_Legend_of_Zelda_(videojuego)	https://www.youtube.com/embed/6g2vk8Gudqs	\N
140	OutRun	outrun/outrun/cover.jpg	outrun/outrun/logo.png	outrun/outrun/back.jpg	1986-09-04	\N	PAL-EUR	30	1	\N	\N	PLAYED	2024-07-22 15:28:52.429+02	2024-07-22 15:30:52.475+02	80	86	\N	https://es.wikipedia.org/wiki/Out_Run	https://www.youtube.com/embed/ELUl-cAtUIE	\N
141	Adventure Island	adventure_island/adventure_island/cover.png	adventure_island/adventure_island/logo.jpg	adventure_island/adventure_island/back.jpeg	1986-09-12	62	PAL-ES	500	1	Isla de aventura del maestro Takahashi (jp)	\N	NOT_PLAYED	2024-07-22 16:06:14.212+02	2024-07-22 16:09:20.36+02	81	87	\N	https://es.wikipedia.org/wiki/Adventure_Island_(videojuego)	https://www.youtube.com/embed/Ly734lgeIAs	\N
142	Castlevania	castlevania/castlevania/cover.jpg	castlevania/castlevania/logo.jpg	castlevania/castlevania/back.jpeg	1986-09-26	80	PAL-ES	250	1	Devil's Castle Dracula (jp)	\N	PLAYED	2024-07-22 17:04:20.282+02	2024-07-22 17:06:01.201+02	82	88	\N	https://es.wikipedia.org/wiki/Castlevania_(videojuego)	https://www.youtube.com/embed/gev1_Qwjze0	\N
144	Kid Icarus	kid_icarus/kid_icarus/cover.jpg	kid_icarus/kid_icarus/logo.png	kid_icarus/kid_icarus/back.jpeg	1986-12-18	\N	PAL-ES	150	1	\N	\N	PLAYED	2024-07-23 17:04:49.466+02	2024-07-23 17:06:23.177+02	84	90	\N	https://es.wikipedia.org/wiki/Kid_Icarus	https://www.youtube.com/embed/qd8-a0xr294	\N
147	Dragon Ball: Le secret du dragon	dragon_ball/dragon_ball_secret_dragon/cover.png	dragon_ball/dragon_ball_secret_dragon/logo.png	dragon_ball/dragon_ball_secret_dragon/back.jpg	1986-11-27	\N	PAL-FR	190	1	Dragon Ball: Shenron no Nazo (jp)	\N	NOT_PLAYED	2024-07-25 17:40:33.595+02	2024-07-25 17:41:33.043+02	86	92	\N	https://es.wikipedia.org/wiki/Dragon_Ball:_El_misterio_de_Shenlong	https://www.youtube.com/embed/Jr_WtH-709M	\N
145	Pro Baseball: Family Stadium	family_stadium/probaseball/cover.jpg	family_stadium/probaseball/logo.png	family_stadium/probaseball/back.jpg	1986-12-10	\N	NTSC-J	30	1-2	R.B.I. Baseball (USA)	\N	NOT_PLAYED	2024-07-24 16:05:41.55+02	2024-07-24 16:07:06.007+02	85	91	\N	https://en.wikipedia.org/wiki/Pro_Baseball:_Family_Stadium	https://www.youtube.com/embed/VEuNCM6b5EI	\N
146	Uridium	uridium/cover.jpg	uridium/logo.png	uridium/back.jpg	1986-02-02	\N	GLOBAL	30	1	\N	\N	NOT_PLAYED	2024-07-24 16:40:01.359+02	2024-07-24 16:40:01.359+02	\N	\N	\N	https://en.wikipedia.org/wiki/Uridium	https://www.youtube.com/embed/wU2NYljlnJo	\N
148	Batman	batman/batman_86/cover.jpg	batman/batman_86/logo.png	batman/batman_86/back.jpg	1986-01-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-07-26 09:43:23.213+02	2024-07-26 09:44:14.663+02	87	93	#505c7c	https://es.wikipedia.org/wiki/Batman_(videojuego_de_1986)	https://www.youtube.com/embed/vYiVoNFe7Ho	\N
149	Zelda II: The Adventure of Link	the_legend_of_zelda/zelda_ii/cover.jpg	the_legend_of_zelda/zelda_ii/logo.png	the_legend_of_zelda/zelda_ii/back.jpg	1987-01-14	78	PAL-ES	300	1	\N	\N	PLAYED	2024-07-27 12:40:05.473+02	2024-07-27 12:42:01.605+02	73	78	#026012	https://es.wikipedia.org/wiki/Zelda_II:_The_Adventure_of_Link	https://www.youtube.com/embed/WQuRIrnD2y4	\N
150	Contra	contra/contra/cover.jpg	contra/contra/logo.png	contra/contra/back.jpg	1987-02-20	90	PAL-EUR	100	1-2	Probotector (EUR)	\N	NOT_PLAYED	2024-07-27 13:03:53.548+02	2024-07-27 13:07:27.777+02	88	94	\N	https://es.wikipedia.org/wiki/Contra_(videojuego)	https://www.youtube.com/embed/_R9B7WTHzNw	\N
151	Double Dragon	double_dragon/double_dragon/cover.jpeg	double_dragon/double_dragon/logo.jpg	double_dragon/double_dragon/back.jpeg	1987-04-22	80	PAL-ES	170	1-2	\N	\N	PLAYED	2024-07-27 13:51:52.804+02	2024-07-27 13:53:40.182+02	89	95	\N	https://es.wikipedia.org/wiki/Double_Dragon	https://www.youtube.com/embed/pfZz-1e-dUQ	\N
152	Ys I: Ancient Ys Vanished	ys/ys_I/cover.jpg	ys/ys_I/logo.png	ys/ys_I/back.jpeg	1987-06-21	86	PAL-EUR	115	1	Ys: The Vanished Omens (Master System)	\N	NOT_PLAYED	2024-07-27 15:28:57.333+02	2024-07-27 15:33:35.723+02	90	96	\N	https://es.wikipedia.org/wiki/Ys_I:_Ancient_Ys_Vanished	https://www.youtube.com/embed/5eABcvCoO7A	\N
135	Dragon Quest	dragon_quest/dragon_quest/cover.jpg	dragon_quest/dragon_quest/logo.png	dragon_quest/dragon_quest/back.jpeg	1986-05-27	\N	NTSC	65	1	Dragon Warrior (USA)	\N	NOT_PLAYED	2024-07-19 17:14:31.088+02	2024-08-01 15:47:29.988+02	76	81	#af382f	https://es.wikipedia.org/wiki/Dragon_Quest_(videojuego)	https://www.youtube.com/embed/jmzHrNVelL0	\N
154	Leisure Suit Larry in the Land of the Lounge Lizards	leisure_suit_larry/land_lounge_lizards/cover.jpg	leisure_suit_larry/land_lounge_lizards/logo.png	leisure_suit_larry/land_lounge_lizards/back.jpeg	1987-07-05	\N	GLOBAL	120	1	\N	\N	NOT_PLAYED	2024-07-28 12:13:09.949+02	2024-07-28 12:14:11.798+02	92	98	\N	https://es.wikipedia.org/wiki/Leisure_Suit_Larry_in_the_Land_of_the_Lounge_Lizards	https://www.youtube.com/embed/Wyvi1pdDPUc	\N
155	Metal Gear	metal_gear/metal_gear/cover.jpg	metal_gear/metal_gear/logo.png	metal_gear/metal_gear/back.jpg	1987-07-13	\N	PAL-EUR	175	1		\N	NOT_PLAYED	2024-07-28 12:52:58.23+02	2024-07-28 12:55:40.26+02	93	99	#505050	https://es.wikipedia.org/wiki/Metal_Gear_(videojuego)	https://www.youtube.com/embed/kQkITK5zCrg	\N
156	Operation Wolf	operation_wolf/operation_wolf/cover.jpg	operation_wolf/operation_wolf/logo.jpg	operation_wolf/operation_wolf/back.jpeg	1987-07-16	\N	PAL-ES	70	1	\N	\N	NOT_PLAYED	2024-07-28 13:10:28.483+02	2024-07-28 13:12:01.104+02	94	100	\N	https://es.wikipedia.org/wiki/Operation_Wolf	https://www.youtube.com/embed/Ujgy2ziBF8w	\N
157	Castlevania II: Simon's Quest	castlevania/castlevania_ii_simon/cover.jpeg	castlevania/castlevania_ii_simon/logo.jpg	castlevania/castlevania_ii_simon/back.jpg	1987-08-28	\N	PAL-EUR	130	1	\N	\N	NOT_PLAYED	2024-07-28 13:32:35.195+02	2024-07-28 13:33:13.38+02	82	88	\N	https://es.wikipedia.org/wiki/Castlevania_II:_Simon%27s_Quest	https://www.youtube.com/embed/HJ-wR_D48uE	\N
169	Dragon Quest II	dragon_quest/dragon_quest_ii/cover.jpg	dragon_quest/dragon_quest_ii/logo.jpeg	dragon_quest/dragon_quest_ii/back.jpg	1987-01-26	\N	NTSC	160	1	Dragon Warrior II (USA)	\N	NOT_PLAYED	2024-08-02 10:35:35.947+02	2024-08-02 10:36:02.076+02	76	81	#af382f	https://es.wikipedia.org/wiki/Dragon_Quest_II	https://www.youtube.com/embed/d4NsE4tpb6k	\N
158	Street Fighter	street_fighter/street_fighter/cover.jpg	street_fighter/street_fighter/logo.png	street_fighter/street_fighter/back.jpg	1987-08-30	\N	GLOBAL	30	1-2	\N	\N	NOT_PLAYED	2024-07-28 23:23:41.799+02	2024-07-28 23:25:42.517+02	95	101	\N	https://es.wikipedia.org/wiki/Street_Fighter_(videojuego)	https://www.youtube.com/embed/6b3xNeoMYBU	\N
163	Mega Man	mega_man/mega_man/cover.jpg	mega_man/mega_man/logo.jpg	mega_man/mega_man/back.jpeg	1987-12-17	83	PAL-EUR	300	1	Rockman (jp)	\N	PLAYED	2024-07-31 16:27:44.02+02	2024-07-31 16:29:27.272+02	98	105	#0400f8	https://es.wikipedia.org/wiki/Mega_Man_(videojuego_de_1987)	https://www.youtube.com/embed/hkD3lEANa_4	\N
159	Pac-Mania	pacman/pacmania/cover.jpg	pacman/pacmania/logo.png	pacman/pacmania/back.jpg	1987-09-11	\N	PAL-EUR	15	1 (2 alternando)	\N	\N	NOT_PLAYED	2024-07-28 23:48:24.557+02	2024-07-28 23:50:34.864+02	8	9	#ed6b0e	https://es.wikipedia.org/wiki/Pac-Mania	https://www.youtube.com/embed/oECPxxnP7kw	\N
160	Maniac Mansion	maniac_mansion/maniac_mansion/cover.jpeg	maniac_mansion/maniac_mansion/logo.png	maniac_mansion/maniac_mansion/back.jpeg	1987-10-05	\N	PAL-ES	150	1	\N	\N	COMPLETED	2024-07-29 21:12:11.005+02	2024-07-29 21:13:25.348+02	96	102	\N	https://es.wikipedia.org/wiki/Maniac_Mansion	https://www.youtube.com/embed/9EU0Ml28keg	\N
161	Mike Tyson's Punch-Out!!	punch_out/mike_tyson/cover.jpg	punch_out/mike_tyson/logo.png	punch_out/mike_tyson/back.jpg	1987-10-18	89	PAL-EUR	200	1	Punch-Out!!	\N	PLAYED	2024-07-30 15:38:06.727+02	2024-07-30 15:57:17.652+02	57	103	\N	https://es.wikipedia.org/wiki/Punch-Out!!_(NES)	https://www.youtube.com/embed/RNmCWIbmWBU	\N
162	Dungeon Master	dungeon_master/dungeon_master/cover.jpg	dungeon_master/dungeon_master/logo.png	dungeon_master/dungeon_master/back.jpg	1987-12-15	\N	GLOBAL	80	1	\N	\N	NOT_PLAYED	2024-07-30 16:47:18.995+02	2024-07-30 16:48:12.577+02	97	104	\N	https://es.wikipedia.org/wiki/Dungeon_Master_(videojuego)	https://www.youtube.com/embed/AhD4BDJE_is	\N
170	Final Lap	final_lap/final_lap/cover.jpg	final_lap/final_lap/logo.jpg	final_lap/final_lap/back.jpg	1987-09-01	\N	NTSC-J	10	1-8	\N	\N	NOT_PLAYED	2024-08-02 11:08:50.33+02	2024-08-02 11:09:40.089+02	102	109	\N	https://es.wikipedia.org/wiki/Final_Lap	https://www.youtube.com/embed/OpWlnJtio3Y	\N
164	Final Fantasy	final_fantasy/final_fantasy/cover.jpg	final_fantasy/final_fantasy/logo.png	final_fantasy/final_fantasy/back.jpg	1987-12-18	79	NTSC	105	1	\N	\N	PLAYED	2024-08-01 15:58:29.425+02	2024-08-01 15:58:47.69+02	99	106	#5499b5	https://es.wikipedia.org/wiki/Final_Fantasy_(videojuego)	https://www.youtube.com/embed/aguBv5Gj49s	\N
165	Phantasy Star	phantasy_star/phantasy_star/cover.jpg	phantasy_star/phantasy_star/logo.png	phantasy_star/phantasy_star/back.jpg	1987-12-20	90	PAL-EUR	200	1	\N	\N	NOT_PLAYED	2024-08-01 16:55:52+02	2024-08-01 17:00:29.854+02	100	107	\N	https://es.wikipedia.org/wiki/Phantasy_Star_(videojuego)	https://www.youtube.com/embed/n3P-3GsiRIw	\N
166	Head Over Heels	head_over_heels/cover.jpg	head_over_heels/logo.jpg	head_over_heels/back.jpg	1987-01-01	\N	GLOBAL	50	1	\N	\N	NOT_PLAYED	2024-08-02 08:41:38.76+02	2024-08-02 08:41:38.76+02	\N	\N	\N	https://es.wikipedia.org/wiki/Head_Over_Heels_(videojuego)	https://www.youtube.com/embed/zJYhckbQmg4	\N
167	The Last Ninja	the_last_ninja/the_last_ninja/cover.jpg	the_last_ninja/the_last_ninja/logo.png	the_last_ninja/the_last_ninja/back.jpg	1987-01-08	\N	GLOBAL	120	1	\N	\N	NOT_PLAYED	2024-08-02 09:13:49.221+02	2024-08-02 09:32:20.722+02	101	108	\N	https://es.wikipedia.org/wiki/The_Last_Ninja	https://www.youtube.com/embed/CWmqoEdjKR4	\N
168	Sid Meier's Pirates!	sid_meiers_pirates/cover.jpg	sid_meiers_pirates/logo.jpg	sid_meiers_pirates/back.jpg	1987-05-01	\N	GLOBAL	50	1	\N	\N	NOT_PLAYED	2024-08-02 10:23:57.319+02	2024-08-02 10:23:57.319+02	\N	\N	\N	https://en.wikipedia.org/wiki/Sid_Meier%27s_Pirates!	https://www.youtube.com/embed/owSCqgpv9AA	\N
171	After Burner	after_burner/after_burner/cover.jpg	after_burner/after_burner/logo.jpg	after_burner/after_burner/back.jpg	1987-07-17	85	PAL-EUR	15	1	\N	\N	NOT_PLAYED	2024-08-02 11:30:34.441+02	2024-08-02 11:32:17.33+02	103	110	\N	https://es.wikipedia.org/wiki/After_Burner	https://www.youtube.com/embed/pSvxN7nMNwo	\N
172	Shinobi	shinobi/shinobi/cover.jpg	shinobi/shinobi/logo.png	shinobi/shinobi/back.jpg	1987-11-16	85	PAL-EUR	30	1	\N	\N	NOT_PLAYED	2024-08-02 12:00:45.031+02	2024-08-02 12:01:21.521+02	104	111	\N	https://es.wikipedia.org/wiki/Shinobi	https://www.youtube.com/embed/_O4CJlsJRYg	\N
174	Renegade	kunio-kun/renegade/cover.jpg	kunio-kun/renegade/logo.png	kunio-kun/renegade/back.jpg	1986-05-01	\N	PAL-EUR	60	1-2	Hot-Blooded Tough Guy Kunio (jp)	\N	NOT_PLAYED	2024-08-02 12:40:00.371+02	2024-08-02 12:40:57.373+02	106	113	\N	https://es.wikipedia.org/wiki/Renegade_(videojuego)	https://www.youtube.com/embed/TGtcdIxCXy8	\N
173	Fantasy Zone	fantasy_zone/fantasy_zone/cover.jpeg	fantasy_zone/fantasy_zone/logo.jpg	fantasy_zone/fantasy_zone/back.jpeg	1986-03-28	\N	PAL-EUR	40	1	\N	t	NOT_PLAYED	2024-08-02 12:13:49.127+02	2024-08-02 12:14:39.962+02	105	112	\N	https://es.wikipedia.org/wiki/Fantasy_Zone	https://www.youtube.com/embed/L7WQYjC26SU	\N
175	Super Contra	contra/super_contra/cover.png	contra/super_contra/logo.png	contra/super_contra/back.png	1988-01-08	75	PAL-EUR	220	1-2	Probotector II: Return of the Evil Forces (EUR)	\N	NOT_PLAYED	2024-08-03 10:24:30.783+02	2024-08-03 10:27:11.956+02	88	94	\N	https://es.wikipedia.org/wiki/Super_Contra	https://www.youtube.com/embed/4UB-1-cWR0o	\N
176	Dragon Quest III	dragon_quest/dragon_quest_iii/cover.jpg	dragon_quest/dragon_quest_iii/logo.jpg	dragon_quest/dragon_quest_iii/back.jpg	1988-02-10	\N	NTSC	300	1	Dragon Warrior III (USA)	\N	NOT_PLAYED	2024-08-03 11:13:21.171+02	2024-08-03 11:14:33.815+02	76	81	#af382f	https://es.wikipedia.org/wiki/Dragon_Quest_III	https://www.youtube.com/embed/KXq6KwzG8iQ	\N
177	R.C. Pro-Am	rc_pro-am/rc_pro-am/cover.jpeg	rc_pro-am/rc_pro-am/logo.jpg	rc_pro-am/rc_pro-am/back.jpeg	1988-02-10	\N	PAL-ES	150	1	\N	\N	NOT_PLAYED	2024-08-03 11:34:45.662+02	2024-08-03 11:36:29.122+02	107	114	\N	https://es.wikipedia.org/wiki/R.C._Pro-Am	https://www.youtube.com/embed/Y04CtbRKAPY	\N
178	John Madden Football	madden_nfl/madden_88/cover.jpg	madden_nfl/madden_88/logo.jpg	madden_nfl/madden_88/back.jpg	1988-06-01	\N	GLOBAL	120	1	Madden '88 	\N	NOT_PLAYED	2024-08-03 12:21:25.384+02	2024-08-03 12:22:01.503+02	108	115	\N	https://en.wikipedia.org/wiki/John_Madden_Football_(1988_video_game)	https://www.youtube.com/embed/rCa1yEA0EMU	\N
179	Altered Beast	altered_beast/altered_beast/cover.jpg	altered_beast/altered_beast/logo.jpg	altered_beast/altered_beast/back.jpg	1988-06-14	80	PAL-EUR	35	1-2	\N	\N	NOT_PLAYED	2024-08-03 13:07:44.899+02	2024-08-03 13:08:38.043+02	109	116	\N	https://es.wikipedia.org/wiki/Altered_Beast	https://www.youtube.com/embed/jFiTLTSwAgw	\N
180	Bionic Commando	bionic_commando/bionic_commando/cover.jpg	bionic_commando/bionic_commando/logo.jpg	bionic_commando/bionic_commando/back.jpg	1988-07-20	\N	PAL-EUR	80	1	Hitler's Resurrection: Top Secret (jp)	\N	NOT_PLAYED	2024-08-03 13:43:09.141+02	2024-08-03 13:44:13.246+02	110	117	\N	https://es.wikipedia.org/wiki/Bionic_Commando	https://www.youtube.com/embed/Ckob2RoIXNU	\N
181	Ghouls 'n Ghosts	ghosts_n_goblins/ghouls_n_ghosts/cover.jpg	ghosts_n_goblins/ghouls_n_ghosts/logo.jpg	ghosts_n_goblins/ghouls_n_ghosts/back.jpg	1988-10-05	91	PAL-EUR	75	1	Dai Makaimura (Great Demon World Village) (jp)	\N	NOT_PLAYED	2024-08-04 12:04:53.214+02	2024-08-04 12:06:20.534+02	67	71	\N	https://es.wikipedia.org/wiki/Ghouls_%27n_Ghosts	https://www.youtube.com/embed/odPJN_lZJgY	\N
182	Ultima V: Warriors of Destiny	ultima/ultima_v/cover.jpg	ultima/ultima_v/logo.jpg	ultima/ultima_v/back.jpg	1988-03-01	\N	GLOBAL	105	1	\N	\N	NOT_PLAYED	2024-08-04 12:20:57.576+02	2024-09-22 10:58:11.827+02	10	11	\N	https://es.wikipedia.org/wiki/Ultima_V:_Warriors_of_Destiny	https://www.youtube.com/embed/r7fxWLvUDJU	\N
183	Super Mario Bros. 2	mario/super_mario_bros_2/cover.jpg	mario/super_mario_bros_2/logo.jpg	mario/super_mario_bros_2/back.jpg	1988-10-09	89	PAL-ES	120	1	Super Mario USA (jp)	\N	PLAYED	2024-08-04 13:41:12.718+02	2024-08-04 13:42:43.01+02	14	74	#ee1c25	https://es.wikipedia.org/wiki/Super_Mario_Bros._2	https://www.youtube.com/embed/BZSjpVEdH6Y	\N
188	Ninja Gaiden	ninja_gaiden/ninja_gaiden/cover.jpg	ninja_gaiden/ninja_gaiden/logo.jpeg	ninja_gaiden/ninja_gaiden/back.jpg	1988-12-09	75	PAL-EUR	120	1	Shadow Warriors (EUR)	\N	NOT_PLAYED	2024-08-06 16:43:23.918+02	2024-08-06 16:45:29.57+02	113	120	\N	https://es.wikipedia.org/wiki/Ninja_Gaiden_(videojuego)	https://www.youtube.com/embed/V822oMzJQSg	\N
184	Super Mario Bros. 3	mario/super_mario_bros_3/cover.jpg	mario/super_mario_bros_3/logo.png	mario/super_mario_bros_3/back.jpg	1988-10-23	97	PAL-ES	80	1 (2 alternando)	\N	\N	PLAYED	2024-08-04 21:03:28.891+02	2024-08-04 21:03:55.401+02	14	74	#ee1c25	https://es.wikipedia.org/wiki/Super_Mario_Bros._3	https://www.youtube.com/embed/U3zzaoB9yiw	\N
185	Splatterhouse	splatterhouse/splatterhouse/cover.jpg	splatterhouse/splatterhouse/logo.png	splatterhouse/splatterhouse/back.jpg	1988-11-01	\N	NTSC	150	1	\N	\N	NOT_PLAYED	2024-08-05 16:43:26.178+02	2024-08-05 16:44:31.615+02	111	118	\N	https://es.wikipedia.org/wiki/Splatterhouse	https://www.youtube.com/embed/xss7N6ELobU	\N
186	Winning Run	winning_run/winning_run/cover.jpg	winning_run/winning_run/logo.png	winning_run/winning_run/back.jpg	1988-12-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-08-05 16:58:52.232+02	2024-08-05 16:59:26.012+02	112	119	\N	https://es.wikipedia.org/wiki/Winning_Run	https://www.youtube.com/embed/1KYmhSVc27Q	\N
187	Double Dragon II: The Revenge	double_dragon/double_dragon_ii/cover.jpg	double_dragon/double_dragon_ii/logo.jpg	double_dragon/double_dragon_ii/back.jpg	1988-12-01	\N	PAL-EUR	100	1-2		\N	NOT_PLAYED	2024-08-05 17:18:13.093+02	2024-08-05 17:19:17.672+02	89	95	\N	https://es.wikipedia.org/wiki/Double_Dragon_II:_The_Revenge	https://www.youtube.com/embed/f9V0iLedLv0	\N
189	Final Fantasy II	final_fantasy/final_fantasy_ii/cover.jpg	final_fantasy/final_fantasy_ii/logo.jpg	final_fantasy/final_fantasy_ii/back.jpg	1988-12-17	\N	NTSC-J	55	1	\N	\N	NOT_PLAYED	2024-08-07 15:34:13.211+02	2024-08-07 15:35:29.202+02	99	106	#5499b5	https://es.wikipedia.org/wiki/Final_Fantasy_II	https://www.youtube.com/embed/_hP29rlioTw	\N
190	Mega Man 2	mega_man/mega_man_2/cover.jpg	mega_man/mega_man_2/logo.jpg	mega_man/mega_man_2/back.jpg	1988-12-24	89	PAL-EUR	100	1	Megaman 2: Mistery Of Dr. Wily (jp)	\N	NOT_PLAYED	2024-08-07 15:48:33.037+02	2024-08-07 15:48:58.678+02	98	105	#0400f8	https://es.wikipedia.org/wiki/Mega_Man_2	https://www.youtube.com/embed/CWZZUyD-nRs	\N
193	Chase H.Q.	chase_hq/chase_hq/cover.jpg	chase_hq/chase_hq/logo.jpg	chase_hq/chase_hq/back.jpg	1988-11-01	89	PAL-EUR	25	1	\N	\N	NOT_PLAYED	2024-08-08 16:05:00.618+02	2024-08-08 16:06:49.043+02	115	122	\N	https://es.wikipedia.org/wiki/Chase_H.Q.	https://www.youtube.com/embed/b68_wGrosX0	\N
191	RoboCop	robocop/robocop/cover.jpg	robocop/robocop/logo.png	robocop/robocop/back.jpg	1988-01-01	87	PAL-EUR	65	1	\N	\N	NOT_PLAYED	2024-08-07 16:32:07.639+02	2024-08-07 16:35:34.017+02	114	121	\N	https://es.wikipedia.org/wiki/RoboCop_(videojuego_de_1988)	https://www.youtube.com/embed/jGO85PTTSDw	\N
192	Gradius II	gradius/gradius_ii/cover.jpg	gradius/gradius_ii/logo.png	gradius/gradius_ii/back.jpg	1988-03-24	\N	NTSC-J	25	1	Vulcan Venture (eur)	\N	NOT_PLAYED	2024-08-07 16:43:31.782+02	2024-08-07 16:43:40.933+02	39	40	\N	https://es.wikipedia.org/wiki/Gradius_II	https://www.youtube.com/embed/EPq4PWr6WgA	\N
194	Super Mario Bros. / Duck Hunt	mario/collection/supermario_duckhunt/cover.jpg	mario/collection/supermario_duckhunt/logo.jpg	mario/collection/supermario_duckhunt/back.jpg	1988-11-01	\N	PAL-EUR	30	1-2	\N	\N	NOT_PLAYED	2024-08-08 17:28:47.947+02	2024-08-08 17:29:07.578+02	\N	\N	\N	\N	\N	\N
195	Thunder Blade	thunder_blade/thunder_blade/cover.jpg	thunder_blade/thunder_blade/logo.jpg	thunder_blade/thunder_blade/back.jpg	1987-12-01	80	PAL-EUR	20	1	\N	\N	NOT_PLAYED	2024-08-09 11:26:48.043+02	2024-08-09 11:28:23.576+02	116	123	\N	https://en.wikipedia.org/wiki/Thunder_Blade	https://www.youtube.com/embed/uS9z2nU4dcE	\N
197	Speedball	speedball/speedball/cover.jpg	speedball/speedball/logo.jpg	speedball/speedball/back.jpg	1988-01-01	\N	PAL-EUR	20	1-2	\N	\N	NOT_PLAYED	2024-08-09 11:52:57.459+02	2024-08-09 11:54:12.422+02	117	124	\N	https://en.wikipedia.org/wiki/Speedball_(video_game)	https://www.youtube.com/embed/xT4KnyVTgQo	\N
196	Last Ninja 2	the_last_ninja/last_ninja_2/cover.jpg	the_last_ninja/last_ninja_2/logo.png	the_last_ninja/last_ninja_2/back.jpg	1988-01-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-08-09 11:34:27.744+02	2024-08-09 11:34:46.808+02	101	108	\N	https://en.wikipedia.org/wiki/Last_Ninja_2	https://www.youtube.com/embed/IVIEMFtRyNs	\N
198	Hard Drivin'	hard_drivin/cover.jpg	hard_drivin/logo.jpeg	hard_drivin/back.jpg	1989-02-12	\N	PAL-EUR	25	1	\N	\N	NOT_PLAYED	2024-08-09 12:31:05.214+02	2024-08-09 12:31:05.214+02	\N	\N	\N	https://en.wikipedia.org/wiki/Hard_Drivin%27	https://www.youtube.com/embed/g6JC-HCNcio	\N
199	Phantasy Star II	phantasy_star/phantasy_star_ii/cover.jpg	phantasy_star/phantasy_star_ii/logo.png	phantasy_star/phantasy_star_ii/back.jpg	1989-03-21	91	PAL-EUR	100	1	\N	\N	NOT_PLAYED	2024-08-09 12:48:37.443+02	2024-08-09 12:48:58.56+02	100	107	\N	https://es.wikipedia.org/wiki/Phantasy_Star_II	https://www.youtube.com/embed/gmJMAifqzd4	\N
200	Super Mario Land	mario/super_mario_land/cover.jpg	mario/super_mario_land/logo.png	mario/super_mario_land/back.jpg	1989-04-21	93	PAL-ES	120	1	\N	\N	NOT_PLAYED	2024-08-09 13:45:11.202+02	2024-08-09 13:45:34.99+02	14	125	#E60012	https://es.wikipedia.org/wiki/Super_Mario_Land	https://www.youtube.com/embed/3e4Qgl2e_T0	\N
201	Golden Axe	golden_axe/golden_axe/cover.jpg	golden_axe/golden_axe/logo.png	golden_axe/golden_axe/back.jpg	1989-01-27	90	PAL-EUR	50	1-2	\N	\N	PLAYED	2024-08-10 11:50:31.698+02	2024-08-10 11:52:41.915+02	118	126	\N	https://es.wikipedia.org/wiki/Golden_Axe	https://www.youtube.com/embed/7VRP_mg8PtM	\N
202	Teenage Mutant Ninja Turtles	teenage_mutant_ninja_turtles/teenage_mutant_ninja_turtles/cover.jpg	teenage_mutant_ninja_turtles/teenage_mutant_ninja_turtles/logo.png	teenage_mutant_ninja_turtles/teenage_mutant_ninja_turtles/back.jpg	1989-05-12	82	PAL-EUR	50	1	Teenage Mutant Hero Turtles (EUR)	\N	NOT_PLAYED	2024-08-10 12:43:44.595+02	2024-08-10 12:45:53.376+02	119	127	#38761d	https://es.wikipedia.org/wiki/Teenage_Mutant_Ninja_Turtles_(videojuego_de_1989)	https://www.youtube.com/embed/l9Bc69J6tSU	\N
203	Teenage Mutant Ninja Turtles II: The Arcade Game	teenage_mutant_ninja_turtles/teenage_mutant_ii/cover.jpg	teenage_mutant_ninja_turtles/teenage_mutant_ii/logo.png	teenage_mutant_ninja_turtles/teenage_mutant_ii/back.jpg	1989-10-11	\N	PAL-EUR	80	1-4	Teenage Mutant Ninja Turtles II: The Arcade Game (EUR)	\N	NOT_PLAYED	2024-08-10 12:58:15.821+02	2024-08-10 13:03:37.705+02	119	127	#38761d	https://es.wikipedia.org/wiki/Teenage_Mutant_Ninja_Turtles_(arcade)	https://www.youtube.com/embed/2jLO1upcd8w	\N
204	Pipe Mania	pipe_mania/pipe_mania/cover.jpg	pipe_mania/pipe_mania/logo.jpg	pipe_mania/pipe_mania/back.jpg	1989-06-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-08-10 13:19:19.435+02	2024-08-10 13:19:47.682+02	120	128	\N	https://es.wikipedia.org/wiki/Pipe_Mania	https://www.youtube.com/embed/Xte1l4-tw0g	\N
210	Bonk's Adventure	bonk/bonk_adventure/cover.jpg	bonk/bonk_adventure/logo.jpg	bonk/bonk_adventure/back.jpg	1989-12-15	\N	NTSC	100	1	PC Genjin (JP)	\N	NOT_PLAYED	2024-08-12 17:11:48.11+02	2024-08-12 17:12:57.275+02	126	134	\N	https://es.wikipedia.org/wiki/Bonk%27s_Adventure	https://www.youtube.com/embed/zNNVJZJUnCM	\N
206	Mother	mother/mother/cover.jpg	mother/mother/logo.png	mother/mother/back.jpg	1989-07-27	\N	NTSC-J	130	1	EarthBound Beginnings (USA/EUR)	\N	NOT_PLAYED	2024-08-11 12:44:57.376+02	2024-08-11 12:51:01.583+02	122	130	\N	https://es.wikipedia.org/wiki/Mother_(videojuego)	https://www.youtube.com/embed/xTonuqUL_MU	\N
207	DuckTales	ducktales/ducktales/cover.jpg	ducktales/ducktales/logo.png	ducktales/ducktales/back.jpg	1989-09-14	78	PAL-EUR	60	1	\N	\N	NOT_PLAYED	2024-08-11 13:23:50.049+02	2024-08-11 13:25:11.075+02	123	131	\N	https://es.wikipedia.org/wiki/DuckTales_(videojuego)	https://www.youtube.com/embed/sKyspid6bNE	\N
208	Prince of Persia	prince_of_persia/prince_of_persia/cover.jpg	prince_of_persia/prince_of_persia/logo.jpg	prince_of_persia/prince_of_persia/back.jpg	1989-10-03	\N	GLOBAL	40	1	\N	\N	PLAYED	2024-08-11 16:47:19.547+02	2024-08-11 16:51:50.274+02	124	132	\N	https://es.wikipedia.org/wiki/Prince_of_Persia_(videojuego_de_1989)	https://www.youtube.com/embed/FGQmtlxllWY	\N
205	Populous	populous/populous/cover.jpg	populous/populous/logo.jpg	populous/populous/back.jpg	1989-03-01	\N	PAL-EUR	25	1	\N	\N	NOT_PLAYED	2024-08-11 12:04:23.063+02	2024-08-12 16:01:31.011+02	121	129	\N	https://es.wikipedia.org/wiki/Populous_(videojuego)	https://www.youtube.com/embed/rx3xASWk-2o	
209	SimCity	simcity/simcity/cover.jpg	simcity/simcity/logo.jpg	simcity/simcity/back.jpeg	1989-02-02	\N	GLOBAL	40	1	\N	\N	NOT_PLAYED	2024-08-12 16:11:14.465+02	2024-08-12 16:12:57.385+02	125	133	\N	https://es.wikipedia.org/wiki/SimCity_(videojuego)	https://www.youtube.com/embed/A54blk-ojA4	\N
212	Super Monaco GP	monaco_gp/super_monaco_gp/cover.jpg	monaco_gp/super_monaco_gp/logo.png	monaco_gp/super_monaco_gp/back.jpg	1989-05-01	88	PAL-EUR	15	1	\N	\N	NOT_PLAYED	2024-08-13 16:47:26.833+02	2024-08-13 16:48:29.498+02	127	135	\N	https://es.wikipedia.org/wiki/Super_Monaco_GP	https://www.youtube.com/embed/b3_dzGfVero	\N
213	Final Fight	final_fight/final_fight/cover.png	final_fight/final_fight/logo.png	final_fight/final_fight/back.jpg	1989-12-01	\N	PAL-ES	500	1-2	\N	\N	PLAYED	2024-08-14 17:06:17.745+02	2024-08-14 17:07:34.103+02	128	136	\N	https://es.wikipedia.org/wiki/Final_Fight	https://www.youtube.com/embed/wymIQ1FywrA	\N
214	Strider	strider_hiryu/strider/cover.jpg	strider_hiryu/strider/logo.jpg	strider_hiryu/strider/back.jpg	1989-03-07	92	PAL-EUR	25	1	Strider Hiryu (jp)	\N	NOT_PLAYED	2024-08-18 13:32:15.018+02	2024-08-18 13:34:28.803+02	129	137	\N	https://es.wikipedia.org/wiki/Strider_Hiryu_(Arcade)	https://www.youtube.com/embed/lpsWMDRjkBo	\N
215	Super Off Road	super_off_road/super_off_road/cover.png	super_off_road/super_off_road/logo.jpg	super_off_road/super_off_road/back.jpg	1989-01-01	\N	PAL-ES	80	1-2	Ivan 'Ironman' Stewart's Super Off Road	\N	NOT_PLAYED	2024-08-18 14:20:43.313+02	2024-08-18 14:23:04.318+02	130	138	\N	https://es.wikipedia.org/wiki/Super_Off_Road	https://www.youtube.com/embed/91r83_UDYZk	\N
216	Wonder Boy in Monster Land	wonder_boy/wonder_boy_monster_land/cover.jpg	wonder_boy/wonder_boy_monster_land/logo.png	wonder_boy/wonder_boy_monster_land/back.jpg	1987-08-01	\N	PAL-EUR	35	1	Super Wonder Boy: Monster World (jp)	\N	NOT_PLAYED	2024-08-19 13:11:09.963+02	2024-08-19 13:11:19.449+02	74	79	\N	https://es.wikipedia.org/wiki/Wonder_Boy_in_Monster_Land	https://www.youtube.com/embed/Pp1_e6BbXcI	\N
217	Wonder Boy III: Monster Lair	wonder_boy/wonder_boy_iii_monster_lair/cover.jpg	wonder_boy/wonder_boy_iii_monster_lair/logo.jpg	wonder_boy/wonder_boy_iii_monster_lair/back.jpg	1988-11-01	\N	PAL-EUR	40	1-2	\N	\N	NOT_PLAYED	2024-08-19 13:29:46.796+02	2024-08-19 13:31:19.485+02	74	79	\N	https://es.wikipedia.org/wiki/Wonder_Boy_III:_Monster_Lair	https://www.youtube.com/embed/2CTB6Eg2ssw	\N
218	Wonder Boy III: The Dragon's Trap	wonder_boy/wonder_boy_iii_dragons_trap/cover.jpg	wonder_boy/wonder_boy_iii_dragons_trap/logo.png	wonder_boy/wonder_boy_iii_dragons_trap/back.jpg	1989-09-01	88	PAL-EUR	40	1	Monster World II: Dragon no Wana (jp)	\N	NOT_PLAYED	2024-08-19 13:42:45.976+02	2024-08-19 13:43:45.164+02	74	79	\N	https://es.wikipedia.org/wiki/Wonder_Boy_III:_The_Dragon%27s_Trap	https://www.youtube.com/embed/OBdu19yBNkQ	\N
219	Indiana Jones y la última cruzada: Aventura gráfica	indiana_jones/last_crusade_graphic_adventure/cover.jpg	indiana_jones/last_crusade_graphic_adventure/logo.jpg	indiana_jones/last_crusade_graphic_adventure/back.jpg	1989-07-01	\N	GLOBAL	200	1	Indiana Jones and the Last Crusade: The Graphic Adventure	\N	NOT_PLAYED	2024-08-19 14:14:43.646+02	2024-08-19 14:15:50.749+02	131	139	\N	https://es.wikipedia.org/wiki/Indiana_Jones_y_la_%C3%BAltima_cruzada:_Aventura_gr%C3%A1fica	https://www.youtube.com/embed/HxpTESPe5qU	\N
220	Shadow of the Beast	shadow_of_the_beast/shadow_of_the_beast/cover.jpg	shadow_of_the_beast/shadow_of_the_beast/logo.jpeg	shadow_of_the_beast/shadow_of_the_beast/back.jpg	1989-01-01	\N	GLOBAL	30	1	\N	\N	NOT_PLAYED	2024-08-22 15:37:34.207+02	2024-08-22 15:39:40.652+02	132	140	\N	https://en.wikipedia.org/wiki/Shadow_of_the_Beast_(1989_video_game)	https://www.youtube.com/embed/a0t1TLPQzTM	\N
221	Kick Off	kick_off/kick_off/cover.jpg	kick_off/kick_off/logo.png	kick_off/kick_off/back.jpg	1989-01-01	\N	GLOBAL	10	1-4	\N	\N	PLAYED	2024-08-22 16:20:31.71+02	2024-08-22 16:21:38+02	133	141	\N	https://en.wikipedia.org/wiki/Kick_Off_(series)	https://www.youtube.com/embed/VPG7Tbi8HVA	\N
211	Castlevania III: Dracula's Curse	castlevania/castlevania_iii_curse/cover.jpg	castlevania/castlevania_iii_curse/logo.png	castlevania/castlevania_iii_curse/back.jpg	1989-12-22	80	PAL-EUR	400	1	Demon Castle  Legend (jp)	\N	NOT_PLAYED	2024-08-13 16:26:36.605+02	2024-09-02 17:29:36.432+02	82	88	\N	https://es.wikipedia.org/wiki/Castlevania_III:_Dracula%27s_Curse	https://www.youtube.com/embed/hFFKAl2A898	\N
222	The Untouchables	the_untochables/cover.jpg	the_untochables/logo.png	the_untochables/back.jpg	1989-01-01	\N	GLOBAL	25	1	\N	\N	NOT_PLAYED	2024-08-22 16:32:39.775+02	2024-08-22 16:32:50.001+02	\N	\N	\N	https://en.wikipedia.org/wiki/The_Untouchables_(video_game)	https://www.youtube.com/embed/nGs6bIEI3D0	\N
223	The Final Fantasy Legend	saga/final_fantasy_legend/cover.png	saga/final_fantasy_legend/logo.jpg	saga/final_fantasy_legend/back.jpg	1989-12-15	\N	NTSC	150	1	Makai Toushi Sa·Ga (jp)	\N	NOT_PLAYED	2024-08-22 17:08:58.345+02	2024-08-22 17:10:23.919+02	134	142	\N	https://es.wikipedia.org/wiki/The_Final_Fantasy_Legend	https://www.youtube.com/embed/rM7omzH0LbQ	
224	Ys II	ys/ys_ii/cover.jpg	ys/ys_ii/logo.jpeg	ys/ys_ii/back.jpg	1988-04-22	\N	NTSC-J	60	1	Ys II: Ancient Ys Vanished – The Final Chapter	\N	NOT_PLAYED	2024-08-22 17:27:34.419+02	2024-08-22 17:28:04.248+02	90	96	\N	https://es.wikipedia.org/wiki/Ys_II:_Ancient_Ys_Vanished_%E2%80%93_The_Final_Chapter	https://www.youtube.com/embed/Feyvm2kNoqs	\N
225	Ys Book I & II	ys/ys_book_i_ii/cover.jpg	ys/ys_book_i_ii/logo.jpeg	ys/ys_book_i_ii/back.png	1989-12-21	\N	NTSC	250	1	Ys I & II (jp)	\N	NOT_PLAYED	2024-08-22 17:35:19.249+02	2024-08-22 17:38:28.231+02	90	143	\N	https://es.wikipedia.org/wiki/Ys_I_y_II	https://www.youtube.com/embed/KrH2uvC-zog	\N
226	Railroad Tycoon	railroad_tycoon/railroad_tycoon/cover.jpg	railroad_tycoon/railroad_tycoon/logo.png	railroad_tycoon/railroad_tycoon/back.jpg	1990-01-01	\N	GLOBAL	60	1	\N	\N	NOT_PLAYED	2024-08-23 10:51:55.64+02	2024-08-23 10:52:59.75+02	135	144	\N	https://es.wikipedia.org/wiki/Railroad_Tycoon	https://www.youtube.com/embed/bekpo1o6rh4	\N
227	Teenage Mutant Ninja Turtles: Fall of the Foot Clan	teenage_mutant_ninja_turtles/fall_of_the_foot_clan/cover.jpg	teenage_mutant_ninja_turtles/fall_of_the_foot_clan/logo.png	teenage_mutant_ninja_turtles/fall_of_the_foot_clan/back.jpg	1990-08-02	\N	PAL-ES	250	1	Teenage Mutant Hero Turtles: Fall of the Foot Clan (EUR)	\N	NOT_PLAYED	2024-08-23 12:50:15.11+02	2024-08-23 12:50:40.222+02	119	145	#38761d	https://es.wikipedia.org/wiki/Teenage_Mutant_Ninja_Turtles:_Fall_of_the_Foot_Clan	https://www.youtube.com/embed/r1sPSAEm2Yo	\N
228	G-LOC: Air Battle	after_burner/g_loc/cover.jpg	after_burner/g_loc/logo.jpg	after_burner/g_loc/back.jpg	1990-04-01	80	PAL-EUR	20	1	\N	\N	NOT_PLAYED	2024-08-23 13:05:45.186+02	2024-08-23 13:05:53.88+02	103	146	\N	https://es.wikipedia.org/wiki/G-LOC:_Air_Battle	https://www.youtube.com/embed/58JKeizTZF0	\N
229	Snake's Revenge	metal_gear/snake_revenge/cover.jpg	metal_gear/snake_revenge/logo.jpg	metal_gear/snake_revenge/back.jpg	1990-04-01	\N	PAL-EUR	100	1	\N	\N	NOT_PLAYED	2024-08-23 13:20:29.839+02	2024-08-23 13:21:07.115+02	93	147	#505050	https://es.wikipedia.org/wiki/Snake%27s_Revenge	https://www.youtube.com/embed/-Rivs_6U69w	\N
230	Smash TV	smash_tv/cover.jpg	smash_tv/logo.jpg	smash_tv/back.jpg	1990-04-01	65	PAL-EUR	35	1-2	Super Smash TV (consolas)	\N	NOT_PLAYED	2024-08-23 13:37:43.146+02	2024-08-23 13:37:43.146+02	\N	\N	\N	https://es.wikipedia.org/wiki/Smash_TV	https://www.youtube.com/embed/WIPn7RZJ4vg	\N
231	Fire Emblem: Shadow Dragon and the Blade of Light	fire_emblem/fire_emblem_shadow_dragon/cover.jpg	fire_emblem/fire_emblem_shadow_dragon/logo.jpg	fire_emblem/fire_emblem_shadow_dragon/back.jpg	1990-04-20	\N	NTSC-J	50	1	\N	\N	NOT_PLAYED	2024-08-23 16:17:14.061+02	2024-08-23 16:19:02.094+02	136	148	\N	https://es.wikipedia.org/wiki/Fire_Emblem:_Ankoku_Ry%C5%AB_to_Hikari_no_Tsurugi	https://www.youtube.com/embed/tb-5VWJ7hek	\N
233	Metal Gear 2: Solid Snake	metal_gear/metal_gear_2_solid_snake/cover.jpg	metal_gear/metal_gear_2_solid_snake/logo.jpg	metal_gear/metal_gear_2_solid_snake/back.jpg	1990-07-20	\N	NTSC-J	800	1	\N	\N	NOT_PLAYED	2024-08-23 16:45:48.861+02	2024-08-23 16:46:19.51+02	93	99	#505050	https://es.wikipedia.org/wiki/Metal_Gear_2:_Solid_Snake	https://www.youtube.com/embed/TQvfYfiWxZg	\N
239	The Secret of Monkey Island	monkey_island/secret_of_monkey_island/cover.jpg	monkey_island/secret_of_monkey_island/logo.png	monkey_island/secret_of_monkey_island/back.jpg	1990-10-15	90	GLOBAL	200	1	\N	\N	PLAYED	2024-08-24 13:42:44.54+02	2024-08-24 13:46:15.122+02	139	152	\N	https://es.wikipedia.org/wiki/The_Secret_of_Monkey_Island	https://www.youtube.com/embed/QgRIXntFhww	\N
237	Mega Man 3	mega_man/mega_man_3/cover.jpg	mega_man/mega_man_3/logo.jpeg	mega_man/mega_man_3/back.jpg	1990-09-28	\N	PAL-ES	150	1	Rockman 3: El fin del Dr. Wily!? (jap)	\N	NOT_PLAYED	2024-08-24 11:40:06.394+02	2024-08-24 11:41:11.858+02	98	105	#0400f8	https://es.wikipedia.org/wiki/Mega_Man_3	https://www.youtube.com/embed/POAz4qmw_So	\N
234	Dr. Mario	mario/dr_mario/cover.jpg	mario/dr_mario/logo.png	mario/dr_mario/back.jpg	1990-07-27	76	PAL-ES	35	\N	Vs. Dr. Mario (Arcade)	\N	PLAYED	2024-08-24 10:43:33.687+02	2024-08-24 10:45:23.864+02	14	149	#ee1c25	https://es.wikipedia.org/wiki/Dr._Mario	https://www.youtube.com/embed/IHXdtKEHDNU	\N
235	Final Lap 2	final_lap/final_lap_2/cover.jpg	final_lap/final_lap_2/logo.jpg	final_lap/final_lap_2/back.jpg	1990-08-01	\N	\N	\N	1-8	\N	\N	NOT_PLAYED	2024-08-24 10:55:22.612+02	2024-08-24 10:56:05.097+02	102	109	\N	https://es.wikipedia.org/wiki/Final_Lap_2	https://www.youtube.com/embed/pKlUJFuvSik	\N
236	Wing Commander	wing_commander/wing_commander/cover.jpg	wing_commander/wing_commander/logo.png	wing_commander/wing_commander/back.jpg	1990-09-26	\N	GLOBAL	50	1	\N	\N	NOT_PLAYED	2024-08-24 11:21:39.542+02	2024-08-24 11:23:48.403+02	137	150	\N	https://es.wikipedia.org/wiki/Wing_Commander	https://www.youtube.com/embed/mfRvCSBD4q0	Wing Commander:Secret Missions\nWing Commander:Secret Missions 2
238	Columns	columns/columns/cover.jpg	columns/columns/logo.jpg	columns/columns/back.jpg	1990-03-10	\N	PAL-EUR	25	1-2	\N	\N	COMPLETED	2024-08-24 12:07:00.548+02	2024-08-24 12:07:41.619+02	138	151	\N	https://es.wikipedia.org/wiki/Columns	https://www.youtube.com/embed/0p5yzwNA_Ls	\N
240	Super Mario World	mario/super_mario_world/cover.jpg	mario/super_mario_world/logo.png	mario/super_mario_world/back.jpg	1990-11-21	95	PAL-ES	100	1 (2 alternando)	Super Mario World: Super Mario Bros. 4 (jp)	\N	PLAYED	2024-08-25 10:53:38.042+02	2024-08-25 11:07:58.048+02	14	153	#ee1c25	https://es.wikipedia.org/wiki/Super_Mario_World	https://www.youtube.com/embed/3Tc_Ek0ASSA	\N
241	F-Zero	f-zero/f-zero/cover.jpg	f-zero/f-zero/logo.jpg	f-zero/f-zero/back.jpg	1990-11-21	80	PAL-ES	150	1	\N	\N	PLAYED	2024-08-25 11:56:10.031+02	2024-08-25 11:57:11.237+02	140	154	\N	https://es.wikipedia.org/wiki/F-Zero_(videojuego)	https://www.youtube.com/embed/BIe4AvKLSa4	\N
242	Dragon Quest IV	dragon_quest/dragon_quest_iv/cover.jpg	dragon_quest/dragon_quest_iv/logo.png	dragon_quest/dragon_quest_iv/back.jpg	1990-02-11	\N	NTSC	350	1	Dragon Warrior IV (USA)	\N	NOT_PLAYED	2024-08-25 12:58:44.868+02	2024-08-25 13:00:11.395+02	76	81	#af382f	https://es.wikipedia.org/wiki/Dragon_Quest_IV:_Cap%C3%ADtulos_de_los_Elegidos	https://www.youtube.com/embed/2HukXrlEwk8	\N
243	Final Fantasy III	final_fantasy/final_fantasy_iii/cover.jpg	final_fantasy/final_fantasy_iii/logo.jpg	final_fantasy/final_fantasy_iii/back.jpg	1990-04-27	\N	NTSC-J	50	1	\N	\N	NOT_PLAYED	2024-08-25 13:10:52.279+02	2024-08-25 13:11:42.344+02	99	106	#5499b5	https://es.wikipedia.org/wiki/Final_Fantasy_III	https://www.youtube.com/embed/T9F8jlUcMx0	\N
244	Magic Sword	magic_sword/cover.png	magic_sword/logo.jpg	magic_sword/back.jpg	1990-06-01	\N	PAL-ES	160	1-2	\N	\N	NOT_PLAYED	2024-08-25 13:24:49.439+02	2024-08-25 13:24:49.439+02	\N	\N	\N	https://es.wikipedia.org/wiki/Magic_Sword_(videojuego)	https://www.youtube.com/embed/63oFgwnruxQ	\N
246	Super Pang	pang/super_pang/cover.jpg	pang/super_pang/logo.png	pang/super_pang/back.jpg	1990-09-01	70	PAL-EUR	150	1-2	Super Buster Bros. (USA)	\N	PLAYED	2024-08-25 13:50:42.113+02	2024-08-25 13:51:43.619+02	141	155	\N	https://es.wikipedia.org/wiki/Super_Pang	https://www.youtube.com/embed/tyM7VmChIWU	\N
247	World Cup Italia '90	world_cup_italia_90/cover.png	world_cup_italia_90/logo.png	world_cup_italia_90/back.jpeg	1990-11-02	44	PAL-EUR	10	1-2	World Championship Soccer (USA)	\N	COMPLETED	2024-08-26 15:16:51.081+02	2024-08-26 15:16:51.081+02	\N	\N	\N	https://en.wikipedia.org/wiki/World_Cup_Italia_%2790	https://www.youtube.com/embed/BjnrcciyM_s	\N
259	Digital Devil Story: Megami Tensei	shin_megami_tensei/digital_devil_story_megami_tensei/cover.png	shin_megami_tensei/digital_devil_story_megami_tensei/logo.png	shin_megami_tensei/digital_devil_story_megami_tensei/back.jpg	1987-09-11	\N	NTSC-J	350	1	\N	\N	NOT_PLAYED	2024-08-28 17:38:02.685+02	2024-08-28 17:50:38.849+02	143	159	\N	https://es.wikipedia.org/wiki/Digital_Devil_Story:_Megami_Tensei	https://www.youtube.com/embed/4rrsuR-_94A	\N
125	Hang-On	hang_on/hang_on/cover.jpeg	hang_on/hang_on/logo.png	hang_on/hang_on/back.jpg	1985-07-02	77	PAL-EUR	20	1	\N	\N	PLAYED	2024-07-12 09:21:18.645+02	2024-08-26 15:27:15.217+02	68	72	\N	https://es.wikipedia.org/wiki/Hang-On	https://www.youtube.com/embed/TopLKeDqYhw	\N
248	Super Hang-On	hang_on/super_hang_on/cover.jpg	hang_on/super_hang_on/logo.jpg	hang_on/super_hang_on/back.jpg	1987-04-04	\N	PAL-EUR	18	1	\N	\N	NOT_PLAYED	2024-08-26 15:25:45.768+02	2024-08-26 15:27:51.239+02	68	72	\N	https://es.wikipedia.org/wiki/Super_Hang-On	https://www.youtube.com/embed/K1RrT6sYeoc	\N
249	The Revenge of Shinobi	shinobi/revenge _of_shinobi/cover.jpg	shinobi/revenge _of_shinobi/logo.png	shinobi/revenge _of_shinobi/back.jpg	1989-12-02	92	PAL-EUR	25	1	The Super Shinobi (jp)	\N	PLAYED	2024-08-26 15:37:26.725+02	2024-08-26 15:38:47.4+02	104	111	\N	https://es.wikipedia.org/wiki/The_Revenge_of_Shinobi	https://www.youtube.com/embed/YIfDJJEK2yY	\N
250	The Cyber Shinobi	shinobi/cyber_shinobi/cover.jpg	shinobi/cyber_shinobi/logo.png	shinobi/cyber_shinobi/back.jpg	1990-04-01	63	PAL-EUR	25	1	Shinobi Part 2	t	NOT_PLAYED	2024-08-26 15:48:12.412+02	2024-08-26 15:48:57.838+02	104	111	\N	https://es.wikipedia.org/wiki/Cyber_Shinobi	https://www.youtube.com/embed/geODYog8lLo	\N
251	Double Dragon III: The Rosetta Stone	double_dragon/double_dragon_iii/cover.jpg	double_dragon/double_dragon_iii/logo.jpg	double_dragon/double_dragon_iii/back.jpg	1990-11-01	\N	PAL-ES	75	1-2	\N	\N	NOT_PLAYED	2024-08-26 16:04:08.856+02	2024-08-26 16:05:23.425+02	89	95	\N	https://es.wikipedia.org/wiki/Double_Dragon_III:_The_Rosetta_Stone	https://www.youtube.com/embed/kvadjk-srWg	\N
252	The NewZealand Story	the_newzealand_story/cover.jpg	the_newzealand_story/logo.png	the_newzealand_story/back.jpg	1988-09-01	\N	PAL-EUR	90	1 (2 alternando)	Kiwi Kraze: A Bird-Brained Adventure! (USA)	\N	NOT_PLAYED	2024-08-26 16:55:19.462+02	2024-08-26 16:55:19.462+02	\N	\N	\N	https://es.wikipedia.org/wiki/The_New_Zealand_Story	https://www.youtube.com/embed/luvw39ppu4c	\N
253	Ghostbusters	ghostbusters/ghostbusters_90/cover.jpg	ghostbusters/ghostbusters_90/logo.png	ghostbusters/ghostbusters_90/back.jpg	1990-06-29	77	PAL-EUR	90	1	\N	\N	NOT_PLAYED	2024-08-27 16:13:48.799+02	2024-08-27 16:14:37.932+02	28	156	\N	https://en.wikipedia.org/wiki/Ghostbusters_(1990_video_game)	https://www.youtube.com/embed/QGbtnFHNQBw	\N
256	Gradius III	gradius/gradius_iii/cover.jpg	gradius/gradius_iii/logo.png	gradius/gradius_iii/back.jpg	1989-12-11	77	NTSC	65	1 (2 alternando)	\N	\N	NOT_PLAYED	2024-08-28 15:54:13.557+02	2024-08-28 15:55:33.525+02	39	40	\N	https://es.wikipedia.org/wiki/Gradius_III	https://www.youtube.com/embed/KMf-pNBCG_4	\N
254	Batman	batman/batman_90/cover.jpg	batman/batman_90/logo.jpg	batman/batman_90/back.jpg	1990-07-27	77	PAL-EUR	70	1	Batman: The Video Game (USA)	\N	NOT_PLAYED	2024-08-27 17:01:09.933+02	2024-08-27 17:01:44.079+02	87	157	#505c7c	https://es.wikipedia.org/wiki/Batman_(Sega_Mega_Drive)	https://www.youtube.com/embed/b8t0hv4ACJM	\N
255	Final Fantasy Legend II	saga/the_final_fantasy_legend_ii/cover.png	saga/the_final_fantasy_legend_ii/logo.jpg	saga/the_final_fantasy_legend_ii/back.jpg	1990-12-14	\N	NTSC	130	1	SaGa 2: Hihou Densetsu	\N	NOT_PLAYED	2024-08-27 17:15:06.647+02	2024-08-27 17:16:06.671+02	134	142	\N	https://en.wikipedia.org/wiki/Final_Fantasy_Legend_II	https://www.youtube.com/embed/O8TUj3J9pQQ	\N
260	Digital Devil Story: Megami Tensei II	shin_megami_tensei/digital_devil_story_megami_tensei_ii/cover.jpg	shin_megami_tensei/digital_devil_story_megami_tensei_ii/logo.png	shin_megami_tensei/digital_devil_story_megami_tensei_ii/back.jpg	1990-04-06	\N	NTSC-J	80	1	\N	\N	NOT_PLAYED	2024-08-28 17:57:01.585+02	2024-08-28 17:58:22.72+02	143	159	\N	https://en.wikipedia.org/wiki/Digital_Devil_Story:_Megami_Tensei_II	https://www.youtube.com/embed/EHR4UFHvzVs	\N
257	Castle of Illusion Starring Mickey Mouse	mickey_mouse_&_friends/castle_of_illusion/cover.jpg	mickey_mouse_&_friends/castle_of_illusion/logo.jpg	mickey_mouse_&_friends/castle_of_illusion/back.jpg	1990-11-21	91	PAL-EUR	25	1	\N	\N	NOT_PLAYED	2024-08-28 16:32:52.012+02	2024-08-28 16:36:29.567+02	142	158	#f20505	https://es.wikipedia.org/wiki/Castle_of_Illusion_Starring_Mickey_Mouse	https://www.youtube.com/embed/eueZcpay-lQ	\N
261	Rainbow Islands: Bubble Bobble 2	bubble_bobble/rainbow_islands_bubble_bobble_2/cover.jpg	bubble_bobble/rainbow_islands_bubble_bobble_2/logo.jpg	bubble_bobble/rainbow_islands_bubble_bobble_2/back.jpg	1987-10-01	\N	PAL-EUR	75	1 (2 alternando)	Rainbow Islands: The Story of Bubble Bobble 2 (Arcade)	\N	NOT_PLAYED	2024-08-29 15:40:00.55+02	2024-08-29 15:40:46.952+02	77	83	\N	https://es.wikipedia.org/wiki/Rainbow_Islands:_The_Story_of_Bubble_Bobble_2	https://www.youtube.com/embed/rZG3gNE4ONY	\N
258	R-Type II	r-type/r-type_ii/cover.jpg	r-type/r-type_ii/logo.png	r-type/r-type_ii/back.jpg	1989-12-01	\N	PAL-EUR	300	1	\N	\N	NOT_PLAYED	2024-08-28 16:46:57.771+02	2024-08-28 16:48:40.478+02	91	97	\N	https://es.wikipedia.org/wiki/R-Type_II	https://www.youtube.com/embed/ooFRvOjAXHk	\N
262	Speedball 2	speedball/speedball_2/cover.jpg	speedball/speedball_2/logo.png	speedball/speedball_2/back.jpg	1990-01-01	\N	PAL-EUR	25	1-2	Speedball 2: Brutal Deluxe (PC)	\N	NOT_PLAYED	2024-08-29 15:55:25.113+02	2024-08-29 15:55:40.212+02	117	124	\N	https://en.wikipedia.org/wiki/Speedball_2:_Brutal_Deluxe	https://www.youtube.com/embed/ry_qLPOgIR8	\N
263	RoboCop 2	robocop/robocop_2/cover.png	robocop/robocop_2/logo.png	robocop/robocop_2/back.jpg	1990-11-01	84	PAL-EUR	75	1	\N	\N	NOT_PLAYED	2024-08-29 16:11:12.657+02	2024-08-29 16:12:46.162+02	114	121	\N	https://es.wikipedia.org/wiki/RoboCop_2_(videojuego)	https://www.youtube.com/embed/u7QfYdw4FZs	\N
264	Midnight Resistance	midnight_resistance/cover.jpg	midnight_resistance/logo.jpg	midnight_resistance/back.jpg	1989-10-01	\N	GLOBAL	20	1-2	\N	\N	NOT_PLAYED	2024-08-29 16:23:01.205+02	2024-08-29 16:23:01.205+02	\N	\N	\N	https://es.wikipedia.org/wiki/Midnight_Resistance	https://www.youtube.com/embed/v2o3MzMAsBY	\N
265	Shadow of the Beast II	shadow_of_the_beast/shadow_of_the_beast_ii/cover.jpg	shadow_of_the_beast/shadow_of_the_beast_ii/logo.png	shadow_of_the_beast/shadow_of_the_beast_ii/back.jpg	1990-01-01	\N	GLOBAL	40	1	\N	\N	NOT_PLAYED	2024-08-29 16:33:44.664+02	2024-08-29 16:33:59.761+02	132	140	\N	https://en.wikipedia.org/wiki/Shadow_of_the_Beast_II	https://www.youtube.com/embed/XEoA6Fq8byA	\N
266	John Madden Football	madden_nfl/madden_90/cover.jpg	madden_nfl/madden_90/logo.jpg	madden_nfl/madden_90/back.jpg	1990-11-01	\N	PAL-EUR	6	1-2	\N	\N	NOT_PLAYED	2024-08-29 16:50:22.296+02	2024-08-29 16:51:09.777+02	108	160	\N	https://en.wikipedia.org/wiki/John_Madden_Football_(1990_video_game)	https://www.youtube.com/embed/-ZR7hiRPjwY	\N
267	Rick Dangerous	rick_dangerous/rick_dangerous/cover.jpg	rick_dangerous/rick_dangerous/logo.png	rick_dangerous/rick_dangerous/back.jpg	1989-01-01	74	GLOBAL	20	\N	\N	\N	NOT_PLAYED	2024-08-29 17:10:12.05+02	2024-08-29 17:10:50.121+02	144	161	\N	https://es.wikipedia.org/wiki/Rick_Dangerous#Rick_Dangerous	https://www.youtube.com/embed/17Bs9QJ8aYY	\N
268	Rick Dangerous 2	rick_dangerous/rick_dangerous_2/cover.jpg	rick_dangerous/rick_dangerous_2/logo.png	rick_dangerous/rick_dangerous_2/back.jpg	1990-01-01	\N	GLOBAL	40	1	\N	\N	NOT_PLAYED	2024-08-29 17:18:24.384+02	2024-08-29 17:19:34.049+02	144	161	\N	https://es.wikipedia.org/wiki/Rick_Dangerous#Rick_Dangerous_2	https://www.youtube.com/embed/XWUBItlnVz8	\N
269	Kick Off 2	kick_off/kick_off_2/cover.jpg	kick_off/kick_off_2/logo.png	kick_off/kick_off_2/back.jpg	1990-01-01	\N	GLOBAL	15	1-2	\N	\N	NOT_PLAYED	2024-08-29 17:26:35.614+02	2024-08-29 17:27:24.494+02	133	141	\N	https://en.wikipedia.org/wiki/Kick_Off_(series)#Kick_Off_2	https://www.youtube.com/embed/w-xRYId9_NI	\N
270	Ninja Gaiden II: The Dark Sword of Chaos	ninja_gaiden/ninja_gaiden_ii/cover.jpg	ninja_gaiden/ninja_gaiden_ii/logo.png	ninja_gaiden/ninja_gaiden_ii/back.jpg	1990-04-06	\N	PAL-ES	200	1	Shadow Warriors II: The Dark Sword of Chaos (EUR)	\N	NOT_PLAYED	2024-08-29 20:57:36.836+02	2024-08-29 20:57:53.601+02	113	120	\N	https://es.wikipedia.org/wiki/Ninja_Gaiden_II:_The_Dark_Sword_of_Chaos	https://www.youtube.com/embed/lQ3_JgxZH-Y	\N
271	Loom	loom/cover.jpg	loom/logo.jpg	loom/back.jpg	1990-05-01	\N	GLOBAL	200	1	\N	\N	NOT_PLAYED	2024-08-29 21:14:09.377+02	2024-08-29 21:14:09.377+02	\N	\N	\N	https://es.wikipedia.org/wiki/Loom	https://www.youtube.com/embed/7o2elJLEWA8	\N
272	PGA Tour Golf	pga_tour/pga_tour_golf/cover.jpg	pga_tour/pga_tour_golf/logo.png	pga_tour/pga_tour_golf/back.jpg	1990-11-01	87	PAL-EUR	10	1-4	\N	\N	NOT_PLAYED	2024-08-30 08:05:49.042+02	2024-08-30 08:06:56.398+02	145	162	\N	https://en.wikipedia.org/wiki/PGA_Tour_Golf	https://www.youtube.com/embed/aAQDRc8H8Wg	\N
273	Michael Jackson's Moonwalker	michael_jackson_moonwalker/cover.jpg	michael_jackson_moonwalker/logo.jpg	michael_jackson_moonwalker/back.jpg	1990-08-24	84	PAL-EUR	80	1	\N	\N	NOT_PLAYED	2024-08-30 09:00:58.716+02	2024-08-30 09:00:58.716+02	\N	\N	\N	https://es.wikipedia.org/wiki/Michael_Jackson%27s_Moonwalker	https://www.youtube.com/embed/FBmy9c-Ag7E	\N
274	Famicom Detective Club: The Missing Heir	famicom_detective_club/the_missing_heir/cover.jpg	famicom_detective_club/the_missing_heir/logo.png	famicom_detective_club/the_missing_heir/back.jpg	1988-04-27	\N	NTSC-J	12	1	\N	\N	NOT_PLAYED	2024-08-30 09:27:16.243+02	2024-08-30 09:28:45.497+02	146	163	\N	https://es.wikipedia.org/wiki/Famicom_Detective_Club#The_Missing_Heir	https://www.youtube.com/embed/5gPgeVBeBYU	\N
275	Famicom Detective Club Part II: The Girl Who Stands Behind	famicom_detective_club/The_Girl_Who_Stands_Behind/cover.jpg	famicom_detective_club/The_Girl_Who_Stands_Behind/logo.png	famicom_detective_club/The_Girl_Who_Stands_Behind/back.jpg	1989-05-23	\N	NTSC-J	5	1	\N	\N	NOT_PLAYED	2024-08-30 09:35:15.678+02	2024-08-30 09:36:07.593+02	146	163	\N	https://es.wikipedia.org/wiki/Famicom_Detective_Club#The_Girl_Who_Stands_Behind	https://www.youtube.com/embed/CrU3U8l9Ua8	\N
278	Neverwinter Nights	goldern_box_dungeon_&_dragons/neverwinter_nights/cover.jpg	goldern_box_dungeon_&_dragons/neverwinter_nights/logo.jpg	goldern_box_dungeon_&_dragons/neverwinter_nights/back.jpg	1991-03-01	\N	GLOBAL	600	Online	\N	\N	NOT_PLAYED	2024-08-31 14:05:33.129+02	2024-08-31 14:07:02.735+02	149	165	\N	https://en.wikipedia.org/wiki/Neverwinter_Nights_(1991_video_game)	https://www.youtube.com/embed/WwFv_LerIAg	\N
276	Street Fighter II	street_fighter/street_fighter_ii/cover.jpg	street_fighter/street_fighter_ii/logo.jpg	street_fighter/street_fighter_ii/back.jpg	1991-03-01	94	PAL-ES	120	1-2	Street Fighter II: The World Warrior (Arcade)	\N	COMPLETED	2024-08-30 13:34:55.695+02	2024-08-30 13:35:26.633+02	95	101	#ff7600	https://es.wikipedia.org/wiki/Street_Fighter_II:_The_World_Warrior	https://www.youtube.com/embed/xI284D4y1q4	\N
277	Lemmings	lemmings/lemmings/cover.jpg	lemmings/lemmings/logo.jpg	lemmings/lemmings/back.jpg	1991-02-14	83	PAL-EUR	20	\N	\N	t	PLAYED	2024-08-31 11:40:49.785+02	2024-08-31 11:43:11.75+02	147	164	\N	https://es.wikipedia.org/wiki/Lemmings	https://www.youtube.com/embed/lDuhw6y2AiI	\N
355	Puyo Puyo	puyo_puyo/puyo_puyo/cover.jpg	puyo_puyo/puyo_puyo/logo.png	puyo_puyo/puyo_puyo/back.jpg	1991-10-25	\N	NTSC-J	25	1-2	\N	\N	NOT_PLAYED	2024-09-12 16:22:53.342+02	2024-09-12 16:24:31.796+02	175	200	\N	https://es.wikipedia.org/wiki/Puyo_Puyo	https://www.youtube.com/embed/nyYFwOJQUuo	\N
280	Starblade	starblade/cover.jpg	starblade/logo.jpg	starblade/back.jpg	1991-09-01	\N	\N	\N	1	\N	\N	NOT_PLAYED	2024-09-01 10:26:16.061+02	2024-09-01 10:26:16.061+02	\N	\N	\N	https://es.wikipedia.org/wiki/Starblade	https://www.youtube.com/embed/AEeLaDga56A	\N
281	Road Rash	road_rash/road_rash/cover.jpg	road_rash/road_rash/logo.png	road_rash/road_rash/back.jpg	1991-09-01	91	PAL-EUR	25	1-2	\N	\N	NOT_PLAYED	2024-09-01 10:42:04.066+02	2024-09-01 10:43:16.917+02	150	166	\N	https://es.wikipedia.org/wiki/Road_Rash_(videojuego_de_1991)	https://www.youtube.com/embed/OdhrDE5L7ds	\N
283	Another World	another_world/another_world/cover.jpg	another_world/another_world/logo.png	another_world/another_world/back.jpg	1991-11-01	87	PAL-EUR	35	1	Out of this World (USA)	\N	NOT_PLAYED	2024-09-01 12:40:45.117+02	2024-09-01 12:46:55.814+02	151	167	\N	https://es.wikipedia.org/wiki/Another_World	https://www.youtube.com/embed/utrxk5_PeEY	\N
282	Metroid II: Return of Samus	metroid/metroid_II/cover.jpg	metroid/metroid_II/logo.png	metroid/metroid_II/back.jpg	1991-11-08	79	PAL-ES	1000	1	\N	\N	NOT_PLAYED	2024-09-01 11:17:51.491+02	2024-09-01 11:18:53.04+02	78	84	#bf191e	https://es.wikipedia.org/wiki/Metroid_II:_Return_of_Samus	https://www.youtube.com/embed/AF1C0xZxBOw	\N
284	The Legend of Zelda: A Link to the Past	the_legend_of_zelda/a_link_to_the_past/cover.jpg	the_legend_of_zelda/a_link_to_the_past/logo.png	the_legend_of_zelda/a_link_to_the_past/back.jpg	1991-11-21	93	PAL-ES	500	1	\N	\N	PLAYED	2024-09-01 13:18:13.548+02	2024-09-01 13:23:08.013+02	73	78	#026012	https://es.wikipedia.org/wiki/The_Legend_of_Zelda:_A_Link_to_the_Past	https://www.youtube.com/embed/Dq_gUziNZUk	\N
285	Fatal Fury: King of Fighters	fatal_fury/fatal_fury/cover.png	fatal_fury/fatal_fury/logo.png	fatal_fury/fatal_fury/back.jpg	1991-11-25	85	PAL-EUR	40	1-2	Garō Densetsu (Hungry Wolf Legend) (jp)	\N	NOT_PLAYED	2024-09-02 16:02:09.182+02	2024-09-02 16:04:31.054+02	152	168	\N	https://es.wikipedia.org/wiki/Fatal_Fury:_King_of_Fighters	https://www.youtube.com/embed/MNby0BM-VGQ	\N
286	Monkey Island 2: LeChuck's Revenge	monkey_island/monkey_island_2/cover.jpg	monkey_island/monkey_island_2/logo.png	monkey_island/monkey_island_2/back.jpg	1991-12-01	90	GLOBAL	200	1	\N	\N	NOT_PLAYED	2024-09-02 16:15:02.607+02	2024-09-02 16:15:25.001+02	139	152	\N	https://es.wikipedia.org/wiki/Monkey_Island_2:_LeChuck%27s_Revenge	https://www.youtube.com/embed/sXRMEz6n5SM	\N
287	Super Castlevania IV	castlevania/Super_Castlevania_IV/cover.jpg	castlevania/Super_Castlevania_IV/logo.png	castlevania/Super_Castlevania_IV/back.jpg	1991-10-31	84	PAL-ES	300	1	Devil's Castle Dracula (jp)	\N	PLAYED	2024-09-02 17:06:25.863+02	2024-09-02 17:06:42.734+02	82	88	\N	https://es.wikipedia.org/wiki/Super_Castlevania_IV	https://www.youtube.com/embed/jd7P7niYimk	\N
279	Final Fantasy IV	final_fantasy/final_fantasy_iv/cover.jpg	final_fantasy/final_fantasy_iv/logo.jpg	final_fantasy/final_fantasy_iv/back.jpg	1991-07-19	89	NTSC	250	1	Final Fantasy II (USA)	\N	NOT_PLAYED	2024-09-01 10:10:12.056+02	2024-09-05 17:58:08.7+02	99	106	#5499b5	https://es.wikipedia.org/wiki/Final_Fantasy_IV	https://www.youtube.com/embed/QxodM4uWaC8	\N
288	Castlevania: The Adventure	castlevania/castlevania_the_adventure/cover.jpg	castlevania/castlevania_the_adventure/logo.jpg	castlevania/castlevania_the_adventure/back.jpg	1989-10-27	55	PAL-ES	300	1	Dracula Legend (jp)	\N	NOT_PLAYED	2024-09-02 17:22:24.33+02	2024-09-02 17:31:18.58+02	82	169	\N	https://es.wikipedia.org/wiki/Castlevania:_The_Adventure	https://www.youtube.com/embed/xgGcNWhRv24	\N
289	Castlevania II: Belmont's Revenge	castlevania/castlevania_ii_belmont_revenge/cover.jpg	castlevania/castlevania_ii_belmont_revenge/logo.jpg	castlevania/castlevania_ii_belmont_revenge/back.jpg	1991-07-12	86	PAL-ES	500	1	Dracula Legend II (jp)	\N	NOT_PLAYED	2024-09-02 17:43:54.987+02	2024-09-02 17:44:50.588+02	82	169	\N	https://es.wikipedia.org/wiki/Castlevania_II:_Belmont%27s_Revenge	https://www.youtube.com/embed/dSaorGLcjrc	\N
298	Sunset Riders	sunset_riders/cover.jpg	sunset_riders/logo.png	sunset_riders/back.jpg	1991-09-04	83	PAL-EUR	180	1-2	\N	\N	NOT_PLAYED	2024-09-05 15:52:45.262+02	2024-09-05 15:52:45.262+02	\N	\N	\N	https://es.wikipedia.org/wiki/Sunset_Riders	https://www.youtube.com/embed/0aL-U_fMPLo	\N
290	Mega Man: Dr. Wily's Revenge	mega_man/mega_man_dr_willy_revenge/cover.jpg	mega_man/mega_man_dr_willy_revenge/logo.jpg	mega_man/mega_man_dr_willy_revenge/back.jpg	1991-07-26	69	PAL-ES	200	1	Rockman World (jp)	\N	NOT_PLAYED	2024-09-03 16:27:13.404+02	2024-09-03 16:27:45.351+02	98	170	#0400f8	https://es.wikipedia.org/wiki/Mega_Man:_Dr._Wily%27s_Revenge	https://www.youtube.com/embed/NqC_1GuY3dw	\N
291	Mega Man 4	mega_man/mega_man_4/cover.jpg	mega_man/mega_man_4/logo.png	mega_man/mega_man_4/back.jpg	1991-12-06	84	PAL-ES	200	1	Rockman 4: A New Ambition!! (jp)	\N	NOT_PLAYED	2024-09-03 16:38:01.043+02	2024-09-03 16:39:10.221+02	98	105	#0400f8	https://es.wikipedia.org/wiki/Mega_Man_4	https://www.youtube.com/embed/l3GI5ki51aU	\N
292	Mega Man II	mega_man/mega_man_ii/cover.png	mega_man/mega_man_ii/logo.jpg	mega_man/mega_man_ii/back.jpg	1991-12-20	69	PAL-ES	200	1	Rockman World 2 (jp)	\N	NOT_PLAYED	2024-09-03 16:54:12.796+02	2024-09-03 16:57:55.104+02	98	170	#0400f8	https://es.wikipedia.org/wiki/Mega_Man_II_(Game_Boy)	https://www.youtube.com/embed/YziB-46VblA	\N
293	Tecmo Bowl	tecmo_bowl/tecmo_bowl/cover.jpg	tecmo_bowl/tecmo_bowl/logo.png	tecmo_bowl/tecmo_bowl/back.jpg	1987-12-01	\N	NTSC	35	1-2	\N	\N	NOT_PLAYED	2024-09-03 17:23:40.729+02	2024-09-03 17:24:29.203+02	153	171	\N	https://es.wikipedia.org/wiki/Tecmo_Bowl	https://www.youtube.com/embed/_9vp9TkSSWw	\N
294	Tecmo Super Bowl	tecmo_bowl/tecmo_super_bowl/cover.png	tecmo_bowl/tecmo_super_bowl/logo.jpg	tecmo_bowl/tecmo_super_bowl/back.jpg	1991-12-13	\N	NTSC	80	1-2	\N	\N	NOT_PLAYED	2024-09-03 17:34:41.121+02	2024-09-03 17:35:59.989+02	153	171	\N	https://www.youtube.com/watch?v=BxY8KcmGeD4	https://es.wikipedia.org/wiki/Tecmo_Super_Bowl	\N
295	Civilization	civilization/civilization/cover.png	civilization/civilization/logo.png	civilization/civilization/back.jpg	1991-09-01	\N	GLOBAL	100	1	Sid Meier's Civilization	\N	NOT_PLAYED	2024-09-04 15:29:51.609+02	2024-09-04 15:30:40.483+02	154	172	\N	https://es.wikipedia.org/wiki/Civilization	https://www.youtube.com/embed/GE3t_WuoSwE	\N
296	Super Ghouls 'n Ghosts	ghosts_n_goblins/super_ghouls_n_ghosts/cover.jpg	ghosts_n_goblins/super_ghouls_n_ghosts/logo.jpg	ghosts_n_goblins/super_ghouls_n_ghosts/back.jpg	1991-10-04	88	PAL-ES	150	1	Chōmakaimura (Super Demon World Village) (jp)	\N	NOT_PLAYED	2024-09-04 16:13:45.778+02	2024-09-04 16:15:25.495+02	67	71	\N	https://es.wikipedia.org/wiki/Super_Ghouls_%27n_Ghosts	https://www.youtube.com/embed/Bzlu9xJ9ARw	\N
297	Battletoads	battletoads/battletoads/cover.jpg	battletoads/battletoads/logo.png	battletoads/battletoads/back.jpg	1991-06-01	90	PAL-EUR	130	1-2	\N	\N	NOT_PLAYED	2024-09-04 17:21:48.974+02	2024-09-04 17:21:48.974+02	\N	\N	\N	https://es.wikipedia.org/wiki/Battletoads	https://www.youtube.com/embed/iqyeq7iC5YY	\N
299	Duke Nukem	duke_nukem/duke_nukem/cover.jpg	duke_nukem/duke_nukem/logo.jpg	duke_nukem/duke_nukem/back.jpg	1991-07-01	\N	GLOBAL	\N	1	Duke Nukum (temporal)	\N	NOT_PLAYED	2024-09-05 17:11:49.18+02	2024-09-05 17:12:46.185+02	156	174	\N	https://es.wikipedia.org/wiki/Duke_Nukem_(videojuego)	https://www.youtube.com/embed/kYzZcko3F50	\N
300	Streets of Rage	streets_of_rage/streets_of_rage/cover.jpg	streets_of_rage/streets_of_rage/logo.png	streets_of_rage/streets_of_rage/back.jpg	1991-08-02	90	PAL-EUR	50	1-2	Bare Knuckle: Furious Iron Fist (jp)	\N	PLAYED	2024-09-05 17:35:59.389+02	2024-09-05 17:37:54.482+02	157	175	\N	https://es.wikipedia.org/wiki/Streets_of_Rage_(videojuego)	https://www.youtube.com/embed/UrVMYd7MUzM	\N
302	Heimdall	heimdall/heimdall/cover.jpg	heimdall/heimdall/logo.jpg	heimdall/heimdall/back.jpg	1991-01-01	\N	GLOBAL	31	1	\N	\N	NOT_PLAYED	2024-09-06 08:47:56.863+02	2024-09-06 08:49:22.876+02	158	176	\N	https://en.wikipedia.org/wiki/Heimdall_(video_game)	https://www.youtube.com/embed/opF8L-bCays	\N
303	Toki	toki/toki/cover.jpg	toki/toki/logo.png	toki/toki/back.jpg	1989-12-08	\N	PAL-EUR	30	1-2	JuJu Densetsu (jp)	\N	NOT_PLAYED	2024-09-06 09:04:15.244+02	2024-09-06 09:04:15.244+02	\N	\N	\N	https://es.wikipedia.org/wiki/Toki_(videojuego)	https://www.youtube.com/embed/3Px16r5VKyk	\N
304	Raiden	raiden/raiden/cover.jpg	raiden/raiden/logo.png	raiden/raiden/back.jpg	1990-04-01	84	NTSC	150	1	\N	\N	NOT_PLAYED	2024-09-06 09:29:03.673+02	2024-09-06 09:30:03.169+02	159	177	\N	https://es.wikipedia.org/wiki/Raiden_(videojuego)	https://www.youtube.com/embed/KeajSN7g9ro	\N
305	Darius	darius/darius/cover.jpg	darius/darius/logo.png	darius/darius/back.jpg	1987-02-01	\N	NTSC-J	50	1-2	Super Darius (consolas)	\N	NOT_PLAYED	2024-09-06 10:25:04.031+02	2024-09-06 10:26:06.401+02	160	178	\N	https://es.wikipedia.org/wiki/Darius_(videojuego)	https://www.youtube.com/embed/dw2PMdIpHdE	\N
306	Darius II	darius/darius_ii/cover.jpg	darius/darius_ii/logo.png	darius/darius_ii/back.jpg	1989-09-01	\N	NTSC	60	1-2	Sagaia (USA)	\N	NOT_PLAYED	2024-09-06 10:34:56.835+02	2024-09-06 10:36:24.177+02	160	178	\N	https://es.wikipedia.org/wiki/Darius_II	https://www.youtube.com/embed/ezpkyTjXBBM	\N
307	Darius Twin	darius/darius_twin/cover.jpg	darius/darius_twin/logo.png	darius/darius_twin/back.jpg	1991-03-29	75	PAL-ES	250	1-2	\N	\N	NOT_PLAYED	2024-09-06 10:47:16.131+02	2024-09-06 10:47:50.863+02	160	179	\N	https://es.wikipedia.org/wiki/Darius_Twin	https://www.youtube.com/embed/9OjfHqxdNjA	\N
308	Mercs	wolf_of_the_battlefield/mercs/cover.jpg	wolf_of_the_battlefield/mercs/logo.jpg	wolf_of_the_battlefield/mercs/back.jpg	1990-03-01	81	PAL-EUR	40	1	Wolf of the Battlefield II (jp)	\N	NOT_PLAYED	2024-09-06 10:56:18.786+02	2024-09-06 10:57:27.792+02	33	34	\N	https://es.wikipedia.org/wiki/Mercs	https://www.youtube.com/embed/_2bR0dP_zb4	\N
309	Turbo OutRun	outrun/turbo_outrun/cover.jpg	outrun/turbo_outrun/logo.jpg	outrun/turbo_outrun/back.jpg	1989-02-11	\N	PAL-EUR	50	1	\N	\N	NOT_PLAYED	2024-09-06 11:10:23.786+02	2024-09-06 11:23:38.429+02	80	86	\N	https://es.wikipedia.org/wiki/Turbo_Out_Run	https://www.youtube.com/embed/oWL_jA67fZg	\N
310	OutRun 3-D	outrun/outrun_3d/cover.jpg	outrun/outrun_3d/logo.png	outrun/outrun_3d/back.jpg	1988-09-01	\N	PAL-EUR	130	1	\N	\N	NOT_PLAYED	2024-09-06 11:22:27.108+02	2024-09-06 11:23:07.314+02	80	86	\N	https://es.wikipedia.org/wiki/Out_Run_3-D	https://www.youtube.com/embed/D0r0QlITxMk	\N
301	Sonic the Hedgehog (8 bits)	sonic/sonic_8bits/cover.jpg	sonic/sonic_8bits/logo.png	sonic/sonic_8bits/back.jpg	1991-10-25	\N	PAL-EUR	20	1	\N	t	NOT_PLAYED	2024-09-05 17:53:34.22+02	2024-09-16 17:03:54.99+02	1	3	#17569b	https://es.wikipedia.org/wiki/Sonic_the_Hedgehog_(videojuego_de_8_bits)	https://www.youtube.com/embed/SQPvA0OvR24	\N
311	Battle OutRun	outrun/battle_outrun/cover.jpg	outrun/battle_outrun/logo.jpg	outrun/battle_outrun/back.jpg	1989-09-04	\N	PAL-EUR	35	1	\N	\N	NOT_PLAYED	2024-09-06 11:30:32.587+02	2024-09-06 11:31:39.129+02	80	86	\N	https://es.wikipedia.org/wiki/Battle_Out_Run	https://www.youtube.com/embed/NAJsVAPMd8s	\N
312	The Simpsons	the_simpsons/the_simpsons/cover.jpg	the_simpsons/the_simpsons/logo.png	the_simpsons/the_simpsons/back.jpg	1991-03-04	\N	\N	\N	1-4	\N	\N	NOT_PLAYED	2024-09-06 13:04:16.128+02	2024-09-06 13:05:04.593+02	161	180	\N	https://es.wikipedia.org/wiki/The_Simpsons_(videojuego)	https://www.youtube.com/embed/3mZKoejwKOs	\N
313	Spider-Man	spider-man/spider-man/cover.jpg	spider-man/spider-man/logo.png	spider-man/spider-man/back.jpg	1982-11-01	\N	GLOBAL	35	1	\N	\N	NOT_PLAYED	2024-09-06 13:38:46.91+02	2024-09-06 13:39:54.945+02	162	181	#ac0202	https://es.wikipedia.org/wiki/Spider-Man_(videojuego_de_1982)	https://www.youtube.com/embed/895ek96vHHY	\N
314	Yoshi	yoshi/yoshi/cover.jpg	yoshi/yoshi/logo.png	yoshi/yoshi/back.jpg	1991-12-14	\N	PAL-ES	80	1-2	Mario & Yoshi (EUR)	\N	NOT_PLAYED	2024-09-06 16:33:50.364+02	2024-09-06 16:34:14.381+02	163	182	#6fd251	https://es.wikipedia.org/wiki/Yoshi_(videojuego)	https://www.youtube.com/embed/jJOesRDdzZs	\N
321	Lotus Turbo Challenge 2	lotus/Lotus_turbo_challenge_2/cover.jpg	lotus/Lotus_turbo_challenge_2/logo.png	lotus/Lotus_turbo_challenge_2/back.jpg	1991-01-01	\N	PAL-EUR	15	1-2	Lotus Turbo Challenge (mega drive)	\N	NOT_PLAYED	2024-09-07 12:24:17.447+02	2024-09-07 12:25:07.975+02	165	185	\N	https://es.wikipedia.org/wiki/Lotus_Turbo_Challenge_2	https://www.youtube.com/embed/uAPXIapykRE	\N
315	Mr. Goemon	ganbare_goemon/mr_goemon/cover.jpg	ganbare_goemon/mr_goemon/logo.png	ganbare_goemon/mr_goemon/back.jpg	1986-05-01	\N	GLOBAL	\N	1 (2 alternando)	\N	\N	NOT_PLAYED	2024-09-06 16:50:26.118+02	2024-09-06 16:51:24.916+02	164	183	\N	https://es.wikipedia.org/wiki/Mr._Goemon	https://www.youtube.com/embed/uy3if2RKwK8	\N
316	The Legend of the Mystical Ninja	ganbare_goemon/legend_of_the_mystical_ninja/cover.jpg	ganbare_goemon/legend_of_the_mystical_ninja/logo.png	ganbare_goemon/legend_of_the_mystical_ninja/back.jpg	1991-07-17	92	PAL-EUR	240	1-2	Ganbare Goemon 2: Kiteretsu Shōgun Magginesu (jp)	\N	NOT_PLAYED	2024-09-06 17:02:26.985+02	2024-09-06 17:03:13.329+02	164	183	\N	https://es.wikipedia.org/wiki/The_Legend_of_the_Mystical_Ninja	https://www.youtube.com/embed/4e231xwE2mg	\N
317	Final Fantasy Legend III	saga/final_fantasy_legend_iii/cover.jpg	saga/final_fantasy_legend_iii/logo.jpeg	saga/final_fantasy_legend_iii/back.jpg	1991-12-13	71	NTSC	125	1	SaGa 3: Jikuu no Hasha (jp)	\N	NOT_PLAYED	2024-09-06 17:11:47.108+02	2024-09-06 17:13:18.593+02	134	142	\N	https://es.wikipedia.org/wiki/Final_Fantasy_Legend_III	https://www.youtube.com/embed/Y5sziyAxLLk	\N
318	NES Open Tournament Golf	mario/nes_open_tournament_golf/cover.jpg	mario/nes_open_tournament_golf/logo.png	mario/nes_open_tournament_golf/back.jpg	1991-09-20	\N	PAL-ES	45	1-2	Mario Open Golf (jp)	\N	NOT_PLAYED	2024-09-07 10:43:17.884+02	2024-09-07 10:45:28.051+02	14	184	#ee1c25	https://es.wikipedia.org/wiki/NES_Open_Tournament_Golf	https://www.youtube.com/embed/R65RVmmZyKM	\N
319	Gynoug	gynoug/cover.jpg	gynoug/logo.jpg	gynoug/back.jpg	1991-01-25	77	PAL-EUR	45	1	Wings of Wor (USA)	\N	NOT_PLAYED	2024-09-07 11:00:31.32+02	2024-09-07 11:00:31.32+02	\N	\N	\N	https://es.wikipedia.org/wiki/Gynoug	https://www.youtube.com/embed/1_vKyaz5seg	\N
322	Lotus III: The Ultimate Challenge	lotus/lotus_iii_ultimate_challenge/cover.jpg	lotus/lotus_iii_ultimate_challenge/logo.jpg	lotus/lotus_iii_ultimate_challenge/back.jpg	1992-01-01	\N	PAL-EUR	20	1-2	Lotus II: R.E.C.S. (mega drive)	t	COMPLETED	2024-09-07 12:38:45.518+02	2024-09-07 12:39:45.475+02	165	185	\N	https://es.wikipedia.org/wiki/Lotus_III:_The_Ultimate_Challenge	https://www.youtube.com/embed/9vXisK-UMCA	\N
320	Lotus Esprit Turbo Challenge	lotus/lotus_esprit_turbo_challenge/cover.jpg	lotus/lotus_esprit_turbo_challenge/logo.png	lotus/lotus_esprit_turbo_challenge/back.jpg	1990-01-01	\N	GLOBAL	15	1-2	\N	\N	NOT_PLAYED	2024-09-07 12:13:45.632+02	2024-09-07 12:14:46.624+02	165	185	\N	https://es.wikipedia.org/wiki/Lotus_Esprit_Turbo_Challenge	https://www.youtube.com/embed/bRYFKskaA9k	\N
323	QuackShot	mickey_mouse_&_friends/quackshot/cover.jpg	mickey_mouse_&_friends/quackshot/logo.png	mickey_mouse_&_friends/quackshot/back.jpg	1991-12-19	89	PAL-EUR	25	1	I Love Donald Duck: Guruzia Ou no Hihou (jp)	\N	NOT_PLAYED	2024-09-07 13:43:07.029+02	2024-09-07 13:44:17.986+02	142	186	\N	https://es.wikipedia.org/wiki/QuackShot	https://www.youtube.com/embed/p2JhxUB4hoQ	\N
324	James Pond: Underwater Agent	james_pond/james_pond_underwater_agent/cover.jpg	james_pond/james_pond_underwater_agent/logo.jpg	james_pond/james_pond_underwater_agent/back.jpg	1990-12-01	74	PAL-EUR	60	1	\N	\N	NOT_PLAYED	2024-09-08 09:30:19.197+02	2024-09-08 09:31:37.919+02	166	187	\N	https://es.wikipedia.org/wiki/James_Pond	https://www.youtube.com/embed/LRBlbzJ5fsY	\N
325	James Pond 2: Codename RoboCod	james_pond/james_pond_2/cover.jpg	james_pond/james_pond_2/logo.png	james_pond/james_pond_2/back.jpg	1991-08-18	\N	PAL-EUR	20	1	Super James Pond (snes)	\N	NOT_PLAYED	2024-09-08 09:39:11.332+02	2024-09-08 09:41:08.548+02	166	187	\N	https://es.wikipedia.org/wiki/James_Pond_2	https://www.youtube.com/embed/QDjm9pt2uOA	\N
329	Micro Machines	micro_machines/micro_machines/cover.jpg	micro_machines/micro_machines/logo.png	micro_machines/micro_machines/back.jpg	1991-01-01	90	PAL-EUR	20	1-2	\N	\N	NOT_PLAYED	2024-09-08 12:01:59.903+02	2024-09-08 12:03:05.306+02	168	189	\N	https://en.wikipedia.org/wiki/Micro_Machines_(video_game)	https://www.youtube.com/embed/5ICJ3gQuyps	\N
326	Bonk's Revenge	bonk/bonk_revenge/cover.jpg	bonk/bonk_revenge/logo.jpg	bonk/bonk_revenge/back.jpg	1991-07-19	\N	NTSC	150	\N	PC Genjin 2 (jp)	\N	NOT_PLAYED	2024-09-08 09:48:02.226+02	2024-09-08 09:49:19.846+02	126	134	\N	https://es.wikipedia.org/wiki/Bonk%27s_Revenge	https://www.youtube.com/embed/TjHJnt-g2Ds	\N
327	Bonanza Bros.	bonanza_bros/cover.jpg	bonanza_bros/logo.png	bonanza_bros/back.jpg	1990-06-18	80	PAL-EUR	50	1-2	\N	t	COMPLETED	2024-09-08 10:07:09.426+02	2024-09-08 10:07:09.426+02	\N	\N	\N	https://es.wikipedia.org/wiki/Bonanza_Bros.	https://www.youtube.com/embed/EX9qBRJIOes	\N
328	ToeJam & Earl	toejam_&_earl/toejam_&_earl/cover.jpg	toejam_&_earl/toejam_&_earl/logo.png	toejam_&_earl/toejam_&_earl/back.jpg	1991-10-01	89	PAL-EUR	35	1-2	\N	\N	NOT_PLAYED	2024-09-08 11:06:57.681+02	2024-09-08 11:08:24.243+02	167	188	\N	https://en.wikipedia.org/wiki/ToeJam_%26_Earl	https://www.youtube.com/embed/29TaGhYZZlA	\N
330	Adventure Island II	adventure_island/adventure_island_ii/cover.jpg	adventure_island/adventure_island_ii/logo.png	adventure_island/adventure_island_ii/back.jpg	1991-02-01	\N	PAL-ES	100	1	Adventure Island (game boy)	\N	NOT_PLAYED	2024-09-09 15:38:58.298+02	2024-09-09 15:39:09.039+02	81	87	\N	https://es.wikipedia.org/wiki/Adventure_Island_II	https://www.youtube.com/embed/wnSygDpZNUU	\N
331	Super Adventure Island	adventure_island/super_adventure_island/cover.png	adventure_island/super_adventure_island/logo.jpg	adventure_island/super_adventure_island/back.jpg	1992-01-11	72	PAL-ES	100	1	\N	\N	NOT_PLAYED	2024-09-09 16:28:13.006+02	2024-09-09 16:28:58.57+02	81	190	\N	https://es.wikipedia.org/wiki/Super_Adventure_Island	https://www.youtube.com/embed/rJXyhLoJBNo	\N
356	Kirby's Dream Land	kirby/kirbys_dream_land/cover.jpg	kirby/kirbys_dream_land/logo.png	kirby/kirbys_dream_land/back.jpg	1992-04-27	\N	PAL-ES	100	1	\N	\N	PLAYED	2024-09-12 17:01:47.926+02	2024-09-12 17:02:36.187+02	176	201	#df6da9	https://es.wikipedia.org/wiki/Kirby%27s_Dream_Land	https://www.youtube.com/embed/i2zzwooB_NM	\N
332	Adventure Island 3	adventure_island/adventur_island_3/cover.jpg	adventure_island/adventur_island_3/logo.jpg	adventure_island/adventur_island_3/back.jpg	1992-07-31	\N	NTSC	230	1	Adventure Island II: Aliens in Paradise (Game Boy)	\N	NOT_PLAYED	2024-09-09 16:36:54.532+02	2024-09-09 16:37:54.819+02	81	87	\N	https://es.wikipedia.org/wiki/Adventure_Island_3	https://www.youtube.com/embed/UGCbrm5xXnY	\N
333	Fantasy Zone II	fantasy_zone/fantasy_zone_ii/cover.jpg	fantasy_zone/fantasy_zone_ii/logo.jpg	fantasy_zone/fantasy_zone_ii/back.jpg	1987-10-17	\N	PAL-EUR	70	1	Fantasy Zone II: The Tears of Opa-Opa (jp)	\N	NOT_PLAYED	2024-09-09 16:53:25.023+02	2024-09-09 16:54:41.581+02	105	112	\N	https://es.wikipedia.org/wiki/Fantasy_Zone_II:_The_Tears_of_Opa-Opa	https://www.youtube.com/embed/iP6EHTkr-C0	\N
334	Super Fantasy Zone	fantasy_zone/super_fantasy_zone/cover.jpg	fantasy_zone/super_fantasy_zone/logo.jpg	fantasy_zone/super_fantasy_zone/back.jpg	1992-01-14	\N	PAL-EUR	75	1	\N	\N	NOT_PLAYED	2024-09-09 17:01:13.088+02	2024-09-09 17:01:52.02+02	105	112	\N	https://es.wikipedia.org/wiki/Super_Fantasy_Zone	https://www.youtube.com/embed/s4fMmZozwJs	\N
335	Romancing SaGa	saga/romancing_saga/cover.jpg	saga/romancing_saga/logo.jpg	saga/romancing_saga/back.jpg	1992-01-28	\N	NTSC-J	25	1	\N	\N	NOT_PLAYED	2024-09-09 17:23:41.774+02	2024-09-09 17:24:56.839+02	134	191	\N	https://es.wikipedia.org/wiki/Romancing_SaGa	https://www.youtube.com/embed/-_SiH0XeWo0	\N
336	Football Frenzy	football_frenzy/cover.jpg	football_frenzy/logo.png	football_frenzy/back.jpg	1992-01-31	85	NTSC	300	1-2		\N	NOT_PLAYED	2024-09-09 17:32:48.612+02	2024-09-09 17:32:48.612+02	\N	\N	\N	https://es.wikipedia.org/wiki/Football_Frenzy	https://www.youtube.com/embed/lRHVlzNq2e4	\N
337	Soul Blazer	soul_blazer/cover.jpg	soul_blazer/logo.jpg	soul_blazer/back.jpg	1992-01-31	86	PAL-EUR	220	1	Soul Blader (jp)	\N	NOT_PLAYED	2024-09-09 17:48:15.921+02	2024-09-09 17:48:15.921+02	\N	\N	\N	https://es.wikipedia.org/wiki/Soul_Blazer	https://www.youtube.com/embed/clPT-KSffOw	\N
338	Alisia Dragoon	alisia_dragoon/cover.jpg	alisia_dragoon/logo.png	alisia_dragoon/back.jpg	1992-02-01	84	PAL-EUR	60	1	\N	\N	NOT_PLAYED	2024-09-10 15:22:07.566+02	2024-09-10 15:22:07.566+02	\N	\N	\N	https://en.wikipedia.org/wiki/Alisia_Dragoon	https://www.youtube.com/embed/ZIIRtWPYBtg	\N
339	McDonaldland	mcdonalds/mcdonaldland/cover.jpg	mcdonalds/mcdonaldland/logo.jpg	mcdonalds/mcdonaldland/back.jpg	1992-02-01	75	PAL-ES	60	1-2	M.C. Kids (USA)	\N	NOT_PLAYED	2024-09-10 16:19:53.759+02	2024-09-10 16:21:06.887+02	169	192	\N	https://es.wikipedia.org/wiki/M.C._Kids	https://www.youtube.com/embed/7nKywTkMnAs	\N
340	Star Trek: 25th Anniversary	star_trek/star_trek_25_anniversary/cover.jpg	star_trek/star_trek_25_anniversary/logo.png	star_trek/star_trek_25_anniversary/back.jpg	1992-02-01	\N	PAL-EUR	100	1	\N	\N	NOT_PLAYED	2024-09-10 16:41:58.187+02	2024-09-10 16:47:24.963+02	170	193	\N	https://es.wikipedia.org/wiki/Star_Trek_25th_Anniversary	https://www.youtube.com/embed/zH0CXmisRzo	\N
341	Tiny Toon Adventures	tiny_toon/tiny_toon_adventure/cover.jpg	tiny_toon/tiny_toon_adventure/logo.png	tiny_toon/tiny_toon_adventure/back.jpg	1991-12-01	76	PAL-EUR	55	1	\N	\N	NOT_PLAYED	2024-09-11 10:43:55.773+02	2024-09-11 10:45:03.742+02	171	194	\N	https://es.wikipedia.org/wiki/Tiny_Toon_Adventures_(videojuego)	https://www.youtube.com/embed/ZQGm0gSAVSk	\N
342	Tiny Toon Adventures: Babs' Big Break	tiny_toon/tiny_toon_babs_big_break/cover.jpg	tiny_toon/tiny_toon_babs_big_break/logo.jpg	tiny_toon/tiny_toon_babs_big_break/back.jpg	1992-02-01	74	PAL-ES	50	1	\N	\N	NOT_PLAYED	2024-09-11 10:58:15.668+02	2024-09-11 10:58:54.961+02	171	195	\N	https://es.wikipedia.org/wiki/Tiny_Toon_Adventures:_Babs%27_Big_Break	https://www.youtube.com/embed/dHvsf2Xx4tI	\N
343	Tiny Toon Adventures 2: Trouble in Wackyland	tiny_toon/tiny_toons_adventure_2_trouble/cover.jpg	tiny_toon/tiny_toons_adventure_2_trouble/logo.jpg	tiny_toon/tiny_toons_adventure_2_trouble/back.jpg	1992-11-27	68	PAL-EUR	120	1	\N	\N	NOT_PLAYED	2024-09-11 11:08:13.196+02	2024-09-11 11:08:47.636+02	171	194	\N	https://es.wikipedia.org/wiki/Tiny_Toon_Adventures_2:_Trouble_in_Wackyland	https://www.youtube.com/embed/g8B-JjzbthI	\N
344	Soccer Brawl	soccer_brawl/cover.jpg	soccer_brawl/logo.jpg	soccer_brawl/back.jpg	1992-02-14	86	NTSC	340	1-2	\N	\N	NOT_PLAYED	2024-09-11 11:17:52.927+02	2024-09-11 11:17:52.927+02	\N	\N	\N	https://es.wikipedia.org/wiki/Soccer_Brawl	https://www.youtube.com/embed/vzqEA36njwA	\N
345	Contra III: The Alien Wars	contra/contra_III_alien_wars/cover.jpg	contra/contra_III_alien_wars/logo.jpg	contra/contra_III_alien_wars/back.jpg	1992-02-28	92	PAL-ES	140	1-2	Super Probotector: Alien Rebels (EUR)	\N	NOT_PLAYED	2024-09-11 11:38:07.726+02	2024-09-11 11:39:14.521+02	88	94	\N	https://es.wikipedia.org/wiki/Contra_III:_The_Alien_Wars	https://www.youtube.com/embed/DoQBfWT4v28	\N
346	Desert Strike	strike/desert_strike/cover.jpg	strike/desert_strike/logo.png	strike/desert_strike/back.jpg	1992-03-01	91	PAL-EUR	25	1	\N	\N	NOT_PLAYED	2024-09-11 12:03:12.829+02	2024-09-11 12:05:11.012+02	172	196	\N	https://es.wikipedia.org/wiki/Desert_Strike	https://www.youtube.com/embed/RYVDt8XhTBM	\N
347	Kid Chameleon	kid_chameleon/cover.jpg	kid_chameleon/logo.jpg	kid_chameleon/back.jpg	1992-03-01	78	PAL-EUR	50	1	Chameleon Kid (jp)	\N	NOT_PLAYED	2024-09-11 12:16:03.058+02	2024-09-11 12:16:03.058+02	\N	\N	\N	https://es.wikipedia.org/wiki/Kid_Chameleon	https://www.youtube.com/embed/vcOj1JeM6Pk	\N
349	Phantasy Star III	phantasy_star/phantasy_star_iii/cover.jpg	phantasy_star/phantasy_star_iii/logo.jpg	phantasy_star/phantasy_star_iii/back.jpg	1990-04-21	86	PAL-EUR	120	1	Phantasy Star III: Generations of Doom	\N	NOT_PLAYED	2024-09-11 14:10:45.107+02	2024-09-11 14:11:01.136+02	100	107	\N	https://es.wikipedia.org/wiki/Phantasy_Star_III	https://www.youtube.com/embed/sshSGJSWpzk	\N
348	The Terminator	terminator/the_terminator/cover.jpg	terminator/the_terminator/logo.jpg	terminator/the_terminator/back.jpg	1992-02-01	78	PAL-EUR	40	\N	\N	t	NOT_PLAYED	2024-09-11 13:50:44.941+02	2024-09-11 13:54:41.446+02	173	197	\N	https://en.wikipedia.org/wiki/The_Terminator_(Sega_video_game)	https://www.youtube.com/embed/RdMVAI8pUvA	\N
350	Shining in the Darkness	shining/shining_in_the_darkness/cover.jpg	shining/shining_in_the_darkness/logo.png	shining/shining_in_the_darkness/back.jpg	1991-03-29	\N	PAL-EUR	60	1	\N	\N	NOT_PLAYED	2024-09-11 17:18:37.226+02	2024-09-11 17:23:00.144+02	174	198	\N	https://es.wikipedia.org/wiki/Shining_in_the_Darkness	https://www.youtube.com/embed/J3P5JJ35-Og	\N
351	Shining Force	shining/shining_force/cover.jpg	shining/shining_force/logo.jpg	shining/shining_force/back.jpg	1992-03-20	90	PAL-EUR	160	1	Shining Force: The Legacy of Great Intention	\N	NOT_PLAYED	2024-09-11 17:30:42.941+02	2024-09-11 17:32:24.1+02	174	199	\N	https://es.wikipedia.org/wiki/Shining_Force	https://www.youtube.com/embed/eXOmHRyqwpg	\N
352	Paperboy 2	paperboy/paperboy_2/cover.jpg	paperboy/paperboy_2/logo.png	paperboy/paperboy_2/back.jpg	1991-01-01	\N	PAL-EUR	35	1-2	\N	\N	NOT_PLAYED	2024-09-12 15:25:37.42+02	2024-09-12 15:25:51.789+02	71	76	\N	https://es.wikipedia.org/wiki/Paperboy_2	https://www.youtube.com/embed/w6ZmtnQ9o90	\N
353	Wizardry II: The Knight of Diamonds	wizardry/wizardry_ii/cover.jpg	wizardry/wizardry_ii/logo.png	wizardry/wizardry_ii/back.jpg	1982-01-01	\N	GLOBAL	130	1	\N	\N	NOT_PLAYED	2024-09-12 15:35:07.101+02	2024-09-12 15:36:04.923+02	44	45	\N	https://en.wikipedia.org/wiki/Wizardry_II:_The_Knight_of_Diamonds	https://www.youtube.com/embed/Ax6BsFj2PpU	\N
354	Wizardry III: Legacy of Llylgamyn	wizardry/wizardry_iii/cover.jpg	wizardry/wizardry_iii/logo.png	wizardry/wizardry_iii/back.jpg	1983-01-01	\N	GLOBAL	80	1	\N	\N	NOT_PLAYED	2024-09-12 15:42:51.317+02	2024-09-12 15:43:44.692+02	44	45	\N	https://en.wikipedia.org/wiki/Wizardry_III:_Legacy_of_Llylgamyn	https://www.youtube.com/embed/_cWa5HqhWdg	\N
357	Ninja Commando	ninja_commando/cover.jpg	ninja_commando/logo.jpg	ninja_commando/back.jpg	1992-04-30	81	NTSC	1500	1-2	\N	\N	NOT_PLAYED	2024-09-13 07:50:57.508+02	2024-09-13 07:50:57.508+02	\N	\N	\N	https://es.wikipedia.org/wiki/Ninja_Commando	https://www.youtube.com/embed/eoyQdxJgD0I	\N
358	Beyond Castle Wolfenstein	wolfenstein/beyond_castle_wolfenstein/cover.jpg	wolfenstein/beyond_castle_wolfenstein/logo.jpg	wolfenstein/beyond_castle_wolfenstein/back.jpg	1984-07-01	\N	GLOBAL	60	1	\N	\N	NOT_PLAYED	2024-09-13 10:01:11.393+02	2024-09-13 10:01:51.861+02	60	62	\N	https://en.wikipedia.org/wiki/Beyond_Castle_Wolfenstein	https://www.youtube.com/embed/Bf7z8kjza2c	\N
359	Wolfenstein 3D	wolfenstein/wolfenstein_3d/cover.jpg	wolfenstein/wolfenstein_3d/logo.jpg	wolfenstein/wolfenstein_3d/back.jpg	1992-05-05	\N	GLOBAL	450	1	\N	\N	PLAYED	2024-09-13 10:26:46.56+02	2024-09-13 10:28:29.943+02	60	202	\N	https://es.wikipedia.org/wiki/Wolfenstein_3D	https://www.youtube.com/embed/x8o0a5ntxfc	\N
360	Ferrari Grand Prix Challenge 	ferrari_grand_prix_challenge/cover.jpg	ferrari_grand_prix_challenge/logo.png	ferrari_grand_prix_challenge/back.jpg	1992-05-12	\N	PAL-EUR	20	1	Nakajima Satoru Kanshuu F1 Hero MD (jp)	\N	NOT_PLAYED	2024-09-13 10:39:13.129+02	2024-09-13 10:39:13.129+02	\N	\N	\N	https://es.wikipedia.org/wiki/F-1_Hero_MD	https://www.youtube.com/embed/0kzwiVDimWs	\N
361	Indiana Jones and the Fate of Atlantis	indiana_jones/fate_of_atlantic/cover.jpg	indiana_jones/fate_of_atlantic/logo.jpg	indiana_jones/fate_of_atlantic/back.jpg	1992-06-01	90	GLOBAL	200	1	\N	\N	NOT_PLAYED	2024-09-13 11:00:41.698+02	2024-09-13 11:01:34.178+02	131	139	\N	https://es.wikipedia.org/wiki/Indiana_Jones_and_the_Fate_of_Atlantis	https://www.youtube.com/embed/LZZXJ3zCRDQ	\N
362	Andro Dunos	andro_dunos/andro_dunos/cover.jpg	andro_dunos/andro_dunos/logo.jpg	andro_dunos/andro_dunos/back.jpg	1992-06-01	70	NTSC	1300	1-2	\N	\N	NOT_PLAYED	2024-09-13 11:29:15.941+02	2024-09-13 11:30:04.136+02	\N	\N	\N	https://es.wikipedia.org/wiki/Andro_Dunos	https://www.youtube.com/embed/7tJ258dgXsM	\N
363	Ecco the Dolphin	ecco_the_dolphin/ecco_the_dolphin/cover.jpg	ecco_the_dolphin/ecco_the_dolphin/logo.jpg	ecco_the_dolphin/ecco_the_dolphin/back.jpg	1992-07-31	89	PAL-EUR	15	1	\N	\N	PLAYED	2024-09-13 13:35:57.374+02	2024-09-13 13:37:33.048+02	177	203	\N	https://es.wikipedia.org/wiki/Ecco_the_Dolphin_(videojuego)	https://www.youtube.com/embed/WcAHjSKcwOs	\N
369	Zool	zool/zool/cover.jpg	zool/zool/logo.jpg	zool/zool/back.jpg	1992-10-01	69	PAL-EUR	20	1	Zool: Ninja of the Nth Dimension	\N	NOT_PLAYED	2024-09-15 10:56:06.595+02	2024-09-15 10:57:51.002+02	181	207	\N	https://es.wikipedia.org/wiki/Zool	https://www.youtube.com/embed/Xz99maNBLOM	\N
364	Super Mario Kart	mario_kart/super_mario_kart/cover.jpg	mario_kart/super_mario_kart/logo.png	mario_kart/super_mario_kart/back.jpg	1992-08-27	94	PAL-ES	100	1-2	\N	\N	PLAYED	2024-09-14 11:39:31.679+02	2024-09-14 11:48:37.533+02	178	204	#ee1c25	https://es.wikipedia.org/wiki/Super_Mario_Kart	https://www.youtube.com/embed/6KzhEGPUNIk	\N
365	Dragon Quest V	dragon_quest/dragon_quest_v/cover.jpg	dragon_quest/dragon_quest_v/logo.jpg	dragon_quest/dragon_quest_v/back.jpg	1992-09-27	\N	NTSC-J	20	1	Dragon Quest V: La prometida celestial	\N	NOT_PLAYED	2024-09-14 12:24:51.788+02	2024-09-14 12:25:36.808+02	76	81	#af382f	https://es.wikipedia.org/wiki/Dragon_Quest_V:_La_prometida_celestial	https://www.youtube.com/embed/bIWvEFPdEmM	\N
366	Championship Manager	championship_manager/championship_manager/cover.jpg	championship_manager/championship_manager/logo.png	championship_manager/championship_manager/back.jpg	1992-05-15	\N	GLOBAL	\N	1	\N	\N	NOT_PLAYED	2024-09-14 13:31:21.865+02	2024-09-14 13:32:17.757+02	179	205	\N	https://es.wikipedia.org/wiki/Championship_Manager	https://www.youtube.com/embed/VneBdWhS2AM	\N
367	Art of Fighting	art_of_fighting/art_of_fighting/cover.jpg	art_of_fighting/art_of_fighting/logo.jpg	art_of_fighting/art_of_fighting/back.jpg	1992-09-24	\N	NTSC	260	1-2	\N	\N	NOT_PLAYED	2024-09-15 09:44:44.071+02	2024-09-15 09:45:27.588+02	180	206	\N	https://es.wikipedia.org/wiki/Art_of_Fighting	https://www.youtube.com/embed/6Jmt9gvSg-Q	\N
368	Virtua Racing	virtua_racing/cover.jpg	virtua_racing/logo.jpg	virtua_racing/back.jpg	1992-08-01	90	PAL-ES	35	1-2	\N	\N	NOT_PLAYED	2024-09-15 10:07:11.291+02	2024-09-15 10:07:11.291+02	\N	\N	\N	https://es.wikipedia.org/wiki/Virtua_Racing	https://www.youtube.com/embed/ssPfEPaTaGo	\N
370	Mortal Kombat	mortal_kombat/mortal_kombat/cover.jpg	mortal_kombat/mortal_kombat/logo.png	mortal_kombat/mortal_kombat/back.jpg	1992-10-08	84	PAL-EUR	30	1-2	\N	\N	NOT_PLAYED	2024-09-15 12:47:09.249+02	2024-09-15 12:49:19.798+02	182	208	\N	https://es.wikipedia.org/wiki/Mortal_Kombat_(videojuego_de_1992)	https://www.youtube.com/embed/6Y9nupdAedA	\N
371	Night Trap	night_trap/cover.jpg	night_trap/logo.jpg	night_trap/back.jpg	1992-10-15	79	PAL-EUR	60	1	\N	\N	NOT_PLAYED	2024-09-15 13:30:19.904+02	2024-09-15 13:30:19.904+02	\N	\N	\N	https://es.wikipedia.org/wiki/Night_Trap	https://www.youtube.com/embed/plV5l_uKzDo	\N
372	Super Mario Land 2: 6 Golden Coins	mario/super_mario_land_2/cover.jpg	mario/super_mario_land_2/logo.png	mario/super_mario_land_2/back.jpg	1992-10-21	80	PAL-ES	250	1	\N	\N	NOT_PLAYED	2024-09-16 15:32:58.349+02	2024-09-16 15:35:01.396+02	14	125	#ee1c25	https://es.wikipedia.org/wiki/Super_Mario_Land_2:_6_Golden_Coins	https://www.youtube.com/embed/V2GxRfjsM30	\N
373	Star Control	star_control/star_control/cover.jpg	star_control/star_control/logo.jpg	star_control/star_control/back.jpg	1990-07-01	81	PAL-ES	30	1-2	\N	\N	NOT_PLAYED	2024-09-16 16:27:23.498+02	2024-09-16 16:28:47.246+02	183	209	\N	https://en.wikipedia.org/wiki/Star_Control	https://www.youtube.com/embed/MsWIYQfMpPw	\N
374	Star Control II	star_control/star_control_ii/cover.jpg	star_control/star_control_ii/logo.jpg	star_control/star_control_ii/back.jpg	1992-11-01	89	GLOBAL	90	1-2	Star Control II: The Ur-Quan Masters	\N	NOT_PLAYED	2024-09-16 16:41:50.13+02	2024-09-16 16:43:52.229+02	183	209	\N	https://en.wikipedia.org/wiki/Star_Control_II	https://www.youtube.com/embed/qnV8yQ-OQ0c	\N
375	Sonic the Hedgehog 2 (8 bits)	sonic/sonic_2_8bits/cover.jpg	sonic/sonic_2_8bits/logo.jpg	sonic/sonic_2_8bits/back.jpg	1992-10-29	90	PAL-EUR	20	1	\N	\N	NOT_PLAYED	2024-09-16 17:03:17.881+02	2024-09-16 17:04:05.27+02	1	3	#17569b	https://es.wikipedia.org/wiki/Sonic_the_Hedgehog_2_(8_bits)	https://www.youtube.com/embed/B6RtXmMN9Og	\N
377	Alone in the Dark	alone_in_the_dark/alone_in_the_dark/cover.jpg	alone_in_the_dark/alone_in_the_dark/logo.png	alone_in_the_dark/alone_in_the_dark/back.jpg	1992-11-01	\N	GLOBAL	70	1	\N	\N	PLAYED	2024-09-18 16:22:32.151+02	2024-09-18 16:23:29.033+02	185	211	\N	https://es.wikipedia.org/wiki/Alone_in_the_Dark_(videojuego)	https://www.youtube.com/embed/zsGaVrMr9N8	\N
376	Flashback	flashback/flashback/cover.jpg	flashback/flashback/logo.jpg	flashback/flashback/back.jpg	1992-11-01	87	PAL-EUR	25	1	Flashback: The Quest for Identity	\N	COMPLETED	2024-09-17 16:17:39.46+02	2024-09-17 16:24:07.94+02	184	210	\N	https://es.wikipedia.org/wiki/Flashback:_The_Quest_for_Identity	https://www.youtube.com/embed/ZyY9Sz13d0A	\N
378	Dune	dune/dune/cover.jpg	dune/dune/logo.png	dune/dune/back.jpg	1992-01-01	\N	GLOBAL	200	1	\N	\N	NOT_PLAYED	2024-09-18 16:54:34.2+02	2024-09-18 16:56:07.805+02	186	212	\N	https://es.wikipedia.org/wiki/Dune_(videojuego)	https://www.youtube.com/embed/2_B4WPnf-AY	\N
379	Dune II	dune/dune_ii/cover.jpg	dune/dune_ii/logo.png	dune/dune_ii/back.jpg	1992-12-01	90	GLOBAL	150	1	Dune II: Battle for Arrakis	\N	NOT_PLAYED	2024-09-18 17:05:02.922+02	2024-09-18 17:06:45.323+02	186	212	\N	https://es.wikipedia.org/wiki/Dune_II	https://www.youtube.com/embed/gOscXf0Fpmk	\N
380	Mega Man 5	mega_man/mega_man_5/cover.jpg	mega_man/mega_man_5/logo.jpg	mega_man/mega_man_5/back.jpg	1992-12-04	79	PAL-ES	600	1	Rockman 5: Blues's Trap!? (jp)	\N	NOT_PLAYED	2024-09-20 10:39:17.669+02	2024-09-20 10:39:50.245+02	98	105	#0400f8	https://es.wikipedia.org/wiki/Mega_Man_5	https://www.youtube.com/embed/ha-sgyWudFc	\N
381	Mega Man III	mega_man/mega_man_iii/cover.jpg	mega_man/mega_man_iii/logo.jpg	mega_man/mega_man_iii/back.jpg	1992-12-11	82	PAL-ES	500	1	Rockman World 3 (jp)	\N	NOT_PLAYED	2024-09-20 10:56:39.737+02	2024-09-20 10:58:07.163+02	98	170	#0400f8	https://es.wikipedia.org/wiki/Mega_Man_III_(Game_Boy)	https://www.youtube.com/embed/-K6Qfg5yU_w	\N
382	Fatal Fury 2	fatal_fury/fatal_fury_2/cover.jpg	fatal_fury/fatal_fury_2/logo.png	fatal_fury/fatal_fury_2/back.jpg	1992-12-10	81	NTSC	200	1-2	Legend of the Hungry Wolf 2: The New Battle (jp)	\N	NOT_PLAYED	2024-09-20 13:01:12.259+02	2024-09-20 13:02:27.466+02	152	168	\N	https://es.wikipedia.org/wiki/Fatal_Fury_2	https://www.youtube.com/embed/HbWPpkTN4tY	\N
389	Wing Commander II: Vengeance of the Kilrathi	wing_commander/wing_commander_ii/cover.jpg	wing_commander/wing_commander_ii/logo.jpg	wing_commander/wing_commander_ii/back.jpg	1991-09-04	\N	GLOBAL	50	1	\N	\N	NOT_PLAYED	2024-09-21 11:16:51.949+02	2024-09-21 11:18:51.363+02	137	150	\N	https://en.wikipedia.org/wiki/Wing_Commander_II:_Vengeance_of_the_Kilrathi	https://www.youtube.com/embed/E9bsZDVA4YA	Special Operations 1 (1991)\nSpecial Operations 2 (1992)
383	Final Fantasy V	final_fantasy/final_fantasy_v/cover.jpg	final_fantasy/final_fantasy_v/logo.png	final_fantasy/final_fantasy_v/back.jpg	1992-12-06	\N	NTSC-J	35	1	\N	\N	NOT_PLAYED	2024-09-20 13:33:38.726+02	2024-09-20 13:34:20.741+02	99	106	#5499b5	https://es.wikipedia.org/wiki/Final_Fantasy_V	https://www.youtube.com/embed/Z0RtcAi94bQ	\N
384	Street Fighter II': Champion Edition	street_fighter/street_fighter_ii/champion_edition/cover.jpg	street_fighter/street_fighter_ii/champion_edition/logo.jpg	street_fighter/street_fighter_ii/champion_edition/back.jpg	1992-03-01	91	PAL-EUR	30	1-2	 Street Fighter II Dash (jp)	\N	NOT_PLAYED	2024-09-20 13:50:26.95+02	2024-09-20 13:51:19.156+02	95	213	#ff7600	https://es.wikipedia.org/wiki/Street_Fighter_II%27:_Champion_Edition	https://www.youtube.com/embed/KJne-82X4L0	\N
390	Super Star Wars	star_wars/super_star_wars/cover.jpg	star_wars/super_star_wars/logo.jpg	star_wars/super_star_wars/back.jpg	1992-11-01	92	PAL-ES	80	1	\N	\N	NOT_PLAYED	2024-09-21 11:47:42.011+02	2024-09-21 11:49:05.396+02	47	216	\N	https://es.wikipedia.org/wiki/Super_Star_Wars	https://www.youtube.com/embed/NnsGbd8WMNg	\N
385	Street Fighter II Turbo	street_fighter/street_fighter_ii/turbo/cover.jpg	street_fighter/street_fighter_ii/turbo/logo.jpg	street_fighter/street_fighter_ii/turbo/back.jpg	1992-12-10	\N	PAL-ES	120	1-2	Street Fighter II': Hyper Fighting	\N	PLAYED	2024-09-20 15:35:40.516+02	2024-09-20 15:38:04.614+02	95	213	#ff7600	https://es.wikipedia.org/wiki/Street_Fighter_II%27:_Hyper_Fighting	https://www.youtube.com/embed/oNvaXjmn6J8	\N
386	Lethal Enforcers	lethal_enforcers/lethal_enforcers/cover.jpg	lethal_enforcers/lethal_enforcers/logo.jpg	lethal_enforcers/lethal_enforcers/back.jpg	1992-10-08	81	PAL-EUR	105	1-2	\N	\N	NOT_PLAYED	2024-09-20 15:52:22.645+02	2024-09-20 15:53:26.51+02	187	214	\N	https://es.wikipedia.org/wiki/Lethal_Enforcers	https://www.youtube.com/embed/5A_5-zWvybY	\N
387	Super Kick Off	kick_off/super_kick_off/cover.jpg	kick_off/super_kick_off/logo.jpg	kick_off/super_kick_off/back.jpg	1991-12-01	\N	PAL-EUR	15	1-2	\N	\N	NOT_PLAYED	2024-09-20 16:11:54.286+02	2024-09-20 16:12:42.452+02	133	141	\N	https://en.wikipedia.org/wiki/Kick_Off_(series)#Super_Kick_Off	https://www.youtube.com/embed/YtZ6j8TPWHQ	\N
388	Sensible Soccer	sensible_soccer/sensible_soccer/cover.jpg	sensible_soccer/sensible_soccer/logo.jpg	sensible_soccer/sensible_soccer/back.jpg	1992-01-01	\N	GLOBAL	20	1-2	\N	\N	NOT_PLAYED	2024-09-20 16:33:10.908+02	2024-09-20 16:33:52.593+02	188	215	\N	https://en.wikipedia.org/wiki/Sensible_Soccer	https://www.youtube.com/embed/8DrTZ92M1sg	\N
391	The Adventures of Willy Beamish	the_adventures_of_willy_beamish/cover.jpg	the_adventures_of_willy_beamish/logo.jpg	the_adventures_of_willy_beamish/back.jpg	1991-01-01	\N	GLOBAL	150	1	\N	\N	NOT_PLAYED	2024-09-21 12:13:23.342+02	2024-09-21 12:13:23.342+02	\N	\N	\N	https://es.wikipedia.org/wiki/The_Adventures_of_Willy_Beamish	https://www.youtube.com/embed/3d8xcy2Fteo	\N
392	Road Runner's Death Valley Rally	looney_tunes/road_runner_death_valley/cover.jpg	looney_tunes/road_runner_death_valley/logo.png	looney_tunes/road_runner_death_valley/back.jpg	1992-11-01	65	PAL-EUR	60	1	Looney Tunes: Road Runner (EUR)	\N	NOT_PLAYED	2024-09-21 13:07:20.74+02	2024-09-21 13:08:19.136+02	189	217	\N	https://es.wikipedia.org/wiki/Road_Runner%27s_Death_Valley_Rally	https://www.youtube.com/embed/4Y7WLHsycv8	\N
393	John Madden Football '92	madden_nfl/madden_92/cover.jpg	madden_nfl/madden_92/logo.jpg	madden_nfl/madden_92/back.jpg	1991-12-01	\N	PAL-EUR	20	1-2	\N	\N	NOT_PLAYED	2024-09-21 13:18:27.759+02	2024-09-21 13:19:05.779+02	108	160	\N	https://en.wikipedia.org/wiki/John_Madden_Football_%2792	https://www.youtube.com/embed/gKUvVVa1VG4	\N
394	John Madden Football '93	madden_nfl/madden_93/cover.jpg	madden_nfl/madden_93/logo.jpg	madden_nfl/madden_93/back.jpg	1992-12-14	90	PAL-EUR	15	1-2	\N	\N	NOT_PLAYED	2024-09-21 13:26:58.141+02	2024-09-21 13:27:47.526+02	108	160	\N	https://en.wikipedia.org/wiki/John_Madden_Football_%2793	https://www.youtube.com/embed/CHg66U6rR8o	\N
395	NHL Hockey	nhl_ea/nhl_ea/cover.jpg	nhl_ea/nhl_ea/logo.png	nhl_ea/nhl_ea/back.jpg	1991-09-01	\N	PAL-EUR	15	1-2	EA Hockey (EUR /jp)	\N	NOT_PLAYED	2024-09-21 13:45:40.045+02	2024-09-21 13:46:22.904+02	190	218	\N	https://en.wikipedia.org/wiki/NHL_Hockey	https://www.youtube.com/embed/WWie6FtTRi8	\N
396	NHLPA Hockey '93	nhl_ea/nhlpa_93/cover.jpg	nhl_ea/nhlpa_93/logo.jpg	nhl_ea/nhlpa_93/back.jpg	1992-09-01	\N	PAL-EUR	15	1-2	\N	\N	NOT_PLAYED	2024-09-21 13:53:43.822+02	2024-09-21 13:54:34.747+02	190	218	\N	https://en.wikipedia.org/wiki/NHLPA_Hockey_%2793	https://www.youtube.com/embed/laDkE6O41CA	\N
397	Rampart	rampart/cover.jpg	rampart/logo.jpg	rampart/back.jpg	1991-02-01	\N	PAL-EUR	20	1-2	\N	\N	NOT_PLAYED	2024-09-22 09:51:37.676+02	2024-09-22 09:51:37.676+02	\N	\N	\N	https://en.wikipedia.org/wiki/Rampart_(video_game)	https://www.youtube.com/embed/iHSH_v_r4uM	\N
398	SimAnt	simant/cover.jpg	simant/logo.png	simant/back.jpg	1991-01-01	\N	GLOBAL	20	1	SimAnt: The Electronic Ant Colony	\N	NOT_PLAYED	2024-09-22 10:12:37.167+02	2024-09-22 10:12:37.167+02	\N	\N	\N	https://es.wikipedia.org/wiki/SimAnt	https://www.youtube.com/embed/1ucLyqEboGM	\N
400	Ultima Underworld: The Stygian Abyss	ultima/ultima_underworld/cover.jpg	ultima/ultima_underworld/logo.jpg	ultima/ultima_underworld/back.jpg	1992-03-01	\N	PAL-ES	100	1	\N	\N	NOT_PLAYED	2024-09-22 10:43:56.21+02	2024-09-22 10:49:08.09+02	10	219	\N	https://es.wikipedia.org/wiki/Ultima_Underworld:_The_Stygian_Abyss	https://www.youtube.com/embed/ee4PUcpGSn8	\N
401	Ultima II: The Revenge of the Enchantress	ultima/ultima_ii/cover.jpg	ultima/ultima_ii/logo.png	ultima/ultima_ii/back.jpg	1982-08-24	\N	GLOBAL	100	1	\N	\N	NOT_PLAYED	2024-09-22 10:55:31.952+02	2024-09-22 10:56:16.764+02	10	11	\N	https://es.wikipedia.org/wiki/Ultima_II:_The_Revenge_of_the_Enchantress	https://www.youtube.com/embed/AxGMhmR94lI	\N
122	Ultima III: Exodus	ultima/ultima_iii/cover.jpg	ultima/ultima_iii/logo.jpeg	ultima/ultima_iii/back.jpeg	1983-08-23	\N	GLOBAL	60	1	\N	\N	NOT_PLAYED	2024-07-11 15:43:54.264+02	2024-09-22 10:56:49.65+02	10	11	\N	https://es.wikipedia.org/wiki/Ultima_III:_Exodus	https://www.youtube.com/embed/XFHpuc4yqzk	\N
399	Ultima VII: The Black Gate	ultima/ultima_vii_black_gate/cover.jpg	ultima/ultima_vii_black_gate/logo.jpg	ultima/ultima_vii_black_gate/back.jpg	1992-04-16	\N	GLOBAL	100	1	\N	\N	NOT_PLAYED	2024-09-22 10:32:28.808+02	2024-09-22 10:58:44.327+02	10	11	\N	https://es.wikipedia.org/wiki/Ultima_VII:_The_Black_Gate	https://www.youtube.com/embed/flpiaHUxUMk	Forge of Virtue
232	Ultima VI: The False Prophet	ultima/ultima_vi/cover.jpg	ultima/ultima_vi/logo.png	ultima/ultima_vi/back.jpg	1990-06-01	\N	GLOBAL	120	1	\N	\N	NOT_PLAYED	2024-08-23 16:31:16.094+02	2024-09-22 10:58:25.78+02	10	11	\N	https://es.wikipedia.org/wiki/Ultima_VI:_The_False_Prophet	https://www.youtube.com/embed/7nBWuV_E6Eg	\N
402	Solstice	solstice/solstice/cover.jpg	solstice/solstice/logo.jpg	solstice/solstice/back.jpg	1990-06-01	82	PAL-ES	50	1	Solstice: The Quest for the Staff of Demnos	\N	NOT_PLAYED	2024-09-22 13:01:24.651+02	2024-09-22 13:09:19.851+02	191	220	\N	https://en.wikipedia.org/wiki/Solstice_(1990_video_game)	https://www.youtube.com/embed/lIebtjMyxKI	\N
403	Equinox	solstice/equinox/cover.jpg	solstice/equinox/logo.jpg	solstice/equinox/back.jpg	1992-11-12	86	PAL-ES	100	1	Solstice II (jp)	\N	NOT_PLAYED	2024-09-22 13:51:32.772+02	2024-09-22 13:53:10.884+02	191	220	\N	https://en.wikipedia.org/wiki/Equinox_(1993_video_game)	https://www.youtube.com/embed/M69aTnmXgv8	\N
412	Alien 3	alien/alien_3/cover.png	alien/alien_3/logo.jpg	alien/alien_3/back.jpg	1992-10-01	\N	PAL-EUR	35	1	\N	\N	NOT_PLAYED	2024-09-24 17:24:12.718+02	2024-09-24 17:25:55.079+02	193	228	\N	https://en.wikipedia.org/wiki/Alien_3_(video_game)	https://www.youtube.com/embed/hCDZPutaXk4	\N
404	Mystic Quest Legend	final_fantasy/mystic_quest/cover.jpg	final_fantasy/mystic_quest/logo.jpg	final_fantasy/mystic_quest/back.jpg	1992-10-05	80	PAL-EUR	80	1	Final Fantasy Mystic Quest (USA)	\N	NOT_PLAYED	2024-09-23 16:04:16.631+02	2024-09-23 16:04:43.902+02	99	221	#5499b5	https://es.wikipedia.org/wiki/Final_Fantasy_Mystic_Quest	https://www.youtube.com/embed/OvDTBDEJEQo	\N
405	Star Wars	star_wars/star_wars_91/cover.jpg	star_wars/star_wars_91/logo.jpg	star_wars/star_wars_91/back.jpg	1991-11-15	\N	PAL-ES	80	1	\N	\N	NOT_PLAYED	2024-09-23 16:19:36.742+02	2024-09-23 16:21:16.596+02	47	222	\N	https://es.wikipedia.org/wiki/Star_Wars_(videojuego_de_1991)	https://www.youtube.com/embed/52Y8qi7SVTA	\N
406	The G.G. Shinobi	shinobi/gg_shinobi/cover.jpg	shinobi/gg_shinobi/logo.jpg	shinobi/gg_shinobi/back.jpg	1991-04-26	\N	PAL-EUR	40	1	Shinobi (EUR)	\N	NOT_PLAYED	2024-09-23 16:35:09.984+02	2024-09-23 16:35:54.384+02	104	223	\N	https://en.wikipedia.org/wiki/The_G.G._Shinobi	https://www.youtube.com/embed/NuKsHfXqbAU	\N
407	The G.G. Shinobi II: The Silent Fury	shinobi/gg_shinobi_II/cover.jpg	shinobi/gg_shinobi_II/logo.jpg	shinobi/gg_shinobi_II/back.jpg	1992-12-11	\N	PAL-EUR	80	1	Shinobi II: The Silent Fury (EUR)	\N	NOT_PLAYED	2024-09-23 16:40:54.962+02	2024-09-23 16:41:36.051+02	104	223	\N	https://en.wikipedia.org/wiki/The_G.G._Shinobi_II:_The_Silent_Fury	https://www.youtube.com/embed/0m3YpC2xlxg	\N
408	Lunar: The Silver Star	lunar/lunar_silver_star/cover.jpg	lunar/lunar_silver_star/logo.jpg	lunar/lunar_silver_star/back.jpg	1992-06-16	86	NTSC	200	1	\N	\N	NOT_PLAYED	2024-09-23 19:01:12.898+02	2024-09-23 19:02:18.588+02	192	224	\N	https://en.wikipedia.org/wiki/Lunar:_The_Silver_Star	https://www.youtube.com/embed/xeq9fPOxz6o	\N
409	Krusty's Fun House	the_simpsons/krusty_fun_house/cover.jpg	the_simpsons/krusty_fun_house/logo.png	the_simpsons/krusty_fun_house/back.jpg	1992-06-01	\N	PAL-EUR	35	1	Krusty's Super Fun House	\N	NOT_PLAYED	2024-09-24 15:49:25.456+02	2024-09-24 15:50:46.187+02	161	225	\N	https://es.wikipedia.org/wiki/Krusty%27s_Fun_House	https://www.youtube.com/embed/sBiEw0TgVUU	\N
410	Taz-Mania	looney_tunes/taz-mania/cover.jpg	looney_tunes/taz-mania/logo.jpg	looney_tunes/taz-mania/back.jpg	1992-07-01	82	PAL-EUR	20	1	\N	t	NOT_PLAYED	2024-09-24 16:15:29.634+02	2024-09-24 16:16:33.508+02	189	226	\N	https://en.wikipedia.org/wiki/Taz-Mania_(video_game)	https://www.youtube.com/embed/ERPUC1ri19g	\N
411	Air Zonk	bonk/air_zonk/cover.jpg	bonk/air_zonk/logo.png	bonk/air_zonk/back.jpg	1992-12-12	76	NTSC	450	1	PC Denjin Punkic Cyborg! (jp)	\N	NOT_PLAYED	2024-09-24 16:34:23.714+02	2024-09-24 16:35:02.016+02	126	227	\N	https://es.wikipedia.org/wiki/Air_Zonk	https://www.youtube.com/embed/Q8bm3-bxVDQ	\N
413	Teenage Mutant Ninja Turtles III: The Manhattan Project	teenage_mutant_ninja_turtles/tmnt_iii_manhattan/cover.jpg	teenage_mutant_ninja_turtles/tmnt_iii_manhattan/logo.jpg	teenage_mutant_ninja_turtles/tmnt_iii_manhattan/back.jpg	1991-12-13	\N	NTSC	300	1-2	Teenage Mutant Ninja Turtles 2: The Manhattan Project (jp)	\N	NOT_PLAYED	2024-09-25 15:29:24.884+02	2024-09-25 15:30:22.443+02	119	127	#38761d	https://es.wikipedia.org/wiki/Teenage_Mutant_Ninja_Turtles_III:_The_Manhattan_Project	https://www.youtube.com/embed/3ym1QmBNrX4	\N
414	Teenage Mutant Ninja Turtles IV: Turtles in Time	teenage_mutant_ninja_turtles/tmnt_iv_turtles_in_time/cover.jpg	teenage_mutant_ninja_turtles/tmnt_iv_turtles_in_time/logo.jpg	teenage_mutant_ninja_turtles/tmnt_iv_turtles_in_time/back.jpg	1991-12-20	85	PAL-ES	600	1-2	Teenage Mutant Hero Turtles IV: Turtles in Time (EUR)	\N	NOT_PLAYED	2024-09-25 15:40:40.239+02	2024-09-25 15:41:09.111+02	119	127	#38761d	https://es.wikipedia.org/wiki/Teenage_Mutant_Ninja_Turtles:_Turtles_in_Time	https://www.youtube.com/embed/JnBjDrJufHg	\N
415	Teenage Mutant Ninja Turtles II: Back from the Sewers	teenage_mutant_ninja_turtles/tmnt_2_back_sewers/cover.jpg	teenage_mutant_ninja_turtles/tmnt_2_back_sewers/logo.png	teenage_mutant_ninja_turtles/tmnt_2_back_sewers/back.jpg	1991-09-18	\N	PAL-EUR	350	1	Teenage Mutant Hero Turtles II: Back from the Sewers (EUR)	\N	NOT_PLAYED	2024-09-25 15:49:30.291+02	2024-09-25 15:49:56.193+02	119	145	#38761d	https://es.wikipedia.org/wiki/Teenage_Mutant_Ninja_Turtles_II:_Back_from_the_Sewers	https://www.youtube.com/embed/gBQASho7GTE	\N
416	Teenage Mutant Ninja Turtles: The Hyperstone Heist	teenage_mutant_ninja_turtles/tmnt_hyperstone/cover.jpg	teenage_mutant_ninja_turtles/tmnt_hyperstone/logo.jpg	teenage_mutant_ninja_turtles/tmnt_hyperstone/back.jpg	1992-12-11	85	PAL-EUR	200	1-2	Teenage Mutant Hero Turtles: The Hyperstone Heist (EUR)	\N	NOT_PLAYED	2024-09-25 15:58:36.772+02	2024-09-25 15:59:55.467+02	119	229	#38761d	https://en.wikipedia.org/wiki/Teenage_Mutant_Ninja_Turtles:_The_Hyperstone_Heist	https://www.youtube.com/embed/m7BAlYwbLgA	\N
417	World of Illusion	mickey_mouse_&_friends/world_of_illusion/cover.jpg	mickey_mouse_&_friends/world_of_illusion/logo.jpg	mickey_mouse_&_friends/world_of_illusion/back.jpg	1992-12-18	\N	PAL-EUR	25	1-2	World of Illusion Starring Mickey Mouse and Donald Duck	\N	NOT_PLAYED	2024-09-25 16:19:11.444+02	2024-09-25 16:19:57.463+02	142	158	#f20505	https://es.wikipedia.org/wiki/World_of_Illusion_Starring_Mickey_Mouse_and_Donald_Duck	https://www.youtube.com/embed/F1GDvDX6y3g	\N
418	Streets of Rage 2	streets_of_rage/streets_of_rage_2/cover.jpg	streets_of_rage/streets_of_rage_2/logo.jpg	streets_of_rage/streets_of_rage_2/back.jpg	1992-12-20	92	PAL-EUR	60	1-2	Bare Knuckle II: The Requiem of the Deadly Battle (jp)	\N	NOT_PLAYED	2024-09-25 16:36:41.613+02	2024-09-25 16:36:52.961+02	157	175	\N	https://es.wikipedia.org/wiki/Streets_of_Rage_2	https://www.youtube.com/embed/9uUnZMxgpbo	\N
419	Wonder Dog	wonder_dog/cover.jpg	wonder_dog/logo.jpg	wonder_dog/back.jpg	1992-09-25	72	PAL-EUR	70	1	\N	\N	NOT_PLAYED	2024-09-25 16:46:45.535+02	2024-09-25 16:46:45.535+02	\N	\N	\N	https://en.wikipedia.org/wiki/Wonder_Dog_(video_game)	https://www.youtube.com/embed/zcAMtNMOAcA	\N
420	Shin Megami Tensei	shin_megami_tensei/shin_megami_tensei/cover.jpg	shin_megami_tensei/shin_megami_tensei/logo.jpg	shin_megami_tensei/shin_megami_tensei/back.jpg	1992-10-30	\N	NTSC-J	55	1	\N	\N	NOT_PLAYED	2024-09-26 15:31:52.493+02	2024-09-26 15:32:59.508+02	143	230	\N	https://en.wikipedia.org/wiki/Shin_Megami_Tensei_(video_game)	https://www.youtube.com/embed/Ph0IOnW0Mhs	\N
421	Mario Paint	mario/mario_paint/cover.jpg	mario/mario_paint/logo.jpg	mario/mario_paint/back.jpg	1992-07-14	73	PAL-ES	150	1	\N	\N	NOT_PLAYED	2024-09-26 15:47:48.291+02	2024-09-26 15:49:37.876+02	14	231	#ee1c25	https://es.wikipedia.org/wiki/Mario_Paint	https://www.youtube.com/embed/MX3HERvqHwI	\N
422	Captain Commando	captain_commando/cover.jpg	captain_commando/logo.jpg	captain_commando/back.jpg	1991-11-01	\N	PAL-EUR	1400	1-2	\N	\N	NOT_PLAYED	2024-09-26 16:05:48.288+02	2024-09-26 16:05:48.288+02	\N	\N	\N	https://es.wikipedia.org/wiki/Captain_Commando_(videojuego)	https://www.youtube.com/embed/ta2UnwzcPLg	\N
423	Road Rash II	road_rash/road_rash_ii/cover.jpg	road_rash/road_rash_ii/logo.jpg	road_rash/road_rash_ii/back.jpg	1992-12-04	90	PAL-EUR	25	1-2	\N	\N	NOT_PLAYED	2024-09-26 16:17:49.737+02	2024-09-26 16:18:41.194+02	150	166	\N	https://es.wikipedia.org/wiki/Road_Rash_II	https://www.youtube.com/embed/Qdi_PL7v3Tg	\N
424	Astérix	asterix/asterix_91/cover.jpg	asterix/asterix_91/logo.jpg	asterix/asterix_91/back.jpg	1991-01-01	90	PAL-EUR	20	1-2	\N	\N	NOT_PLAYED	2024-09-26 16:59:26.22+02	2024-09-26 17:00:04.612+02	194	232	\N	https://en.wikipedia.org/wiki/Asterix_(1991_video_game)	https://www.youtube.com/embed/PSCO0oEHJ3k	\N
425	Chip 'n Dale Rescue Rangers	chip_n_dale/rescue_rangers/cover.jpg	chip_n_dale/rescue_rangers/logo.jpg	chip_n_dale/rescue_rangers/back.jpg	1990-06-08	82	PAL-ES	60	1-2	\N	\N	PLAYED	2024-09-26 17:30:48.524+02	2024-09-26 17:31:53.132+02	195	233	\N	https://es.wikipedia.org/wiki/Chip_%27n_Dale:_Rescue_Rangers_(videojuego)	https://www.youtube.com/embed/k5E_c4hI83k	\N
426	Batman Returns (Sega)	batman/batman_returns_sega/cover.jpg	batman/batman_returns_sega/logo.jpg	batman/batman_returns_sega/back.jpg	1992-10-01	\N	PAL-EUR	30	1	\N	\N	NOT_PLAYED	2024-09-27 09:12:02.104+02	2024-09-27 09:14:50.966+02	87	234	#505c7c	https://es.wikipedia.org/wiki/Batman_Returns_(videojuego)	https://www.youtube.com/embed/ibnSxNnc0q4	\N
\.


--
-- Data for Name: Genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Genres" (id, name, main_img, "createdAt", "updatedAt", "parentId", is_main) FROM stdin;
66	Motociclismo	racing/motorcycle.jpeg	2024-07-12 09:01:42.48+02	2024-07-12 09:01:42.48+02	51	\N
77	Deporte ficticio	sports/fictional_sport.jpg	2024-08-09 11:43:13.167+02	2024-08-09 11:43:13.167+02	13	\N
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
68	Metroidvania	platforms/metroidvania.jpeg	2024-07-21 12:22:52.677+02	2024-07-21 12:22:52.677+02	1	\N
69	Open World	open_world/sandbox.png	2024-07-21 13:39:20.372+02	2024-07-21 13:39:20.372+02	\N	\N
70	Sandbox	open_world/sandbox.png	2024-07-21 13:39:34.365+02	2024-07-21 13:39:34.365+02	69	\N
71	Mundo abierto	open_world/open_world.jpg	2024-07-21 13:41:04.782+02	2024-07-21 13:41:04.782+02	69	\N
72	Fútbol	sports/football.jpg	2024-08-03 12:10:31.726+02	2024-08-03 12:10:31.726+02	13	\N
73	Fútbol Americano	sports/American-Football.png	2024-08-03 12:11:10.467+02	2024-08-03 12:11:10.467+02	13	\N
74	Horror	horror/horror.jpeg	2024-08-05 16:06:44.347+02	2024-08-05 16:06:44.347+02	\N	\N
75	Terror	horror/horror.jpeg	2024-08-05 16:06:56.821+02	2024-08-05 16:06:56.821+02	74	\N
76	Simulador de carreras	racing/simracing.jpg	2024-08-05 16:52:15.69+02	2024-08-05 16:52:15.69+02	51	\N
78	Simulador de Dios	simulator/god_simulator.jpg	2024-08-11 10:55:08.126+02	2024-08-11 10:55:08.126+02	36	\N
79	Plataformas cinemático	platforms/cinematic_platform.jpg	2024-08-11 13:34:42.266+02	2024-08-11 13:34:42.266+02	1	\N
80	Off-road	racing/offroad.jpg	2024-08-18 13:52:16.021+02	2024-08-18 13:52:16.021+02	51	\N
81	Gestión de transportes	simulator/transport_management.jpg	2024-08-23 09:34:07.748+02	2024-08-23 09:34:07.748+02	36	\N
82	RPG Táctico	rpg/tactic_rpg.jpg	2024-08-23 13:55:37.758+02	2024-08-23 13:55:37.758+02	18	\N
83	Carreras futurísticas	racing/futuristic_race.jpg	2024-08-25 11:32:54.686+02	2024-08-25 11:32:54.686+02	51	\N
84	Monster-catching	rpg/monster-catching.jpg	2024-08-28 17:48:22.99+02	2024-08-28 17:48:22.99+02	18	\N
85	Golf	sports/golf.jpg	2024-08-30 07:51:09.201+02	2024-08-30 07:51:09.201+02	13	\N
86	Visual Novel	adventure/visual_novel.jpg	2024-08-30 09:15:15.521+02	2024-08-30 09:15:15.521+02	11	\N
87	MMORPG	rpg/mmo.jpg	2024-08-31 13:58:03.648+02	2024-08-31 13:58:03.648+02	18	\N
88	Karts	racing/karts.jpg	2024-09-14 11:22:18.326+02	2024-09-14 11:22:18.326+02	51	\N
89	Gestión deportiva	simulator/sports_manager.jpg	2024-09-14 12:47:38.427+02	2024-09-14 12:47:38.427+02	36	\N
90	Vigilancia	simulator/surveillance.jpg	2024-09-15 13:09:33.62+02	2024-09-15 13:09:33.62+02	36	\N
91	Survival horror	horror/survival-horror.jpg	2024-09-18 15:36:47.768+02	2024-09-18 15:36:47.768+02	74	\N
92	Hockey sobre hielo	sports/ice-hockey.jpeg	2024-09-21 13:36:37.936+02	2024-09-21 13:36:37.936+02	13	\N
93	Tower Defense	strategy/tower-defense.jpeg	2024-09-22 09:48:26.724+02	2024-09-22 09:48:26.724+02	42	\N
94	Dibujo	educative/draw.jpg	2024-09-26 15:38:35.909+02	2024-09-26 15:38:35.909+02	9	\N
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
22	Tōru Iwatani	Toru_Iwatani.png	2024-05-02 16:21:33.668+02	2024-09-12 15:59:04.905+02	jp	1955-01-25	https://es.wikipedia.org/wiki/T%C5%8Dru_Iwatani	f
32	Gunpei Yokoi	Gunpei_Yokoi.jpg	2024-06-04 16:33:36.603+02	2024-07-17 19:52:25.322+02	jp	1941-09-10	https://es.wikipedia.org/wiki/Gunpei_Yokoi	f
1	Yūji Naka	Yuji_Naka.jpeg	2023-12-29 17:09:32.911+01	2024-05-24 13:34:39.254+02	jp	1965-09-17	https://es.wikipedia.org/wiki/Y%C5%ABji_Naka	t
28	John Newcomer	person.png	2024-05-26 13:29:39.47+02	2024-05-26 13:29:39.47+02	us	1954-01-01	https://en.wikipedia.org/wiki/John_Newcomer	\N
29	Warren Davis	Warren_Davis.jpg	2024-05-30 16:20:42.058+02	2024-05-30 16:20:42.058+02	us	1952-01-01	https://es.wikipedia.org/wiki/Warren_Davis_(actor)	\N
30	David Crane	David_Crane.jpeg	2024-05-31 14:04:28.792+02	2024-05-31 14:04:38.43+02	us	1953-01-01	https://es.wikipedia.org/wiki/David_Crane_(programador)	\N
31	Howard Scott Warshaw	Howard_Scott_Warshaw.jpeg	2024-06-02 11:20:52.681+02	2024-06-02 11:20:58.377+02	us	1957-09-30	https://es.wikipedia.org/wiki/Howard_Scott_Warshaw	\N
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
8	Tomohiro Nishikado	Tomohiro-nishikado.jpg	2024-04-27 13:07:06.967+02	2024-08-11 10:20:46.776+02	jp	1944-03-31	https://es.wikipedia.org/wiki/Toshihiro_Nishikado	f
61	Douglas E. Smith	Douglas_E._Smith.jpg	2024-07-08 16:35:05.903+02	2024-07-08 16:35:05.903+02	us	1960-10-28	https://en.wikipedia.org/wiki/Douglas_E._Smith	\N
97	Hisao Oguchi	person.png	2024-08-13 16:40:13.512+02	2024-08-13 16:40:13.512+02	jp	1960-05-05	https://en.wikipedia.org/wiki/Hisao_Oguchi	\N
98	Dino Dini	person.png	2024-08-22 15:46:58.194+02	2024-08-22 15:46:58.194+02	it	1965-06-05	https://en.wikipedia.org/wiki/Dino_Dini	\N
99	Akitoshi Kawazu	Akitoshi_Kawazu.jpg	2024-08-22 17:01:27.907+02	2024-08-22 17:01:36.775+02	jp	1962-11-05	https://en.wikipedia.org/wiki/Akitoshi_Kawazu	\N
62	Yoshihisa Kishimoto	Yoshihisa_Kishimoto.jpg	2024-07-09 15:56:11.067+02	2024-07-09 15:57:23.707+02	jp	1961-09-17	https://es.wikipedia.org/wiki/Yoshihisa_Kishimoto	\N
63	Takashi Nishiyama	Takashi_Nishiyama.jpeg	2024-07-09 16:32:40.369+02	2024-07-09 16:32:40.369+02	jp	1960-01-01	https://en.wikipedia.org/wiki/Takashi_Nishiyama	\N
64	Mark Cerny	Mark_Cerny.jpg	2024-07-10 16:25:21.998+02	2024-07-10 16:25:27.571+02	us	1964-08-24	https://es.wikipedia.org/wiki/Mark_Cerny	f
65	Satoru Iwata	Satoru_Iwata.jpg	2024-07-10 21:18:20.364+02	2024-07-10 21:18:20.364+02	jp	1959-12-06	https://es.wikipedia.org/wiki/Satoru_Iwata	t
100	Shōzō Kaga	person.png	2024-08-23 16:00:27.822+02	2024-08-23 16:00:27.822+02	jp	1955-01-01	https://es.wikipedia.org/wiki/Sh%C5%8Dz%C5%8D_Kaga	\N
67	Takashi Tezuka	Takashi_Tezuka.jpg	2024-07-17 19:49:03.006+02	2024-07-17 19:49:03.006+02	jp	1960-11-17	https://es.wikipedia.org/wiki/Takashi_Tezuka	t
9	Nolan Bushnell	Nolan_Bushnell.jpeg	2024-04-27 18:32:03.513+02	2024-07-17 19:52:03.302+02	us	1943-02-05	https://es.wikipedia.org/wiki/Nolan_Bushnell	f
68	Ryuichi Nishizawa	person.png	2024-07-18 17:02:50.199+02	2024-07-18 17:02:50.199+02	jp	1960-01-01	\N	\N
71	Fukio Mitsuji	person.png	2024-07-21 11:31:20.618+02	2024-07-21 11:31:20.618+02	jp	1960-08-06	https://en.wikipedia.org/wiki/Fukio_Mitsuji	\N
73	Yoshio Sakamoto	Yoshio_Sakamoto.jpg	2024-07-21 12:29:08.665+02	2024-07-21 12:29:08.665+02	jp	1959-07-23	https://es.wikipedia.org/wiki/Yoshio_Sakamoto	\N
77	Kotaro Hayashida	Kotaro_Hayashida.jpeg	2024-07-23 16:06:54.264+02	2024-07-23 16:06:54.264+02	jp	1960-01-01	https://es.wikipedia.org/wiki/Kotaro_Hayashida	\N
78	Andrew Braybrook	person.png	2024-07-24 16:36:21+02	2024-07-24 16:36:21+02	gb	1960-01-01	https://en.wikipedia.org/wiki/Andrew_Braybrook	\N
79	Jon Ritman	person.png	2024-07-26 09:12:17.669+02	2024-07-26 09:12:17.669+02	gb	1986-01-01	https://es.wikipedia.org/wiki/Jon_Ritman	\N
80	Tadashi Sugiyama	Tadashi_Sugiyama.jpg	2024-07-27 12:26:16.367+02	2024-07-27 12:26:16.367+02	jp	1959-04-15	https://en.wikipedia.org/wiki/Tadashi_Sugiyama	\N
81	Yasuhisa Yamamura	person.png	2024-07-27 12:28:05.952+02	2024-07-27 12:28:05.952+02	jp	1964-12-10	https://en.wikipedia.org/wiki/Yasuhisa_Yamamura	\N
82	Al Lowe	Al_Lowe.jpg	2024-07-28 11:47:46.771+02	2024-07-28 11:47:54.185+02	us	1946-07-24	https://es.wikipedia.org/wiki/Al_Lowe	\N
83	Hideo Kojima	hideo_kojima.jpeg	2024-07-28 12:23:57.049+02	2024-07-28 12:23:57.049+02	jp	1963-08-24	https://es.wikipedia.org/wiki/Hideo_Kojima	t
84	Ron Gilbert	Ron_Gilbert.jpg	2024-07-29 20:34:12.152+02	2024-07-29 20:34:20.443+02	us	1964-01-01	https://es.wikipedia.org/wiki/Ron_Gilbert	f
85	Doug Bell	person.png	2024-07-30 16:30:43.018+02	2024-07-30 16:30:43.018+02	us	1961-02-24	https://en.wikipedia.org/wiki/Doug_Bell_(game_designer)	\N
86	Akira Kitamura	person.png	2024-07-31 16:00:23.732+02	2024-07-31 16:00:23.732+02	jp	1960-01-01	https://en.wikipedia.org/wiki/Akira_Kitamura	\N
87	Keiji Inafune	Keiji_Inafune.jpg	2024-07-31 16:04:09.311+02	2024-07-31 16:04:09.311+02	jp	1965-05-08	https://es.wikipedia.org/wiki/Keiji_Inafune	\N
88	Hironobu Sakaguchi	Hironobu_Sakaguchi.jpg	2024-08-01 15:38:50.436+02	2024-08-01 15:38:50.436+02	jp	1962-11-25	https://es.wikipedia.org/wiki/Hironobu_Sakaguchi	t
89	Rieko Kodama	Rieko_Kodama.jpg	2024-08-01 16:30:57.423+02	2024-08-01 16:30:57.423+02	jp	1963-05-23	https://es.wikipedia.org/wiki/Rieko_Kodama	\N
90	Sid Meier	Sid_Meier.jpg	2024-08-02 09:37:57.949+02	2024-08-02 09:38:01.331+02	ca	1954-02-24	https://es.wikipedia.org/wiki/Sid_Meier	f
101	Chris Roberts	Chris_Roberts.jpg	2024-08-24 11:12:42.753+02	2024-08-24 11:12:42.753+02	us	1968-05-27	https://es.wikipedia.org/wiki/Chris_Roberts_(videojuegos)	\N
66	Yu Suzuki	Yu_Suzuki.jpg	2024-07-12 08:56:51.838+02	2024-08-02 11:11:15.244+02	jp	1958-06-10	https://es.wikipedia.org/wiki/Y%C5%AB_Suzuki	f
70	Kōichi Nakamura	Koichi_Nakamura.jpeg	2024-07-19 17:09:35.721+02	2024-08-03 11:18:33.304+02	jp	1964-08-16	https://es.wikipedia.org/wiki/K%C5%8Dichi_Nakamura	\N
91	Kensuke Tanabe	Kensuke_Tanabe.jpg	2024-08-04 12:50:09.466+02	2024-08-04 12:50:09.466+02	jp	1963-01-26	https://es.wikipedia.org/wiki/Kensuke_Tanabe	\N
92	Hideo Yoshizawa	person.png	2024-08-06 16:27:54.157+02	2024-08-06 16:27:54.157+02	jp	1960-09-02	https://en.wikipedia.org/wiki/Hideo_Yoshizawa	\N
102	Shigefumi Hino	person.png	2024-08-25 10:37:13.682+02	2024-08-25 10:37:13.682+02	jp	1963-01-01	https://en.wikipedia.org/wiki/Shigefumi_Hino	\N
93	Peter Molyneux	Peter-molyneux.jpg	2024-08-11 10:19:08.063+02	2024-08-11 10:20:58.646+02	gb	1959-05-05	https://es.wikipedia.org/wiki/Peter_Molyneux	t
94	Shigesato Itoi	Shigesato-Itoi.jpg	2024-08-11 12:09:33.766+02	2024-08-11 12:09:33.766+02	jp	1948-11-10	https://es.wikipedia.org/wiki/Shigesato_Itoi	\N
95	Jordan Mechner	Jordan_Mechner.jpg	2024-08-11 13:32:09.947+02	2024-08-11 13:32:09.947+02	us	1964-06-04	https://es.wikipedia.org/wiki/Jordan_Mechner	\N
96	Will Wright	Will_Wright.jpg	2024-08-12 15:31:44.229+02	2024-08-12 15:31:44.229+02	us	1960-01-20	https://es.wikipedia.org/wiki/Will_Wright	\N
103	Takaya Imamura	person.png	2024-08-25 11:34:16.798+02	2024-08-25 11:34:16.798+02	jp	1966-04-10	https://en.wikipedia.org/wiki/Takaya_Imamura	\N
104	Koji Okada	Koji_Okada.jpeg	2024-08-28 17:20:33.506+02	2024-08-28 17:20:33.506+02	jp	1964-02-22	https://en.wikipedia.org/wiki/Kouji_Okada	\N
105	Simon Phipps	Simon_Phipps.jpg	2024-08-29 16:56:39.253+02	2024-08-29 16:56:39.253+02	gb	1966-01-01	https://en.wikipedia.org/wiki/Simon_Phipps_(game_designer)	\N
106	Brian Moriarty	Brian_Moriarty.jpg	2024-08-29 21:11:49.711+02	2024-08-29 21:11:49.711+02	us	1956-01-01	https://en.wikipedia.org/wiki/Brian_Moriarty	\N
107	Akira Yasuda	person.png	2024-08-30 12:32:57.985+02	2024-08-30 12:32:57.985+02	jp	1964-07-21	https://es.wikipedia.org/wiki/Akira_Yasuda	\N
108	Akira Nishitani	person.png	2024-08-30 12:49:26.834+02	2024-08-30 12:49:26.834+02	jp	1967-09-10	https://en.wikipedia.org/wiki/Akira_Nishitani	\N
109	David Jones	David_Jones.jpg	2024-08-31 11:21:22.197+02	2024-08-31 11:21:26.039+02	gb	1966-10-01	https://es.wikipedia.org/wiki/David_Jones_(desarrollador_de_videojuegos)	f
69	Yūji Horii	Yuji_Horii.jpg	2024-07-19 16:23:22.612+02	2024-08-31 11:21:54.602+02	jp	1954-01-06	https://es.wikipedia.org/wiki/Y%C5%ABji_Horii	f
110	Hiroyuki Kimura	Hiroyuki_Kimura.jpg	2024-09-01 10:48:32.677+02	2024-09-01 10:48:32.677+02	jp	1965-06-01	https://es.wikipedia.org/wiki/Hiroyuki_Kimura	\N
74	Hiroji Kiyotake	Hiroji_Kiyotake.jpg	2024-07-21 12:47:01.394+02	2024-09-01 10:50:16.767+02	jp	1960-12-21	https://en.wikipedia.org/wiki/Hiroji_Kiyotake	\N
72	Satoru Okada	Satoru_Okada.jpg	2024-07-21 12:27:38.073+02	2024-09-01 10:51:50.438+02	jp	1977-01-10	https://en.wikipedia.org/wiki/Satoru_Okada	\N
111	Éric Chahi	Éric_Chahi.jpg	2024-09-01 12:30:19.569+02	2024-09-01 12:30:19.569+02	fr	1967-10-21	https://es.wikipedia.org/wiki/%C3%89ric_Chahi	\N
76	Hitoshi Akamatsu	Hitoshi_Akamatsu.jpg	2024-07-22 16:39:22.929+02	2024-09-02 16:27:51.161+02	jp	1960-01-01	\N	\N
112	Shin-ichiro Tomie	person.png	2024-09-03 17:27:38.746+02	2024-09-03 17:27:38.746+02	jp	1961-01-01	https://en.wikipedia.org/wiki/Shin-ichiro_Tomie	\N
113	Satoshi Tajiri	satoshi-tajiri.jpg	2024-09-06 13:57:10.795+02	2024-09-06 13:57:10.795+02	jp	1965-08-28	https://es.wikipedia.org/wiki/Satoshi_Tajiri	t
75	Greg Johnson	person.png	2024-07-21 13:42:12.029+02	2024-09-08 10:49:01.19+02	us	1960-01-01	https://en.wikipedia.org/wiki/Greg_Johnson_(game_designer)	\N
115	David Perry	David_Perry.jpg	2024-09-11 13:53:32.32+02	2024-09-11 13:53:32.32+02	gb	1967-04-01	https://es.wikipedia.org/wiki/David_Perry	\N
116	Hiroyuki Takahashi	Hiroyuki_Takahashi.jpg	2024-09-11 17:21:56.256+02	2024-09-11 17:21:56.256+02	jp	1957-10-30	https://en.wikipedia.org/wiki/Hiroyuki_Takahashi_(game_producer)	\N
117	Masahiro Sakurai	Masahiro_Sakurai.jpg	2024-09-12 15:58:48.587+02	2024-09-12 15:58:48.587+02	jp	1970-08-03	https://es.wikipedia.org/wiki/Masahiro_Sakurai	t
118	John Carmack	John_Carmack.jpeg	2024-09-13 10:05:14.234+02	2024-09-13 10:05:24.203+02	us	1970-08-21	https://es.wikipedia.org/wiki/John_Carmack	f
119	Tom Hall	Tom_Hall.jpg	2024-09-13 10:07:21.708+02	2024-09-13 10:07:21.708+02	us	1964-09-02	https://en.wikipedia.org/wiki/Tom_Hall	\N
120	Ed Annunziata	person.png	2024-09-13 13:18:58.782+02	2024-09-13 13:18:58.782+02	us	1960-01-01	https://en.wikipedia.org/wiki/Ed_Annunziata	\N
121	Hideki Konno	Hideki_Konno.jpg	2024-09-14 11:13:09.815+02	2024-09-14 11:13:09.815+02	jp	1965-05-13	https://es.wikipedia.org/wiki/Hideki_Konno	\N
122	Paul Collyer	person.png	2024-09-14 12:37:22.696+02	2024-09-14 12:37:22.696+02	gb	1960-01-01	https://en.wikipedia.org/wiki/Collyer_brothers_(game_designers)	\N
123	Oliver Collyer	person.png	2024-09-14 12:37:48.25+02	2024-09-14 12:37:48.25+02	gb	1960-01-01	https://en.wikipedia.org/wiki/Collyer_brothers_(game_designers)	\N
124	Ed Boon	Ed_Boon.jpg	2024-09-15 11:39:02.516+02	2024-09-15 11:39:02.516+02	us	1964-02-22	https://es.wikipedia.org/wiki/Ed_Boon	\N
125	John Tobias	John_Tobias.jpg	2024-09-15 11:40:57.9+02	2024-09-15 11:40:57.9+02	us	1969-08-24	https://es.wikipedia.org/wiki/John_Tobias	\N
126	Fred Ford	person.png	2024-09-16 15:51:20.785+02	2024-09-16 15:51:20.785+02	us	1960-01-01	https://en.wikipedia.org/wiki/Fred_Ford_(programmer)	\N
127	Paul Reiche III	Paulreiche.jpg	2024-09-16 15:52:50.064+02	2024-09-16 15:52:50.064+02	us	1960-01-01	https://en.wikipedia.org/wiki/Paul_Reiche_III	\N
128	Paul Cuisset	person.png	2024-09-17 15:53:49.497+02	2024-09-17 15:53:49.497+02	fr	1964-01-01	https://en.wikipedia.org/wiki/Paul_Cuisset	\N
129	Frédérick Raynal	Frédérick_Raynal.jpg	2024-09-18 16:06:04.123+02	2024-09-18 16:06:04.123+02	fr	1966-05-15	https://es.wikipedia.org/wiki/Fr%C3%A9d%C3%A9rick_Raynal	\N
130	Jon Hare	Jon_Hare.jpg	2024-09-20 16:24:19.46+02	2024-09-20 16:24:19.46+02	gb	1966-01-20	https://en.wikipedia.org/wiki/Jon_Hare	\N
131	Jeff Tunnell	person.png	2024-09-21 12:10:36.046+02	2024-09-21 12:10:36.046+02	us	1960-01-01	https://en.wikipedia.org/wiki/Jeff_Tunnell	\N
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
13	USA	atari/7800/american.jpg	1986-05-01	\N	2024-07-17 15:44:17.74+02	2024-07-17 15:44:34.015+02	20
14	TurboGrafx-16 (USA)	nec/pc-engine/TurboGrafx16.png	1989-08-29	\N	2024-07-26 08:58:26.608+02	2024-07-26 08:58:26.608+02	21
15	TurboDuo	nec/pc-engine/TurboDuo.jpg	1992-10-01	\N	2024-07-26 09:03:53.862+02	2024-07-26 09:03:53.862+02	21
16	Game Boy Pocket	nintendo/game_boy/Game-Boy-Pocket.jpg	1996-07-20	\N	2024-08-09 13:20:04.899+02	2024-08-09 13:20:30.552+02	22
17	Game Boy Light (JP)	nintendo/game_boy/Game-Boy-Light.jpg	1998-04-14	\N	2024-08-09 13:21:21.973+02	2024-08-09 13:21:21.973+02	22
18	Lynx II	atari/lynx/Lynx-II.jpg	1991-06-01	\N	2024-08-12 16:20:14.229+02	2024-08-12 16:20:14.229+02	23
19	Super Famicom	nintendo/snes/super_famicom.jpg	1990-11-21	\N	2024-08-24 13:56:24.862+02	2024-08-24 13:56:24.862+02	26
20	Super Nintendo USA	nintendo/snes/SNES-usa.jpg	1991-01-01	\N	2024-08-24 14:03:06.429+02	2024-08-24 14:03:21.775+02	26
21	Super Nintendo Jr.	nintendo/snes/snesjr.jpg	1997-01-01	\N	2024-08-24 14:07:03.26+02	2024-08-24 14:07:03.26+02	26
\.


--
-- Data for Name: Platforms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Platforms" (id, name, mini_logo, img, release_date, gen, specs, type, alt_names, color, "createdAt", "updatedAt", "manufacturerId", main_img, wikipedia, is_main) FROM stdin;
12	NES	nintendo/nes/logo.png	nintendo/nes/platform-img.png	1983-07-15	3	8 bits\nCartuchos	desktop	Famicom (Japón)	#8c8694	2024-06-03 15:43:07.073+02	2024-06-03 15:43:31.343+02	32	nintendo/nes/logo.png	https://es.wikipedia.org/wiki/Nintendo_Entertainment_System	t
20	Atari 7800	atari/7800/mini-logo.jpeg	atari/7800/platform-img.jpg	1986-05-01	3	Cartuchos	desktop	\N	\N	2024-07-17 15:43:41.063+02	2024-07-17 15:43:46.986+02	11	atari/7800/logo.png	https://es.wikipedia.org/wiki/Atari_7800	\N
13	SG-1000	sega/sg-1000/logo.png	sega/sg-1000/platform-img.png	1983-07-15	3	8 bits\nCartucho	desktop	\N	\N	2024-06-04 16:13:06.461+02	2024-06-04 16:13:34.925+02	1	sega/sg-1000/logo.png	https://es.wikipedia.org/wiki/SG-1000	\N
4	PC	pc/mini_logo.jpg	pc/platform_img.jpg	1970-01-01	1	\N	hybrid	\N	\N	2024-04-23 16:20:38.458+02	2024-04-23 16:20:38.458+02	\N	pc/logo.png	https://es.wikipedia.org/wiki/Computadora	\N
14	Master System	sega/master_system/mini-logo.png	sega/master_system/platform-img.jpeg	1985-10-20	3	Cartuchos\n8 bits	desktop	Sega Mark III (jp)	#2c2c30	2024-06-22 16:46:53.597+02	2024-06-22 16:47:13.324+02	1	sega/master_system/logo.png	https://es.wikipedia.org/wiki/Master_System	f
5	Arcade	arcade/games-icon.png	arcade/main-img.jpg	1971-09-01	1	\N	desktop	\N	\N	2024-04-23 16:31:18.883+02	2024-04-23 16:33:41.146+02	\N	arcade/logo.jpg	https://es.wikipedia.org/wiki/Arcade	\N
25	Game Gear	sega/game_gear/mini-logo.jpg	sega/game_gear/platform_img.png	1990-10-06	4	8 bits\nPantalla 32 colores	portable	\N	\N	2024-08-24 11:49:16.092+02	2024-08-24 11:49:23.771+02	1	sega/game_gear/logo.png	https://es.wikipedia.org/wiki/Game_Gear	\N
7	Bally Astrocade	astrocade/mini-logo.jpg	astrocade/platform-img.jpg	1978-04-01	2	Cartuchos	desktop	Astrovision	\N	2024-04-27 14:06:57.88+02	2024-04-27 14:07:48.841+02	16	astrocade/logo.png	https://es.wikipedia.org/wiki/Bally_Astrocade	\N
6	Magnavox Odyssey	magnavox/odyssey/mini-logo.jpeg	magnavox/odyssey/platform-img.png	1972-09-01	1	Tarjetas	desktop	\N	\N	2024-04-25 16:11:12.816+02	2024-07-04 15:29:40.153+02	9	magnavox/odyssey/logo.png	https://es.wikipedia.org/wiki/Magnavox_Odyssey	\N
8	Atari 2600	atari/2600/mini-logo.png	atari/2600/platform-img.jpg	1977-09-11	2	Cartucho\n8 bits	desktop	Atari VCS	\N	2024-04-27 18:24:15.824+02	2024-04-27 18:52:42.275+02	11	atari/2600/logo.png	https://es.wikipedia.org/wiki/Atari_2600	\N
9	Intellivision	intellivision/minilogo.jpg	intellivision/platform_img.jpg	1979-01-01	2	8 bits	desktop	\N	\N	2024-05-26 11:32:48.235+02	2024-05-26 11:32:57.212+02	8	intellivision/logo.png	https://es.wikipedia.org/wiki/Intellivision	\N
2	Mega Drive	sega/megadrive/mini_logo.png	sega/megadrive/platform_img.jpeg	1988-10-29	4	16bits\nCartuchos	desktop	Genesis (América)	#4d4d4d	2023-12-24 13:36:13.927+01	2024-05-26 12:11:55.229+02	1	sega/megadrive/logo.png	https://es.wikipedia.org/wiki/Mega_Drive	t
15	Fairchild Channel F	fairchild/mini-logo.png	fairchild/platform-img.jpg	1976-11-01	2	Cartuchos	desktop	\N	\N	2024-07-04 15:38:01.831+02	2024-07-04 15:38:40.968+02	71	fairchild/logo.png	https://es.wikipedia.org/wiki/Fairchild_Channel_F	\N
10	ColecoVision	colecovision/minilogo.jpeg	colecovision/platform-img.jpeg	1982-08-01	2	8 bits\nCartucho	desktop	\N	\N	2024-05-26 12:33:05.034+02	2024-05-26 12:33:37.596+02	33	colecovision/logo.png	https://es.wikipedia.org/wiki/ColecoVision	\N
11	Atari 5200	atari/5200/minilogo.jpeg	atari/5200/platform-img.jpeg	1982-11-01	2	8 bits\nCartuchos	desktop	\N	\N	2024-05-26 12:41:37.671+02	2024-07-06 10:56:38.207+02	11	atari/5200/logo.png	https://es.wikipedia.org/wiki/Atari_5200	\N
19	Famicom Disk System	nintendo/famicom-disk/mini-logo.jpg	nintendo/famicom-disk/platform-img.png	1986-02-21	3	Floppy Disk	peripheral	\N	\N	2024-07-17 15:31:08.591+02	2024-07-26 08:56:40.386+02	32	nintendo/famicom-disk/logo.png	https://es.wikipedia.org/wiki/Famicom_Disk_System	\N
16	Magnavox Odyssey 2	magnavox/odyssey_2/mini-logo.png	magnavox/odyssey_2/platform-img.jpg	1978-09-01	2	Cartuchos	desktop	Videopac	\N	2024-07-06 11:17:03.515+02	2024-07-06 11:19:09.129+02	9	magnavox/odyssey_2/logo.png	https://es.wikipedia.org/wiki/Magnavox_Odyssey%C2%B2	\N
17	Vectrex	mb/vectrex/mini-logo.png	mb/vectrex/platform-img.jpg	1982-11-01	2	Cartuchos	desktop	\N	\N	2024-07-07 11:10:43.899+02	2024-07-07 11:10:50.608+02	79	mb/vectrex/logo.png	https://es.wikipedia.org/wiki/Vectrex	\N
18	Microvision	mb/microvision/logo.png	mb/microvision/platform-img.jpg	1979-11-01	2	Cartuchos	portable	\N	\N	2024-07-07 11:16:11.411+02	2024-07-07 11:16:18.278+02	79	mb/microvision/logo.png	https://es.wikipedia.org/wiki/Milton_Bradley_Microvision	\N
21	PC Engine	nec/pc-engine/mini-logo.png	nec/pc-engine/platform-img.jpg	1987-10-30	4	16 bits solo gpu, 8 bits procesador\nHuCard	desktop	TurboGrafx-16 (USA)	\N	2024-07-26 08:50:38.307+02	2024-07-26 08:59:14.832+02	72	nec/pc-engine/logo.png	https://es.wikipedia.org/wiki/PC_Engine	\N
22	Game Boy	nintendo/game_boy/logo.png	nintendo/game_boy/platform-img.jpg	1989-04-21	4	8 bits\nCartuchos\nPantalla 4 tonos de gris	portable	\N	#c7c2bf	2024-08-09 13:16:51.974+02	2024-08-09 13:19:14.821+02	32	nintendo/game_boy/logo.png	https://es.wikipedia.org/wiki/Game_Boy	t
23	Atari Lynx	atari/lynx/logo.png	atari/lynx/platform-img.jpg	1989-09-01	4	8 bits\nLCD color	desktop	\N	\N	2024-08-12 16:19:27.945+02	2024-08-12 16:19:27.945+02	\N	atari/lynx/logo.png	https://es.wikipedia.org/wiki/Atari_Lynx	\N
27	TurboExpress	nec/turboexpress/mini-logo.png	nec/turboexpress/platform_img.jpg	1990-12-01	4	HuCard\n8 bits\n512 colores	portable	PC Engine GT (jp)	\N	2024-08-25 12:10:00.275+02	2024-08-25 12:10:15.438+02	72	nec/turboexpress/logo.png	https://es.wikipedia.org/wiki/TurboExpress	\N
24	PC Engine CD-ROM² System	nec/pc-engine-cdrom2/mini-logo.png	nec/pc-engine-cdrom2/platform-img.jpg	1988-01-01	4	CD-Rom	peripheral	TurboGrafx-CD/CD-ROM² (USA)	\N	2024-08-22 17:18:00.926+02	2024-08-22 17:20:02.886+02	72	nec/pc-engine-cdrom2/logo.png	\N	\N
26	Super Nintendo	nintendo/snes/mini-logo.png	nintendo/snes/platform_img.jpg	1990-11-21	4	16 bits\nCartuchos	desktop	Super Famicom (jp)	#908a99	2024-08-24 13:53:47.323+02	2024-08-24 13:55:32.854+02	32	nintendo/snes/logo.png	https://es.wikipedia.org/wiki/Super_Nintendo	t
29	Mega CD	sega/mega_cd/logo.png	sega/mega_cd/platform-img.jpg	1991-12-12	4	CD-ROM	peripheral	Sega CD (USA)	\N	2024-09-02 16:24:10.848+02	2024-09-02 16:24:10.848+02	\N	sega/mega_cd/logo.png	https://es.wikipedia.org/wiki/Sega_CD	\N
30	Philips CD-i	philips/cd-i/mini-logo.jpg	philips/cd-i/platform-img.jpg	1991-01-01	4	CD-ROM\n16 bits	desktop	\N	\N	2024-09-08 20:28:50.32+02	2024-09-08 20:29:32.973+02	10	philips/cd-i/logo.png	https://es.wikipedia.org/wiki/CD-i	\N
28	Neo-Geo AES	snk/neo-geo-aes/mini-logo.png	snk/neo-geo-aes/platform-img.jpg	1990-04-26	4	16 bits\nCartuchos ROM	desktop	\N	\N	2024-09-01 13:40:35.396+02	2024-09-01 13:53:48.501+02	96	snk/neo-geo-aes/logo.jpg	https://es.wikipedia.org/wiki/Neo-Geo#Sistema_AES	f
\.


--
-- Data for Name: Series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Series" (id, name, is_main, "createdAt", "updatedAt", franchise_id) FROM stdin;
99	Metal Gear	\N	2024-07-28 12:30:48.036+02	2024-07-28 12:30:48.036+02	93
100	Principal	t	2024-07-28 13:03:25.107+02	2024-07-28 13:03:25.107+02	94
101	Principal	t	2024-07-28 22:53:32.01+02	2024-07-28 22:53:32.01+02	95
102	Principal	t	2024-07-29 20:51:17.109+02	2024-07-29 20:51:17.109+02	96
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
77	Principal	t	2024-07-17 16:27:10.287+02	2024-07-17 16:27:10.287+02	72
79	Principal	t	2024-07-18 17:03:12.599+02	2024-07-18 17:03:12.599+02	74
80	Principal	t	2024-07-19 15:39:00.063+02	2024-07-19 15:39:00.063+02	75
81	Principal	t	2024-07-19 16:55:48.171+02	2024-07-19 16:55:48.171+02	76
82	Lost Levels	\N	2024-07-21 11:12:13.25+02	2024-07-21 11:12:13.25+02	14
83	Principal	t	2024-07-21 11:33:18.415+02	2024-07-21 11:33:18.415+02	77
84	2D	t	2024-07-21 12:52:28.335+02	2024-07-21 12:52:28.335+02	78
85	Principal	t	2024-07-21 13:43:22.93+02	2024-07-21 13:43:22.93+02	79
86	Principal	t	2024-07-22 15:22:32.142+02	2024-07-22 15:22:32.142+02	80
88	Principal	t	2024-07-22 16:38:36.574+02	2024-07-22 16:38:36.574+02	82
89	Principal	t	2024-07-23 16:03:03.972+02	2024-07-23 16:03:03.972+02	83
90	Principal	t	2024-07-23 16:32:05.827+02	2024-07-23 16:32:05.827+02	84
91	Principal	t	2024-07-24 15:34:39.319+02	2024-07-24 15:34:39.319+02	85
92	TOSE	\N	2024-07-25 17:08:42.608+02	2024-07-25 17:08:42.608+02	86
93	Ocean	\N	2024-07-26 09:18:29.105+02	2024-07-26 09:18:29.105+02	87
78	Hero is Defeated	t	2024-07-17 19:55:44.541+02	2024-07-27 12:31:31.519+02	73
94	Principal	t	2024-07-27 12:53:13.897+02	2024-07-27 12:53:13.897+02	88
95	Principal	t	2024-07-27 13:22:05.282+02	2024-07-27 13:22:05.282+02	89
96	Principal	t	2024-07-27 14:08:16.372+02	2024-07-27 14:08:16.372+02	90
97	Principal	t	2024-07-28 11:30:43.082+02	2024-07-28 11:30:43.082+02	91
98	Principal	t	2024-07-28 12:02:18.843+02	2024-07-28 12:02:18.843+02	92
103	Principal	t	2024-07-30 15:39:58.412+02	2024-07-30 15:40:05.256+02	57
104	Principal	t	2024-07-30 16:32:43.933+02	2024-07-30 16:32:43.933+02	97
105	Original	t	2024-07-31 16:06:45.625+02	2024-07-31 16:06:45.625+02	98
106	Principal	t	2024-08-01 15:46:39.621+02	2024-08-01 15:46:39.621+02	99
107	Principal	t	2024-08-01 16:38:46.174+02	2024-08-01 16:38:46.174+02	100
108	Principal	t	2024-08-02 09:09:04.889+02	2024-08-02 09:09:04.889+02	101
109	Principal	t	2024-08-02 11:04:15.303+02	2024-08-02 11:04:15.303+02	102
110	Principal	t	2024-08-02 11:24:21.078+02	2024-08-02 11:24:21.078+02	103
111	Principal	t	2024-08-02 11:46:03.256+02	2024-08-02 11:46:03.256+02	104
112	Principal	t	2024-08-02 12:10:10.127+02	2024-08-02 12:10:10.127+02	105
113	Principal	t	2024-08-02 12:29:44.55+02	2024-08-02 12:29:44.55+02	106
114	Principal	t	2024-08-03 11:28:48.031+02	2024-08-03 11:28:48.031+02	107
115	Precuela	\N	2024-08-03 12:12:14.608+02	2024-08-03 12:12:14.608+02	108
116	Principal	t	2024-08-03 13:01:14.732+02	2024-08-03 13:01:14.732+02	109
117	Principal	t	2024-08-03 13:28:36.077+02	2024-08-03 13:28:36.077+02	110
118	Principal	t	2024-08-05 16:14:58.125+02	2024-08-05 16:14:58.125+02	111
119	Principal	t	2024-08-05 16:54:54.574+02	2024-08-05 16:54:54.574+02	112
87	NES	t	2024-07-22 15:50:39.406+02	2024-09-09 16:11:07.295+02	81
120	Primera Trilogía	t	2024-08-06 16:30:01.175+02	2024-08-06 16:30:01.175+02	113
121	Trilogia	t	2024-08-07 16:14:58.96+02	2024-08-07 16:14:58.96+02	114
122	Principal	t	2024-08-08 16:00:54.716+02	2024-08-08 16:00:54.716+02	115
123	Principal	t	2024-08-09 11:23:02.53+02	2024-08-09 11:23:02.53+02	116
124	Principal	t	2024-08-09 11:49:27.564+02	2024-08-09 11:49:27.564+02	117
125	Super Mario Land	t	2024-08-09 13:30:21.159+02	2024-08-09 13:30:21.159+02	14
126	Principal	t	2024-08-10 11:15:37.338+02	2024-08-10 11:15:37.338+02	118
127	NES	t	2024-08-10 12:02:00.087+02	2024-08-10 12:02:00.087+02	119
128	Principal	t	2024-08-10 13:16:18.314+02	2024-08-10 13:16:18.314+02	120
129	Principal	t	2024-08-11 11:53:13.804+02	2024-08-11 11:53:13.804+02	121
130	Principal	t	2024-08-11 12:20:05.264+02	2024-08-11 12:20:05.264+02	122
131	Principal	t	2024-08-11 13:06:08.049+02	2024-08-11 13:06:08.049+02	123
132	Trilogía original	t	2024-08-11 13:48:36.441+02	2024-08-11 13:48:36.441+02	124
133	Principal	t	2024-08-12 15:42:48.327+02	2024-08-12 15:42:48.327+02	125
134	Principal	t	2024-08-12 17:01:51.242+02	2024-08-12 17:01:51.242+02	126
135	Principal	t	2024-08-13 16:39:00.15+02	2024-08-13 16:39:00.15+02	127
136	Principal	t	2024-08-14 16:38:28.985+02	2024-08-14 16:38:28.985+02	128
137	Principal	t	2024-08-18 13:22:11.736+02	2024-08-18 13:22:11.736+02	129
138	Principal	t	2024-08-18 14:07:05.598+02	2024-08-18 14:07:05.598+02	130
139	Aventuras gráficas	t	2024-08-19 14:01:17.076+02	2024-08-19 14:01:17.076+02	131
140	Principal	t	2024-08-22 15:31:42.06+02	2024-08-22 15:31:42.06+02	132
141	Principal	t	2024-08-22 16:16:07.742+02	2024-08-22 16:16:07.742+02	133
142	Final Fantasy Legend	t	2024-08-22 17:03:27.275+02	2024-08-22 17:10:39.989+02	134
143	Recopilatorios	\N	2024-08-22 17:31:43.062+02	2024-08-22 17:31:43.062+02	90
144	Principal	t	2024-08-23 09:35:42.765+02	2024-08-23 09:35:42.765+02	135
145	Game Boy	t	2024-08-23 10:54:29.838+02	2024-08-23 10:54:29.838+02	119
146	G-LOC	\N	2024-08-23 13:01:07.315+02	2024-08-23 13:01:07.315+02	103
147	Snake's Revenge	\N	2024-08-23 13:09:33.186+02	2024-08-23 13:09:33.186+02	93
148	Principal	t	2024-08-23 16:02:28.972+02	2024-08-23 16:02:28.972+02	136
149	Dr. Mario	\N	2024-08-24 10:36:44.675+02	2024-08-24 10:36:44.675+02	14
150	Principal	t	2024-08-24 11:23:34.071+02	2024-08-24 11:23:34.071+02	137
151	Principal	t	2024-08-24 12:01:48.04+02	2024-08-24 12:01:48.04+02	138
152	Principal	t	2024-08-24 13:23:49.5+02	2024-08-24 13:23:49.5+02	139
153	Super Mario World	t	2024-08-25 10:54:57.023+02	2024-08-25 10:54:57.023+02	14
154	Principal	t	2024-08-25 11:36:42.772+02	2024-08-25 11:36:42.772+02	140
155	Principal	t	2024-08-25 13:36:42.613+02	2024-08-25 13:36:42.613+02	141
156	1990	t	2024-08-27 15:59:13.999+02	2024-08-27 15:59:13.999+02	28
157	1990 - Mega Drive	\N	2024-08-27 16:51:14.83+02	2024-08-27 16:51:14.83+02	87
158	Illusion	t	2024-08-28 16:01:57.412+02	2024-08-28 16:01:57.412+02	142
159	Megami Tensei	t	2024-08-28 17:18:17.105+02	2024-08-28 17:18:17.105+02	143
160	Principal	t	2024-08-29 16:37:36.053+02	2024-08-29 16:37:36.053+02	108
161	Principal	t	2024-08-29 17:06:35.95+02	2024-08-29 17:06:35.95+02	144
162	Principal	t	2024-08-30 07:53:17.762+02	2024-08-30 07:53:17.762+02	145
163	Principal	t	2024-08-30 09:19:21.047+02	2024-08-30 09:19:21.047+02	146
164	Principal	t	2024-08-31 11:42:49.602+02	2024-08-31 11:42:49.602+02	147
165	Principal	t	2024-08-31 13:48:53+02	2024-08-31 13:48:53+02	149
166	Principal	t	2024-09-01 10:35:30.446+02	2024-09-01 10:35:30.446+02	150
167	Principal	t	2024-09-01 12:34:15.934+02	2024-09-01 12:34:15.934+02	151
168	Principal	t	2024-09-02 15:38:29.567+02	2024-09-02 15:38:29.567+02	152
169	Game Boy	t	2024-09-02 17:14:54.429+02	2024-09-02 17:15:02.445+02	82
170	Game Boy	\N	2024-09-03 16:11:36.255+02	2024-09-03 16:11:36.255+02	98
171	Principal	t	2024-09-03 17:20:28.206+02	2024-09-03 17:20:28.206+02	153
172	Principal	t	2024-09-04 15:20:39.754+02	2024-09-04 15:20:39.754+02	154
173	Principal	t	2024-09-04 16:50:31.101+02	2024-09-04 16:50:31.101+02	155
174	Principal	t	2024-09-05 17:00:28.795+02	2024-09-05 17:00:28.795+02	156
175	Principal	t	2024-09-05 17:25:13.634+02	2024-09-05 17:25:13.634+02	157
3	8 bits	\N	2024-04-12 09:36:39.35+02	2024-09-05 17:45:18.307+02	1
176	Principal	t	2024-09-06 08:44:48.266+02	2024-09-06 08:44:48.266+02	158
177	Principal	t	2024-09-06 09:20:26.517+02	2024-09-06 09:20:26.517+02	159
178	Arcade	t	2024-09-06 10:06:32.546+02	2024-09-06 10:39:26.779+02	160
179	Doméstico	t	2024-09-06 10:39:40.613+02	2024-09-06 10:39:40.613+02	160
180	Arcade	t	2024-09-06 12:39:41.428+02	2024-09-06 12:39:41.428+02	161
181	Atari	\N	2024-09-06 13:21:34.651+02	2024-09-06 13:21:34.651+02	162
182	Game Freak	\N	2024-09-06 16:20:58.657+02	2024-09-06 16:21:47.611+02	163
183	Principal	t	2024-09-06 16:42:31.775+02	2024-09-06 16:42:31.775+02	164
184	Mario Golf	\N	2024-09-07 10:33:34.308+02	2024-09-07 10:33:34.308+02	14
185	Principal	t	2024-09-07 12:08:30.747+02	2024-09-07 12:08:30.747+02	165
186	QuackShot	\N	2024-09-07 13:23:34.401+02	2024-09-07 13:23:34.401+02	142
187	Principal	t	2024-09-08 09:22:32.387+02	2024-09-08 09:22:32.387+02	166
188	Principal	t	2024-09-08 10:47:12.494+02	2024-09-08 10:47:12.494+02	167
189	Principal	t	2024-09-08 11:50:13.92+02	2024-09-08 11:50:13.92+02	168
190	SNES	t	2024-09-09 16:11:18.732+02	2024-09-09 16:29:27.178+02	81
191	Romancing SaGa	t	2024-09-09 17:16:13.372+02	2024-09-09 17:16:13.372+02	134
192	Virgin	t	2024-09-10 15:42:22.469+02	2024-09-10 16:21:19.107+02	169
193	25th anniversary	t	2024-09-10 16:34:16.773+02	2024-09-10 16:34:16.773+02	170
194	Konami	t	2024-09-11 10:34:07.076+02	2024-09-11 10:34:07.076+02	171
195	Konami - GB	\N	2024-09-11 10:57:12.948+02	2024-09-11 10:57:12.948+02	171
196	Principal	t	2024-09-11 11:59:02.746+02	2024-09-11 11:59:02.746+02	172
197	Probe	t	2024-09-11 13:06:08.909+02	2024-09-11 13:06:08.909+02	173
198	Darkness	t	2024-09-11 17:14:06.852+02	2024-09-11 17:14:06.852+02	174
199	Shining Force	t	2024-09-11 17:24:24.799+02	2024-09-11 17:24:24.799+02	174
200	Compile	t	2024-09-12 16:09:22.411+02	2024-09-12 16:09:22.411+02	175
201	Dream Land	t	2024-09-12 16:29:34.611+02	2024-09-12 16:29:54.799+02	176
202	id Software	t	2024-09-13 08:06:21.073+02	2024-09-13 08:06:21.073+02	60
203	Principal	t	2024-09-13 13:26:19.483+02	2024-09-13 13:26:19.483+02	177
204	Principal	t	2024-09-14 11:17:07.525+02	2024-09-14 11:17:07.525+02	178
205	Principal	t	2024-09-14 13:25:48.251+02	2024-09-14 13:25:48.251+02	179
206	Principal	t	2024-09-15 09:27:23.151+02	2024-09-15 09:27:23.151+02	180
207	Principal	t	2024-09-15 10:48:24.291+02	2024-09-15 10:48:24.291+02	181
208	Principal	t	2024-09-15 11:59:56.725+02	2024-09-15 11:59:56.725+02	182
209	Principal	t	2024-09-16 16:15:54.539+02	2024-09-16 16:15:54.539+02	183
210	Principal	t	2024-09-17 16:04:49.222+02	2024-09-17 16:04:49.222+02	184
211	Principal	t	2024-09-18 16:08:31.1+02	2024-09-18 16:08:31.1+02	185
212	Virgin	t	2024-09-18 16:43:39.911+02	2024-09-18 16:43:54.607+02	186
213	Street Fighter II versions	\N	2024-09-20 13:37:35.444+02	2024-09-20 13:37:35.444+02	95
214	Principal	t	2024-09-20 15:48:38.255+02	2024-09-20 15:48:38.255+02	187
215	Principal	t	2024-09-20 16:31:17.805+02	2024-09-20 16:31:17.805+02	188
216	Super Star Wars	t	2024-09-21 11:28:24.62+02	2024-09-21 11:28:24.62+02	47
217	RoadRunner	t	2024-09-21 12:53:55.354+02	2024-09-21 12:54:02.578+02	189
218	Principal	t	2024-09-21 13:38:50.101+02	2024-09-21 13:38:50.101+02	190
219	Underworld	\N	2024-09-22 10:38:53.6+02	2024-09-22 10:38:53.6+02	10
220	Principal	t	2024-09-22 12:59:20.412+02	2024-09-22 12:59:20.412+02	191
221	Mystic Quest	\N	2024-09-23 16:02:13.149+02	2024-09-23 16:02:13.149+02	99
222	NES	\N	2024-09-23 16:12:11.627+02	2024-09-23 16:12:11.627+02	47
223	G.G.	\N	2024-09-23 16:25:19.157+02	2024-09-23 16:25:19.157+02	104
224	Principal	t	2024-09-23 18:37:27.347+02	2024-09-23 18:37:27.347+02	192
225	Krusty's Fun House	\N	2024-09-24 15:43:23.775+02	2024-09-24 15:43:23.775+02	161
226	Taz-mania	t	2024-09-24 16:06:27.983+02	2024-09-24 16:06:27.983+02	189
227	Air Zonk	\N	2024-09-24 16:20:45.396+02	2024-09-24 16:20:45.396+02	126
228	Alien 3	t	2024-09-24 16:47:10.99+02	2024-09-24 16:47:10.99+02	193
229	Mega Drive	t	2024-09-25 15:43:07.41+02	2024-09-25 15:43:07.41+02	119
230	Principal	t	2024-09-26 15:27:12.411+02	2024-09-26 15:27:12.411+02	143
231	Mario Paint	\N	2024-09-26 15:35:45.83+02	2024-09-26 15:35:45.83+02	14
232	Master System	t	2024-09-26 16:48:32.64+02	2024-09-26 16:48:32.64+02	194
233	Principal	t	2024-09-26 17:20:15.391+02	2024-09-26 17:20:15.391+02	195
234	Batman Returns - SEGA	f	2024-09-27 09:01:37.458+02	2024-09-27 09:01:50.969+02	87
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
30	Prehistoria	historical/prehistorical.jpg	2024-07-18 17:23:07.252+02	2024-07-18 17:23:07.252+02	1	\N
31	Vampiros	creatures/vampires.jpg	2024-07-22 16:25:41.157+02	2024-07-22 16:25:41.157+02	10	\N
32	Arte	art/gothic.jpeg	2024-07-22 16:33:04.379+02	2024-07-22 16:33:04.379+02	\N	\N
33	Gótico	art/gothic.jpeg	2024-07-22 16:33:19.036+02	2024-07-22 16:33:19.036+02	32	\N
34	Antigua Grecia	historical/greek.jpeg	2024-07-23 16:25:29.713+02	2024-07-23 16:25:29.713+02	1	\N
35	Basado en manga	adaptation/manga.png	2024-07-25 17:17:39.325+02	2024-07-25 17:17:39.325+02	16	\N
36	Pandillas	crime/gang.jpeg	2024-07-27 13:38:49.471+02	2024-07-27 13:38:57.122+02	8	\N
37	Ninja	creatures/ninja.jpg	2024-08-02 08:54:24.237+02	2024-08-02 08:54:24.237+02	10	\N
38	Japón feudal	historical/feudal_japan.jpg	2024-08-02 08:55:56.788+02	2024-08-02 08:55:56.788+02	1	\N
39	Piratas	creatures/pirates.jpeg	2024-08-02 09:44:44.485+02	2024-08-02 09:44:44.485+02	10	\N
40	Ciencia ficción militar	scifi/science-fiction-military.jpeg	2024-08-03 13:23:40.044+02	2024-08-03 13:23:40.044+02	6	\N
41	Futurístico	scifi/futuristic.jpg	2024-08-03 13:25:41.358+02	2024-08-03 13:25:41.358+02	6	\N
42	Policiaco	crime/police.jpg	2024-08-07 15:57:55.826+02	2024-08-07 15:57:55.826+02	8	\N
43	Basado en dibujos animados	adaptation/Cartoon.jpg	2024-08-10 12:35:50.156+02	2024-08-10 12:35:50.156+02	16	\N
44	Mafia	crime/mafia.jpg	2024-08-22 16:28:31.235+02	2024-08-22 16:28:31.235+02	8	\N
45	Ciberpunk	scifi/cyberpunk.jpg	2024-08-28 17:26:18.929+02	2024-08-28 17:26:18.929+02	6	\N
46	Era Vikinga	historical/viking.jpg	2024-09-06 08:30:50.591+02	2024-09-06 08:30:50.591+02	1	\N
47	Robos	crime/heist.jpg	2024-09-08 10:11:49.773+02	2024-09-08 10:11:49.773+02	8	\N
48	Basado en serie de TV	adaptation/tv_show.jpg	2024-09-10 16:45:47.601+02	2024-09-10 16:45:47.601+02	16	\N
49	Medieval	historical/medieval.jpg	2024-09-22 09:53:48.892+02	2024-09-22 09:53:48.892+02	1	\N
\.


--
-- Name: AwardCategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AwardCategories_id_seq"', 45, true);


--
-- Name: Awards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Awards_id_seq"', 8, true);


--
-- Name: Characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Characters_id_seq"', 177, true);


--
-- Name: Companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Companies_id_seq"', 231, true);


--
-- Name: Franchise_Franchises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Franchise_Franchises_id_seq"', 5, true);


--
-- Name: Franchises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Franchises_id_seq"', 195, true);


--
-- Name: Game_Games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Game_Games_id_seq"', 7, true);


--
-- Name: Games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Games_id_seq"', 426, true);


--
-- Name: Genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Genres_id_seq"', 94, true);


--
-- Name: People_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."People_id_seq"', 131, true);


--
-- Name: PlatformModels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PlatformModels_id_seq"', 21, true);


--
-- Name: Platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Platforms_id_seq"', 30, true);


--
-- Name: Series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Series_id_seq"', 234, true);


--
-- Name: Themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Themes_id_seq"', 49, true);


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
-- Name: Game_Games Game_Games_parentGameId_subGameId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Games"
    ADD CONSTRAINT "Game_Games_parentGameId_subGameId_key" UNIQUE ("parentGameId", "subGameId");


--
-- Name: Game_Games Game_Games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Game_Games"
    ADD CONSTRAINT "Game_Games_pkey" PRIMARY KEY (id);


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

