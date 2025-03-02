--
-- PostgreSQL database dump
--

-- DROP DATABASE recipes If EXISTS;
-- CREATE DATABASE recipes9 WITH ENCODING='UTF8' LC_COLLATE='ja_JP.utf8' LC_CTYPE='ja_JP.utf8' OWNER=postgres TEMPLATE=template0;

-- Dumped from database version 13.17
-- Dumped by pg_dump version 13.17

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
-- Name: howtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.howtos (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.howtos OWNER TO postgres;

--
-- Name: howtos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.howtos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.howtos_id_seq OWNER TO postgres;

--
-- Name: howtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.howtos_id_seq OWNED BY public.howtos.id;


--
-- Name: l_trans_qs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.l_trans_qs (
    id integer NOT NULL,
    type character varying(10) DEFAULT 'CN'::character varying NOT NULL,
    q character varying(255) NOT NULL,
    a character varying(255) NOT NULL,
    hint1 character varying(255),
    hint2 character varying(255),
    tried integer DEFAULT 0 NOT NULL,
    cleared integer DEFAULT 0 NOT NULL,
    rate real DEFAULT 0.0 NOT NULL,
    previous_try boolean DEFAULT false NOT NULL,
    created_at date DEFAULT CURRENT_TIMESTAMP,
    updated_at date DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.l_trans_qs OWNER TO postgres;

--
-- Name: l_trans_qs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.l_trans_qs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.l_trans_qs_id_seq OWNER TO postgres;

--
-- Name: l_trans_qs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.l_trans_qs_id_seq OWNED BY public.l_trans_qs.id;


--
-- Name: learn_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.learn_questions (
    id bigint NOT NULL,
    type integer NOT NULL,
    q character varying(255) NOT NULL,
    a character varying(255) NOT NULL,
    hint1 character varying(255),
    hint2 character varying(255),
    tried integer DEFAULT 0 NOT NULL,
    cleared integer DEFAULT 0 NOT NULL,
    ratio integer DEFAULT 0 NOT NULL,
    tried_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    hidden_at timestamp(0) without time zone
);


ALTER TABLE public.learn_questions OWNER TO postgres;

--
-- Name: COLUMN learn_questions.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.learn_questions.type IS '種類';


--
-- Name: COLUMN learn_questions.q; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.learn_questions.q IS '問題';


--
-- Name: COLUMN learn_questions.a; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.learn_questions.a IS '正解';


--
-- Name: COLUMN learn_questions.hint1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.learn_questions.hint1 IS 'ヒント1';


--
-- Name: COLUMN learn_questions.hint2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.learn_questions.hint2 IS 'ヒント2';


--
-- Name: COLUMN learn_questions.tried; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.learn_questions.tried IS '挑戦回数';


--
-- Name: COLUMN learn_questions.cleared; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.learn_questions.cleared IS '正解回数';


--
-- Name: COLUMN learn_questions.ratio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.learn_questions.ratio IS '成功確率-パーセンテージx10';


--
-- Name: COLUMN learn_questions.tried_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.learn_questions.tried_at IS '最終挑戦日時';


--
-- Name: COLUMN learn_questions.hidden_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.learn_questions.hidden_at IS '非表示日時';


--
-- Name: learn_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.learn_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.learn_questions_id_seq OWNER TO postgres;

--
-- Name: learn_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.learn_questions_id_seq OWNED BY public.learn_questions.id;


--
-- Name: mainsubs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mainsubs (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.mainsubs OWNER TO postgres;

--
-- Name: mainsubs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mainsubs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainsubs_id_seq OWNER TO postgres;

--
-- Name: mainsubs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mainsubs_id_seq OWNED BY public.mainsubs.id;


--
-- Name: material_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material_categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.material_categories OWNER TO postgres;

--
-- Name: material_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.material_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.material_categories_id_seq OWNER TO postgres;

--
-- Name: material_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.material_categories_id_seq OWNED BY public.material_categories.id;


--
-- Name: materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    name2 character varying(255),
    name3 character varying(255),
    season_id bigint,
    material_category_id bigint NOT NULL,
    memo character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.materials OWNER TO postgres;

--
-- Name: materials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_id_seq OWNER TO postgres;

--
-- Name: materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_id_seq OWNED BY public.materials.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    body character varying(255) NOT NULL,
    image_path character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_id_seq OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: nutrient_materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nutrient_materials (
    id bigint NOT NULL,
    nutrient_id bigint NOT NULL,
    material_id bigint NOT NULL,
    memo character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.nutrient_materials OWNER TO postgres;

--
-- Name: nutrient_materials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nutrient_materials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nutrient_materials_id_seq OWNER TO postgres;

--
-- Name: nutrient_materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nutrient_materials_id_seq OWNED BY public.nutrient_materials.id;


--
-- Name: nutrients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nutrients (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    memo character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.nutrients OWNER TO postgres;

--
-- Name: nutrients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nutrients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nutrients_id_seq OWNER TO postgres;

--
-- Name: nutrients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nutrients_id_seq OWNED BY public.nutrients.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- Name: recipe_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipe_categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.recipe_categories OWNER TO postgres;

--
-- Name: recipe_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipe_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_categories_id_seq OWNER TO postgres;

--
-- Name: recipe_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipe_categories_id_seq OWNED BY public.recipe_categories.id;


--
-- Name: recipe_countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipe_countries (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.recipe_countries OWNER TO postgres;

--
-- Name: recipe_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipe_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_countries_id_seq OWNER TO postgres;

--
-- Name: recipe_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipe_countries_id_seq OWNED BY public.recipe_countries.id;


--
-- Name: recipe_materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipe_materials (
    id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    material_id bigint NOT NULL,
    amount character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.recipe_materials OWNER TO postgres;

--
-- Name: recipe_materials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipe_materials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_materials_id_seq OWNER TO postgres;

--
-- Name: recipe_materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipe_materials_id_seq OWNED BY public.recipe_materials.id;


--
-- Name: recipe_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipe_tags (
    id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    tag_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.recipe_tags OWNER TO postgres;

--
-- Name: recipe_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipe_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_tags_id_seq OWNER TO postgres;

--
-- Name: recipe_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipe_tags_id_seq OWNED BY public.recipe_tags.id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipes (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    body text NOT NULL,
    recipe_category_id bigint,
    menu_id bigint NOT NULL,
    howto_id bigint,
    recipe_country_id bigint,
    mainsub_id bigint,
    season_id bigint,
    image_path character varying(255),
    image_path2 character varying(255),
    is_easy integer DEFAULT 0 NOT NULL,
    is_favorite integer DEFAULT 0 NOT NULL,
    is_refresh integer DEFAULT 0 NOT NULL,
    is_healthy integer DEFAULT 0 NOT NULL,
    is_caloryoff integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.recipes OWNER TO postgres;

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO postgres;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;


--
-- Name: seasonings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seasonings (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    recipe_id bigint NOT NULL,
    body character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.seasonings OWNER TO postgres;

--
-- Name: seasonings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seasonings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seasonings_id_seq OWNER TO postgres;

--
-- Name: seasonings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seasonings_id_seq OWNED BY public.seasonings.id;


--
-- Name: seasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seasons (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.seasons OWNER TO postgres;

--
-- Name: seasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seasons_id_seq OWNER TO postgres;

--
-- Name: seasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seasons_id_seq OWNED BY public.seasons.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: howtos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.howtos ALTER COLUMN id SET DEFAULT nextval('public.howtos_id_seq'::regclass);


--
-- Name: l_trans_qs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.l_trans_qs ALTER COLUMN id SET DEFAULT nextval('public.l_trans_qs_id_seq'::regclass);


--
-- Name: learn_questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.learn_questions ALTER COLUMN id SET DEFAULT nextval('public.learn_questions_id_seq'::regclass);


--
-- Name: mainsubs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainsubs ALTER COLUMN id SET DEFAULT nextval('public.mainsubs_id_seq'::regclass);


--
-- Name: material_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_categories ALTER COLUMN id SET DEFAULT nextval('public.material_categories_id_seq'::regclass);


--
-- Name: materials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials ALTER COLUMN id SET DEFAULT nextval('public.materials_id_seq'::regclass);


--
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: nutrient_materials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nutrient_materials ALTER COLUMN id SET DEFAULT nextval('public.nutrient_materials_id_seq'::regclass);


--
-- Name: nutrients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nutrients ALTER COLUMN id SET DEFAULT nextval('public.nutrients_id_seq'::regclass);


--
-- Name: recipe_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_categories ALTER COLUMN id SET DEFAULT nextval('public.recipe_categories_id_seq'::regclass);


--
-- Name: recipe_countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_countries ALTER COLUMN id SET DEFAULT nextval('public.recipe_countries_id_seq'::regclass);


--
-- Name: recipe_materials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_materials ALTER COLUMN id SET DEFAULT nextval('public.recipe_materials_id_seq'::regclass);


--
-- Name: recipe_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_tags ALTER COLUMN id SET DEFAULT nextval('public.recipe_tags_id_seq'::regclass);


--
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- Name: seasonings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seasonings ALTER COLUMN id SET DEFAULT nextval('public.seasonings_id_seq'::regclass);


--
-- Name: seasons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seasons ALTER COLUMN id SET DEFAULT nextval('public.seasons_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: howtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.howtos (id, name, created_at, updated_at) FROM stdin;
1	圧力鍋	2021-11-03 01:57:03	2021-11-03 01:57:03
2	オーブン	2021-11-03 01:57:03	2021-11-03 01:57:03
3	レンジ	2021-11-03 01:57:03	2021-11-03 01:57:03
\.


--
-- Data for Name: l_trans_qs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.l_trans_qs (id, type, q, a, hint1, hint2, tried, cleared, rate, previous_try, created_at, updated_at) FROM stdin;
1	CN	先生のおかげで良い成績が取れました	多亏老师的指导和帮助,我取得了很好的成绩	\N	\N	0	0	0	f	2024-05-05	2024-05-05
2	CN	最初は仕事を辞めて留学へ行こうと考えていました	最初我打算辞职去留学\n	\N	\N	0	0	0	f	2024-05-05	2024-05-05
3	CN	私は彼のホームページのスクリーンショットを取りました	我截了一张他的主页的图	\N	\N	0	0	0	f	2024-05-05	2024-05-05
4	CN	クラス分けテストを受けました	我参加了分班考试/我接受了分考试.\n	\N	\N	0	0	0	f	2024-05-05	2024-05-05
5	CN	彼女は私と同じクラスの学生です	她是我的同班同学	\N	\N	0	0	0	f	2024-05-05	2024-05-05
6	CN	現地の人はとても優しかったです	在这里的当地人很溫柔	\N	\N	0	0	0	f	2024-05-05	2024-05-05
7	CN	彼は足にケガをした	他的脚受了	\N	\N	0	0	0	f	2024-05-05	2024-05-05
8	CN	頭部に重傷を負った	光部受重	\N	\N	0	0	0	f	2024-05-05	2024-05-05
9	CN	ケガをした部位はどこですか？	受傷部位在哪里	\N	\N	0	0	0	f	2024-05-05	2024-05-05
10	CN	薬局にあったらいいなと思うものは何ですか？	你想要在葯房看到什么	\N	\N	0	0	0	f	2024-05-05	2024-05-05
11	CN	根藍根	根藍根	\N	\N	0	0	0	f	2024-05-05	2024-05-05
12	CN	中国人は外国人が勇敢に中国語を話すことを、 とても度胸(勇気)があって、とても勇気の入る行動だと考えている	中国人觉得外国人勇敢说中文是很有胆量,很有勇气的行為	\N	\N	0	0	0	f	2024-05-05	2024-05-05
13	CN	フォローします	我美注你了	\N	\N	0	0	0	f	2024-05-05	2024-05-05
14	CN	フォローして下さい	清美注我(客人)(朋友)	\N	\N	0	0	0	f	2024-05-05	2024-05-05
15	CN	私の小紅アカウントをフォローして下さい	请关注我的小红书账号	\N	\N	0	0	0	f	2024-05-05	2024-05-05
16	CN	ご来店の3時間前までにご予約が必要です	提前3小時預約到店	\N	\N	0	0	0	f	2024-05-05	2024-05-05
17	CN	社長が私が小紅を始めていいと言いました	他説我可以做小紅的内容(在小紅上宣传)	\N	\N	0	0	0	f	2024-05-05	2024-05-05
18	CN	大学に入った時からそう思っていましたか?	剛逆大学就送会想的?	\N	\N	0	0	0	f	2024-05-05	2024-05-05
19	CN	大学で学ぶ	读大学	\N	\N	0	0	0	f	2024-05-05	2024-05-05
20	CN	大学院で学ぶ	读研究生	\N	\N	0	0	0	f	2024-05-05	2024-05-05
21	CN	博士課程で学ぶ	读博士	\N	\N	0	0	0	f	2024-05-05	2024-05-05
22	CN	彼女は大学を終えないで、仕事に就いた	地没完大学・就去工作了	\N	\N	0	0	0	f	2024-05-05	2024-05-05
23	CN	初めて給料をもらった	第一次到工資	\N	\N	0	0	0	f	2024-05-05	2024-05-05
24	CN	わたしの給料は少ない	我的工資很少	\N	\N	0	0	0	f	2024-05-05	2024-05-05
25	CN	給料を上げてほしいと言っているのですか?	説你想工資?	\N	\N	0	0	0	f	2024-05-05	2024-05-05
26	CN	いつその給料を受け取れますか?	我社会的候能收到那个二資?	\N	\N	0	0	0	f	2024-05-05	2024-05-05
27	CN	日本では過去10年で実質賃金が大幅に下がった	日本在辻去的10年中央工大幅下降	\N	\N	0	0	0	f	2024-05-05	2024-05-05
28	CN	中年危機は40~60才の段階の中年人が 事業、健康、家庭や婚姻など多方面の 問題に直面することを指している	中年危机,是指40到60分段的中華人他們可能要面事、健康、家庭和婚姻等多方面的問題	\N	\N	0	0	0	f	2024-05-05	2024-05-05
29	CN	仕事が不安定	工作不穏定	\N	\N	0	0	0	f	2024-05-05	2024-05-05
30	CN	自営業	个体经营	\N	\N	0	0	0	f	2024-05-05	2024-05-05
31	CN	チェーン店	連鎖店	\N	\N	0	0	0	f	2024-05-05	2024-05-05
32	CN	私は〇〇会社に就職しました	我在〇〇公司東方	\N	\N	0	0	0	f	2024-05-05	2024-05-05
33	CN	ひっぱらないで	你別捜我	\N	\N	0	0	0	f	2024-05-05	2024-05-05
34	CN	上から目線はやめて	你別子	\N	\N	0	0	0	f	2024-05-05	2024-05-05
36	CN	北京の戸籍がほしい	想上北京戸口	\N	\N	0	0	0	f	2024-05-05	2024-05-05
37	CN	ある人は家が必要だと思った時に、へんぴなところに 行って家を買うことを選ぶ	有一些人他行想要房子、他行洗浄去偏远的地方买房子	\N	\N	0	0	0	f	2024-05-05	2024-05-05
38	CN	今日は一緒にごはん食べれる?	今天和你可以吃饭?	\N	\N	0	0	0	f	2024-05-05	2024-05-05
39	CN	状況によるよ、もし仕事が早く終わったら大丈夫	一看情况,如果我的工作结束的早就可以	\N	\N	0	0	0	f	2024-05-05	2024-05-05
40	CN	場所による	也看在	\N	\N	0	0	0	f	2024-05-05	2024-05-05
41	CN	方法による	也香用	\N	\N	0	0	0	f	2024-05-05	2024-05-05
42	CN	アルバイトをしてお金を貯める	打工来存銭	\N	\N	0	0	0	f	2024-05-05	2024-05-05
43	CN	夢を実現するために金を貯める	我会実現梦想而存銭	\N	\N	0	0	0	f	2024-05-05	2024-05-05
35	CN	ふとんをたたまない	不整被(子)	\N	\N	0	0	0	f	2024-05-05	2024-05-06
44	CN	今日はいい天気ですね	今天天气真好,不是吗	\N	\N	0	0	0	f	2024-05-06	2024-05-06
\.


--
-- Data for Name: learn_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.learn_questions (id, type, q, a, hint1, hint2, tried, cleared, ratio, tried_at, created_at, updated_at, hidden_at) FROM stdin;
1	0	先生のおかげで良い成績が取れました	多亏老师的指导和帮助,我取得了很好的成绩	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
2	0	最初は仕事を辞めて留学へ行こうと考えていました	最初我打算辞职去留学	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
3	0	私は彼のホームページのスクリーンショットを取りました	我截了一张他的主页的图	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
4	0	クラス分けテストを受けました	我参加了分班考试/我接受了分考试.	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
5	0	彼女は私と同じクラスの学生です	她是我的同班同学	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
6	0	現地の人はとても優しかったです	在这里的当地人很溫柔	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
7	0	彼は足にケガをした	他的脚受了	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
8	0	頭部に重傷を負った	光部受重	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
9	0	ケガをした部位はどこですか？	受傷部位在哪里	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
10	0	薬局にあったらいいなと思うものは何ですか？	你想要在葯房看到什么	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
11	0	中国人は外国人が勇敢に中国語を話すことを、 とても度胸(勇気)があって、とても勇気の入る行動だと考えている	中国人觉得外国人勇敢说中文是很有胆量,很有勇气的行為	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
12	0	フォローします	我美注你了	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
13	0	フォローして下さい	清美注我(客人)(朋友)	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
14	0	私の小紅アカウントをフォローして下さい	请关注我的小红书账号	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
15	0	ご来店の3時間前までにご予約が必要です	提前3小時預約到店	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
16	0	社長は私が小紅を始めていいと言いました	他説我可以做小紅的内容(在小紅上宣传)	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
17	0	大学に入った時からそう思っていましたか?	剛逆大学就送会想的?	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
18	0	大学で学ぶ	读大学	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
19	0	大学院で学ぶ	读研究生	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
20	0	博士課程で学ぶ	读研究生	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
21	0	博士課程で学ぶ	读博士	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
22	0	彼女は大学を終えないで、仕事に就いた	地没完大学・就去工作了	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
23	0	初めて給料をもらった	第一次到工資	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
24	0	わたしの給料は少ない	我的工資很少	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
25	0	給料を上げてほしいと言っているのですか?	説你想工資?	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
26	0	いつその給料を受け取れますか?	我社会的候能收到那个二資?	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
27	0	日本では過去10年で実質賃金が大幅に下がった	日本在辻去的10年中央工大幅下降	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
28	0	中年危機は40~60才の段階の中年人が 事業、健康、家庭や婚姻など多方面の 問題に直面することを指している	中年危机,是指40到60分段的中華人他們可能要面事、健康、家庭和婚姻等多方面的問題	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
29	0	仕事が不安定	工作不穏定	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
30	0	自営業	个体经营	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
31	0	チェーン店	連鎖店	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
32	0	私は〇〇会社に就職しました	我在〇〇公司東方	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
33	0	ひっぱらないで	你別捜我	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
34	0	上から目線はやめて	你別子	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
35	0	北京の戸籍がほしい	想上北京戸口	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
36	0	ある人は家が必要だと思った時に、へんぴなところに 行って家を買うことを選ぶ	有一些人他行想要房子、他行洗浄去偏远的地方买房子	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
37	0	今日は一緒にごはん食べれる?	今天和你可以吃饭?	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
38	0	状況によるよ、もし仕事が早く終わったら大丈夫	一看情况,如果我的工作结束的早就可以	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
39	0	場所による	也看在	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
40	0	方法による	也香用	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
41	0	アルバイトをしてお金を貯める	打工来存銭	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
42	0	夢を実現するために金を貯める	我会実現梦想而存銭	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
43	0	ふとんをたたまない	不整被(子)	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
44	0	今日はいい天気ですね	今天天气真好,不是吗	\N	\N	0	0	0	\N	2025-02-02 06:15:35	\N	\N
\.


--
-- Data for Name: mainsubs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mainsubs (id, name, created_at, updated_at) FROM stdin;
1	主菜	2021-12-06 07:06:00	2021-12-06 07:06:00
2	副菜	2021-12-06 07:06:00	2021-12-06 07:06:00
3	その他	2021-12-06 07:06:00	2021-12-06 07:06:00
\.


--
-- Data for Name: material_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.material_categories (id, name, created_at, updated_at) FROM stdin;
1	豆類	2021-11-03 02:04:59	2021-11-03 02:04:59
2	穀類	2021-11-03 02:04:59	2021-11-03 02:04:59
3	野菜	2021-11-03 02:04:59	2021-11-03 02:04:59
4	果実・香辛料類	2021-11-03 02:04:59	2021-11-03 02:04:59
5	きのこ・海藻	2021-11-03 02:04:59	2021-11-03 02:04:59
6	魚	2021-11-03 02:04:59	2021-11-03 02:04:59
7	肉	2021-11-03 02:04:59	2021-11-03 02:04:59
8	嗜好品	2021-11-03 02:04:59	2021-11-03 02:04:59
9	甘味類	2021-11-03 02:04:59	2021-11-03 02:04:59
10	乾物	2021-11-03 02:04:59	2021-11-03 02:04:59
11	油脂・調味料	2021-11-03 02:04:59	2021-11-03 02:04:59
12	乳類	2021-11-03 02:04:59	2021-11-03 02:04:59
13	卵類・たんぱく質	2021-11-03 02:04:59	2021-11-03 02:04:59
\.


--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials (id, name, name2, name3, season_id, material_category_id, memo, created_at, updated_at) FROM stdin;
1	枝豆	えだまめ		\N	1		2021-10-21 04:39:18	2021-10-21 04:39:18
2	みそ	味噌		\N	1		2021-10-21 04:39:18	2021-10-21 04:39:18
3	調製豆乳			\N	1		2021-10-21 04:39:18	2021-10-21 04:39:18
4	無調製豆乳			\N	1		2021-10-21 04:39:18	2021-10-21 04:39:18
5	ごま			\N	1		2021-10-21 04:39:18	2021-10-21 04:39:18
6	小豆			\N	1		2021-10-21 04:39:18	2021-10-21 04:39:18
7	煮小豆			\N	1		2021-10-21 04:39:18	2021-10-21 04:39:18
8	豆腐			\N	1		2021-10-21 04:39:18	2021-10-21 04:39:18
9	黒豆			\N	1		2021-10-21 04:39:18	2021-10-21 04:39:18
10	米	ごはん		\N	2		2021-10-21 04:39:18	2021-10-21 04:39:18
11	強力粉			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
12	薄力粉			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
13	てんぷら粉			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
14	米(無洗米)			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
15	雑穀			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
16	コーン			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
17	パン粉			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
18	さつま芋			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
19	米粉			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
20	春巻きの皮			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
21	スパゲッティ	パスタ		\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
22	じゃがいも	ポテト		\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
23	フランスパン			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
24	ラザニア			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
25	コーン（クリーム）			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
26	コーン(粒)			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
27	餃子の皮			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
28	中華麺(生・太麺)			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
29	角もち			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
30	冷凍パイシート			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
31	わらびもち粉			\N	2		2021-10-21 05:50:05	2021-10-21 05:50:05
32	白ねぎ	ネギ	\N	\N	3		2021-10-21 05:50:05	2021-12-02 01:57:37
33	水菜			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
34	きゅうり			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
35	玉ねぎ			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
36	紫玉ねぎ			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
37	セロリ			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
38	赤パプリカ			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
39	グリーンリーフ			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
40	小松菜			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
41	ほうれん草			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
42	トマト			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
43	ゴーヤ			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
44	ズッキーニ			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
45	大根			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
46	青じそ			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
47	紅芯大根			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
48	わけぎ			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
49	ルッコラ			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
50	プチトマト			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
51	人参	にんじん		\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
52	キムチ(白菜)			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
53	トレビス			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
54	青ねぎ	ネギ	\N	\N	3		2021-10-21 05:50:05	2021-12-02 01:58:14
55	キャベツ			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
56	ごぼう			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
57	春菊			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
58	たくわん			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
59	かぶ	カブ		\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
60	紫キャベツ			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
61	かぼちゃ	カボチャ	南瓜	\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
62	れんこん			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
63	ピーマン			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
64	菜の花			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
65	スナップえんどう			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
66	ニラ	にら		\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
67	なす	ナス		\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
68	オクラ	おくら		\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
69	みょうが	茗荷	ミョウガ	\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
70	黄パプリカ			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
71	みつ葉			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
72	ブロッコリー			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
73	しし唐辛子			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
75	グリーンアスパラガス			\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
76	筍(水煮)	たけのこ		\N	3		2021-10-21 05:50:05	2021-10-21 05:50:05
77	ライム			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
78	ぶどう			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
79	りんご			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
80	レモン			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
81	エルダーフラワーコーディアル			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
82	ミントの葉			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
83	セルフィーユ			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
84	バジル			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
85	アボガド			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
86	キウイフルーツ			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
87	バナナ			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
88	いちご	ストロベリー		\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
89	栗渋皮煮	くり		\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
90	グリーンレーズン			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
91	ローリエ			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
92	オレンジ	みかん		\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
93	ブラックオリーブ			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
94	タイム			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
95	ディル			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
96	ラズベリー(冷凍)			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
97	ブルーベリー(冷凍)			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
98	アーモンドスライス			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
99	サフラン			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
100	くるみ	胡桃	クルミ	\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
101	マンゴー(冷凍)			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
102	ライチ(缶)			\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
103	生姜	しょうが		\N	4		2021-10-21 05:50:05	2021-10-21 05:50:05
104	しめじ			\N	5		2021-10-21 05:50:05	2021-10-21 05:50:05
105	きざみ海苔			\N	5		2021-10-21 05:50:05	2021-10-21 05:50:05
106	焼き海苔	のり		\N	5		2021-10-21 05:50:05	2021-10-21 05:50:05
107	椎茸	しいたけ		\N	5		2021-10-21 05:50:05	2021-10-21 05:50:05
108	ポルチーニ茸			\N	5		2021-10-21 05:50:05	2021-10-21 05:50:05
109	わかめ	ワカメ		\N	5		2021-10-21 05:50:05	2021-10-21 05:50:05
110	まいたけ			\N	5		2021-10-21 05:50:05	2021-10-21 05:50:05
111	えのき茸			\N	5		2021-10-21 05:50:05	2021-10-21 05:50:05
112	マッシュルーム			\N	5		2021-10-21 05:50:05	2021-10-21 05:50:05
113	ツナ缶			\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
114	辛子明太子			\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
115	アジ	鯵	あじ	\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
116	むき海老	えび		\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
117	カニ風味かまぼこ			\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
118	はんぺん			\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
119	スモークサーモン			\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
120	さきいか			\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
121	あさり	アサリ		\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
122	あさり(殻付き)			\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
123	しじみ	シジミ		\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
124	たらこ			\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
125	ちりめんじゃこ			\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
126	かまぼこ			\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
127	海老(有頭)	えび		\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
128	ロブスター			\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
129	鯛	タイ		\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
130	鰤	ぶり		\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
131	ほたて貝柱			\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
132	練りうに	ウニ		\N	6		2021-10-21 05:50:05	2021-10-21 05:50:05
133	牛肩ロース薄切り肉	牛肉	ビーフ	\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
134	鶏もも肉	鶏肉		\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
135	豚ロース薄切り	豚肉		\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
136	豚バラ薄切り肉	豚肉		\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
137	鶏手羽中	鶏肉		\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
138	鶏ひき肉	鶏肉		\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
139	ロースハム			\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
140	ベーコン			\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
141	合い挽き肉			\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
142	豚肩ロース塊肉	豚肉		\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
143	豚ひき肉	豚肉		\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
144	フォアグラ			\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
145	豚肩ロース薄切り肉	豚肉		\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
146	ウインナー			\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
147	牛ステーキ肉	牛肉	ビーフ	\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
148	鶏手羽元	鶏肉		\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
149	牛もも塊肉	牛肉	ビーフ	\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
150	スペアリブ			\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
151	豚バラ塊肉	豚肉		\N	7		2021-10-21 05:50:05	2021-10-21 05:50:05
152	インスタントコーヒー			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
153	グレープフルーツジュース			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
154	ラム酒			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
155	クコの実			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
156	味つきザーサイ	搾菜	ザーサイ	\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
157	黒練ごま			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
158	トマトジュース			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
159	ピーナッツクリーム			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
160	ピンクペッパー			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
161	レッドペッパー			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
162	赤ワイン			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
163	ゆず茶	柚子茶		\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
164	インスタントドライイースト			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
165	ターメリック			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
166	クミンシード			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
167	クミンパウダー			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
168	ガラムマサラ			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
169	抹茶			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
170	ストロベリーリキュール			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
171	サイダー			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
172	白ワイン			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
173	フランボワーズリキュール			\N	8		2021-10-21 05:50:05	2021-10-21 05:50:05
174	フロストシュガー			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
175	白玉粉	しらたま		\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
176	はちみつ			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
177	カステラ			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
178	フルーツグラノーラ			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
179	コーンフレーク			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
180	チョコレートシロップ			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
181	羊羹			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
182	ココアパウダー			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
183	パイナップル(缶)			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
184	黒こしあん			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
185	マンゴージャム			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
186	粉糖			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
187	いちご(フリーズドライパウダー)			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
188	いちごジャム			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
189	ブルーベリージャム			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
190	市販のマカロンミックス			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
191	きび砂糖			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
192	砂糖	さとう		\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
193	ミックスフルーツ(缶)			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
194	メープルシロップ			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
195	洋梨(缶)			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
196	市販のキャラメルシロップ			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
197	ラズベリージャム			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
198	りんごジャム			\N	9		2021-10-21 05:50:05	2021-10-21 05:50:05
199	切り干し大根			\N	10		2021-10-21 05:50:05	2021-10-21 05:50:05
200	ゆかり			\N	10		2021-10-21 05:50:05	2021-10-21 05:50:05
201	桜の花の塩漬け			\N	10		2021-10-21 05:50:05	2021-10-21 05:50:05
202	削りがつお			\N	10		2021-10-21 05:50:05	2021-10-21 05:50:05
203	素干し海老			\N	10		2021-10-21 05:50:05	2021-10-21 05:50:05
204	芽ひじき			\N	10		2021-10-21 05:50:05	2021-10-21 05:50:05
205	チリインオイル			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
206	ナンプラー			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
207	スイートチリソース			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
208	マヨネーズ			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
209	市販のカットトマト			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
210	カレー粉			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
211	鶏がらスープの素			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
212	マスタード			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
213	ウスターソース			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
214	バニラオイル			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
215	ごま油			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
216	だしじょうゆ	だし醤油		\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
217	片栗粉			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
218	オリーブオイル			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
219	和風だしの素			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
220	ポン酢しょうゆ			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
221	黒こしょう	黒胡椒		\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
222	コンソメ顆粒			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
223	岩塩			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
224	市販のデミグラスソース			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
225	市販ホワイトソース			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
226	市販トマトソース			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
227	アーモンドパウダー			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
228	アーモンドエッセンス			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
229	カスタードクリームパウダー			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
230	ココナッツミルクパウダー			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
231	ベーキングパウダー			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
232	トマトケチャップ			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
233	トマトペースト			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
234	コチュジャン			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
235	チリパウダー			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
236	黒酢			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
237	白だし			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
238	白こしょう			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
239	赤唐辛子(輪切り)			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
240	粒マスタード			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
241	ナツメグ			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
242	豆板醤			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
243	トウチ			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
244	青花椒(アオホワジャオ)			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
245	テンメジャン			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
246	ラー油			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
247	ターメリック			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
248	オイスターソース			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
249	酒			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
250	塩こうじ	塩麹		\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
251	しょうゆこうじ	醤油麹	醤油こうじ	\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
252	ゆずこしょう	柚子こしょう	ゆず胡椒	\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
253	市販のタルタルソース			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
254	ハーブ&スパイスミックス調味料			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
255	チョウテンガンシンジャオ			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
256	にんにく			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
257	イタリアンパセリ			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
258	パセリ			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
259	バジル			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
260	生クリーム			\N	12		2021-10-21 05:50:05	2021-10-21 05:50:05
261	スライスチーズ			\N	12		2021-10-21 05:50:05	2021-10-21 05:50:05
262	バター			\N	12		2021-10-21 05:50:05	2021-10-21 05:50:05
263	バター(食塩不使用)			\N	12		2021-10-21 05:50:05	2021-10-21 05:50:05
264	牛乳	ミルク		\N	12		2021-10-21 05:50:05	2021-10-21 05:50:05
265	サワークリーム			\N	12		2021-10-21 05:50:05	2021-10-21 05:50:05
266	ピザ用チーズ			\N	12		2021-10-21 05:50:05	2021-10-21 05:50:05
267	粉チーズ			\N	12		2021-10-21 05:50:05	2021-10-21 05:50:05
268	ラクレットチーズ			\N	12		2021-10-21 05:50:05	2021-10-21 05:50:05
269	クリームチーズ			\N	12		2021-10-21 05:50:05	2021-10-21 05:50:05
270	カマンベールチーズ			\N	12		2021-10-21 05:50:05	2021-10-21 05:50:05
271	プレーンヨーグルト			\N	12		2021-10-21 05:50:05	2021-10-21 05:50:05
272	プロセスチーズ			\N	12		2021-10-21 05:50:05	2021-10-21 05:50:05
273	コンデンスミルク			\N	12		2021-10-21 05:50:05	2021-10-21 05:50:05
274	温泉卵			\N	13		2021-10-21 05:50:05	2021-10-21 05:50:05
275	卵	エッグ	たまご	\N	13		2021-10-21 05:50:05	2021-10-21 05:50:05
276	粉ゼラチン			\N	13		2021-10-21 05:50:05	2021-10-21 05:50:05
277	酢			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
278	塩			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
279	醤油	しょうゆ		\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
280	エキストラバージンオリーブオイル	オリーブオイル		\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
281	削りがつお			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
282	たくわん			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
283	市販のドレッシング			\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
284	市販のきざみしょうが	しょうが	生姜	\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
285	市販のきざみにんにく	にんにく	ニンニク	\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
286	市販のおろしにんにく	にんにく	ニンニク	\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
287	市販のおろししょうが	生姜	しょうが	\N	11		2021-10-21 05:50:05	2021-10-21 05:50:05
288	生クリーム			\N	12		2021-11-04 02:00:22	2021-11-04 02:00:22
289	フロストシュガー			\N	9		2021-11-04 02:00:22	2021-11-04 02:00:22
290	クコの実			\N	4		2021-11-04 02:00:22	2021-11-04 02:00:22
291	ツナ缶	ツナ	\N	\N	6	\N	2021-12-02 01:39:32	2021-12-02 01:39:32
292	しめじ	\N	\N	\N	5	\N	2021-12-02 01:43:47	2021-12-02 01:43:47
293	ねぎ	青ねぎ	白ネギ	\N	3	\N	2021-12-02 01:50:34	2021-12-02 01:50:34
294	牛肩ロース	\N	\N	\N	7	\N	2021-12-02 12:20:44	2021-12-02 12:20:44
295	牛肩ロース薄切り	\N	\N	\N	7	\N	2021-12-02 12:21:48	2021-12-02 12:21:48
296	米	\N	\N	\N	2	\N	2021-12-02 12:25:57	2021-12-02 12:25:57
297	食パン	パン	\N	\N	2	\N	2021-12-08 13:50:39	2021-12-08 13:50:39
298	グレープフルーツ	グレープフルーツ(ルビー)	\N	\N	4	\N	2021-12-09 01:40:57	2021-12-09 01:40:57
299	コアントロー	\N	\N	\N	8	\N	2021-12-09 01:42:22	2021-12-09 01:42:22
300	シーフードミックス	\N	\N	\N	6	\N	2021-12-09 02:14:20	2021-12-09 02:14:20
301	豚肩ロース	豚肩ロース肉	\N	\N	7	\N	2021-12-09 08:40:41	2021-12-09 08:40:41
302	白みそ	白味噌	白ミソ	\N	1	\N	2021-12-10 01:16:07	2021-12-10 01:16:07
303	ローズマリー	\N	\N	\N	11	\N	2021-12-10 09:43:41	2021-12-10 09:43:41
304	温泉卵	温泉たまご	\N	\N	13	\N	2021-12-10 10:10:30	2021-12-10 10:10:30
305	オレンジジャム	\N	\N	\N	9	\N	2021-12-10 10:17:09	2021-12-10 10:17:09
306	ロールパン	\N	\N	\N	2	\N	2021-12-10 10:23:23	2021-12-10 10:23:23
307	薄口醤油	薄口しょうゆ	\N	\N	11	\N	2021-12-10 13:32:27	2021-12-10 13:32:27
308	くちなしの実	クチナシの実	\N	\N	4	\N	2021-12-10 13:43:43	2021-12-10 13:43:43
309	水飴	水あめ	\N	\N	9	\N	2021-12-10 13:44:06	2021-12-10 13:44:06
310	栗の甘露煮	くりの甘露煮	\N	\N	4	\N	2021-12-10 13:44:33	2021-12-10 13:44:33
311	干し柿	干柿	\N	\N	4	\N	2021-12-11 00:21:03	2021-12-11 00:21:03
312	みりん	ミリン	\N	\N	11	\N	2021-12-11 00:29:58	2021-12-11 00:29:58
313	アンチョビペースト	\N	\N	\N	11	\N	2021-12-11 03:22:54	2021-12-11 03:22:54
314	もやし	\N	\N	0	3	\N	2025-02-01 06:22:07	2025-02-01 06:22:07
74	長芋	山芋	山薬	5	3		2021-10-21 05:50:05	2025-02-11 05:54:15
\.


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menus (id, name, body, image_path, created_at, updated_at) FROM stdin;
1	2010A	黒酢酢豚・きゅうりの浅漬け・中華風コーンスープ・黒ごまプリン	0.10A.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
2	2010B	チキンカレー・ほうれん草とヨーグルトのカレー・チーズクルチャ&ターメリックライス・マンゴーラッシー	0.10B.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
3	2010C	手打ちニョッキのチーズグラタン・スパイシーチキン・かぼちゃとナッツのサラダ&トマトとルッコラのサラダ・まるごとマロンケーキ	0.10C.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
4	2011A	みそしょうが焼き・雑穀ご飯・ミネラルサラダ・きのこの豆乳みそ汁・キャラメル豆乳プリン	0.11A.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
5	2011B	チリトマトカルボナーラ・マスタードチキングリル・焼ききのこサラダ・洋梨のクラフティ	0.11B.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
6	2012A	ローストビーフ〜玉ねぎとしょうゆこうじのソース・トマトのポトフ〜チーズバゲット〜・グラスディップサラダ・ホワイトムース〜ベリーソース仕立て〜	0.12A.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
7	2012B	伊達巻き寿司・スペアリブの香味みそ焼き・海老のタルタルグリル・紅芯大根のゆずこしょう甘酢・かまぼこのクリームチーズサンド・関東風雑煮	0.12B.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
8	2012C	ロブスターのビスク風パスタ・マッシュルームと温泉卵のサラダ・ヴィシソワーズ・ショコラケイク	0.12C.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
9	2101A	牛肉のステーキ〜レモンバター醤油仕立て〜・クラムチャウダー・グリーンサラダ・バラのクレープ	1.01A.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
10	2101B	万能だれ・鰤の竜田揚げ&長芋わかめ天・雑穀ご飯・圧力調理バッグで時短チャーシュー・ザーサイとかぶの豆乳みそ汁・アップルサイダーゼリー	1.01B.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
11	2101C	真鯛のポワレ〜サルサヴェルデ仕立て〜・ホタテのサフランリゾット・トマトドレッシングのサラダ・塩キャラメルミルフィーユ	1.01C.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
12	2102A	ボロネーゼソースのラザニア・オニオングラタンスープ・スモークサーモンのサラダ・チョコバナナパフェ	1.02A.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
13	2102B	5種ナムルのビビンパ・卵と海苔のスープ・チーズタッカルビ・ゆず茶のケーキ	1.02B.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
14	2102C	フォグラハンバーグステーキ・キャロットポタージュ・グリーンサラダ・珈琲プリン	1.02C.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
15	2103A	チキン南蛮〜たくあんタルタル添え・雑穀ご飯・キャベツのかきたまみそ汁・あさりと春野菜の酒蒸し・抹茶豆乳ババロア	1.03A.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
16	2103B	桜ごはん・レンジで作る洋風つくね・海老と青じその春巻き・和風ジャーマンポテト・切り干し大根のゆかり甘酢・卵焼き・桜餅	1.03B.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
17	2103C	うにトマトクリーム仕立てのロールキャベツ・菜の花とアボガドのエッグサラダ・カマンベールチーズのパーネ・オレンジのパンナコッタ	1.03C.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
18	2104A	・ハッシュドビーフのオムライス・コブサラダ・いちごのスノーボールクッキー	1.04A.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
19	2104B	四川風麻婆豆腐・雲白肉〜ウンパイロー〜・黄金チャーハン・杏仁プリン	1.04B.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
20	2104C	肉バルのラクレットプレート〜豚肉のハニーロースト&ミートボール・あさりとレモンのパエリア・オニオンサラダ・ストロベリースパークリング	1.04C.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
21	2105A	十勝若牛のステーキディッシュ・ガーリックライス・パイナップルとキャベツのコールスロー・飲むチーズケーキ	1.05A.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
22	2105B	2種のパスタ〜アマトリチャーナ&冷製たらこレモン・バジルチキンサラダ・キウイヨーグルト	1.05B.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
23	2105C	韓国風ザクザクチキン&ヤンニョムチキン・チーズキンパ・わかめの炒めドレッシングサラダ・トゥンカロン〜韓国風マカロン〜	1.05C.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
24	2106A	台湾まぜそば・ぷりぷり海老餃子・白いたまごプリン	1.06A.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
25	2106B	5種野菜と鶏肉のごま香味炒め・オクラとみょうがの冷たいみそ汁・桜海老とチーズの卵焼き・小松菜のごま和え・フルーツ和ポンチ	1.06B.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
26	2106C	豚しゃぶのスープカレー・ターメリックライス・グリルチキンウイング・アボガドとトマトのサラダ・ココナッツミルクラッシー	1.06C.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
27	2107A	スコッチエッグ・アスパラフライ・炒り黒豆のごはん・揚げなすのみそ汁・抹茶くるみわらび餅	1.07A.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
28	2107B	ガパオライス・チャーゾー〜ベトナム風揚げ春巻き〜・牛肉とミントのサラダ・マンゴーミルク	1.07B.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
29	2107C	焼き小籠包・ラーズーチー〜鶏のから揚げ甘辛四川炒め〜トマトと卵のスープ・ライチプリン	1.07C.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
30	2108A	すき焼き丼・枝豆とたたききゅうりのサラダ・焼き枝豆のみそ汁・甘酒クリームコーヒーゼリー	1.08A.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
31	2108B	プーパッポンカリー〜ソフトシェルクラブと卵のカレー炒め〜・鶏肉のピーナッツグリル・エスニックツナサラダ・グレープフルーツゼリー	1.08B.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
32	2108C	手打ちうどん〜明太チーズかま玉&トマトだしつゆ〜・豚竜田揚げのサラダ仕立て・みたらし団子	1.08C.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
33	2109A	鯵フライ・雑穀ご飯・手羽中と大根のスピード煮物・大根みそ汁・季節の水菓子	1.09A.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
34	2109B	海老コーン天むす・カラフルチキンボール・ふわふわハムたまチーズ・ズッキーニの焼きナムル・きのこのレモンソテー・紅芯大根の甘酢漬け・ブルーベリー大福	1.09B.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
35	2109C	フレッシュポルチーニのクリームパスタ・鶏肉のトマト煮込み・ぶどうとレモンのサラダ・さつま芋のモンブラン	1.09C.jpg	2021-11-03 01:58:31	2021-11-03 01:58:31
36	2110A	サクサクとろーり五目おこげ・海老チリ春巻き・わかめとザーサイの和え物・レモンティーゼリー	ZDwuUEo2vlqmH6ecjO7ZwbbV0NofA2XjGxhG5ikT.jpg	2021-11-03 01:58:31	2021-11-27 23:00:07
37	2110B	デミグラス煮込みチーズハンバーグ・かぼちゃのみそ汁・りんごと春菊のサラダ・カスタードアップルパイ	EK3a8rGWtO8sQv4RpZ4tktb5g3Pq0lM4708W92j4.jpg	2021-11-03 01:58:31	2021-11-27 23:00:42
38	2110C	チキンとかぼちゃのガーリッククリームシチュー〜シュクメルリ・とろーり卵のチーズブレッド〜ハチャプリ・ハロウィンサラダ・ウフアラネージュ〜メレンゲデザート	nH3ibCxzy9AsjN7dxceJcTyCVZ3dCV002FrUygSc.jpg	2021-11-03 01:58:31	2021-11-27 23:01:29
39	kids	基本のポークソテー	4NUsROyNI3APlXJ1yquz2ZaDznUGwFHg98l9wshF.jpg	2021-11-03 01:58:31	2021-11-28 11:48:03
40	kids	レンジで！もやしと豆苗の豚巻きレンジ蒸し	ZU2zcvLR3RlHm25mP4WffVquKMgbgdI4Yw4PS5qF.jpg	2021-11-03 01:58:31	2021-11-28 11:48:42
41	kids	香りもごちそう鮭のガリバタ醤油ムニエル	MV9CkJ1EgE2eNfRZvESmTE1dOiD6ipZ4LueuDFF7.jpg	2021-11-03 01:58:31	2021-11-28 11:50:07
42	kids	やみつきピリ辛きゅうり	ShTMzzabsp1972bTVTukYrdtAUmcSKiYHKFOkfeN.jpg	2021-11-03 01:58:31	2021-11-28 11:50:37
43	kids	ジューシー鶏の唐揚げ	ItIkOiTvzzqh3CN8VWgIf7JMZSeFe0xWv9iAElzj.jpg	2021-11-03 01:58:31	2021-11-28 12:08:42
44	kids	ふんわりやわらか！簡単海老チリ	b6FpdSofWHjC619RVMP4lRsqhx2KRfSvmkKR0i6Y.jpg	2021-11-03 01:58:31	2021-11-28 12:14:40
45	hiro	牡蠣とほうれん草のレモンクリームパスタ	EJxS74X4uLVTdAwSd0iENDhXJ2VCGUaBTtFOnbDo.jpg	2021-11-03 01:58:31	2021-11-28 11:47:17
46	hiro	しじみの中華スープ		2021-11-03 01:58:31	2021-11-03 01:58:31
47	hiro	はまぐりの潮汁		2021-11-03 01:58:31	2021-11-03 01:58:31
48	hiro	アアスパラと海老の塩ソース蒸し		2021-11-03 01:58:31	2021-11-03 01:58:31
49	hiro	あおさ汁		2021-11-03 01:58:31	2021-11-03 01:58:31
50	hiro	茶碗蒸し	OfLoCsEVaOnjp7askOG92iFlgr4mPWZaT42XCRrJ.jpg	2021-11-03 01:58:31	2021-11-28 12:04:16
51	hiro	アジのたたき	P8BGa4CyrIaQXTri7CCvMrReXbn9BNEZRfLoJcy0.jpg	2021-11-03 01:58:31	2021-11-28 12:05:08
52	hiro	カレーパン	1nQ0aqQtQlFithFeviq1Df3TCvC4Z6Wzf77tNoge.jpg	2021-11-03 01:58:31	2021-11-28 12:07:56
53	hiro	鶏肉のトマト煮込み(カチャトーラ)		2021-11-03 01:58:31	2021-11-03 01:58:31
54	2111A	ビーフカツサンド　ワンポットナポリタン　アップルピクルス&グリーンサラダ　グレープフルーツのクレープ	BKWJrRRnJ3HHzX0TwbdyqqnFEs8jynkAvTqyELsj.jpg	2021-12-09 01:13:39	2021-12-11 04:05:40
55	2111B	シーフードトマトクリームドリア　ガーリックポークステーキ　紅芯大根のレモンサラダ\\r\\nりんごのジュレ	R0uWlHI4jdufkbqUp9KpKTlWY9SRTlP0jkJXZFJn.jpg	2021-12-09 01:50:53	2021-12-11 04:05:19
56	2111C	5種のてまり寿司　フリットミスト　塩豆腐とトマトのサラダ　かぶとベーコンの白みそ椀仕立て　固めの焼きプリン	uMphfebFwUalvKIJfmrzyUAsMPgaWjDASlmeLeah.jpg	2021-12-09 09:04:57	2021-12-11 04:03:24
57	2112A	ハニーマスタードローストチキン&ローズマリーポテト・トマトのオニオンスープ・トロトロ卵のサラダ・いちごのマリトッツォ	xD03DC4rR1VMQZf5QTUIfD7LkQLtqHSKCefaUAFn.jpg	2021-12-10 01:24:13	2021-12-11 04:02:53
58	2112B	豚の角煮・海老の香味焼き・オレンジ栗きんとん・紅白なます・メープル黒豆・市田柿のサワークリーム巻き・みぞれ雑煮	pA2KGblZgKzr304tzWie19t3ChnK1SPK3PJaXcBC.jpg	2021-12-10 01:27:58	2021-12-11 04:02:02
59	2112C	牛肉のワイン煮込み・ドフィノワ~じゃが芋のグラタン~バーニャカウダ・オレンジマフィン	qXxLVmYDLoMFwpxujSYdeBZMsrjodiWd429LL6Vi.jpg	2021-12-10 01:29:35	2021-12-11 04:02:31
60	★携帯お気に入り	携帯お気に入りレシピ	\N	2021-12-13 08:52:53	2021-12-13 08:52:53
61	その他	どこにも入らない料理	\N	2021-12-13 09:09:58	2021-12-13 09:09:58
63	2201A	1 牛肉のデミポロネーぜ\r\n2 愛鯛のカルパッチョ/コーンポタージュ\r\n3 ストロベリーティラミス	\N	2025-02-11 06:00:41	2025-02-11 06:00:41
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2021_09_08_014221_create_nutrients_table	1
4	2021_09_08_025056_create_material_categories_table	1
5	2021_09_08_104855_create_materials_table	1
6	2021_09_11_004409_create_nutrient_materials_table	1
7	2021_09_15_015021_create_recipe_categories_table	1
8	2021_09_15_232130_create_howtos_table	1
9	2021_10_04_083637_create_menus_table	1
10	2021_10_09_071036_create_seasonings_table	1
11	2021_11_02_005233_create_recipes_table	1
12	2021_11_02_005234_create_recipe_materials_table	1
13	2021_12_01_000000_create_recipe_countries_table	1
14	2021_12_02_000000_create_mainsubs_table	1
15	2022_02_04_000001_create_seasons_table	1
16	2022_02_04_000002_create_tags_table	1
17	2022_02_04_000003_create_recipe_tags_table	1
18	2025_02_02_000001_create_learn_questions_table	2
\.


--
-- Data for Name: nutrient_materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nutrient_materials (id, nutrient_id, material_id, memo, created_at, updated_at) FROM stdin;
1	1	5		2021-10-21 05:52:08	2021-10-21 05:52:08
2	1	6		2021-10-21 05:52:08	2021-10-21 05:52:08
3	1	103		2021-10-21 05:52:08	2021-10-21 05:52:08
4	1	257		2021-10-21 05:52:08	2021-10-21 05:52:08
5	1	258		2021-10-21 05:52:08	2021-10-21 05:52:08
6	1	89		2021-10-21 05:52:08	2021-10-21 05:52:08
7	1	94		2021-10-21 05:52:08	2021-10-21 05:52:08
8	1	98		2021-10-21 05:52:08	2021-10-21 05:52:08
9	1	99		2021-10-21 05:52:08	2021-10-21 05:52:08
10	1	100		2021-10-21 05:52:08	2021-10-21 05:52:08
11	2	2		2021-10-21 05:52:08	2021-10-21 05:52:08
12	2	3		2021-10-21 05:52:08	2021-10-21 05:52:08
13	2	4		2021-10-21 05:52:08	2021-10-21 05:52:08
14	2	5		2021-10-21 05:52:08	2021-10-21 05:52:08
15	2	6		2021-10-21 05:52:08	2021-10-21 05:52:08
16	2	8		2021-10-21 05:52:08	2021-10-21 05:52:08
17	2	9		2021-10-21 05:52:08	2021-10-21 05:52:08
18	2	16		2021-10-21 05:52:08	2021-10-21 05:52:08
19	2	18		2021-10-21 05:52:08	2021-10-21 05:52:08
20	2	22		2021-10-21 05:52:08	2021-10-21 05:52:08
22	2	33		2021-10-21 05:52:08	2021-10-21 05:52:08
23	2	34		2021-10-21 05:52:08	2021-10-21 05:52:08
24	2	37		2021-10-21 05:52:08	2021-10-21 05:52:08
25	2	38		2021-10-21 05:52:08	2021-10-21 05:52:08
26	2	70		2021-10-21 05:52:08	2021-10-21 05:52:08
27	2	256		2021-10-21 05:52:08	2021-10-21 05:52:08
28	2	40		2021-10-21 05:52:08	2021-10-21 05:52:08
29	2	41		2021-10-21 05:52:08	2021-10-21 05:52:08
30	2	42		2021-10-21 05:52:08	2021-10-21 05:52:08
31	2	43		2021-10-21 05:52:08	2021-10-21 05:52:08
32	2	44		2021-10-21 05:52:08	2021-10-21 05:52:08
33	2	45		2021-10-21 05:52:08	2021-10-21 05:52:08
34	2	46		2021-10-21 05:52:08	2021-10-21 05:52:08
35	2	48		2021-10-21 05:52:08	2021-10-21 05:52:08
36	2	49		2021-10-21 05:52:08	2021-10-21 05:52:08
37	2	51		2021-10-21 05:52:08	2021-10-21 05:52:08
38	2	52		2021-10-21 05:52:08	2021-10-21 05:52:08
39	2	53		2021-10-21 05:52:08	2021-10-21 05:52:08
40	2	103		2021-10-21 05:52:08	2021-10-21 05:52:08
42	2	55		2021-10-21 05:52:08	2021-10-21 05:52:08
43	2	56		2021-10-21 05:52:08	2021-10-21 05:52:08
44	2	57		2021-10-21 05:52:08	2021-10-21 05:52:08
45	2	59		2021-10-21 05:52:08	2021-10-21 05:52:08
46	2	60		2021-10-21 05:52:08	2021-10-21 05:52:08
47	2	61		2021-10-21 05:52:08	2021-10-21 05:52:08
48	2	62		2021-10-21 05:52:08	2021-10-21 05:52:08
49	2	63		2021-10-21 05:52:08	2021-10-21 05:52:08
50	2	64		2021-10-21 05:52:08	2021-10-21 05:52:08
51	2	65		2021-10-21 05:52:08	2021-10-21 05:52:08
52	2	66		2021-10-21 05:52:08	2021-10-21 05:52:08
53	2	67		2021-10-21 05:52:08	2021-10-21 05:52:08
54	2	68		2021-10-21 05:52:08	2021-10-21 05:52:08
55	2	69		2021-10-21 05:52:08	2021-10-21 05:52:08
56	2	71		2021-10-21 05:52:08	2021-10-21 05:52:08
57	2	72		2021-10-21 05:52:08	2021-10-21 05:52:08
58	2	73		2021-10-21 05:52:08	2021-10-21 05:52:08
60	2	75		2021-10-21 05:52:08	2021-10-21 05:52:08
61	2	76		2021-10-21 05:52:08	2021-10-21 05:52:08
62	2	199		2021-10-21 05:52:08	2021-10-21 05:52:08
63	2	233		2021-10-21 05:52:08	2021-10-21 05:52:08
64	2	241		2021-10-21 05:52:08	2021-10-21 05:52:08
65	2	250		2021-10-21 05:52:08	2021-10-21 05:52:08
66	2	256		2021-10-21 05:52:08	2021-10-21 05:52:08
67	2	77		2021-10-21 05:52:08	2021-10-21 05:52:08
68	2	78		2021-10-21 05:52:08	2021-10-21 05:52:08
69	2	79		2021-10-21 05:52:08	2021-10-21 05:52:08
70	2	257		2021-10-21 05:52:08	2021-10-21 05:52:08
71	2	258		2021-10-21 05:52:08	2021-10-21 05:52:08
72	2	259		2021-10-21 05:52:08	2021-10-21 05:52:08
73	2	85		2021-10-21 05:52:08	2021-10-21 05:52:08
74	2	86		2021-10-21 05:52:08	2021-10-21 05:52:08
75	2	87		2021-10-21 05:52:08	2021-10-21 05:52:08
76	2	88		2021-10-21 05:52:08	2021-10-21 05:52:08
77	2	90		2021-10-21 05:52:08	2021-10-21 05:52:08
78	2	89		2021-10-21 05:52:08	2021-10-21 05:52:08
79	2	92		2021-10-21 05:52:08	2021-10-21 05:52:08
80	2	94		2021-10-21 05:52:08	2021-10-21 05:52:08
81	2	197		2021-10-21 05:52:08	2021-10-21 05:52:08
82	2	98		2021-10-21 05:52:08	2021-10-21 05:52:08
83	2	100		2021-10-21 05:52:08	2021-10-21 05:52:08
84	2	101		2021-10-21 05:52:08	2021-10-21 05:52:08
85	2	102		2021-10-21 05:52:08	2021-10-21 05:52:08
86	2	107		2021-10-21 05:52:08	2021-10-21 05:52:08
87	2	108		2021-10-21 05:52:08	2021-10-21 05:52:08
88	2	110		2021-10-21 05:52:08	2021-10-21 05:52:08
89	2	111		2021-10-21 05:52:08	2021-10-21 05:52:08
90	2	112		2021-10-21 05:52:08	2021-10-21 05:52:08
91	2	109		2021-10-21 05:52:08	2021-10-21 05:52:08
92	3	259		2021-10-21 05:52:08	2021-10-21 05:52:08
93	3	258		2021-10-21 05:52:08	2021-10-21 05:52:08
94	3	38		2021-10-21 05:52:08	2021-10-21 05:52:08
95	3	70		2021-10-21 05:52:08	2021-10-21 05:52:08
96	4	275		2021-10-21 05:52:08	2021-10-21 05:52:08
97	4	274		2021-10-21 05:52:08	2021-10-21 05:52:08
98	4	203		2021-10-21 05:52:08	2021-10-21 05:52:08
99	4	90		2021-10-21 05:52:08	2021-10-21 05:52:08
100	4	94		2021-10-21 05:52:08	2021-10-21 05:52:08
101	4	118		2021-10-21 05:52:08	2021-10-21 05:52:08
102	4	117		2021-10-21 05:52:08	2021-10-21 05:52:08
103	4	120		2021-10-21 05:52:08	2021-10-21 05:52:08
104	4	121		2021-10-21 05:52:08	2021-10-21 05:52:08
105	4	126		2021-10-21 05:52:08	2021-10-21 05:52:08
106	4	128		2021-10-21 05:52:08	2021-10-21 05:52:08
107	4	131		2021-10-21 05:52:08	2021-10-21 05:52:08
108	4	132		2021-10-21 05:52:08	2021-10-21 05:52:08
109	5	204		2021-10-21 05:52:08	2021-10-21 05:52:08
110	5	250		2021-10-21 05:52:08	2021-10-21 05:52:08
111	5	109		2021-10-21 05:52:08	2021-10-21 05:52:08
112	5	106		2021-10-21 05:52:08	2021-10-21 05:52:08
113	6	1		2021-10-21 05:52:08	2021-10-21 05:52:08
114	6	18		2021-10-21 05:52:08	2021-10-21 05:52:08
115	6	22		2021-10-21 05:52:08	2021-10-21 05:52:08
117	6	34		2021-10-21 05:52:08	2021-10-21 05:52:08
118	6	33		2021-10-21 05:52:08	2021-10-21 05:52:08
119	6	35		2021-10-21 05:52:08	2021-10-21 05:52:08
120	6	37		2021-10-21 05:52:08	2021-10-21 05:52:08
121	6	38		2021-10-21 05:52:08	2021-10-21 05:52:08
122	6	70		2021-10-21 05:52:08	2021-10-21 05:52:08
123	6	40		2021-10-21 05:52:08	2021-10-21 05:52:08
124	6	43		2021-10-21 05:52:08	2021-10-21 05:52:08
125	6	44		2021-10-21 05:52:08	2021-10-21 05:52:08
126	6	45		2021-10-21 05:52:08	2021-10-21 05:52:08
127	6	46		2021-10-21 05:52:08	2021-10-21 05:52:08
128	6	48		2021-10-21 05:52:08	2021-10-21 05:52:08
129	6	49		2021-10-21 05:52:08	2021-10-21 05:52:08
130	6	51		2021-10-21 05:52:08	2021-10-21 05:52:08
131	6	52		2021-10-21 05:52:08	2021-10-21 05:52:08
133	6	55		2021-10-21 05:52:08	2021-10-21 05:52:08
134	6	57		2021-10-21 05:52:08	2021-10-21 05:52:08
135	6	59		2021-10-21 05:52:08	2021-10-21 05:52:08
136	6	60		2021-10-21 05:52:08	2021-10-21 05:52:08
137	6	61		2021-10-21 05:52:08	2021-10-21 05:52:08
138	6	62		2021-10-21 05:52:08	2021-10-21 05:52:08
139	6	63		2021-10-21 05:52:08	2021-10-21 05:52:08
140	6	65		2021-10-21 05:52:08	2021-10-21 05:52:08
141	6	72		2021-10-21 05:52:08	2021-10-21 05:52:08
142	6	73		2021-10-21 05:52:08	2021-10-21 05:52:08
143	6	75		2021-10-21 05:52:08	2021-10-21 05:52:08
144	6	199		2021-10-21 05:52:08	2021-10-21 05:52:08
145	6	256		2021-10-21 05:52:08	2021-10-21 05:52:08
146	6	77		2021-10-21 05:52:08	2021-10-21 05:52:08
147	6	80		2021-10-21 05:52:08	2021-10-21 05:52:08
148	6	85		2021-10-21 05:52:08	2021-10-21 05:52:08
149	6	86		2021-10-21 05:52:08	2021-10-21 05:52:08
150	6	87		2021-10-21 05:52:08	2021-10-21 05:52:08
151	6	88		2021-10-21 05:52:08	2021-10-21 05:52:08
152	6	92		2021-10-21 05:52:08	2021-10-21 05:52:08
153	6	101		2021-10-21 05:52:08	2021-10-21 05:52:08
154	6	102		2021-10-21 05:52:08	2021-10-21 05:52:08
155	6	158		2021-10-21 05:52:08	2021-10-21 05:52:08
156	6	183		2021-10-21 05:52:08	2021-10-21 05:52:08
157	7	18		2021-10-21 05:52:08	2021-10-21 05:52:08
158	7	33		2021-10-21 05:52:08	2021-10-21 05:52:08
159	7	34		2021-10-21 05:52:08	2021-10-21 05:52:08
160	7	38		2021-10-21 05:52:08	2021-10-21 05:52:08
161	7	70		2021-10-21 05:52:08	2021-10-21 05:52:08
162	7	40		2021-10-21 05:52:08	2021-10-21 05:52:08
163	7	41		2021-10-21 05:52:08	2021-10-21 05:52:08
164	7	42		2021-10-21 05:52:08	2021-10-21 05:52:08
165	7	44		2021-10-21 05:52:08	2021-10-21 05:52:08
166	7	45		2021-10-21 05:52:08	2021-10-21 05:52:08
167	7	46		2021-10-21 05:52:08	2021-10-21 05:52:08
168	7	49		2021-10-21 05:52:08	2021-10-21 05:52:08
169	7	51		2021-10-21 05:52:08	2021-10-21 05:52:08
171	7	57		2021-10-21 05:52:08	2021-10-21 05:52:08
172	7	59		2021-10-21 05:52:08	2021-10-21 05:52:08
173	7	63		2021-10-21 05:52:08	2021-10-21 05:52:08
174	7	64		2021-10-21 05:52:08	2021-10-21 05:52:08
175	7	65		2021-10-21 05:52:08	2021-10-21 05:52:08
176	7	66		2021-10-21 05:52:08	2021-10-21 05:52:08
177	7	68		2021-10-21 05:52:08	2021-10-21 05:52:08
178	7	71		2021-10-21 05:52:08	2021-10-21 05:52:08
179	7	72		2021-10-21 05:52:08	2021-10-21 05:52:08
180	7	73		2021-10-21 05:52:08	2021-10-21 05:52:08
181	7	75		2021-10-21 05:52:08	2021-10-21 05:52:08
182	7	135		2021-10-21 05:52:08	2021-10-21 05:52:08
183	7	275		2021-10-21 05:52:08	2021-10-21 05:52:08
184	7	274		2021-10-21 05:52:08	2021-10-21 05:52:08
185	7	261		2021-10-21 05:52:08	2021-10-21 05:52:08
186	7	263		2021-10-21 05:52:08	2021-10-21 05:52:08
187	7	262		2021-10-21 05:52:08	2021-10-21 05:52:08
188	7	264		2021-10-21 05:52:08	2021-10-21 05:52:08
189	7	266		2021-10-21 05:52:08	2021-10-21 05:52:08
190	7	267		2021-10-21 05:52:08	2021-10-21 05:52:08
191	7	268		2021-10-21 05:52:08	2021-10-21 05:52:08
192	7	269		2021-10-21 05:52:08	2021-10-21 05:52:08
193	7	278		2021-10-21 05:52:08	2021-10-21 05:52:08
194	7	272		2021-10-21 05:52:08	2021-10-21 05:52:08
195	7	271		2021-10-21 05:52:08	2021-10-21 05:52:08
196	7	273		2021-10-21 05:52:08	2021-10-21 05:52:08
197	7	204		2021-10-21 05:52:08	2021-10-21 05:52:08
198	7	233		2021-10-21 05:52:08	2021-10-21 05:52:08
199	7	242		2021-10-21 05:52:08	2021-10-21 05:52:08
200	7	257		2021-10-21 05:52:08	2021-10-21 05:52:08
201	7	258		2021-10-21 05:52:08	2021-10-21 05:52:08
202	7	259		2021-10-21 05:52:08	2021-10-21 05:52:08
203	7	109		2021-10-21 05:52:08	2021-10-21 05:52:08
204	7	106		2021-10-21 05:52:08	2021-10-21 05:52:08
205	7	134		2021-10-21 05:52:08	2021-10-21 05:52:08
206	7	137		2021-10-21 05:52:08	2021-10-21 05:52:08
207	7	136		2021-10-21 05:52:08	2021-10-21 05:52:08
208	7	135		2021-10-21 05:52:08	2021-10-21 05:52:08
209	7	139		2021-10-21 05:52:08	2021-10-21 05:52:08
210	7	140		2021-10-21 05:52:08	2021-10-21 05:52:08
211	7	141		2021-10-21 05:52:08	2021-10-21 05:52:08
212	7	133		2021-10-21 05:52:08	2021-10-21 05:52:08
213	7	142		2021-10-21 05:52:08	2021-10-21 05:52:08
214	7	143		2021-10-21 05:52:08	2021-10-21 05:52:08
215	7	144		2021-10-21 05:52:08	2021-10-21 05:52:08
216	7	145		2021-10-21 05:52:08	2021-10-21 05:52:08
217	7	146		2021-10-21 05:52:08	2021-10-21 05:52:08
218	7	147		2021-10-21 05:52:08	2021-10-21 05:52:08
219	7	148		2021-10-21 05:52:08	2021-10-21 05:52:08
220	7	150		2021-10-21 05:52:08	2021-10-21 05:52:08
221	7	151		2021-10-21 05:52:08	2021-10-21 05:52:08
222	7	158		2021-10-21 05:52:08	2021-10-21 05:52:08
223	8	15		2021-10-21 05:52:08	2021-10-21 05:52:08
224	8	256		2021-10-21 05:52:08	2021-10-21 05:52:08
225	8	250		2021-10-21 05:52:08	2021-10-21 05:52:08
226	8	133		2021-10-21 05:52:08	2021-10-21 05:52:08
227	8	134		2021-10-21 05:52:08	2021-10-21 05:52:08
228	8	135		2021-10-21 05:52:08	2021-10-21 05:52:08
229	8	138		2021-10-21 05:52:08	2021-10-21 05:52:08
230	8	137		2021-10-21 05:52:08	2021-10-21 05:52:08
231	8	136		2021-10-21 05:52:08	2021-10-21 05:52:08
232	8	139		2021-10-21 05:52:08	2021-10-21 05:52:08
233	8	140		2021-10-21 05:52:08	2021-10-21 05:52:08
234	8	141		2021-10-21 05:52:08	2021-10-21 05:52:08
235	8	142		2021-10-21 05:52:08	2021-10-21 05:52:08
236	8	143		2021-10-21 05:52:08	2021-10-21 05:52:08
237	8	144		2021-10-21 05:52:08	2021-10-21 05:52:08
238	8	145		2021-10-21 05:52:08	2021-10-21 05:52:08
239	8	146		2021-10-21 05:52:08	2021-10-21 05:52:08
240	8	147		2021-10-21 05:52:08	2021-10-21 05:52:08
241	8	148		2021-10-21 05:52:08	2021-10-21 05:52:08
242	8	149		2021-10-21 05:52:08	2021-10-21 05:52:08
243	8	150		2021-10-21 05:52:08	2021-10-21 05:52:08
244	8	151		2021-10-21 05:52:08	2021-10-21 05:52:08
245	9	274		2021-10-21 05:52:08	2021-10-21 05:52:08
246	9	275		2021-10-21 05:52:08	2021-10-21 05:52:08
247	9	261		2021-10-21 05:52:08	2021-10-21 05:52:08
248	9	264		2021-10-21 05:52:08	2021-10-21 05:52:08
249	9	266		2021-10-21 05:52:08	2021-10-21 05:52:08
250	9	267		2021-10-21 05:52:08	2021-10-21 05:52:08
251	9	268		2021-10-21 05:52:08	2021-10-21 05:52:08
252	9	269		2021-10-21 05:52:08	2021-10-21 05:52:08
253	9	278		2021-10-21 05:52:08	2021-10-21 05:52:08
254	9	272		2021-10-21 05:52:08	2021-10-21 05:52:08
255	9	271		2021-10-21 05:52:08	2021-10-21 05:52:08
256	9	273		2021-10-21 05:52:08	2021-10-21 05:52:08
257	9	203		2021-10-21 05:52:08	2021-10-21 05:52:08
258	9	250		2021-10-21 05:52:08	2021-10-21 05:52:08
259	9	104		2021-10-21 05:52:08	2021-10-21 05:52:08
260	9	107		2021-10-21 05:52:08	2021-10-21 05:52:08
261	9	108		2021-10-21 05:52:08	2021-10-21 05:52:08
262	9	110		2021-10-21 05:52:08	2021-10-21 05:52:08
263	9	111		2021-10-21 05:52:08	2021-10-21 05:52:08
264	9	112		2021-10-21 05:52:08	2021-10-21 05:52:08
265	9	116		2021-10-21 05:52:08	2021-10-21 05:52:08
266	9	117		2021-10-21 05:52:08	2021-10-21 05:52:08
267	9	118		2021-10-21 05:52:08	2021-10-21 05:52:08
268	9	120		2021-10-21 05:52:08	2021-10-21 05:52:08
269	9	121		2021-10-21 05:52:08	2021-10-21 05:52:08
270	9	126		2021-10-21 05:52:08	2021-10-21 05:52:08
271	9	128		2021-10-21 05:52:08	2021-10-21 05:52:08
272	9	131		2021-10-21 05:52:08	2021-10-21 05:52:08
273	9	132		2021-10-21 05:52:08	2021-10-21 05:52:08
274	10	3		2021-10-21 05:52:08	2021-10-21 05:52:08
275	10	4		2021-10-21 05:52:08	2021-10-21 05:52:08
276	10	9		2021-10-21 05:52:08	2021-10-21 05:52:08
277	10	15		2021-10-21 05:52:08	2021-10-21 05:52:08
278	10	16		2021-10-21 05:52:08	2021-10-21 05:52:08
279	10	256		2021-10-21 05:52:08	2021-10-21 05:52:08
280	10	103		2021-10-21 05:52:08	2021-10-21 05:52:08
281	10	64		2021-10-21 05:52:08	2021-10-21 05:52:08
282	10	241		2021-10-21 05:52:08	2021-10-21 05:52:08
283	10	259		2021-10-21 05:52:08	2021-10-21 05:52:08
284	10	257		2021-10-21 05:52:08	2021-10-21 05:52:08
285	10	258		2021-10-21 05:52:08	2021-10-21 05:52:08
286	10	106		2021-10-21 05:52:08	2021-10-21 05:52:08
287	11	6		2021-10-21 05:52:08	2021-10-21 05:52:08
288	11	8		2021-10-21 05:52:08	2021-10-21 05:52:08
290	11	33		2021-10-21 05:52:08	2021-10-21 05:52:08
291	11	256		2021-10-21 05:52:08	2021-10-21 05:52:08
292	11	40		2021-10-21 05:52:08	2021-10-21 05:52:08
293	11	41		2021-10-21 05:52:08	2021-10-21 05:52:08
294	11	45		2021-10-21 05:52:08	2021-10-21 05:52:08
295	11	46		2021-10-21 05:52:08	2021-10-21 05:52:08
296	11	49		2021-10-21 05:52:08	2021-10-21 05:52:08
297	11	103		2021-10-21 05:52:08	2021-10-21 05:52:08
299	11	56		2021-10-21 05:52:08	2021-10-21 05:52:08
300	11	57		2021-10-21 05:52:08	2021-10-21 05:52:08
301	11	59		2021-10-21 05:52:08	2021-10-21 05:52:08
302	11	60		2021-10-21 05:52:08	2021-10-21 05:52:08
303	11	64		2021-10-21 05:52:08	2021-10-21 05:52:08
304	11	66		2021-10-21 05:52:08	2021-10-21 05:52:08
305	11	68		2021-10-21 05:52:08	2021-10-21 05:52:08
306	11	261		2021-10-21 05:52:08	2021-10-21 05:52:08
307	11	264		2021-10-21 05:52:08	2021-10-21 05:52:08
308	11	265		2021-10-21 05:52:08	2021-10-21 05:52:08
309	11	266		2021-10-21 05:52:08	2021-10-21 05:52:08
310	11	268		2021-10-21 05:52:08	2021-10-21 05:52:08
311	11	267		2021-10-21 05:52:08	2021-10-21 05:52:08
312	11	269		2021-10-21 05:52:08	2021-10-21 05:52:08
313	11	270		2021-10-21 05:52:08	2021-10-21 05:52:08
314	11	272		2021-10-21 05:52:08	2021-10-21 05:52:08
315	11	271		2021-10-21 05:52:08	2021-10-21 05:52:08
316	11	273		2021-10-21 05:52:08	2021-10-21 05:52:08
317	11	199		2021-10-21 05:52:08	2021-10-21 05:52:08
318	11	202		2021-10-21 05:52:08	2021-10-21 05:52:08
319	11	203		2021-10-21 05:52:08	2021-10-21 05:52:08
320	11	204		2021-10-21 05:52:08	2021-10-21 05:52:08
321	11	250		2021-10-21 05:52:08	2021-10-21 05:52:08
322	11	257		2021-10-21 05:52:08	2021-10-21 05:52:08
323	11	258		2021-10-21 05:52:08	2021-10-21 05:52:08
324	11	259		2021-10-21 05:52:08	2021-10-21 05:52:08
325	11	94		2021-10-21 05:52:08	2021-10-21 05:52:08
326	11	98		2021-10-21 05:52:08	2021-10-21 05:52:08
327	11	99		2021-10-21 05:52:08	2021-10-21 05:52:08
328	11	109		2021-10-21 05:52:08	2021-10-21 05:52:08
329	11	113		2021-10-21 05:52:08	2021-10-21 05:52:08
330	11	114		2021-10-21 05:52:08	2021-10-21 05:52:08
331	11	115		2021-10-21 05:52:08	2021-10-21 05:52:08
332	11	116		2021-10-21 05:52:08	2021-10-21 05:52:08
333	11	117		2021-10-21 05:52:08	2021-10-21 05:52:08
334	11	118		2021-10-21 05:52:08	2021-10-21 05:52:08
335	11	119		2021-10-21 05:52:08	2021-10-21 05:52:08
336	11	120		2021-10-21 05:52:08	2021-10-21 05:52:08
337	11	121		2021-10-21 05:52:08	2021-10-21 05:52:08
338	11	124		2021-10-21 05:52:08	2021-10-21 05:52:08
339	11	125		2021-10-21 05:52:08	2021-10-21 05:52:08
340	11	126		2021-10-21 05:52:08	2021-10-21 05:52:08
341	11	128		2021-10-21 05:52:08	2021-10-21 05:52:08
342	11	130		2021-10-21 05:52:08	2021-10-21 05:52:08
343	11	129		2021-10-21 05:52:08	2021-10-21 05:52:08
344	11	131		2021-10-21 05:52:08	2021-10-21 05:52:08
345	11	132		2021-10-21 05:52:08	2021-10-21 05:52:08
346	12	202		2021-10-21 05:52:08	2021-10-21 05:52:08
347	12	250		2021-10-21 05:52:08	2021-10-21 05:52:08
348	12	104		2021-10-21 05:52:08	2021-10-21 05:52:08
349	12	107		2021-10-21 05:52:08	2021-10-21 05:52:08
350	12	108		2021-10-21 05:52:08	2021-10-21 05:52:08
351	12	110		2021-10-21 05:52:08	2021-10-21 05:52:08
352	12	111		2021-10-21 05:52:08	2021-10-21 05:52:08
353	12	112		2021-10-21 05:52:08	2021-10-21 05:52:08
354	12	113		2021-10-21 05:52:08	2021-10-21 05:52:08
355	12	114		2021-10-21 05:52:08	2021-10-21 05:52:08
356	12	115		2021-10-21 05:52:08	2021-10-21 05:52:08
357	12	119		2021-10-21 05:52:08	2021-10-21 05:52:08
358	12	124		2021-10-21 05:52:08	2021-10-21 05:52:08
359	12	125		2021-10-21 05:52:08	2021-10-21 05:52:08
360	12	130		2021-10-21 05:52:08	2021-10-21 05:52:08
361	12	129		2021-10-21 05:52:08	2021-10-21 05:52:08
362	13	262		2021-10-21 05:52:08	2021-10-21 05:52:08
363	13	263		2021-10-21 05:52:08	2021-10-21 05:52:08
364	13	202		2021-10-21 05:52:08	2021-10-21 05:52:08
365	13	93		2021-10-21 05:52:08	2021-10-21 05:52:08
366	13	94		2021-10-21 05:52:08	2021-10-21 05:52:08
367	13	98		2021-10-21 05:52:08	2021-10-21 05:52:08
368	13	113		2021-10-21 05:52:08	2021-10-21 05:52:08
369	13	114		2021-10-21 05:52:08	2021-10-21 05:52:08
370	13	115		2021-10-21 05:52:08	2021-10-21 05:52:08
371	13	119		2021-10-21 05:52:08	2021-10-21 05:52:08
372	13	99		2021-10-21 05:52:08	2021-10-21 05:52:08
373	13	124		2021-10-21 05:52:08	2021-10-21 05:52:08
374	13	125		2021-10-21 05:52:08	2021-10-21 05:52:08
375	13	130		2021-10-21 05:52:08	2021-10-21 05:52:08
376	13	129		2021-10-21 05:52:08	2021-10-21 05:52:08
377	14	2		2021-10-21 05:52:08	2021-10-21 05:52:08
378	14	52		2021-10-21 05:52:08	2021-10-21 05:52:08
379	14	103		2021-10-21 05:52:08	2021-10-21 05:52:08
380	14	261		2021-10-21 05:52:08	2021-10-21 05:52:08
381	14	262		2021-10-21 05:52:08	2021-10-21 05:52:08
382	14	266		2021-10-21 05:52:08	2021-10-21 05:52:08
383	14	267		2021-10-21 05:52:08	2021-10-21 05:52:08
384	14	268		2021-10-21 05:52:08	2021-10-21 05:52:08
385	14	269		2021-10-21 05:52:08	2021-10-21 05:52:08
386	14	272		2021-10-21 05:52:08	2021-10-21 05:52:08
387	14	206		2021-10-21 05:52:08	2021-10-21 05:52:08
388	14	242		2021-10-21 05:52:08	2021-10-21 05:52:08
389	14	257		2021-10-21 05:52:08	2021-10-21 05:52:08
390	14	258		2021-10-21 05:52:08	2021-10-21 05:52:08
391	14	106		2021-10-21 05:52:08	2021-10-21 05:52:08
392	14	114		2021-10-21 05:52:08	2021-10-21 05:52:08
393	15	3		2021-10-21 05:52:08	2021-10-21 05:52:08
394	15	4		2021-10-21 05:52:08	2021-10-21 05:52:08
395	15	43		2021-10-21 05:52:08	2021-10-21 05:52:08
396	15	64		2021-10-21 05:52:08	2021-10-21 05:52:08
397	15	204		2021-10-21 05:52:08	2021-10-21 05:52:08
398	15	250		2021-10-21 05:52:08	2021-10-21 05:52:08
399	15	258		2021-10-21 05:52:08	2021-10-21 05:52:08
400	15	257		2021-10-21 05:52:08	2021-10-21 05:52:08
401	15	259		2021-10-21 05:52:08	2021-10-21 05:52:08
402	15	108		2021-10-21 05:52:08	2021-10-21 05:52:08
403	16	6		2021-10-21 05:52:08	2021-10-21 05:52:08
404	16	8		2021-10-21 05:52:08	2021-10-21 05:52:08
405	16	274		2021-10-21 05:52:08	2021-10-21 05:52:08
406	16	275		2021-10-21 05:52:08	2021-10-21 05:52:08
407	16	276		2021-10-21 05:52:08	2021-10-21 05:52:08
408	16	260		2021-10-21 05:52:08	2021-10-21 05:52:08
409	16	261		2021-10-21 05:52:08	2021-10-21 05:52:08
410	16	262		2021-10-21 05:52:08	2021-10-21 05:52:08
411	16	263		2021-10-21 05:52:08	2021-10-21 05:52:08
412	16	264		2021-10-21 05:52:08	2021-10-21 05:52:08
413	16	265		2021-10-21 05:52:08	2021-10-21 05:52:08
414	16	266		2021-10-21 05:52:08	2021-10-21 05:52:08
415	16	267		2021-10-21 05:52:08	2021-10-21 05:52:08
416	16	268		2021-10-21 05:52:08	2021-10-21 05:52:08
417	16	269		2021-10-21 05:52:08	2021-10-21 05:52:08
418	16	270		2021-10-21 05:52:08	2021-10-21 05:52:08
419	16	272		2021-10-21 05:52:08	2021-10-21 05:52:08
420	16	271		2021-10-21 05:52:08	2021-10-21 05:52:08
421	16	273		2021-10-21 05:52:08	2021-10-21 05:52:08
422	16	202		2021-10-21 05:52:08	2021-10-21 05:52:08
423	16	203		2021-10-21 05:52:08	2021-10-21 05:52:08
424	16	113		2021-10-21 05:52:08	2021-10-21 05:52:08
425	16	115		2021-10-21 05:52:08	2021-10-21 05:52:08
426	16	116		2021-10-21 05:52:08	2021-10-21 05:52:08
427	16	117		2021-10-21 05:52:08	2021-10-21 05:52:08
428	16	118		2021-10-21 05:52:08	2021-10-21 05:52:08
429	16	119		2021-10-21 05:52:08	2021-10-21 05:52:08
430	16	120		2021-10-21 05:52:08	2021-10-21 05:52:08
431	16	121		2021-10-21 05:52:08	2021-10-21 05:52:08
432	16	124		2021-10-21 05:52:08	2021-10-21 05:52:08
433	16	125		2021-10-21 05:52:08	2021-10-21 05:52:08
434	16	126		2021-10-21 05:52:08	2021-10-21 05:52:08
435	16	130		2021-10-21 05:52:08	2021-10-21 05:52:08
436	16	128		2021-10-21 05:52:08	2021-10-21 05:52:08
437	16	129		2021-10-21 05:52:08	2021-10-21 05:52:08
438	16	131		2021-10-21 05:52:08	2021-10-21 05:52:08
439	16	132		2021-10-21 05:52:08	2021-10-21 05:52:08
440	17	6		2021-10-21 05:52:08	2021-10-21 05:52:08
441	17	18		2021-10-21 05:52:08	2021-10-21 05:52:08
442	17	22		2021-10-21 05:52:08	2021-10-21 05:52:08
443	17	137		2021-10-21 05:52:08	2021-10-21 05:52:08
445	17	40		2021-10-21 05:52:08	2021-10-21 05:52:08
446	17	56		2021-10-21 05:52:08	2021-10-21 05:52:08
447	17	61		2021-10-21 05:52:08	2021-10-21 05:52:08
448	17	64		2021-10-21 05:52:08	2021-10-21 05:52:08
449	17	66		2021-10-21 05:52:08	2021-10-21 05:52:08
450	17	68		2021-10-21 05:52:08	2021-10-21 05:52:08
451	17	72		2021-10-21 05:52:08	2021-10-21 05:52:08
452	17	73		2021-10-21 05:52:08	2021-10-21 05:52:08
454	17	76		2021-10-21 05:52:08	2021-10-21 05:52:08
455	17	199		2021-10-21 05:52:08	2021-10-21 05:52:08
456	17	80		2021-10-21 05:52:08	2021-10-21 05:52:08
457	17	85		2021-10-21 05:52:08	2021-10-21 05:52:08
458	17	90		2021-10-21 05:52:08	2021-10-21 05:52:08
459	17	111		2021-10-21 05:52:08	2021-10-21 05:52:08
460	17	109		2021-10-21 05:52:08	2021-10-21 05:52:08
461	18	6		2021-10-21 05:52:08	2021-10-21 05:52:08
462	18	9		2021-10-21 05:52:08	2021-10-21 05:52:08
463	18	250		2021-10-21 05:52:08	2021-10-21 05:52:08
464	19	79		2021-10-21 05:52:08	2021-10-21 05:52:08
465	2	32	\N	2021-12-02 01:57:37	2021-12-02 01:57:37
466	6	32	\N	2021-12-02 01:57:37	2021-12-02 01:57:37
467	17	32	\N	2021-12-02 01:57:37	2021-12-02 01:57:37
468	2	54	\N	2021-12-02 01:58:14	2021-12-02 01:58:14
469	6	54	\N	2021-12-02 01:58:14	2021-12-02 01:58:14
470	7	54	\N	2021-12-02 01:58:14	2021-12-02 01:58:14
471	11	54	\N	2021-12-02 02:01:03	2021-12-02 02:01:03
472	11	293	\N	2021-12-02 02:01:35	2021-12-02 02:01:35
473	16	297	\N	2021-12-08 13:50:39	2021-12-08 13:50:39
474	17	297	\N	2021-12-08 13:50:39	2021-12-08 13:50:39
475	6	298	\N	2021-12-09 01:45:30	2021-12-09 01:45:30
476	16	300	\N	2021-12-09 02:14:20	2021-12-09 02:14:20
477	14	302	\N	2021-12-10 01:16:07	2021-12-10 01:16:07
478	16	302	\N	2021-12-10 01:16:07	2021-12-10 01:16:07
484	2	74	\N	2025-02-11 05:56:22	2025-02-11 05:56:22
485	17	74	\N	2025-02-11 05:56:22	2025-02-11 05:56:22
486	21	74	\N	2025-02-11 05:56:22	2025-02-11 05:56:22
\.


--
-- Data for Name: nutrients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nutrients (id, name, memo, created_at, updated_at) FROM stdin;
1	マグネシウム	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
2	カリウム	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
3	クロム	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
4	鉄	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
5	ヨウ素	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
6	ビタミンC	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
7	ビタミンA	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
8	ビタミンB1	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
9	ビタミンB2	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
10	リン	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
11	カルシウム	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
12	ビタミンD	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
13	ビタミンE	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
14	ナトリウム	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
15	葉酸	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
16	たんぱく質	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
17	食物繊維	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
18	モリブデン	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
19	ペクチン	\N	2021-11-11 06:29:12	2021-11-11 06:29:12
21	補気類	\N	2025-02-11 05:54:48	2025-02-11 05:54:48
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: recipe_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe_categories (id, name, created_at, updated_at) FROM stdin;
1	魚料理	2021-10-21 05:52:08	2021-10-21 05:52:08
2	スープ類	2021-10-21 05:52:08	2021-10-21 05:52:08
3	サラダ類	2021-10-21 05:52:08	2021-10-21 05:52:08
4	麺・ごはん類	2021-10-21 05:52:08	2021-10-21 05:52:08
5	肉類	2021-10-21 05:52:08	2021-10-21 05:52:08
6	デザート類	2021-10-21 05:52:08	2021-10-21 05:52:08
7	卵類	2021-10-21 05:52:08	2021-10-21 05:52:08
8	箸休め	2021-10-21 05:52:08	2021-10-21 05:52:08
9	行事用	2021-10-21 05:52:08	2021-10-21 05:52:08
\.


--
-- Data for Name: recipe_countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe_countries (id, name, created_at, updated_at) FROM stdin;
1	和食	2021-12-06 07:06:00	2021-12-06 07:06:00
2	洋食	2021-12-06 07:06:00	2021-12-06 07:06:00
3	中華	2021-12-06 07:06:00	2021-12-06 07:06:00
4	エスニック	2021-12-06 07:06:00	2021-12-06 07:06:00
5	タイ	2021-12-08 04:07:34	2021-12-08 04:07:34
6	マレーシア	2021-12-08 04:07:46	2021-12-08 04:07:46
7	ベトナム	2021-12-08 04:07:58	2021-12-08 04:07:58
8	インド	2021-12-08 04:08:05	2021-12-08 04:08:05
9	スペイン	2021-12-08 04:08:13	2021-12-08 04:08:13
\.


--
-- Data for Name: recipe_materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe_materials (id, recipe_id, material_id, amount, created_at, updated_at) FROM stdin;
880	165	249	50cc	2021-11-10 10:00:56	2021-11-10 10:00:56
881	165	71	適量	2021-11-10 10:00:56	2021-11-10 10:00:56
890	168	75	5~6本	2021-11-10 11:11:18	2021-11-10 11:11:18
891	168	116	中15尾(約140g)	2021-11-10 11:11:18	2021-11-10 11:11:18
892	168	54	みじん切り5cm分	2021-11-10 11:11:18	2021-11-10 11:11:18
893	168	211	小さじ1/4	2021-11-10 11:11:18	2021-11-10 11:11:18
903	170	123	300g	2021-11-10 11:49:14	2021-11-10 11:49:14
904	170	54	5cm	2021-11-10 11:49:14	2021-11-10 11:49:14
905	170	287	小さじ1/2	2021-11-10 11:49:14	2021-11-10 11:49:14
906	170	286	小さじ1/2	2021-11-10 11:49:14	2021-11-10 11:49:14
1023	167	106	5~6g	2021-11-11 07:13:52	2021-11-11 07:13:52
1024	167	8	1/4丁	2021-11-11 07:13:52	2021-11-11 07:13:52
1025	167	279	大さじ1	2021-11-11 07:13:52	2021-11-11 07:13:52
1730	180	30	2枚・(15× 23.5cm)	2021-11-17 07:18:29	2021-11-17 07:18:29
1731	180	264	100cc	2021-11-17 07:18:29	2021-11-17 07:18:29
1732	180	44	(幅3mmの輪切り)180g	2021-11-17 07:18:29	2021-11-17 07:18:29
1733	180	35	薄切り60g	2021-11-17 07:18:29	2021-11-17 07:18:29
1734	180	140	細切り1枚分	2021-11-17 07:18:29	2021-11-17 07:18:29
1735	180	267	小さじ2	2021-11-17 07:18:29	2021-11-17 07:18:29
1736	180	262	10g	2021-11-17 07:18:29	2021-11-17 07:18:29
1737	180	12	10g	2021-11-17 07:18:29	2021-11-17 07:18:29
2886	142	78	12個	2021-11-27 08:19:12	2021-11-27 08:19:12
2887	142	79	1個	2021-11-27 08:19:12	2021-11-27 08:19:12
2909	148	21	200g	2021-11-27 08:21:48	2021-11-27 08:21:48
2910	148	264	120cc	2021-11-27 08:21:48	2021-11-27 08:21:48
2911	148	288	200g	2021-11-27 08:21:48	2021-11-27 08:21:48
2912	148	256	8g	2021-11-27 08:21:48	2021-11-27 08:21:48
2913	148	140	2枚	2021-11-27 08:21:48	2021-11-27 08:21:48
2914	148	35	120g	2021-11-27 08:21:48	2021-11-27 08:21:48
2915	148	262	8g	2021-11-27 08:21:48	2021-11-27 08:21:48
2916	148	108	200g	2021-11-27 08:21:48	2021-11-27 08:21:48
2917	149	39	80g	2021-11-27 08:22:14	2021-11-27 08:22:14
2918	149	78	60g	2021-11-27 08:22:14	2021-11-27 08:22:14
2919	149	49	40g	2021-11-27 08:22:14	2021-11-27 08:22:14
2920	149	176	小さじ2	2021-11-27 08:22:14	2021-11-27 08:22:14
2921	149	80	1/2個	2021-11-27 08:22:14	2021-11-27 08:22:14
2922	150	134	100g × 4枚	2021-11-27 08:22:38	2021-11-27 08:22:38
2923	150	256	8g	2021-11-27 08:22:38	2021-11-27 08:22:38
2924	150	209	400g	2021-11-27 08:22:38	2021-11-27 08:22:38
2925	150	261	4枚	2021-11-27 08:22:38	2021-11-27 08:22:38
2926	150	265	60g	2021-11-27 08:22:38	2021-11-27 08:22:38
2927	150	258	4枚	2021-11-27 08:22:38	2021-11-27 08:22:38
2928	150	280	小さじ2	2021-11-27 08:22:38	2021-11-27 08:22:38
2929	151	18	200g	2021-11-27 08:23:00	2021-11-27 08:23:00
2930	151	154	小さじ1	2021-11-27 08:23:00	2021-11-27 08:23:00
2931	151	288	土台用40g・芋クリーム用40g	2021-11-27 08:23:00	2021-11-27 08:23:00
2932	151	182	小さじ1/2	2021-11-27 08:23:00	2021-11-27 08:23:00
2938	153	116	80g	2021-11-27 08:23:53	2021-11-27 08:23:53
2939	153	275	2個	2021-11-27 08:23:53	2021-11-27 08:23:53
2940	153	20	4枚	2021-11-27 08:23:53	2021-11-27 08:23:53
2941	154	34	1本	2021-11-27 08:24:18	2021-11-27 08:24:18
2942	154	109	乾燥4 g	2021-11-27 08:24:18	2021-11-27 08:24:18
2943	154	156	40g	2021-11-27 08:24:18	2021-11-27 08:24:18
2944	155	276	小さじ2	2021-11-27 08:24:40	2021-11-27 08:24:40
2945	155	176	小さじ4	2021-11-27 08:24:40	2021-11-27 08:24:40
2946	155	80	1/2個	2021-11-27 08:24:40	2021-11-27 08:24:40
2960	159	30	1/2枚・20 × 10cm	2021-11-27 08:26:29	2021-11-27 08:26:29
2961	159	229	小さじ４	2021-11-27 08:26:29	2021-11-27 08:26:29
2962	159	79	1/2個	2021-11-27 08:26:29	2021-11-27 08:26:29
2963	159	198	小さじ2	2021-11-27 08:26:29	2021-11-27 08:26:29
2978	162	275	4個	2021-11-27 08:28:37	2021-11-27 08:28:37
2979	162	197	60g	2021-11-27 08:28:37	2021-11-27 08:28:37
2980	162	180	20g	2021-11-27 08:28:37	2021-11-27 08:28:37
2981	176	135	とんかつ用豚ロース2枚	2021-11-27 08:30:36	2021-11-27 08:30:36
2982	176	39	適量	2021-11-27 08:30:36	2021-11-27 08:30:36
2983	176	50	3個	2021-11-27 08:30:36	2021-11-27 08:30:36
2984	176	80	スライスレモン3枚	2021-11-27 08:30:36	2021-11-27 08:30:36
2985	175	136	150g	2021-11-27 08:31:35	2021-11-27 08:31:35
2986	175	211	小さじ1/2	2021-11-27 08:31:35	2021-11-27 08:31:35
2987	175	279	大さじ1	2021-11-27 08:31:35	2021-11-27 08:31:35
2988	175	246	小さじ1/2	2021-11-27 08:31:35	2021-11-27 08:31:35
2989	177	256	1片	2021-11-27 08:33:41	2021-11-27 08:33:41
2990	177	80	2個	2021-11-27 08:33:41	2021-11-27 08:33:41
2991	177	50	4個	2021-11-27 08:33:41	2021-11-27 08:33:41
2992	177	262	10g	2021-11-27 08:33:41	2021-11-27 08:33:41
2993	177	12	大さじ1	2021-11-27 08:33:41	2021-11-27 08:33:41
2994	177	279	大さじ1	2021-11-27 08:33:41	2021-11-27 08:33:41
2995	177	249	大さじ1	2021-11-27 08:33:41	2021-11-27 08:33:41
2996	173	134	200g	2021-11-27 08:34:21	2021-11-27 08:34:21
2997	173	208	大さじ2	2021-11-27 08:34:21	2021-11-27 08:34:21
2998	173	279	大さじ1	2021-11-27 08:34:21	2021-11-27 08:34:21
2999	173	249	大さじ1	2021-11-27 08:34:21	2021-11-27 08:34:21
3000	173	217	30g	2021-11-27 08:34:21	2021-11-27 08:34:21
3001	174	34	1本	2021-11-27 08:35:10	2021-11-27 08:35:10
3002	174	211	小さじ1	2021-11-27 08:35:10	2021-11-27 08:35:10
3003	174	215	小さじ1	2021-11-27 08:35:10	2021-11-27 08:35:10
3004	174	242	小さじ1/2	2021-11-27 08:35:10	2021-11-27 08:35:10
3005	174	5	白い炒りごま小さじ1	2021-11-27 08:35:10	2021-11-27 08:35:10
3006	172	256	1片	2021-11-27 08:35:46	2021-11-27 08:35:46
3007	172	103	1片	2021-11-27 08:35:46	2021-11-27 08:35:46
3008	172	232	大さじ2	2021-11-27 08:35:46	2021-11-27 08:35:46
3009	172	242	小さじ2	2021-11-27 08:35:46	2021-11-27 08:35:46
3010	172	211	小さじ1	2021-11-27 08:35:46	2021-11-27 08:35:46
3011	172	217	大さじ1	2021-11-27 08:35:46	2021-11-27 08:35:46
3012	172	215	小さじ1	2021-11-27 08:35:46	2021-11-27 08:35:46
3013	172	127	12尾	2021-11-27 08:35:46	2021-11-27 08:35:46
3020	160	134	400g	2021-11-27 08:56:53	2021-11-27 08:56:53
3021	160	256	20g	2021-11-27 08:56:53	2021-11-27 08:56:53
3022	160	61	240g	2021-11-27 08:56:53	2021-11-27 08:56:53
3023	160	249	60cc	2021-11-27 08:56:53	2021-11-27 08:56:53
3024	160	264	320cc	2021-11-27 08:56:53	2021-11-27 08:56:53
3304	152	131	ボイルもの4個(100g位)	2021-11-28 11:29:15	2021-11-28 11:29:15
3305	152	116	80g	2021-11-28 11:29:15	2021-11-28 11:29:15
3306	152	136	120g	2021-11-28 11:29:15	2021-11-28 11:29:15
3307	152	38	60g	2021-11-28 11:29:15	2021-11-28 11:29:15
3308	152	70	60g	2021-11-28 11:29:15	2021-11-28 11:29:15
3309	156	141	400g	2021-11-28 11:33:40	2021-11-28 11:33:40
3310	156	35	160g	2021-11-28 11:33:40	2021-11-28 11:33:40
3311	156	110	80g	2021-11-28 11:33:40	2021-11-28 11:33:40
3312	156	224	240g	2021-11-28 11:33:40	2021-11-28 11:33:40
3313	156	261	2枚	2021-11-28 11:33:40	2021-11-28 11:33:40
3314	157	61	120g	2021-11-28 11:34:44	2021-11-28 11:34:44
3315	157	2	28g前後	2021-11-28 11:34:44	2021-11-28 11:34:44
3316	157	251	小さじ2	2021-11-28 11:34:44	2021-11-28 11:34:44
3317	158	39	40g	2021-11-28 11:35:17	2021-11-28 11:35:17
3318	158	57	40g	2021-11-28 11:35:17	2021-11-28 11:35:17
3319	158	79	1/2個	2021-11-28 11:35:17	2021-11-28 11:35:17
3320	158	283	小さじ4	2021-11-28 11:35:17	2021-11-28 11:35:17
3321	158	252	小さじ1/2	2021-11-28 11:35:17	2021-11-28 11:35:17
3322	161	39	60g	2021-11-28 11:39:50	2021-11-28 11:39:50
3323	161	53	20g	2021-11-28 11:39:50	2021-11-28 11:39:50
3324	161	61	120g	2021-11-28 11:39:50	2021-11-28 11:39:50
3325	161	261	2枚	2021-11-28 11:39:50	2021-11-28 11:39:50
3326	161	283	小さじ4	2021-11-28 11:39:50	2021-11-28 11:39:50
3327	161	11	240g	2021-11-28 11:39:50	2021-11-28 11:39:50
3328	161	264	180cc	2021-11-28 11:39:50	2021-11-28 11:39:50
3329	161	266	40g	2021-11-28 11:39:50	2021-11-28 11:39:50
3330	161	164	小さじ1	2021-11-28 11:39:50	2021-11-28 11:39:50
3331	171	218	適量	2021-11-28 11:46:09	2021-11-28 11:46:09
3332	171	41	1/3把	2021-11-28 11:46:09	2021-11-28 11:46:09
3333	171	140	2枚	2021-11-28 11:46:09	2021-11-28 11:46:09
3334	171	80	1/2個	2021-11-28 11:46:09	2021-11-28 11:46:09
3335	171	262	10g	2021-11-28 11:46:09	2021-11-28 11:46:09
3336	171	288	100cc	2021-11-28 11:46:09	2021-11-28 11:46:09
3337	171	21	150g	2021-11-28 11:46:09	2021-11-28 11:46:09
3338	171	267	大さじ2	2021-11-28 11:46:09	2021-11-28 11:46:09
3339	163	141	100g	2021-11-28 12:10:39	2021-11-28 12:10:39
3340	163	35	1/2個(100g)	2021-11-28 12:10:39	2021-11-28 12:10:39
3341	163	51	1/2本	2021-11-28 12:10:39	2021-11-28 12:10:39
3342	163	210	小さじ2	2021-11-28 12:10:39	2021-11-28 12:10:39
3343	163	164	小さじ1(3g)	2021-11-28 12:10:39	2021-11-28 12:10:39
3344	163	11	150g	2021-11-28 12:10:39	2021-11-28 12:10:39
3345	163	275	溶き卵として20g	2021-11-28 12:10:39	2021-11-28 12:10:39
3346	163	262	10g	2021-11-28 12:10:39	2021-11-28 12:10:39
3347	163	192	大さじ1(10g)	2021-11-28 12:10:39	2021-11-28 12:10:39
3348	164	115	4匹(中型)	2021-11-28 12:11:14	2021-11-28 12:11:14
3349	164	103	1~2かけ	2021-11-28 12:11:14	2021-11-28 12:11:14
3350	164	46	4枚	2021-11-28 12:11:14	2021-11-28 12:11:14
3351	166	275	2個	2021-11-28 12:13:05	2021-11-28 12:13:05
3352	166	279	できれば薄口・小さじ1	2021-11-28 12:13:05	2021-11-28 12:13:05
3353	166	134	80g	2021-11-28 12:13:05	2021-11-28 12:13:05
3354	166	116	4~8尾	2021-11-28 12:13:05	2021-11-28 12:13:05
3355	166	107	2枚	2021-11-28 12:13:05	2021-11-28 12:13:05
3371	181	127	2個	2021-11-29 08:07:05	2021-11-29 08:07:05
3372	181	21	80g	2021-11-29 08:07:05	2021-11-29 08:07:05
3373	181	264	120g	2021-11-29 08:07:05	2021-11-29 08:07:05
3374	181	288	40g	2021-11-29 08:07:05	2021-11-29 08:07:05
3375	181	262	1個	2021-11-29 08:07:05	2021-11-29 08:07:05
3438	2	34	2本	2021-12-06 07:18:59	2021-12-06 07:18:59
3439	3	16	1パック(190g)	2021-12-06 07:19:57	2021-12-06 07:19:57
3440	3	275	1個	2021-12-06 07:19:57	2021-12-06 07:19:57
3444	4	276	小さじ2(4g位)	2021-12-06 07:21:21	2021-12-06 07:21:21
3445	4	264	120cc	2021-12-06 07:21:21	2021-12-06 07:21:21
3446	4	157	12g	2021-12-06 07:21:21	2021-12-06 07:21:21
3458	9	11	100g	2021-12-06 07:25:20	2021-12-06 07:25:20
3459	9	22	400g	2021-12-06 07:25:20	2021-12-06 07:25:20
3460	9	140	2枚	2021-12-06 07:25:20	2021-12-06 07:25:20
3461	9	264	200cc	2021-12-06 07:25:20	2021-12-06 07:25:20
3462	9	288	100g	2021-12-06 07:25:20	2021-12-06 07:25:20
3463	9	270	4/5個	2021-12-06 07:25:20	2021-12-06 07:25:20
3465	10	137	8本(1本40g)	2021-12-06 07:25:58	2021-12-06 07:25:58
3473	11	61	240g	2021-12-06 07:26:49	2021-12-06 07:26:49
3474	11	90	12g	2021-12-06 07:26:49	2021-12-06 07:26:49
3475	11	265	40g	2021-12-06 07:26:49	2021-12-06 07:26:49
3476	11	100	12g	2021-12-06 07:26:49	2021-12-06 07:26:49
3477	11	39	20g	2021-12-06 07:26:49	2021-12-06 07:26:49
3478	11	49	20g	2021-12-06 07:26:49	2021-12-06 07:26:49
3479	11	42	1個	2021-12-06 07:26:49	2021-12-06 07:26:49
3480	12	263	40g	2021-12-06 07:27:24	2021-12-06 07:27:24
3481	12	275	4/5個	2021-12-06 07:27:24	2021-12-06 07:27:24
3482	12	154	小さじ1	2021-12-06 07:27:24	2021-12-06 07:27:24
3483	12	12	40g	2021-12-06 07:27:24	2021-12-06 07:27:24
3484	12	89	4個	2021-12-06 07:27:24	2021-12-06 07:27:24
3485	12	180	小さじ2	2021-12-06 07:27:24	2021-12-06 07:27:24
3486	12	182	小さじ1/2	2021-12-06 07:27:24	2021-12-06 07:27:24
3489	14	204	8g	2021-12-06 07:28:39	2021-12-06 07:28:39
3490	14	33	80g	2021-12-06 07:28:39	2021-12-06 07:28:39
3491	14	85	1/2個	2021-12-06 07:28:39	2021-12-06 07:28:39
3492	14	50	4個	2021-12-06 07:28:39	2021-12-06 07:28:39
3493	14	202	1袋(1.5g)	2021-12-06 07:28:39	2021-12-06 07:28:39
3494	14	291	56g	2021-12-06 07:28:39	2021-12-06 07:28:39
3495	15	111	40g	2021-12-06 07:38:47	2021-12-06 07:38:47
3496	15	107	2枚	2021-12-06 07:38:47	2021-12-06 07:38:47
3497	15	3	240cc	2021-12-06 07:38:47	2021-12-06 07:38:47
3498	15	2	大さじ2	2021-12-06 07:38:47	2021-12-06 07:38:47
3499	15	292	40g	2021-12-06 07:38:47	2021-12-06 07:38:47
3500	16	275	2個	2021-12-06 07:39:23	2021-12-06 07:39:23
3501	16	3	240cc	2021-12-06 07:39:23	2021-12-06 07:39:23
3502	16	214	8ふり	2021-12-06 07:39:23	2021-12-06 07:39:23
3503	16	196	小さじ4	2021-12-06 07:39:23	2021-12-06 07:39:23
3504	17	21	240g	2021-12-06 07:40:10	2021-12-06 07:40:10
3505	17	140	80g	2021-12-06 07:40:10	2021-12-06 07:40:10
3506	17	285	小さじ2	2021-12-06 07:40:10	2021-12-06 07:40:10
3507	17	233	大さじ1	2021-12-06 07:40:10	2021-12-06 07:40:10
3508	17	172	大さじ1	2021-12-06 07:40:10	2021-12-06 07:40:10
3509	17	275	2個	2021-12-06 07:40:10	2021-12-06 07:40:10
3510	17	288	80g	2021-12-06 07:40:10	2021-12-06 07:40:10
3511	17	242	小さじ1/2 × 4人分	2021-12-06 07:40:10	2021-12-06 07:40:10
3512	17	267	小さじ2	2021-12-06 07:40:10	2021-12-06 07:40:10
3513	17	275	温泉卵4個	2021-12-06 07:40:10	2021-12-06 07:40:10
3514	18	134	120g × 4枚	2021-12-06 07:40:48	2021-12-06 07:40:48
3515	18	59	1個	2021-12-06 07:40:48	2021-12-06 07:40:48
3516	18	240	大さじ2	2021-12-06 07:40:48	2021-12-06 07:40:48
3517	20	110	80g	2021-12-06 07:41:59	2021-12-06 07:41:59
3518	20	218	大さじ1	2021-12-06 07:41:59	2021-12-06 07:41:59
3519	20	250	小さじ1	2021-12-06 07:41:59	2021-12-06 07:41:59
3520	20	39	40g	2021-12-06 07:41:59	2021-12-06 07:41:59
3521	20	53	20g	2021-12-06 07:41:59	2021-12-06 07:41:59
3522	20	50	4個	2021-12-06 07:41:59	2021-12-06 07:41:59
3523	20	283	小さじ2	2021-12-06 07:41:59	2021-12-06 07:41:59
3524	20	292	80g	2021-12-06 07:41:59	2021-12-06 07:41:59
3543	21	275	1個	2021-12-06 07:44:08	2021-12-06 07:44:08
3544	21	192	大さじ2	2021-12-06 07:44:08	2021-12-06 07:44:08
3545	21	12	小さじ4	2021-12-06 07:44:08	2021-12-06 07:44:08
3546	21	227	小さじ4	2021-12-06 07:44:08	2021-12-06 07:44:08
3547	21	264	小さじ4	2021-12-06 07:44:08	2021-12-06 07:44:08
3548	21	288	40g	2021-12-06 07:44:08	2021-12-06 07:44:08
3549	21	214	8ふり	2021-12-06 07:44:08	2021-12-06 07:44:08
3550	21	195	半割2個	2021-12-06 07:44:08	2021-12-06 07:44:08
3551	21	186	小さじ1/2	2021-12-06 07:44:08	2021-12-06 07:44:08
3552	22	149	200g × 2	2021-12-06 07:45:00	2021-12-06 07:45:00
3553	22	35	60g	2021-12-06 07:45:00	2021-12-06 07:45:00
3554	22	251	小さじ4	2021-12-06 07:45:00	2021-12-06 07:45:00
3555	23	148	4本(1本60g位)	2021-12-06 07:46:07	2021-12-06 07:46:07
3556	23	22	200g	2021-12-06 07:46:07	2021-12-06 07:46:07
3557	23	35	120g	2021-12-06 07:46:07	2021-12-06 07:46:07
3558	23	209	240g	2021-12-06 07:46:07	2021-12-06 07:46:07
3559	23	222	小さじ2	2021-12-06 07:46:07	2021-12-06 07:46:07
3560	23	213	小さじ2	2021-12-06 07:46:07	2021-12-06 07:46:07
3561	23	91	1枚	2021-12-06 07:46:07	2021-12-06 07:46:07
3562	23	23	10g × 4枚	2021-12-06 07:46:07	2021-12-06 07:46:07
3563	23	261	1枚	2021-12-06 07:46:07	2021-12-06 07:46:07
3564	24	53	40g	2021-12-06 07:47:16	2021-12-06 07:47:16
3565	24	47	40g	2021-12-06 07:47:16	2021-12-06 07:47:16
3566	24	70	40g	2021-12-06 07:47:16	2021-12-06 07:47:16
3567	24	59	1個	2021-12-06 07:47:16	2021-12-06 07:47:16
3568	24	34	1/2本	2021-12-06 07:47:16	2021-12-06 07:47:16
3569	24	265	40g	2021-12-06 07:47:16	2021-12-06 07:47:16
3570	24	264	小さじ1	2021-12-06 07:47:16	2021-12-06 07:47:16
3571	24	114	40g	2021-12-06 07:47:16	2021-12-06 07:47:16
3581	25	276	小さじ2	2021-12-06 07:51:58	2021-12-06 07:51:58
3582	25	288	40g	2021-12-06 07:51:58	2021-12-06 07:51:58
3583	25	271	80g	2021-12-06 07:51:58	2021-12-06 07:51:58
3584	25	265	40g	2021-12-06 07:51:58	2021-12-06 07:51:58
3585	25	189	40g	2021-12-06 07:51:58	2021-12-06 07:51:58
3586	25	173	小さじ1	2021-12-06 07:51:58	2021-12-06 07:51:58
3587	25	96	4個	2021-12-06 07:51:58	2021-12-06 07:51:58
3588	25	97	8個	2021-12-06 07:51:58	2021-12-06 07:51:58
3589	25	82	4つ	2021-12-06 07:51:58	2021-12-06 07:51:58
3596	27	150	8本(500g)	2021-12-06 07:53:26	2021-12-06 07:53:26
3599	29	47	120g	2021-12-06 07:54:52	2021-12-06 07:54:52
3600	29	252	小さじ1/4	2021-12-06 07:54:52	2021-12-06 07:54:52
3610	31	134	20g× 4	2021-12-06 07:56:41	2021-12-06 07:56:41
3611	31	219	小さじ1	2021-12-06 07:56:41	2021-12-06 07:56:41
3612	31	51	暑さ5mm輪切り× 4	2021-12-06 07:56:41	2021-12-06 07:56:41
3613	31	29	4個	2021-12-06 07:56:41	2021-12-06 07:56:41
3614	31	71	8g	2021-12-06 07:56:41	2021-12-06 07:56:41
3615	32	127	半身(120g前後) × 4	2021-12-06 07:57:20	2021-12-06 07:57:20
3616	32	262	10g	2021-12-06 07:57:20	2021-12-06 07:57:20
3617	32	172	40cc	2021-12-06 07:57:20	2021-12-06 07:57:20
3618	32	256	12g	2021-12-06 07:57:20	2021-12-06 07:57:20
3619	32	35	240g	2021-12-06 07:57:20	2021-12-06 07:57:20
3620	32	12	大さじ2	2021-12-06 07:57:20	2021-12-06 07:57:20
3621	32	233	大さじ1	2021-12-06 07:57:20	2021-12-06 07:57:20
3622	32	288	120g	2021-12-06 07:57:20	2021-12-06 07:57:20
3623	32	21	200g	2021-12-06 07:57:20	2021-12-06 07:57:20
3624	33	39	60g	2021-12-06 07:58:11	2021-12-06 07:58:11
3625	33	53	20g	2021-12-06 07:58:11	2021-12-06 07:58:11
3626	33	47	40g	2021-12-06 07:58:11	2021-12-06 07:58:11
3627	33	112	4個	2021-12-06 07:58:11	2021-12-06 07:58:11
3628	33	275	温泉卵として4個	2021-12-06 07:58:11	2021-12-06 07:58:11
3629	34	22	160g	2021-12-06 07:59:15	2021-12-06 07:59:15
3630	34	35	120g	2021-12-06 07:59:15	2021-12-06 07:59:15
3631	34	37	20g	2021-12-06 07:59:15	2021-12-06 07:59:15
3632	34	262	10g	2021-12-06 07:59:15	2021-12-06 07:59:15
3633	34	222	小さじ1	2021-12-06 07:59:15	2021-12-06 07:59:15
3634	34	91	1枚	2021-12-06 07:59:15	2021-12-06 07:59:15
3635	34	264	80cc	2021-12-06 07:59:15	2021-12-06 07:59:15
3636	34	258	少々	2021-12-06 07:59:15	2021-12-06 07:59:15
3637	35	275	1個	2021-12-06 07:59:47	2021-12-06 07:59:47
3638	35	192	小さじ8	2021-12-06 07:59:47	2021-12-06 07:59:47
3639	35	12	大さじ4	2021-12-06 07:59:47	2021-12-06 07:59:47
3640	35	182	小さじ2 ＋ 小さじ1/2	2021-12-06 07:59:47	2021-12-06 07:59:47
3641	35	264	小さじ2	2021-12-06 07:59:47	2021-12-06 07:59:47
3642	35	288	60g	2021-12-06 07:59:47	2021-12-06 07:59:47
3643	35	197	20g	2021-12-06 07:59:47	2021-12-06 07:59:47
3644	35	82	4つ	2021-12-06 07:59:47	2021-12-06 07:59:47
3722	36	147	(厚さ1.5~2cm)120g・1人分	2021-12-06 08:23:27	2021-12-06 08:23:27
3723	36	218	小さじ1/2	2021-12-06 08:23:27	2021-12-06 08:23:27
3724	36	80	1/4個　（1人分）	2021-12-06 08:23:27	2021-12-06 08:23:27
3725	36	262	8g　（1人分）	2021-12-06 08:23:27	2021-12-06 08:23:27
3726	36	72	20g　（1人分）	2021-12-06 08:23:27	2021-12-06 08:23:27
3727	36	22	60g　（1人分）	2021-12-06 08:23:27	2021-12-06 08:23:27
3728	36	286	少々	2021-12-06 08:23:27	2021-12-06 08:23:27
3734	37	122	2個	2021-12-06 08:25:41	2021-12-06 08:25:41
3735	37	140	1/2枚	2021-12-06 08:25:41	2021-12-06 08:25:41
3736	37	264	60cc	2021-12-06 08:25:41	2021-12-06 08:25:41
3737	37	267	小さじ1/2	2021-12-06 08:25:41	2021-12-06 08:25:41
3738	37	222	小さじ1/4	2021-12-06 08:25:41	2021-12-06 08:25:41
3739	39	39	20g	2021-12-06 08:26:49	2021-12-06 08:26:49
3740	39	37	10g	2021-12-06 08:26:49	2021-12-06 08:26:49
3741	39	283	小さじ1	2021-12-06 08:26:49	2021-12-06 08:26:49
3750	41	12	大さじ1	2021-12-06 08:27:58	2021-12-06 08:27:58
3751	41	275	1/4個(13g)	2021-12-06 08:27:58	2021-12-06 08:27:58
3752	41	214	少々	2021-12-06 08:27:58	2021-12-06 08:27:58
3753	41	264	大さじ1	2021-12-06 08:27:58	2021-12-06 08:27:58
3754	41	262	2g	2021-12-06 08:27:58	2021-12-06 08:27:58
3755	41	229	小さじ1	2021-12-06 08:27:58	2021-12-06 08:27:58
3756	41	197	小さじ1	2021-12-06 08:27:58	2021-12-06 08:27:58
3757	41	82	1つ	2021-12-06 08:27:58	2021-12-06 08:27:58
3772	42	130	100g × 4切れ(切り身)	2021-12-06 08:37:50	2021-12-06 08:37:50
3773	42	45	200g	2021-12-06 08:37:50	2021-12-06 08:37:50
3774	42	73	4本	2021-12-06 08:37:50	2021-12-06 08:37:50
3775	42	74	120g	2021-12-06 08:37:50	2021-12-06 08:37:50
3776	42	109	4g	2021-12-06 08:37:50	2021-12-06 08:37:50
3777	42	220	小さじ2	2021-12-06 08:37:50	2021-12-06 08:37:50
3778	42	217	大さじ3~	2021-12-06 08:37:50	2021-12-06 08:37:50
3779	43	151	320g	2021-12-06 08:39:54	2021-12-06 08:39:54
3780	43	293	60g	2021-12-06 08:39:54	2021-12-06 08:39:54
3781	43	246	小さじ1	2021-12-06 08:39:54	2021-12-06 08:39:54
3782	44	156	40g	2021-12-06 09:00:09	2021-12-06 09:00:09
3783	44	59	1個(葉付き)	2021-12-06 09:00:09	2021-12-06 09:00:09
3784	44	3	240cc	2021-12-06 09:00:09	2021-12-06 09:00:09
3785	44	2	大さじ1前後(みそ顆粒)	2021-12-06 09:00:09	2021-12-06 09:00:09
3786	45	171	160cc	2021-12-06 09:01:20	2021-12-06 09:01:20
3787	45	276	小さじ2	2021-12-06 09:01:20	2021-12-06 09:01:20
3788	45	198	40g	2021-12-06 09:01:20	2021-12-06 09:01:20
3789	45	82	4つ	2021-12-06 09:01:20	2021-12-06 09:01:20
3790	45	171	小さじ4	2021-12-06 09:01:20	2021-12-06 09:01:20
3791	46	129	切り身100g × 4切れ	2021-12-06 09:01:51	2021-12-06 09:01:51
3792	46	12	小さじ4	2021-12-06 09:01:51	2021-12-06 09:01:51
3793	46	218	小さじ2	2021-12-06 09:01:51	2021-12-06 09:01:51
3794	46	51	80g	2021-12-06 09:01:51	2021-12-06 09:01:51
3795	46	59	1個(葉付き)	2021-12-06 09:01:51	2021-12-06 09:01:51
3796	46	72	80g	2021-12-06 09:01:51	2021-12-06 09:01:51
3797	46	222	小さじ1/2	2021-12-06 09:01:51	2021-12-06 09:01:51
3798	46	288	大さじ4	2021-12-06 09:01:51	2021-12-06 09:01:51
3799	46	280	小さじ2	2021-12-06 09:01:51	2021-12-06 09:01:51
3800	47	131	4個	2021-12-06 09:02:29	2021-12-06 09:02:29
3801	47	12	小さじ1	2021-12-06 09:02:29	2021-12-06 09:02:29
3802	47	218	小さじ2	2021-12-06 09:02:29	2021-12-06 09:02:29
3803	47	256	8g	2021-12-06 09:02:29	2021-12-06 09:02:29
3804	47	262	16g	2021-12-06 09:02:29	2021-12-06 09:02:29
3805	47	35	120g	2021-12-06 09:02:29	2021-12-06 09:02:29
3806	47	14	200cc	2021-12-06 09:02:29	2021-12-06 09:02:29
3807	47	172	40cc	2021-12-06 09:02:29	2021-12-06 09:02:29
3808	47	99	24本	2021-12-06 09:02:29	2021-12-06 09:02:29
3809	47	267	小さじ2	2021-12-06 09:02:29	2021-12-06 09:02:29
3810	48	42	1/2個	2021-12-06 09:03:26	2021-12-06 09:03:26
3811	48	192	小さじ1	2021-12-06 09:03:26	2021-12-06 09:03:26
3812	48	223	小さじ1/4	2021-12-06 09:03:26	2021-12-06 09:03:26
3813	48	277	小さじ2	2021-12-06 09:03:26	2021-12-06 09:03:26
3814	48	240	小さじ1	2021-12-06 09:03:26	2021-12-06 09:03:26
3815	48	280	小さじ2	2021-12-06 09:03:26	2021-12-06 09:03:26
3816	48	39	80g	2021-12-06 09:03:26	2021-12-06 09:03:26
3817	49	30	2/3枚 (20 × 13cm)	2021-12-06 09:04:39	2021-12-06 09:04:39
3818	49	264	小さじ1	2021-12-06 09:04:39	2021-12-06 09:04:39
3819	49	98	16g	2021-12-06 09:04:39	2021-12-06 09:04:39
3820	49	229	小さじ8	2021-12-06 09:04:39	2021-12-06 09:04:39
3821	49	264	60cc	2021-12-06 09:04:39	2021-12-06 09:04:39
3822	49	288	小さじ4	2021-12-06 09:04:39	2021-12-06 09:04:39
3823	49	196	小さじ1	2021-12-06 09:04:39	2021-12-06 09:04:39
3824	49	223	少々	2021-12-06 09:04:39	2021-12-06 09:04:39
3825	49	186	小さじ1/2	2021-12-06 09:04:39	2021-12-06 09:04:39
3826	49	196	小さじ2	2021-12-06 09:04:39	2021-12-06 09:04:39
3827	50	141	280g	2021-12-06 09:05:24	2021-12-06 09:05:24
3828	50	162	40cc	2021-12-06 09:05:24	2021-12-06 09:05:24
3829	50	35	120g	2021-12-06 09:05:24	2021-12-06 09:05:24
3830	50	37	40g	2021-12-06 09:05:24	2021-12-06 09:05:24
3831	50	51	40g	2021-12-06 09:05:24	2021-12-06 09:05:24
3832	50	266	40g	2021-12-06 09:05:24	2021-12-06 09:05:24
3833	50	209	400g	2021-12-06 09:05:24	2021-12-06 09:05:24
3834	50	264	80cc	2021-12-06 09:05:24	2021-12-06 09:05:24
3835	50	225	160g	2021-12-06 09:05:24	2021-12-06 09:05:24
3836	50	24	8枚	2021-12-06 09:05:24	2021-12-06 09:05:24
3837	51	35	240g	2021-12-07 13:04:34	2021-12-07 13:04:34
3838	51	218	小さじ1	2021-12-07 13:04:34	2021-12-07 13:04:34
3839	51	23	10g × 4枚	2021-12-07 13:04:34	2021-12-07 13:04:34
3840	51	266	40g	2021-12-07 13:04:34	2021-12-07 13:04:34
3841	52	119	4枚	2021-12-07 13:05:16	2021-12-07 13:05:16
3842	52	39	80g	2021-12-07 13:05:16	2021-12-07 13:05:16
3843	52	37	40g	2021-12-07 13:05:16	2021-12-07 13:05:16
3844	52	53	20g	2021-12-07 13:05:16	2021-12-07 13:05:16
3845	53	87	1本	2021-12-07 13:06:05	2021-12-07 13:06:05
3846	53	88	4個	2021-12-07 13:06:05	2021-12-07 13:06:05
3847	53	177	1切れ(40g)	2021-12-07 13:06:05	2021-12-07 13:06:05
3848	53	179	20g	2021-12-07 13:06:05	2021-12-07 13:06:05
3849	53	288	40g	2021-12-07 13:06:05	2021-12-07 13:06:05
3850	53	180	小さじ1	2021-12-07 13:06:05	2021-12-07 13:06:05
3851	53	82	4つ	2021-12-07 13:06:05	2021-12-07 13:06:05
3852	54	134	400g	2021-12-07 13:07:59	2021-12-07 13:07:59
3853	54	232	小さじ2	2021-12-07 13:07:59	2021-12-07 13:07:59
3854	54	234	小さじ1	2021-12-07 13:07:59	2021-12-07 13:07:59
3855	54	35	120g	2021-12-07 13:07:59	2021-12-07 13:07:59
3856	54	215	小さじ1	2021-12-07 13:07:59	2021-12-07 13:07:59
3857	54	266	60g	2021-12-07 13:07:59	2021-12-07 13:07:59
3858	54	234	お好みで小さじ1	2021-12-07 13:07:59	2021-12-07 13:07:59
3859	54	286	小さじ1/2	2021-12-07 13:07:59	2021-12-07 13:07:59
3860	54	279	大さじ1	2021-12-07 13:07:59	2021-12-07 13:07:59
3861	55	57	60g	2021-12-07 13:08:33	2021-12-07 13:08:33
3862	55	109	8g	2021-12-07 13:08:33	2021-12-07 13:08:33
3863	55	282	80g	2021-12-07 13:08:33	2021-12-07 13:08:33
3864	55	37	80g	2021-12-07 13:08:33	2021-12-07 13:08:33
3865	55	120	20g	2021-12-07 13:08:33	2021-12-07 13:08:33
3866	55	60	80g	2021-12-07 13:08:33	2021-12-07 13:08:33
3867	55	14	200cc	2021-12-07 13:08:33	2021-12-07 13:08:33
3868	55	275	温泉卵4個	2021-12-07 13:08:33	2021-12-07 13:08:33
3869	55	234	小さじ2	2021-12-07 13:08:33	2021-12-07 13:08:33
3870	56	211	小さじ2	2021-12-07 13:09:16	2021-12-07 13:09:16
3871	56	275	1個	2021-12-07 13:09:16	2021-12-07 13:09:16
3872	56	215	小さじ1/2	2021-12-07 13:09:16	2021-12-07 13:09:16
3873	56	105	4g	2021-12-07 13:09:16	2021-12-07 13:09:16
3874	56	5	小さじ1	2021-12-07 13:09:16	2021-12-07 13:09:16
3875	57	275	1個	2021-12-07 13:10:01	2021-12-07 13:10:01
3876	57	192	大さじ4	2021-12-07 13:10:01	2021-12-07 13:10:01
3877	57	264	40cc	2021-12-07 13:10:01	2021-12-07 13:10:01
3878	57	215	小さじ8	2021-12-07 13:10:01	2021-12-07 13:10:01
3879	57	12	60g	2021-12-07 13:10:01	2021-12-07 13:10:01
3880	57	227	20g	2021-12-07 13:10:01	2021-12-07 13:10:01
3881	57	231	小さじ1/2	2021-12-07 13:10:01	2021-12-07 13:10:01
3882	57	163	40g	2021-12-07 13:10:01	2021-12-07 13:10:01
3883	58	141	480g	2021-12-07 13:10:36	2021-12-07 13:10:36
3884	58	212	小さじ2	2021-12-07 13:10:36	2021-12-07 13:10:36
3885	58	35	120g	2021-12-07 13:10:36	2021-12-07 13:10:36
3886	58	17	大さじ8	2021-12-07 13:10:36	2021-12-07 13:10:36
3887	58	264	大さじ4	2021-12-07 13:10:36	2021-12-07 13:10:36
3888	58	275	1個	2021-12-07 13:10:36	2021-12-07 13:10:36
3889	58	144	30g × 4枚	2021-12-07 13:10:36	2021-12-07 13:10:36
3890	58	22	320g	2021-12-07 13:10:36	2021-12-07 13:10:36
3891	58	160	8粒	2021-12-07 13:10:36	2021-12-07 13:10:36
3892	58	83	4つ	2021-12-07 13:10:36	2021-12-07 13:10:36
3893	59	51	200g	2021-12-07 13:11:16	2021-12-07 13:11:16
3894	59	262	20g	2021-12-07 13:11:16	2021-12-07 13:11:16
3895	59	222	小さじ1	2021-12-07 13:11:16	2021-12-07 13:11:16
3896	61	39	80g	2021-12-07 13:12:02	2021-12-07 13:12:02
3897	61	53	40g	2021-12-07 13:12:02	2021-12-07 13:12:02
3898	61	34	1本	2021-12-07 13:12:02	2021-12-07 13:12:02
3899	61	51	40g	2021-12-07 13:12:02	2021-12-07 13:12:02
3900	61	86	1個	2021-12-07 13:12:02	2021-12-07 13:12:02
3901	61	283	小さじ8	2021-12-07 13:12:02	2021-12-07 13:12:02
3902	62	275	2個	2021-12-07 13:13:34	2021-12-07 13:13:34
3903	62	264	100cc	2021-12-07 13:13:34	2021-12-07 13:13:34
3904	62	288	40g	2021-12-07 13:13:34	2021-12-07 13:13:34
3905	62	192	大さじ2	2021-12-07 13:13:34	2021-12-07 13:13:34
3906	63	134	140g × 4枚	2021-12-07 13:14:21	2021-12-07 13:14:21
3907	63	275	1個	2021-12-07 13:14:21	2021-12-07 13:14:21
3908	63	239	8切れ	2021-12-07 13:14:21	2021-12-07 13:14:21
3909	63	35	40g	2021-12-07 13:14:21	2021-12-07 13:14:21
3910	63	282	40g	2021-12-07 13:14:21	2021-12-07 13:14:21
3911	63	208	大さじ2	2021-12-07 13:14:21	2021-12-07 13:14:21
3912	63	33	80g	2021-12-07 13:14:21	2021-12-07 13:14:21
3913	63	42	1/2個	2021-12-07 13:14:21	2021-12-07 13:14:21
3914	63	80	1/2個	2021-12-07 13:14:21	2021-12-07 13:14:21
3915	65	55	40g	2021-12-07 13:14:59	2021-12-07 13:14:59
3916	65	219	小さじ1	2021-12-07 13:14:59	2021-12-07 13:14:59
3917	65	275	1個	2021-12-07 13:14:59	2021-12-07 13:14:59
3918	65	2	小さじ4前後	2021-12-07 13:14:59	2021-12-07 13:14:59
3919	66	122	200g	2021-12-07 13:15:50	2021-12-07 13:15:50
3920	66	249	大さじ1	2021-12-07 13:15:50	2021-12-07 13:15:50
3921	66	64	160g	2021-12-07 13:15:50	2021-12-07 13:15:50
3922	66	65	4本	2021-12-07 13:15:50	2021-12-07 13:15:50
3923	66	278	少々	2021-12-07 13:15:50	2021-12-07 13:15:50
3924	67	276	小さじ2	2021-12-07 13:16:32	2021-12-07 13:16:32
3925	67	288	40g	2021-12-07 13:16:32	2021-12-07 13:16:32
3926	67	229	大さじ2	2021-12-07 13:16:32	2021-12-07 13:16:32
3927	67	192	小さじ4	2021-12-07 13:16:32	2021-12-07 13:16:32
3928	67	169	小さじ1	2021-12-07 13:16:32	2021-12-07 13:16:32
3929	67	3	160cc	2021-12-07 13:16:32	2021-12-07 13:16:32
3930	67	6	60g	2021-12-07 13:16:32	2021-12-07 13:16:32
3935	68	14	160cc	2021-12-07 13:17:45	2021-12-07 13:17:45
3936	68	278	少々	2021-12-07 13:17:45	2021-12-07 13:17:45
3937	68	106	2枚	2021-12-07 13:17:45	2021-12-07 13:17:45
3938	68	201	4つ	2021-12-07 13:17:45	2021-12-07 13:17:45
3939	69	141	200g	2021-12-07 13:19:37	2021-12-07 13:19:37
3940	69	35	60g	2021-12-07 13:19:37	2021-12-07 13:19:37
3941	69	17	小さじ8	2021-12-07 13:19:37	2021-12-07 13:19:37
3942	69	158	80cc(無塩)	2021-12-07 13:19:37	2021-12-07 13:19:37
3943	69	232	小さじ2	2021-12-07 13:19:37	2021-12-07 13:19:37
3944	69	39	40g	2021-12-07 13:19:37	2021-12-07 13:19:37
3950	70	127	殻付で4尾(1尾20g)	2021-12-07 13:21:39	2021-12-07 13:21:39
3951	70	20	2枚	2021-12-07 13:21:39	2021-12-07 13:21:39
3952	70	46	4枚	2021-12-07 13:21:39	2021-12-07 13:21:39
3953	70	284	小さじ1	2021-12-07 13:21:39	2021-12-07 13:21:39
3954	70	12	小さじ1	2021-12-07 13:21:39	2021-12-07 13:21:39
3955	71	22	200g	2021-12-07 13:23:40	2021-12-07 13:23:40
3956	71	64	4本(40g)	2021-12-07 13:23:40	2021-12-07 13:23:40
3957	71	140	2枚	2021-12-07 13:23:40	2021-12-07 13:23:40
3958	71	219	小さじ1/2	2021-12-07 13:23:40	2021-12-07 13:23:40
3959	71	240	小さじ1	2021-12-07 13:23:40	2021-12-07 13:23:40
3960	72	200	小さじ1	2021-12-07 13:25:33	2021-12-07 13:25:33
3961	72	277	小さじ4	2021-12-07 13:25:33	2021-12-07 13:25:33
3962	72	45	30g	2021-12-07 13:25:33	2021-12-07 13:25:33
3963	73	275	2個	2021-12-07 13:28:11	2021-12-07 13:28:11
3964	73	192	小さじ2	2021-12-07 13:28:11	2021-12-07 13:28:11
3965	74	175	8g	2021-12-07 13:29:22	2021-12-07 13:29:22
3966	74	12	40g	2021-12-07 13:29:22	2021-12-07 13:29:22
3967	74	184	60g	2021-12-07 13:29:22	2021-12-07 13:29:22
3968	75	141	200g	2021-12-07 13:30:00	2021-12-07 13:30:00
3969	75	35	120g	2021-12-07 13:30:00	2021-12-07 13:30:00
3970	75	17	大さじ4	2021-12-07 13:30:00	2021-12-07 13:30:00
3971	75	264	40cc	2021-12-07 13:30:00	2021-12-07 13:30:00
3972	75	275	1個	2021-12-07 13:30:00	2021-12-07 13:30:00
3973	75	256	8g	2021-12-07 13:30:00	2021-12-07 13:30:00
3974	75	158	無塩で200cc	2021-12-07 13:30:00	2021-12-07 13:30:00
3975	75	132	20g	2021-12-07 13:30:00	2021-12-07 13:30:00
3976	75	288	60g	2021-12-07 13:30:00	2021-12-07 13:30:00
3977	76	275	4個	2021-12-07 13:38:49	2021-12-07 13:38:49
3978	76	64	80g	2021-12-07 13:38:49	2021-12-07 13:38:49
3979	76	55	160g	2021-12-07 13:38:49	2021-12-07 13:38:49
3980	76	278	小さじ1/8	2021-12-07 13:38:49	2021-12-07 13:38:49
3981	76	85	1個	2021-12-07 13:38:49	2021-12-07 13:38:49
3982	76	208	小さじ8	2021-12-07 13:38:49	2021-12-07 13:38:49
3983	76	267	小さじ4	2021-12-07 13:38:49	2021-12-07 13:38:49
3984	76	241	少々	2021-12-07 13:38:49	2021-12-07 13:38:49
3985	76	264	20cc	2021-12-07 13:38:49	2021-12-07 13:38:49
3986	77	11	160g	2021-12-07 13:39:42	2021-12-07 13:39:42
3987	77	12	120g	2021-12-07 13:39:42	2021-12-07 13:39:42
3988	77	164	小さじ1	2021-12-07 13:39:42	2021-12-07 13:39:42
3989	77	192	大さじ2	2021-12-07 13:39:42	2021-12-07 13:39:42
3990	77	218	小さじ4	2021-12-07 13:39:42	2021-12-07 13:39:42
3991	77	270	4/5個(72g)	2021-12-07 13:39:42	2021-12-07 13:39:42
3992	77	266	40g	2021-12-07 13:39:42	2021-12-07 13:39:42
3993	78	288	60g	2021-12-07 13:40:33	2021-12-07 13:40:33
3994	78	264	140cc	2021-12-07 13:40:33	2021-12-07 13:40:33
3995	78	192	小さじ4	2021-12-07 13:40:33	2021-12-07 13:40:33
3996	78	276	小さじ4	2021-12-07 13:40:33	2021-12-07 13:40:33
3997	78	92	1個	2021-12-07 13:40:33	2021-12-07 13:40:33
3998	78	82	4つ	2021-12-07 13:40:33	2021-12-07 13:40:33
4009	80	85	1/4個	2021-12-07 13:42:00	2021-12-07 13:42:00
4010	80	38	30g	2021-12-07 13:42:00	2021-12-07 13:42:00
4011	80	34	1/4本	2021-12-07 13:42:00	2021-12-07 13:42:00
4012	80	26	20g	2021-12-07 13:42:00	2021-12-07 13:42:00
4013	80	7	10g	2021-12-07 13:42:00	2021-12-07 13:42:00
4014	80	93	2個	2021-12-07 13:42:00	2021-12-07 13:42:00
4015	80	39	15g	2021-12-07 13:42:00	2021-12-07 13:42:00
4016	80	283	小さじ1 × 4	2021-12-07 13:42:00	2021-12-07 13:42:00
4017	79	275	2個	2021-12-07 13:47:15	2021-12-07 13:47:15
4018	79	295	200g	2021-12-07 13:47:15	2021-12-07 13:47:15
4019	79	35	200g	2021-12-07 13:47:15	2021-12-07 13:47:15
4020	79	112	8個	2021-12-07 13:47:15	2021-12-07 13:47:15
4021	79	162	小さじ4	2021-12-07 13:47:15	2021-12-07 13:47:15
4022	79	224	1缶(290g)	2021-12-07 13:47:15	2021-12-07 13:47:15
4023	79	213	小さじ2	2021-12-07 13:47:15	2021-12-07 13:47:15
4024	79	176	小さじ2	2021-12-07 13:47:15	2021-12-07 13:47:15
4025	79	232	小さじ1	2021-12-07 13:47:15	2021-12-07 13:47:15
4026	79	296	240cc	2021-12-07 13:47:15	2021-12-07 13:47:15
4027	81	262	20g	2021-12-07 13:48:18	2021-12-07 13:48:18
4028	81	186	小さじ2	2021-12-07 13:48:18	2021-12-07 13:48:18
4029	81	12	小さじ10	2021-12-07 13:48:18	2021-12-07 13:48:18
4030	81	227	大さじ1	2021-12-07 13:48:18	2021-12-07 13:48:18
4031	81	187	小さじ1/4	2021-12-07 13:48:18	2021-12-07 13:48:18
4042	82	136	100g	2021-12-07 13:49:19	2021-12-07 13:49:19
4043	82	143	100g	2021-12-07 13:49:19	2021-12-07 13:49:19
4044	82	244	小さじ2	2021-12-07 13:49:19	2021-12-07 13:49:19
4045	82	243	小さじ2	2021-12-07 13:49:19	2021-12-07 13:49:19
4046	82	284	小さじ2	2021-12-07 13:49:19	2021-12-07 13:49:19
4047	82	285	小さじ2	2021-12-07 13:49:19	2021-12-07 13:49:19
4048	82	8	600g	2021-12-07 13:49:19	2021-12-07 13:49:19
4049	82	245	32g	2021-12-07 13:49:19	2021-12-07 13:49:19
4050	82	242	大さじ1	2021-12-07 13:49:19	2021-12-07 13:49:19
4051	82	215	小さじ1	2021-12-07 13:49:19	2021-12-07 13:49:19
4052	83	136	200g	2021-12-07 13:50:19	2021-12-07 13:50:19
4053	83	34	1本	2021-12-07 13:50:19	2021-12-07 13:50:19
4054	83	42	1個	2021-12-07 13:50:19	2021-12-07 13:50:19
4055	83	249	大さじ1	2021-12-07 13:50:19	2021-12-07 13:50:19
4056	83	284	小さじ1	2021-12-07 13:50:19	2021-12-07 13:50:19
4057	83	285	小さじ1	2021-12-07 13:50:19	2021-12-07 13:50:19
4058	83	244	小さじ1/2	2021-12-07 13:50:19	2021-12-07 13:50:19
4059	84	275	2個 × 2	2021-12-07 13:51:21	2021-12-07 13:51:21
4060	84	156	20g × 2	2021-12-07 13:51:21	2021-12-07 13:51:21
4061	84	284	小さじ1/2 × 2	2021-12-07 13:51:21	2021-12-07 13:51:21
4062	84	14	240cc	2021-12-07 13:51:21	2021-12-07 13:51:21
4063	84	279	小さじ1/2 × 2	2021-12-07 13:51:21	2021-12-07 13:51:21
4064	85	276	小さじ2	2021-12-07 13:52:03	2021-12-07 13:52:03
4065	85	264	160cc	2021-12-07 13:52:03	2021-12-07 13:52:03
4066	85	192	大さじ2	2021-12-07 13:52:03	2021-12-07 13:52:03
4067	85	288	40g	2021-12-07 13:52:03	2021-12-07 13:52:03
4068	85	228	適量	2021-12-07 13:52:04	2021-12-07 13:52:04
4069	85	290	12粒	2021-12-07 13:52:04	2021-12-07 13:52:04
4070	86	142	320g	2021-12-07 13:58:57	2021-12-07 13:58:57
4071	86	94	4本	2021-12-07 13:58:57	2021-12-07 13:58:57
4072	86	176	小さじ2	2021-12-07 13:58:57	2021-12-07 13:58:57
4073	86	141	320g	2021-12-07 13:58:57	2021-12-07 13:58:57
4074	86	140	2枚	2021-12-07 13:58:57	2021-12-07 13:58:57
4075	86	17	大さじ4	2021-12-07 13:58:57	2021-12-07 13:58:57
4076	86	264	40cc	2021-12-07 13:58:57	2021-12-07 13:58:57
4077	86	35	120g	2021-12-07 13:58:57	2021-12-07 13:58:57
4078	86	209	200g	2021-12-07 13:58:57	2021-12-07 13:58:57
4079	86	268	60g	2021-12-07 13:58:57	2021-12-07 13:58:57
4097	88	36	120g	2021-12-07 14:02:42	2021-12-07 14:02:42
4098	88	39	60g	2021-12-07 14:02:42	2021-12-07 14:02:42
4099	88	283	小さじ4	2021-12-07 14:02:42	2021-12-07 14:02:42
4107	89	188	40g	2021-12-07 14:07:21	2021-12-07 14:07:21
4108	89	170	小さじ2	2021-12-07 14:07:21	2021-12-07 14:07:21
4109	89	276	小さじ1	2021-12-07 14:07:21	2021-12-07 14:07:21
4110	89	171	400cc	2021-12-07 14:07:21	2021-12-07 14:07:21
4111	89	88	4個	2021-12-07 14:07:21	2021-12-07 14:07:21
4112	91	147	厚さ2cm・240g × 2枚	2021-12-07 14:08:19	2021-12-07 14:08:19
4113	91	258	20g	2021-12-07 14:08:19	2021-12-07 14:08:19
4114	91	45	200g	2021-12-07 14:08:19	2021-12-07 14:08:19
4115	91	40	20g	2021-12-07 14:08:19	2021-12-07 14:08:19
4116	91	50	4個	2021-12-07 14:08:19	2021-12-07 14:08:19
4117	92	14	240cc	2021-12-07 14:09:00	2021-12-07 14:09:00
4118	92	256	20g	2021-12-07 14:09:00	2021-12-07 14:09:00
4119	92	218	小さじ4	2021-12-07 14:09:00	2021-12-07 14:09:00
4120	94	55	200g	2021-12-07 14:10:08	2021-12-07 14:10:08
4121	94	183	2枚	2021-12-07 14:10:08	2021-12-07 14:10:08
4122	95	269	100g	2021-12-07 14:11:27	2021-12-07 14:11:27
4123	95	289	小さじ4	2021-12-07 14:11:27	2021-12-07 14:11:27
4124	95	264	60cc	2021-12-07 14:11:27	2021-12-07 14:11:27
4125	95	271	40g	2021-12-07 14:11:27	2021-12-07 14:11:27
4126	95	288	80g	2021-12-07 14:11:27	2021-12-07 14:11:27
4127	95	178	40g	2021-12-07 14:11:27	2021-12-07 14:11:27
4128	95	183	2枚	2021-12-07 14:11:27	2021-12-07 14:11:27
4129	95	189	小さじ2	2021-12-07 14:11:27	2021-12-07 14:11:27
4130	95	82	4つ	2021-12-07 14:11:27	2021-12-07 14:11:27
4151	96	140	2枚（ア）	2021-12-07 14:16:38	2021-12-07 14:16:38
4152	96	256	8g（ア）	2021-12-07 14:16:38	2021-12-07 14:16:38
4153	96	35	80g（ア）	2021-12-07 14:16:38	2021-12-07 14:16:38
4154	96	226	160g（ア）	2021-12-07 14:16:38	2021-12-07 14:16:38
4155	96	264	80cc（ア）	2021-12-07 14:16:38	2021-12-07 14:16:38
4156	96	21	120g（ア）	2021-12-07 14:16:38	2021-12-07 14:16:38
4157	96	124	40g（冷）	2021-12-07 14:16:38	2021-12-07 14:16:38
4158	96	95	2g（冷）	2021-12-07 14:16:38	2021-12-07 14:16:38
4159	96	119	4枚（冷）	2021-12-07 14:16:38	2021-12-07 14:16:38
4160	96	21	120g（冷）	2021-12-07 14:16:38	2021-12-07 14:16:38
4161	97	134	100g × 4枚	2021-12-07 14:17:34	2021-12-07 14:17:34
4162	97	84	小さじ1/2	2021-12-07 14:17:34	2021-12-07 14:17:34
4163	97	39	60g	2021-12-07 14:17:34	2021-12-07 14:17:34
4164	97	53	20g	2021-12-07 14:17:34	2021-12-07 14:17:34
4165	97	93	8個	2021-12-07 14:17:34	2021-12-07 14:17:34
4166	97	256	8g	2021-12-07 14:17:34	2021-12-07 14:17:34
4167	98	271	240g	2021-12-07 14:18:16	2021-12-07 14:18:16
4168	98	86	1個	2021-12-07 14:18:16	2021-12-07 14:18:16
4169	98	81	小さじ2	2021-12-07 14:18:16	2021-12-07 14:18:16
4170	98	82	4つ	2021-12-07 14:18:16	2021-12-07 14:18:16
4171	99	148	4本(1本60g位)	2021-12-07 14:19:15	2021-12-07 14:19:15
4172	99	134	320g	2021-12-07 14:19:15	2021-12-07 14:19:15
4173	99	271	120g	2021-12-07 14:19:15	2021-12-07 14:19:15
4174	99	19	32g	2021-12-07 14:19:15	2021-12-07 14:19:15
4175	99	217	大さじ2	2021-12-07 14:19:15	2021-12-07 14:19:15
4176	99	234	小さじ4	2021-12-07 14:19:15	2021-12-07 14:19:15
4177	99	191	小さじ2	2021-12-07 14:19:15	2021-12-07 14:19:15
4178	99	286	小さじ1	2021-12-07 14:19:15	2021-12-07 14:19:15
4179	99	287	小さじ1	2021-12-07 14:19:15	2021-12-07 14:19:15
4180	100	14	200cc	2021-12-07 14:20:31	2021-12-07 14:20:31
4181	100	234	小さじ4	2021-12-07 14:20:31	2021-12-07 14:20:31
4182	100	106	2枚	2021-12-07 14:20:31	2021-12-07 14:20:31
4183	100	261	4枚	2021-12-07 14:20:31	2021-12-07 14:20:31
4184	101	125	12g	2021-12-07 14:21:29	2021-12-07 14:21:29
4185	101	283	小さじ1/2	2021-12-07 14:21:29	2021-12-07 14:21:29
4186	101	109	8g	2021-12-07 14:21:29	2021-12-07 14:21:29
4187	101	39	80g	2021-12-07 14:21:29	2021-12-07 14:21:29
4188	102	190	40g	2021-12-07 14:22:40	2021-12-07 14:22:40
4189	102	227	40g	2021-12-07 14:22:40	2021-12-07 14:22:40
4190	102	263	40g	2021-12-07 14:22:40	2021-12-07 14:22:40
4191	102	96	4個	2021-12-07 14:22:40	2021-12-07 14:22:40
4192	102	186	40g	2021-12-07 14:22:40	2021-12-07 14:22:40
4193	103	28	400g	2021-12-07 14:25:18	2021-12-07 14:25:18
4194	103	248	小さじ2	2021-12-07 14:25:18	2021-12-07 14:25:18
4195	103	216	小さじ1	2021-12-07 14:25:18	2021-12-07 14:25:18
4196	103	249	小さじ2	2021-12-07 14:25:18	2021-12-07 14:25:18
4197	103	42	1/2個	2021-12-07 14:25:18	2021-12-07 14:25:18
4198	103	66	30g	2021-12-07 14:25:18	2021-12-07 14:25:18
4199	103	54	20g	2021-12-07 14:25:18	2021-12-07 14:25:18
4200	103	281	8g	2021-12-07 14:25:18	2021-12-07 14:25:18
4201	103	105	2g	2021-12-07 14:25:18	2021-12-07 14:25:18
4202	103	275	4個	2021-12-07 14:25:18	2021-12-07 14:25:18
4203	104	116	100g	2021-12-07 14:26:16	2021-12-07 14:26:16
4204	104	143	60g	2021-12-07 14:26:16	2021-12-07 14:26:16
4205	104	249	小さじ1	2021-12-07 14:26:16	2021-12-07 14:26:16
4206	104	284	小さじ1	2021-12-07 14:26:16	2021-12-07 14:26:16
4207	104	285	小さじ1	2021-12-07 14:26:16	2021-12-07 14:26:16
4208	104	27	16枚	2021-12-07 14:26:16	2021-12-07 14:26:16
4209	104	54	20g	2021-12-07 14:26:16	2021-12-07 14:26:16
4210	105	275	4個	2021-12-07 14:27:15	2021-12-07 14:27:15
4211	105	264	240cc	2021-12-07 14:27:15	2021-12-07 14:27:15
4212	105	289	小さじ4	2021-12-07 14:27:15	2021-12-07 14:27:15
4213	105	214	適量	2021-12-07 14:27:15	2021-12-07 14:27:15
4214	105	169	小さじ1/2	2021-12-07 14:27:15	2021-12-07 14:27:15
4215	106	134	320g	2021-12-07 14:29:50	2021-12-07 14:29:50
4216	106	283	小さじ4	2021-12-07 14:29:50	2021-12-07 14:29:50
4217	106	62	80g	2021-12-07 14:29:50	2021-12-07 14:29:50
4218	106	61	80g	2021-12-07 14:29:50	2021-12-07 14:29:50
4219	106	44	60g	2021-12-07 14:29:50	2021-12-07 14:29:50
4220	106	38	60g	2021-12-07 14:29:50	2021-12-07 14:29:50
4221	106	67	2本	2021-12-07 14:29:50	2021-12-07 14:29:50
4222	107	68	4本	2021-12-07 14:35:15	2021-12-07 14:35:15
4223	107	69	2本	2021-12-07 14:35:15	2021-12-07 14:35:15
4224	107	2	小さじ8	2021-12-07 14:35:15	2021-12-07 14:35:15
4225	108	275	2個	2021-12-07 14:36:51	2021-12-07 14:36:51
4226	108	272	1個	2021-12-07 14:36:51	2021-12-07 14:36:51
4227	108	203	小さじ2	2021-12-07 14:36:51	2021-12-07 14:36:51
4228	108	283	小さじ2	2021-12-07 14:36:51	2021-12-07 14:36:51
4229	109	40	200g	2021-12-07 14:37:44	2021-12-07 14:37:44
4230	109	283	小さじ4	2021-12-07 14:37:44	2021-12-07 14:37:44
4231	109	192	小さじ1	2021-12-07 14:37:44	2021-12-07 14:37:44
4232	110	181	2本(30g)	2021-12-07 14:39:05	2021-12-07 14:39:05
4233	110	193	80g	2021-12-07 14:39:05	2021-12-07 14:39:05
4234	110	194	小さじ4	2021-12-07 14:39:05	2021-12-07 14:39:05
4252	114	85	1個	2021-12-07 14:43:07	2021-12-07 14:43:07
4253	114	42	1個	2021-12-07 14:43:07	2021-12-07 14:43:07
4254	114	39	60g	2021-12-07 14:43:07	2021-12-07 14:43:07
4255	114	235	小さじ1/2	2021-12-07 14:43:07	2021-12-07 14:43:07
4256	114	264	小さじ1	2021-12-07 14:43:07	2021-12-07 14:43:07
4257	114	208	大さじ2	2021-12-07 14:43:07	2021-12-07 14:43:07
4262	116	141	400g	2021-12-07 14:44:59	2021-12-07 14:44:59
4263	116	250	小さじ4	2021-12-07 14:44:59	2021-12-07 14:44:59
4264	116	17	大さじ8	2021-12-07 14:44:59	2021-12-07 14:44:59
4265	116	264	大さじ4	2021-12-07 14:44:59	2021-12-07 14:44:59
4266	116	275	4個	2021-12-07 14:44:59	2021-12-07 14:44:59
4267	116	75	4本	2021-12-07 14:44:59	2021-12-07 14:44:59
4268	116	33	60g	2021-12-07 14:44:59	2021-12-07 14:44:59
4269	116	50	4個	2021-12-07 14:44:59	2021-12-07 14:44:59
4270	116	80	1/2個	2021-12-07 14:44:59	2021-12-07 14:44:59
4271	117	9	20g	2021-12-07 14:45:40	2021-12-07 14:45:40
4272	117	14	200cc	2021-12-07 14:45:40	2021-12-07 14:45:40
4273	117	250	小さじ2	2021-12-07 14:45:40	2021-12-07 14:45:40
4274	118	67	2本	2021-12-07 14:46:16	2021-12-07 14:46:16
4275	118	250	小さじ1	2021-12-07 14:46:16	2021-12-07 14:46:16
4276	118	2	28g前後	2021-12-07 14:46:16	2021-12-07 14:46:16
4277	118	284	小さじ1	2021-12-07 14:46:16	2021-12-07 14:46:16
4278	119	31	32g	2021-12-07 14:48:55	2021-12-07 14:48:55
4279	119	192	小さじ8	2021-12-07 14:48:55	2021-12-07 14:48:55
4280	119	100	12g	2021-12-07 14:48:55	2021-12-07 14:48:55
4281	119	169	小さじ1/2	2021-12-07 14:48:55	2021-12-07 14:48:55
4297	123	101	120g	2021-12-07 14:52:06	2021-12-07 14:52:06
4298	123	273	小さじ4	2021-12-07 14:52:06	2021-12-07 14:52:06
4299	123	82	4つ	2021-12-07 14:52:06	2021-12-07 14:52:06
4300	124	11	100g	2021-12-07 14:52:50	2021-12-07 14:52:50
4301	124	12	20g	2021-12-07 14:52:50	2021-12-07 14:52:50
4302	124	143	120g	2021-12-07 14:52:50	2021-12-07 14:52:50
4303	124	276	小さじ2	2021-12-07 14:52:50	2021-12-07 14:52:50
4304	124	211	小さじ1/2	2021-12-07 14:52:50	2021-12-07 14:52:50
4305	124	248	小さじ1	2021-12-07 14:52:50	2021-12-07 14:52:50
4306	124	284	小さじ1	2021-12-07 14:52:50	2021-12-07 14:52:50
4307	124	277	小さじ4	2021-12-07 14:52:50	2021-12-07 14:52:50
4308	125	134	520g	2021-12-07 14:53:23	2021-12-07 14:53:23
4309	125	255	20g	2021-12-07 14:53:23	2021-12-07 14:53:23
4310	125	244	小さじ2	2021-12-07 14:53:23	2021-12-07 14:53:23
4311	125	48	60g	2021-12-07 14:53:23	2021-12-07 14:53:23
4312	126	211	小さじ2	2021-12-07 14:53:54	2021-12-07 14:53:54
4313	126	242	小さじ1/2	2021-12-07 14:53:54	2021-12-07 14:53:54
4314	126	275	1個	2021-12-07 14:53:54	2021-12-07 14:53:54
4315	126	42	1個	2021-12-07 14:53:54	2021-12-07 14:53:54
4316	126	277	小さじ2	2021-12-07 14:53:54	2021-12-07 14:53:54
4317	127	276	小さじ2	2021-12-07 14:54:42	2021-12-07 14:54:42
4318	127	264	80cc	2021-12-07 14:54:42	2021-12-07 14:54:42
4319	127	192	小さじ2	2021-12-07 14:54:42	2021-12-07 14:54:42
4320	127	288	40g	2021-12-07 14:54:42	2021-12-07 14:54:42
4321	128	145	400g	2021-12-07 14:57:32	2021-12-07 14:57:32
4322	128	54	80g	2021-12-07 14:57:32	2021-12-07 14:57:32
4323	128	33	120g	2021-12-07 14:57:32	2021-12-07 14:57:32
4324	128	275	温泉卵4個	2021-12-07 14:57:32	2021-12-07 14:57:32
4325	129	283	大さじ2	2021-12-07 14:58:07	2021-12-07 14:58:07
4326	129	34	1本	2021-12-07 14:58:07	2021-12-07 14:58:07
4327	129	33	60g	2021-12-07 14:58:07	2021-12-07 14:58:07
4328	129	1	60g	2021-12-07 14:58:07	2021-12-07 14:58:07
4329	129	204	4g	2021-12-07 14:58:07	2021-12-07 14:58:07
4330	130	1	120g	2021-12-07 14:58:51	2021-12-07 14:58:51
4331	130	2	小さじ4前後	2021-12-07 14:58:51	2021-12-07 14:58:51
4335	131	276	小さじ2	2021-12-07 14:59:56	2021-12-07 14:59:56
4336	131	289	小さじ4	2021-12-07 14:59:56	2021-12-07 14:59:56
4337	131	288	60g	2021-12-07 14:59:56	2021-12-07 14:59:56
4352	134	35	60g	2021-12-07 15:01:53	2021-12-07 15:01:53
4353	134	207	大さじ1	2021-12-07 15:01:53	2021-12-07 15:01:53
4354	134	208	大さじ1	2021-12-07 15:01:53	2021-12-07 15:01:53
4355	134	39	60g	2021-12-07 15:01:53	2021-12-07 15:01:53
4356	135	276	大さじ1	2021-12-07 15:02:29	2021-12-07 15:02:29
4357	135	82	4つ	2021-12-07 15:02:29	2021-12-07 15:02:29
4367	136	11	80g	2021-12-07 15:04:02	2021-12-07 15:04:02
4368	136	12	80g	2021-12-07 15:04:02	2021-12-07 15:04:02
4369	136	261	2枚	2021-12-07 15:04:02	2021-12-07 15:04:02
4370	136	3	40cc	2021-12-07 15:04:02	2021-12-07 15:04:02
4371	136	275	温泉卵4個	2021-12-07 15:04:02	2021-12-07 15:04:02
4372	136	114	40g	2021-12-07 15:04:02	2021-12-07 15:04:02
4373	136	105	20g	2021-12-07 15:04:02	2021-12-07 15:04:02
4374	136	158	200cc	2021-12-07 15:04:02	2021-12-07 15:04:02
4375	136	42	1つ	2021-12-07 15:04:02	2021-12-07 15:04:02
4376	137	135	240g	2021-12-07 15:05:07	2021-12-07 15:05:07
4377	137	216	小さじ4	2021-12-07 15:05:07	2021-12-07 15:05:07
4378	137	43	80g	2021-12-07 15:05:07	2021-12-07 15:05:07
4379	137	33	40g	2021-12-07 15:05:07	2021-12-07 15:05:07
4380	137	39	40g	2021-12-07 15:05:07	2021-12-07 15:05:07
4381	137	44	40g	2021-12-07 15:05:07	2021-12-07 15:05:07
4382	137	283	小さじ4	2021-12-07 15:05:07	2021-12-07 15:05:07
4383	138	175	60g	2021-12-07 15:06:02	2021-12-07 15:06:02
4384	138	192	小さじ2	2021-12-07 15:06:02	2021-12-07 15:06:02
4385	138	3	40cc	2021-12-07 15:06:02	2021-12-07 15:06:02
4386	138	216	小さじ2	2021-12-07 15:06:02	2021-12-07 15:06:02
4387	139	115	4尾(1尾150g位)	2021-12-07 15:07:09	2021-12-07 15:07:09
4388	139	212	小さじ4	2021-12-07 15:07:09	2021-12-07 15:07:09
4389	139	13	大さじ4	2021-12-07 15:07:09	2021-12-07 15:07:09
4390	139	17	48g	2021-12-07 15:07:09	2021-12-07 15:07:09
4391	139	33	80g	2021-12-07 15:07:09	2021-12-07 15:07:09
4392	139	42	1/2個	2021-12-07 15:07:09	2021-12-07 15:07:09
4393	139	283	小さじ4	2021-12-07 15:07:09	2021-12-07 15:07:09
4394	139	213	大さじ2	2021-12-07 15:07:09	2021-12-07 15:07:09
4395	139	253	大さじ2	2021-12-07 15:07:09	2021-12-07 15:07:09
4396	140	137	4本(1本40g位)	2021-12-07 15:07:49	2021-12-07 15:07:49
4397	140	45	400g	2021-12-07 15:07:49	2021-12-07 15:07:49
4398	140	219	小さじ1	2021-12-07 15:07:49	2021-12-07 15:07:49
4399	140	9	40g	2021-12-07 15:07:49	2021-12-07 15:07:49
4400	141	45	200g	2021-12-07 15:08:26	2021-12-07 15:08:26
4401	141	33	20g	2021-12-07 15:08:26	2021-12-07 15:08:26
4402	141	2	小さじ4前後	2021-12-07 15:08:26	2021-12-07 15:08:26
4403	143	116	8尾(60g位)	2021-12-07 15:09:58	2021-12-07 15:09:58
4404	143	16	40g	2021-12-07 15:09:58	2021-12-07 15:09:58
4405	143	106	1枚	2021-12-07 15:09:58	2021-12-07 15:09:58
4406	143	138	120g	2021-12-07 15:09:58	2021-12-07 15:09:58
4407	143	4	大さじ2	2021-12-07 15:09:58	2021-12-07 15:09:58
4408	143	275	1個	2021-12-07 15:09:58	2021-12-07 15:09:58
4409	143	118	1/2枚(50g)	2021-12-07 15:09:58	2021-12-07 15:09:58
4410	143	139	1枚	2021-12-07 15:09:58	2021-12-07 15:09:58
4411	143	46	2枚	2021-12-07 15:09:58	2021-12-07 15:09:58
4412	143	261	1枚	2021-12-07 15:09:58	2021-12-07 15:09:58
4413	144	44	120g	2021-12-07 15:10:44	2021-12-07 15:10:44
4414	144	285	小さじ1/2	2021-12-07 15:10:44	2021-12-07 15:10:44
4415	145	220	大さじ1	2021-12-07 15:11:14	2021-12-07 15:11:14
4416	145	80	1/4個	2021-12-07 15:11:14	2021-12-07 15:11:14
4417	145	107	4枚	2021-12-07 15:11:14	2021-12-07 15:11:14
4418	146	47	120g	2021-12-07 15:11:45	2021-12-07 15:11:45
4419	146	39	40g	2021-12-07 15:11:45	2021-12-07 15:11:45
4420	147	175	60g	2021-12-07 15:12:35	2021-12-07 15:12:35
4421	147	189	小さじ4	2021-12-07 15:12:35	2021-12-07 15:12:35
4422	147	181	2本(30g)	2021-12-07 15:12:35	2021-12-07 15:12:35
4423	147	217	大さじ1	2021-12-07 15:12:35	2021-12-07 15:12:35
4850	184	79	1/2個	2021-12-11 04:17:26	2021-12-11 04:17:26
4851	184	37	葉を適宜4g位	2021-12-11 04:17:26	2021-12-11 04:17:26
4852	184	91	1/2枚	2021-12-11 04:17:26	2021-12-11 04:17:26
4853	184	277	40cc	2021-12-11 04:17:26	2021-12-11 04:17:26
4854	184	39	40g	2021-12-11 04:17:26	2021-12-11 04:17:26
4855	184	53	20g	2021-12-11 04:17:26	2021-12-11 04:17:26
4856	184	37	40g	2021-12-11 04:17:26	2021-12-11 04:17:26
4857	184	297	食パン8枚切りのみみ2枚分	2021-12-11 04:17:26	2021-12-11 04:17:26
4858	185	12	40g	2021-12-11 04:18:30	2021-12-11 04:18:30
4859	185	192	小さじ4	2021-12-11 04:18:30	2021-12-11 04:18:30
4860	185	275	1個	2021-12-11 04:18:30	2021-12-11 04:18:30
4861	185	264	100cc	2021-12-11 04:18:30	2021-12-11 04:18:30
4862	185	262	10g + 10g	2021-12-11 04:18:30	2021-12-11 04:18:30
4863	185	82	4 つ	2021-12-11 04:18:30	2021-12-11 04:18:30
4864	185	298	1/2個	2021-12-11 04:18:30	2021-12-11 04:18:30
4865	185	299	小さじ1	2021-12-11 04:18:30	2021-12-11 04:18:30
4866	186	140	2枚	2021-12-11 04:19:02	2021-12-11 04:19:02
4867	186	35	120g	2021-12-11 04:19:02	2021-12-11 04:19:02
4868	186	262	20g + 10g	2021-12-11 04:19:02	2021-12-11 04:19:02
4869	186	300	200g	2021-12-11 04:19:02	2021-12-11 04:19:02
4870	186	172	40cc	2021-12-11 04:19:02	2021-12-11 04:19:02
4871	186	12	小さじ8	2021-12-11 04:19:02	2021-12-11 04:19:02
4872	186	233	大さじ1	2021-12-11 04:19:02	2021-12-11 04:19:02
4873	186	264	480cc	2021-12-11 04:19:02	2021-12-11 04:19:02
4874	186	296	200cc	2021-12-11 04:19:02	2021-12-11 04:19:02
4875	186	266	40g	2021-12-11 04:19:02	2021-12-11 04:19:02
4876	187	39	80g	2021-12-11 04:20:42	2021-12-11 04:20:42
4877	187	47	40g	2021-12-11 04:20:42	2021-12-11 04:20:42
4878	187	280	小さじ2	2021-12-11 04:20:42	2021-12-11 04:20:42
4879	187	80	果汁小さじ1	2021-12-11 04:20:42	2021-12-11 04:20:42
4880	188	301	100g × 4枚	2021-12-11 04:34:07	2021-12-11 04:34:07
4881	188	278	小さじ1/8	2021-12-11 04:34:07	2021-12-11 04:34:07
4882	188	12	小さじ4	2021-12-11 04:34:07	2021-12-11 04:34:07
4883	188	256	16g	2021-12-11 04:34:07	2021-12-11 04:34:07
4884	188	218	小さじ2	2021-12-11 04:34:07	2021-12-11 04:34:07
4885	188	172	40cc	2021-12-11 04:34:07	2021-12-11 04:34:07
4886	188	279	小さじ2	2021-12-11 04:34:07	2021-12-11 04:34:07
4887	188	262	10g	2021-12-11 04:34:07	2021-12-11 04:34:07
4888	188	257	2g	2021-12-11 04:34:07	2021-12-11 04:34:07
4889	189	276	小さじ2	2021-12-11 04:34:55	2021-12-11 04:34:55
4890	189	289	大さじ2	2021-12-11 04:34:55	2021-12-11 04:34:55
4891	189	80	果汁を小さじ1	2021-12-11 04:34:55	2021-12-11 04:34:55
4892	189	198	小さじ8	2021-12-11 04:34:55	2021-12-11 04:34:55
4913	192	8	160g	2021-12-11 04:36:51	2021-12-11 04:36:51
4914	192	250	大さじ1	2021-12-11 04:36:51	2021-12-11 04:36:51
4915	192	39	80g	2021-12-11 04:36:51	2021-12-11 04:36:51
4916	192	42	1/2個	2021-12-11 04:36:51	2021-12-11 04:36:51
4917	193	59	1個	2021-12-11 04:37:33	2021-12-11 04:37:33
4918	193	140	スライス2枚	2021-12-11 04:37:33	2021-12-11 04:37:33
4919	193	219	小さじ1/2	2021-12-11 04:37:33	2021-12-11 04:37:33
4920	193	4	40cc	2021-12-11 04:37:33	2021-12-11 04:37:33
4921	193	302	西京みそ20g	2021-12-11 04:37:33	2021-12-11 04:37:33
4922	194	275	2個	2021-12-11 04:38:39	2021-12-11 04:38:39
4923	194	4	120cc	2021-12-11 04:38:39	2021-12-11 04:38:39
4924	194	288	40g	2021-12-11 04:38:39	2021-12-11 04:38:39
4925	194	192	小さじ8	2021-12-11 04:38:39	2021-12-11 04:38:39
4926	194	214	適宜	2021-12-11 04:38:39	2021-12-11 04:38:39
4927	194	196	小さじ2	2021-12-11 04:38:39	2021-12-11 04:38:39
4938	196	35	120g	2021-12-11 04:39:59	2021-12-11 04:39:59
4939	196	140	スライス2枚	2021-12-11 04:39:59	2021-12-11 04:39:59
4940	196	285	小さじ1	2021-12-11 04:39:59	2021-12-11 04:39:59
4941	196	218	小さじ1	2021-12-11 04:39:59	2021-12-11 04:39:59
4942	196	226	200g	2021-12-11 04:39:59	2021-12-11 04:39:59
4943	196	222	小さじ1	2021-12-11 04:39:59	2021-12-11 04:39:59
4944	197	39	60g	2021-12-11 04:40:38	2021-12-11 04:40:38
4945	197	53	20g	2021-12-11 04:40:38	2021-12-11 04:40:38
4946	197	304	4個	2021-12-11 04:40:38	2021-12-11 04:40:38
5008	209	263	40g	2021-12-11 04:47:45	2021-12-11 04:47:45
5009	209	192	大さじ4	2021-12-11 04:47:45	2021-12-11 04:47:45
5010	209	275	40g	2021-12-11 04:47:45	2021-12-11 04:47:45
5011	209	12	40g	2021-12-11 04:47:45	2021-12-11 04:47:45
5012	209	231	小さじ1/2	2021-12-11 04:47:45	2021-12-11 04:47:45
5013	209	305	小さじ4	2021-12-11 04:47:45	2021-12-11 04:47:45
5014	209	265	20g	2021-12-11 04:47:45	2021-12-11 04:47:45
5015	209	88	4個	2021-12-11 04:47:45	2021-12-11 04:47:45
5016	182	294	240g× 2枚	2021-12-11 06:44:10	2021-12-11 06:44:10
5017	182	182	小さじ1	2021-12-11 06:44:10	2021-12-11 06:44:10
5018	182	213	小さじ4	2021-12-11 06:44:10	2021-12-11 06:44:10
5019	182	12	大さじ4	2021-12-11 06:44:10	2021-12-11 06:44:10
5020	182	212	小さじ4	2021-12-11 06:44:10	2021-12-11 06:44:10
5021	182	297	8枚切り8枚	2021-12-11 06:44:10	2021-12-11 06:44:10
5022	183	21	80g	2021-12-11 06:46:05	2021-12-11 06:46:05
5023	183	209	200g	2021-12-11 06:46:05	2021-12-11 06:46:05
5024	183	232	大さじ4	2021-12-11 06:46:05	2021-12-11 06:46:05
5025	183	277	大さじ1	2021-12-11 06:46:05	2021-12-11 06:46:05
5026	183	91	1枚	2021-12-11 06:46:05	2021-12-11 06:46:05
5027	183	35	80g	2021-12-11 06:46:05	2021-12-11 06:46:05
5028	183	146	2本	2021-12-11 06:46:05	2021-12-11 06:46:05
5029	183	112	缶スライス40g	2021-12-11 06:46:05	2021-12-11 06:46:05
5030	183	16	40g	2021-12-11 06:46:05	2021-12-11 06:46:05
5031	183	63	1/2個	2021-12-11 06:46:05	2021-12-11 06:46:05
5032	190	296	240cc	2021-12-11 06:48:12	2021-12-11 06:48:12
5033	190	277	40cc	2021-12-11 06:48:12	2021-12-11 06:48:12
5034	190	136	厚さ2mm2枚	2021-12-11 06:48:12	2021-12-11 06:48:12
5035	190	46	4枚	2021-12-11 06:48:12	2021-12-11 06:48:12
5036	190	129	40g	2021-12-11 06:48:12	2021-12-11 06:48:12
5037	190	250	小さじ1	2021-12-11 06:48:12	2021-12-11 06:48:12
5038	190	302	20g	2021-12-11 06:48:12	2021-12-11 06:48:12
5039	190	288	20g	2021-12-11 06:48:12	2021-12-11 06:48:12
5040	190	119	2枚	2021-12-11 06:48:12	2021-12-11 06:48:12
5041	190	275	1個	2021-12-11 06:48:12	2021-12-11 06:48:12
5042	191	62	80g	2021-12-11 06:50:24	2021-12-11 06:50:24
5043	191	138	80g	2021-12-11 06:50:24	2021-12-11 06:50:24
5044	191	284	小さじ1	2021-12-11 06:50:24	2021-12-11 06:50:24
5045	191	72	80g	2021-12-11 06:50:24	2021-12-11 06:50:24
5046	191	4	80cc	2021-12-11 06:50:24	2021-12-11 06:50:24
5047	191	208	小さじ4	2021-12-11 06:50:24	2021-12-11 06:50:24
5048	191	13	60g強	2021-12-11 06:50:24	2021-12-11 06:50:24
5049	191	80	1/2個	2021-12-11 06:50:24	2021-12-11 06:50:24
5050	191	167	小さじ1/2	2021-12-11 06:50:24	2021-12-11 06:50:24
5051	191	249	小さじ1	2021-12-11 06:50:24	2021-12-11 06:50:24
5052	195	134	骨つきで、4本(1本200g前後)	2021-12-11 06:58:17	2021-12-11 06:58:17
5053	195	254	大さじ1	2021-12-11 06:58:17	2021-12-11 06:58:17
5054	195	285	小さじ2	2021-12-11 06:58:17	2021-12-11 06:58:17
5055	195	218	小さじ2	2021-12-11 06:58:17	2021-12-11 06:58:17
5056	195	212	大さじ2	2021-12-11 06:58:17	2021-12-11 06:58:17
5057	195	279	小さじ2	2021-12-11 06:58:17	2021-12-11 06:58:17
5058	195	22	(メークィーン)200g	2021-12-11 06:58:17	2021-12-11 06:58:17
5059	195	254	小さじ1	2021-12-11 06:58:17	2021-12-11 06:58:17
5060	195	218	小さじ2	2021-12-11 06:58:17	2021-12-11 06:58:17
5061	195	303	1枚	2021-12-11 06:58:17	2021-12-11 06:58:17
5062	199	151	400g	2021-12-11 06:59:39	2021-12-11 06:59:39
5063	199	277	小さじ2 + 小さじ4	2021-12-11 06:59:39	2021-12-11 06:59:39
5064	199	103	8g	2021-12-11 06:59:39	2021-12-11 06:59:39
5065	199	249	小さじ4	2021-12-11 06:59:39	2021-12-11 06:59:39
5066	199	248	小さじ2	2021-12-11 06:59:39	2021-12-11 06:59:39
5067	200	127	4尾(1尾40g位)	2021-12-11 07:00:56	2021-12-11 07:00:56
5068	200	218	小さじ4	2021-12-11 07:00:56	2021-12-11 07:00:56
5069	200	249	小さじ1	2021-12-11 07:00:56	2021-12-11 07:00:56
5070	200	285	小さじ1	2021-12-11 07:00:56	2021-12-11 07:00:56
5071	200	221	少々	2021-12-11 07:00:57	2021-12-11 07:00:57
5072	200	80	果汁小さじ1	2021-12-11 07:00:57	2021-12-11 07:00:57
5073	200	307	小さじ1/2	2021-12-11 07:00:57	2021-12-11 07:00:57
5074	201	18	160g	2021-12-11 07:02:13	2021-12-11 07:02:13
5075	201	308	1個	2021-12-11 07:02:13	2021-12-11 07:02:13
5076	201	309	40g	2021-12-11 07:02:13	2021-12-11 07:02:13
5077	201	305	小さじ4	2021-12-11 07:02:13	2021-12-11 07:02:13
5078	201	310	4個	2021-12-11 07:02:13	2021-12-11 07:02:13
5079	202	45	200g	2021-12-11 07:03:28	2021-12-11 07:03:28
5080	202	51	20g	2021-12-11 07:03:28	2021-12-11 07:03:28
5081	202	277	大さじ2	2021-12-11 07:03:28	2021-12-11 07:03:28
5082	202	80	小さじ1果汁	2021-12-11 07:03:28	2021-12-11 07:03:28
5083	203	9	40g(蒸し)	2021-12-11 07:04:04	2021-12-11 07:04:04
5084	203	194	小さじ2	2021-12-11 07:04:04	2021-12-11 07:04:04
5085	204	311	4個	2021-12-11 07:04:55	2021-12-11 07:04:55
5086	204	265	20g	2021-12-11 07:04:55	2021-12-11 07:04:55
5087	206	294	塊で400g	2021-12-11 07:08:25	2021-12-11 07:08:25
5088	206	162	200cc (マディラの代わり)	2021-12-11 07:08:25	2021-12-11 07:08:25
5089	206	278	小さじ1/4	2021-12-11 07:08:25	2021-12-11 07:08:25
5090	206	222	小さじ1	2021-12-11 07:08:25	2021-12-11 07:08:25
5091	206	91	1枚	2021-12-11 07:08:25	2021-12-11 07:08:25
5092	206	35	160g	2021-12-11 07:08:25	2021-12-11 07:08:25
5093	206	217	小さじ1/2	2021-12-11 07:08:25	2021-12-11 07:08:25
5094	206	83	4本(チャービル)	2021-12-11 07:08:25	2021-12-11 07:08:25
5095	207	22	320g(メークィーン)	2021-12-11 07:09:25	2021-12-11 07:09:25
5096	207	264	バーニャカウダに使用した牛乳+牛乳で320cc	2021-12-11 07:09:25	2021-12-11 07:09:25
5097	207	241	少々	2021-12-11 07:09:25	2021-12-11 07:09:25
5098	207	222	小さじ1	2021-12-11 07:09:25	2021-12-11 07:09:25
5099	207	266	80g	2021-12-11 07:09:25	2021-12-11 07:09:25
5113	1	135	12枚(400g)	2021-12-13 08:16:32	2021-12-13 08:16:32
5114	1	61	120g	2021-12-13 08:16:32	2021-12-13 08:16:32
5115	1	62	80g	2021-12-13 08:16:32	2021-12-13 08:16:32
5116	1	38	80g	2021-12-13 08:16:32	2021-12-13 08:16:32
5117	1	63	2個	2021-12-13 08:16:32	2021-12-13 08:16:32
5118	5	35	480g	2021-12-13 09:02:18	2021-12-13 09:02:18
5119	5	134	400g	2021-12-13 09:02:18	2021-12-13 09:02:18
5120	5	209	400g	2021-12-13 09:02:18	2021-12-13 09:02:18
5121	6	41	200g	2021-12-13 09:03:00	2021-12-13 09:03:00
5122	6	271	200g	2021-12-13 09:03:00	2021-12-13 09:03:00
5123	7	261	4枚	2021-12-13 09:03:32	2021-12-13 09:03:32
5124	7	14	160cc	2021-12-13 09:03:32	2021-12-13 09:03:32
5125	7	247	小さじ1/4	2021-12-13 09:03:32	2021-12-13 09:03:32
5126	8	264	100cc	2021-12-13 09:04:11	2021-12-13 09:04:11
5127	8	271	200g	2021-12-13 09:04:11	2021-12-13 09:04:11
5128	8	185	60g	2021-12-13 09:04:11	2021-12-13 09:04:11
5129	87	122	240g	2021-12-13 09:08:03	2021-12-13 09:08:03
5130	87	172	40cc	2021-12-13 09:08:03	2021-12-13 09:08:03
5131	87	256	12g	2021-12-13 09:08:03	2021-12-13 09:08:03
5132	87	35	120g	2021-12-13 09:08:03	2021-12-13 09:08:03
5133	87	14	240cc	2021-12-13 09:08:03	2021-12-13 09:08:03
5134	87	42	1個	2021-12-13 09:08:03	2021-12-13 09:08:03
5135	87	80	1/2個	2021-12-13 09:08:03	2021-12-13 09:08:03
5136	111	35	240g	2021-12-13 09:26:18	2021-12-13 09:26:18
5137	111	51	トッピング用とペースト用で各80g	2021-12-13 09:26:18	2021-12-13 09:26:18
5138	111	166	小さじ1	2021-12-13 09:26:18	2021-12-13 09:26:18
5139	111	230	大さじ8	2021-12-13 09:26:18	2021-12-13 09:26:18
5140	111	61	200g	2021-12-13 09:26:18	2021-12-13 09:26:18
5141	111	68	4本	2021-12-13 09:26:18	2021-12-13 09:26:18
5142	111	67	1本	2021-12-13 09:26:18	2021-12-13 09:26:18
5143	111	56	60g	2021-12-13 09:26:18	2021-12-13 09:26:18
5144	111	14	240cc	2021-12-13 09:26:18	2021-12-13 09:26:18
5145	111	247	小さじ1/2	2021-12-13 09:26:18	2021-12-13 09:26:18
5146	112	14	240cc	2021-12-13 09:26:52	2021-12-13 09:26:52
5147	112	247	小さじ1/2	2021-12-13 09:26:52	2021-12-13 09:26:52
5148	113	137	4本(1本40g位)	2021-12-13 09:27:26	2021-12-13 09:27:26
5149	113	206	小さじ2	2021-12-13 09:27:26	2021-12-13 09:27:26
5150	113	235	小さじ2	2021-12-13 09:27:26	2021-12-13 09:27:26
5151	113	230	小さじ2	2021-12-13 09:27:26	2021-12-13 09:27:26
5152	113	12	小さじ2	2021-12-13 09:27:26	2021-12-13 09:27:26
5153	115	264	200cc	2021-12-13 09:27:47	2021-12-13 09:27:47
5154	115	230	小さじ8	2021-12-13 09:27:47	2021-12-13 09:27:47
5155	115	176	小さじ2	2021-12-13 09:27:47	2021-12-13 09:27:47
5156	115	271	80g	2021-12-13 09:27:47	2021-12-13 09:27:47
5157	120	143	240g	2021-12-13 09:28:35	2021-12-13 09:28:35
5158	120	76	80g	2021-12-13 09:28:35	2021-12-13 09:28:35
5159	120	38	60g	2021-12-13 09:28:35	2021-12-13 09:28:35
5160	120	70	60g	2021-12-13 09:28:35	2021-12-13 09:28:35
5161	120	275	4個	2021-12-13 09:28:35	2021-12-13 09:28:35
5162	120	14	240cc	2021-12-13 09:28:35	2021-12-13 09:28:35
5163	121	116	40g	2021-12-13 09:29:04	2021-12-13 09:29:04
5164	121	143	40g	2021-12-13 09:29:04	2021-12-13 09:29:04
5165	121	76	40g	2021-12-13 09:29:04	2021-12-13 09:29:04
5166	121	207	小さじ2	2021-12-13 09:29:04	2021-12-13 09:29:04
5167	122	145	120g	2021-12-13 09:31:19	2021-12-13 09:31:19
5168	122	39	60g	2021-12-13 09:31:19	2021-12-13 09:31:19
5169	122	36	40g	2021-12-13 09:31:19	2021-12-13 09:31:19
5170	122	82	4g	2021-12-13 09:31:19	2021-12-13 09:31:19
5171	122	206	小さじ2	2021-12-13 09:31:19	2021-12-13 09:31:19
5172	132	35	120g	2021-12-13 09:32:24	2021-12-13 09:32:24
5173	132	37	60g	2021-12-13 09:32:24	2021-12-13 09:32:24
5174	132	38	40g	2021-12-13 09:32:24	2021-12-13 09:32:24
5175	132	210	小さじ1	2021-12-13 09:32:24	2021-12-13 09:32:24
5176	132	285	小さじ2	2021-12-13 09:32:24	2021-12-13 09:32:24
5177	132	206	小さじ2	2021-12-13 09:32:24	2021-12-13 09:32:24
5178	132	288	40g	2021-12-13 09:32:24	2021-12-13 09:32:24
5179	132	14	240cc	2021-12-13 09:32:24	2021-12-13 09:32:24
5180	132	275	2個	2021-12-13 09:32:24	2021-12-13 09:32:24
5181	133	134	100 ×４枚	2021-12-13 09:34:28	2021-12-13 09:34:28
5182	133	206	小さじ2	2021-12-13 09:34:28	2021-12-13 09:34:28
5183	133	212	小さじ1	2021-12-13 09:34:28	2021-12-13 09:34:28
5184	133	213	小さじ1	2021-12-13 09:34:28	2021-12-13 09:34:28
5185	133	285	小さじ1	2021-12-13 09:34:28	2021-12-13 09:34:28
5186	208	218	小さじ2	2021-12-13 09:36:46	2021-12-13 09:36:46
5187	208	256	60g	2021-12-13 09:36:46	2021-12-13 09:36:46
5188	208	264	200cc	2021-12-13 09:36:46	2021-12-13 09:36:46
5189	208	313	小さじ1	2021-12-13 09:36:46	2021-12-13 09:36:46
5190	208	49	20g	2021-12-13 09:36:46	2021-12-13 09:36:46
5191	208	37	40g	2021-12-13 09:36:46	2021-12-13 09:36:46
5192	208	47	60g	2021-12-13 09:36:46	2021-12-13 09:36:46
5193	208	70	60g	2021-12-13 09:36:46	2021-12-13 09:36:46
5194	178	22	2個(300g)	2021-12-13 11:13:04	2021-12-13 11:13:04
5195	178	35	1/2個	2021-12-13 11:13:04	2021-12-13 11:13:04
5196	178	134	小1枚(200g)	2021-12-13 11:13:04	2021-12-13 11:13:04
5197	178	219	小さじ1/3	2021-12-13 11:13:04	2021-12-13 11:13:04
5198	178	279	大さじ2	2021-12-13 11:13:04	2021-12-13 11:13:04
5199	178	192	大さじ1	2021-12-13 11:13:04	2021-12-13 11:13:04
5208	205	29	4個	2021-12-13 11:14:59	2021-12-13 11:14:59
5209	205	219	小さじ1	2021-12-13 11:14:59	2021-12-13 11:14:59
5210	205	307	小さじ2	2021-12-13 11:14:59	2021-12-13 11:14:59
5211	205	249	小さじ2	2021-12-13 11:14:59	2021-12-13 11:14:59
5212	205	217	大さじ1	2021-12-13 11:14:59	2021-12-13 11:14:59
5213	205	45	200g	2021-12-13 11:14:59	2021-12-13 11:14:59
5214	205	71	8g	2021-12-13 11:14:59	2021-12-13 11:14:59
5215	205	312	小さじ2	2021-12-13 11:14:59	2021-12-13 11:14:59
5225	179	116	120g	2021-12-13 11:27:19	2021-12-13 11:27:19
5226	179	72	120g	2021-12-13 11:27:19	2021-12-13 11:27:19
5227	179	54	斜め薄切り20g	2021-12-13 11:27:19	2021-12-13 11:27:19
5228	179	103	せん切り10g	2021-12-13 11:27:19	2021-12-13 11:27:19
5229	179	156	40g 1/2缶	2021-12-13 11:27:19	2021-12-13 11:27:19
5230	26	275	4個	2021-12-13 11:35:17	2021-12-13 11:35:17
5231	26	118	100g	2021-12-13 11:35:17	2021-12-13 11:35:17
5232	26	191	小さじ8	2021-12-13 11:35:17	2021-12-13 11:35:17
5233	26	14	100cc	2021-12-13 11:35:17	2021-12-13 11:35:17
5234	26	34	1/2本	2021-12-13 11:35:17	2021-12-13 11:35:17
5235	26	117	4本(40g位)	2021-12-13 11:35:17	2021-12-13 11:35:17
5236	28	127	4尾(1尾40g)	2021-12-13 11:38:18	2021-12-13 11:38:18
5237	28	253	小さじ4	2021-12-13 11:38:18	2021-12-13 11:38:18
5272	13	145	400g(12~16枚)厚み2mm	2021-12-13 13:01:23	2021-12-13 13:01:23
5273	13	35	280g	2021-12-13 13:01:23	2021-12-13 13:01:23
5274	30	126	暑さ1cm× 4切れ	2021-12-13 13:07:35	2021-12-13 13:07:35
5275	30	46	4枚	2021-12-13 13:07:35	2021-12-13 13:07:35
5276	30	269	40g	2021-12-13 13:07:35	2021-12-13 13:07:35
5277	30	160	8粒	2021-12-13 13:07:35	2021-12-13 13:07:35
5287	169	134	2枚(500g)	2021-12-13 13:17:14	2021-12-13 13:17:14
5288	169	35	1/2個(100g)	2021-12-13 13:17:14	2021-12-13 13:17:14
5289	169	256	10g	2021-12-13 13:17:14	2021-12-13 13:17:14
5290	169	209	1缶(400g)	2021-12-13 13:17:14	2021-12-13 13:17:14
5291	169	162	50cc	2021-12-13 13:17:14	2021-12-13 13:17:14
5292	169	91	1~2枚	2021-12-13 13:17:14	2021-12-13 13:17:14
5293	169	93	オリーブ12~20粒くらい	2021-12-13 13:17:14	2021-12-13 13:17:14
5294	169	262	20g	2021-12-13 13:17:14	2021-12-13 13:17:14
5295	169	288	適量	2021-12-13 13:17:14	2021-12-13 13:17:14
5299	220	40	1/2束　100g	2021-12-13 13:58:01	2021-12-13 13:58:01
5300	220	109	小さじ１	2021-12-13 13:58:01	2021-12-13 13:58:01
5301	220	14	炊いて400g位	2021-12-13 13:58:01	2021-12-13 13:58:01
5302	198	306	4個	2021-12-14 05:15:58	2021-12-14 05:15:58
5303	198	269	40g	2021-12-14 05:15:58	2021-12-14 05:15:58
5304	198	192	小さじ1	2021-12-14 05:15:58	2021-12-14 05:15:58
5305	198	288	80g	2021-12-14 05:15:58	2021-12-14 05:15:58
5306	198	305	小さじ4	2021-12-14 05:15:58	2021-12-14 05:15:58
5307	198	88	4個	2021-12-14 05:15:58	2021-12-14 05:15:58
5308	198	186	小さじ1/2	2021-12-14 05:15:58	2021-12-14 05:15:58
1	1	1	一袋	2025-02-01 06:32:15	2025-02-01 06:32:15
2	1	215	二たらし	2025-02-01 06:32:15	2025-02-01 06:32:15
3	1	223	二つまみ	2025-02-01 06:32:15	2025-02-01 06:32:15
5310	223	21	リングイネ　200g	2025-02-11 06:46:07	2025-02-11 06:46:07
5311	223	35	120g	2025-02-11 06:46:07	2025-02-11 06:46:07
5312	223	37	40g	2025-02-11 06:46:07	2025-02-11 06:46:07
5313	223	51	40g	2025-02-11 06:46:07	2025-02-11 06:46:07
5314	223	256	8g	2025-02-11 06:46:07	2025-02-11 06:46:07
5315	223	262	10g	2025-02-11 06:46:07	2025-02-11 06:46:07
5316	223	133	牛バラ薄切りにく320g	2025-02-11 06:46:07	2025-02-11 06:46:07
5317	223	222	小さじ1/2	2025-02-11 06:46:07	2025-02-11 06:46:07
5318	223	233	小さじ2	2025-02-11 06:46:07	2025-02-11 06:46:07
5319	223	162	小さじ4	2025-02-11 06:46:07	2025-02-11 06:46:07
\.


--
-- Data for Name: recipe_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe_tags (id, recipe_id, tag_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes (id, user_id, name, body, recipe_category_id, menu_id, howto_id, recipe_country_id, mainsub_id, season_id, image_path, image_path2, is_easy, is_favorite, is_refresh, is_healthy, is_caloryoff, created_at, updated_at) FROM stdin;
1	1	黒酢酢豚	1　豚肩ロース薄切り肉を肉下味用で味付け。\\r\\n2　片栗粉小さじ4を加えてもみ込む。軽く握り丸める、1人3個。\\r\\n3　かぼちゃは種ワタを除き、一辺が8cm、厚さ5mmの薄切り。1人2〜3切れ。れんこんは皮をむき、厚さ5mmの輪切り。または半月切り。1人2〜3切れ。\\r\\n4　赤パプリカ・ピーマンは種を除き乱切り。(それぞれ1人2〜4切れ)\\r\\n5　鍋にあん用の調味料をあわせ、よく混ぜ、混ぜながら加熱。弱火〜中火。沸騰したら中火で30秒〜1分加熱。\\r\\n6　かぼちゃ・れんこん・赤パプリカ・ピーマンを170度の油で揚げる。\\r\\n7　6をあんに加える。\\r\\n8　豚肉に片栗粉小さじ4をまぶし、170度の油に入れ、徐々に温度をあげながら、6分程じっくりと揚げる。\\r\\n9　8をあんに加えて混ぜる。器に盛り付ける。	5	1	0	3	1	\N	2rvbliruRTNfx7bZbwYOJj047tytRzssf2IgwDxm.jpg	\N	0	0	0	0	0	2021-11-04 01:18:44	2021-12-13 08:16:32
2	1	きゅうりの浅漬け	1　きゅうりは厚さ5mmの輪切り。\\r\\n2　きゅうりを立て塩に漬ける。10分くらい。\\r\\n3　ボウルに水気を絞ったきゅうりを入れ、味付け用を加え和える。\\r\\n4　器に盛り付ける。	8	1	0	1	2	\N	7XO7bs1bEBXEmV1V5lVshwWSoa7ROyhBL8c5XQwb.jpg	\N	0	0	0	0	0	2021-11-04 01:28:57	2021-12-06 07:18:59
3	1	中華コーンスープ	1　鍋に卵以外の材料・調味料を入れてよく混ぜる。\\r\\n2　火にかけ混ぜながら、とろみがつくまで加熱。\\r\\n3　卵は1個よくときほぐす。\\r\\n4　3を静かに流し入れ、火を通し軽く混ぜる。\\r\\n5　火を止め器に分入れる。	2	1	0	3	2	\N	ZZpNTHQz1WmgaQ85pu89Kpb8bP6ZeJZ9B1gcjDwR.jpg	\N	0	0	0	0	0	2021-11-04 01:35:16	2021-12-06 07:19:57
4	1	黒ごまプリン	1　粉ゼラチンは湯に振り入れ、溶かす。シロップ具材を混ぜ合わせ、クコの実を加える。\\r\\n2　牛乳にフロストシュガー小さじ2を加え、混ぜ溶かす。\\r\\n3　ボウルに黒煉ごまを入れ、2を少しずつ加え溶きのばす。\\r\\n4　溶かしたゼラチンを加えて混ぜ、生クリーム40gを加えて混ぜる。\\r\\n5　器に分入れ冷蔵庫に入れて冷やし固める。\\r\\n6　黒ごまプリンにシロップをかけ、クコの実を飾る。	6	1	0	3	3	\N	ANnQuTToYcDThfz5SrFS8waoh8n6Grw3QIQpzgbm.jpg	\N	0	0	0	0	0	2021-11-04 02:01:02	2021-12-06 07:20:52
5	1	チキンカレー	1　鶏もも肉は皮を除き、余分な水気・脂肪を除き、2cm角くらいに切り、塩こしょうをしてなじませてから、マヨネーズで下味をつける。\\r\\n2　玉ねぎは根元を除き、繊維に逆らった薄切り。ほうれん草は根元の泥を流水の下でしっかり洗い流す。\\r\\n3　茹で湯にほうれん草を根元・葉の順に入れ3分程茹でる。冷水にとり水気を絞る。根元を除き、長さ2cmに切る。\\r\\n4　鍋に玉ねぎ・サラダ油小さじ1を入れて炒める。強火10分前後、焦げ注意。飴色になったら粗熱を取る。\\r\\n5　香り付け用を加えて熱し、弱火で香りを引き出す。鶏肉をマヨネーズごと加えて、焼き色をつけるように加熱する。\\r\\n6　調味料Aを加えて強火10分で煮詰める。調味料Bも加える。\\r\\n7　塩小さじ1/8・黒こしょう少々で味を整える。チキンカレーの全体の2/3量を器に盛り付ける。(チキンは全て盛り付ける)	5	1	0	8	1	\N	mFJy6bqB2uf2D8R2JgyPurtEkrijzsOpsVHbd5Sm.jpg	\N	0	0	0	0	0	2021-11-04 07:08:51	2021-12-13 09:02:18
6	1	ほうれん草とヨーグルトのカレー	1　チキンカレーの残りに水気をよく絞ったほうれん草・調味料Cを加えてよく混ぜ、強火で5分煮詰める。ローリエを除き調味料Dを加えなじませる。\\r\\n2　塩こしょう少々で味をととのえる。器に盛り付ける。	2	2	0	8	1	\N	VLBjBzTN2Las8Fq82IgVX5zeSBpBhEnzF444KbBn.jpg	\N	0	0	0	0	0	2021-11-04 07:26:35	2021-12-13 09:03:00
7	1	チーズクルチャ&ターメリックライス	1　スライスチーズは4つ折りにする。インスタントドライイースト小さじ1/2は仕込み水A(42度〜43度)80ccに入れ、砂糖ひとつまみ(生地用砂糖から)を加えひと混ぜして5分くらい置き、予備発酵させる。\\r\\n2　ボウルに生地用Aを入れて、ざっと混ぜ、予備発酵させた仕込み水Bを加え混ぜる。仕込み水を調節しながら加え混ぜる。ある程度まとまってきたらサラダ油小さじ2を混ぜる。\\r\\n3　台の上に出し、生地の表面が滑らかになるまでこねる。生地を4分割にし、丸め直してラップをかけ生地を休ませる。5分くらい。\\r\\n4　閉じ目を上にして8cm位の円形に薄くのばし、チーズをのせてつつみ、しっかり閉じ目を閉じる。上から押さえて10cm位の円形にのばす。\\r\\n5　サラダ油小さじ2を入れたフライパンに閉じ目を下にして、乾燥させないように蓋をして発酵させる。室温で5分くらい。\\r\\n6　蓋を取り加熱する。閉じ目の面に香ばしい焼き色がついたら、裏返し両面をよく焼く。(中火〜強火4分前後。返して中火3分前後)\\r\\n7　蓋をし、すきまから水40ccを加えて、強火1分蒸し焼きにする。\\r\\n8　米を洗い30分吸水後、水気をよく切り、水160cc・ターメリックを加えて蓋をして炊く。沸騰後弱火10分。火を止め蒸らす。10分くらい。\\r\\n9　こんもりと盛り付けたターメリックライスに、チーズクルチャを立てかける。	4	2	0	8	1	\N	jEPoFUwybaVCen26oIfUnUF7voNpeAfWxFtJmQy4.jpg	\N	0	0	0	0	0	2021-11-04 07:52:53	2021-12-13 09:03:32
8	1	マンゴーラッシー	1　ボウルにプレーンヨーグルトを入れる。\\r\\n2　牛乳を少しずつ加えて混ぜる。\\r\\n3　グラスにマンゴージャムを分入れ、2を注ぐ。	6	2	0	8	3	\N	iIjqB0hJdX0Lxd6eNtznZAyYOsXE4kYfKtw7k2Ef.jpg	\N	1	0	0	0	0	2021-11-04 07:55:28	2021-12-13 09:04:11
16	1	キャラメル豆乳プリン	1　ボウルに卵を割り入れ、よく溶きほぐす(A) 。別のボウルに調製豆乳・砂糖を入れ、よく混ぜ溶かす(B)。\\r\\n2　BにAとバニラオイル8ふりを加えて混ぜ、ぬらした茶こしでこして器に注ぐ。\\r\\n3　鍋に湯を張り、沸騰させる。火を止めざるを入れ、2を入れる。\\r\\n4　フタをし、強火で2〜3分加熱する。目安:表面の色が変わるくらい。\\r\\n5　弱火または保温する。10分くらい。プリンに竹串を刺し、液体が出てこなければ火を止める。\\r\\n6　粗熱を取り冷蔵庫で冷やす。豆乳プリンにキャラメルシロップをかける。(1人分のキャラメルシロップ小さじ1)	6	4	0	1	3	\N	n6GjVhSqcydVxf7z5rNNCnfkVa7cbKIuErkn7wMG.jpg	\N	0	0	0	0	0	2021-11-04 12:33:32	2021-12-06 07:39:23
9	1	手打ちニョッキのグラタン	1　ベーコンは幅1cmに切る。カマンベールチーズは4等分に切る。\\r\\n2　じゃが芋は皮を剥き、芽を除いて1cm角に切り、5分位水にさらす。水気を切る。鍋にじゃが芋・じゃが芋がかぶるくらいの水を入れて、加熱。\\r\\n3　竹串がすっと通るくらいの柔らかさになるまで茹でて、湯を捨てて、再度火にかけて粉ふき芋にする。\\r\\n4　ボウルに入れ、熱いうちに切るようにつぶす。ニョッキ用材料Nを加え、切り混ぜる。均一に混ざったら、ひと塊にまとめる。\\r\\n5　消毒した台の上に取り出し、滑らかになるまでこねる。生地を4等分する。40cmくらいにのばし、長さ2cmくらいに切る。\\r\\n6　タイミング見計らい、塩大さじ1を加えた熱湯1.5Lを用意しニョッキを茹でる。浮き上がってきてから1分くらい。水気を切ってグラタン皿に分け入れる。\\r\\n7　フライパンにベーコンを入れてから加熱し、炒める。牛乳・生クリームを加えて加熱し、沸騰したら軽く煮詰める。中火5分くらい。\\r\\n8　火を止めて粉チーズ・塩を加えて味をととのえ、ニョッキにチーズソースAをかける。\\r\\n9　カマンベールチーズをのせオーブンで焼く。電気230度15分・ガス220度15分くらい。受け皿にのせパセリをふる。\\r\\n\\r\\n＊オーブン予熱　電気230度15分~・ガス220度15分~	4	3	2	2	1	\N	c7UWMxcyuxxRQS1yfjsjiSmnuXXZpTLTkPKhLtPC.jpg	uKfqoIY84PmHSwAs0oX9J8xqa82igFhuwfA6YpN4.jpg	0	1	0	0	0	2021-11-04 09:27:41	2021-12-06 07:25:20
10	1	スパイシーチキン	1　鶏手羽中は手羽先の関節のところの切り口を上にして、骨と肉の間にあるスジをキッチンバサミできる。筋を切った部分の肉を押し下げる。\\r\\n2　内側の肉が表側になるようにめくって裏返す。細い骨は抜き取る。チューリップ状。\\r\\n3　ボウルに鶏肉漬け込み用Aを入れ混ぜる。鶏肉を加え漬け込む。20分くらい。鶏肉の汁気を軽く除き、片栗粉小さじ8~をまぶして軽く握り、形をととのえる。\\r\\n4　160度の油に入れて、火が通るまで揚げる。5分位。バットに取り出し、油を切る。	5	3	0	2	1	\N	hXcI1p3oN8yuLqPhCHzIMXwraCRDMyFSEBiF8Zsv.jpg	zVO9zXgdMSgpUQz8zqh3GaXyRf5877G0oWXWG3EO.jpg	0	1	0	0	0	2021-11-04 09:37:21	2021-12-06 07:25:53
11	1	かぼちゃとナッツのサラダ&トマトとルッコラのサラダ	1　グリーンリーフは食べやすい大きさにちぎる。ルッコラは根元を除き、長さを4等分に切る。一緒に水にさらし、水気を切る。\\r\\n2　トマトはヘタを除いて洗い、8等分のくし形切りにし、さらに斜め半分に切る。\\r\\n3　カボチャは種・ワタを除き、耐熱皿にのせてラップをふんわりとかけ、電子レンジで600w4分加熱。かぼちゃは一口大くらいに崩す。\\r\\n4　ボウルに味付け用Aを入れ、よく混ぜる。かぼちゃ・グリーンレーズンを加え、ざっくりと混ぜる。サワークリームを加え、さらにざっくりと混ぜる。\\r\\n5　皿に4・スパイシーチキンを盛り付け、くるみを飾る。1を盛り付け、トマトを飾りドレッシングをかける。\\r\\n\\r\\n＊くるみは予熱なしのオーブンでロースト(電気170度8分/ガス160度8分)、粗く砕いておく。\\r\\n＊ドレッシング名 : キューピーテイスティドレッシング イタリアン	3	3	0	2	2	\N	LomkGpWGPlvKbAJHnmwJO0rDvTScmbnrnhJ1yL6e.jpg	\N	1	1	1	0	0	2021-11-04 09:51:08	2021-12-06 07:26:49
12	1	まるごとマロンケーキ	1　チョコレートシロップはラップに計量・卵は室温に戻し、よく溶きほぐす。\\r\\n2　ボウルにバターを入れて混ぜ、砂糖大さじ4を加え、クリーム状になるまですり混ぜる。卵を3〜4回に分けて加え、その都度よく混ぜる。\\r\\n3　ラム酒を加え混ぜる。薄力粉をふるい入れ、切り混ぜる。紙型(マフィン型)に分け入れる。\\r\\n4　中央に栗の渋皮煮を埋め込む。空気抜きをして天板にのせる。\\r\\n5　オーブンで焼く。電気180度20分・ガス170度20分。竹串を刺し、焼けているかを確認し粗熱を取る。マロンケーキです。\\r\\n6　皿にチョコレートシロップで蜘蛛の巣などを描き、紙型を外したマロンケーキを盛り付け、ココアパウダーをふるう。\\r\\n\\r\\n＊バターは室温に戻す。栗の渋皮煮は汁気を除いておく。オーブンに予熱・電気180度20分・ガス170度20分	6	3	2	2	3	\N	4wEBS7ex9vTgd37LHPAfhjtd1MizvEkiaE0BKbmi.jpg	\N	0	0	0	0	0	2021-11-04 10:02:33	2021-12-06 07:27:24
13	1	みそしょうが焼	1　豚肩ロース薄切り肉はきざみしょうが小さじ2を馴染ませる。\\r\\n2　玉ねぎは根元を除き、繊維に逆らって厚さ1cmに切る。合わせ調味料を合わせる。\\r\\n3　フライパンにサラダ油小さじ1を熱し、玉ねぎを入れ、しんなりとするまで炒め取り出す。\\r\\n4　サラダ油小さじ1を足し、両面に香ばしい焼き色をつける。アクがでていたら、余分な脂とともに除く。\\r\\n5　玉ねぎを戻し入れ、合わせ調味料を加え、中火で1分煮からめる。\\r\\n6　皿に盛り付け、雑穀ごはんを添える。	5	4	0	1	1	\N	3dqOnU87YyhSJEN82F7yvibEqdKQLBUDHOmHgRI6.jpg	\N	0	1	0	0	0	2021-11-04 11:02:48	2021-12-13 13:01:23
14	1	ミネラルサラダ	1　芽ひじきはさっと洗い汚れを流し、新しい水をたっぷり注いで、10〜15分戻す。ザルで水気をよく切る。\\r\\n2　ツナ缶(ノンオイルタイプ・4/5缶(56g))は汁気を切る。水菜は根元を除き、長さ4cmに切り、水にさらし水気を切る。\\r\\n3　アボガドは種皮をを除き、1cmの角切り。ラップを密着させてかける。プチトマトはヘタを除き、洗って水気を切り、縦4等分に切る。\\r\\n4　フライパンにサラダ油小さじ1/2を熱し、ひじき・ツナ・きざみしょうが小さじ1を入れて炒める。\\r\\n5　フライパンの粗熱を取り、炒め用Aを加え、汁気がなくなるまで炒める。\\r\\n6　火を止め、削りがつおを加えて混ぜ、粗熱を取る(ひじき煮)。水菜を加えざっくりと混ぜ合わせる。\\r\\n7　器に盛り付け、アボガド・プチトマトを飾り、ドレッシングをかける。\\r\\n＊ドレッシング名 : 深煎りごまゆずテイストドレッシング	3	4	0	1	2	\N	s4AD52JKfImyjxQPfojUkI4g2naIJFVhoA4uh0FY.jpg	\N	1	0	1	0	0	2021-11-04 12:07:37	2021-12-06 07:28:39
15	1	きのこの豆乳みそ汁	1　しめじは石づきを除き、小房に分け、長さを半分に切る。えのき茸は根元を除き、長さ1cmに切る。\\r\\n2　椎茸は石づきを除き、笠と軸に分け、笠・軸ともに薄切り。\\r\\n3　鍋に水240cc・しめじ・えのき茸・椎茸を入れて加熱し、火を通す。\\r\\n4　調製豆乳を加えて温め、火を弱め、みそ(液体)を加えて味をととのえる。\\r\\n5　椀に分け入れる。	2	4	0	1	2	\N	k6DmUGaX7ytX2x0pjUu2Vkti9iSKiQhOOauD0MjQ.jpg	\N	1	0	1	0	0	2021-11-04 12:21:33	2021-12-06 07:38:47
17	1	チリトマトカルボナーラ	1　ベーコン5mm角の棒状に切る。ボウルに卵を割り入れよく溶きほぐす。\\r\\n2　卵味付けAを加え、混ぜる。\\r\\n3　4等分にし、それぞれに味付けBを加え混ぜる。\\r\\n4　フライパンにベーコン・オリーブオイル小さじ1を入れて火にかけ脂が出てくるまで、じっくり焼く。弱火〜中火で4分位。\\r\\n5　ペーストCを加え、香りが出てくるまで炒め合わせる。火を止めて白ワイン大さじ1を加え、再度加熱してアルコール分を飛ばす。\\r\\n6　4等分にし、粗熱をとり、3に分け入れる。\\r\\n7　スパゲティは塩を加えた熱湯でタイミングを見計って茹でる。\\r\\n8　6に茹で上がったスパゲティを分入れよく混ぜる。\\r\\n9　器に盛り付け、温泉卵を中央にのせ、粉チーズ・黒こしょうをふる。	4	5	0	2	1	\N	bHR7vmUKXYwdyIm9vV3nRVcp6KTT00EoTPOZ67yt.jpg	\N	0	1	0	0	0	2021-11-04 12:57:16	2021-12-06 07:40:10
18	1	マスタードチキングリル	1　鶏もも肉は余分な水分・脂肪を取り除き、厚みがあれば開き、塩こしょうで下味をつける。\\r\\n2　かぶは茎を1cm残して切ってよく洗い、皮付きのまま8等分に切る。ボウルにマスタードソース用を入れ混ぜる。マスタードソースです。\\r\\n3　フライパンにオリーブオイル小さじ1を入れ、鶏肉を皮面から入れる。空いてる所にかぶを加えて火をつけ、かぶを時々返しながら、鶏肉に焼き色がつくまで焼く。\\r\\n4　鶏肉に焼き色がついたら裏がえし、かぶに塩こしょう各少々をふる。\\r\\n5　天板にクッキングシートを敷いて、四隅をひねり、かぶ・鶏肉の皮面を上にして並べ、マスタードソースを塗る。\\r\\n6　オーブンで焼く。電気230度12分・ガス220度12分くらい。皿に鶏肉を盛り付けかぶを添える。	5	5	2	2	1	\N	6OsrOMemIKSg3I34d5VlH5ADCKBeAqB7W7Z6TjDr.jpg	fIkggw7F1aGgyouiGIT2drMsSUx5MsE0MtgSMlUy.jpg	0	1	0	0	0	2021-11-04 13:04:10	2021-12-06 07:40:48
20	1	焼ききのこサラダ	1　しめじは石づきを除き、小房に分ける。まいたけは根元を除き小房に分ける。プチトマトはヘタを除いて洗い、縦4等分に切る。\\r\\n2　フライパンにオリーブオイル大さじ1を熱し、しめじ・まいたけを入れ、香ばしい焼き色をつけるように焼く。塩こうじを加えからめる。\\r\\n3　皿にグリーンリーフ・トレビスを盛り付け、きのこ・プチトマトをバランスよくのせる。ドレッシングをかける。＊1人分ドレッシング(キューピーごま油&ガーリックドレッシング)小さじ1/2。	3	5	0	1	2	\N	Vx24l1139tGqRtWvtP05VLF7QCeZg40oWUoe3rUk.jpg	\N	1	0	1	0	0	2021-11-04 13:15:06	2021-12-06 07:41:59
21	1	洋梨のクラフティ	1　洋梨(缶)は汁気を除き、厚さ2〜3mmの薄切り。\\r\\n2　ボウルに卵を割り入れ、泡立たないようにコシを切り、砂糖大さじ2を加えて混ぜる。\\r\\n3　生地用をふるい入れ、よく混ぜる。\\r\\n4　牛乳を加え混ぜる。生クリーム・バニラオイルを加え、さらに混ぜる。\\r\\n5　ココットに生地を流して、洋梨をのせ天板にのせてオーブンで焼く。電気230度12分・ガス220度12分\\r\\n6　受け皿にのせ、粉糖をふるう。\\r\\n＊オーブンに予熱を入れておく。電気230度12分・ガス220度12分	9	5	2	2	3	\N	oAy86aG5PUNvoysTcj8hTQ5O0AZmNAaPYpAEC7Ih.jpg	\N	0	0	0	0	0	2021-11-04 13:39:25	2021-12-06 07:44:08
22	1	ローストビーフ~玉ねぎとしょうゆこうじのソース	1　牛もも塊肉は室温に30分以上戻しておく。水気を抜き、砂糖・塩・黒こしょう(肉下味用)をもみ込み、5分ほど下味をつける。\\r\\n2　フライパンにオリーブオイル小さじ1を熱し、牛肉を香ばしく焼く。天板にアルミホイルを敷き、牛肉をのせる。\\r\\n3　オーブンで焼く。電気200度10分・ガス180度10分。牛肉をアルミホイルで包み、温かい所に置き、蒸らして中まで火を通す。(オーブンから出した時点で肉汁があればソースに加える。)\\r\\n4　蒸らし時間が終わったら、肉汁を2のフライパンに移し、再度アルミホイルで包んで、ビニール袋に入れ空気が入らないようにして口をしっかりと結ぶ。冷水で10分くらい冷やす。\\r\\n5　牛肉を焼いたアルミホイルに肉汁・玉ねぎ・しょうゆこうじ・水・黒こしょうを入れて混ぜ、とろみがつくまで加熱する。(玉ねぎとしょうゆこうじのソースA)。\\r\\n6　ローストビーフを薄くそぎ切りにし、皿に盛り合わせる。玉ねぎとしょうゆこうじのソースをかける。\\r\\n\\r\\n＊　玉ねぎはすりおろしておく。オーブンの予熱。電気200度10分・ガス180度10分	9	6	2	2	1	\N	DBUDy6Nw3bvZXn8dBlj23IjyTTjjzcmq6VlW6oQS.jpg	QLqiLDQ0Pb95dAksYfYL5ROwQx5MYkM2gTrdyxqB.jpg	0	0	0	0	0	2021-11-04 13:51:20	2021-12-06 07:45:00
23	1	トマトのポトフ~チーズバゲット	1　鶏手羽元は水気を抜く。じゃが芋は皮をむき、芽があれば除き、4等分に切る。\\r\\n2　玉ねぎは根元を残して4等分のくし形切り。スライスチーズは長さを活かして、4等分に切る。\\r\\n3　クッキングシートをのせた天板に、バゲットをのせ、スライスチーズをのせる。オーブンで焼く。電気200度5分・ガス190度5分。パセリをふる。チーズバゲットです。\\r\\n4　圧力鍋に鶏手羽元・じゃが芋・玉ねぎ・スープ素Aを入れる。\\r\\n5　専用のフタをし、強めの中火にかける。安全ロックピンが上がり、蒸気が出てきたら弱火にして加熱する。10分。\\r\\n6　火を止め、安全ロックピンが下がったら、フタを開け、ローリエを除いて塩少々・黒こしょう少々で味をととのえる。\\r\\n7　器にトマトのポトフを盛り付け、チーズバゲットを添える。\\r\\n\\r\\n＊ オーブンの予熱・電気200度5分・ガス190度5分	2	6	1	2	2	\N	HTvnrLElyEERTLTKC4yZsHSvWYUUkezE4R2s4k0P.jpg	\N	0	0	0	0	0	2021-11-04 14:50:33	2021-12-06 07:46:07
24	1	グラスディップサラダ	1　紅芯大根は皮をむき、1人1枚の半月切りにし、半分くらいまで斜めに切り込みを入れる。黄パプリカはヘタ・種を除き、長めの乱切り。\\r\\n2　かぶは茎を1cmくらい残して切り、根元をよく洗い、8等分に切って皮を剥く。きゅうりは縦4等分にし、さらに斜め半分に切る。1人2切れ。\\r\\n3 　辛子明太子は薄皮を除き、ほぐす。ボウルにサワークリームを入れ、混ぜて滑らかにする。牛乳小さじ1を加えよく混ぜる。\\r\\n4　辛子明太子を加え更に混ぜる。\\r\\n5　器に4を入れ、野菜をバランスよく盛り付ける。\\r\\n\\r\\n＊ サワークリームは使用する10分前に室温に戻しておく。	3	6	0	2	2	\N	S7jSdkkvIrPAnDcClQ0HfT3WqOynvIu07kQ933NF.jpg	\N	0	0	0	0	0	2021-11-04 14:58:56	2021-12-06 07:47:16
25	1	ホワイトムース~ベリーソース仕立て	1　粉ゼラチンは使う直前に湯40cc(50~60度)にふり入れ、溶かす。(ゼラチン液)。生クリームは7分立て（落ちた生クリームの跡が少し残るくらい）にする。(ホイップクリーム)。\\r\\n2　ジャム40g・フランボワーズリキュール小さじ1は混ぜ合わせる。(ベリーソース)。\\r\\n3　ボウルにムース素Aを入れてよく混ぜる。\\r\\n4　ゼラチン液を加えよく混ぜる。\\r\\n5　ホイップクリームを2〜3回に分けて入れ、切り混ぜる。冷蔵庫で冷やし固める。\\r\\n6　皿にすくった5・ベリーソースを盛り付ける。ラズベリーを砕いて散らし、ブルーベリー・ミントの葉を飾る。\\r\\n\\r\\n＊ プレーンヨーグルト・サワークリームは使用する10分前に室温に戻しておく。	9	6	0	2	3	\N	JU31kNC5XGUAc3d0RKm7LHjn4FrYXsIVBglySWtg.jpg	8Vm33d90yV6vtTjEoD9t3bOzGxkJBbWJqk6HOEUY.jpg	1	1	1	0	0	2021-11-04 15:15:30	2021-12-06 07:51:58
26	1	伊達巻き寿司	1 　きゅうりは厚さ2mmの輪切りにし、ボウルに入れて塩小さじ1/8をふり、10分くらい置き、水気を絞る。かに風味かまぼこは軽くほぐし、幅1cmに切る。\\r\\n2　温かいご飯に調味酢をまわしかけ、しゃもじで切り混ぜ、うちわであおぎながら冷ます。きゅうり・かに風味かまぼこを加えてまぜ、2等分する。それぞれラップにのせて包む。\\r\\n3　卵焼き器の横幅に合わせて棒状に形をととのえる。(寿司飯)。ミキサーカップに卵・ちぎったはんぺん・きび砂糖・みりん・醤油を入れ、滑らかになるまで回す・30秒。(味付け調味料A)\\r\\n4　熱してサラダ油小さじ1/2をなじませた卵焼き器に生地を半量流し入れる。アルミホイルでフタをして、弱火8分位焼く。中心まで火が通り(竹串で確認)、表面が乾いてきたら火を止める。\\r\\n5　ラップに焼き面を上にしてのせ、ラップをかけて粗熱を取る。ラップを外して手前に寿司飯をのせる。\\r\\n6　ラップの手前を持ち上げ、寿司飯を押さえながら巻き、巻きすで、巻く。1〜2分置き、形をととのえる。\\r\\n7　形が落ち着いたら、1本を6等分に切る。(1回切るごとに包丁を調味酢でぬらしたペーパーで拭く)。皿に盛り付ける。	9	7	0	1	1	\N	iFsDUlAjpLLj1tGWU3JS8tgPGSgyCL7m5M9eIqN9.jpg	LYyfMcDKoNOwKcg1zfxkbTyefjifse2EyIvaJutb.jpg	0	0	0	0	0	2021-11-04 22:44:50	2021-12-13 11:35:17
27	1	スペアリブの香味みそ焼き	1　スペアリブは余分な水分を除く。ビニール袋に調味料Aを入れ、よく混ぜ合わせ、スペアリブを加えてよくもみ込み漬け込んでおく。10分くらい。\\r\\n2　クッキングシートを敷いた天板にスペアリブを並べ、オーブンで焼く。電気230度20分・ガス220度16分くらい。皿にスペアリブを盛り付ける。\\r\\n\\r\\n＊ オーブン予熱必要 電気230度20分・ガス220度16分くらい。	9	7	2	2	1	\N	kg5SUK2eT4bXzOqMCwIZnPbuPOo0mfFGMg4FDHQZ.jpg	\N	0	0	0	0	0	2021-11-04 22:54:58	2021-12-06 07:53:26
28	1	海老のタルタルグリル	1　海老は立て塩・真水の順に洗い、ヒゲを切り、竹串で背ワタを除く。\\r\\n2　もう一度立て塩・真水の順に洗い、(足の部分を特によく洗う)、水気をよく除く。　\\r\\n3　腹を下にし、頭に近いところから、尾の方を1節残したところまで切り開き、余分な水気を除き、形をととのえる。\\r\\n4　クッキングシートを敷いた天板に海老を並べ、切り開いた部分にタルタルソースをのせる。\\r\\n5　オーブンで焼く。電気230度10分・ガス220度8分くらい\\r\\n6　皿に盛り付け、パセリをふる。\\r\\n\\r\\n＊ オーブン予熱必要;  電気230度10分・ガス220度8分くらい	9	7	2	1	1	\N	yKyIU4hbKntXWQ268rxWPCToGDyU5z32MN2aLIiz.jpg	\N	0	0	0	0	0	2021-11-04 23:01:00	2021-12-13 11:38:18
29	1	紅芯大根のゆずこしょう甘酢	1　紅芯大根は皮をむき、厚さ2mmのいちょう切り。ボウルに入れて塩小さじ1/8をふっておく。20分くらい。\\r\\n2　ボウルに調味酢・ゆずこしょうを入れて混ぜる(味付け用A)。水気をよくしぼった紅芯大根を加えて混ぜ、味をなじませる。\\r\\n3　紅芯大根の汁気を軽く切り、器に盛り付ける。	8	7	0	1	2	\N	Tf60EzAI85HJ6mbkySZLuhhOWYfkVQXuJhq9jBE2.jpg	\N	1	0	1	0	0	2021-11-04 23:06:21	2021-12-06 07:54:52
30	1	かまぼこのクリームチーズサンド	1　青じそは軸を除く。クリームチーズは4等分に切る。かまぼこ紅は下1cmくらいを残して、切り込みを入れる。\\r\\n2　かまぼこの切り込みに、青じそ・クリームチーズを挟む。ピンクペッパーを飾る。皿に盛り付ける。	9	7	0	1	1	\N	hPIkuZuIpx3qNGWodVMgXpJD1HLeICZl9v5iTl8C.jpg	\N	1	0	0	0	0	2021-11-04 23:10:52	2021-12-13 13:07:35
31	1	関東風雑煮	1　鶏もも肉は余分な水分・脂肪を除き、酒小さじ1・塩小さじ1/8で下味をつける。10分位。\\r\\n2　人参は皮をむき、梅抜き型で抜く。(梅人参)。抜いた周り(かげ)も使用。みつ葉は根元を除き、長さ2cmに切る。\\r\\n3　鍋に調味料A・鶏肉・人参を入れて加熱する。アクを抜きながら火を通す。調味料Bで味をととのえる。\\r\\n4　椀に汁を少し入れ、人参のかげ・焼いた角もちを入れ、汁と共に鶏肉を均等に分け入れる。梅人参をのせ、みつ葉を添える。	9	7	0	1	2	\N	88aMRq0ck0cZsT8Rr7zRCNScaOOhAWzh67rcYs4k.jpg	\N	1	0	1	0	0	2021-11-04 23:18:55	2021-12-06 07:56:34
32	1	ロブスターのビスク風パスタ	1　ニンニクは皮・芯を除きみじん切り。玉ねぎもみじん切り。\\r\\n2　ロブスターは解凍して水気を除き、背ワタがあれば除く。頭の付け根あたりからフォーク・指を入れ身を外す。殻もダシにする。捨てない。\\r\\n3　フライパンにバター10gを入れて熱し、半分くらい溶けたら、殻を加えみそなどを取り出しながら香ばしく焼く。\\r\\n4　香りがしてきたら、むき身を加えてさっと焼き、一度火を止め白ワインを加えて加熱し、アルコール分を飛ばす。むき身は取り出す。\\r\\n5　水240ccを加え、みそなどを潰しながら強火で5分ほど煮る。ザルでこす。ロブスタースープです。殻は盛り付けに使用。\\r\\n6　同じフライパンにバター10gを溶かし、にんにく12g・玉ねぎ240gを加えしんなりとするまで炒める。薄力粉大さじ2を加え、粉気がなくなるまで炒める。\\r\\n7　トマトペーストを加えて炒め合わせる。(ロブスタースープ＋水)(= 200cc)を加えてのばし、軽くとろみがつくまで加熱する。\\r\\n8　生クリーム・ハーブ&スパイスミックス調味料(調味料A)を加え、ひと煮立ちさせ、味見をして塩で味をととのえる。塩小さじ1/8~。\\r\\n9　スパゲティを加えて混ぜる。皿に盛り付け、殻を飾る。(茹で湯; 熱湯1.5L・塩大さじ1)	4	8	0	2	1	\N	aUFovaZTSmepbgSuVkI5opSUDpBVhAt67i3REqxe.jpg	\N	0	0	0	0	0	2021-11-05 06:05:32	2021-12-06 07:57:20
33	1	マッシュルームと温泉卵のサラダ	1　グリーンリーフ・トレビスは食べやすい大きさにちぎり、水にさらし水気を切る。\\r\\n2　紅芯大根は皮を剥き、厚さ2mmのいちょう切りにし、水にさらし(10分くらい)水気を切る。マッシュルームは薄切り。\\r\\n3　皿にグリーリーフ・トレビス・紅芯大根を彩りよく盛り付け、マッシュルームを散らし、温泉卵を真ん中にのせる。ドレッシングAをかける。	3	8	0	2	2	\N	hB7kLAsbywQYo7lzOPDbbigwWOKQIGb1AsXtixZS.jpg	\N	0	0	1	0	0	2021-11-05 06:15:07	2021-12-06 07:58:11
34	1	ヴィシソワーズ	1　じゃが芋はは皮をむき、芽があれば除き、厚さ7mmの半月切り、または、いちょう切りにして水にさらし、水気を切る。玉ねぎは根元を除き、\\r\\n　   繊維に逆らった2~3mmの薄切り。セロリは筋を除き、2~3mmの斜め薄切り。\\r\\n2　鍋にバター10gを入れて加熱し、半分くらい溶けたら、玉ねぎ・セロリを加えしんなりとするまで炒め、じゃが芋を加え全体に油がまわるように炒める。\\r\\n3　スープ素Aを加え、ひと煮立ちさせてアクを除き、じゃが芋が柔らかくなるまで加熱する。途中アクが出たらのぞく。\\r\\n4　火を止めて粗熱を取り、ローリエを取り出し、滑らかになるまでブレンダーにかける。ボウルに移す。\\r\\n5　水道水にあてて冷まし、盛り付ける。直前まで冷蔵庫で冷やす。\\r\\n6　冷蔵庫から出したての冷たい牛乳を加え、混ぜる。器に盛り付け、パセリをふる。	2	8	0	2	2	\N	l7mlyw08uQhzf2fskAIXeRf1FTcOnFUxEw9JQvdI.jpg	\N	0	0	0	0	0	2021-11-05 06:27:20	2021-12-06 07:59:15
35	1	ショコラケイク	1　薄力粉大さじ4・ココアパウダー小さじ2は合わせてふるう。\\r\\n2　ボウルに卵を割り入れ、コシを切り、少し泡立ててから砂糖を2~3回に分けて加え、リボン状になるまで泡立てる。\\r\\n3　1を加え、やや粉っぽさが残る位まで切り混ぜる。\\r\\n4　牛乳を加えて切り混ぜ、紙型に分け入れ、軽く空気抜きをする。\\r\\n5　天板にのせて焼く。電気180度12分、ガス170度12分。竹串で焼き上がりを確認し、粗熱をとる。\\r\\n6　型から外して皿に裏返して置きココアパウター小さじ1/2(4人分)をふるう。ホイップクリーム・ジャム(4人分で20g)を盛り付けミント(1人1つ)の葉を飾る。	6	8	2	2	3	\N	KD9wTEh36lqSxsqstYpHdXb5pCTkc4SUr0jKCJgZ.jpg	\N	0	0	0	0	0	2021-11-05 06:36:58	2021-12-06 07:59:47
36	1	牛肉のステーキ~レモンバターじょうゆ仕立て~(1人分分量)	1　今回は1人分の材料です。牛ステーキ肉は筋を両面切り、余分な脂肪があれば除き、(焼くとき再利用)、30分室温に戻す。塩小さじ1/8・黒こしょう少々で味を付ける。\\r\\n2　バター8g（1人分）は室温に戻し、ラップで包み、円形にととのえ、冷蔵庫で冷やす。レモンは少々の塩でこすり洗して、輪切りを1枚取り残りは絞る。（1人分）\\r\\n3　ブロッコリーは小房に分け、ため水の中で振り洗いをし、茎は根本と固い部分を除き、乱切り。\\r\\n4　じゃが芋は皮を剥き、食べやすい大きさに切る。1人3切れ。耐熱容器に入れてラップをふんわりとかける。\\r\\n5　電子レンジで加熱。600w1人分で約1分30秒、2人分で2分30秒。取り出し調味料Aを加え混ぜる。\\r\\n6　フライパンにオリーブオイル小さじ1/2を熱し、ブロッコリーを入れて強火で焼く。焼き色がついたら水を入れてフタをし、1分くらい蒸し焼きにする。塩少々をふり取り出す。\\r\\n7　6のフライパンにオリーブオイル小さじ1/2・あれば牛脂を熱し、牛肉を表になる面から入れ焼く。強火2分~.\\r\\n　レア：盛りつける面2分〜→返して1分〜\\r\\n　ミディアム：盛り付ける面2分〜→返して2分〜\\r\\n　ウェルダン：盛り付ける面2分〜→返して3分〜\\r\\n8　牛肉を返し裏面も中火で1分くらい焼く。\\r\\n9　両面焼き色がつき、好みの火通りになったらアルミホイルで包み、温かいところで保温する。3分~\\r\\n10　カップにソース用Bを入れて混ぜる。ラップをせずに電子レンジで加熱。1人分600w30秒、4人分で1分45秒くらい。ソースです。\\r\\n11　10にステーキの肉汁を加え、混ぜる。皿にステーキ・ブロッコリー・ガーリックポテトを添える。\\r\\n12　ステーキの上に輪切りのレモン・バターをのせる。ソースをかける。	5	9	3	2	1	\N	Z3qrwOAHqDV4j3OvHHqxKfJUXrqFT9daomequGAy.jpg	PvhJ8RBbPdiNkXBIQHj6fu8bJVFthl4mzl3Ea2oV.jpg	1	1	0	0	0	2021-11-05 06:55:55	2021-12-06 08:20:50
37	1	クラムチャウダー(1人分)	1　あさりは塩水(水250ccに塩小さじ1/2)につけてアルミホイルなどでフタをして冷暗所に置き、砂出しをする。流水の下でこすり洗いし、殻の汚れを落とし水気を切る。\\r\\n2　ベーコンは幅1cmに切る。カップにあさりと切ったベーコン・スープ素A全てを加え混ぜる。\\r\\n3　ラップをふんわりとかけ、あさりの口が開くまで電子レンジで加熱。600w1分~。\\r\\n4　ラップをはずす。	2	9	3	2	2	\N	so4mZ02fAczz080bHbYfNOeQWoGXTox5kJc0tMRn.jpg	\N	1	0	0	0	0	2021-11-05 07:04:03	2021-12-06 08:25:41
39	1	グリーンサラダ	1　グリーンリーフは食べやすい大きさにちぎり、水にさらし水気を切る。セロリは筋を除き斜め薄切り。\\r\\n2　皿にグリーンリーフ・セロリを盛り付ける。ドレッシングをかける。	3	9	0	2	2	\N	6uhwZPXEaoE7NrBVCb59OzBGfKIaQaI6oe9FLthe.jpg	\N	1	0	1	0	0	2021-11-05 07:08:58	2021-12-06 08:26:49
41	1	バラのクレープ	1　カップに薄力粉大さじ１・砂糖小さじ1を入れてざっと混ぜ、卵・バニラオイルを加え、ダマがなくなるまでよく混ぜる。\\r\\n2　牛乳大さじ1を加えよく混ぜる。フライパンにバター2gを入れて熱し、焦がさないように溶かす。生地に加え混ぜる。\\r\\n3　色素・水少々は混ぜ合わせ色素液とする。色素液を2に適量加え、混ぜる。\\r\\n4　ペーパーでバターをなじませ、生地を混ぜてから流し入れ、均一に広げて焼く。クレープの縁がチリチリとして色がつき、焼き色がついたら返す。反対の面も10秒ほど焼きバットに取り出しラップをかけ、粗熱を取る。\\r\\n5　カップにカスタードクリームパウダー小さじ1・牛乳小さじ2を入れよく混ぜる。クレープの半面にカスタードクリームを塗り、半分に折りたたむ。円錐状になるようにふんわりと巻き、長さを半分に切る。\\r\\n6　5の上部の口が広い方の巻きをほどき、下部を芯にして上部をふんわりと巻きつける。皿にクレープをのせて形をととのえる。ジャム小さじ1・ミントの葉1枚を飾る。	6	9	0	2	3	\N	iKz72Uu4MB4oUzq2bdvW2vd5Lt2q7vbqXfC6lekr.jpg	PrLIWiAgx2dJljQXRztjVHxNaQPnhXepSQrtv6Zg.jpg	0	1	1	0	0	2021-11-05 09:50:59	2021-12-06 08:27:58
48	1	トマトドレッシングのサラダ	1　グリーンリーフは食べやすい大きさにちぎり、水にさらし水を切る。トマトはヘタを除いて洗い、1cmの角切り。\\r\\n2　ボウルにトマト・砂糖・岩塩を入れ5分くらい置きマリネする。ドレッシング用材料Aも加え、混ぜる。\\r\\n3　皿にグリーンリーフを盛り付け、トマトドレッシングをかける。	3	11	0	2	2	\N	lPY9JcoEj7jjilXxxYTlzUXbdX9IN8SjFTmyYslj.jpg	\N	1	0	1	0	0	2021-11-05 11:04:32	2021-12-06 09:03:26
42	1	鰤の竜田揚げ&長芋わかめ天	1　ボウルに万能だれを入れよく混ぜる。\\r\\n2　万能だれを鰤の竜田あげ用・長芋わかめ天用・チャーシュー用に分ける。順に小さじ4・2・(チャーシュー用こさじ4×2→2袋)。長芋は皮を剥き半月切り、1人2切れ。\\r\\n3　鰤は余分な水分は除き、ウロコがあれば除き、1人3~4切れの乱切り。10分ほど塩小さじ1/4をしておき、水気のみ除く。ボウルに入れ万能だれで下味を10分つけておく。\\r\\n4　ワカメは5分くらい水に戻し、水気を切りみじん切り。ボウルにわかめと長芋わかめ天用たれを入れて混ぜ衣を作る。わかめ衣Aと言います。\\r\\n5　大根は皮をむき、盛り付け直前にすりおろし、水気を切る。しし唐辛子はヘタを1cmくらい残して斜めに切り、腹に1カ所切り込みを入れる。\\r\\n6　180度くらいの油でしし唐辛子をあげる。バットに取り出し油を切る。\\r\\n7　長芋にわかめ衣をつけ、170度位の油で温度を上げながら揚げる。バットに取り出し油を切る。長芋わかめ天の完成。\\r\\n8　鰤の汁気を切り片栗粉大さじ2〜をつけ、余分な粉をはたき、170度位の油で温度を上げながらあげる。バットに取り出し油を切る。鰤の竜田あげの完成。\\r\\n9　皿に鰤の竜田あげ・長芋わかめ天・しし唐辛子を彩りよく盛り付け、大根おろしを添え、ポン酢じょうゆ1人小さじ1/2をかける。	1	10	0	1	1	\N	fjEWbUaIZnVWPlOndHPHaOTPzmvOFHRdqft1KtWz.jpg	glGBmy2HdCsN4O1qpwFTZDho004h07oahgvs30lH.jpg	0	1	1	0	0	2021-11-05 10:06:25	2021-12-06 08:36:59
43	1	圧力調理バッグで時短チャーシュー	1　豚バラ塊肉は長さを半分に切る。脂肪の部分が外側に来るように、弓形に丸めてたこ糸で形をととのえながら、しばる。竹串で数カ所穴を開ける。\\r\\n2　それぞれの調理バッグに万能だれ小さじ4を入れ、豚肉を加えてよくもみ込み、下味をつける。10分くらい。\\r\\n3　白ねぎは長さ5cm位に切り、周りの白い部分を千切りにし、水にさらしておく、白髪ねぎです。芯の部分はみじん切り・加熱後たれに使用。\\r\\n4　調理バッグを耐熱皿にのせる。それぞれ電子レンジで加熱。600w6分~。加熱が終わったらそのまま庫内で蒸らす。\\r\\n5　開封し皿に取り出し、タレが熱いうちに白ねぎ(みじん切り)を加えて混ぜ、そのまま粗熱を取る。\\r\\n6　たこ糸を外し、丸い形を生かして薄切りにする。さらに盛り付け、白髪ねぎをこんもりと盛り、お好みでラー油をかける。\\r\\n\\r\\n＊ 調理バッグ1枚で2人分を加熱する。	5	10	1	1	1	\N	6PJDykqVGCzMRwgjhfagNYNM8jStNmaJ8L96SHnQ.jpg	3MZeyWNhoQGNPdQOULvI01nrzuRD10gc7XPEvO9e.jpg	0	0	0	0	0	2021-11-05 10:15:15	2021-12-06 08:39:54
44	1	ザーサイとカブの豆乳みそ汁	1　カブは茎の付け根から切り、皮をむき、厚さ5mmのいちょう切り。茎と葉は長さ3cmにきる。\\r\\n2　鍋にザーサイ・かぶ・水300ccを入れてひと煮させる。かぶの茎・葉を加えて加熱する。\\r\\n3　火が通ったら調製豆乳240ccを入れて温め、みそ顆粒を加え、ひと混ぜし火を止める。椀に注ぎ入れる。	2	10	0	1	2	\N	2oPm6TQOJuBDSnvdZTaGOJrbDnkvxGfHWBeWnaMH.jpg	\N	1	0	1	0	0	2021-11-05 10:20:12	2021-12-06 09:00:09
45	1	アップルサイダーゼリー	1　ミントの葉は洗って水気を切っておく。\\r\\n2　りんごジャムは器に分け入れる。\\r\\n3　粉ゼラチン小さじ2は使う直前に湯(50~60度・40cc)にふり入れ、溶かす。ゼラチン液です。\\r\\n4　サイダーにゼラチン液を入れ混ぜる。\\r\\n5　器に分け入れ、冷蔵庫で冷やし固める。\\r\\n6　サイダー小さじ4をかけ、ミントの葉を飾る。(サイダー小さじ1が1人分)	6	10	0	1	3	\N	zOsXXaSyIYiT2dG8Z139bQLLO3PXOdq3HFJjzxW5.jpg	\N	1	1	1	0	0	2021-11-05 10:26:42	2021-12-06 09:01:20
46	1	真鯛のポワレ~サルサヴェルデ仕立て~	1　鯛は余分な水気を除き、ウロコがあれば除き、腹に沿って皮面に切り込みを2箇所入れ、岩塩小さじ1/4黒こしょう少々で下味をつける。\\r\\n2　人参は皮をむき、長さ8mmの輪切りまたは半月切り(1人2~3切れ)。かぶは葉付きのまま4等分に切り、茎の付け根をよく洗い皮をむく。\\r\\n3　ブロッコリーは小さめの小房に分け、ため水の中で振り洗いし、茎は根元と固い部分を除き、小房と同じ大きさの乱切り。\\r\\n4　フライパンにオリーブオイル小さじ1を熱し、人参かぶを入れ、焼き色をつける。両面に焼き色がついたら、水を加えてフタをし、水分がなくなるまで蒸し焼きにし取り出す。\\r\\n5　鯛の表面に出てきた水気を拭き、表面全体に薄力粉をつけ余分な粉を落とす。4のフライパンにオリーブオイル小さじ2を足し、皮面から加熱。中~強火5分。\\r\\n6　皮面にしっかりと焼き色がついたら、余分な脂があれば除き、身の部分も焼く。中火2分くらい。\\r\\n7　鍋に水160cc・コンソメ小さじ1/2を入れひと煮立ちさせる。ブロッコリーを加え柔らかくなるまで加熱。弱火4分〜。ざるに上げ粗熱を取る。茹で汁も取っておく。\\r\\n8　ミキサーにブロッコリー・茹で汁小さじ2・半量の生クリームを入れ、滑らかになるまで15秒ほど回す。残りの生クリームを加え、2~3回まわす。\\r\\n9　岩塩・黒こしょう各少々で味をととのえる。サルサヴェルデです。皿にサルサヴェルデ・鯛・野菜を盛り付ける。エキストラバージンオリーブオイル小さじ1/2をかけ岩塩少々を振る。	1	11	0	2	1	\N	BHG4K7nSaiNX0qXgp25vNnHh4uqvpDmdPmZ8j1WH.jpg	\N	0	0	0	0	0	2021-11-05 10:41:44	2021-12-06 09:01:51
47	1	ホタテのサフランリゾット	1　ほたて貝柱は余分な水気を抜き、ほたて味付けで下味をつける。にんにくは皮・芯を除きみじん切り。玉ねぎもみじん切り。\\r\\n2　ほたて貝柱の両面に薄力粉をまぶす。余分な粉は叩いて落とす。フライパンにオリーブオイル小さじ1を熱し、ほたて貝柱を入れ両面さっと香ばしく強火で焼き、取り出す。ホタテのソテーです。\\r\\n3　同じフライパンににんにく・オリーブオイル小さじ2・16gの半量のバターを入れ、香りが出るまで加熱する。弱火で。玉ねぎを加え色付いてくる手前まで中火で加熱する。\\r\\n4　米を加え、米が透き通るまで炒める。中火~強火で。一度火をとめ、白ワイン40ccを加えアルコール分をとばす。\\r\\n5　スープAを200cc(米にかぶるくらい)加え、時々混ぜながら加熱、中火で5~8分くらい。水分がなくなってきたら、スープを100ccずつ2~3回に分けて加え、アルデンテに仕上げる。\\r\\n　（中火。スープを加えてから合計16〜18分)\\r\\n6　火を止め、残りのバター(8g)、粉チーズを加え、岩塩黒こしょう各少々で味をととのえる。皿に盛り付け、ホタテのソテーをのせセルフィーユを重ねる。\\r\\n\\r\\n＊ 鍋に水・サフラン・コンソメを入れて火にかけ、温めておく。(スープA)\\r\\n     水600~640cc・コンソメ小さじ2・サフラン24本	1	11	0	2	1	\N	PObypACXCCDTwRNq7UCizzNuSneJR5pZ0BwJBmlh.jpg	\N	0	0	0	0	0	2021-11-05 10:55:39	2021-12-06 09:02:29
49	1	塩キャラメルミルフィーユ	1　冷凍パイシートは、使用する5分前に室温に戻し、フォークで数カ所穴を開ける。縦4等分に切り、長さを3等分に切る。(1人3切れ)\\r\\n2　クッキングシートを敷いた天板に冷凍パイシートを並べる。牛乳小さじ1を塗る。\\r\\n3　アーモンドスライスをのせ、オーブンで焼く。電気220度10分・ガス210度8分\\r\\n4　ボウルに塩キャラメルクリームAを入れ、滑らかになるまでよく混ぜる。塩キャラメルクリームです。\\r\\n5　皿にパイ・キャラメルクリームを組み立てる。\\r\\n6　キャラメルシロップ小さじ1/2をかけ、粉糖小さじ1/8をふるう。(1人分)	6	11	2	2	3	\N	qJiBVC2yqcwmONB2sH4fbc0xUzK2Ncr8Q2JJljNv.jpg	QiEtWiYvFPpjoHS5rDxLtbDTnevBBIBZmgR0sNVe.jpg	0	1	0	0	0	2021-11-05 11:21:54	2021-12-06 09:04:39
50	1	ボロネーゼのラザニア	1　玉ねぎは根元を除きザク切り。セロリは筋を除きザク切り。にんじんも皮をむきざく切り。にんにく10gは皮芯を除く。\\r\\n2　チョッパーに1を入れ、みじん切りにする。合い挽き肉は塩小さじ1/4・黒こしょう少々をもみ込み、下味をつける。\\r\\n3　バター20gは室温に戻し、薄力粉小さじ2・ココアバター小さじ1/2と混ぜ合わせる。（ココアバター)。市販のホワイトソースに牛乳80ccを少しずつ加えて混ぜて、伸ばす(ホワイトソース)。\\r\\n4　ラザニアは塩大さじ1・オリーブオイル小さじ1/2を入れた熱湯1.5Lで2分茹で、水気を切る。\\r\\n5　フライパンにオリーブオイル小さじ2を熱し、玉ねぎ・セロリ・人参・にんにく・塩小さじ1/8を入れ、半量くらいになるまで焦がさないように炒める。中火~強火10分位。\\r\\n6　野菜を端に寄せ、フライパンにオリーブオイルを小さじ1/2を足し、合い挽き肉を加え、全体に香ばしい焼き色がつくまで焼き固め、ほぐしながら強火5分くらい炒める。\\r\\n7　火を止め赤ワインを加え、再度加熱してアルコール分を飛ばしながら強火で炒める。ソースAを加え、強火3分くらい煮る。\\r\\n8　ココアバターに7を少量加えて溶きのばし、7に加え、強火1分くらい加熱する。塩小さじ1/8・黒こしょう少々で味をととのえる。ボロネーゼソースと言います。\\r\\n9　グラタン皿にボロネーゼソース(1)をスプーン1杯敷いて、ラザニアを半分敷き、(1)をスプーン1杯くらいのせて広げる。ホワイトソース(2)をスプーン半分くらいかける。\\r\\n10　ラザニアを折りたたみ、(1)・(2)→ラザニア半分→(1)・(2)と重ねる。\\r\\n11　ラザニアを折りたたみ、残りの(1)・(2)をかけ、ピザ用チーズをのせる。\\r\\n12　天板にのせオーブンで焼く。電気230度10分。ガス220度10分~。受け皿にのせパセリをふる。	4	12	2	2	1	\N	TsDMYC9RFXld8uJ735cYpNsb1SKJnrVXA8fHIIRg.jpg	mXV6k301hhdGEAdfmjcOeBMhIH2vSrLuDNnKcEh3.jpg	0	0	0	0	0	2021-11-06 02:17:02	2021-12-06 09:05:24
51	1	オニオングラタンスープ	1　玉ねぎは根元を除き、繊維に逆らった薄切り。鍋にオリーブオイル小さじ1を熱し、玉ねぎ・塩小さじ1/8を入れ、飴色になるまで炒める。中火~強火10分。\\r\\n2　水・コンソメ(スープ素A)を加え、5分加熱。塩・黒こしょう少々で味をととのえる。\\r\\n3　クッキングシートを敷いた天板にバゲットをのせ、ピザ用チーズをのせる。オーブンで焼く。電気230度5分。ガス220度5分~。\\r\\n4　器にオニオンスープを盛り付け、3のチーズバゲットをのせる。黒こしょう少々を振る。\\r\\n\\r\\n＊ オーブン予熱必要	2	12	2	2	2	\N	lv6MLLzPuIiXXlAlPidyXe6J32zrS3a3ilxvvqEv.jpg	XlotCq1tWlKtQeGxYO3hObd62tmstkSQwMKeU2B3.jpg	1	0	0	0	0	2021-11-06 02:23:01	2021-12-07 13:04:34
52	1	スモークサーモンのサラダ	1　スモークサーモンは1人4切れくらいに切る。グリーンリーフ・トレビスは食べやすい大きさにちぎり、水にさらし水気を切る。セロリは筋を除き、斜め薄切り。\\r\\n2　皿にグリーンリーフ・トレビス・セロリを盛り付け、スモークサーモンをのせる。ドレッシングをかける。\\r\\n  \\r\\n＊ ドレッシング;  キューピーレモンドレッシングは1人小さじ1。	3	12	0	2	2	\N	X6tHRi6jRWvo57rpR4ZntWVWv3yREYrzlZ8VoBrq.jpg	\N	1	0	0	0	0	2021-11-06 02:27:15	2021-12-07 13:05:16
53	1	チョコバナナパフェ	1　バナナは皮付きのまま長さ5cmくらいの斜め切り、1人2切れ。いちごはヘタを除いて洗い、縦半分に切る。\\r\\n2　カステラは4 等分に切る。チョコレートクリームの材料を合わせて、8分立てにする。チョコレートクリームです。\\r\\n3　チョコレートシロップ小さじ2*はラップに計量。ミントの葉は洗い水気を除いておく。\\r\\n4　グラスにコーンフレークを入れ、カステラをちぎりながら加える。\\r\\n5　チョコレートクリームをのせ、皮を剥いたバナナ・イチゴを飾る。\\r\\n6　チョコレートシロップ(1人小さじ1/2)*をかけ、ミントの葉を飾る。	6	12	0	2	3	\N	hnif6dxaG4WWOUxkegUmvpHk0ONW3wNOVLirPjXW.jpg	\N	0	0	0	0	0	2021-11-06 02:33:49	2021-12-07 13:06:05
54	1	チーズタッカルビ	1　鶏もも肉は余分な水気・脂肪を除き、1人4切れに切る。玉ねぎは根元を除き、幅1cmのくし形切り。\\r\\n2　ビニール袋に合わせ調味料Aを入れて混ぜ、鶏肉を加えてもみ込み、下味をつける。10分~\\r\\n3　フライパンにごま油(濃口)小さじ1を熱し、玉ねぎを入れて透き通るまで中火~強火で炒める。\\r\\n4　玉ねぎを端に寄せ、汁気を切った鶏肉を皮面を下にして加え焼き色がつくように加熱し、火を通す。ビニール袋の残った合わせ調味料Aを加え、煮からめる。\\r\\n5　火を止めピザ用チーズ60gをのせ、フタをして予熱で溶かす。\\r\\n6　フタを取り、全体をざっくりと混ぜ、お好みでコチュジャンを加えて混ぜる、さらに盛り付ける。	5	13	0	3	1	\N	O4qh2miIUG6pDsUvz351FpxgPEu1Y5okoi9xYbfE.jpg	X4KyRWUWeA4vpcDu2zlIKkonFsrOAn0IMcfTkxep.jpg	0	0	0	0	0	2021-11-06 05:20:47	2021-12-07 13:07:59
55	1	5種ナムルのビビンバ	1　春菊は茎から葉を外し(上の方の柔らかい部分は茎も使用すると良い)、長さを半分にちぎり、水にさらし水気を切る。\\r\\n2　わかめ乾燥は鶏がらスープの素を加えた水Aで戻し(5分くらい)、水気を切る。たくわんは千切り。\\r\\n3　セロリは筋を除き、斜め薄切り。さきいかは太ければさく。紫キャベツは葉は丸めて千切り、芯は薄切りにしてから千切りにし、塩小さじ1/8を加えて混ぜる。10分くらい。\\r\\n4　①ボウルに春菊・鶏ガラスープの素小さじ1/4を入れてなじませ、ごま油(濃口)小さじ1を加え和える。\\r\\n5　②ボウルにわかめ・ごま油小さじ1を入れ和える。\\r\\n6　③ボウルにたくわん・白炒りごま小さじ1・ごま油小さじ1を入れ和える。\\r\\n7　④ボウルにセロリ・さきいか・調味酢小さじ2をいれ和える。10分~。\\r\\n8　⑤ボウルに水気を絞った紫キャベツ・調味酢小さじ2を入れ和える。10分~。\\r\\n9　皿にご飯を盛り付け、5種ナムルをバランスよく盛り付ける。温泉卵をのせコチュジャンを添える。	4	13	0	3	1	\N	DEVeSbpL51ZqaQNbhezbSTBu2u3mJdCMIroMGy4e.jpg	\N	0	0	0	0	0	2021-11-06 05:32:11	2021-12-07 13:08:33
65	1	キャベツのかきたまみそ汁	1　キャベツは葉と芯に分け、芯は薄切り・葉は丸めて幅5mmの千切り。\\r\\n2　鍋に水480~520cc・和風だしの素小さじ1を入れ、ひと煮立ちさせる。ボウルに卵を割りほぐす。\\r\\n3　キャベツを加えて混ぜる。鍋に加えて火を通す。1分~。\\r\\n4　火を弱め味噌を加え、一混ぜする。器に分け入れる。	2	15	0	1	2	\N	i2sf6yuZiE3ocWdYfjOz6MkIqlUuHx6VR4YjC6wI.jpg	\N	1	0	1	0	0	2021-11-06 10:20:43	2021-12-07 13:14:59
56	1	卵と海苔のスープ	1　卵はよくときほぐす。鍋に水480~520cc・鶏ガラスープの素小さじ2を入れひと煮立ちさせる。\\r\\n2　卵を流し入れてひと混ぜし、塩小さじ1/8・白こしょう少々で味をととのえる。\\r\\n3　火を止め、ごま油濃口小さじ1/2を入れてひと混ぜする。器に分入れ、きざみ海苔を加え、白炒りごまをふる。\\r\\n      1人分がきざみ海苔1g・白炒りごま小さじ1/4。	2	13	0	3	2	\N	BSYwSIzQZykVnWjWtgcnZKjc6JZCvQc0CwdXm0CT.jpg	\N	1	0	0	0	0	2021-11-06 05:38:56	2021-12-07 13:09:16
57	1	ゆず茶のケーキ	1　ボウルに卵を割ほぐし、砂糖を加えてすり混ぜる。\\r\\n2　牛乳40cc・ごま油(白)小さじ8を加え、その都度混ぜる。\\r\\n3　生地用Aを合わせてふるい入れ、滑らかになるまで混ぜる。\\r\\n4　紙型に分入れ、空気抜きをして天板にのせる。\\r\\n5　ゆず茶40gをのせオーブンで焼く。電気180度18分。ガス170度15分~。\\r\\n6　皿に盛り付ける。\\r\\n\\r\\n＊ オーブン予熱必要	6	13	2	3	3	\N	zTXOhcJYUX9LJkCvcziwk64K5fXS150HBUQwCkHG.jpg	\N	0	1	0	0	0	2021-11-06 05:45:32	2021-12-07 13:10:01
58	1	フォアグラハンバーグステーキ	1　玉ねぎは細かいみじん切り、パン粉は牛乳大さじ4を加え、湿らせる。卵はよくときほぐす。\\r\\n2　じゃが芋は皮をむき、芽を除き、厚さ5mmの半月またはいちょう切り。水にさらす。5分~。水気を切ってかぶるくらいの水を加えて火にかけ、竹串がスッと通るくらいの柔らかさになったら、湯を切って塩小さじ1/4を加え\\r\\n　  再び火にかけて鍋をゆすり、粉をふかす。\\r\\n3　火を止め熱いうちにゴムベラやすりこ木でつぶし、牛乳40ccを加え、切り混ぜる。再び加熱し、焦さないように混ぜながら、ひと煮立ちさせる。火をとめてトリュフオイル小さじ1を加えて混ぜる。\\r\\n4　ボウルに合い挽き肉・黒こしょう少々・マスタード小さじ2を入れ、粘りが出るまでよくこねる。玉ねぎ・湿らせたパン粉A・卵1個を加え、さらに均一になるまでこね4等分にする。\\r\\n5　手に水をなじませ、4を空気抜きしながら小判型に整え、中央を少し窪ませる。フライパンにサラダ油小さじ1を熱し、両面に焼き色をつける。\\r\\n6　余分な脂を除き、火を止めマデラ酒40ccを加えて再度加熱しアルコール分を飛ばし、フタをして蒸し焼きにする。中火2分~.\\r\\n7　ハンバーグソースBを加え、2/3量位になるまで煮詰める。強火2分~。皿にハンバーグを取り出しソースに水溶き片栗粉Cを様子を見ながら加えて加熱し、とろみをつける。\\r\\n8　フォアグラの両面に岩塩・黒こしょう各少々をし、加熱直前に薄力粉をまぶす。余分な粉は叩いて落とす。フライパンにサラダ油小さじ1/2を熱し、中火~強火で焼く。焼き色がついたら火を少し弱め、裏面も焼く。\\r\\n9　ペーパーを敷いたバットに取り出す。ハンバーグにソースをかけ、フォアグラをのせ、マッシュポテトを添える。ピンクペッパー(1人2粒)・セルフィーユを飾る。	5	14	0	2	1	\N	O304toLudItxV9i1oc06Iq57iBULX25OH2iVFG8l.jpg	\N	0	1	0	0	0	2021-11-06 06:24:01	2021-12-07 13:10:36
59	1	キャロットポタージュ	1　人参は皮をむき、縦半分に切り、斜め薄切り。鍋にバターを入れて加熱し、バターが半分くらい溶けてきたら、人参・塩を加えて炒める。鍋が温まるまで強火・弱火15分~。\\r\\n2　にんじんの量が半分くらいになったら、水・コンソメを加え、水分がほぼ無くなるまで煮る。弱火5分~。火を止め粗熱を取る。\\r\\n3　人肌くらいの温度まで下がったら、ミキサーカップに入れ、牛乳を少量加え(400ccのうち少量)ピューレ状にする。\\r\\n4　人参のピューレを鍋に移し、ミキサーカップに残りの牛乳の半量を入れ、攪拌させる。\\r\\n5　鍋の人参のピューレにミキサーカップの牛乳・残り全ての牛乳を加えて均一に混ぜる。\\r\\n6　温めて味見をし、塩小さじ1/4・黒こしょう少々で味を整える。器にポタージュを注ぎ、パセリを振る。	2	14	0	2	2	\N	qzp9oW3uWAHfW4GDA54hoCHzBtsuNk0KfTYOIQ7w.jpg	QWbl4b1t1nyQi3dqBGSEzB4shlTZMRJucmLLHk7F.jpg	0	1	1	0	0	2021-11-06 06:26:23	2021-12-07 13:11:16
61	1	グリーンサラダ	1　グリーンリーフ・トレビスは一口大にちぎり、水にさらし水気を切る。きゅうりはピーラーで薄切りにし、巻く。残りは千切り。\\r\\n2　人参は皮をむき、ピーラーで薄切りにし巻く。残りは千切り。キウイフルーツは皮をむき、半月切り。\\r\\n3　皿に千切りにしたきゅうり・人参・グリーンリーフ・トレビスを盛り付ける。きゅうり・人参・キウイフルーツを飾り、ドレッシング(1人小さじ2)をかける。\\r\\n\\r\\n＊ ドレッシング;  キューピーコブサラダドレッシング	3	14	0	2	2	\N	LjnLNUi3nrMNxk9cxsvTxxZlugphX9FGG2diEKg5.jpg	8PR5IPTQRmINPZ5DF1lgHwtrc96gt24zDq3pZ2lS.jpg	0	0	1	0	0	2021-11-06 06:39:35	2021-12-07 13:12:02
62	1	珈琲プリン	1　インスタントコーヒーは①②それぞれ作る。ボウルに卵を割り入れ、よくときほぐす。\\r\\n2　別のボウルに生地Aを入れよく混ぜ溶かし、①のコーヒー液を入れる。卵液を加えて混ぜ、ぬらした茶漉しでこして器に注ぐ。\\r\\n3　鍋に湯を張り、沸騰させ、火を止め、ザルを入れ、2を並べてフタをし、強火で2~3分加熱し、弱火または保温する。10分~。竹串を刺し液体が出てこなければ、粗熱を取り冷蔵庫で冷やす。\\r\\n4　鍋に砂糖大さじ2を入れ、水小さじ1を加え、全体をよく湿らせてから火にかける。中火~強火。全体がカラメル色になるまで加熱。この時木べら等で混ぜない。\\r\\n5　濃いカラメル色になったら火を止め、②のコーヒー液を加える。手早く鍋をゆすり、再び弱火にかけカラメルを均一に溶かす。器に入れて粗熱を取り、冷蔵庫で冷やす。\\r\\n6　生クリームは盛り付け直前に、8分立てにする。珈琲プリンにのせ、5をかける。	6	14	0	2	2	\N	HtEFoxQW4sWUGrqFFXR5DdUJz9ZoSg8Sgm5mhDpo.jpg	gjlZce5Tt6FrA95breBgqsbotZ7SDHOq6BpYnYgp.jpg	0	0	0	0	0	2021-11-06 06:50:34	2021-12-07 13:13:34
63	1	チキン南蛮~たくあんタルタル添え~	1　鶏もも肉は、余分な水分脂肪を除き、厚みがあれば均一にし、竹串またはフォークなどで皮面に穴を開け、塩小さじ1/2・黒こしょう少々をもみ込む。衣用の卵はよくときほぐし、衣用の材料Aと混ぜ合わせる。\\r\\n2　南蛮酢Bを合わせて混ぜる。卵1個は茹で卵用Cで沸騰後10分茹で、水にとって冷まし、皮をむく。茹で卵完成。\\r\\n3　たくわんはみじん切り。トマトはヘタを除き洗ってくし形にし、さらに斜め半分に切る、1人2切れ。\\r\\n4　フライパンにサラダ油小さじ4を熱し、鶏肉に衣をつけて皮面から入れ、強火6分くらい焼く。\\r\\n5　焼き色がついたら裏返し、余分な脂を除きながら、火が通るまで中火で6分焼く。\\r\\n6　ボウルにたくわんタルタル用の酢小さじ1・砂糖小さじ1・塩小さじ1/8・黒こしょう少々を混ぜ溶かし、玉ねぎを加えてあえる・5分~。ゆで卵の白身を加え、粗みじんに潰す。\\r\\n7　黄身を加えて潰しざっくり混ぜる。たくわん・マヨネーズを加えざっくりと混ぜる。たくわんタルタルソース完成。\\r\\n8　皿に水菜・トマト・レモンを盛り付ける。チキンを南蛮酢にさっとくぐらせ盛り付ける。\\r\\n9　残りの南蛮酢・たくわんタルタルソースをかける。	5	15	0	1	1	\N	qByjszWGWTDJZcAhoooS3A7fwxnQQvSHDmPR3pjz.jpg	\N	0	1	0	0	0	2021-11-06 10:11:33	2021-12-07 13:14:21
66	1	あさりと春野菜の酒蒸し	1　あさりは塩水Aにつけて、アルミホイルなどでフタをして冷暗所に置き、砂出しをする。流水の下でこすり洗いをし、殻の汚れを落とし水気を切る。\\r\\n2　菜の花は根元を除き、長さ2〜3等分に切る。スナップえんどうはヘタ・筋を除き、斜め半分に切る。\\r\\n3　鍋にあさり・酒大さじ1を入れてフタをし、口があくまで酒蒸しにする。\\r\\n4　あさりの口がひらいたら、菜の花・スナップえんどうを加えてフタをし、さっと火を通す。\\r\\n5　味見をし薄ければ、塩少々で味をととのえる。器に盛り付ける。	8	15	0	1	2	\N	KLSi4SwBDSq747QrndGK9WjTJ3GlNpbJz8ikypmL.jpg	\N	1	1	1	0	0	2021-11-06 10:26:27	2021-12-07 13:15:50
67	1	抹茶豆乳ババロア	1　粉ゼラチンは、使う直前に湯(50~60度)40ccに振り入れとかす。\\r\\n2　生クリームは6分立てにする(ホイップクリーム)。ボウルにホイップクリーム用Aを入れて混ぜる。\\r\\n3　調製豆乳160ccを少しずつ加えて混ぜ、溶かしたゼラチンを加えて混ぜる。\\r\\n4　ホイップクリームを2~3回に分けて加え、切り混ぜる。\\r\\n5　器に分入れ、冷蔵庫で冷やし固める。\\r\\n6　抹茶豆乳ババロアに生クリームをかけ、茹で小豆をのせる。\\r\\n      生クリームは1人分が小さじ1。茹で小豆は4人で60g。	6	15	0	1	3	\N	gkb7RM6QIJmIjg0jFB9Bhp4fxzSTIzxurUa7MmG0.jpg	\N	0	0	0	0	0	2021-11-06 10:39:50	2021-12-07 13:16:32
68	1	桜ごはん	1　焼き海苔は長さを活かして半分に切る。桜の花の塩漬けは、塩を水でさっと洗い、水気を除く。\\r\\n2　鍋にご飯用材料Aと桜の花の塩漬け4個を入れ、フタをし加熱。強火で。沸騰したら弱火にして10分炊き、10分蒸らす。ラップの上に焼き海苔を置き、桜ごはんを1/4量のせ、左右はギリギリまで奥は1cm空けておく。\\r\\n3　焼き海苔の端を持って、半分に折りたたみ、、ラップの上からしずく型に整える。ラップを外し5等分に切る。器に花びらの形に盛り付け、桜の花の塩漬けを飾る。	9	16	0	1	1	\N	tnpt4l5AFZznwJsbvtLlozyWwmU0pLTOmC4jfAj8.jpg	SKljDy47vMgiUTgbBkHd9AJBN4rrGX2KSvFF4BrK.jpg	0	0	0	0	0	2021-11-06 15:28:08	2021-12-07 13:17:44
69	1	レンジで作る洋風つくね	1　ビニール袋に合い挽き肉・塩小さじ1/4黒こしょう少々・玉ねぎ・パン粉小さじ8・水小さじ8を入れ、粘りが出るまでよくこねる。12等分にする。\\r\\n2　調味液Aを合わせた耐熱ボールにペーパーを浸し、手に水をつけて4を丸めながら加え、ペーパーを被せ、調味液を上からかけてまんべんなく湿らせる。電子レンジで加熱。600W6分くらい。＊ 耐熱用ボウル1つで2人分を加熱。\\r\\n3　取り出してペーパーを軽く絞って取り除き、からめて冷ます。器にグリーンリーフ(洗った後水気をしっかりと除いておく)を敷きつくねを盛り付ける。	5	16	3	1	2	\N	g2Bh25yz4N7pv3LLxVVd7E9u4osn7SHgWFxlHsQV.jpg	rAa2823zP5Lu69WzDcsLLi2HooJUx2rO1xL0okd6.jpg	0	0	0	0	0	2021-11-06 15:38:56	2021-12-07 13:19:37
70	1	海老と青じその春巻き	1　海老は殻付のままで塩・真水で洗う。背ワタを除き、尾と第一関節を残して、殻をむき、立て塩A・真水で洗い、水気を除く。春巻きの皮は斜め半分に切る。\\r\\n2　青紫蘇は軸を除く。春巻きの皮の中央に青じそ・海老を尾をだして置き、きざみしょうがをのせる。周囲にのりをぬり、巻く。巻き終わりを下にして置く。\\r\\n3　フライパンにサラダ油小さじ4を熱し、春巻きの閉じ目を下にして入れ、転がしながら全体に香ばしい焼き色がつき、火が通るまで揚げ焼きにする。ペーパーを敷いたバットに取り出す。器に盛り付ける。	1	16	0	1	1	\N	TKMafQM3kIcfMZPHYmiEYW7qDFHHKwEkCRQBIUes.jpg	XgjWIefKyePu6bjFTSExe5RM08dR8kHnoohIr0Je.jpg	1	1	0	0	0	2021-11-06 15:46:54	2021-12-07 13:21:39
71	1	和風ジャーマンポテト	1　じゃが芋は皮をむき、厚さ2mmの半月切りにし、水に5分~さらし水気を切る。\\r\\n2　菜の花は根元を除き、長さを半分に切る。ベーコンは幅1cmに切る。\\r\\n3　フライパンにサラダ油小さじ1を熱し、じゃが芋・菜の花・ベーコンを入れ、ジャガイモが透き通ってくるくらいまで炒める。\\r\\n4　味付け用を加え、からめるように炒め、塩少々で味をととのえる。器に盛り付ける。	8	16	0	1	2	\N	zSzPHvjASDnOV8JjRdx7qP557hPWGSycWtb9zG7T.jpg	\N	1	0	0	0	0	2021-11-06 15:51:29	2021-12-07 13:23:40
72	1	切り干し大根のゆかり甘酢	1　調味酢小さじ4・ゆかり小さじ1は混ぜ合わせる。ゆかり甘酢です。切り干し大根30gはさっと水で洗い、水に10分~漬ける。\\r\\n2　水気を絞り、耐熱皿に広げ、ラップをかけずに電子レンジで加熱する。600W2分くらい。\\r\\n3　温かいうちにゆかり甘酢に加え、5分くらい漬ける。器に汁気を切って盛り付ける。	8	16	3	1	2	\N	5INGyhOuRaCzWHtQyVRbenm33xNeDuOqtQHfqdCk.jpg	\N	1	0	1	0	0	2021-11-06 15:56:27	2021-12-07 13:25:33
73	1	卵焼き	1　ボウルに卵を割りほぐし、水小さじ2・砂糖小さじ2・塩少々を加え、よく混ぜる。フライパンにサラダ油小さじ1/2を熱し、卵液を流し入れ、半熟状になるまで大きく混ぜる。両端を折りたたんで長さ10cmにし巻く。\\r\\n2　ラップに取り出し形をととのえ、冷ます。4等分に切る。器に盛り付ける。	7	16	0	1	2	\N	wDDts1qbU8I8gDeBCKmkCLn7lJ9dlQ14S2H1FdFw.jpg	\N	1	1	0	0	0	2021-11-06 15:59:22	2021-12-07 13:28:11
74	1	桜餅	1　色素を少量の水で溶く。黒こしあんは4等分にして丸める。\\r\\n2　白玉粉に分量の水70ccの半量を加え、ときのばす。薄力粉40gをふるい入れ、砂糖小さじ4・残りの水を加えよく混ぜる。\\r\\n3　溶いた色素を様子を見ながら加え、薄いピンク色に着色し、カップに2等分にする。\\r\\n4　フライパンにサラダ油小さじ1/2を熱し、2の生地を流し入れ、フライパンを傾けながら直径16cmくらいに伸ばす。表面が乾いたら裏返し、さっと焼く(2枚)。\\r\\n5　生地を半分にきって、黒こしあんをのせ、円錐状に巻く。\\r\\n6　クッキングシートで包み、器に盛り付ける。	9	16	0	1	3	\N	6wSSab231tOpT6MKX8uogLN0KpabAWutSxhJeamv.jpg	B4LLLKLDcFy58HwMQLfLQOvulRHHYAZ5HOxv8Swp.jpg	0	1	0	0	0	2021-11-06 16:07:36	2021-12-07 13:29:22
123	1	マンゴーミルク	1　器にマンゴーを盛り付け、コンデンスミルクをかける。\\r\\n2 　ミントの葉を飾る。	6	28	0	4	3	\N	vSYKBf7xFFRuqYbclLFnkmsTHSdOR14s5FuQrxTu.jpg	\N	1	1	1	0	0	2021-11-09 12:50:17	2021-12-07 14:52:06
75	1	うにトマトクリーム仕立てのロールキャベツ	1　キャベツは熱湯でしんなりするまで1~2分ゆでる。バットにあげ広げて冷ます。芯をそぎ取り巻きやすくする。削ぎ取った芯は包む時一緒に入れる。\\r\\n2　玉ねぎはみじん切り。にんにくは皮・芯を除き、潰す。ボウルにうにクリーム材料Aを入れよく混ぜる。\\r\\n3　ボウルに合い挽き肉・塩小さじ1/8・黒こしょう少々・ナツメグ少々・卵1個・玉ねぎが均一になるように混ぜる。8等分する。\\r\\n4　キャベツの内側を上にして、芯の方を手前に広げる。たねを俵型にし、キャベツの手前に横長に置き、キャベツの芯をのせる。手前片側だけを折って包み、奥へと転がす。\\r\\n5　折り畳んでいない反対側をたねに詰める。鍋に、にんにく・オリーブオイル小さじ1を入れて火にかける。弱火3分〜。にんにくの良い香りがしてきたら、木べらで潰す。\\r\\n6　スープ用材料Bを加え、ひと煮立ちさせ、アクが出たら除く。\\r\\n7　火を止めて、ロールキャベツの巻き終わりを下にして並べ、フタをして強火にかける。沸騰したら中火にして加熱する。\\r\\n8　フタを取り、煮汁をロールキャベツにかけながら、中火~強火で5分程、煮詰める。うにクリームを加え、弱火で2分ほど軽く煮る。\\r\\n9　ローリエを取り出し、ロールキャベツを器に盛りつけ、ソースを分け入れる、パセリを振る。	5	17	0	2	1	\N	bstDUNso74RCwvUO6OufwKZDp3LzgfheZJEw4VTO.jpg	\N	0	0	0	0	0	2021-11-06 16:22:27	2021-12-07 13:30:00
76	1	菜の花とアボカドのエッグサラダ	1　菜の花は根元を除き、長さを半分に切る。熱湯600ccに塩小さじ1/8より少々でさっと茹で、ザルにあげて冷まし、粗熱を取って水気を絞る。\\r\\n2　上記1に酢小さじ1・残りの塩を加え、冷蔵庫から出したての卵を静かに入れる。最初の2~3分は混ぜながら中火で、6分加熱する。水にとり、冷めたら水につけながら殻を剥く。\\r\\n3　味付け用Aの入ったボウルに菜の花・キャベツを加えてざっくり混ぜる。アボガドは果肉をくり抜いて加え、混ぜる。\\r\\n4　皿にこんもりと盛り付け、半熟ゆで卵半分に割り、盛り付ける。	3	17	0	2	2	\N	QB7T79rzrHf9hZeqjea0rjHG7VQ0XltCU4D2BNqI.jpg	\N	0	0	0	0	0	2021-11-06 17:22:20	2021-12-07 13:38:49
77	1	カマンベールチーズのパーネ	1　天板にクッキングシートを敷き、ピザ用チーズを4 等分し、8cmくらいのリング状におく。ボウルにパンたね材料Aを計量し、イーストめがけて仕込み水を加え、しっかりと全体を混ぜる。\\r\\n2　全体がひとかたまりになってきたら、オリーブオイル小さじ4を加え、粉っぽさがなくなるまで混ぜる。台の上に取り出し、ムラがなくなるまでこねる。\\r\\n3　4分割する。生地をそれぞれ10cmくらいの円形に広げ、カマンベールチーズをのせ、生地を寄せて包み、閉じ目をしっかりと止める。＊ カマンベールチーズは4等分に切っておく。\\r\\n4　閉じ目を下にして、ピザ用チーズの上に置き、発酵させる。40度35分~。一度室温に取り出し、そのまま室温発酵。オーブンに予熱を入れる。電気230度12~15分・ガス220度8~10分\\r\\n5　オーブンで焼く。電気230度12~15分・ガス220度8~10分。皿に盛り付ける。	4	17	2	2	3	\N	A67iXbI5GRZEB7Pyjd87B6CNH6qna3Kz8MjaeiPu.jpg	\N	0	0	0	0	0	2021-11-06 17:33:26	2021-12-07 13:39:42
78	1	オレンジのパンナコッタ	1　オレンジは塩少々でこすり洗いをし、皮の上下を切り落とし、皮を除く。(白い部分と薄皮も。)\\r\\n2　薄皮と果肉の間に包丁を入れ、果肉を外し、薄皮の果汁を絞る。果肉は砂糖小さじ2を加えマリネする。\\r\\n3　鍋に生地Aを入れひと混ぜし、ひと煮立ちさせる。沸騰したら弱火にし、1分前後煮詰める。\\r\\n4　オレンジの皮以外をボウルに移し、粗熱を取り、粉ゼラチン小さじ2を加えてとかす。\\r\\n5　器に分入れ、冷蔵庫で冷やし固める。\\r\\n6　パンナコッタに2をのせ、ミントの葉を飾る。	6	17	0	2	3	\N	2C3fVK20zw00yA6ozE3wYu5l27tTrYYHhapvzDAH.jpg	\N	0	0	0	0	0	2021-11-06 17:39:30	2021-12-07 13:40:33
79	1	ハッシュドビーフのオムライス	1　牛肩ロース薄切りは幅4cmくらいに切り、塩小さじ1/8・黒こしょう少々で下味をつける。にんにくは芯・皮を除き、つぶす。\\r\\n2　玉ねぎは根元を除き、繊維に逆らった薄切り。マッシュルームは厚さ5mmの薄切り。\\r\\n3　鍋ににんにく・オリーブオイルを入れて加熱し、弱火で香りをだす。玉ねぎ塩少々を加え、玉ねぎが少し色付くまでニンニクを潰しながら炒める。中~強火5分くらい。\\r\\n4　玉ねぎを端に寄せ、牛肉を加え少し赤みが残るくらいまで炒める。\\r\\n5　マッシュルームを加えてさっと炒め、薄力粉小さじ4を加え、さらに中火で1分位、炒める。\\r\\n6　火を止め、赤ワイン小さじ4を加えて再度加熱し、アルコール分を飛ばす。\\r\\n7　ソース用Aを加えて加熱をし、とろみがつくまで加熱する。(中火~強火5分~)。ローリエを取り除き、塩小さじ1/8・黒こしょう少々で味をととのえる。\\r\\n8　鍋にトマトライスBを入れて一混ぜし、フタをして加熱。沸騰まで強火、沸騰後弱火10分~。\\r\\n9　火を止め10分蒸らす。4等分にし皿にこんもりと盛り付ける。\\r\\n10　ボウルに卵2個を割り入れ、軽くほぐして混ぜ、卵味付けCを加え、ボウルの底に菜箸をつけながら手早く混ぜる。フライパンにオリーブオイル小さじ1/2を中火で熱し、火を強めてバター2gを溶かす。\\r\\n        ＊ 卵と卵味付けCの分量は１人分、×4必要になる。\\r\\n11　卵液を一気に流し入れ、ゆっくり卵液を混ぜる。卵がやや固まり始め、半熟状になったところで火を止め、フライパンを揺らす。\\r\\n12　９の上にのせ、ハッシュドビーフをかける。生クリーム(1人小さじ1/2)を回しかけ、パセリ少々を散らす。\\r\\n\\r\\n★オムライスコツ★\\r\\n深皿に盛ると、山型にならないのでオススメしない。\\r\\n小さい器に盛るとソースがたら〜っと広がるスペースがないのでおすすめしない。\\r\\n平な大皿がソースがタラーっと広がり、オススメ★\\r\\nフライパンの大きさと個数に限りある中で、オムライスのような一品に対してお鍋一個、フライパン2個と使い分けるような料理に対しては、どれにどれを使うかが重要になってくる。卵を焼く用の大きすぎず、小さすぎないフライパンを残しておく。\\r\\nお米を白米で炊いてしまったりしないこと！	4	18	0	2	1	\N	EiJcttyhVVaLbCaiRx4jt4Hg3uS6qmCMZTk6mxVY.jpg	\N	0	1	0	0	0	2021-11-06 18:06:18	2021-12-07 13:47:15
80	1	コブサラダ	1　アボガドは種・皮を除き、1cmの角切り。\\r\\n2　赤パプリカは、ヘタ・たねを除き、1cmの角切り。\\r\\n3　きゅうりは1cmの角切り。\\r\\n4　コーンは汁気を切り、熱湯を回しかけ、水気を切る。ツナ缶は汁気を切る。\\r\\n5　ブラックオリーブは汁気を切り、4等分の輪切り。グリーンリーフは食べやすい大きさにちぎる。\\r\\n6　皿にグリーンリーフを敷き、アボガド・赤パプリカ・きゅうり・コーン・ツナ・煮小豆・ブラックオリーブを1列に並べるように盛り付ける。ドレッシング(コブサラダドレッシング)もかける。\\r\\n\\r\\n＊  表示内容は1人分ずつ。	3	18	0	2	2	\N	2560cacdoDJRCXrXYsthAyD0n3XWbZZWLPFg5Vat.jpg	VJkyPyw8oMbEgVkIORpgywaz21cyb1KrYzjGuqUI.jpg	1	1	1	0	0	2021-11-07 14:43:55	2021-12-07 13:42:00
81	1	いちごのスノーボールクッキー	1　ボウルに粉糖小さじ2・いちごパウダーを混ぜ合わせる。いちごシュガーAです。ビニール袋にバターを入れ、クリーム状になるようにもむ。\\r\\n2　粉糖を加え、さらにもんで混ぜる。薄力粉小さじ10・アーモンドパウダー大さじ1をふるいながら加える。\\r\\n3　ビニール袋に空気を入れて振り、バター全体に粉類をまぶしながらもんで混ぜる。\\r\\n4　全体がしっとりとまとまってきたら、生地を集めて5等分にし、丸める。クッキングシートを敷いた天板に並べる。\\r\\n5　オーブンで焼く。電気170度12分・ガス160度12分。焼き上がったクッキーの粗熱をとる。\\r\\n6　ほんのり暖かいうちに、1のいちごシュガーをまぶす。器に盛り付ける。\\r\\n\\r\\n＊. 表示材料は1人分。オーブン予熱必要。	6	18	2	2	3	\N	HRUivSMLsnVogT4EX5FnfS2gaVK8KuzYDxhE8Pml.jpg	lE9E793Xdh7iLs0tlW1S95vIeSyhYKpjZDWQE1QY.jpg	0	1	0	0	0	2021-11-07 14:51:04	2021-12-07 13:48:18
82	1	四川風麻婆豆腐	1 豚バラ薄切り肉は粗みじん切り。白ネギ40gは縦に十字の切り込みを入れ、薄切りにし2等分する。\\r\\n2　トウチはみじん切り。青花椒はすべてミキサーカップに入れ粗めにかける。\\r\\n3　テンメジャン具材A(ネギは半量の20g)と2を入れ、良い香りがするまで弱火~中火3分で炒める。\\r\\n4　1の豚バラ薄切り肉・豚ひき肉を加え、しっかりと強火で炒め、火を通す。\\r\\n5　合わせ調味液Bを加えてひと煮立させる。\\r\\n6　残りの白ねぎ・水気を切った豆腐を大きめの一口大にすくって加え、強火3分で加熱する。\\r\\n7　豆腐が温まったら、(鍋の中で豆腐が踊る感じ)水溶き片栗粉(片栗粉大さじ1・水大さじ2)を加えとろみをつける。\\r\\n8　火を止めごま油小さじ1を加え、豆腐を崩さないように混ぜる。\\r\\n9　器に盛り付け、お好みでラー油小さじ1・青花椒小さじ1(4人分)をかける。	5	19	0	3	1	\N	So62Fqc67lU1MWCLH5HrC3Fe48Kb48wNwEZ7Ttcq.jpg	wP2luN1jjdpYE0Ofygk2YUz646v5MtSNmgwYpFf9.jpg	0	1	0	0	0	2021-11-07 15:08:08	2021-12-07 13:49:10
83	1	雲白肉~ウンパイロー~	1　豚バラ薄切り肉は、長さを半分に切る。きゅうりは長さを半分に切り、ピーラーで薄切りにし(1人6~8枚)残りは千切り。\\r\\n2　トマトはヘタを除いて洗い、縦半分に切り繊維に沿った厚さ5mmの薄切り。白ネギ40gは長さ5cm位に切り、周りの白い部分を千切りにし、水にさらし水気を切る。白髪ねぎです。芯の部分は潰す。\\r\\n3　フライパンに甜麺油のための準備Aを入れ、よく混ぜてから加熱。沸騰後弱火3分。粗熱をとる。甜麺油です。\\r\\n4　鍋に白ねぎ用B湯を沸かし、酒・白ねぎの芯を入れる。最沸騰後弱火にし、豚肉を4~5枚ずつ広げて加え、さっとくぐらせ火を通す。\\r\\n5　ザルに取り出して軽く水切りをし、温かいうちに豚肉全体に塩小さじ1/4を振ってなじませ、ごま油小さじ1を回しかけ常温で冷ます。\\r\\n6　皿にきゅうり・トマト・豚肉を盛り付け、白髪ねぎを乗せる。3の甜麺油をかけ、お好みでラー油・青花椒各小さじ1/2をかける。\\r\\n\\r\\n＊  青花椒塩はすべてミキサー(ミル)カップに入れ、粗めにかけておく。	5	19	0	3	1	\N	ZhF206B5doBjjjW6r4kmWdvWe0DwIYGfpTf09IW9.jpg	DUoPMrEWdfwQvGnb2kYJEh2UUJ76DyWbb2YIBd4O.jpg	1	1	1	0	0	2021-11-07 16:00:37	2021-12-07 13:50:19
84	1	黄金チャーハン	1　ボウルに卵2個を割りほぐし、卵用Aを加えて混ぜ、ご飯を加えて切り混ぜる。\\r\\n2　フライパンにサラダ油小さじ2を熱し、1を加える。強火でパラパラになるまで炒める。塩少々を加えて切り混ぜる。\\r\\n3　フライパンの中央を開け、醤油小さじ1/2を加え全体をさっと炒める。皿に盛り付ける。\\r\\n\\r\\n＊  2人分ずつ作る。表示は2人分。	4	19	0	3	1	\N	QMymsSRHrmuBV6g8GXhavfbvo54CjpgXmUuJwYmW.jpg	whPHMVA17b2PqE2afFY2SDjm5L6ljdsFrzgrhlWP.jpg	1	1	0	0	0	2021-11-07 16:07:55	2021-12-07 13:51:21
85	1	杏仁プリン	1　粉ゼラチン小さじ2は使う直前に湯40cc(50~60度)に振り入れ溶かす。(ゼラチン液)。シロップAもクコの実12粒を加え作る。\\r\\n2　牛乳に砂糖を加え、混ぜ溶かす。\\r\\n3　ゼラチン液を加えて混ぜる。\\r\\n4　生クリーム40g・アーモンドエッセンスを加えて混ぜる。\\r\\n5　器に分入れ、冷蔵庫で冷やし固める。\\r\\n杏仁プリンにシロップAをかけ、クコの実を飾る。\\r\\n\\r\\n＊. 牛乳は使用する10分前に室温に戻しておく。	6	19	0	3	3	\N	ylRJfo9WTkSFpQ0aV21J6jP6YilUJZIqOXW3zzZI.jpg	\N	1	1	1	0	0	2021-11-07 16:15:58	2021-12-07 13:52:03
86	1	肉バルのラクレットプレート~豚肉のハニーロースト&ミートボール~	1　ベーコンはみじん切り。玉ねぎはみじん切り。ウインナー4本は熱湯に入れて火を止めフタをして温める・3分~。\\r\\n2　豚肩ロース塊肉は、使用10分前に室温に戻し、竹串で穴を開ける。塩小さじ1/2・黒こしょう少々をすり込む。10分~。マリネ用Aを入れ、豚肉を加えて10分~マリネする。\\r\\n3　フライパンにオリーブオイル小さじ1/2を熱し、マリネした豚肉の表面を色良く焼く。(1面につき中火~強火1分~)。アルミホイルを敷いた天板にのせ、オーブンで焼く。\\r\\n4　豚肉に竹串を刺し、透明な液体がでれば焼き上がり。そのままアルミホイルに包み、豚肉を5分~保温する。\\r\\n5　ボウルに合い挽き肉・ベーコン・塩小さじ1/4・黒こしょう少々を入れ、粘りが出るまでよくこねる。牛乳で湿らせたパン粉・玉ねぎを加えてこねる。\\r\\n6　4等分にする。一塊をさらに3等分にして丸め、フライパンに入れてから加熱し始め、転がしながら全体に焼き色をつける。\\r\\n7　余分な脂を除き、水40cc・コンソメ小さじ1/2を加えフタをし、中まで火を通す。中火3分~。\\r\\n8　フタを外し、ソース用味付けBを加え煮詰める。中火5分~。味見をし塩少々・黒こしょう少々で味をととのえる。4を切り分け、ミートボール・ウインナーとともに彩りよく盛り付ける。\\r\\n9　アルミホイルに残った肉汁はボウルに移し、上澄の脂を除き、ソースとしてかける。フライパンにラクレットチーズを入れ、中火で加熱して溶かし、ミートボールにかける。\\r\\n＊  パン粉は牛乳を加え湿らせておく。オーブン予熱必要。	5	20	2	2	1	\N	wSZJiw610hrDrftbvn5w7ldSP2Z18XFrsUKk8koP.jpg	\N	0	0	0	0	0	2021-11-07 16:35:13	2021-12-07 13:58:57
148	1	フレッシュポルチーニのクリームパスタ	1　にんにく8gは皮・芯を除き、つぶす。ベーコンは幅1cmに切る。\\r\\n2　玉ねぎは根元を除き、繊維に沿った薄切り。\\r\\n3　スパゲティはアルデンテに茹でる。茹で湯は塩大さじ1を入れる。\\r\\n4　フライパンににんにく・オリーブオイル小さじ1を熱し、(弱火)、香りがしてきたらベーコン・玉ねぎ・バター8gを加えて炒める。\\r\\n5　玉ねぎが色付いてきたら、ボルチーニ茸を加え、しっかり炒める。強火５分。\\r\\n6　牛乳120ccを少しずつ加え、旨みをこそげ落とすように軽く煮詰める。\\r\\n7　ソース具材Aを加え、ひと煮立ちさせる。\\r\\n8　水気を切ったスパゲティを加え、ソースをからめるように合わせ、塩少々で味をととのえる。\\r\\n9　器に盛り付ける。	4	35	0	\N	\N	\N	DsGoqyLuQeXUwC54VJB9LnKtoEWLFMGj0QyAMvLI.jpg	\N	0	1	0	0	0	2021-11-10 00:17:51	2021-11-27 08:21:48
87	1	あさりとレモンのパエリア	1　玉ねぎはみじん切り。トマトはヘタを除いて洗い、1cm角の角切り。レモンは塩少々でこすり洗いし、表皮のみすり下ろし、1人一切れのくし形切り。\\r\\n2　にんにくは皮・芯を除き、みじん切り。アサリは塩水用水につけてアルミオイルなどでフタをして、冷暗所に置き砂出しをする。流水の下でこすり洗いし、殻の汚れを落とし水気を切る。\\r\\n3　フライパンにあさり・白ワイン40ccを入れ、フタをして貝の口が開くまで加熱。ぬらして硬く絞ったペーパーを敷いたザルに取り出す。取り出した蒸し汁に水・ターメリック小さじ1/4を加えて400~440cc(スープ用A)とする。\\r\\n4　3のフライパンの水気を除き、オリーブオイル小さじ2・にんにく12gを入れ、良い香りがするまで弱火でじっくり炒める。玉ねぎを加え少し色づくまで炒める。\\r\\n5　米を加え、透き通るまでしっかりと炒める。3のスープ用Aにスープ用Bを加え均一に混ぜて表面をならし、水分がほぼなくなるまで加熱する。\\r\\n6　トマト・レモンの表皮・アサリを均一にのせ、フタをして炊く。弱火10~12分。\\r\\n7　火を止め10分~蒸らす。フタを外し強火で再加熱し(1分位)、余分な水分を飛ばす。\\r\\n8　全体を一混ぜし、皿に彩りよく盛り付け、パセリ少々を振り、レモンを添える。\\r\\n\\r\\n★パエリアコツ★〜失敗例から学ぶ〜\\r\\n1.味が薄い→塩を多めに加える\\r\\n2.ごはんが固い→しっかり炒めて、2人分でも水250ccでなく300ccくらいの多めの水で沸騰させる\\r\\n3.焦げた→最後水分飛ばすために強火で炒めるとき、裏返しながら炒める。蒸らし中は中火でなく弱火\\r\\n4.貝の中にごはんが入っている→アサリを取ってからご飯をかき混ぜ、アサリは最後盛り付ける時まで戻さない！	1	20	0	9	1	\N	vOM7IQsbXxzbqh42j1cdORSTnQFXAwfCVW384fxH.jpg	\N	0	0	0	0	0	2021-11-07 16:51:55	2021-12-13 09:08:03
88	1	オニオンサラダ	1　紫玉ねぎは、根元を除き、繊維に逆らった極薄切り。水にさらして水気を切る。皿にグリーンリーフとともに盛り付け、ドレッシングを1人小さじ1かける。\\r\\n\\r\\n＊  ドレッシング;　キューピーオリーブオイル&オニオンドレッシング	3	20	0	2	2	\N	9JlbTZdO9cO8Tm7aquqCpPlBsFwr6qQahzRzUmiT.jpg	\N	1	0	1	0	0	2021-11-08 00:55:15	2021-12-07 14:02:18
89	1	ストロベリースパークリング	1　粉ゼラチンは使う直前に湯(50~60度)20ccに振り入れ、溶かしておく(ゼラチン液)。\\r\\n2　いちごはヘタを除いて洗い、白い部分を切り、縦4等分に切る。\\r\\n3　ボウルにいちごジャム40g・ストロベリーリキュール小さじ2を入れて混ぜる。\\r\\n4　ゼラチン液を加えて混ぜる。\\r\\n5　冷蔵庫で冷やし固める。\\r\\n6　グラスに崩した5・いちごを分入れ、サイダー1人100ccを注ぐ。\\r\\n\\r\\n＊  サイダーは使う直前まで冷やしておく。	6	20	0	2	3	\N	MiNvJzuKkxzpTK1TQVnGFaITN0tuHhurtWpgmq5X.jpg	\N	0	0	0	0	0	2021-11-08 02:21:28	2021-12-07 14:07:21
91	1	十勝若牛のステーキディッシュ	1　牛ステーキ肉は筋を両面切り、余分な脂肪を除き、30分ほど室温に戻す。塩小さじ1/4こしょう少々で下味をつける。\\r\\n2　大根は輪切り(1人1切れ)にし皮をむく。片面に隠し包丁を入れる。\\r\\n3　パセリは洗って水気を切り、葉のみつむ。小松菜は根元を除きざく切り。\\r\\n4　プチトマトはヘタを除いて、洗い、1カ所切り込みを入れ熱湯で10秒ほど加熱し水にとり湯むきする。\\r\\n5　ミキサーにパセリ・小松菜・ソースを入れ、滑らかになるまでミキサーにかける。レモングリーンソースAです。\\r\\n6　フライパンにオリーブオイル小さじ1/2を入れ、大根を盛り付ける時上になる面から焼き、両面色よく焼く。味付けBを加え、フタをし蒸し焼きにする。\\r\\n　  強火2分〜。火通りを確認しバットに取りだす。\\r\\n7　フライパンにオリーブオイル小さじ1/2を熱し牛肉を入れて焼く。中〜強火2分。返して裏面も中火で1分ほど焼く。\\r\\n8　両面焼き色がつき、好みの火通りになったらアルミホイルに包み、温かいところで3分〜保温する。食べやすい大きさに切る。\\r\\n9　皿にレモングリーンソースを敷き、ステーキ・大根・プチトマトを盛り付ける。	5	21	0	2	1	\N	4NVZqQjI8dfxml7ZkhD6vd5EJb8Ny6PzgGnmlrZo.jpg	\N	0	1	0	0	0	2021-11-08 02:35:10	2021-12-07 14:08:19
92	1	ガーリックライス	1　ニンニクは皮を除き繊維に逆らった薄切りにし、芯を除く。合わせ調味料Aを混ぜ合わせる。\\r\\n2　フライパンににんにく、オリーブオイル小さじ4を入れ、弱火〜中火8分の後、中火から強火1分で加熱(ガーリックオイル)。表面がきつね色になりカリッとしてきたら取り出す、ガーリックチップスです。\\r\\n3　ボウルにご飯・ガーリックオイルの半量を入れ、切り混ぜる。熱した2のフライパンに加え炒める。\\r\\n4　中央を開け、1の調味料Aを加え、さらに混ぜ合わせる。\\r\\n5　皿にガーリックライスを盛り付け、ガーリックチップスをちらす。\\r\\n\\r\\n＊. コメは洗米吸水(30分~)後、水を加えて炊いておく(1人120g)。	4	21	0	2	1	\N	VrNMBRZ7TwqXMC4xN4ED4Vw0fNPmxwt1Io1VvPWd.jpg	\N	0	0	0	0	0	2021-11-08 02:47:31	2021-12-07 14:09:00
94	1	パイナップルとキャベツのコールスロー	1　キャベツは細切りにし、塩小さじ1/8をしておく、10分くらい。\\r\\n2　パイナップルは汁気を切り、粗みじん切り。ボウルに入れ酢小さじ2でマリネする。\\r\\n味付け用Aを加えよく混ぜる。水気をしぼったキャベツを加え、よくあえて混ぜる。10分くらい。\\r\\n3    器に盛り付ける。	3	21	0	2	2	\N	zYMZWDJrb6KuiaZddGLXe9LYVg6bm2JJWHAmrY14.jpg	\N	1	1	1	0	0	2021-11-08 03:00:23	2021-12-07 14:10:08
95	1	飲むチーズケーキ	1　パイナップルは水気を切り、1枚を4等分に切る。(1人2切れ)\\r\\n2　ボウルに生クリームを入れ、6分立てにする。ホイップクリームです。\\r\\n別のボウルにクリームチーズ・フロストシュガーを入れ、クリーム状になるまで混ぜる。\\r\\n4　牛乳を少しずつ加え、均一になるまで混ぜる。\\r\\n5　チーズクリームAを加えてさらに混ぜる。\\r\\n6　グラスにチーズクリーム・ホイップクリーム・フルーツグラノーラ・パイナップル・ブルーベリージャムを盛り付け、ミントの葉を飾る。	6	21	0	2	3	\N	zxnrl8FtzgHdq84IOKasVvX2qCBpNstgFUEj4Ig7.jpg	7Og2ei7jRldyfRccOVKXhxmVYsdsM4FY2jhe1Mfb.jpg	1	1	1	0	0	2021-11-08 03:10:55	2021-12-07 14:11:27
149	1	ぶどうとレモンのサラダ	1　ぶどうは皮付きのまま洗い、繊維に逆らった薄切り。あればタネを除く。レモンは塩少々でこすり洗いし、果汁をしぼる。大さじ1位。\\r\\n2　ボウルにぶどう・はちみつ小さじ2を入れてマリネを作る。葡萄から水分が出てきたら、レモンの果汁大さじ1位・塩小さじ1/4・黒こしょう少々を加えて混ぜる。\\r\\n3　皿にグリーンリーフ・ルッコラを盛り付け、2をかける。	3	35	0	\N	\N	\N	dDUAYMgPRpy6kpT2Qj5dD3NrmhW0zlyzmhxqKtGR.jpg	\N	0	0	0	0	0	2021-11-10 00:25:12	2021-11-27 08:22:14
96	1	2種のパスタ~アマトリチャーナ&冷製たらこレモン~	1　ベーコンは幅1cmに切る。にんにくは皮・芯を除きつぶす。（ア）\\r\\n2　玉ねぎは根元を除き、繊維に沿った薄切り。たらこは薄皮を除く。（ア・冷）\\r\\n3　ディルは洗って水気を切り、飾り用に少しとりわけ、残りの葉はちぎり茎はみじん切り。スモークサーモンは長さを活かして半分におり、端から巻き、バラの花の形にととのえる。（冷）\\r\\n4　スパゲティ全量はタイミングを見計らい茹でる。半量はとりわけ、残りは水で冷やし、水気をしっかり切る。\\r\\n5　鍋にベーコン・にんにく・オリーブオイル小さじ1を入れ、弱火で加熱する。にんにくがきつね色になり始めたら粗くつぶす。（ア）\\r\\n6　玉ねぎを加えてしんなりとするまで炒める。ソース用Aを加えて混ぜる。（ア）\\r\\n7　牛乳を少しずつ加えながら混ぜ、中火2分位煮詰める。（ア）\\r\\n8　スパゲティを加えてよくからめ、味見をし、塩黒こしょう各少々で味をととのえる。\\r\\n9　ボウルにたらこ・ディル・ソースBを入れて混ぜる。ラップをかけ冷蔵庫で冷やす。（冷）\\r\\n10　ここにスパゲティを入れてよくからめる。\\r\\n11　皿にアマトリチャーナを盛り付け、粉チーズをかける。\\r\\n12　冷製たらこレモンを盛り付け、スモークサーモン・ディルを飾る。（冷）	4	22	0	2	1	\N	bIWS1XTkJF5WdjoFdE5gsrowdCbOYxlpYxKm2z1e.jpg	l03RllLG1oxjhqgdsOkqIu0Z4Cts9GWd8Awa2Izr.jpg	1	1	1	0	0	2021-11-08 06:33:11	2021-12-07 14:15:44
97	1	バジルチキンサラダ	1　鶏もも肉は余分な水気・脂肪を除き、厚みを均一にする。下味Aで下味をつけバジルをまぶす。\\r\\n2　にんにく8gは皮芯を除き、潰しておく。グリーンリーフ・トレビスは食べやすい大きさにちぎり、水にさらし水気を切る。\\r\\n3　ブラックオリーブは汁気を切り、4等分に輪切り。\\r\\n4　フライパンににんにく・オリーブオイル小さじ1を入れ、香りを出すように弱火で加熱する。\\r\\n5　鶏肉の皮面を下にして入れ、余分な脂があれば除きながら、両面を香ばしく焼く。\\r\\n6　皿に、グリーンリーフ・トレビス・ブラックオリーブ・5を盛り付ける。エキストラバージンオリーブオイル(1人小さじ1)をまわしかけ、岩塩少々をふる。	3	22	0	2	1	\N	t6n0lAeFaMjKhtmpWgsyVL98BcaZv7qDbEP4P6vN.jpg	\N	1	1	0	0	0	2021-11-08 06:40:43	2021-12-07 14:17:34
98	1	キウイヨーグルト	1　プレーンヨーグルトはペーパーで包み、ザルとボウルで水切りをする。30 分位。水切りヨーグルトです。\\r\\n2　キウイは皮をむき、厚さ5mmのいちょう切り。\\r\\n3　ミントの葉は洗って水気を切り、葉のみ摘む。\\r\\n4　ボウルにキウイフルーツ・エルダーフラワーコーディアル小さじ2を入れミントの葉をちぎりながら加える。\\r\\n5　マリネし冷蔵庫で冷やす。\\r\\n6　器に水切りヨーグルト・5を盛り付ける。	6	22	0	2	3	\N	9G4Kceclox2KFBGv3jEiQrmK64y7ozj5JlGr7txu.jpg	\N	1	1	1	0	0	2021-11-08 06:45:54	2021-12-07 14:18:16
99	1	韓国風ザクザクチキン&ヤンニョムチキン	1.ボウルに鶏手羽元用練り粉A・鶏もも肉用練り粉Bをそれぞれ混ぜ合わせる。\\r\\n2　鶏手羽元は余分な水分を除き、骨に沿って切り込みを2本入れ、塩を小さじ1/4をもみこむ。鶏もも肉は余分な水分・脂肪を取り除き厚みを均一に開き、食べやすい大きさに切る。8切れ。\\r\\n3　ビニール袋に下味用Cを入れよく混ぜる。鶏手羽元・鶏もも肉を加えてよくもみ込み、なじませる。\\r\\n4　フライパンにヤンニョムだれDを入れ、軽く煮詰める。筋が残るくらい。\\r\\n5　鶏手羽元の汁気を軽く除き、Aをつけ、160度の油で7分位揚げる。バットに取り出し5分くらい休ませる。\\r\\n6　鶏もも肉の汁気を軽く除き、Bをつけ160度の油で4分位揚げる。バットに取り出し5分くらい休ませる。\\r\\n7　5・6を180度の油で色良く揚げる。20秒くらい。バットに取り出し油を切る。\\r\\n8　鶏もも肉をヤンニョムだれに加えからめる。\\r\\n9　皿にヤンニョムチキン・ザクザクチキンを盛り付ける。ヤンニョムチキンに白炒りごま(4人で小さじ1/2)をふる。	5	23	0	3	1	\N	yPoX7N4GgY2GhtHYlg6lC4JZ3ei3V792ESlwT6l2.jpg	\N	0	0	0	0	0	2021-11-08 07:41:47	2021-12-07 14:19:15
100	1	チーズキンパ	1　焼き海苔は長さを活かして半分に切る。スライスチーズは巻く。\\r\\n2   ボウルに味付け用Aを入れよく混ぜる。ごはんを加え切り混ぜる。\\r\\n3　ラップの上に焼き海苔を縦長に置き、ごはんを左右はギリギリ、奥は1cmくらいあけて広げる。巻終わりにごはんを2〜3粒つける。\\r\\n4　手前にキムチ・チーズを置き、芯にして巻く。ラップでしっかりと形をととのえ、巻き終わりを下にし、なじませる。\\r\\n5　ラップを外しぬらしたペーパーで、包丁を1回ずつ拭きながら、4等分に切る。それぞれラップで包み、耐熱皿に載せる。\\r\\n6　電子レンジで加熱する。600w40秒。皿に盛り付ける。	4	23	3	3	1	\N	KxRWCgJ2sSlZ7d2IAggODLGIp6Us5d1LI9pO6G8W.jpg	rPIDEWf7G1vX19VFEVYAQfv1D319hEPX13MZqjVw.jpg	0	0	0	0	0	2021-11-08 07:48:26	2021-12-07 14:20:31
101	1	わかめの炒めドレッシングサラダ	1　わかめは水で戻し水気を切る。フライパンにドレッシングを小さじ1/2熱し、ちりめんじゃこを入れカリッとするまで炒める。\\r\\n2　ちりめんじゃこを端に寄せ、わかめを加え、水分を飛ばすように炒める。ドレッシング大さじ2を加えて炒め合わせ、粗熱を取る。\\r\\n3　皿にグリーンリーフを盛り付け、わかめの炒めドレッシングをのせる。\\r\\n\\r\\n＊　ドレッシング;  キューピーごま油&ガーリックドレッシング	3	23	0	3	2	\N	Qwc8aKd1AAAxmgaeKXDSSwHQyqLJcBLbMSN5phjs.jpg	HcPvMeodXuEFtLoiPtqiGiCeBMMygJAnfj2623wi.jpg	0	0	0	0	0	2021-11-08 07:53:07	2021-12-07 14:21:29
158	1	りんごと春菊のサラダ	グリーンリーフは食べやすい大きさにちぎり、水にさらし、水気を切る。春菊は茎から葉を外し、長ければ食べやすい長さに切り、水にさらし、水気を切る。\\r\\n2 りんごは塩少々でこすり洗いし、皮付きのまま芯を除き、厚さ7~8mmのいちょう切り。水にさっとさらし、水気を切る。\\r\\n3 ボウルにドレッシング(キューピーレモンドレッシング)小さじ4・ゆずこしょう小さじ1/2を入れ混ぜる。グリーンリーフ・春菊・りんごを加え、和える。\\r\\n4 皿に彩りよく盛り付ける。	3	37	0	\N	\N	\N	I2A2SOrhEXtrLT1qG0WVKwoUFRrHxBK9AQ1us8Ve.jpg	xEOHGzhkgtoTcJOssNhVCyvUkYtB39JdbzTmxYbt.jpg	0	0	1	0	0	2021-11-10 02:46:09	2021-11-28 11:35:17
102	1	トゥカロン~韓国風マカロン~	1　ボウルにマカロンミックス40gを入れ、水を加え、軽くなじませる。粉っぽさがほぼ見えなくなったら、角がしっかりと立つ硬さまで泡立てる。マカロンAをふるい入れて切り混ぜる。\\r\\n2　ボウルの側面にこすりつけるようにしながら滑らかにする。(マカロナージュ)半分に分けそれぞれに色素(赤・青)を加え一混ぜする。\\r\\n3　それぞれしぼり袋に入れ、先端を1cmくらい切り、クッキングシートを敷いた天板にしぼる。直径6cm各4つ。\\r\\n4　天板の裏側を軽くたたいて空気抜きをし、オーブンの下段に入れ焼く。焼き上がったらオーブンから取り出し、天板にのせたまま冷やす。\\r\\n5　ボウルにメレンゲ用Bを入れて泡立て、メレンゲを作る。別のボウルにバターを入れ、白っぽくふんわりとするまで、よく混ぜる。\\r\\n6　Bメレンゲにバターの入ったボールを2〜3回に分けて加えその都度よく混ぜる。マカロン(赤)にバタークリームをのせ、周囲にラズベリーをちぎりながらつける。上にマカロン(青)をのせる。皿に盛り付ける。	6	23	2	3	3	\N	p6BV0AACu6O4gP3bwJJquNQTtv7fUfd8qmbhWK2w.jpg	E8CyNW7CkDdo4gmo5eJsIFqRRbXCcLkH4tClDTZs.jpg	0	0	0	0	0	2021-11-08 08:08:44	2021-12-07 14:22:40
103	1	台湾まぜそば	1　赤唐辛子は粗く刻んで合わせ調味料Aを作る。\\r\\n2　トマトはへたを除いて洗い1cmの角切り。青ねぎは根元を除き小口切り。\\r\\n3　ニラは根元を除き幅7mmに切る。削りがつおは粉状に手ですりつぶす。卵は卵黄・卵白に分ける。(卵白は白い卵プリンに使用)。\\r\\n4　フライパンに豆板醤小さじ1・ごま油小さじ1を入れ熱し、香りが出たら大豆ミートを加え炒める。\\r\\n5　全体に油がなじんだら合わせ調味料Aを加えて全体に絡め水80ccを加え混ぜる。\\r\\n　 水分が飛びゆるいとろみがつくまで煮詰める。= 肉味噌\\r\\n6　中華麺はたっぷりの熱湯で茹で、ざるにあげ流水で洗い水気を切る。\\r\\n7　食べる直前に中華麺を熱湯で温め水気を切る。麺味付け調味料Bをボウルで混ぜ中華麺を入れて和える。\\r\\n8　器に中華麺を盛り付ける。中央に肉味噌・肉味噌の窪みに卵黄乗せ、周りにトマト・ニラ・青ねぎ・削りがつお・きざみにんにく・きざみ海苔をのせる。(4人分できざみにんにく小さじ2・きざみ海苔2g)。	4	24	0	3	1	\N	ZankDSNpzYCzfzTbFegNQo9M4M8UWJGr2QnXiBYu.jpg	\N	0	1	0	0	0	2021-11-08 08:32:08	2021-12-07 14:25:18
104	1	ぷりぷり海老餃子	1　むき海老は背わたがあれば除いて洗い、水気を除く。半量はあらく刻み、残りはきざんでからたたき、包丁の腹ですりつぶす。\\r\\n2　青ねぎは根元を除き、小口切り。ビニール袋にむき海老、豚ひき肉、調味料Aを入れる。\\r\\n3　良く混ぜる。青ねぎを加えさらに混ぜる。　\\r\\n4　餃子の皮の中央にあんを1/16量ずつおき、周囲に水をつける。半分に折りたたみ、真ん中を止める。\\r\\n5　両端を中央に集めるように折りたたんで止め、形を整える。\\r\\n6　フライパンにサラダ油小さじ1を熱し、餃子を並べて焼く。　\\r\\n7　焼き色がついたら水を加えて蓋をし、蒸し焼きにする。中火4分くらい。\\r\\n8　ふたを取り、水分を飛ばすように焼く。水分が飛んだらごま油小さじ1を回しかけ餃子の皮がカリッとするまで強火で焼く。\\r\\n9　皿に海老餃子を盛り付け、別皿に酢小さじ1・黒こしょう少々(1人分)を入れ添える。	5	24	0	3	1	\N	Q5xL1ENivXaAoLh5Unz1adK9KDFTzaZuuxl3kGMI.jpg	wJeAVMUHQTKUTr5QTxzcRQiRMMBvYMQs64LDb8ZA.jpg	0	1	0	0	0	2021-11-08 08:44:19	2021-12-07 14:26:16
105	1	白いたまごプリン	1　ボウルに卵白4個分とたまごプリン素Aを入れ、泡立てないようにしっかりと卵白を牛乳に散らしながら混ぜる。\\r\\n2　上記をぬらした茶こしでこして器に注ぐ。　　　　\\r\\n3　鍋に湯をはり沸騰させる。火を止めザルを入れて上記の器を並べる。\\r\\n4　蓋をし強火で4分加熱する。(軽く揺すり揺れ方が変わってくるまで)、弱火または保温で10分〜加熱する。\\r\\n5　プリンに竹串を刺し、液体が出てこなければ火を止めあら熱を取り冷蔵庫で冷やす。\\r\\n6　たまごプリンあんをかける。抹茶小さじ1/2をふるい黒みつ小さじ4をかける。(4人分)。	6	24	0	1	3	\N	7727w6BpDAgZuVy9lvFl2l5UZQAhhDtz7eJWcYg2.jpg	\N	0	0	1	0	0	2021-11-08 08:53:49	2021-12-07 14:27:15
106	1	5種野菜と鶏肉のごま香味炒め	1　鶏もも肉は余計な水分・脂を取り除き、厚みは均一にし1人3切れに切る。ボウルで塩小さじ1/8を揉み込む。\\r\\n2　調味料A→Bの順番で加えてもみ込む。\\r\\n3    れんこんは皮をむき、厚さ7〜8mmの輪切り、または半月切り。一人2〜3切れ。\\r\\n4　カボチャは種ワタを取り除き、厚さ7〜8mmの薄切り。ズッキーニは厚さ7〜8mmの輪切りまたは半月切り。一人2〜3切れ。\\r\\n5　赤パプリカはへた種を取り除き、乱切り。一人2〜3切れ。ナスはへたを除き乱切り。一人3〜4切れ。\\r\\n6　フライパンにサラダ油・ごま油各小さじ2を熱し、野菜を入れて焼き、焼けたものから塩をふり(小さじ1/4)取り出す。\\r\\n7　鶏肉を皮面を下にして入れ、焼き色が付いたら返し火が通るまで焼く。中火10〜\\r\\n8　6を戻し入れ、ドレッシング小さじ8を加え炒め合わせる。\\r\\n9　皿に盛り付ける。\\r\\n\\r\\nドレッシング;  キューピー深煎りごまドレッシング	5	25	0	1	1	\N	wdkvPDfBICaVWrBKRXxxAak34s99wKbKEyKefmUx.jpg	\N	0	1	0	0	0	2021-11-08 09:05:54	2021-12-07 14:29:50
107	1	オクラとみょうがの冷たいみそ汁	1　オクラはヘタの部分を切り落とし、ガクの周りの硬い部分をむき、塩少々でこすり、塩付のまま熱湯で茹でる。粗熱を取り厚さ1mmの小口切り。\\r\\n2　みょうがは根元を除き、縦半分に切り、斜め薄切り。水にさらし水気を切る。ボウルにみそ液体小さじ8・水480ccをいれ混ぜ、冷蔵庫で冷やす。\\r\\n3　お椀にオクラ・みょうがを分けいれ、2の冷たい味噌汁を注ぐ。	2	25	0	1	2	\N	w7sFAivn7Q7eoZpS59UTrZ35Xeu2ff7PJqpgksx4.jpg	KR2q12TSYz6rlSaQ7zs75qVmdtCuYK7gxc3Bb40n.jpg	1	1	1	0	0	2021-11-08 09:09:09	2021-12-07 14:35:15
174	1	やみつきピリ辛きゅうり	1人前\\r\\n\\r\\n1　きゅうりはヘタを切り落とし、網目状にピーラーで皮を剥き、1cm幅に切る。\\r\\n2　ボウルに1を入れ、塩ひとつまみをふりもみ込む。10分ほどおき水分を出す。\\r\\n3　ジップ保存袋に水気を切った2・Aを加えよくもみ込む。冷蔵庫で30分漬け込む。\\r\\n4　味が馴染んだら、器に盛り付け完成。	8	41	0	\N	\N	\N	AOyIcv8ZuKiTqwMrMr8i2g8tbNu2KdNbG79uEW0V.jpg	\N	1	0	0	0	0	2021-11-11 01:14:20	2021-11-27 08:35:10
108	1	桜海老とチーズの卵焼き	1　プロセスチーズは5mm角に切る。卵2個はボールに割り入れ、菜箸をボールの底につけ大きく左右に動かしコシは残してほぐす。泡立てない。\\r\\n2　プロセスチーズとAをボールにいれ混ぜ合わせる。卵焼き器をよく熱し、ペーパーにつけたサラダ油小さじ1/2を全体に広げて馴染ませる。\\r\\n3　卵液の1/2量を流し入れる。全体に広げ半熟状になったら奥から手前に折り畳むように巻く。\\r\\n4　卵焼き器の表面全体を油のついたペーパーで拭き、巻卵を奥に移動させ、手前も拭く。残りの卵液の全て可搬料を流し入れ全体に広げる。\\r\\n　 最初に巻いた卵焼きの下にも卵液を流し入れる。\\r\\n5　半熟になったら奥から手前に巻き込む。卵液が残っているならもう一度繰り返す。焼き上がったら熱いうちにラップで包み1,2分おき形を整える。\\r\\n6 　卵焼きの形が落ち着いたら、4等分に切る。皿に盛り付ける。\\r\\n\\r\\n＊　材料表示は2人分。ドレッシングはキューピー深煎りごまドレッシング。	7	25	0	1	2	\N	2lCuFfs2Rgys51h5WrYW9uIo3HqWKNrF3YRbE2HM.jpg	f4eVkKQHePuqZd0NY6rmYgZgPhMAAkyssladHMzr.jpg	1	1	1	0	0	2021-11-08 09:22:35	2021-12-07 14:36:51
109	1	小松菜のごま和え	1　小松菜は根元の土を洗い流し、熱湯(塩少々加える)で湯で水にとり色止めする。根元揃えて水気をしぼ流。\\r\\n2　根元を長さ4cmに切り絞る。ボウルに味付けAをいれて混ぜる。\\r\\n3　小松菜を加えてよく和える。器に盛り付ける。\\r\\n\\r\\n＊　ドレッシング;  キューピー深煎りごまドレッシング	8	25	0	1	2	\N	AJIsP3qLp8IZMvwg6gOOZKBy1ZDxH5aJj9NVNmUY.jpg	\N	1	1	1	0	0	2021-11-08 10:21:04	2021-12-07 14:37:44
110	1	フルーツ和ポンチ	1　羊羹は1本を8等分にする。\\r\\n2　ミックスフルーツ缶は汁気を切る。\\r\\n3　1・２を器に盛り付けメープルシロップ1人小さじ1をかける。	6	25	0	1	3	\N	LbGsnOagoa1MfaAsox8IE7ANUoMm3XEm97XirnyZ.jpg	\N	1	0	1	0	0	2021-11-08 10:23:53	2021-12-07 14:39:05
111	1	豚しゃぶのスープカレー/ターメリックライス	1　玉ねぎは根元を除き、みじん切り。にんじんは皮をむき、半分は輪切り、4枚はトッピング用。残りはペースト用で薄切り。\\r\\n2　カボチャは種子ワタをとり、薄切り(1人2枚)、オクラはヘタの部分を切り落とし、ガクの周りの硬い部分をとり、1箇所切り込みを入れる。\\r\\n3　ナスはへたを除き、縦4等分。ごぼうはピラーを使いリボン状に切る。\\r\\n4　鍋に鍋に鶏スープ材料をいれ沸騰させる。火を弱め豚肉を重ならないようにいれ加熱。火の通ったものからボウルに取り出す。スープは取っておく。(鶏スープ)。\\r\\n5　鍋にサラダ油小さじ2を熱し玉ねぎ・塩・人参を入れる。玉ねぎは飴色になるまで、人参は柔らかくなるまで加熱。この人参は取り出し水100mlを加えブレンダーでペースト状にする(人参のペースト)。\\r\\n6　5の鍋に調味料Aを加え、弱火で香りが出るまで炒める。調味料Bを加え香りが出るまで中火1分くらい炒める。\\r\\n7　人参のペースト調味料Cを加え弱中火で10分〜加熱する。\\r\\n8　フライパンにサラダ油小さじ2を熱しカボチャ・人参・オクラ・ナスを色良く焼き、焼けたものから取り出す。\\r\\n9　ごぼうは耐熱皿に乗せ、サラダ油小さじ1を加えて混ぜ電子レンジで加熱。600w6分。蒸気を除きチップスにする。	5	26	0	8	1	\N	DHQhTnkJtxKIJdvCRagfIKhBfRWwxjatqCYv805a.jpg	vJBjblkaHaZRIPUTGDPObGqZZgCqYqggy4WN8kXf.jpg	0	0	0	0	0	2021-11-08 10:43:43	2021-12-13 09:26:18
112	1	ターメリックライス	1　鍋に米・水・ターメリック・塩小さじ1/8を入れひと混ぜし表面を鳴らす。\\r\\n2　フタをしてたく。沸騰まで強火、沸騰後弱火10分〜。さらにターメリックライスを山高に盛り付ける。\\r\\n3　器にスープカレーを分け入れ、野菜・豚しゃぶを盛り付ける。	4	26	0	8	1	\N	GOZ8evL5shC1OyuUnx7uEidSCEpMPHSnY7JSm6D3.jpg	\N	0	0	0	0	0	2021-11-08 10:47:46	2021-12-13 09:26:52
113	1	グリルチキンウイング	1　鶏手羽中は余分な水気を除き、ボウルに入れウイング調味料Aをいれよく混ぜる。10分〜置いておく。\\r\\n2　ウイング調味料Bをよく混ぜ1の鶏手羽中に衣としてつける。アルミホイルをひいた天板に並べ上からアルミホイルをかける。\\r\\n3　オーブンで加熱。電気200℃30分〜。ガス190℃30分〜。盛り付ける。	5	26	2	8	1	\N	lfuAXYYuaKOh9ik6AsjOLFFsbHKku2gOsSIdTkVB.jpg	\N	0	0	0	0	0	2021-11-08 10:54:09	2021-12-13 09:27:26
114	1	アボカドとトマトのサラダ	1　アボガドは縦半分に切り、種を除く。トマトはヘタを除いて洗い、くし形切り。さらに斜め半分に切る。　\\r\\n2　グリーンリーフは食べやすい大きさにちぎり、水にさらし水気を切る。ボウルにドレッシングを入れて塩を溶かしマヨネーズを加え均一に混ぜる。(調味料A)　\\r\\n3　アボガドの果肉をくり抜いて加え、トマトと一緒にざっくりと和える。皿にグリーンリーフ・トマト・アボガドをもりつける。	3	26	0	4	2	\N	a5daS8FIzQGqpKIYXvFpb1HfJ8vPT9ELP1uM6Uw0.jpg	\N	0	0	0	0	0	2021-11-08 10:59:51	2021-12-07 14:43:07
115	1	ココナッツミルクラッシー	1　なべに半量の牛乳を温める。\\r\\n2　ココナッツミルクパウダーを加えて溶かす。\\r\\n3　はちみつを加えて均一に混ぜる。\\r\\n4　ボールにプレーンヨーグルトをいれ、3の残りの牛乳を少しずつ加えて混ぜる。\\r\\n5　冷蔵庫で冷やす。\\r\\n6　グラスに注ぎ入れる。	6	26	0	8	3	\N	kI2JHLVquFjs5czW8LCZVwu2BqBGPCZ2ahyDZrJx.jpg	\N	1	0	1	0	0	2021-11-08 11:02:13	2021-12-13 09:27:47
150	1	鶏肉のトマト煮込み	1　鶏もも肉は余分な水気・脂肪を除き、塩小さじ1/4・黒こしょう少々で下味をつける。にんにくは皮・芯を除き、つぶす。\\r\\n2　スライスチーズは角を折り、並べて加熱し、油が抜けてくるまで焼く。沸騰して穴が開き、油がにじんできたら寄せながら丸く形をととのえる。\\r\\n3　触ってもよれなくなってきたら、裏返して焼く。両面色よく焼けたら、バットに取り出す。\\r\\n4　フライパンににんにく・オリーブオイル小さじ1を弱火で加熱。香りがしてきたら皮面から鶏肉を加え、中火で両面焼き色がつくまで焼く。\\r\\n5　カットトマト400g・塩小さじ1/8・黒こしょう少々を加え、皮面を上にして中火5分〜煮る。\\r\\n6　皿に鶏肉のトマト煮込み・チーズガレット・サワークリーム(4人で60g)を盛り付ける。イタリアンパセリを飾り、エキストラバージンオリーブオイル(1人小さじ1/2)をかける。	5	35	0	\N	\N	\N	e5CzNm0dgAi9lN8djl9hPQrfaONm877mm3abBmxt.jpg	\N	0	0	0	0	0	2021-11-10 00:31:54	2021-11-27 08:22:38
116	1	スコッチエッグ・アスパラフライ	1　パン粉大さじ8は牛乳大さじ4を加えしとらせる(練り粉)。薄力粉大さじ8を水大さじ6~と合わせる。\\r\\n2　グリーンアスパラガスは根元を1cmくらい切り、した1/3位の硬い皮をピーラーでむき、はかまの部分を除き、長さを半分に切る。　　\\r\\n3　水菜は根元を除き、アガサ4cmに切る。レモンは塩でこすり洗いし、4等分のくし形切り。\\r\\n4　鍋に熱湯を沸かし、酢小さじ1塩小さじ1/8をいれ冷蔵庫から出したての卵を静かに加える。最初の2〜3分は混ぜながら茹でる。再沸騰後7分。水に取り皮を剥く。\\r\\n5　ボウルに合い挽き肉・塩麹を入れ粘りが出るまでよく混ぜる。1の練り粉を加えよく混ぜる。4等分する。\\r\\n6　手に水を馴染ませ5を空気抜きし、直径12〜14cmくらいの楕円形に広げ、ゆで卵を乗せ空気を抜きながら成形する。\\r\\n7　グリーンアスパラガス・6の順に練り粉・パン粉とつける。\\r\\n8　170〜180度の油でアスパラガスを(1分~)揚げる。バットに取り出し油を切る。160〜170度の油にスコッチエッグをいれ温度を徐々に上げながら(5分~)揚げる。\\r\\n9　皿に水菜プチトマトを盛り付けドレッシング(1人小さじ1)をかける。スコッチエッグを盛り付けソース・レモンを添える。ソース; トマトケチャップ・ウスターソース各大さじ2を合わせておく。	5	27	0	2	1	\N	ehItHl5dttf9nFf9E5BgWuB4rbEpsbBaIbighRQN.jpg	mLtnXqKN0ytv1r5NWj6C4R43OWxkaimbOf0WbXRR.jpg	0	0	0	0	0	2021-11-08 14:01:15	2021-12-07 14:44:59
117	1	炒り黒豆のごはん	1　黒豆は洗って水気を切り、鍋で乾煎りする。中火8分。\\r\\n2　鍋に塩麹・水220ccを入れ混ぜる。水気を切った米を入れる。\\r\\n3　表面を平らにならし、黒豆をのせフタをして火にかける。\\r\\n4　沸騰したら火を弱めて10分くらい炊く。炊き上がったら10分くらい蒸す。\\r\\n5　器にこんもり盛り付ける。	4	27	0	1	1	\N	27zbVdHUfASJlsT1oIBIIH3S2mylB91ugThvx6gY.jpg	\N	1	0	1	0	0	2021-11-08 14:26:51	2021-12-07 14:45:40
118	1	揚げなすのみそ汁	1　ナスはヘタを除き、乱切り。一人4切れ。170度くらいの油で揚げる。\\r\\n2　火が通ったものからパットに取り出し、油を切る。\\r\\n3　鍋にみそ汁の味付けAを入れて加熱し沸騰したらナスを加え軽く温める。\\r\\n4　火を弱め、味噌を溶き入れる。きざみしょうがを加える。器に盛り付ける。	2	27	0	1	2	\N	wOzO1DkpXBvo8HXeJcOsQK3enIc93BNrBiExEStU.jpg	\N	0	1	1	0	0	2021-11-08 14:31:07	2021-12-07 14:46:16
119	1	抹茶くるみわらび餅	1　胡桃は余熱なしのオーブンでローストし、食べやすい大きさに砕く。電気170度8分。ガス160度8分。\\r\\n2　抹茶大豆粉Aを作る。ここからトッピング用Bに小さじ1を取り、砂糖小さじ2を加える。\\r\\n3　耐熱容器にわらび餅Cを入れざっと混ぜ、水を少量加えて均一に溶きのばし、残りの水を加えて混ぜる。\\r\\n　 ラップをふんわりかけてレンジで加熱する。600w1分。\\r\\n4　一部が半透明になったら混ぜ、胡桃を加えて混ぜる。ラップをふんわりとかけ電子レンジで加熱。600wで1分。全体に透明感があり、均一になったら混ぜる。\\r\\n5　パットに抹茶大豆粉を半量ふるい、4を取り出す。上から残りの抹茶大豆粉を振るう。\\r\\n6　人肌程度に冷めたら、1人3〜4切に切り分ける。器に盛り付け、トッピング用の抹茶大豆粉を振りかける。	6	27	3	1	3	\N	bZMQ69jDFbFdYFgDShlKPx8WcqpdtmeVWhOKqIGs.jpg	Y2NAL6JaewgSvtDPOmvz0eTtBPHH2Smyw77zQDH0.jpg	0	0	1	0	0	2021-11-08 14:43:08	2021-12-07 14:48:55
120	1	ガパオライス	1　筍は薄切りにして長さを半分に切り、幅1cmにする。赤黄パプリカはヘタ種を取り除き、幅5mmの薄切りにし長さを半分に切る。\\r\\n2　バジルの葉8g(茎も含む)は葉と茎に分け、葉はそのまま、茎は小口切り。ライム(1/2個)は塩でこすり洗いし、スマイルカットにする。一人一切れ。\\r\\n3　フライパンに赤唐辛子サラダ油各小さじ1を入れ、香りが出るまで炒める。中火。\\r\\n4　豚挽肉を加え、表面を焼き固めてからほぐし、刻みニンニク小さじ1を加えてそぼろ状になるまで炒める。強火。\\r\\n5　余分な脂を除き、筍を加え炒める。パプリカを加えてさっと炒める。\\r\\n6　調味料Aを加え、汁気が少なくなるまで炒める。\\r\\n7　バジルの葉を2〜3cmにちぎりながら茎とともに加え炒める。\\r\\n8　卵はカップに1個ずつ割り入れる。フライパンにサラダ油大さじ1を熱し、卵を入れ加熱する。好みの焼き具合まで。白身がつながっていれば切り離す。\\r\\n9　器に盛り付け、目玉焼きを乗せライムを加える。	4	28	0	5	1	\N	ojZ2GsFHkhycCWBu6rwk3S56V5QStiOseUK8pzt3.jpg	\N	0	1	0	0	0	2021-11-09 12:29:58	2021-12-13 09:28:35
121	1	チャゾー~ベトナム風揚げ春巻き~	1　タケノコはみじん切り。\\r\\n2　緑豆春雨20gは熱等に浸してもどし(3分くらい)ざるにあげ水気を切り、幅1cm位のざく切り。\\r\\n3　むき海老は背ワタがあれば除き、粗みじん切りにし、粘りが出るまで叩く。\\r\\n4　ボウルにむき海老・豚ひき肉40gを入れ、よく混ぜる。筍・緑豆春雨・調味料Aを加え混ぜる。\\r\\n5　ライスペーパー4枚はキッチンバサミで半分に切る。ライスペーパーの孤の中央を重ねて、水にさっとくぐらせる。\\r\\n6　濡らして硬く絞ったペーパー（紙）に乗せ、ペーパーで水気を抑える。手前に1/4量のたねを乗せる。\\r\\n7　手前を一巻きし、両端を内側に折る。長さ10cm。空気が入らないようにくるくると巻く。\\r\\n8　170度くらいの油で揚げ色がつくまでカラリと揚げる。3分〜。\\r\\n9　バットに取り出し油を切る。器に盛りつけスイートチリソース(1人小さじ1/2)をかける。	8	28	0	7	2	\N	zjTf0APoymzXyEwRg1tHRem7ogH75iewdFYYofvi.jpg	FS2evaqXf6kr3NbjZihuBNqjXTrCzXejWePhdUj8.jpg	0	1	0	0	0	2021-11-09 12:39:26	2021-12-13 09:29:04
122	1	牛肉とミントのサラダ	1　グリーンリーフは一口大にちぎり、水にさらし水気を切る。紫玉ねぎは根元を除き、繊維に沿った薄切りにし、水にさらし水気を切る。\\r\\n2　牛肩ロース薄切り肉120gは幅5〜6cmに切る。鍋に熱湯を沸かして弱火にして入れる。色が変わるまでさっと茹でざるにあげ水気を切る。\\r\\n3　ボールにライム1/2個の果汁を搾り、調味料Aを入れよく混ぜる。サラダ油小さじ1を加えさらによく混ぜる。\\r\\n4　グリーンリーフ・紫玉ねぎ・牛肉を加え、和える。皿に盛り付けミントの葉をちらす。\\r\\n\\r\\nミントはタイ語でバイサラネー。タイではきゅうりやキャベツと同様に野菜の感覚でも食べられる。	3	28	0	5	2	\N	me8QjCS5pW3nTs07YEQbZqxyzdoFYLBjf3ucqjmp.jpg	\N	0	0	0	0	0	2021-11-09 12:47:50	2021-12-13 09:31:19
124	1	焼き小籠包	1　ボウルに生地A(水は様子を見ながら少しずつ)を入れ大きく混ぜる。そぼろ状になってきたらボウルの中でまとまるまで軽くこねる。\\r\\n2　台に出してこねる。2分〜。なめらかになったらきじを丸めてラップで包み、室温で生地を休ませる。20分〜。\\r\\n3　ボウルに豚挽肉、調味料B(水は後で少しずつ)を入れ粘りが出るまで混ぜる。\\r\\n4　水40ccを少しずつ加えて均一になるまで混ぜる。ラップをかけ冷蔵庫で冷やす。\\r\\n5　生地を直径2cmくらいの棒状にして、12等分にし、切り口を上にして打ち粉(強力粉小さじ2〜)をまぶしながら手のひらで押さえ丸く広げる。\\r\\n6　綿棒を使って直径10cm位の円形に伸ばす。中央を少し厚く、周りを薄くする。打ち粉をしてラップをかける。\\r\\n7　皮を台の上にのせ、皮の中央にたねをのせ、生地の一箇所をたねにかぶせて上をつまむ。親指を外さずに、人差し指で外の生地をたぐり寄せ\\r\\n　 親指の生地につけてつまむ。\\r\\n8　これを繰り返して1周する。中央に穴が開かないように閉じる。フライパンにサラダ油を熱し、小籠包を並べて皮に香ばしい焼き色をつける。\\r\\n9　水を加えてフタをし、水分がなくなるまで蒸し焼きにする。3分〜。皿に盛り付け別皿に合わせた酢小さじ1・きざみしょうが小さじ1/2(1人分)を添える。	5	29	0	3	1	\N	xH5DTppRIBnjkcngVCXACzqPr4WN4LJzGkjpVnq5.jpg	8qkwjVYXVQ3luCIr4mmxtnBRcG2CtKXvQ5p3ixsn.jpg	0	1	0	0	0	2021-11-09 13:02:47	2021-12-07 14:52:50
125	1	ラーズーチー~鶏のから揚げ甘辛四川炒め~	1　チョウテンガンシンジャオは、ぬらして硬くしぼったペーパーで汚れを拭き、縦半分に切りヘタたねを取り除く。\\r\\n2　鶏もも肉は余分な脂肪・水気を除き、厚みを均一にし、一口大に切る。一人4切れ。ボウルに入れ塩小さじ1/4・黒こしょう少々を加えてもみこみ調味料Aを加えてさらにもみ込む。\\r\\n3　鶏肉は揚げる直前に片栗粉大さじ6をまぶし160度〜170度の油に入れじっくりと揚げる。5分位。油の温度を180度に上げ、更に揚げる。1分位。バットに取り出し油を切る。\\r\\n4　フライパンに1・調味料Bを入れてじっくりと加熱、弱火で香りを出す。3を加えてよく混ぜ、砂糖小さじ1/2を表面にかけて混ぜる。\\r\\n5　火を止めて酒小さじ2を鍋肌から加え再度火をつけて手早く混ぜる。\\r\\n6　わけぎを加えて混ぜる。さらに盛り付け。	5	29	0	3	1	\N	VvUfzHYEqPmFZkAZmniQceI3X9ylceERoqO2NZg9.jpg	eDbRoFHJrhPghVJAcXSAyNeWaqhBweiaL8VoUKzg.jpg	0	1	0	0	0	2021-11-09 13:58:53	2021-12-07 14:53:23
126	1	トマトと卵のスープ	1　トマトはへたを除いて洗いくし形切り。さらに斜め半分に切る。一人4切れ。鍋に調味料Aを入れてよく混ぜ火にかける。\\r\\n2　混ぜながらとろみがつくまで加熱し、卵を流し入れ一混ぜする。トマトを加えて温める。\\r\\n3　火を止め、酢小さじ2を加えて一混ぜする。器に分け入れる。	2	29	0	3	2	\N	PrMVikla7SZgLo0mdD2HdSPTeEjCkHtduydaO9FF.jpg	51PThtebsr4mFLTXIj62lLxgyE3yJzrloAd7iRDO.jpg	1	1	1	0	0	2021-11-09 14:05:30	2021-12-07 14:53:54
127	1	ライチプリン	1　粉ゼラチン小さじ2は使う直前に湯40ccに振り入れ、溶かす(ゼラチン液)。シロップも作る。40cc湯に砂糖小さじ2を混ぜる。\\r\\n2　ライチ飾り用4個は汁気を切り、縦半分に切る。\\r\\n3　ミキサー(ミル)にライチ8個・砂糖小さじ2・牛乳80ccを入れ、なめらかになるまで回す。\\r\\n4　ボウルに移し、ゼラチン液を加えて混ぜ、生クリーム40gを加えて更に混ぜる。\\r\\n5　器に分入れ、冷蔵庫で冷やし固める。\\r\\n6　ライチプリンにシロップをかけ、ライチ飾り用を飾る。	6	29	0	3	3	\N	mEMHNtfwBBWesNZRFXe4uDzAfWiDmSGuayGTTtq3.jpg	\N	0	1	1	0	0	2021-11-09 14:11:13	2021-12-07 14:54:42
128	1	すき焼き丼	1　牛肩ロース薄切り肉400gは大きければ半分に切る。白ねぎ80gは長さは4cmくらいに切る。1人2本。\\r\\n2　しめじ80gは石づきを除き、小房に分ける。水菜120gは根元を除き、ながさ4〜5cmに切る。\\r\\n3　鍋に酒みりん各大さじ2を入れ、火にかける。沸騰まで中火、弱火にして1分加熱。\\r\\n4　割り下Aを作る。\\r\\n5　鍋にサラダ油小さじ1を熱し、白ネギを入れて焼く。\\r\\n6　両面焼き色がしっかりついたら、端に寄せ、牛肉を加えて焼く。\\r\\n7　焼き色がついたら割り下・しめじを加えて煮る。\\r\\n8　牛肉を端に寄せ、水菜を加えてさっと煮る。器にご飯を盛り、すき焼きを彩りよく盛り付ける。\\r\\n9　真ん中をくぼませ、温泉卵をのせ、お好みで七味唐辛子少々をふる。	5	30	0	1	1	\N	MJnl2H9l6bYThaZZ2hBtsQh75iEKTonZ1BKbKX7B.jpg	\N	1	1	1	0	0	2021-11-09 14:22:14	2021-12-07 14:57:32
129	1	枝豆とたたききゅうりのサラダ	1　芽ひじき4gはさっと洗って汚れを流し、新しい水をたっぷり注いで戻す。ザルで水気を切る。\\r\\n2　水菜は根元を除き、長さ5cmに切る。枝豆(冷凍)は熱湯でさっと茹でる。\\r\\n3　枝豆さやから取り出す。きゅうりはすりごきで叩き、ヘタを除き、食べやすい大きさに割る。\\r\\n4　耐熱容器にひじき・ドレッシング大さじ2を入れ、ラップをせずに電子レンジで加熱する。600w1分\\r\\n5　そのまましばらく置き、粗熱を取る。ボウルに水菜・枝豆・きゅうり・ひじきドレッシングを入れ和える。\\r\\n&　器にこんもりと盛り付ける。\\r\\n\\r\\n＊. ドレッシング  ;　キューピーテイスティドレッシング黒酢玉ねぎ	3	30	0	1	2	\N	1v2o9XUKo3tjvH2tHxkifUpDDzrscBVAxiB9E2Jb.jpg	\N	1	1	1	0	0	2021-11-09 14:38:06	2021-12-07 14:58:07
130	1	焼き枝豆のみそ汁	1　枝豆は使用直前まで冷凍しておく。鍋に枝豆を入れ、加熱する。強火。\\r\\n2　香ばしい焼き色が付いたら、水600~640ccを加えて煮る中火5分。\\r\\n3　火を弱め、みそ顆粒小さじ4を加え、一混ぜする。器に注ぎ入れる。	2	30	0	1	2	\N	oCYmvasr489jsOkCBZLKsf2PoK2erHvu2Zv2KRu8.jpg	\N	1	1	1	0	0	2021-11-09 14:41:18	2021-12-07 14:58:51
131	1	甘酒クリームコーヒーゼリー	1　粉ゼラチン小さじ2は湯(50~60度)40ccに振り入れ、溶かす。\\r\\n2　ボウルにインスタントコーヒー・フロストシュガー各小さじ4を入れよく溶かす。\\r\\n3　溶かしたゼラチンを加えよく混ぜる。\\r\\n4　器に分入れ、冷蔵庫で冷やし固める。\\r\\n5　ボウルに生クリーム60gを入れ、8分立てにする。甘酒小さじ4を少しずつ加え混ぜる。甘酒クリーム。\\r\\n6　4に甘酒クリームをかける。お好みでフロストシュガー(1人小さじ1/2)をかける。	6	30	0	1	3	\N	cMFXEmf8YJCanLk3GqTaHFj5TWx7tPVRow7tvEbF.jpg	\N	1	0	1	0	0	2021-11-09 14:49:51	2021-12-07 14:59:55
132	1	プーパッポンカリー~ソフトシェルクラブと卵のカレー炒め~	1　ソフトシェルクラブ4匹(160g位)は立て塩・真水の順に洗い、水気を除き、腹の部分を半分に切る。\\r\\n2　玉ねぎは根元を除き、繊維に沿って幅2〜3mmに切る。セロリは筋を除き、幅1cmの斜め切り。\\r\\n3　赤パプリカはヘタ・種を除き、幅2〜3mmの薄切りにし、長さを半分に切る。卵はよくときほぐし、カレールーAを加えてよく混ぜる。(卵液)\\r\\n4　フライパンにサラダ油大さじ１を熱し、ソフトシェルクラブを入れ両面を香ばしく焼く。\\r\\n5　ソフトシェルクラブを端に寄せ、玉ねぎ・刻みにんにく小さじ2を入れ、しんなりとするまで炒める。\\r\\n6　セロリ・赤パプリカ・カレー粉小さじ1を入れ、さっと炒める。ルーBを加えて混ぜ、ひと煮立ちさせる。\\r\\n7　具材を端に寄せ、空いているところに卵液を入れ、大きく混ぜて火を通す。\\r\\n8　全体を大きく混ぜ合わせ、セロリの葉を加え、さっと混ぜて火を止める。\\r\\n9　器にご飯を盛り、彩りよく8を盛り付ける。\\r\\n\\r\\nセロリの葉 ;　適量8gほど必要。	4	31	0	5	1	\N	p8gYskcerIycdU5agdtGARGQ4gqpp5OcvZMIxOgF.jpg	xCeDongAju5HdWqf0YpCROSz0meSbIgf4b4x3T2u.jpg	0	1	0	0	0	2021-11-09 15:42:33	2021-12-13 09:32:24
133	1	鶏肉のピーナッツグリル	サテはインドネシア、マレーシアなどの東南アジア諸国で広く食べられている串焼き料理。\\r\\n1　鶏もも肉は余分な水気・脂肪を除き、厚みを均一に開き、ナンプラーを10分もみ込む。\\r\\n2　ボウルにピーナッツダレの素を入れよく混ぜる。\\r\\n3　天板にクッキングシートをひいて4隅をねじる。\\r\\n4　鶏肉を皮面を上にして並べ、ピーナッツダレを盛る。\\r\\n5　オーブンで焼く、電気220度15分・ガス210度15分。\\r\\n6　器に盛り付ける。	5	31	2	6	1	\N	CLfLcqReMOR3WyuPtEV7MKbG7haTMSjyFTgO3KMk.jpg	\N	1	1	0	0	0	2021-11-09 15:49:17	2021-12-13 09:34:28
134	1	エスニックサラダ	1　玉ねぎは根元を除いて薄切りにし、10分〜水にさらす。水気を切る。グリーンリーフは食べやすい大きさにちぎり、水にさらし水気を切る。\\r\\n2　ボウルにドレッシング用Aを混ぜ玉ねぎ・ツナ(ノンオイルタイプ1缶70g)も加え和える。\\r\\n3　グリーンリーフを加え、ざっくりと和える。皿に盛り付ける。	3	31	0	4	2	\N	9jVV3lLoOQmiRi1NON2aPqqraFvcWfGn8GetDjYR.jpg	\N	1	1	1	0	0	2021-11-09 15:54:30	2021-12-07 15:01:53
135	1	グレープフルーツゼリー	1　鍋に半量のグレープフルーツジュース(160ccの半量)・砂糖小さじ4を入れる。\\r\\n2　火にかけて温める。\\r\\n3　粉ゼラチン大さじ1を入れ混ぜ溶かす。\\r\\n5　残りのグレープフルーツジュースを加え混ぜる。\\r\\n6　器に分入れ、冷蔵庫で冷やし固める。\\r\\n7　5にグレープフルーツジュース小さじ2(1人分)をかけミントを飾る。	6	31	0	2	3	\N	qAiukSNebC8lia9uke9Z50XBgXEV07sCjFU11uhM.jpg	\N	1	0	1	0	0	2021-11-09 16:00:51	2021-12-07 15:02:29
136	1	手打ちうどん~明太チーズかま玉&トマトだしつゆ~	1　辛子明太子は薄皮を除く。トマトはヘタを除いて洗い、横半分に切る。たねを除き(つゆに使用)、1cmの角切り。\\r\\n2　ライム1個は塩少々でこすり洗いし、横半分に切り、半量は果汁を絞り(つゆ用）、残りはスマイルカットにする(飾り用)。\\r\\n3　ボウルにうどん生地Aを入れて軽く混ぜ(2つのボールにそれぞれ強力粉薄力粉合わせて160gずついれて2玉のうどん固まりを作る)、水65~70ccを回し入れ(様子を見ながら)、大きく混ぜそぼろ状にする。\\r\\n4　まとまったら台の上に出し3分位こねる。生地を丸めラップで包み室温で休ませる。30分程。\\r\\n5　ひとつの生地を2等分にし、棒状にして打ち粉(片栗粉小さじ4~)をまぶしながら伸ばす。目安;30×10cm前後の長方形。\\r\\n6　伸ばした生地に打ち粉をまぶして数回折り、端から幅5〜6mmに切る。バットにのせラップをかける。\\r\\n7　ボウルにちぎったスライスチーズ2枚・調製豆乳40cc・だしじょうゆ小さじ2を入れる。\\r\\n8　ボウルにトマトの種・つゆBを入れて混ぜ、冷蔵庫で冷やす。(トマトだしつゆ)。別のボウルにトマト・砂糖小さじ1を入れ和える。\\r\\n9　打ち粉をはらいながら、熱湯2Lにうどんをほぐし入れ、再沸騰してから10〜12分茹でる。ざるに上げ、半量は水気をよく切る。(明太チーズかま玉用)。\\r\\n10　残りは流水で冷やしながら、ぬめりを洗い流し水気をよく切る。(トマトだしつゆ用)。\\r\\n11　7に9を加えてよく混ぜ、器に分け入れる。温泉卵1人1個・辛子明太子(4人で40g)・きざみ海苔(4人で2g)をのせる。\\r\\n12　別の器に10を分入れ、トマトだしつゆの1/4を注ぐ。トマトマリネを盛り付け、ライムを飾り、エキストラバージンオリーブオイル(1人小さじ1/2)をかける。\\r\\n＊　うどん生地は2人分ずつで作業。	4	32	0	1	1	\N	1VpelZhZByow2CtERoqWevpVGOgYqCdC8TExAj51.jpg	fm0mwBmkbNYyv1bqdlzcqXs1Q6QzMAVnH5MzId9l.jpg	0	1	1	0	0	2021-11-09 20:59:42	2021-12-07 15:03:04
137	1	豚竜田揚げのサラダ仕立て	1　豚ロース薄切り肉は長さを半分に切り、サラダ下味Aで下味をつける。\\r\\n2　ゴーヤーは流水の下でたわしでこすり洗いし、水気を切る。筒状のままスプーンで種・ワタを除き、暑さ2〜3mmの輪切り。水菜は根元を除き長さ4cmに切る。\\r\\n3　グリーンリーフは食べやすい大きさにちぎり、水にさらし水気を切る。黄ズッキーニは暑さ2〜3mmの輪切り。\\r\\n4　160度くらいの油にゴーヤを入れ徐々に温度を上げながら、色良く揚げる。6分くらい。パットに取り出し油を切る。\\r\\n5　片栗粉大さじ4〜をまぶした豚肉を広げながら170度位の油に入れ、温度を上げながらカリッとするまで揚げる。5分〜。パットに取り出し油を切る。\\r\\n6　皿に水菜・グリーンリーフ・黄ズッキーニ・ゴーヤ・豚肉を盛り付け、ドレッシング(1人小さじ1)をかける。\\r\\n＊市販ドレッシング　キューピーテイスティドレッシング黒酢玉ねぎ	3	32	0	1	2	\N	M041j3lVI8wa5dHFR5rnTKJHgb6gnAzIBynjbilz.jpg	\N	0	1	0	0	0	2021-11-09 21:23:09	2021-12-07 15:05:07
138	1	みたらし団子	1　ボウルに白玉粉60g・砂糖小さじ2を入れざっと混ぜ、調製豆乳40ccを少しずつ加え、耳たぶくらいの硬さにする。(水分が足りない場合は水小さじ1~を加えて調整。)\\r\\n2　8等分にし、丸める。\\r\\n3　たっぷりの熱湯に入れ、浮いてきてから4分位茹で水に取る。\\r\\n4　鍋にタレの材料Aを入れよく混ぜ、混ぜながら加熱し、とろみをつける。沸騰後30秒くらい。\\r\\n5　粗熱を取り、器に分け入れる。	6	32	0	1	3	\N	ZMM8fKLFKyKw14V5K86GV3au4N8RKq0oSJK1LLyL.jpg	\N	1	1	1	0	0	2021-11-09 21:29:12	2021-12-07 15:06:02
157	1	かぼちゃのみそ汁	1 かぼちゃは種・ワタを除き、1.5cm角に切る。鍋に水480~530cc・しょうゆこうじ小さじ2・かぼちゃを入れカボチャが柔らかくなるまで加熱する。(沸騰後弱火5分~)。\\r\\n2 火が通ったら、火を弱めみそを溶き入れる。椀に注ぎ入れる。	2	37	0	\N	\N	\N	h5R3QwC2sSq4WWBqWkCqbjvhbyYWrDGLql9mIkIS.jpg	cJDXf0NQ004MY0e4e03jhC2lzm6eElIjscK3Fxl6.jpg	0	0	1	0	0	2021-11-10 02:38:24	2021-11-28 11:34:44
139	1	鯵フライ	1　天ぷら粉大さじ4と水50cc~を合わせて練り粉を作る。鯵を立て塩の中にさっとくぐらせ包丁をぬらす。\\r\\n2　両側のセイゴを取り除く。尾から頭に向かってうろこをこそげおとす。\\r\\n3　胸ビレを立てて、やや斜めに頭を落とす。内臓をかき出し、腹の中を拭く。\\r\\n4　立て塩の中で洗う。水気をしっかりと拭く、ここまでが魚の水洗い。\\r\\n5　背側から中骨に向かって包丁をあて丁寧に開く。\\r\\n6　背側から中骨に向かって包丁を入れ中骨を取る。\\r\\n7　包丁またはキッチンバサミで尻ビレと硬い部分を切り取る。\\r\\n8　包丁を寝かし、先端の部分で　腹骨をそぎ取る。塩小さじ1/8をふり10分おく。\\r\\n9　水分をペーパーで押さえ、身の面全体にマスタード小さじ4を塗る。\\r\\n10　鯵に塗り粉をつける。パン粉を押さえるようにし、しっかりとつける。\\r\\n11　170〜180度の油で揚げる、3 分くらい。パットに取り出し油を切る。\\r\\n12　皿に水菜・トマトを盛り付け、ドレッシング(1人小さじ1)をかける。アジフライを盛り付け、ウスターソース・タルタルソース各小さじ1/2(1人分)を添える。	1	33	0	1	1	\N	MZchmxNepx4ylccxDFih7TLBWveVHXTsMY82DXL6.jpg	iZ5uDZiCOLSUZfznFeRpWSEP2aiOHjeg3IPcP1tu.jpg	0	1	1	0	0	2021-11-09 21:40:19	2021-12-07 15:07:09
140	1	手羽中と大根のスピード煮物	1　鶏手羽中は余分な水分を除く。\\r\\n2　大根は皮をむき、厚さ2cmの半月切り。\\r\\n3　圧力鍋に鶏手羽中・大根・だしAを入れフタをし強めの中火にかける。\\r\\n4　安全ロックピンが上がり蒸気が出てきたら弱火にして、加圧する、5分。\\r\\n5　安全ロックピンが下がったら、フタを開け、黒豆を加えひと混ぜする。\\r\\n6　器に盛り付ける。	5	33	1	1	1	\N	vQia8t1ZLsyHBQwr7hIYrXe7NOH4QO6Kfja5k5MN.jpg	OJPF1vio942pmwPuu9t88PAP6tcFwI3J73G6Atw1.jpg	1	1	1	0	0	2021-11-09 21:47:14	2021-12-07 15:07:49
141	1	大根のみそ汁	1　大根は皮をむき、長さ7〜8mmのいちょう切り。水菜は根元を除き長さ4cmに切る。\\r\\n2　鍋に大根・水520~560cc・和風だしの素小さじ1/2を入れ加熱。大根が柔らかくなったら水菜を入れてさっと火を通す。\\r\\n3　火を止め味噌小さじ4前後を加え、一混ぜする。椀に分け入れる。	2	33	0	1	2	\N	nGpqSorjhiVN4hAhmQsDqSo0x6NmcxKtntrLUKbc.jpg	\N	1	1	1	0	0	2021-11-09 21:51:06	2021-12-07 15:08:26
142	1	季節の水菓子	1　ぶどうは皮付きのまま洗い、水気を切る。皿に盛り付ける。\\r\\n2　りんごは塩少々でこすり洗いし、放射状に4等分に切り、芯を除いて皮をむき、半分に切る。\\r\\n3　水にさっと通し水気を切る。皿に盛り付ける。	6	33	0	\N	\N	\N	Eolesp2yaDWKKJbOzkjgBoQDNs5RbhcLRLfysjvU.jpg	\N	0	0	0	0	0	2021-11-09 21:53:19	2021-11-27 08:19:12
143	1	海老コーン天むす/カラフルチキンボール/ふわふわハムたまチーズ	1　海老つけだれA(だし醤油・水各大さじ1)を耐熱容器に入れ、ラップをせずに電子レンジで加熱する。(600w30秒)焼きのりは短い方をいかして8等分に切る。\\r\\n2　ボウルにむき海老・コーン・天ぷら粉大さじ4を入れ、からめる。水50cc前後を加え混ぜる。\\r\\n3　170度の油に1/8量ずつ入れ、あげる(1分〜）たれAにさっとくぐらせ、あみをのせたバットに取り出す。\\r\\n4　ボウルにご飯・塩小さじ1/8を入れ切り混ぜる。ラップにご飯を1/8量のせてくぼみを作り、海老コーン天をのせ、半分見えるように三角形に握る。\\r\\n 　 残りも同様に作る。\\r\\n5　手前に交差させるように焼き海苔を巻く。盛り付ける。\\r\\n\\r\\n1　ビニール袋に鶏ひき肉・チキンボール用Bを入れてよく混ぜ、8等分する。\\r\\n2　ボウルにぶぶあられ40gを入れ、6を加えぶぶあられを全体にまぶす。手のひらで優しく転がし、丸く形を整える。160度の油に入れる。\\r\\n3　火がとおるまで揚げる。4分〜。バットに取り出し油を切る。竹串に2個ずつさす。\\r\\n\\r\\n1　卵1個は良く溶きほぐし、卵液用Cを加え、混ぜ合わせる。はんぺんは厚みを半分に切る。ロースハムは半分に切る。\\r\\n2　青じそは軸を除く。スライスチーズは半分に折る。はんぺん1枚の上にロースハム・青じそ・スライスチーズをのせ、残りのはんぺんで包む。\\r\\n3　卵焼き器にサラダ油小さじ1/2を熱してなじませ、卵液を入れる。具をのせたはんぺんを半分より奥におく。\\r\\n4　周囲の卵液をよせ、はんぺんを手前に返し形を整え、ラップで包み、形を落ち着かせる。4等分に切る。盛り付ける。	4	34	0	1	1	\N	lvO9k2IsmHfdiaSX0ageEqBJniS3MFp1goJJ8ZXR.jpg	CJ3HJBoXyFt6rQaf8VgfhofZOjNlRLnZL2Iido6M.jpg	0	1	0	0	0	2021-11-09 23:27:45	2021-12-07 15:09:58
144	1	ズッキーニの焼きナムル	1　ズッキーニは厚さ2mmの輪切り。フライパンにごま油小さじ1を熱し、ズッキーニを入れ焼き色がつき、しんなりとするまで炒める。\\r\\n2　味付け用に、きざみにんにく小さじ1/2・塩小さじ1/8を入れ、さっと炒める。盛り付ける。	8	34	0	1	2	\N	mOmKKTepPKPTTBfDaGRruBiaWzQkHsl7G08c31rA.jpg	1AYBMy3yFA99MVimfu2kYB0RpYiPsdl5KntW7InQ.jpg	1	1	1	0	0	2021-11-09 23:36:42	2021-12-07 15:10:44
145	1	きのこのレモンソテー	1　椎茸4枚は石づきを除いて軸を外し、かさは厚さ8mmに切り、軸は半分にさく。しめじ80gは石づきを除き、小房に分ける。\\r\\n　 フライパンにごま油小さじ1を熱し上記を入れ焼く。\\r\\n2　焼き色がついたら裏返して焼き、全体に焼き色をつける。味付けにポン酢じょうゆ大さじ1・レモン1/2個分(塩少々でこすり洗いしたものを、厚さ2~3mmのいちょう切りに薄くスライスしたもの)を加え汁気を飛ばすように炒める。盛り付ける。	8	34	0	1	2	\N	1PoriC8Z0XxaV0UWu5ovBT6F9oSeReK3MYY5BOvJ.jpg	rJNN9cCODwOQ8ZNCp7HP0UBscZAMWI7rXfA4NlTp.jpg	1	1	1	0	0	2021-11-09 23:44:34	2021-12-07 15:11:14
146	1	紅芯大根の甘酢漬け	1　紅芯大根は皮をむき厚さ2〜3mmのいちょう切りにし、塩小さじ1/8をまぶしてなじませる。10分くらい。\\r\\n紅芯大根の水気を絞る。調味酢小さじ4を加え、5分ほどつける。汁気をしっかりと除き、グリーンリーフとともに盛り付ける。	8	34	0	1	2	\N	1qbFwpyIK8ZGQd6ZPAvlakV4kwKNg15iVdP1Uw0C.jpg	yfDW6vPrFAxuCFAPZkOQtgBWASSbuoghlIKkAB4Q.jpg	1	0	1	0	0	2021-11-09 23:47:23	2021-12-07 15:11:45
147	1	ブルーベリー大福	1　羊羹は長さを半分に切って折り、ひと塊にする。\\r\\n2　耐熱ボウルに白玉粉用Aを入れて混ぜ、水を少しずつ加える。。ダマが残らないように溶きのばす。ブルーベリージャム小さじ4を加え混ぜる。\\r\\n3　ラップをふんわりとかけ、電子レンジで加熱する。600w1分〜。一部ぷくっと半透明の餅状になったら全体を混ぜる。\\r\\n4　再度ラップをふんわりとかけ、電子レンジで加熱する。600w1分〜。全体に透明感があり、均一なもち状になったら、全体を混ぜる。\\r\\n5　バットに大さじ1の半量の片栗粉をふるい4を移す。残りの片栗粉をふるい、触れる温度になったら均一な厚みになるよう広げ、(12cm×10cm)、粗熱を取り4等分にする。\\r\\n6　5を軽く広げ、中央に羊羹をのせて丸く包む。クッキングシートで包み盛り付ける。	6	34	3	1	3	\N	yQynRmoJrB68z6eag6ThnwvfzrlDOsMwzK1uqFTu.jpg	\N	1	1	1	0	0	2021-11-09 23:53:38	2021-12-07 15:12:35
151	1	さつま芋のモンブラン	1　さつま芋は皮付きのままよく洗い、厚さ7〜8mmの輪切りを4枚とり(土台用)、残りは皮を厚めに向き、\\r\\n　　輪切り(芋クリーム用)・水にさらし水気を切る。\\r\\n2　鍋に湯を張り(ざるが浸からない程度)沸騰させる。火を止めクッキングシートを敷いたザルを入れ、\\r\\n　  さつま芋を並べてフタをし、強火で蒸す。火通りを確認し取り出す。\\r\\n3　皮付きの4枚はボウルに入れ、ラム酒小さじ1・砂糖小さじ2を振りかける。土台用です。残りのさつま芋は温かいうちに裏漉し。\\r\\n4　裏ごししたさつま芋に砂糖小さじ2~4を加え、均一に混ぜる。完全に冷めたら冷たい生クリーム(芋クリーム用)40gを3〜4回に分けて入れ、均一に混ぜる。絞り袋に入れる。\\r\\n5　皿にさつま芋を1枚のせ、＊ホイップクリームを1/4量のせる。しぼり袋の先を5〜7mm切る。\\r\\n6　5の上に絞る。ココアパウダー(4人で小さじ1/2)をふるう。\\r\\n\\r\\n＊　ホイップクリームの準備 : 生クリーム(土台用)40gは、砂糖小さじ1/2を加え、8分立てにしておく。	6	35	0	\N	\N	\N	gE0CoH1FbbWFhAFBhm1gO8Jff8Re2bjpqwisstdP.jpg	\N	0	1	0	0	0	2021-11-10 00:41:25	2021-11-27 08:23:00
152	1	サクサクとろーり五目おこげ	1 ボイルほたて・むき海老は塩・白こしょう各少々で下味をつける。豚バラ薄切り肉は幅4cmに切り、塩・白こしょう各少々で下味をつける。\\r\\n2 赤・黄パプリカはヘタ種を除き、乱切りに(1人各2切れ)。チンゲン菜1株(100g位)は根元を除き、茎は2×4cm位、葉はザク切りにし、茎葉に分ける。\\r\\n3 鍋にサラダ油小さじ1を熱し、ボイルほたて・むき海老を入れ焼く。焼けたものからバットに取り出す。\\r\\n4 同じ鍋にサラダ油小さじ1を足し、豚肉・きざみしょうが小さじ2を入れ、色が変わるまで炒める。(強火)\\r\\n5 赤・黄パプリカ・青梗菜の茎・きくらげ4gを加え、全体に油がなじむまで炒める。合わせ調味料aを加えひと煮立ちさせる。\\r\\n6 チンゲン菜の葉・3を加え、もうひと煮立ちさせる。\\r\\n7 水溶き片栗粉(片栗粉小さじ4を水小さじ8で溶く)を加えて混ぜ、とろみをつける。火を止めごま油小さじ1を加え、一混ぜする。\\r\\n8 おこげを割る。200度の油におこげをいれ揚げる。(30秒~ 1度に6枚まで。)バットに取り出し油を切る。\\r\\n9 器に7を分け入れる。お好みで酢をかける。1人小さじ1/2。別の器におこげを盛り付ける。\\r\\n\\r\\n\\r\\n\\r\\n＊乾燥おこげ : 4枚(14 × 5cm・140g位)	4	36	0	\N	\N	\N	sp7FhQ4bqb6T3Q9sAgcyI9iPUAWgKmNWUFkOJ5zC.jpg	LQKDpsfvdK8xyY90R9Cv7hKIoTgELwzdTuf3rfPK.jpg	0	0	0	0	0	2021-11-10 01:26:37	2021-11-28 11:29:15
153	1	海老チリ春巻き	1 むき海老は背ワタがあれば除いて洗い、水気を除く。塩・白胡椒各少々で下味をつける。耐熱皿に味付け用aを入れ混ぜる。\\r\\n2 むき海老を加えて混ぜ、ラップをふんわりとかけ、電子レンジで加熱する。(600w 2分30秒~)。取り出し全体を混ぜる。バットに取り出し広げて冷ます。\\r\\n3 卵はよく解きほぐし、塩少々を加えて混ぜる。フライパンにサラダ油小さじ1を熱し卵を入れて混ぜながら加熱し、裏返して全体に火を通す。バットに取り出し広げて冷ます。\\r\\n4 皮のざらざらしている面(裏)を上にして、斜めに置く。中央よりやや手前に、2・3を横長に載せる。手前の皮を折り、縁全体に＊のりを手早く塗る。左右の皮を折り畳む。(長さ12cm位)。\\r\\n5 空気が入らないようにして巻いていく。巻き終わりを下にしておく(乾燥しないようにラップをかける)。170~180度の油に巻き終わりを下にして入れ、きつね色になるまで揚げる。2分~\\r\\n6 バットに取り出し、立てかけるようにして油を切る。皿に盛り付ける。\\r\\n\\r\\n\\r\\n＊ のり : 薄力粉小さじ2と水こさじ1~を混ぜてのりを作っておく。	9	36	0	\N	\N	\N	jkyy5iFGAiiZAVLeoWhuWyhcBEoJ4w5BWXZlfjSJ.jpg	\N	0	0	0	0	0	2021-11-10 01:41:43	2021-11-27 08:23:53
154	1	わかめとザーサイの和え物	1 きゅうりは厚さ5mmの輪切り。ボウルに入れて塩小さじ1/8をし、10分くらい全体になじませる。水分が出てきたら、手で揉み水気を絞る。\\r\\n2 わかめは水で戻し(5分位・戻し時間はパッケージ参照)、水気を切る。味付きザーサイは千切り。\\r\\n3 ボウルにきゅうり・わかめ・ザーサイを入れ、ごま油小さじ1を加えてよく和える。皿に盛り付ける。	8	36	0	\N	\N	\N	kHSm2tnGRRBLEfybrcNGP1JXu3ONRlNp2i9Q08ky.jpg	\N	1	0	1	0	0	2021-11-10 01:47:54	2021-11-27 08:24:18
155	1	レモンティーゼリー	1 レモンは塩少々でこすり洗いし、薄めのいちょう切り。カップに入れ、はちみつ小さじ2を加えてマリネする。10分位~\\r\\n2 粉ゼラチン小さじ2は、50~60度の湯40ccに振り入れ溶かす。\\r\\n3 ボウルにストレートティー160cc・はちみつ小さじ4を入れ良く溶かす。\\r\\n4 溶かしたゼラチンを加え、よく混ぜる。\\r\\n5 器に分け入れ、冷蔵庫で冷やし固める。\\r\\n6 最後に5に1をかける。	6	36	0	\N	\N	\N	80eF10wdBcMISddcupftfv20aC3vJwmZyGGGlHjA.jpg	\N	0	1	0	0	0	2021-11-10 01:54:54	2021-11-27 08:24:40
156	1	デミグラス煮込みチーズハンバーグ	1 玉ねぎ(ハンバーグ用)160gは根元を除き、ザク切りにし、チョッパーで細かいみじん切り。玉ねぎ80g(ソース用)は根元を除き繊維に沿った薄切り。\\r\\n2 しめじは石づきを除き、小房に分ける。まいたけは根元を除き、小房に分ける。ボウルに合い挽き肉・合わせ調味料aを入れ、粘りが出るまでよくこねる。\\r\\n3 玉ねぎ・湿らせたパン粉(パン粉大さじ4に甘酒40ccを加え湿らせておく)・卵を加え、均一になるまでさらにこねる。4等分にして空気抜きをし、直径12cmくらいの小判形に整え、中央を少し凹ませる。\\r\\n4 フライパンにサラダ油小さじ1を熱し、ハンバーグを入れ、両面を焼き固める(強火)。火を止め酒大さじ2を加えてアルコール分を飛ばしながら、鍋底をこそげ落とす。\\r\\n5 別の鍋にサラダ油小さじ1を熱し、ソース用玉ねぎを入れ、しんなりとするまで炒める。しめじ・まいたけを加えてさっと炒める。\\r\\n6 味付け用bを加えて混ぜ加熱する。(中火)。4に加え、蓋をし加熱(沸騰後弱火 10分~)\\r\\n7 蓋を取り、ソースにとろみがつくまで煮詰める。(中~強火)。味見をして、塩こしょう各少々で味を整え、火を止める。\\r\\n8 ハンバーグにスライスチーズをのせる。蓋をして余熱で溶かす。器に盛り付けパセリを振る。	5	37	0	\N	\N	\N	rduBvd0iCYTg6FIVx4bLWWk1giBRrX8kbeJe3Z2B.jpg	wqKZVPcmsuVh5WBBjeU8J8mNUNkzSVGxBXARmSjG.jpg	0	1	0	0	0	2021-11-10 02:15:47	2021-11-28 11:33:40
159	1	カスタードアップルパイ	1 冷凍パイシートは使用する5分くらい前に室温に戻し、フォークで数カ所穴を開け4等分に切る。\\r\\n2 りんごは塩少々でこすり洗いし、4等分のくし形切りにして皮付きのまま芯を除く。繊維にそってさらに3~4等分の薄切り。\\r\\n3 ボウルにカスタードクリームパウダー小さじ4・甘酒大さじ2を入れ混ぜる。\\r\\n4 クッキングシートを敷いた天板にのせ、冷凍パイシートの左右7mmくらい内側に3を乗せ広げる。\\r\\n5 りんごを斜めにバランスよく重ねて並べる。オーブンで焼く。(電気230度15分~・ガス220度15分~)\\r\\n6 粗熱を取る。りんごジャムのこしを切り、りんごの表面に塗る。皿に盛り付ける。	6	37	0	\N	\N	\N	1np0ZRFHVOVorL5FbuUswHKAQ6UKyzrs6v99k48J.jpg	\N	0	0	0	0	0	2021-11-10 02:58:58	2021-11-27 08:26:29
160	1	チキンとかぼちゃのガーリッククリームシチュー~シュクメルリ~	1 鶏ももは余分な水気・脂肪を除き、一口大に切り、塩小さじ1/4・黒こしょう少々で下味をつける、(1人4切れ)。にんにくは皮・芯を除き潰す。\\r\\n2 カボチャは種・ワタを除き、4cm角くらいに切る。片栗粉小さじ2・水小さじ4は合わせる。(水溶き片栗粉)\\r\\n3 鍋ににんにく・サラダ油小さじ1を入れ加熱する。(弱火)。香りがしてきたら火を強め、鶏肉を皮面を下にして加え焼く。香ばしい焼き色がついたら、脂を除き、裏返して肉の面も焼く。\\r\\n4 や黄色がついてきたらかぼちゃも加え、炒め合わせる。余分な脂を除き、火を止め酒を加えて、アルコール分を飛ばし蓋をして火を弱め、蒸し焼きにする。5分~。\\r\\n5 かぼちゃに火が通ったら、牛乳320cc・コンソメ小さじ1を加え弱火で煮る。沸々と沸騰してきたら味見をし、塩小さじ1/8・黒こしょう少々で味を整える。\\r\\n6 水溶き片栗粉(片栗粉小さじ2＋水小さじ4)を加え、全て入った火を強め、粉に火を通す。30秒~。皿に彩り良く盛り付けパセリをふる。	2	38	0	\N	\N	\N	XJ0V14w8gEP9DbXHf6HCGuwEh58zbURNbMJLju2Z.jpg	\N	0	0	0	0	0	2021-11-10 03:14:36	2021-11-27 08:56:53
161	1	とろーり卵のチーズブレッド~ハチャプリ~ハロウィンサラダ	1 耐熱容器にイカ墨ソース60g・片栗粉小さじ1/2を入れよく混ぜ合わせ電子レンジで加熱する。(600w 1分~・ソース)ボウルに強力粉を計量し他の材料aを入れる。\\r\\n2 ボウルの中のイーストめがけて牛乳180ccを加え、しっかりと全体を混ぜる。全体がひとかたまりになってきたら、サラダ油大さじ1を加え、粉っぽさがなくなるまで混ぜる。水分が足りない場合は適宜水を加える。小さじ1前後。\\r\\n3 台の上に取り出しムラがなくなるまでこね、丸めてボウルに入れ、ラップをかける。大きめのボウルに42~43度の湯を張り、浮かべてラップをし、ふきんをかけて発酵させる。30分~。\\r\\n4 1.5~2倍近くまで大きくなったら、台の上に取り出して4分割し、軽く丸め直す。打ち粉(強力粉小さじ2)を全体にまぶし、閉じ目を上にし12cmくらいの円形にのばす。\\r\\n5 中心に向かった上下から数回生地を折り、両端の3~4cmをしっかりと閉じる。ソースをのせる部分を3~4cmひろげ、クッキングシートを敷いた天板にのせる。\\r\\n6 広げた部分にソースを広げる。ラップをかけて発酵させる。オーブン発酵40度15分~。\\r\\n7 室温に取り出し、そのまま室温発酵。オーブン予熱。電気230度12~15分。ガス220度8~10分。ピザ用チーズを1/4 量ずつのせる。\\r\\n8 オーブンで焼く。(電気230度12~15分。ガス220度8~10分)。残り2分で取り出し、溶けたチーズの上に卵黄をのせる。もう一度オーブンで焼き皿に盛り付ける。\\r\\n\\r\\n9 ムースフィルムのシールをはがし、つなげる。かぼちゃは種・ワタを除き薄切り。(1人2枚)\\r\\n10 フライパンにサラダ油小さじ1を熱し、かぼちゃを並べて焼く。焼けたものから取り出し粗熱を取る。\\r\\n11 スライスチーズは半分に切り、ムースフィルムを使って、お好みの形に切り抜く。竹串を使い、ソース（イカ墨の)で目・鼻・口を描く。\\r\\n12 皿にグリーンリーフ・トレビス・かぼちゃ・チーズおばけを彩りよく盛り付け。ドレッシングをかける(1人小さじ1)。	9	38	2	\N	\N	\N	pW8EuKiiPXHHPIjhmJewFh5A4FgWMdULTiJrLTzT.jpg	COT4zQem2eoSFeOptLgAwOC3ohwJ3SdlcsuPXHn9.jpg	0	0	0	0	0	2021-11-10 03:43:33	2021-11-28 11:39:50
162	1	ウフアラネージュ	1 器に少々の水を入れ、全体をぬらす。ボウルに卵白を入れ(4個分)泡立てる。\\r\\n2 少し泡立ってきたら、砂糖を2~3回に分けて加え、しっかりと角が立つくらいまで泡立てる。4等分にする。\\r\\n3 器に入れゴムベラでしっかりと押さえつける。1人ずつ電子レンジで加熱する。600w15~25秒。\\r\\n4 器のふちからはみ出るくらいに盛り上がってきたら、皿に取り出し粗熱を取る。\\r\\n5 鍋にラズベリージャム60g・水40ccを入れて加熱し、軽く煮詰める。とろみがついてきたら粗熱を取る。\\r\\n6 メレンゲの上に5・チョコレートシロップをかける。(4人で20g)。	6	38	0	\N	\N	\N	wECrfs6fwdVIoqTRH1SO5MgjyoyqmzFC4VsesLqv.jpg	\N	0	0	0	0	0	2021-11-10 03:51:04	2021-11-27 08:28:37
163	1	カレーパン	1　玉ねぎ・にんじん・にんにく・しょうがはそれぞれみじん切りにする。\\r\\n2　フライパンにサラダ油をひいて、挽肉を炒める。火が通ってきたらニンニクと生姜を入れ、香りが出たら玉ねぎとにんじんも加えて炒める。\\r\\n3　2にカレー粉小さじ2を入れて軽く炒めたら水を加えて10分ほど煮込み、汁気が少し残る程度になったら火を止めて、刻んだ市販のカレールー(40g)を混ぜる。カレールーが溶けたら、再び火をつけ、軽く炒めたら容器に入れて覚まし、4等分にする。\\r\\n4　ボールにぬるま湯(40度・80cc)・砂糖・ドライイーストを合わせ混ぜ、そのまま5分ほどおく。\\r\\n5　ボウルに強力粉と塩2gを合わせ混ぜてから4・溶き卵・溶かしバターを加えゴムベラで混ぜる。まとまってきたらボウルから出して取り出して滑らかになるまでこねる。\\r\\n6　5をボウルに入れてラップをし、40度で30~40分ほど発酵させる。(1次発酵)。2倍程度に膨れたら、ガス抜きをして4等分にして丸め、ラップを被せてそのまま10分休ませる。(ベンチタイム)。\\r\\n7　6を麺棒で15 × 12cmの楕円形に伸ばし、3をのせてつつむ。硬く絞った濡れ布巾を被せ、40度で20分ほど発酵させる。(2次発酵)。\\r\\n8　7の表面にはけで溶き卵(生地塗り用)を塗ってパン粉をつけ、170度の油で3~4分揚げる。(片面ずつ1分半~2分)。	9	45	0	\N	\N	\N	BQmMSHzPd26soFaWAa4fnhue5hFHPfMmCAz7hDBV.jpg	\N	0	1	0	0	0	2021-11-10 08:16:11	2021-11-28 12:10:39
164	1	アジのたたき	1　アジを下処理し、3枚におろす。全ての骨を取り除いて皮を剥ぎ、5mm幅の細切りにする。\\r\\n2　小ネギは小口切りにし、生姜は皮を剥いておろす。\\r\\n3　まな板の上に1と2を一緒にして混ぜる。包丁で軽く叩いて大葉を敷いた器に盛り付ける。	1	46	0	\N	\N	\N	81zmsNokxw5z1rzTZ8o9iMDrB0uhr1HYeb3cGCP0.jpg	\N	1	0	1	0	0	2021-11-10 08:23:20	2021-11-28 12:11:14
165	1	はまぐりの潮汁	1　はまぐりは流水で殻どうしを擦りながら洗う。\\r\\n2　鍋に1・昆布1~2枚・水3カップ・酒50ccを入れて弱火~中火にかけ、アクが出たらアクを取る。\\r\\n3　殻が全て開いたら、はまぐりを取り出し、塩少々とうま味調味料で味をつける。\\r\\n4　器にはまぐりを入れ、吸い地を張り、きざんだ三つ葉を入れる。\\r\\n\\r\\n＊　三つ葉の代わりにカイワレ菜を使っても良い。具に花麩を入れても良い。	1	47	0	\N	\N	\N	\N	\N	0	0	0	0	0	2021-11-10 10:00:56	2021-11-10 10:00:56
166	1	茶碗蒸し	1　鍋に和風だし2カップ・醤油・みりん各小さじ1・塩小さじ1/4~1/3を入れひと煮立ちさせる。冷めたらシッカリと溶いた卵を入れ、裏漉しでこす。\\r\\n2　むき海老と2cm程度に切った鶏肉はそれぞれ醤油少々と合わせ、下味をつけておく。椎茸はスライスする。\\r\\n3　茶碗に2の具を入れて、1の卵液を注ぐ。\\r\\n4　沸騰した蒸し器に3を入れ、強火で1~2分蒸してから、弱火で12~15分蒸す。\\r\\n\\r\\n＊　具は他にかまぼこ・鮭・白身魚・ぎんなんなどを入れても良い。蒸しあがり後に刻んだ三つ葉をのせても良い。	9	48	0	\N	\N	\N	0serSM4Kx1YOfYL7fO9gmSitibRyzmi5GTRyEYi1.jpg	\N	0	0	1	0	0	2021-11-10 10:17:17	2021-11-28 12:13:05
167	1	あおさ汁	1　あおさ5~6gはさっと水洗いし、水気を切っておく。豆腐は1cm角のさいの目に切る。\\r\\n2　鍋に和風だし4カップを入れて火にかけ、沸いたらしょうゆ大さじ1(目安)・塩少々で味をつける。1を加えてひと煮立ちさせたら、しょうが汁(好みで少々)を少したらして器に盛る。	2	49	0	\N	\N	\N	\N	\N	0	0	1	0	0	2021-11-10 10:56:34	2021-11-11 07:13:52
168	1	アスパラと海老の塩ソース蒸し	2人分での記載\\r\\n\\r\\n1　アスパラガスは根元の硬い部分の皮をピーラーで剥き、長さ4cmの斜め切りにする。これをスチーマーに入れ、水1カップと塩少々を加える。フタをして電子レンジに3分30秒かける。取り出して水を捨てる。\\r\\n2　海老は背ワタを取り、片栗粉小さじ1をまぶして手で揉み、汚れと臭みをとる。それを軽く水洗いし、水気を切る。ボウルに入れて下味の調味料Aを加え、からめておく。\\r\\n3　2の海老を1のスチーマーに加え、フタをして電子レンジに3分かける。\\r\\n4　取り出して調味料Aを加え、混ぜ合わせる。再びフタをして電子レンジに2分30秒かける。	1	50	0	\N	\N	\N	\N	\N	0	0	0	0	0	2021-11-10 11:11:18	2021-11-10 11:11:18
169	1	鶏肉のトマト煮込み(カチャトゥーラ)	1　鶏もも肉は12切れにカットし、(1切れ40g程度)塩こしょう各少々する。玉ねぎとにんにくはみじん切りにする。\\r\\n2　鍋にオリーブ油適量(多めに)をひいて肉を炒める。肉に軽く焼き色がついたらにんにくを加え、香りが出たら玉ねぎも加えて、透明感が出るまで炒める。\\r\\n3　2にトマトの水煮400g・赤ワイン50cc・ローリエ・オリーブ水煮・コンソメの素大さじ1・砂糖小さじ1~2・水1カップを入れて軽く塩こしょうを少々する。フタをして沸いたら弱火にし、時折混ぜながら40分以上煮込む。\\r\\n4　3にバター20gを加えて溶かし混ぜ、必要に応じて塩こしょうをし、器に盛る。上から生クリームを適量回しかけて刻んだパセリを振る。	5	51	0	2	1	\N	yOmsIz3QIpQvEBepNzK65RmOHUNaxTrA4FRas03p.jpg	\N	0	0	0	0	0	2021-11-10 11:30:36	2021-12-13 13:17:14
170	1	シジミの中華スープ	1　しじみは砂抜きをしたら殻と殻を擦り合わせ流水で洗う。\\r\\n2　長ネギ5cmは縦に切り込みを入れて、外側の薄い皮と内側の部分に分ける。外側のねぎは繊維に沿って細かく千切りにし、しばらく水につけて水気を切る。(白髪ねぎです)。内側のネギは小口切りにする。小ネギも小口切りにする。(適量)\\r\\n3　鍋にごま油少々を引いて、生姜とにんにくを炒める。香りが出たら、しじみを加えてさらに炒め、殻が開き出したら、中華だし4カップを注ぐ。\\r\\n4　3のしじみが全て開いたら、しょうゆ・塩・こしょう少々で味付けをし、小口切りした長ネギを入れラー油適量を垂らしてひと煮立ちさせる。\\r\\n5　4を器に盛り付け、白髪ねぎ・小ネギ・糸唐辛子をトッピングする。	2	52	0	\N	\N	\N	\N	\N	0	0	0	0	0	2021-11-10 11:49:14	2021-11-10 11:49:14
171	1	牡蠣とほうれん草のレモンクリームパスタ	1　牡蠣150gは水洗いして熱湯でさっと湯通しし、冷水に落とす。水気をしっかりと拭き取り、塩少々こしょう少々して小麦粉を適量まぶす。\\r\\n2　ほうれん草は熱湯から塩茹でし、水に落としてから水気を搾る。ベーコン2枚は1cm幅に切る。\\r\\n3　レモン1/2個は黄色の皮の部分(2cm × 5cm程度の面積)を薄く削いでから千切りにし、果肉は絞っておく。\\r\\n4　フライパンにオリーブオイルを引き、ベーコンとスライスにしたにんにくを炒める。にんにくの香りが出たら、バターと牡蠣を加えてさらに炒める。\\r\\n5　4に水100cc、生クリーム100cc、粉チーズ大さじ2、コンソメの素大さじ1/2、千切りにしたレモンの皮を加えてひと煮立ちさせる。\\r\\n6　5に茹でたパスタを入れて塩こしょう少々で味を整える。最後に搾ったレモン汁(目安は小さじ2)を加えて手早く混ぜて器に盛る。	4	52	0	\N	\N	\N	kW8Fc9vXSfEe7PYoZ6JYCQlTRq6GBOcJx90oxYDF.jpg	\N	1	0	0	0	0	2021-11-10 20:53:36	2021-11-28 11:46:09
172	1	ふんわりやわらか!簡単海老チリ	1　海老の殻を剥き、お腹の真ん中くらいの位置で殻の下に親指を入れて、頭側の殻を剥き鶏、尻尾側は尻尾の付け根を親指と人差し指でぐっと挾んで殻と身を離す。\\r\\n2　海老の背中に浅く包丁を入れ、片栗粉大さじ1と塩ひとつまみをまぶして、水少々を加えてもんだ後、水を加えて背ワタを洗う。\\r\\n3　よく水洗いした海老の水分を拭き、酒大さじ1と片栗粉少々を混ぜておく。\\r\\n4　長ねぎ・にんにく1片・生姜1片を全てみじん切りにする。\\r\\n5　沸騰したお湯で3の海老を軽く茹でて、ザルにあげる。\\r\\n6　フライパンにサラダ油大さじ2とAを熱し、Bも加えて弱火で炒める。\\r\\n7　Cを加えて中火で煮立て、5と砂糖大さじ1/2も加え、火を止めて水溶き片栗粉少々をとく。\\r\\n8　再度弱火で加熱し、とろみがついたところでネギのみじん切りと酢小さじ1を混ぜて、最後にごま油小さじ1を回しかけて完成。	1	39	0	\N	\N	\N	mFtKzQdBYP2LkwjZElfwMY0JlffclZAaxU6MWhpR.jpg	\N	0	1	0	0	0	2021-11-10 21:18:59	2021-11-27 08:35:46
173	1	ジューシー鶏の唐揚げ	２人前\\r\\n\\r\\n1　取りもも肉を一口大に切る。\\r\\n2　袋に入れ調味料Aで下味をつける。\\r\\n3　水分がなじんだらマヨネーズを加える。マヨネーズ大さじ2\\r\\n4　15分~30分つけおく。\\r\\n5　衣を作る。片栗粉30g・小麦粉20g\\r\\n6　サラダ油を鍋に入れて170度に温める。菜箸を油の中に入れて箸全体から小さめの泡が出てくると170度前後の目安です。茶色く焼き色がつくまで上げたら一旦取り出して、3分ほどバットの上で休ませる。\\r\\n7　油の温度を190度まであげる。箸全体から大きめの泡が勢いよく上がってくれば190度の目安です。\\r\\n8　2度目を揚げたら完成。	5	40	0	\N	\N	\N	afGL0fH96Z2qEpeD5i4tcgJzq1ypXdUBlSs0QTif.jpg	\N	0	1	0	0	0	2021-11-11 01:07:38	2021-11-27 08:34:21
175	1	レンジで!もやしと豆苗の豚巻きレンジ蒸し	2人前\\r\\n\\r\\n1　豆苗は根元を切り落とす。\\r\\n2　豚バラ肉にもやしと1をのせ、塩こしょう少々をふり、手前から巻く。\\r\\n3　耐熱皿にのせて、ふんわりトラップをかけ、600wの電子レンジで5分、豚バラ肉に火が通るまで加熱する。\\r\\n4　Aを混ぜ合わせる。\\r\\n5　ラップを外し4をかけて完成。	1	41	3	\N	\N	\N	VxynNMuZHYxAgipFwJoDrNQAvOL8ZEzbelV9e3ms.jpg	\N	1	0	0	0	0	2021-11-11 01:23:50	2021-11-27 08:31:35
176	1	基本のポークソテー	2人前\\r\\n\\r\\n1　豚肉の赤身と脂身の間に4~5箇所切り込みを入れて筋を切る。\\r\\n2　豚肉の両面に軽く塩こしょうして小麦粉適量をまぶしたら、サラダ油大さじ1を熱したフライパンで両面にこんがりと焼き色がつくまで中火でソテーし、最後にしょうゆ大さじ1/2を回し入れて火を止める。\\r\\n3　酒を回し入れて、フタをして弱火で蒸しても良い。\\r\\n4　食べやすい大きさにカットし、グリーンリーフとプチトマト・レモンを飾った皿に盛り付け、最後にパセリ少々を振りかけて完成。	5	43	0	\N	\N	\N	CzoZ44Adc16Oes7lQjPNRmXBhk2HOeqz59dfp4aT.jpg	\N	1	0	0	0	0	2021-11-11 01:31:34	2021-11-27 08:30:36
177	1	香りもごちそう・酒のガリバタ醤油ムニエル	2人分\\r\\n\\r\\n1　にんにく1片を薄切りにする。\\r\\n2　キッチンペーパーで鮭の水気を切り、薄力粉大さじ1をまぶす。\\r\\n3　フライパンを中火で熱し、有塩バター10g・にんにくを入れる。有塩バターが溶けてにんにくの香りがしてきたら、2を加えて両面に焼き色がつくまで焼く。\\r\\n4　Aを加えてフタをし、弱火で6分、鮭に火が通るまで蒸し焼きにする。\\r\\n5　フタを開け、黒こしょう少々で味を整えたら火からおろし、付け合わせと一緒に皿に盛り付け完成。	1	44	0	\N	\N	\N	ebKxjve0nBuzot1vayQ3My8Qvv705fXyQiHziyok.jpg	\N	1	0	0	0	0	2021-11-11 01:41:43	2021-11-27 08:33:41
178	1	ほったらかし肉じゃが	2人分\\r\\n\\r\\n1 　鶏肉とじゃがいもは3cm大に切る。玉ねぎは1cm幅のくし形に切る。\\r\\n2 　鍋に全ての材料・調味料Aを入れて中火にかける。煮たったらフタを少しずらしてのせ、弱火の中火で15分煮る。	5	60	0	1	1	\N	9hyX8H8BNUsIJ1BS1gFxr5iFHMkF86GGYk5TKbjh.jpg	\N	1	0	1	0	0	2021-11-17 06:45:33	2021-12-13 11:13:04
179	1	海老とブロッコリーの搾菜あんかけ	2人分\\r\\nむき海老とブロッコリーに桃屋の味付け搾菜をたっぷり合わせて、彩りの良い手軽な炒め物を作ります。	5	60	0	3	1	\N	8ZIVXOlrBSAqmJa0NPbSHDHxU1mYPQxwKkumhzCb.jpg	\N	1	0	0	0	0	2021-11-17 06:56:02	2021-12-13 11:27:19
180	1	ズッキーニのパイピッツァ	4人分\\r\\n\\r\\n1 　耐熱ボウルにバター10g・薄力粉10gを入れ電子レンジで加熱(500w約1分)、泡立て器でよく混ぜる。\\r\\n2 　牛乳100ccの半量を加え混ぜ、電子レンジで加熱(500w約1分)。取り出し残りの牛乳を加え混ぜ再びレンジで加熱(500w約1分)。よく混ぜ塩・黒こしょうで味を整える。\\r\\n3 　天板にクッキングシートを敷き、冷凍パイシートを乗せ、周囲1.5cmを残し2を塗る。\\r\\n4 　玉ねぎ・ベーコンを全体にのせ、ズッキーニを重ねて並べ、塩・黒こしょうを少々・粉チーズ小さじ2　をふりオーブンで焼く。(230度・約20分)\\r\\n5 　器に盛り付け、パルメザンチーズ適量を削り全体に散らす。\\r\\n\\r\\nオーブン予熱230度・冷凍パイシートは使用する5分前に室温に戻し、フォークで全体に穴を開け、2枚を5mm重ねて並べ指で押してなじませ、つなぎ合わせておく。	9	44	0	\N	\N	\N	\N	\N	0	0	0	0	0	2021-11-17 07:18:29	2021-11-17 07:18:29
181	1	魚介のクリームパスタ	魚介類はオリーブオイルで炒める。パスタソースを合わせて、フライパンに加える	4	45	0	\N	\N	\N	\N	\N	1	1	0	0	0	2021-11-29 08:07:05	2021-11-29 08:07:05
182	1	ビーフカツサンド	1　牛肩ロースは使う10分前くらいに室温に出し、余分な水分を除き、1人1切れにして筋を切り、包丁の背でたたいて形を整える。\\r\\n2　塩小さじ1/2・ココアバター小さじ1で下味をつける。薄力粉大さじ4に水大さじ4前後を加え混ぜる(練り粉)。\\r\\n3　食パンはみみの部分を切り、6枚分はチョッパーに入れ、粗く刻む。残りの2枚分はグリーンサラダに使用。\\r\\n4　牛肉に練り粉、パン粉(食パンより6枚分)の順に衣をつける(5分以上置いておく)。\\r\\n5　180度くらいの油であげる。(2分以上・ミディアムレアに仕上げるため、高温で一気に表面を上げる)。バットに取り出し、油を切る。(余熱で火を通す、2分以上)。\\r\\n6　天板に食パンを並べ、オーブンで焼く。(電気で230度12分〜/ガス210度12分)。\\r\\n7　焼き色が綺麗についた面を外側にし、内側にマスタードを塗る。(8枚全て)。\\r\\n8　ビーフカツの片面のみにウスターソースをしっかりとつけ、汁気を切り、7にのせ、もう1枚でサンドする。\\r\\n9　ビーフカツのはみ出た部分を切る。3等分に切り、切り口を上にして盛り付ける。	5	54	0	2	1	\N	Xj7UUcd2pdwdTO3JJ9ASyRmWZeu86p5t0q0UGApO.jpg	vYNQLP2YxeOyzHwjERIq6u1Aow2QOxLjFXLMWFrH.jpg	0	0	0	0	0	2021-12-08 13:46:21	2021-12-11 06:44:10
183	1	ワンポットナポリタン	1　スパゲティは半分くらいの長さに折り、バットに入れ、浸るくらいの水を加えて置いておく(10分)。玉ねぎは根元を除き、繊維に沿った薄切り。\\r\\n2　ウインナーは細い輪切り。ピーマンはヘタ・種を除き、繊維に沿った薄切り。\\r\\n3　フライパンに水気を切ったスパゲッティ・玉ねぎ・ウインナー・マシュルーム・コーン・ソースAを入れ、フタをし加熱する（強火)。\\r\\n4　沸騰したら均一に混ぜる。火を弱め、蓋をし、パッケージの時間より2分前後長めに加熱する。蓋を取りピーマンを加え、水分を蒸発させるように炒める。(強火1分~)。\\r\\n5　蓋をし蒸らす(1~2分)。ローリエを取り出し、皿にこんもりと盛り付ける。	4	54	0	2	2	\N	QpfwfTtAS5yM7EwXouw4kxt2R7wEc1KBFbvQAPJz.jpg	pgHtKbIN0DtJdWvtfH0zfDQsZzdtq5vt1eg7ft5a.jpg	1	0	0	0	0	2021-12-08 14:30:42	2021-12-11 06:46:05
197	1	とろとろ卵のサラダ	市販のドレッシング：キューピークリーミィ野菜ドレッシング\\r\\n\\r\\n1　グリーンリーフ60g・トレビス20gは食べやすい大きさにちぎり、水にさらし、水気を切る。\\r\\n2　皿にグリーンリーフ・トレビスを盛り付け、中央に温泉卵(1人1個)をのせる。ドレッシング(1人小さじ1)をかける。	3	57	0	0	2	\N	Pgq96YTJbUovbaSmRbywNy4Zof2w90Q8gKtSi97W.jpg	\N	1	0	0	0	0	2021-12-10 10:09:55	2021-12-11 04:40:38
184	1	アップルピクルス&グリーンサラダ	1　リンゴは芯を除き、1cmの角切り。セロリは筋を除き、斜め薄切り。セロリの葉は幅5mmに切り、リンゴと共にボウルに入れて塩小さじ1/4を振る。\\r\\n2　耐熱皿に味付け用Aを入れ、電子レンジで加熱する(600w30秒~)。リンゴ・セロリの葉全体に回しかけ、漬ける(10分~)。\\r\\n3　食パンのみみは1cmの角切りにし、ボウルにドレッシング(小さじ2)と共に入れ、よく混ぜる。クッキングシートをひいた天板に広げ、オーブンで焼く(電気230度12分~/ガス210度12分~)。\\r\\n4　皿にグリーンリーフ・トレビス・セロリを彩りよく盛り付け、クルトンを散らし、ドレッシング(1人小さじ1)をかける。別の器に盛り付けたアップルピクルスを添える。\\r\\n\\r\\n市販のドレッシング使用：キューピーオリーブオイル&オニオンドレッシング	3	54	0	0	2	\N	1EUIttfmNt0xUF5femz6Z0IfQmzmKk0drJzkRwsv.jpg	\N	0	0	0	0	0	2021-12-08 14:50:17	2021-12-11 04:17:26
185	1	グレープフルーツのクレープ	1　グレープフルーツ(ルビー)は半月切りを中央から4枚取り、2等分にし、8切のいちょう切りにする(飾り用)。残りの皮の黄色の部分のみをすりおろし、果汁を絞る。\\r\\n2　ボウルに粉Aを入れ、ざっと混ぜ、卵を加えてダマがなくなるまでよく混ぜる。牛乳100ccの1/4量を加えよく混ぜる。残りの牛乳・コアントローを加えて溶きのばし、溶かしたバターを加えて焼く直前まで置く。\\r\\n3　焼く直前に、1人分ずつ容器に分ける。温めたフライパンの表面を油(バター)の染みたペーパーでしっかり拭き、生地を一度混ぜてから流し、均一に広げて焼く。\\r\\n4　ふちがチリチリとして色がつき、下の面に焼き色がついたら持ち上げて返す。10秒くらい焼き、焼き色をつける。まな板にうつし粗熱をとる(残りの生地も同様に焼く)。\\r\\n5　クレープを焼いた後のフライパンに、バター10gを溶かし、(グレープフルーツの果汁 + 水)合わせて80cc・砂糖小さじ4・皮を入れて少し煮詰める(3分~)。火を止めてコアントロー小さじ1を加える。\\r\\n6　4を半分に切り、扇形に端から丸め、2つずつ盛り付ける。温かい5をかけて飾り用グレープフルーツを2切れ・洗って水気を除いたミントの葉を飾る。	6	54	0	2	2	\N	olfAbvqG6kbZzA5S46FY1JVmVH93IJwBkxd1wUOC.jpg	\N	0	0	0	0	0	2021-12-08 14:53:41	2021-12-11 04:18:30
186	1	シーフードトマトクリームドリア	1　ベーコンは幅1cmに切る。玉ねぎは根元を除き、繊維に沿った薄切り。シーフードミックス(冷凍)は解凍し、余分な水気を除き、(塩少々・黒こしょう少々)で下味をつける。\\r\\n2　鍋にバター20gを溶かし、ベーコン・玉ねぎを入れ、しんなりとするまで炒める(中火3分~)。端に寄せシーフードミックスを加える。\\r\\n3　焼き色をつけるように焼く。火を止め白ワイン40ccを加え、蓋をして再び火をつけ、蒸し焼きにする(中火~強火2分位)。\\r\\n4　シーフードミックスを取り出し、蒸し汁がなくなるまで炒め合わせる。薄力粉小さじ8を加えて炒める(1分位)。\\r\\n5　トマトペースト大さじ1を加えて炒め合わせる。牛乳480ccを少しずつ加えて溶きのばす。\\r\\n6　コンソメ小さじ1を加え、軽くとろみがつくまで加熱する。塩少々、黒こしょう少々で味を整える(トマトクリームソース)。\\r\\n7　ボウルにご飯、バター10g、塩少々、黒こしょう少々を入れて、切り混ぜる。グラタン皿に分け入れる。\\r\\n8　トマトクリームソースをかけ、シーフードミックス・ピザ用チーズ40gをのせる。\\r\\n9　天板にのせ、オーブンで焼く(電気230度12分~/ガス220度12分~)。受け皿にのせ、イタリアンパセリを散らす。	4	55	0	2	1	\N	tFXqTovU73wUhnWTetfbez2bpx80Om3ruK0FF5n3.jpg	\N	0	0	0	0	0	2021-12-09 02:12:56	2021-12-11 04:19:02
187	1	紅芯大根のレモンサラダ	1　グリーンリーフは食べやすい大きさにちぎり、水にさらし、水気を切る。紅芯大根は皮を剥き、厚さ2~3mmのいちょう切り。\\r\\n2　ボウルにグリーンリーフ・紅芯大根を入れ、エキストラバージンオイル小さじ2を入れ、ざっくりと和える。\\r\\n3　レモン果汁小さじ1・岩塩少々・黒こしょう少々を加え、さらにざっくりと和える。器に盛り付ける。	3	55	0	0	2	\N	kutvn5gunVOCkmwbSQps8j9XQiBLgZoXzQYFQ41e.jpg	\N	1	0	1	0	0	2021-12-09 08:31:29	2021-12-11 04:20:42
188	1	ガーリックポークステーキ	1　豚肩ロース肉は繊維の多い部分は切り込みを入れ、両面筋を切り、塩小さじ1/8・黒こしょう少々で下味をつける。にんにくは皮を除き、繊維に逆らった薄切りにし、芯を除く。\\r\\n2　フライパンにニンニク・オリーブオイル小さじ2を入れ、過熱する(中~強火1分~)。表面がきつね色になり、カリッとしてきたらペーパーを敷いたバットに取り出す(ガーリックチップス)。\\r\\n3　豚肉に薄力粉小さじ4をまぶし、盛り付ける面から入れて焼き(中火5分~)、焼き色がついたら裏返し、火が通るまで焼く(弱火)。\\r\\n4　火を止め、フライパンの余分な脂を除き、合わせ調味料Aを加える。\\r\\n5　再び火をつけて煮からめ、火を止め、バター10gを加えてからめる。\\r\\n6　皿にポークステーキを盛り付けソースをかける。ガーリックチップスを散らし、イタリアンパセリを飾る。	5	55	0	2	1	\N	mUSueCtnRitlGxj6rsKtqg4w7l5ItBwnMnvmVRiV.jpg	\N	0	0	0	0	0	2021-12-09 08:40:06	2021-12-11 04:34:07
189	1	りんごのジュレ	1　粉ゼラチン小さじ2は使う直前に、湯40ccに振り入れ溶かす。\\r\\n2　ボウルに、(水160cc・フロストシュガー大さじ2・レモンの果汁小さじ1)を入れ混ぜる。\\r\\n3　溶かしたゼラチンを加え混ぜる。\\r\\n4　器に分け入れて、冷蔵庫で冷やし固める。\\r\\n5　ジュレにりんごジャム1人小さじ2をのせる。	6	55	0	2	3	\N	TNhjkDn2nKRBHZJc8Bst909bf35xCnBdiB638swO.jpg	\N	1	0	1	0	0	2021-12-09 09:02:05	2021-12-11 04:34:55
190	1	5種のてまり寿司	下準備\\r\\n●米は洗米・吸水(30分~)後水気を切り、水を加えて炊いておく。1人120g。●豚バラ薄切り肉は長さを半分に切り、黒こしょう少々で下味をつけておく。●青じそは肉・鯛用全て軸を除き、縦半分に切っておく。●スモークサーモンは長さを半分に切っておく。●卵液を作っておく。ボウルに(卵1個・砂糖小さじ2・塩小さじ1/8)を入れよく混ぜておく。●(塩小さじ1・クミンパウダー小さじ1/2)はよく混ぜておく。●レモンは塩でこすり洗いし、4等分のくし形切り。\\r\\n\\r\\n1　あわせ酢Aを作る。そこから小さじ1を紅椿用に分けとる。鯛はそぎ切りにし、塩麹小さじ1をぬりラップを密着させてかけ、10分くらいなじませる。\\r\\n2　紅芯大根は皮を剥き、スライサーで薄いいちょう切りにする。塩少々をまぶしてなじませ(10分位)、水気を絞る。ボウルに(紅芯大根・あわせ酢)を入れ、なじませる(10分~)。\\r\\n3　残りの合わせ酢をしゃもじを伝わらせて、ご飯全体に回しかけ切り混ぜる。全体になじんだら、あおりながら切り混ぜる。4等分にし、ぬらして硬く絞ったさらしをかけ蒸らす。1/4量をそれぞれ5等分にし丸く形を整える。\\r\\n4　ラップに豚肉・青じそ・寿司飯の順にのせ、豚肉を巻きつける。しっかりと丸く握り、形を整える。フライパンにサラダ油小さじ1/2を熱し、巻き終わりから入れて、転がしながら全面に焼き色をつける。余分な油を除きBを加えて混ぜ、煮からめる。\\r\\n5　ラップに鯛の塩麹漬け・青じそ・寿司飯の順にのせ、しっかり丸く握り、形を整える。ラップにサーモン・寿司飯をのせ、しっかりと丸く握り、形を整える。\\r\\n6　白みそ(西京味噌)20gに生クリーム20gを少しずつ加えて混ぜ、角がしっかりと立つ位まで混ぜる(白みそデップ)。ラップを外し水気を軽く切った2を孤の方が上になるように上半分、全面に巻き付け、しっかりと丸く握り形を整える。\\r\\n7　フライパンにサラダ油小さじ1/2を熱し、余分な油を除き卵液を流し入れ、全体に広げる。ふちが乾いてきたら裏返してさっと焼き、取り出す。丸抜き型3号で抜く(20枚)。残りはみじん切り(紅椿に使用)。\\r\\n8　ラップに抜いた7(5枚)を少しずつ重ねて円状に載せ、寿司飯をのせ、しっかりと丸く握り形を整える。皿に4・5・紅椿・卵を乗せる。サーモンに白みそデップをのせ、黒こしょう少々を振る。紅椿にみじん切りにした卵を、たまごにとびこ(4人で2g)を飾る。醤油(1人小さじ1/2)を添える。	1	56	0	1	1	\N	44nPtHzLxNfqtVRTOAMK3ARpFNyRdlIdOS1c3g2g.jpg	yaAtBlG1ZIvzyWhbUh76C6rqggzb1yZlbNmEU6iM.jpg	0	1	0	0	0	2021-12-09 13:34:12	2021-12-11 06:48:12
191	1	フリットミスト	下準備\\r\\n●(塩小さじ1・クミンパウダー小さじ1/2)はよく混ぜておく(クミン塩)。●レモン1/2個は塩でこすり洗いし、4等分のくし形切り。\\r\\n\\r\\n1　れんこん80gは皮をむいて、縦4等分に切り、水にさらし水気を除く。ブロッコリー80gは長さを生かして8 等分に切り、ため水で振り洗いし、水気を除く。\\r\\n2　ビニール袋に鶏ひき肉80g・Bを入れよく混ぜる。れんこんの片面に天ぷら粉小さじ1をまぶす。ビニール袋の端を切り、1/4量ずつ絞って塗り広げ形を整える。\\r\\n3　天ぷら粉60g・マヨネーズ小さじ4を合わせ、無調製豆乳80ccを少しずつ加えよく混ぜる。水小さじ1/2~を加え\\r\\n濃度を調整する(衣)。ブロッコリーの花穂に衣をつけ、170度の油で揚げる(1分~)。バットに取り出し油を切る。\\r\\n4　れんこんボートに衣をつけ、170度の油で揚げる(4分~)。バットに取り出し油を切る。皿にフリットを盛り付け、クミン塩・レモンを添える。	9	56	0	1	2	\N	JuWTfLUBuKqfTAwI4P16dl7CPCaiUs9NHavGD8Fx.jpg	AgvA29Hr2WIa3hwK97OhsObseEGXmU0eaUOWEm8I.jpg	0	1	0	0	0	2021-12-10 01:44:11	2021-12-11 06:50:24
192	1	塩豆腐とトマトのサラダ	1　木綿豆腐は厚さを半分に切り、さらに大きさを半分に切る。木綿豆腐全体に塩麹大さじ1を塗る。\\r\\n2　ペーパーで包んで耐熱皿にのせ、ラップをせずに電子レンジで加熱する(600w2分位)。ざる + ボウルに置き上から重し(ボウルに水500cc)をし、水切りをする(30分~)。\\r\\n3　皿にグリーンリーフ・トマト1/2個・2をちぎりながら盛り付け、ドレッシングをかける。\\r\\n\\r\\n＊ドレッシング:　キューピー深煎りごまドレッシング	3	56	0	1	2	\N	4bhdsGejwGmEhN3YicC56JKcv2Xv79xcfxYFNZJg.jpg	\N	1	0	1	0	0	2021-12-10 07:27:58	2021-12-11 04:36:51
193	1	株とベーコンの白みそ椀仕立て	1　かぶは茎を2cmくらい残して切り、半分に切って付け根をよく洗う。皮をむき8等分のくし形切り。ベーコンは1枚を4等分に切る。\\r\\n2　鍋に水320cc・和風だしの素小さじ1/2・かぶ・ベーコンを入れて加熱し、蓋をしてかぶが柔らかくなるまで煮る。\\r\\n3　無調製豆乳40ccを加え、温める。火を弱め、白みそを溶き入れる。椀に盛り付ける。	2	56	0	1	2	\N	JWfMXzNEZnZBkZ2ZA5JEzVlDC6cpMOvzr77E4Iyz.jpg	\N	1	0	0	0	0	2021-12-10 07:31:14	2021-12-11 04:37:33
194	1	硬めの焼きプリン	下準備　　①オーブン予熱：電気160度20分~ガス150度20分~　②湯を沸かしておく。\\r\\n\\r\\n1　ボウルに卵2個を割り入れよく混ぜる。\\r\\n2　鍋にAを入れ、沸騰直前まで温める。\\r\\n3　火からおろした2に1を少しずつ加え、その都度よく混ぜ、バニラオイルをふり、混ぜる。\\r\\n4　天板に布巾を入れたバットをのせココットを置く。ぬらした茶漉しでこしながらプリン生地を分け入れる。\\r\\n5　ココットに湯が入らないように湯を2cmくらいはる。オーブンで焼く(電気160度20分~ガス150度20分~)。\\r\\n6　冷水で粗熱を取り、冷蔵庫で冷やす。プリンにキャラメルシロップをかける(1人小さじ1/2)。	6	56	2	1	3	\N	irc7PsSbolVZCdQ51j0o99ANbpvlQ84XhsdbPyCQ.jpg	\N	0	1	0	0	0	2021-12-10 07:47:11	2021-12-11 04:38:39
195	1	ハニーマスタードローストチキン&ローズマリーポテト	下準備　オーブン予熱　電気230度20分~ガス220度18分~\\r\\n\\r\\n1　骨付き鶏もも肉は余分な水気・脂肪を除き、ついていれば足先を切り落とし、骨に沿って切り込みを入れ(2本)、関節にも切り込みを入れる。\\r\\n2　ローズマリーは長さを4等分に切る。じゃが芋はよく洗い、皮付きのまま一口大の乱切り(1人3切れ)。\\r\\n3　ハーブ&スパイスミックス調味料小さじ1、オリーブオイル小さじ2、ローズマリー1枚でマリネする(15分~)。\\r\\n4　ハニーマスタード大さじ2・醤油小さじ2を混ぜ合わせる(マスタードソース)。\\r\\n5　ビニール袋にAを入れてよく混ぜ、骨つき鶏もも肉を加えてよくもみ、なじませる(15分~)。\\r\\n6　天板にクッキングシートを敷き、四隅をねじる。軽く汁気を切った骨つき鶏もも肉を皮面を上にして並べる。\\r\\n7　マスタードソース大さじ2を塗る。隙間にじゃが芋を下味ごと並べる。\\r\\n8　オーブンで加熱する(電気230度20分~ガス220度18分~)。\\r\\n9　焼き上がったら竹串を刺し、火通りを確認する(透明な肉汁ならOK)。皿に8を盛り付ける。	9	57	2	2	1	\N	p3GSpko9XXv8CBxVfq56ODZnAoBqTx3dhq1raBUW.jpg	l5gPjHmTQF1qwRfN0oAz9CjdcNJjqUlF7wPIQbdD.jpg	0	0	0	0	0	2021-12-10 08:04:01	2021-12-11 06:58:17
196	1	トマトのオニオンスープ	1　玉ねぎは根元を除き、繊維に逆らった薄切り。\\r\\n2　ベーコンは幅1cmに切る。\\r\\n3　鍋にオリーブオイル小さじ1を熱し、玉ねぎ・ベーコン・きざみにんにく小さじ1を入れ、玉ねぎがきつね色になる位まで炒める(中~強火5分位)。\\r\\n4　トマトソース200gを加え、煮詰める(強火3分位)。\\r\\n5　水280cc・コンソメ小さじ1を加え、煮る(中火5分)。\\r\\n6　塩少々・こしょう少々で味を整える。\\r\\n7　器に盛り付け、粉チーズ(1人小さじ1/2)・パセリ少々をふる。	2	57	0	2	2	\N	9427HEVm6YQAldHY3WjoU1kneLPAWNol4PnI9nZh.jpg	\N	1	0	0	0	0	2021-12-10 10:04:01	2021-12-11 04:39:59
198	1	いちごのマリトッツオ	下準備　クリームチーズは室温に戻しておく。生クリームは泡立ちにくくなるので、直前まで冷蔵庫で冷やしておく。\\r\\n★いちごは高ければ、オレンジジャムを使用しているので、みかんをカットしてのせても良い。\\r\\n★パンはロールパンでも、レーズンパンでも良い。丸く、小さいパンが、クリーム少なくてよくてオススメ。\\r\\n★クリームチーズで作るホイップなので、あっさりしていていい。砂糖も少なめでチーズも摂れて、デザートなのに身体にもいい。\\r\\n★パンやフルーツを切るのは包丁以外にナイフとフォークのナイフでもいいので、包丁なしでも手軽に作れる。\\r\\n1　ロールパンは斜めに切り込みを入れる。いちごはヘタを除いて洗い、縦4等分の薄切り。\\r\\n2　ボウルにクリームチーズ40g・砂糖小さじ1を入れ、なめらかになるまでよく混ぜる。\\r\\n3　生クリーム80gを少しずつ加え、9分立てにし、しぼり袋に入れる。\\r\\n4　ロールパンの切り込みを開き、奥中央にオレンジジャムを1/4量ずつ入れる。\\r\\n5　しぼり袋の先を3cm位切り、切り込み全体にしぼる。切り口を整える。\\r\\n6　クリームにいちごを貼り付ける。皿に盛り付け、粉糖をふるう。	6	57	0	2	3	\N	ltofcJ0wSRhGKFfBevAm1QrMGdsoVJRJuynEXwKV.jpg	\N	1	1	1	1	0	2021-12-10 10:16:29	2021-12-14 05:15:58
199	1	豚の角煮	1　落としブタを作る。(作り方画像参照)\\r\\n2　しょうがは皮付きのままよく洗い、薄切り。豚バラ塊肉は1人2切れに切る。鍋に豚肉・調味酢小さじ2を入れ、水分がなくなるまでもみ込む。\\r\\n3　脂身を下にして並べ、火をつけ、余分な脂を除きながら、全体に香ばしい焼き色をつける(中火)。\\r\\n4　しょうが・Aを加え、沸騰したらアクを除き、落とし蓋をして煮る(沸騰後弱~中火20分~)。\\r\\n5　落とし蓋を取り、上の脂をすくいとる。オイスターソース小さじ2を加え、煮詰める(中~強火5分位)。\\r\\n6　皿に盛り付ける。	9	58	0	2	1	\N	ojStSgAwuGiZKoFMelGiHnURCTY3TYIjW6Rwf8tg.jpg	jGquKdmSa37CXNAwnaihAeMDXzeyvdQBc6w7S8CW.jpg	0	1	0	0	0	2021-12-10 10:28:03	2021-12-11 06:59:39
200	1	海老の香味焼き	1　えび(有頭)は立て塩・真水の順に洗い、ヒゲを切り、竹串で背ワタを除く。もう1度立て塩・真水の順に洗い(足の部分を特によく洗う)、水気を除き、腹部に切り込みを入れる。\\r\\n2　フライパンに海老・Aを入れ、なじませる。火をつけ、エビに火が通るまで加熱する(中~強火)。はねるようであれば蓋をする。\\r\\n3　火を止め、レモンの果汁小さじ1・薄口醤油小さじ1/2を加え、からめる。皿に盛り付ける。	1	58	0	1	2	\N	B7mnUttctlNyPPExl97OOU0cggApgj7AEpxhQqBK.jpg	XQvuI36KigxLkBTtD0Eb3kkHYcxnvf0xVRyPNsIO.jpg	0	0	0	0	0	2021-12-10 13:31:52	2021-12-11 07:00:56
201	1	オレンジ栗きんとん	1　さつま芋は皮を厚めにむき、厚さ1cmの半月切り、または、いちょう切りにし、たっぷりの水にさらして水気を切る。\\r\\n2　くちなしの実はお茶パックに入れ、軽くたたいて割る。鍋にさつま芋・かぶる位の水・くちなしの実を入れ、弱火にかける。沸騰したらやや火を弱め、竹串がスッと通るまでゆでる(8分~)。\\r\\n3　水気を切り、くちなしの実を取り出す。さつま芋の粗熱を取り、チョッパーに入れなめらかになるまでかけ、水飴を加え、再度チョッパーにかける(10秒前後)。\\r\\n4　刃をはずし、オレンジジャムを加え、切り混ぜる。皿に盛り付け、栗の甘露煮を飾る。	9	58	0	1	2	\N	AIketBMn5uQMmt915oWmgqz2lVmilRrbfaHcFtqm.jpg	c0XeroBFhzIThrqKXkg7U7uZDTgZ2xzKXYJkQV8b.jpg	0	1	0	0	0	2021-12-10 13:42:54	2021-12-11 07:02:13
202	1	紅白なます	1　大根・人参は皮をむき、繊維に沿った薄切り。マッチ棒よりやや細い位の斜めの千切り(なます切り)。ボウルに入れ、塩をして軽く混ぜ、なじませる(10分位)。\\r\\n2　ボウルに調味酢大さじ2・レモンの果汁小さじ1を入れ水気をよくしぼった大根・人参を加えよく混ぜ合わせ、漬ける(20分~)。\\r\\n3　途中上下を返す。皿に盛り付ける。	9	58	0	1	2	\N	FHh5iHo8ZSfY5pm3lh8IL7Ur8k3acPiJU9HI3kY2.jpg	jaElngeIkQp61adHClYqS87ojo5uYDvgeXkismNY.jpg	1	0	0	0	0	2021-12-10 13:54:41	2021-12-11 07:03:28
203	1	メープル黒豆	1　耐熱皿に黒豆40g・メープルシロップ小さじ2を入れ、混ぜる。ラップをふんわりとかけ、電子レンジで加熱する(600w1分20秒~)。\\r\\n2　ラップを密着させてかけ、そのままおく(鍋止め)。器に盛り付ける。	9	58	3	1	2	\N	EWXw9aTaEOMh0AmGoUGAVxjVmKijNSqD3PADG6bN.jpg	oMza15jBMatD5hOsHKJGvWDy82RmJaFFGHmFBngW.jpg	1	0	0	0	0	2021-12-11 00:14:54	2021-12-11 07:04:04
204	1	市田柿のサワークリーム巻き	1　干し柿はヘタを除き、縦に切り込みを入れて開き、種があれば除く。サワークリームは1 × 4cm位の4等分。干し柿にサワークリームをのせて包む。\\r\\n2　形を整える。冷蔵庫で冷やす。3等分に切り、皿に盛り付ける。	6	58	0	1	3	\N	eaan7IMuMNZeb83Bz3cSZMtNH0ABQ5ZemgvHiSNY.jpg	CSet6BlYTpJJyGwbQbHuPS7lFYHh1wgnMyInCzP3.jpg	1	0	0	0	0	2021-12-11 00:20:22	2021-12-11 07:04:55
205	1	みぞれ雑煮	下準備　電気230度6分~ガス220度6分~　\\r\\n\\r\\n1　大根は皮をむき、タイミングを見計らってすりおろし、水気を軽く切る。みつ葉は根元を除き、長さ4cmにきる。\\r\\n2　角餅はタイミングを見計らってクッキングシートを敷いた天板にのせ、予熱を入れたオーブンで焼く(電気230度6分~ガス220度6分~)。\\r\\n3　鍋にAを入れて混ぜ、混ぜながら加熱する。椀にあんを少し入れ、角もちをのせる。\\r\\n4　残りのあんをのせ、大根おろしをのせる。みつばを飾り、お好みで七味唐辛子をふる。	9	58	2	1	2	\N	nmSrM53f54KU6lI4GaPSUIQhb1uWh2zhZyNqX1of.jpg	\N	0	1	1	0	0	2021-12-11 00:29:25	2021-12-13 11:14:59
206	1	牛肉のワイン煮込み	下準備　片栗粉・水は合わせておく(水溶き片栗粉B)。セルフィーユは洗って水気を除いておく。\\r\\n\\r\\n1　牛肩ロース塊肉は余分な水気を除き、1人2切れに切り、(塩小さじ1/4・黒こしょう少々)で下味をつける。玉ねぎは根元を除き、繊維に逆らった薄切り。\\r\\n2　フライパンにサラダ油小さじ1を熱し、玉ねぎを入れて色付くまで炒める。\\r\\n3　圧力鍋にサラダ油小さじ1/2を熱し、牛肉を入れて表面を香ばしく焼き、余分な脂は除く。\\r\\n4　牛肉全体に焼き色がついたら火を止め、余分な脂を全て除く。マディラを加え、鍋底についた旨味をこそげ落とすように混ぜる。\\r\\n5　上記A・2の玉ねぎを加えて沸騰させる。アクがあれば除く。\\r\\n6　専用の蓋をし、強めの中火にかけ、安全ロックピンが上がり、蒸気が出てきたら弱火にして加熱(加圧)する(25分)。\\r\\n7　安全ロックピンが下がったら、蓋を開け、上の脂があれば除く。ローリエを取り出し、塩少々・黒こしょう少々で味を整える。\\r\\n8　水溶き片栗粉Bを加えて加熱し、とろみをつける。\\r\\n9　皿にワイン煮込みを盛り付ける。セルフィーユを添える。	5	59	0	2	1	\N	SMLNg89xbbrX1kIPNhkxLrj6ZHqLFk6D7izupgp2.jpg	1KEB47WUwx63q0BvrDk8Xw2JZl6UIggSAJ6qFtLh.jpg	0	0	0	0	0	2021-12-11 00:43:33	2021-12-11 07:08:25
207	1	ドフィノワ~じゃが芋のグラタン	下準備　オーブンに予熱　電気230度25分~ガス220度25分~\\r\\n\\r\\n1　ボウルにバーニャカウダに使用した牛乳 + 牛乳合わせて320cc・ナツメグ少々を入れ、よく混ぜる(ソース)。じゃが芋は皮をむき、厚さ2mm位の輪切り(水にはさらさない)。\\r\\n2　グラタン皿にじゃが芋の1人分の半量を並べる。コンソメ(1人小さじ1/4)をふり、ピザ用チーズ(4人で80g)の半量をのせ、残りのじゃが芋を並べる。残りのピザ用チーズをのせる。\\r\\n3　ソースをかけ、天板に並べてオーブンで焼く。(電気230度25分~ガス220度25分~)。受け皿にのせる。	9	59	2	2	1	\N	gZffHEKxZ8HNCoWV5KL6CTjkXJ7IcO9dNgCXLSab.jpg	UOVy60W4x73Cdj3e2n6V6XvIjOLV2ULzhZPS2nHl.jpg	1	0	0	0	0	2021-12-11 03:16:39	2021-12-11 07:09:25
208	1	バーニャカウダ	バーニャカウダはイタリア北部、ピエモンテの郷土料理。バーニャはソース、カウダは温かいという意味がある。\\r\\n1　にんにくは皮・芯を除き、大きいものは横半分に切る。\\r\\n2　ルッコラは根元・硬い茎を除き、長さを半分に切る。セロリは筋を除き、棒状に切る(4~8本)。\\r\\n3　紅芯大根は皮をむき、薄い半月切り、または、いちょう切り。黄パプリカはヘタ種を除き、長めの乱切り。\\r\\n4　鍋ににんにく・牛乳200ccを入れ、にんにくが柔らかくなるまで加熱する(沸騰後弱~中火20分前後)。＊水分がなくなったら水を足す。加え過ぎ注意。\\r\\n5　にんにくと牛乳に分ける。にんにくをボウルに移し、滑らかになるまでしっかりつぶす(硬い部分があれば除く)。アンチョビペースト小さじ1を加え、均一になるまで混ぜる。\\r\\n6　皿に野菜を彩りよく盛り付ける。器に8を分け入れ、オリーブオイル(1人小さじ1/2)をかけ、添える。	3	59	0	2	2	\N	84eNMn6jUhyMGKl6fnMq0C1jf49CIwz5ZUMran4w.jpg	WoNO3Jk3f4PjQorwP00amPDIhygB8brSPkyiV4Ch.jpg	1	0	0	0	0	2021-12-11 03:22:17	2021-12-13 09:36:46
209	1	オレンジマフィン	下準備　●材料(サワークリーム以外)は室温に戻しておく。●卵はよく溶きほぐしておく。●オーブンに予熱　電気180度15分~ガス170度15分~\\r\\n\\r\\n1　いちごはヘタつきのまま洗って、水気を除き、アルコール消毒する。\\r\\n2　ボウルにバター40g・砂糖大さじ4を入れ、白っぽくなるまで混ぜる。\\r\\n3　卵を少しずつ加えて、その都度混ぜ、粉類Aをふるい入れて切り混ぜる。\\r\\n4　均一になったら、紙型(マフィン型)に均等に分け入れ、空気抜きをする。\\r\\n5　天板に並べてオレンジジャム小さじ4をのせ、オーブンで焼く。(電気180度15分~ガス170度15分~)。\\r\\n6　粗熱が取れたら皿にのせ、サワークリームをのせ(4人で20g)、いちごを飾る。	6	59	2	2	3	\N	x3dHkI03ntBxI4MK8WcpISkZhaBXuIEcBhYtZJec.jpg	\N	0	0	0	0	0	2021-12-11 03:39:03	2021-12-11 04:47:45
210	1	★トナカイチョコプリン	耐熱容器3個分（オンラインなら動画あり）\\r\\n1.ミルクチョコレート（50g）を細かく刻む\\r\\n2.ボールに卵黄1個分、砂糖を入れて混ぜる。\\r\\n3.鍋に牛乳、生クリームを入れて弱火で熱し、小さな泡が立ってきたら火からおろす。\\r\\n4.３の鍋にチョコレートを加えて混ぜ溶かし、2のボールに少しずつ加えながら混ぜる\\r\\n5.耐熱容器にこしながらプリン液を流し入れる。\\r\\n6.フライパンに耐熱容器を並べ、耐熱容器の1/3量が浸かる量の熱湯を注ぎ、蓋をして弱火で15分間熱して冷やす。\\r\\n7.チョコペン、マーブルチョコで顔を作り、チョコ菓子でツノを作り、アーモンドで耳を作る。	9	60	0	2	3	\N	9p3MkXFUwiOweJkPwSjBS4b2AWeAcW0oNQbOVeTr.jpg	\N	0	0	0	0	0	2021-12-13 08:59:39	2021-12-13 10:11:47
211	1	ガスパチョ	冷たいスープ	2	61	0	9	2	\N	3UPFqKZBfSaX7gBbZsz0bwHZIVFaYH7d1hL2RV44.jpg	\N	0	0	1	0	0	2021-12-13 09:10:59	2021-12-13 10:35:57
212	1	ピンチョス	スペイン語で爪楊枝や刺すという意味があり、小皿料理であるタパスの中でも、小さくカットしたパンの上に具材が乗っていたり、爪楊枝でさしてあるフィンガーフード全般をピンチョスと呼んでいます。	8	61	0	9	2	\N	6Q1ZY7kigwlE8KsSQtCEYHYzAjbuT3LilKQEY5J4.jpg	\N	0	0	0	0	0	2021-12-13 09:14:30	2021-12-13 10:45:43
213	1	トルティージャ	いわゆるスペイン風オムレツ。ちなみにトルティーヤとトルティージャは別の食べ物。	7	61	0	9	1	\N	C1BhtiK29nN2Ex9CpUftYuPdqBFnTuSSeo3BhjYP.jpg	\N	0	0	0	0	0	2021-12-13 09:15:55	2021-12-13 10:47:03
214	1	ソパ・デ・アホ	アホとはスペイン語でニンニクのことです。スペインでは風邪を引いたかなと思ったら、ニンニクパワーたっぷりのソパ・デ・アホを作って飲む人が多いと言います。	2	61	0	9	2	\N	XMXBeHkRhL58yj0wNdmqdRH1RFqDwD6blyoDreGK.jpg	\N	0	0	0	0	0	2021-12-13 09:19:47	2021-12-13 10:56:53
215	1	★クリスマスのアイシングクッキー	クッキー型：クリスマスツリー、星型など★\\r\\nアイシングとは？：粉砂糖と卵白や水を練り混ぜて作った砂糖衣のことで、クッキーやカップケーキなどのお菓子の表面にかけたり、絞り出してデコレーションします。食用色素を使って着色し、カラフルなデコレーションをすることもできます。\\r\\n1.下準備：天板にクッキングシートを敷く。薄力粉、ベーキングパウダーは合わせてふるう。バターは常温に戻す。\\r\\n2.クッキー生地：ボールにバターを入れてなめらかになるまで混ぜ、砂糖を加えて白っぽくなるまで混ぜる。\\r\\n3.卵黄を加えて混ぜ、バニラエッセンスを加えて混ぜる。合わせてふるった薄力粉、ベーキングパウダーを加えて粉気がなくなるまでさっくりと混ぜ、手でひとまとめにする。\\r\\n4.生地をラップではさみ、めん棒で3〜4mmの厚さに伸ばして、冷蔵庫で1時間程度冷やす。お好みのクリスマスツリーや星形などの型でくり抜き、天板に並べる。\\r\\n5.170℃に予熱したオーブンで15〜20分ほど焼き、冷ます。\\r\\n6.アイシング：ボールに卵白を入れて混ぜる。別のボールに粉砂糖を入れて混ぜた卵白を少しずつ加えてその都度なめらかになるまでよく混ぜる。\\r\\n7.3等分にし、それぞれ食用色素を入れて混ぜ、色を付ける（緑、黄色）１つはそのまま残す（白）\\r\\n8.コルネ：長方形のクッキングシートを対角線に切って、三角形を作り、1番長い辺の中心を頂点としてコルネの先がとがるように調節しながら巻く。上部を内側に折り込み、さらに折り畳む。計3個作る。\\r\\n9.コルネにアイシングを小さじ2入れて、上部を折り畳み、先を少し切る。同様に3個用意する。残りのアイシングは少量の水で伸ばす。\\r\\n10.クッキーの仕上げ：コルネに入れたアイシングでクッキーを縁取り、内側に少量の水で伸ばしたアイシングを塗る。\\r\\n11.表面を少し乾かし、アイシング（白）で模様をつける。皿にお好みのトッピング（アザランやトッピングシュガー）をして乾かす。残りも同様にお好みに仕上げる。	9	60	2	2	3	\N	klkCXwHyQJ5hY3lsAo8wQd8WepQirgAtOWjzMUgM.jpg	\N	0	0	0	0	0	2021-12-13 09:57:28	2021-12-13 10:12:27
216	1	★ピスタチオアイスクリーム	4人分\\r\\n1.下準備：ピスタチオペーストは常温に戻しておく。\\r\\n2.ボールにピスタチオペーストを入れ、牛乳を4回に分けて加え、その都度ゴムベラで押し付けるようにして馴染ませ、よく混ぜる。（ピスタチオミルク）\\r\\n3.別のボールに卵黄、砂糖1/2量（30g）を入れて白っぽくふんわりするまで混ぜる。ピスタチオミルクを少しずつ加え、その都度よく混ぜる。鍋に入れる。\\r\\n4.鍋を弱火で常に混ぜながら2〜3分熱し、とろみがついたら火からおろす。粗熱が取れたら、底に氷水を当てて、混ぜながらしっかり冷やす（ピスタチオ生地）\\r\\n5.別のボールに生クリーム、残りの砂糖（30g）を入れて柔らかいツノがたつまで泡立てる。ピスタチオ生地に3回に分けて加え、その都度さっくり切るように混ぜる。\\r\\n6.バットに流し入れ、冷凍庫で2時間以上冷やす。スプーンで全体を混ぜて空気を含ませ、さらに2時間以上冷やし固める。器に盛り、ピスタチオをのせる。	6	60	0	2	3	\N	PXGn2marO8ryi38oaEWMROpTzMMlxijQHYybOxfR.jpg	\N	0	0	1	0	0	2021-12-13 10:31:25	2021-12-13 10:37:10
217	1	アヒージョ	※作り方画像あり。\\r\\nスペインのバルでは定番な存在。オリーブオイルとニンニクで食材を煮込んだ料理のことで、「タパス」と呼ばれるスペイン南部の伝統的な小皿料理の一つです。厳密にはアヒージョとはスペイン語で「小さなニンニク」や「刻んだニンニク」を表す言葉でしかなく、料理のことをさす場合は「食材名＋アヒージョ」となります。	1	61	0	9	1	\N	rYMUakq9Zv62v110a4cR9wH4vtbbMf0BpiUidNR4.jpg	Ve8wi8XF7D902saIgPgEw4CLnM8ZThRckZRpSdjs.jpg	0	0	0	0	0	2021-12-13 10:52:45	2021-12-13 13:10:41
218	1	プッタネスカ（娼婦風パスタ）	1.オリーブ水煮とニンニクは4〜5枚のスライスにする。\\r\\n2.フライパンにオリーブ油をひき、弱火で1のにんにくをじっくりと炒める。にんにくの香りが立って薄く色がついてきたら、種を取った赤唐辛子とアンチョビを入れ、さらにケッパーとオリーブの水煮を加えて炒める。\\r\\n3.２にトマトの水煮、コンソメの素、砂糖、塩、胡椒をする。\\r\\n4.３にゆでたパスタを加え混ぜ、味を整えてから器に盛り付け、刻んだパセリをふる。\\r\\n\\r\\n※好みで具材に魚介、ツナ、ベーコン、ナス、玉ねぎなどを入れたり、粉チーズをかけても良い。	4	45	0	2	1	\N	LlFzzgGQ2Dm3KB0IFRVRIXHB0oKRbVCezXvAIs65.jpg	YAkf5Z411oZv71y2IXhTi6QcFMCGYSDklTyRkhDJ.jpg	0	1	0	0	0	2021-12-13 13:22:42	2021-12-13 13:28:17
219	1	ねばねばバクダン丼	1.マグロはボールに入れ、ごま油小さじ１、醤油小さじ１をかけてラップをかけて１時間ほど冷蔵庫で漬け込みます。ご飯は炊いておく。\\r\\n2.なますはABCの21.12Bメニューを参考に塩揉みして、レモンと酢のタレに20分漬け込んでおく。\\r\\n3.長芋は皮を剥いてすりおろしておく。\\r\\n4.オクラは板ずりしてさっと茹でて、輪切りにしておく。\\r\\n5.ご飯の上にマグロ、オクラ、なます、メカブ、長芋、刻みのり、納豆の順で並べ、真ん中に、卵黄を乗っける。上からだし醤油などをかけて召し上がる。	4	61	0	1	1	\N	SdcEFDQJYqRUglXo9tmd65i6diL5p9nFtubbjOO6.jpg	\N	1	1	1	1	0	2021-12-13 13:36:13	2021-12-13 13:42:53
220	1	小松菜とわかめの混ぜごはん	1.小松菜は葉と茎に分け、それぞれ細かく刻む。乾燥わかめは水に5分ほど浸して戻し、しっかり水気を切って細かく刻む。	4	60	0	1	1	\N	dw6htEJsp7WyYeFiW9Jq3ZnJaAccxClTDQJoJq7G.png	\N	1	1	1	0	0	2021-12-13 13:57:07	2021-12-13 13:58:01
221	1	もやしのナムル	もやしは二、三分茹でてざるにあげ、水けをきってボウルに入れる\r\n塩とゴマ油を入れてよく混ぜ、できあがり	3	61	0	4	2	0	MJnuvcWea0EXu2zmfp3nWODlWhWAamHtEDk8u9SW.jpg	\N	0	0	0	0	0	2025-02-01 06:32:15	2025-02-01 07:35:27
223	1	牛肉のデミポロネーゼ	1 玉ねぎは根元を除き、ザク切り。セロリはザク切り。にんじんは皮をむき、ザク切り。\r\n2 ニンニクは皮・芯を除き、ザク切りにし、玉ねぎ・セロリ・にんじんと共に、チョッパーでみじん切り。\r\n3 牛バラ薄切りにくは1cm角くらいに切り、塩こさじ1/4、塩こしょう少々で下味をつける。\r\n4 鍋にバター10gを熱し、半分溶けたら香味野菜を入れて、じっくり炒める。（弱火〜中火で10分）\r\n下準備：リングイネはタイミングを見計らって、アルデンテより少し硬めに茹でておく。\r\n5 ④を端に寄せ、牛肉に薄力粉をまぶして加え、ほぐしながら炒め合わせる。トマトペースト小さじ2を加えてさっと炒める。\r\n6 火を止め、赤ワイン小さじ４を加え、再び火をつけアルコール分を飛ばす。\r\n7 以下を加え、一混ぜして煮詰める。（弱火〜中火10分〜）デミグラスソース280g、水200cc、ウスターソース小さじ4、コンソメ小さじ1/2、砂糖小さじ1、ローリエ1枚。\r\n8 ローリエを取り出し、塩胡椒少々で味を整える。水気をしっかり切ったリングイネをソースに加えてあえる。\r\n9 器に盛り付ける。ソースを上から盛り、生クリームをかける。\r\n\r\n香味野菜の炒め加減：香味野菜は良い香りがしてくるまで、じっくりと時間をかけて炒める。焦がしてしまうと苦味に変わってしまうので、注意する。\r\nリングイネの湯で加減：最後にソースの中であえるため、若干硬めに茹で、ちょうど良い硬さで食べられるようにする。	5	63	0	2	0	0	\N	\N	0	1	0	0	0	2025-02-11 06:46:07	2025-02-11 06:46:07
\.


--
-- Data for Name: seasonings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seasonings (id, name, recipe_id, body, created_at, updated_at) FROM stdin;
156	下味A	168	しょうがのしぼり汁小さじ1/2・酒小さじ1/2・塩少々	2021-11-10 11:11:18	2021-11-10 11:11:18
157	調味料A	168	長ねぎ(みじん切り)5cm分・鶏ガラスープの素小さじ1/4・酒大さじ1・砂糖・片栗粉各小さじ1/4・塩こしょう各少々・	2021-11-10 11:11:18	2021-11-10 11:11:18
533	ソース具材A	148	生クリーム200g・塩小さじ1/4・黒こしょう少々	2021-11-27 08:21:48	2021-11-27 08:21:48
535	味付け用a	153	トマトケチャップ・砂糖各大さじ1・酢大さじ2・酒・きざみしょうが・片栗粉各小さじ1・豆板醤・鶏ガラスープの素各小さじ1/2	2021-11-27 08:23:53	2021-11-27 08:23:53
539	A	175	しょうゆ・白い炒りごま各大さじ1・鶏ガラスープの素・ラー油各小さじ1/2	2021-11-27 08:31:35	2021-11-27 08:31:35
540	A	177	酒・みりん・しょうゆ大さじ1	2021-11-27 08:33:41	2021-11-27 08:33:41
541	調味料A	173	おろしにんにく・おろししょうが各小さじ1・しょうゆ・酒各大さじ1・塩こしょう少々	2021-11-27 08:34:21	2021-11-27 08:34:21
542	A	174	鶏ガラスープの素・ごま油各小さじ1・白い炒りごま小さじ1・豆板醤小さじ1/2	2021-11-27 08:35:10	2021-11-27 08:35:10
543	A	172	にんにく1片・しょうが1片	2021-11-27 08:35:46	2021-11-27 08:35:46
544	B	172	ケチャップ大さじ2・豆板醤小さじ2・酒大さじ1/2・塩少々	2021-11-27 08:35:46	2021-11-27 08:35:46
545	C	172	水100ml・鶏ガラスープの素小さじ1・こしょう適量	2021-11-27 08:35:46	2021-11-27 08:35:46
603	合わせ調味料a	152	水400cc・鶏ガラスープの素・砂糖・酒各小さじ2・オイスターソース小さじ1・塩小さじ1/4・白こしょう少々	2021-11-28 11:29:15	2021-11-28 11:29:15
604	合わせ調味料a	156	しょうゆこうじ小さじ4・塩小さじ1/4・黒こしょう・ナツメグ各少々	2021-11-28 11:33:40	2021-11-28 11:33:40
605	味付け用b	156	デミグラスソース240g・しょうゆこうじ小さじ2・砂糖・きざみにんにく各小さじ1	2021-11-28 11:33:40	2021-11-28 11:33:40
606	材料a	161	イースト小さじ1・砂糖大さじ1・塩小さじ1	2021-11-28 11:39:50	2021-11-28 11:39:50
627	立て塩	2	水500cc・塩大さじ1	2021-12-06 07:18:59	2021-12-06 07:18:59
628	味付け	2	白だし小さじ1・市販のきざみしょうが小さじ1	2021-12-06 07:18:59	2021-12-06 07:18:59
629	味付け用	3	水400cc・鶏ガラスープの素小さじ2・酒小さじ2・片栗粉小さじ1・塩小さじ1/8・白こしょう少々	2021-12-06 07:19:57	2021-12-06 07:19:57
631	シロップ用	4	湯40cc・フロストシュガー小さじ2・クコの実12粒	2021-12-06 07:21:21	2021-12-06 07:21:21
641	ニョッキ用材料N	9	強力粉100g・粉チーズ20g・塩小さじ1/4	2021-12-06 07:25:20	2021-12-06 07:25:20
642	チーズソースA	9	粉チーズ小さじ4・塩小さじ1/8	2021-12-06 07:25:20	2021-12-06 07:25:20
644	鶏肉漬け込み用A	10	醤油小さじ4・チリパウダー・酒・酢・みりん各小さじ2・コンソメ顆粒小さじ1・市販おろししょうが・市販おろしにんにく各小さじ1/2・黒こしょう少々	2021-12-06 07:25:58	2021-12-06 07:25:58
646	味付け用A	11	塩小さじ1/8・黒こしょう少々・マヨネーズ小さじ4・砂糖小さじ1	2021-12-06 07:26:49	2021-12-06 07:26:49
648	炒め用A	14	みりん小さじ2・白だし小さじ1	2021-12-06 07:28:39	2021-12-06 07:28:39
649	ドレッシング	14	キューピー深煎りごまゆずテイストドレッシング	2021-12-06 07:28:39	2021-12-06 07:28:39
650	卵味付けA	17	塩小さじ1/8・黒こしょう小さじ1/2・生クリーム80g	2021-12-06 07:40:10	2021-12-06 07:40:10
651	味付けB	17	1人分; 豆板醤小さじ1/2・粉チーズ小さじ2	2021-12-06 07:40:10	2021-12-06 07:40:10
652	ペーストC	17	きざみにんにく小さじ2・トマトペースト大さじ1	2021-12-06 07:40:10	2021-12-06 07:40:10
653	盛り付け用	17	1人分; 温泉卵1個・粉チーズ小さじ1/2・黒こしょう少々	2021-12-06 07:40:10	2021-12-06 07:40:10
654	鶏肉下味用	18	塩小さじ1/4・黒こしょう少々	2021-12-06 07:40:48	2021-12-06 07:40:48
655	マスタードソース用	18	粒マスタード大さじ2・砂糖小さじ2・醤油小さじ1	2021-12-06 07:40:48	2021-12-06 07:40:48
658	生地用	21	薄力粉・アーモンドパウダー各小さじ4	2021-12-06 07:44:08	2021-12-06 07:44:08
659	肉下味用	22	砂糖・塩各小さじ1/2・黒こしょう少々(多め)	2021-12-06 07:45:00	2021-12-06 07:45:00
660	ソースA	22	しょうゆこうじ・水各小さじ4・黒こしょう少々	2021-12-06 07:45:00	2021-12-06 07:45:00
661	スープ素A	23	カットトマト240g・水400cc・ローリエ1枚・コンソメ・砂糖・ウスターソース各小さじ2	2021-12-06 07:46:07	2021-12-06 07:46:07
663	ムース素A	25	プレーンヨーグルト80g・サワークリーム40g・砂糖小さじ4	2021-12-06 07:51:58	2021-12-06 07:51:58
665	調味料A	27	みそ・きび砂糖・しょうゆ・酒各小さじ2・きざみしょうが・きざみにんにく各小さじ1	2021-12-06 07:53:26	2021-12-06 07:53:26
667	味付け用A	29	調味酢小さじ2・ゆずこしょう小さじ1/4	2021-12-06 07:54:52	2021-12-06 07:54:52
670	調味料A	31	水480cc~520cc・和風だしの素小さじ1	2021-12-06 07:56:41	2021-12-06 07:56:41
671	調味料B	31	酒小さじ2・しょうゆ小さじ1/2・塩小さじ1/8	2021-12-06 07:56:41	2021-12-06 07:56:41
672	調味料A	32	生クリーム120g・塩小さじ1/8・ハーブ&スパイスミックス調味料小さじ1前後	2021-12-06 07:57:20	2021-12-06 07:57:20
673	ドレッシングA	33	1人分; トリュフオイル小さじ2・岩塩・黒こしょう各少々	2021-12-06 07:58:11	2021-12-06 07:58:11
674	スープ素A	34	水360~400cc・コンソメ小さじ1・塩小さじ1/4・黒こしょう少々・ローリエ1枚	2021-12-06 07:59:15	2021-12-06 07:59:15
697	調味料A	36	市販のおろしにんにく少々、塩少々、パセリ（乾燥）少々　★電子レンジから取り出した後、絡める	2021-12-06 08:23:27	2021-12-06 08:23:27
698	ソース用B	36	1人分：レモン果汁1/8個分、（しょうゆ・みりん）各小さじ1、酒小さじ1/2、おろしにんにく少々、黒こしょう少々　★カップに入れてラップをせず電子レンジ600w30s〜、2人分なら1m〜	2021-12-06 08:23:27	2021-12-06 08:23:27
700	スープ素A	37	水40cc・牛乳60cc・粉チーズ小さじ1/2・コンソメ小さじ1/4・黒こしょう少々	2021-12-06 08:25:41	2021-12-06 08:25:41
705	万能だれ	42	オイスターソース大さじ2、酒小さじ2、市販のきざみしょうが小さじ4、市販のきざみにんにく小さじ2　★混ぜ合わせ、鰤の竜田揚げ用に小さじ4、長芋わかめ天用に小さじ2取り分ける。残りはチャーシュー用に残しておく。	2021-12-06 08:37:50	2021-12-06 08:37:50
869	水溶き片栗粉B	206	片栗粉小さじ1/2・水小さじ1	2021-12-11 07:08:25	2021-12-11 07:08:25
706	わかめ衣A	42	万能だれから小さじ2、薄力粉大さじ2、片栗粉大さじ1、水小さじ4を混ぜ合わせる、刻んだわかめをまぜる。	2021-12-06 08:37:50	2021-12-06 08:37:50
707	万能だれ	43	オイスターソース大さじ2、酒小さじ2、市販のきざみしょうが小さじ4、市販のきざみにんにく小さじ2　★混ぜ合わせ、鰤の竜田揚げ用に小さじ4、長芋わかめ天用に小さじ2取り分ける。残りはチャーシュー用に残しておく。	2021-12-06 08:39:54	2021-12-06 08:39:54
708	スープA	47	水600~640cc・コンソメ小さじ2・サフラン24本	2021-12-06 09:02:29	2021-12-06 09:02:29
709	ドレッシング用材料A	48	酢小さじ2・粒マスタード小さじ1・エキストラバージンオリーブオイル小さじ2	2021-12-06 09:03:26	2021-12-06 09:03:26
710	塩キャラメルクリームA	49	カスタードクリームパウダー小さじ8・牛乳60cc・生クリーム小さじ4・キャラメルシロップ小さじ1・岩塩少々	2021-12-06 09:04:39	2021-12-06 09:04:39
711	ソースA	50	カットトマト400g・水80cc・コンソメ・砂糖各小さじ1	2021-12-06 09:05:24	2021-12-06 09:05:24
712	スープ素A	51	水520~560cc・コンソメ顆粒小さじ2	2021-12-07 13:04:34	2021-12-07 13:04:34
713	チョコレートクリーム材料	53	チョコレートシロップ小さじ1・生クリーム40g	2021-12-07 13:06:05	2021-12-07 13:06:05
714	合わせ調味料A	54	しょうゆ・みりん各大さじ1・トマトケチャップ・砂糖各小さじ2・コチュジャン小さじ1・市販のおろしにんにく小さじ1/2	2021-12-07 13:07:59	2021-12-07 13:07:59
715	水A	55	水120cc・鶏ガラスープの素小さじ1/4	2021-12-07 13:08:33	2021-12-07 13:08:33
716	生地用A	57	薄力粉60g・アーモンドパウダー20g・ベーキングパウダー小さじ1/2	2021-12-07 13:10:01	2021-12-07 13:10:01
717	湿らせたパン粉A	58	パン粉大さじ8・牛乳大さじ4	2021-12-07 13:10:36	2021-12-07 13:10:36
718	ハンバーグソースB	58	水160cc・コンソメ小さじ1/2・砂糖・しょうゆ各小さじ2・塩・黒こしょう各少々	2021-12-07 13:10:36	2021-12-07 13:10:36
719	水溶き片栗粉C	58	片栗粉小さじ1・水小さじ2	2021-12-07 13:10:36	2021-12-07 13:10:36
720	コーヒー液①	62	①インスタントコーヒー小さじ1・水小さじ2	2021-12-07 13:13:34	2021-12-07 13:13:34
721	コーヒー液②	62	②インスタントコーヒー小さじ1・水小さじ4	2021-12-07 13:13:34	2021-12-07 13:13:34
722	生地A	62	牛乳100cc・生クリーム40g・砂糖大さじ2	2021-12-07 13:13:34	2021-12-07 13:13:34
723	衣用材料A	63	卵1個・片栗粉大さじ4・水小さじ2・サラダ油小さじ1	2021-12-07 13:14:21	2021-12-07 13:14:21
724	南蛮酢B	63	酢40cc・しょうゆ・砂糖各大さじ2・赤唐辛子8切れ	2021-12-07 13:14:21	2021-12-07 13:14:21
725	茹で卵用C	63	水60cc・酢小さじ1・塩小さじ1/8	2021-12-07 13:14:21	2021-12-07 13:14:21
726	塩水A	66	水500cc・塩小さじ1	2021-12-07 13:15:50	2021-12-07 13:15:50
727	ホイップクリーム用A	67	カスタードクリームパウダー大さじ2・砂糖小さじ4・抹茶小さじ1	2021-12-07 13:16:32	2021-12-07 13:16:32
729	ご飯用材料A	68	米160cc・水160cc・塩少々	2021-12-07 13:17:45	2021-12-07 13:17:45
730	調味液A(ボウル1つ分) × 2	69	トマトジュース80cc・水・砂糖各小さじ4・トマトケチャップ・調味酢各小さじ2・しょうゆ・片栗粉各小さじ1	2021-12-07 13:19:37	2021-12-07 13:19:37
732	立て塩A	70	(水500cc・塩大さじ2) × 2回分	2021-12-07 13:21:39	2021-12-07 13:21:39
733	クリーム材料A	75	煉うに20g・生クリーム60g	2021-12-07 13:30:00	2021-12-07 13:30:00
734	スープ用材料B	75	水160~180cc・トマトジュース200cc・コンソメ小さじ1/2・ローリエ1枚・砂糖小さじ1・塩小さじ1/8・黒こしょう少々	2021-12-07 13:30:00	2021-12-07 13:30:00
735	味付け用A	76	マヨネーズ小さじ8・粉チーズ小さじ4・塩小さじ1/8・黒こしょう・ナツメグ各少々・牛乳20cc	2021-12-07 13:38:49	2021-12-07 13:38:49
736	パンたね材料A	77	インスタントドライイースト小さじ1・砂糖大さじ2・塩小さじ1・仕込み水160cc・強力粉160g・薄力粉120g	2021-12-07 13:39:42	2021-12-07 13:39:42
737	生地A	78	生クリーム60g・牛乳140cc・砂糖小さじ4	2021-12-07 13:40:33	2021-12-07 13:40:33
741	ソースA	79	デミグラスソース1缶・水280cc・ウスターソース・はちみつ各小さじ2・トマトケチャップ・コンソメ各小さじ1・ローリエ1枚	2021-12-07 13:47:15	2021-12-07 13:47:15
742	トマトライスB	79	米240cc・トマトソース120cc・水160cc・コンソメ小さじ1・塩小さじ1/4・黒こしょう少々	2021-12-07 13:47:15	2021-12-07 13:47:15
743	味付けC	79	(牛乳大さじ1・塩黒こしょう各少々) × 4人分	2021-12-07 13:47:15	2021-12-07 13:47:15
744	いちごシュガーA	81	粉糖小さじ2・いちごフリーズドライパウダー小さじ1/4・(1人分)	2021-12-07 13:48:18	2021-12-07 13:48:18
747	テンメジャン具材A	82	サラダ油小さじ4・白ねぎ20g・豆板醤大さじ1・豆豉小さじ2・青花椒塩小さじ2・市販きざみにんにく・きざみしょうが各小さじ2	2021-12-07 13:49:19	2021-12-07 13:49:19
748	合わせ調味液B	82	テンメジャン32g・砂糖・しょうゆ各小さじ2・酒・鶏ガラスープの素各小さじ1・水200cc	2021-12-07 13:49:19	2021-12-07 13:49:19
749	準備A	83	テンメジャン16g・しょうゆ・酒・酢・砂糖各小さじ2・ごま油・市販の刻みしょうが・市販のきざみにんにく各小さじ1・青花椒塩小さじ1/2・	2021-12-07 13:50:19	2021-12-07 13:50:19
750	白ねぎ用B湯	83	熱湯1L・酒大さじ1	2021-12-07 13:50:19	2021-12-07 13:50:19
751	卵用A	84	きざみしょうが小さじ1/2・塩小さじ1/8	2021-12-07 13:51:21	2021-12-07 13:51:21
752	シロップA	85	湯40cc・砂糖小さじ2	2021-12-07 13:52:04	2021-12-07 13:52:04
753	マリネ用A	86	オリーブオイル・はちみつ各小さじ2	2021-12-07 13:58:57	2021-12-07 13:58:57
754	ソース用味付けB	86	カットトマト200g・ウスターソース・チリパウダー各小さじ2	2021-12-07 13:58:57	2021-12-07 13:58:57
758	レモングリーンソースA	91	レモンの果汁小さじ2・コンソメ小さじ1/4・オリーブオイル小さじ4	2021-12-07 14:08:19	2021-12-07 14:08:19
759	味付けB	91	水40cc・コンソメ小さじ1/4	2021-12-07 14:08:19	2021-12-07 14:08:19
760	合わせ調味料A	92	しょうゆ小さじ2・はちみつ小さじ1・塩小さじ1/4・黒こしょう少々	2021-12-07 14:09:00	2021-12-07 14:09:00
761	米	92	4人分で、米240cc・水240cc	2021-12-07 14:09:00	2021-12-07 14:09:00
762	味付け用A	94	マヨネーズ小さじ4・塩小さじ1/8・黒こしょう少々	2021-12-07 14:10:08	2021-12-07 14:10:08
763	チーズクリームA	95	プレーンヨーグルト40g・レモンの果汁小さじ2	2021-12-07 14:11:27	2021-12-07 14:11:27
768	ソース用A（ア）	96	トマトソース160g・調味酢小さじ2・コンソメ小さじ1/2	2021-12-07 14:16:38	2021-12-07 14:16:38
769	ディル・ソースB（冷）	96	キューピーレモンドレッシング大さじ2・エキストラバージンオリーブオイル小さじ2	2021-12-07 14:16:38	2021-12-07 14:16:38
770	下味A	97	岩塩小さじ1/4・黒こしょう少々・バジル小さじ1/2	2021-12-07 14:17:34	2021-12-07 14:17:34
771	練り粉A	99	米粉32g・片栗粉大さじ2・鶏ガラスープの素小さじ1/2・水50cc	2021-12-07 14:19:15	2021-12-07 14:19:15
772	練り粉B	99	米粉32g・片栗粉大さじ2・水50cc	2021-12-07 14:19:15	2021-12-07 14:19:15
773	下味用C	99	プレーンヨーグルト120g・鶏ガラスープの素・酒各小さじ2・おろししょうが・おろしにんにく各小さじ1	2021-12-07 14:19:15	2021-12-07 14:19:15
774	ヤンニョムだれD	99	水大さじ2・コチュジャン小さじ4・きび砂糖・酒・酢各小さじ2・おろしにんにく小さじ1/2	2021-12-07 14:19:15	2021-12-07 14:19:15
775	味付け用A	100	コチュジャン小さじ4・ごま油・しょうゆ各小さじ2・きび砂糖小さじ1	2021-12-07 14:20:31	2021-12-07 14:20:31
776	マカロンA	102	アーモンドパウダー・粉糖各40g	2021-12-07 14:22:40	2021-12-07 14:22:40
777	メレンゲ用B	102	マカロンミックス20g・水小さじ2・レモンの果汁小さじ1/2	2021-12-07 14:22:40	2021-12-07 14:22:40
778	合わせ調味料A	103	砂糖・酒・オイスターソース各こさじ2・だしじょうゆ小さじ1・片栗粉小さじ1/2	2021-12-07 14:25:18	2021-12-07 14:25:18
779	麺味付け調味料B	103	ごま油小さじ2・オイスターソース・だしじょうゆ・鶏ガラスープの素各小さじ1・黒こしょう少々	2021-12-07 14:25:18	2021-12-07 14:25:18
780	調味料A	104	酒・きざみにんにく・きざみしょうが各小さじ1・鶏ガラスープの素小さじ1/2・黒こしょう少々	2021-12-07 14:26:16	2021-12-07 14:26:16
781	たまごプリン素A	105	フロストシュガー小さじ4・バニラオイル適量	2021-12-07 14:27:15	2021-12-07 14:27:15
782	調味料A→B	106	きざみしょうが小さじ 1→ドレッシング小さじ4→片栗粉小さじ8→水小さじ2	2021-12-07 14:29:50	2021-12-07 14:29:50
783	A	108	素干し海老・ドレッシング・水各小さじ2	2021-12-07 14:36:51	2021-12-07 14:36:51
784	味付けA	109	ドレッシング小さじ4・砂糖小さじ1	2021-12-07 14:37:44	2021-12-07 14:37:44
791	調味料A	114	チリパウダー小さじ1/2・塩小さじ1/8・牛乳小さじ1・マヨネーズ大さじ2	2021-12-07 14:43:07	2021-12-07 14:43:07
792	みそ汁の味付けA	118	水480~520cc・塩麹小さじ1・	2021-12-07 14:46:16	2021-12-07 14:46:16
793	抹茶大豆粉A	119	抹茶小さじ1/2・大豆粉小さじ2	2021-12-07 14:48:55	2021-12-07 14:48:55
794	トッピング用B	119	抹茶大豆粉小さじ1・砂糖小さじ2	2021-12-07 14:48:55	2021-12-07 14:48:55
795	わらび餅C	119	わらび餅粉32g・砂糖小さじ8・水120cc	2021-12-07 14:48:55	2021-12-07 14:48:55
799	生地A	124	強力粉100g・薄力粉20g・塩小さじ1/4・水55~65cc	2021-12-07 14:52:50	2021-12-07 14:52:50
800	調味料B	124	粉ゼラチン・ごま油各小さじ2・酒・砂糖・きざみしょうが・オイスターソース各小さじ1・鶏ガラスープの素小さじ1/2	2021-12-07 14:52:50	2021-12-07 14:52:50
801	調味料A	125	しょうゆ・酒・きざみしょうが小さじ各2	2021-12-07 14:53:23	2021-12-07 14:53:23
802	調味料B	125	青花椒塩小さじ2・サラダ油小さじ4	2021-12-07 14:53:23	2021-12-07 14:53:23
803	調味料A	126	水480~520cc・鶏ガラスープの素小さじ2・豆板醤・片栗粉各小さじ1/2・塩小さじ1/8・黒こしょう少々	2021-12-07 14:53:54	2021-12-07 14:53:54
804	割り下A	128	酒・みりん各大さじ2・だしじょうゆ小さじ8・砂糖小さじ4	2021-12-07 14:57:32	2021-12-07 14:57:32
809	ドレッシング用A	134	スイートチリソース・マヨネーズ各大さじ1	2021-12-07 15:01:53	2021-12-07 15:01:53
812	うどん生地A	136	(薄力粉80g・強力粉80g) × 2人分ずつで作業　　2人分×2	2021-12-07 15:04:02	2021-12-07 15:04:02
813	つゆB	136	トマトジュース200cc・水40cc・だしじょうゆ大さじ2・ライムの果汁小さじ4前後・きざみにんにく小さじ1・黒こしょう少々	2021-12-07 15:04:02	2021-12-07 15:04:02
814	サラダ下味A	137	だしじょうゆ小さじ4・酒小さじ2・市販きざみしょうが・市販きざみにんにく各小さじ1	2021-12-07 15:05:07	2021-12-07 15:05:07
815	タレの材料A	138	水60cc・砂糖大さじ2・だしじょうゆ小さじ2・片栗粉小さじ1	2021-12-07 15:06:02	2021-12-07 15:06:02
816	立て塩	139	(水1Lに塩大さじ2) × 4　4尾分。	2021-12-07 15:07:09	2021-12-07 15:07:09
817	だしA	140	水260cc・しょうゆ(まろやか)・酒各大さじ2・みりん・砂糖各大さじ1・和風だしの素小さじ1	2021-12-07 15:07:49	2021-12-07 15:07:49
818	チキンボール用B	143	パン粉大さじ4・無調製豆乳大さじ2・マヨネーズ小さじ2・みそ・きざみしょうが各小さじ1	2021-12-07 15:09:58	2021-12-07 15:09:58
819	卵液用C	143	無調製豆乳大さじ1・砂糖小さじ2・塩少々	2021-12-07 15:09:58	2021-12-07 15:09:58
820	白玉粉用A	147	白玉粉60g・砂糖小さじ2・水60cc~	2021-12-07 15:12:35	2021-12-07 15:12:35
849	味付け用A	184	ローリエ1/2枚・黒こしょう小さじ1/8・調味酢40cc	2021-12-11 04:17:26	2021-12-11 04:17:26
850	粉A	185	薄力粉40g・砂糖小さじ4	2021-12-11 04:18:30	2021-12-11 04:18:30
851	合わせ調味料A	188	白ワイン40cc・醤油小さじ2・砂糖小さじ1・黒こしょう少々	2021-12-11 04:34:07	2021-12-11 04:34:07
854	A	194	無調製豆乳120cc・生クリーム40g・砂糖小さじ8	2021-12-11 04:38:39	2021-12-11 04:38:39
861	A	209	薄力粉40g・ベーキングパウダー小さじ1/2	2021-12-11 04:47:45	2021-12-11 04:47:45
862	ソースA	183	市販のカットトマト200g・トマトケチャップ大さじ4・調味酢大さじ1・ローリエ1枚・水80cc	2021-12-11 06:46:05	2021-12-11 06:46:05
863	A	190	砂糖小さじ4・酢40cc・塩小さじ1/2	2021-12-11 06:48:12	2021-12-11 06:48:12
864	B	190	(醤油・みりん・酒)各小さじ1・練りわさび小さじ1/4	2021-12-11 06:48:12	2021-12-11 06:48:12
865	A	195	酢小さじ4・ハーブ&スパイスミックス調味料大さじ1・きざみにんにく小さじ2・オリーブオイル小さじ2	2021-12-11 06:58:17	2021-12-11 06:58:17
866	A	199	水280cc・調味酢小さじ4・酒小さじ4	2021-12-11 06:59:39	2021-12-11 06:59:39
867	A	200	酒小さじ1・きざみにんにく小さじ1・黒こしょう少々	2021-12-11 07:00:57	2021-12-11 07:00:57
868	A	206	水200cc・コンソメ小さじ1・ローリエ1枚	2021-12-11 07:08:25	2021-12-11 07:08:25
872	豚肉下味用	1	醤油小さじ2・酒小さじ2・市販きざみしょうが小さじ1・片栗粉小さじ4	2021-12-13 08:16:32	2021-12-13 08:16:32
873	あん	1	黒酢100cc・水40cc・フロストシュガー大さじ4・醤油酒各小さじ4・片栗粉小さじ2・塩小さじ1/8	2021-12-13 08:16:32	2021-12-13 08:16:32
874	鶏肉下味用	5	塩小さじ1/2・黒こしょう少々・マヨネーズ大さじ4・	2021-12-13 09:02:18	2021-12-13 09:02:18
875	加熱時使用	5	サラダ油小さじ2・市販おろしにんにく・市販おろししょうが・クミンシード各小さじ2・ローリエ1枚	2021-12-13 09:02:18	2021-12-13 09:02:18
876	調味料A	5	カットトマト400g・水300cc・コンソメ小さじ4・砂糖大さじ2	2021-12-13 09:02:18	2021-12-13 09:02:18
877	調味料B	5	クミンパウダー・ガラムマサラ・カレー粉各小さじ1・レッドペッパーお好みで小さじ1/4前後	2021-12-13 09:02:18	2021-12-13 09:02:18
878	調味料C	6	プレーンヨーグルト200g・コンソメ・砂糖各小さじ1	2021-12-13 09:03:00	2021-12-13 09:03:00
879	調味料D	6	クミンパウダー・ガラムマサラ・カレー粉各小さじ1・レッドペッパーお好みで小さじ1/4	2021-12-13 09:03:00	2021-12-13 09:03:00
880	生地用A	7	薄力粉180g・・ベーキングパウダー小さじ1/2・砂糖大さじ2・塩小さじ1/4	2021-12-13 09:03:32	2021-12-13 09:03:32
881	仕込み水A	7	42~43°C水80cc・インスタントドライイースト小さじ2/1・	2021-12-13 09:03:32	2021-12-13 09:03:32
882	仕込み水B	7	42~43°C水小さじ2前後・	2021-12-13 09:03:32	2021-12-13 09:03:32
883	スープ用B	87	コンソメ小さじ1・塩小さじ1/4・黒こしょう少々	2021-12-13 09:08:03	2021-12-13 09:08:03
884	鶏スープ材料	111	水680cc・ナンプラー小さじ4・鶏ガラスープの素小さじ2	2021-12-13 09:26:18	2021-12-13 09:26:18
885	調味料A	111	赤唐辛子・クミンシード・サラダ油各小さじ1	2021-12-13 09:26:18	2021-12-13 09:26:18
886	調味料B	111	おろししょうが小さじ2・おろしにんにく小さじ1・カレー粉大さじ1	2021-12-13 09:26:18	2021-12-13 09:26:18
887	調味料C	111	鶏スープ＋水680cc・ココナッツミルクパウダー小さじ8・チリパウダー大さじ1・コンソメ・バジル・パセリ各小さじ1	2021-12-13 09:26:18	2021-12-13 09:26:18
888	ウイング調味料A	113	ナンプラー・チリパウダー各小さじ2	2021-12-13 09:27:26	2021-12-13 09:27:26
889	ウイング調味料B	113	ココナッツミルクパウダー・薄力粉各小さじ2	2021-12-13 09:27:26	2021-12-13 09:27:26
890	調味料A	120	ナンプラー・きび砂糖各小さじ1	2021-12-13 09:28:35	2021-12-13 09:28:35
891	調味料A	121	ナンプラー・きざみにんにく・きび砂糖各小さじ1・黒こしょう少々	2021-12-13 09:29:04	2021-12-13 09:29:04
892	調味料A	122	きび砂糖大さじ1・ナンプラー小さじ2・赤唐辛子こさじ1	2021-12-13 09:31:19	2021-12-13 09:31:19
893	立て塩	132	水500cc・塩大さじ1	2021-12-13 09:32:24	2021-12-13 09:32:24
894	カレールーA	132	チリインオイル・生クリーム各40g・ナンプラー・砂糖各小さじ2	2021-12-13 09:32:24	2021-12-13 09:32:24
895	ルーB	132	鶏ガラスープの素小さじ1/2・水60cc	2021-12-13 09:32:24	2021-12-13 09:32:24
896	ピーナッツダレ	133	ピーナッツクリーム小さじ4・マスタード・ウスターソース・市販のきざみにんにく各小さじ1味にんにく	2021-12-13 09:34:28	2021-12-13 09:34:28
897	調味料A	178	水150cc・醤油みりん各大さじ2 ・砂糖大さじ1・和風だし小さじ1/3	2021-12-13 11:13:04	2021-12-13 11:13:04
899	A	205	水400cc・薄口醤油小さじ2・酒小さじ2・みりん小さじ2・和風だしの素小さじ1・片栗粉大さじ1	2021-12-13 11:14:59	2021-12-13 11:14:59
902	調味料A	179	桃屋の味付け搾菜40g(1/2瓶)・水40cc・片栗粉小さじ1/2・黒こしょう少々	2021-12-13 11:27:19	2021-12-13 11:27:19
903	味付け調味料A	26	きび砂糖小さじ8・みりん大さじ1・しょうゆ小さじ1/4	2021-12-13 11:35:17	2021-12-13 11:35:17
904	立て塩	28	(水500cc・塩大さじ1) × 2回	2021-12-13 11:38:18	2021-12-13 11:38:18
922	合わせ調味料	13	みそ(液体)・みりん各大さじ2・きざみしょうが小さじ4・片栗粉小さじ1/2	2021-12-13 13:01:23	2021-12-13 13:01:23
924	調味料A	220	和風だしの素小さじ1,	2021-12-13 13:58:01	2021-12-13 13:58:01
926	薄力粉	223	小さじ2	2025-02-11 06:46:07	2025-02-11 06:46:07
927	市販のデミグラスソース	223	280g	2025-02-11 06:46:07	2025-02-11 06:46:07
928	生クリーム	223	20g	2025-02-11 06:46:07	2025-02-11 06:46:07
929	ウスターソース	223	小さじ4	2025-02-11 06:46:07	2025-02-11 06:46:07
930	ローリエ	223	1枚	2025-02-11 06:46:07	2025-02-11 06:46:07
\.


--
-- Data for Name: seasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seasons (id, name, created_at, updated_at) FROM stdin;
4	冬	2025-02-11 05:53:21	2025-02-11 05:53:21
5	秋	2025-02-11 05:53:29	2025-02-11 05:53:29
6	夏	2025-02-11 05:53:34	2025-02-11 05:53:34
7	春	2025-02-11 05:53:39	2025-02-11 05:53:39
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
2	奥川	mai_eternalmelody555@yahoo.co.jp	\N	$2y$10$K0YKhwc4hMAZaJFUz45NIOOkoTYQIbx6Qwu5NbMOVHRQF5nXrBZ26	m0yyBinbGrOrYz9DzGdgQ9rxk07f3Vuq7GmBq7AccQGJX6VSf363Xajv3I7x	2024-12-11 01:04:37	2024-12-11 01:04:37
1	rika okugawa	Okuoku@localhost	\N	$2y$10$CqoYCYzc70xkHuTj.Gto1eC89tZ5k9/XB3hq6YLfYi0eMLHeKgdmG	cAIz4KkllokNWXxA47xHMYtwhc74luOLNajiPTdgu4vkQh127ZC2Sz3asdER	2021-11-10 04:10:53	2021-11-10 04:10:53
3	松田睦	matsuda_mutsumi@r3.dion.ne.jp	\N	$2y$10$gU/DA43JVSmDievx0lcyzOSJL9g5M2AlG.IfC2CAwd5MPAqaLmST2	Jsk8Qf9X7kQ3NnYQLUFpYYlxT19aJDc8Www8Jre6DnYP5sxpO9A7kZ6A2kfI	\N	\N
\.


--
-- Name: howtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.howtos_id_seq', 4, true);


--
-- Name: l_trans_qs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.l_trans_qs_id_seq', 46, true);


--
-- Name: learn_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.learn_questions_id_seq', 44, true);


--
-- Name: mainsubs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mainsubs_id_seq', 4, true);


--
-- Name: material_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.material_categories_id_seq', 14, true);


--
-- Name: materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_id_seq', 315, true);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menus_id_seq', 63, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 18, true);


--
-- Name: nutrient_materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nutrient_materials_id_seq', 486, true);


--
-- Name: nutrients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nutrients_id_seq', 21, true);


--
-- Name: recipe_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipe_categories_id_seq', 10, true);


--
-- Name: recipe_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipe_countries_id_seq', 10, true);


--
-- Name: recipe_materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipe_materials_id_seq', 5319, true);


--
-- Name: recipe_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipe_tags_id_seq', 1, true);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipes_id_seq', 223, true);


--
-- Name: seasonings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seasonings_id_seq', 930, true);


--
-- Name: seasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seasons_id_seq', 7, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: l_trans_qs l_trans_qs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.l_trans_qs
    ADD CONSTRAINT l_trans_qs_pkey PRIMARY KEY (id);


--
-- Name: learn_questions learn_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.learn_questions
    ADD CONSTRAINT learn_questions_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

