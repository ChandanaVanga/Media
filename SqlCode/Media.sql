--
-- PostgreSQL database dump
--

-- Dumped from database version 13.6
-- Dumped by pg_dump version 13.6

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
-- Name: hash_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hash_tags (
    hash_id bigint NOT NULL,
    hash_name character varying(255)
);


ALTER TABLE public.hash_tags OWNER TO postgres;

--
-- Name: hash_tags_hash_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hash_tags_hash_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hash_tags_hash_id_seq OWNER TO postgres;

--
-- Name: hash_tags_hash_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hash_tags_hash_id_seq OWNED BY public.hash_tags.hash_id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    like_id bigint NOT NULL,
    liked_at timestamp with time zone DEFAULT '2022-03-16 11:15:47.432766+05:30'::timestamp with time zone,
    post_id bigint NOT NULL
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- Name: likes_like_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.likes_like_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_like_id_seq OWNER TO postgres;

--
-- Name: likes_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.likes_like_id_seq OWNED BY public.likes.like_id;


--
-- Name: likes_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.likes_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_post_id_seq OWNER TO postgres;

--
-- Name: likes_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.likes_post_id_seq OWNED BY public.likes.post_id;


--
-- Name: post_hash; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_hash (
    post_id bigint NOT NULL,
    hash_id bigint NOT NULL
);


ALTER TABLE public.post_hash OWNER TO postgres;

--
-- Name: post_hash_hash_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_hash_hash_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_hash_hash_id_seq OWNER TO postgres;

--
-- Name: post_hash_hash_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_hash_hash_id_seq OWNED BY public.post_hash.hash_id;


--
-- Name: post_hash_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_hash_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_hash_post_id_seq OWNER TO postgres;

--
-- Name: post_hash_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_hash_post_id_seq OWNED BY public.post_hash.post_id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    post_id bigint NOT NULL,
    post_type character varying(255),
    created_at timestamp with time zone DEFAULT '2022-03-16 11:15:37.179228+05:30'::timestamp with time zone,
    user_id bigint NOT NULL
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_post_id_seq OWNER TO postgres;

--
-- Name: posts_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_post_id_seq OWNED BY public.posts.post_id;


--
-- Name: posts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_user_id_seq OWNER TO postgres;

--
-- Name: posts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_user_id_seq OWNED BY public.posts.user_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id bigint NOT NULL,
    user_name character varying(255),
    date_of_birth date,
    mobile bigint,
    created_at timestamp with time zone DEFAULT '2022-03-16 11:15:28.961753+05:30'::timestamp with time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: hash_tags hash_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hash_tags ALTER COLUMN hash_id SET DEFAULT nextval('public.hash_tags_hash_id_seq'::regclass);


--
-- Name: likes like_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes ALTER COLUMN like_id SET DEFAULT nextval('public.likes_like_id_seq'::regclass);


--
-- Name: likes post_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes ALTER COLUMN post_id SET DEFAULT nextval('public.likes_post_id_seq'::regclass);


--
-- Name: post_hash post_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_hash ALTER COLUMN post_id SET DEFAULT nextval('public.post_hash_post_id_seq'::regclass);


--
-- Name: post_hash hash_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_hash ALTER COLUMN hash_id SET DEFAULT nextval('public.post_hash_hash_id_seq'::regclass);


--
-- Name: posts post_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN post_id SET DEFAULT nextval('public.posts_post_id_seq'::regclass);


--
-- Name: posts user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN user_id SET DEFAULT nextval('public.posts_user_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: hash_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hash_tags (hash_id, hash_name) FROM stdin;
1	Beautiful
2	Inspiring
3	Looking Good
0	string
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (like_id, liked_at, post_id) FROM stdin;
1	2022-03-16 11:15:47.432766+05:30	1
2	2022-03-16 11:15:47.432766+05:30	2
3	2022-03-16 11:15:47.432766+05:30	3
8	2022-03-16 11:15:47.432766+05:30	1
\.


--
-- Data for Name: post_hash; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_hash (post_id, hash_id) FROM stdin;
1	1
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (post_id, post_type, created_at, user_id) FROM stdin;
1	Video	2022-03-16 11:15:37.179228+05:30	1
2	Image	2022-03-16 11:15:37.179228+05:30	2
3	Video	2022-03-16 11:15:37.179228+05:30	3
0	string	2022-03-16 11:15:37.179228+05:30	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, user_name, date_of_birth, mobile, created_at) FROM stdin;
2	Sharanya	1998-07-01	9121539310	2022-03-16 11:15:28.961753+05:30
3	string	1989-02-05	9876543210	2022-03-16 11:15:28.961753+05:30
1	nsbwjdh	2000-06-04	9381868901	2022-03-16 11:15:28.961753+05:30
\.


--
-- Name: hash_tags_hash_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hash_tags_hash_id_seq', 3, true);


--
-- Name: likes_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.likes_like_id_seq', 3, true);


--
-- Name: likes_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.likes_post_id_seq', 1, true);


--
-- Name: post_hash_hash_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_hash_hash_id_seq', 1, false);


--
-- Name: post_hash_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_hash_post_id_seq', 1, false);


--
-- Name: posts_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_post_id_seq', 3, true);


--
-- Name: posts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_user_id_seq', 1, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


--
-- Name: hash_tags hash_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hash_tags
    ADD CONSTRAINT hash_tags_pkey PRIMARY KEY (hash_id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (like_id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (post_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: likes likes_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(post_id);


--
-- Name: post_hash post_hash_hash_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_hash
    ADD CONSTRAINT post_hash_hash_id_fkey FOREIGN KEY (hash_id) REFERENCES public.hash_tags(hash_id);


--
-- Name: post_hash post_hash_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_hash
    ADD CONSTRAINT post_hash_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(post_id);


--
-- Name: posts posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

