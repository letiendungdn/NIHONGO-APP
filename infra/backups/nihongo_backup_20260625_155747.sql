--
-- PostgreSQL database dump
--

\restrict 1yhajwaoe8eqHbTFhn1fUnOvpyGPhdkELKhz6mANZiFJ9erDP122uMeOYNVNF0v

-- Dumped from database version 16.14
-- Dumped by pg_dump version 16.14

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

--
-- Name: Role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."Role" AS ENUM (
    'USER',
    'ADMIN'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ExamResult; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ExamResult" (
    id integer NOT NULL,
    "userId" integer,
    "examId" text NOT NULL,
    level text NOT NULL,
    title text NOT NULL,
    "correctCount" integer NOT NULL,
    total integer NOT NULL,
    percent integer NOT NULL,
    passed boolean NOT NULL,
    "sectionScores" jsonb NOT NULL,
    "submittedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: ExamResult_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ExamResult_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ExamResult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ExamResult_id_seq" OWNED BY public."ExamResult".id;


--
-- Name: Example; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Example" (
    id integer NOT NULL,
    jp text NOT NULL,
    romaji text NOT NULL,
    en text,
    vi text,
    "grammarId" integer NOT NULL
);


--
-- Name: Example_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Example_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Example_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Example_id_seq" OWNED BY public."Example".id;


--
-- Name: Exercise; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Exercise" (
    id integer NOT NULL,
    type text NOT NULL,
    question text NOT NULL,
    options text,
    answer text NOT NULL,
    "lessonId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Exercise_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Exercise_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Exercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Exercise_id_seq" OWNED BY public."Exercise".id;


--
-- Name: Grammar; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Grammar" (
    id integer NOT NULL,
    pattern text NOT NULL,
    meaning text NOT NULL,
    explanation text,
    "lessonId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Grammar_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Grammar_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Grammar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Grammar_id_seq" OWNED BY public."Grammar".id;


--
-- Name: KanjiEntry; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."KanjiEntry" (
    id integer NOT NULL,
    "character" text NOT NULL,
    "hanViet" text,
    onyomi text,
    kunyomi text,
    "meaningVi" text NOT NULL,
    "mnemonicJp" text,
    "mnemonicVi" text,
    "imageUrl" text,
    "sortOrder" integer DEFAULT 0 NOT NULL,
    "lessonId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: KanjiEntry_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."KanjiEntry_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: KanjiEntry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."KanjiEntry_id_seq" OWNED BY public."KanjiEntry".id;


--
-- Name: KanjiLesson; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."KanjiLesson" (
    id integer NOT NULL,
    "lessonNumber" integer NOT NULL,
    title text,
    "jlptLevel" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: KanjiLesson_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."KanjiLesson_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: KanjiLesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."KanjiLesson_id_seq" OWNED BY public."KanjiLesson".id;


--
-- Name: KanjiVocab; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."KanjiVocab" (
    id integer NOT NULL,
    word text NOT NULL,
    reading text NOT NULL,
    "meaningVi" text NOT NULL,
    "kanjiEntryId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: KanjiVocab_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."KanjiVocab_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: KanjiVocab_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."KanjiVocab_id_seq" OWNED BY public."KanjiVocab".id;


--
-- Name: Lesson; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Lesson" (
    id integer NOT NULL,
    "lessonNumber" integer NOT NULL,
    title text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Lesson_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Lesson_id_seq" OWNED BY public."Lesson".id;


--
-- Name: ListeningLog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ListeningLog" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    date text NOT NULL,
    seconds integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: ListeningLog_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ListeningLog_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ListeningLog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ListeningLog_id_seq" OWNED BY public."ListeningLog".id;


--
-- Name: ReviewLog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ReviewLog" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    kana text NOT NULL,
    kanji text,
    meaning text NOT NULL,
    "lessonNumber" integer NOT NULL,
    "wrongCount" integer DEFAULT 1 NOT NULL,
    "reviewStreak" integer DEFAULT 0 NOT NULL,
    mastered boolean DEFAULT false NOT NULL,
    "lastReviewedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: ReviewLog_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ReviewLog_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ReviewLog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ReviewLog_id_seq" OWNED BY public."ReviewLog".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    email text NOT NULL,
    "passwordHash" text NOT NULL,
    role public."Role" DEFAULT 'USER'::public."Role" NOT NULL,
    name text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: Vocabulary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Vocabulary" (
    id integer NOT NULL,
    kanji text,
    kana text NOT NULL,
    romaji text NOT NULL,
    meaning text NOT NULL,
    "lessonId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Vocabulary_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Vocabulary_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Vocabulary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Vocabulary_id_seq" OWNED BY public."Vocabulary".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


--
-- Name: ExamResult id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ExamResult" ALTER COLUMN id SET DEFAULT nextval('public."ExamResult_id_seq"'::regclass);


--
-- Name: Example id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Example" ALTER COLUMN id SET DEFAULT nextval('public."Example_id_seq"'::regclass);


--
-- Name: Exercise id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Exercise" ALTER COLUMN id SET DEFAULT nextval('public."Exercise_id_seq"'::regclass);


--
-- Name: Grammar id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Grammar" ALTER COLUMN id SET DEFAULT nextval('public."Grammar_id_seq"'::regclass);


--
-- Name: KanjiEntry id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."KanjiEntry" ALTER COLUMN id SET DEFAULT nextval('public."KanjiEntry_id_seq"'::regclass);


--
-- Name: KanjiLesson id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."KanjiLesson" ALTER COLUMN id SET DEFAULT nextval('public."KanjiLesson_id_seq"'::regclass);


--
-- Name: KanjiVocab id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."KanjiVocab" ALTER COLUMN id SET DEFAULT nextval('public."KanjiVocab_id_seq"'::regclass);


--
-- Name: Lesson id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Lesson" ALTER COLUMN id SET DEFAULT nextval('public."Lesson_id_seq"'::regclass);


--
-- Name: ListeningLog id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningLog" ALTER COLUMN id SET DEFAULT nextval('public."ListeningLog_id_seq"'::regclass);


--
-- Name: ReviewLog id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReviewLog" ALTER COLUMN id SET DEFAULT nextval('public."ReviewLog_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Name: Vocabulary id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Vocabulary" ALTER COLUMN id SET DEFAULT nextval('public."Vocabulary_id_seq"'::regclass);


--
-- Data for Name: ExamResult; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ExamResult" (id, "userId", "examId", level, title, "correctCount", total, percent, passed, "sectionScores", "submittedAt") FROM stdin;
1	\N	26ec85b6-9957-4590-8cfd-1ac65b06fcc8	n5	Đề thi thử JLPT N5	0	33	0	f	[{"total": 12, "correct": 0, "sectionId": "vocab", "sectionName": "Từ vựng"}, {"total": 8, "correct": 0, "sectionId": "grammar", "sectionName": "Ngữ pháp"}, {"total": 5, "correct": 0, "sectionId": "kanji", "sectionName": "Kanji"}, {"total": 8, "correct": 0, "sectionId": "listening", "sectionName": "Nghe"}]	2026-06-24 08:02:58.131
2	\N	65b275b1-a1b8-4c2d-8cec-f9c90a0c1551	n5	Đề thi thử JLPT N5	0	33	0	f	[{"total": 12, "correct": 0, "sectionId": "vocab", "sectionName": "Từ vựng"}, {"total": 8, "correct": 0, "sectionId": "grammar", "sectionName": "Ngữ pháp"}, {"total": 5, "correct": 0, "sectionId": "kanji", "sectionName": "Kanji"}, {"total": 8, "correct": 0, "sectionId": "listening", "sectionName": "Nghe"}]	2026-06-24 08:37:09.616
3	\N	b49a6d06-63ef-4c39-83b7-2f476f8d8025	n5	Đề thi thử JLPT N5	0	33	0	f	[{"total": 12, "correct": 0, "sectionId": "vocab", "sectionName": "Từ vựng"}, {"total": 8, "correct": 0, "sectionId": "grammar", "sectionName": "Ngữ pháp"}, {"total": 5, "correct": 0, "sectionId": "kanji", "sectionName": "Kanji"}, {"total": 8, "correct": 0, "sectionId": "listening", "sectionName": "Nghe"}]	2026-06-24 08:37:59.745
4	\N	d5a1b415-f27a-4af9-a84f-ce53b2432d0c	n5	Đề thi thử JLPT N5	0	33	0	f	[{"total": 12, "correct": 0, "sectionId": "vocab", "sectionName": "Từ vựng"}, {"total": 8, "correct": 0, "sectionId": "grammar", "sectionName": "Ngữ pháp"}, {"total": 5, "correct": 0, "sectionId": "kanji", "sectionName": "Kanji"}, {"total": 8, "correct": 0, "sectionId": "listening", "sectionName": "Nghe"}]	2026-06-24 08:38:38.33
5	\N	1bf5c8df-82fc-44bb-b9a9-9e60d444ef03	n5	Đề thi thử JLPT N5	0	33	0	f	[{"total": 12, "correct": 0, "sectionId": "vocab", "sectionName": "Từ vựng"}, {"total": 8, "correct": 0, "sectionId": "grammar", "sectionName": "Ngữ pháp"}, {"total": 5, "correct": 0, "sectionId": "kanji", "sectionName": "Kanji"}, {"total": 8, "correct": 0, "sectionId": "listening", "sectionName": "Nghe"}]	2026-06-24 08:38:58.439
6	\N	c25cab51-e4a7-4318-8b3e-4cc30abb7237	n5	Đề thi thử JLPT N5	0	33	0	f	[{"total": 12, "correct": 0, "sectionId": "vocab", "sectionName": "Từ vựng"}, {"total": 8, "correct": 0, "sectionId": "grammar", "sectionName": "Ngữ pháp"}, {"total": 5, "correct": 0, "sectionId": "kanji", "sectionName": "Kanji"}, {"total": 8, "correct": 0, "sectionId": "listening", "sectionName": "Nghe"}]	2026-06-24 08:40:00.317
7	\N	07e490f8-cacc-4125-b463-96dad405ea00	n5	Đề thi thử JLPT N5	0	33	0	f	[{"total": 12, "correct": 0, "sectionId": "vocab", "sectionName": "Từ vựng"}, {"total": 8, "correct": 0, "sectionId": "grammar", "sectionName": "Ngữ pháp"}, {"total": 5, "correct": 0, "sectionId": "kanji", "sectionName": "Kanji"}, {"total": 8, "correct": 0, "sectionId": "listening", "sectionName": "Nghe"}]	2026-06-24 08:40:24.316
8	\N	b782dbc2-e09f-413f-87d5-894af20761c1	n5	Đề thi thử JLPT N5	0	33	0	f	[{"total": 12, "correct": 0, "sectionId": "vocab", "sectionName": "Từ vựng"}, {"total": 8, "correct": 0, "sectionId": "grammar", "sectionName": "Ngữ pháp"}, {"total": 5, "correct": 0, "sectionId": "kanji", "sectionName": "Kanji"}, {"total": 8, "correct": 0, "sectionId": "listening", "sectionName": "Nghe"}]	2026-06-24 08:43:07.852
\.


--
-- Data for Name: Example; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Example" (id, jp, romaji, en, vi, "grammarId") FROM stdin;
9368	わたしは たなかです。		\N	Tôi là Tanaka.	2937
9369	わたしは 学生 がくせいです。		\N	Tôi là sinh viên.	2937
9370	ラオさんは エンジニアでは（じゃ）ありません。		\N	Anh Rao không phải là kỹ sư.	2938
9371	マイさんは ベトナム人ですか。		\N	\N	2939
9372	マイさんは ベトナムじ んですか。		\N	Bạn Mai là người Việt Nam phải không?	2939
9373	…はい、ベトナム人です。		\N	\N	2939
9374	…はい、ベトナムじ んです。…		\N	Đúng, (bạn ấy) là người Việt Nam.	2939
9375	ミラさんは 学生ですか。		\N	\N	2939
9376	ミラさんは がくせいですか。		\N	Bạn Mira là học sinh phải không?	2939
9377	…いいえ、学生ではありません。		\N	\N	2939
9378	…いいえ、がくせいではありません。 …Không, (bạn ấy) không phải là học sinh.		\N	\N	2939
9379	…(あの人は) 山田さんです。 …(あの人は) やまださんです。…(Người kia)		\N	Là anh Yamada.	2939
9380	わたしは ベトナム人です。 わたしは ベトナムじ んです。		\N	Tôi là người Việt Nam.	2940
9381	タンさんも ベトナム人です。 タンさんも ベトナムじ んです。		\N	Anh Tân cũng là người Việt Nam.	2940
9382	わたしは		\N	Ha Noi大学 だいがくの学生です。 Tôi là sinh viên của trường Đại học Ha Noi.	2941
9383	わたしは たなかです。		\N	Tôi là Tanaka.	2942
9384	あのかたは きむらさんです。		\N	Vị kia là Kimura.	2942
9385	わたしは 20さいです。		\N	Tôi 20 tuổi.	2943
9386	お子さんは なんさいですか。		\N	Con bạn mấy tuổi?	2943
9387	これは 本ですか。 これは ほ んですか。Đây là quyển sách à? …いいえ、それはノートです。 …		\N	Không, đó là quyển vở.	2944
9388	あれは じどうしゃです。		\N	Kia là cái ô tô.	2944
9389	2) この		\N	N／その N／あの N	2944
9390	あの人は 山田さんです。 あのひ とは やまださんです。		\N	Người kia là anh Yamada.	2944
9391	この		\N	N/その N/あの N?	2944
9392	1) これは なんですか。		\N	Đây là cái gì? …それは いすです。 … Đó là cái ghế.	2944
9393	2) このひとは だれですか。		\N	Người này là ai? …そのひとは 田中(たなか)さんです。 … Người đó là anh Tanaka.	2944
9394	1) これは えんぴつですか。		\N	Đây là cái bút chì phải không? …はい、えんぴつです。 …Vâng, đó là cái bút chì. Hoặc …はい、そうです。 …Vâng, đúng vậy. 2) それは テレホンカードですか。 Đó là cái th ẻ điện thoại phải không? …いいえ、テレホンカードではありません。 …Không, không phải cái thẻ điện thoại. Hoặc …いいえ、そうではありません。 …Không, không phải thế.	2945
9395	これは わたしの ほんです。		\N	Đây là quyển sách của tôi.	2947
9396	1) あれは だれのかばんですか。		\N	Kia là cái cặp của ai? … わたしのです。 … Là của tôi.	2947
9397	2) そのつくえは ラオさんのですか。		\N	Cái bàn đó là của Rao phải không? … いいえ、ラオさんのではありません。 … Không, không phải của Rao.	2947
9398	3) ミラーさんは		\N	IMCのしゃいんですか。 Mira là nhân viên công ty IMC phải không? … はい、IMCのしゃいんです。 (Không dùng : IMCのです) … Vâng, (anh ấy) là nhân viên công ty IMC.	2947
9399	A: このかさは あなたのですか。		\N	Cái ô này là của bạn à? B: いいえ、タンさんのです。 …Không, của anh Tân. A: そうですか。 À, ra vậy.	2948
9400	お<ruby>手<rp>（</rp><rt>て</rt><rp>）</rp>洗<rp>（</rp><rt>あら</rt><rp>）</rp></ruby>いは あそこです。		\N	The toilet is over there.	2950
9401	<ruby>電<rp>（</rp><rt>でん</rt><rp>）</rp>話<rp>（</rp><rt>わ</rt><rp>）</rp></ruby>は ２<ruby>階<rp>（</rp><rt>かい</rt><rp>）</rp></ruby>です。		\N	The telephone is on the second floor.	2950
9402	<ruby>山<rp>（</rp><rt>やま</rt><rp>）</rp>田<rp>（</rp><rt>だ</rt><rp>）</rp></ruby>さんは <ruby>事<rp>（</rp><rt>じ</rt><rp>）</rp>務<rp>（</rp><rt>む</rt><rp>）</rp>所<rp>（</rp><rt>しょ</rt><rp>）</rp></ruby>です。		\N	Mr.Yamada is in his office.	2950
9403	お<ruby>手<rp>（</rp><rt>て</rt><rp>）</rp>洗<rp>（</rp><rt>あら</rt><rp>）</rp></ruby>いは どこですか。		\N	Where's the toilet? …… あそこです。 …… It's over there.	2951
9404	エレベーターは どちらですか。		\N	Where's the elevator? …… あちらです。 …… It's in that direction. (It's over there.)	2951
9405	<ruby>学校<rp>（</rp><rt>がっこう</rt><rp>）</rp></ruby>は どこですか。		\N	What school do you go to? <ruby>会社<rp>（</rp><rt>かいしゃ</rt><rp>）</rp></ruby>は どちらですか。 What company do you work for?	2951
9406	これは どこの コンピューターですか。		\N	\N	2952
9407	Where is this computer made? / What company is the computer made by?		\N	…… <ruby>日<rp>（</rp><rt>に</rt><rp>）</rp>本<rp>（</rp><rt>ほん</rt><rp>）</rp></ruby>は コンピューターです。 …… It's made in Japan. …… パワー<ruby>電<rp>（</rp><rt>でん</rt><rp>）</rp>気<rp>（</rp><rt>き</rt><rp>）</rp></ruby>の コンピューターです。 …… It's made by Power Electric Company.	2952
9408	［お］<ruby>国<rp>（</rp><rt>くに</rt><rp>）</rp></ruby>は どちらですか。		\N	What country are you from?	2954
9409	<ruby>今<rp>（</rp><rt>いま</rt><rp>）</rp></ruby> <ruby>何<rp>（</rp><rt>なん</rt><rp>）</rp></ruby><ruby><ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby><ruby>ですか。		\N	What time is it now? …… ７<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>１０<ruby>分<rp>（</rp><rt>ぷん</rt><rp>）</rp></ruby>です。 …… It's 7:10.	2955
9410	わたしは <ruby>毎日<rp>（</rp><rt>まいにち</rt><rp>）</rp></ruby> <ruby>勉強<rp>（</rp><rt>べんきょう</rt><rp>）</rp></ruby>します。		\N	I study every day.	2956
9411	<ruby>毎朝<rp>（</rp><rt>まいあさ</rt><rp>）</rp></ruby> ６<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>に <ruby>起<rp>（</rp><rt>お</rt><rp>）</rp></ruby>きます。		\N	I get up at six every morning.	2956
9412	<ruby>明日<rp>（</rp><rt>あした</rt><rp>）</rp></ruby> ６<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>に <ruby>起<rp>（</rp><rt>お</rt><rp>）</rp></ruby>きます。		\N	I am going to get up at six tomorrow morning.	2956
10427	まだエレベーターの所にいるかもしれません。		\N	She may be somewhere near the elevator.	3271
9413	<ruby>今朝<rp>（</rp><rt>けさ</rt><rp>）</rp></ruby> ６<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>に <ruby>起<rp>（</rp><rt>お</rt><rp>）</rp></ruby>きました。		\N	I got up at six this morning.	2956
9414	<ruby>昨日<rp>（</rp><rt>きのう</rt><rp>）</rp></ruby> <ruby>勉強<rp>（</rp><rt>べんきょう</rt><rp>）</rp></ruby>しましたか。		\N	Did you study yesterday? …… はい、<ruby>勉強<rp>（</rp><rt>べんきょう</rt><rp>）</rp></ruby>しました。 …… Yes, I did [study]. …… いいえ、<ruby>勉強<rp>（</rp><rt>べんきょう</rt><rp>）</rp></ruby>しませんでした。 …… No, I didn't [study].	2956
9415	<ruby>毎朝<rp>（</rp><rt>まいあさ</rt><rp>）</rp></ruby> <ruby>何<rp>（</rp><rt>なん</rt><rp>）</rp>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>に <ruby>起<rp>（</rp><rt>お</rt><rp>）</rp></ruby>きますか。		\N	What time do you get up in the mornings? …… ６<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>に <ruby>起<rp>（</rp><rt>お</rt><rp>）</rp></ruby>きます。 …… [I get up at] six o'clock.	2956
9416	６<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby><ruby>半<rp>（</rp><rt>はん</rt><rp>）</rp></ruby>に <ruby>起<rp>（</rp><rt>お</rt><rp>）</rp></ruby>きます。		\N	I get up at six-thirty.	2957
9417	７<ruby>月<rp>（</rp><rt>がつ</rt><rp>）</rp></ruby><ruby>２日<rp>（</rp><rt>ふつか</rt><rp>）</rp></ruby>に <ruby>日<rp>（</rp><rt>に</rt><rp>）</rp>本<rp>（</rp><rt>ほん</rt><rp>）</rp></ruby>へ <ruby>来<rp>（</rp><rt>き</rt><rp>）</rp></ruby>ました。		\N	I come to Japan on the second of July. (See [Lesson 5](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_05_Grammar.md).)	2957
9418	きのう <ruby>勉強<rp>（</rp><rt>べんきょう</rt><rp>）</rp></ruby>しました。		\N	I studied yesterday.	2957
9419	<ruby>日<rp>（</rp><rt>にち</rt><rp>）</rp>曜<rp>（</rp><rt>よう</rt><rp>）</rp>日<rp>（</rp><rt>び</rt><rp>）</rp></ruby>に <ruby>奈良<rp>（</rp><rt>なら</rt><rp>）</rp></ruby>へ <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きます。		\N	I am going to Nara on Sunday. (See [Lesson 5](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_05_Grammar.md).)	2957
9420	９<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>から ５<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>まで <ruby>勉強<rp>（</rp><rt>べんきょう</rt><rp>）</rp></ruby>します。		\N	I study from 9 to 5.	2958
9421	<ruby>大<rp>（</rp><rt>おお</rt><rp>）</rp>阪<rp>（</rp><rt>さか</rt><rp>）</rp></ruby>から <ruby>東<rp>（</rp><rt>とう</rt><rp>）</rp>京<rp>（</rp><rt>きょう</rt><rp>）</rp></ruby>まで ３<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp>間<rp>（</rp><rt>かん</rt><rp>）</rp></ruby> かかります。		\N	It takes three hours from Osaka to Tokyo. (See [Lesson 11](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_11_Grammar.md).)	2958
9422	９<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>から <ruby>働<rp>（</rp><rt>はたら</rt><rp>）</rp></ruby>きます。		\N	I start work at nine.	2958
9423	<ruby>銀<rp>（</rp><rt>ぎん</rt><rp>）</rp>行<rp>（</rp><rt>こう</rt><rp>）</rp></ruby>は ９<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>から ３<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>までです。		\N	The bank is open from 9 to 3.	2958
9424	<ruby>昼<rp>（</rp><rt>ひる</rt><rp>）</rp>休<rp>（</rp><rt>やす</rt><rp>）</rp></ruby>みは １２<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>からです。		\N	The lunch break starts at 12.	2958
9425	<ruby>銀<rp>（</rp><rt>ぎん</rt><rp>）</rp>行<rp>（</rp><rt>こう</rt><rp>）</rp></ruby> <ruby>休<rp>（</rp><rt>やす</rt><rp>）</rp></ruby>みは <ruby>土<rp>（</rp><rt>ど</rt><rp>）</rp>曜<rp>（</rp><rt>よう</rt><rp>）</rp>日<rp>（</rp><rt>び</rt><rp>）</rp></ruby>と <ruby>日<rp>（</rp><rt>にち</rt><rp>）</rp>曜<rp>（</rp><rt>よう</rt><rp>）</rp>日<rp>（</rp><rt>び</rt><rp>）</rp></ruby>です。		\N	The bank is closed on Saturdays and Sundays.	2959
9426	<ruby>毎日<rp>（</rp><rt>まいにち</rt><rp>）</rp></ruby> １０<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>まで <ruby>勉強<rp>（</rp><rt>べんきょう</rt><rp>）</rp></ruby>します。		\N	I study till ten every day. …… <ruby>大変<rp>（</rp><rt>だいへん</rt><rp>）</rp></ruby>ですね。 …… That's tough, isn't it?	2960
9427	<ruby>山<rp>（</rp><rt>やま</rt><rp>）</rp>田<rp>（</rp><rt>だ</rt><rp>）</rp></ruby>さんの <ruby>電<rp>（</rp><rt>でん</rt><rp>）</rp>話<rp>（</rp><rt>わ</rt><rp>）</rp>番<rp>（</rp><rt>ばん</rt><rp>）</rp>号<rp>（</rp><rt>ごう</rt><rp>）</rp></ruby>は ８７１の ６８１３です。		\N	Mr.Yamada's telephone number is 871-6813. …… ８７１の ６８１３ですね。 …… 871-6813, right?	2960
9428	<ruby>京<rp>（</rp><rt>きょう</rt><rp>）</rp>都<rp>（</rp><rt>と</rt><rp>）</rp></ruby>へ <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きます。		\N	I am going to Kyoto.	2961
9429	<ruby>日<rp>（</rp><rt>に</rt><rp>）</rp>本<rp>（</rp><rt>ほん</rt><rp>）</rp></ruby>へ <ruby>来<rp>（</rp><rt>き</rt><rp>）</rp></ruby>きました。		\N	I came to to Japan.	2961
9430	うちへ <ruby>帰<rp>（</rp><rt>かえ</rt><rp>）</rp></ruby>ります。		\N	I am going home.	2961
9431	どこ[へ]も <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きません。		\N	I am not going anywhere.	2962
9432	<ruby>何<rp>（</rp><rt>なに</rt><rp>）</rp></ruby>も <ruby>食<rp>（</rp><rt>た</rt><rp>）</rp></ruby>べません。		\N	I am not going to eat anything. (See [Lesson 6](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_06_Grammar.md).)	2962
9433	だれも <ruby>来<rp>（</rp><rt>き</rt><rp>）</rp></ruby>ませんでした。		\N	Nobody came.	2962
9434	<ruby>電<rp>（</rp><rt>でん</rt><rp>）</rp>車<rp>（</rp><rt>しゃ</rt><rp>）</rp></ruby>で <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きます。		\N	I am going by train.	2963
9435	タクシーで <ruby>来<rp>（</rp><rt>き</rt><rp>）</rp></ruby>ました。		\N	I came by taxi.	2963
9436	<ruby>駅<rp>（</rp><rt>えき</rt><rp>）</rp></ruby>から <ruby>歩<rp>（</rp><rt>ある</rt><rp>）</rp></ruby>いて <ruby>帰<rp>（</rp><rt>かえ</rt><rp>）</rp></ruby>りました。		\N	I walked home from the station.	2963
9437	<ruby>家<rp>（</rp><rt>か</rt><rp>）</rp>族<rp>（</rp><rt>ぞく</rt><rp>）</rp></ruby>と <ruby>日<rp>（</rp><rt>に</rt><rp>）</rp>本<rp>（</rp><rt>ほん</rt><rp>）</rp></ruby>へ <ruby>来<rp>（</rp><rt>き</rt><rp>）</rp></ruby>ました。		\N	I came to Japan with my family.	2964
9438	<ruby>一人<rp>（</rp><rt>ひとり</rt><rp>）</rp></ruby>で <ruby>東<rp>（</rp><rt>とう</rt><rp>）</rp>京<rp>（</rp><rt>きょう</rt><rp>）</rp></ruby>へ <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きます。		\N	I am going to Tokyo on my own.	2964
10428	たった今バスが出たところです。		\N	The bus left just now.	3271
10429	もしもし田中ですが、今いいでしょうか。		\N	Hello. This is Tanaka speaking. May I talk to you now?	3271
10430	すみません。今から出かけるところなんです。		\N	Sorry. I’m just going out.	3271
10431	This		\N	sentence pattern means that not much time has passed since a certain action or event occurred. It is the expression of the speaker’s feeling and can be used regardless of the real length of time that has passed if the speaker feels it is short. In this respect, this sentence pattern is different from Vた-formところです, which can only indicate the time when a certain action has just been completed.	3273
10432	さっき昼ごはんを食べたばかりです。		\N	I had lunch only a while ago.	3273
10433	木村さんは先月この会社に入ったばかりです。		\N	Ms. Kimura joined this company only a month ago.	3273
10434	このビデオは先週買ったばかりなのに、調子がおかしいです。		\N	I bought this video only a week ago, but it isn’t working well.	3273
10435	The		\N	speaker uses this sentence pattern to show he/she is convinced of what is stated before はずです. By using this sentence pattern, the speaker implies that he/she has grounds to think so, that it is his/her own judgement, and that he/she is quite sure of it.	3283
10436	ミラーさんはきょう来るでしょうか。(*)		\N	Do you think Mr. Miller will come today?	3283
10437	来るはずですよ。きのう電話がありましたから。		\N	I’m sure he’ll come. I received a phone call from him yesterday.	3283
10438	In (*),		\N	the grounds for the speaker’s judgement is yesterday’s phone call. Based on this call, the speaker himself judges that Mr. Miller will come today. The speaker shows his/her firm belief in this judgement by using ～はずです.	3283
10439	This		\N	is an expression for conveying information you have obtained from another source without adding your own point of view. When the source of information is given, it is indicated by～によると (according to), placed at the beginning of the sentence.	3284
10440	天気予報によると、あしたは寒くなるそうです。		\N	According to the weather forecast, it will be cold tomorrow.	3284
10441	クララさんは子どものとき、フランスに住んでいたそうです。		\N	I heard that Klara lived in France when she was a child.	3284
10442	バリ島はとてもきれいだそうです。		\N	I hear that Bali is very beautiful.	3284
10443	雨が降りそうです。		\N	It looks like rain.	3284
10444	雨が降るそうです。		\N	I heard that it will rain.	3284
10445	この料理はおいしそうです。		\N	This food looks delicious.	3284
10446	この料理はおいしいそうです。		\N	I heard that this food is delicious.	3284
10447	ミラーさんはあした京都へ行くそうです。(*)		\N	I hear that Mr. Miller is going to Kyoto tomorrow.	3284
10448	ミラーさんはあした京都へ行くと言っていました。(**)		\N	Mr. Miller said that he is going to Kyoto tomorrow.	3284
10449	～ようですconveys		\N	the speaker’s subjective conjecture, which is based on the information obtained through his/her sensory organs.	3287
10450	A		\N	sentence that ends in ようですsometimes accompaniesどうも which suggests the speaker cannot be certain if what he/she is saying is a fact.	3287
10451	人が大勢集まっていますね。		\N	Look, there is a big crowd.	3287
10452	事故のようです。パトカーと救急車が来ていますよ。		\N	It looks like there’s been an accident. A patrol car and an ambulance are there.	3287
10453	せきも出るし、頭も痛い。どうもかぜをひいたようだ。		\N	I have a cough and a headache. It looks like I’ve caught a cold.	3287
10454	ミラーさんは忙しそうです。(i)		\N	Mr. Miller seems to be busy.	3287
10455	ミラーさんは忙しいようです。(ii)		\N	It seems that Mr. Miller is busy.	3287
10456	変な音がしますね。		\N	There’s a strange sound, isn’t there?	3288
10457	A		\N	phenomenon that is perceivable by the senses is described by using ～がします. Expressions in this category are こえがします, においがします, and あじがします. All these expressions mean that these things have been perceived or sensed regardless of the speaker’s intention.	3288
10458	します こさせます		\N	\N	3289
10459	させます こさせる		\N	\N	3289
10460	させる		\N	\N	3289
10461	All		\N	causative verbs are Group II verbs; they conjugate into the dictionary form, ない-form, て-form, etc.	3289
10462	e.g. いかせる、いかせ(ない)、いかせて		\N	\N	3289
10463	There		\N	are two types of causative sentences: those which indicate the subject of an action with を, and those which indicates it withに. When the verb is intransitive, as in 1) below, をis used, while when the verb is transitive, as in 2), にis used irrespective of whether the object of the verb is stated or not.	3290
10464	1)		\N	N (person) をV (intransitive) causative	3290
10465	部長は加藤さんを大阪へ出張させます。(*)		\N	The department manager makes Mr. Kato go to Osaka on business.	3290
10466	わたしは娘を自由に遊ばせました。(**)		\N	I let my daughter play freely.	3290
10467	わたしは子どもに道の右側を歩かせます。(x)		\N	I make my child walk on the right side of the road.	3290
10468	わたしは子どもを歩かせます。(y)		\N	I make my child walk.	3290
10469	2)		\N	N (person) に Nを V (transitive) causative	3290
10470	朝は忙しいですから、娘に朝ごはんの準備を手伝わせます。(i)		\N	I am busy in the morning, so I make my daughter help prepare breakfast.	3290
10471	先生は生徒に自由に意見を言わせました。(ii)		\N	The teacher let her students freely voice their opinion.	3290
10472	駅に着いたら、お電話をください。		\N	When you arrive at the station, please call me.	3291
10473	係の者を迎えに行かせますから。		\N	I will send a member of my staff to the station to pick you up.	3291
10474	わかりました。		\N	Thank you.	3291
10475	わたしは部長に説明していただきました。		\N	I had the department manager explain it to me.	3291
10476	わたしは友達に説明してもらいました。		\N	I had my friend explain it to me.	3291
10477	子どものとき、体が弱くて、母を心配させました。		\N	When I was a child, my poor health worried my mother.	3291
9439	いつ <ruby>日<rp>（</rp><rt>に</rt><rp>）</rp>本<rp>（</rp><rt>ほん</rt><rp>）</rp></ruby>へ <ruby>来<rp>（</rp><rt>き</rt><rp>）</rp></ruby>ましたか。		\N	When did you come to Japan? …… ３<ruby>月<rp>（</rp><rt>がつ</rt><rp>）</rp></ruby>２５<ruby>日<rp>（</rp><rt>にち</rt><rp>）</rp></ruby>に <ruby>来<rp>（</rp><rt>き</rt><rp>）</rp></ruby>ました。 …… [I came] on 25th March.	2965
9440	いつ <ruby>広<rp>（</rp><rt>ひろ</rt><rp>）</rp>島<rp>（</rp><rt>しま</rt><rp>）</rp></ruby>へ <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きますか。		\N	When are you going to Hiroshima? …… <ruby>来週<rp>（</rp><rt>らいしゅう</rt><rp>）</rp></ruby> <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きます。 …… [I am going] next week.	2965
9441	この <ruby>電<rp>（</rp><rt>でん</rt><rp>）</rp>車<rp>（</rp><rt>しゃ</rt><rp>）</rp></ruby>は <ruby>甲<rp>（</rp><rt>こう</rt><rp>）</rp>子<rp>（</rp><rt>し</rt><rp>）</rp>園<rp>（</rp><rt>えん</rt><rp>）</rp></ruby>へ <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きますか。		\N	Does this train go to Koshien? …… いいえ、<ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きません。<ruby>次<rp>（</rp><rt>つぎ</rt><rp>）</rp></ruby>の「<ruby>普<rp>（</rp><rt>ふ</rt><rp>）</rp>通<rp>（</rp><rt>つう</rt><rp>）</rp></ruby>」ですよ。 …… No, it does not. You need the next local train.	2966
9442	<ruby>北海道<rp>（</rp><rt>ほっかいどう</rt><rp>）</rp></ruby>に <ruby>馬<rp>（</rp><rt>うま</rt><rp>）</rp></ruby>が たくさん いますよ。		\N	There are a lot of horses in Hokkaido, you know. (See [Lesson 18](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_18_Grammar.md).)	2966
9443	マリアさん、この アイスクリーム、おいしいですよ。		\N	Maria, this ice cream is very nice, you know. (See [Lesson 19](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_19_Grammar.md).)	2966
9444	<ruby>明日<rp>（</rp><rt>あした</rt><rp>）</rp></ruby>は <ruby>日<rp>（</rp><rt>にち</rt><rp>）</rp>曜<rp>（</rp><rt>よう</rt><rp>）</rp>日<rp>（</rp><rt>び</rt><rp>）</rp></ruby>ですね。		\N	It is Sunday tomorrow, isn't it? …… あ、そうですね。 …… Oh, yes, so it is.	2967
9445	ジュースを <ruby>飲<rp>（</rp><rt>の</rt><rp>）</rp></ruby>みです。		\N	I drink juice.	2968
9446	サッカーを します		\N	play soccer	2969
9447	トランプを　します		\N	play cards	2969
9448	パーティーを します		\N	give a party	2969
9449	<ruby>会<rp>（</rp><rt>かい</rt><rp>）</rp>議<rp>（</rp><rt>ぎ</rt><rp>）</rp></ruby>を します		\N	hold a meeting	2969
9450	<ruby>宿<rp>（</rp><rt>しゅく</rt><rp>）</rp>題<rp>（</rp><rt>だい</rt><rp>）</rp></ruby>を します		\N	do homework	2969
9451	<ruby>仕<rp>（</rp><rt>し</rt><rp>）</rp>事<rp>（</rp><rt>ごと</rt><rp>）</rp></ruby>を します		\N	work	2969
9452	<ruby>電<rp>（</rp><rt>でん</rt><rp>）</rp>話<rp>（</rp><rt>わ</rt><rp>）</rp></ruby>を します		\N	call, phone	2969
9453	<ruby>月<rp>（</rp><rt>げつ</rt><rp>）</rp>曜<rp>（</rp><rt>よう</rt><rp>）</rp>日<rp>（</rp><rt>び</rt><rp>）</rp></ruby> <ruby>何<rp>（</rp><rt>なに</rt><rp>）</rp></ruby>を しますか。		\N	What are you doing on Monday? …… <ruby>京<rp>（</rp><rt>きょう</rt><rp>）</rp>都<rp>（</rp><rt>と</rt><rp>）</rp></ruby>へ <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きます。 …… I am going to Kyoto.	2970
9454	<ruby>昨日<rp>（</rp><rt>きのう</rt><rp>）</rp></ruby> <ruby>何<rp>（</rp><rt>なに</rt><rp>）</rp></ruby>を しましたか。		\N	What did you do yesterday? …… サッカーを しました。 …… I played soccer.	2970
9455	これは <ruby>何<rp>（</rp><rt>なん</rt><rp>）</rp></ruby><u>で</u>すか。		\N	\N	2971
9456	<ruby>何<rp>（</rp><rt>なん</rt><rp>）</rp></ruby><u>の</u> <ruby>本<rp>（</rp><rt>ほん</rt><rp>）</rp></ruby>ですか。		\N	\N	2971
9457	<ruby>寝<rp>（</rp><rt>ね</rt><rp>）</rp></ruby>る まえに、<ruby>何<rp>（</rp><rt>なん</rt><rp>）</rp></ruby><u>と</u> <ruby>言<rp>（</rp><rt>い</rt><rp>）</rp></ruby>いますか。		\N	\N	2971
9458	<ruby>何<rp>（</rp><rt>なん</rt><rp>）</rp></ruby><u>で</u> <ruby>東<rp>（</rp><rt>とう</rt><rp>）</rp>京<rp>（</rp><rt>きょう</rt><rp>）</rp></ruby>へ <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きますか。		\N	\N	2971
9459	<ruby>何<rp>（</rp><rt>なに</rt><rp>）</rp></ruby>で <ruby>東<rp>（</rp><rt>とう</rt><rp>）</rp>京<rp>（</rp><rt>きょう</rt><rp>）</rp></ruby>へ <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きますか。		\N	\N	2971
9460	テレーザちゃんは <ruby>何<rp>（</rp><rt>なん</rt><rp>）</rp>歳<rp>（</rp><rt>さい</rt><rp>）</rp></ruby>ですか。		\N	\N	2971
9461	<ruby>何<rp>（</rp><rt>なに</rt><rp>）</rp></ruby>を <ruby>買<rp>（</rp><rt>か</rt><rp>）</rp></ruby>いますか。		\N	\N	2971
9462	<ruby>駅<rp>（</rp><rt>えき</rt><rp>）</rp></ruby>で <ruby>新<rp>（</rp><rt>しん</rt><rp>）</rp>聞<rp>（</rp><rt>ぶん</rt><rp>）</rp></ruby>を <ruby>買<rp>（</rp><rt>か</rt><rp>）</rp></ruby>います。		\N	I am going to buy a paper at the station.	2972
9463	いっしょに <ruby>京<rp>（</rp><rt>きょう</rt><rp>）</rp>都<rp>（</rp><rt>と</rt><rp>）</rp></ruby>へ <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きませんか。		\N	Would you like to come to Kyoto with us? …… ええ、いいですね。 …… Yes, that's a nice idea.	2973
9464	ちょっと <ruby>休<rp>（</rp><rt>やす</rt><rp>）</rp></ruby>みましょう。		\N	Let's take a break.	2974
9465	いっしょに <ruby>昼<rp>（</rp><rt>ひる</rt><rp>）</rp></ruby>ごはんを <ruby>食<rp>（</rp><rt>た</rt><rp>）</rp></ruby>べませんか。		\N	Shall we have lunch together? …… ええ、<ruby>食<rp>（</rp><rt>た</rt><rp>）</rp></ruby>べましょう。 …… Yes, let's do it.	2974
9466	<ruby>日<rp>（</rp><rt>にち</rt><rp>）</rp>曜<rp>（</rp><rt>よう</rt><rp>）</rp>日<rp>（</rp><rt>び</rt><rp>）</rp></ruby> <ruby>京<rp>（</rp><rt>きょう</rt><rp>）</rp>都<rp>（</rp><rt>と</rt><rp>）</rp></ruby>へ <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きました。		\N	I went to Kyoto on Sunday. …… <ruby>京<rp>（</rp><rt>きょう</rt><rp>）</rp>都<rp>（</rp><rt>と</rt><rp>）</rp></ruby>ですか。いいですね。 …… Kyoto, eh? Great!	2975
9467	<ruby>箸<rp>（</rp><rt>はし</rt><rp>）</rp></ruby>で <ruby>食<rp>（</rp><rt>た</rt><rp>）</rp></ruby>べます。		\N	I eat with chopsticks.	2976
9468	<ruby>日<rp>（</rp><rt>に</rt><rp>）</rp>本<rp>（</rp><rt>ほん</rt><rp>）</rp>語<rp>（</rp><rt>ご</rt><rp>）</rp></ruby>で レポートを <ruby>書<rp>（</rp><rt>か</rt><rp>）</rp></ruby>きます。		\N	I am going to write the report in Japanese.	2976
9469	「ありがとう」は <ruby>英<rp>（</rp><rt>えい</rt><rp>）</rp>語<rp>（</rp><rt>ご</rt><rp>）</rp></ruby>で <ruby>何<rp>（</rp><rt>なん</rt><rp>）</rp></ruby>ですか。		\N	What's 'Arigato' in English? …… 「Thank you」です。 …… It's 'thank you'.	2977
9470	「Thank you」は <ruby>日<rp>（</rp><rt>に</rt><rp>）</rp>本<rp>（</rp><rt>ほん</rt><rp>）</rp>語<rp>（</rp><rt>ご</rt><rp>）</rp></ruby>で <ruby>何<rp>（</rp><rt>なん</rt><rp>）</rp></ruby>ですか。		\N	What's 'Thank you' in Japanese? …… 「ありがとう」です。 …… It's 'ありがとう'.	2977
9471	［わたしは］<ruby>木<rp>（</rp><rt>き</rt><rp>）</rp>村<rp>（</rp><rt>むら</rt><rp>）</rp></ruby>さんに <ruby>花<rp>（</rp><rt>はな</rt><rp>）</rp></ruby>を あげました。		\N	I gave Ms.Kimura some flowers.	2978
9472	［わたしは］イーさんに <ruby>本<rp>（</rp><rt>ほん</rt><rp>）</rp></ruby>を <ruby>貸<rp>（</rp><rt>か</rt><rp>）</rp></ruby>しました。		\N	I lent Ms.Lee a book.	2978
9473	［わたしは］<ruby>山<rp>（</rp><rt>やま</rt><rp>）</rp>田<rp>（</rp><rt>だ</rt><rp>）</rp></ruby>さんに <ruby>英<rp>（</rp><rt>えい</rt><rp>）</rp>語<rp>（</rp><rt>ご</rt><rp>）</rp></ruby>を <ruby>教<rp>（</rp><rt>おし</rt><rp>）</rp></ruby>えます。		\N	I teach Mr.Yamada English.	2978
9474	［わたしは］<ruby>山<rp>（</rp><rt>やま</rt><rp>）</rp>田<rp>（</rp><rt>だ</rt><rp>）</rp></ruby>さんに <ruby>花<rp>（</rp><rt>はな</rt><rp>）</rp></ruby>を もらいました。		\N	I received some flowers from Mr.Yamada.	2979
9475	［わたしは］カリナさんに ＣＤを <ruby>借<rp>（</rp><rt>か</rt><rp>）</rp></ruby>りました。		\N	I borrowed a CD from Karina.	2979
9476	［わたしは］ワンさんに <ruby>中<rp>（</rp><rt>ちゅう</rt><rp>）</rp>国<rp>（</rp><rt>ごく</rt><rp>）</rp>語<rp>（</rp><rt>ご</rt><rp>）</rp></ruby>を <ruby>習<rp>（</rp><rt>なら</rt><rp>）</rp></ruby>います。		\N	I'm learning Chinese from Mr.Wang.	2979
9477	［わたしは］<ruby>山<rp>（</rp><rt>やま</rt><rp>）</rp>田<rp>（</rp><rt>だ</rt><rp>）</rp></ruby>さんから <ruby>花<rp>（</rp><rt>はな</rt><rp>）</rp></ruby>を もらいました。		\N	I received some flowers from Mr.Yamada.	2979
9478	<ruby>銀<rp>（</rp><rt>ぎん</rt><rp>）</rp>行<rp>（</rp><rt>こう</rt><rp>）</rp></ruby>から お<ruby>金<rp>（</rp><rt>かね</rt><rp>）</rp></ruby>を <ruby>借<rp>（</rp><rt>か</rt><rp>）</rp></ruby>りました。		\N	I borrowed some money from the bank.	2979
9479	もう <ruby>荷<rp>（</rp><rt>に</rt><rp>）</rp>物<rp>（</rp><rt>もつ</rt><rp>）</rp></ruby>を <ruby>送<rp>（</rp><rt>おく</rt><rp>）</rp></ruby>りましたか。		\N	Have you sent the baggage yet? …… はい、［もう］<ruby>送<rp>（</rp><rt>おく</rt><rp>）</rp></ruby>りました。 …… Yes, I have [sent it]. …… いいえ、まだ <ruby>送<rp>（</rp><rt>おく</rt><rp>）</rp></ruby>って いません。 …… No, I haven't sent it yet. (See [Lesson 31](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_31_Grammar.md).) …… いいえ、まだです。 …… No, not yet.	2980
9480	この スプーン［は］、すてきですね。		\N	This is a lovely spoon, isn't it?	2981
9481	コーヒー［を］、もう <ruby>一杯<rp>（</rp><rt>いっぱい</rt><rp>）</rp></ruby> いかがですか。		\N	Would you like another cup of coffee? (See [Lesson 8](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_08_Grammar.md).)	2981
9482	ワット<ruby>先<rp>（</rp><rt>せん</rt><rp>）</rp>生<rp>（</rp><rt>せい</rt><rp>）</rp></ruby>は <ruby>親<rp>（</rp><rt>しん</rt><rp>）</rp>切<rp>（</rp><rt>せつ</rt><rp>）</rp></ruby>です。		\N	Mr.Watt is kind.	2983
9483	<ruby>富<rp>（</rp><rt>ふ</rt><rp>）</rp>士<rp>（</rp><rt>じ</rt><rp>）</rp>山<rp>（</rp><rt>さん</rt><rp>）</rp></ruby>は <ruby>高<rp>（</rp><rt>たか</rt><rp>）</rp></ruby>いです。		\N	Mt.Fuji is high.	2983
9484	あそこは <ruby>静<rp>（</rp><rt>しず</rt><rp>）</rp></ruby>かじゃ（では）ありません。		\N	It is not quiet there.	2983
9485	この <ruby>本<rp>（</rp><rt>ほん</rt><rp>）</rp></ruby>は <ruby>面<rp>（</rp><rt>おも</rt><rp>）</rp>白<rp>（</rp><rt>しろ</rt><rp>）</rp></ruby>くないです。		\N	This book is not interesting.	2984
9486	ペキンは <ruby>寒<rp>（</rp><rt>さむ</rt><rp>）</rp></ruby>いですか。		\N	Is it cold in Beijing? …… はい、<ruby>寒<rp>（</rp><rt>さむ</rt><rp>）</rp></ruby>いです。 …… Yes, it is [cold].	2986
9487	<ruby>奈<rp>（</rp><rt>な</rt><rp>）</rp>良<rp>（</rp><rt>ら</rt><rp>）</rp>公<rp>（</rp><rt>こう</rt><rp>）</rp>園<rp>（</rp><rt>えん</rt><rp>）</rp></ruby>は にぎやかですか。		\N	Is Nara Park busy? …… いいえ、にぎやかじゃ ありません。 …… No, it isn't [busy].	2986
9488	ワット<ruby>先<rp>（</rp><rt>せん</rt><rp>）</rp>生<rp>（</rp><rt>せい</rt><rp>）</rp></ruby>は <ruby>親<rp>（</rp><rt>しん</rt><rp>）</rp>切<rp>（</rp><rt>せつ</rt><rp>）</rp></ruby>な <ruby>先<rp>（</rp><rt>せん</rt><rp>）</rp>生<rp>（</rp><rt>せい</rt><rp>）</rp></ruby>です。		\N	Mr.Watt is a considerate teacher.	2987
9489	<ruby>富<rp>（</rp><rt>ふ</rt><rp>）</rp>士<rp>（</rp><rt>じ</rt><rp>）</rp>山<rp>（</rp><rt>さん</rt><rp>）</rp></ruby>は <ruby>高<rp>（</rp><rt>たか</rt><rp>）</rp></ruby>い <ruby>山<rp>（</rp><rt>やま</rt><rp>）</rp></ruby>です。		\N	Mt.Fuji is a high mountain.	2987
9490	<ruby>日<rp>（</rp><rt>に</rt><rp>）</rp>本<rp>（</rp><rt>ほん</rt><rp>）</rp></ruby>の <ruby>食<rp>（</rp><rt>た</rt><rp>）</rp></ruby>べ<ruby>物<rp>（</rp><rt>もの</rt><rp>）</rp></ruby>は おいしですが、<ruby>高<rp>（</rp><rt>たか</rt><rp>）</rp></ruby>いです。		\N	Japanese food is delicious, but it is expensive.	2988
9491	ペキンは とても <ruby>寒<rp>（</rp><rt>さむ</rt><rp>）</rp></ruby>いです。		\N	Beijing is very cold.	2989
9492	これは とても <ruby>有<rp>（</rp><rt>ゆう</rt><rp>）</rp>名<rp>（</rp><rt>めい</rt><rp>）</rp></ruby>な <ruby>映<rp>（</rp><rt>えい</rt><rp>）</rp>画<rp>（</rp><rt>が</rt><rp>）</rp></ruby>です。		\N	This is a very famous movie.	2989
9493	シャンヘイは あまり <ruby>寒<rp>（</rp><rt>さむ</rt><rp>）</rp></ruby>くないです。		\N	Shanghai is not very cold.	2989
9494	<ruby>桜<rp>（</rp><rt>さくら</rt><rp>）</rp>大<rp>（</rp><rt>だい</rt><rp>）</rp>学<rp>（</rp><rt>がく</rt><rp>）</rp></ruby>は あまり <ruby>有<rp>（</rp><rt>ゆう</rt><rp>）</rp>名<rp>（</rp><rt>めい</rt><rp>）</rp></ruby>な <ruby>大<rp>（</rp><rt>だい</rt><rp>）</rp>学<rp>（</rp><rt>がく</rt><rp>）</rp></ruby>じゃ ありません。		\N	Sakura University is not a very well-known university.	2989
10478	In		\N	Lesson 26 you learned Vて-formいただけませんか, which is used to request someone to do something. V causative て-form いただけませんか, on the other hand, is used to seek permission.	3292
9495	<ruby>日<rp>（</rp><rt>に</rt><rp>）</rp>本<rp>（</rp><rt>ほん</rt><rp>）</rp></ruby>の <ruby>生<rp>（</rp><rt>せい</rt><rp>）</rp>活<rp>（</rp><rt>かつ</rt><rp>）</rp></ruby>は どうですか。		\N	How do you find life in Japan? …… <ruby>楽<rp>（</rp><rt>たの</rt><rp>）</rp></ruby>しいです。 …… It's fun.	2990
9496	<ruby>奈<rp>（</rp><rt>な</rt><rp>）</rp>良<rp>（</rp><rt>ら</rt><rp>）</rp></ruby>は どんな <ruby>町<rp>（</rp><rt>まち</rt><rp>）</rp></ruby>ですか。		\N	What sort of town is Nara? …… <ruby>古<rp>（</rp><rt>ふる</rt><rp>）</rp></ruby>い <ruby>町<rp>（</rp><rt>まち</rt><rp>）</rp></ruby>です。 …… It's an old town.	2991
9497	お<ruby>仕<rp>（</rp><rt>し</rt><rp>）</rp>事<rp>（</rp><rt>ごと</rt><rp>）</rp></ruby>は どうですか。		\N	How's your work going? …… そうですね。<ruby>忙<rp>（</rp><rt>いそが</rt><rp>）</rp></ruby>しいですが、おもしろいです。 …… Well, it's busy, but it's interesting.	2992
9498	わたしは韓国料理が好きです。		\N	\N	2993
9499	クラシックコンサートが好きです。		\N	\N	2993
9500	母はカラオケが好きです。		\N	\N	2993
9501	ご主人は音楽が好きですか。		\N	\N	2993
9502	ラビさんは歌が上手です。		\N	\N	2994
9503	高田さんは料理が上手です。		\N	\N	2994
9504	ミカエルさんはダンスが上手です。		\N	\N	2994
9505	エミさんは日本語が上手です。		\N	\N	2994
9506	トムさんは漢字がわかりますか。		\N	\N	2995
9507	…はい、わかります。		\N	\N	2995
9508	…いいえ、わかりません。		\N	\N	2995
9509	● わかります・わかりました		\N	\N	2995
9510	お金と車があります。		\N	\N	2996
9511	サッカーのチケットがあります。		\N	\N	2996
9512	わたしは赤い車があります。		\N	\N	2996
9513	チョウさんはお金があります。		\N	\N	2996
9514	飲み物がありません**から**、コンビニで買います。		\N	\N	2997
9515	お金がありません**から**、バスで行きます。		\N	\N	2997
9516	コンサートのチケットがあります**から**、一緒に行きませんか。		\N	\N	2997
9517	ひまです**から**、ダンスの雑誌を読みます。		\N	\N	2997
9518	This		\N	sentence pattern is used to indicate the existence or presence of a thing(s) or person(s). The thing(s) or person(s) in such a sentence is treated as the subject and marked with the particle が.	2998
9519	コンピューターがあります。		\N	There is a computer.	2998
9520	桜があります。		\N	There are cherry trees.	2998
9521	公園があります。		\N	There is a park.	2998
9522	男の人がいます。		\N	There is a man.	2998
9523	犬がいます。		\N	There is a dog.	2998
9524	わたしの部屋に机があります。		\N	There is a desk in my room.	2999
9525	事務所にミラーさんがいます。		\N	Mr.Miller is in the office.	2999
9526	地下に何がありますか。		\N	What is there in the basement?	2999
9527	…レストランがあります。 …There		\N	are restaurants.	2999
9528	受付にだれがあります。		\N	Who is at the reception desk?	2999
9529	…木村さんがいます。 …		\N	Ms.Kimura is there.	2999
9530	東京ディズニーランドは千葉県にあります。		\N	Tokyo Disneyland is in Chiba Prefecture.	3000
9531	みらーさんは事務所にいます。		\N	Mr.Miller is in the office.	3000
9532	東京ディズニーランドはどこにありますか。		\N	\N	3000
9533	… 千葉県に あります。		\N	\N	3000
9534	ミラーさんはどこにいますか。		\N	Where is Mr.Miller?	3000
9535	…事務所にいます。 …He’s		\N	in the office.	3000
9536	東京ディズニーランドはどこにありますか。		\N	\N	3000
9537	… 千葉県です。		\N	\N	3000
9538	うえ, した, まえ, うしろ, みぎ, ひだり, なか, そと, となり, ちかく		\N	and あいだ are nouns denoting position.	3001
9539	机の上に写真があります。		\N	There is a picture on the desk.	3001
9540	郵便局は銀行の隣 (となり) にあります。		\N	The post office is next to the bank.	3001
9541	駅の近くで友達に会いました。		\N	I met a friend near the station.	3001
9542	Nouns		\N	are concerned in coordinate relation by the particle や. While と enumerates all the items, や shows a few representative items. Sometimes など is put after the last noun to explicitly express that there are also some other things of the kind.	3002
9543	箱 (はこ) の中に手紙 (てがみ)や写真 (しゃしん)があります。		\N	There are letters, pictures and so on in the box.	3002
9544	箱 (はこ) の中に手紙 (てがみ)や写真 (しゃしん)などがあります。		\N	There are letters, pictures and so on in the box.	3002
9545	The		\N	particle か has the function to confirm. The speaker picks up a word or words he/she wants to confirm and confirms it (them) using this pattern.	3003
9546	すみません。ユニューヤ・ストアはどこですか。		\N	\N	3003
9547	…ユニューヤ・ストアですか。あのビルの なかです。		\N	\N	3003
9548	The		\N	expression チリソースはありませんか is found in the conversation of this lesson. By using the negative form ありませんか instead of ありますか, you can be indirect and polite, showing that you are prepared for a negative answer.	3004
9549	1ヵ月に2回映画を見ます。		\N	\N	3005
9550	だけ		\N	means “only”. It is added after quantifiers or nouns to express that there is no more or nothing ( no one ) else.	3006
9551	パワー電気に外国人の社員が1人だけいます		\N	\N	3006
9552	休みは日曜日だけです。		\N	\N	3006
9553	Affirmative:		\N	N/Na adj + です － N/Na adj + でした。Negative: N/Na adj + じゃ（では）ありません。 – N/Na adj + じゃ（では）ありませんでした.	3007
9554	きのうは雨でした。		\N	It was rainy yesterday	3007
9555	きのうの試験は簡単じゃありませんでした。Yesterday’s		\N	exam was not easy.	3007
9556	きのうは暑かったです。		\N	It was hot yesterday きのうのパーティーはあまり楽しくなかったです。 I didn’t enjoy yesterday’s party very much	3008
9557	この車はあの車より大きいです		\N	\N	3009
9558	The		\N	question asks the listener to choose between two items ( N1 and N2). The interrogative used is always どちらif the comparison is made between two items.	3011
9559	サッカーと野球とどちらがおもしろいですか。		\N	\N	3011
9560	サッカーのほうがおもしろいです。		\N	\N	3011
9561	ミラーさんとサントスさんとどちらがテニスが上手ですか		\N	\N	3011
9562	日本料理の中で何がいちばんおいしいですか。		\N	\N	3013
9563	天ぷらがいちばんおいしいです。		\N	\N	3013
9564	１年でいつがいちばん寒いですか		\N	\N	3013
9565	２月がいちばん寒いです。		\N	\N	3013
9566	When		\N	the subject of an adjective sentence is questioned, が is attached to the interrogative in the same way.	3013
9567	This		\N	sentence pattern is used to express the speaker’s desire to possess or have an object. It can also be used to ask what the listener wants. The object is marked with the particle が. ほしい is an い- adjective.	3014
9568	わたしは友達が欲しいです。		\N	I want a friend.	3014
9569	今何が一番欲しいですか。What		\N	do you want most now?	3014
9570	車が欲しいです. ….I		\N	want a car most.	3014
9571	子どもが欲しいですか。		\N	Do you want a child?	3014
9572	いいえ、欲しくないです。…No,		\N	I don’t	3014
9573	1)Verb ます-form		\N	\N	3015
9574	The		\N	form of a verb when it is used with ます is called the ます form. In the word かいます かい is the ます form.	3015
9575	2)		\N	V ますform たいです	3015
9576	This		\N	expresses the speaker’s desire to do something. It is also used to ask what the listener wants to do. In this expression, as is seen in the example below , the particle が can replace the particle を。The other particles cannot be replaced by がVますform-たい inflects as an い-adjective.	3015
9577	わたしは沖縄へ行きたいです。I		\N	want to go to Okinawa	3015
9578	わたしはてんぷらを（が）食べたいです。I		\N	want to eat tempura	3015
9579	神戸で何を（が）買いたいですか。What		\N	do you want to buy in Kobe.	3015
9580	靴を（が）買いたいです。I		\N	want to by a pair of shoes	3015
9581	お腹が痛いですから、何も食べたくないです。Because		\N	I have a stomachache, I don’t want to eat anything.	3015
9582	The		\N	purpose for 行きます/来ます/帰ります is expessed using this pattern. The purpose is marked with the particle に . A noun used before に is of the kind of denoting an action.	3016
9583	神戸へインド料理を食べに行きます。I’m		\N	going to Kobe to eat Indian food.	3016
9584	神戸へ買い物に行きます。I’m		\N	going to Kobe for shopping.	3016
9585	日本へ美術の勉強に来ました。I		\N	came to Japan in order to study art.	3016
9586	あした京都のお祭りに行きます。		\N	\N	3016
9587	The		\N	particle にmarks the goal when used with verbs like はいります、のります、etc. The particle を marks the starting point or place when used with verbs like でます、おります, etc.	3017
9588	あの喫茶店に入りましょう。Let’s		\N	go in that coffee shop.	3017
9589	7時にうちを出ます。I		\N	leave my house at 7 o’clock.	3017
9590	どこか		\N	means anywhere or somewhere. 何か means anything or something. The particles へ and を can me omitted.	3018
9591	冬休みはどこか「へ」行きましたか。		\N	\N	3018
9592	。。。はい、行きました。		\N	\N	3018
9593	のどがかわしましたから、何か「を」飲みたいです。		\N	\N	3018
9594	ご		\N	is a prefix added to some words to express respect.	3019
9595	ご注文は？		\N	May I have your order?	3019
9596	In		\N	the verbs of this group, the last sound of the ます – form is that of the い-line.	3021
9597	かきます		\N	write のみます drink.	3021
9598	In		\N	most of the verbs of this group , last sound of the ます-form is that of the え- line, but in some verbs the last sound of the ます-form is that of the い-line.	3021
9599	たべます		\N	eat みせます show みます see	3021
9600	Verbs		\N	of this group include します and “noun denoting an action + します” as well as きます。	3021
9601	The		\N	verb form which ends with て or で is called the て- form. How to make the て-form of a verb depends on which group the verb belongs to as explained below.	3022
9602	1)Group		\N	I Depending on the last sound of the ます-form, the て- form of the verbs of this group is made as shown in the form table. Note that the て- form of the verb いきます、いって , is an exception.	3022
9603	2)Group		\N	II Attach て to the ます-form.	3022
9604	3)Group		\N	III Attach て to the ます-form.	3022
9605	すみませんが、この漢字の読み方を教えてください。		\N	\N	3023
9606	ここに住所と名前を書いてください		\N	\N	3023
9607	ぜひ遊びに来てください。		\N	\N	3023
9608	When		\N	it is used to ask the listener to do something, すみませんが is often added before V て-form ください. This expression is pliter than only saying Vて-form ください.	3023
9609	ミラーさんは今電話をかけています。		\N	\N	3024
9610	今雨が降っていますか?		\N	Is it raining now	3024
9611	。。。はい、降っています。 …Yes,		\N	it is.	3024
9612	。。。いいえ、降っていません。 …No,		\N	it is not.	3024
9613	A.あしたも来ましょうか		\N	Shall I come tomorrow, too?	3025
9614	B.ええ１０時にきてください。 ….Yes,		\N	please come at ten.	3025
9615	A.傘を貸しましょうか		\N	Shall I lend you an umbrella?	3025
9616	B.すみません。お願いします。 …Yes,		\N	please.	3025
9617	A.荷物を持ちましょうか		\N	Shall I carry your parcel?	3025
9618	B.いいえ、けっこうです。 …No,		\N	thank you.	3025
9619	失礼ですが、お名前は？		\N	\N	3026
9620	すみませんが塩を取ってください。		\N	\N	3026
9621	You		\N	learned the conjunctive particle が in lesson 8. In expressions such as しつれいですが orすみませんが , which are used as introductory remarks when speaking to someone, が , losing its original meaning, is used to connect two sentences lightly.	3026
9622	When		\N	describing a natural phenomenon, the subject is indicated by が.	3027
9623	雨が降っていますか.		\N	\N	3027
9624	写真を撮ってもいいですか。		\N	You may take pictures.	3028
9625	たばこを吸ってもいいですか。		\N	May I smoke?	3028
9626	このカタログをもらってもいいですか。		\N	May I have this catalogue?	3028
9627	…ええ、いいですよ。どうぞ。 …		\N	Yes. Here you are.	3028
9628	…すみません。ちょっと。 …Sorry.		\N	I’m afraid not.	3028
9629	先生、ここで遊んでもいいですか。		\N	May we play here, Ma’am?	3029
9630	…いいえ、いけません。 …		\N	No, you must not.	3029
9631	In		\N	addition to the usage of Vて-form いますyou learned in Lesson 14, it is also used in describing a certain continuing state which resulted from a certain action in the past.	3030
9632	わたしは結婚しています。		\N	I’m married.	3030
9633	わたしは田中さんを知っています。		\N	I know Mr. Tanaka.	3030
9634	わたしは大阪に住んでいます。		\N	I live in Osaka.	3030
9635	わたしはかめらをもっています。		\N	I have a camera.	3030
9636	もっています		\N	means “be holding” and “possess” as well.	3030
9637	Vて-form		\N	is also used in describing a habitual action; that is, when the same action is repeatedly performed over a period of time.	3031
9638	Therefore,		\N	one’s occupation can be expressed by this sentence pattern. So if the question おしごとはなんですか is asked, this sentence pattern can be used to answer it.	3031
9639	IMC はコンピューターを作っています。		\N	IMC makes computer software.	3031
9640	スーパーでフィルムを打っています。		\N	Supermarkets sell films.	3031
9641	ミラーさんは		\N	IMCで働いています。 Mr. Miller works for IMC.	3031
9642	妹は 大学で勉強しています。		\N	My younger sister is studying at university.	3031
9643	The		\N	negative form of しっています is しりません.	3032
9644	市役所の 電話番後を知っていますか。		\N	\N	3032
9645	…はい、知っています。		\N	\N	3032
9646	…いいえ、知りません。		\N	\N	3032
9647	To		\N	connect verb sentences, the て-form is used. When two or more actions take place in succession, the actions are mentioned in the order of occurrence by using the て-form. The tense of sentence is determined by the tense form of the last verb in the sentence.	3033
9648	朝ジョギングをしてシャワーを浴びて、会社へ行きます。		\N	\N	3033
9649	神戸へいって映画を見て、お茶を飲みました。		\N	\N	3033
9650	When		\N	joining an い-adjective sentence to another sentence, take away the い from the い-adjective and attach くて。	3034
9651	おおき-い =&gt; おおきくて		\N	\N	3034
9652	ちいさ-い =&gt; ちいさくて		\N	\N	3034
9653	い-い =&gt; よくて		\N	\N	3034
9654	ミラーさんは若くて元気です。		\N	\N	3034
9655	きのうは天気がよくて、暑かったです。		\N	\N	3034
9656	When		\N	joining noun sentences or な-adjective sentences, です is changed to で.	3035
9657	カリナさんはインドネシア人で京都大学の留学生です。		\N	\N	3035
9658	ミラーさんはハンサムで親切です。		\N	\N	3035
9659	奈良は静かで、きれいな街です。		\N	\N	3035
9660	カリナさんは学生で、マリアさんは主婦です。		\N	\N	3035
9661	X : この部屋は狭くて、きれいです。		\N	\N	3035
9662	O :この部屋は狭いですが、きれいです。This		\N	room is small but clean.	3035
9663	国へ帰ってから父の会社で働きます。		\N	\N	3036
9664	コンサートが終わってから、レストランで食事します。		\N	\N	3036
9665	This		\N	sentence pattern is used to describe an attribute of a thing or a person. The topic of the sentence is denoted by は, N1 is the topic of the sentence. N2 is the subject of the adjective’s description.	3037
9666	大阪は食べ物がおいしいです。		\N	\N	3037
9667	ドイツのフランケンはワインが有名です		\N	\N	3037
9668	マリアさんは髪が長いです。		\N	\N	3037
9669	どうやってis		\N	used to ask the way or the method of doing something. To answer such a question, the pattern learned in 1. is used.	3038
9670	大学までどうやって行きますか。		\N	\N	3038
9671	京都駅から１６番のバスに乗って、大学前で降ります。		\N	\N	3038
9672	You		\N	learned in lesson 2 that この、その and あの modify nouns. The interrogative word used in this system is どの。どの is used to ask the listener to define one among more than two which are concretely presented.	3039
9673	サントスさんはどの人ですか。		\N	\N	3039
9674	…あの背が高くて、髪が黒いです。		\N	\N	3039
9675	The		\N	verb form used withない is called the ない-form; that is to say, かかof かかないis the ない-form of かきます(write). How to make the ない-form is given below.	3040
9676	In		\N	the verbs of this group the last sound of the ます-form is always the sound in the い-line. So, replace it with the sound of the あ-line to make a ない-form. The exceptions to this rule are such verbs as かいます, あいます, etc. (わis the last sound of the ない-form in the verbs instead of あ).	3040
9677	かき – ます → かか – ない いそぎ – ます → いそが – ない		\N	\N	3040
9678	よみ – ます → よま – ない あそび – ます → あそば – ない		\N	\N	3040
9679	とり – ます → とら – ない まち – ます → また – ない		\N	\N	3040
9680	すい – ます → すわ – ない はなし – ます → はなさ – ない		\N	\N	3040
9681	The ない-form		\N	of verbs of this group is just the same as the ます-form.	3040
9682	たべ – ます → たべ – ない		\N	\N	3040
9683	み – ます → み – ない		\N	\N	3040
9684	The ない-form		\N	ofします is the same as the ます-form. きます becomes こ(ない).	3040
9685	べんきょうし – ます → べんきょうし – ない		\N	\N	3040
9686	し – ます → し – ない		\N	\N	3040
9687	き – ます → こ – ない		\N	\N	3040
9688	わたしは元気ですから、心配しないでください。		\N	\N	3041
9689	ここで写真を撮らないでください。		\N	\N	3041
9690	薬を飲まなければなりません。		\N	\N	3042
9691	あした来なくてもいいです。		\N	\N	3043
9692	You		\N	learned in Lesson 6 that the particleを is attached to the direct object of verbs. Here you learn that the object is made a topic by replacingを with は.	3044
9693	ここに荷物を置かないでください。		\N	\N	3044
9694	荷物はここに置かないでください。		\N	\N	3044
9695	会社の食堂で昼ごはんを食べます。		\N	\N	3044
9696	昼ごはんは会社の食堂で食べます。		\N	\N	3044
9697	The		\N	point in time indicated by までにis the time limit by which an action is to be done.	3045
9698	会議は5時までに終わります。		\N	\N	3045
9699	土曜日までに本を返さなければなりません。		\N	\N	3045
9700	5時まで働きます。		\N	\N	3045
9701	できますis		\N	the verb which expresses ability or possibility. A noun and V dictionary form ことbefore がindicates the content of ability or possibility.	3049
9702	Nouns		\N	placed before がare mostly nouns which express actions such as driving a car, shopping, skiing, dancing, etc. Nouns such as にほんご, which is associated with the action はなす, or ピアノ, which is associated with the actionひく, can also be used here.	3049
9703	ミラーさんは日本語ができます。		\N	\N	3049
9704	雪がたくさん降りましたから、ことしはスキーができます。		\N	\N	3049
9705	When		\N	a verb is used to describe ability or possibility, ことshould be attached to the dictionary form of the verb to make it a nominalized phrase and then ができますis put after that.	3049
9706	ミラーさんは漢字を読むことができます。		\N	\N	3049
9707	カードで払うことができます。		\N	\N	3049
9708	As		\N	shown in the sentences below, V dictionary form ことcan express the content of hobbies more concretely than the noun alone can do.	3053
9709	わたしの趣味は音楽です。		\N	\N	3053
9710	わたしの趣味は音楽を聞くことです。		\N	\N	3053
9711	日本へ来るまえに、日本語を勉強しました。		\N	\N	3057
9712	寝るまえに、本を読みます。		\N	\N	3057
9713	When まえにcomes		\N	after a noun, the particleの is put between the noun and まえに. Nouns before まえにare nouns which express actions or nouns which imply actions.	3057
9714	食事のまえに、手を洗います。		\N	\N	3057
9715	Whenまえに		\N	comes after a quantifier (period), the particleの is not necessary.	3057
9716	田中さんは1時間まえに、出かけました。		\N	\N	3057
9717	Whenなかなか		\N	is accompanied by a negative expression, it means “not easily” or “not as expected”.	3058
9718	日本ではなかなか馬を見ることができません。		\N	\N	3058
9719	ぜひis		\N	used with expressions of hope and request such as ほしいです, Vます-form たいですand Vて-form くださいand emphasizes the meaning of the expressions.	3059
9720	ぜひ北海道へ行きたいです。		\N	\N	3059
9721	ぜひ遊びに来てください。		\N	\N	3059
9722	In		\N	this lesson you learn the た-form. How to make the た-form is shown below.	3060
9723	The た-form		\N	is made by changing てand でof the て-form into たand だrespectively.	3060
9724	のんで かいた		\N	\N	3060
9725	のんだ		\N	Group II たべて たべた Group III きて	3060
9726	して きた		\N	\N	3060
9727	した		\N	\N	3060
9728	This		\N	sentence pattern is used to describe what one has experienced in the past. This is basically the same sentence as わたしはNがあります which you learned in Lesson 9. The content of one’s experience is expressed by the nominalized phrase Vた-form こと.	3061
9729	馬に乗ったことがあります。		\N	\N	3061
9730	去年北海道で馬に乗りました。		\N	\N	3061
9731	You		\N	learned an expression for referring to a few things and persons among many (～や～ [ など ] ) in Lesson 10. The sentences learned here are used in referring to some actions among many other actions. The tense of this sentence pattern is shown at the end of the sentence.	3062
9732	日曜日はテニスをしたり、映画を見たりします。		\N	\N	3062
9733	日曜日はテニスをしたり、映画を見たりしました。(*)		\N	\N	3062
9734	日曜日テニスをして、映画を見ました。(**)		\N	\N	3062
9735	なりますmeans “become”		\N	and indicates changes in a state or condition.	3066
9736	寒い → 寒くなります		\N	get cold	3066
9737	元気[な] → 元気になります		\N	get well	3066
9738	25歳 → 25歳になります		\N	become 25 years old	3066
9739	そうですねis		\N	used when you agree or sympathize with what your partner in conversation said. そうですかwith a falling intonation is a similar expression to this (see Lesson 2, 6). そうですかis, however, an expression of your conviction or exclamation after getting information which was unknown to you, whileそうですね is used to express your agreement or sympathy with your partner in conversation when he/she refers to something you agree with or already know.	3067
9740	寒くなりましたね。		\N	\N	3067
9741	そうですね。		\N	\N	3067
9742	I		\N	will go to Tokyo tomorrow. あした東京へ行く。	3068
9743	I		\N	will go to Tokyo tomorrow. 毎日忙しいです。	3068
9744	I		\N	am busy every day. 毎日忙しい。	3068
9745	I		\N	am busy every day. 相撲が好きです。	3068
9746	I		\N	like sumo. 相撲が好きだ。	3068
9747	I		\N	like sumo. 富士山に登りたいです。	3068
9748	I		\N	want to climb Mt. Fuji. 富士山に登りたい。	3068
9749	I		\N	want to climb Mt. Fuji. ドイツへ行ったことがありません。	3068
9750	I		\N	have never been to Germany. ドイツへ行ったことがない。	3068
9751	The		\N	predicates which are used in polite style sentences and accompanied by either ですor ますare called the polite form, while the predicates used in plain style sentences are called the plain form.	3068
9752	1)		\N	Questions in the plain style generally omit the particle か, which denotes a question, and end with a rising intonation.	3070
9753	コーヒーを飲む？		\N	Do you want a coffee?	3070
9754	うん、飲む。		\N	Yes, I do.	3070
9755	2)		\N	In noun and な-adjective questions, だ, which is the plain form of です, is omitted. In an answer in the affirmative, ending the sentence with だcould sound too rough. You can either omit だor add some sentence final particle to soften the tone of the sentence. Women seldom use だ.	3070
9756	今晩暇？		\N	Are you free tonight? (used by both men and women)	3070
9757	うん、暇／暇だ／暇だよ。		\N	Yes, I am. (used by men)	3070
9758	うん、暇／暇よ。		\N	Yes, I am. (used by women)	3070
9759	ううん、暇じゃない。		\N	No, I am not. (used by both men and women)	3070
9760	ごはん[を]食べる？		\N	\N	3070
9761	あした京都[へ]行かない？		\N	\N	3070
9762	このりんご[は]おいしいね。		\N	\N	3070
9763	そこにはさみ[が]ある？		\N	\N	3070
9764	で, に, から, まで, と,		\N	etc., however, are not omitted because the meaning of the sentence may not be clear without them.	3070
9765	4)		\N	In the plain style, いof Vて-form いるis also often dropped.	3070
9766	辞書、持って[い]る？		\N	Do you have a dictionary?	3070
9767	うん、持って[い]る。		\N	Yes, I do.	3070
9768	ううん、持って[い]ない。		\N	No, I don’t.	3070
9769	5) けど		\N	\N	3070
9770	けどhas		\N	the same function as が, which is used to connect two sentences (see Lesson 8, 7 and Lesson 14, 7). It is often used in conversations.	3070
9771	このカレーライス[は]おいしい？		\N	\N	3070
9772	うん、辛いけど、おいしい。		\N	\N	3070
9773	相撲のチケット[が]あるけど、いっしょに行かない？		\N	\N	3070
9774	いいね。		\N	\N	3070
9775	The		\N	ideas or information expressed with おもいますare indicated by the particle と.	3071
9776	あした雨が降ると思います。		\N	\N	3071
9777	テレサちゃんはもう寝たと思います。		\N	\N	3071
9778	When		\N	the content of conjecture is negative in nature, make the sentence before とnegative.	3071
9779	ミラーさんはこのニュースを知っていますか。		\N	\N	3071
9780	いいえ、たぶん知らないと思います。		\N	\N	3071
9781	日本は物価が高いと思います。		\N	\N	3071
9782	The		\N	expression ～についてどうおもいますかis used to ask someone’s opinion on something by usingおもいます.と is not necessary afterどう.	3071
9783	新しい空港についてどう思いますか。		\N	\N	3071
9784	きれいですが、ちょっと交通が不便だと思います。		\N	\N	3071
9785	A:ファクスは便利ですね。		\N	\N	3071
9786	B:わたしもそう思います。		\N	\N	3071
9787	C:わたしはそう[は]思いません。		\N	\N	3071
9788	The		\N	content expressed withいいます is indicated by the particle と.	3072
9789	寝る前に「お休みなさい」と言います。		\N	\N	3072
9790	ミラーさんは「来週東京へ出張します」と言いました。		\N	\N	3072
9791	2)		\N	When quoting indirectly what someone says or said, the plain form is used before と. The tense of the quoted sentence is not affected by the tense of the main sentence.	3072
9792	ミラーさんは来週東京へ出張すると言いました。		\N	\N	3072
9793	な-adj /		\N	N：～だ	3073
9794	When		\N	the speaker expects that the listener has some knowledge on the topic being discussed and that the listener will agree with the speaker’s view,でしょう is said with a rising intonation to confirm the listener’s agreement.	3073
9795	あしたパーティーに行くでしょう？		\N	\N	3073
9796	ええ、行きます。		\N	\N	3073
9797	北海道は寒かったでしょう？		\N	\N	3073
9798	いいえ、そんなに寒くなったです。		\N	\N	3073
9799	When		\N	N2 expresses such events as a party, concert, festival, incident, disaster and so on, ありますmeans “to take place” or “to be held”.	3074
9800	東京で日本とブラジルのサッカーの試合があります。		\N	\N	3074
9801	When		\N	some action takes place on a certain occasion, that occasion is followed by で.	3075
9802	会議で何か意見を言いましたか。		\N	\N	3075
9803	でもis		\N	used to give an example out of things of the same kind when one encourages or advises someone to do something or when one makes a suggestion.	3076
9804	ちょっとビールでも飲みませんか。		\N	\N	3076
9805	This		\N	expression is made by omitting いけませんfrom Vない-formないといけません. V-ないformないといけません is similar to Vない-formなければなりませんwhich you learned in Lesson 17.	3077
9806	もう帰らないと。		\N	\N	3077
9807	ミラーさんのうち		\N	Mr. Miller’s house (Lesson 2)	3078
9808	新しいうち		\N	a new house (Lesson 8)	3078
9809	きれいなうち		\N	a beautiful house (Lesson 8)	3078
9810	1)		\N	The predicate of the sentence which modifies a noun is in the plain form. In the case of な-adjective sentences, ～だ becomes ～な. In the case of noun sentences ～だ becomes ～の.	3079
9811	行かない人		\N	\N	3079
9812	行った人		\N	\N	3079
9813	行かなかった人		\N	\N	3079
9814	親切で、きれいな人		\N	\N	3079
9815	65 歳の人		\N	a person who is tall and has black hair	3079
9816	わたしは先週映画を見ました → わたしが先週見た映画		\N	\N	3079
9817	ワンさんは病院で働いています → ワンさんが働いている病院		\N	\N	3079
9818	わたしはあした友達に会います → わたしがあした会う友達		\N	\N	3079
9819	When		\N	the nouns in three sentences above are modified, the particle を, でandに attached to them respectively are unnecessary.	3079
9820	これはミラーさんが住んでいたうちです。		\N	\N	3079
9821	ミラーさんが住んでいたうちは古いです。		\N	\N	3079
9822	ミラーさんが住んでいたうちを買いました。		\N	\N	3079
9823	わたしはミラーさんが住んでいたうちが好きです。		\N	\N	3079
9824	ミラーさんが住んでいたうちに猫がいました。		\N	\N	3079
9825	ミラーさんが住んでいたうちへ行ったことがあります。		\N	\N	3079
9826	When		\N	a sentence modifies a noun, the subject in the sentence is indicated by が.	3080
9827	ミラーさんはケーキを作りました → これはミラーさんが作ったケーキです。		\N	\N	3080
9828	わたしはカリナさんがかいた絵が好きです。		\N	\N	3080
9829	When		\N	expressing the time for doing some activity, put the dictionary form of the action before じかん.	3081
9830	わたしは朝ごはんを食べる時間がありません。		\N	\N	3081
9831	You		\N	can also say the content of the arrangement (appointment), etc., by putting the dictionary form of that action before やくそく, etc.	3081
9832	わたしは友達と映画を見る約束があります。		\N	\N	3081
9833	きょうは市役所へ行く用事があります。		\N	\N	3081
9834	ときconnects		\N	two sentences and expresses the time when the state or action described in the main sentence exists or occurs. As shown in the table above, the forms of verbs, い-adjectives, な-adjectives and nouns connected to ときare the same as the forms when modifying nouns.	3089
9835	図書館で本を借りるとき、カードが要ります。		\N	\N	3089
9836	使い方がわからないとき、わたしに聞いてください。		\N	\N	3089
9837	体の調子が悪いとき、「元気茶」を飲みます。		\N	\N	3089
9838	暇なとき、うちへ遊びに来ませんか。		\N	\N	3089
9839	妻が病気のとき、会社を休みます。		\N	\N	3089
9840	若いとき、あまり勉強しませんでした。		\N	\N	3089
9841	子どものとき、よく川で泳ぎました。		\N	\N	3089
9842	The		\N	tense of adjective sentences and noun sentences which modify ときis not affected by the tense of the main sentence.	3089
9843	When		\N	the dictionary form of the predicate is put beforeとき it indicates the non-completion of the action, and when the た-form of the predicate is put before ときin indicates the completion of the action.	3095
9844	国へ帰るとき、かばんを買いました。(*)		\N	\N	3095
9845	国へ帰ったとき、かばんを買いました。(**)		\N	\N	3095
9846	In (*), かえるindicates		\N	that at the time being referred to the action had not been completed, that the speaker had not reached his/her country yet and that he/she bought a bag somewhere on his/her way there (Japan is included). In (**), かえったindicates that the action was completed and the speaker bought a bag after arriving in his/her country.	3095
9847	When		\N	expressing the situation where, as a result of a certain action, another action or matter inevitably happens, とis used to connect the sentences.	3096
9848	このボタンを押すと、お釣りが出ます。		\N	\N	3096
9849	これを回すと、音が大きくなります。		\N	\N	3096
9850	右へ曲がると、郵便局があります。		\N	\N	3096
9851	Expressions		\N	of one’s will, hope, invitation or request cannot be used in the sentence which follows ～と.	3096
9852	映画を見に行きたいです(hope)		\N	\N	3096
9853	映画を見に行きませんか (invitation)		\N	\N	3096
9854	ちょっと手伝ってください (request)		\N	\N	3096
9855	In		\N	those cases, the conditional expression ～たら is used instead of ～と (see Lesson 25).	3096
9856	You		\N	learned in Lesson 14 that the subject is indicated by がwhen describing a natural phenomenon. When describing a state or a scene as it is, the subject is also indicated by が.	3097
9857	音が小さいです。		\N	\N	3097
9858	電気が明るくなります。		\N	\N	3097
9859	このボタンを押すと、切符が出ます。		\N	\N	3097
9860	The		\N	particle をis used to denote the place where a person or a thing passes. The verbs of movement such as さんぽします, わたります, あるきます, etc. are used in this pattern.	3098
9861	公園を散歩します。		\N	\N	3098
9862	道を渡ります。		\N	\N	3098
9863	交差点を右へ曲がります。		\N	\N	3098
9864	You		\N	learned that あげますmeans “give” in Lesson 7. This verb cannot be used when somebody else gives something to the speaker or the speaker’s family, etc. (x さとうさんはわたしにクリスマスカードをあげました). In this caseくれます is used.	3099
9865	わたしは佐藤さんに花をあげました。		\N	\N	3099
9866	佐藤さんはわたしにクリスマスカードをくれました。		\N	\N	3099
9867	佐藤さんは妹にお菓子をくれました。		\N	\N	3099
9868	あげます, もらいますand くれますare		\N	also used to refer to the giving and receiving of actions as well as those of things. They indicate who is doing that act for whom, while also expressing a sense of goodwill or gratitude. In this case, the act is expressed by the て-form.	3106
9869	1)		\N	Vて-formあげます	3106
9870	Vて-formあげます		\N	indicates that one does something for somebody with a sense of goodwill.	3106
9871	わたしは木村さんに本を貸してあげました。		\N	\N	3106
9872	When		\N	the speaker is the actor and the listener is the receiver of the act, this expression could give the impression that the speaker is being patronizing. You are, therefore, advised to avoid using this expression directly to someone whom you do not know very well or who is senior or superior to you. You may use it to someone with whom you have a very close, friendly relationship. So, when you offer assistance to someone who is not very close, Vます-form ましょうか (see Lesson 14,6) is used.	3106
9873	タクシーを呼びましょうか。		\N	\N	3106
9874	手伝いましょうか。		\N	\N	3106
9875	2)		\N	Vて-formもらいます	3106
9876	わたしは山田さんに図書館の電話番号を教えてもらいました。		\N	\N	3106
9877	3)		\N	Vて-formくれます	3106
9878	母は[わたし]にセーターを送ってくれました。		\N	\N	3106
9879	Like		\N	Vて-formもらいます, this expression also conveys a sense of gratitude on the part of those who receive a favor. The difference is that Vて-formもらいます has the receiver of the act as the subject of the sentence, while Vて-formくれます has the actor as the subject of the sentence, implying the actor (the subject) voluntarily takes the action. The receiver of the act in the latter case is often the speaker and わたし(the receiver) に is often omitted.	3106
9880	すてきなネクタイですね。		\N	\N	3107
9881	ええ、佐藤さんがくれました。		\N	\N	3107
9882	You		\N	present a topic, saying すてきなネクタイですね. Responding to it, your partner in conversation gives a piece of information on the topic which is unknown to you, [このネクタイは]さとうさんがくれました. The subject of the sentence giving new information is indicated by が.	3107
9883	You		\N	learned that when the subject is questioned, it is indicated byが in あります／いますsentences (Lesson 10) and adjective sentences (Lesson 12). This is also the case for verb sentences.	3108
9884	だれが手伝いに行きますか。		\N	\N	3108
9885	カリナさんが行きます。		\N	\N	3108
9886	When らis		\N	attached to the past tense plain form of verbs, adjectives, etc., it changes the preceding clause into a conditional expression. When a speaker wants to state his opinion, situation, request, etc., in the conditional, this pattern is used.	3110
9887	お金があったら、旅行します。		\N	\N	3110
9888	時間がなかったら、テレビを見ません。		\N	\N	3110
9889	安かったら、パソコンを買いたいです。		\N	\N	3110
9890	暇だったら、手伝ってください。		\N	\N	3110
9891	いい天気だったら、散歩しませんか。		\N	\N	3110
9892	１０時になったら、出かけましょう。		\N	\N	3112
9893	うちへ帰ったら、すぐシャワーを浴びます。		\N	\N	3112
9894	This		\N	expression is used to present a reverse condition. Contrary to plain past form ら、～, this expression is used when an action which is expected to be taken or an event which is expected to happen naturally under the given circumstances does not materialize or a thing turns out in a way opposite to a socially accepted idea.	3120
9895	雨が降っても、洗濯します。		\N	\N	3120
9896	安くても、わたしはグループ旅行が嫌いです。		\N	\N	3120
9897	便利でも、パソコンを使いません。		\N	\N	3120
9898	日曜日でも、働きます。		\N	\N	3120
9899	もしis		\N	used in a sentence in the plain past form to indicate beforehand that the sentence is going to present a condition, while いくらis used with ～ても（～でも）to do the same. もしimplies that an emphasis is on the speaker’s supposition while いくらis meant to stress the degree of conditionality.	3121
9900	もし一億円あったら、いろいろな国を旅行したいです。		\N	\N	3121
9901	いくら考えても、わかりません。		\N	\N	3121
9902	いくら高くても、買います。		\N	\N	3121
10479	コピー機の使い方を教えていただけませんか。		\N	Would you please tell me how to use photocopier?	3292
9903	As		\N	mentioned in Lesson 16, 4. [Note], the subject of a subordinate clause is indicated by が. In subordinate clause using たら, ても, とき, と, まえに, etc., in addition to から, the subject is indicated by が, as shown below.	3122
9904	友達が来るまえに、部屋を掃除します。		\N	\N	3122
9905	妻が病気のとき、会社を休みます。		\N	\N	3122
9906	友達が約束の時間に来なかったら、どうしますか。		\N	\N	3122
9907	な-adj /		\N	N: ～だ → ～な	3123
9908	～んですis		\N	an expression used to explain cause, reasons, grounds, etc., strongly . ～んですis used in spoken language, while ～のです is used in written language. ～んですis used in the following ways.	3123
9909	1) ～んですか		\N	\N	3123
9910	渡辺さんは時々大阪弁を使いますね。		\N	\N	3123
9911	大阪に住んでいたんですか。		\N	\N	3123
9912	ええ、１５歳まで大阪に住んでいました。		\N	\N	3123
9913	おもしろいデザインの靴です。どこで買ったんですか。		\N	\N	3123
9914	エドヤストアで買いました。		\N	\N	3123
9915	どうして遅れたんですか。(*)		\N	\N	3123
9916	どうしたんですか。(**)		\N	\N	3123
9917	2) ～んです		\N	\N	3123
9918	どうして遅れたんですか。		\N	\N	3123
9919	バスが来なかったんです。		\N	\N	3123
9920	どうしたんですか。		\N	\N	3123
9921	ちょっと気分が悪いんです。		\N	\N	3123
9922	毎朝新聞を読みますか。		\N	\N	3123
9923	いいえ。時間がないんです。		\N	\N	3123
9924	3) ～んですが、～		\N	\N	3123
9925	～んですがis		\N	used to introduce a topic. It is followed by a request, an invitation or an expression seeking permission. がin this case is used to connect sentences lightly and indicates hesistation and reservation on the speaker’s side.	3123
9926	日本語で手紙を書いたんですが、ちょっと見ていただけませんか。		\N	\N	3123
9927	NHK を見学したいんですが、どうしたらいいですか。		\N	\N	3123
9928	This		\N	is a request expression that is politer than ～てください	3124
9929	いい先生を紹介していただけませんか。		\N	\N	3124
9930	どこでカメラを買ったらいいですか。		\N	\N	3125
9931	細かいお金がないんですが、どうしたらいいですか。		\N	\N	3125
9932	～たらいいですかis		\N	used when the speaker asks the listener for some advice or instructions about what to do.	3125
9933	運動会に参加しますか。		\N	\N	3126
9934	いいえ。スポーツはあまり好きじゃないんです。		\N	\N	3126
9935	You		\N	learned in Book I (Lesson 10 and 17) that subjects and also objects indicated by をcan become topics and be highlighted byは . Objects indicated by がcan also be highlighted byは .	3126
9936	かいます かけます		\N	\N	3127
9937	かえます かける		\N	\N	3127
9938	かえる		\N	II たべます たべられます たべられる III きます	3127
9939	します こられます		\N	\N	3127
9940	できます こられる		\N	\N	3127
9941	できる		\N	\N	3127
9942	All		\N	potential verbs are Group II verbs; they conjugate into the dictionary form, ない-form, て-form, etc.	3127
9943	eg. かける、かけ（ない）、かけて		\N	\N	3127
9944	わかる,		\N	which includes the meaning of possibility itself, does not change into わかれる.	3127
9945	1)		\N	Potential verbs express not actions but states. The object of transitive verbs are indicated by the particle を. When they become potential verbs, however, their objects are usually indicated by the particle が.	3128
9946	わたしは日本語を話します。		\N	\N	3128
9947	わたしは日本語が話せます。		\N	\N	3128
9948	No		\N	particles change except for を.	3128
9949	一人で病院へ行けますか。		\N	\N	3128
9950	田中さんに会えませんでした。		\N	\N	3128
9951	ミラーさんは漢字が読めます。		\N	\N	3128
9952	この銀行でドルが換えられます。		\N	\N	3128
9953	The		\N	potential verb forみます is みられますand that forききます isきけます. They indicate that one’s intention of seeing or listening can be realized. みえますindicates that a certain object comes into one’s sight and きこえますthat a sound reaches one’s ears independent of one’s will. In sentences using みえますandきこえます , objects to be seen or heard become the objects of the sentence and are indicated by が.	3129
9954	新宿でいま黒沢の映画が見られます。		\N	\N	3129
9955	新幹線から富士山が見えます。		\N	\N	3129
9956	電話で天気予報が聞けます。		\N	\N	3129
9957	ラジオの音がが聞こえます。		\N	\N	3129
9958	駅の前に大きいスーパーができました。		\N	\N	3130
9959	時計の修理はいつできますか。		\N	\N	3130
9960	1) では／には／へは／からは／までは、etc.		\N	\N	3131
9961	はis		\N	used to highlight a noun as a topic, and as you learned in Lesson 10, 17 and 26, when がorを follows the noun, it is replaced byは . When other particles (e.g.で、に、へ、 etc.) follow the noun, はis placed after them.	3131
9962	わたしの学校にはアメリカ人の先生がいます。		\N	\N	3131
9963	わたしの学校では中国語が習えます。		\N	\N	3131
9964	2) はused		\N	to make contrasts	3131
9965	きのうは山が見えましたが、きょうは見えません。		\N	\N	3131
9966	ワインは飲みますが、ビールは飲みません。		\N	\N	3131
9967	京都へは行きますが、大阪へは行きません。		\N	\N	3131
9968	Like		\N	the usage ofは explained above, もreplaces をor が, but follows other particles. In the case of the particleへ , however, it can be omitted.	3132
9969	クララさんは英語が話せます。フランス語も話せます。		\N	\N	3132
9970	去年アメリカへ行きました。メキシコ[へ]も行きました。		\N	\N	3132
9971	わたしの部屋から海が見えます。弟の部屋からも見えます。		\N	\N	3132
10480	友達の結婚式があるので、早退させていただけませんか。		\N	As I’m going to attend my friend’s wedding, would you please let me leave earlier?	3292
9972	しかis		\N	attached to nouns, quantifiers, etc., and is always used with negative predicates. It highlights the words, makes limitations and negates everything except the thing expressed by the word. It replacesが orを, but follows other particles. しかhas a negative nuance, while だけhas a positive one.	3133
9973	ローマ字しか書けません。		\N	\N	3133
9974	ローマ字だけ書けます。		\N	\N	3133
9975	音楽を聞きながら食事します。		\N	\N	3134
9976	働きながら日本語を勉強しています。		\N	\N	3134
9977	An		\N	individual’s customary action is expressed by this sentence pattern. A customary action in the past is expressed by using Vて-formいました.	3135
9978	毎朝ジョギングをしています。		\N	\N	3135
9979	子どものとき、毎晩８時に寝ていました。		\N	\N	3135
9980	ワット先生は熱心だし、まじめだし、経験もあります。		\N	\N	3136
9981	駅から近いし、車でも来られるし、この店はとても便利です。		\N	\N	3136
9982	息子に英語を教えていただけませんか。		\N	\N	3136
9983	うーん、出張も多いし、もうすぐ日本語の試験もあるし，…。		\N	\N	3136
9984	There		\N	are cases when only one ～し is used in a sentence. Though the reason explicitly stated is only one, the existence of other reasons is implied by the use of ～し. Note this is not true of ～から.	3136
9985	色もきれいだし、この靴を買います。		\N	\N	3136
9986	As		\N	you seen above, the particleも is often used in this sentence pattern. By the use ofも , the speaker implies the existence of other reasons to emphasize his/her viewpoint.	3136
9987	それにis		\N	used when you add another similar fact or situation.	3137
9988	どうしてさくら大学を選んだんですか。		\N	\N	3137
9989	さくら大学は、父が出た大学し、いい先生も多いし、それに家から近いですから。		\N	\N	3137
9990	それでis		\N	a conjunction used to show that what was said before it is the reason or cause for the sentence following it.	3138
9991	このレストランは値段も安いし、おいしいんです。		\N	\N	3138
9992	それで、人が多いんですね。		\N	\N	3138
9993	よくこの喫茶店に来るんですか。		\N	\N	3139
9994	In		\N	this sentence, the particle に, which indicates one’s destination, is used instead of the particle へ, which shows direction. Verbs like いきます、きます、かえりますandしゅっちょうします are used with either “placeへ” or “placeに”.	3139
9995	Vて-form いますexpresses		\N	the state which results as a consequence of the action expressed by the verb.	3140
9996	1)		\N	N がVて-formいます	3140
9997	窓が割れています。(*)		\N	\N	3140
9998	電気がついています。		\N	\N	3140
9999	As		\N	in the examples above, when the speaker describes the state he/she sees in front of him/her as it is, the subject of the action is indicated with が. Example (*) shows that “the window was broken in the past and at present its consequence remains (=it is broken)”. Verbs which are used with this expression are intransitive verbs, and most of them indicate an instantaneous act or action. Examples of such verbs include こわれます、きえます、あきます、こみますetc.	3140
10000	When		\N	describing states in the past, Vて-formいました is used.	3140
10001	けさは道が込んでいました。		\N	\N	3140
10002	2)		\N	N はV-てformいます	3140
10003	When		\N	the subject of an act or action is taken up as a topic, it is indicated with は.	3140
10004	このいすは壊れています。		\N	\N	3140
10005	Vて-form しまいましたis		\N	an expression which emphasizes that an action or event has been completed.	3141
10006	シュミットさんが持って来たワインは全部飲んでしまいました。		\N	\N	3141
10007	漢字の宿題はもうやってしまいました。		\N	\N	3141
10008	Though		\N	V ましたcan also indicate the completion of an action, the use of Vて-form しまいました emphasizes the actual completion of the action. Therefore, the latter is often accompanied by such adverbs asもう and/or ぜんぶ .	3141
10009	Also,		\N	Vて-formしまいますexpresses that the speaker will complete an action in the future.	3141
10010	昼ごはんまでにレポートを書いてしまいます。		\N	\N	3141
10011	パスポートをなくしてしまいました。		\N	\N	3142
10012	パソコンが故障してしまいました。		\N	\N	3142
10013	Though		\N	the fact of losing one’s passport or the trouble with the computer can be expressed with なくしましたor 故障しました, these sentences above add the speaker’s feeling of regret or embarrassment about the fact.	3142
10014	ありましたhere		\N	is used to indicate that the speaker has found the bag, not to indicate that it existed some place in the past.	3143
10015	In		\N	the examples shown in Lesson 13, you learned へin どこかへand をin なにかをcould be omitted. However, でin どこかでor にinどこかに cannot be omitted.	3144
10016	どこかで財布をなくしてしまいました。		\N	\N	3144
10017	どこかに電話がありませんか。		\N	\N	3144
10018	Vて-formあります		\N	indicates the state which results as a consequence of an action intentionally done by somebody. The verbs used here are transitive verbs that express intentions.	3145
10019	1)		\N	N1 にN2 がVて-form あります	3145
10020	机の上にメモが置いてあります。(*)		\N	\N	3145
10021	カレンダーに今月の予定が書いてあります。(**)		\N	\N	3145
10022	2)		\N	N2は N1 Vて-formあります	3145
10023	メモはどこですか。		\N	\N	3145
10024	今月の予定はカレンダーに書いてあります。		\N	\N	3145
10025	3)		\N	Vて-formあります is used to express the state of the result of what somebody did for some purpose. So it can also express, as in (i) and (ii), that some preparation has been done. It is often used with もう.	3145
10026	誕生日のプレゼントはもう買ってあります。		\N	\N	3145
10027	ホテルはもう予約してあります。		\N	\N	3145
10028	窓が閉まっています。		\N	\N	3145
10029	窓が閉めてあります。		\N	\N	3145
10030	(x)		\N	simply describes the state that the window is closed, while (y) implies that somebody (it could be the speaker himself) closed the window with some objective or intention in mind. Most verbs used in Vて-form いますare intransitive, while verbs used in Vて-formあります are transitive.	3145
10031	旅行のまえに切符を買っておきます。		\N	\N	3146
10032	次の会議までに何をしておいたらいいですか。		\N	\N	3146
10033	この資料を読んでおいてください。		\N	\N	3146
10034	はさみを使ったら、元の所に戻しておいてください。		\N	\N	3146
10035	あした会議がありますから、いすはこのままにしておいてください。		\N	\N	3146
10036	まだ雨が降っています。		\N	\N	3147
10037	道具を片づけましょうか。		\N	\N	3147
10529	1) ございます		\N	\N	3300
10038	まだ使っていますから、そのままにしておいてください。		\N	\N	3147
10039	まだabove		\N	means “as yet” or “still” and indicates that the action or the state is continuing.	3147
10040	ブロードウェイでミュージカルを見たいと思うんですが…。		\N	\N	3148
10041	それはいいですね。		\N	\N	3148
10042	来月から大阪の本社に転勤なんです。		\N	\N	3148
10043	それはおめでとうございます。		\N	\N	3148
10044	時々頭や胃が痛くなるんです。		\N	\N	3148
10045	それはいけませんね。		\N	\N	3148
10046	それabove		\N	refers to what is stated just before.	3148
10047	Group		\N	I: Replace the sound of the ます-form with the sound in the お-line of the same row and attach う.	3149
10048	Group		\N	II: Attach ようto the ます-form.	3149
10049	Group		\N	III: しますbecomesしよう , and きますbecomes こよう.	3149
10050	The		\N	volitional form is used instead of ～しましょうin plain style sentences.	3150
10051	ちょっと休まない？		\N	\N	3150
10052	うん、休もう。		\N	\N	3150
10053	少し休もうか。		\N	\N	3150
10054	手伝おうか。		\N	\N	3150
10055	2)		\N	V volitional form と思っています	3150
10056	This		\N	sentence pattern is used to express what the speaker is thinking of doing. V volitional form とおもいますcan also express a similar meaning. V volitional formとおもっています implies that the speaker’s decision was made some time ago.	3150
10057	週末は海に行こうと思っています。		\N	\N	3150
10058	今から銀行へ行こうと思います。		\N	\N	3150
10059	彼は外国で働こうと思っています。		\N	\N	3150
10060	V		\N	dictionary formつもりです is used to express the speaker’s intention of doing something, and Vない-formない つもりですis used to express the speaker’s intention of not doing something.	3152
10061	国へ帰っても、柔道を続けるつもりです。		\N	\N	3152
10062	あしたからはタバコを吸わないつもりです。		\N	\N	3152
10063	７月の終わりにドイツへ出張する予定です。		\N	\N	3154
10064	旅行は１週間ぐらいの予定です。		\N	\N	3154
10065	銀行は、まだ開いていません。		\N	\N	3155
10066	レポートはもう書きましたか。		\N	\N	3155
10067	いいえ、まだ書いていません。		\N	\N	3155
10068	In		\N	writing, a demonstrative belonging to the そ-series, is used when a word(s) or a sentence(s) mentioned before is referred to. Sometimes, however, a demonstrative belonging to the こ-series is used instead. In this case, the writer wants to describe something to the reader as though it really existed then and there.	3156
10069	東京にない物が１つだけある。それは美しい自然だ。		\N	\N	3156
10070	わたしがいちばん欲しい物は[どこでもドア」です。このドアを開けると、どこでも行きたい所へ行けます。		\N	\N	3156
10071	毎日運動したほうがいいです。		\N	\N	3158
10072	熱があるんです。		\N	\N	3158
10073	じゃ、おふろに入らないほうがいいですよ。		\N	\N	3158
10074	日本のお寺が見たいんですが…。(*)		\N	\N	3158
10075	じゃ、京都へ行ったらいいですよ。		\N	\N	3158
10076	Example (*)		\N	illustrates a situation in which a simple suggestion is given. In such cases～たらいい is used. ～たほうがいいimplies a comparison and a choice between two things even if it is not expressed in words.	3158
10077	あしたは雨が降るでしょう。		\N	\N	3160
10078	タワポンさんは合格するでしょうか。(**)		\N	\N	3160
10079	～かもしれませんalso		\N	expresses the speaker’s inference, and means that there is a possibility that some event or state occurred/occurs/will occur. The degree of certainty however is much lower than with ～でしょう.	3162
10080	約束の時間に間に合わないかもしれません。		\N	\N	3162
10081	1) きっと		\N	\N	3163
10082	This		\N	adverb indicates that the speaker is quite certain of what he/she is saying. The probability ranges from quite high to same level as that of ～でしょう.	3163
10083	ミラーさんはきっと来ます。		\N	\N	3163
10084	あしたはきっと雨でしょう。		\N	\N	3163
10085	2) たぶん		\N	\N	3163
10086	This		\N	adverb entails less certainty thanきっと, and is mostly used with～でしょう . As shown below, たぶんis very often used with とおもいます.	3163
10087	ミラーさんは来るでしょうか。		\N	\N	3163
10088	たぶん来るでしょう。		\N	\N	3163
10089	山田さんはこのニュースをたぶん知らないと思います。		\N	\N	3163
10090	3) もしかしたら		\N	\N	3163
10091	This		\N	adverb is used with～かもしれません in most cases. A sentence withもしかしたら expresses the idea that there is less of a possibility of some event or situation occurring.	3163
10092	もしかしたら３月に卒業できないかもしれません。		\N	\N	3163
10093	何か心配なことがありますか。(***)		\N	\N	3164
10094	As		\N	shown in (***), you cannot say しんぱいな なにか, but you should rather say なにか しぱいなこと. Other similar examples are なにか～もの, どこか～ところ, だれか～ひと, いつか～とき, etc.	3164
10095	スキーに行きたいんですが、どこかいい所ありませんか。		\N	\N	3164
10096	でadded		\N	to a quantifier indicates the limit of a price, time, quantity, etc., necessary for a state, an action or an event to be realized.	3165
10097	駅まで３０分で行けますか。		\N	\N	3165
10098	３万円でビデオが買えますか。		\N	\N	3165
10099	Group		\N	I: Change the last sound of the ます-form into the sound of the え-line.	3166
10100	Group		\N	II: Attach ろto the ます-form.	3166
10101	Group		\N	III: しますbecomesしろ, and きますbecomes こい.	3166
10102	With		\N	every verb, attach なto the dictionary form.	3166
10103	早く寝ろ。		\N	Go to bed immediately.	3167
10104	遅れるな。		\N	Don’t be late.	3167
10105	–		\N	Between men who are friends. In this case, the particleよ is often attached at the end of the sentence to soften the tone.	3167
10106	あしたうちへ来い[よ]。		\N	Come to my house tomorrow.	3167
10107	あまり飲むな[よ]。		\N	Don’t drink too much.	3167
10108	逃げろ。		\N	Run.	3167
10109	エレベーターを使うな。		\N	Don’t use the elevator.	3167
10110	休め。		\N	Rest.	3167
10111	休むな。		\N	Don’t rest.	3167
10112	頑張れ。		\N	Fight!	3167
10113	負けるな。		\N	Don’t lose!	3167
10114	止まれ。		\N	Stop.	3167
10115	入るな。		\N	Don’t enter.	3167
10116	勉強しなさい。		\N	Study.	3167
10117	あの漢字は何と読むんですか。		\N	\N	3168
10118	あそこに「止まれ｣と書いてあります。		\N	\N	3168
10119	とabove		\N	indicates the content in the same way as とof～といいます (Lesson 21).	3168
10120	This		\N	pattern is used to define the meaning of the word represented by “X” .という comes from といいます. The interrogativeどういう is used to ask the meaning.	3169
10121	「立入禁止」は入るなという意味です。		\N	\N	3169
10122	このマークはどういう意味ですか。		\N	\N	3169
10123	洗濯機で洗えるという意味です。		\N	\N	3169
10124	～といいましたis		\N	used when quoting a third person’s words (Lesson 21), while ～といっていましたis used when conveying a third person’s message.	3171
10125	田中さんは「あした休みました」と言っていました。		\N	\N	3171
10126	田中さんはあした休むと言っていました。		\N	\N	3171
10127	ワンさんに「あとで電話をください」と伝えていただけませんか。		\N	\N	3173
10128	すみませんが、渡辺さんにあしたのパーティーは６時からだと伝えていただけませんか。		\N	\N	3173
10129	1)		\N	V1とおりに、V2	3174
10130	わたしがやるとおりに、やってください。		\N	\N	3174
10131	わたしが言うとおりに、書いてください。		\N	\N	3174
10132	見たとおりに、話してください。		\N	\N	3174
10133	The		\N	dictionary form is used when the action denoted by V1 is going to be done from now, and the た-form is used when the action denoted by V1 has already been done.	3174
10134	2)		\N	Nのとおりに、 V	3174
10135	線のとおりに、紙を切ってください。		\N	\N	3174
10136	説明書のとおりに、組み立てました。		\N	\N	3174
10137	新しいのを買ったあとで、なくした時計が見つかりました。		\N	\N	3175
10138	仕事のあとで、飲みに行きませんか。		\N	\N	3175
10139	Compared		\N	with Vて-formから, which has a similar meaning, Vた-form あとでemphasizes the time context in which the respective events happen.	3175
10140	しょうゆをつけて食べます。		\N	\N	3176
10141	しょうゆをつけないで食べます。		\N	\N	3176
10142	日曜日はどこも行かないで、うちでゆっくり休みます。		\N	\N	3177
10143	Group		\N	I: Change the last sound of the ます-form into the sound of the え-line and attach ば.	3178
10144	Group		\N	II: Attach ればto the ます-form.	3178
10145	Group		\N	III: きますbecomesくれば, andします becomesすれば.	3178
10146	い-adj:		\N	Change the last いof the い-adjectives into ければ.	3178
10147	な-adj:		\N	Delete the last なof the な-adjectives and attach なら.	3178
10148	Noun:		\N	Attach ならto the noun.	3178
10149	ボタンを押せば、窓が開きます。		\N	\N	3179
10150	彼が行けば、わたしも行きます。		\N	\N	3179
10151	いい天気なら、向こうに島が見えます。		\N	\N	3179
10152	ほかに意見がなければ、これで終わりましょう。		\N	\N	3179
10153	あしたまでにレポートを出さなければなりませんか。		\N	\N	3179
10154	無理なら、金曜日までに出してください。		\N	\N	3179
10155	～とis		\N	used when the result derived from the action described before とis inevitable. It is a predictable event or an unavoidable fact. ～とcannot not be used when it comes to the speaker’s wishes, judgement, permission, hopes, requests, etc.	3179
10156	ここを押すと、ドアが開きます。		\N	\N	3179
10157	We		\N	can also use ～ば.	3179
10158	ここを押せば、ドアが開きます。		\N	\N	3179
10159	As		\N	you learned in Lesson 25, ～たらhas two usages: (1) it is a conditional expression, and (2) it indicates that an action or state will occur or appear when certain conditions have been met.	3179
10160	時間がなかったら、テレビを見ません。(*)		\N	\N	3179
10161	時間がなければ、テレビを見ません。(**)		\N	\N	3179
10162	ｘ 時間がないと、テレビを見ません。		\N	\N	3179
10163	東京へ来たら、ぜひ連絡してください。(***)		\N	\N	3179
10164	ｘ 東京へ来れば、ぜひ連絡してください。		\N	\N	3179
10165	In (*)		\N	and (**), ～たらand ～ばcan be used, as unlike ～と, they are followed by expressions reflecting the speaker’s will. In (***), however, only ～たらmay be used because the subjects in the former and the latter denote the same person and both verbs are volitional. Although ～たらhas the widest range of use, as is shown above, it is not usually used in newspaper articles and business reports because it is colloquial.	3179
10166	N ならis		\N	also used when the speaker takes up the topic introduced by the other person and gives some information on it.	3180
10167	温泉に行きたいんですが、どこかいい所ありませんか。		\N	\N	3180
10168	温泉なら、白馬がいいですよ。		\N	\N	3180
10169	This		\N	expression is used to ask for directions or suggestions as to the best course of action. It is used in the same way as ～たらいいですかthat you learned in Lesson 26.	3181
10170	本を借りたいんですが、どうすればいいですか。		\N	\N	3181
10171	本を借りたいんですが、どうしたらいいですか。		\N	\N	3181
10172	ビートルズの音楽は聞けば聞くほど好きになります。		\N	\N	3191
10173	パソコンは操作が簡単なら簡単なほどいいです。		\N	\N	3191
10174	The		\N	same verb or adjective is used in front of both ば/ならand ほどin the same sentence. This pattern expresses that the degree described in the latter part of the sentence increases/decreases with the change of the degree described in the former.	3191
10175	速く泳げるように、毎日練習しています。		\N	\N	3194
10176	忘れないように、メモしてください。		\N	\N	3194
10177	The		\N	dictionary form of non-volitional verbs such as potential verbs, わかります, みえます,きこえます, なります, etc., or a verb in its negative form should be used before ように.	3194
10178	1) なりますindicates		\N	that a state changes into another state. The verbs used here express ability or possibility: such as potential verbs, わかります, みえます, etc. V dictionary form ようになりますindicates that a state in which something cannot be done has changed into a state in which it can be done. Vない-formなくなります indicates the reverse (i.e., something can no longer be done).	3197
10179	毎日練習すれば、泳げるようになります。		\N	\N	3197
10180	やっと自転車に乗れるようになりました。		\N	\N	3197
10181	年を取ると、小さい字が読めなくなります。		\N	\N	3197
10182	太りましたから、好きな服が着られなくなりました。		\N	\N	3197
10183	2)		\N	How to give a negative answer to ～ようになりましたかis as follows:	3197
10184	ショパンが弾けるようになりましたか。		\N	\N	3197
10185	いいえ、まだ弾けません。		\N	\N	3197
10186	日本人は１００年ぐらいまえから牛肉や豚肉を食べるようになりました。		\N	\N	3197
10187	車を買ってから、わたしはあまり歩かなくなりました。		\N	\N	3197
10188	Such		\N	verbs as なれる, ふとる, やせる, etc., which denotes change itself cannot be used in this sentence pattern.	3197
10189	1) ～ようにしています		\N	\N	3200
10190	毎日運動して、何でも食べるようにしています。		\N	\N	3200
10191	歯に悪いですから、甘いものを食べないようにしています。		\N	\N	3200
10192	2) ～ようにしてください		\N	\N	3200
10193	～て／～ないでくださいare		\N	direct request expressions, while ～ようにしてくださいis an indirect request expression and more polite than the former. This pattern is used as shown below.	3200
10194	もっと野菜を食べるようにしてください。		\N	\N	3200
10195	あしたは絶対に時間に遅れないようにしてください。		\N	\N	3200
10196	すみませんが、塩を取ってください。		\N	\N	3200
10197	ｘ すみませんが、塩を取るようにしてください。		\N	\N	3200
10198	～とかis		\N	used to give some examples just like～や, but ～とかis more colloquial. Unlike や, とかsometimes comes after the last noun to be mentioned.	3201
10199	どんなスポーツをしていますか。		\N	\N	3201
10200	そうですね。テニスとか水泳とか…。		\N	\N	3201
10201	2.		\N	N1 (person1)は N2 (person2)に V passive	3202
10202	When		\N	a person (person2)’s action is directed to another person (peson1), person1 can state it from his/her side by using this sentence pattern. In this case, person1 becomes the topic of the sentence, person2 is marked with に, and a passive verb is used.	3202
10203	先生はわたしを褒めました。		\N	My teacher praised me.	3202
10204	わたしは先生に褒められました。		\N	I was praised by my teacher.	3202
10205	母はわたしに買い物を頼みました。		\N	My mother asked me to go shopping.	3202
10206	わたしは母に買い物を頼まれました。		\N	I was asked to go shopping by my mother.	3202
10207	わたしは犬にかまれました。		\N	I was bitten by a dog.	3202
10208	3.		\N	N1 (person1)は N2 (person2)にN3を V passive	3202
10209	弟がわたしのパソコンを壊しました。		\N	My brother broke my personal computer.	3202
10210	わたしは弟にパソコンを壊されました。(*)		\N	I had my personal computer broken by my brother.	3202
10211	わたしは犬に手をかまれました。		\N	I had my hand bitten by a dog.	3202
10212	わたしは友達に自転車を修理してもらいました。		\N	I had my bicycle repaired by my friend.	3202
10213	ｘ わたしは友達に自転車を修理されました。		\N	\N	3202
10214	4.		\N	N (thing) が／はV passive	3202
10215	フランスで昔の日本の絵が発見されました。		\N	An old Japanese picture has been discovered in France.	3202
10216	日本の車は世界中へ輸出されています。		\N	Japanese cars are exported all over the world.	3202
10217	会議は神戸で開かれました。		\N	The assembly was held in Kobe.	3202
10218	5.		\N	N1 はN2 (person) によってV passive	3202
10219	When		\N	something is created or discovered, and it is stated using a passive verb, the person who created or discovered it is indicated by によってinstead ofに. Verbs like かきます, はつめいします, はっけんします, etc., are used in this sentence pattern.	3202
10220	「源氏物語」は紫式部によって書かれました。 “The		\N	Tale of Genji” was written by Murasaki Shikibu.	3202
10221	電話はベルによって発明されました。		\N	The telephone was invented by Bell.	3202
10222	6.		\N	Nから／ Nでつくります	3203
10223	When		\N	something is made from a raw material, the material is marked withから. When it is obvious to the eye that something is made of a particular material, the material is marked with で.	3203
10224	ビールは麦から造られます。		\N	Beer is made from barley.	3203
10225	昔 日本の家は木で造られました。		\N	Japanese houses were made of wood in the past.	3203
10226	4.		\N	V dictionary form のを忘れました	3204
10227	かぎを忘れました。		\N	I forgot the key.	3204
10228	牛乳を買うのを忘れました。		\N	I forgot to buy milk.	3204
10229	車の窓を閉めるのを忘れました。		\N	I forgot to close the car window.	3204
10230	5.		\N	V plain formのを知っていますか。	3204
10231	This		\N	is an expression asking whether the listener knows what is described in the clause preceding の.	3204
10232	鈴木さんが来月結婚するのを知っていますか。		\N	Do you know that Mr. Suzuki is going to get married next month?	3204
10233	木村さんに赤ちゃんが生まれたのを知っていますか。(i)		\N	\N	3204
10234	いいえ、知りませんでした。		\N	\N	3204
10235	ミラーさんの住所を知っていますか。(ii)		\N	\N	3204
10236	いいえ、知りません。		\N	\N	3204
10530	ございますis		\N	the polite equivalent of あります.	3300
10531	電話は階段の横にございます。		\N	The pay phone is beside the stairs.	3300
10532	2) ～でございます		\N	\N	3300
10533	～でございますis		\N	the polite equivalent of です.	3300
10534	はい、IMCでございます。		\N	\N	3300
10535	パワー電気のシュミットですが、ミラーさん、お願いします。		\N	\N	3300
10536	3) よろしいでしょうか		\N	\N	3300
10537	よろしいでしょうかis		\N	a polite equivalent of いいですか.	3300
10538	お飲み物は何がよろしいでしょうか。		\N	What would you like to drink?	3300
10539	コーヒーをお願いします。		\N	Coffee, please.	3300
10540	このパンフレットをいただいてもよろしいでしょうか。		\N	May I have one of these pamphlets.	3300
10237	しりませんでしたis		\N	used in an example (i), because the person replying has got the information from the question. In example (ii), however, しりませんis used because the person replying has not got any information from the question.	3204
10238	6.		\N	Plain form のはNです	3204
10239	な-adj /		\N	N：～だ → ～な	3204
10240	娘は北海道の小さな町で生まれました。		\N	My daughter was born in a small town in Hokkaido.	3204
10241	娘が生まれたのは北海道の小さな町です。		\N	My daughter’s birthplace is a small town in Hokkaido.	3204
10242	１２月は１年で一番忙しいです。		\N	December is the busiest month of the year.	3204
10243	１年でいちばん忙しいのは１２月です。		\N	The busiest month of the year is December.	3204
10244	This		\N	pattern is used when a noun representing a thing, a person, a place, etc., is replaced with のand then taken up as the topic of the sentence.	3204
10245	7. ～ときも／～ときや／～ときの／～ときに、etc.		\N	\N	3204
10246	Various		\N	particles can be attached to ～とき, which you learned in Lesson 23, because the word ときis a noun.	3204
10247	疲れたときや寂しいとき、田舎を思い出す。		\N	I remember my hometown when I am tired or lonely.	3204
10248	生まれたときから、ずっと大阪に住んでいます。		\N	I have been living in Osaka since I was born.	3204
10249	In		\N	this sentence pattern, the first part of the sentence presents a cause and the second part presents the consequence produced by the cause. Unlike ～からthat you learned in Lesson 9, this pattern has many constraints over its usage.	3209
10250	–		\N	Verbs and adjectives to express feelings, such as びっくりする, あんしんする, こまる, さびしい, うれしい, ざんねんだ, etc.:	3209
10251	ニュースを聞いて、びっくりしました。		\N	I was surprised to hear the news.	3209
10252	家族に会えなくて、寂しいです。		\N	I’m sad because I can’t meet my family	3209
10253	土曜日は都合が悪くて、行けません。		\N	Saturday is inconvenient for me, so I cannot come.	3209
10254	話が複雑で、よくわかりませんでした。		\N	The story was complicated, so I could not understand it well.	3209
10255	事故があって、バスが遅れてしまいました。		\N	The bus was delayed by an accident.	3209
10256	授業に遅れて、先生にしかれました。		\N	I was late for the lesson, so I was scolded by my teacher.	3209
10257	2)		\N	Expressions containing volition (will, orders, invitation or request) are not used in the latter part of the sentence. When the latter part of the sentence contains volition, the phrase with てcannot be used and instead the phrase withから is used.	3209
10258	危ないですから、機械に触らないでください。		\N	It is dangerous, so please do not touch the machine.	3209
10259	ｘ 危なくて、機械に触らないでください。		\N	\N	3209
10260	あした会議がありますから、きょう準備しなければなりません。		\N	The meeting will be held tomorrow, so we have to make preparations for it today.	3209
10261	ｘ あした会議があって、きょう準備しなければなりません。		\N	\N	3209
10262	2.		\N	Nで	3209
10263	The		\N	particleで that you learn in this lesson indicates a cause. Nouns used in this case are those which indicate natural phenomena, happenings, events such as じこ, じしん, かじ, etc. As with sentence pattern in 1., in this construction expressions containing volition are not used as predicates.	3209
10264	地震でビルが倒れました。		\N	Because of the earthquake, a building collapsed.	3209
10265	病気で会社を休みました。		\N	Because of illness, I took a day off work.	3209
10266	ｘ 病気であした会社を休みたいです。		\N	\N	3209
10267	3.		\N	Plain form ので、～	3209
10268	な-adj /		\N	N：～だ à ～な	3209
10269	Like～から		\N	that you learned in Lesson 9, ～のでindicates causes and reasons. While ～からsubjectively highlights a cause or a reason, ～のでobjectively presents a cause and effect relationship as a natural course of events. As the use of ～のでsoftens the view of the speaker, leaving a weak impact on the listener, it is often used to express a reason gently, to ask for permission or to make an excuse.	3209
10270	日本語がわからないので、英語で話していただけませんか。		\N	I don’t understand Japanese, so would you please speak in English?	3209
10271	用事があるので、お先に失礼します。		\N	May I leave now? I have something to do.	3209
10272	危ないから、機械に触るな。		\N	\N	3209
10273	ｘ 危ないので、機械に触るな。		\N	\N	3209
10274	用事がありますので、お先に失礼します。		\N	\N	3209
10275	（＝用事があるので、お先に失礼します。）		\N	\N	3209
10276	4. 途中で		\N	\N	3209
10277	とちゅうでmeans “during”		\N	or “on the way to”. It follows V dictionary form or N の.	3209
10278	実は来る途中で事故があって、バスが遅れてしまったんです。		\N	Actually, on my way here there was an accident and the bus was delayed.	3209
10279	マラソンの途中で気分が悪くなりました。		\N	I got sick during the marathon.	3209
10280	2.		\N	Plain form + かどうか、～	3210
10281	な-adj /		\N	N：～だ → ～な	3210
10282	A		\N	question without an interrogative is used as a component of a sentence in this sentence pattern. Note that どうかis necessary after “plain form か“.	3210
10283	忘年会に出席するかどうか、２０日までに返事をください。		\N	Please answer by the 20th whether you’ll attend the year-end party or not.	3210
10284	その話はほんとうかどうか、わかりません。		\N	I don’t know whether the story is true or not.	3210
10285	まちがいがないかどうか、調べてください。(*)		\N	Please check if there are no mistakes.	3210
10286	In (*),		\N	not まちがいがあるかどうかbut まちがいがないかどうかis used before because the speaker wants to confirm that there are no mistakes.	3210
10287	3.		\N	Vて-form みます	3211
10288	もう一度考えてみます。		\N	I’ll think it over again.	3211
10289	宇宙から地球を見てみたいです。		\N	I want to see the earth from space (to know how it looks).	3211
10290	このズボンをはいてみてもいいですか。		\N	May I try on this pair of trousers?	3211
10291	4. い-adj (～い) → ～さ		\N	\N	3212
10292	Change		\N	the final いof an い-adjective into さ, and you can transform the adjective into a noun.	3212
10293	e.g., 高いà高さ 長い à長さ 速い à 速さ		\N	\N	3212
10294	山の高さはどうやって測るか、知っていますか。		\N	Do you know how to measure the height of a mountain?	3212
10295	新しい橋の長さは3,911メートです。		\N	The new bridge is 3,911 meters long.	3212
10296	5. ハンスは学校でどうでしょうか。		\N	\N	3213
10297	～でしょうか,		\N	which is used to ask a question whose answer the listener might be uncertain of, is also used to ask a question whose answer the listener is sure to be able to give. In this case, it is euphemistic and hence more polite.	3213
10298	1)		\N	N1に N2をやります	3214
10299	When		\N	the receiver is a person of lower status or an animal or plant, やりますis normally used. However, when the receiver is a person, あげますis often preferred in current Japanese.	3214
10300	わたしは息子にお菓子をやりました（あげました）。		\N	I gave some sweets to my son.	3214
10301	わたしはいぬにえさをやりました。		\N	I gave some food to the dog.	3214
10302	2)		\N	N1に N2 をいただきます	3214
10303	When		\N	the speaker receives a thing from a person of higher social status, いただきますis used instead of もらいます.	3214
10304	わたしは部長にお土産をいただきました。		\N	I received a souvenir from the manager.	3214
10305	3) [わたし]にNをくださいます		\N	\N	3214
10306	When		\N	a person of higher social status gives the speaker something, くださいますis used instead of くれます.	3214
10307	部長がわたしにお土産をくださいました。		\N	The manager gave me a souvenir.	3214
10308	くださいますis		\N	also used when the receiver is a member of the speaker’s family.	3214
10309	部長が娘にお土産をくださいました。		\N	The manager gave a souvenir to my daughter.	3214
10310	やります, いただきます,		\N	and くださいますare also used in expressing the giving and receiving of actions. Examples are shown below.	3216
10311	1)		\N	Vて-formやります	3216
10312	わたしは息子に紙飛行機を作ってやりました（あげました）。		\N	I made a paper plan for my son.	3216
10313	わたしは犬を散歩を連れて行ってやりました。		\N	I took my dog for a walk.	3216
10314	わたしは娘の宿題を見てやりました（あげました）。		\N	I checked my daughter’s homework.	3216
10315	2)		\N	Vて-form いただきます	3216
10316	わたしは課長に手紙のまちがいを直していただきました。		\N	I had my letter corrected by section chief.	3216
10317	3)		\N	Vて-formくださいます	3216
10318	部長の奥さんは[わたしに]お茶を教えてくださいました。		\N	The manager’s wife taught me the tea ceremony.	3216
10319	部長は[わたしを]駅まで送ってくださいました。		\N	The manager took me to the station.	3216
10320	部長は[わたしの]レポートを直してくださいました。		\N	The manager corrected my report.	3216
10321	～てくださいませんかis		\N	a polite expression of request, although it is less polite than～ていただけませんか in Lesson 26.	3218
10322	コピー機の使い方を教えてくださいませんか。		\N	Will you kindly show me how to use the photocopier?	3218
10323	コピー機の使い方を教えていただけませんか。		\N	Would you kindly show me how to use the photocopier?	3218
10324	The		\N	particleに means “as a token of” or “in memory of”.	3220
10325	田中さんが結婚のお祝いにこのお皿をくださいました。		\N	Mr. Tanaka gave this plate as my wedding gift.	3220
10326	わたしは北海道旅行のお土産に人形を買いました。		\N	I bought a doll as a souvenir of the trip to Hokkaido.	3220
10327	自分の店を持つために、貯金しています。		\N	I am saving money in order to have my own shop.	3225
10328	引っ越しのために、車を借ります。		\N	I will rent a car for the move.	3225
10329	N のためにis		\N	also used to mean “for the benefit of N”.	3225
10330	健康のために、毎朝走っています。		\N	For my health, I jog every morning.	3225
10331	家族のために、うちを建てます。		\N	I will build a house for my family.	3225
10332	自分の店を持つために、貯金しています。(*)		\N	\N	3225
10333	自分の店を持てるように、貯金しています。(**)		\N	\N	3225
10334	弁護士になるために、法律を勉強しています。		\N	I study law in order to become a lawyer.	3225
10335	日本語が上手になるように、毎日勉強しています。		\N	I study every day so that my Japanese may improve.	3225
10336	As		\N	you learned in Lesson 38, V dictionary form のcan be used as a noun phrase. V dictionary form のにand N にare followed by such expressions as つかう, いい, べんりだ, やくにたつ, [じかんが]かかる, etc., and indicate a purpose.	3229
10337	このはさみは花を切るのに使います。		\N	This pair of scissors is used to cut flowers.	3229
10338	このかばんは大きくて、旅行に便利です。		\N	This bag is big and convenient for trips.	3229
10339	電話番号を調べるのに時間がかかりました。		\N	It took a lot of time to find the telephone number.	3229
10340	N に行きます／来ます／帰ります 神戸へ船を見に行きます。		\N	I’ll go to Kobe to look at the ships.	3229
10341	日本へ経済の勉強に来ました。		\N	I came to Japan to study economics.	3229
10342	Vない-formない ように、 ～(volitional		\N	expression) 早く届くように、速達で出しました。 I will mail this by special delivery so that it can get there earlier.	3229
10343	忘れないように、メモします。		\N	I make a note so that I don’t forget.	3229
10344	Nの ために、 ～(volitional		\N	expression) 大学に入るために、一生懸命勉強します。 I study as hard as possible in order to enter university.	3229
10345	健康のために、野菜をたくさん食べます。		\N	I eat a lot of vegetables for my health.	3229
10346	N に使います／役に立ちます／[時間]がかかります		\N	\N	3229
10347	にいいです／便利です／必要です ファイルは書類を整理するのに使います。		\N	Files are used to put paper in order.	3229
10348	近くに店がなくて、買い物に不便です。		\N	There are no stores nearby, so it is inconvenient for shopping.	3229
10349	When		\N	attached to a quantifier, the particle はindicates the minimum amount that the speaker estimates is required or necessary.	3231
10350	日本では結婚式をするのに２００万円は要ります。		\N	In Japan you need at least 2 million yen to hold a wedding.	3231
10351	駅まで行くのに２時間もかかりました。		\N	It took as long as two hours to get to the station.	3233
10352	うちを建てるのに３０００万円も必要なんですか。		\N	You need as much as 30 million yen to build a house?	3233
10353	曇っていますね。 雨が 降りそうです。		\N	Bầu trời nhiều mây quá. Trời sắp mưa.	3234
10354	もうすぐ 桜が 咲きそうです。		\N	Hoa sakura sắp nở.	3234
10355	これから 寒くなりそうです。		\N	Trời sắp lạnh.	3234
10356	今にも 荷物が 落ちそうです。		\N	Hành lý sắp rơi.	3234
10357	煙が 少なくなりました。 火事は 消えそうです。		\N	Khói ít đi rồi. Cơn hỏa hoạn sắp tắt.	3234
10358	Ngữ pháp Ａ／Ｎａそうです		\N	\N	3234
10359	この 料理は おいしそうです。		\N	Món ăn này có vẻ ngon.	3234
10360	彼女は 忙しそうです。		\N	Cô ấy có vẻ bận.	3234
10361	彼は 暇そうです。		\N	Anh ấy có vẻ rảnh rỗi.	3234
10362	あのケーキは おいしくなさそうです。		\N	Cái bánh kia có vẻ không ngon.	3234
10363	○ わたしは うれしいです。 × わたしは うれしそうです。		\N	\N	3234
10364	○ あなたは うれしいそうです × あなたは うれしいです。		\N	\N	3234
10365	○ かのじょは うれしそうです。 × かのじょは うれしいです。		\N	\N	3234
10366	Sự khác nhau giữa 「~でしょう」và「 ~そうです」:		\N	\N	3234
10367	Ví dụ : ちょっと たばこを 買って来ます。		\N	Tôi đi mua thuốc lá một chút (rồi về).	3234
10368	ちょっと 電話を かけて来ますから、ここで 待っていて ください。		\N	Vì tôi đi gọi điện một chút nên hãy chờ tôi ở đây	3234
10369	教 室に 時計を 忘れたので、ちょっと 取って来ます。		\N	Vì quên đồng hồ ở lớp học nên tôi sẽ đi lấy.	3234
10370	スーパーで 牛 乳を 買って来ます。		\N	Tôi đi đến mua sữa ở siêu thị.	3234
10371	台 所から コップを 取って来ます。		\N	Tôi đi lấy cốc từ nhà bếp.	3234
10372	Sự khác nhau giữa 「(場所)へVに行く」 「(場所)でVて来る」		\N	\N	3234
10373	～すぎますindicates		\N	that the degree of an action or a state is excessive. Therefore, it is usually used with reference to undesirable states.	3239
10374	ゆうべお酒を飲みすぎました。		\N	I drank too much last night.	3239
10375	このセーターは大きすぎます。		\N	This sweater is too large (for me).	3239
10376	～すぎますis		\N	classified as Group II verb and therefore conjugates in the same way.	3239
10377	e.g., のみすぎる、のみすぎ(ない)、のみすぎた		\N	\N	3239
10378	最近の車は操作が簡単すぎて、運転がおもしろくないです。		\N	The handling of recent cars is so easy that driving them is not so enjoyable for me.	3239
10379	いくら好きでも、飲みすぎると、体に悪いですよ。		\N	No matter how much you like it, drinking too much is bad for your health.	3239
10380	このパソコンは使いやすいです。		\N	This personal computer is easy to use.	3244
10381	東京は住みにくいです。		\N	Living in Tokyo is difficult.	3244
10382	白いシャツは汚れやすいです。		\N	A white shirt gets dirty easily.	3244
10383	雨の日は洗濯物が乾きにくいです。		\N	Things won’t dry easily on a rainy day.	3244
10384	この薬は砂糖を入れると、飲みやすくなりますよ。		\N	If you add some sugar to this medicine, it will be easier to take.	3244
10385	このコップは割れにくくて、安全ですよ。		\N	This glass won’t break easily, so it is safe.	3244
10386	While ～く／～になりますthat		\N	you learned in Lesson 19 indicates that something “turns into” a certain state,～く／ ～にします, as shown in the sentences below, indicates that somebody “turns” something into a certain state.	3249
10387	音を大きくします。		\N	I will turn up the volume.	3249
10388	部屋をきれいにします。		\N	I will clean my room.	3249
10389	塩の量を半分にしました。		\N	I reduced the amount of salt by half.	3249
10390	Nにしますexpresses		\N	selection and/or decision.	3251
10391	部屋はシングルにしますか、ツインにしますか。		\N	Would you like a single room or a twin room?	3251
10392	会議はあしたにします。		\N	I will set the meeting for tomorrow.	3251
10393	野菜を細かく切ってください。		\N	Please cut the vegetables into small pieces.	3255
10394	電気や水は大切に使いましょう。		\N	Let’s conserve electricity and water.	3255
10395	～ばあいはis		\N	an expression used to talk about a hypothetical situation. The sentence after it indicates how to cope with such a situation or its consequence. ばあいはfollows either verbs, adjectives or nouns. Because ばあいis a noun, the form of verbs, い-adjectives, な-adjectives and nouns connected to it are the same as the forms when modifying nouns.	3263
10396	会議に間に合わない場合は、連絡してください。		\N	If you cannot be in time for the meeting, please inform us.	3263
10397	時間に遅れた場合は、会場に入れません。		\N	If you are late, you will not be admitted to the hall.	3263
10398	ファクスの調子が悪い場合は、どうしたらいいですか。		\N	In the event that the fax machine does not work well, what should I do?	3263
10399	領収書が必要な場合は、係に言ってください。		\N	When you need a receipt, please tell the person in charge.	3263
10400	火事や地震の場合は、エレベーターを使わないでください。		\N	In case of fire or earthquake, do not use the elevator.	3263
10401	のにfollows		\N	either verbs, adjectives, or nouns. Their forms used with のにare plain form. のにis used when what is stated in the second clause runs contrary to what is expected from the first clause.	3266
10402	約束をしたのに、彼女は来ませんでした。(*)		\N	She did not come, even though she promised.	3266
10403	きょうは日曜日なのに、働かなければなりません。(**)		\N	Even though today is Sunday, I have to work.	3266
10404	わたしの部屋は狭いですが、きれいです。(i)		\N	\N	3266
10405	（X狭いのに）		\N	\N	3266
10406	あした雨が降っても、出かけます。(ii)		\N	\N	3266
10407	（X雨が降るのに）		\N	\N	3266
10408	～がand ～てもin (i)		\N	and (ii) cannot be substituted with ～のに. This is because (i) simply joins two different evaluations together and the second clause therein does not represent an unexpected consequence of what is stated in the first clause. The first clause of (ii) suggests a possibility, but ～のにcan only indicate things that have actually occurred in reality.	3266
10409	約束をしたのに、どうして来なかったんですか。(iii)		\N	\N	3266
10410	（X約束をしましたが） （X約束をしても）		\N	\N	3266
10411	～のにin (iii)		\N	cannot be substituted with ～がor ～ても. This is because the second clause expresses a strong reproach.	3266
10412	The		\N	wordところ originally means “place”, but it is also used to indicate a temporal position. The ところthat you learn in this lesson is the latter and is used to stress a certain point in time during the course of action.	3271
10413	1)		\N	V dictionary formところです	3271
10414	This		\N	sentence pattern shows that a person is about to start doing something or something is about to start. It may be used together with これから, [ちょうど]いまから, etc., which makes the meaning clearer.	3271
10415	昼ごはんはもう食べましたか。		\N	Have you had lunch yet?	3271
10416	いいえ、これから食べるところです。		\N	No, I’m going to have it now.	3271
10417	会議はもう始まりましたか。		\N	Has the meeting begun yet?	3271
10418	いいえ、今から始まるところです。		\N	No, it’s just beginning now.	3271
10419	2)		\N	Vて-formいるところです	3271
10420	This		\N	sentence pattern shows that a person is now doing a certain action or a certain action is now being done. It is often used with いま.	3271
10421	故障の原因がわかりましたか。		\N	Do you know what caused the breakdown?	3271
10422	いいえ。今調べているところです。		\N	No. We are investigating now.	3271
10423	3)		\N	Vた-form ところです	3271
10424	This		\N	sentence pattern shows that a person has just finished a certain action or a certain action has just been completed. It is used together with たったいま, etc.	3271
10425	渡辺さんはいますか。		\N	Is Ms. Watanabe here?	3271
10426	あ、たった今帰ったところです。		\N	Oh, she’s just left.	3271
10481	You		\N	learnけいご in Lesson 49 and 50, けいごare expressions used to show the speaker’s respect for the listener or the person being referred to. The speaker is expected to show respect depending on his/her relationship with the listener or the person being referred to. There are the following three factors that should be considered in deciding the use of けいご: (1) When the speaker is junior or lower in social status, he/she uses けいごto show respect to the person senior or higher in social status. (2) When the speaker does not have a close acquaintanceship with the listener, as is typical when the speaker first meets the listener, he/she uses けいごto show respect to the listener. (3) The うち – そとrelationship should be also be taken into consideration with regard to the use of けいご. The speaker’s group such as his/her family and company, etc., are considered as うち, and other groups are considered as そと. When the speaker talks about うちのひと (an insider) toそとのひと (an outsider), the insider is treated like the speaker himself/herself. Therefore, even if the insider is senior or higher in status, the speaker cannot use けいごin the way that shows respect to the insider.	3293
10482	けいごare		\N	classified into three types: そんけいご (respectful expressions), けんじょうご(humble expressions) and ていねいご (polite expressions). Lesson 49 deals with そんけいご.	3294
10483	そんけいごare		\N	expressions used to describe the listener or the person referred to, as well as things connected with him/her and his/her actions.	3295
10484	中村さんは７時に来られます。		\N	Mr. Nakamura is coming at seven.	3295
10485	お酒をやめられたんですか。		\N	Have you given up drinking?	3295
10486	(2) おVます-form になります		\N	\N	3295
10487	This		\N	pattern is considered politer than the respectful verbs mentioned above. Verbs whose ます-form consist of one mora (みます, ねます, etc.) and Group III verbs cannot be used in this pattern. As for the verbs which have special equivalent (see (3) below), note that the special equivalents rather than this pattern are used.	3295
10488	社長はもうお帰りになりました。		\N	The president has already left for home.	3295
10489	ワット先生は研究室にいらっしゃいます。		\N	Professor Watt is in the office.	3295
10490	どうぞ召し上がってください。		\N	Please help yourselves.	3295
10491	ワット先生はテニスをなさいますか。		\N	Does professor Watt play tennis?	3295
10492	いいえ、なさらないと思います。		\N	No, I don’t think so.	3295
10493	(4) おVます-form ください		\N	\N	3295
10494	あちらからお入りください。		\N	Please enter from over there.	3295
10495	In		\N	addition to verbs, some nouns, adjectives and adverbs can be turned intoそんけいご by attaching おorご to the front of the word. The choice betweenお andご depends on the word. Basically お is attached to words of Japanese origin, whileご is attached to words of Chinese origin.	3295
10496	Examples		\N	of words to which おis attached:	3295
10497	(N) お国、お名前、お仕事		\N	\N	3295
10498	(な-adj) お元気、お上手、お暇		\N	\N	3295
10499	(い-adj) お忙しい、お若い		\N	\N	3295
10500	Examples		\N	of words to whichご is attached:	3295
10501	(N) ご家族、ご意見、ご旅行		\N	\N	3295
10502	(な-adj) ご熱心、ご親切		\N	\N	3295
10503	(adverb) ご自由に		\N	\N	3295
10504	A		\N	sentence can end with a plain form of けいご , which makes the sentence a plain style sentence. This kind of sentence appears on occasions such as when the speaker is talking with a close friend about a person to whom the speaker wishes to show respect.	3296
10505	部長は何時にいらっしゃる。		\N	What time will the department manager come?	3296
10506	In		\N	honorific expressions, replacing some of the words in a sentence with けいごdoes not suffice. It is necessary to keep a uniform level of けいごthroughout the entire sentence.	3297
10507	部長の奥様もごいっしょにゴルフに行かれます。(*)		\N	\N	3297
10508	In (*), おくさまand ごいっしょにare		\N	used instead ofおくさん and いっしょにin order to be consistent with the respectful verb いかれます.	3297
10509	You		\N	change Vて-form to Vます-form ましてwhen you want to be very polite. In a sentence withけいご, ～ましてis often used for consistency.	3298
10510	ハンスがゆうべ熱を出しまして、けさもまだ下がらないんです。		\N	Hans became feverish last night and still has a fever this morning.	3298
10511	けんじょうごare		\N	expressions in which the speaker humbles himself/herself and lowers his/her own acts to show respect to the listener or the person being referred to. Respect is directed at a person of higher social status or そとのひと (an outsider). けんじょうごis also used when the speaker refers to うちのひと (an insider) in front of an outsider.	3299
10512	1) お／ご～します		\N	\N	3299
10513	(1) おV (I,		\N	II group)ます-formします	3299
10514	重そうですね。お持ちしましょうか。(*)		\N	It looks so heavy. Shall I carry it for you?	3299
10515	私が社長にスケジュールをお知らせします。(**)		\N	I will tell the president the schedule.	3299
10516	兄が車でお送りします。(***)		\N	My elder brother will take you in his car.	3299
10517	This		\N	form is not applicable to verbs in which the ます-form consists of one mora as in みますor います.	3299
10518	(2) ごV (III		\N	group)	3299
10519	江戸東京博物館へご案内します。		\N	I will take you to the Edo-Tokyo Museum.	3299
10520	きょうの予定をご説明します。		\N	I will explain today’s schedule.	3299
10521	This		\N	pattern is applicable to Group III verbs. Other than those verbs given in the examples above, only those verbs which imply some association with the listener such as しょうかいします, しょうたいします, そうだんしますand れんらくしますcan be used. でんわしますand やくそくしますare exceptions in thatお instead of ごprecedes them.	3299
10522	ｘ 私は来月国へお帰りします。		\N	\N	3299
10523	社長の奥様にお目にかかりました。		\N	I met the president’s wife.	3299
10524	あしたはだれが手伝いに来てくれますか。		\N	Who will come over to help me tomorrow?	3299
10525	私が伺います。		\N	I will.	3299
10526	ミラーと申します。		\N	My name is Miller.	3299
10527	アメリカから参りました。		\N	I come from the United States.	3299
10528	ていねいごare		\N	polite expressions used to show the speaker’s respect to the listener.	3300
\.


--
-- Data for Name: Exercise; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Exercise" (id, type, question, options, answer, "lessonId", "createdAt", "updatedAt") FROM stdin;
8001	multiple_choice	「わたし」 (わたし) nghĩa là gì?	["bé ( dùng cho nữ) hoặc gọi thân mật cho trẻ con ( cả nam lẫn nữ)","Trung Quốc","bé (dùng cho nam) hoặc gọi thân mật","tôi"]	tôi	1	2026-06-24 16:16:33.063	2026-06-24 16:16:33.063
8002	multiple_choice	「あなた」 (あなた) nghĩa là gì?	["nghiên cứu sinh","you","Anh","điện"]	you	1	2026-06-24 16:16:33.069	2026-06-24 16:16:33.069
8003	multiple_choice	「あの 人（あの 方）」 (あの ひと（あの かた）) nghĩa là gì?	["you","I'm from ～ (country)","bệnh viện","that person, he, she (あの かた is the polite equivalent of あの ひと)"]	that person, he, she (あの かた is the polite equivalent of あの ひと)	1	2026-06-24 16:16:33.072	2026-06-24 16:16:33.072
8004	multiple_choice	「～さん」 (～さん) nghĩa là gì?	["anh ～, chị ～","điện","a fictitious hospital","trường đại học"]	anh ～, chị ～	1	2026-06-24 16:16:33.076	2026-06-24 16:16:33.076
8005	multiple_choice	「～ちゃん」 (～ちゃん) nghĩa là gì?	["các bạn, các anh, các chị, mọi người","bé ( dùng cho nữ) hoặc gọi thân mật cho trẻ con ( cả nam lẫn nữ)","nhân viên ngân hàng","Nhật Bản"]	bé ( dùng cho nữ) hoặc gọi thân mật cho trẻ con ( cả nam lẫn nữ)	1	2026-06-24 16:16:33.08	2026-06-24 16:16:33.08
8006	multiple_choice	「～人」 (～じん) nghĩa là gì?	["vâng","điện","người nước ～","fictitious companies"]	người nước ～	1	2026-06-24 16:16:33.084	2026-06-24 16:16:33.084
8007	multiple_choice	「先生」 (せんせい) nghĩa là gì?	["giáo viên (Không nói khi giới thiệu nghề nghiệp của chính mình)","nhân viên ngân hàng","Ấn Độ","bạn tên gì?"]	giáo viên (Không nói khi giới thiệu nghề nghiệp của chính mình)	1	2026-06-24 16:16:33.089	2026-06-24 16:16:33.089
8008	multiple_choice	「教師」 (きょうし) nghĩa là gì?	["Pháp","a fictitious institute","Hàn quốc","giáo viên ( dùng để nói đến nghề nghiệp)"]	giáo viên ( dùng để nói đến nghề nghiệp)	1	2026-06-24 16:16:33.093	2026-06-24 16:16:33.093
8009	multiple_choice	「学生」 (がくせい) nghĩa là gì?	["Nhật Bản","học sinh, sinh viên","tôi","Pleased to meet you. (lit. Please be nice to me. Usually used at the end of a self-introduction.)"]	học sinh, sinh viên	1	2026-06-24 16:16:33.097	2026-06-24 16:16:33.097
8010	multiple_choice	「会社員」 (かいしゃいん) nghĩa là gì?	["nhân viên công ty","bệnh viện","Trung Quốc","who (どなた is the polite equivalent of だれ)"]	nhân viên công ty	1	2026-06-24 16:16:33.102	2026-06-24 16:16:33.102
8011	multiple_choice	「社員」 (しゃいん) nghĩa là gì?	["nhân viên công ty","nhân viên công ty ～","Ấn Độ","tôi"]	nhân viên công ty ～	1	2026-06-24 16:16:33.106	2026-06-24 16:16:33.106
8012	multiple_choice	「銀行員」 (ぎんこういん) nghĩa là gì?	["nhân viên ngân hàng","nhân viên công ty","Thái Lan","học sinh, sinh viên"]	nhân viên ngân hàng	1	2026-06-24 16:16:33.11	2026-06-24 16:16:33.11
8013	multiple_choice	「医者」 (いしゃ) nghĩa là gì?	["bác sĩ","fictitious companies","các bạn, các anh, các chị, mọi người","anh ～, chị ～"]	bác sĩ	1	2026-06-24 16:16:33.114	2026-06-24 16:16:33.114
8014	multiple_choice	「研究者」 (けんきゅうしゃ) nghĩa là gì?	["trường đại học","vâng","bé (dùng cho nam) hoặc gọi thân mật","nghiên cứu sinh"]	nghiên cứu sinh	1	2026-06-24 16:16:33.118	2026-06-24 16:16:33.118
8015	multiple_choice	「大学」 (だいがく) nghĩa là gì?	["giáo viên (Không nói khi giới thiệu nghề nghiệp của chính mình)","trường đại học","bé (dùng cho nam) hoặc gọi thân mật","nghiên cứu sinh"]	trường đại học	1	2026-06-24 16:16:33.122	2026-06-24 16:16:33.122
8016	fill_in_blank	Điền hiragana cho: "you"	\N	あなた	1	2026-06-24 16:16:33.125	2026-06-24 16:16:33.125
8017	fill_in_blank	Điền hiragana cho: "giáo viên ( dùng để nói đến nghề nghiệp)"	\N	きょうし	1	2026-06-24 16:16:33.129	2026-06-24 16:16:33.129
8018	fill_in_blank	Điền hiragana cho: "how old (おいくつ is the polite equivalent of なんさい)"	\N	なんさい（おいくつ）	1	2026-06-24 16:16:33.132	2026-06-24 16:16:33.132
8019	fill_in_blank	Điền hiragana cho: "trường đại học"	\N	だいがく	1	2026-06-24 16:16:33.137	2026-06-24 16:16:33.137
8020	fill_in_blank	Điền hiragana cho: "Trung Quốc"	\N	ちゅうごく	1	2026-06-24 16:16:33.14	2026-06-24 16:16:33.14
8021	multiple_choice	「これ」 (これ) nghĩa là gì?	["[cassette] tape","thẻ (card) điện thoại","chair","cái này, đây( vật ở gần người nói)"]	cái này, đây( vật ở gần người nói)	2	2026-06-24 16:16:33.405	2026-06-24 16:16:33.405
8022	multiple_choice	「それ」 (それ) nghĩa là gì?	["tiếng Nhật","Oh? What! (used when hearing something unexpected)","[cassette] tape","cái đó, đó( vật ở gần người nghe)"]	cái đó, đó( vật ở gần người nghe)	2	2026-06-24 16:16:33.408	2026-06-24 16:16:33.408
8023	multiple_choice	「あれ」 (あれ) nghĩa là gì?	["Từ nay mong được giúp đỡ","cái kia, kia( vật ở xa cả người nói và người nghe)","cà phê","cái cặp"]	cái kia, kia( vật ở xa cả người nói và người nghe)	2	2026-06-24 16:16:33.412	2026-06-24 16:16:33.412
8024	multiple_choice	「この ～」 (この ～) nghĩa là gì?	["chìa khoá","cái cặp","tiếng Anh","~ này( gần người nói)"]	~ này( gần người nói)	2	2026-06-24 16:16:33.415	2026-06-24 16:16:33.415
8025	multiple_choice	「その ～」 (その ～) nghĩa là gì?	["tiếng ~","tiếng Anh","tạp chí","~ đó( gần người nghe)"]	~ đó( gần người nghe)	2	2026-06-24 16:16:33.421	2026-06-24 16:16:33.421
8026	multiple_choice	「あの ～」 (あの ～) nghĩa là gì?	["cái gì","tiếng Nhật","~ kia( xa cả người nói và người nghe)","TV"]	~ kia( xa cả người nói và người nghe)	2	2026-06-24 16:16:33.424	2026-06-24 16:16:33.424
8027	multiple_choice	「本」 (ほん) nghĩa là gì?	["cà phê","pencil","cái đó, đó( vật ở gần người nghe)","sách"]	sách	2	2026-06-24 16:16:33.428	2026-06-24 16:16:33.428
8028	multiple_choice	「辞書」 (じしょ) nghĩa là gì?	["~ đó( gần người nghe)","tiếng Nhật","từ điển","~ kia( xa cả người nói và người nghe)"]	từ điển	2	2026-06-24 16:16:33.431	2026-06-24 16:16:33.431
8029	multiple_choice	「雑誌」 (ざっし) nghĩa là gì?	["tạp chí","~ này( gần người nói)","[cassette] tape","tập"]	tạp chí	2	2026-06-24 16:16:33.437	2026-06-24 16:16:33.437
8030	multiple_choice	「新聞」 (しんぶん) nghĩa là gì?	["báo","cái này, đây( vật ở gần người nói)","ballpoint pen","cái bàn"]	báo	2	2026-06-24 16:16:33.442	2026-06-24 16:16:33.442
8031	multiple_choice	「ノート」 (ノート) nghĩa là gì?	["~ này( gần người nói)","thế nào","tập","Oh! (used when becoming aware of something)"]	tập	2	2026-06-24 16:16:33.444	2026-06-24 16:16:33.444
8032	multiple_choice	「手帳」 (てちょう) nghĩa là gì?	["thẻ (card)","tiếng Anh","danh thiếp","sổ tay"]	sổ tay	2	2026-06-24 16:16:33.447	2026-06-24 16:16:33.447
8033	multiple_choice	「名刺」 (めいし) nghĩa là gì?	["tập","danh thiếp","cái máy chụp hình","It's nothing./It's a token of my gratitude."]	danh thiếp	2	2026-06-24 16:16:33.449	2026-06-24 16:16:33.449
8034	multiple_choice	「カード」 (カード) nghĩa là gì?	["~ đó( gần người nghe)","danh thiếp","máy vi tính","thẻ (card)"]	thẻ (card)	2	2026-06-24 16:16:33.453	2026-06-24 16:16:33.453
8035	multiple_choice	「鉛筆」 (えんぴつ) nghĩa là gì?	["pencil","CD, compact disc","đồng hồ","Here you are. (used when offering someone something)"]	pencil	2	2026-06-24 16:16:33.455	2026-06-24 16:16:33.455
8036	fill_in_blank	Điền hiragana cho: "máy vi tính"	\N	コンピューター	2	2026-06-24 16:16:33.457	2026-06-24 16:16:33.457
8037	fill_in_blank	Điền hiragana cho: "cái đó, đó( vật ở gần người nghe)"	\N	それ	2	2026-06-24 16:16:33.46	2026-06-24 16:16:33.46
8038	fill_in_blank	Điền hiragana cho: "cà phê"	\N	コーヒー	2	2026-06-24 16:16:33.462	2026-06-24 16:16:33.462
8039	fill_in_blank	Điền hiragana cho: "I see."	\N	そうですか。	2	2026-06-24 16:16:33.464	2026-06-24 16:16:33.464
8040	fill_in_blank	Điền hiragana cho: "cái dù"	\N	かさ	2	2026-06-24 16:16:33.468	2026-06-24 16:16:33.468
8041	multiple_choice	「ここ」 (ここ) nghĩa là gì?	["nhà ăn","chỗ này, đây","rượu vang","fictitious companies"]	chỗ này, đây	3	2026-06-24 16:16:33.696	2026-06-24 16:16:33.696
8042	multiple_choice	「そこ」 (そこ) nghĩa là gì?	["phòng họp","－ yen","chỗ đó, đó","văn phòng"]	chỗ đó, đó	3	2026-06-24 16:16:33.698	2026-06-24 16:16:33.698
8043	multiple_choice	「あそこ」 (あそこ) nghĩa là gì?	["phòng họp","tầng mấy","chỗ kia, kia","bao nhiêu tiền"]	chỗ kia, kia	3	2026-06-24 16:16:33.702	2026-06-24 16:16:33.702
8044	multiple_choice	「どこ」 (どこ) nghĩa là gì?	["chỗ nào, đâu","fictitious companies","Give me [～], please.","nhà ăn"]	chỗ nào, đâu	3	2026-06-24 16:16:33.704	2026-06-24 16:16:33.704
8045	multiple_choice	「こちら」 (こちら) nghĩa là gì?	["country","thang máy","name of a station in Osaka","phía này, đằng này, chỗ này, đây"]	phía này, đằng này, chỗ này, đây	3	2026-06-24 16:16:33.707	2026-06-24 16:16:33.707
8046	multiple_choice	「そちら」 (そちら) nghĩa là gì?	["rượu vang","Give me [～], please.","Thụy Sĩ","phía đó, đằng đó, chỗ đó, đó"]	phía đó, đằng đó, chỗ đó, đó	3	2026-06-24 16:16:33.708	2026-06-24 16:16:33.708
8047	multiple_choice	「あちら」 (あちら) nghĩa là gì?	["Give me [～], please.","well, then, in that case","rượu vang","phía kia, đằng kia, chỗ kia, kia"]	phía kia, đằng kia, chỗ kia, kia	3	2026-06-24 16:16:33.711	2026-06-24 16:16:33.711
8048	multiple_choice	「どちら」 (どちら) nghĩa là gì?	["phía nào, đằng nào, chỗ nào, đâu","chỗ nào, đâu","Bangkok","Thụy Sĩ"]	phía nào, đằng nào, chỗ nào, đâu	3	2026-06-24 16:16:33.713	2026-06-24 16:16:33.713
8049	multiple_choice	「教室」 (きょうしつ) nghĩa là gì?	["name of a station in Osaka","phía nào, đằng nào, chỗ nào, đâu","rượu vang","lớp học, phòng học"]	lớp học, phòng học	3	2026-06-24 16:16:33.714	2026-06-24 16:16:33.714
8050	multiple_choice	「食堂」 (しょくどう) nghĩa là gì?	["-th floor","nhà ăn","fictitious companies","country"]	nhà ăn	3	2026-06-24 16:16:33.718	2026-06-24 16:16:33.718
8051	multiple_choice	「事務所」 (じむしょ) nghĩa là gì?	["cầu thang","văn phòng","thang cuốn","Bangkok"]	văn phòng	3	2026-06-24 16:16:33.72	2026-06-24 16:16:33.72
8052	multiple_choice	「会議室」 (かいぎしつ) nghĩa là gì?	["tầng hầm, dưới mặt đất","phía đó, đằng đó, chỗ đó, đó","phòng họp","căn phòng"]	phòng họp	3	2026-06-24 16:16:33.722	2026-06-24 16:16:33.722
8053	multiple_choice	「受付」 (うけつけ) nghĩa là gì?	["Excuse me.","chỗ kia, kia","phong tiếp tân","mười nghìn, vạn"]	phong tiếp tân	3	2026-06-24 16:16:33.724	2026-06-24 16:16:33.724
8054	multiple_choice	「ロビー」 (ロビー) nghĩa là gì?	["-th floor","phong tiếp tân","hành lang, đại sảnh","chỗ nào, đâu"]	hành lang, đại sảnh	3	2026-06-24 16:16:33.725	2026-06-24 16:16:33.725
8055	multiple_choice	「部屋」 (へや) nghĩa là gì?	["lớp học, phòng học","cà vạt","căn phòng","nhà ăn"]	căn phòng	3	2026-06-24 16:16:33.727	2026-06-24 16:16:33.727
8056	fill_in_blank	Điền hiragana cho: "tầng hầm, dưới mặt đất"	\N	ちか	3	2026-06-24 16:16:33.729	2026-06-24 16:16:33.729
8057	fill_in_blank	Điền hiragana cho: "－ yen"	\N	－えん	3	2026-06-24 16:16:33.732	2026-06-24 16:16:33.732
8058	fill_in_blank	Điền hiragana cho: "chỗ kia, kia"	\N	あそこ	3	2026-06-24 16:16:33.736	2026-06-24 16:16:33.736
8059	fill_in_blank	Điền hiragana cho: "Excuse me."	\N	すみません。	3	2026-06-24 16:16:33.739	2026-06-24 16:16:33.739
8060	fill_in_blank	Điền hiragana cho: "Berlin"	\N	ベルリン	3	2026-06-24 16:16:33.741	2026-06-24 16:16:33.741
8061	multiple_choice	「起きます」 (おきます) nghĩa là gì?	["thức dậy","－ minute","That's tough, isn't it? (used when expressing sympathy)","từ"]	thức dậy	4	2026-06-24 16:16:34.011	2026-06-24 16:16:34.011
8062	multiple_choice	「寝ます」 (ねます) nghĩa là gì?	["ngủ","－ minute","thư viện","Wednesday"]	ngủ	4	2026-06-24 16:16:34.014	2026-06-24 16:16:34.014
8063	multiple_choice	「働きます」 (はたらきます) nghĩa là gì?	["meeting, conference (～を します : hold a meeting)","number","Thursday","làm việc"]	làm việc	4	2026-06-24 16:16:34.018	2026-06-24 16:16:34.018
8064	multiple_choice	「休みます」 (やすみます) nghĩa là gì?	["a fictitious art gallery","nghỉ ngơi","mỗi sáng","well, let me see"]	nghỉ ngơi	4	2026-06-24 16:16:34.022	2026-06-24 16:16:34.022
8065	multiple_choice	「勉強します」 (べんきょうします) nghĩa là gì?	["－ minute","fictitious department store","bây giờ","học tập"]	học tập	4	2026-06-24 16:16:34.025	2026-06-24 16:16:34.025
8066	multiple_choice	「終わります」 (おわります) nghĩa là gì?	["London","ngày hôm kia","kết thúc","meeting, conference (～を します : hold a meeting)"]	kết thúc	4	2026-06-24 16:16:34.029	2026-06-24 16:16:34.029
8067	multiple_choice	「デパート」 (デパート) nghĩa là gì?	["New York","number","cửa hàng bách hóa","Thank you very much."]	cửa hàng bách hóa	4	2026-06-24 16:16:34.034	2026-06-24 16:16:34.034
8068	multiple_choice	「銀行」 (ぎんこう) nghĩa là gì?	["bank","examination, test","fictitious department store","ngày hôm qua"]	bank	4	2026-06-24 16:16:34.04	2026-06-24 16:16:34.04
8069	multiple_choice	「郵便局」 (ゆうびんきょく) nghĩa là gì?	["meeting, conference (～を します : hold a meeting)","a fictitious Japanese restaurant","－ o'clock","bưu điện"]	bưu điện	4	2026-06-24 16:16:34.043	2026-06-24 16:16:34.043
8070	multiple_choice	「図書館」 (としょかん) nghĩa là gì?	["thư viện","fictitious department store","Thank you very much.","sáng"]	thư viện	4	2026-06-24 16:16:34.046	2026-06-24 16:16:34.046
8071	multiple_choice	「美術館」 (びじゅつかん) nghĩa là gì?	["buổi chiều","examination, test","Thank you very much.","viện bảo tàng"]	viện bảo tàng	4	2026-06-24 16:16:34.05	2026-06-24 16:16:34.05
8072	multiple_choice	「今」 (いま) nghĩa là gì?	["buổi sáng","a fictitious art gallery","bây giờ","thư viện"]	bây giờ	4	2026-06-24 16:16:34.054	2026-06-24 16:16:34.054
8073	multiple_choice	「－時」 (－じ) nghĩa là gì?	["mỗi ngày","－ o'clock","buổi chiều","kết thúc"]	－ o'clock	4	2026-06-24 16:16:34.057	2026-06-24 16:16:34.057
8074	multiple_choice	「－分」 (－ふん（－ぷん）) nghĩa là gì?	["Monday","－ minute","phía ông, bà","kết thúc"]	－ minute	4	2026-06-24 16:16:34.06	2026-06-24 16:16:34.06
8075	multiple_choice	「半」 (はん) nghĩa là gì?	["tối nay","mỗi tối","số mấy","phân nửa, một nửa"]	phân nửa, một nửa	4	2026-06-24 16:16:34.063	2026-06-24 16:16:34.063
8076	fill_in_blank	Điền hiragana cho: "Sunday"	\N	にちようび	4	2026-06-24 16:16:34.067	2026-06-24 16:16:34.067
8077	fill_in_blank	Điền hiragana cho: "học tập"	\N	べんきょうします	4	2026-06-24 16:16:34.072	2026-06-24 16:16:34.072
8078	fill_in_blank	Điền hiragana cho: "ngày mốt"	\N	あさって	4	2026-06-24 16:16:34.075	2026-06-24 16:16:34.075
8079	fill_in_blank	Điền hiragana cho: "mỗi ngày"	\N	まいにち	4	2026-06-24 16:16:34.079	2026-06-24 16:16:34.079
8080	fill_in_blank	Điền hiragana cho: "mỗi sáng"	\N	まいあさ	4	2026-06-24 16:16:34.084	2026-06-24 16:16:34.084
8081	multiple_choice	「行ます」 (いきます) nghĩa là gì?	["đi","thuyền, tàu thủy","đến","tàu tốc hành đặc biệt"]	đi	5	2026-06-24 16:16:34.377	2026-06-24 16:16:34.377
8082	multiple_choice	「来ます」 (きます) nghĩa là gì?	["what year","tuần này","eighth, eight days","đến"]	đến	5	2026-06-24 16:16:34.38	2026-06-24 16:16:34.38
8083	multiple_choice	「帰ります」 (かえります) nghĩa là gì?	["tàu tốc hành","năm nay","taxi","về"]	về	5	2026-06-24 16:16:34.383	2026-06-24 16:16:34.383
8084	multiple_choice	「学校」 (がっこう) nghĩa là gì?	["trường học","ga, nhà ga","xe Buýt","what year"]	trường học	5	2026-06-24 16:16:34.387	2026-06-24 16:16:34.387
8085	multiple_choice	「スーパー」 (スーパー) nghĩa là gì?	["người","thuyền, tàu thủy","tàu thường (dừng cả ở các ga lẻ)","siêu thị"]	siêu thị	5	2026-06-24 16:16:34.39	2026-06-24 16:16:34.39
8086	multiple_choice	「駅」 (えき) nghĩa là gì?	["máy bay","chị ấy, bạn gái","-th month of the year","ga, nhà ga"]	ga, nhà ga	5	2026-06-24 16:16:34.393	2026-06-24 16:16:34.393
8087	multiple_choice	「飛行機」 (ひこうき) nghĩa là gì?	["tàu Shinkansen (tàu điện siêu tốc của Nhật)","năm ngoái","tháng sau","máy bay"]	máy bay	5	2026-06-24 16:16:34.396	2026-06-24 16:16:34.396
8088	multiple_choice	「船」 (ふね) nghĩa là gì?	["tàu tốc hành đặc biệt","thuyền, tàu thủy","chị ấy, bạn gái","máy bay"]	thuyền, tàu thủy	5	2026-06-24 16:16:34.4	2026-06-24 16:16:34.4
8089	multiple_choice	「電車」 (でんしゃ) nghĩa là gì?	["tàu tốc hành đặc biệt","platform －, -th platform","tàu điện","tháng mấy"]	tàu điện	5	2026-06-24 16:16:34.404	2026-06-24 16:16:34.404
8090	multiple_choice	「地下鉄」 (ちかてつ) nghĩa là gì?	["Thank you very much.","năm ngoái","tàu điện ngầm","tuần trước"]	tàu điện ngầm	5	2026-06-24 16:16:34.407	2026-06-24 16:16:34.407
8091	multiple_choice	「新幹線」 (しんかんせん) nghĩa là gì?	["tàu Shinkansen (tàu điện siêu tốc của Nhật)","siêu thị","một mình","ngày mấy, ngày bao nhiêu, bao nhiêu ngày"]	tàu Shinkansen (tàu điện siêu tốc của Nhật)	5	2026-06-24 16:16:34.41	2026-06-24 16:16:34.41
8092	multiple_choice	「バス」 (バス) nghĩa là gì?	["xe Buýt","tháng mấy","tàu thường (dừng cả ở các ga lẻ)","bao giờ, khi nào"]	xe Buýt	5	2026-06-24 16:16:34.413	2026-06-24 16:16:34.413
8093	multiple_choice	「タクシー」 (タクシー) nghĩa là gì?	["tuần sau","taxi","tàu thường (dừng cả ở các ga lẻ)","Yes, it is."]	taxi	5	2026-06-24 16:16:34.417	2026-06-24 16:16:34.417
8094	multiple_choice	「自転車」 (じてんしゃ) nghĩa là gì?	["một mình","-th year","xe đạp","xe Buýt"]	xe đạp	5	2026-06-24 16:16:34.421	2026-06-24 16:16:34.421
8095	multiple_choice	「歩いて」 (あるいて) nghĩa là gì?	["ngày thứ 2 của tháng","đi bộ, đi dạo","xe đạp","tháng mấy"]	đi bộ, đi dạo	5	2026-06-24 16:16:34.425	2026-06-24 16:16:34.425
8096	fill_in_blank	Điền hiragana cho: "gia đình"	\N	かぞく	5	2026-06-24 16:16:34.428	2026-06-24 16:16:34.428
8097	fill_in_blank	Điền hiragana cho: "đi"	\N	いきます	5	2026-06-24 16:16:34.433	2026-06-24 16:16:34.433
8098	fill_in_blank	Điền hiragana cho: "tàu tốc hành"	\N	きゅうこう	5	2026-06-24 16:16:34.438	2026-06-24 16:16:34.438
8099	fill_in_blank	Điền hiragana cho: "ninth, nine days"	\N	ここのか	5	2026-06-24 16:16:34.442	2026-06-24 16:16:34.442
8100	fill_in_blank	Điền hiragana cho: "name of a town in Kyushu"	\N	はかた	5	2026-06-24 16:16:34.446	2026-06-24 16:16:34.446
8101	multiple_choice	「食べます」 (たべます) nghĩa là gì?	["thỉnh thoảng","vườn","ăn","tobacco, cigarette"]	ăn	6	2026-06-24 16:16:34.671	2026-06-24 16:16:34.671
8102	multiple_choice	「飲みます」 (のみます) nghĩa là gì?	["uống","video, băng video","quần vợt (～をします: đánh quần vợt)","trà (nói chung)"]	uống	6	2026-06-24 16:16:34.672	2026-06-24 16:16:34.672
8103	multiple_choice	「吸います［たばこを～］」 (すいます［たばこを～］) nghĩa là gì?	["smoke [a cigarette]","meet [a friend]","cherry-blossom viewing (～を します : view the cherry blossoms)","Mexico"]	smoke [a cigarette]	6	2026-06-24 16:16:34.674	2026-06-24 16:16:34.674
8104	multiple_choice	「見ます」 (みます) nghĩa là gì?	["nhà hàng","nước hoa quả","xem, nhìn, trông","video, băng video"]	xem, nhìn, trông	6	2026-06-24 16:16:34.675	2026-06-24 16:16:34.675
8105	multiple_choice	「聞きます」 (ききます) nghĩa là gì?	["đá bóng","nghe","CD, compact disc","smoke [a cigarette]"]	nghe	6	2026-06-24 16:16:34.677	2026-06-24 16:16:34.677
8106	multiple_choice	「読みます」 (よみます) nghĩa là gì?	["Yes? (lit: What is it?)","đọc","cơm sáng","thỉnh thoảng"]	đọc	6	2026-06-24 16:16:34.679	2026-06-24 16:16:34.679
8107	multiple_choice	「書きます」 (かきます) nghĩa là gì?	["viết, vẽ","báo cáo","bia","bài tập về nhà"]	viết, vẽ	6	2026-06-24 16:16:34.681	2026-06-24 16:16:34.681
8108	multiple_choice	「買います」 (かいます) nghĩa là gì?	["CD, compact disc","mua","smoke [a cigarette]","cơm trưa"]	mua	6	2026-06-24 16:16:34.684	2026-06-24 16:16:34.684
8109	multiple_choice	「撮ります［写真を～］」 (とります［しゃしんを～］) nghĩa là gì?	["nghe","uống","nước hoa quả","take [a photograph]"]	take [a photograph]	6	2026-06-24 16:16:34.686	2026-06-24 16:16:34.686
8110	multiple_choice	「します」 (します) nghĩa là gì?	["phim, điện ảnh","trà đen","làm","That's good."]	làm	6	2026-06-24 16:16:34.688	2026-06-24 16:16:34.688
8111	multiple_choice	「会います［友達に～］」 (あいます［ともだちに～］) nghĩa là gì?	["a fictitious supermarket","cùng, cùng nhau","cơm sáng","meet [a friend]"]	meet [a friend]	6	2026-06-24 16:16:34.689	2026-06-24 16:16:34.689
8112	multiple_choice	「ごはん」 (ごはん) nghĩa là gì?	["a fictitious restaurant","take [a photograph]","mua","cơm, bữa ăn"]	cơm, bữa ăn	6	2026-06-24 16:16:34.691	2026-06-24 16:16:34.691
8113	multiple_choice	「朝ごはん」 (あさごはん) nghĩa là gì?	["trứng","cơm sáng","cơm trưa","mua"]	cơm sáng	6	2026-06-24 16:16:34.693	2026-06-24 16:16:34.693
8114	multiple_choice	「昼ごはん」 (ひるごはん) nghĩa là gì?	["ăn","uống","cơm trưa","cơm tối"]	cơm trưa	6	2026-06-24 16:16:34.695	2026-06-24 16:16:34.695
8115	multiple_choice	「晩ごはん」 (ばんごはん) nghĩa là gì?	["cơm tối","nước","thịt","vườn"]	cơm tối	6	2026-06-24 16:16:34.696	2026-06-24 16:16:34.696
8116	fill_in_blank	Điền hiragana cho: "nghe"	\N	ききます	6	2026-06-24 16:16:34.699	2026-06-24 16:16:34.699
8117	fill_in_blank	Điền hiragana cho: "thỉnh thoảng"	\N	ときどき	6	2026-06-24 16:16:34.702	2026-06-24 16:16:34.702
8118	fill_in_blank	Điền hiragana cho: "Tôi hiểu rồi/ vâng ạ."	\N	わかりました。	6	2026-06-24 16:16:34.704	2026-06-24 16:16:34.704
8119	fill_in_blank	Điền hiragana cho: "a fictitious department store"	\N	おおさかデパート	6	2026-06-24 16:16:34.705	2026-06-24 16:16:34.705
8120	fill_in_blank	Điền hiragana cho: "trà (nói chung)"	\N	おちゃ	6	2026-06-24 16:16:34.707	2026-06-24 16:16:34.707
8121	multiple_choice	「切ります」 (きります) nghĩa là gì?	["cắt","Spain","băng keo","rubber, eraser"]	cắt	7	2026-06-24 16:16:34.85	2026-06-24 16:16:34.85
8122	multiple_choice	「送ります」 (おくります) nghĩa là gì?	["gửi","tay","May I? (lit. I commit an incivility.)","du lịch"]	gửi	7	2026-06-24 16:16:34.852	2026-06-24 16:16:34.852
8123	multiple_choice	「あげます」 (あげます) nghĩa là gì?	["fax","e-mail","áo sơ mi","tặng, cho"]	tặng, cho	7	2026-06-24 16:16:34.854	2026-06-24 16:16:34.854
8124	multiple_choice	「もらいます」 (もらいます) nghĩa là gì?	["mẹ của người khác","mượn, vay","giấy","nhận"]	nhận	7	2026-06-24 16:16:34.856	2026-06-24 16:16:34.856
8125	multiple_choice	「貨します」 (かします) nghĩa là gì?	["gửi","cho mượn, cho vay","mẹ của người khác","mẹ tôi"]	cho mượn, cho vay	7	2026-06-24 16:16:34.857	2026-06-24 16:16:34.857
8126	multiple_choice	「借ります」 (かります) nghĩa là gì?	["New Year's greeting card","giấy","cho mượn, cho vay","mượn, vay"]	mượn, vay	7	2026-06-24 16:16:34.859	2026-06-24 16:16:34.859
8127	multiple_choice	「教えます」 (おしえます) nghĩa là gì?	["nhận","mẹ của người khác","dạy","du lịch"]	dạy	7	2026-06-24 16:16:34.86	2026-06-24 16:16:34.86
8128	multiple_choice	「習います」 (ならいます) nghĩa là gì?	["băng keo","cái dập ghim","học, học tập","e-mail"]	học, học tập	7	2026-06-24 16:16:34.862	2026-06-24 16:16:34.862
8129	multiple_choice	「かけます［電話を～］」 (かけます［でんわを～］) nghĩa là gì?	["gửi","băng keo","make [a telephone call]","mobile phone, cell phone"]	make [a telephone call]	7	2026-06-24 16:16:34.864	2026-06-24 16:16:34.864
8130	multiple_choice	「手」 (て) nghĩa là gì?	["băng keo","What a nice [～]!","tay","cha tôi, bố"]	tay	7	2026-06-24 16:16:34.868	2026-06-24 16:16:34.868
8131	multiple_choice	「はし」 (はし) nghĩa là gì?	["mobile phone, cell phone","đũa","quà lưu niệm","kéo"]	đũa	7	2026-06-24 16:16:34.869	2026-06-24 16:16:34.869
8132	multiple_choice	「スプーン」 (スプーン) nghĩa là gì?	["May I? (lit. I commit an incivility.)","đã, rồi","Won't you have [～]?/Would you like to have [～]? (used when offering something)","muỗng, thìa"]	muỗng, thìa	7	2026-06-24 16:16:34.871	2026-06-24 16:16:34.871
8133	multiple_choice	「ナイフ」 (ナイフ) nghĩa là gì?	["dao","That was delicious. (said after eating or drinking)","mẹ của người khác","Won't you have [～]?/Would you like to have [～]? (used when offering something)"]	dao	7	2026-06-24 16:16:34.873	2026-06-24 16:16:34.873
8134	multiple_choice	「フォーク」 (フォーク) nghĩa là gì?	["quà tặng","kéo","nĩa","lễ Noel"]	nĩa	7	2026-06-24 16:16:34.874	2026-06-24 16:16:34.874
8135	multiple_choice	「はさみ」 (はさみ) nghĩa là gì?	["kéo","gửi","đã, rồi","bố của người khác"]	kéo	7	2026-06-24 16:16:34.875	2026-06-24 16:16:34.875
8136	fill_in_blank	Điền hiragana cho: "áo sơ mi"	\N	シャツ	7	2026-06-24 16:16:34.877	2026-06-24 16:16:34.877
8137	fill_in_blank	Điền hiragana cho: "Châu Âu"	\N	ヨーロッパ	7	2026-06-24 16:16:34.879	2026-06-24 16:16:34.879
8138	fill_in_blank	Điền hiragana cho: "quà lưu niệm"	\N	おみやげ	7	2026-06-24 16:16:34.881	2026-06-24 16:16:34.881
8139	fill_in_blank	Điền hiragana cho: "từ bây giờ"	\N	これから	7	2026-06-24 16:16:34.884	2026-06-24 16:16:34.884
8140	fill_in_blank	Điền hiragana cho: "máy đánh chữ"	\N	ワープロ	7	2026-06-24 16:16:34.886	2026-06-24 16:16:34.886
8141	multiple_choice	「ハンサム［な］」 (ハンサム［な］) nghĩa là gì?	["It's time I was going.","cũ","handsome","trắng"]	handsome	8	2026-06-24 16:16:35.135	2026-06-24 16:16:35.135
8142	multiple_choice	「きれい［な］」 (きれい［な］) nghĩa là gì?	["famous","ký túc xá","rất nhiều","beautiful, clean"]	beautiful, clean	8	2026-06-24 16:16:35.139	2026-06-24 16:16:35.139
8143	multiple_choice	「静か［な］」 (しずか［な］) nghĩa là gì?	["car, vehicle","quiet","lively","đắt, cao"]	quiet	8	2026-06-24 16:16:35.142	2026-06-24 16:16:35.142
8144	multiple_choice	「にぎやか［な］」 (にぎやか［な］) nghĩa là gì?	["nhỏ, bé","Have you got used to the life in Japan?","Not at all.","lively"]	lively	8	2026-06-24 16:16:35.144	2026-06-24 16:16:35.144
8145	multiple_choice	「有名［な］」 (ゆうめい［な］) nghĩa là gì?	["famous","Nara Park","to lớn","cái nào"]	famous	8	2026-06-24 16:16:35.146	2026-06-24 16:16:35.146
8146	multiple_choice	「親切［な］」 (しんせつ［な］) nghĩa là gì?	["rẻ","～nào","cuộc sống","helpful, kind, considerate (not used about one's own family members)"]	helpful, kind, considerate (not used about one's own family members)	8	2026-06-24 16:16:35.15	2026-06-24 16:16:35.15
8147	multiple_choice	「元気［な］」 (げんき［な］) nghĩa là gì?	["healthy, energetic, cheerful","(trời) lạnh","convenient","lively"]	healthy, energetic, cheerful	8	2026-06-24 16:16:35.153	2026-06-24 16:16:35.153
8148	multiple_choice	「暇［な］」 (ひま［な］) nghĩa là gì?	["Have you got used to the life in Japan?","Hồ Biwaco","fine, nice, wonderful","free (time)"]	free (time)	8	2026-06-24 16:16:35.156	2026-06-24 16:16:35.156
8149	multiple_choice	「便利［な］」 (べんり［な］) nghĩa là gì?	["Nara Park","ngon","thú vị, hay","convenient"]	convenient	8	2026-06-24 16:16:35.158	2026-06-24 16:16:35.158
8150	multiple_choice	「すてき［な］」 (すてき［な］) nghĩa là gì?	["fine, nice, wonderful","lạnh, buốt (dùng cho cảm giác)","Won't you have another cup of [～]?","hoa anh đào"]	fine, nice, wonderful	8	2026-06-24 16:16:35.161	2026-06-24 16:16:35.161
8151	multiple_choice	「大きい」 (おおきい) nghĩa là gì?	["to lớn","ký túc xá","thú vị, hay","Have you got used to the life in Japan?"]	to lớn	8	2026-06-24 16:16:35.165	2026-06-24 16:16:35.165
8152	multiple_choice	「小さい」 (ちいさい) nghĩa là gì?	["lively","～, but ～","to lớn","nhỏ, bé"]	nhỏ, bé	8	2026-06-24 16:16:35.17	2026-06-24 16:16:35.17
8153	multiple_choice	「新しい」 (あたらしい) nghĩa là gì?	["Not at all.","mới","khó (bài tập khó)","convenient"]	mới	8	2026-06-24 16:16:35.175	2026-06-24 16:16:35.175
8154	multiple_choice	「古い」 (ふるい) nghĩa là gì?	["trắng","cuộc sống","free (time)","cũ"]	cũ	8	2026-06-24 16:16:35.18	2026-06-24 16:16:35.18
8155	multiple_choice	「いい（よい）」 (いい（よい）) nghĩa là gì?	["work, business (～を します : do one's job, work)","nóng","đen","good"]	good	8	2026-06-24 16:16:35.186	2026-06-24 16:16:35.186
8156	fill_in_blank	Điền hiragana cho: "famous"	\N	ゆうめい［な］	8	2026-06-24 16:16:35.189	2026-06-24 16:16:35.189
8157	fill_in_blank	Điền hiragana cho: "lively"	\N	にぎやか［な］	8	2026-06-24 16:16:35.194	2026-06-24 16:16:35.194
8158	fill_in_blank	Điền hiragana cho: "vui vẻ"	\N	たのしい	8	2026-06-24 16:16:35.201	2026-06-24 16:16:35.201
8159	fill_in_blank	Điền hiragana cho: "cuộc sống"	\N	せいかつ	8	2026-06-24 16:16:35.207	2026-06-24 16:16:35.207
8160	fill_in_blank	Điền hiragana cho: "rẻ"	\N	やすい	8	2026-06-24 16:16:35.209	2026-06-24 16:16:35.209
8161	multiple_choice	「わかります」 (わかります) nghĩa là gì?	["Không được à?","(my) wife","hiểu, nắm được","chữ hán"]	hiểu, nắm được	9	2026-06-24 16:16:35.411	2026-06-24 16:16:35.411
8162	multiple_choice	「あります」 (あります) nghĩa là gì?	["vợ (dùng khi nói về vợ người khác)","Chữ Katakana","có (sở hữu)","âm nhạc"]	có (sở hữu)	9	2026-06-24 16:16:35.413	2026-06-24 16:16:35.413
8163	multiple_choice	「好き［な］」 (すき［な］) nghĩa là gì?	["Please lend (it to me)","like","đồ uống","I'm sorry [, but], unfortunately"]	like	9	2026-06-24 16:16:35.415	2026-06-24 16:16:35.415
8164	multiple_choice	「嫌い［な］」 (きらい［な］) nghĩa là gì?	["thể thao (～をします：chơi thể thao)","dislike","vé (xem hòa nhạc, xem phim)","có (sở hữu)"]	dislike	9	2026-06-24 16:16:35.417	2026-06-24 16:16:35.417
8165	multiple_choice	「上手［な］」 (じょうず［な］) nghĩa là gì?	["thời gian","good at","đồ uống","(my) husband"]	good at	9	2026-06-24 16:16:35.419	2026-06-24 16:16:35.419
8166	multiple_choice	「下手［な］」 (へた［な］) nghĩa là gì?	["đại khái, đại thể","hoàn toàn ~ không","poor at","dislike"]	poor at	9	2026-06-24 16:16:35.42	2026-06-24 16:16:35.42
8167	multiple_choice	「飲み物」 (のみもの) nghĩa là gì?	["Won't you join me (us)?","đồ uống","like","Please lend (it to me)"]	đồ uống	9	2026-06-24 16:16:35.421	2026-06-24 16:16:35.421
8168	multiple_choice	「料理」 (りょうり) nghĩa là gì?	["alo (gọi điện thoại)","bài hát","việc bận, công chuyện","món ăn, việc nấu ăn"]	món ăn, việc nấu ăn	9	2026-06-24 16:16:35.423	2026-06-24 16:16:35.423
8169	multiple_choice	「スポーツ」 (スポーツ) nghĩa là gì?	["hiểu, nắm được","side job (～を します : work part-time)","thể thao (～をします：chơi thể thao)","vì ~, do"]	thể thao (～をします：chơi thể thao)	9	2026-06-24 16:16:35.424	2026-06-24 16:16:35.424
8170	multiple_choice	「野球」 (やきゅう) nghĩa là gì?	["Chữ Katakana","vì ~, do","con cái","bóng chày (～をします：chơi bóng chày)"]	bóng chày (～をします：chơi bóng chày)	9	2026-06-24 16:16:35.426	2026-06-24 16:16:35.426
8171	multiple_choice	「ダンス」 (ダンス) nghĩa là gì?	["thời gian","like","nhảy, khiêu vũ (～をします：nhảy, khiêu vũ)","(my) wife"]	nhảy, khiêu vũ (～をします：nhảy, khiêu vũ)	9	2026-06-24 16:16:35.428	2026-06-24 16:16:35.428
8172	multiple_choice	「旅行」 (りょこう) nghĩa là gì?	["like","Chữ Katakana","trip, tour (～［を］します : travel, make a trip)","dislike"]	trip, tour (～［を］します : travel, make a trip)	9	2026-06-24 16:16:35.429	2026-06-24 16:16:35.429
8173	multiple_choice	「音楽」 (おんがく) nghĩa là gì?	["âm nhạc","(my) husband","sớm, nhanh","good at"]	âm nhạc	9	2026-06-24 16:16:35.433	2026-06-24 16:16:35.433
8174	multiple_choice	「歌」 (うた) nghĩa là gì?	["nhạc cổ điển","side job (～を します : work part-time)","bài hát","Won't you join me (us)?"]	bài hát	9	2026-06-24 16:16:35.435	2026-06-24 16:16:35.435
8175	multiple_choice	「クラシック」 (クラシック) nghĩa là gì?	["nhạc cổ điển","thể thao (～をします：chơi thể thao)","Sure./Certainly.","việc bận, công chuyện"]	nhạc cổ điển	9	2026-06-24 16:16:35.437	2026-06-24 16:16:35.437
8176	fill_in_blank	Điền hiragana cho: "kịch Kabuki (một loại ca kịch truyền thống của Nhật)"	\N	かぶき	9	2026-06-24 16:16:35.439	2026-06-24 16:16:35.439
8177	fill_in_blank	Điền hiragana cho: "vợ (dùng khi nói về vợ người khác)"	\N	おくさん	9	2026-06-24 16:16:35.441	2026-06-24 16:16:35.441
8178	fill_in_blank	Điền hiragana cho: "Chữ Katakana"	\N	かたかな	9	2026-06-24 16:16:35.443	2026-06-24 16:16:35.443
8179	fill_in_blank	Điền hiragana cho: "cuộc hẹn, lời hứa"	\N	やくそく	9	2026-06-24 16:16:35.446	2026-06-24 16:16:35.446
8180	fill_in_blank	Điền hiragana cho: "(my) wife"	\N	つま／かない	9	2026-06-24 16:16:35.45	2026-06-24 16:16:35.45
8181	multiple_choice	「あります」 (あります) nghĩa là gì?	["～, ～, and so on","~ nhất (いちばん うえ：vị trí cao nhất)","có ( tồn tại, dùng cho đồ vật)","phim"]	có ( tồn tại, dùng cho đồ vật)	10	2026-06-24 16:16:35.66	2026-06-24 16:16:35.66
8182	multiple_choice	「います」 (います) nghĩa là gì?	["có, ở (tồn tại, dùng cho người và động vật)","sau","công tắc","giường"]	có, ở (tồn tại, dùng cho người và động vật)	10	2026-06-24 16:16:35.661	2026-06-24 16:16:35.661
8183	multiple_choice	「いろいろ［な］」 (いろいろ［な］) nghĩa là gì?	["various","có ( tồn tại, dùng cho đồ vật)","có, ở (tồn tại, dùng cho người và động vật)","cửa"]	various	10	2026-06-24 16:16:35.663	2026-06-24 16:16:35.663
8184	multiple_choice	「男の 人」 (おとこの ひと) nghĩa là gì?	["panda","người đàn ông","công tắc","có ( tồn tại, dùng cho đồ vật)"]	người đàn ông	10	2026-06-24 16:16:35.666	2026-06-24 16:16:35.666
8185	multiple_choice	「女の 人」 (おんなの ひと) nghĩa là gì?	["cửa","giá sách","con mèo","người đàn bà"]	người đàn bà	10	2026-06-24 16:16:35.668	2026-06-24 16:16:35.668
8186	multiple_choice	「男の 子」 (おとこの こ) nghĩa là gì?	["tương ớt (chili sauce)","cậu con trai","toà nhà","convenience store"]	cậu con trai	10	2026-06-24 16:16:35.669	2026-06-24 16:16:35.669
8187	multiple_choice	「女の 子」 (おんなの こ) nghĩa là gì?	["a fictitious supermarket","con chó","elephant","cô con gái"]	cô con gái	10	2026-06-24 16:16:35.671	2026-06-24 16:16:35.671
8188	multiple_choice	「犬」 (いぬ) nghĩa là gì?	["Tokyo Disneyland","vật, đồ vật","con chó","có ( tồn tại, dùng cho đồ vật)"]	con chó	10	2026-06-24 16:16:35.672	2026-06-24 16:16:35.672
8189	multiple_choice	「猫」 (ねこ) nghĩa là gì?	["hộp thư","con mèo","sau","bến xe, điểm lên xuống xe"]	con mèo	10	2026-06-24 16:16:35.674	2026-06-24 16:16:35.674
8190	multiple_choice	「パンダ」 (パンダ) nghĩa là gì?	["the back","panda","người đàn ông","phim"]	panda	10	2026-06-24 16:16:35.675	2026-06-24 16:16:35.675
8191	multiple_choice	「象」 (ぞう) nghĩa là gì?	["phim","elephant","người đàn ông","vật, đồ vật"]	elephant	10	2026-06-24 16:16:35.676	2026-06-24 16:16:35.676
8192	multiple_choice	「木」 (き) nghĩa là gì?	["cây, gỗ","elephant","con chó","cửa"]	cây, gỗ	10	2026-06-24 16:16:35.677	2026-06-24 16:16:35.677
8193	multiple_choice	「物」 (もの) nghĩa là gì?	["vật, đồ vật","trong, giữa","tỉnh","cục Pin"]	vật, đồ vật	10	2026-06-24 16:16:35.679	2026-06-24 16:16:35.679
8194	multiple_choice	「電池」 (でんち) nghĩa là gì?	["~ nhất (いちばん うえ：vị trí cao nhất)","cục Pin","phim","cửa"]	cục Pin	10	2026-06-24 16:16:35.68	2026-06-24 16:16:35.68
8195	multiple_choice	「箱」 (はこ) nghĩa là gì?	["hiệu sách","tỉnh","người đàn ông","cái hộp"]	cái hộp	10	2026-06-24 16:16:35.682	2026-06-24 16:16:35.682
8196	fill_in_blank	Điền hiragana cho: "trên"	\N	うえ	10	2026-06-24 16:16:35.684	2026-06-24 16:16:35.684
8197	fill_in_blank	Điền hiragana cho: "bên cạnh"	\N	となり	10	2026-06-24 16:16:35.686	2026-06-24 16:16:35.686
8198	fill_in_blank	Điền hiragana cho: "giá sách"	\N	たな	10	2026-06-24 16:16:35.687	2026-06-24 16:16:35.687
8199	fill_in_blank	Điền hiragana cho: "cục Pin"	\N	でんち	10	2026-06-24 16:16:35.688	2026-06-24 16:16:35.688
8200	fill_in_blank	Điền hiragana cho: "gần, chỗ gần đây"	\N	ちかく	10	2026-06-24 16:16:35.69	2026-06-24 16:16:35.69
8201	multiple_choice	「います［子どもが～］」 (います［こどもが～］) nghĩa là gì?	["kem","Welcome./May I help you? (a greeting to a customer or a guest entering a shop, etc.)","have [a child]","chuyển phát nhanh"]	have [a child]	11	2026-06-24 16:16:35.862	2026-06-24 16:16:35.862
8202	multiple_choice	「います［日本に～］」 (います［にほんに～］) nghĩa là gì?	["gửi bằng đường tàu","stay, be [in Japan]","khoảng～","mất, tốn (thời gian, tiền bạc)"]	stay, be [in Japan]	11	2026-06-24 16:16:35.866	2026-06-24 16:16:35.866
8203	multiple_choice	「かかります」 (かかります) nghĩa là gì?	["－ hour(s)","bố mẹ","mất, tốn (thời gian, tiền bạc)","em gái (bạn）"]	mất, tốn (thời gian, tiền bạc)	11	2026-06-24 16:16:35.869	2026-06-24 16:16:35.869
8204	multiple_choice	「休みます［会社を～］」 (やすみます［かいしゃを～］) nghĩa là gì?	["－ week(s)","Are you going out?","class","take a day off [work]"]	take a day off [work]	11	2026-06-24 16:16:35.87	2026-06-24 16:16:35.87
8205	multiple_choice	「１つ」 (ひとつ) nghĩa là gì?	["1 cái (đồ vật)","－ year(s)","phong bì","So long. (lit. I'm going and coming back)"]	1 cái (đồ vật)	11	2026-06-24 16:16:35.872	2026-06-24 16:16:35.872
8206	multiple_choice	「２つ」 (ふたつ) nghĩa là gì?	["2 cái","－ hour(s)","10 cái","chị gái (bạn)"]	2 cái	11	2026-06-24 16:16:35.873	2026-06-24 16:16:35.873
8207	multiple_choice	「３つ」 (みっつ) nghĩa là gì?	["Nice weather, isn't it?","nước Úc","3 cái","So long. (lit. I'm going and coming back)"]	3 cái	11	2026-06-24 16:16:35.875	2026-06-24 16:16:35.875
8208	multiple_choice	「４つ」 (よっつ) nghĩa là gì?	["4 cái","have [a child]","5 cái","Please. (lit. ask for a favour)"]	4 cái	11	2026-06-24 16:16:35.876	2026-06-24 16:16:35.876
8209	multiple_choice	「５つ」 (いつつ) nghĩa là gì?	["5 cái","bao lâu","So long. (lit. I'm going and coming back)","2 người"]	5 cái	11	2026-06-24 16:16:35.877	2026-06-24 16:16:35.877
8210	multiple_choice	「６つ」 (むっつ) nghĩa là gì?	["So long. (lit. I'm going and coming back)","6 cái","em gái (tôi)","－ hour(s)"]	6 cái	11	2026-06-24 16:16:35.879	2026-06-24 16:16:35.879
8211	multiple_choice	「７つ」 (ななつ) nghĩa là gì?	["7 cái","Please. (lit. ask for a favour)","9 cái","2 cái"]	7 cái	11	2026-06-24 16:16:35.88	2026-06-24 16:16:35.88
8212	multiple_choice	「８つ」 (やっつ) nghĩa là gì?	["nước Úc","－ people","phong bì","8 cái"]	8 cái	11	2026-06-24 16:16:35.882	2026-06-24 16:16:35.882
8213	multiple_choice	「９つ」 (ここのつ) nghĩa là gì?	["(counter for machines, cars, etc.)","－ times","9 cái","gửi bảo đảm"]	9 cái	11	2026-06-24 16:16:35.884	2026-06-24 16:16:35.884
8214	multiple_choice	「１０」 (とお) nghĩa là gì?	["10 cái","6 cái","bánh sandwich","－ times"]	10 cái	11	2026-06-24 16:16:35.886	2026-06-24 16:16:35.886
8215	multiple_choice	「いくつ」 (いくつ) nghĩa là gì?	["1 người","bao nhiêu cái","em gái (tôi)","nước Úc"]	bao nhiêu cái	11	2026-06-24 16:16:35.887	2026-06-24 16:16:35.887
8216	fill_in_blank	Điền hiragana cho: "10 cái"	\N	とお	11	2026-06-24 16:16:35.889	2026-06-24 16:16:35.889
8217	fill_in_blank	Điền hiragana cho: "foreign student"	\N	りゅうがくせい	11	2026-06-24 16:16:35.89	2026-06-24 16:16:35.89
8218	fill_in_blank	Điền hiragana cho: "bưu thiếp"	\N	はがき	11	2026-06-24 16:16:35.892	2026-06-24 16:16:35.892
8219	fill_in_blank	Điền hiragana cho: "chị gái (bạn)"	\N	おねえさん	11	2026-06-24 16:16:35.893	2026-06-24 16:16:35.893
8220	fill_in_blank	Điền hiragana cho: "nước Úc"	\N	オーストラリア	11	2026-06-24 16:16:35.895	2026-06-24 16:16:35.895
8221	multiple_choice	「簡単［な］」 (かんたん［な］) nghĩa là gì?	["thời tiết","Tempura (món hải sản và rau chiên tẩm bột","easy, simple","ngạc nhiên/ hay quá nhỉ."]	easy, simple	12	2026-06-24 16:16:36.102	2026-06-24 16:16:36.102
8222	multiple_choice	「近い」 (ちかい) nghĩa là gì?	["gần","few [people], a little","cái nào","the most"]	gần	12	2026-06-24 16:16:36.103	2026-06-24 16:16:36.103
8223	multiple_choice	「遠い」 (とおい) nghĩa là gì?	["mùa hạ","chicken","mát","xa"]	xa	12	2026-06-24 16:16:36.105	2026-06-24 16:16:36.105
8224	multiple_choice	「速い、早い」 (はやい) nghĩa là gì?	["Wow! Look at all those people!","chicken","nhanh, sớm","I'm tired"]	nhanh, sớm	12	2026-06-24 16:16:36.106	2026-06-24 16:16:36.106
8225	multiple_choice	「遅い」 (おそい) nghĩa là gì?	["tuyết","few [people], a little","mùa đông","chậm, muộn"]	chậm, muộn	12	2026-06-24 16:16:36.108	2026-06-24 16:16:36.108
8226	multiple_choice	「多い［人が～］」 (おおい［ひとが～］) nghĩa là gì?	["khách sạn","Wow! Look at all those people!","pork","many [people], much"]	many [people], much	12	2026-06-24 16:16:36.109	2026-06-24 16:16:36.109
8227	multiple_choice	「少ない［人が～］」 (すくない［ひとが～］) nghĩa là gì?	["few [people], a little","cả hai","I'm home.","lemon"]	few [people], a little	12	2026-06-24 16:16:36.111	2026-06-24 16:16:36.111
8228	multiple_choice	「暖かい、温かい」 (あたたかい) nghĩa là gì?	["(hơn) hẳn (dùng để nhấn mạnh sự khác biệt giữa hai đối tượng)","cay","ấm","Sukiyaki (món thịt bò nấu rau)"]	ấm	12	2026-06-24 16:16:36.112	2026-06-24 16:16:36.112
8229	multiple_choice	「涼しい」 (すずしい) nghĩa là gì?	["mát","Sukiyaki (món thịt bò nấu rau)","easy, simple","mùa"]	mát	12	2026-06-24 16:16:36.114	2026-06-24 16:16:36.114
8230	multiple_choice	「甘い」 (あまい) nghĩa là gì?	["ngọt","khách sạn","Sashimi (món gỏi cá sống)","(hơn) hẳn (dùng để nhấn mạnh sự khác biệt giữa hai đối tượng)"]	ngọt	12	2026-06-24 16:16:36.117	2026-06-24 16:16:36.117
8231	multiple_choice	「辛い」 (からい) nghĩa là gì?	["Wow! Look at all those people!","nặng","cay","kỳ thi, bài thi"]	cay	12	2026-06-24 16:16:36.119	2026-06-24 16:16:36.119
8232	multiple_choice	「重い」 (おもい) nghĩa là gì?	["Wow! Look at all those people!","beef","the Gion Festival (the most famous festival in Kyoto)","nặng"]	nặng	12	2026-06-24 16:16:36.12	2026-06-24 16:16:36.12
8233	multiple_choice	「軽い」 (かるい) nghĩa là gì?	["Nhưng","(hơn) hẳn (dùng để nhấn mạnh sự khác biệt giữa hai đối tượng)","nhẹ","gần"]	nhẹ	12	2026-06-24 16:16:36.122	2026-06-24 16:16:36.122
8234	multiple_choice	「いい［コーヒーが～］」 (いい［コーヒーが～］) nghĩa là gì?	["prefer [coffee]","the most","Welcome home","I'm tired"]	prefer [coffee]	12	2026-06-24 16:16:36.123	2026-06-24 16:16:36.123
8235	multiple_choice	「季節」 (きせつ) nghĩa là gì?	["mùa","thế giới","nhanh, sớm","biển, đại dương"]	mùa	12	2026-06-24 16:16:36.125	2026-06-24 16:16:36.125
8236	fill_in_blank	Điền hiragana cho: "khách sạn"	\N	ホテル	12	2026-06-24 16:16:36.126	2026-06-24 16:16:36.126
8237	fill_in_blank	Điền hiragana cho: "gần"	\N	ちかい	12	2026-06-24 16:16:36.127	2026-06-24 16:16:36.127
8238	fill_in_blank	Điền hiragana cho: "lemon"	\N	レモン	12	2026-06-24 16:16:36.128	2026-06-24 16:16:36.128
8239	fill_in_blank	Điền hiragana cho: "beef"	\N	ぎゅうにく	12	2026-06-24 16:16:36.13	2026-06-24 16:16:36.13
8240	fill_in_blank	Điền hiragana cho: "xa"	\N	とおい	12	2026-06-24 16:16:36.134	2026-06-24 16:16:36.134
8241	multiple_choice	「遊びます」 (あそびます) nghĩa là gì?	["mỹ thuật","sông, dòng sông","chơi","bơi lội"]	chơi	13	2026-06-24 16:16:36.317	2026-06-24 16:16:36.317
8242	multiple_choice	「泳ぎます」 (およぎます) nghĩa là gì?	["trượt tuyết","chơi","get thirsty (when expressing the condition of being thirsty, のどが かわきました is used)","bơi lội"]	bơi lội	13	2026-06-24 16:16:36.319	2026-06-24 16:16:36.319
8243	multiple_choice	「迎えます」 (むかえます) nghĩa là gì?	["đón","I agree with you.","riêng biệt, riêng ra","(I'm) full."]	đón	13	2026-06-24 16:16:36.32	2026-06-24 16:16:36.32
8244	multiple_choice	「疲れます」 (つかれます) nghĩa là gì?	["mua sắm","send [a letter]","đăng kí","mệt mỏi"]	mệt mỏi	13	2026-06-24 16:16:36.322	2026-06-24 16:16:36.322
8245	multiple_choice	「結婚します」 (けっこんします) nghĩa là gì?	["Please wait [a moment].","buồn","kết hôn","muốn"]	kết hôn	13	2026-06-24 16:16:36.323	2026-06-24 16:16:36.323
8246	multiple_choice	「買い物します」 (かいものします) nghĩa là gì?	["mua sắm","Russia","kinh tế","a fictitious TV programme"]	mua sắm	13	2026-06-24 16:16:36.325	2026-06-24 16:16:36.325
8247	multiple_choice	「食事します」 (しょくじします) nghĩa là gì?	["kết hôn","dùng bữa, ăn cơm","Russia","riêng biệt, riêng ra"]	dùng bữa, ăn cơm	13	2026-06-24 16:16:36.326	2026-06-24 16:16:36.326
8248	multiple_choice	「散歩します［公園を～］」 (さんぽします［こうえんを～］) nghĩa là gì?	["chỗ nào đó","Russia","take a walk [in a park]","hẹp"]	take a walk [in a park]	13	2026-06-24 16:16:36.328	2026-06-24 16:16:36.328
8249	multiple_choice	「大変［な］」 (たいへん［な］) nghĩa là gì?	["hẹp","chỗ nào đó","đăng kí","hard, tough, severe, awful"]	hard, tough, severe, awful	13	2026-06-24 16:16:36.329	2026-06-24 16:16:36.329
8250	multiple_choice	「欲しい」 (ほしい) nghĩa là gì?	["muốn","cuối tuần","Văn phòng hành chính quận, thành phố.","Please wait [a moment]."]	muốn	13	2026-06-24 16:16:36.331	2026-06-24 16:16:36.331
8251	multiple_choice	「広い」 (ひろい) nghĩa là gì?	["(polite equivalent of です)","rộng","Russia","mua sắm"]	rộng	13	2026-06-24 16:16:36.333	2026-06-24 16:16:36.333
8252	multiple_choice	「狭い」 (せまい) nghĩa là gì?	["dùng bữa, ăn cơm","hẹp","take a walk [in a park]","cơm suất, cơm phần"]	hẹp	13	2026-06-24 16:16:36.335	2026-06-24 16:16:36.335
8253	multiple_choice	「プール」 (プール) nghĩa là gì?	["(I'm) full.","kinh tế","mệt mỏi","hồ bơi"]	hồ bơi	13	2026-06-24 16:16:36.337	2026-06-24 16:16:36.337
8254	multiple_choice	「川」 (かわ) nghĩa là gì?	["dùng bữa, ăn cơm","sông, dòng sông","mệt mỏi","a fictitious company"]	sông, dòng sông	13	2026-06-24 16:16:36.338	2026-06-24 16:16:36.338
8255	multiple_choice	「美術」 (びじゅつ) nghĩa là gì?	["mệt mỏi","mỹ thuật","hard, tough, severe, awful","Let's do that. (used when agreeing with someone's suggestion)"]	mỹ thuật	13	2026-06-24 16:16:36.339	2026-06-24 16:16:36.339
8256	fill_in_blank	Điền hiragana cho: "buồn"	\N	さびしい	13	2026-06-24 16:16:36.341	2026-06-24 16:16:36.341
8257	fill_in_blank	Điền hiragana cho: "hội họp, cuộc họp"	\N	かいぎ	13	2026-06-24 16:16:36.342	2026-06-24 16:16:36.342
8258	fill_in_blank	Điền hiragana cho: "việc câu cá"	\N	つり	13	2026-06-24 16:16:36.343	2026-06-24 16:16:36.343
8259	fill_in_blank	Điền hiragana cho: "cuối tuần"	\N	しゅうまつ	13	2026-06-24 16:16:36.345	2026-06-24 16:16:36.345
8260	fill_in_blank	Điền hiragana cho: "trượt tuyết"	\N	スキー	13	2026-06-24 16:16:36.346	2026-06-24 16:16:36.346
8261	multiple_choice	「つけます」 (つけます) nghĩa là gì?	["name of a town in Osaka","lại","bật","gọi"]	bật	14	2026-06-24 16:16:36.542	2026-06-24 16:16:36.542
8262	multiple_choice	「消します」 (けします) nghĩa là gì?	["tắt","điều hòa","vội vàng, cấp bách","bật"]	tắt	14	2026-06-24 16:16:36.543	2026-06-24 16:16:36.543
8263	multiple_choice	「開けます」 (あけます) nghĩa là gì?	["tắt","turn [to the right]","mở","name of a town in Osaka"]	mở	14	2026-06-24 16:16:36.545	2026-06-24 16:16:36.545
8264	multiple_choice	「閉めます」 (しめます) nghĩa là gì?	["lại","electricity, light","answer","buộc thắt, cột lại"]	buộc thắt, cột lại	14	2026-06-24 16:16:36.547	2026-06-24 16:16:36.547
8265	multiple_choice	「急ぎます」 (いそぎます) nghĩa là gì?	["vội vàng, cấp bách","đường","a fictitious town","muối"]	vội vàng, cấp bách	14	2026-06-24 16:16:36.549	2026-06-24 16:16:36.549
8266	multiple_choice	「待ちます」 (まちます) nghĩa là gì?	["muối","hộ chiếu","question, problem, trouble","chờ đợi"]	chờ đợi	14	2026-06-24 16:16:36.551	2026-06-24 16:16:36.551
8267	multiple_choice	「持ちます」 (もちます) nghĩa là gì?	["cách đọc","Sure./Certainly.","cầm, nắm","giúp đỡ"]	cầm, nắm	14	2026-06-24 16:16:36.553	2026-06-24 16:16:36.553
8268	multiple_choice	「取ります」 (とります) nghĩa là gì?	["bắt, chụp hình, lấy","turn [to the right]","～ more, another ～","gọi"]	bắt, chụp hình, lấy	14	2026-06-24 16:16:36.554	2026-06-24 16:16:36.554
8269	multiple_choice	「手伝います」 (てつだいます) nghĩa là gì?	["giúp đỡ","dừng lại","cách đọc","đường"]	giúp đỡ	14	2026-06-24 16:16:36.556	2026-06-24 16:16:36.556
8270	multiple_choice	「呼びます」 (よびます) nghĩa là gì?	["gọi","tell [an address]","trò chuyện, nói","ngay, lập tức"]	gọi	14	2026-06-24 16:16:36.558	2026-06-24 16:16:36.558
8271	multiple_choice	「話します」 (はなします) nghĩa là gì?	["electricity, light","trò chuyện, nói","hộ chiếu","địa chỉ"]	trò chuyện, nói	14	2026-06-24 16:16:36.56	2026-06-24 16:16:36.56
8272	multiple_choice	「使います」 (つかいます) nghĩa là gì?	["cho xem","tên","dừng lại","use"]	use	14	2026-06-24 16:16:36.563	2026-06-24 16:16:36.563
8273	multiple_choice	「止めます」 (とめます) nghĩa là gì?	["dừng lại","muối","địa chỉ","thêm một chút nữa"]	dừng lại	14	2026-06-24 16:16:36.566	2026-06-24 16:16:36.566
8274	multiple_choice	「見せます」 (みせます) nghĩa là gì?	["trò chuyện, nói","giúp đỡ","cho xem","electricity, light"]	cho xem	14	2026-06-24 16:16:36.568	2026-06-24 16:16:36.568
8275	multiple_choice	「教えます［住所を～］」 (おしえます［じゅうしょを～］) nghĩa là gì?	["chậm, thong thả","how to ～, way of ～ing","địa chỉ","tell [an address]"]	tell [an address]	14	2026-06-24 16:16:36.57	2026-06-24 16:16:36.57
8276	fill_in_blank	Điền hiragana cho: "buộc thắt, cột lại"	\N	しめます	14	2026-06-24 16:16:36.571	2026-06-24 16:16:36.571
8277	fill_in_blank	Điền hiragana cho: "stand up"	\N	たちます	14	2026-06-24 16:16:36.573	2026-06-24 16:16:36.573
8278	fill_in_blank	Điền hiragana cho: "địa chỉ"	\N	じゅうしょ	14	2026-06-24 16:16:36.575	2026-06-24 16:16:36.575
8279	fill_in_blank	Điền hiragana cho: "bản đồ"	\N	ちず	14	2026-06-24 16:16:36.576	2026-06-24 16:16:36.576
8280	fill_in_blank	Điền hiragana cho: "answer"	\N	こたえ	14	2026-06-24 16:16:36.578	2026-06-24 16:16:36.578
8281	multiple_choice	「置きます」 (おきます) nghĩa là gì?	["economy","catalog","a shopping district in Osaka","đặt để"]	đặt để	15	2026-06-24 16:16:36.72	2026-06-24 16:16:36.72
8282	multiple_choice	「作ります、造ります」 (つくります) nghĩa là gì?	["làm, chế tạo","biết","a fictitious TV programme","biết"]	làm, chế tạo	15	2026-06-24 16:16:36.721	2026-06-24 16:16:36.721
8283	multiple_choice	「売ります」 (うります) nghĩa là gì?	["tư liệu, tài liệu","bán","làm, chế tạo","biết"]	bán	15	2026-06-24 16:16:36.723	2026-06-24 16:16:36.723
8284	multiple_choice	「知ります」 (しります) nghĩa là gì?	["remember, recollect","độc thân","especially","biết"]	biết	15	2026-06-24 16:16:36.725	2026-06-24 16:16:36.725
8285	multiple_choice	「住ます」 (すみます) nghĩa là gì?	["đặt để","bán","especially","sống, ở"]	sống, ở	15	2026-06-24 16:16:36.727	2026-06-24 16:16:36.727
8286	multiple_choice	「研究します」 (けんきゅうします) nghĩa là gì?	["chuyên môn","phần mềm","especially","nghiêm cứu"]	nghiêm cứu	15	2026-06-24 16:16:36.729	2026-06-24 16:16:36.729
8287	multiple_choice	「資料」 (しりょう) nghĩa là gì?	["tư liệu, tài liệu","remember, recollect","nha sĩ","senior high school"]	tư liệu, tài liệu	15	2026-06-24 16:16:36.732	2026-06-24 16:16:36.732
8288	multiple_choice	「カタログ」 (カタログ) nghĩa là gì?	["catalog","biết","electronic dictionary","quần áo"]	catalog	15	2026-06-24 16:16:36.734	2026-06-24 16:16:36.734
8289	multiple_choice	「時刻表」 (じこくひょう) nghĩa là gì?	["a fictitious TV programme","senior high school","tư liệu, tài liệu","bảng ghi thời gian tàu chạy"]	bảng ghi thời gian tàu chạy	15	2026-06-24 16:16:36.736	2026-06-24 16:16:36.736
8290	multiple_choice	「服」 (ふく) nghĩa là gì?	["quần áo","senior high school","economy","Ladies and Gentlemen, everybody"]	quần áo	15	2026-06-24 16:16:36.738	2026-06-24 16:16:36.738
8291	multiple_choice	「製品」 (せいひん) nghĩa là gì?	["sản phẩm","bảng ghi thời gian tàu chạy","biết","tư liệu, tài liệu"]	sản phẩm	15	2026-06-24 16:16:36.74	2026-06-24 16:16:36.74
8292	multiple_choice	「ソフト」 (ソフト) nghĩa là gì?	["catalog","đặt để","phần mềm","bán"]	phần mềm	15	2026-06-24 16:16:36.742	2026-06-24 16:16:36.742
8293	multiple_choice	「電子辞書」 (でんしじしょ) nghĩa là gì?	["tư liệu, tài liệu","especially","sống, ở","electronic dictionary"]	electronic dictionary	15	2026-06-24 16:16:36.745	2026-06-24 16:16:36.745
8294	multiple_choice	「経済」 (けいざい) nghĩa là gì?	["phần mềm","nghiêm cứu","economy","sống, ở"]	economy	15	2026-06-24 16:16:36.748	2026-06-24 16:16:36.748
8295	multiple_choice	「市役所」 (しやくしょ) nghĩa là gì?	["sống, ở","quần áo","municipal office, city hall","biết"]	municipal office, city hall	15	2026-06-24 16:16:36.75	2026-06-24 16:16:36.75
8296	fill_in_blank	Điền hiragana cho: "Ladies and Gentlemen, everybody"	\N	みなさん	15	2026-06-24 16:16:36.752	2026-06-24 16:16:36.752
8297	fill_in_blank	Điền hiragana cho: "nha sĩ"	\N	はいしゃ	15	2026-06-24 16:16:36.753	2026-06-24 16:16:36.753
8298	fill_in_blank	Điền hiragana cho: "tư liệu, tài liệu"	\N	しりょう	15	2026-06-24 16:16:36.755	2026-06-24 16:16:36.755
8299	fill_in_blank	Điền hiragana cho: "electronic dictionary"	\N	でんしじしょ	15	2026-06-24 16:16:36.756	2026-06-24 16:16:36.756
8300	fill_in_blank	Điền hiragana cho: "ngồi"	\N	すわります	15	2026-06-24 16:16:36.758	2026-06-24 16:16:36.758
8301	multiple_choice	「乗ります［電車に～］」 (のります［でんしゃに～］) nghĩa là gì?	["ride, get on [a train]","Snow Festival","a district in Osaka","du học sinh"]	ride, get on [a train]	16	2026-06-24 16:16:36.938	2026-06-24 16:16:36.938
8302	multiple_choice	「降ります［電車を～］」 (おります［でんしゃを～］) nghĩa là gì?	["Are you making a withdrawal?","cái…..","get off","tiếp theo"]	get off	16	2026-06-24 16:16:36.94	2026-06-24 16:16:36.94
8303	multiple_choice	「乗り換えます」 (のりかえます) nghĩa là gì?	["sáng","chuyển, đổi tàu","a district in Osaka","mặt"]	chuyển, đổi tàu	16	2026-06-24 16:16:36.943	2026-06-24 16:16:36.943
8304	multiple_choice	「浴びます［シャワーを～］」 (あびます［シャワーを～］) nghĩa là gì?	["quit or retire from [a company], stop, give up","châu Á","đầu","take [a shower]"]	take [a shower]	16	2026-06-24 16:16:36.946	2026-06-24 16:16:36.946
8305	multiple_choice	「入れます」 (いれます) nghĩa là gì?	["Franken (in Germany)","bỏ vào, cho vào","get off","tiếp theo"]	bỏ vào, cho vào	16	2026-06-24 16:16:36.951	2026-06-24 16:16:36.951
8306	multiple_choice	「出します」 (だします) nghĩa là gì?	["sáng","bụng","Lấy ra, rút tiền","Buddhist temple"]	Lấy ra, rút tiền	16	2026-06-24 16:16:36.954	2026-06-24 16:16:36.954
8307	multiple_choice	「下ろします［お金を～］」 (おろします［おかねを～］) nghĩa là gì?	["withdraw","Vietnam","trẻ","mật khẩu"]	withdraw	16	2026-06-24 16:16:36.956	2026-06-24 16:16:36.956
8308	multiple_choice	「入ります［大学に～］」 (はいります［だいがくに～］) nghĩa là gì?	["xác nhận","ngắn","a fictitious bus stop","enter [university]"]	enter [university]	16	2026-06-24 16:16:36.958	2026-06-24 16:16:36.958
8309	multiple_choice	「出ます［大学を～］」 (でます［だいがくを～］) nghĩa là gì?	["du học sinh","mặt","sáng","graduate from [university]"]	graduate from [university]	16	2026-06-24 16:16:36.961	2026-06-24 16:16:36.961
8310	multiple_choice	「押します」 (おします) nghĩa là gì?	["Bandung (in Indonesia)","nhấn, ấn","Hue (in Vietnam)","Japan Railways"]	nhấn, ấn	16	2026-06-24 16:16:36.964	2026-06-24 16:16:36.964
8311	multiple_choice	「飲みます」 (のみます) nghĩa là gì?	["drink alcohol","nose","màu xanh lá","get off"]	drink alcohol	16	2026-06-24 16:16:36.967	2026-06-24 16:16:36.967
8312	multiple_choice	「始めます」 (はじめます) nghĩa là gì?	["đầu","Japan Railways","tiếp theo","start, begin"]	start, begin	16	2026-06-24 16:16:36.97	2026-06-24 16:16:36.97
8313	multiple_choice	「見学します」 (けんがくします) nghĩa là gì?	["a district in Osaka","châu Á","tour, visit a place to study it","Franken (in Germany)"]	tour, visit a place to study it	16	2026-06-24 16:16:36.972	2026-06-24 16:16:36.972
8314	multiple_choice	「電話します」 (でんわします) nghĩa là gì?	["số tiền, tài khoản","phone","Bandung (in Indonesia)","dịch vụ"]	phone	16	2026-06-24 16:16:36.974	2026-06-24 16:16:36.974
8315	multiple_choice	「若い」 (わかい) nghĩa là gì?	["Snow Festival","nhấn, ấn","trẻ","chuyển, đổi tàu"]	trẻ	16	2026-06-24 16:16:36.977	2026-06-24 16:16:36.977
8316	fill_in_blank	Điền hiragana cho: "chuyển, đổi tàu"	\N	のりかえます	16	2026-06-24 16:16:36.98	2026-06-24 16:16:36.98
8317	fill_in_blank	Điền hiragana cho: "Lấy ra, rút tiền"	\N	だします	16	2026-06-24 16:16:36.983	2026-06-24 16:16:36.983
8318	fill_in_blank	Điền hiragana cho: "ride, get on [a train]"	\N	のります［でんしゃに～］	16	2026-06-24 16:16:36.986	2026-06-24 16:16:36.986
8319	fill_in_blank	Điền hiragana cho: "height"	\N	せ	16	2026-06-24 16:16:36.988	2026-06-24 16:16:36.988
8320	fill_in_blank	Điền hiragana cho: "drink alcohol"	\N	のみます	16	2026-06-24 16:16:36.99	2026-06-24 16:16:36.99
8321	multiple_choice	「覚えます」 (おぼえます) nghĩa là gì?	["vì thế, vì vậy, do đó","cởi quần áo, giầy","take [a bath]","nhớ"]	nhớ	17	2026-06-24 16:16:37.167	2026-06-24 16:16:37.167
8322	multiple_choice	「忘れます」 (わすれます) nghĩa là gì?	["vì thế, vì vậy, do đó","and, furthermore","cấm hút thuốc","quên"]	quên	17	2026-06-24 16:16:37.169	2026-06-24 16:16:37.169
8323	multiple_choice	「なくします」 (なくします) nghĩa là gì?	["vì thế, vì vậy, do đó","important, precious","and, furthermore","mất, đánh mất"]	mất, đánh mất	17	2026-06-24 16:16:37.172	2026-06-24 16:16:37.172
8324	multiple_choice	「払います」 (はらいます) nghĩa là gì?	["ốm, bệnh","trả tiền","ra ngoài","take [a bath]"]	trả tiền	17	2026-06-24 16:16:37.174	2026-06-24 16:16:37.174
8325	multiple_choice	「返します」 (かえします) nghĩa là gì?	["trả lại","ra ngoài","lo lắng","cấm hút thuốc"]	trả lại	17	2026-06-24 16:16:37.177	2026-06-24 16:16:37.177
8326	multiple_choice	「出かけます」 (でかけます) nghĩa là gì?	["ra ngoài","(I) have a pain [in my ～].","nhớ","sốt"]	ra ngoài	17	2026-06-24 16:16:37.181	2026-06-24 16:16:37.181
8327	multiple_choice	「脱ぎます」 (ぬぎます) nghĩa là gì?	["throat","nguy hiểm","two or three days","cởi quần áo, giầy"]	cởi quần áo, giầy	17	2026-06-24 16:16:37.184	2026-06-24 16:16:37.184
8328	multiple_choice	「持って 行きます」 (もって いきます) nghĩa là gì?	["cảm,cúm","trả lại","mang đi,mang theo","áo khoác"]	mang đi,mang theo	17	2026-06-24 16:16:37.186	2026-06-24 16:16:37.186
8329	multiple_choice	「持って 来ます」 (もって きます) nghĩa là gì?	["mang đến","lo lắng","throat","cảm,cúm"]	mang đến	17	2026-06-24 16:16:37.189	2026-06-24 16:16:37.189
8330	multiple_choice	「心配します」 (しんぱいします) nghĩa là gì?	["cởi quần áo, giầy","quên","lo lắng","đi công tác"]	lo lắng	17	2026-06-24 16:16:37.192	2026-06-24 16:16:37.192
8331	multiple_choice	「残業します」 (ざんぎょうします) nghĩa là gì?	["mất, đánh mất","sốt","làm thêm","ra ngoài"]	làm thêm	17	2026-06-24 16:16:37.194	2026-06-24 16:16:37.194
8332	multiple_choice	「出張します」 (しゅっちょうします) nghĩa là gì?	["quần áo lót","làm thêm","đi công tác","ra ngoài"]	đi công tác	17	2026-06-24 16:16:37.197	2026-06-24 16:16:37.197
8333	multiple_choice	「飲みます［薬を～］」 (のみます［くすりを～］) nghĩa là gì?	["làm thêm","áo khoác","take [medicine]","before ～, by ～ (indicating time limit)"]	take [medicine]	17	2026-06-24 16:16:37.2	2026-06-24 16:16:37.2
8334	multiple_choice	「入ります［おふろに～］」 (はいります［おふろに～］) nghĩa là gì?	["take [a bath]","ốm, bệnh","sốt","ra ngoài"]	take [a bath]	17	2026-06-24 16:16:37.203	2026-06-24 16:16:37.203
8335	multiple_choice	「大切［な］」 (たいせつ［な］) nghĩa là gì?	["important, precious","trả lại","cấm hút thuốc","sốt"]	important, precious	17	2026-06-24 16:16:37.205	2026-06-24 16:16:37.205
8336	fill_in_blank	Điền hiragana cho: "cảm,cúm"	\N	かぜ	17	2026-06-24 16:16:37.208	2026-06-24 16:16:37.208
8337	fill_in_blank	Điền hiragana cho: "Take care of yourself. (said to people who are ill)"	\N	おだいじに。	17	2026-06-24 16:16:37.211	2026-06-24 16:16:37.211
8338	fill_in_blank	Điền hiragana cho: "two or three days"	\N	２、３にち	17	2026-06-24 16:16:37.215	2026-06-24 16:16:37.215
8339	fill_in_blank	Điền hiragana cho: "before ～, by ～ (indicating time limit)"	\N	～までに	17	2026-06-24 16:16:37.218	2026-06-24 16:16:37.218
8340	fill_in_blank	Điền hiragana cho: "vì thế, vì vậy, do đó"	\N	ですから	17	2026-06-24 16:16:37.222	2026-06-24 16:16:37.222
8341	multiple_choice	「できます」 (できます) nghĩa là gì?	["có thể","nhất định, rất","Internet","a district in Tokyo"]	có thể	18	2026-06-24 16:16:37.431	2026-06-24 16:16:37.431
8342	multiple_choice	「洗います」 (あらいます) nghĩa là gì?	["chơi (nhạc cụ)","rửa, giặt","hát","prayer (～を します : pray)"]	rửa, giặt	18	2026-06-24 16:16:37.434	2026-06-24 16:16:37.434
8343	multiple_choice	「弾きます」 (ひきます) nghĩa là gì?	["đổi, trao đổi","chơi (nhạc cụ)","giám đốc","tổ trưởng, trưởng bộ phận"]	chơi (nhạc cụ)	18	2026-06-24 16:16:37.436	2026-06-24 16:16:37.436
8344	multiple_choice	「歌います」 (うたいます) nghĩa là gì?	["hát","chơi (nhạc cụ)","vứt bỏ, bỏ đi","Really?"]	hát	18	2026-06-24 16:16:37.439	2026-06-24 16:16:37.439
8345	multiple_choice	「集めます」 (あつめます) nghĩa là gì?	["sưu tầm, thu thập","the Beatles (a famous British pop group)","not easily (used with negatives)","đàn piano"]	sưu tầm, thu thập	18	2026-06-24 16:16:37.442	2026-06-24 16:16:37.442
8346	multiple_choice	「捨てます」 (すてます) nghĩa là gì?	["trang trại chăn nuôi","Furusato (a song title meaning 'Home Town')","vứt bỏ, bỏ đi","sở thích"]	vứt bỏ, bỏ đi	18	2026-06-24 16:16:37.444	2026-06-24 16:16:37.444
8347	multiple_choice	「換えます」 (かえます) nghĩa là gì?	["horse","vứt bỏ, bỏ đi","đổi, trao đổi","the Beatles (a famous British pop group)"]	đổi, trao đổi	18	2026-06-24 16:16:37.449	2026-06-24 16:16:37.449
8348	multiple_choice	「運転します」 (うんてんします) nghĩa là gì?	["lái (xe), điều khiển","vứt bỏ, bỏ đi","That's interesting, isn't it?","prayer (～を します : pray)"]	lái (xe), điều khiển	18	2026-06-24 16:16:37.453	2026-06-24 16:16:37.453
8349	multiple_choice	「予約します」 (よやくします) nghĩa là gì?	["đặt chỗ, đặt trước","lái (xe), điều khiển","not easily (used with negatives)","especially"]	đặt chỗ, đặt trước	18	2026-06-24 16:16:37.456	2026-06-24 16:16:37.456
8350	multiple_choice	「ピアノ」 (ピアノ) nghĩa là gì?	["đặt chỗ, đặt trước","đàn piano","Internet","Really?"]	đàn piano	18	2026-06-24 16:16:37.459	2026-06-24 16:16:37.459
8351	multiple_choice	「－メートル」 (－メートル) nghĩa là gì?	["－ meter","Internet","hát","nhất định, rất"]	－ meter	18	2026-06-24 16:16:37.462	2026-06-24 16:16:37.462
8352	multiple_choice	「現金」 (げんきん) nghĩa là gì?	["Internet","lái (xe), điều khiển","rửa, giặt","tiền mặt"]	tiền mặt	18	2026-06-24 16:16:37.467	2026-06-24 16:16:37.467
8353	multiple_choice	「趣味」 (しゅみ) nghĩa là gì?	["That's interesting, isn't it?","animal","đổi, trao đổi","sở thích"]	sở thích	18	2026-06-24 16:16:37.47	2026-06-24 16:16:37.47
8354	multiple_choice	「日記」 (にっき) nghĩa là gì?	["tổ trưởng, trưởng bộ phận","nhật ký","a district in Tokyo","rửa, giặt"]	nhật ký	18	2026-06-24 16:16:37.474	2026-06-24 16:16:37.474
8355	multiple_choice	「お祈り」 (おいのり) nghĩa là gì?	["tiền mặt","prayer (～を します : pray)","trưởng phòng","trang trại chăn nuôi"]	prayer (～を します : pray)	18	2026-06-24 16:16:37.478	2026-06-24 16:16:37.478
8356	fill_in_blank	Điền hiragana cho: "the Beatles (a famous British pop group)"	\N	ビートルズ	18	2026-06-24 16:16:37.482	2026-06-24 16:16:37.482
8357	fill_in_blank	Điền hiragana cho: "Really?"	\N	ほんとうですか。	18	2026-06-24 16:16:37.486	2026-06-24 16:16:37.486
8358	fill_in_blank	Điền hiragana cho: "trưởng phòng"	\N	ぶちょう	18	2026-06-24 16:16:37.489	2026-06-24 16:16:37.489
8359	fill_in_blank	Điền hiragana cho: "trang trại chăn nuôi"	\N	ぼくじょう	18	2026-06-24 16:16:37.492	2026-06-24 16:16:37.492
8360	fill_in_blank	Điền hiragana cho: "What! Really! (used when expressing surprise)"	\N	へえ	18	2026-06-24 16:16:37.495	2026-06-24 16:16:37.495
8361	multiple_choice	「登ります、上ります」 (のぼります) nghĩa là gì?	["chưa lần nào","practice (～［を］します : practise)","leo (núi)","ăn kiêng"]	leo (núi)	19	2026-06-24 16:16:37.688	2026-06-24 16:16:37.688
8362	multiple_choice	「泊まります［ホテルに～］」 (とまります［ホテルに～］) nghĩa là gì?	["ăn kiêng","buồn ngủ","dần dần","stay [at a hotel]"]	stay [at a hotel]	19	2026-06-24 16:16:37.691	2026-06-24 16:16:37.691
8363	multiple_choice	「掃除します」 (そうじします) nghĩa là gì?	["dọn dẹp","nâng cốc","Tokyo Sky Tree (broadcasting tower with observation deck in Tokyo)","nhiều lần"]	dọn dẹp	19	2026-06-24 16:16:37.693	2026-06-24 16:16:37.693
8364	multiple_choice	「洗濯します」 (せんたくします) nghĩa là gì?	["ngày","nâng cốc","trò chơi pachinko","giặt giũ, giặt (quần áo)"]	giặt giũ, giặt (quần áo)	19	2026-06-24 16:16:37.698	2026-06-24 16:16:37.698
8365	multiple_choice	「なります」 (なります) nghĩa là gì?	["trở nên ,trở thành","but","tình trạng, trạng thái","tuy nhiên"]	trở nên ,trở thành	19	2026-06-24 16:16:37.702	2026-06-24 16:16:37.702
8366	multiple_choice	「眠い」 (ねむい) nghĩa là gì?	["buồn ngủ","excessive, impossible","tốt cho sức khỏe","tuy nhiên"]	buồn ngủ	19	2026-06-24 16:16:37.704	2026-06-24 16:16:37.704
8367	multiple_choice	「強い」 (つよい) nghĩa là gì?	["mạnh, khỏe","tình trạng, trạng thái","tình trạng tốt","trà đạo"]	mạnh, khỏe	19	2026-06-24 16:16:37.707	2026-06-24 16:16:37.707
8368	multiple_choice	「弱い」 (よわい) nghĩa là gì?	["ngày","yếu","trà đạo","nâng cốc"]	yếu	19	2026-06-24 16:16:37.71	2026-06-24 16:16:37.71
8369	multiple_choice	「練習」 (れんしゅう) nghĩa là gì?	["nhiều lần","practice (～［を］します : practise)","nâng cốc","leo (núi)"]	practice (～［を］します : practise)	19	2026-06-24 16:16:37.715	2026-06-24 16:16:37.715
8370	multiple_choice	「ゴルフ」 (ゴルフ) nghĩa là gì?	["vật sumo","nhiều lần","gôn","practice (～［を］します : practise)"]	gôn	19	2026-06-24 16:16:37.718	2026-06-24 16:16:37.718
8371	multiple_choice	「相撲」 (すもう) nghĩa là gì?	["nâng cốc","nhiều lần","vật sumo","tốt cho sức khỏe"]	vật sumo	19	2026-06-24 16:16:37.721	2026-06-24 16:16:37.721
8372	multiple_choice	「お茶」 (おちゃ) nghĩa là gì?	["sự tình là, sự thật là","tình trạng xấu","but","trà đạo"]	trà đạo	19	2026-06-24 16:16:37.725	2026-06-24 16:16:37.725
8373	multiple_choice	「日」 (ひ) nghĩa là gì?	["ăn kiêng","giặt giũ, giặt (quần áo)","tuy nhiên","ngày"]	ngày	19	2026-06-24 16:16:37.728	2026-06-24 16:16:37.728
8374	multiple_choice	「調子」 (ちょうし) nghĩa là gì?	["tình trạng, trạng thái","giặt giũ, giặt (quần áo)","excessive, impossible","stay [at a hotel]"]	tình trạng, trạng thái	19	2026-06-24 16:16:37.732	2026-06-24 16:16:37.732
8375	multiple_choice	「一度」 (いちど) nghĩa là gì?	["a famous Edo-period woodblock artist and painter (1760-1849)","một lần","excessive, impossible","mạnh, khỏe"]	một lần	19	2026-06-24 16:16:37.736	2026-06-24 16:16:37.736
8376	fill_in_blank	Điền hiragana cho: "but"	\N	でも	19	2026-06-24 16:16:37.739	2026-06-24 16:16:37.739
8377	fill_in_blank	Điền hiragana cho: "practice (～［を］します : practise)"	\N	れんしゅう	19	2026-06-24 16:16:37.742	2026-06-24 16:16:37.742
8378	fill_in_blank	Điền hiragana cho: "nhiều lần"	\N	なんかいも	19	2026-06-24 16:16:37.744	2026-06-24 16:16:37.744
8379	fill_in_blank	Điền hiragana cho: "trà đạo"	\N	おちゃ	19	2026-06-24 16:16:37.749	2026-06-24 16:16:37.749
8380	fill_in_blank	Điền hiragana cho: "nâng cốc"	\N	かんぱい	19	2026-06-24 16:16:37.752	2026-06-24 16:16:37.752
8381	multiple_choice	「要ります［ビザが～］」 (いります［ビザが～］) nghĩa là gì?	["cậu, bạn","(hậu tố thêm vào sau tên của em trai)","need, require [a visa]","Anh/ chị sẽ về nước không?"]	need, require [a visa]	20	2026-06-24 16:16:37.938	2026-06-24 16:16:37.938
8382	multiple_choice	「調べます」 (しらべます) nghĩa là gì?	["cậu, bạn","mọi người cùng","tìm hiểu, điều tra, xem","Nếu anh/ chị thích thì"]	tìm hiểu, điều tra, xem	20	2026-06-24 16:16:37.939	2026-06-24 16:16:37.939
8383	multiple_choice	「修理します」 (しゅうりします) nghĩa là gì?	["thị thực, visa","sửa, chữa, tu sửa","(hậu tố thêm vào sau tên của em trai)","mọi người cùng"]	sửa, chữa, tu sửa	20	2026-06-24 16:16:37.941	2026-06-24 16:16:37.941
8384	multiple_choice	「僕」 (ぼく) nghĩa là gì?	["phía đó (cách nói tự nhiên của, thân mật “sochira”)","tớ (cách xưng thân mật của nam giới)","người làm việc cho các cty","thị thực, visa"]	tớ (cách xưng thân mật của nam giới)	20	2026-06-24 16:16:37.943	2026-06-24 16:16:37.943
8385	multiple_choice	「君」 (きみ) nghĩa là gì?	["cậu, bạn","thị thực, visa","phía nào (cách nói tự nhiên, thân mật của “dochira”)","sửa, chữa, tu sửa"]	cậu, bạn	20	2026-06-24 16:16:37.944	2026-06-24 16:16:37.944
8386	multiple_choice	「～君」 (～くん) nghĩa là gì?	["cậu, bạn","kết thúc","(hậu tố thêm vào sau tên của em trai)","sửa, chữa"]	(hậu tố thêm vào sau tên của em trai)	20	2026-06-24 16:16:37.946	2026-06-24 16:16:37.946
8387	multiple_choice	「うん」 (うん) nghĩa là gì?	["giá cả, mức giá","có(cách nói thân mật của “はい”)","Anh/ chị tính sao? Anh/ chị sẽ làm gì","nhưng(cách nói thân mật của が)"]	có(cách nói thân mật của “はい”)	20	2026-06-24 16:16:37.948	2026-06-24 16:16:37.948
8388	multiple_choice	「ううん」 (ううん) nghĩa là gì?	["có(cách nói thân mật của “はい”)","sửa, chữa","phía đó (cách nói tự nhiên của, thân mật “sochira”)","không(cách nói thân mật của “いいえ”)"]	không(cách nói thân mật của “いいえ”)	20	2026-06-24 16:16:37.95	2026-06-24 16:16:37.95
8389	multiple_choice	「ことば」 (ことば) nghĩa là gì?	["không(cách nói thân mật của “いいえ”)","giá cả, mức giá","phía đó (cách nói tự nhiên của, thân mật “sochira”)","tiếng"]	tiếng	20	2026-06-24 16:16:37.952	2026-06-24 16:16:37.952
8390	multiple_choice	「着物」 (きもの) nghĩa là gì?	["(hậu tố thêm vào sau tên của em trai)","kimono","Đằng kia (cách nói tự nhiên, thân mật của “achira”)","kết thúc"]	kimono	20	2026-06-24 16:16:37.953	2026-06-24 16:16:37.953
8391	multiple_choice	「ビサ」 (ビザ) nghĩa là gì?	["ban đầu, đầu tiên","Anh/ chị sẽ về nước không?","need, require [a visa]","thị thực, visa"]	thị thực, visa	20	2026-06-24 16:16:37.954	2026-06-24 16:16:37.954
8392	multiple_choice	「初め」 (はじめ) nghĩa là gì?	["need, require [a visa]","ban đầu, đầu tiên","kimono","gọi điện thoại"]	ban đầu, đầu tiên	20	2026-06-24 16:16:37.956	2026-06-24 16:16:37.956
8393	multiple_choice	「終わり」 (おわり) nghĩa là gì?	["kết thúc","mọi người cùng","tớ (cách xưng thân mật của nam giới)","cậu, bạn"]	kết thúc	20	2026-06-24 16:16:37.957	2026-06-24 16:16:37.957
8394	multiple_choice	「こっち」 (こっち) nghĩa là gì?	["(hậu tố thêm vào sau tên của em trai)","Đằng này (cách nói tự nhiên, thân mật của “kochira”)","gọi điện thoại","giá cả, mức giá"]	Đằng này (cách nói tự nhiên, thân mật của “kochira”)	20	2026-06-24 16:16:37.959	2026-06-24 16:16:37.959
8395	multiple_choice	「そっち」 (そっち) nghĩa là gì?	["Anh/ chị tính sao? Anh/ chị sẽ làm gì","phía đó (cách nói tự nhiên của, thân mật “sochira”)","mọi người cùng","tớ (cách xưng thân mật của nam giới)"]	phía đó (cách nói tự nhiên của, thân mật “sochira”)	20	2026-06-24 16:16:37.96	2026-06-24 16:16:37.96
8396	fill_in_blank	Điền hiragana cho: "nhiều thứ, đa dạng"	\N	いろいろ	20	2026-06-24 16:16:37.963	2026-06-24 16:16:37.963
8397	fill_in_blank	Điền hiragana cho: "nhưng(cách nói thân mật của が)"	\N	～けど	20	2026-06-24 16:16:37.965	2026-06-24 16:16:37.965
8398	fill_in_blank	Điền hiragana cho: "ban đầu, đầu tiên"	\N	はじめ	20	2026-06-24 16:16:37.967	2026-06-24 16:16:37.967
8399	fill_in_blank	Điền hiragana cho: "tớ (cách xưng thân mật của nam giới)"	\N	ぼく	20	2026-06-24 16:16:37.969	2026-06-24 16:16:37.969
8400	fill_in_blank	Điền hiragana cho: "phía đó (cách nói tự nhiên của, thân mật “sochira”)"	\N	そっち	20	2026-06-24 16:16:37.97	2026-06-24 16:16:37.97
8401	multiple_choice	「思います」 (おもいます) nghĩa là gì?	["nghĩ","moon","tổng thống","earth"]	nghĩ	21	2026-06-24 16:16:38.179	2026-06-24 16:16:38.179
8402	multiple_choice	「言います」 (いいます) nghĩa là gì?	["inconvenient","theo ~ về","nói","gần đây"]	nói	21	2026-06-24 16:16:38.181	2026-06-24 16:16:38.181
8403	multiple_choice	「勝ちます」 (かちます) nghĩa là gì?	["earth","[commodity] prices","dream","thắng"]	thắng	21	2026-06-24 16:16:38.183	2026-06-24 16:16:38.183
8404	multiple_choice	「負けます」 (まけます) nghĩa là gì?	["thua","Tenjin Festival (a festival in Osaka)","bài phát biểu","gần đây"]	thua	21	2026-06-24 16:16:38.185	2026-06-24 16:16:38.185
8405	multiple_choice	「あります［お祭りが～］」 (あります［おまつりが～］) nghĩa là gì?	["[a festival] be held, take place","theo ~ về","gần đây","[commodity] prices"]	[a festival] be held, take place	21	2026-06-24 16:16:38.187	2026-06-24 16:16:38.187
8406	multiple_choice	「役に 立ちます」 (やくに たちます) nghĩa là gì?	["Tenjin Festival (a festival in Osaka)","chắc, có thể","theo ~ về","giúp ích"]	giúp ích	21	2026-06-24 16:16:38.188	2026-06-24 16:16:38.188
8407	multiple_choice	「動きます」 (うごきます) nghĩa là gì?	["It's been a long time (since I last saw you)./Long time no see.","không còn cách nào khác","move, work","Galileo Galilei (1564-1642)"]	move, work	21	2026-06-24 16:16:38.19	2026-06-24 16:16:38.19
8408	multiple_choice	「やめます［会社を～］」 (やめます［かいしゃを～］) nghĩa là gì?	["gần đây","quit or retire from [a company], stop, give up","chắc, có thể","nói"]	quit or retire from [a company], stop, give up	21	2026-06-24 16:16:38.191	2026-06-24 16:16:38.191
8409	multiple_choice	「気を つけます」 (きを つけます) nghĩa là gì?	["pay attention, take care","Benjamin Franklin (1706-1790)","Captain James Cook (1728-1779)","câu chuyện"]	pay attention, take care	21	2026-06-24 16:16:38.192	2026-06-24 16:16:38.192
8410	multiple_choice	「留学します」 (りゅうがくします) nghĩa là gì?	["study abroad","[a festival] be held, take place","đủ","giờ cao điểm"]	study abroad	21	2026-06-24 16:16:38.194	2026-06-24 16:16:38.194
8411	multiple_choice	「むだ［な］」 (むだ［な］) nghĩa là gì?	["không còn cách nào khác","Mt. Yoshino (a mountain in Nara Prefecture)","wasteful","Galileo Galilei (1564-1642)"]	wasteful	21	2026-06-24 16:16:38.197	2026-06-24 16:16:38.197
8412	multiple_choice	「不便［な］」 (ふべん［な］) nghĩa là gì?	["inconvenient","theo ~ về","việc làm thêm","đủ"]	inconvenient	21	2026-06-24 16:16:38.199	2026-06-24 16:16:38.199
8413	multiple_choice	「すごい」 (すごい) nghĩa là gì?	["pay attention, take care","true","tất nhiên","giỏi, giỏi quá"]	giỏi, giỏi quá	21	2026-06-24 16:16:38.201	2026-06-24 16:16:38.201
8414	multiple_choice	「ほんとう」 (ほんとう) nghĩa là gì?	["Albert Einstein (1879-1955)","true","giao thông","Captain James Cook (1728-1779)"]	true	21	2026-06-24 16:16:38.202	2026-06-24 16:16:38.202
8415	multiple_choice	「うそ」 (うそ) nghĩa là gì?	["căn-gu-ru","giúp ích","true","lie"]	lie	21	2026-06-24 16:16:38.204	2026-06-24 16:16:38.204
8416	fill_in_blank	Điền hiragana cho: "nghĩ"	\N	おもいます	21	2026-06-24 16:16:38.206	2026-06-24 16:16:38.206
8417	fill_in_blank	Điền hiragana cho: "[commodity] prices"	\N	ほうそう	21	2026-06-24 16:16:38.208	2026-06-24 16:16:38.208
8418	fill_in_blank	Điền hiragana cho: "bài phát biểu"	\N	スピーチ	21	2026-06-24 16:16:38.209	2026-06-24 16:16:38.209
8419	fill_in_blank	Điền hiragana cho: "inconvenient"	\N	ふべん［な］	21	2026-06-24 16:16:38.211	2026-06-24 16:16:38.211
8420	fill_in_blank	Điền hiragana cho: "thủ tướng"	\N	しゅしょう	21	2026-06-24 16:16:38.215	2026-06-24 16:16:38.215
8421	multiple_choice	「着ます」 (きます) nghĩa là gì?	["put on (a shirt, etc.)","humor","convenience","kính"]	put on (a shirt, etc.)	22	2026-06-24 16:16:38.384	2026-06-24 16:16:38.384
8422	multiple_choice	「はきます」 (はきます) nghĩa là gì?	["tiền thuê nhà","put on (shoes, trousers, etc.)","chăn,đệm","kính"]	put on (shoes, trousers, etc.)	22	2026-06-24 16:16:38.387	2026-06-24 16:16:38.387
8423	multiple_choice	「かぶります」 (かぶります) nghĩa là gì?	["phòng ăn kiểu Nhật","Pa-ri","put on (a hat, etc.)","title of a fictitious questionnaire"]	put on (a hat, etc.)	22	2026-06-24 16:16:38.389	2026-06-24 16:16:38.389
8424	multiple_choice	「かけます［眼鏡を～］」 (かけます［めがねを～］) nghĩa là gì?	["kitchen with a dining area","put on [glasses]","Pa-ri","humor"]	put on [glasses]	22	2026-06-24 16:16:38.392	2026-06-24 16:16:38.392
8425	multiple_choice	「します［ネクタイを～］」 (します［ネクタイを～］) nghĩa là gì?	["put on [tie]","box lunch","put on (a shirt, etc.)","phòng ăn kiểu Nhật"]	put on [tie]	22	2026-06-24 16:16:38.395	2026-06-24 16:16:38.395
8426	multiple_choice	「生まれます」 (うまれます) nghĩa là gì?	["để tôi xem/ừ/thế nào nhỉ","put on [glasses]","sinh ra","put on (a shirt, etc.)"]	sinh ra	22	2026-06-24 16:16:38.398	2026-06-24 16:16:38.398
8427	multiple_choice	「わたしたち」 (わたしたち) nghĩa là gì?	["kính","sách trắng về sử dụng thời gian rảnh rỗi","cake","we"]	we	22	2026-06-24 16:16:38.402	2026-06-24 16:16:38.402
8428	multiple_choice	「コート」 (コート) nghĩa là gì?	["sinh ra","humor","áo khoác","convenience"]	áo khoác	22	2026-06-24 16:16:38.404	2026-06-24 16:16:38.404
8429	multiple_choice	「セーター」 (セーター) nghĩa là gì?	["we","áo len","robot","sinh ra"]	áo len	22	2026-06-24 16:16:38.406	2026-06-24 16:16:38.406
8430	multiple_choice	「スーツ」 (スーツ) nghĩa là gì?	["com-lê","thường","Trung tâm phát triển hoat động giải trí cho người dân","để tôi xem/ừ/thế nào nhỉ"]	com-lê	22	2026-06-24 16:16:38.408	2026-06-24 16:16:38.408
8431	multiple_choice	「帽子」 (ぼうし) nghĩa là gì?	["Are you looking for ～?","kitchen with a dining area","nón, mũ","kính"]	nón, mũ	22	2026-06-24 16:16:38.41	2026-06-24 16:16:38.41
8432	multiple_choice	「眼鏡」 (めがね) nghĩa là gì?	["cái này (cách nói lịch sử của “これ”)","kính","kitchen with a dining area","box lunch"]	kính	22	2026-06-24 16:16:38.412	2026-06-24 16:16:38.412
8433	multiple_choice	「ケーキ」 (ケーキ) nghĩa là gì?	["humor","chỗ để chăn gối trong ăn phòng kiểu Nhật","nón, mũ","cake"]	cake	22	2026-06-24 16:16:38.414	2026-06-24 16:16:38.414
8434	multiple_choice	「［お］弁当」 (［お］べんとう) nghĩa là gì?	["put on (shoes, trousers, etc.)","để tôi xem/ừ/thế nào nhỉ","box lunch","put on (a shirt, etc.)"]	box lunch	22	2026-06-24 16:16:38.416	2026-06-24 16:16:38.416
8435	multiple_choice	「ロボット」 (ロボット) nghĩa là gì?	["áo khoác","Vạn lý trường thành","áo len","robot"]	robot	22	2026-06-24 16:16:38.418	2026-06-24 16:16:38.418
8436	fill_in_blank	Điền hiragana cho: "kính"	\N	めがね	22	2026-06-24 16:16:38.419	2026-06-24 16:16:38.419
8437	fill_in_blank	Điền hiragana cho: "chăn,đệm"	\N	ふとん	22	2026-06-24 16:16:38.421	2026-06-24 16:16:38.421
8438	fill_in_blank	Điền hiragana cho: "we"	\N	わたしたち	22	2026-06-24 16:16:38.423	2026-06-24 16:16:38.423
8439	fill_in_blank	Điền hiragana cho: "Trung tâm phát triển hoat động giải trí cho người dân"	\N	よかかいはつセンター	22	2026-06-24 16:16:38.424	2026-06-24 16:16:38.424
8440	fill_in_blank	Điền hiragana cho: "Vạn lý trường thành"	\N	ばんりの ちょうじょう	22	2026-06-24 16:16:38.426	2026-06-24 16:16:38.426
8441	multiple_choice	「聞きます［先生に～］」 (ききます［せんせいに～］) nghĩa là gì?	["hot water","hỏng","ask [the teacher]","person of ～ shop"]	ask [the teacher]	23	2026-06-24 16:16:38.59	2026-06-24 16:16:38.59
8442	multiple_choice	「回します」 (まわします) nghĩa là gì?	["cầu","chuyển nhà","a fictitious bus stop","vặn (nút)"]	vặn (nút)	23	2026-06-24 16:16:38.591	2026-06-24 16:16:38.591
8443	multiple_choice	「引きます」 (ひきます) nghĩa là gì?	["tòa nhà","person of ～ shop","kéo","New Year's Day"]	kéo	23	2026-06-24 16:16:38.593	2026-06-24 16:16:38.593
8444	multiple_choice	「変えます」 (かえます) nghĩa là gì?	["tòa nhà","đèn tín hiệu","đổi","cỡ, kích thước"]	đổi	23	2026-06-24 16:16:38.595	2026-06-24 16:16:38.595
8445	multiple_choice	「触ります［ドアに～］」 (さわります［ドアに～］) nghĩa là gì?	["cửa hàng đồ điện","đi bộ (trên đường)","touch [a door]","ngã tư"]	touch [a door]	23	2026-06-24 16:16:38.597	2026-06-24 16:16:38.597
8446	multiple_choice	「出ます［お釣りが～］」 (でます［おつりが～］) nghĩa là gì?	["a fictitious station","cầu","the -th (indicating order)","[change] come out"]	[change] come out	23	2026-06-24 16:16:38.6	2026-06-24 16:16:38.6
8447	multiple_choice	「歩きます」 (あるきます) nghĩa là gì?	["đi bộ (trên đường)","New Year's Day","turn [to the right]","cầu"]	đi bộ (trên đường)	23	2026-06-24 16:16:38.602	2026-06-24 16:16:38.602
8448	multiple_choice	「渡ります［橋を～］」 (わたります［はしを～］) nghĩa là gì?	["person of ～ shop","âm thanh","cross [a bridge]","cửa hàng đồ điện"]	cross [a bridge]	23	2026-06-24 16:16:38.604	2026-06-24 16:16:38.604
8449	multiple_choice	「曲がります［右へ～］」 (まがります［みぎへ～］) nghĩa là gì?	["tòa nhà","đổi","cầu","turn [to the right]"]	turn [to the right]	23	2026-06-24 16:16:38.605	2026-06-24 16:16:38.605
8450	multiple_choice	「寂しい」 (さびしい) nghĩa là gì?	["đi bộ (trên đường)","a fictitious bus stop","chuyển nhà","lonely"]	lonely	23	2026-06-24 16:16:38.606	2026-06-24 16:16:38.606
8451	multiple_choice	「［お］湯」 (［お］ゆ) nghĩa là gì?	["chuyển nhà","[a watch] move, work","New Year's Day","hot water"]	hot water	23	2026-06-24 16:16:38.608	2026-06-24 16:16:38.608
8452	multiple_choice	「音」 (おと) nghĩa là gì?	["đi bộ (trên đường)","âm thanh","tòa nhà","thẻ đăng kí người nước ngoài / thẻ đăng kí ngoại kiều"]	âm thanh	23	2026-06-24 16:16:38.609	2026-06-24 16:16:38.609
8453	multiple_choice	「サイズ」 (サイズ) nghĩa là gì?	["cỡ, kích thước","máy móc","hỏng","turn [to the right]"]	cỡ, kích thước	23	2026-06-24 16:16:38.61	2026-06-24 16:16:38.61
8454	multiple_choice	「故障」 (こしょう) nghĩa là gì?	["touch [a door]","vặn (nút)","Prince Shotoku (574-622)","hỏng"]	hỏng	23	2026-06-24 16:16:38.613	2026-06-24 16:16:38.613
8455	multiple_choice	「道」 (みち) nghĩa là gì?	["person of ～ shop","tòa nhà","New Year's Day","đường"]	đường	23	2026-06-24 16:16:38.614	2026-06-24 16:16:38.614
8456	fill_in_blank	Điền hiragana cho: "pay attention [to cars], take care"	\N	きを つけます［くるまに～］	23	2026-06-24 16:16:38.616	2026-06-24 16:16:38.616
8457	fill_in_blank	Điền hiragana cho: "a fictitious station"	\N	ほんだえき	23	2026-06-24 16:16:38.618	2026-06-24 16:16:38.618
8458	fill_in_blank	Điền hiragana cho: "thẻ đăng kí người nước ngoài / thẻ đăng kí ngoại kiều"	\N	がいこくじんとうろくしょう	23	2026-06-24 16:16:38.62	2026-06-24 16:16:38.62
8459	fill_in_blank	Điền hiragana cho: "hot water"	\N	［お］ゆ	23	2026-06-24 16:16:38.621	2026-06-24 16:16:38.621
8460	fill_in_blank	Điền hiragana cho: "núm vặn"	\N	つまみ	23	2026-06-24 16:16:38.623	2026-06-24 16:16:38.623
8461	multiple_choice	「くれます」 (くれます) nghĩa là gì?	["ngoài ra, bên cạnh đó","dẫn đến","cho, tặng(tôi)","station wagon"]	cho, tặng(tôi)	24	2026-06-24 16:16:38.762	2026-06-24 16:16:38.762
8462	multiple_choice	「直します」 (なおします) nghĩa là gì?	["cho, tặng(tôi)","dẫn đi","escort [someone], go with","repair, correct"]	repair, correct	24	2026-06-24 16:16:38.765	2026-06-24 16:16:38.765
8463	multiple_choice	「連れて 行きます」 (つれて いきます) nghĩa là gì?	["tự mình","dẫn đến","dẫn đi","grandfather, old man"]	dẫn đi	24	2026-06-24 16:16:38.767	2026-06-24 16:16:38.767
8464	multiple_choice	「連れて 来ます」 (つれて きます) nghĩa là gì?	["ý nghĩa","dẫn đến","cho, tặng(tôi)","sweets, snacks"]	dẫn đến	24	2026-06-24 16:16:38.77	2026-06-24 16:16:38.77
8465	multiple_choice	「送ります［人を～］」 (おくります［ひとを～］) nghĩa là gì?	["chuẩn bị","grandfather, old man","escort [someone], go with","homestay"]	escort [someone], go with	24	2026-06-24 16:16:38.772	2026-06-24 16:16:38.772
8466	multiple_choice	「紹介します」 (しょうかいします) nghĩa là gì?	["cho, tặng(tôi)","giới thiệu","tự mình","escort [someone], go with"]	giới thiệu	24	2026-06-24 16:16:38.773	2026-06-24 16:16:38.773
8467	multiple_choice	「案内します」 (あんないします) nghĩa là gì?	["hướng dẫn, chỉ đường","tự mình","repair, correct","escort [someone], go with"]	hướng dẫn, chỉ đường	24	2026-06-24 16:16:38.775	2026-06-24 16:16:38.775
8468	multiple_choice	「説明します」 (せつめいします) nghĩa là gì?	["giải thích, trình bày","giới thiệu","ý nghĩa","repair, correct"]	giải thích, trình bày	24	2026-06-24 16:16:38.777	2026-06-24 16:16:38.777
8469	multiple_choice	「おじいさん／おじいちゃん」 (おじいさん／おじいちゃん) nghĩa là gì?	["ngoài ra, bên cạnh đó","grandfather, old man","sweets, snacks","station wagon"]	grandfather, old man	24	2026-06-24 16:16:38.781	2026-06-24 16:16:38.781
8470	multiple_choice	「おばあさん／おばあちゃん」 (おばあさん／おばあちゃん) nghĩa là gì?	["hướng dẫn, chỉ đường","tự mình","grandmother, old woman","repair, correct"]	grandmother, old woman	24	2026-06-24 16:16:38.783	2026-06-24 16:16:38.783
8471	multiple_choice	「準備」 (じゅんび) nghĩa là gì?	["chuẩn bị","giải thích, trình bày","box lunch","dẫn đến"]	chuẩn bị	24	2026-06-24 16:16:38.784	2026-06-24 16:16:38.784
8472	multiple_choice	「引っ越し」 (ひっこし) nghĩa là gì?	["moving out (～［を］します : move out)","dẫn đi","cho, tặng(tôi)","ý nghĩa"]	moving out (～［を］します : move out)	24	2026-06-24 16:16:38.786	2026-06-24 16:16:38.786
8473	multiple_choice	「［お］菓子」 (［お］かし) nghĩa là gì?	["chuẩn bị","grandfather, old man","sweets, snacks","station wagon"]	sweets, snacks	24	2026-06-24 16:16:38.788	2026-06-24 16:16:38.788
8474	multiple_choice	「ホームステイ」 (ホームステイ) nghĩa là gì?	["homestay","moving out (～［を］します : move out)","giới thiệu","box lunch"]	homestay	24	2026-06-24 16:16:38.79	2026-06-24 16:16:38.79
8475	multiple_choice	「全部」 (ぜんぶ) nghĩa là gì?	["toàn bộ, tất cả","escort [someone], go with","repair, correct","cho, tặng(tôi)"]	toàn bộ, tất cả	24	2026-06-24 16:16:38.792	2026-06-24 16:16:38.792
8476	fill_in_blank	Điền hiragana cho: "dẫn đi"	\N	つれて いきます	24	2026-06-24 16:16:38.793	2026-06-24 16:16:38.793
8477	fill_in_blank	Điền hiragana cho: "giải thích, trình bày"	\N	せつめいします	24	2026-06-24 16:16:38.796	2026-06-24 16:16:38.796
8478	fill_in_blank	Điền hiragana cho: "giới thiệu"	\N	しょうかいします	24	2026-06-24 16:16:38.799	2026-06-24 16:16:38.799
8479	fill_in_blank	Điền hiragana cho: "tự mình"	\N	じぶんで	24	2026-06-24 16:16:38.801	2026-06-24 16:16:38.801
8480	fill_in_blank	Điền hiragana cho: "moving out (～［を］します : move out)"	\N	ひっこし	24	2026-06-24 16:16:38.802	2026-06-24 16:16:38.802
8481	multiple_choice	「考えます」 (かんがえます) nghĩa là gì?	["free time","Let's have a drink together","however ～, even if ～","nghĩ, suy nghĩ"]	nghĩ, suy nghĩ	25	2026-06-24 16:16:38.906	2026-06-24 16:16:38.906
8482	multiple_choice	「着きます」 (つきます) nghĩa là gì?	["meaning","arrive","Please take care of yourself. (said when expecting a long separation)","việc chuyển địa điểm làm việc"]	arrive	25	2026-06-24 16:16:38.908	2026-06-24 16:16:38.908
8483	multiple_choice	「取ります［年を～］」 (とります［としを～］) nghĩa là gì?	["free time","grow old","however ～, even if ～","quê, nông thôn"]	grow old	25	2026-06-24 16:16:38.91	2026-06-24 16:16:38.91
8484	multiple_choice	「足ります」 (たります) nghĩa là gì?	["Vietnam","cơ hội","be enough, be sufficient","cố, cố gắng"]	be enough, be sufficient	25	2026-06-24 16:16:38.913	2026-06-24 16:16:38.913
8485	multiple_choice	「田舎」 (いなか) nghĩa là gì?	["Vietnam","however ～, even if ～","việc (~のこと: việc ~)","quê, nông thôn"]	quê, nông thôn	25	2026-06-24 16:16:38.915	2026-06-24 16:16:38.915
8486	multiple_choice	「チャンス」 (チャンス) nghĩa là gì?	["cố, cố gắng","việc chuyển địa điểm làm việc","cơ hội","Let's have a drink together"]	cơ hội	25	2026-06-24 16:16:38.917	2026-06-24 16:16:38.917
8487	multiple_choice	「億」 (おく) nghĩa là gì?	["Please take care of yourself. (said when expecting a long separation)","bên trong cùng, phía sâu bên trong","cố, cố gắng","nhóm, đoàn"]	bên trong cùng, phía sâu bên trong	25	2026-06-24 16:16:38.918	2026-06-24 16:16:38.918
8488	multiple_choice	「もし［～たら］」 (もし［～たら］) nghĩa là gì?	["việc chuyển địa điểm làm việc","cố, cố gắng","if","nghĩ, suy nghĩ"]	if	25	2026-06-24 16:16:38.92	2026-06-24 16:16:38.92
8489	multiple_choice	「意味」 (いみ) nghĩa là gì?	["free time","du học","if","meaning"]	meaning	25	2026-06-24 16:16:38.921	2026-06-24 16:16:38.921
8490	multiple_choice	「もしもし」 (もしもし) nghĩa là gì?	["quê, nông thôn","hello (used on the phone)","đại sứ quán","việc chuyển địa điểm làm việc"]	hello (used on the phone)	25	2026-06-24 16:16:38.923	2026-06-24 16:16:38.923
8491	multiple_choice	「転勤」 (てんきん) nghĩa là gì?	["cơ hội","arrive","việc chuyển địa điểm làm việc","grow old"]	việc chuyển địa điểm làm việc	25	2026-06-24 16:16:38.924	2026-06-24 16:16:38.924
8492	multiple_choice	「こと」 (こと) nghĩa là gì?	["Please take care of yourself. (said when expecting a long separation)","nhóm, đoàn","nghĩ, suy nghĩ","việc (~のこと: việc ~)"]	việc (~のこと: việc ~)	25	2026-06-24 16:16:38.926	2026-06-24 16:16:38.926
8493	multiple_choice	「暇」 (ひま) nghĩa là gì?	["Vietnam","cơ hội","free time","việc (~のこと: việc ~)"]	free time	25	2026-06-24 16:16:38.93	2026-06-24 16:16:38.93
8494	multiple_choice	「［いろいろ］お世話に なりました。」 (［いろいろ］おせわに なりました。) nghĩa là gì?	["if","however ～, even if ～","Thank you for everything you've done for me.","nghĩ, suy nghĩ"]	Thank you for everything you've done for me.	25	2026-06-24 16:16:38.932	2026-06-24 16:16:38.932
8495	multiple_choice	「頑張ります」 (がんばります) nghĩa là gì?	["however ～, even if ～","việc (~のこと: việc ~)","du học","cố, cố gắng"]	cố, cố gắng	25	2026-06-24 16:16:38.935	2026-06-24 16:16:38.935
8496	fill_in_blank	Điền hiragana cho: "Please take care of yourself. (said when expecting a long separation)"	\N	どうぞ おげんきで。	25	2026-06-24 16:16:38.937	2026-06-24 16:16:38.937
8497	fill_in_blank	Điền hiragana cho: "be enough, be sufficient"	\N	たります	25	2026-06-24 16:16:38.938	2026-06-24 16:16:38.938
8498	fill_in_blank	Điền hiragana cho: "nhóm, đoàn"	\N	グループ	25	2026-06-24 16:16:38.94	2026-06-24 16:16:38.94
8499	fill_in_blank	Điền hiragana cho: "cố, cố gắng"	\N	がんばります	25	2026-06-24 16:16:38.941	2026-06-24 16:16:38.941
8500	fill_in_blank	Điền hiragana cho: "if"	\N	もし［～たら］	25	2026-06-24 16:16:38.942	2026-06-24 16:16:38.942
8501	multiple_choice	「見ます、診ます」 (みます) nghĩa là gì?	["ở đâu cũng","xem, khám bệnh","wallet, purse","đăng ký"]	xem, khám bệnh	26	2026-06-24 16:16:39.153	2026-06-24 16:16:39.153
8502	multiple_choice	「探します、捜します」 (さがします) nghĩa là gì?	["attend [a party]","Japanese astronaut (1968-)","tìm, tìm kiếm","địa điểm"]	tìm, tìm kiếm	26	2026-06-24 16:16:39.155	2026-06-24 16:16:39.155
8503	multiple_choice	「遅れます［時間に～］」 (おくれます［じかんに～］) nghĩa là gì?	["be late [for an appointment, etc.]","Japanese astronaut (1968-)","~ như thế này","công ty ~"]	be late [for an appointment, etc.]	26	2026-06-24 16:16:39.157	2026-06-24 16:16:39.157
8504	multiple_choice	「間に 合います［時間に～］」 (まに あいます［じかんに～］) nghĩa là gì?	["be in time [for an appointment, etc.]","làm","Judo (nhu đạo)","~ như thế đó (gần người nghe)"]	be in time [for an appointment, etc.]	26	2026-06-24 16:16:39.158	2026-06-24 16:16:39.158
8505	multiple_choice	「やります」 (やります) nghĩa là gì?	["fictitious store","be different","Monday, Wednesday and Friday","làm"]	làm	26	2026-06-24 16:16:39.16	2026-06-24 16:16:39.16
8506	multiple_choice	「拾います」 (ひろいます) nghĩa là gì?	["the Diet Building","pick up","công ty ~","fictitious store"]	pick up	26	2026-06-24 16:16:39.163	2026-06-24 16:16:39.163
8507	multiple_choice	「連絡します」 (れんらくします) nghĩa là gì?	["the Diet Building","~ như thế này","liên lạc","có thời gian, thuận tiện"]	liên lạc	26	2026-06-24 16:16:39.165	2026-06-24 16:16:39.165
8508	multiple_choice	「気分が いい」 (きぶんが いい) nghĩa là gì?	["hot water","fictitious store","cái chai","cảm thấy tốt, cảm thấy khỏe"]	cảm thấy tốt, cảm thấy khỏe	26	2026-06-24 16:16:39.168	2026-06-24 16:16:39.168
8509	multiple_choice	「気分が 悪い」 (きぶんが わるい) nghĩa là gì?	["nơi để","be late [for an appointment, etc.]","be different","cảm thấy không tốt, cảm thấy mệt"]	cảm thấy không tốt, cảm thấy mệt	26	2026-06-24 16:16:39.169	2026-06-24 16:16:39.169
8510	multiple_choice	「運動会」 (うんどうかい) nghĩa là gì?	["flea market","làm","hội thi thể thao","rác"]	hội thi thể thao	26	2026-06-24 16:16:39.171	2026-06-24 16:16:39.171
8511	multiple_choice	「盆踊り」 (ぼんおどり) nghĩa là gì?	["hot water","làm","space station","Bon Festival dance"]	Bon Festival dance	26	2026-06-24 16:16:39.172	2026-06-24 16:16:39.172
8512	multiple_choice	「フリーマーケット」 (フリーマーケット) nghĩa là gì?	["burnable rubbish","flea market","tìm, tìm kiếm","nhà du hành vũ trụ người Nhật (1954- )"]	flea market	26	2026-06-24 16:16:39.174	2026-06-24 16:16:39.174
8513	multiple_choice	「場所」 (ばしょ) nghĩa là gì?	["nơi để","khác","địa điểm","cảm thấy tốt, cảm thấy khỏe"]	địa điểm	26	2026-06-24 16:16:39.176	2026-06-24 16:16:39.176
8514	multiple_choice	「ボランティア」 (ボランティア) nghĩa là gì?	["tình nguyện viên","không có thời gian, bận, không thuận tiện","be late [for an appointment, etc.]","Japanese astronaut (1968-)"]	tình nguyện viên	26	2026-06-24 16:16:39.178	2026-06-24 16:16:39.178
8515	multiple_choice	「財布」 (さいふ) nghĩa là gì?	["wallet, purse","ở đâu cũng","tình nguyện viên","ga"]	wallet, purse	26	2026-06-24 16:16:39.181	2026-06-24 16:16:39.181
8516	fill_in_blank	Điền hiragana cho: "có thời gian, thuận tiện"	\N	つごうが いい	26	2026-06-24 16:16:39.182	2026-06-24 16:16:39.182
8517	fill_in_blank	Điền hiragana cho: "attend [a party]"	\N	さんかします［パーティーに～］	26	2026-06-24 16:16:39.184	2026-06-24 16:16:39.184
8518	fill_in_blank	Điền hiragana cho: "khác"	\N	べつの	26	2026-06-24 16:16:39.185	2026-06-24 16:16:39.185
8519	fill_in_blank	Điền hiragana cho: "tìm, tìm kiếm"	\N	さがします	26	2026-06-24 16:16:39.187	2026-06-24 16:16:39.187
8520	fill_in_blank	Điền hiragana cho: "liên lạc"	\N	れんらくします	26	2026-06-24 16:16:39.188	2026-06-24 16:16:39.188
8521	multiple_choice	「飼います」 (かいます) nghĩa là gì?	["nuôi,chăn nuôi","sóng","tiếng,giọng nói","chỉ"]	nuôi,chăn nuôi	27	2026-06-24 16:16:39.423	2026-06-24 16:16:39.423
8522	multiple_choice	「走ります［道を～］」 (はしります［みちを～］) nghĩa là gì?	["thú cưng,động vật nuôi","run, drive [along a road]","clearly","like very much"]	run, drive [along a road]	27	2026-06-24 16:16:39.424	2026-06-24 16:16:39.424
8523	multiple_choice	「見えます［山が～］」 (みえます［やまが～］) nghĩa là gì?	["person (respectful of ひと)","other","[a mountain] can be seen","bọn trẻ"]	[a mountain] can be seen	27	2026-06-24 16:16:39.425	2026-06-24 16:16:39.425
8524	multiple_choice	「聞こえます［音が～］」 (きこえます［おとが～］) nghĩa là gì?	["nuôi,chăn nuôi","sóng","sân bay Kansai","[a sound] can be heard"]	[a sound] can be heard	27	2026-06-24 16:16:39.429	2026-06-24 16:16:39.429
8525	multiple_choice	「できます［道が～］」 (できます［みちが～］) nghĩa là gì?	["đô-rê-mon","kệ sách,giá sách","[a road] be made, be completed, come into existence","nhà bếp"]	[a road] be made, be completed, come into existence	27	2026-06-24 16:16:39.431	2026-06-24 16:16:39.431
8526	multiple_choice	「開きます［教室を～］」 (ひらきます［きょうしつを～］) nghĩa là gì?	["bầu trời","almost all (in affirmative sentences), hardly, scarcely (in negative sentences)","nuôi,chăn nuôi","set up [a class], open, hold"]	set up [a class], open, hold	27	2026-06-24 16:16:39.433	2026-06-24 16:16:39.433
8527	multiple_choice	「心配［な］」 (しんぱい［な］) nghĩa là gì?	["worried, anxious","xây dựng","bọn trẻ","thú cưng,động vật nuôi"]	worried, anxious	27	2026-06-24 16:16:39.435	2026-06-24 16:16:39.435
8528	multiple_choice	「ペット」 (ペット) nghĩa là gì?	["nhà bếp","worried, anxious","person (respectful of ひと)","thú cưng,động vật nuôi"]	thú cưng,động vật nuôi	27	2026-06-24 16:16:39.436	2026-06-24 16:16:39.436
8529	multiple_choice	「鳥」 (とり) nghĩa là gì?	["other","bọn trẻ","chim","một đảo thuộc tỉnh Shizuoka"]	chim	27	2026-06-24 16:16:39.438	2026-06-24 16:16:39.438
8530	multiple_choice	「声」 (こえ) nghĩa là gì?	["tiếng,giọng nói","dụng cụ","sóng","sân bay Kansai"]	tiếng,giọng nói	27	2026-06-24 16:16:39.439	2026-06-24 16:16:39.439
8531	multiple_choice	「波」 (なみ) nghĩa là gì?	["tương lai","sóng","nuôi,chăn nuôi","tiếng,giọng nói"]	sóng	27	2026-06-24 16:16:39.44	2026-06-24 16:16:39.44
8532	multiple_choice	「花火」 (はなび) nghĩa là gì?	["bầu trời","máy bán hàng tự động","chỉ","pháo hoa"]	pháo hoa	27	2026-06-24 16:16:39.442	2026-06-24 16:16:39.442
8533	multiple_choice	「道具」 (どうぐ) nghĩa là gì?	["thương mại viễn thông","sóng","truyện tranh","dụng cụ"]	dụng cụ	27	2026-06-24 16:16:39.444	2026-06-24 16:16:39.444
8534	multiple_choice	「クリーニング」 (クリーニング) nghĩa là gì?	["mơ","giặt ủi","person (respectful of ひと)","bầu trời"]	giặt ủi	27	2026-06-24 16:16:39.448	2026-06-24 16:16:39.448
8535	multiple_choice	「家」 (いえ) nghĩa là gì?	["truyện tranh","run, drive [along a road]","nhà","người máy"]	nhà	27	2026-06-24 16:16:39.45	2026-06-24 16:16:39.45
8536	fill_in_blank	Điền hiragana cho: "fantastic, mysterious"	\N	ふしぎ［な］	27	2026-06-24 16:16:39.452	2026-06-24 16:16:39.452
8537	fill_in_blank	Điền hiragana cho: "sóng"	\N	なみ	27	2026-06-24 16:16:39.453	2026-06-24 16:16:39.453
8538	fill_in_blank	Điền hiragana cho: "bầu trời"	\N	そら	27	2026-06-24 16:16:39.455	2026-06-24 16:16:39.455
8539	fill_in_blank	Điền hiragana cho: "chỉ"	\N	～しか	27	2026-06-24 16:16:39.456	2026-06-24 16:16:39.456
8540	fill_in_blank	Điền hiragana cho: "phong cảnh"	\N	けしき	27	2026-06-24 16:16:39.458	2026-06-24 16:16:39.458
8541	multiple_choice	「売れます［パンが～］」 (うれます［パンが～］) nghĩa là gì?	["[bread] sell, be sold","tiểu thuyết","tập quán","nhảy"]	[bread] sell, be sold	28	2026-06-24 16:16:39.65	2026-06-24 16:16:39.65
8542	multiple_choice	「踊ります」 (おどります) nghĩa là gì?	["I have a [small] favor to ask.","nhảy","ngoài ra","ca sĩ"]	nhảy	28	2026-06-24 16:16:39.651	2026-06-24 16:16:39.651
8543	multiple_choice	「かみます」 (かみます) nghĩa là gì?	["well, let me see, hmm...","nhai,cắn","con trai(dùng cho người khác)","ngày"]	nhai,cắn	28	2026-06-24 16:16:39.653	2026-06-24 16:16:39.653
8544	multiple_choice	「選びます」 (えらびます) nghĩa là gì?	["giá cả","sức mạnh","lựa, lựa chọn","vĩ đại, kính trọng"]	lựa, lựa chọn	28	2026-06-24 16:16:39.655	2026-06-24 16:16:39.655
8545	multiple_choice	「通います［大学に～］」 (かよいます［だいがくに～］) nghĩa là gì?	["thông báo","con trai(dùng cho mình)","go to and from [university]","tiểu thuyết gia, nhà văn"]	go to and from [university]	28	2026-06-24 16:16:39.657	2026-06-24 16:16:39.657
8546	multiple_choice	「メモします」 (メモします) nghĩa là gì?	["kinh nghiệm","chương trình(truyền hình,phát thanh,..)","người quản lí","ghi chép lại,ghi lại"]	ghi chép lại,ghi lại	28	2026-06-24 16:16:39.659	2026-06-24 16:16:39.659
8547	multiple_choice	「まじめ［な］」 (まじめ［な］) nghĩa là gì?	["kịch,phim truyền hình","hair salon","[bread] sell, be sold","serious"]	serious	28	2026-06-24 16:16:39.661	2026-06-24 16:16:39.661
8548	multiple_choice	「熱心［な］」 (ねっしん［な］) nghĩa là gì?	["con trai(dùng cho người khác)","vừa đúng,vừa vặn","tập quán","earnest"]	earnest	28	2026-06-24 16:16:39.664	2026-06-24 16:16:39.664
8549	multiple_choice	「偉い」 (えらい) nghĩa là gì?	["vĩ đại, kính trọng","vị","be different","kitchen"]	vĩ đại, kính trọng	28	2026-06-24 16:16:39.666	2026-06-24 16:16:39.666
8550	multiple_choice	「ちょうど いい」 (ちょうど いい) nghĩa là gì?	["vị","chương trình(truyền hình,phát thanh,..)","thường, thông thường","vừa đúng,vừa vặn"]	vừa đúng,vừa vặn	28	2026-06-24 16:16:39.668	2026-06-24 16:16:39.668
8551	multiple_choice	「景色」 (けしき) nghĩa là gì?	["-er, -ist, etc. (e.g. painter, novelist)","kinh nghiệm","scenery, view","giá cả"]	scenery, view	28	2026-06-24 16:16:39.67	2026-06-24 16:16:39.67
8552	multiple_choice	「美容院」 (びよういん) nghĩa là gì?	["earnest","scenery, view","hair salon","do đó"]	hair salon	28	2026-06-24 16:16:39.672	2026-06-24 16:16:39.672
8553	multiple_choice	「台所」 (だいどころ) nghĩa là gì?	["(computer) game","một khoảng thời gian ngắn, một chút, một lát","kitchen","lương"]	kitchen	28	2026-06-24 16:16:39.674	2026-06-24 16:16:39.674
8554	multiple_choice	「経験」 (けいけん) nghĩa là gì?	["kinh nghiệm","ngoài ra","kitchen","vừa đúng,vừa vặn"]	kinh nghiệm	28	2026-06-24 16:16:39.677	2026-06-24 16:16:39.677
8555	multiple_choice	「力」 (ちから) nghĩa là gì?	["nhảy","màu","sức mạnh","chương trình(truyền hình,phát thanh,..)"]	sức mạnh	28	2026-06-24 16:16:39.68	2026-06-24 16:16:39.68
8556	fill_in_blank	Điền hiragana cho: "earnest"	\N	ねっしん［な］	28	2026-06-24 16:16:39.682	2026-06-24 16:16:39.682
8557	fill_in_blank	Điền hiragana cho: "lựa, lựa chọn"	\N	えらびます	28	2026-06-24 16:16:39.684	2026-06-24 16:16:39.684
8558	fill_in_blank	Điền hiragana cho: "con gái(dùng cho mình)"	\N	むすめ	28	2026-06-24 16:16:39.686	2026-06-24 16:16:39.686
8559	fill_in_blank	Điền hiragana cho: "con trai(dùng cho mình)"	\N	むすこ	28	2026-06-24 16:16:39.688	2026-06-24 16:16:39.688
8560	fill_in_blank	Điền hiragana cho: "hình dáng"	\N	かたち	28	2026-06-24 16:16:39.69	2026-06-24 16:16:39.69
8561	multiple_choice	「開きます［ドアが～］」 (あきます［ドアが～］) nghĩa là gì?	["[a door] open","[a door] close, shut","this neighborhood, around here","name of a station/district in Tokyo"]	[a door] open	29	2026-06-24 16:16:39.89	2026-06-24 16:16:39.89
8562	multiple_choice	「閉まりる［ドアが～］」 (しまります［ドアが～］) nghĩa là gì?	["túi","giá để hành lý","diễn văn","[a door] close, shut"]	[a door] close, shut	29	2026-06-24 16:16:39.892	2026-06-24 16:16:39.892
8563	multiple_choice	「つきます［電気が～］」 (つきます［でんきが～］) nghĩa là gì?	["tiểu thuyết được viết thời heian","[a light] come on, be turned on","trước ga","[a chair] break"]	[a light] come on, be turned on	29	2026-06-24 16:16:39.895	2026-06-24 16:16:39.895
8564	multiple_choice	「消えます［電気が～］」 (きえます［でんきが～］) nghĩa là gì?	["thay(pin)","[Oh,] that's great!/Thank goodness! (used to express a feeling of relief)","[a light] go off","bức tường"]	[a light] go off	29	2026-06-24 16:16:39.898	2026-06-24 16:16:39.898
8565	multiple_choice	「壊れます［いすが～］」 (こわれます［いすが～］) nghĩa là gì?	["[a car] stop, park","[a chair] break","trước ga","name of a place in Kobe"]	[a chair] break	29	2026-06-24 16:16:39.901	2026-06-24 16:16:39.901
8566	multiple_choice	「割れます［コップが～］」 (われます［コップが～］) nghĩa là gì?	["[a car] stop, park","[a glass] break, smash","this neighborhood, around here","nhầm lẫn,sai"]	[a glass] break, smash	29	2026-06-24 16:16:39.903	2026-06-24 16:16:39.903
8567	multiple_choice	「折れます［木が～］」 (おれます［きが～］) nghĩa là gì?	["[a tree] break, snap","bức tường","đồn cảnh sát,bốt cảnh sát","plate, dish"]	[a tree] break, snap	29	2026-06-24 16:16:39.906	2026-06-24 16:16:39.906
8568	multiple_choice	「破れます［紙が～］」 (やぶれます［かみが～］) nghĩa là gì?	["túi","name of a station in Tokyo","[paper] tear","[a light] come on, be turned on"]	[paper] tear	29	2026-06-24 16:16:39.908	2026-06-24 16:16:39.908
8569	multiple_choice	「汚れます［服が～］」 (よごれます［ふくが～］) nghĩa là gì?	["[a door] close, shut","[clothes] get dirty","làm rơi,rớt","trước ga"]	[clothes] get dirty	29	2026-06-24 16:16:39.914	2026-06-24 16:16:39.914
8570	multiple_choice	「付きます［ポケットが～］」 (つきます［ポケットが～］) nghĩa là gì?	["nhầm lẫn,sai","cháy","direction","[a pocket] be attached"]	[a pocket] be attached	29	2026-06-24 16:16:39.918	2026-06-24 16:16:39.918
8571	multiple_choice	「外れます［ボタンが～］」 (はずれます［ボタンが～］) nghĩa là gì?	["[a button] be undone","[a pocket] be attached","direction of ～","thay(pin)"]	[a button] be undone	29	2026-06-24 16:16:39.921	2026-06-24 16:16:39.921
8572	multiple_choice	「止まります［車が～］」 (とまります［くるまが～］) nghĩa là gì?	["[a car] stop, park","[a door] open","chỉ","[a road] get crowded"]	[a car] stop, park	29	2026-06-24 16:16:39.924	2026-06-24 16:16:39.924
8573	multiple_choice	「まちがえます」 (まちがえます) nghĩa là gì?	["plate, dish","nhầm lẫn,sai","tiểu thuyết được viết thời heian","name of a station/district in Tokyo"]	nhầm lẫn,sai	29	2026-06-24 16:16:39.927	2026-06-24 16:16:39.927
8574	multiple_choice	「落します」 (おとします) nghĩa là gì?	["wallet, purse","làm rơi,rớt","[a door] open","[a chair] break"]	làm rơi,rớt	29	2026-06-24 16:16:39.931	2026-06-24 16:16:39.931
8575	multiple_choice	「掛かります［かぎが～］」 (かかります［かぎが～］) nghĩa là gì?	["be locked","túi","nhầm lẫn,sai","trả lời"]	be locked	29	2026-06-24 16:16:39.934	2026-06-24 16:16:39.934
8576	fill_in_blank	Điền hiragana cho: "đồ bỏ quên"	\N	わすれもの	29	2026-06-24 16:16:39.936	2026-06-24 16:16:39.936
8577	fill_in_blank	Điền hiragana cho: "[a light] go off"	\N	きえます［でんきが～］	29	2026-06-24 16:16:39.938	2026-06-24 16:16:39.938
8578	fill_in_blank	Điền hiragana cho: "chắc là"	\N	たしか	29	2026-06-24 16:16:39.941	2026-06-24 16:16:39.941
8579	fill_in_blank	Điền hiragana cho: "kim đồng hồ"	\N	はり	29	2026-06-24 16:16:39.946	2026-06-24 16:16:39.946
8580	fill_in_blank	Điền hiragana cho: "diễn văn"	\N	スピーチ	29	2026-06-24 16:16:39.951	2026-06-24 16:16:39.951
8581	multiple_choice	「はります」 (はります) nghĩa là gì?	["dán","hành lang","sau đó, tiếp đó","bài giảng"]	dán	30	2026-06-24 16:16:40.252	2026-06-24 16:16:40.252
8582	multiple_choice	「掛けます」 (かけます) nghĩa là gì?	["emergency","bài giảng","trạm cảnh sát","treo"]	treo	30	2026-06-24 16:16:40.262	2026-06-24 16:16:40.262
8583	multiple_choice	「飾ります」 (かざります) nghĩa là gì?	["trang trí","torch, flashlight","dọn dẹp, sắp xếp","ngăn kéo"]	trang trí	30	2026-06-24 16:16:40.269	2026-06-24 16:16:40.269
8584	multiple_choice	「並べます」 (ならべます) nghĩa là gì?	["xung quanh","lịch, tờ lịch","xếp thành hàng","hi vọng, nguyện vọng"]	xếp thành hàng	30	2026-06-24 16:16:40.279	2026-06-24 16:16:40.279
8585	multiple_choice	「植えます」 (うえます) nghĩa là gì?	["torch, flashlight","ngăn kéo","trồng (cây)","tròn"]	trồng (cây)	30	2026-06-24 16:16:40.285	2026-06-24 16:16:40.285
8586	multiple_choice	「戻します」 (もどします) nghĩa là gì?	["torch, flashlight","thời khóa biểu, lịch","bản thông báo","đưa về, trả về"]	đưa về, trả về	30	2026-06-24 16:16:40.291	2026-06-24 16:16:40.291
8587	multiple_choice	「まとめます」 (まとめます) nghĩa là gì?	["sau đó, tiếp đó","nhóm lại, tóm tắt","giờ học","hành lang"]	nhóm lại, tóm tắt	30	2026-06-24 16:16:40.297	2026-06-24 16:16:40.297
8588	multiple_choice	「しまいます」 (しまいます) nghĩa là gì?	["mặt trăng","chuẩn bị bài mới","con búp bê, con rối","cất vào, để vào"]	cất vào, để vào	30	2026-06-24 16:16:40.299	2026-06-24 16:16:40.299
8589	multiple_choice	「決めます」 (きめます) nghĩa là gì?	["xung quanh","cất vào, để vào","quyết định","ôn bài cũ"]	quyết định	30	2026-06-24 16:16:40.301	2026-06-24 16:16:40.301
8590	multiple_choice	「予習します」 (よしゅうします) nghĩa là gì?	["xếp thành hàng","live","chuẩn bị bài mới","tròn"]	chuẩn bị bài mới	30	2026-06-24 16:16:40.303	2026-06-24 16:16:40.303
8591	multiple_choice	「復習します」 (ふくしゅうします) nghĩa là gì?	["tròn","trang trí","quyết định","ôn bài cũ"]	ôn bài cũ	30	2026-06-24 16:16:40.304	2026-06-24 16:16:40.304
8592	multiple_choice	「そのままに します」 (そのままに します) nghĩa là gì?	["để nguyên như thế","torch, flashlight","con (dùng đối với người khác)","bài giảng"]	để nguyên như thế	30	2026-06-24 16:16:40.306	2026-06-24 16:16:40.306
8593	multiple_choice	「授業」 (じゅぎょう) nghĩa là gì?	["giờ học","torch, flashlight","Do you have any requests?","live"]	giờ học	30	2026-06-24 16:16:40.308	2026-06-24 16:16:40.308
8594	multiple_choice	「講義」 (こうぎ) nghĩa là gì?	["thảo luận, trao đổi , bàn bạc","chuẩn bị bài mới","bài giảng","trang trí"]	bài giảng	30	2026-06-24 16:16:40.31	2026-06-24 16:16:40.31
8595	multiple_choice	「ミーティング」 (ミーティング) nghĩa là gì?	["meeting","thời khóa biểu, lịch","tài liệu hướng dẫn","cửa vào"]	meeting	30	2026-06-24 16:16:40.313	2026-06-24 16:16:40.313
8596	fill_in_blank	Điền hiragana cho: "xung quanh"	\N	まわり	30	2026-06-24 16:16:40.315	2026-06-24 16:16:40.315
8597	fill_in_blank	Điền hiragana cho: "ôn bài cũ"	\N	ふくしゅうします	30	2026-06-24 16:16:40.317	2026-06-24 16:16:40.317
8598	fill_in_blank	Điền hiragana cho: "đưa về, trả về"	\N	もどします	30	2026-06-24 16:16:40.319	2026-06-24 16:16:40.319
8599	fill_in_blank	Điền hiragana cho: "hi vọng, nguyện vọng"	\N	きぼう	30	2026-06-24 16:16:40.321	2026-06-24 16:16:40.321
8600	fill_in_blank	Điền hiragana cho: "sau đó, tiếp đó"	\N	すると	30	2026-06-24 16:16:40.323	2026-06-24 16:16:40.323
8601	multiple_choice	「続けます」 (つづけます) nghĩa là gì?	["return","chi nhánh","tiếp tục","graduate"]	tiếp tục	31	2026-06-24 16:16:40.488	2026-06-24 16:16:40.488
8602	multiple_choice	「見つけます」 (みつけます) nghĩa là gì?	["tự do","suối nước nóng","tìm thấy","ai đó"]	tìm thấy	31	2026-06-24 16:16:40.49	2026-06-24 16:16:40.49
8603	multiple_choice	「取ります［休みを～］」 (とります［やすみを～］) nghĩa là gì?	["take [a holiday]","graduate","visitor, guest, customer, client","entrance examination"]	take [a holiday]	31	2026-06-24 16:16:40.491	2026-06-24 16:16:40.491
8604	multiple_choice	「受けます［試験を～］」 (うけます［しけんを～］) nghĩa là gì?	["take [an examination]","bọn trẻ","tuyệt vời","đẹp"]	take [an examination]	31	2026-06-24 16:16:40.494	2026-06-24 16:16:40.494
8605	multiple_choice	「申し込みます」 (もうしこみます) nghĩa là gì?	["announcement, presentation (～します : announce)","apply for, enter for","(someone else's) child","thành phố"]	apply for, enter for	31	2026-06-24 16:16:40.497	2026-06-24 16:16:40.497
8606	multiple_choice	「休憩します」 (きゅうけいします) nghĩa là gì?	["ở lại","hateful, disagreeable","nghỉ giải lao","bọn trẻ"]	nghỉ giải lao	31	2026-06-24 16:16:40.499	2026-06-24 16:16:40.499
8607	multiple_choice	「連休」 (れんきゅう) nghĩa là gì?	["ngày nghỉ liền nhay","name of a Shinkansen train (～４２号 : Nozomi Superexpress No.42)","take [an examination]","tiếp tục"]	ngày nghỉ liền nhay	31	2026-06-24 16:16:40.501	2026-06-24 16:16:40.501
8608	multiple_choice	「作文」 (さくぶん) nghĩa là gì?	["take [a holiday]","thường","bài văn","take [an examination]"]	bài văn	31	2026-06-24 16:16:40.502	2026-06-24 16:16:40.502
8609	multiple_choice	「発表」 (はっぴょう) nghĩa là gì?	["Ueno Park (in Tokyo)","tuyệt vời","suốt,liền","announcement, presentation (～します : announce)"]	announcement, presentation (～します : announce)	31	2026-06-24 16:16:40.503	2026-06-24 16:16:40.503
8610	multiple_choice	「展覧会」 (てんらんかい) nghĩa là gì?	["triển lãm","ai đó","lễ cưới, đám cưới","(train number, typhoon number, etc.)"]	triển lãm	31	2026-06-24 16:16:40.505	2026-06-24 16:16:40.505
8611	multiple_choice	「結婚式」 (けっこんしき) nghĩa là gì?	["trụ sở","lễ cưới, đám cưới","đẹp","nhắm"]	lễ cưới, đám cưới	31	2026-06-24 16:16:40.506	2026-06-24 16:16:40.506
8612	multiple_choice	「［お］葬式」 (［お］そうしき) nghĩa là gì?	["triển lãm","enter [a university]","bọn trẻ","funeral"]	funeral	31	2026-06-24 16:16:40.507	2026-06-24 16:16:40.507
8613	multiple_choice	「式」 (しき) nghĩa là gì?	["buổi lễ","một tháng","enter [a university]","internet"]	buổi lễ	31	2026-06-24 16:16:40.509	2026-06-24 16:16:40.509
8614	multiple_choice	「本社」 (ほんしゃ) nghĩa là gì?	["bài văn","ai đó","ở lại","trụ sở"]	trụ sở	31	2026-06-24 16:16:40.512	2026-06-24 16:16:40.512
8615	multiple_choice	「支店」 (してん) nghĩa là gì?	["chi nhánh","triển lãm","làng","[a ceremony] begin, start"]	chi nhánh	31	2026-06-24 16:16:40.514	2026-06-24 16:16:40.514
8616	fill_in_blank	Điền hiragana cho: "(train number, typhoon number, etc.)"	\N	－ごう	31	2026-06-24 16:16:40.516	2026-06-24 16:16:40.516
8617	fill_in_blank	Điền hiragana cho: "announcement, presentation (～します : announce)"	\N	はっぴょう	31	2026-06-24 16:16:40.518	2026-06-24 16:16:40.518
8618	fill_in_blank	Điền hiragana cho: "internet"	\N	インターネット	31	2026-06-24 16:16:40.519	2026-06-24 16:16:40.519
8619	fill_in_blank	Điền hiragana cho: "name of a station in Hyogo prefecture"	\N	しんこうべ	31	2026-06-24 16:16:40.521	2026-06-24 16:16:40.521
8620	fill_in_blank	Điền hiragana cho: "bài văn"	\N	さくぶん	31	2026-06-24 16:16:40.522	2026-06-24 16:16:40.522
8621	multiple_choice	「運動します」 (うんどうします) nghĩa là gì?	["như thế đó (về vấn đề có quan hệ với người nghe)","muộn , khuya","vận động, tập thể thao","bị thương"]	vận động, tập thể thao	32	2026-06-24 16:16:40.764	2026-06-24 16:16:40.764
8622	multiple_choice	「成功します」 (せいこうします) nghĩa là gì?	["olympic","something lucky","cúm dịch","thành công"]	thành công	32	2026-06-24 16:16:40.768	2026-06-24 16:16:40.768
8623	multiple_choice	「失敗します［試験に～］」 (しっぱいします［しけんに～］) nghĩa là gì?	["catch [a cold]","fail [an examination]","dạ dày","rich person"]	fail [an examination]	32	2026-06-24 16:16:40.771	2026-06-24 16:16:40.771
8624	multiple_choice	「合格します［試験に～］」 (ごうかくします［しけんに～］) nghĩa là gì?	["bói sao","pass [an examination]","chiều tối","[a road] get crowded"]	pass [an examination]	32	2026-06-24 16:16:40.775	2026-06-24 16:16:40.775
8625	multiple_choice	「やみます［雨が～］」 (やみます［あめが～］) nghĩa là gì?	["stress, căng thẳng tâm lý","stone","[rain] stop","phía tây"]	[rain] stop	32	2026-06-24 16:16:40.78	2026-06-24 16:16:40.78
8626	multiple_choice	「晴れます」 (はれます) nghĩa là gì?	["[wind] blow","như thế kia","đội","nắng, quang đãng"]	nắng, quang đãng	32	2026-06-24 16:16:40.783	2026-06-24 16:16:40.783
8627	multiple_choice	「曇ります」 (くもります) nghĩa là gì?	["muộn , khuya","I'm sorry to hear that.","có mây, mây mù","mặt trăng"]	có mây, mây mù	32	2026-06-24 16:16:40.785	2026-06-24 16:16:40.785
8628	multiple_choice	「続づきます［熱が～］」 (つづきます［ねつが～］) nghĩa là gì?	["[a road] get crowded","[high temperature/fever] continue","thành công","worried, anxious"]	[high temperature/fever] continue	32	2026-06-24 16:16:40.788	2026-06-24 16:16:40.788
8629	multiple_choice	「ひきます［かぜを～］」 (ひきます［かぜを～］) nghĩa là gì?	["như thế này","catch [a cold]","làm việc quá sức","gió"]	catch [a cold]	32	2026-06-24 16:16:40.79	2026-06-24 16:16:40.79
8630	multiple_choice	「冷やします」 (ひやします) nghĩa là gì?	["stone","làm lạnh","nghỉ ngơi, thư thái, dưỡng sức","recover from [sickness], get well"]	làm lạnh	32	2026-06-24 16:16:40.794	2026-06-24 16:16:40.794
8631	multiple_choice	「込みます［道が～］」 (こみます［みちが～］) nghĩa là gì?	["gió","[a road] get crowded","[a road] get less crowded","nắng, quang đãng"]	[a road] get crowded	32	2026-06-24 16:16:40.797	2026-06-24 16:16:40.797
8632	multiple_choice	「すきます［道が～］」 (すきます［みちが～］) nghĩa là gì?	["dạ dày","something lucky","ngôi sao","[a road] get less crowded"]	[a road] get less crowded	32	2026-06-24 16:16:40.799	2026-06-24 16:16:40.799
8633	multiple_choice	「出ます［試合に～］」 (でます［しあいに～］) nghĩa là gì?	["participate [in the match]","ho","nắng, quang đãng","người yêu"]	participate [in the match]	32	2026-06-24 16:16:40.801	2026-06-24 16:16:40.801
8634	multiple_choice	「出ます［パーティーに～］」 (でます［パーティーに～］) nghĩa là gì?	["recover from [sickness], get well","attend [a party]","phía bắc","olympic"]	attend [a party]	32	2026-06-24 16:16:40.804	2026-06-24 16:16:40.804
8635	multiple_choice	「無理を します」 (むりを します) nghĩa là gì?	["làm quá sức","đội","[high temperature/fever] continue","có thể, biết dâu là, có khả năng"]	làm quá sức	32	2026-06-24 16:16:40.806	2026-06-24 16:16:40.806
8636	fill_in_blank	Điền hiragana cho: "rắc rối, khó xử, vấn đề"	\N	こまります	32	2026-06-24 16:16:40.808	2026-06-24 16:16:40.808
8637	fill_in_blank	Điền hiragana cho: "nắng, quang đãng"	\N	はれます	32	2026-06-24 16:16:40.812	2026-06-24 16:16:40.812
8638	fill_in_blank	Điền hiragana cho: "something lucky"	\N	ラッキーアイテム	32	2026-06-24 16:16:40.814	2026-06-24 16:16:40.814
8639	fill_in_blank	Điền hiragana cho: "[wind] blow"	\N	ふきます［かぜが～］	32	2026-06-24 16:16:40.816	2026-06-24 16:16:40.816
8640	fill_in_blank	Điền hiragana cho: "chòm sao Kim Ngưu"	\N	おうしざ	32	2026-06-24 16:16:40.818	2026-06-24 16:16:40.818
8641	multiple_choice	「逃げます」 (にげます) nghĩa là gì?	["ngày mai","chạy trốn, bỏ chạy","~trong khoảng, ~trong vòng","đỗ xe trái phép"]	chạy trốn, bỏ chạy	33	2026-06-24 16:16:41.073	2026-06-24 16:16:41.073
8642	multiple_choice	「騒ぎます」 (さわぎます) nghĩa là gì?	["cảnh sát","vắng nhà","làm ồn, làm rùm beng","greeting, address (～を します : greet, give an address)"]	làm ồn, làm rùm beng	33	2026-06-24 16:16:41.075	2026-06-24 16:16:41.075
8643	multiple_choice	「あきらめます」 (あきらめます) nghĩa là gì?	["come back, return","recycle","từ bỏ, đầu hàng","Applications Wanted"]	từ bỏ, đầu hàng	33	2026-06-24 16:16:41.078	2026-06-24 16:16:41.078
8644	multiple_choice	「投げます」 (なげます) nghĩa là gì?	["máy giặt","[a ceremony] begin, start","cấm sử dụng","ném"]	ném	33	2026-06-24 16:16:41.08	2026-06-24 16:16:41.08
8645	multiple_choice	「守ります」 (まもります) nghĩa là gì?	["đang sử dụng","Applications Wanted","đang ~","bảo vệ, tuân thủ"]	bảo vệ, tuân thủ	33	2026-06-24 16:16:41.081	2026-06-24 16:16:41.081
8646	multiple_choice	「始まります［式が～］」 (はじまります［しきが～］) nghĩa là gì?	["[a ceremony] begin, start","be careful [of the cars]","kí hiệu","cửa thoát hiểm"]	[a ceremony] begin, start	33	2026-06-24 16:16:41.083	2026-06-24 16:16:41.083
8647	multiple_choice	「出席します［会議に～］」 (しゅっせきします［かいぎに～］) nghĩa là gì?	["trông nhà, giữ nhà","ngắn gọn","quy tắc, kỷ luật","attend [a meeting]"]	attend [a meeting]	33	2026-06-24 16:16:41.084	2026-06-24 16:16:41.084
8648	multiple_choice	「伝えます」 (つたえます) nghĩa là gì?	["recycle","come back, return","cửa thoát hiểm","truyền đạt"]	truyền đạt	33	2026-06-24 16:16:41.086	2026-06-24 16:16:41.086
8649	multiple_choice	「注意します［車に～］」 (ちゅういします［くるまに～］) nghĩa là gì?	["vắng nhà","chạy trốn, bỏ chạy","đang sử dụng","be careful [of the cars]"]	be careful [of the cars]	33	2026-06-24 16:16:41.087	2026-06-24 16:16:41.087
8650	multiple_choice	「外します［席を～］」 (はずします［せきを～］) nghĩa là gì?	["be away [from one's desk]","nâng lên, tăng lên","cấm sử dụng","greeting, address (～を します : greet, give an address)"]	be away [from one's desk]	33	2026-06-24 16:16:41.089	2026-06-24 16:16:41.089
8651	multiple_choice	「戻ります」 (もどります) nghĩa là gì?	["miễn phí","more","bảo vệ, tuân thủ","come back, return"]	come back, return	33	2026-06-24 16:16:41.09	2026-06-24 16:16:41.09
8652	multiple_choice	「あります［電話が～］」 (あります［でんわが～］) nghĩa là gì?	["have [a telephone call]","earthquake","kí hiệu","be careful [of the cars]"]	have [a telephone call]	33	2026-06-24 16:16:41.093	2026-06-24 16:16:41.093
8653	multiple_choice	「リサイクルします」 (リサイクルします) nghĩa là gì?	["be away [from one's desk]","làm ồn, làm rùm beng","be careful [of the cars]","recycle"]	recycle	33	2026-06-24 16:16:41.096	2026-06-24 16:16:41.096
8654	multiple_choice	「だめ［な］」 (だめ［な］) nghĩa là gì?	["đang sử dụng","no good, not permitted, impossible","nâng lên, tăng lên","deadline"]	no good, not permitted, impossible	33	2026-06-24 16:16:41.098	2026-06-24 16:16:41.098
8655	multiple_choice	「同じ」 (おなじ) nghĩa là gì?	["same","deadline","however ～, even if ～","Danger"]	same	33	2026-06-24 16:16:41.099	2026-06-24 16:16:41.099
8656	fill_in_blank	Điền hiragana cho: "tiền cước điện báo"	\N	でんぽうだい	33	2026-06-24 16:16:41.101	2026-06-24 16:16:41.101
8657	fill_in_blank	Điền hiragana cho: "cấm sử dụng"	\N	しようきんし	33	2026-06-24 16:16:41.102	2026-06-24 16:16:41.102
8658	fill_in_blank	Điền hiragana cho: "same"	\N	おなじ	33	2026-06-24 16:16:41.104	2026-06-24 16:16:41.104
8659	fill_in_blank	Điền hiragana cho: "điện báo"	\N	でんぽう	33	2026-06-24 16:16:41.106	2026-06-24 16:16:41.106
8660	fill_in_blank	Điền hiragana cho: "~ gì, ~ thế nào"	\N	どういう ～	33	2026-06-24 16:16:41.107	2026-06-24 16:16:41.107
8661	multiple_choice	「磨きます［歯を～］」 (みがきます［はを～］) nghĩa là gì?	["món oyako-don","trước","nước chấm, nước xốt","brush [one's teeth], polish"]	brush [one's teeth], polish	34	2026-06-24 16:16:41.315	2026-06-24 16:16:41.315
8662	multiple_choice	「組み立てます」 (くみたてます) nghĩa là gì?	["thịt gà","visitor, guest, customer, client","lắp ráp, lắp đặt","gia cụ , đồ dùng nội thất"]	lắp ráp, lắp đặt	34	2026-06-24 16:16:41.318	2026-06-24 16:16:41.318
8663	multiple_choice	「降ります」 (おります) nghĩa là gì?	["đun","gấp, gập, bẻ gãy","～ or ～","món oyako-don"]	gấp, gập, bẻ gãy	34	2026-06-24 16:16:41.319	2026-06-24 16:16:41.319
8664	multiple_choice	「気が つきます［忘れ物に～］」 (きが つきます［わすれものに～］) nghĩa là gì?	["vừa rồi, vừa lúc nãy","brush [one's teeth], polish","gia vị","notice, become aware of [things left behind]"]	notice, become aware of [things left behind]	34	2026-06-24 16:16:41.321	2026-06-24 16:16:41.321
8665	multiple_choice	「つけます［しゅうゆを～］」 (つけます［しゅうゆを～］) nghĩa là gì?	["gia vị","put [in soy sauce]","câu lạc bộ thể thao","(counter for small objects)"]	put [in soy sauce]	34	2026-06-24 16:16:41.323	2026-06-24 16:16:41.323
8666	multiple_choice	「見つかります［かぎが～］」 (みつかります［かぎが～］) nghĩa là gì?	["sơ đồ, hình vẽ","hỏi","[a key] be found","màu trắng"]	[a key] be found	34	2026-06-24 16:16:41.324	2026-06-24 16:16:41.324
8667	multiple_choice	「質問します」 (しつもんします) nghĩa là gì?	["đắng","màu trắng","hỏi","portion for ～ (used for indicating quantity)"]	hỏi	34	2026-06-24 16:16:41.328	2026-06-24 16:16:41.328
8668	multiple_choice	「さします［傘を～］」 (さします［かさを～］) nghĩa là gì?	["quyển hướng dẫn","gia cụ , đồ dùng nội thất","[a key] be found","put up [an umbrella]"]	put up [an umbrella]	34	2026-06-24 16:16:41.33	2026-06-24 16:16:41.33
8669	multiple_choice	「スポーツクラブ」 (スポーツクラブ) nghĩa là gì?	["câu lạc bộ thể thao","put [in soy sauce]","đặt lên","put up [an umbrella]"]	câu lạc bộ thể thao	34	2026-06-24 16:16:41.332	2026-06-24 16:16:41.332
8670	multiple_choice	「［お］城」 (［お］しろ) nghĩa là gì?	["béo, to","màu trắng","hỏi","castle"]	castle	34	2026-06-24 16:16:41.333	2026-06-24 16:16:41.333
8671	multiple_choice	「説明書」 (せつめいしょ) nghĩa là gì?	["quyển hướng dẫn","make (green) tea (at a tea ceremony)","múa trong hội bon","gia vị"]	quyển hướng dẫn	34	2026-06-24 16:16:41.335	2026-06-24 16:16:41.335
8672	multiple_choice	「図」 (ず) nghĩa là gì?	["sơ đồ, hình vẽ","trước","Thế này có được không? /thế này đã được chưa?","tối qua, đêm qua"]	sơ đồ, hình vẽ	34	2026-06-24 16:16:41.336	2026-06-24 16:16:41.336
8673	multiple_choice	「線」 (せん) nghĩa là gì?	["make (green) tea (at a tea ceremony)","cái bát","trà đạo","đường"]	đường	34	2026-06-24 16:16:41.338	2026-06-24 16:16:41.338
8674	multiple_choice	「矢印」 (やじるし) nghĩa là gì?	["màu xanh da trời","dấu mũi tên","one fourth","seat belt"]	dấu mũi tên	34	2026-06-24 16:16:41.339	2026-06-24 16:16:41.339
8675	multiple_choice	「黒」 (くろ) nghĩa là gì?	["gia vị","one fourth","màu đen","màu trắng"]	màu đen	34	2026-06-24 16:16:41.341	2026-06-24 16:16:41.341
8676	fill_in_blank	Điền hiragana cho: "màu xanh lam"	\N	こん	34	2026-06-24 16:16:41.344	2026-06-24 16:16:41.344
8677	fill_in_blank	Điền hiragana cho: "màu đen"	\N	くろ	34	2026-06-24 16:16:41.347	2026-06-24 16:16:41.347
8678	fill_in_blank	Điền hiragana cho: "seat belt"	\N	シートベルト	34	2026-06-24 16:16:41.349	2026-06-24 16:16:41.349
8679	fill_in_blank	Điền hiragana cho: "lắp ráp, lắp đặt"	\N	くみたてます	34	2026-06-24 16:16:41.351	2026-06-24 16:16:41.351
8680	fill_in_blank	Điền hiragana cho: "brush [one's teeth], polish"	\N	みがきます［はを～］	34	2026-06-24 16:16:41.352	2026-06-24 16:16:41.352
8681	multiple_choice	「咲きます［花が～］」 (さきます［はなが～］) nghĩa là gì?	["(chuyến) xe buýt chạy đêm","[flowers] bloom","cụ thể, chi tiết","key"]	[flowers] bloom	35	2026-06-24 16:16:41.742	2026-06-24 16:16:41.742
8682	multiple_choice	「変わります［色が～］」 (かわります［いろが～］) nghĩa là gì?	["a fictitious cooking school","curtain","key","[the color] change"]	[the color] change	35	2026-06-24 16:16:41.744	2026-06-24 16:16:41.744
8683	multiple_choice	「困ります」 (こまります) nghĩa là gì?	["get through [on the telephone]","resort in Nagano Prefecture","rắc rối, khó xử, có vấn đề","công ty du lịch"]	rắc rối, khó xử, có vấn đề	35	2026-06-24 16:16:41.746	2026-06-24 16:16:41.746
8684	multiple_choice	「付けます［丸を～］」 (つけます［まるを～］) nghĩa là gì?	["đi bộ trên núi","draw [a circle], mark [with a circle], add","địa điểm trượt tuyết","relationship"]	draw [a circle], mark [with a circle], add	35	2026-06-24 16:16:41.748	2026-06-24 16:16:41.748
8685	multiple_choice	「治ります［病気が～］」 (なおります［びょうきが～］) nghĩa là gì?	["recover from [sickness], get well","a fictitious cooking school","key","necessary, essential"]	recover from [sickness], get well	35	2026-06-24 16:16:41.749	2026-06-24 16:16:41.749
8686	multiple_choice	「直ります［故障が～］」 (なおります［こしょうが～］) nghĩa là gì?	["cụ thể, chi tiết","be fixed, be repaired","[the color] change","tourist spot in Tochigi prefecture"]	be fixed, be repaired	35	2026-06-24 16:16:41.751	2026-06-24 16:16:41.751
8687	multiple_choice	「くりっくします」 (くりっくします) nghĩa là gì?	["Let's finish now.","recover from [sickness], get well","resort in Nagano Prefecture","click"]	click	35	2026-06-24 16:16:41.753	2026-06-24 16:16:41.753
8688	multiple_choice	「入力します」 (にゅうりょくします) nghĩa là gì?	["Let's finish now.","click","input","[the color] change"]	input	35	2026-06-24 16:16:41.755	2026-06-24 16:16:41.755
8689	multiple_choice	「正しい」 (ただしい) nghĩa là gì?	["cái nắp","draw [a circle], mark [with a circle], add","đúng, chính xác","thao tác"]	đúng, chính xác	35	2026-06-24 16:16:41.757	2026-06-24 16:16:41.757
8690	multiple_choice	「向こう」 (むこう) nghĩa là gì?	["bên kia, bên đấy","cụ thể, chi tiết","click","resort and tourist spot in Kanagawa prefecture"]	bên kia, bên đấy	35	2026-06-24 16:16:41.76	2026-06-24 16:16:41.76
8691	multiple_choice	「島」 (しま) nghĩa là gì?	["đảo, hòn đảo","cơ hội","input","Well, let me see. (used when unsure of something)"]	đảo, hòn đảo	35	2026-06-24 16:16:41.764	2026-06-24 16:16:41.764
8692	multiple_choice	「港」 (みなと) nghĩa là gì?	["a fictitious dental clinic","cảng, bến cảng","Africa","nhặt lên"]	cảng, bến cảng	35	2026-06-24 16:16:41.767	2026-06-24 16:16:41.767
8693	multiple_choice	「近所」 (きんじょ) nghĩa là gì?	["hàng xóm, khu vực lân cận","a fictitious sushi restaurant","hiếm có","click"]	hàng xóm, khu vực lân cận	35	2026-06-24 16:16:41.769	2026-06-24 16:16:41.769
8694	multiple_choice	「屋上」 (おくじょう) nghĩa là gì?	["mái nhà, nóc nhà","cái nắp","đi bộ trên núi","quan hệ tốt với, chơi thân với"]	mái nhà, nóc nhà	35	2026-06-24 16:16:41.772	2026-06-24 16:16:41.772
8695	multiple_choice	「海外」 (かいがい) nghĩa là gì?	["click","We'll finish now.","nước ngoài, hải ngoại","hiếm có"]	nước ngoài, hải ngoại	35	2026-06-24 16:16:41.774	2026-06-24 16:16:41.774
8696	fill_in_blank	Điền hiragana cho: "a fictitious hair salon"	\N	はる	35	2026-06-24 16:16:41.777	2026-06-24 16:16:41.777
8697	fill_in_blank	Điền hiragana cho: "làng"	\N	むら	35	2026-06-24 16:16:41.78	2026-06-24 16:16:41.78
8698	fill_in_blank	Điền hiragana cho: "phép, giấy phép"	\N	きょか	35	2026-06-24 16:16:41.783	2026-06-24 16:16:41.783
8699	fill_in_blank	Điền hiragana cho: "nếu thế thì, vậy thì"	\N	それなら	35	2026-06-24 16:16:41.785	2026-06-24 16:16:41.785
8700	fill_in_blank	Điền hiragana cho: "hàng xóm, khu vực lân cận"	\N	きんじょ	35	2026-06-24 16:16:41.788	2026-06-24 16:16:41.788
8701	multiple_choice	「あいます［事故に～］」 (あいます［じこに～］) nghĩa là gì?	["encounter [an accident]","You're using, aren't you? (respectful equivalent of つかって いるんですね)","tàu hỏa chạy bằng hơi nước","xa, ở xa"]	encounter [an accident]	36	2026-06-24 16:16:42.122	2026-06-24 16:16:42.122
8702	multiple_choice	「貯金します」 (ちょきんします) nghĩa là gì?	["special","encounter [an accident]","tiết kiệm tiền, để dành tiền","béo lên, tăng cân"]	tiết kiệm tiền, để dành tiền	36	2026-06-24 16:16:42.128	2026-06-24 16:16:42.128
8703	multiple_choice	「過ぎます［７時を～］」 (すぎます［７じを～］) nghĩa là gì?	["rush hour","mềm","trái đất","pass [7 o'clock]"]	pass [7 o'clock]	36	2026-06-24 16:16:42.131	2026-06-24 16:16:42.131
8704	multiple_choice	「慣れます［仕事に～］」 (なれます［しごとに～］) nghĩa là gì?	["get accustomed to [one's job]","type [on a word processor]","vâng vâng","cuối cùng thì"]	get accustomed to [one's job]	36	2026-06-24 16:16:42.135	2026-06-24 16:16:42.135
8705	multiple_choice	「腐ります［食べ物が～］」 (くさります［たべものが～］) nghĩa là gì?	["[food] rot","Chopin, Polish musician (1810-49)","rare, uncommon","đang làm (tôn kính ngữ của しています）"]	[food] rot	36	2026-06-24 16:16:42.138	2026-06-24 16:16:42.138
8706	multiple_choice	「剣道」 (けんどう) nghĩa là gì?	["portable ～","kiếm đạo","khá, tương đối","cứng"]	kiếm đạo	36	2026-06-24 16:16:42.141	2026-06-24 16:16:42.141
8707	multiple_choice	「柔道」 (じゅうどう) nghĩa là gì?	["judo","kiếm đạo","hàng tuần","be different"]	judo	36	2026-06-24 16:16:42.146	2026-06-24 16:16:42.146
8708	multiple_choice	「ラッシュ」 (ラッシュ) nghĩa là gì?	["pass [7 o'clock]","rush hour","many (people)","almost all (in affirmative sentences), hardly, scarcely (in negative sentences)"]	rush hour	36	2026-06-24 16:16:42.148	2026-06-24 16:16:42.148
8709	multiple_choice	「宇宙」 (うちゅう) nghĩa là gì?	["rare, uncommon","vũ trụ","vận chuyển","encounter [an accident]"]	vũ trụ	36	2026-06-24 16:16:42.151	2026-06-24 16:16:42.151
8710	multiple_choice	「曲」 (きょく) nghĩa là gì?	["môn bơi lội","lịch sử","a piece of music","tango"]	a piece of music	36	2026-06-24 16:16:42.153	2026-06-24 16:16:42.153
8711	multiple_choice	「毎週」 (まいしゅう) nghĩa là gì?	["portable ～","trái đất","cuối cùng thì","hàng tuần"]	hàng tuần	36	2026-06-24 16:16:42.156	2026-06-24 16:16:42.156
8712	multiple_choice	「毎月」 (まいつき) nghĩa là gì?	["vâng vâng","nhà máy, phân xưởng","tàu hỏa chạy bằng hơi nước","hàng tháng"]	hàng tháng	36	2026-06-24 16:16:42.16	2026-06-24 16:16:42.16
8713	multiple_choice	「毎年」 (まいとし（まいねん）) nghĩa là gì?	["a piece of music","Chopin, Polish musician (1810-49)","You're using, aren't you? (respectful equivalent of つかって いるんですね)","every year"]	every year	36	2026-06-24 16:16:42.164	2026-06-24 16:16:42.164
8714	multiple_choice	「このごろ」 (このごろ) nghĩa là gì?	["gần đây, dạo này","giỏi, khéo","hàng tháng","tuyệt đối"]	gần đây, dạo này	36	2026-06-24 16:16:42.166	2026-06-24 16:16:42.166
8715	multiple_choice	「やっと」 (やっと) nghĩa là gì?	["cuối cùng thì","tuyệt đối","Chopin, Polish musician (1810-49)","mềm"]	cuối cùng thì	36	2026-06-24 16:16:42.169	2026-06-24 16:16:42.169
8716	fill_in_blank	Điền hiragana cho: "Wright brothers, American pioneers in aviation ; Wilbur Wright (1867-1912) Orville Wright (1871-1948)"	\N	ライトきょうだい	36	2026-06-24 16:16:42.172	2026-06-24 16:16:42.172
8717	fill_in_blank	Điền hiragana cho: "mềm"	\N	やわらかい	36	2026-06-24 16:16:42.175	2026-06-24 16:16:42.175
8718	fill_in_blank	Điền hiragana cho: "trái đất"	\N	ちきゅう	36	2026-06-24 16:16:42.179	2026-06-24 16:16:42.179
8719	fill_in_blank	Điền hiragana cho: "pass [7 o'clock]"	\N	すぎます［７じを～］	36	2026-06-24 16:16:42.181	2026-06-24 16:16:42.181
8720	fill_in_blank	Điền hiragana cho: "cứng"	\N	かたい	36	2026-06-24 16:16:42.182	2026-06-24 16:16:42.182
8721	multiple_choice	「褒めます」 (ほめます) nghĩa là gì?	["khen","truyện tranh","sử dụng","golden colour"]	khen	37	2026-06-24 16:16:42.423	2026-06-24 16:16:42.423
8722	multiple_choice	「しかります」 (しかります) nghĩa là gì?	["mắng","golden colour","kỷ thuật","lấp"]	mắng	37	2026-06-24 16:16:42.428	2026-06-24 16:16:42.428
8723	multiple_choice	「誘います」 (さそいます) nghĩa là gì?	["cố gắng hết sức","mời, rủ rê","somebody","beautiful, pretty"]	mời, rủ rê	37	2026-06-24 16:16:42.432	2026-06-24 16:16:42.432
8724	multiple_choice	「招待します」 (しょうたいします) nghĩa là gì?	["mời","Ladies and gentlemen, everybody (respect equivalent of みなさん)","-th century","Saudia Arabia"]	mời	37	2026-06-24 16:16:42.435	2026-06-24 16:16:42.435
8725	multiple_choice	「頼みます」 (たのみます) nghĩa là gì?	["khen","nối, giao thông đi đến","Olympic Games","nhờ"]	nhờ	37	2026-06-24 16:16:42.438	2026-06-24 16:16:42.438
8726	multiple_choice	「注意します」 (ちゅういします) nghĩa là gì?	["gạo","chú ý, nhắc nhở","tiếng ồn","Todaiji Temple"]	chú ý, nhắc nhở	37	2026-06-24 16:16:42.442	2026-06-24 16:16:42.442
8727	multiple_choice	「とります」 (とります) nghĩa là gì?	["Todaiji Temple","khắp–","ăn trộm , lấy cắp","đất, diện tích đất"]	ăn trộm , lấy cắp	37	2026-06-24 16:16:42.445	2026-06-24 16:16:42.445
8728	multiple_choice	「踏みます」 (ふみます) nghĩa là gì?	["World Cup","chuột","however, but","giẫm , giẫm lên"]	giẫm , giẫm lên	37	2026-06-24 16:16:42.448	2026-06-24 16:16:42.448
8729	multiple_choice	「壊します」 (こわします) nghĩa là gì?	["somebody","\\"The Tale of Genji\\" (Japanese novel)","phá, làm hỏng","nhờ"]	phá, làm hỏng	37	2026-06-24 16:16:42.45	2026-06-24 16:16:42.45
8730	multiple_choice	「汚します」 (よごします) nghĩa là gì?	["phát kiến, tìm ra","làm bẩn","kẻ trộm","after that, later"]	làm bẩn	37	2026-06-24 16:16:42.453	2026-06-24 16:16:42.453
8731	multiple_choice	「行います」 (おこないます) nghĩa là gì?	["đất, diện tích đất","instant noodles","Alexander Graham Bell, American inventor (1847-1922)","thực hiện, tiến hành"]	thực hiện, tiến hành	37	2026-06-24 16:16:42.455	2026-06-24 16:16:42.455
8732	multiple_choice	「輸出します」 (ゆしゅつします) nghĩa là gì?	["khen","xuất khẩu","điêu khắc","gạo"]	xuất khẩu	37	2026-06-24 16:16:42.457	2026-06-24 16:16:42.457
8733	multiple_choice	「輸入します」 (ゆにゅうします) nghĩa là gì?	["giẫm , giẫm lên","ăn trộm , lấy cắp","nhập khẩu","sử dụng"]	nhập khẩu	37	2026-06-24 16:16:42.462	2026-06-24 16:16:42.462
8734	multiple_choice	「翻訳します」 (ほんやくします) nghĩa là gì?	["Great Buddha","bạn bè,đồng nghiệp","Dominica (tên một quốc gia ở Trung Mỹ)","dịch (sách, tài liệu)"]	dịch (sách, tài liệu)	37	2026-06-24 16:16:42.464	2026-06-24 16:16:42.464
8735	multiple_choice	「発明します」 (はつめいします) nghĩa là gì?	["mời","phát minh","Russia","phá, làm hỏng"]	phát minh	37	2026-06-24 16:16:42.466	2026-06-24 16:16:42.466
8736	fill_in_blank	Điền hiragana cho: "World Heritage Site"	\N	せかいいさん	37	2026-06-24 16:16:42.468	2026-06-24 16:16:42.468
8737	fill_in_blank	Điền hiragana cho: "tradition, legend"	\N	いいつたえ	37	2026-06-24 16:16:42.47	2026-06-24 16:16:42.47
8738	fill_in_blank	Điền hiragana cho: "beautiful, pretty"	\N	うつくしい	37	2026-06-24 16:16:42.472	2026-06-24 16:16:42.472
8739	fill_in_blank	Điền hiragana cho: "phát minh"	\N	はつめいします	37	2026-06-24 16:16:42.476	2026-06-24 16:16:42.476
8740	fill_in_blank	Điền hiragana cho: "-th century"	\N	－せいき	37	2026-06-24 16:16:42.479	2026-06-24 16:16:42.479
8741	multiple_choice	「参加します［旅行に～］」 (さんかします［りょこうに～］) nghĩa là gì?	["hiragana and katakana script","join [a tour], participate, attend","turn off [the power switch]","tough, strong-willed"]	join [a tour], participate, attend	38	2026-06-24 16:16:42.673	2026-06-24 16:16:42.673
8742	multiple_choice	「育てます」 (そだてます) nghĩa là gì?	["tính cách","nuôi, trồng","like very much","turn on [the power switch]"]	nuôi, trồng	38	2026-06-24 16:16:42.678	2026-06-24 16:16:42.678
8743	multiple_choice	「運びます」 (はこびます) nghĩa là gì?	["khó chịu","like very much","chở, vận chuyển","nói dối, lời nói dối"]	chở, vận chuyển	38	2026-06-24 16:16:42.68	2026-06-24 16:16:42.68
8744	multiple_choice	「入院します」 (にゅういんします) nghĩa là gì?	["health","tính cách","nhập viện","hiragana and katakana script"]	nhập viện	38	2026-06-24 16:16:42.682	2026-06-24 16:16:42.682
8745	multiple_choice	「退院します」 (たいいんします) nghĩa là gì?	["dễ chịu, thư giản","affix [a seal], stamp","khu vực trước nha ga","xuất viện"]	xuất viện	38	2026-06-24 16:16:42.683	2026-06-24 16:16:42.683
8746	multiple_choice	「入れます［電源を～］」 (いれます［でんげんを～］) nghĩa là gì?	["Chiangmai (in Thailand)","factory","turn on [the power switch]","chở, vận chuyển"]	turn on [the power switch]	38	2026-06-24 16:16:42.685	2026-06-24 16:16:42.685
8747	multiple_choice	「切ります［電源を～］」 (きります［でんげんを～］) nghĩa là gì?	["turn off [the power switch]","Phòng nghiên cứu","sắp xếp","tell [a lie]"]	turn off [the power switch]	38	2026-06-24 16:16:42.687	2026-06-24 16:16:42.687
8748	multiple_choice	「掛けます［かぎを～］」 (かけます［かぎを～］) nghĩa là gì?	["lớp học, lớp","lock","Tập thông báo","habit"]	lock	38	2026-06-24 16:16:42.688	2026-06-24 16:16:42.688
8749	multiple_choice	「つきます［うそを～］」 (つきます［うそを～］) nghĩa là gì?	["the year before the last","bờ biển","tough, strong-willed","tell [a lie]"]	tell [a lie]	38	2026-06-24 16:16:42.69	2026-06-24 16:16:42.69
8750	multiple_choice	「気持ちが いい」 (きもちが いい) nghĩa là gì?	["chị em","trường trung học cơ sở","trường tiểu học","dễ chịu, thư giản"]	dễ chịu, thư giản	38	2026-06-24 16:16:42.694	2026-06-24 16:16:42.694
8751	multiple_choice	「気持ちが 悪い」 (きもちが わるい) nghĩa là gì?	["khó chịu","－ points","thời gian trôi đi","cặp sinh đôi"]	khó chịu	38	2026-06-24 16:16:42.697	2026-06-24 16:16:42.697
8752	multiple_choice	「大きな ～」 (おおきな ～) nghĩa là gì?	["small ～, little ～","large ～, big ～","cặp sinh đôi","mysterious, strange"]	large ～, big ～	38	2026-06-24 16:16:42.698	2026-06-24 16:16:42.698
8753	multiple_choice	「小さな ～」 (ちいさな ～) nghĩa là gì?	["method","dome commemorating the atomic bombing of Hiroshima","mysterious, strange","small ～, little ～"]	small ～, little ～	38	2026-06-24 16:16:42.7	2026-06-24 16:16:42.7
8754	multiple_choice	「赤ちゃん」 (あかちゃん) nghĩa là gì?	["large ～, big ～","age","mysterious, strange","em bé"]	em bé	38	2026-06-24 16:16:42.701	2026-06-24 16:16:42.701
8755	multiple_choice	「小学校」 (しょうがっこう) nghĩa là gì?	["trường tiểu học","nuôi, trồng","large ～, big ～","kind, gentle, tender-hearted"]	trường tiểu học	38	2026-06-24 16:16:42.703	2026-06-24 16:16:42.703
8756	fill_in_blank	Điền hiragana cho: "Oops!/Oh, no! (used when one has made a mistake)"	\N	［あ、］いけない。	38	2026-06-24 16:16:42.704	2026-06-24 16:16:42.704
8757	fill_in_blank	Điền hiragana cho: "(counter for books, etc.)"	\N	－さつ	38	2026-06-24 16:16:42.705	2026-06-24 16:16:42.705
8758	fill_in_blank	Điền hiragana cho: "－ points"	\N	－てん	38	2026-06-24 16:16:42.707	2026-06-24 16:16:42.707
8759	fill_in_blank	Điền hiragana cho: "method"	\N	ほうほう	38	2026-06-24 16:16:42.711	2026-06-24 16:16:42.711
8760	fill_in_blank	Điền hiragana cho: "cãi nhau"	\N	けんかします	38	2026-06-24 16:16:42.713	2026-06-24 16:16:42.713
8761	multiple_choice	「答えます［質問に～］」 (こたえます［しつもんに～］) nghĩa là gì?	["soft, tender","answer [a question]","lễ trưởng thành, lễ thành nhân","đến chậm , đến muộn"]	answer [a question]	39	2026-06-24 16:16:42.887	2026-06-24 16:16:42.887
8762	multiple_choice	「倒れます［ビルが～］」 (たおれます［ビルが～］) nghĩa là gì?	["tiền ~, phí ~","complicated, complex","[a building] fall down","nhiều người"]	[a building] fall down	39	2026-06-24 16:16:42.889	2026-06-24 16:16:42.889
8763	multiple_choice	「通ります［道を～］」 (とおります［みちを～］) nghĩa là gì?	["pass [along a street]","vừa, hợp","khăn lau, khăn tắm","answer [a question]"]	pass [along a street]	39	2026-06-24 16:16:42.893	2026-06-24 16:16:42.893
8764	multiple_choice	「死にます」 (しにます) nghĩa là gì?	["khăn lau, khăn tắm","vui mừng","chết","bây giờ(thì)"]	chết	39	2026-06-24 16:16:42.896	2026-06-24 16:16:42.896
8765	multiple_choice	「びっくりします」 (びっくりします) nghĩa là gì?	["yên tâm","I'm coming. (humble equivalent of いきます)","về sớm, ra sớm","ngạc nhiên, giật mình"]	ngạc nhiên, giật mình	39	2026-06-24 16:16:42.898	2026-06-24 16:16:42.898
8766	multiple_choice	「がっかりします」 (がっかりします) nghĩa là gì?	["thất vọng","bão","get fat, gain weight","tây âu hóa"]	thất vọng	39	2026-06-24 16:16:42.899	2026-06-24 16:16:42.899
8767	multiple_choice	「安心します」 (あんしんします) nghĩa là gì?	["yên tâm","buồn, đau thương","ngạc nhiên, giật mình","[a house] burn down"]	yên tâm	39	2026-06-24 16:16:42.901	2026-06-24 16:16:42.901
8768	multiple_choice	「けんかします」 (けんかします) nghĩa là gì?	["tiền điện thoại, phí điện thoại","cãi nhau","xà phòng","bộ phận tiếp tân"]	cãi nhau	39	2026-06-24 16:16:42.902	2026-06-24 16:16:42.902
8769	multiple_choice	「離婚します」 (りこんします) nghĩa là gì?	["traditional","hard, tough, solid","quần áo kiểu tây âu","ly dị, ly hôn"]	ly dị, ly hôn	39	2026-06-24 16:16:42.904	2026-06-24 16:16:42.904
8770	multiple_choice	「太ります」 (ふとります) nghĩa là gì?	["get fat, gain weight","tiền ~, phí ~","ngạc nhiên, giật mình","bão"]	get fat, gain weight	39	2026-06-24 16:16:42.905	2026-06-24 16:16:42.905
8771	multiple_choice	「やせます」 (やせます) nghĩa là gì?	["xà phòng","đâm , va chạm","tây âu hóa","get slim, lose weight"]	get slim, lose weight	39	2026-06-24 16:16:42.907	2026-06-24 16:16:42.907
8772	multiple_choice	「複雑［な］」 (ふくざつ［な］) nghĩa là gì?	["đến chậm , đến muộn","bẩn","complicated, complex","get slim, lose weight"]	complicated, complex	39	2026-06-24 16:16:42.911	2026-06-24 16:16:42.911
8773	multiple_choice	「邪魔［な］」 (じゃま［な］) nghĩa là gì?	["get fat, gain weight","ngạc nhiên, giật mình","obstructive, in the way","thất vọng"]	obstructive, in the way	39	2026-06-24 16:16:42.913	2026-06-24 16:16:42.913
8774	multiple_choice	「硬い」 (かたい) nghĩa là gì?	["pass [along a street]","hard, tough, solid","ngạc nhiên, giật mình","xe tải"]	hard, tough, solid	39	2026-06-24 16:16:42.915	2026-06-24 16:16:42.915
8775	multiple_choice	「軟らかい」 (やわらかい) nghĩa là gì?	["xà phòng","obstructive, in the way","soft, tender","operation (～します : operate)"]	soft, tender	39	2026-06-24 16:16:42.916	2026-06-24 16:16:42.916
8776	fill_in_blank	Điền hiragana cho: "ngạc nhiên, giật mình"	\N	びっくりします	39	2026-06-24 16:16:42.917	2026-06-24 16:16:42.917
8777	fill_in_blank	Điền hiragana cho: "get fat, gain weight"	\N	ふとります	39	2026-06-24 16:16:42.919	2026-06-24 16:16:42.919
8778	fill_in_blank	Điền hiragana cho: "complicated, complex"	\N	ふくざつ［な］	39	2026-06-24 16:16:42.92	2026-06-24 16:16:42.92
8779	fill_in_blank	Điền hiragana cho: "get slim, lose weight"	\N	やせます	39	2026-06-24 16:16:42.921	2026-06-24 16:16:42.921
8780	fill_in_blank	Điền hiragana cho: "I'm coming. (humble equivalent of いきます)"	\N	うかがいます。	39	2026-06-24 16:16:42.923	2026-06-24 16:16:42.923
8781	multiple_choice	「数えます」 (かぞえます) nghĩa là gì?	["How is ～? (polite equivalent of どうですか)","consult, discuss","đếm","đăng ký"]	đếm	40	2026-06-24 16:16:43.111	2026-06-24 16:16:43.111
8782	multiple_choice	「測ります、量ります」 (はかります) nghĩa là gì?	["đo, cân","phía sau , mặt sau","vẻ, tình hình","sai , lỗi"]	đo, cân	40	2026-06-24 16:16:43.113	2026-06-24 16:16:43.113
8783	multiple_choice	「確かめます」 (たしかめます) nghĩa là gì?	["Snow Festival in Sapporo","đo, cân","xác nhận","capital of Nagasaki prefecture"]	xác nhận	40	2026-06-24 16:16:43.115	2026-06-24 16:16:43.115
8784	multiple_choice	「合います［サイズが～］」 (あいます［サイズが～］) nghĩa là gì?	["vũ trụ","xe máy","weather forecast","[the size] fit"]	[the size] fit	40	2026-06-24 16:16:43.117	2026-06-24 16:16:43.117
8785	multiple_choice	「出発します」 (しゅっぱつします) nghĩa là gì?	["(counter for long objects)","bữa tiệc thứ hai, tăng hai","xuất phát, khởi hành","dangerous"]	xuất phát, khởi hành	40	2026-06-24 16:16:43.119	2026-06-24 16:16:43.119
8786	multiple_choice	「到着します」 (とうちゃくします) nghĩa là gì?	["đến , đến nơi","đến(kính ngữ của きます）","xa cách, xa","nhưng"]	đến , đến nơi	40	2026-06-24 16:16:43.121	2026-06-24 16:16:43.121
8787	multiple_choice	「酔います」 (よいます) nghĩa là gì?	["đồn đại","say","vẻ, tình hình","－ kilograms, kilometers"]	say	40	2026-06-24 16:16:43.122	2026-06-24 16:16:43.122
8788	multiple_choice	「うまく いきます」 (うまく いきます) nghĩa là gì?	["go well","shrine dedicated to Tokugawa Ieyasu in Nikko, Tochigi prefecture","－ glass or cup of (counter for full cups, glasses, etc.)","ngay cả bây giờ"]	go well	40	2026-06-24 16:16:43.125	2026-06-24 16:16:43.125
8789	multiple_choice	「出ます［問題が～］」 (でます［もんだいが～］) nghĩa là gì?	["xa cách, xa","Japan Airlines","[problems] be on the test","consult, discuss"]	[problems] be on the test	40	2026-06-24 16:16:43.127	2026-06-24 16:16:43.127
8790	multiple_choice	「相談します」 (そうだんします) nghĩa là gì?	["[the size] fit","consult, discuss","flight, flight number","nhưng"]	consult, discuss	40	2026-06-24 16:16:43.129	2026-06-24 16:16:43.129
8791	multiple_choice	「必要［な］」 (ひつよう［な］) nghĩa là gì?	["đến , đến nơi","vẻ, tình hình","necessary","－ centimetres"]	necessary	40	2026-06-24 16:16:43.13	2026-06-24 16:16:43.13
8792	multiple_choice	「天気予報」 (てんきよほう) nghĩa là gì?	["thật","đại hội , cuộc thi","weather forecast","xác nhận"]	weather forecast	40	2026-06-24 16:16:43.131	2026-06-24 16:16:43.131
8793	multiple_choice	「忘年会」 (ぼうねんかい) nghĩa là gì?	["tiệc tất niên","Snow Festival in Sapporo","－ centimetres","not more than ～, under ～"]	tiệc tất niên	40	2026-06-24 16:16:43.133	2026-06-24 16:16:43.133
8794	multiple_choice	「新年会」 (しんねんかい) nghĩa là gì?	["ma-ra-tong","cuộc thi","tiệc tân niên","nhưng"]	tiệc tân niên	40	2026-06-24 16:16:43.134	2026-06-24 16:16:43.134
8795	multiple_choice	「二次会」 (にじかい) nghĩa là gì?	["thật","cái quần","bữa tiệc thứ hai, tăng hai","ma-ra-tong"]	bữa tiệc thứ hai, tăng hai	40	2026-06-24 16:16:43.136	2026-06-24 16:16:43.136
8796	fill_in_blank	Điền hiragana cho: "－ grams"	\N	－グラム	40	2026-06-24 16:16:43.137	2026-06-24 16:16:43.137
8797	fill_in_blank	Điền hiragana cho: "elderly person"	\N	［お］としより	40	2026-06-24 16:16:43.139	2026-06-24 16:16:43.139
8798	fill_in_blank	Điền hiragana cho: "vẻ, tình hình"	\N	ようす	40	2026-06-24 16:16:43.142	2026-06-24 16:16:43.142
8799	fill_in_blank	Điền hiragana cho: "đo, cân"	\N	はかります	40	2026-06-24 16:16:43.144	2026-06-24 16:16:43.144
8800	fill_in_blank	Điền hiragana cho: "－ glass or cup of (counter for full cups, glasses, etc.)"	\N	－はい（－ぱい、－ばい）	40	2026-06-24 16:16:43.146	2026-06-24 16:16:43.146
8801	multiple_choice	「いただきます」 (いただきます) nghĩa là gì?	["cô, dì (của mình)","the other day","ngữ pháp","nhận (khiêm nhường ngữ củaもらいます)"]	nhận (khiêm nhường ngữ củaもらいます)	41	2026-06-24 16:16:43.345	2026-06-24 16:16:43.345
8802	multiple_choice	「くださいます」 (くださいます) nghĩa là gì?	["preschool, kindergarten","truyện tranh","I hope you will be very happy.","cho, tặng (tôi) (tôn kính ngữ củaくれます)"]	cho, tặng (tôi) (tôn kính ngữ củaくれます)	41	2026-06-24 16:16:43.347	2026-06-24 16:16:43.347
8803	multiple_choice	「やります」 (やります) nghĩa là gì?	["the other day","trẻ em, trẻ con, bọn trẻ","đổi, thay","cho, tặng (dùng với người dưới hoặc bằng vai)"]	cho, tặng (dùng với người dưới hoặc bằng vai)	41	2026-06-24 16:16:43.348	2026-06-24 16:16:43.348
8804	multiple_choice	「上げます」 (あげます) nghĩa là gì?	["raise, lift up","ngữ pháp","trắng toát, trắng ngần","janitor, caretaker"]	raise, lift up	41	2026-06-24 16:16:43.35	2026-06-24 16:16:43.35
8805	multiple_choice	「下げます」 (さげます) nghĩa là gì?	["khăn tay","lower, pull down","con khỉ","air-conditioning"]	lower, pull down	41	2026-06-24 16:16:43.351	2026-06-24 16:16:43.351
8806	multiple_choice	「親切に します」 (しんせつに します) nghĩa là gì?	["home (respectful equivalent of うち or いえ)","I hope you will be very happy.","giúp đỡ, đối xử thân thiện","cháu"]	giúp đỡ, đối xử thân thiện	41	2026-06-24 16:16:43.352	2026-06-24 16:16:43.352
8807	multiple_choice	「かわいい」 (かわいい) nghĩa là gì?	["thế rồi, sau đó","túi xách","xinh, đáng yêu","heating"]	xinh, đáng yêu	41	2026-06-24 16:16:43.354	2026-06-24 16:16:43.354
8808	multiple_choice	「珍しい」 (めずらしい) nghĩa là gì?	["đồ chơi","air-conditioning","trẻ em, trẻ con, bọn trẻ","rare, uncommon"]	rare, uncommon	41	2026-06-24 16:16:43.355	2026-06-24 16:16:43.355
8809	multiple_choice	「お祝い」 (おいわい) nghĩa là gì?	["quan tâm","temperature","celebration, gift (～を します : celebrate)","đồ vặn ốc; tua-vít"]	celebration, gift (～を します : celebrate)	41	2026-06-24 16:16:43.358	2026-06-24 16:16:43.358
8810	multiple_choice	「お年玉」 (おとしだま) nghĩa là gì?	["I hope you will be very happy.","tiền mừng tuổi","cho, tặng (tôi) (tôn kính ngữ củaくれます)","cô, dì, bác (dùng với người khác)"]	tiền mừng tuổi	41	2026-06-24 16:16:43.36	2026-06-24 16:16:43.36
8811	multiple_choice	「［お］見舞い」 (［お］みまい) nghĩa là gì?	["nội dung, cái ở bên trong","I hope you will be very happy.","công chúa","thăm người ốm"]	thăm người ốm	41	2026-06-24 16:16:43.362	2026-06-24 16:16:43.362
8812	multiple_choice	「興味」 (きょうみ) nghĩa là gì?	["cho, tặng (dùng với người dưới hoặc bằng vai)","đổi, thay","quan tâm","(someone else's) grandchild"]	quan tâm	41	2026-06-24 16:16:43.363	2026-06-24 16:16:43.363
8813	multiple_choice	「情報」 (じょうほう) nghĩa là gì?	["rare, uncommon","có một~","thông tin","đồ ăn cho động vật, mồi"]	thông tin	41	2026-06-24 16:16:43.365	2026-06-24 16:16:43.365
8814	multiple_choice	「文法」 (ぶんぽう) nghĩa là gì?	["ngữ pháp","găng tay","I hope you will be very happy.","đồ chơi"]	ngữ pháp	41	2026-06-24 16:16:43.367	2026-06-24 16:16:43.367
8815	multiple_choice	「発音」 (はつおん) nghĩa là gì?	["phát âm","cho, tặng (dùng với người dưới hoặc bằng vai)","giúp đỡ, đối xử thân thiện","vớ"]	phát âm	41	2026-06-24 16:16:43.369	2026-06-24 16:16:43.369
8816	fill_in_blank	Điền hiragana cho: "kind, gentle, tender-hearted"	\N	やさしい	41	2026-06-24 16:16:43.37	2026-06-24 16:16:43.37
8817	fill_in_blank	Điền hiragana cho: "giúp đỡ, đối xử thân thiện"	\N	しんせつに します	41	2026-06-24 16:16:43.372	2026-06-24 16:16:43.372
8818	fill_in_blank	Điền hiragana cho: "năm ngoái"	\N	おととし	41	2026-06-24 16:16:43.374	2026-06-24 16:16:43.374
8819	fill_in_blank	Điền hiragana cho: "đồ ăn cho động vật, mồi"	\N	えさ	41	2026-06-24 16:16:43.377	2026-06-24 16:16:43.377
8820	fill_in_blank	Điền hiragana cho: "đồ vặn ốc; tua-vít"	\N	ドライバー	41	2026-06-24 16:16:43.379	2026-06-24 16:16:43.379
8821	multiple_choice	「包みます」 (つつみます) nghĩa là gì?	["nature","an toàn","liên hiệp quốc","bọc; gói"]	bọc; gói	42	2026-06-24 16:16:43.647	2026-06-24 16:16:43.647
8822	multiple_choice	「沸かします」 (わかします) nghĩa là gì?	["luận văn, bài báo học thuật","bộ","khăn gói","đun sôi"]	đun sôi	42	2026-06-24 16:16:43.65	2026-06-24 16:16:43.65
8823	multiple_choice	「混ぜます」 (まぜます) nghĩa là gì?	["cặp nhiệt độ","apartment, flat","trộn; khuấy","bọc; gói"]	trộn; khuấy	42	2026-06-24 16:16:43.654	2026-06-24 16:16:43.654
8824	multiple_choice	「計算します」 (けいさんします) nghĩa là gì?	["dày","tính toán","giáo dục","trẻ em"]	tính toán	42	2026-06-24 16:16:43.661	2026-06-24 16:16:43.661
8825	multiple_choice	「並びます」 (ならびます) nghĩa là gì?	["bất cứ nơi nào","strong, healthy","nature","stand in a queue, line up"]	stand in a queue, line up	42	2026-06-24 16:16:43.665	2026-06-24 16:16:43.665
8826	multiple_choice	「丈夫［な］」 (じょうぶ［な］) nghĩa là gì?	["market survey, market research","a fictitious news programme","[bonus] be paid","strong, healthy"]	strong, healthy	42	2026-06-24 16:16:43.668	2026-06-24 16:16:43.668
8827	multiple_choice	「アパート」 (アパート) nghĩa là gì?	["bộ","apartment, flat","nồi","Japanese businessman and inventor (1910-2007)"]	apartment, flat	42	2026-06-24 16:16:43.67	2026-06-24 16:16:43.67
8828	multiple_choice	「弁護士」 (べんごし) nghĩa là gì?	["mì ăn liền","luật sư","trẻ em","xã hội"]	luật sư	42	2026-06-24 16:16:43.673	2026-06-24 16:16:43.673
8829	multiple_choice	「音楽家」 (おんがくか) nghĩa là gì?	["khăn gói","politics","nhạc sĩ","quan hệ"]	nhạc sĩ	42	2026-06-24 16:16:43.678	2026-06-24 16:16:43.678
8830	multiple_choice	「子どもたち」 (こどもたち) nghĩa là gì?	["lid, cover, cap","by ～","trẻ em","brand name of instant noodles"]	trẻ em	42	2026-06-24 16:16:43.681	2026-06-24 16:16:43.681
8831	multiple_choice	「自然」 (しぜん) nghĩa là gì?	["strong, healthy","nhạc sĩ","khoản vay trả góp, tiền vay góp","nature"]	nature	42	2026-06-24 16:16:43.684	2026-06-24 16:16:43.684
8832	multiple_choice	「教育」 (きょういく) nghĩa là gì?	["spread","giáo dục","lịch sử","nồi"]	giáo dục	42	2026-06-24 16:16:43.687	2026-06-24 16:16:43.687
8833	multiple_choice	「文化」 (ぶんか) nghĩa là gì?	["văn hoá","[bonus] be paid","tách; chén","how much, how many"]	văn hoá	42	2026-06-24 16:16:43.692	2026-06-24 16:16:43.692
8834	multiple_choice	「社会」 (しゃかい) nghĩa là gì?	["và, thêm nữa","mỏng","xã hội","Ba Lan"]	xã hội	42	2026-06-24 16:16:43.697	2026-06-24 16:16:43.697
8835	multiple_choice	「政治」 (せいじ) nghĩa là gì?	["tại sao","chiến tranh","vật liệu, nguyên liệu","politics"]	politics	42	2026-06-24 16:16:43.701	2026-06-24 16:16:43.701
8836	fill_in_blank	Điền hiragana cho: "khoản vay trả góp, tiền vay góp"	\N	ローン	42	2026-06-24 16:16:43.703	2026-06-24 16:16:43.703
8837	fill_in_blank	Điền hiragana cho: "spread"	\N	ひろめます	42	2026-06-24 16:16:43.708	2026-06-24 16:16:43.708
8838	fill_in_blank	Điền hiragana cho: "noodles"	\N	めん	42	2026-06-24 16:16:43.712	2026-06-24 16:16:43.712
8839	fill_in_blank	Điền hiragana cho: "đồ hộp"	\N	かんづめ	42	2026-06-24 16:16:43.716	2026-06-24 16:16:43.716
8840	fill_in_blank	Điền hiragana cho: "tại sao"	\N	なぜ	42	2026-06-24 16:16:43.719	2026-06-24 16:16:43.719
8841	multiple_choice	「増えます［輸出が～］」 (ふえます［ゆしゅつが～］) nghĩa là gì?	["thu nhập","[exports] increase","(có vẻ sắp)~đến nơi","kind, gentle, tender-hearted"]	[exports] increase	43	2026-06-24 16:16:43.963	2026-06-24 16:16:43.963
8842	multiple_choice	「減ります［輸出が～］」 (へります［ゆしゅつが～］) nghĩa là gì?	["[petrol, gasoline] run out, be lost","(có vẻ sắp)~đến nơi","[exports] decrease","apologize"]	[exports] decrease	43	2026-06-24 16:16:43.965	2026-06-24 16:16:43.965
8843	multiple_choice	「上がります［値段が～］」 (あがります［ねだんが～］) nghĩa là gì?	["[the price] rise","happy","tên là~/ được gọi là~","dở"]	[the price] rise	43	2026-06-24 16:16:43.966	2026-06-24 16:16:43.966
8844	multiple_choice	「下がります［値段が～］」 (さがります［ねだんが～］) nghĩa là gì?	["[the price] fall, drop","thu nhập","ôi! (câu nói dùng khi ngạc nhiên hoặc cảm thán điều gì)","easy"]	[the price] fall, drop	43	2026-06-24 16:16:43.968	2026-06-24 16:16:43.968
8845	multiple_choice	「切れます［ひもが～］」 (きれます［ひもが～］) nghĩa là gì?	["[a string] break, snap","[exports] decrease","[the price] fall, drop","lửa"]	[a string] break, snap	43	2026-06-24 16:16:43.969	2026-06-24 16:16:43.969
8846	multiple_choice	「とれます［ボタンが～］」 (とれます［ボタンが～］) nghĩa là gì?	["[exports] decrease","tên là~/ được gọi là~","[a button] come off","tuổi"]	[a button] come off	43	2026-06-24 16:16:43.971	2026-06-24 16:16:43.971
8847	multiple_choice	「落ちます［荷物が～］」 (おちます［にもつ～］) nghĩa là gì?	["suitable, proper","[baggage] fall down","(có vẻ sắp)~đến nơi","buồn tẻ, không hấp dẫn, không thú vị"]	[baggage] fall down	43	2026-06-24 16:16:43.972	2026-06-24 16:16:43.972
8848	multiple_choice	「なくなります［ガソリンが～］」 (なくなります［ガソリンが～］) nghĩa là gì?	["[petrol, gasoline] run out, be lost","vừa văn, đúng","buồn tẻ, không hấp dẫn, không thú vị","dở"]	[petrol, gasoline] run out, be lost	43	2026-06-24 16:16:43.977	2026-06-24 16:16:43.977
8849	multiple_choice	「変［な］」 (へん［な］) nghĩa là gì?	["kind, gentle, tender-hearted","strange, peculiar","buồn tẻ, không hấp dẫn, không thú vị","get acquainted"]	strange, peculiar	43	2026-06-24 16:16:43.979	2026-06-24 16:16:43.979
8850	multiple_choice	「幸せ［な］」 (しあわせ［な］) nghĩa là gì?	["[baggage] fall down","[a button] come off","thêm vào đó, hơn thế","happy"]	happy	43	2026-06-24 16:16:43.98	2026-06-24 16:16:43.98
8851	multiple_choice	「楽［な］」 (らく［な］) nghĩa là gì?	["thiết bị làm ấm, lò sưởi, máy điều hòa","hoa hồng","[the price] fall, drop","easy"]	easy	43	2026-06-24 16:16:43.982	2026-06-24 16:16:43.982
8852	multiple_choice	「うまい」 (うまい) nghĩa là gì?	["[exports] increase","ngon","apologize","strong, healthy"]	ngon	43	2026-06-24 16:16:43.983	2026-06-24 16:16:43.983
8853	multiple_choice	「まずい」 (まずい) nghĩa là gì?	["thiết bị làm mát, máy điều hòa","tuổi","dở","[the price] fall, drop"]	dở	43	2026-06-24 16:16:43.984	2026-06-24 16:16:43.984
8854	multiple_choice	「つまらない」 (つまらない) nghĩa là gì?	["thiết bị làm mát, máy điều hòa","buồn tẻ, không hấp dẫn, không thú vị","kind, gentle, tender-hearted","[a button] come off"]	buồn tẻ, không hấp dẫn, không thú vị	43	2026-06-24 16:16:43.986	2026-06-24 16:16:43.986
8855	multiple_choice	「優しい」 (やさしい) nghĩa là gì?	["[the price] rise","ngon","reason","kind, gentle, tender-hearted"]	kind, gentle, tender-hearted	43	2026-06-24 16:16:43.987	2026-06-24 16:16:43.987
8856	fill_in_blank	Điền hiragana cho: "[petrol, gasoline] run out, be lost"	\N	なくなります［ガソリンが～］	43	2026-06-24 16:16:43.989	2026-06-24 16:16:43.989
8857	fill_in_blank	Điền hiragana cho: "happy"	\N	しあわせ［な］	43	2026-06-24 16:16:43.993	2026-06-24 16:16:43.993
8858	fill_in_blank	Điền hiragana cho: "[exports] decrease"	\N	へります［ゆしゅつが～］	43	2026-06-24 16:16:43.996	2026-06-24 16:16:43.996
8859	fill_in_blank	Điền hiragana cho: "thiết bị làm mát, máy điều hòa"	\N	れいぼう	43	2026-06-24 16:16:43.997	2026-06-24 16:16:43.997
8860	fill_in_blank	Điền hiragana cho: "tên là~/ được gọi là~"	\N	～と いいます	43	2026-06-24 16:16:43.999	2026-06-24 16:16:43.999
8861	multiple_choice	「泣きます」 (なきます) nghĩa là gì?	["khóc","cắt tóc","phòng đôi","trượt"]	khóc	44	2026-06-24 16:16:44.167	2026-06-24 16:16:44.167
8862	multiple_choice	「笑います」 (わらいます) nghĩa là gì?	["cười","trượt","DVD","xà-bông gội đầu"]	cười	44	2026-06-24 16:16:44.168	2026-06-24 16:16:44.168
8863	multiple_choice	「眠ります」 (ねむります) nghĩa là gì?	["trượt","cười","sleep","－ times"]	sleep	44	2026-06-24 16:16:44.17	2026-06-24 16:16:44.17
8864	multiple_choice	「乾きます［シャツが～］」 (かわきます［シャツが～］) nghĩa là gì?	["cách nói, cách diễn đạt","món ăn Nhật","món ăn Âu Mỹ","[a shirt] dry"]	[a shirt] dry	44	2026-06-24 16:16:44.171	2026-06-24 16:16:44.171
8865	multiple_choice	「濡れる［シャツが～］」 (ぬれます［シャツが～］) nghĩa là gì?	["[a shirt] get wet","Would this be all right? (polite)","[an accident] happen","món ăn Âu Mỹ"]	[a shirt] get wet	44	2026-06-24 16:16:44.173	2026-06-24 16:16:44.173
8866	multiple_choice	「滑べります」 (すべります) nghĩa là gì?	["phòng đơn","trượt","Would this be all right? (polite)","không khí"]	trượt	44	2026-06-24 16:16:44.176	2026-06-24 16:16:44.176
8867	multiple_choice	「起きます［事故が～］」 (おきます［じこが～］) nghĩa là gì?	["trượt","nhạt; lợt","thức ăn","[an accident] happen"]	[an accident] happen	44	2026-06-24 16:16:44.179	2026-06-24 16:16:44.179
8868	multiple_choice	「調節します」 (ちょうせつします) nghĩa là gì?	["thick","điều tiết, điều chỉnh","trượt","không may, không lành"]	điều tiết, điều chỉnh	44	2026-06-24 16:16:44.18	2026-06-24 16:16:44.18
8869	multiple_choice	「安全［な］」 (あんぜん［な］) nghĩa là gì?	["cách nói, cách diễn đạt","thức ăn","an toàn","điều tiết, điều chỉnh"]	an toàn	44	2026-06-24 16:16:44.182	2026-06-24 16:16:44.182
8870	multiple_choice	「危険［な］」 (きけん［な］) nghĩa là gì?	["lịch sự","dangerous","an toàn","Do it like ～."]	dangerous	44	2026-06-24 16:16:44.183	2026-06-24 16:16:44.183
8871	multiple_choice	「濃い」 (こい) nghĩa là gì?	["relieved","[a shirt] dry","xà-bông gội đầu","đậm; nồng"]	đậm; nồng	44	2026-06-24 16:16:44.185	2026-06-24 16:16:44.185
8872	multiple_choice	「薄い」 (うすい) nghĩa là gì?	["trượt","What can I do for you? (respectful)","an toàn","nhạt; lợt"]	nhạt; lợt	44	2026-06-24 16:16:44.186	2026-06-24 16:16:44.186
8873	multiple_choice	「厚い」 (あつい) nghĩa là gì?	["[a shirt] get wet","thick","[an accident] happen","lý do"]	thick	44	2026-06-24 16:16:44.187	2026-06-24 16:16:44.187
8874	multiple_choice	「太い」 (ふとい) nghĩa là gì?	["không khí","thick (of large diameter)","thức ăn","ví dụ"]	thick (of large diameter)	44	2026-06-24 16:16:44.189	2026-06-24 16:16:44.189
8875	multiple_choice	「細い」 (ほそい) nghĩa là gì?	["thick (of large diameter)","cắt tóc","thin (of small diameter)","lịch sự"]	thin (of small diameter)	44	2026-06-24 16:16:44.192	2026-06-24 16:16:44.192
8876	fill_in_blank	Điền hiragana cho: "xà-bông gội đầu"	\N	シャンプー	44	2026-06-24 16:16:44.194	2026-06-24 16:16:44.194
8877	fill_in_blank	Điền hiragana cho: "an toàn"	\N	あんぜん［な］	44	2026-06-24 16:16:44.195	2026-06-24 16:16:44.195
8878	fill_in_blank	Điền hiragana cho: "lịch sự"	\N	ていねい［な］	44	2026-06-24 16:16:44.197	2026-06-24 16:16:44.197
8879	fill_in_blank	Điền hiragana cho: "thứ tự"	\N	じゅんじょ	44	2026-06-24 16:16:44.199	2026-06-24 16:16:44.199
8880	fill_in_blank	Điền hiragana cho: "What can I do for you? (respectful)"	\N	どう なさいますか。	44	2026-06-24 16:16:44.201	2026-06-24 16:16:44.201
8881	multiple_choice	「信じます」 (しんじます) nghĩa là gì?	["tin, tin tưởng","inform","hủy, hủy bỏ","nhân viên"]	tin, tin tưởng	45	2026-06-24 16:16:44.454	2026-06-24 16:16:44.454
8882	multiple_choice	「キャンセルします」 (キャンセルします) nghĩa là gì?	["điểm","hủy, hủy bỏ","alarm clock","plum (blossom)"]	hủy, hủy bỏ	45	2026-06-24 16:16:44.459	2026-06-24 16:16:44.459
8883	multiple_choice	「知らせます」 (しらせます) nghĩa là gì?	["inform","tin, tin tưởng","đúng , hẳn hoi","[－ yen] note, bill"]	inform	45	2026-06-24 16:16:44.463	2026-06-24 16:16:44.463
8884	multiple_choice	「保証書」 (ほしょうしょ) nghĩa là gì?	["giấy bảo hành","gấp","điểm","tuy nhiên"]	giấy bảo hành	45	2026-06-24 16:16:44.466	2026-06-24 16:16:44.466
8885	multiple_choice	「領収書」 (りょうしゅうしょ) nghĩa là gì?	["sinh viên đại học","điện thoại nhầm","hóa đơn","ngủ"]	hóa đơn	45	2026-06-24 16:16:44.471	2026-06-24 16:16:44.471
8886	multiple_choice	「キャンプ」 (キャンプ) nghĩa là gì?	["trại","sinh viên đại học","plum (blossom)","the emergency police telephone number"]	trại	45	2026-06-24 16:16:44.476	2026-06-24 16:16:44.476
8887	multiple_choice	「中止」 (ちゅうし) nghĩa là gì?	["điểm","cấm, đình chỉ","điều lo nghĩ, trăn trở, phiền muộn","cài đặt"]	cấm, đình chỉ	45	2026-06-24 16:16:44.481	2026-06-24 16:16:44.481
8888	multiple_choice	「点」 (てん) nghĩa là gì?	["điểm","cài đặt","That's all","điện thoại nhầm"]	điểm	45	2026-06-24 16:16:44.485	2026-06-24 16:16:44.485
8889	multiple_choice	「梅」 (うめ) nghĩa là gì?	["plum (blossom)","nhân viên","tin, tin tưởng","sinh viên đại học"]	plum (blossom)	45	2026-06-24 16:16:44.49	2026-06-24 16:16:44.49
8890	multiple_choice	「１１０番」 (１１０ばん) nghĩa là gì?	["unreasonably","chuẩn bị","the emergency police telephone number","nhân viên"]	the emergency police telephone number	45	2026-06-24 16:16:44.495	2026-06-24 16:16:44.495
8891	multiple_choice	「１１９番」 (１１９ばん) nghĩa là gì?	["đúng , hẳn hoi","gấp","the emergency fire service telephone number","điểm"]	the emergency fire service telephone number	45	2026-06-24 16:16:44.5	2026-06-24 16:16:44.5
8892	multiple_choice	「急に」 (きゅうに) nghĩa là gì?	["hủy, hủy bỏ","gấp","unreasonably","điện thoại nhầm"]	gấp	45	2026-06-24 16:16:44.504	2026-06-24 16:16:44.504
8893	multiple_choice	「無理に」 (むりに) nghĩa là gì?	["unreasonably","inform","alarm clock","-th (ranking)"]	unreasonably	45	2026-06-24 16:16:44.509	2026-06-24 16:16:44.509
8894	multiple_choice	「楽しみに して います」 (たのしみに して います) nghĩa là gì?	["sinh viên đại học","xin lỗi, tạ lỗi","mong đợi, lấy làm vui","tuy nhiên"]	mong đợi, lấy làm vui	45	2026-06-24 16:16:44.512	2026-06-24 16:16:44.512
8895	multiple_choice	「以上です。」 (いじょうです。) nghĩa là gì?	["inform","ngủ","the emergency police telephone number","That's all"]	That's all	45	2026-06-24 16:16:44.515	2026-06-24 16:16:44.515
8896	fill_in_blank	Điền hiragana cho: "nhân viên"	\N	かかりいん	45	2026-06-24 16:16:44.518	2026-06-24 16:16:44.518
8897	fill_in_blank	Điền hiragana cho: "-th (ranking)"	\N	－い	45	2026-06-24 16:16:44.521	2026-06-24 16:16:44.521
8898	fill_in_blank	Điền hiragana cho: "tuy nhiên"	\N	それでも	45	2026-06-24 16:16:44.527	2026-06-24 16:16:44.527
8899	fill_in_blank	Điền hiragana cho: "mong đợi, lấy làm vui"	\N	たのしみに して います	45	2026-06-24 16:16:44.532	2026-06-24 16:16:44.532
8900	fill_in_blank	Điền hiragana cho: "giấy bảo hành"	\N	ほしょうしょ	45	2026-06-24 16:16:44.536	2026-06-24 16:16:44.536
8901	multiple_choice	「渡します」 (わたします) nghĩa là gì?	["[bread] be baked","quay về","trao","pamphlet"]	trao	46	2026-06-24 16:16:44.799	2026-06-24 16:16:44.799
8902	multiple_choice	「帰って 来ます」 (かえって きます) nghĩa là gì?	["be lucky","quay về","âm thanh nổi","[a bus] leave, depart"]	quay về	46	2026-06-24 16:16:44.801	2026-06-24 16:16:44.801
8903	multiple_choice	「出ます［バスが～］」 (でます［バスが～］) nghĩa là gì?	["in order","mới hồi nãy","[a bus] leave, depart","hệ thống"]	[a bus] leave, depart	46	2026-06-24 16:16:44.802	2026-06-24 16:16:44.802
8904	multiple_choice	「届きます［荷物が～］」 (とどきます［にもつが～］) nghĩa là gì?	["trung tâm dịch vụ gas","be lucky","[parcels] be delivered","pamphlet"]	[parcels] be delivered	46	2026-06-24 16:16:44.803	2026-06-24 16:16:44.803
8905	multiple_choice	「入学します［大学に～］」 (にゅうがくします［だいがくに～］) nghĩa là gì?	["incident","enter [a university]","quay về","I'm sorry."]	enter [a university]	46	2026-06-24 16:16:44.805	2026-06-24 16:16:44.805
8906	multiple_choice	「卒業します［大学を～］」 (そつぎょうします［だいがくを～］) nghĩa là gì?	["trao","trung tâm dịch vụ gas","ring","graduate [from a university]"]	graduate [from a university]	46	2026-06-24 16:16:44.81	2026-06-24 16:16:44.81
8907	multiple_choice	「焼きます」 (やきます) nghĩa là gì?	["in order","một bộ phận","chỗ (chúng tôi), phía (chúng tôi)","nướng"]	nướng	46	2026-06-24 16:16:44.812	2026-06-24 16:16:44.812
8908	multiple_choice	「焼けます［パンが～］」 (やけます［パンが～］) nghĩa là gì?	["floor","quanh vùng ~","[bread] be baked","hướng về"]	[bread] be baked	46	2026-06-24 16:16:44.813	2026-06-24 16:16:44.813
8909	multiple_choice	「焼けます［肉が～］」 (やけます［にくが～］) nghĩa là gì?	["hệ thống","[meat] be roasted, be grilled","trung tâm dịch vụ gas","I'm sorry."]	[meat] be roasted, be grilled	46	2026-06-24 16:16:44.815	2026-06-24 16:16:44.815
8910	multiple_choice	「留守」 (るす) nghĩa là gì?	["for example","vắng nhà, đi vắng","pamphlet","[a book] be published"]	vắng nhà, đi vắng	46	2026-06-24 16:16:44.816	2026-06-24 16:16:44.816
8911	multiple_choice	「宅配便」 (たくはいびん) nghĩa là gì?	["Who is this, please?","trạng thái, tình trạng","trao","dịch vụ trao tận nhà"]	dịch vụ trao tận nhà	46	2026-06-24 16:16:44.818	2026-06-24 16:16:44.818
8912	multiple_choice	「原因」 (げんいん) nghĩa là gì?	["trung tâm dịch vụ gas","floor","nguyên nhân","incident"]	nguyên nhân	46	2026-06-24 16:16:44.819	2026-06-24 16:16:44.819
8913	multiple_choice	「こちら」 (こちら) nghĩa là gì?	["chỗ (chúng tôi), phía (chúng tôi)","[meat] be roasted, be grilled","giây","quay về"]	chỗ (chúng tôi), phía (chúng tôi)	46	2026-06-24 16:16:44.821	2026-06-24 16:16:44.821
8914	multiple_choice	「～の 所」 (～の ところ) nghĩa là gì?	["quanh vùng ~","một bộ phận","tiêm","âm thanh nổi"]	quanh vùng ~	46	2026-06-24 16:16:44.824	2026-06-24 16:16:44.824
8915	multiple_choice	「半年」 (はんとし) nghĩa là gì?	["half a year","[parcels] be delivered","fall down, fall over","sự thèm ăn"]	half a year	46	2026-06-24 16:16:44.827	2026-06-24 16:16:44.827
8916	fill_in_blank	Điền hiragana cho: "floor"	\N	ゆか	46	2026-06-24 16:16:44.829	2026-06-24 16:16:44.829
8917	fill_in_blank	Điền hiragana cho: "[meat] be roasted, be grilled"	\N	やけます［にくが～］	46	2026-06-24 16:16:44.831	2026-06-24 16:16:44.831
8918	fill_in_blank	Điền hiragana cho: "quanh vùng ~"	\N	～の ところ	46	2026-06-24 16:16:44.833	2026-06-24 16:16:44.833
8919	fill_in_blank	Điền hiragana cho: "kho báu"	\N	ほうこ	46	2026-06-24 16:16:44.834	2026-06-24 16:16:44.834
8920	fill_in_blank	Điền hiragana cho: "Who is this, please?"	\N	どちらさまでしょうか。	46	2026-06-24 16:16:44.836	2026-06-24 16:16:44.836
8921	multiple_choice	「吹きます［風が～］」 (ふきます［かぜが～］) nghĩa là gì?	["[wind] blow","thí nghiệm, thực nghiệm","president","sợ, khiếp"]	[wind] blow	47	2026-06-24 16:16:44.996	2026-06-24 16:16:44.996
8922	multiple_choice	「燃えます［ごみが～］」 (もえます［ごみが～］) nghĩa là gì?	["[rubbish] burn","reason","tồi tệ, xấu","[sound/voice] be heard"]	[rubbish] burn	47	2026-06-24 16:16:44.998	2026-06-24 16:16:44.998
8923	multiple_choice	「亡くなります」 (なくなります) nghĩa là gì?	["đính hôn","data","put up [an umbrella]","pass away (euphemistic expression for しにます)"]	pass away (euphemistic expression for しにます)	47	2026-06-24 16:16:44.999	2026-06-24 16:16:44.999
8924	multiple_choice	「集まります［人が～］」 (あつまります［ひとが～］) nghĩa là gì?	["[people] gather","[rubbish] burn","tán thành, đồng ý","data"]	[people] gather	47	2026-06-24 16:16:45.001	2026-06-24 16:16:45.001
8925	multiple_choice	「別れます［人が～］」 (わかれます［ひとが～］) nghĩa là gì?	["relationship","pass away (euphemistic expression for しにます)","[people] part, separate","[sound/voice] be heard"]	[people] part, separate	47	2026-06-24 16:16:45.002	2026-06-24 16:16:45.002
8926	multiple_choice	「します［音／声が～］」 (します［おと／こえが～］) nghĩa là gì?	["taste","quen biết","[sound/voice] be heard","long life (～します : live long)"]	[sound/voice] be heard	47	2026-06-24 16:16:45.003	2026-06-24 16:16:45.003
8927	multiple_choice	「します［味が～］」 (します［あじが～］) nghĩa là gì?	["xe ô-tô cảnh sát","[sound/voice] be heard","taste","sợ, khiếp"]	taste	47	2026-06-24 16:16:45.005	2026-06-24 16:16:45.005
8928	multiple_choice	「します［においが～］」 (します［においが～］) nghĩa là gì?	["smell","Bali [island] (in Indonesia)","tồi tệ, xấu","dân số"]	smell	47	2026-06-24 16:16:45.01	2026-06-24 16:16:45.01
8929	multiple_choice	「厳しい」 (きびしい) nghĩa là gì?	["khoa học","người yêu","strict, hard","hormone"]	strict, hard	47	2026-06-24 16:16:45.012	2026-06-24 16:16:45.012
8930	multiple_choice	「ひどい」 (ひどい) nghĩa là gì?	["tồi tệ, xấu","sự trang điểm (～をします：trang điểm)","phái nam","long life (～します : live long)"]	tồi tệ, xấu	47	2026-06-24 16:16:45.014	2026-06-24 16:16:45.014
8931	multiple_choice	「怖い」 (こわい) nghĩa là gì?	["take care of","dự báo thời tiết","tán thành, đồng ý","sợ, khiếp"]	sợ, khiếp	47	2026-06-24 16:16:45.016	2026-06-24 16:16:45.016
8932	multiple_choice	「実験」 (じっけん) nghĩa là gì?	["thí nghiệm, thực nghiệm","cuộc điều tra, nghiên cứu","strict, hard","đính hôn"]	thí nghiệm, thực nghiệm	47	2026-06-24 16:16:45.018	2026-06-24 16:16:45.018
8933	multiple_choice	「データ」 (データ) nghĩa là gì?	["có vẽ như là, có lẽ là","data","relationship","công bố, thuyết trình"]	data	47	2026-06-24 16:16:45.02	2026-06-24 16:16:45.02
8934	multiple_choice	「人口」 (じんこう) nghĩa là gì?	["California (in U.S.A.)","phái nam","người yêu","dân số"]	dân số	47	2026-06-24 16:16:45.021	2026-06-24 16:16:45.021
8935	multiple_choice	「におい」 (におい) nghĩa là gì?	["mùi","đối tượng, đối tác, nửa còn lại","cuộc điều tra, nghiên cứu","văn học"]	mùi	47	2026-06-24 16:16:45.025	2026-06-24 16:16:45.025
8936	fill_in_blank	Điền hiragana cho: "take care of"	\N	せわを します	47	2026-06-24 16:16:45.027	2026-06-24 16:16:45.027
8937	fill_in_blank	Điền hiragana cho: "taste"	\N	します［あじが～］	47	2026-06-24 16:16:45.028	2026-06-24 16:16:45.028
8938	fill_in_blank	Điền hiragana cho: "California (in U.S.A.)"	\N	カリフォルニア	47	2026-06-24 16:16:45.03	2026-06-24 16:16:45.03
8939	fill_in_blank	Điền hiragana cho: "put up [an umbrella]"	\N	さします［かさを～］	47	2026-06-24 16:16:45.031	2026-06-24 16:16:45.031
8940	fill_in_blank	Điền hiragana cho: "não"	\N	のう	47	2026-06-24 16:16:45.032	2026-06-24 16:16:45.032
8941	multiple_choice	「降ろします、下ろします」 (おろします) nghĩa là gì?	["người (là người thân hoặc cấp dưới)","nghiêm khắc, nghiêm ngặt","-th century","cho xuống, hạ xuống"]	cho xuống, hạ xuống	48	2026-06-24 16:16:45.209	2026-06-24 16:16:45.209
8942	multiple_choice	「届ける」 (とどけます) nghĩa là gì?	["gửi đến, chuyển đến","It's all right./I don't mind.","người (là người thân hoặc cấp dưới)","file"]	gửi đến, chuyển đến	48	2026-06-24 16:16:45.214	2026-06-24 16:16:45.214
8943	multiple_choice	「世話を します」 (せわを します) nghĩa là gì?	["kinh doanh, bán hàng","anh/chị đang bận phải không?","chăm sóc","calligraphy"]	chăm sóc	48	2026-06-24 16:16:45.218	2026-06-24 16:16:45.218
8944	multiple_choice	「録音します」 (ろくおんします) nghĩa là gì?	["kinh doanh, bán hàng","record","chăm sóc","－ percent"]	record	48	2026-06-24 16:16:45.223	2026-06-24 16:16:45.223
8945	multiple_choice	「嫌［な］」 (いや［な］) nghĩa là gì?	["unwilling, reluctant","sau khoảng thời gian dài","vui thích","visa tái nhập cảnh"]	unwilling, reluctant	48	2026-06-24 16:16:45.228	2026-06-24 16:16:45.228
8946	multiple_choice	「塾」 (じゅく) nghĩa là gì?	["cở sở học thêm","thời khóa biểu, lịch trình","－ percent","thay thế"]	cở sở học thêm	48	2026-06-24 16:16:45.232	2026-06-24 16:16:45.232
8947	multiple_choice	「生徒」 (せいと) nghĩa là gì?	["dáng hình, tư thế","normal, usual","học trò, học sinh","record"]	học trò, học sinh	48	2026-06-24 16:16:45.236	2026-06-24 16:16:45.236
8948	multiple_choice	「ファイル」 (ファイル) nghĩa là gì?	["file","giành được","học trò, học sinh","-th century"]	file	48	2026-06-24 16:16:45.242	2026-06-24 16:16:45.242
8949	multiple_choice	「自由に」 (じゆうに) nghĩa là gì?	["pupil, elementary schoolchild","It's all right./I don't mind.","file","một cách tự do"]	một cách tự do	48	2026-06-24 16:16:45.247	2026-06-24 16:16:45.247
8950	multiple_choice	「～間」 (～かん) nghĩa là gì?	["đến trước lúc đó","tốc độ","parent","trong ~(nói về thời lượng)"]	trong ~(nói về thời lượng)	48	2026-06-24 16:16:45.251	2026-06-24 16:16:45.251
8951	multiple_choice	「いい ことですね。」 (いい ことですね。) nghĩa là gì?	["hay nhỉ/ được đấy nhỉ","xiếc","sau khoảng thời gian dài","học trò, học sinh"]	hay nhỉ/ được đấy nhỉ	48	2026-06-24 16:16:45.255	2026-06-24 16:16:45.255
8952	multiple_choice	「お忙しいですか。」 (おいそがしいですか。) nghĩa là gì?	["anh/chị đang bận phải không?","kinh doanh, bán hàng","-th century","unwilling, reluctant"]	anh/chị đang bận phải không?	48	2026-06-24 16:16:45.26	2026-06-24 16:16:45.26
8953	multiple_choice	「営業」 (えいぎょう) nghĩa là gì?	["normal, usual","next","vốn dĩ","kinh doanh, bán hàng"]	kinh doanh, bán hàng	48	2026-06-24 16:16:45.263	2026-06-24 16:16:45.263
8954	multiple_choice	「それまでに」 (それまでに) nghĩa là gì?	["hay nhỉ/ được đấy nhỉ","đến trước lúc đó","tốc độ","visa tái nhập cảnh"]	đến trước lúc đó	48	2026-06-24 16:16:45.266	2026-06-24 16:16:45.266
8955	multiple_choice	「かまいません。」 (かまいません。) nghĩa là gì?	["anh/chị đang bận phải không?","tốc độ","cở sở học thêm","It's all right./I don't mind."]	It's all right./I don't mind.	48	2026-06-24 16:16:45.269	2026-06-24 16:16:45.269
8956	fill_in_blank	Điền hiragana cho: "gửi đến, chuyển đến"	\N	とどけます	48	2026-06-24 16:16:45.271	2026-06-24 16:16:45.271
8957	fill_in_blank	Điền hiragana cho: "thời khóa biểu, lịch trình"	\N	スケジュール	48	2026-06-24 16:16:45.275	2026-06-24 16:16:45.275
8958	fill_in_blank	Điền hiragana cho: "tâm hồn ,trái tim"	\N	こころ	48	2026-06-24 16:16:45.277	2026-06-24 16:16:45.277
8959	fill_in_blank	Điền hiragana cho: "pupil, elementary schoolchild"	\N	しょうがくせい	48	2026-06-24 16:16:45.28	2026-06-24 16:16:45.28
8960	fill_in_blank	Điền hiragana cho: "tốc độ"	\N	スピード	48	2026-06-24 16:16:45.283	2026-06-24 16:16:45.283
8961	multiple_choice	「利用します」 (りようします) nghĩa là gì?	["ngài ~(dạng tôn kính của ~さん)","develop, create","thế thì ( chỉ sự bắt đầu hay kết thúc )","use"]	use	49	2026-06-24 16:16:45.623	2026-06-24 16:16:45.623
8962	multiple_choice	「勤めます［会社に～］」 (つとめます［かいしゃに～］) nghĩa là gì?	["tác phẩm","sit on [a chair]","work [for a company]","xin đừng ngại"]	work [for a company]	49	2026-06-24 16:16:45.628	2026-06-24 16:16:45.628
8963	multiple_choice	「掛けます［いすに～］」 (かけます［いすに～］) nghĩa là gì?	["vậy thì (dạng lịch sự của じゃ)","sit on [a chair]","ngài ~(dạng tôn kính của ~さん)","run [a fever]"]	sit on [a chair]	49	2026-06-24 16:16:45.632	2026-06-24 16:16:45.632
8964	multiple_choice	「過ごします」 (すごします) nghĩa là gì?	["trạm dừng xe BUS","fictitious elementary school","trải qua (thời gian)","gạt tàn thuốc"]	trải qua (thời gian)	49	2026-06-24 16:16:45.636	2026-06-24 16:16:45.636
8965	multiple_choice	「いらっしゃいます」 (いらっしゃいます) nghĩa là gì?	["ăn, uống (tôn kính ngữ của たべます và のみます)","Nobel Prize","ở, có, đi, đến （tôn kính ngữ của います、いきます và きます）","(one's name) is ～"]	ở, có, đi, đến （tôn kính ngữ của います、いきます và きます）	49	2026-06-24 16:16:45.64	2026-06-24 16:16:45.64
8966	multiple_choice	「召し上がります」 (めしあがります) nghĩa là gì?	["ăn, uống (tôn kính ngữ của たべます và のみます)","trạm dừng xe BUS","the medical department","Japanese novelist (1935- )"]	ăn, uống (tôn kính ngữ của たべます và のみます)	49	2026-06-24 16:16:45.645	2026-06-24 16:16:45.645
8967	multiple_choice	「おっしゃいます」 (おっしゃいます) nghĩa là gì?	["nghỉ ngơi","nói (tôn kính ngữ của いいます)","background","hội trường"]	nói (tôn kính ngữ của いいます)	49	2026-06-24 16:16:45.649	2026-06-24 16:16:45.649
8968	multiple_choice	「なさいます」 (なさいます) nghĩa là gì?	["khuyết tật, khiếm khuyết","lecture meeting","ở, có, đi, đến （tôn kính ngữ của います、いきます và きます）","làm (tôn kính ngữ của します)"]	làm (tôn kính ngữ của します)	49	2026-06-24 16:16:45.652	2026-06-24 16:16:45.652
8969	multiple_choice	「ご覧に なります」 (ごらんに なります) nghĩa là gì?	["mang tính chất thế giới,toàn cầu","thương mại, mậu dịch","xem, nhìn (tôn kính ngữ của みます)","có (cách nói tôn kính ngữ của もっています)"]	xem, nhìn (tôn kính ngữ của みます)	49	2026-06-24 16:16:45.656	2026-06-24 16:16:45.656
8970	multiple_choice	「ご存じです」 (ごぞんじです) nghĩa là gì?	["class － of -th grade","vậy thì (dạng lịch sự của じゃ)","know (respectful equivalent of しっています)","nhiều ~"]	know (respectful equivalent of しっています)	49	2026-06-24 16:16:45.66	2026-06-24 16:16:45.66
8971	multiple_choice	「あいさつ」 (あいさつ) nghĩa là gì?	["lời chào hỏi (~をします:chào hỏi)","go on (to graduate school)","nói (tôn kính ngữ của いいます)","đại học Tokyo"]	lời chào hỏi (~をします:chào hỏi)	49	2026-06-24 16:16:45.664	2026-06-24 16:16:45.664
8972	multiple_choice	「旅館」 (りょかん) nghĩa là gì?	["sit on [a chair]","nhà trọ, nhà nghỉ","viết( sáng tác) nhạc, bài hát","giảng viên, báo cáo viên"]	nhà trọ, nhà nghỉ	49	2026-06-24 16:16:45.667	2026-06-24 16:16:45.667
8973	multiple_choice	「バス停」 (バスてい) nghĩa là gì?	["gạt tàn thuốc","nói (tôn kính ngữ của いいます)","khuyết tật, khiếm khuyết","trạm dừng xe BUS"]	trạm dừng xe BUS	49	2026-06-24 16:16:45.671	2026-06-24 16:16:45.671
8974	multiple_choice	「奥様」 (おくさま) nghĩa là gì?	["nhà trọ, nhà nghỉ","trạm dừng xe BUS","(someone else's) wife (respectful equivalent of おくさん)","run [a fever]"]	(someone else's) wife (respectful equivalent of おくさん)	49	2026-06-24 16:16:45.676	2026-06-24 16:16:45.676
8975	multiple_choice	「～様」 (～さま) nghĩa là gì?	["Nobel Prize","use","ngài ~(dạng tôn kính của ~さん)","human"]	ngài ~(dạng tôn kính của ~さん)	49	2026-06-24 16:16:45.68	2026-06-24 16:16:45.68
8976	fill_in_blank	Điền hiragana cho: "run [a fever]"	\N	だします［ねつを～］	49	2026-06-24 16:16:45.685	2026-06-24 16:16:45.685
8977	fill_in_blank	Điền hiragana cho: "Japanese novelist (1935- )"	\N	おおえ けんざぶろう	49	2026-06-24 16:16:45.691	2026-06-24 16:16:45.691
8978	fill_in_blank	Điền hiragana cho: "giải thưởng Nobel văn học"	\N	ノーベルぶんがくしょう	49	2026-06-24 16:16:45.697	2026-06-24 16:16:45.697
8979	fill_in_blank	Điền hiragana cho: "go on (to graduate school)"	\N	すすみます	49	2026-06-24 16:16:45.703	2026-06-24 16:16:45.703
8980	fill_in_blank	Điền hiragana cho: "có (cách nói tôn kính ngữ của もっています)"	\N	おもちです	49	2026-06-24 16:16:45.71	2026-06-24 16:16:45.71
8981	multiple_choice	「参ります」 (まいります) nghĩa là gì?	["từ đáy lòng, thật lòng","nửa năm","đi, đến (khiêm nhường ngữ của いきます và きます)","[dream] be realized, come true"]	đi, đến (khiêm nhường ngữ của いきます và きます)	50	2026-06-24 16:16:46.1	2026-06-24 16:16:46.1
8982	multiple_choice	「おります」 (おります) nghĩa là gì?	["nói (dạng khiêm tốn của いいます)","gratitude, thanks","gặp (dạng khiêm tốn của あいます )","có (dạng khiêm tốn của います)"]	có (dạng khiêm tốn của います)	50	2026-06-24 16:16:46.105	2026-06-24 16:16:46.105
8983	multiple_choice	「いただきます」 (いただきます) nghĩa là gì?	["đẹp","ăn,uống,nhận (dạng khiêm tốn của たべます)","căng thẳng, hồi hộp","biết(dạng khiêm tốn của しります)"]	ăn,uống,nhận (dạng khiêm tốn của たべます)	50	2026-06-24 16:16:46.111	2026-06-24 16:16:46.111
8984	multiple_choice	「申します」 (もうします) nghĩa là gì?	["làm(dạng khiêm tốn của します)","xem (dạng khiêm tốn của もます)","đi, đến (khiêm nhường ngữ của いきます và きます)","nói (dạng khiêm tốn của いいます)"]	nói (dạng khiêm tốn của いいます)	50	2026-06-24 16:16:46.116	2026-06-24 16:16:46.116
8985	multiple_choice	「いたします」 (いたします) nghĩa là gì?	["schedule","đẹp","[dream] be realized, come true","làm(dạng khiêm tốn của します)"]	làm(dạng khiêm tốn của します)	50	2026-06-24 16:16:46.122	2026-06-24 16:16:46.122
8986	multiple_choice	「拝見します」 (はいけんします) nghĩa là gì?	["xem (dạng khiêm tốn của もます)","tập ảnh,Album","kính thư( viết cuối thư)","gratitude, thanks"]	xem (dạng khiêm tốn của もます)	50	2026-06-24 16:16:46.126	2026-06-24 16:16:46.126
8987	multiple_choice	「存じます」 (ぞんじます) nghĩa là gì?	["biết(dạng khiêm tốn của しります)","hiệp lực, cộng tác","từ đáy lòng, thật lòng","phát thanh,phát hình"]	biết(dạng khiêm tốn của しります)	50	2026-06-24 16:16:46.13	2026-06-24 16:16:46.13
8988	multiple_choice	「伺います」 (うかがいます) nghĩa là gì?	["hỏi,nghe,hỏi thăm (dạng khiêm tốn của ききますvà いきます)","record [on video], video","tôi (dạng khiêm tốn của わたし)","đẹp"]	hỏi,nghe,hỏi thăm (dạng khiêm tốn của ききますvà いきます)	50	2026-06-24 16:16:46.133	2026-06-24 16:16:46.133
8989	multiple_choice	「お目に かかります」 (おめに かかります) nghĩa là gì?	["nhà (của người khác)","gặp (dạng khiêm tốn của あいます )","How are you doing? (respectful equivalent of おげんきですか)","hướng dẫn viên"]	gặp (dạng khiêm tốn của あいます )	50	2026-06-24 16:16:46.136	2026-06-24 16:16:46.136
8990	multiple_choice	「いれます［コーヒーを～］」 (いれます［コーヒーを～］) nghĩa là gì?	["nói (dạng khiêm tốn của いいます)","tuần tới nữa","make [coffee]","How are you doing? (respectful equivalent of おげんきですか)"]	make [coffee]	50	2026-06-24 16:16:46.142	2026-06-24 16:16:46.142
8991	multiple_choice	「用意します」 (よういします) nghĩa là gì?	["tận dụng, phát huy","đi, đến (khiêm nhường ngữ của いきます và きます)","tuần tới nữa","prepare"]	prepare	50	2026-06-24 16:16:46.145	2026-06-24 16:16:46.145
8992	multiple_choice	「私」 (わたくし) nghĩa là gì?	["ăn,uống,nhận (dạng khiêm tốn của たべます)","tôi (dạng khiêm tốn của わたし)","làm phiền","support"]	tôi (dạng khiêm tốn của わたし)	50	2026-06-24 16:16:46.148	2026-06-24 16:16:46.148
8993	multiple_choice	「ガイド」 (ガイド) nghĩa là gì?	["hỏi,nghe,hỏi thăm (dạng khiêm tốn của ききますvà いきます)","đi, đến (khiêm nhường ngữ của いきます và きます)","Edo-Tokyo Museum","hướng dẫn viên"]	hướng dẫn viên	50	2026-06-24 16:16:46.151	2026-06-24 16:16:46.151
8994	multiple_choice	「メールアドレス」 (メールアドレス) nghĩa là gì?	["phát thanh,phát hình","e-mail address","tôi đã về !","Edo-Tokyo Museum"]	e-mail address	50	2026-06-24 16:16:46.155	2026-06-24 16:16:46.155
8995	multiple_choice	「スケジュール」 (スケジュール) nghĩa là gì?	["đi, đến (khiêm nhường ngữ của いきます và きます)","con voi","schedule","có (dạng khiêm tốn của います)"]	schedule	50	2026-06-24 16:16:46.161	2026-06-24 16:16:46.161
8996	fill_in_blank	Điền hiragana cho: "xem (dạng khiêm tốn của もます)"	\N	はいけんします	50	2026-06-24 16:16:46.164	2026-06-24 16:16:46.164
8997	fill_in_blank	Điền hiragana cho: "con voi"	\N	ぞう	50	2026-06-24 16:16:46.166	2026-06-24 16:16:46.166
8998	fill_in_blank	Điền hiragana cho: "đẹp"	\N	うつくしい	50	2026-06-24 16:16:46.169	2026-06-24 16:16:46.169
8999	fill_in_blank	Điền hiragana cho: "How are you doing? (respectful equivalent of おげんきですか)"	\N	おげんきで いらっしゃいますか。	50	2026-06-24 16:16:46.175	2026-06-24 16:16:46.175
9000	fill_in_blank	Điền hiragana cho: "làm(dạng khiêm tốn của します)"	\N	いたします	50	2026-06-24 16:16:46.181	2026-06-24 16:16:46.181
\.


--
-- Data for Name: Grammar; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Grammar" (id, pattern, meaning, explanation, "lessonId", "createdAt", "updatedAt") FROM stdin;
2937	N1 は N2 です	N1 là N2	Cách dùng : – Danh từ đứng trước は là chủ đề hoặc chủ ngữ trong câu.\n\n– です được sử dụng cuối câu khẳng định, biểu lộ sự lịch sự đối với người nghe.\n\n– Đứng trước です là một danh từ hoặc tính từ.\n\nChú ý: は khi là trợ từ được đọc là wa, không phải ha	1	2026-06-24 16:16:32.98	2026-06-24 16:16:32.98
2938	N1 は N2 ではありません。	N1 không phải là N2	Cách dùng: – ではありません là dạng phủ định của です. – Trong hội thoại người ta có thể dùng じゃありません thay cho ではありません\n\nChú ý : では đọc là dewa	1	2026-06-24 16:16:32.994	2026-06-24 16:16:32.994
2939	S + か	1) Câu hỏi nghi vấn (câu hỏi Có Không)	1) Câu hỏi nghi vấn (câu hỏi Có Không)\n\n2) Câu hỏi có từ để hỏi\n\nCách dùng: – Để tạo một câu hỏi chỉ cần thêm か vào cuối câu. – Câu trả lời cho loại câu hỏi này luôn phải có はい (vâng, đúng) hoặc いいえ (không, không phải ). Nếu giản lược đi bị xem là thất lễ.\n\nChú ý: Khi nói thì lên giọng ở trợ từ か	1	2026-06-24 16:16:33.003	2026-06-24 16:16:33.003
2940	N も	N cũng	\N	1	2026-06-24 16:16:33.028	2026-06-24 16:16:33.028
2941	N1 の N2	N2 của N1, N2 thuộc về N1	\N	1	2026-06-24 16:16:33.033	2026-06-24 16:16:33.033
2942	~さん	Cách dùng: – Trong tiếng Nhật sử dụng chữ さん đứng ngay sau tên của người nghe hoặc người thứ 3 để bày tỏ sự kính trọng đối với người đó. – Chữ さん không bao giờ 	Cách dùng: – Trong tiếng Nhật sử dụng chữ さん đứng ngay sau tên của người nghe hoặc người thứ 3 để bày tỏ sự kính trọng đối với người đó. – Chữ さん không bao giờ sử dụng sau tên của chính mình.\n\nChú ý: Khi trao đổi trực tiếp thì người Nhật ít sử dụng あなた khi đã biết tên của người nghe, mà sẽ dùng tên để gọi. Ngoài ra, ở Nhật khi gọi một người nào đó thì gọi nguyên cả tên và họ hoặc chỉ cần gọi họ là đủ. Chỉ gọi tên trong những trường hợp bạn bè quen thân hay người thân trong gia đình.	1	2026-06-24 16:16:33.042	2026-06-24 16:16:33.042
2943	~さい	~ tuổi (hậu tố chỉ tuổi)	Đứng sau số để chỉ tuổi. Viết bằng kanji là 歳.\n\nChú ý: Khi hỏi tuổi trang trọng dùng おいくつですか.	1	2026-06-24 16:16:33.051	2026-06-24 16:16:33.051
2944	Các từ chỉ thị	Cái N này/đó/kia	Cách dùng: – この、その、あの là các từ chỉ thị bổ nghĩa cho danh từ. Về tương quan khoảng cách thì giống với これ、それ、あれ nhưng khác về cách sử dụng vì luôn phải có danh từ đi liền đằng sau.\n\n– “このN” dùng để chỉ vật hoặc người ở gần người nói, xa người nghe.\n\n– “そのN” dùng để chỉ vật hay người ở gần người nghe, xa người nói.\n\n– “あのN” dùng để chỉ vật hay người ở xa cả hai người.\n\nChú ý: なん là từ để hỏi dùng cho vật, だれ là từ để hỏi dùng cho người. これ/それ/あれ は N です\n\nChú ý: Khi một vật ở gần cả hai người thì cả hai người đều có thể dùng これ hay この	2	2026-06-24 16:16:33.336	2026-06-24 16:16:33.336
2945	そうです/そうではありません	Đúng vậy/Không phải thế	Cách dùng: – そう được sử dụng để trả lời câu hỏi nghi vấn mà tận cùng là danh từ. – Trong câu khẳng định dùng: はい、そうです。 Trong câu phủ định dùng: いいえ、そうでは(じゃ)ありません。 Chú ý: Trong trường hợp câu nghi vấn mà tận cùng là động từ hay tính từ thì không sử dụng そうです hay そうではありません để trả lời.	2	2026-06-24 16:16:33.369	2026-06-24 16:16:33.369
2946	N1 ですか、N2 ですか	N1 hay là N2?	Chú ý: Khi trả lời câu hỏi này không dùng はいhay いいえ	2	2026-06-24 16:16:33.373	2026-06-24 16:16:33.373
2947	N1の N2 (tiếp)	N2 của N1	Cách dùng: Ở bài trước, N1 là một tổ chức mà N2 thuộc vào đó. Ở bài này trợ từ の có ý nghĩa chỉ sự sở hữu. N2 thuộc sở hữu của N1\n\nChú ý: – N2 đôi khi được lược bỏ khi đã được nhắc đến trước đó hay đã rõ nghĩa. – Khi N2 là một từ chỉ người thì không được bỏ.	2	2026-06-24 16:16:33.376	2026-06-24 16:16:33.376
2948	そうですか	Ra vậy	Cách dùng: Sử dụng khi người nói nhận được thông tin mới và thể hiện rằng đã hiểu về nó.	2	2026-06-24 16:16:33.395	2026-06-24 16:16:33.395
2949	ここ／そこ／あそこ／こちら／そちら／あちら	The demonstratives ここ, そこ and あそこ refer to places.	The demonstratives ここ, そこ and あそこ refer to places.\n\n- ここ indicates the place where the speaker is.\n- そこ indicates the place where the listener is.\n- あそこ indicates a place distinct from both the speaker and the listener.\n\nこちら, そちら and あちら refer to direction and can also be used as politer-sounding alternatives for ここ, そこ and あそこ.	3	2026-06-24 16:16:33.655	2026-06-24 16:16:33.655
2950	N<sub>1</sub> は N<sub>2</sub>(place) です	Using this sentence pattern, you can state where a place, thing or person is.	Using this sentence pattern, you can state where a place, thing or person is.	3	2026-06-24 16:16:33.658	2026-06-24 16:16:33.658
2951	どこ／どちら	どこ is used for asking "Where?" and どちら for "Which direction?" どちら can also be used for asking "Where?", in which case it	どこ is used for asking "Where?" and どちら for "Which direction?" どちら can also be used for asking "Where?", in which case it is politer than どこ.\n\nどこ and どちら are also used for asking the name of the country, company, school or other place or organization to which someone belongs. なん cannot be used in this case. どちら is politer than どこ.	3	2026-06-24 16:16:33.674	2026-06-24 16:16:33.674
2952	N<sub>1</sub> の N<sub>2</sub>	When N<sub>1</sub> is the name of a country/company and N<sub>2</sub> is the name of a product, it means that N<sub>2</s	When N<sub>1</sub> is the name of a country/company and N<sub>2</sub> is the name of a product, it means that N<sub>2</sub> is made in/by that country/company. The interrogative どこ is used when asking where or by what company something is made.	3	2026-06-24 16:16:33.684	2026-06-24 16:16:33.684
2953	The こ／そ／あ／ど system of demonstratives	|                                   | こ series | そ series | あ series | ど series                                         	|                                   | こ series | そ series | あ series | ど series                                                                                                |\n|-----------------------------------|----------|----------|----------|---------------------------------------------------------------------------------------------------------|\n| Thing                         | これ       | それ       | あれ       | どれ ([L.16](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_16_Grammar.md))   |\n| Thing / Person                | この N     | その N     | あの N     | どの N ([L.16](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_16_Grammar.md)) |\n| Place                         | ここ       | そこ       | あそこ      | どこ                                                                                                      |\n| Direction /<br>Place (polite) | こちら      | そちら      | あちら      | どちら                                                                                                     |	3	2026-06-24 16:16:33.691	2026-06-24 16:16:33.691
2954	お～	The prefix お is added to things related to the listener or a third party in order to show the speaker’s respect toward t	The prefix お is added to things related to the listener or a third party in order to show the speaker’s respect toward that person.	3	2026-06-24 16:16:33.693	2026-06-24 16:16:33.693
2955	<ruby>今<rp>（</rp><rt>いま</rt><rp>）</rp></ruby> ー<ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>ー<ruby>分<rp>（</rp><rt>ふん</rt><rp>）</rp></ruby>です	To express time, the counter suffixes <ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>(o'clock) and <ruby>分<rp>（</rp><rt>ふん<	To express time, the counter suffixes <ruby>時<rp>（</rp><rt>じ</rt><rp>）</rp></ruby>(o'clock) and <ruby>分<rp>（</rp><rt>ふん</rt><rp>）</rp></ruby>(minutes) are placed after the numbers.\n\n- 分 is read ふん after 2, 5, 7, or 9.\n- 分 is read ぷん after 1, 3, 4, 6, 8 and 10.\n- 1, 6, 8 and 10 are read いっ, ろっ, はっ, and じゅっ（じっ） before ぷん.\n- To ask time, なん is placed in front of じ or ぷん.	4	2026-06-24 16:16:33.927	2026-06-24 16:16:33.927
2956	V ます／V ません／V ました／V ませんでした	V ます works as a predicate. Using ます shows politeness toward the listener.	V ます works as a predicate. Using ます shows politeness toward the listener.\n\nV ます is used when a sentence expresses something habitual or a truth. It is also used when a sentence expressed a behavior or event that will occur in the future. The table below shows its negative and past-tense forms.\n\n|                | Non-past (present or future) | Past             |\n|----------------|------------------------------|------------------|\n| Affirmative| V ます                    | V ました      |\n| Negative   | V ません                  | V ませんでした |\n\nVerb question sentences are formed by putting か at the end of sentence, without changing the word order. When using an interrogative, this is placed in the part of the sentence that the speaker wants to ask about. When answering such questions, the verb in the question is repeated. そうです and ちがいます (see [Lesson 2](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_02_Grammar.md)) cannot be used when replying to a verb sentence question.	4	2026-06-24 16:16:33.934	2026-06-24 16:16:33.934
2957	N(time)に V	The particle に is appended to a noun indicating time to indicate the time of occurence of an action.	The particle に is appended to a noun indicating time to indicate the time of occurence of an action.	4	2026-06-24 16:16:33.959	2026-06-24 16:16:33.959
2958	N<sub>1</sub> から <sub>2</sub> まで	から indicates a starting time or place, and まで indicates the finishing time or place.	から indicates a starting time or place, and まで indicates the finishing time or place.\n\nから and まで are not always used together.\n\nTo indicate the starting or finishing time/date of a noun introduced as a topic, 〜から、〜まで or 〜から〜まで can be used with「です」attached.	4	2026-06-24 16:16:33.978	2026-06-24 16:16:33.978
2959	N<sub>1</sub> と N<sub>2</sub>	The particle と connects two nouns in coordinated relation.	The particle と connects two nouns in coordinated relation.	4	2026-06-24 16:16:33.997	2026-06-24 16:16:33.997
2960	〜ね	The particle ね is attached to the end of a sentence and is used to elicit agreement from the listener, check that the li	The particle ね is attached to the end of a sentence and is used to elicit agreement from the listener, check that the listener has understood, or emphasize something to the listener.	4	2026-06-24 16:16:34.004	2026-06-24 16:16:34.004
2961	N(place) へ <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きます／<ruby>来<rp>（</rp><rt>き</rt><rp>）</rp></ruby>ます／<ruby>帰<rp>（</rp><rt>かえ</rt><rp>）</rp></ruby>ります	When a verb indicates movement to a certain place, the particle へ is put after the place noun to show the direction of t	When a verb indicates movement to a certain place, the particle へ is put after the place noun to show the direction of the movement.	5	2026-06-24 16:16:34.33	2026-06-24 16:16:34.33
2962	どこ[へ]も <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きません／<ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きせんでした	When you want to deny everything covered by an interrogative, you can attach the particle も to the interrogative and put	When you want to deny everything covered by an interrogative, you can attach the particle も to the interrogative and put the verb in its negative form.	5	2026-06-24 16:16:34.337	2026-06-24 16:16:34.337
2963	N(vehicle) で <ruby>行<rp>（</rp><rt>い</rt><rp>）</rp></ruby>きます／<ruby>来<rp>（</rp><rt>き</rt><rp>）</rp></ruby>ます／<ruby>帰<rp>（</rp><rt>かえ</rt><rp>）</rp></ruby>ります	The particle で indicates a means or a method. The speaker attaches it after a noun representing a vehicle and uses it to	The particle で indicates a means or a method. The speaker attaches it after a noun representing a vehicle and uses it together with a movement verb to indicate his or her means of transport.\n\nWhen talking about walking somewhere, the speaker uses the expression あるいた. In this case, the particle で is not used.	5	2026-06-24 16:16:34.343	2026-06-24 16:16:34.343
2964	N(person/animal) と V	When talking about doing something with a person or an animal, the person or animal is marked with the particle と.	When talking about doing something with a person or an animal, the person or animal is marked with the particle と.\n\nIf doing something by oneself, the expression ひとりで is used. In this case, the particle と is not used.	5	2026-06-24 16:16:34.348	2026-06-24 16:16:34.348
2965	いつ	To ask about time, interrogatives using なん, such as なんじ, なんようび, なんがつ, なんにち are used. The interrogative いつ (when) is also	To ask about time, interrogatives using なん, such as なんじ, なんようび, なんがつ, なんにち are used. The interrogative いつ (when) is also used to ask when something will happen or happened. いつ does not take the particle に.	5	2026-06-24 16:16:34.356	2026-06-24 16:16:34.356
2966	〜よ	The particle よ is placed at the end of a sentence. It is used to emphasise information which the listener does not know,	The particle よ is placed at the end of a sentence. It is used to emphasise information which the listener does not know, or to show the speaker is giving his/her judgement or views assertively.	5	2026-06-24 16:16:34.362	2026-06-24 16:16:34.362
2967	そうですね	The expression そうですね is used to express sympathy or agreement with what the speaker has said. It is similar to the expre	The expression そうですね is used to express sympathy or agreement with what the speaker has said. It is similar to the expression そうですか (see [Lesson 2](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_02_Grammar.md)), but while そうですか is used by a speaker to acknowledge the receipt of some new information, そうですね is used to show sympathy or agreement with something the speaker already knew.	5	2026-06-24 16:16:34.373	2026-06-24 16:16:34.373
2968	N を V(transitive)	The particle を is used to indicate the direct object of a transitive verb.	The particle を is used to indicate the direct object of a transitive verb.	6	2026-06-24 16:16:34.606	2026-06-24 16:16:34.606
2969	N を します	A fairly wide range of nouns are used as the objects of the verb します, which means that the action denoted by the noun is	A fairly wide range of nouns are used as the objects of the verb します, which means that the action denoted by the noun is performed. Some examples are shown below.\n\n- Play sports or games\n\n- Hold gatherings or events\n\n- Do something	6	2026-06-24 16:16:34.61	2026-06-24 16:16:34.61
2970	<ruby>何<rp>（</rp><rt>なに</rt><rp>）</rp></ruby>を しますか	This is a question to ask about someone's actions.	This is a question to ask about someone's actions.	6	2026-06-24 16:16:34.628	2026-06-24 16:16:34.628
2971	なん and なに	Both なん and なに mean 'what'.	Both なん and なに mean 'what'.\n\n- なん is used in the following cases:\n\n- When it precedes a word whose first is in the た, だ and な -row.\n\n- なんで is used for asking 'Why?' as well as 'How?' なにで can be used when the speaker wants to make it clear the he or she is asking "How?"\n\n- When using it with a counter suffix.\n\n- なに is used in all other cases apart from above part.	6	2026-06-24 16:16:34.635	2026-06-24 16:16:34.635
2972	N(place) で V	When add after a noun denoting a place, the particle で indicates the occurrence of an action in that place.	When add after a noun denoting a place, the particle で indicates the occurrence of an action in that place.	6	2026-06-24 16:16:34.652	2026-06-24 16:16:34.652
2973	V ませんか	This expression is used when the speaker wants to invite someone to do something.	This expression is used when the speaker wants to invite someone to do something.	6	2026-06-24 16:16:34.656	2026-06-24 16:16:34.656
2974	V ましょう	This expression is used when a speaker is positively inviting the listener to do something with the speaker. It is also 	This expression is used when a speaker is positively inviting the listener to do something with the speaker. It is also used when responding positively to an invitation.	6	2026-06-24 16:16:34.66	2026-06-24 16:16:34.66
2975	〜か	か indicates that the listener has received and accept some new information. It is used in the same way as the か in そうですか	か indicates that the listener has received and accept some new information. It is used in the same way as the か in そうですか (see [Lesson 2](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_02_Grammar.md)).	6	2026-06-24 16:16:34.667	2026-06-24 16:16:34.667
2976	N(tool/means) で V	The particle で indicates a method or means used for an action.	The particle で indicates a method or means used for an action.	7	2026-06-24 16:16:34.808	2026-06-24 16:16:34.808
2977	'Word/Sentence' は 〜<ruby>語<rp>（</rp><rt>ご</rt><rp>）</rp></ruby>で <ruby>何<rp>（</rp><rt>なん</rt><rp>）</rp></ruby>ですか	This question is used to ask how to say a word or sentence in another language.	This question is used to ask how to say a word or sentence in another language.	7	2026-06-24 16:16:34.814	2026-06-24 16:16:34.814
2978	N<sub>1</sub>(person) に N<sub>2</sub> を あげます, etc	Verbs like あげます, かします and おしえます indicate imparting things or information, so they must be used with a noun saying to who	Verbs like あげます, かします and おしえます indicate imparting things or information, so they must be used with a noun saying to whom those things or information are imparted. The particle に is used to denote the recipient.	7	2026-06-24 16:16:34.821	2026-06-24 16:16:34.821
2979	N<sub>1</sub>(person) に N<sub>2</sub> を もらいます, etc	Verbs like もらいます, かります and ならいます indicate receiving things or information, so they are used with a noun indicating the p	Verbs like もらいます, かります and ならいます indicate receiving things or information, so they are used with a noun indicating the person from whom those things or information are received. The particle に is used to denote that person.	7	2026-06-24 16:16:34.829	2026-06-24 16:16:34.829
2980	もう V ました	もう means 'already' and is used with V ました. In this case, V ました means that the action has been completed.	もう means 'already' and is used with V ました. In this case, V ました means that the action has been completed.\n\nThe answer to the question もう V ましたか as to whether an action has been completed or not is:\n\n- はい、もう V ました if in the affirmative (i.e. the action has been completed).\n- いいえ、V て いません (see [Lesson 31](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_31_Grammar.md)) or いいえ、まだです if in the negative (i.e. the action has not been completed).\n- いいえ、V ませんでした is not used in that case, since this means that something was not done in the past, rather than that something has not been completed in the present.	7	2026-06-24 16:16:34.841	2026-06-24 16:16:34.841
2981	Omission of particles	Particles are often omitted in informal speech when the relationships between the parts of speech before and after them 	Particles are often omitted in informal speech when the relationships between the parts of speech before and after them are obvious.	7	2026-06-24 16:16:34.844	2026-06-24 16:16:34.844
2982	Adjectives	Adjectives are used as predicates, and in sentences like Nは adjです they indicates the state of a noun or are used to modi	Adjectives are used as predicates, and in sentences like Nは adjです they indicates the state of a noun or are used to modify a noun. They are divided into one of two groups, い-adjectives and な-adjectives, depending on how they inflect.	8	2026-06-24 16:16:35.039	2026-06-24 16:16:35.039
2983	N は な-adj［~な~］です<br>N は い-adj（〜い）です	Adjective sentences that are non-past and affirmative end in です, which shows politeness toward the listener. Both types 	Adjective sentences that are non-past and affirmative end in です, which shows politeness toward the listener. Both types of adjective are attached to the front of です, but な-adjectives drop their な, while い-adjectives retain their（〜い）.\n\nThe non-past negative of a な-adj is formed by dropping the な and attaching じゃ（では）ありません to it.	8	2026-06-24 16:16:35.041	2026-06-24 16:16:35.041
2984	い-adj（〜い）です → 〜くないです	The non-past negative of a い-adj is formed by dropping the final い and attaching くないです to it.	The non-past negative of a い-adj is formed by dropping the final い and attaching くないです to it.	8	2026-06-24 16:16:35.052	2026-06-24 16:16:35.052
2985	Adjectival Inflections	|                          |  な-adjectives             | い-adjectives |\n|--------------------------|--------------------	|                          |  な-adjectives             | い-adjectives |\n|--------------------------|---------------------------|---------------|\n| Non-past affirmative | しんせつです                | たかいです      |\n| Non-past negative    | しんせつじゃ（では）ありません | たかくないです   |	8	2026-06-24 16:16:35.058	2026-06-24 16:16:35.058
2986	Questions using adjective sentences	Questions using adjective sentences are formed in the same way as those using noun sentences (see [Lesson 1](https://git	Questions using adjective sentences are formed in the same way as those using noun sentences (see [Lesson 1](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_01_Grammar.md)) and verb sentences (see [Lesson 4](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_04_Grammar.md)). To answer such a question, the adjective is repeated. Expressions such as そうです or ちがいます cannot be used.	8	2026-06-24 16:16:35.061	2026-06-24 16:16:35.061
2987	な-adj な N<br>い-adj（〜い）N	When an adjective is used to modify a noun, it is placed in front of the noun. な-adjectives keep their な in this case.	When an adjective is used to modify a noun, it is placed in front of the noun. な-adjectives keep their な in this case.	8	2026-06-24 16:16:35.073	2026-06-24 16:16:35.073
2988	〜が、〜	が connects two statements in an antithetical relationship. When these are adjective clauses with the same subject, if th	が connects two statements in an antithetical relationship. When these are adjective clauses with the same subject, if the initial clause remarks on the subject positively, the subsequent clause will remark on it negatively, and vice versa.	8	2026-06-24 16:16:35.083	2026-06-24 16:16:35.083
2989	とても／あまり	とても and あまり are both adverbs of degree, and both come before the adjectives they modify. とても is used in affirmative sent	とても and あまり are both adverbs of degree, and both come before the adjectives they modify. とても is used in affirmative sentences, and means 'very'. あまり, used with a negative, means 'not very'.	8	2026-06-24 16:16:35.09	2026-06-24 16:16:35.09
2990	N は どうですか	The question N は どうですか is used to inquire about the listener's impression, option or feelings about a thing, place, pers	The question N は どうですか is used to inquire about the listener's impression, option or feelings about a thing, place, person, etc. that he or she has experienced, visited or met.	8	2026-06-24 16:16:35.108	2026-06-24 16:16:35.108
2991	N<sub>1</sub> は どんな N<sub>2</sub> ですか	どんな modifies a noun and is an interrogative used for inquring about the state or nature of a person, thing, etc.	どんな modifies a noun and is an interrogative used for inquring about the state or nature of a person, thing, etc.	8	2026-06-24 16:16:35.117	2026-06-24 16:16:35.117
2992	そうですね	The use of the expression そうですね to express agreement or sympathy was explained in [Lesson 5](https://github.com/flying-y	The use of the expression そうですね to express agreement or sympathy was explained in [Lesson 5](https://github.com/flying-yogurt/JP-Memos/blob/master/grammar_notes/Lesson_05_Grammar.md). The そうですね that appears in the Conversation of this Lesson shows that the speaker is thinking, as in the below sentence.	8	2026-06-24 16:16:35.125	2026-06-24 16:16:35.125
2993	～は～が好きです／嫌いです	「Ｎが好きです／嫌いです」	「Ｎが好きです／嫌いです」\n食べ物、スポーツ、音楽、映画などについて自分の嗜好を伝えるのに「好き／嫌い」の「形容動詞」を用いる。「好き／嫌い」の対象は助詞「が」で示す。\n「～好きじゃありません」=「嫌いです」ですが、「嫌い」は直接的で聞き手に悪印象を与えるので、注意が必要です。\n「嫌いです」は強い印象があり、誤解を招くことも多いので、軽く触れる程度とし、「あまり好きじゃありません」を練習する。否定形が「嫌いじゃありません」。\n「どんな～か」に対する答えは形容詞を用いた答え方だけでなく具体的な名詞でも答えられる。\n「どんなスポーツが好きですか」に対する答えは２つの答え方があります。\n**具体的に名詞で答える**（例：テニス、サッカーなど）\n**好きなスポーツの特徴を述べる答え方**（例：外でするスポーツ、ボールを使うスポーツ）	9	2026-06-24 16:16:35.359	2026-06-24 16:16:35.359
2994	～は～が上手です／下手です	「Ｎが上手です／下手です」	「Ｎが上手です／下手です」\n「上手／下手」は形容動詞であり、対象は助詞「が」で示す。\n「私は歌が上手です」は一般的には言わない。「私は歌が得意です。」は OK。\n「下手です」も意味が強すぎて使用頻度は少ない。実際は下手な場合でも「上手じゃありません」を使用することが多い。\n「〇〇が上手ですか。」は親しい人にのみ使う。\n日本人は自分のことに「～が上手だ」とは言わない。おこがましい。\n<b>「上手・下手」は技量、技術の優劣に使う。「勉強」「数学」「音楽」などには使えない</b>。「勉強」などの場合には、その分野に自信があるという意味で「得意」が自然ですが、「得意」は未習の語彙なので、「好き・嫌い」を使うように指導しましょう。\n相手に直接「～が上手ですか」と聞かないほうがいい。	9	2026-06-24 16:16:35.373	2026-06-24 16:16:35.373
2995	～は～がわかります	「Ｎがわかります」	「Ｎがわかります」\n目的語を取る動詞は原則そして目的語に助詞「を」をつけて示すが、「わかります」はその対象を助詞「が」で示す。\n「よく／だいたい／少し／あまり／全然」などの程度を表す副詞は修飾する動詞や形容詞の前に置く。	9	2026-06-24 16:16:35.382	2026-06-24 16:16:35.382
2996	～は～があります（所有）	「Ｎあります」	「Ｎあります」\n目的語を取る動詞は原則として助詞「を」をつけて示すが、「わかります」と同様に「あります」もその対象を助詞「が」で示す。ここでは「～があります」で物の所有の意味と時間、用事、約束などがある場合の用法を扱う。	9	2026-06-24 16:16:35.392	2026-06-24 16:16:35.392
2997	～から、～（理由）	「～から、～」	「～から、～」\n原因＋から、結果。\n「どうして〜か」\n疑問詞「どうして」で理由を尋ねる。答えの文の文末には「から」をつける。	9	2026-06-24 16:16:35.403	2026-06-24 16:16:35.403
2998	N があります/ いま	N があります/ いま	\N	10	2026-06-24 16:16:35.593	2026-06-24 16:16:35.593
2999	N1 (place)に N2 が あります/ います	N1 (place)に N2 が あります/ います	\N	10	2026-06-24 16:16:35.606	2026-06-24 16:16:35.606
3000	N1 は N2 (place) に あります/ います	Where is Tokyo Disneyland?	Where is Tokyo Disneyland?\n\n…It’s in Chiba Prefecture.\n\nWhere is Tokyo Disneyland?\n\n…It’s in Chiba Prefecture.	10	2026-06-24 16:16:35.62	2026-06-24 16:16:35.62
3001	N1 (thing/person/place) の N2 (position)	N1 (thing/person/place) の N2 (position)	\N	10	2026-06-24 16:16:35.637	2026-06-24 16:16:35.637
3002	N1 や N2	N1 や N2	\N	10	2026-06-24 16:16:35.644	2026-06-24 16:16:35.644
3003	Word (s) ですか	Excuse me, bt where is Yunyu-ya Store?	Excuse me, bt where is Yunyu-ya Store?\n\n…Yunya-yu Store? It’s in that building.	10	2026-06-24 16:16:35.651	2026-06-24 16:16:35.651
3004	チリソースはありませんか	チリソースはありませんか	\N	10	2026-06-24 16:16:35.657	2026-06-24 16:16:35.657
3005	Quantifiers(Period) に 一回 V	With this expression you can how often you do something.	With this expression you can how often you do something.\n\nI go to see movies twice a month.	11	2026-06-24 16:16:35.848	2026-06-24 16:16:35.848
3006	Quantifier だけ / N だけ	There is only one foreign employee in Power Electric.	There is only one foreign employee in Power Electric.\n\nI only have Sundays off.	11	2026-06-24 16:16:35.854	2026-06-24 16:16:35.854
3007	Past tense of noun sentences and な- adjective sentences.	Past tense of noun sentences and な- adjective sentences.	\N	12	2026-06-24 16:16:36.038	2026-06-24 16:16:36.038
3008	Past tense of い adjective sentences Affirmative: あついです。 － あつかったです Negative: あつくないです － あつくなかったです	Past tense of い adjective sentences Affirmative: あついです。 － あつかったです Negative: あつくないです － あつくなかったです	\N	12	2026-06-24 16:16:36.048	2026-06-24 16:16:36.048
3009	N1 は N2 よりadjectiveです.	This sentence pattern describes the quality and/ or state of N1 in comparison with N2.	This sentence pattern describes the quality and/ or state of N1 in comparison with N2.\n\nThis car is bigger than that car.	12	2026-06-24 16:16:36.054	2026-06-24 16:16:36.054
3010	N1 とN2とどちらがAdjectiveですか	N1 とN2とどちらがAdjectiveですか	\N	12	2026-06-24 16:16:36.059	2026-06-24 16:16:36.059
3011	…N1/N2 のほうがAdjectiveです.	Which is more interesting, baseball or football?	Which is more interesting, baseball or football?\n\nWho is a better tennis player, Mr. Miller or Mr. Santos?	12	2026-06-24 16:16:36.062	2026-06-24 16:16:36.062
3012	N1の中で何・どこ・だれ・いつ・がいちばんadjectiveですか	N1の中で何・どこ・だれ・いつ・がいちばんadjectiveですか	\N	12	2026-06-24 16:16:36.084	2026-06-24 16:16:36.084
3013	…N2がいちばんadjectiveです。	This question pattern is used to ask the listener to choose something that is the most “adjective”. The choice is made form the group or category denoted by N1. The interrogative used is decided by th	This question pattern is used to ask the listener to choose something that is the most “adjective”. The choice is made form the group or category denoted by N1. The interrogative used is decided by the kind of category from which the choice is made.\n\nAmong Japanese dishes, what is the most delicious?\n\nWhen is the coldest time of the year?\n\nIt’s coldest in February.	12	2026-06-24 16:16:36.089	2026-06-24 16:16:36.089
3014	Nが欲しいです	Nが欲しいです	\N	13	2026-06-24 16:16:36.23	2026-06-24 16:16:36.23
3015	V ます-form たいです.	V ます-form たいです.	\N	13	2026-06-24 16:16:36.248	2026-06-24 16:16:36.248
3016	N(place) へ Vます-form/ N に 行きます/来ます/帰ります。	I’ll go to the festical in Kyoto tomorrow.	I’ll go to the festical in Kyoto tomorrow.	13	2026-06-24 16:16:36.27	2026-06-24 16:16:36.27
3017	NにV/NをV	NにV/NをV	\N	13	2026-06-24 16:16:36.287	2026-06-24 16:16:36.287
3018	どこか / 何か	Did you go anywhere in the winter vacation?	Did you go anywhere in the winter vacation?\n\nI’m thirsty. I want to drink something.	13	2026-06-24 16:16:36.295	2026-06-24 16:16:36.295
3019	ご注文	ご注文	\N	13	2026-06-24 16:16:36.311	2026-06-24 16:16:36.311
3020	Verb conjugation	Verbs in Japanese change their forms, i.e., they conjugate, and they are divided into three groups according to the type of conjugation. Depending on the following phrases, you can make sentences with	Verbs in Japanese change their forms, i.e., they conjugate, and they are divided into three groups according to the type of conjugation. Depending on the following phrases, you can make sentences with various meanings.	14	2026-06-24 16:16:36.459	2026-06-24 16:16:36.459
3021	Verb groups	1) Group I verbs	1) Group I verbs\n\n2) Group II verbs\n\n3)Group III verbs	14	2026-06-24 16:16:36.462	2026-06-24 16:16:36.462
3022	Verb て – form	Verb て – form	\N	14	2026-06-24 16:16:36.477	2026-06-24 16:16:36.477
3023	Vて-form ください : Please do…	This sentence pattern is used to ask, instruct or encourage the listener to do something. Naturally if the listener is one’s superior, this expression cannot be used for giving instructions to him/her	This sentence pattern is used to ask, instruct or encourage the listener to do something. Naturally if the listener is one’s superior, this expression cannot be used for giving instructions to him/her. The sentences shown below are examples of asking, instructing and encouraging, respectively.\n\nExcuse me, could you tell me how to read this kanji, please.?\n\nPlease write you name and address here.\n\nPlease come to my place.	14	2026-06-24 16:16:36.489	2026-06-24 16:16:36.489
3024	Vて-form います : Be V-ing	This sentence pattern indicates that a certain action or motion us in progress.	This sentence pattern indicates that a certain action or motion us in progress.\n\nMr Miller is making a phone call now.	14	2026-06-24 16:16:36.499	2026-06-24 16:16:36.499
3025	Vます-form ましょか : Shall I…?	This expression is used when the speaker is offering to do something for the listener.	This expression is used when the speaker is offering to do something for the listener.\n\nIn the above example conversations, B demontratres how to politely ask or instruct someone to do something, to accept an offer with gratitude and to decline an offer poitlely.	14	2026-06-24 16:16:36.51	2026-06-24 16:16:36.51
3026	S1がS2 …But…	Excuse me, but may I have your name?	Excuse me, but may I have your name?\n\nPlease pass me the salt.	14	2026-06-24 16:16:36.527	2026-06-24 16:16:36.527
3027	NがV	NがV	\N	14	2026-06-24 16:16:36.537	2026-06-24 16:16:36.537
3028	Vて-form も いいです: You may do…	Vて-form も いいです: You may do…	\N	15	2026-06-24 16:16:36.65	2026-06-24 16:16:36.65
3029	Vて-formは いけません: You must not do…	You must not smoke here. Because this is no-smoking area.	You must not smoke here. Because this is no-smoking area.	15	2026-06-24 16:16:36.662	2026-06-24 16:16:36.662
3030	Vて-form います	Vて-form います	\N	15	2026-06-24 16:16:36.67	2026-06-24 16:16:36.67
3031	Vて-form います	Vて-form います	\N	15	2026-06-24 16:16:36.687	2026-06-24 16:16:36.687
3032	知りません	Do you know the telephone number of the city hall? … Yes, I do.	Do you know the telephone number of the city hall? … Yes, I do.	15	2026-06-24 16:16:36.707	2026-06-24 16:16:36.707
3033	V て-form	In the morning, I jog, take a shower and go to the office.	In the morning, I jog, take a shower and go to the office.\n\nI went to Kobe, saw a movie and drank tea.	16	2026-06-24 16:16:36.872	2026-06-24 16:16:36.872
3034	い-adj =&gt;くて、	Mr Miller is young and lively.	Mr Miller is young and lively.\n\nYesterday it was fine and hot.	16	2026-06-24 16:16:36.878	2026-06-24 16:16:36.878
3035	N・なadj + で,~	Ms Karina is an Indonesian and a student of Kyoto University.	Ms Karina is an Indonesian and a student of Kyoto University.\n\nMr Miller is handsome and kind.\n\nNara is a quiet and beautiful city.\n\nMs Karina is a student and Maria is a housewife.	16	2026-06-24 16:16:36.889	2026-06-24 16:16:36.889
3036	V1 て-form から V2.	This sentence pattern indicates that upon completion of the action denoted by V1 the action of V2 os to be conducted. The tense of the sentence is determined bu the tense form of the last verb in the 	This sentence pattern indicates that upon completion of the action denoted by V1 the action of V2 os to be conducted. The tense of the sentence is determined bu the tense form of the last verb in the sentence.\n\nI will work for my father’s company after going back to my country.\n\nWe ate at a restaurant after the concert was over.	16	2026-06-24 16:16:36.904	2026-06-24 16:16:36.904
3037	N1はN2が adjective	Food is tasty in Osaka.	Food is tasty in Osaka.\n\nFranken in Germany produces famous wine.\n\nMaria has long hair.	16	2026-06-24 16:16:36.909	2026-06-24 16:16:36.909
3038	どうやって	How do you go to your university?	How do you go to your university?\n\n…I take a No.16 bus from Kyoto Station and get off at the front of the university.	16	2026-06-24 16:16:36.92	2026-06-24 16:16:36.92
3039	どのN	Which one is Mr. Santos?	Which one is Mr. Santos?\n\n…That tall man with black hair.	16	2026-06-24 16:16:36.927	2026-06-24 16:16:36.927
3040	Vない-form	Vない-form	\N	17	2026-06-24 16:16:37.086	2026-06-24 16:16:37.086
3041	Vない-form ないでください	This expression is used to ask or instruct someone not to do something.	This expression is used to ask or instruct someone not to do something.\n\nI am fine, so please don’t worry about me.\n\nPlease don’t take pictures here.	17	2026-06-24 16:16:37.121	2026-06-24 16:16:37.121
3042	Vない-formなければなりません	This expression means something has to be done regardless of the will of the actor. Note that this doesn’t have a negative meaning.	This expression means something has to be done regardless of the will of the actor. Note that this doesn’t have a negative meaning.\n\nI must take medicine.	17	2026-06-24 16:16:37.126	2026-06-24 16:16:37.126
3043	Vない-form なくてもいいです	This sentence pattern indicates that the action described by the verb does not have to be done.	This sentence pattern indicates that the action described by the verb does not have to be done.\n\nYou don’t have to come tomorrow.	17	2026-06-24 16:16:37.132	2026-06-24 16:16:37.132
3044	N (object) は	Please don’t put parcels here.	Please don’t put parcels here.\n\nAs for parcels, don’t put them here.\n\nI have lunch in the company cafeteria.\n\nAs for lunch, I have it in the company cafeteria.	17	2026-06-24 16:16:37.137	2026-06-24 16:16:37.137
3045	N (time) までにV	The meeting will be over by five.	The meeting will be over by five.\n\nI must return the book by Saturday.\n\nI work until five.	17	2026-06-24 16:16:37.153	2026-06-24 16:16:37.153
3046	Verb dictionary form	This form is the basic form of a verb. Verbs are given in this form in the dictionary, hence the name. How to make the dictionary form is given below.	This form is the basic form of a verb. Verbs are given in this form in the dictionary, hence the name. How to make the dictionary form is given below.	18	2026-06-24 16:16:37.326	2026-06-24 16:16:37.326
3047	N	N	\N	18	2026-06-24 16:16:37.33	2026-06-24 16:16:37.33
3048	V dictionary formこと	V dictionary formこと	\N	18	2026-06-24 16:16:37.338	2026-06-24 16:16:37.338
3049	ができます	Mr. Miller can speak Japanese.	Mr. Miller can speak Japanese.\n\nIt’s snowed a lot, so we can ski this year.\n\nMr. Miller can read Kanji.\n\nYou can pay by credit card.	18	2026-06-24 16:16:37.341	2026-06-24 16:16:37.341
3050	わたしの趣味は	わたしの趣味は	\N	18	2026-06-24 16:16:37.364	2026-06-24 16:16:37.364
3051	N	N	\N	18	2026-06-24 16:16:37.367	2026-06-24 16:16:37.367
3052	V dictionary formこと	V dictionary formこと	\N	18	2026-06-24 16:16:37.369	2026-06-24 16:16:37.369
3053	です	My hobby is music.	My hobby is music.\n\nMy hobby is listening to the music.	18	2026-06-24 16:16:37.371	2026-06-24 16:16:37.371
3054	V1 dictionary form	V1 dictionary form	\N	18	2026-06-24 16:16:37.38	2026-06-24 16:16:37.38
3055	Nの	Nの	\N	18	2026-06-24 16:16:37.383	2026-06-24 16:16:37.383
3056	Quantifier (period)	Quantifier (period)	\N	18	2026-06-24 16:16:37.386	2026-06-24 16:16:37.386
3057	まえに、V2	This sentence pattern indicates that the action of V2 occurs before the action of V1 takes place. Even when the tense V2 is in the past tense or the future tense, V1 is always in the dictionary form.	This sentence pattern indicates that the action of V2 occurs before the action of V1 takes place. Even when the tense V2 is in the past tense or the future tense, V1 is always in the dictionary form.\n\nI studied Japanese before I came to Japan.\n\nI read a book before I go to bed.\n\nI wash my hands before eating.\n\n3) Quantifier (period)\n\nMr. Tanaka left an hour ago.	18	2026-06-24 16:16:37.388	2026-06-24 16:16:37.388
3058	なかなか	In Japan we can rarely see horses.	In Japan we can rarely see horses.	18	2026-06-24 16:16:37.409	2026-06-24 16:16:37.409
3059	ぜひ	I want to go to Hokkaido very much.	I want to go to Hokkaido very much.\n\nPlease come to my place.	18	2026-06-24 16:16:37.419	2026-06-24 16:16:37.419
3060	Verb た-form	Verb た-form	\N	19	2026-06-24 16:16:37.592	2026-06-24 16:16:37.592
3061	Vた-formことがあります	have the experience of V-ing	have the experience of V-ing\n\nI have ridden a horse.\n\nNote that it is, therefore, different from a sentence which merely states the fact that one did something at a certain time in the past.\n\nI rode a horse in Hokkaido last year.	19	2026-06-24 16:16:37.615	2026-06-24 16:16:37.615
3062	Vた-formり, Vた-form りします	V … and V …, and so on	V … and V …, and so on\n\nOn Sundays, I play tennis, see a movie and so on.\n\nLast Sunday, I played tennis, saw a movie and so on.\n\nLast Sunday I played tennis and then saw a movie.\n\nIn (**) it is clear that seeing a movie took place after playing tennis. In (*) there is no time relation between the two activities. These activities are mentioned as example activities among the activities done on Sunday to imply that one did other activities besides them. And it is not natural that actions usually done by everybody every day such as getting up in the morning, taking meals, going to bed at night, etc., are mentioned.	19	2026-06-24 16:16:37.626	2026-06-24 16:16:37.626
3063	い-adj (～い) → ～く	い-adj (～い) → ～く	\N	19	2026-06-24 16:16:37.644	2026-06-24 16:16:37.644
3064	な-adj [な] → に	な-adj [な] → に	\N	19	2026-06-24 16:16:37.647	2026-06-24 16:16:37.647
3065	Nに	Nに	\N	19	2026-06-24 16:16:37.651	2026-06-24 16:16:37.651
3066	なります	なります	\N	19	2026-06-24 16:16:37.655	2026-06-24 16:16:37.655
3067	そうですね	It’s got cold, hasn’t it?	It’s got cold, hasn’t it?	19	2026-06-24 16:16:37.675	2026-06-24 16:16:37.675
3068	Polite style and plain style	Japanese language has two styles of speech: polite style and plain style.	Japanese language has two styles of speech: polite style and plain style.\n\nI have never been to Germany.	20	2026-06-24 16:16:37.85	2026-06-24 16:16:37.85
3069	Proper use of the polite style or the plain style	1) The polite style can be used at anytime in any place and to anybody. Therefore, the polite style is used most commonly in daily conversation between adults who are not close friends. It is used whe	1) The polite style can be used at anytime in any place and to anybody. Therefore, the polite style is used most commonly in daily conversation between adults who are not close friends. It is used when talking to a person one has met for the first time, to one’s superiors, or even to persons in a similar age group to whom one is not very close. The polite style may be chosen when one talks to a person who is younger or lower in rank yet not so close. The plain style is used when talking to one’s close friends, colleagues and family members.\n\nNote that you need to be careful about how much politeness is needed, basing this on the age of your conversation partner and your type of relationship. If the plain style is used inappropriately, you could sound rough and impolite, so when you cannot tell the situation it is safer to use the polite style.\n\n2) The plain style is commonly used in written work. Newspapers, books, theses and diaries are all written in the plain style. Most letters are written in the polite style.	20	2026-06-24 16:16:37.894	2026-06-24 16:16:37.894
3070	Conversation in the plain style	3) In the plain style, certain particles are often omitted if the meaning of the sentence is evident from the context.	3) In the plain style, certain particles are often omitted if the meaning of the sentence is evident from the context.\n\nWill you take a meal?\n\nWon’t you come to Kyoto tomorrow with me?\n\nThis apple is tasty, isn’t it?\n\nIs there a pair of scissors there?\n\nIs that curry and rice tasty?\n\nYes, it’s hot but tasty.\n\nI have tickets for sumo. Won’t you come with me?	20	2026-06-24 16:16:37.897	2026-06-24 16:16:37.897
3071	Plain form と思います	1) When expressing conjecture	1) When expressing conjecture\n\nI think it will rain tomorrow.\n\nI think Teresa has already gone to bed.\n\nDoes Mr. Miller know this news?\n\nNo, I don’t think he does.\n\n2) When expressing one’s opinion\n\nI think that prices are high in Japan.\n\nWhat do you think of the new airport?\n\nI think that it is clean but the access to it is not easy.\n\nAgreement or disagreement with other people’s opinions can be expressed as follows.\n\nA: Fax machines are convenient, aren’t they?\n\nB: I think so, too. C: I don’t think so.	21	2026-06-24 16:16:38.107	2026-06-24 16:16:38.107
3072	“S” / Plain formと言います	1) When quoting directly what someone says or said, repeat exactly what they say as in the following structure.	1) When quoting directly what someone says or said, repeat exactly what they say as in the following structure.\n\nWe say “Good night” before going to bed.\n\nMr. Miller said “I will go to Tokyo on a business trip next week”.\n\nMr. Miller said that he would go to Tokyo on a business trip next week.	21	2026-06-24 16:16:38.135	2026-06-24 16:16:38.135
3073	Plain form でしょう	You are going to the party tomorrow, aren’t you?	You are going to the party tomorrow, aren’t you?\n\nIt was cold in Hokkaido, wasn’t it?\n\nNo, it wasn’t that cold.	21	2026-06-24 16:16:38.148	2026-06-24 16:16:38.148
3074	N1 (place)で N2があります	A football game between Japan and Brazil will be held in Tokyo.	A football game between Japan and Brazil will be held in Tokyo.	21	2026-06-24 16:16:38.16	2026-06-24 16:16:38.16
3075	N (occasion) で	Did you give your opinion at the meeting?	Did you give your opinion at the meeting?	21	2026-06-24 16:16:38.166	2026-06-24 16:16:38.166
3076	N でもV	Shall we drink beer or something?	Shall we drink beer or something?	21	2026-06-24 16:16:38.17	2026-06-24 16:16:38.17
3077	Vない-formないと ….	I have to go home now.	I have to go home now.	21	2026-06-24 16:16:38.174	2026-06-24 16:16:38.174
3078	Noun modification	You learned how to modify nouns in Lesson 2 and Lesson 8.	You learned how to modify nouns in Lesson 2 and Lesson 8.\n\nIn Japanese, whatever modifies a word, whether it’s a word or a sentence, it always comes before the word to be modified. Here you learn another way to modify nouns.	22	2026-06-24 16:16:38.303	2026-06-24 16:16:38.303
3079	Noun modification by sentences	a person who is kind and pretty	a person who is kind and pretty\n\na person who is 65 years old.\n\n2) Nouns, which are various elements of the sentence, are picked out of it and can be modified by it.\n\nI saw a movie last week → the movie that I saw last week\n\nMr. Wang works at a hospital → the hospital where Mr. Wang works\n\nI will meet a friend tomorrow → the friend whom I will meet tomorrow\n\n3) The noun modified by a sentence (“the house where Mr. Miller lived” in the example sentences below) can be used in various parts of a sentence.\n\nThis is the house where Mr. Miller lived.\n\nThe house where Mr. Miller lived is old.\n\nI bought the house where Mr. Miller lived.\n\nI like the house where Mr. Miller lived.\n\nThere was a cat in the house where Mr. Miller lived.\n\nI have been to the house where Mr. Miller lived.	22	2026-06-24 16:16:38.311	2026-06-24 16:16:38.311
3080	N が	Mr. Miller baked a cake. → This is the cake which Mr. Miller baked.	Mr. Miller baked a cake. → This is the cake which Mr. Miller baked.\n\nI like the picture that Ms. Karina drew.\n\nDo you know the place where he was born?	22	2026-06-24 16:16:38.357	2026-06-24 16:16:38.357
3081	V dictionary form 時間／約束／用事	I have no time to eat breakfast.	I have no time to eat breakfast.\n\nI have an arrangement to see a movie with a friend of mine.\n\nI have something to do at the city hall today.	22	2026-06-24 16:16:38.367	2026-06-24 16:16:38.367
3082	V dictionary form	V dictionary form	\N	23	2026-06-24 16:16:38.497	2026-06-24 16:16:38.497
3083	Vない-form	Vない-form	\N	23	2026-06-24 16:16:38.499	2026-06-24 16:16:38.499
3084	い-adj (～い )	い-adj (～い )	\N	23	2026-06-24 16:16:38.5	2026-06-24 16:16:38.5
3085	な-adjな	な-adjな	\N	23	2026-06-24 16:16:38.502	2026-06-24 16:16:38.502
3086	Nの	Nの	\N	23	2026-06-24 16:16:38.503	2026-06-24 16:16:38.503
3087			\N	23	2026-06-24 16:16:38.505	2026-06-24 16:16:38.505
3088	とき、～	とき、～	\N	23	2026-06-24 16:16:38.506	2026-06-24 16:16:38.506
3089		When you borrow books from the library, you need a card.	When you borrow books from the library, you need a card.\n\nWhen you don’t know how to use it, ask me.\n\nWhen I’m not in good shape, I drink “Genki-cha”.\n\nWon’t you come to my place when you are free?\n\nWhen my wife is sick, I take a day off work.\n\nWhen I was young, I did not study much.\n\nI used to swim in a river when I was a child.	23	2026-06-24 16:16:38.508	2026-06-24 16:16:38.508
3090			\N	23	2026-06-24 16:16:38.526	2026-06-24 16:16:38.526
3091	V dictionary form	V dictionary form	\N	23	2026-06-24 16:16:38.529	2026-06-24 16:16:38.529
3092	Vた-form	Vた-form	\N	23	2026-06-24 16:16:38.531	2026-06-24 16:16:38.531
3093			\N	23	2026-06-24 16:16:38.533	2026-06-24 16:16:38.533
3094	とき、～	とき、～	\N	23	2026-06-24 16:16:38.536	2026-06-24 16:16:38.536
3095		I bought a bag when I went back to my country.	I bought a bag when I went back to my country.\n\nI bought a bag when I went back to my country.	23	2026-06-24 16:16:38.537	2026-06-24 16:16:38.537
3096	V dictionary form と、～	…, then (inevitably) …	…, then (inevitably) …\n\nPress this button, and the change will come out.\n\nTurn this, and the volume will go up.\n\nTurn to the right, and you will find the post office.	23	2026-06-24 16:16:38.55	2026-06-24 16:16:38.55
3097	N が adjective / V	The volume is low.	The volume is low.\n\nThe light became brighter.\n\nPress this button, and a ticket will come out.	23	2026-06-24 16:16:38.57	2026-06-24 16:16:38.57
3098	N (place) をV (verb of movement)	I take a walk in the park.	I take a walk in the park.\n\nI cross the road.\n\nI turn to the right at the intersection.	23	2026-06-24 16:16:38.579	2026-06-24 16:16:38.579
3099	くれます	I gave flowers to Ms. Sato.	I gave flowers to Ms. Sato.\n\nMs. Sato gave me a Christmas card.\n\nMs. Sato gave candies to my younger sister.	24	2026-06-24 16:16:38.678	2026-06-24 16:16:38.678
3100			\N	24	2026-06-24 16:16:38.691	2026-06-24 16:16:38.691
3101			\N	24	2026-06-24 16:16:38.695	2026-06-24 16:16:38.695
3102	Vて-form	Vて-form	\N	24	2026-06-24 16:16:38.698	2026-06-24 16:16:38.698
3103			\N	24	2026-06-24 16:16:38.701	2026-06-24 16:16:38.701
3104	あげます	あげます	\N	24	2026-06-24 16:16:38.703	2026-06-24 16:16:38.703
3105	もらいます	もらいます	\N	24	2026-06-24 16:16:38.705	2026-06-24 16:16:38.705
3106	くれます	I lent Ms. Kimura a book.	I lent Ms. Kimura a book.\n\nShall I call a taxi for you?\n\nMr. Yamada told me the telephone number of the library.\n\nThis expression conveys a sense of gratitude on the part of those who receive a favor.\n\nMy mother sent me a sweater.	24	2026-06-24 16:16:38.708	2026-06-24 16:16:38.708
3107	N (person) がV	That’s a nice tie, isn’t it?	That’s a nice tie, isn’t it?\n\nYes. Ms. Sato gave it to me.	24	2026-06-24 16:16:38.743	2026-06-24 16:16:38.743
3108	Interrogative がV	Who will go to give him a hand?	Who will go to give him a hand?\n\nMs. Karina will.	24	2026-06-24 16:16:38.753	2026-06-24 16:16:38.753
3109	Plain past form ら、～	Plain past form ら、～	\N	25	2026-06-24 16:16:38.843	2026-06-24 16:16:38.843
3110	If …	If I had money, I would travel.	If I had money, I would travel.\n\nIf I don’t have time, I will not watch TV.\n\nIf it’s inexpensive, I want to buy a personal computer.\n\nIf you are free, please give me a hand.\n\nIf it’s fine, won’t you take a walk with me?	25	2026-06-24 16:16:38.846	2026-06-24 16:16:38.846
3111	Vた-formら、～	Vた-formら、～	\N	25	2026-06-24 16:16:38.858	2026-06-24 16:16:38.858
3112	When …/After …	This pattern is used to express that a certain action will be done or a certain situation will appear when a matter, action or state which is sure to happen in the future has been completed or achieve	This pattern is used to express that a certain action will be done or a certain situation will appear when a matter, action or state which is sure to happen in the future has been completed or achieved. The main sentence is always in the present tense.\n\nLet’s go out when it gets to ten.\n\nI take a shower soon after I return home.	25	2026-06-24 16:16:38.86	2026-06-24 16:16:38.86
3113	Vて-form	Vて-form	\N	25	2026-06-24 16:16:38.866	2026-06-24 16:16:38.866
3114	い-adj (～い ) → ～くて	い-adj (～い ) → ～くて	\N	25	2026-06-24 16:16:38.868	2026-06-24 16:16:38.868
3115	な-adj [な] → で	な-adj [な] → で	\N	25	2026-06-24 16:16:38.869	2026-06-24 16:16:38.869
3116	Nで	Nで	\N	25	2026-06-24 16:16:38.871	2026-06-24 16:16:38.871
3117	も、～	も、～	\N	25	2026-06-24 16:16:38.872	2026-06-24 16:16:38.872
3118			\N	25	2026-06-24 16:16:38.873	2026-06-24 16:16:38.873
3119	Even if …	Even if …	\N	25	2026-06-24 16:16:38.875	2026-06-24 16:16:38.875
3120		Even if it rains, I’ll do the laundry.	Even if it rains, I’ll do the laundry.\n\nEven if group tours are expensive, I don’t like them.\n\nEven if a personal computer is useful, I won’t use it.\n\nEven if it is Sunday, I will work.	25	2026-06-24 16:16:38.876	2026-06-24 16:16:38.876
3121	もしandいくら	If I had 100 million yen, I would want to travel to various countries.	If I had 100 million yen, I would want to travel to various countries.\n\nNo matter how much I think, I can’t understand this.\n\nNo matter how expensive it is, I will buy it.	25	2026-06-24 16:16:38.887	2026-06-24 16:16:38.887
3122	Nが	I will clean my room before my friends come.	I will clean my room before my friends come.\n\nWhen my wife is sick, I take a day off work.\n\nIf your friend doesn’t come on time, what will you do?	25	2026-06-24 16:16:38.897	2026-06-24 16:16:38.897
3123	Plain form + んです	This expression is used in the following cases.	This expression is used in the following cases.\n\nMs. Watanabe, you sometimes speak Osaka dialect.\n\nHave you lived in Osaka?\n\nYes, I lived in Osaka until I was fifteen.\n\nThe design of your shoes is interesting. Where did you buy them?\n\nI bought this pair at Edoya Store .\n\nWhy were you late?\n\nWhat’s the matter?\n\nThis expression is used in the following cases.\n\nWhy were you late?\n\nBecause the bus didn’t come.\n\nWhat’s the matter?\n\nI don’t feel well.\n\nDo you read newspaper every morning?\n\nNo. I don’t have the time.\n\nI’ve written a letter in Japanese. Could you please check it for me?\n\nI want to tour NHK. How can I do that?	26	2026-06-24 16:16:39.07	2026-06-24 16:16:39.07
3124	Vて-formいただけませんか	Would you please do me a favor of ~ing?	Would you please do me a favor of ~ing?\n\nWould you please introduce a good teacher to me?	26	2026-06-24 16:16:39.127	2026-06-24 16:16:39.127
3125	Interrogative Vた-formらいいですか	What/When/Where/Which/How/Who shall I?	What/When/Where/Which/How/Who shall I?\n\nWhere should I buy a camera?\n\nI don’t have any small change. What shall I do?	26	2026-06-24 16:16:39.135	2026-06-24 16:16:39.135
3126	N (object) は好きです／嫌いです／上手です／下手です／あります	like / dislike / be good at / be poor at / have, etc. N	like / dislike / be good at / be poor at / have, etc. N\n\nAre you going to participate in the athletic meeting?\n\nNo. I don’t like sports very much.	26	2026-06-24 16:16:39.144	2026-06-24 16:16:39.144
3127	Potential verbs	Potential verbs	\N	27	2026-06-24 16:16:39.331	2026-06-24 16:16:39.331
3128	Potential verb sentences	I speak Japanese.	I speak Japanese.\n\nI can speak Japanese.\n\nCan you go to the hospital alone?\n\nI could not see Mr. Tanaka.\n\n2) Potential verbs have two uses: to express a person’s ability to do something and to express the possibility of an action in a certain situation.\n\nMr. Miller can read Kanji.\n\nYou can change dollars at this bank.	27	2026-06-24 16:16:39.354	2026-06-24 16:16:39.354
3129	見えます and 聞こえます.	You can now see Kurosawa’s movies in Shinjuku.	You can now see Kurosawa’s movies in Shinjuku.\n\nMt. Fuji can be seen from the Shinkansen.\n\nYou can hear the weather forecast by phone.\n\nThe sound of a radio can be heard.	27	2026-06-24 16:16:39.37	2026-06-24 16:16:39.37
3130	できます	The verb that you learn here means “come into being”, ‘come up”, “be completed”, “be finished”, “be made”, etc.	The verb that you learn here means “come into being”, ‘come up”, “be completed”, “be finished”, “be made”, etc.\n\nA big supermarket has been completed in front of the station.\n\nWhen can you fix this watch?	27	2026-06-24 16:16:39.384	2026-06-24 16:16:39.384
3131	は	In my school there is an American teacher.	In my school there is an American teacher.\n\nIn my school we can learn the Chinese language.\n\nYesterday we could see mountains, but not today.\n\nI drink wine, but not beer.\n\nI will go to Tokyo, but not to Osaka.	27	2026-06-24 16:16:39.39	2026-06-24 16:16:39.39
3132	も	Klara can speak English. She can speak French, too.	Klara can speak English. She can speak French, too.\n\nI went to America last year. I went to Mexico, too.\n\nThe sea can be seen from my room, and also from my brother’s room.	27	2026-06-24 16:16:39.406	2026-06-24 16:16:39.406
3133	しか	I cannot write anything but Roman letters.	I cannot write anything but Roman letters.\n\nI can only write Roman letters.	27	2026-06-24 16:16:39.416	2026-06-24 16:16:39.416
3134	V1 ます-form ながら V2	This sentence pattern means that one person does two different actions (V1 and V2) at the same time. The action denoted by V2 is the more emphasized of the two actions.	This sentence pattern means that one person does two different actions (V1 and V2) at the same time. The action denoted by V2 is the more emphasized of the two actions.\n\nI listen to music while eating.\n\nThis sentence pattern is also used when the two actions take place over a period of time.\n\nI’m working and studying Japanese.	28	2026-06-24 16:16:39.596	2026-06-24 16:16:39.596
3135	Vて-formいます	I jog every morning.	I jog every morning.\n\nI used to go to bed at eight every evening when I was a child.	28	2026-06-24 16:16:39.603	2026-06-24 16:16:39.603
3136	Plain formし, ～	1) When sentences are stated from a certain viewpoint, they can be linked using this structure. For example, sentences describing the merits of a particular subject are joined into one sentence using 	1) When sentences are stated from a certain viewpoint, they can be linked using this structure. For example, sentences describing the merits of a particular subject are joined into one sentence using this pattern.\n\nProfessor Watt is earnest and diligent and has experience.\n\n2) This structure is also used to state causes or reasons when there is more than one cause or reason. Use of this structure implies the meaning of “furthermore” or “on top of that”.\n\nThis shop is very convenient. It’s near the station, and you can also come here by car.\n\nWhen the speaker states reasons using this pattern, he/she sometimes does not say his/her conclusion when it’s understood from the context.\n\nCould you teach English to my son?\n\nSorry. I often go on business trip, and I have to take a Japanese exam soon.\n\nBecause the color is beautiful (and for some other reasons), I’ll buy this pair of shoes.	28	2026-06-24 16:16:39.612	2026-06-24 16:16:39.612
3137	それに	Why did you choose Sakura University?	Why did you choose Sakura University?\n\nBecause it’s my father’s alma mater, there are many good teachers, and besides, it’s near my house.	28	2026-06-24 16:16:39.628	2026-06-24 16:16:39.628
3138	それで	The food is inexpensive and tasty in this restaurant.	The food is inexpensive and tasty in this restaurant.\n\nAnd that’s why it’s crowded.	28	2026-06-24 16:16:39.636	2026-06-24 16:16:39.636
3139	に	Do you often go to this coffee shop?	Do you often go to this coffee shop?	28	2026-06-24 16:16:39.644	2026-06-24 16:16:39.644
3140	Vて-formいます	The window is broken.	The window is broken.\n\nThe light is on.\n\nThe road was crowded this morning.\n\nThis chair is broken.	29	2026-06-24 16:16:39.817	2026-06-24 16:16:39.817
3141	Vて-form しまいました／しまいます	We drank all the wine that Mr. Schmidt brought.	We drank all the wine that Mr. Schmidt brought.\n\nI have done my Kanji homework already.\n\nI intend to finish writing the report by lunch time.	29	2026-06-24 16:16:39.847	2026-06-24 16:16:39.847
3142	V-てform しまいました	This expression conveys the speaker’s embarrassment or regret in a difficult situation.	This expression conveys the speaker’s embarrassment or regret in a difficult situation.\n\nI lost my passport.\n\nMy personal computer’s broken.	29	2026-06-24 16:16:39.864	2026-06-24 16:16:39.864
3143	ありました	I’ve found [the bag].	I’ve found [the bag].	29	2026-06-24 16:16:39.875	2026-06-24 16:16:39.875
3144	どこかで／どこかに	I’ve lost my wallet somewhere.	I’ve lost my wallet somewhere.\n\nIs there a pay phone somewhere nearby?	29	2026-06-24 16:16:39.881	2026-06-24 16:16:39.881
3145	Vて-formあります	There is a memo put on the desk.	There is a memo put on the desk.\n\nThis month’s schedule is written on the calendar.\n\nIn (*), it is indicated that someone put a memo on the desk (for later use) and as a result the memo exists as it was put. (**) indicates that someone wrote this month’s schedule on the calendar (so as not to forget it) and as a result the schedule is written on the calendar.\n\nThis sentence pattern is used when N2 in sentence pattern 1) is taken up as a topic.\n\nWhere is the memo?\n\nIt’s been put on the desk.\n\nThis month’s schedule has been written on the calendar.\n\nI have already bought the present for her birthday. (i)\n\nI have already reserved a hotel. (ii)\n\nThe window is closed. (x)\n\nThe window has been closed (for some purpose). (y)	30	2026-06-24 16:16:40.124	2026-06-24 16:16:40.124
3146	Vて-form おきます	This sentence pattern means:	This sentence pattern means:\n\n1) Completion of a necessary action by a given time\n\nI’ll buy a ticket before the trip.\n\nWhat should I do before the next meeting?\n\nRead these materials.\n\n2) Completion of a necessary action in readiness for the next use or the next step.\n\nWhen you finish using the scissors, put them back where they were.\n\n30) Keeping the resultant state as it is.\n\nPlease leave the chairs as they are because a meeting will be held here tomorrow.	30	2026-06-24 16:16:40.171	2026-06-24 16:16:40.171
3147	まだV (affirmative) still V	It’s still raining.	It’s still raining.\n\nShall I put away the tools?\n\nNo, leave them there. I’m still using them.	30	2026-06-24 16:16:40.19	2026-06-24 16:16:40.19
3148	それは～	I’d like to see a musical on Broadway…	I’d like to see a musical on Broadway…\n\nThat sounds nice.\n\nI will be transferred to the Osaka head office next month.\n\nCongratulations!\n\nSometimes I have pains in my stomach and head.	30	2026-06-24 16:16:40.211	2026-06-24 16:16:40.211
3149	Volitional form	The volitional form of verbs is made as follows.	The volitional form of verbs is made as follows.	31	2026-06-24 16:16:40.427	2026-06-24 16:16:40.427
3150	How to use the volitional form.	1) In plain style sentences	1) In plain style sentences\n\nShall we take a rest?\n\nHow about taking a rest for a while?\n\nShall I help you?\n\nI’m thinking of going to the beach at the weekend.\n\nI’m going to the bank now.\n\nHe is thinking of working in a foreign country.	31	2026-06-24 16:16:40.435	2026-06-24 16:16:40.435
3151	V dictionary form つもりです	V dictionary form つもりです	\N	31	2026-06-24 16:16:40.454	2026-06-24 16:16:40.454
3152	Vない-formない つもりです	Even when I go back to my country, I’ll continue with my judo.	Even when I go back to my country, I’ll continue with my judo.\n\nI’m determined not to smoke from tomorrow.	31	2026-06-24 16:16:40.456	2026-06-24 16:16:40.456
3153	V dictionary form予定です	V dictionary form予定です	\N	31	2026-06-24 16:16:40.465	2026-06-24 16:16:40.465
3154	Nの予定です	By using this sentence pattern, you can inform people of schedules.	By using this sentence pattern, you can inform people of schedules.\n\nI’m scheduled to go on a business trip to Germany at the end of July.\n\nThe trip is scheduled to last for a week.	31	2026-06-24 16:16:40.467	2026-06-24 16:16:40.467
3155	まだVて-formいません	This sentence pattern means that something has not taken place or has not been done yet.	This sentence pattern means that something has not taken place or has not been done yet.\n\nThe bank is not open yet.\n\nHave you written the report yet?	31	2026-06-24 16:16:40.471	2026-06-24 16:16:40.471
3156	こ～／そ～	There’s one thing missing in Tokyo. And that’s beautiful nature.	There’s one thing missing in Tokyo. And that’s beautiful nature.\n\nWhat I want most is a “magic door”. When you open this door, you can go anywhere you want.	31	2026-06-24 16:16:40.482	2026-06-24 16:16:40.482
3157	Vた-form ほうがいい	Vた-form ほうがいい	\N	32	2026-06-24 16:16:40.666	2026-06-24 16:16:40.666
3158	Vない-formない ほうがいい	It is good to do some exercise everyday.	It is good to do some exercise everyday.\n\nI have got a fever.\n\nSo, you had better not take a bath.\n\nThis pattern is used to make suggestions or to give advice. Depending on the situation, this expression may sound like you are imposing your opinion on the listener. Therefore, consider the context of the conversation carefully before using it.\n\nI would like to see some Japanese temples.\n\nSo, it would be a good idea to go to Kyoto.	32	2026-06-24 16:16:40.668	2026-06-24 16:16:40.668
3159	Plain form でしょう	Plain form でしょう	\N	32	2026-06-24 16:16:40.684	2026-06-24 16:16:40.684
3160	な-adj / N：～だ → ～な	This pattern expresses the speaker’s inference from some information he/she has. When used in a question like (**), the speaker asks for the listener’s inference.	This pattern expresses the speaker’s inference from some information he/she has. When used in a question like (**), the speaker asks for the listener’s inference.\n\nIt will rain tomorrow.\n\nDo you think Mr. Thawaphon will pass the exam?	32	2026-06-24 16:16:40.686	2026-06-24 16:16:40.686
3161	Plain formかもしれません	Plain formかもしれません	\N	32	2026-06-24 16:16:40.691	2026-06-24 16:16:40.691
3162	な-adj / N：～だ → ～な	We might not be in time for the appointment.	We might not be in time for the appointment.	32	2026-06-24 16:16:40.695	2026-06-24 16:16:40.695
3163	きっと／たぶん／もしかしたら	Mr. Miller will surely come.	Mr. Miller will surely come.\n\nIt will undoubted rain tomorrow.\n\nDo you think Mr. Miller will come?\n\nI guess Mr. Yamada does not know this news.\n\nThere is a possibility I might be unable to graduate in March.	32	2026-06-24 16:16:40.701	2026-06-24 16:16:40.701
3164	何か心配なこと	Is anything bothering you?	Is anything bothering you?\n\nI want to go skiing. Could you recommend a good ski resort?	32	2026-06-24 16:16:40.735	2026-06-24 16:16:40.735
3165	Quantifier で	Can I reach the station in thirty minutes?	Can I reach the station in thirty minutes?\n\nCan I buy a video player for 30,000 yen?	32	2026-06-24 16:16:40.748	2026-06-24 16:16:40.748
3166	Imperative and prohibitive forms	1) How to make imperative form of verbs	1) How to make imperative form of verbs\n\n2) How to make the prohibitive form of verbs	33	2026-06-24 16:16:41	2026-06-24 16:16:41
3167	Use of the imperative and prohibitive forms.	1) The imperative form is used to force a person to do something and the prohibitive form is used to command a person not to do something. Both the imperative and prohibitive forms have strong coerciv	1) The imperative form is used to force a person to do something and the prohibitive form is used to command a person not to do something. Both the imperative and prohibitive forms have strong coercive connotations, so much so that the use of these forms alone or at the end of an imperative sentence is very limited. In colloquial expressions, the use of either form is, in most cases, limited to male speakers.\n\n2) Both the imperative and prohibitive forms are used alone or at the end of a sentence in the following instances:\n\n– By a man senior in status or age to a person junior to him, or by a father to his child.\n\n– When there is not enough time to be very polite; e.g., when giving instructions to a large number of people in a factory or during an emergency, etc. Even in this case, they may be used only by men senior in status or age.\n\n– When a command is required during training many people or making students take exercise at schools and sport clubs.\n\n– When cheering at sporting events. In this case the expressions below are sometimes used by women as well.\n\n– When a strong impact or brevity is required, as in traffic sign or in slogan.	33	2026-06-24 16:16:41.016	2026-06-24 16:16:41.016
3168	～と読みますand～と書いてあります	How do you read that Kanji?	How do you read that Kanji?\n\n“Tomare” is written over there.	33	2026-06-24 16:16:41.041	2026-06-24 16:16:41.041
3169	X はY という意味です	“Tachiiri-Kinshi” means don’t enter.	“Tachiiri-Kinshi” means don’t enter.\n\nWhat does this sign mean?\n\nIt means machine washable.	33	2026-06-24 16:16:41.05	2026-06-24 16:16:41.05
3170	“ S “ と言っていました	“ S “ と言っていました	\N	33	2026-06-24 16:16:41.057	2026-06-24 16:16:41.057
3171	plain formと言っていました	Mr. Tanaka said, “I will take a day off work tomorrow.”	Mr. Tanaka said, “I will take a day off work tomorrow.”\n\nMr. Tanaka said that he would take a day off work tomorrow.	33	2026-06-24 16:16:41.06	2026-06-24 16:16:41.06
3172	“ S “ と伝えていただけませんか	“ S “ と伝えていただけませんか	\N	33	2026-06-24 16:16:41.068	2026-06-24 16:16:41.068
3173	plain formと伝えていただけませんか	These expressions are used when politely asking someone to convey a message.	These expressions are used when politely asking someone to convey a message.\n\nCould you please tell Mr. Wang to give me a call later?\n\nCould you please tell Ms. Watanabe that the party tomorrow will be from 6 o’clock?	33	2026-06-24 16:16:41.069	2026-06-24 16:16:41.069
3174	V1 dictionary form / V1た-form / Nの +とおりに、V2	This means to copy exactly in words or actions (V2) what one has heard, seen, read or learnt, etc. (V1).	This means to copy exactly in words or actions (V2) what one has heard, seen, read or learnt, etc. (V1).\n\nPlease do as I do.\n\nPlease write down what I say as it is.\n\nPlease tell us what you saw as it was.\n\nThis means that an action (V) is done in accordance with the manner shown by the preceding phrase.\n\nPlease cut the paper following the line.\n\nI assembled it according to the handbook.	34	2026-06-24 16:16:41.262	2026-06-24 16:16:41.262
3175	V1た-form / Nの + あとで、V2	This sentence pattern means the action or occurrence denoted by V2 takes place after the action or occurrence denoted by V1 or N has taken place.	This sentence pattern means the action or occurrence denoted by V2 takes place after the action or occurrence denoted by V1 or N has taken place.\n\nAfter I bought a new watch, I found the one I’d lost.\n\nShall we go and have a drink after work?	34	2026-06-24 16:16:41.288	2026-06-24 16:16:41.288
3176	V1て-form / V1ない-formないで + V2	V1 is an action or condition which accompanies the action denoted by V2.	V1 is an action or condition which accompanies the action denoted by V2.\n\nWe eat it with soy sauce.\n\nWe eat it without soy sauce.	34	2026-06-24 16:16:41.301	2026-06-24 16:16:41.301
3177	V1ない-form ないで + V2	This pattern is used when the speaker indicates a course of action taken out of two alternative possibilities presented.	This pattern is used when the speaker indicates a course of action taken out of two alternative possibilities presented.\n\nNext Sunday I won’t go anywhere. I will rest at home instead.	34	2026-06-24 16:16:41.308	2026-06-24 16:16:41.308
3178	How to make the conditional form	How to make the conditional form	\N	35	2026-06-24 16:16:41.555	2026-06-24 16:16:41.555
3179	Conditional form	With the use of the conditional form, the former part of the sentence describes the requirements needed for an event or occurrence to manifest itself.	With the use of the conditional form, the former part of the sentence describes the requirements needed for an event or occurrence to manifest itself.\n\nWhen the subject of the former part is the same as that of the latter, you cannot use verbs containing volition in both parts of the sentence at the same time.\n\n1) When describing the requirements needed for a certain event to manifest itself:\n\nIf you push the button, the window will open.\n\nIf he goes, I will go, too.\n\nWhen it is fine, an island can be seen over there.\n\n2) When describing the speaker’s judgement on what the other person has said or the situation:\n\nIf you don’t have any other opinions, let’s close this meeting now.\n\nDo I have to hand in the report by tomorrow?\n\nIf it is possible, hand it in by this Friday.\n\nPress here, and the door will open.\n\nIf you press here, the door will open.\n\nIf I don’t have time, I will not watch television.\n\nIf I don’t have time, I will not watch television.	35	2026-06-24 16:16:41.581	2026-06-24 16:16:41.581
3180	N なら、～	I want to visit a hot spring resort. Don’t you know any good place?	I want to visit a hot spring resort. Don’t you know any good place?\n\nIf you are talking about hot springs, Hakuba may be good.	35	2026-06-24 16:16:41.682	2026-06-24 16:16:41.682
3181	Interrogative V conditional form いいですか	I would like to borrow some books. What should I do?	I would like to borrow some books. What should I do?\n\nI would like to borrow some books. What should I do?	35	2026-06-24 16:16:41.705	2026-06-24 16:16:41.705
3182	V	V	\N	35	2026-06-24 16:16:41.716	2026-06-24 16:16:41.716
3183	い-adj	い-adj	\N	35	2026-06-24 16:16:41.719	2026-06-24 16:16:41.719
3184	な-adj	な-adj	\N	35	2026-06-24 16:16:41.722	2026-06-24 16:16:41.722
3185			\N	35	2026-06-24 16:16:41.727	2026-06-24 16:16:41.727
3186	conditional form	conditional form	\N	35	2026-06-24 16:16:41.729	2026-06-24 16:16:41.729
3187	V dictionary form	V dictionary form	\N	35	2026-06-24 16:16:41.731	2026-06-24 16:16:41.731
3188	い-adj（～い）	い-adj（～い）	\N	35	2026-06-24 16:16:41.732	2026-06-24 16:16:41.732
3189	な-adjな	な-adjな	\N	35	2026-06-24 16:16:41.734	2026-06-24 16:16:41.734
3190			\N	35	2026-06-24 16:16:41.735	2026-06-24 16:16:41.735
3191	ほど～	The more I listen to the music of the Beatles, the better I like it.	The more I listen to the music of the Beatles, the better I like it.\n\nThe easier of the operation, the better the computer	35	2026-06-24 16:16:41.736	2026-06-24 16:16:41.736
3192	V1 dictionary form	V1 dictionary form	\N	36	2026-06-24 16:16:41.99	2026-06-24 16:16:41.99
3193	V1ない-formない	V1ない-formない	\N	36	2026-06-24 16:16:41.994	2026-06-24 16:16:41.994
3194	ように、V2	V1 indicates a purpose or an aim, while V2 indicates a volitional action to get closer to that objective.	V1 indicates a purpose or an aim, while V2 indicates a volitional action to get closer to that objective.\n\nI practice every day so that I can swim fast.\n\nPlease take a memo so that you will not forget.	36	2026-06-24 16:16:41.998	2026-06-24 16:16:41.998
3195	V dictionary formように	V dictionary formように	\N	36	2026-06-24 16:16:42.012	2026-06-24 16:16:42.012
3196	Vない-formなく	Vない-formなく	\N	36	2026-06-24 16:16:42.017	2026-06-24 16:16:42.017
3197	なります	If you practice every day, you will become able to swim.	If you practice every day, you will become able to swim.\n\nI’ve finally become able to ride a bicycle.\n\nAs you get older, you cannot read small letters.\n\nI gained weight so I can no longer wear my favorite dress.\n\nHave you become able to play work by Chopin?\n\nThe Japanese started to eat beef and pork from about 100 years ago.\n\nI do not walk much since I bought a car.	36	2026-06-24 16:16:42.021	2026-06-24 16:16:42.021
3198	V dictionary form	V dictionary form	\N	36	2026-06-24 16:16:42.066	2026-06-24 16:16:42.066
3199	Vない-formない	Vない-formない	\N	36	2026-06-24 16:16:42.069	2026-06-24 16:16:42.069
3200	ようにします	This sentence pattern is used to express that one habitually or continuously makes efforts to do something or not to do something.	This sentence pattern is used to express that one habitually or continuously makes efforts to do something or not to do something.\n\nThis expresses that one habitually and continuously tries to do something.\n\nI try to take exercise every day and eat a variety of foods.\n\nI try not to eat sweets because they are bad for my teeth.\n\nWhen requesting someone to try to do something habitually and continuously.\n\nPlease try to eat more vegetables.\n\nWhen politely requesting someone to try to do something in a one-off situation.\n\nPlease be sure not to be late tomorrow.\n\nExcuse me, please pass me the salt.	36	2026-06-24 16:16:42.071	2026-06-24 16:16:42.071
3201	とか	What kind of sports do you do?	What kind of sports do you do?\n\nWell, playing tennis, swimming, and so on.	36	2026-06-24 16:16:42.11	2026-06-24 16:16:42.11
3202		Something that moves (animals, cars, etc.) can replace person2 in this sentence pattern.	Something that moves (animals, cars, etc.) can replace person2 in this sentence pattern.\n\nWhen a person (person2)’s action is directed to an object belonging to another person (person 1), and person1 feels annoyed or troubled, person1 uses this sentence pattern to express his/her feelings.\n\nLike in sentence pattern 2 above, an animate object or something that moves can replace person2.\n\nWhen you need not mention the person who does the action denoted by a verb, you can make the object of the verb the subject of the sentence. In this case, a passive verb is used.	37	2026-06-24 16:16:42.331	2026-06-24 16:16:42.331
3203		Related Post: Minna no Nihongo Lesson 37 Vocabulary	Related Post: Minna no Nihongo Lesson 37 Vocabulary	37	2026-06-24 16:16:42.406	2026-06-24 16:16:42.406
3204		Do you know that …?	Do you know that …?\n\nDo you know that Ms. Kimura had a baby?\n\nDo you know Mr. Miller’s address?\n\nRelated Post: Minna no Nihongo Lesson 38 Vocabulary	38	2026-06-24 16:16:42.631	2026-06-24 16:16:42.631
3205	Vて-form	Vて-form	\N	39	2026-06-24 16:16:42.819	2026-06-24 16:16:42.819
3206	Vない-formなくて	Vない-formなくて	\N	39	2026-06-24 16:16:42.82	2026-06-24 16:16:42.82
3207	い-adj (～い) → ～くて	い-adj (～い) → ～くて	\N	39	2026-06-24 16:16:42.822	2026-06-24 16:16:42.822
3208	な-adj [な] → で	な-adj [な] → で	\N	39	2026-06-24 16:16:42.824	2026-06-24 16:16:42.824
3209	、～	1) The words which come in the latter part are limited to those words which do not contain volition:	1) The words which come in the latter part are limited to those words which do not contain volition:\n\n– Potential verbs and verbs to express states:\n\n– Situations in the past:\n\n3) In this sentence pattern, the first part and the second part of the sentence are sequential events. In other words, the first part takes place first and the second part takes place after that.\n\nAs it is soft expression, it is not used with the imperative or the prohibitive forms.\n\nDon’t touch the machine because it’s dangerous.\n\nMay I leave now? I have something to do.\n\nRelated Post: Minna no Nihongo Lesson 39 Vocabulary	39	2026-06-24 16:16:42.826	2026-06-24 16:16:42.826
3210			\N	40	2026-06-24 16:16:43.068	2026-06-24 16:16:43.068
3211		This sentence pattern is used to show that the action denoted by the verb is a trial.	This sentence pattern is used to show that the action denoted by the verb is a trial.	40	2026-06-24 16:16:43.085	2026-06-24 16:16:43.085
3212			\N	40	2026-06-24 16:16:43.095	2026-06-24 16:16:43.095
3213		Related Post: Minna no Nihongo Lesson 40 Vocabulary	Related Post: Minna no Nihongo Lesson 40 Vocabulary	40	2026-06-24 16:16:43.103	2026-06-24 16:16:43.103
3214	Expressions for giving and receiving	In Lesson 7 and 24, you learned expressions for the giving and receiving of things and actions. In this lesson, you will learn other expressions for giving and receiving things and actions, but these 	In Lesson 7 and 24, you learned expressions for the giving and receiving of things and actions. In this lesson, you will learn other expressions for giving and receiving things and actions, but these reflect the relationship between the giver and the receiver.	41	2026-06-24 16:16:43.278	2026-06-24 16:16:43.278
3215			\N	41	2026-06-24 16:16:43.303	2026-06-24 16:16:43.303
3216	Giving and receiving of actions	Giving and receiving of actions	\N	41	2026-06-24 16:16:43.304	2026-06-24 16:16:43.304
3217			\N	41	2026-06-24 16:16:43.326	2026-06-24 16:16:43.326
3218	Vて-formくださいませんか	Vて-formくださいませんか	\N	41	2026-06-24 16:16:43.329	2026-06-24 16:16:43.329
3219			\N	41	2026-06-24 16:16:43.336	2026-06-24 16:16:43.336
3220	N にV	Related Post: Minna no Nihongo Lesson 41 Vocabulary	Related Post: Minna no Nihongo Lesson 41 Vocabulary	41	2026-06-24 16:16:43.337	2026-06-24 16:16:43.337
3221			\N	42	2026-06-24 16:16:43.52	2026-06-24 16:16:43.52
3222	V dictionary form	V dictionary form	\N	42	2026-06-24 16:16:43.521	2026-06-24 16:16:43.521
3223	Nの	Nの	\N	42	2026-06-24 16:16:43.523	2026-06-24 16:16:43.523
3224	ために、～	ために、～	\N	42	2026-06-24 16:16:43.526	2026-06-24 16:16:43.526
3225	in order to V for N	This sentence pattern indicates a purpose.	This sentence pattern indicates a purpose.\n\nI am saving money in order to be able to have my own shop.\n\n(*) means that one has intentionally set up the objective of ‘having a shop” and “is saving” money to attain that objective, while (**) means one’s objective is a state in which “a shop may be gained” and one “is saving money” in order to get closer to that state.	42	2026-06-24 16:16:43.528	2026-06-24 16:16:43.528
3226			\N	42	2026-06-24 16:16:43.551	2026-06-24 16:16:43.551
3227	V dictionary form の	V dictionary form の	\N	42	2026-06-24 16:16:43.553	2026-06-24 16:16:43.553
3228	N	N	\N	42	2026-06-24 16:16:43.555	2026-06-24 16:16:43.555
3229	に～	Let us summarize the expressions for indicating purpose that you have learned so far.	Let us summarize the expressions for indicating purpose that you have learned so far.	42	2026-06-24 16:16:43.559	2026-06-24 16:16:43.559
3230			\N	42	2026-06-24 16:16:43.612	2026-06-24 16:16:43.612
3231	Quantifierは	Quantifierは	\N	42	2026-06-24 16:16:43.616	2026-06-24 16:16:43.616
3232			\N	42	2026-06-24 16:16:43.63	2026-06-24 16:16:43.63
3233	Quantifierも	When attached to a quantifier, the particle indicates that the speaker thinks that the amount mentioned is a lot.	When attached to a quantifier, the particle indicates that the speaker thinks that the amount mentioned is a lot.\n\nRelated Post: Minna no Nihongo Lesson 42 Vocabulary	42	2026-06-24 16:16:43.634	2026-06-24 16:16:43.634
3234	V そうです	làm gì đó (rồi sẽ trở lại)	Cách dùng: dùng để diễn đạt tình trạng, trái thái đang hiện hữu bề ngoài, nói lên 1 ấn tượng có được từ 1 hiện tượng mà mình nhìn thấy tận mắt hay giải thích về tình trạng sự vật, sự việc ngay trước khi nó thay đổi.\n\nCách dùng: biểu thị hành động đi đâu đó làm gì rồi sau đó quay lại. Điều cần chú ý ở mẫu câu này là với 1 câu nhưng bao hàm 3 hành động\n\nChú ý: Địa điểm đi đến và thực hiện hành động ở đó được thể hiện bằng trợ từ 「で」. Tuy nhiên, khi địa điểm đó là nơi lấy đi (hoặc di chuyển) một vật thì ta dùng trợ từ 「から」.	43	2026-06-24 16:16:43.897	2026-06-24 16:16:43.897
3235			\N	44	2026-06-24 16:16:44.097	2026-06-24 16:16:44.097
3236	Vます-form	Vます-form	\N	44	2026-06-24 16:16:44.099	2026-06-24 16:16:44.099
3237	い-adj (～い)	い-adj (～い)	\N	44	2026-06-24 16:16:44.1	2026-06-24 16:16:44.1
3238	な-adj [な]	な-adj [な]	\N	44	2026-06-24 16:16:44.101	2026-06-24 16:16:44.101
3239	すぎます	すぎます	\N	44	2026-06-24 16:16:44.103	2026-06-24 16:16:44.103
3240			\N	44	2026-06-24 16:16:44.116	2026-06-24 16:16:44.116
3241			\N	44	2026-06-24 16:16:44.117	2026-06-24 16:16:44.117
3242	Vます-form	Vます-form	\N	44	2026-06-24 16:16:44.119	2026-06-24 16:16:44.119
3243	やすいです	やすいです	\N	44	2026-06-24 16:16:44.12	2026-06-24 16:16:44.12
3244	にくいです	1) These phrases depict the easiness or difficulty in handling or doing something.	1) These phrases depict the easiness or difficulty in handling or doing something.\n\n2) These phrases depict the easiness or difficulty in the characteristics of an object or a person changing or in the likelihood of something happening.	44	2026-06-24 16:16:44.121	2026-06-24 16:16:44.121
3245			\N	44	2026-06-24 16:16:44.134	2026-06-24 16:16:44.134
3246	い-adj (～い) → ～く	い-adj (～い) → ～く	\N	44	2026-06-24 16:16:44.135	2026-06-24 16:16:44.135
3247	な-adj [な] → ～に	な-adj [な] → ～に	\N	44	2026-06-24 16:16:44.136	2026-06-24 16:16:44.136
3248	Nに	Nに	\N	44	2026-06-24 16:16:44.138	2026-06-24 16:16:44.138
3249	します	します	\N	44	2026-06-24 16:16:44.14	2026-06-24 16:16:44.14
3250			\N	44	2026-06-24 16:16:44.148	2026-06-24 16:16:44.148
3251	Nにします	Nにします	\N	44	2026-06-24 16:16:44.149	2026-06-24 16:16:44.149
3252			\N	44	2026-06-24 16:16:44.157	2026-06-24 16:16:44.157
3253	い-adj (～い) → ～く	い-adj (～い) → ～く	\N	44	2026-06-24 16:16:44.159	2026-06-24 16:16:44.159
3254	な-adj [な] → ～に	な-adj [な] → ～に	\N	44	2026-06-24 16:16:44.161	2026-06-24 16:16:44.161
3255	V	When changing adjectives into the forms written above, they function as adverbs.	When changing adjectives into the forms written above, they function as adverbs.\n\nRelated Post: Minna no Nihongo Lesson 44 Vocabulary	44	2026-06-24 16:16:44.163	2026-06-24 16:16:44.163
3256			\N	45	2026-06-24 16:16:44.324	2026-06-24 16:16:44.324
3257	V dictionary form	V dictionary form	\N	45	2026-06-24 16:16:44.33	2026-06-24 16:16:44.33
3258	Vた-form	Vた-form	\N	45	2026-06-24 16:16:44.335	2026-06-24 16:16:44.335
3259	Vない-formない	Vない-formない	\N	45	2026-06-24 16:16:44.341	2026-06-24 16:16:44.341
3260	い-adj (～い)	い-adj (～い)	\N	45	2026-06-24 16:16:44.347	2026-06-24 16:16:44.347
3261	な-adjな	な-adjな	\N	45	2026-06-24 16:16:44.351	2026-06-24 16:16:44.351
3262	Nの	Nの	\N	45	2026-06-24 16:16:44.354	2026-06-24 16:16:44.354
3263	場合は、～	場合は、～	\N	45	2026-06-24 16:16:44.36	2026-06-24 16:16:44.36
3264			\N	45	2026-06-24 16:16:44.386	2026-06-24 16:16:44.386
3265	Plain form のに、～	Plain form のに、～	\N	45	2026-06-24 16:16:44.39	2026-06-24 16:16:44.39
3266	な-adj / N：～だ → ～な	In (*), the speaker expects that the woman will come because she promised to do so. So he naturally feels disappointed that she did not come. In (**), Sunday is normally a holiday, yet the speaker has	In (*), the speaker expects that the woman will come because she promised to do so. So he naturally feels disappointed that she did not come. In (**), Sunday is normally a holiday, yet the speaker has to work so he feels dissatisfied. The second clause implies feelings of unexpectedness or dissatisfaction.\n\nMy room is small but clean.\n\nEven if it rains tomorrow, I will go out.\n\nYou promised to come. Why didn’t you come?\n\nRelated Post: Minna no Nihongo Lesson 45 Vocabulary	45	2026-06-24 16:16:44.396	2026-06-24 16:16:44.396
3267			\N	46	2026-06-24 16:16:44.712	2026-06-24 16:16:44.712
3268	V dictionary form	V dictionary form	\N	46	2026-06-24 16:16:44.714	2026-06-24 16:16:44.714
3269	Vて-formいる	Vて-formいる	\N	46	2026-06-24 16:16:44.716	2026-06-24 16:16:44.716
3270	Vた-form	Vた-form	\N	46	2026-06-24 16:16:44.718	2026-06-24 16:16:44.718
3271	ところです	ところです	\N	46	2026-06-24 16:16:44.721	2026-06-24 16:16:44.721
3272			\N	46	2026-06-24 16:16:44.765	2026-06-24 16:16:44.765
3273	Vた-form ばかりです	Vた-form ばかりです	\N	46	2026-06-24 16:16:44.766	2026-06-24 16:16:44.766
3274			\N	46	2026-06-24 16:16:44.777	2026-06-24 16:16:44.777
3275	V dictionary form	V dictionary form	\N	46	2026-06-24 16:16:44.778	2026-06-24 16:16:44.778
3276	Vた-form	Vた-form	\N	46	2026-06-24 16:16:44.78	2026-06-24 16:16:44.78
3277	Vない-formない	Vない-formない	\N	46	2026-06-24 16:16:44.781	2026-06-24 16:16:44.781
3278	い-adj (～い)	い-adj (～い)	\N	46	2026-06-24 16:16:44.782	2026-06-24 16:16:44.782
3279	な-adjな	な-adjな	\N	46	2026-06-24 16:16:44.784	2026-06-24 16:16:44.784
3280	Nの	Nの	\N	46	2026-06-24 16:16:44.785	2026-06-24 16:16:44.785
3281			\N	46	2026-06-24 16:16:44.786	2026-06-24 16:16:44.786
3282	はずです	はずです	\N	46	2026-06-24 16:16:44.788	2026-06-24 16:16:44.788
3283		Related Post: Minna no Nihongo Lesson 46 Vocabulary	Related Post: Minna no Nihongo Lesson 46 Vocabulary	46	2026-06-24 16:16:44.792	2026-06-24 16:16:44.792
3284	Plain form そうです	In example (**) the information source is Mr. Miller himself, while in example (*) it is highly possible that the information source is not necessarily Mr. Miller but somebody else. Another difference	In example (**) the information source is Mr. Miller himself, while in example (*) it is highly possible that the information source is not necessarily Mr. Miller but somebody else. Another difference is that in example (**) the words which Mr. Miller said can be quoted directly or indirectly. In example (*) on the other hand, only the plain form may be used.	47	2026-06-24 16:16:44.948	2026-06-24 16:16:44.948
3285	Plain formようです	Plain formようです	\N	47	2026-06-24 16:16:44.97	2026-06-24 16:16:44.97
3286	な-adj：～だ → ～な	な-adj：～だ → ～な	\N	47	2026-06-24 16:16:44.972	2026-06-24 16:16:44.972
3287	N ：～だ → ～の	Examples (i) indicates an intuitive judgement based on what the speaker has seen of Mr. Miller’s condition or behavior, and example (ii) indicates the speaker’s judgement based on what he has read, he	Examples (i) indicates an intuitive judgement based on what the speaker has seen of Mr. Miller’s condition or behavior, and example (ii) indicates the speaker’s judgement based on what he has read, heard or been told.	47	2026-06-24 16:16:44.976	2026-06-24 16:16:44.976
3288	声／音／におい／味がします	Related Post: Minna no Nihongo Lesson 47 Vocabulary	Related Post: Minna no Nihongo Lesson 47 Vocabulary	47	2026-06-24 16:16:44.989	2026-06-24 16:16:44.989
3289	Causative verbs	How to make causative verbs	How to make causative verbs	48	2026-06-24 16:16:45.113	2026-06-24 16:16:45.113
3290	Causative verb sentences	make/let a person V (intransitive verb)	make/let a person V (intransitive verb)\n\nmake/let a person V (transitive verb)	48	2026-06-24 16:16:45.129	2026-06-24 16:16:45.129
3291	Usage of causative	Causative verbs indicate compulsion or permission. A causative sentence is used when the relationship between a senior person and a junior person is very clear (e.g., a parent and child, an elder brot	Causative verbs indicate compulsion or permission. A causative sentence is used when the relationship between a senior person and a junior person is very clear (e.g., a parent and child, an elder brother and younger brother, a superior and subordinates, etc.) and the senior person forces the junior person to do a certain act, or allows him to do something. (*) and (i) are examples of compulsion and (**) and (ii) are those of permission. But when the speaker tells a person from outside his own group that he will make someone from within his group do something, as seen in the example below, the causative sentence is used regardless of their status.	48	2026-06-24 16:16:45.165	2026-06-24 16:16:45.165
3292	V causative て-form いただけませんか	Would you please let me do …?	Would you please let me do …?\n\nRelated Post: Minna no Nihongo Lesson 48 Vocabulary	48	2026-06-24 16:16:45.192	2026-06-24 16:16:45.192
3293	敬語 (honorific expressions)	敬語 (honorific expressions)	\N	49	2026-06-24 16:16:45.461	2026-06-24 16:16:45.461
3294	Types of 敬語	Types of 敬語	\N	49	2026-06-24 16:16:45.466	2026-06-24 16:16:45.466
3295	尊敬語 (respectful expressions)	(1) Respectful verbs	(1) Respectful verbs\n\nThe same verbs used in the passive are used as respectful verb. They are Group II verbs.\n\n(3) Special respectful words\n\nSome verbs have special respectful equivalents. They are considered to show the same level of respect as (2) above.\n\nThis is the respectful way of instructing or inviting someone to do something.\n\n2) Nouns, adjectives and adverbs	49	2026-06-24 16:16:45.471	2026-06-24 16:16:45.471
3296	敬語 and style of sentence	敬語 and style of sentence	\N	49	2026-06-24 16:16:45.571	2026-06-24 16:16:45.571
3297	Uniform level of 敬語 in a sentence	The department manager’s wife will go golfing together with him.	The department manager’s wife will go golfing together with him.	49	2026-06-24 16:16:45.587	2026-06-24 16:16:45.587
3298	～まして	Related Post: Minna no Nihongo Lesson 49 Vocabulary	Related Post: Minna no Nihongo Lesson 49 Vocabulary	49	2026-06-24 16:16:45.607	2026-06-24 16:16:45.607
3299	謙譲語 (humble expressions)	In examples (*) and (**), the speaker humbles himself/herself by lowering his/her acts to show his/her respect to the listener (*) or the person being referred to (**). In example (***), the action is	In examples (*) and (**), the speaker humbles himself/herself by lowering his/her acts to show his/her respect to the listener (*) or the person being referred to (**). In example (***), the action is performed by an insider, not by the speaker.\n\n2) Special humble verbs\n\nThere are some verbs which contain humble meanings. They are used as follows.\n\n(1) When the speaker’s act involves the listener or the person to whom respect is directed:\n\n(2) When the speaker’s act does not involve the listener or the person to whom respect is directed:	50	2026-06-24 16:16:45.965	2026-06-24 16:16:45.965
3300	丁寧語 (polite expressions)	Hello, this is IMC.	Hello, this is IMC.\n\nThis is Schmidt of Power Electric. May I speak to Mr. Miller?\n\nRelated Post: Minna no Nihongo Lesson 50 Vocabulary	50	2026-06-24 16:16:46.038	2026-06-24 16:16:46.038
\.


--
-- Data for Name: KanjiEntry; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."KanjiEntry" (id, "character", "hanViet", onyomi, kunyomi, "meaningVi", "mnemonicJp", "mnemonicVi", "imageUrl", "sortOrder", "lessonId", "createdAt", "updatedAt") FROM stdin;
1	一	NHẤT	いち, いつ	ひと-つ	một, đồng nhất, nhất định	一本（いっぽん）の指（ゆび）で示（しめ）したのが「一」です	Một ngón tay trỏ biểu thị cho số 1. (Nhất)	https://www.vnjpclub.com/images/kanji512/bai1/one.jpg	1	1	2026-06-24 06:26:08.521	2026-06-24 06:26:08.521
2	二	NHỊ	に	ふた-つ	2	二本（にほん）の指（ゆび）で示（しめ）したのが「二」です	Hai ngón tay biểu thị cho số 2. (Nhị)	https://www.vnjpclub.com/images/kanji512/bai1/two.jpg	2	1	2026-06-24 06:26:08.55	2026-06-24 06:26:08.55
3	三	TAM	さん	み、みっ-つ	3	三本（さんぼん）の指（ゆび）で示（しめ）したのが「三」です	Ba ngón tay biểu thị cho số 3. (Tam)	https://www.vnjpclub.com/images/kanji512/bai1/three.jpg	3	1	2026-06-24 06:26:08.573	2026-06-24 06:26:08.573
4	四	TỨ	し	よん、よ-つ	4	四角（しかく）には四（よっ）つの角（かど）があります	Hình tứ giác có 4 góc biểu thị cho số 4.	https://www.vnjpclub.com/images/kanji512/bai1/four.jpg	4	1	2026-06-24 06:26:08.594	2026-06-24 06:26:08.594
5	五	NGŨ	ご	いつ-つ	5	五本（ごほん）のマッチで［五（ご）」の形（かたち）が作（つく）れますか	Bạn có thể tạo thành hình chữ 「五」với 5 que diêm không?	https://www.vnjpclub.com/images/kanji512/bai1/five.jpg	5	1	2026-06-24 06:26:08.613	2026-06-24 06:26:08.613
6	六	LỤC	ろく	む-つ	6	中国（ちゅうごく）の人（ひと）は、６をこうやって表（あらわ）します	Người Trung Quốc biểu thị số 6 bằng cách như vầy.	https://www.vnjpclub.com/images/kanji512/bai1/six.jpg	6	1	2026-06-24 06:26:08.631	2026-06-24 06:26:08.631
7	七	THẤT	しち	し,なな, なな-つ, なの, しっ, な, ひち	7	2たす５は７です	2 cộng 5 bằng 7.	https://www.vnjpclub.com/images/kanji512/bai1/seven.jpg	7	1	2026-06-24 06:26:08.65	2026-06-24 06:26:08.65
8	八	BÁT	はち	や、や-つ	8	カタカナの「ハチ」は［八（はち）］です	Nó là chữ「ハ」 trong từ katakana「ハチ」(số 8).	https://www.vnjpclub.com/images/kanji512/bai1/eight.jpg	8	1	2026-06-24 06:26:08.669	2026-06-24 06:26:08.669
9	九	CỬU	きゅう, く	ここの-つ	9	10回（かい）腕（うで）立（た）て伏（ふ）せができますか。「７，８，９…だめだ」	”Bạn có thể hít đất 10 lần không?”	https://www.vnjpclub.com/images/kanji512/bai1/nine.jpg	9	1	2026-06-24 06:26:08.687	2026-06-24 06:26:08.687
10	十	THẬP	じゅう, じ, とお	\N	mười	常（じょう）本（ほん）を束（たば）ねましょう	Chúng ta hãy bó 10 que lại.	https://www.vnjpclub.com/images/kanji512/bai1/ten.jpg	10	1	2026-06-24 06:26:08.704	2026-06-24 06:26:08.704
11	百	BÁCH	ひゃく, もも	\N	trăm, bách niên	100を90度（ど）右（みぎ）へ回転（かいてん）すると、［百（ひゃく）］のようになります	Xoay số ”100 ” 90 độ về bên phải thì nó sẽ trở thành chữ 「百」	https://www.vnjpclub.com/images/kanji512/bai1/hundred.jpg	11	1	2026-06-24 06:26:08.721	2026-06-24 06:26:08.721
12	千	THIÊN	せん, ち	\N	nghìn, nhiều, thiên lí	十（じゅう）に［ノ］を足（た）して、もっと多（おお）い、［千（せん）］になりました	Cộng nét 「ノ」vào số 10「十」 ta sẽ có một số lớn hơn rất nhiều, số 1000	https://www.vnjpclub.com/images/kanji512/bai1/thousand.jpg	12	1	2026-06-24 06:26:08.74	2026-06-24 06:26:08.74
13	万	VẠN	まん, ばん, →萬［萬	\N	vạn, nhiều, vạn vật	一万（いちまん）は5桁（けた）の数字（すうじ）です	Số 10.000 là số có 5 chữ số.	https://www.vnjpclub.com/images/kanji512/bai1/ten_thousand.jpg	13	1	2026-06-24 06:26:08.759	2026-06-24 06:26:08.759
14	円	VIÊN	えん	つぶら,まる-い, まる, まど, まど-か, まろ-やか, のぶ, まどか, みつ	viên mãn, tiền Yên	円（えん）の形（かたち）です	Hình dạng của hình tròn	https://www.vnjpclub.com/images/kanji512/bai1/yen_circle.jpg	14	1	2026-06-24 06:26:08.774	2026-06-24 06:26:08.774
15	口	KHẨU	こう, く, くち	\N	miệng, nhân khẩu, khẩu ngữ	口（くち）の形（かたち）です	Hình dạng của cái miệng	https://www.vnjpclub.com/images/kanji512/bai1/mouth.jpg	15	1	2026-06-24 06:26:08.792	2026-06-24 06:26:08.792
16	目	MỤC	もく, ぼく, め	\N	mắt, hạng mục, mục lục	目（め）の形（かたち）です	Hình dạng của con mắt	https://www.vnjpclub.com/images/kanji512/bai1/eye.jpg	16	1	2026-06-24 06:26:08.808	2026-06-24 06:26:08.808
17	日	NHẬT	にち, じつ, ひ	\N	mặt trời, ngày, nhật thực, nhật báo	お日（ひ）様（さま）の形（かたち）です	Hình dạng của mặt trời	https://www.vnjpclub.com/images/kanji512/bai2/day_sun.jpg	1	2	2026-06-24 06:26:08.823	2026-06-24 06:26:08.823
18	月	NGUYỆT	げつ, がつ, つき	\N	mặt trăng, tháng, nguyệt san, nguyệt thực	三日（みっか）月（づき）の形（かたち）です	Hình dạng của mặt trăng lưỡi liềm	https://www.vnjpclub.com/images/kanji512/bai2/month_moon.jpg	2	2	2026-06-24 06:26:08.842	2026-06-24 06:26:08.842
19	火	HỎA	か, ひ	\N	lửa	火（ひ）の形（かたち）です	Hình dạng của ngọn lữa	https://www.vnjpclub.com/images/kanji512/bai2/fire.jpg	3	2	2026-06-24 06:26:08.861	2026-06-24 06:26:08.861
20	水	THỦY	すい, みず, みな	\N	thủy điện	滝（たき）が水（みず）しぶきをあげています	Thác nước phun nước	https://www.vnjpclub.com/images/kanji512/bai2/water.jpg	4	2	2026-06-24 06:26:08.881	2026-06-24 06:26:08.881
21	木	MỘC	ぼく, もく, き	\N	cây, gỗ	木（き）の形（かたち）です	Hình dạng cái cây	https://www.vnjpclub.com/images/kanji512/bai2/tree.jpg	5	2	2026-06-24 06:26:08.903	2026-06-24 06:26:08.903
22	金	KIM	きん, こん, かね	\N	hoàng kim, kim ngân	山（やま）の下（した）に金（きん）があるそうです	Nghe nói dưới núi có vàng（金）	https://www.vnjpclub.com/images/kanji512/bai2/gold.jpg	6	2	2026-06-24 06:26:08.942	2026-06-24 06:26:08.942
23	土	THỔ	ど, と, つち	\N	thổ địa, thổ công	土（つち）から芽（め）が出（で）ました	Hạt mầm đâm chồi từ mặt đất（土）	https://www.vnjpclub.com/images/kanji512/bai2/soil.jpg	7	2	2026-06-24 06:26:08.973	2026-06-24 06:26:08.973
24	曜	DIỆU	よう	\N	ngày trong tuần	週（しゅう）の始（はじ）まりに、鳥（とり）がピヨピヨと鳴（な）きます	Đầu tuần chim sẽ hót: ”Piyo piyo”	https://www.vnjpclub.com/images/kanji512/bai2/weekday.jpg	8	2	2026-06-24 06:26:08.998	2026-06-24 06:26:08.998
25	本	BẢN	ほん, もと	\N	sách, cơ bản, nguyên bản, bản chất	ここが木（き）のもとです。［一］で印（しるし）をつけましょう	Đây là gốc của cái cây. Hãy đánh dấu 「一」	https://www.vnjpclub.com/images/kanji512/bai2/book_base.jpg	9	2	2026-06-24 06:26:09.023	2026-06-24 06:26:09.023
26	人	NHÂN	じん, にん, ひと	\N	nhân vật	人（ひと）が日本（にほん）の足（あし）で立（た）っています	Con người đứng bằng 2 chân	https://www.vnjpclub.com/images/kanji512/bai2/person.jpg	10	2	2026-06-24 06:26:09.037	2026-06-24 06:26:09.037
27	今	KIM	こん, きん, いま	\N	đương kim, kim nhật	「今（いま）、何（なに）をしているの？」 「家（いえ）で、ラララと歌（うた）っているの」	Bây giờ bạn đang làm gì? Tôi đang ở nhà hát la la la	https://www.vnjpclub.com/images/kanji512/bai2/now.jpg	11	2	2026-06-24 06:26:09.051	2026-06-24 06:26:09.051
28	寺	TỰ	じ, てら	\N	chùa	ほら、土（つち）の上（うえ）にお寺（てら）があります	Nhìn này, có ngôi chùa trên mặt đất kìa!	https://www.vnjpclub.com/images/kanji512/bai2/temple.jpg	12	2	2026-06-24 06:26:09.064	2026-06-24 06:26:09.064
29	時	THỜI	じ, とき	\N	thời gian	昔（むかし）、人々（ひとびと）はお寺（てら）の鐘（かね）を鳴（な）らして、時間（じかん）を知（し）らせました	Ngày xưa, người ta rung chuông chùa để báo giờ.	https://www.vnjpclub.com/images/kanji512/bai2/time.jpg	13	2	2026-06-24 06:26:09.073	2026-06-24 06:26:09.073
30	半	BÁN	はん	なか-ば	bán cầu, bán nguyệt	三本（さんぼん）の線（せん）を半分（はんぶん）に切（き）りましょう。あれ、最初（さいしょ）の線（せん）しか切（き）れません	Hãy cắt 3 đường ra làm đôi.	https://www.vnjpclub.com/images/kanji512/bai2/half.jpg	14	2	2026-06-24 06:26:09.09	2026-06-24 06:26:09.09
31	刀	ĐAO	とう, かたな	\N	cái đao	刀（かたな）の形（かたち）です	Hình dạng của con dao	https://www.vnjpclub.com/images/kanji512/bai2/sword.jpg	15	2	2026-06-24 06:26:09.104	2026-06-24 06:26:09.104
32	分	PHÂN	ぶん, ふん, ぶ	わ-ける	phân số, phân chia	刀（かたな）で半分（はんぶん）に切（き）りましょう	Hãy chia nó ra phân nửa bằng con dao!	https://www.vnjpclub.com/images/kanji512/bai2/minute_to_divide.jpg	16	2	2026-06-24 06:26:09.113	2026-06-24 06:26:09.113
33	上	THƯỢNG	じょう, しょう	あおい,うえ, -うえ, うわ-, かみ, あ-げる, -あ-げる, あ-がる, -あ-がる, あ-がり, -あ-がり, のぼ-る, のぼ-り, のぼ-せる, のぼ-す, よ-す, あげ, い, か,	thượng tầng, thượng đẳng	ここが線（せん）より上（うえ）です	chổ này là phía trên đường thẳng	https://www.vnjpclub.com/images/kanji512/bai3/up.jpg	1	3	2026-06-24 06:26:09.135	2026-06-24 06:26:09.135
34	下	HẠ	か, げ	した、さ-げる、くだ-る、もと	dưới, hạ đẳng	ここが線（せん）より下（した）です	chổ này là phía dưới đường thẳng	https://www.vnjpclub.com/images/kanji512/bai3/down.jpg	2	3	2026-06-24 06:26:09.15	2026-06-24 06:26:09.15
35	中	TRUNG	ちゅう, なか	\N	trung tâm, trung gian, trung ương	ここが円（えん）の真（ま）ん中（なか）です	chổ này ở chính giữa vòng tròn	https://www.vnjpclub.com/images/kanji512/bai3/middle_center.jpg	3	3	2026-06-24 06:26:09.159	2026-06-24 06:26:09.159
36	外	NGOẠI	がい, げ	そと、はず-す、ほか	ngoài, ngoại thành, ngoại đạo	煙草（たばこ）は外（そと）で吸（す）いましょう	Chúng ta hãy hút thuốc lá ở bên ngoài.	https://www.vnjpclub.com/images/kanji512/bai3/outside.jpg	4	3	2026-06-24 06:26:09.178	2026-06-24 06:26:09.178
37	右	HỮU	う, ゆう, みぎ	\N	bên phải, hữu ngạn, cánh hữu	右手（みぎて）で食（た）べます	Ăn bằng tay phải.	https://www.vnjpclub.com/images/kanji512/bai3/right.jpg	5	3	2026-06-24 06:26:09.191	2026-06-24 06:26:09.191
38	工	CÔNG	こう, く, たくみ	\N	công tác, công nhân	名人（めいじん）の定規（じょうぎ）です	Hình dạng một cây thước của nghệ nhân	https://www.vnjpclub.com/images/kanji512/bai3/craft.jpg	6	3	2026-06-24 06:26:09.205	2026-06-24 06:26:09.205
39	左	TẢ	さ, ひだり	\N	bên trái, tả hữu, cánh tả	右（みぎ）手（て）で定規（じょうぎ）を押（お）さえます	Giữ cây thước bằng tay trái.	https://www.vnjpclub.com/images/kanji512/bai3/left.jpg	7	3	2026-06-24 06:26:09.223	2026-06-24 06:26:09.223
40	前	TIỀN	ぜん, まえ	\N	trước, tiền sử, tiền chiến, mặt tiền	月（つき）が出（で）る前（まえ）に、晩（ばん）ご飯（はん）の準備（じゅんび）をします	Chuẩn bị bữa tối trước khi trăng lên.	https://www.vnjpclub.com/images/kanji512/bai3/before_front.jpg	8	3	2026-06-24 06:26:09.236	2026-06-24 06:26:09.236
41	後	HẬU	ご, こう	こし,のち, うし-ろ, うしろ, あと, おく-れる, し, しい, しり	sau, hậu quả, hậu sự	道（みち）を後（うし）ろ向（む）きに歩（ある）いています	Đi bộ trên đường hướng lừng về phía sau	https://www.vnjpclub.com/images/kanji512/bai3/back_after.jpg	9	3	2026-06-24 06:26:09.253	2026-06-24 06:26:09.253
42	午	NGỌ	ご, うま	\N	chính ngọ	この漢字（かんじ）には、［十（じゅう）」と［二（に）」が入（はい）っています。十二時（じゅうにじ）は正午（しょうご）です	Chữ hán này gồm có số 10「十」 và số 2「二」. 12 giờ là buổi trưa.	https://www.vnjpclub.com/images/kanji512/bai3/noon.jpg	10	3	2026-06-24 06:26:09.261	2026-06-24 06:26:09.261
43	門	MÔN	もん, かど	\N	cửa, nhập môn, môn đồ, bộ môn	門（もん）の形（かたち）です	Hình dạng cánh cổng	https://www.vnjpclub.com/images/kanji512/bai3/gate.jpg	11	3	2026-06-24 06:26:09.269	2026-06-24 06:26:09.269
44	間	GIAN	かん, けん, あいだ, ま	\N	trung gian, không gian	門（もん）の間（あいだ）にお日様（ひさま）が見（み）えます	Ta có thể thấy mặt trời giữa hai cánh cổng.	https://www.vnjpclub.com/images/kanji512/bai3/between.jpg	12	3	2026-06-24 06:26:09.283	2026-06-24 06:26:09.283
45	東	ĐÔNG	とう, ひがし	\N	phía đông	日（ひ）は東（ひがし）から昇（のぼ）ります。木（き）の後（うし）ろにお日様（ひさま）が見（み）えます	Mặt trời mọc ở hướng đông. Ta có thể nhìn thấy mặt trời phía sau ngọn cây.	https://www.vnjpclub.com/images/kanji512/bai3/east.jpg	13	3	2026-06-24 06:26:09.295	2026-06-24 06:26:09.295
46	西	TÂY	せい, さい, にし	\N	phương tây	四（よっ）つの方角（ほうがく）の一（ひと）つが西（にし）です	Một （一）trong 4 （四）hướng là hướng Tây.	https://www.vnjpclub.com/images/kanji512/bai3/west.jpg	14	3	2026-06-24 06:26:09.311	2026-06-24 06:26:09.311
47	南	NAM	なん, な, みなみ	\N	phương nam	二（ふた）つの植物（しょくぶつ）は南（みなみ）向（む）きの庭（にわ）で育（そだ）っています	2 cây mọc trong vườn quay về hướng nam.	https://www.vnjpclub.com/images/kanji512/bai3/south.jpg	15	3	2026-06-24 06:26:09.325	2026-06-24 06:26:09.325
48	北	BẮC	ほく, きた	\N	phương bắc	北（きた）は寒（さむ）いので、二人（ふたり）ほ人（ひと）が背中（せなか）を合（あ）わせて座（すわ）っています	Vì phía bắc trời lạnh nên 2 người ngồi đâu lưng lại với nhau.	https://www.vnjpclub.com/images/kanji512/bai3/north.jpg	16	3	2026-06-24 06:26:09.336	2026-06-24 06:26:09.336
49	田	ĐIỀN	でん, た	\N	điền viên, tá điền	田（た）んぼの形（かたち）です	Hình dáng cánh đồng	https://www.vnjpclub.com/images/kanji512/bai4/rice_field.jpg	1	4	2026-06-24 06:26:09.349	2026-06-24 06:26:09.349
50	力	LỰC	りょく, りき, ちから	\N	sức lực	筋肉（きんにく）失（しつ）の男（おとこ）の人（ひと）は力持（ちからも）ちです	Người đàng ông cơ bắp có sức mạnh	https://www.vnjpclub.com/images/kanji512/bai4/power.jpg	2	4	2026-06-24 06:26:09.354	2026-06-24 06:26:09.354
51	男	NAM	だん, なん, おとこ	\N	đàn ông, nam giới	男（おとこ）の人（ひと）が力（ちから）を出（だ）して、田（た）んぼで働（はたら）いています	Người đàn ông đang ra sức làm việc trên ruộng lúa.	https://www.vnjpclub.com/images/kanji512/bai4/man.jpg	3	4	2026-06-24 06:26:09.367	2026-06-24 06:26:09.367
52	女	NỮ	じょ, にょ, にょう, おんな, め	\N	phụ nữ	女（おんな）の人（ひと）の形（かたち）です	Hình dáng của người nữ	https://www.vnjpclub.com/images/kanji512/bai4/woman.jpg	4	4	2026-06-24 06:26:09.374	2026-06-24 06:26:09.374
53	子	TỬ	し, す, こ, ね	\N	tử tôn, phần tử, phân tử, nguyên tử	子（こ）どもの形（かたち）です	Hình dáng của một đứa bé	https://www.vnjpclub.com/images/kanji512/bai4/child.jpg	5	4	2026-06-24 06:26:09.389	2026-06-24 06:26:09.389
54	学	HỌC	がく	まな-ぶ	học sinh, học thuyết	子（こ）どもは学校（がっこう）で学（まな）びます	Đứa trẻ học ở trường.	https://www.vnjpclub.com/images/kanji512/bai4/learning.jpg	6	4	2026-06-24 06:26:09.404	2026-06-24 06:26:09.404
55	生	SINH	せい, しょう	い-きる、なま	sinh sống, sinh sản	植物（しょくぶつ）が土（つち）から生（う）まれます	Cây cối được sinh ra từ mặt đất.	https://www.vnjpclub.com/images/kanji512/bai4/birth.jpg	7	4	2026-06-24 06:26:09.421	2026-06-24 06:26:09.421
56	先	TIÊN	せん, さき	\N	tiên sinh, tiên tiến	誰（だれ）よりも先（さき）を走（はし）っています	Người ấy đang chạy trước mọi người.	https://www.vnjpclub.com/images/kanji512/bai4/ahead.jpg	8	4	2026-06-24 06:26:09.432	2026-06-24 06:26:09.432
57	何	HÀ	か, なに, なん	\N	cái gì, hà cớ	人（ひと）が何（なに）か運（はこ）んでいます。それは何（なに）？	Một người đang khiêng cái gì đó.	https://www.vnjpclub.com/images/kanji512/bai4/what.jpg	9	4	2026-06-24 06:26:09.45	2026-06-24 06:26:09.45
58	父	PHỤ	ふ, ちち	\N	phụ tử, phụ thân, phụ huynh	父（ちち）にはひげがあります	Cha tôi có râu.	https://www.vnjpclub.com/images/kanji512/bai4/father.jpg	10	4	2026-06-24 06:26:09.465	2026-06-24 06:26:09.465
59	母	MẪU	ぼ, はは	\N	mẹ, phụ mẫu, mẫu thân	お母（かあ）さんの形（かたち）です	Hình dáng của người mẹ.	https://www.vnjpclub.com/images/kanji512/bai4/mother.jpg	11	4	2026-06-24 06:26:09.483	2026-06-24 06:26:09.483
60	年	NIÊN	ねん, ね, とし	\N	năm, niên đại	米（こめ）の収穫（しゅうかく）までに一年（いちねん）かかります	Mất một năm để thu hoạch lúa.	https://www.vnjpclub.com/images/kanji512/bai4/year.jpg	12	4	2026-06-24 06:26:09.498	2026-06-24 06:26:09.498
61	去	KHỨ	きょ, こ	さ-る	quá khứ, trừ khử	過去（かこ）に生（い）きていた私（わたし）、今（いま）は土（つち）の中（なか）です	Tôi là người đã sống trong quá khứ, bây giờ tôi ở trong lòng đất.	https://www.vnjpclub.com/images/kanji512/bai4/past_toleave.jpg	13	4	2026-06-24 06:26:09.517	2026-06-24 06:26:09.517
62	毎	MỖI	まい, ごと	\N	mỗi	誰（だれ）にも母（はは）親（おや）がいます	Ai cũng đều có mẹ.	https://www.vnjpclub.com/images/kanji512/bai4/every.jpg	14	4	2026-06-24 06:26:09.521	2026-06-24 06:26:09.521
63	王	VƯƠNG	うう	\N	vương giả	王様（おうさま）が立（た）っています	Đức Vua đang đứng.	https://www.vnjpclub.com/images/kanji512/bai4/king.jpg	15	4	2026-06-24 06:26:09.537	2026-06-24 06:26:09.537
64	国	QUỐC	こく, くに	\N	nước, quốc gia, quốc ca	宝石（ほうせき）を持（も）った王（おう）が国（くに）を支配（しはい）します	Nhà vua nắm giữ ngọc bảo trị vì đất nước.	https://www.vnjpclub.com/images/kanji512/bai4/country.jpg	16	4	2026-06-24 06:26:09.551	2026-06-24 06:26:09.551
65	見	KIẾN	けん	み-る	ý kiến	いろいろな物（もの）を見（み）るには目（め）と足（あし）が必要（ひつよう）です	Để nhìn thấy được nhiều sự vật thì cần có con mắt và đôi chân.	https://www.vnjpclub.com/images/kanji512/bai5/see.jpg	1	5	2026-06-24 06:26:09.568	2026-06-24 06:26:09.568
66	行	HÀNH, HÀNG	こう, ぎょう, あん	い-く、ゆ-く、おこな-う	thực hành, lữ hành; ngân hàng	この角（かど）でどこに行（い）くか決（き）めてください	Tại góc đường này bạn hãy quyết định là sẽ đi đâu.	https://www.vnjpclub.com/images/kanji512/bai5/to_go.jpg	2	5	2026-06-24 06:26:09.576	2026-06-24 06:26:09.576
67	米	MỄ	べい, まい, こめ	\N	gạo	稲（いね）の形（かたち）です	Hình dạng của cây lúa.	https://www.vnjpclub.com/images/kanji512/bai5/rice.jpg	3	5	2026-06-24 06:26:09.588	2026-06-24 06:26:09.588
68	来	LAI	らい	く-る、きた-る	đến, tương lai, vị lai	十月（じゅうがつ）が来（く）ると米（こめ）が収穫（しゅうかく）できます	Đến tháng 10 thì có thể thu hoạch lúa.	https://www.vnjpclub.com/images/kanji512/bai5/come.jpg	4	5	2026-06-24 06:26:09.603	2026-06-24 06:26:09.603
69	良	LƯƠNG	りょう	よ-い	tốt, lương tâm, lương tri	誰（だれ）でもおなかがいっぱいの時（とき）は気分（きぶん）がいいです	Bất kỳ ai cũng có tinh thần tốt khi no bụng.	https://www.vnjpclub.com/images/kanji512/bai5/good_well.jpg	5	5	2026-06-24 06:26:09.611	2026-06-24 06:26:09.611
70	食	THỰC	しょく, じき	た-べる、く-う	ẩm thực, thực đường	家（いえ）でするいいこと、それは食（た）べることです	Điều làm tôi cảm thấy thoải mái là việc ăn ở nhà.	https://www.vnjpclub.com/images/kanji512/bai5/eat.jpg	6	5	2026-06-24 06:26:09.618	2026-06-24 06:26:09.618
71	飲	ẨM	いん	の-む	ẩm thực	大（おお）きな口（くち）を開（あ）けて、食（た）べたり飲（の）んだりします	Mở to miệng để ăn và uống.	https://www.vnjpclub.com/images/kanji512/bai5/drink.jpg	7	5	2026-06-24 06:26:09.63	2026-06-24 06:26:09.63
72	会	HỘI	かい, え	あ-う	hội họp, đại hội	あなたと私（わたし）、二人（ふたり）が家（いえ）の中（なか）で会（あ）います	2（二） chúng ta sẽ gặp trong một ngôi nhà.	https://www.vnjpclub.com/images/kanji512/bai5/to_meet.jpg	8	5	2026-06-24 06:26:09.642	2026-06-24 06:26:09.642
73	耳	NHĨ	じ, みみ	\N	tai	耳（みみ）の形（かたち）です	Hình dạng của cái tai.	https://www.vnjpclub.com/images/kanji512/bai5/ear.jpg	9	5	2026-06-24 06:26:09.656	2026-06-24 06:26:09.656
74	聞	VĂN	ぶん, もん	き-く	nghe, tân văn (báo)	門（もん）の所（ところ）で耳（みみ）をそばだてて聞（き）いています	Ai đó đang ghé tai vào cổng để nghe ngóng.	https://www.vnjpclub.com/images/kanji512/bai5/listen.jpg	10	5	2026-06-24 06:26:09.664	2026-06-24 06:26:09.664
75	言	NGÔN	げん, ごん	い-う、こと	ngôn ngữ, ngôn luận, phát ngôn	口（くち）を使（つか）って何（なに）か言（い）います	Nói điều gì đó bằng miệng.	https://www.vnjpclub.com/images/kanji512/bai5/say.jpg	11	5	2026-06-24 06:26:09.669	2026-06-24 06:26:09.669
76	話	THOẠI	わ	はなし、はな-す	nói chuyện, đối thoại, giai thoại	何千（なんぜん）もの単語（たんご）を使（つか）って話（はな）します	Mọi người sử dụng hàng ngàn từ vựng để nói chuyện.	https://www.vnjpclub.com/images/kanji512/bai5/speak.jpg	12	5	2026-06-24 06:26:09.682	2026-06-24 06:26:09.682
77	立	LẬP	りつ, りゅう	た-つ	thiết lập, tự lập	人（ひと）が立（た）っている姿（すがた）です	Hình dáng của một người đang đứng.	https://www.vnjpclub.com/images/kanji512/bai5/stand.jpg	13	5	2026-06-24 06:26:09.694	2026-06-24 06:26:09.694
78	待	ĐÃI	たい	ま-つ	đợi, đối đãi	お寺（てら）の前（まえ）の道（みち）で待（ま）っています	Tôi đợi bạn trên con đường ở trước chùa.	https://www.vnjpclub.com/images/kanji512/bai5/wait.jpg	14	5	2026-06-24 06:26:09.703	2026-06-24 06:26:09.703
79	周	CHU	しゅう	まわ-り	chu vi, chu biên	食（た）べたものは土（つち）に返（かえ）ります。すべてのものは循環（じゅんかん）します	Những thứ mình đã ăn sẽ trở về với đất. Mọi vật đều tuần hoàn.	https://www.vnjpclub.com/images/kanji512/bai5/go_around.jpg	15	5	2026-06-24 06:26:09.708	2026-06-24 06:26:09.708
80	週	CHU	しゅう	\N	tuần	この道（みち）を一周（いっしゅう）するのに一週間（いっしゅうかん）かかります	Mất 1 tuần để đi vòng quanh con đường này.	https://www.vnjpclub.com/images/kanji512/bai5/week.jpg	16	5	2026-06-24 06:26:09.717	2026-06-24 06:26:09.717
81	大	ĐẠI	だい, たい	おお-きい	to lớn, đại dương, đại lục	手足（てあし）を広（ひろ）げると、大（おお）きく見（み）えます	Khi bạn dang rộng chân tay trông bạn rất lớn.	https://www.vnjpclub.com/images/kanji512/bai6/big.jpg	1	6	2026-06-24 06:26:09.737	2026-06-24 06:26:09.737
82	小	TIỂU	しょう	ちい-さい	nhỏ, ít	手足（てあし）を曲（ま）げれば、小（ちい）さく見（み）えます	Khi bạn co chân tay lại trông bạn nhỏ hơn.	https://www.vnjpclub.com/images/kanji512/bai6/small.jpg	2	6	2026-06-24 06:26:09.761	2026-06-24 06:26:09.761
83	高	CAO	こう	たか、たか-い	cao đẳng, cao thượng	建物（たてもの）の上（うえ）に高（たか）い塔（とう）が立（た）っています	Có một cái tháp cao ở trên toà nhà.	https://www.vnjpclub.com/images/kanji512/bai6/high.jpg	3	6	2026-06-24 06:26:09.792	2026-06-24 06:26:09.792
84	安	AN	あん	やす-い	an bình, an ổn	おんなの人（ひと）は家（いえ）の中（なか）で安心（あんしん）しています	Phụ nữ cảm thấy an tâm hơn khi ở trong nhà.	https://www.vnjpclub.com/images/kanji512/bai6/cheap_ease.jpg	4	6	2026-06-24 06:26:09.822	2026-06-24 06:26:09.822
85	新	TÂN	しん	あたら-しい、あら-た、にい	mới, cách tân, tân thời	新（あたら）しいことを始（はじ）めるには、立（た）って、おので道（みち）を開（ひら）きます	Để bắt đầu điều mới, ta đứng lên, đốn cây mở đường bằng rìu.	https://www.vnjpclub.com/images/kanji512/bai6/new.jpg	5	6	2026-06-24 06:26:09.832	2026-06-24 06:26:09.832
86	古	CỔ	こ	ふる-い	cũ, cổ điển, đồ cổ	同（おな）じ話（はなし）を十回（じゅうかい）聞（き）くと、その話（はなし）は古（ふる）くなります	Khi ta nghe cùng một câu chuyện 10 （十）lần thì câu chuyện đó sẽ trở nên cũ đi.	https://www.vnjpclub.com/images/kanji512/bai6/old.jpg	6	6	2026-06-24 06:26:09.839	2026-06-24 06:26:09.839
87	元	NGUYÊN	げん, がん, もと	\N	gốc	二人（ふたり）で走（はし）れば、もっと元気（げんき）になります	Nếu 2 người chạy cùng nhau thì họ sẽ trở nên khoẻ mạnh hơn.	https://www.vnjpclub.com/images/kanji512/bai6/origin.jpg	7	6	2026-06-24 06:26:09.85	2026-06-24 06:26:09.85
88	気	KHÍ	き, け	\N	không khí, khí chất, khí khái, khí phách	息（いき）を強（つよ）く吐（は）きすぎると、「気（き）」が出（で）てくるかもしれません	Nếu bạn thở ra quá mạnh thì không chừng tinh thần bạn sẽ xuất hiện.	https://www.vnjpclub.com/images/kanji512/bai6/spirit.jpg	8	6	2026-06-24 06:26:09.863	2026-06-24 06:26:09.863
89	多	ĐA	た	おお-い	đa số	「タ」がたくさんあります	Có nhiều chữ「タ」	https://www.vnjpclub.com/images/kanji512/bai6/many_much.jpg	9	6	2026-06-24 06:26:09.874	2026-06-24 06:26:09.874
90	少	THIẾU, THIỂU	しょう	すく-ない、すこ-し	thiếu niên; thiểu số	小（ちい）さいものを分（わ）けると、少（すこ）ししかもらえます	Khi bạn phân chia một vật nhỏ, bạn chỉ có thể nhận được một ít.	https://www.vnjpclub.com/images/kanji512/bai6/little.jpg	10	6	2026-06-24 06:26:09.885	2026-06-24 06:26:09.885
91	広	QUẢNG	こう	ひろ-い］ →廣［廣	quảng trường, quảng đại	私（わたし）の家（うち）です。広（ひろ）いでしょう	”Đây là nhà của tôi. Nó rộng phải không?”	https://www.vnjpclub.com/images/kanji512/bai6/spacious.jpg	11	6	2026-06-24 06:26:09.894	2026-06-24 06:26:09.894
92	早	TẢO	そう, さ	はや-い	sớm, tảo hôn	日曜日（にちようび）に十時（じゅうじ）に起（お）きるのは早（はや）すぎます	Việc dậy lúc 10 giờ vào ngày chủ nhật là quá sớm.	https://www.vnjpclub.com/images/kanji512/bai6/early.jpg	12	6	2026-06-24 06:26:09.903	2026-06-24 06:26:09.903
93	長	TRƯỜNG, TRƯỞNG	ちょう	なが-い	trường giang, sở trường; hiệu trưởng	髪（かみ）が長（なが）い人（ひと）の姿（すがた）です	Hình dáng của một người có mái tóc dài.	https://www.vnjpclub.com/images/kanji512/bai6/long.jpg	13	6	2026-06-24 06:26:09.909	2026-06-24 06:26:09.909
94	明	MINH	めい, みょう	あか-るい、あき-らか	quang minh, minh tinh	「日（ひ）」と「月（つき）」を合（あ）わせれば、明（あか）るくなります	Nếu kết hợp mặt trời 「日」và mặt trăng 「月」lại với nhau trời sẽ trở nên sáng hơn.	https://www.vnjpclub.com/images/kanji512/bai6/bright.jpg	14	6	2026-06-24 06:26:09.925	2026-06-24 06:26:09.925
95	好	HẢO, HIẾU	こう	この-む、す-く	hữu hảo; hiếu sắc	その女（おんな）の人（ひと）は子（こ）どもが好（す）きです	Người nữ ấy thích trẻ con.	https://www.vnjpclub.com/images/kanji512/bai6/like.jpg	15	6	2026-06-24 06:26:09.938	2026-06-24 06:26:09.938
96	友	HỮU	ゆう, とも	\N	bạn hữu, hữu hảo	友達（ともだち）は互（たが）いに手（て）助（だす）けします	Bạn bè đưa tay giúp đỡ lẫn nhau.	https://www.vnjpclub.com/images/kanji512/bai6/friend.jpg	16	6	2026-06-24 06:26:09.943	2026-06-24 06:26:09.943
97	入	NHẬP	にゅう	い-れる、はい-る	nhập cảnh, nhập môn, nhập viện	人（ひと）がテントの中（なか）に入（はい）ろうとしています	Một người đang chui vào lều.	https://www.vnjpclub.com/images/kanji512/bai7/enter.jpg	1	7	2026-06-24 06:26:09.957	2026-06-24 06:26:09.957
98	出	XUẤT	しゅつ, すい	で-る、いずる	xuất hiện, xuất phát	出口（でぐち）はこちらです	Lối ra ở hướng này.	https://www.vnjpclub.com/images/kanji512/bai7/exit.jpg	2	7	2026-06-24 06:26:09.966	2026-06-24 06:26:09.966
99	市	THỊ	し, いち	\N	thành thị, thị trường	人々（ひとびと）が市場（いちば）に買（か）い物（もの）に行（い）きます	Mọi người đi đến chợ để mua sắm.	https://www.vnjpclub.com/images/kanji512/bai7/city_market.jpg	3	7	2026-06-24 06:26:09.973	2026-06-24 06:26:09.973
100	町	ĐINH	ちょう, まち	\N	khu phố	町（まち）には田（た）んぼと道（みち）がありました	Đã từng có những ruộng lúa và những con đường trong thị trấn.	https://www.vnjpclub.com/images/kanji512/bai7/town.jpg	4	7	2026-06-24 06:26:10.015	2026-06-24 06:26:10.015
101	村	THÔN	そん, むら	\N	thôn xã, thôn làng	木（き）の向（む）こうに村（むら）があります	Có một ngôi làng ở phía bên kia của cái cây.	https://www.vnjpclub.com/images/kanji512/bai7/village.jpg	5	7	2026-06-24 06:26:10.05	2026-06-24 06:26:10.05
102	雨	VŨ	う	あめ, あま-, -さめ	mưa	雲（くも）と雨粒（あまつぶ）から、この漢字（かんじ）ができます	Chữ Hán này được ghép thành từ đám mây và những giọt mưa.	https://www.vnjpclub.com/images/kanji512/bai7/rain.jpg	6	7	2026-06-24 06:26:10.075	2026-06-24 06:26:10.075
103	電	ĐIỆN	でん	\N	phát điện, điện lực	雨（あめ）の中（なか）、田（た）んぼに稲妻（いなづま）が光（ひか）っています	Trong cơn mưa những tia chớp loé sáng trên đồng ruộng.	https://www.vnjpclub.com/images/kanji512/bai7/electricity_lightning.jpg	7	7	2026-06-24 06:26:10.091	2026-06-24 06:26:10.091
104	車	XA	しゃ, くるま	\N	xe cộ, xa lộ	車（くるま）の形（かたち）です	Hình dạng của một chiếc xe.	https://www.vnjpclub.com/images/kanji512/bai7/car.jpg	8	7	2026-06-24 06:26:10.106	2026-06-24 06:26:10.106
105	馬	MÃ	ば, うま, ま	\N	ngựa	馬（うま）の形（かたち）です	Hình dáng của một con ngựa.	https://www.vnjpclub.com/images/kanji512/bai7/horse.jpg	9	7	2026-06-24 06:26:10.119	2026-06-24 06:26:10.119
106	駅	DỊCH	えき	\N	ga	駅（えき）には、馬（うま）や荷物（にもつ）を持（も）った人（ひと）がいます	Ở nhà ga có nào là ngựa, nào là người đang mang hành lý.	https://www.vnjpclub.com/images/kanji512/bai7/station.jpg	10	7	2026-06-24 06:26:10.133	2026-06-24 06:26:10.133
107	社	XÃ	しゃ, やしろ	\N	xã hội, công xã, hợp tác xã	神社（じんじゃ）で人（ひと）はお供（そな）えをして、豊作（ほうさく）を祈（いの）ります	Tại đền thờ thần xã mọi người cúng bái và cầu nguyện cho mùa màng bội thu.	https://www.vnjpclub.com/images/kanji512/bai7/company_shrine.jpg	11	7	2026-06-24 06:26:10.14	2026-06-24 06:26:10.14
108	校	HIỆU	こう	\N	trường học	父（ちち）が私（わたし）を学校（がっこう）に迎（むか）えに来（き）ました	Ba tôi đến trường để đón tôi.	https://www.vnjpclub.com/images/kanji512/bai7/school.jpg	12	7	2026-06-24 06:26:10.158	2026-06-24 06:26:10.158
109	店	ĐIẾM	てん, みせ	\N	cửa hàng, tửu điếm	店先（みせさき）の台（だい）に、トマトが積（つ）んであります	Cà chua được chất trên gian hàng trước cửa tiệm.	https://www.vnjpclub.com/images/kanji512/bai7/shop.jpg	13	7	2026-06-24 06:26:10.174	2026-06-24 06:26:10.174
110	銀	NGÂN	ぎん, しろがね	\N	ngân hàng, ngân lượng, kim ngân	銀（ぎん）は金（きん）ほどよくありません	Bạc thì không tốt bằng vàng.	https://www.vnjpclub.com/images/kanji512/bai7/silver.jpg	14	7	2026-06-24 06:26:10.19	2026-06-24 06:26:10.19
111	病	BỆNH	びょう, へい, やまい	\N	bệnh nhân, bệnh viện, bệnh tật	病院（びょういん）で病気（びょうき）の人（ひと）が寝（ね）ています	Người bệnh đang ngủ ở bệnh viện.	https://www.vnjpclub.com/images/kanji512/bai7/sick.jpg	15	7	2026-06-24 06:26:10.203	2026-06-24 06:26:10.203
112	院	VIỆN	いん	\N	học viện, y viện	元気（げんき）になって病院（びょういん）を出（で）て家（いえ）に帰（かえ）りました	Đã khoẻ （元気）lại và ra viện về nhà.	https://www.vnjpclub.com/images/kanji512/bai7/institution.jpg	16	7	2026-06-24 06:26:10.219	2026-06-24 06:26:10.219
113	休	HƯU	きゅう	やす-む	hưu trí, hưu nhàn	人（ひと）が木（き）のところで休（やす）んでいます	Một người đang nghỉ ngơi bên cái cây.	https://www.vnjpclub.com/images/kanji512/bai8/rest.jpg	1	8	2026-06-24 06:26:10.234	2026-06-24 06:26:10.234
114	走	TẨU	そう	はし-る	chạy	土（つち）にまみれても走（はし）ります	Tôi vẫn chạy dù đất phủ trên người.	https://www.vnjpclub.com/images/kanji512/bai8/run.jpg	2	8	2026-06-24 06:26:10.242	2026-06-24 06:26:10.242
115	起	KHỞI	き	お-きる	khởi động, khởi sự, khởi nghĩa	遅（おそ）く起（お）きたので、走（はし）っていきます	Tôi sẽ chạy bởi vì tôi thức dậy muộn.	https://www.vnjpclub.com/images/kanji512/bai8/get_up.jpg	3	8	2026-06-24 06:26:10.257	2026-06-24 06:26:10.257
116	貝	BỐI	かい	-	vỏ sò	貝（かい）の形（かたち）です	Hình dạng của của con sò.	https://www.vnjpclub.com/images/kanji512/bai8/shellfish.jpg	4	8	2026-06-24 06:26:10.265	2026-06-24 06:26:10.265
117	買	MÃI	ばい	か-う	mua, khuyến mãi	昔（むかし）、貝（かい）を使（つか）ってものを買（か）いましたが、今（いま）は紙幣（しへい）を使（つか）っています	Ngày xưa người ta sử dụng vỏ sò để mua hàng hoá còn bây giờ ta đang sử dụng tiền giấy.	https://www.vnjpclub.com/images/kanji512/bai8/buy.jpg	5	8	2026-06-24 06:26:10.275	2026-06-24 06:26:10.275
118	売	MẠI	ばい	う-る	thương mại	人（ひと）が何（なに）か売（う）っています	Một người đang bán cái gì đó.	https://www.vnjpclub.com/images/kanji512/bai8/sell.jpg	6	8	2026-06-24 06:26:10.286	2026-06-24 06:26:10.286
119	読	ĐỘC	どく, とく, とう	よ-む	độc giả, độc thư	「このベストセラーの本（ほん）を読（よ）んでください」と彼（かれ）は言（い）いました	Anh ấy đã nói rằng ”Hãy đọc quyển sách bán chạy nhất này.”	https://www.vnjpclub.com/images/kanji512/bai8/read.jpg	7	8	2026-06-24 06:26:10.296	2026-06-24 06:26:10.296
120	書	THƯ	しょ	かき,か-く, -が-き, -がき	thư đạo, thư tịch, thư kí	筆（ふで）をもって、「日（ひ）」をかきます	Cầm bút lông viết chữ Nhật 「日」.	https://www.vnjpclub.com/images/kanji512/bai8/write.jpg	8	8	2026-06-24 06:26:10.31	2026-06-24 06:26:10.31
121	帰	QUY	き	かえ-る	hồi quy	つばめが巣（す）に帰（かえ）ります	Chim én quay về tổ.	https://www.vnjpclub.com/images/kanji512/bai8/return.jpg	9	8	2026-06-24 06:26:10.326	2026-06-24 06:26:10.326
122	勉	MIỄN	べん	つと-める	miễn cưỡng, chăm chỉ	男（おとこ）の人（ひと）が、力（ちから）いっぱい頑張（がんば）っています	Người đàn ông đang hết sức cố gắng.	https://www.vnjpclub.com/images/kanji512/bai8/make_effort.jpg	10	8	2026-06-24 06:26:10.338	2026-06-24 06:26:10.338
123	弓	CUNG	きゅう, ゆみ	\N	cái cung	弓（ゆみ）の形（かたち）です	Hình dạng của một cây cung.	https://www.vnjpclub.com/images/kanji512/bai8/bow.jpg	11	8	2026-06-24 06:26:10.342	2026-06-24 06:26:10.342
124	虫	TRÙNG	ちゅう, むし	\N	côn trùng	虫（むし）の形（かたち）です	Hình dạng của côn trùng.	https://www.vnjpclub.com/images/kanji512/bai8/insect.jpg	12	8	2026-06-24 06:26:10.354	2026-06-24 06:26:10.354
125	強	CƯỜNG, CƯỠNG	きょう, ごう	つよ-い、こわ-い、し-いて	cường quốc; miễn cưỡng	かぶと虫（むし）も弓（ゆみ）も強（つよ）いです	Cả bọ cánh cứng lẫn cây cung đều mạnh.	https://www.vnjpclub.com/images/kanji512/bai8/strong.jpg	13	8	2026-06-24 06:26:10.369	2026-06-24 06:26:10.369
126	持	TRÌ	じ	も-つ	cầm, duy trì	数珠（じゅず）をもってお寺（てら）に行（い）きます	Cầm tràng hạt đi đến chùa.	https://www.vnjpclub.com/images/kanji512/bai8/hold.jpg	14	8	2026-06-24 06:26:10.376	2026-06-24 06:26:10.376
127	名	DANH	めい, みょう, な	\N	danh tính, địa danh	名前（なまえ）はタロです	Tên của nó là Taro 「タロ」.	https://www.vnjpclub.com/images/kanji512/bai8/name.jpg	15	8	2026-06-24 06:26:10.384	2026-06-24 06:26:10.384
128	語	NGỮ	ご	かた-る	ngôn ngữ, từ ngữ	彼（かれ）らは五（いつ）つの言葉（ことば）で話（はな）します	Họ nói （言）bằng năm （五）ngôn ngữ.	https://www.vnjpclub.com/images/kanji512/bai8/word_language.jpg	16	8	2026-06-24 06:26:10.399	2026-06-24 06:26:10.399
129	春	XUÂN	しゅん, はる	\N	mùa xuân, thanh xuân	春（はる）は来（き）ました。三人（さんにん）の人（ひと）がお日様（ひさま）を見（み）ています	Mùa xuân đến rồi. Ba người đang người ngắm mặt trời.	https://www.vnjpclub.com/images/kanji512/bai9/spring.jpg	1	9	2026-06-24 06:26:10.434	2026-06-24 06:26:10.434
130	夏	HẠ	か, げ, なつ	\N	mùa hè	夏（なつ）は暑（あつ）いので、人（ひと）が日陰（ひかげ）でぐったりしています	Vì mùa hè quá nóng, nên con người mệt lử dưới bóng râm.	https://www.vnjpclub.com/images/kanji512/bai9/summer.jpg	2	9	2026-06-24 06:26:10.456	2026-06-24 06:26:10.456
131	秋	THU	しゅう, あき, とき	\N	mùa thu	秋（あき）になると、稲（いね）が実（みの）り、葉（は）は日（ひ）の色（いろ）になります	Thu đến, lúa đơm bông, lá cây chuyển sang màu của lửa.	https://www.vnjpclub.com/images/kanji512/bai9/autumn.jpg	3	9	2026-06-24 06:26:10.482	2026-06-24 06:26:10.482
132	冬	ĐÔNG	とう, ふゆ	\N	mùa đông	冬（ふゆ）は氷（こおり）の上（うえ）を歩（ある）くと滑（すべ）ります	Sẽ rất trơn trượt khi đi trên băng vào mùa đông.	https://www.vnjpclub.com/images/kanji512/bai9/winter.jpg	4	9	2026-06-24 06:26:10.503	2026-06-24 06:26:10.503
133	朝	TRIỀU	ちょう, あさ	\N	buổi sáng, triều đình	十月（じゅうがつ）十日（とおか）の朝（あさ）です	Buổi sáng ngày 10 tháng 10.	https://www.vnjpclub.com/images/kanji512/bai9/morning.jpg	5	9	2026-06-24 06:26:10.515	2026-06-24 06:26:10.515
134	昼	TRÚ	ちゅう, ひる	\N	buổi trưa	昼（ひる）、日（ひ）が高（たか）くなると、日（ひ）よけをつるします	Khi mặt trời lên cao vào buổi trưa chúng ta sẽ treo những tấm bạt che nắng lên.	https://www.vnjpclub.com/images/kanji512/bai9/daytime.jpg	6	9	2026-06-24 06:26:10.525	2026-06-24 06:26:10.525
135	夕	TỊCH	せき, ゆう, ゆうべ	\N	tịch dương	夕方（ゆうがた）、月（つき）と鳥（とり）が見（み）えます	Vào xế chiều bạn sẽ thấy mặt trăng và chim chóc.	https://www.vnjpclub.com/images/kanji512/bai9/early_evening.jpg	7	9	2026-06-24 06:26:10.536	2026-06-24 06:26:10.536
136	方	PHƯƠNG	ほう, かた	\N	phương hướng, phương pháp	旗（はた）のある方（ほう）へ行（い）ってください	Vui lòng đi theo hướng của lá cờ.	https://www.vnjpclub.com/images/kanji512/bai9/direction_person.jpg	8	9	2026-06-24 06:26:10.552	2026-06-24 06:26:10.552
137	晩	VÃN	ばん	\N	buổi tối	晩（ばん）にならないうちに、急（いそ）いで家（いえ）に帰（かえ）ります	Hối hả về nhà trong lúc trời chưa tối.	https://www.vnjpclub.com/images/kanji512/bai9/evening.jpg	9	9	2026-06-24 06:26:10.574	2026-06-24 06:26:10.574
138	夜	DẠ	や, よ, よる	\N	ban đêm, dạ cảnh, dạ quang	夜（よる）、帽子（ぼうし）をかぶった人（ひと）が月（つき）と雲（くも）を見（み）ています	Buổi tối, một người đội mũ ngắm trăng và mây.	https://www.vnjpclub.com/images/kanji512/bai9/night.jpg	10	9	2026-06-24 06:26:10.592	2026-06-24 06:26:10.592
139	心	TÂM	しん, こころ	\N	tâm lí, nội tâm	心臓（しんぞう）が動（うご）いています	Trái tim đang đập.	https://www.vnjpclub.com/images/kanji512/bai9/heart.jpg	11	9	2026-06-24 06:26:10.61	2026-06-24 06:26:10.61
140	手	THỦ	しゅ	て, て-, -て, た-	tay, thủ đoạn	手（て）の形（かたち）です	Hình dạng của bàn tay.	https://www.vnjpclub.com/images/kanji512/bai9/hand.jpg	12	9	2026-06-24 06:26:10.622	2026-06-24 06:26:10.622
141	足	TÚC	そく	あし、た-りる	chân, bổ túc, sung túc	足（あし）を伸（の）ばして走（はし）りましょう	Chúng ta hãy duỗi chân chạy nào!	https://www.vnjpclub.com/images/kanji512/bai9/foot_leg.jpg	13	9	2026-06-24 06:26:10.635	2026-06-24 06:26:10.635
142	体	THỂ	たい, てい, からだ］ 身体(しんたい, からだ)→體［豊	\N	hình thể, thân thể, thể thao	体（からだ）にけがをしたら、包帯（ほうたい）を巻（ま）いて休（やす）みましょう	Khi cơ thể bị thương thì chúng ta băng bó lại rồi nghỉ ngơi （休）.	https://www.vnjpclub.com/images/kanji512/bai9/body.jpg	14	9	2026-06-24 06:26:10.653	2026-06-24 06:26:10.653
143	首	THỦ	しゅ, くび	\N	đầu, cổ, thủ tướng	首（くび）の長（なが）い人（ひと）の形（かたち）です	Hình dáng của người cổ dài.	https://www.vnjpclub.com/images/kanji512/bai9/neck_head.jpg	15	9	2026-06-24 06:26:10.685	2026-06-24 06:26:10.685
144	道	ĐẠO	どう, とう, みち	\N	đạo lộ, đạo đức, đạo lí	道（みち）で首（くび）を長（なが）くしてだれか待（ま）っています	Đang dài cổ đợi ai đó trên đường.	https://www.vnjpclub.com/images/kanji512/bai9/road.jpg	16	9	2026-06-24 06:26:10.725	2026-06-24 06:26:10.725
145	山	SƠN	さん, やま	\N	núi, sơn hà	山（やま）の形（かたち）です	Hình dáng của ngọn núi.	https://www.vnjpclub.com/images/kanji512/bai10/mountain.jpg	1	10	2026-06-24 06:26:10.755	2026-06-24 06:26:10.755
146	川	XUYÊN	せん, かわ	\N	sông	川（かわ）が流（なが）れていきます	Dòng sông đang chảy.	https://www.vnjpclub.com/images/kanji512/bai10/river.jpg	2	10	2026-06-24 06:26:10.768	2026-06-24 06:26:10.768
147	林	LÂM	りん, はやし	\N	lâm sản, lâm nghiệp	二本（にほん）の木（き）が林（はやし）になります	Hai cây trở thành rừng.	https://www.vnjpclub.com/images/kanji512/bai10/small_forest.jpg	3	10	2026-06-24 06:26:10.776	2026-06-24 06:26:10.776
148	森	SÂM	しん, もり	\N	rừng	三本（さんぼん）の木（き）が森（もり）になります	Ba cây trở thành rừng rậm.	https://www.vnjpclub.com/images/kanji512/bai10/forest.jpg	4	10	2026-06-24 06:26:10.79	2026-06-24 06:26:10.79
149	空	KHÔNG	くう	そら、から、あ-く、うつ-ろ	không khí, hư không, hàng không	窓（まど）を開（あ）けて、空（そら）を定規（じょうぎ）で測（はか）ってください	Hãy mở cửa, đo bầu trời bằng cây thước .	https://www.vnjpclub.com/images/kanji512/bai10/sky.jpg	5	10	2026-06-24 06:26:10.797	2026-06-24 06:26:10.797
150	海	HẢI	かい, うみ	\N	hải cảng, hải phận	毎日（まいにち）、海（うみ）に行（い）って泳（およ）ぎます	Đi biển bơi mỗi ngày.	https://www.vnjpclub.com/images/kanji512/bai10/sea.jpg	6	10	2026-06-24 06:26:10.812	2026-06-24 06:26:10.812
151	化	HÓA	か, け	ば-ける	biến hóa	人（ひと）が立（た）ったり座（すわ）ったりして、姿勢（しせい）を変（か）えます	Một người đứng lên rồi ngồi xuống, thay đổi tư thế của mình.	https://www.vnjpclub.com/images/kanji512/bai10/change.jpg	7	10	2026-06-24 06:26:10.834	2026-06-24 06:26:10.834
152	花	HOA	か, はな	\N	hoa, bông hoa	草（くさ）が変化（へんか）して花（はな）になります	Cỏ biến đổi và trở thành hoa.	https://www.vnjpclub.com/images/kanji512/bai10/flower.jpg	8	10	2026-06-24 06:26:10.855	2026-06-24 06:26:10.855
153	天	THIÊN	てん, あま, あめ	\N	thiên thạch, thiên nhiên, thiên đường	両手（りょうて）を大（おお）きく広（ひろ）げて、天（てん）を見上（みあ）げます	Dang rộng đôi tay ngước nhìn trời.	https://www.vnjpclub.com/images/kanji512/bai10/heaven.jpg	9	10	2026-06-24 06:26:10.879	2026-06-24 06:26:10.879
154	赤	XÍCH	せき, しゃく, あか	\N	đỏ, xích kì, xích đạo, xích thập tự	日（ひ）の上（うえ）に土（つち）を置（お）いて、赤（あか）いレンガを作（つく）ります	Đặt đất lên trên lửa và làm ra viên gạch màu đỏ.	https://www.vnjpclub.com/images/kanji512/bai10/red.jpg	10	10	2026-06-24 06:26:10.897	2026-06-24 06:26:10.897
155	青	THANH	せい, しょう	あお、あお-い	xanh, thanh thiên, thanh niên	青（あお）い草（くさ）と青（あお）い月（つき）	Cỏ xanh và mặt trăng cũng màu xanh.	https://www.vnjpclub.com/images/kanji512/bai10/blue.jpg	11	10	2026-06-24 06:26:10.915	2026-06-24 06:26:10.915
156	白	BẠCH	かく, びゃく	しろ、しら、しろ-い	thanh bạch, bạch sắc	白（しろ）い建物（たてもの）があります	Có 1 toà nhà màu trắng.	https://www.vnjpclub.com/images/kanji512/bai10/white.jpg	12	10	2026-06-24 06:26:10.936	2026-06-24 06:26:10.936
157	黒	HẮC	こく, くろ	\N	đen, hắc ám	田（た）んぼが焼（や）けて、土（つち）が黒（くろ）くなりました	Đồng ruộng khô cháy và mặt đất trở thành màu đen.	https://www.vnjpclub.com/images/kanji512/bai10/black.jpg	13	10	2026-06-24 06:26:10.955	2026-06-24 06:26:10.955
158	色	SẮC	しょく, しき, いろ	\N	màu sắc, sắc dục	二人（ふたり）の色（いろ）の渦巻（うずま）きの形（かたち）です	Hình xoáy của hai màu.	https://www.vnjpclub.com/images/kanji512/bai10/color.jpg	14	10	2026-06-24 06:26:10.973	2026-06-24 06:26:10.973
159	魚	NGƯ	ぎょ, さかな, うお	\N	cá	魚（さかな）の形（かたち）です	Hình dạng của con cá.	https://www.vnjpclub.com/images/kanji512/bai10/fish.jpg	15	10	2026-06-24 06:26:10.993	2026-06-24 06:26:10.993
160	犬	KHUYỂN	けん, いぬ	\N	con chó	犬（いぬ）の形（かたち）です	Hình dáng của con chó.	https://www.vnjpclub.com/images/kanji512/bai10/dog.jpg	16	10	2026-06-24 06:26:11.022	2026-06-24 06:26:11.022
161	料	LIỆU	りょう	\N	nguyên liệu, tài liệu, nhiên liệu	はかりで米（こめ）やそのほかの材料（ざいりょう）を量（はか）ります	Cân gạo và các nguyên liệu khác bằng cái cân.	https://www.vnjpclub.com/images/kanji512/bai11/ingredient.jpg	1	11	2026-06-24 06:26:11.054	2026-06-24 06:26:11.054
162	理	LÍ	り	\N	lý do, lý luận, nguyên lý	王様（おうさま）は論理（ろんり）的（てき）に考（かんが）えて、田（た）んぼを作（つく）りました	Nhà Vua suy nghĩ tính hợp lý và làm ra những thửa ruộng.	https://www.vnjpclub.com/images/kanji512/bai11/logic.jpg	2	11	2026-06-24 06:26:11.086	2026-06-24 06:26:11.086
163	反	PHẢN	はん, ほん, たん	かえ-す、そ-る	phản loạn, phản đối	私（わたし）は反対（はんたい）です	Tôi phản đối.	https://www.vnjpclub.com/images/kanji512/bai11/oppose.jpg	3	11	2026-06-24 06:26:11.112	2026-06-24 06:26:11.112
164	飯	PHẠN	はん, めし	\N	cơm	皆（みな）は私（わたし）がご飯（はん）ばかり食（た）べるのに反対（はんたい）です	Mọi người phản đối với việc tôi ăn quá nhiều cơm.	https://www.vnjpclub.com/images/kanji512/bai11/meal_cookedrice.jpg	4	11	2026-06-24 06:26:11.136	2026-06-24 06:26:11.136
165	牛	NGƯU	ぎゅう, うし	\N	con trâu	津（つ）のが一本（いっぽん）しかない牛（うし）の形（かたち）です	Hình dạnh của con bò chỉ có một sừng.	https://www.vnjpclub.com/images/kanji512/bai11/cow.jpg	5	11	2026-06-24 06:26:11.157	2026-06-24 06:26:11.157
166	豚	ĐỒN	とん, ぶた	\N	con lợn	豚（ぶた）が月（つき）を見（み）ています	Con heo đang nhìn mặt trăng.	https://www.vnjpclub.com/images/kanji512/bai11/pig.jpg	6	11	2026-06-24 06:26:11.18	2026-06-24 06:26:11.18
167	鳥	ĐIỂU	ちょう, とり	\N	chim chóc	鳥（とり）の形（かたち）です	Hình dạng của một con chim.	https://www.vnjpclub.com/images/kanji512/bai11/bird.jpg	7	11	2026-06-24 06:26:11.186	2026-06-24 06:26:11.186
168	肉	NHỤC	にく	\N	thịt	肉（にく）の形（かたち）です	Hình của miếng thịt.	https://www.vnjpclub.com/images/kanji512/bai11/meat.jpg	8	11	2026-06-24 06:26:11.201	2026-06-24 06:26:11.201
169	茶	TRÀ	ちゃ, さ	\N	trà	二人（ふたり）でお茶（ちゃ）を飲（の）んでいます	Hai người đang uống trà.	https://www.vnjpclub.com/images/kanji512/bai11/tea.jpg	9	11	2026-06-24 06:26:11.217	2026-06-24 06:26:11.217
170	予	DỰ	よ	あらかじ-め	dự đoán, dự báo	母親（ははおや）が子（こ）守（まも）りを手配（てはい）しておきます	Người mẹ （マザー）sắp xếp （アレンジ）trước một người trông trẻ.	https://www.vnjpclub.com/images/kanji512/bai11/advance.jpg	10	11	2026-06-24 06:26:11.239	2026-06-24 06:26:11.239
171	野	DÃ	や, の	\N	cánh đồng, hoang dã, thôn dã	野原（のはら）に行（い）って耕（たがや）しておきます	Đi đến cánh đồng và cày ruộng trước.	https://www.vnjpclub.com/images/kanji512/bai11/field.jpg	11	11	2026-06-24 06:26:11.257	2026-06-24 06:26:11.257
172	菜	THÁI	さい, な	\N	rau	草（くさ）や木（き）の中（なか）から野菜（やさい）を摘（つ）み取（と）ります	Hái rau từ trong đám cỏ cây.	https://www.vnjpclub.com/images/kanji512/bai11/vegetable.jpg	12	11	2026-06-24 06:26:11.272	2026-06-24 06:26:11.272
173	切	THIẾT	せつ, さい	き-る	cắt, thiết thực, thân thiết	七人（しちにん）に侍（さむらい）が刀（かたな）で切（き）ります	Bảy võ sĩ đạo cắt bằng kiếm của họ.	https://www.vnjpclub.com/images/kanji512/bai11/cut.jpg	13	11	2026-06-24 06:26:11.29	2026-06-24 06:26:11.29
174	作	TÁC	さく, さ	つく-る	tác phẩm, công tác, canh tác	人（ひと）がのこぎりを持（も）って、何（なに）かを作（つく）ります	Một người cầm cây cưa làm gì đó.	https://www.vnjpclub.com/images/kanji512/bai11/make.jpg	14	11	2026-06-24 06:26:11.304	2026-06-24 06:26:11.304
175	未	VỊ	み	ひつじ、いま-だ	vị thành niên, vị lai	この木（き）はまだ成長（せいちょう）していません	Cái cây này vẫn chưa lớn.	https://www.vnjpclub.com/images/kanji512/bai11/not_yet.jpg	15	11	2026-06-24 06:26:11.322	2026-06-24 06:26:11.322
176	味	VỊ	み	あじ、あじ-わう	vị giác, mùi vị	どんな味（あじ）かわかりません。だってまだ食（た）べていませんから	Tôi không biết nó có vị thế nào bởi vì tôi vẫn chưa ăn nó.	https://www.vnjpclub.com/images/kanji512/bai11/taste.jpg	16	11	2026-06-24 06:26:11.337	2026-06-24 06:26:11.337
177	音	ÂM	おん, いん, おと, ね	\N	âm thanh, phát âm	日（ひ）が昇（のぼ）ると、人々（ひとびと）は立（た）ち上（あ）がって音（おと）をたてます	Khi mặt trời lên, mọi người đứng dậy và phát ra âm thanh.	https://www.vnjpclub.com/images/kanji512/bai12/sound.jpg	1	12	2026-06-24 06:26:11.358	2026-06-24 06:26:11.358
203	妻	THÊ	さい, つま	\N	thê tử	ほうきを持（も）っている女性（じょせい）は私（わたし）の妻（つま）です	Người phụ nữ cầm cây chổi là vợ tôi.	https://www.vnjpclub.com/images/kanji512/bai13/wife.jpg	11	13	2026-06-24 06:26:11.882	2026-06-24 06:26:11.882
178	楽	LẠC, NHẠC	がく, らく	たの-しい	an lạc, lạc thú, âm nhạc	木（き）の上（うえ）の白（しろ）い太鼓（たいこ）をたたいて楽（たの）しもう	Hãy thưởng thức gõ cái trống màu trắng trên cái giá đỡ gỗ!	https://www.vnjpclub.com/images/kanji512/bai12/fun_comfortable.jpg	2	12	2026-06-24 06:26:11.375	2026-06-24 06:26:11.375
179	歌	CA	か	うた、うた-う	ca dao, ca khúc	大（おお）きい口（くち）を開（あ）けてみんなで歌（うた）っています	Tất cả mọi người đang mở to miệng hát.	https://www.vnjpclub.com/images/kanji512/bai12/sing.jpg	3	12	2026-06-24 06:26:11.383	2026-06-24 06:26:11.383
180	自	TỰ	じ, し	みずか-ら、おの-ずから	tự do, tự kỉ, tự thân	日本（にほん）では、鼻（はな）を指（ゆび）さして自分（じぶん）のことを表（あらわ）します	Ở Nhật người ta ám chỉ "bản thân" bằng cách chỉ vào mũi của mình.	https://www.vnjpclub.com/images/kanji512/bai12/self.jpg	4	12	2026-06-24 06:26:11.392	2026-06-24 06:26:11.392
181	転	CHUYỂN	てん	ころ-ぶ	chuyển động	車（くるま）から転（ころ）がり落（お）ちました	Tôi đã bị ngã nhào ra khỏi xe hơi.	https://www.vnjpclub.com/images/kanji512/bai12/roll_over.jpg	5	12	2026-06-24 06:26:11.405	2026-06-24 06:26:11.405
182	乗	THỪA	じょう	の-る	lên xe	木（き）の上（うえ）に立（た）って、枝（えだ）に乗（の）ろうとしています	Một người đang đứng trên cây và định leo lên cành cây.	https://www.vnjpclub.com/images/kanji512/bai12/get%20on.jpg	6	12	2026-06-24 06:26:11.417	2026-06-24 06:26:11.417
183	写	TẢ	しゃ	うつ-す	miêu tả	帽子（ぼうし）をかぶった男性（だんせい）の写真（しゃしん）です	Tấm hình của người đàn ông đội mũ.	https://www.vnjpclub.com/images/kanji512/bai12/photograph.jpg	7	12	2026-06-24 06:26:11.43	2026-06-24 06:26:11.43
184	台	ĐÀI	だい, たい	\N	lâu đài, đài	私（わたし）は台（だい）の上（うえ）にいます	Tôi đang ở trên bục.	https://www.vnjpclub.com/images/kanji512/bai12/stand.jpg	8	12	2026-06-24 06:26:11.448	2026-06-24 06:26:11.448
185	央	ƯƠNG	うう	\N	trung ương	その人（ひと）が主人公（しゅじんこう）です	Người đó là nhân vật chính.	https://www.vnjpclub.com/images/kanji512/bai12/center.jpg	9	12	2026-06-24 06:26:11.473	2026-06-24 06:26:11.473
186	映	ÁNH	えい	うつ-る、は-える］ 光が反射する→暎［英	phản ánh	映画（えいが）の主人公（しゅじんこう）が映（うつ）し出（だ）されました	Vai chính của bộ phim đã được chiếu trên màn ảnh.	https://www.vnjpclub.com/images/kanji512/bai12/project.jpg	10	12	2026-06-24 06:26:11.485	2026-06-24 06:26:11.485
187	画	HỌA, HOẠCH	が, かく	えが-く, かく-する, かぎ-る, はかりごと, はか-る	họa sĩ; kế hoạch	キャンバスに田（た）んぼの絵（え）をかきます	Vẽ bức tranh đồng lúa trên vải vẽ.	https://www.vnjpclub.com/images/kanji512/bai12/picture.jpg	11	12	2026-06-24 06:26:11.493	2026-06-24 06:26:11.493
188	羊	DƯƠNG	よう, ひつじ	\N	con dê, con cừu	羊（ひつじ）の形（かたち）です	Hình dạng của con cừu.	https://www.vnjpclub.com/images/kanji512/bai12/sheep.jpg	12	12	2026-06-24 06:26:11.52	2026-06-24 06:26:11.52
189	洋	DƯƠNG	よう	\N	đại dương, tây dương	羊（ひつじ）は海（うみ）を渡（わた）って日本（にほん）に来（き）ました	Con cừu đã băng qua biển đến Nhật.	https://www.vnjpclub.com/images/kanji512/bai12/oversea.jpg	13	12	2026-06-24 06:26:11.536	2026-06-24 06:26:11.536
190	服	PHỤC	ふく	\N	y phục, cảm phục, phục vụ	月（つき）の下（した）で服（ふく）をかけます	Treo quần áo dưới mặt trăng.	https://www.vnjpclub.com/images/kanji512/bai12/clothes_submit.jpg	14	12	2026-06-24 06:26:11.564	2026-06-24 06:26:11.564
191	着	TRƯỚC	ちゃく, じゃく	き-る, -ぎ, き-せる, -き-せ, つ-く, つ-ける	đến, đáo trước, mặc	セーターを着（き）ている羊（ひつじ）を見（み）ました	Tôi đã thấy con cừu mặc áo len.	https://www.vnjpclub.com/images/kanji512/bai12/wear.jpg	15	12	2026-06-24 06:26:11.589	2026-06-24 06:26:11.589
192	真	CHÂN	しん, ま, まこと	\N	chân lí, chân thực	テレビは本当（ほんとう）のイメージを映（うつ）し出（だ）します。	Tivi phản chiếu hình ảnh thật	\N	16	12	2026-06-24 06:26:11.614	2026-06-24 06:26:11.614
193	家	GIA	か, け, いえ, や	\N	gia đình, chuyên gia	昔（むかし）、家（いえ）で豚（ぶた）を飼（か）いました	Ngày xưa mọi người nuôi heo ở trong nhà.	https://www.vnjpclub.com/images/kanji512/bai13/house.jpg	1	13	2026-06-24 06:26:11.648	2026-06-24 06:26:11.648
194	矢	THỈ	し	\N	mũi tên	矢（や）の形（かたち）です	Hình dạng của mũi tên	https://www.vnjpclub.com/images/kanji512/bai13/arrow.jpg	2	13	2026-06-24 06:26:11.679	2026-06-24 06:26:11.679
195	族	TỘC	ぞく, やから	\N	gia tộc, dân tộc, chủng tộc	旗（はた）の下（した）、矢（や）で家族（かぞく）を守（まも）ります	Dưới lá cờ, mọi người sẽ bảo vệ gia đình họ bằng mũi tên.	https://www.vnjpclub.com/images/kanji512/bai13/family.jpg	3	13	2026-06-24 06:26:11.696	2026-06-24 06:26:11.696
196	親	THÂN	しん	おや、した-しい	thân thuộc, thân thích, thân thiết	木（き）の上（うえ）に立（た）って、子（こ）どもを見守（みまも）っているのが親（おや）です	Ba mẹ đứng trên ngọn cây trông chừng con.	https://www.vnjpclub.com/images/kanji512/bai13/parent.jpg	4	13	2026-06-24 06:26:11.722	2026-06-24 06:26:11.722
197	兄	HUYNH	けい, きょう, あに	\N	phụ huynh	兄（あに）は大口（おおぐち）をたたきます	Anh trai tôi ngoác miệng bốc phét.	https://www.vnjpclub.com/images/kanji512/bai13/older_brother.jpg	5	13	2026-06-24 06:26:11.751	2026-06-24 06:26:11.751
198	姉	TỈ	し, あね	\N	chị gái	姉（あね）は都市（とし）に住（す）んでいます	Chị tôi sống ở thành thị.	https://www.vnjpclub.com/images/kanji512/bai13/older_sister.jpg	6	13	2026-06-24 06:26:11.767	2026-06-24 06:26:11.767
199	弟	ĐỆ	てい, だい, で, おとうと	\N	đệ tử	弟（おとうと）は弓（ゆみ）で遊（あそ）びます	Em trai tôi chơi cung.	https://www.vnjpclub.com/images/kanji512/bai13/younger_brother.jpg	7	13	2026-06-24 06:26:11.782	2026-06-24 06:26:11.782
200	妹	MUỘI	まい, いもうと	\N	em gái	女（おんな）とまだ若（わか）い木（き）、つまり妹（いもうと）のことです	Người nữ và cái cây vẫn còn trẻ, nghĩa là nói về cô em gái.	https://www.vnjpclub.com/images/kanji512/bai13/younger_sister.jpg	8	13	2026-06-24 06:26:11.803	2026-06-24 06:26:11.803
201	私	TƯ	し, わたくし	\N	tư nhân, công tư, tư lợi	これは私（わたし）が作（つく）った稲（いね）です	Đây là cây lúa tôi trồng.	https://www.vnjpclub.com/images/kanji512/bai13/i_private.jpg	9	13	2026-06-24 06:26:11.816	2026-06-24 06:26:11.816
202	夫	PHU	ふ, ふう	おっと、そ-れ	trượng phu, phu phụ	私（わたし）はいつも夫（おっと）と二人（ふたり）でいます	Chồng tôi và tôi, 2 người luôn luôn bên nhau.	https://www.vnjpclub.com/images/kanji512/bai13/husband.jpg	10	13	2026-06-24 06:26:11.853	2026-06-24 06:26:11.853
204	主	CHỦ	しゅ, す	おも-な、ぬし	chủ yếu, chủ nhân	帽子（ぼうし）をかぶった男性（だんせい）が主人（しゅじん）です	Người đàn ông đội nón là chồng tôi.	https://www.vnjpclub.com/images/kanji512/bai13/main.jpg	12	13	2026-06-24 06:26:11.903	2026-06-24 06:26:11.903
205	住	TRÚ, TRỤ	じゅう	す-む	cư trú; trụ sở	主人（しゅじん）はある人（ひと）と住（す）んでいます	Ông chủ sống với một người nào đó.	https://www.vnjpclub.com/images/kanji512/bai13/live.jpg	13	13	2026-06-24 06:26:11.937	2026-06-24 06:26:11.937
206	糸	MỊCH	し, いと	\N	sợ chỉ	糸巻（いとま）きの形（かたち）です	Hình dạng của cuộn chỉ.	https://www.vnjpclub.com/images/kanji512/bai13/thread.jpg	14	13	2026-06-24 06:26:11.957	2026-06-24 06:26:11.957
207	氏	THỊ	し, うじ	\N	họ	名札（なふだ）に名前（なまえ）が書（か）いてあります	Có ghi tên trên bảng tên.	https://www.vnjpclub.com/images/kanji512/bai13/surname.jpg	15	13	2026-06-24 06:26:11.977	2026-06-24 06:26:11.977
208	紙	CHỈ	し, かみ	\N	giấy	髪（かみ）に名前（なまえ）を書（か）いて、糸（いと）で縫（ぬ）い付（つ）けましょう	Viết họ tên lên giấy và luồn sợi chỉ qua.	https://www.vnjpclub.com/images/kanji512/bai13/paper.jpg	16	13	2026-06-24 06:26:12.008	2026-06-24 06:26:12.008
209	教	GIÁO	きょう	おし-える	giáo dục, giáo viên	老人（ろうじん）が子（こ）どもを教（おし）えます	Ông lão dạy đứa trẻ.	https://www.vnjpclub.com/images/kanji512/bai14/teach.jpg	1	14	2026-06-24 06:26:12.042	2026-06-24 06:26:12.042
210	室	THẤT	しつ, むろ	\N	phòng, giáo thất	土曜日（どようび）はいつも室内（しつない）にいます	Thứ bảy nào tôi cũng ở trong phòng của tôi.	https://www.vnjpclub.com/images/kanji512/bai14/room.jpg	2	14	2026-06-24 06:26:12.078	2026-06-24 06:26:12.078
211	羽	VŨ	う, はね	\N	lông vũ	羽（はね）の形（かたち）です	Hình dạng của đôi cánh.	https://www.vnjpclub.com/images/kanji512/bai14/wing.jpg	3	14	2026-06-24 06:26:12.119	2026-06-24 06:26:12.119
212	習	TẬP	しゅう	なら-う	học tập	鳥（とり）は白（しろ）い建物（たてもの）の上（うえ）で羽（はね）を動（うご）かして、飛（と）び方（かた）を習（なら）います	Trên toà nhà màu trắng, những con chim vỗ cánh tập bay.	https://www.vnjpclub.com/images/kanji512/bai14/learn.jpg	4	14	2026-06-24 06:26:12.143	2026-06-24 06:26:12.143
213	漢	HÁN	かん	\N	hảo hán	中国（ちゅうごく）人（じん）の夫（おっと）が草（くさ）を頭（あたま）の上（うえ）に載（の）せて川（かわ）を渡（わた）っています	Ông chồng người Trung Quốc chất cỏ lên đầu rồi băng qua sông.	https://www.vnjpclub.com/images/kanji512/bai14/chinese.jpg	5	14	2026-06-24 06:26:12.159	2026-06-24 06:26:12.159
214	字	TỰ	じ, あざ	\N	chữ, văn tự	子（こ）どもは家（いえ）の中（なか）で字（じ）を習（なら）います	Đứa trẻ học chữ ở trường.	https://www.vnjpclub.com/images/kanji512/bai14/letter_character.jpg	6	14	2026-06-24 06:26:12.17	2026-06-24 06:26:12.17
215	式	THỨC	しき	\N	hình thức, phương thức, công thức	私（わたし）の結婚式（けっこんしき）です	Đây là lễ cưới của tôi.	https://www.vnjpclub.com/images/kanji512/bai14/ceremony_style.jpg	7	14	2026-06-24 06:26:12.186	2026-06-24 06:26:12.186
216	試	THÍ	し	こころ-みる	thí nghiệm, thí điểm	式（しき）で：「この人（ひと）を一生（いっしょう）愛（あい）しますか」 「やってみます」	Tại buổi lễ: ”Con sẽ yêu người này đến hết cuộc đời không?”	https://www.vnjpclub.com/images/kanji512/bai14/try.jpg	8	14	2026-06-24 06:26:12.2	2026-06-24 06:26:12.2
217	験	NGHIỆM	けん, げん	ため-す、しるし、げん	thí nghiệm, hiệu nghiệm, kinh nghiệm	山（やま）に登（のぼ）る前（まえ）に、馬（うま）を調（しら）べます	Ta sẽ kiểm tra con ngựa trước khi leo núi.	https://www.vnjpclub.com/images/kanji512/bai14/examine.jpg	9	14	2026-06-24 06:26:12.213	2026-06-24 06:26:12.213
218	宿	TÚC	しゅく	やど-る、やど	tá túc, kí túc xá	この宿（やど）は百人（ひゃくにん）泊（と）まれます	Nhà trọ này có thể cho 100 khách trọ lại.	https://www.vnjpclub.com/images/kanji512/bai14/inn.jpg	10	14	2026-06-24 06:26:12.226	2026-06-24 06:26:12.226
219	題	ĐỀ	だい	\N	đề tài, đề mục, chủ đề	記者（きしゃ）は頭（あたま）と足（あし）を使（つか）って題材（だいざい）を探（さが）します	Nhà báo sử dụng đầu và chân để tìm kiếm đề tài.	https://www.vnjpclub.com/images/kanji512/bai14/topic.jpg	11	14	2026-06-24 06:26:12.237	2026-06-24 06:26:12.237
220	文	VĂN	ぶん, もん, ふみ, あや	\N	văn chương, văn học	古（ふる）い土器（どき）の模様（もよう）が文字（もじ）になりました	Hoa văn của chiếc bình cổ đã trở thành văn tự.	https://www.vnjpclub.com/images/kanji512/bai14/letter_character1.jpg	12	14	2026-06-24 06:26:12.252	2026-06-24 06:26:12.252
221	英	ANH	えい, はなぶさ	\N	anh hùng, anh tú, anh tuấn	真（ま）ん中（なか）の人（ひと）が英雄（えいゆう）です。草（くさ）の根（ね）運動（うんどう）から生（う）まれました	Người ở chính giữa là anh hùng. Đã được sinh ra từ sự chuyển động của cội rễ cỏ cây.	https://www.vnjpclub.com/images/kanji512/bai14/english_excellent.jpg	13	14	2026-06-24 06:26:12.27	2026-06-24 06:26:12.27
222	質	CHẤT	しつ, しち, ち, たち	\N	vật chất, phẩm chất, khí chất	大（おお）きい貝（かい）を2本（ほん）のおので割（わ）り、その質（しつ）を調（しら）べます	Làm vỡ vỏ sò lớn bằng rìu và kiểm tra chất lượng của nó.	https://www.vnjpclub.com/images/kanji512/bai14/quality.jpg	14	14	2026-06-24 06:26:12.285	2026-06-24 06:26:12.285
223	問	VẤN	もん	と-う	vấn đáp, chất vấn, vấn đề	門（もん）のところで質問（しつもん）します	Tôi đã hỏi bên cánh cổng.	https://www.vnjpclub.com/images/kanji512/bai14/question.jpg	15	14	2026-06-24 06:26:12.302	2026-06-24 06:26:12.302
224	説	THUYẾT	せつ, ぜい	と-く	tiểu thuyết, học thuyết, lí thuyết	お兄（にい）さんが説明（せつめい）しています	Anh trai đang giải thích.	https://www.vnjpclub.com/images/kanji512/bai14/explain.jpg	16	14	2026-06-24 06:26:12.325	2026-06-24 06:26:12.325
225	遠	VIỄN	えん, おん	とお-い	viễn phương, vĩnh viễn	土曜日（どようび）に遠（とお）くまで出（で）かけます	Thứ bảy tôi sẽ đi xa.	https://www.vnjpclub.com/images/kanji512/bai15/far.jpg	1	15	2026-06-24 06:26:12.347	2026-06-24 06:26:12.347
226	近	CẬN	きん	ちか-い	thân cận, cận thị, cận cảnh	おので木（き）を切（き）ると、目的（もくてき）地（ち）が近（ちか）くなります	Hễ mà đốn cây bằng rìu thì nơi đến sẽ trở nên gần hơn.	https://www.vnjpclub.com/images/kanji512/bai15/near.jpg	2	15	2026-06-24 06:26:12.361	2026-06-24 06:26:12.361
227	者	GIẢ	しゃ, もの	\N	học giả, tác giả	誰（だれ）でも、日（ひ）ごとに老（お）いていきます	Ngày qua ngày, ai rồi cũng sẽ già đi.	https://www.vnjpclub.com/images/kanji512/bai15/person.jpg	3	15	2026-06-24 06:26:12.39	2026-06-24 06:26:12.39
228	暑	THỬ	しょ	あつ-い	hè nóng	太陽（たいよう）の下（した）の人（ひと）は暑（あつ）いです	Người đứng dưới mặt trời sẽ thấy nóng.	https://www.vnjpclub.com/images/kanji512/bai15/hot.jpg	4	15	2026-06-24 06:26:12.43	2026-06-24 06:26:12.43
229	寒	HÀN	かん	さ,さむ-い, さん	lạnh	寒（さむ）い日（ひ）に、雪（ゆき）の上（うえ）に足跡（あしあと）を残（のこ）してあなたの家（いえ）まで来（き）ました	Vào những ngày lạnh giá, tôi đến nhà bạn và để lại những dấu chân trên tuyết.	https://www.vnjpclub.com/images/kanji512/bai15/cold.jpg	5	15	2026-06-24 06:26:12.441	2026-06-24 06:26:12.441
230	重	TRỌNG, TRÙNG	じゅう, ちょう	おも-い、かさ-なる	trọng lượng; trùng phùng	1000冊（さつ）の本（ほん）は重（おも）いです	Một ngàn quyển sách （千）sẽ rất nặng.	https://www.vnjpclub.com/images/kanji512/bai15/heavy.jpg	6	15	2026-06-24 06:26:12.463	2026-06-24 06:26:12.463
231	軽	KHINH	けい	かる-い、かろ-やか	khinh suất, khinh khi	軽（かる）い車（くるま）は手（て）で押（お）せば走（はし）ります	Chiếc xe hơi nhẹ sẽ chạy nếu ta đẩy bằng tay.	https://www.vnjpclub.com/images/kanji512/bai15/light.jpg	7	15	2026-06-24 06:26:12.487	2026-06-24 06:26:12.487
232	低	ĐÊ	てい	ひく-い	thấp, đê hèn, đê tiện	「どうして私（わたし）の名前（なまえ）に下線（かせん）を付（つ）けたんですか」「点数（てんすう）が低（ひく）かったからです」	”Vì sao cô gạch dưới tên của em vậy?”	https://www.vnjpclub.com/images/kanji512/bai15/low.jpg	8	15	2026-06-24 06:26:12.5	2026-06-24 06:26:12.5
233	弱	NHƯỢC	じゃく	よわ-い	nhược điểm, nhược tiểu	小鳥（ことり）は弱（よわ）いです	Những con chim non yếu ớt.	https://www.vnjpclub.com/images/kanji512/bai15/weak.jpg	9	15	2026-06-24 06:26:12.525	2026-06-24 06:26:12.525
234	悪	ÁC, Ố	あく, お	わる-い］ 正しくない→惡［亞	hung ác, độc ác; tăng ố	彼（かれ）らはお互（たが）いに悪（わる）い感情（かんじょう）を持（も）っています	Họ có những tình cảm （心）không tốt về nhau.	https://www.vnjpclub.com/images/kanji512/bai15/bad.jpg	10	15	2026-06-24 06:26:12.545	2026-06-24 06:26:12.545
235	暗	ÁM	あん	くら-い	ám sát	中（なか）は暗（くら）く、音（おと）だけ聞（き）こえます	Vì bên trong tối nên chỉ có thể nghe thấy âm thanh mà thôi.	https://www.vnjpclub.com/images/kanji512/bai15/dark.jpg	11	15	2026-06-24 06:26:12.572	2026-06-24 06:26:12.572
236	太	THÁI	たい, た	ふと-い	thái dương, thái bình	太（ふと）い丸太（まるた）です	Khúc gỗ to tròn.	https://www.vnjpclub.com/images/kanji512/bai15/thick.jpg	12	15	2026-06-24 06:26:12.585	2026-06-24 06:26:12.585
237	豆	ĐẬU	とう, ず, まめ	\N	hạt đậu	豆（まめ）を入（い）れる容器（ようき）です	Cái bát đựng đậu.	https://www.vnjpclub.com/images/kanji512/bai15/bean.jpg	13	15	2026-06-24 06:26:12.602	2026-06-24 06:26:12.602
238	短	ĐOẢN	たん	みじか-い	đoản mệnh, sở đoản	矢（や）も豆（まめ）も短（みじか）いです	Cả mũi tên （矢）lẫn hạt đậu （豆）đều ngắn.	https://www.vnjpclub.com/images/kanji512/bai15/short.jpg	14	15	2026-06-24 06:26:12.62	2026-06-24 06:26:12.62
239	光	QUANG	こう	ひかり、ひか-る	ánh sáng, nhật quang, quang minh	太陽（たいよう）の光線（こうせん）の形（かたち）です	Hình dạng của các tia nắng mặt trời.	https://www.vnjpclub.com/images/kanji512/bai15/the_light.jpg	15	15	2026-06-24 06:26:12.637	2026-06-24 06:26:12.637
240	風	PHONG	ふう, ふ, かぜ	\N	phong ba, phong cách, phong tục	虫（むし）が葉（は）っぱで風（かぜ）をよけています	Côn trùng tránh gió bằng lá cây.	https://www.vnjpclub.com/images/kanji512/bai15/wind.jpg	16	15	2026-06-24 06:26:12.657	2026-06-24 06:26:12.657
241	運	VẬN	うん	はこ-ぶ	vận chuyển, vận mệnh	車（くるま）がマットレスを運（はこ）びます	Chiếc xe chở tấm nệm.	https://www.vnjpclub.com/images/kanji512/bai16/transport.jpg	1	16	2026-06-24 06:26:12.697	2026-06-24 06:26:12.697
242	動	ĐỘNG	どう	うご-く	hoạt động, chuyển động	力（ちから）を入（い）れて思（おも）い本（ほん）を動（うご）かします	Dùng sức lực （力） dịch chuyển quyển sách nặng（重）.	https://www.vnjpclub.com/images/kanji512/bai16/move.jpg	2	16	2026-06-24 06:26:12.726	2026-06-24 06:26:12.726
243	止	CHỈ	し	と-まる	đình chỉ	信号（しんごう）は赤（あか）です。止（と）まれ！	Đèn tín hiệu màu đỏ. Hãy dừng lại!	https://www.vnjpclub.com/images/kanji512/bai16/stop.jpg	3	16	2026-06-24 06:26:12.752	2026-06-24 06:26:12.752
244	歩	BỘ	ほ, ぶ, ふ	ある-く、あゆ-み	bộ hành, tiến bộ	巣（す）こち止（と）まって、また歩（ある）きましょう	Dừng lại （止）một chút （少）rồi bước đi tiếp!	https://www.vnjpclub.com/images/kanji512/bai16/walk.jpg	4	16	2026-06-24 06:26:12.761	2026-06-24 06:26:12.761
245	使	SỬ, SỨ	し	つか-う	sử dụng; sứ giả, thiên sứ	人（ひと）を使（つか）います	Dùng người.	https://www.vnjpclub.com/images/kanji512/bai16/use.jpg	5	16	2026-06-24 06:26:12.788	2026-06-24 06:26:12.788
246	送	TỐNG	そう	おく-る	tiễn, tống tiễn, tống đạt	だれかがプレゼントを送（おく）ってくれました	Ai đó đã gửi cho tôi một món quà.	https://www.vnjpclub.com/images/kanji512/bai16/send.jpg	6	16	2026-06-24 06:26:12.813	2026-06-24 06:26:12.813
247	洗	TIỂN	せん	あら-う	rửa	先生（せんせい）が手（て）を洗（あら）いに行（い）きます	Thầy giáo đi （先生）rửa tay.	https://www.vnjpclub.com/images/kanji512/bai16/wash.jpg	7	16	2026-06-24 06:26:12.834	2026-06-24 06:26:12.834
248	急	CẤP	きゅう	いそ-ぐ, いそ-ぎ	khẩn cấp, cấp cứu	急（いそ）げば大丈夫（だいじょうぶ）	”Nếu nhanh lên thì tôi sẽ không sao.”	https://www.vnjpclub.com/images/kanji512/bai16/hurry.jpg	8	16	2026-06-24 06:26:12.847	2026-06-24 06:26:12.847
249	開	KHAI	かい	あ-く、ひら-く	khai mạc, khai giảng	二人（ふたり）の人（ひと）が門（もん）を開（ひら）けます	Hai người mở cổng （門）.	https://www.vnjpclub.com/images/kanji512/bai16/open.jpg	9	16	2026-06-24 06:26:12.873	2026-06-24 06:26:12.873
250	閉	BẾ	へい	し-める、と-ざす	bế mạc, bế quan	人（ひと）が門（もん）を閉（し）めます	Một người sẽ đóng cổng （門）.	https://www.vnjpclub.com/images/kanji512/bai16/close.jpg	10	16	2026-06-24 06:26:12.887	2026-06-24 06:26:12.887
251	押	ÁP	うう	お-す	ấn	標識（ひょうしき）を押（お）してみました	Tôi đã thử đẩy biển báo.	https://www.vnjpclub.com/images/kanji512/bai16/push.jpg	11	16	2026-06-24 06:26:12.892	2026-06-24 06:26:12.892
252	引	DẪN	いん	ひ-く	dẫn hỏa	弓（ゆみ）とつるです。引（ひ）っ張（ぱ）るのは、つるの部分（ぶぶん）です	Cây cung và sợi dây. Phần để kéo chính là sợi dây.	https://www.vnjpclub.com/images/kanji512/bai16/pull.jpg	12	16	2026-06-24 06:26:12.894	2026-06-24 06:26:12.894
253	思	TƯ	し	おも-う	nghĩ, suy tư, tư tưởng, tư duy	田（た）んぼで、心（こころ）から好（す）きな人（ひと）のことを思（おも）います	Bên đồng ruộng  （田）, tôi nghĩ về người yêu trong lòng mình（心）.	https://www.vnjpclub.com/images/kanji512/bai16/think.jpg	13	16	2026-06-24 06:26:12.9	2026-06-24 06:26:12.9
254	知	TRI	ち	し-る	tri thức, tri giác	大（おお）きい口（くち）の人（ひと）は、なんでも知（し）っています	Người có miệng to biết mọi thứ.	https://www.vnjpclub.com/images/kanji512/bai16/know.jpg	14	16	2026-06-24 06:26:12.906	2026-06-24 06:26:12.906
255	考	KHẢO	こう	かんが-える	khảo sát, tư khảo	人（ひと）がなぜ老（お）いるか考（かんが）えます	Tôi suy nghĩ lý do vì sao người ta già đi.	https://www.vnjpclub.com/images/kanji512/bai16/think_ideas.jpg	15	16	2026-06-24 06:26:12.92	2026-06-24 06:26:12.92
256	死	TỬ	し	し-ぬ	tử thi, tự tử	「タヒチに死（し）す」っていう小説（しょうせつ）あったっけ」「ないよ」	Nghe nói có tiểu thuyết [chết ở tahiti] nhỉ? Không có đâu	https://www.vnjpclub.com/images/kanji512/bai16/death.jpg	16	16	2026-06-24 06:26:12.937	2026-06-24 06:26:12.937
257	医	Y	い	\N	y học, y viện	医者（いしゃ）が屋（や）で傷（きず）着（つ）いた患者（かんじゃ）を治（なお）します	Bác sĩ chữa trị cho bệnh nhân bị thương do trúng tên.	https://www.vnjpclub.com/images/kanji512/bai17/doctor_medicine.jpg	1	17	2026-06-24 06:26:12.972	2026-06-24 06:26:12.972
258	始	THỦY	し	はじ-め	ban đầu, khai thủy, nguyên thủy	台（だい）の上（うえ）でスピーチを始（はじ）めると、女（おんな）の人（ひと）が聞（き）きました	Khi tôi bắt đầu bài diễn thuyết trên bục, người phụ nữ đã lắng nghe.	https://www.vnjpclub.com/images/kanji512/bai17/begin.jpg	2	17	2026-06-24 06:26:13.005	2026-06-24 06:26:13.005
259	終	CHUNG	しゅう	お-わる、つい-に	chung kết, chung liễu	私（わたし）たちの関係（かんけい）は糸（いと）のように長（なが）く続（つづ）きましたが、冬（ふゆ）に終（お）わりました	Mối quan hệ của chúng tôi kéo dài như sợi chỉ nhưng đã kết thúc vào mùa đông rồi.	https://www.vnjpclub.com/images/kanji512/bai17/end.jpg	3	17	2026-06-24 06:26:13.018	2026-06-24 06:26:13.018
260	石	THẠCH	せき, しゃく, こく, いし	\N	đá, thạch anh, bảo thạch	崖（がけ）と石（いし）の形（かたち）です	Hình dạng của một vách đá dốc đứng và một hòn đá.	https://www.vnjpclub.com/images/kanji512/bai17/stone.jpg	4	17	2026-06-24 06:26:13.042	2026-06-24 06:26:13.042
261	研	NGHIÊN	けん	と-ぐ	mài, nghiên cứu	台（だい）の上（うえ）に座（すわ）って石（いし）を磨（みが）きます	Tôi ngồi trên cái bục và đánh bóng hòn đá.	https://www.vnjpclub.com/images/kanji512/bai17/polish.jpg	5	17	2026-06-24 06:26:13.067	2026-06-24 06:26:13.067
262	究	CỨU	きゅう	きわ-める	nghiên cứu, cứu cánh	家（いえ）の中（なか）で九年間（きゅうねんかん）研究（けんきゅう）をしています	Tôi đã ở trong nhà nghiên cứu 9（九） năm.	https://www.vnjpclub.com/images/kanji512/bai17/research.jpg	6	17	2026-06-24 06:26:13.092	2026-06-24 06:26:13.092
263	留	LƯU	りゅう, る	と-まる	lưu học, lưu trữ	田（た）んぼにいて、刀（かたな）で稲（いね）を刈（か）ります	Tôi ở trên đồng ruộng và gặt lúa bằng dao.	https://www.vnjpclub.com/images/kanji512/bai17/stay.jpg	7	17	2026-06-24 06:26:13.117	2026-06-24 06:26:13.117
264	有	HỮU	ゆう, う	あ-る	sở hữu, hữu hạn	月（つき）がありますが、触（さわ）ることができません	Mặt trăng （月）hiện hữu nhưng không thể chạm đến nó.	https://www.vnjpclub.com/images/kanji512/bai17/exist.jpg	8	17	2026-06-24 06:26:13.139	2026-06-24 06:26:13.139
265	産	SẢN	さん	うぶ、う-まれる	sản xuất, sinh sản, cộng sản	畑（はたけ）で野菜（やさい）を生産（せいさん）しています	Mặt trăng （月）hiện hữu nhưng không thể chạm đến nó.	https://www.vnjpclub.com/images/kanji512/bai17/produce.jpg	9	17	2026-06-24 06:26:13.152	2026-06-24 06:26:13.152
266	業	NGHIỆP	ぎょう, ごう, なり, わざ, のぶ	\N	nghề nghiệp, công nghiệp, sự nghiệp	羊（ひつじ）を囲（かこ）いの中（なか）で飼（か）っています。これが私（わたし）の仕事（しごと）です	Nuôi cừu bên trong hàng rào. Đây là công việc của tôi.	https://www.vnjpclub.com/images/kanji512/bai17/business.jpg	10	17	2026-06-24 06:26:13.18	2026-06-24 06:26:13.18
267	薬	DƯỢC	やく, くすり	\N	thuốc	この薬草（やくそう）を飲（の）んで、元気（げんき）になって、楽（たの）しみましょう	Hãy uống thảo dược này để cảm thấy khoẻ lên và cùng nào vui chơi nào!	https://www.vnjpclub.com/images/kanji512/bai17/medicine.jpg	11	17	2026-06-24 06:26:13.206	2026-06-24 06:26:13.206
268	働	ĐỘNG	どう	はたら-く	lao động	人（ひと）が動（うご）いて働（はたら）きます	Mọi người di chuyển làm việc.	https://www.vnjpclub.com/images/kanji512/bai17/work.jpg	12	17	2026-06-24 06:26:13.234	2026-06-24 06:26:13.234
269	員	VIÊN	いん	\N	thành viên, nhân viên	お金（かね）を払（はら）って、会員（かいいん）カードを手（て）に入（い）れます	Trả tiền và nhận được thẻ hội viên.	https://www.vnjpclub.com/images/kanji512/bai17/member.jpg	13	17	2026-06-24 06:26:13.252	2026-06-24 06:26:13.252
270	士	SĨ	し	\N	chiến sĩ, sĩ tử, bác sĩ	十一人（じゅういちにん）のさむらい	Mười một võ sĩ đạo （十一）.	https://www.vnjpclub.com/images/kanji512/bai17/warrior_samurai.jpg	14	17	2026-06-24 06:26:13.288	2026-06-24 06:26:13.288
271	仕	SĨ	し, じ	つか-える	làm việc	さむらいは殿様（とのさま）にお仕（つか）えします	Võ sĩ đạo phục vụ cho ông chủ của anh ta.	https://www.vnjpclub.com/images/kanji512/bai17/serve.jpg	15	17	2026-06-24 06:26:13.33	2026-06-24 06:26:13.33
272	事	SỰ	じ, ず	ろ,こと, つか-う, つか-える	sự việc	することを全部（ぜんぶ）書（か）きます	Tôi viết toàn bộ những việc sẽ làm.	https://www.vnjpclub.com/images/kanji512/bai17/thing.jpg	16	17	2026-06-24 06:26:13.349	2026-06-24 06:26:13.349
273	図	ĐỒ	ず, と	づ,え, はか-る	bản đồ, đồ án, địa đồ	これがだれかがかいた絵（え）です。「ツ、メ」のように見（み）えます	Đây là bức tranh ai đó đã vẽ. Trông như là chữ 「ツ、メ」 vậy.	https://www.vnjpclub.com/images/kanji512/bai18/drawing.jpg	1	18	2026-06-24 06:26:13.384	2026-06-24 06:26:13.384
274	管	QUẢN	かん, くだ	\N	ống, mao quản, quản lí	太（ふと）った役人（やくにん）が家（いえ）の中（なか）にいます	Một quan chức mập đang ở trong nhà.	https://www.vnjpclub.com/images/kanji512/bai18/government_offical.jpg	2	18	2026-06-24 06:26:13.41	2026-06-24 06:26:13.41
275	館	QUÁN	かん, たち, たて, やかた	\N	đại sứ quán, hội quán	この建物（たてもの）で、役人（やくにん）たちへ食事（しょくじ）をします	Các quan chức sẽ dùng bữa ở toà nhà này.	https://www.vnjpclub.com/images/kanji512/bai18/building.jpg	3	18	2026-06-24 06:26:13.448	2026-06-24 06:26:13.448
276	昔	TÍCH	せき, しゃく, むかし	\N	ngày xưa	二十一人（にじゅういちにん）前（まえ）は昔（むかし）です	Cách đây 21 ngày là chuyện của xưa kia.	https://www.vnjpclub.com/images/kanji512/bai18/long_time_ago.jpg	4	18	2026-06-24 06:26:13.483	2026-06-24 06:26:13.483
277	借	TÁ	しゃく	か-りる	mượn, tá điền	昔（むかし）、だれかに何（なに）かを借（か）りました	Khi xưa （昔）tôi đã mượn cái gì đó từ một ai đó.	https://www.vnjpclub.com/images/kanji512/bai18/borrow.jpg	5	18	2026-06-24 06:26:13.51	2026-06-24 06:26:13.51
278	代	ĐẠI	だい, たい	かわ-る	đại biểu, thời đại, đại diện, đại thế	代（か）わりましょう	”Để tôi thay thế anh.”	https://www.vnjpclub.com/images/kanji512/bai18/replace.jpg	6	18	2026-06-24 06:26:13.524	2026-06-24 06:26:13.524
279	貸	THẢI	たい	か-す	cho mượn	彼（かれ）の代（か）わりに私（わたし）がお金（かね）を貸（か）しましょう	Tôi sẽ cho bạn mượn tiền thay cho anh ấy.	https://www.vnjpclub.com/images/kanji512/bai18/lend.jpg	7	18	2026-06-24 06:26:13.559	2026-06-24 06:26:13.559
280	地	ĐỊA	ち, じ	\N	thổ địa, địa đạo	この土地（とち）には、土（つち）の下（した）にサンリがいます	Ở vùng đất này, có con bò cạp ở dưới lòng đất.	https://www.vnjpclub.com/images/kanji512/bai18/land.jpg	8	18	2026-06-24 06:26:13.564	2026-06-24 06:26:13.564
281	世	THẾ	せい, せ, よ	\N	thế giới, thế gian, thế sự	「せかい」の「せ」はこの漢字（かんじ）から作（つく）られました	Chữ 「せ」 trong từ 「せかい」 (thế giới) được tạo thành từ chữ Hán này.	https://www.vnjpclub.com/images/kanji512/bai18/world.jpg	9	18	2026-06-24 06:26:13.582	2026-06-24 06:26:13.582
282	界	GIỚI	かい	\N	thế giới, giới hạn, địa giới	あなたの田（た）んぼと私（わたし）の田（た）んぼの間（あいだ）には、境界（きょうかい）があります	Có ranh giới giữa ruộng của bạn và ruộng của tôi.	https://www.vnjpclub.com/images/kanji512/bai18/boundary.jpg	10	18	2026-06-24 06:26:13.6	2026-06-24 06:26:13.6
283	度	ĐỘ	ど, と, たく, たび	\N	mức độ, quá độ, độ lượng	家（いえ）の中（なか）が二十一度（にじゅういちど）だと、手（て）は温（あたた）かいです	Khi nhiệt độ trong nhà là 21 độ thì bàn tay ta sẽ rất ấm.	https://www.vnjpclub.com/images/kanji512/bai18/degree.jpg	11	18	2026-06-24 06:26:13.609	2026-06-24 06:26:13.609
284	回	HỒI	かい, え	まわ-す	vu hồi, chương hồi	回（まわ）っています	Xoay vòng quanh.	https://www.vnjpclub.com/images/kanji512/bai18/turning_around.jpg	12	18	2026-06-24 06:26:13.629	2026-06-24 06:26:13.629
285	用	DỤNG	よう	たから,もち-いる	sử dụng, dụng cụ, công dụng	私（わたし）たちが使（つか）っている作（さく）です	Đây là hàng rào cọc mà chúng tôi đang sử dụng.	https://www.vnjpclub.com/images/kanji512/bai18/use1.jpg	13	18	2026-06-24 06:26:13.646	2026-06-24 06:26:13.646
286	民	DÂN	みん, たみ	\N	quốc dân, dân tộc	人（ひと）は口（くち）と氏名（しめい）を持（も）っています	Con người có miệng và họ tên.	https://www.vnjpclub.com/images/kanji512/bai18/people1.jpg	14	18	2026-06-24 06:26:13.661	2026-06-24 06:26:13.661
287	注	CHÚ	ちゅう	そそ-ぐ	chú ý, chú thích	「ご主人（しゅじん）様（さま）に水（みず）を掛（か）けないように注意（ちゅうい）して」	”Cẩn thận đừng làm đổ nước vào ông chủ!”	https://www.vnjpclub.com/images/kanji512/bai18/pour.jpg	15	18	2026-06-24 06:26:13.685	2026-06-24 06:26:13.685
288	意	Ý	い	\N	ý nghĩa, ý thức, ý kiến, chú ý	心（こころ）の音（おと）を聞（き）きなさい。自分（じぶん）の気持（きも）ちがわかるでしょう	Lắng nghe âm thanh của trái tim! Có lẽ bạn sẽ hiểu được tâm tình của chính mình.	https://www.vnjpclub.com/images/kanji512/bai18/mind.jpg	16	18	2026-06-24 06:26:13.695	2026-06-24 06:26:13.695
289	頭	ĐẦU	とう, ず, と, あたま, かしら	\N	đầu não	豆（まめ）みたいな頭（あたま）でしょ	Đầu của tôi trông giống hạt đậu.	https://www.vnjpclub.com/images/kanji512/bai19/head.jpg	1	19	2026-06-24 06:26:13.709	2026-06-24 06:26:13.709
290	顔	NHAN	がん, かお	\N	nhan sắc, hồng nhan	頭（あたま）から帽子（ぼうし）を取（と）ると、頭（あたま）の傷（きず）が見（み）えます	Khi gỡ nón ra khỏi đầu thì thấy các vết xước trên mặt.	https://www.vnjpclub.com/images/kanji512/bai19/face.jpg	2	19	2026-06-24 06:26:13.734	2026-06-24 06:26:13.734
291	声	THANH	せい, しょう	こえ, こわ-	âm thanh, thanh điệu	さむらいが戸（と）のところで「エロ」と声（こえ）を出（だ）している	Võ sĩ đạo （士）cất giọng phát ra âm thanh 「コエ」ở bên cửa.	https://www.vnjpclub.com/images/kanji512/bai19/voice.jpg	3	19	2026-06-24 06:26:13.748	2026-06-24 06:26:13.748
292	特	ĐẶC	とく	\N	đặc biệt, đặc công	ヒンズー今日（きょう）の寺院（じいん）では、牛（うし）は特別（とくべつ）な動物（どうぶつ）です	Bò là một con vật đặc biệt ở đền thờ của đạo Hindu.	https://www.vnjpclub.com/images/kanji512/bai19/special.jpg	4	19	2026-06-24 06:26:13.768	2026-06-24 06:26:13.768
293	別	BIỆT	べつ	わか-れる	biệt li, đặc biệt, tạm biệt	包丁（ほうちょう）で肉（にく）を一万（いちまん）切（き）れに分（わ）けました	Chia thịt ra thành 10.000 miếng bằng dao.	https://www.vnjpclub.com/images/kanji512/bai19/separate.jpg	5	19	2026-06-24 06:26:13.782	2026-06-24 06:26:13.782
294	竹	TRÚC	ちく, たか, たけ	\N	trúc	竹（たけ）の形（かたち）です	Hình dạng của cây tre.	https://www.vnjpclub.com/images/kanji512/bai19/bamboo.jpg	6	19	2026-06-24 06:26:13.791	2026-06-24 06:26:13.791
295	合	HỢP	ごう, が, か	あ-う	thích hợp, hội họp, hợp lí	箱（はこ）と二（ふた）は合（あ）っています	Cái hộp và nắp của nó vừa vặn với nhau.	https://www.vnjpclub.com/images/kanji512/bai19/fit.jpg	7	19	2026-06-24 06:26:13.802	2026-06-24 06:26:13.802
296	琴	CẦM	きん, こと	\N	đàn, độc huyền cầm	私（わたし）たちの声（こえ）はこの竹（たけ）の箱（はこ）とふたのように合（あ）いました	Câu trả lời của chúng tôi rất khớp giống như cái hộp tre và nắp của nó.	https://www.vnjpclub.com/images/kanji512/bai19/answer.jpg	8	19	2026-06-24 06:26:13.816	2026-06-24 06:26:13.816
297	正	CHÍNH	せい, しょう	ただ-しい、まさ-に	chính đáng, chính nghĩa, chân chính	赤信号（あかしんごう）で止（と）まるのは、正（ただ）しいことです	Việc dừng lại khi đèn đỏ là việc làm đúng đắn.	https://www.vnjpclub.com/images/kanji512/bai19/right1.jpg	9	19	2026-06-24 06:26:13.829	2026-06-24 06:26:13.829
298	同	ĐỒNG	どう	おな-じ	đồng nhất, tương đồng	入（はい）ってくる人（ひと）の出（で）てくる人（ひと）も、同（おな）じ出入（でい）り口（ぐち）を使（つか）います	Người ra kẻ vào đều sử dụng chung lối ra vào.	https://www.vnjpclub.com/images/kanji512/bai19/same.jpg	10	19	2026-06-24 06:26:13.84	2026-06-24 06:26:13.84
299	計	KÊ, KẾ	けい	はか-る	thống kê; kế hoạch, kế toán	数（かぞ）えて時間（じかん）を計（はか）りましょう「一（いち）、二（に）、…、十（じゅう）」	”Chúng ta hãy tính thời gian bằng cách đếm.”	https://www.vnjpclub.com/images/kanji512/bai19/to_measure.jpg	11	19	2026-06-24 06:26:13.853	2026-06-24 06:26:13.853
300	京	KINH	きょう, けい, みやこ	\N	kinh đô, kinh thành	丘（おか）の上（うえ）に家（いえ）が建（た）ち、それは都（みやこ）になりました	Căn nhà được xây trên đồi, nó trở thành thủ đô.	https://www.vnjpclub.com/images/kanji512/bai19/capital.jpg	12	19	2026-06-24 06:26:13.871	2026-06-24 06:26:13.871
301	集	TẬP	しゅう	あつ-める	tập hợp, tụ tập	鳥（とり）が木（き）に集（あつ）まっています	Những con chim tụ tập trên cây.	https://www.vnjpclub.com/images/kanji512/bai19/gather.jpg	13	19	2026-06-24 06:26:13.886	2026-06-24 06:26:13.886
302	不	BẤT	ふ, ぶ, ず	\N	bất công, bất bình đẳng, bất tài	T（true)じゃありません	Không đúng.	https://www.vnjpclub.com/images/kanji512/bai19/non.jpg	14	19	2026-06-24 06:26:13.898	2026-06-24 06:26:13.898
303	便	TIỆN	べん, びん	たよ-り	thuận tiện	郵便（ゆうびん）が位置（いち）に二（に）で届（とど）いたら便利（べんり）ですね	Nếu thư đến trong vòng 1 ngày thì tiện lợi nhỉ.	https://www.vnjpclub.com/images/kanji512/bai19/convenient.jpg	15	19	2026-06-24 06:26:13.91	2026-06-24 06:26:13.91
304	以	DĨ	い	も-って	dĩ tiền, dĩ vãng	ここがスタートラインです	Chỗ này là vạch xuất phát.	https://www.vnjpclub.com/images/kanji512/bai19/starting_point.jpg	16	19	2026-06-24 06:26:13.922	2026-06-24 06:26:13.922
305	場	TRƯỜNG	じょう, ば	\N	hội trường, quảng trường	いい土（つち）があって日当（ひあ）たりのいいこ場所（ばしょ）にしよう	Chọn nơi có đất tốt và ánh sáng tốt này.	https://www.vnjpclub.com/images/kanji512/bai20/place.jpg	1	20	2026-06-24 06:26:13.945	2026-06-24 06:26:13.945
306	戸	HỘ	こ, と	\N	hộ khẩu	戸（と）の形（かたち）です	Hình dạng của cánh cửa.	https://www.vnjpclub.com/images/kanji512/bai20/door.jpg	2	20	2026-06-24 06:26:13.971	2026-06-24 06:26:13.971
307	所	SỞ	しょ, ところ	\N	trụ sở	おので戸（と）に印（しるし）をつけて、場所（ばしょ）がわかるようにします	Để biết địa điểm tôi đã đánh dấu lên cánh cửa bằng rìu.	https://www.vnjpclub.com/images/kanji512/bai20/place1.jpg	3	20	2026-06-24 06:26:13.999	2026-06-24 06:26:13.999
308	屋	ỐC	おく	\N	phòng ốc	人（ひと）は土（つち）と屋根（やね）が必要（ひつよう）です	Con người cần đất và mái nhà.	https://www.vnjpclub.com/images/kanji512/bai20/roof_shop.jpg	4	20	2026-06-24 06:26:14.028	2026-06-24 06:26:14.028
309	堂	ĐƯỜNG	どう	\N	thực đường, thiên đường	土（つち）の上（うえ）の大（おお）きな建物（たてもの）です	Một toà nhà to trên đất.	https://www.vnjpclub.com/images/kanji512/bai20/hall.jpg	5	20	2026-06-24 06:26:14.055	2026-06-24 06:26:14.055
310	都	ĐÔ	と, つ, みやこ	\N	đô thị, đô thành	バス停（てい）で、人（ひと）が都（みやこ）に行（い）くバスを待（ま）っています	Một người đang đợi xe buýt lên thủ đô tại trạm xe buýt.	https://www.vnjpclub.com/images/kanji512/bai20/metropolis.jpg	6	20	2026-06-24 06:26:14.073	2026-06-24 06:26:14.073
311	県	HUYỆN	けん	あがた,か-ける, がた	huyện, tỉnh	国（くに）は、小（ちい）さい県（けん）に目（め）を光（ひか）らせています	Quốc gia đang để mắt tới các tỉnh nhỏ.	https://www.vnjpclub.com/images/kanji512/bai20/prefecture.jpg	7	20	2026-06-24 06:26:14.098	2026-06-24 06:26:14.098
312	区	KHU	く, 区分(くぶん)→區［區	\N	khu vực, địa khu	この区（く）は三（みっ）つの壁（かべ）と二（ふた）つの道（みち）で区（く）切（き）られています	Khu này được phân chia bởi 3 bức tường và 2 con đường.	https://www.vnjpclub.com/images/kanji512/bai20/zone.jpg	8	20	2026-06-24 06:26:14.12	2026-06-24 06:26:14.12
313	池	TRÌ	ち, いけ	\N	cái ao	行（い）けにザリガニがいます	Có con tôm trong ao.	https://www.vnjpclub.com/images/kanji512/bai20/pond.jpg	9	20	2026-06-24 06:26:14.139	2026-06-24 06:26:14.139
314	発	PHÁT	はつ, ほつ	あば-く］ 明るみに出す、放つ、起る→發［發	xuất phát, phát kiến, phát hiện, phát ngôn	人類（じんるい）が二本（にほん）の足（あし）で歩（ある）き始（はじ）めました	Con người bắt đầu bước đi trên hai chân.	https://www.vnjpclub.com/images/kanji512/bai20/to_start_to_reveal.jpg	10	20	2026-06-24 06:26:14.151	2026-06-24 06:26:14.151
315	建	KIẾN	けん, こん	た-てる	kiến thiết, kiến tạo	建物（たてもの）を建（た）てる前（まえ）に、書（か）くものを持（も）ち、設計（せっけい）することは大切（たいせつ）です	Việc có gì đó để viết và thiết kế trước khi xây dựng toà nhà thì rất quan trọng.	https://www.vnjpclub.com/images/kanji512/bai20/build.jpg	11	20	2026-06-24 06:26:14.167	2026-06-24 06:26:14.167
316	物	VẬT	ぶつ, もつ, もの	\N	động vật	牛（うし）やきつねは生（い）き物（もの）です	Bò và cáo là những sinh vật.	https://www.vnjpclub.com/images/kanji512/bai20/things.jpg	12	20	2026-06-24 06:26:14.181	2026-06-24 06:26:14.181
317	品	PHẨM	ひん, しな	\N	sản phẩm	三（みっ）つの品物（しなもの）の形（かたち）です	Hình dạng của 3 món hàng.	https://www.vnjpclub.com/images/kanji512/bai20/goods.jpg	13	20	2026-06-24 06:26:14.202	2026-06-24 06:26:14.202
318	旅	LỮ	りょ, たび	\N	lữ hành, lữ khách	二人（ふたり）の人（ひと）が旗（はた）を持（も）ったガイドの後（あと）について旅行（りょこう）しています	Hai người đang đi du lịch theo hướng dẫn viên cầm cờ.	https://www.vnjpclub.com/images/kanji512/bai20/travel.jpg	14	20	2026-06-24 06:26:14.217	2026-06-24 06:26:14.217
319	通	THÔNG	つう, つ	かよ-う、とお-る	thông qua, thông hành, phổ thông	さくを乗（の）り越（こ）えて、通学（つうがく）します	Tôi trèo lên hàng rào để đi học.	https://www.vnjpclub.com/images/kanji512/bai20/commute.jpg	15	20	2026-06-24 06:26:14.234	2026-06-24 06:26:14.234
320	進	TIẾN	しん	すす-む	thăng tiến, tiền tiến, tiến lên	鳥（とり）が前（まえ）に進（すす）んでいます	Con chinh đang hướng về phía trước	https://www.vnjpclub.com/images/kanji512/bai20/advance.jpg	16	20	2026-06-24 06:26:14.243	2026-06-24 06:26:14.243
321	丸	HOÀN	がん	まる、まる-い	tròn	体（からだ）を丸（まる）めています	Tôi cuộn tròn mình lại.	https://www.vnjpclub.com/images/kanji512/bai21/to_round.jpg	1	21	2026-06-24 06:26:14.263	2026-06-24 06:26:14.263
322	熱	NHIỆT	ねつ	あつ-い	nhiệt độ, nhiệt tình	熱（ねつ）を逃（に）がさないように、体（からだ）を丸（まる）めています	Tôi cuộn tròn mình lại để sao cho hơi nóng không thoát ra.	https://www.vnjpclub.com/images/kanji512/bai21/heat.jpg	2	21	2026-06-24 06:26:14.271	2026-06-24 06:26:14.271
323	冷	LÃNH	れい	つめ-たい	lạnh, lãnh đạm	冷（つめ）たい風（かぜ）の中（なか）で、震（ふる）えています	Đang run lập cập trong cơn gió lạnh.	https://www.vnjpclub.com/images/kanji512/bai21/freezing.jpg	3	21	2026-06-24 06:26:14.284	2026-06-24 06:26:14.284
324	甘	CAM	かん	あま-い	ngọt, cam chịu	つぼの中（なか）に甘（あま）いはちみつが入（はい）っています	Có mật ong ngọt ở trong lọ.	https://www.vnjpclub.com/images/kanji512/bai21/sweet.jpg	4	21	2026-06-24 06:26:14.291	2026-06-24 06:26:14.291
325	汚	Ô	お	けが-す, けが-れる, けが-らわしい, よご-す, よご-れる, きたな-い	ô nhiễm	汚（きたな）い水（みず）を飲（の）んでいます	Uống nước bẩn.	https://www.vnjpclub.com/images/kanji512/bai21/dirty.jpg	5	21	2026-06-24 06:26:14.296	2026-06-24 06:26:14.296
326	果	QUẢ	か	は-たす	hoa quả, thành quả, kết quả	果物（くだもの）がなっている木（き）です	Cây đang ra quả.	https://www.vnjpclub.com/images/kanji512/bai21/fruit.jpg	6	21	2026-06-24 06:26:14.303	2026-06-24 06:26:14.303
327	卵	NOÃN	らん, たまご	\N	trứng	卵（たまご）を割（わ）りましょう	Hãy làm vỡ quả trứng!	https://www.vnjpclub.com/images/kanji512/bai21/egg.jpg	7	21	2026-06-24 06:26:14.316	2026-06-24 06:26:14.316
328	皿	MÃNH	さら	-	đĩa	皿（さら）の上（うえ）にケーキがのっています	Đặt cái bánh lên trên dĩa.	https://www.vnjpclub.com/images/kanji512/bai21/plate.jpg	8	21	2026-06-24 06:26:14.322	2026-06-24 06:26:14.322
329	酒	TỬU	しゅ	き,さけ, さか-, さ, し	rượu	おいしいお酒（さけ）がいい水（みず）からできます	Rượu ngon được làm từ nguồn nước sạch.	https://www.vnjpclub.com/images/kanji512/bai21/alcohol.jpg	9	21	2026-06-24 06:26:14.335	2026-06-24 06:26:14.335
330	塩	DIÊM	えん, しお	\N	muối	皿（さら）の食（た）べ物（もの）は塩辛（しおから）いです	Thức ăn trên đĩa bị mặn.	https://www.vnjpclub.com/images/kanji512/bai21/salty.jpg	10	21	2026-06-24 06:26:14.355	2026-06-24 06:26:14.355
331	付	PHỤ	ふ	つ-く	phụ thuộc, phụ lục	人（ひと）に何（なに）かをつけます	Đính gì đó lên một người.	https://www.vnjpclub.com/images/kanji512/bai21/attach.jpg	11	21	2026-06-24 06:26:14.371	2026-06-24 06:26:14.371
332	片	PHIẾN	へん	かた-, かた	tấm	木（き）の片側（かたがわ）です	Một bên cây.	https://www.vnjpclub.com/images/kanji512/bai21/one_side.jpg	12	21	2026-06-24 06:26:14.387	2026-06-24 06:26:14.387
333	焼	THIÊU	しょう	や-く］ 燃やす→燒［堯	thiêu đốt	30本（ぽん）の棒（ぼう）を焼（や）きました	Tôi đã đốt 30 thanh gỗ.	https://www.vnjpclub.com/images/kanji512/bai21/burn.jpg	13	21	2026-06-24 06:26:14.408	2026-06-24 06:26:14.408
334	消	TIÊU	しょう	き-える、け-す	tiêu diệt, tiêu hao, tiêu thất	月（つき）が水（みず）の中（なか）に消（き）えました	Mặt trăng biến mất trong làn nước.	https://www.vnjpclub.com/images/kanji512/bai21/to_turn_off_disappear.jpg	14	21	2026-06-24 06:26:14.423	2026-06-24 06:26:14.423
335	固	CỐ	こ	かた-い	ngoan cố, cố thủ	古（ふる）い教会（きょうかい）の周（まわ）りの壁（かべ）は、固（かた）くて丈夫（じょうぶ）です	Những bức tường bao quanh nhà thờ cổ rất cứng và bền.	https://www.vnjpclub.com/images/kanji512/bai21/hard.jpg	15	21	2026-06-24 06:26:14.431	2026-06-24 06:26:14.431
336	個	CÁ	こ	\N	cá nhân, cá thể	個人（こじん）は固（かた）い信念（しんねん）を持（も）っています	Mỗi cá nhân đều có một niềm tin vững chắc.	https://www.vnjpclub.com/images/kanji512/bai21/individual.jpg	16	21	2026-06-24 06:26:14.443	2026-06-24 06:26:14.443
337	笑	TIẾU	しょう	え-む、わら-う	cười	人（ひと）が「ケケ」と大笑（おおわら）いしています	Con người cười lớn rằng [ke ke]	https://www.vnjpclub.com/images/kanji512/bai22/laugh.jpg	1	22	2026-06-24 06:26:14.48	2026-06-24 06:26:14.48
338	泣	KHẤP	きゅう	な-く	khóc	立（た）って、泣（な）いています	Đang đứng khóc.	https://www.vnjpclub.com/images/kanji512/bai22/cry.jpg	2	22	2026-06-24 06:26:14.493	2026-06-24 06:26:14.493
339	怒	NỘ	ど	いか-る、おこ-る	thịnh nộ	怒（おこ）った女（おんな）の人（ひと）にたたかれました	Tôi đã bị người phụ nữ nổi giận đánh.	https://www.vnjpclub.com/images/kanji512/bai22/angry.jpg	3	22	2026-06-24 06:26:14.507	2026-06-24 06:26:14.507
340	幸	HẠNH	こう	さいわ-い、しあわ-せ、さち	hạnh phúc, hạnh vận	土（つち）の下（した）に円（えん）（￥）をたくさん持（も）っていて、幸（しあわ）せです	Vì tôi có nhiều tiền yên （￥）ở dưới đất nên tôi rất hạnh phúc.	https://www.vnjpclub.com/images/kanji512/bai22/happy.jpg	4	22	2026-06-24 06:26:14.512	2026-06-24 06:26:14.512
341	悲	BI	ひ	かな-しい	sầu bi, bi quan	彼（かれ）が刑務所（けいむしょ）に入（はい）っているので、私（わたし）の心（こころ）は悲（かな）しいです	Vì anh ấy đang ở trong nhà giam nên trái tim tôi rất đau khổ.	https://www.vnjpclub.com/images/kanji512/bai22/sad.jpg	5	22	2026-06-24 06:26:14.529	2026-06-24 06:26:14.529
342	苦	KHỔ	く	くる-しい、にが-い	khổ cực, cùng khổ	古（ふる）い草（くさ）を食（た）べたら、苦（くる）しくなります	Nếu ăn cỏ cũ sẽ bị đau.	https://www.vnjpclub.com/images/kanji512/bai22/to_suffer.jpg	6	22	2026-06-24 06:26:14.537	2026-06-24 06:26:14.537
343	痛	THỐNG	つう	いた-い	thống khổ	痛（いた）みを感（かん）じながら、病院（びょういん）のさくを越（こ）えます	Vừa cảm nhận nỗi đau, vừa vượt qua hàng rào của bệnh viện.	https://www.vnjpclub.com/images/kanji512/bai22/pain.jpg	7	22	2026-06-24 06:26:14.555	2026-06-24 06:26:14.555
344	恥	SỈ	ち	はじ、はじ-る	sỉ nhục	自分（じぶん）の心（こころ）の声（こえ）に耳（みみ）を傾（かたむ）けないなんて、恥（は）ずべきことです	Thật đáng xấu hổ nếu bạn không lắng nghe nhịp đập con tim mình.	https://www.vnjpclub.com/images/kanji512/bai22/shame.jpg	8	22	2026-06-24 06:26:14.57	2026-06-24 06:26:14.57
345	配	PHỐI	はい	くば-る	phân phối, chi phối, phối ngẫu	ひざまずいてお酒（さけ）を配（くば）っています	Quỳ gối đưa rượu.	https://www.vnjpclub.com/images/kanji512/bai22/to_deliver.jpg	9	22	2026-06-24 06:26:14.581	2026-06-24 06:26:14.581
346	困	KHỐN	こん	こま-る	khốn cùng	大（おお）きな木（き）があるので、困（こま）っています	Gặp khó khăn vì có cái cây to.	https://www.vnjpclub.com/images/kanji512/bai22/trouble.jpg	10	22	2026-06-24 06:26:14.599	2026-06-24 06:26:14.599
347	辛	TÂN	しん	から-い、つら-い	cay	棒（ぼう）の上（うえ）に立（た）つのはつらいです	Việc đứng trên cây sào rất khổ sở.	https://www.vnjpclub.com/images/kanji512/bai22/painful_spicy.jpg	11	22	2026-06-24 06:26:14.606	2026-06-24 06:26:14.606
348	眠	MIÊN	みん	ねむ-る	thôi miên	人々（ひとびと）が目（め）を閉（と）じて眠（ねむ）っています	Mọi người nhắm mắt lại ngủ.	https://www.vnjpclub.com/images/kanji512/bai22/to_sleep.jpg	12	22	2026-06-24 06:26:14.618	2026-06-24 06:26:14.618
349	残	TÀN	ざん	のこ-る	tàn dư, tàn tích, tàn đảng	三人（さんにん）は死（し）んで、武器（ぶき）だけが残（のこ）りました	Ba người chết và chỉ còn sót lại vũ khí của họ.	https://www.vnjpclub.com/images/kanji512/bai22/remain.jpg	13	22	2026-06-24 06:26:14.63	2026-06-24 06:26:14.63
350	念	NIỆM	ねん	\N	ý niệm, tưởng niệm	今（いま）、あなたのことを考（かんが）えています	Bây giờ （今）anh đang nghĩ về em.	https://www.vnjpclub.com/images/kanji512/bai22/thought.jpg	14	22	2026-06-24 06:26:14.637	2026-06-24 06:26:14.637
351	感	CẢM	かん	\N	cảm giác, cảm xúc, cảm tình	武器（ぶき）を持（も）った人（ひと）を見（み）て、驚（おどろ）きました	Tôi đã bị sốc khi nhìn thấy một người mang vũ khí.	https://www.vnjpclub.com/images/kanji512/bai22/felt.jpg	15	22	2026-06-24 06:26:14.655	2026-06-24 06:26:14.655
352	情	TÌNH	じょう, せい	なさ-け	tình cảm, tình thế	私（わたし）の心（こころ）はブルーです	Tim tôi thấy buồn（青）.	https://www.vnjpclub.com/images/kanji512/bai22/feel.jpg	16	22	2026-06-24 06:26:14.663	2026-06-24 06:26:14.663
353	覚	GIÁC	かく	おぼ-える、さめ-る	cảm giác, giác ngộ	学校（がっこう）で見（み）たものを覚（おぼ）えます	Nhớ những điều đã thấy ở trường.	https://www.vnjpclub.com/images/kanji512/bai23/memorize.jpg	1	23	2026-06-24 06:26:14.685	2026-06-24 06:26:14.685
354	忘	VONG	ぼう	わす-れる	quên	右側（みぎがわ）の壁（かべ）を作（つく）るのを忘（わす）れました	Tôi đã quên xây bức tường bên phải.	https://www.vnjpclub.com/images/kanji512/bai23/forget.jpg	2	23	2026-06-24 06:26:14.698	2026-06-24 06:26:14.698
355	決	QUYẾT	けつ	き-める	quyết định	節水（せっすい）することに決（き）めました	Quyết định tiết kiệm nước.	https://www.vnjpclub.com/images/kanji512/bai23/decide.jpg	3	23	2026-06-24 06:26:14.704	2026-06-24 06:26:14.704
356	定	ĐỊNH	てい, じょう	さだ-める	thiết định, quyết định, định mệnh	引（ひ）っ越（こ）す日（ひ）を決定（けってい）しましょう	Chúng ta hãy ấn định ngày dọn nhà.	https://www.vnjpclub.com/images/kanji512/bai23/to_fix.jpg	4	23	2026-06-24 06:26:14.72	2026-06-24 06:26:14.72
357	比	TỈ	ひ	くら-べる	so sánh, tỉ lệ, tỉ dụ	どちらもカタカナの「ヒ」でしょうか？比（くら）べてみましょう	Cả hai đều là chữ 「ヒ」trong Katakana phải không? Chúng ta hãy thử so sánh chúng.	https://www.vnjpclub.com/images/kanji512/bai23/to_compare.jpg	5	23	2026-06-24 06:26:14.736	2026-06-24 06:26:14.736
358	受	THỤ	じゅ	う-ける	nhận, tiếp thụ	手（て）から手（て）へものを受（う）け取（と）ります	Truyền tay nhau nhận lấy vật.	https://www.vnjpclub.com/images/kanji512/bai23/to_receive.jpg	6	23	2026-06-24 06:26:14.739	2026-06-24 06:26:14.739
359	授	THỤ	じゅ	さず-ける	đưa cho, truyền thụ, giáo thụ	教（おし）えてもらうことは何（なに）かを受（う）け取（と）ることです	Được chỉ bảo là việc nhận lấy cái gì đó từ người khác.	https://www.vnjpclub.com/images/kanji512/bai23/to_instruct.jpg	7	23	2026-06-24 06:26:14.755	2026-06-24 06:26:14.755
360	練	LUYỆN	れん	ね-る	rèn luyện, luyện tập	弟子（でし）が道（みち）を走（はし）っています	Đệ tử đang chạy trên đường	https://www.vnjpclub.com/images/kanji512/bai23/elaborate.jpg	8	23	2026-06-24 06:26:14.77	2026-06-24 06:26:14.77
361	徒	ĐỒ	と, かち	\N	môn đồ, đồ đệ	東洋（とうよう）で、私（わたし）を紡（つむ）ぐ練習（れんしゅう）をしました	Tôi đã luyện kéo sợi ở Đông Dương.	https://www.vnjpclub.com/images/kanji512/bai23/follow.jpg	9	23	2026-06-24 06:26:14.78	2026-06-24 06:26:14.78
362	復	PHỤC	ふく	\N	phục thù, hồi phục	人（ひと）は同（おな）じ道（みち）を毎日（まいにち）歩（ある）きます	Con người cứ bước đi trên cùng con đường mỗi ngày.	https://www.vnjpclub.com/images/kanji512/bai23/repetition.jpg	10	23	2026-06-24 06:26:14.792	2026-06-24 06:26:14.792
363	表	BIỂU	ひょう	おもて、あらわ-す	biểu hiện, bảng biểu, biểu diễn	木（き）が大（おお）きく育（そだ）ったので、喜（よろこ）びを表現（ひょうげん）しています	Con người cứ bước đi trên cùng con đường mỗi ngày.	https://www.vnjpclub.com/images/kanji512/bai23/to_express_surface.jpg	11	23	2026-06-24 06:26:14.813	2026-06-24 06:26:14.813
364	卒	TỐT	そつ, →卆［卆	\N	tốt nghiệp	住人（じゅうにん）の人（ひと）が卒業（そつぎょう）しました	10 （十）người đã tốt nghiệp.	https://www.vnjpclub.com/images/kanji512/bai23/to_granduate.jpg	12	23	2026-06-24 06:26:14.832	2026-06-24 06:26:14.832
365	違	VI	い	ちが-う	vi phạm, tương vi	道（みち）が複雑（ふくざつ）なので、間違（まちが）えたみたいです	Vì đường sá phức tạp nên dường như tôi đã đi nhầm đường.	https://www.vnjpclub.com/images/kanji512/bai23/different.jpg	13	23	2026-06-24 06:26:14.849	2026-06-24 06:26:14.849
366	役	DỊCH	えき, やく	\N	chức vụ, nô dịch	私（わたし）の役目（やくめ）は石（いし）を運（はこ）ぶことです	Nhiệm vụ của tôi là mang hòn đá.	https://www.vnjpclub.com/images/kanji512/bai23/duty.jpg	14	23	2026-06-24 06:26:14.855	2026-06-24 06:26:14.855
367	皆	GIAI	かい, みな	\N	tất cả	白（しろ）い建物（たてもの）の上（うえ）の人（ひと）を比（くら）べてください。みんなよく似（に）ています	Hãy so sánh （比）những người trên toà nhà màu trắng（白）. Mọi người trông giống nhau.	https://www.vnjpclub.com/images/kanji512/bai23/everyone.jpg	15	23	2026-06-24 06:26:14.872	2026-06-24 06:26:14.872
368	彼	BỈ	ひ, かの, かれ	\N	anh ta	彼（かれ）の腕（うで）を捕（つか）まえようとしたけれど、彼（かれ）は行（い）ってしまいました	Tôi đã định nắm lấy tay anh ấy nhưng anh ấy đã đi rồi.	https://www.vnjpclub.com/images/kanji512/bai23/he.jpg	16	23	2026-06-24 06:26:14.892	2026-06-24 06:26:14.892
369	全	TOÀN	ぜん	すべ-て、まった-く、まっと-う	toàn bộ	王様（おうさま）は山（やま）にある全部（ぜんぶ）の物（もの）を統治（とうち）しています	Nhà vua thống trị toàn bộ những thứ có trên núi.	https://www.vnjpclub.com/images/kanji512/bai24/all.jpg	1	24	2026-06-24 06:26:14.905	2026-06-24 06:26:14.905
370	部	BỘ	ぶ	\N	bộ môn, bộ phận	バス停（てい）のところに、人（ひと）が立（た）っています	Một người đang đứng trong khu vực trạm chờ xe buýt.	https://www.vnjpclub.com/images/kanji512/bai24/section.jpg	2	24	2026-06-24 06:26:14.917	2026-06-24 06:26:14.917
371	必	TẤT	ひつ	かなら-ず	tất nhiên, tất yếu	あなたのハートは必（かなら）ず射止（いと）めてみせます	Anh nhất định sẽ bắn trúng tim em cho xem.	https://www.vnjpclub.com/images/kanji512/bai24/surely.jpg	3	24	2026-06-24 06:26:14.936	2026-06-24 06:26:14.936
372	要	YÊU, YẾU	よう	い-る	yêu cầu; chủ yếu	女（おんな）の人（ひと）はかばんに必要（ひつよう）な物（もの）を入（い）れています	Phụ nữ cất những vật cần thiết trong giỏ.	https://www.vnjpclub.com/images/kanji512/bai24/necessary.jpg	4	24	2026-06-24 06:26:14.949	2026-06-24 06:26:14.949
373	荷	HÀ	か, に	\N	hành lí	その荷物（にもつ）から草（くさ）が見（み）えます。中（なか）何（なに）が入（はい）っていますか	Tôi nhìn thấy cỏ từ hành lý đó. Có cái gì trong đó vậy?	https://www.vnjpclub.com/images/kanji512/bai24/baggage.jpg	5	24	2026-06-24 06:26:14.958	2026-06-24 06:26:14.958
374	由	DO	ゆ, ゆう, ゆい, よし	\N	tự do, lí do	箱（はこ）を開（あ）けないでください。怖（こわ）いものが出（で）てくるかもしれませんから	Đừng mở cái hộp ra. Vì không chừng sẽ có vật gì đó đáng sợ xuất hiện ra.	https://www.vnjpclub.com/images/kanji512/bai24/because.jpg	6	24	2026-06-24 06:26:14.973	2026-06-24 06:26:14.973
375	届	GIỚI	\N	-, とど-ける	đưa đến	我（わ）が家（や）に小包（こづつみ）が届（とど）けられました	Gói hàng đã được đưa đến nhà tôi.	https://www.vnjpclub.com/images/kanji512/bai24/to_deliver1.jpg	7	24	2026-06-24 06:26:14.991	2026-06-24 06:26:14.991
376	利	LỢI	り	き-く、とし	phúc lợi, lợi ích	稲（いね）を刈（か）り取（と）って、利益（りえき）を得（え）ます	Gặt lúa và thu lợi.	https://www.vnjpclub.com/images/kanji512/bai24/profit.jpg	8	24	2026-06-24 06:26:15	2026-06-24 06:26:15
377	払	PHẤT	ふつ	はら-う］ 拭(ぬぐ)う、除き去る→拂［弗	trả tiền	私（わたし）がお金（かね）を払（はら）います	Tôi sẽ trả tiền.	https://www.vnjpclub.com/images/kanji512/bai24/to_pay.jpg	9	24	2026-06-24 06:26:15.015	2026-06-24 06:26:15.015
378	濯	TRẠC	たく	\N	rửa	何曜日（なんようび）に洗濯（せんたく）しますか	Thứ mấy bạn giặt đồ?	https://www.vnjpclub.com/images/kanji512/bai24/to_wash.jpg	10	24	2026-06-24 06:26:15.02	2026-06-24 06:26:15.02
379	寝	TẨM	しん	ね-る, ね-かす, い-ぬ, みたまや, や-める	ngủ	二人（ふたり）の人（ひと）が寝（ね）ています	Hai người đang ngủ.	https://www.vnjpclub.com/images/kanji512/bai24/to_sleep1.jpg	11	24	2026-06-24 06:26:15.032	2026-06-24 06:26:15.032
380	踊	DŨNG	よう	おど-る］ 舞う→踴［勇	nhảy múa	足（あし）を動（うご）かして、塀（へい）の上（うえ）で踊（おど）りましょう	Hãy cử động đôi chân và nhảy múa trên hàng rào!	https://www.vnjpclub.com/images/kanji512/bai24/dance.jpg	12	24	2026-06-24 06:26:15.057	2026-06-24 06:26:15.057
381	活	HOẠT	かつ	い-きる	hoạt động, sinh hoạt	水（みず）をたくさん飲（の）んで、元気（げんき）になります	Uống nhiều nước và trở nên khoẻ mạnh.	https://www.vnjpclub.com/images/kanji512/bai24/active.jpg	13	24	2026-06-24 06:26:15.066	2026-06-24 06:26:15.066
382	末	MẠT	まつ, ばつ, すえ	\N	kết thúc, mạt vận, mạt kì	木（き）の命（いのち）が終（お）わろうとしています	Đời sống của cái cây （木）sắp sửa kết thúc.	https://www.vnjpclub.com/images/kanji512/bai24/end1.jpg	14	24	2026-06-24 06:26:15.096	2026-06-24 06:26:15.096
383	宅	TRẠCH	たく	\N	nhà ở	家（いえ）にいるのが好（す）きです	Tôi thích ở trong nhà mình.	https://www.vnjpclub.com/images/kanji512/bai24/house1.jpg	15	24	2026-06-24 06:26:15.115	2026-06-24 06:26:15.115
384	祭	TẾ	さい	まつり、まつ-る	lễ hội	祭（まつ）りの日（ひ）には、祭壇（さいだん）に肉（にく）が捧（ささ）げられます	Vào ngày lễ, thịt được dâng lên bàn thờ.	https://www.vnjpclub.com/images/kanji512/bai24/festival.jpg	16	24	2026-06-24 06:26:15.136	2026-06-24 06:26:15.136
385	平	BÌNH	へい, びょう	たい-ら、ひら	hòa bình, bình đẳng, trung bình, bình thường	今（いま）、シーソーは水平（すいへい）です	Bập bênh đang ngang bằng.	https://www.vnjpclub.com/images/kanji512/bai25/flat_calm.jpg	1	25	2026-06-24 06:26:15.153	2026-06-24 06:26:15.153
386	和	HÒA	わ, お	やわ-らぐ、なご-む	hòa bình, tổng hòa, điều hòa	和食（わしょく）にはご飯（はん）が付（つ）いてきます	Đồ ăn Nhật đi kèm với cơm.	https://www.vnjpclub.com/images/kanji512/bai25/peace.jpg	2	25	2026-06-24 06:26:15.18	2026-06-24 06:26:15.18
387	戦	CHIẾN	せん	いくさ、たたか-う］ →戰［單	chiến tranh, chiến đấu	戦争（せんそう）ではいろいろな武器（ぶき）が使（つか）われます	Nhiều loại vũ khí được sử dụng trong chiến tranh.	https://www.vnjpclub.com/images/kanji512/bai25/war.jpg	3	25	2026-06-24 06:26:15.207	2026-06-24 06:26:15.207
388	争	TRANH	そう	あらそ-う］ 競争(きょうそう)→爭［爭	đấu tranh, chiến tranh, tranh luận, cạnh tranh	その人（ひと）は武器（ぶき）を手（て）に持（も）ち、争（あらそ）いに備（そな）えています	Người đó cầm vũ khí trong tay chuẩn bị đánh nhau.	https://www.vnjpclub.com/images/kanji512/bai25/conflict.jpg	4	25	2026-06-24 06:26:15.22	2026-06-24 06:26:15.22
389	政	CHÍNH	せい, しょう, まつりごと	\N	chính phủ, chính sách, hành chính	政府（せいふ）は正（ただ）しいことをするべきです	Chính phủ nên thực thi những điều đúng đắn（正）.	https://www.vnjpclub.com/images/kanji512/bai25/government.jpg	5	25	2026-06-24 06:26:15.225	2026-06-24 06:26:15.225
390	治	TRỊ	ち, じ	おさ-める	cai trị, trị an, trị bệnh	私（わたし）は海岸（かいがん）地帯（ちたい）を納（おさ）めています	Tôi quản lý vùng ven biển.	https://www.vnjpclub.com/images/kanji512/bai25/to_govern_cure.jpg	6	25	2026-06-24 06:26:15.249	2026-06-24 06:26:15.249
391	経	KINH	けい, きょう	へ-る、た-つ	kinh tế, sách kinh, kinh độ	土（つち）を耕（たがや）したり、糸（いと）を紡（つむ）いだりして、長（なが）い時間（じかん）が経（た）ってしまいました	Khi thì cày đất, khi thì kéo sợi, thời gian khá dài đã trôi qua.	https://www.vnjpclub.com/images/kanji512/bai25/to_pass_through.jpg	7	25	2026-06-24 06:26:15.263	2026-06-24 06:26:15.263
392	済	TẾ	さい	す-む］ 終わる、助ける→濟［齊	kinh tế, cứu tế	看板（かんばん）に文（ぶん）を書（か）いて、仕事（しごと）を済（す）ませました	Tôi đã viết câu văn lên bảng hiệu và hoàn tất công việc.	https://www.vnjpclub.com/images/kanji512/bai25/to_finish.jpg	8	25	2026-06-24 06:26:15.282	2026-06-24 06:26:15.282
393	法	PHÁP	ほう, は, ほ	のり、のっと-る	pháp luật, phương pháp	去年（きょねん）、水（みず）の法律（ほうりつ）が施行（しこう）されました	Năm ngoái, các luật về nước đã được thi hành.	https://www.vnjpclub.com/images/kanji512/bai25/law_method.jpg	9	25	2026-06-24 06:26:15.291	2026-06-24 06:26:15.291
394	律	LUẬT	りつ, りち	\N	luật pháp	交通（こうつう）規則（きそく）を書（か）きました	Tôi đã viết các luật lệ giao thông.	https://www.vnjpclub.com/images/kanji512/bai25/regulation.jpg	10	25	2026-06-24 06:26:15.312	2026-06-24 06:26:15.312
395	際	TẾ	さい, きわ	\N	quốc tế	祭（まつ）りは特別（とくべつ）な行事（ぎょうじ）です	Lễ hội là sự kiện đặc biệt.	https://www.vnjpclub.com/images/kanji512/bai25/occasion.jpg	11	25	2026-06-24 06:26:15.324	2026-06-24 06:26:15.324
396	関	QUAN	かん, せき	\N	hải quan, quan hệ	いい関係（かんけい）を作（つく）るために贈（おく）り物（もの）を門（もん）まで持（も）って来（き）ました	Tôi đã mang quà tặng đến tận cổng để tạo mối quan hệ tốt.	https://www.vnjpclub.com/images/kanji512/bai25/to_relate.jpg	12	25	2026-06-24 06:26:15.343	2026-06-24 06:26:15.343
397	係	HỆ	けい	かか-る、かかり	quan hệ, hệ số	人々（ひとびと）は糸（いと）のように結（むす）びついています	Mọi người kết nối với nhau giống như sợi chỉ （糸）vậy.	https://www.vnjpclub.com/images/kanji512/bai25/to_connect.jpg	13	25	2026-06-24 06:26:15.369	2026-06-24 06:26:15.369
398	義	NGHĨA	ぎ	\N	ý nghĩa, nghĩa lí, đạo nghĩa	羊（ひつじ）のために戦（たたか）うことは、正（ただ）しいことだ！	Việc chiến đấu vì đàn cừu là việc làm đúng đắn!	https://www.vnjpclub.com/images/kanji512/bai25/rightenousnes.jpg	14	25	2026-06-24 06:26:15.384	2026-06-24 06:26:15.384
399	議	NGHỊ	ぎ	\N	nghị luận, nghị sự	正（ただ）しいかどうか話（はな）し合（あ）っています	Đang thảo luận xem có đúng （義）hay không.	https://www.vnjpclub.com/images/kanji512/bai25/discuss.jpg	15	25	2026-06-24 06:26:15.403	2026-06-24 06:26:15.403
400	党	ĐẢNG	とう	\N	đảng phái	兄（あに）は政党（せいとう）に入（はい）りました	Anh trai tôi （兄）gia nhập vào chính đảng.	https://www.vnjpclub.com/images/kanji512/bai25/political_party.jpg	16	25	2026-06-24 06:26:15.415	2026-06-24 06:26:15.415
401	遊	DU	ゆう, ゆ	あそ-ぶ	du hí, du lịch	旗（はた）を持（も）った子（こ）どもが遊（あそ）びに出（で）かけます	Đứa bé cầm lá cờ chạy đi chơi.	https://www.vnjpclub.com/images/kanji512/bai26/to_play.jpg	1	26	2026-06-24 06:26:15.426	2026-06-24 06:26:15.426
402	泳	VỊNH	えい	およ-ぐ	bơi	水（みず）の中（なか）を泳（およ）ぎます	Tôi bơi trong nước.	https://www.vnjpclub.com/images/kanji512/bai26/to_swim.jpg	2	26	2026-06-24 06:26:15.435	2026-06-24 06:26:15.435
403	疲	BÌ	ひ	つか-れる	mệt	彼（かれ）は疲（つか）れがひどく、病院（びょういん）に行（い）きました	Anh ấy mệt lả nên đã đi bệnh viện.	https://www.vnjpclub.com/images/kanji512/bai26/exhausted.jpg	3	26	2026-06-24 06:26:15.441	2026-06-24 06:26:15.441
404	暖	NOÃN	だん	あたた-か	ấm	友達（ともだち）と手（て）を合（あ）わせると、暖（あたた）かいです	Chắp tay cùng bạn bè ta sẽ thấy ấm áp.	https://www.vnjpclub.com/images/kanji512/bai26/warm.jpg	4	26	2026-06-24 06:26:15.447	2026-06-24 06:26:15.447
405	涼	LƯƠNG	りょう	すず-しい	mát	雨（あめ）が降（ふ）って京（きょう）の都（みやこ）が涼（すず）しくなりました	Mưa xuống làm mát thủ đô.	https://www.vnjpclub.com/images/kanji512/bai26/cool.jpg	5	26	2026-06-24 06:26:15.453	2026-06-24 06:26:15.453
406	静	TĨNH	せい, じょう	しず-か	bình tĩnh, trấn tĩnh	争（あらそ）いが終（お）わると、空（そら）は青（あお）く、その場所（ばしょ）は静（しず）かになりました	Xung đột kết thúc, bầu trời trong xanh và nơi chốn trở nên tĩnh lặng.	https://www.vnjpclub.com/images/kanji512/bai26/quiet.jpg	6	26	2026-06-24 06:26:15.458	2026-06-24 06:26:15.458
407	公	CÔNG	こう, おおやけ	\N	công cộng, công thức, công tước	公衆（こうしゅう）のために働（はたら）くのは大変（たいへん）です	Làm việc vì công chúng rất vất vả.	https://www.vnjpclub.com/images/kanji512/bai26/public.jpg	7	26	2026-06-24 06:26:15.465	2026-06-24 06:26:15.465
408	園	VIÊN	えん, その	\N	vườn, điền viên, hoa viên, công viên	土曜日（どようび）に公園（こうえん）に踊（おど）りに行（い）きます	Thứ bảy đi công viên nhảy múa.	https://www.vnjpclub.com/images/kanji512/bai26/park.jpg	8	26	2026-06-24 06:26:15.479	2026-06-24 06:26:15.479
409	込	&lt;VÀO&gt;	\N	-, こ-む、こめ-る		たくさんの人（ひと）が入（はい）っていきます。中（なか）はきっと込（こ）んでいるでしょう	Nhiều người đang đi vào. Chắc bên trong đông đúc lắm.	https://www.vnjpclub.com/images/kanji512/bai26/crowd.jpg	9	26	2026-06-24 06:26:15.495	2026-06-24 06:26:15.495
410	連	LIÊN	れん	つら-なる、つ-れる	liên tục, liên lạc	目的（もくてき）地（ち）につながる道（みち）を運転（うんてん）していきました	Lái xe trên con đường nối với nơi đến.	https://www.vnjpclub.com/images/kanji512/bai26/link.jpg	10	26	2026-06-24 06:26:15.498	2026-06-24 06:26:15.498
411	窓	SONG	そう, まど, てんまど, けむだし	\N	cửa sổ	心（こころ）の窓（まど）を開（あ）けましょう	Chúng ta hãy mở cửa sổ tâm hồn ra!	https://www.vnjpclub.com/images/kanji512/bai26/window_counter.jpg	11	26	2026-06-24 06:26:15.512	2026-06-24 06:26:15.512
412	側	TRẮC	そく, かわ	\N	bên cạnh	お金（かね）とナイフをそばに置（お）きました	Để tiền và con dao bên cạnh.	https://www.vnjpclub.com/images/kanji512/bai26/side.jpg	12	26	2026-06-24 06:26:15.523	2026-06-24 06:26:15.523
413	葉	DIỆP	よう, は	\N	lá, lạc diệp, hồng diệp	世界（せかい）は草（くさ）や木（き）の葉（は）で覆（おお）われています	Thế giới bị phủ bởi cỏ và lá cây.	https://www.vnjpclub.com/images/kanji512/bai26/leaves.jpg	13	26	2026-06-24 06:26:15.543	2026-06-24 06:26:15.543
414	景	CẢNH	けい	\N	cảnh sắc, thắng cảnh, quang cảnh	天気（てんき）のいい日（ひ）は、京（きょう）の都（みやこ）がきれいに見（み）えます	Ngày trời （日）đẹp trông kinh thành（京） rất đẹp.	https://www.vnjpclub.com/images/kanji512/bai26/view.jpg	14	26	2026-06-24 06:26:15.556	2026-06-24 06:26:15.556
415	記	KÍ	き	しる-す	thư kí, kí sự, kí ức	あなたが言（い）ったことを書（か）き記（しる）しました	Tôi đã viết những điều anh nói.	https://www.vnjpclub.com/images/kanji512/bai26/write_down.jpg	15	26	2026-06-24 06:26:15.576	2026-06-24 06:26:15.576
416	形	HÌNH	けい, ぎょう, かた, かたち	\N	hình thức, hình hài, định hình	何（なに）か形（かたち）を作（つく）っています	Tôi đang tạo hình cái gì đó.	https://www.vnjpclub.com/images/kanji512/bai26/shape.jpg	16	26	2026-06-24 06:26:15.59	2026-06-24 06:26:15.59
417	吉	CÁT	きち, きつ	\N	tốt lành, cát tường	侍（さむらい）が「幸運（こううん）を祈（いの）る」と叫（さけ）びます	Võ sĩ đạo hét to: ”Chúc may mắn!”	https://www.vnjpclub.com/images/kanji512/bai27/goodluck.jpg	1	27	2026-06-24 06:26:15.613	2026-06-24 06:26:15.613
418	結	KẾT	けつ	むす-ぶ、ゆ-う	đoàn kết, kết thúc	糸（いと）を結（むす）んで、幸運（こううん）のお守（まも）りを作（つく）りました	Kết chỉ làm bùa may mắn.	https://www.vnjpclub.com/images/kanji512/bai27/to_tie.jpg	2	27	2026-06-24 06:26:15.626	2026-06-24 06:26:15.626
419	婚	HÔN	こん	\N	kết hôn, hôn nhân	女（おんな）の人（ひと）は結婚（けっこん）後（ご）、姓（せい）を変（か）えました	Phụ nữ đổi họ sau khi kết hôn.	https://www.vnjpclub.com/images/kanji512/bai27/marriage.jpg	3	27	2026-06-24 06:26:15.639	2026-06-24 06:26:15.639
420	共	CỘNG	きょう, とも	\N	tổng cộng, cộng sản, công cộng	あなたと共（とも）に	Cùng với bạn.	https://www.vnjpclub.com/images/kanji512/bai27/together.jpg	4	27	2026-06-24 06:26:15.661	2026-06-24 06:26:15.661
421	供	CUNG	きょう, く	そな-える、とも	cung cấp, cung phụng	一緒（いっしょ）にあなたを助（たす）けます	Cùng nhau giúp đỡ bạn.	https://www.vnjpclub.com/images/kanji512/bai27/offer.jpg	5	27	2026-06-24 06:26:15.682	2026-06-24 06:26:15.682
422	両	LƯỠNG	りょう, →兩［兩	\N	hai, lưỡng quốc	魚屋（さかなや）が両肩（りょうかた）にさおを担（かつ）いでいます	Người bán cá vác quang gánh trên cả hai vai.	https://www.vnjpclub.com/images/kanji512/bai27/both.jpg	6	27	2026-06-24 06:26:15.7	2026-06-24 06:26:15.7
423	若	NHƯỢC	じゃく, にゃく	わか-い、も-し	trẻ, nhược niên	出（で）たばかりの若葉（わかば）を右手（みぎて）で掴（つか）みます	Hái những chiếc lá non bằng tay phải.	https://www.vnjpclub.com/images/kanji512/bai27/young.jpg	7	27	2026-06-24 06:26:15.725	2026-06-24 06:26:15.725
424	老	LÃO	ろう	お-いる、ふ-ける	già, lão luyện	おじさんは杖（つえ）を持（も）って、おばあさんは座（すわ）っています	Ông lão cầm cây gậy còn bà lão thì đang ngồi.	https://www.vnjpclub.com/images/kanji512/bai27/old_age.jpg	8	27	2026-06-24 06:26:15.74	2026-06-24 06:26:15.74
425	息	TỨC	そく, いき	\N	con trai, tử tức	心臓（しんぞう）を動（うご）かすために行（い）きをしなくてはいけません	Phải thở để giữ cho trái tim đập.	https://www.vnjpclub.com/images/kanji512/bai27/breathe.jpg	9	27	2026-06-24 06:26:15.753	2026-06-24 06:26:15.753
426	娘	NƯƠNG	むすめ	-	cô nương	私（わたし）の娘（むすめ）はいい子（こ）です	Con gái tôi là một đứa con tốt （良）.	https://www.vnjpclub.com/images/kanji512/bai27/daughter.jpg	10	27	2026-06-24 06:26:15.772	2026-06-24 06:26:15.772
427	奥	ÁO	うう, →奧［奧	\N	trong cùng	米（こめ）を大（おお）きい箱（はこ）に入（い）れ、億（おく）にしまっていきます	Tôi bỏ gạo （米）vào trong cái hộp lớn （大）rồi cất nó vào trong góc.	https://www.vnjpclub.com/images/kanji512/bai27/back.jpg	11	27	2026-06-24 06:26:15.786	2026-06-24 06:26:15.786
428	将	TƯỚNG	しょう	まさ-に］ 今にも、助ける、養う→將［將	tướng quân	将軍（しょうぐん）が将来（しょうらい）について考（かんが）えています	Tướng quân đang suy nghĩ về tương lai.	https://www.vnjpclub.com/images/kanji512/bai27/commander.jpg	12	27	2026-06-24 06:26:15.797	2026-06-24 06:26:15.797
429	組	TỔ	そ	くみ、く-む	tổ hợp, tổ chức	先祖（せんぞ）の墓（はか）へ行（い）ってお供（そな）えをします	Đi đến mộ tổ tiên cúng kiến.	https://www.vnjpclub.com/images/kanji512/bai27/ancestor.jpg	13	27	2026-06-24 06:26:15.809	2026-06-24 06:26:15.809
430	育	DỤC	いく	そだ-つ	giáo dục, dưỡng dục	私（わたし）は月（つき）を見（み）ながら育（そだ）ちました	Tôi vừa ngắm trăng vừa lớn lên.	https://www.vnjpclub.com/images/kanji512/bai27/grew.jpg	14	27	2026-06-24 06:26:15.826	2026-06-24 06:26:15.826
431	性	TÍNH	せい, しょう, さが	\N	tính dục, giới tính, bản tính, tính chất	生（う）まれたときに、性別（せいべつ）がわかります	Giới tính sẽ được biết lúc sinh ra.	https://www.vnjpclub.com/images/kanji512/bai27/sex_character.jpg	15	27	2026-06-24 06:26:15.838	2026-06-24 06:26:15.838
432	招	CHIÊU	しょう	まね-く	chiêu đãi	食事（しょくじ）に招待（しょうたい）します	Tôi sẽ chiêu đãi bữa ăn.	https://www.vnjpclub.com/images/kanji512/bai27/invite.jpg	16	27	2026-06-24 06:26:15.86	2026-06-24 06:26:15.86
433	取	THỦ	しゅ	と-る	lấy, nhận	私（わたし）の耳（みみ）を取（と）らないでください	Đừng kéo tai tôi!	https://www.vnjpclub.com/images/kanji512/bai28/take.jpg	1	28	2026-06-24 06:26:15.871	2026-06-24 06:26:15.871
434	最	TỐI	さい	\N	nhất (tối cao, tối đa)	太陽（たいよう）を手（て）に取（と）ることは最（もっと）も難（むずか）しいことです	Bắt lấy ánh mặt trời là điều khó khăn nhất.	https://www.vnjpclub.com/images/kanji512/bai28/utmost.jpg	2	28	2026-06-24 06:26:15.875	2026-06-24 06:26:15.875
435	初	SƠ	しょ	し,はじ-め, はじ-めて, はつ, はつ-, うい-, -そ-める, -ぞ-め, はっ	sơ cấp	着物（きもの）を作（つく）るときは、はじめに布（ぬの）を刀（かたな）で切（き）ります	Khi làm kimono thì trước tiên sẽ cắt vải bằng dao.	https://www.vnjpclub.com/images/kanji512/bai28/first.jpg	3	28	2026-06-24 06:26:15.901	2026-06-24 06:26:15.901
436	番	PHIÊN	ばん	\N	thứ tự, phiên hiệu	順番（じゅんばん）に田（た）んぼの米（こめ）を収穫（しゅうかく）します	Thay phiên nhau gặt lúa trên đồng.	https://www.vnjpclub.com/images/kanji512/bai28/turn.jpg	4	28	2026-06-24 06:26:15.92	2026-06-24 06:26:15.92
437	歳	TUẾ	さい, せい, とし	\N	tuổi, năm, tuế nguyệt	私（わたし）が何歳（なんさい）か聞（き）くのはやめてください	Hãy thôi hỏi tôi bao nhiêu tuổi!	https://www.vnjpclub.com/images/kanji512/bai28/age.jpg	5	28	2026-06-24 06:26:15.953	2026-06-24 06:26:15.953
438	枚	MAI	まい	\N	tờ	木（き）から紙（かみ）を一枚（いちまい）作（つく）りました	Tôi đã làm một mảnh giấy từ cây.	https://www.vnjpclub.com/images/kanji512/bai28/sheet_of.jpg	6	28	2026-06-24 06:26:15.988	2026-06-24 06:26:15.988
439	冊	SÁCH	さつ, さく	\N	quyển sách	紙（かみ）を束（たば）ねて、一冊（いっさつ）の本（ほん）を作（つく）ります	Bó các tờ giấy làm thành một quyển sách.	https://www.vnjpclub.com/images/kanji512/bai28/counter%20for%20books.jpg	7	28	2026-06-24 06:26:16.005	2026-06-24 06:26:16.005
440	億	ỨC	おく	\N	trăm triệu	一億人（いちおくにん）の人（ひと）はそれぞれ番（つが）う意志（いし）があります	Một trăm triệu người có ý chí （意）khác nhau của riêng từng người.	https://www.vnjpclub.com/images/kanji512/bai28/hundred_million.jpg	8	28	2026-06-24 06:26:16.028	2026-06-24 06:26:16.028
441	点	ĐIỂM	てん	\N	điểm số, điểm hỏa	四（よっ）つの点（てん）が押（お）されました	Đã ấn dấu 4 điểm.	https://www.vnjpclub.com/images/kanji512/bai28/point_dot.jpg	9	28	2026-06-24 06:26:16.042	2026-06-24 06:26:16.042
442	階	GIAI	かい, きざはし	\N	giai cấp, giai tầng	皆（みな）、二階（にかい）立（だ）てバスの上（うえ）にいます	Mọi người （皆）đang ở trên xe buýt 2 tầng.	https://www.vnjpclub.com/images/kanji512/bai28/floor.jpg	10	28	2026-06-24 06:26:16.072	2026-06-24 06:26:16.072
443	段	ĐOẠN	だん	\N	giai đoạn	石（いし）で、階段（かいだん）を作（つく）っています	Làm cầu thang bằng đá.	https://www.vnjpclub.com/images/kanji512/bai28/stair.jpg	11	28	2026-06-24 06:26:16.081	2026-06-24 06:26:16.081
444	号	HIỆU	ごう	さけ-ぶ, よびな	phiên hiệu, tín hiệu, phù hiệu	大（おお）きい声（こえ）でばんごうを言（い）ってください	Hãy nói to con số của bạn!	https://www.vnjpclub.com/images/kanji512/bai28/number.jpg	12	28	2026-06-24 06:26:16.094	2026-06-24 06:26:16.094
445	倍	BỘI	ばい	\N	bội thu, bội số	背（せ）が高（たか）い人（ひと）の身長（しんちょう）は、背（せ）が低（ひく）い人（ひと）の二倍（にばい）あります	Chiều cao của người có dáng cao gấp đôi chiều cao của người thấp.	https://www.vnjpclub.com/images/kanji512/bai28/double.jpg	13	28	2026-06-24 06:26:16.113	2026-06-24 06:26:16.113
446	次	THỨ	じ, し	つぎ、つ-ぐ	thứ nam, thứ nữ	口（くち）を大（おお）きく開（あ）けて、「次（つぎ）！」と叫（さけ）びます	Há to miệng và hét lên: ”Kế tiếp!”	https://www.vnjpclub.com/images/kanji512/bai28/next.jpg	14	28	2026-06-24 06:26:16.124	2026-06-24 06:26:16.124
447	々	\N	\N	\N		これは繰（く）り返（かえ）しを表（あらわ）します	Ký hiệu này biểu thị sự lặp lại.	https://www.vnjpclub.com/images/kanji512/bai28/symbol_of_repetition.jpg	15	28	2026-06-24 06:26:16.145	2026-06-24 06:26:16.145
448	他	THA	た, ほか	\N	khác, tha hương, vị tha	サンリじゃなくて、他（た）のペットを飼（か）いたいです	Tôi muốn nuôi con thú cưng khác chứ không phải con bò cạp.	https://www.vnjpclub.com/images/kanji512/bai28/other.jpg	16	28	2026-06-24 06:26:16.163	2026-06-24 06:26:16.163
449	勝	THẮNG	しょう	か-つ、まさ-る	thắng lợi, thắng cảnh	勝（か）ったのは火曜日（かようび）ではなく月曜日（げつようび）です	Ngày thắng là thứ hai（月）, không phải thứ ba.	https://www.vnjpclub.com/images/kanji512/bai29/won.jpg	1	29	2026-06-24 06:26:16.184	2026-06-24 06:26:16.184
450	負	PHỤ	ふ	ま-ける, ま-かす, お-う	âm, mang, phụ thương, phụ trách	負（ま）けた人（ひと）がお金（かね）を払（はら）います	Người thua sẽ trả tiền.	https://www.vnjpclub.com/images/kanji512/bai29/defeat.jpg	2	29	2026-06-24 06:26:16.202	2026-06-24 06:26:16.202
451	賛	TÁN	さん	\N	tán đồng, tán thành	大（おお）きな会（かい）を持（も）ち帰（かえ）った夫（おっと）を、皆（みな）が賞（しょう）賛しました	Mọi người đã tán thưởng những người chồng （夫）mang chiếc vỏ sò lớn về nhà.	https://www.vnjpclub.com/images/kanji512/bai29/praised.jpg	3	29	2026-06-24 06:26:16.22	2026-06-24 06:26:16.22
452	成	THÀNH	せい, じょう	な-す	thành tựu, hoàn thành, trở thành	武器（ぶき）を使（つか）って、その使命（しめい）を成（な）し遂（と）げました	Tôi hoàn thành sứ mệnh bằng việc sử dụng vũ khí.	https://www.vnjpclub.com/images/kanji512/bai29/accomplished.jpg	4	29	2026-06-24 06:26:16.23	2026-06-24 06:26:16.23
453	絶	TUYỆT	ぜつ	た-える	đoạn tuyệt, tuyệt diệu	この色（いろ）の糸（いと）は、もう作（つく）られていません	Chỉ màu （色）này không được sản xuất nữa.	https://www.vnjpclub.com/images/kanji512/bai29/discontinue.jpg	5	29	2026-06-24 06:26:16.251	2026-06-24 06:26:16.251
454	対	ĐỐI	たい, つい	\N	đối diện, phản đối, đối với	私（わたし）はあなたに反対（はんたい）します	Tôi phản đối cậu.	https://www.vnjpclub.com/images/kanji512/bai29/oppose.jpg	6	29	2026-06-24 06:26:16.259	2026-06-24 06:26:16.259
455	続	TỤC	ぞく	つづ-く	tiếp tục	糸（いと）を売（う）り続（つづ）けます	Tôi tiếp tục bán（売）chỉ（糸）.	https://www.vnjpclub.com/images/kanji512/bai29/continue.jpg	7	29	2026-06-24 06:26:16.269	2026-06-24 06:26:16.269
456	辞	TỪ	じ	や-める	từ vựng, từ chức	千語（せんご）を辞書（じしょ）で調（しら）べるのはつらいです	Thật khổ sở （辛）để tra từ điển 1000 （千）từ.	https://www.vnjpclub.com/images/kanji512/bai29/word_toresign.jpg	8	29	2026-06-24 06:26:16.283	2026-06-24 06:26:16.283
457	投	ĐẦU	とう	な-げる	đầu tư, đầu cơ	手（て）で石（いし）を投（な）げます	Tôi ném đá bằng tay.	https://www.vnjpclub.com/images/kanji512/bai29/to_throw.jpg	9	29	2026-06-24 06:26:16.299	2026-06-24 06:26:16.299
458	選	TUYỂN	せん	えら-ぶ、え-る	tuyển chọn	みんなでリーダーを選（えら）ぼう	Tất cả mọi người cùng （共）chọn ra người lãnh đạo.	https://www.vnjpclub.com/images/kanji512/bai29/choose.jpg	10	29	2026-06-24 06:26:16.314	2026-06-24 06:26:16.314
459	約	ƯỚC	やく	\N	lời hứa (ước nguyện), ước tính	適当（てきとう）な量（りょう）の糸（いと）をつかんでください	Hãy nắm một lượng chỉ （糸）thích hợp.	https://www.vnjpclub.com/images/kanji512/bai29/to_promise_approximate.jpg	11	29	2026-06-24 06:26:16.327	2026-06-24 06:26:16.327
460	束	THÚC	そく, たば	\N	bó (hoa)	彼（かれ）が花束（はなたば）をくれました	Anh ấy cho tôi bó hoa.	https://www.vnjpclub.com/images/kanji512/bai29/bundle.jpg	12	29	2026-06-24 06:26:16.351	2026-06-24 06:26:16.351
461	守	THỦ	しゅ, す	まも-る	cố thủ, bảo thủ	この鍵（かぎ）が家（いえ）を守（まも）ります	Chiếc chìa khoá này sẽ bảo vệ ngôi nhà.	https://www.vnjpclub.com/images/kanji512/bai29/protect.jpg	13	29	2026-06-24 06:26:16.369	2026-06-24 06:26:16.369
462	過	QUA, QUÁ	か	あやま-ち、す-ぎる	thông qua; quá khứ, quá độ	その道（みち）の大（おお）きな建物（たてもの）を通（とお）り過（す）ぎてください	Hãy đi qua toà nhà lớn ở con đường kia.	https://www.vnjpclub.com/images/kanji512/bai29/pass.jpg	14	29	2026-06-24 06:26:16.392	2026-06-24 06:26:16.392
463	夢	MỘNG	む, ゆめ	\N	mơ	夕方（ゆうがた）、草原（そうげん）の夢（ゆめ）を見（み）ました	Tôi đã thấy một giấc mơ về thảo nguyên vào buổi chiều tà.	https://www.vnjpclub.com/images/kanji512/bai29/dream.jpg	15	29	2026-06-24 06:26:16.398	2026-06-24 06:26:16.398
464	的	ĐÍCH	てき, まと	\N	mục đích, đích thực	白（しろ）い的（まと）です	Đó là tấm bia để bắn màu trắng （白）.	https://www.vnjpclub.com/images/kanji512/bai29/target.jpg	16	29	2026-06-24 06:26:16.408	2026-06-24 06:26:16.408
465	飛	PHI	ひ	あす,と-ぶ, と-ばす, -と-ばす, とび	bay, phi công, phi hành	鳥（とり）が羽（はね）を広（ひろ）げて飛（と）んでいます	Những con chim dang rộng cánh bay.	https://www.vnjpclub.com/images/kanji512/bai30/fly.jpg	1	30	2026-06-24 06:26:16.431	2026-06-24 06:26:16.431
466	機	CƠ	き, はた	\N	cơ khí, thời cơ, phi cơ	糸（いと）から布（ぬの）を織（お）るのに、木（き）の機械（きかい）を使（つか）いました	Đã sử dụng máy gỗ để dệt vải từ sợi.	https://www.vnjpclub.com/images/kanji512/bai30/machine_occasion.jpg	2	30	2026-06-24 06:26:16.436	2026-06-24 06:26:16.436
467	失	THẤT	しつ	うしな-う	thất nghiệp, thất bại	夫（おっと）が仕事（しごと）を失（うしな）って泣（な）いています	Chồng tôi đang khóc vì mất việc .	https://www.vnjpclub.com/images/kanji512/bai30/lost.jpg	3	30	2026-06-24 06:26:16.454	2026-06-24 06:26:16.454
468	鉄	THIẾT	てつ, →銕［夷	\N	sắt, thiết đạo, thiết giáp	鉄（てつ）は金（きん）に比（くら）べて価値（かち）を失（うしな）いました	Sắt mất （失）giá trị so với vàng（金）.	https://www.vnjpclub.com/images/kanji512/bai30/iron.jpg	4	30	2026-06-24 06:26:16.458	2026-06-24 06:26:16.458
469	速	TỐC	そく	はや-い	tốc độ, tăng tốc	私（わたし）は花束（はなたば）を速（すみ）やかに届（とど）けます	Tôi sẽ nhanh chóng giao bó hoa đến.	https://www.vnjpclub.com/images/kanji512/bai30/quickly.jpg	5	30	2026-06-24 06:26:16.467	2026-06-24 06:26:16.467
470	遅	TRÌ	ち	じ,おく-れる, おく-らす, おそ-い	muộn	羊（ひつじ）は休（やす）んでいたため、遅（おく）れてしまいました	Vì con cừu nghỉ ngơi nên đã bị trễ.	https://www.vnjpclub.com/images/kanji512/bai30/late.jpg	6	30	2026-06-24 06:26:16.475	2026-06-24 06:26:16.475
471	駐	TRÚ	ちゅう	\N	đồn trú	主人（しゅじん）と馬（うま）がここにいます	Ông chủ và con ngựa đang ở đây.	https://www.vnjpclub.com/images/kanji512/bai30/to_stay.jpg	7	30	2026-06-24 06:26:16.476	2026-06-24 06:26:16.476
472	泊	BẠC	はく	と-まる	ngủ lại	海辺（うみべ）の白（しろ）いホテルに泊（と）まりました	Tôi đã trọ ở khách sạn màu trắng ở cạnh bãi biển.	https://www.vnjpclub.com/images/kanji512/bai30/to_stay_over.jpg	8	30	2026-06-24 06:26:16.483	2026-06-24 06:26:16.483
473	船	THUYỀN	せん, ふな, ふね	\N	thuyền	この船（ふね）は八人（はちにん）乗（の）れるそうです	Nghe nói con tàu này có thể chở 8 người.	https://www.vnjpclub.com/images/kanji512/bai30/ship.jpg	9	30	2026-06-24 06:26:16.487	2026-06-24 06:26:16.487
474	座	TỌA	ざ	すわ-る	chỗ ngồi, tọa đàm, tọa độ	二人（ふたり）の人（ひと）が土（つち）の上（うえ）に座（すわ）ります	Hai người ngồi trên đất.	https://www.vnjpclub.com/images/kanji512/bai30/sit.jpg	10	30	2026-06-24 06:26:16.508	2026-06-24 06:26:16.508
475	席	TỊCH	せき	\N	chủ tịch, xuất tịch (tham gia)	この店（みせ）には21の席（せき）があります	Ở cửa hàng có 21 chỗ ngồi.	https://www.vnjpclub.com/images/kanji512/bai30/seats.jpg	11	30	2026-06-24 06:26:16.523	2026-06-24 06:26:16.523
476	島	ĐẢO	とう, しま］ →嶋嶌［鳥	\N	hải đảo	鳥（とり）が島（しま）にある山（やま）の上（うえ）で休（やす）んでいます	Con chim （鳥）đang nghỉ trên ngọn núi （山）ở đảo.	https://www.vnjpclub.com/images/kanji512/bai30/island.jpg	12	30	2026-06-24 06:26:16.54	2026-06-24 06:26:16.54
477	陸	LỤC	りく	\N	lục địa, lục quân	ここにはバス停（てい）しかありません	Ở chỗ này chỉ có trạm xe buýt.	https://www.vnjpclub.com/images/kanji512/bai30/land1.jpg	13	30	2026-06-24 06:26:16.566	2026-06-24 06:26:16.566
478	港	CẢNG	こう, みなと	\N	hải cảng, không cảng	みんなで港（みなと）に集（あつ）まりましょう	Tất cả chúng ta hãy tập hợp ở cảng.	https://www.vnjpclub.com/images/kanji512/bai30/port.jpg	14	30	2026-06-24 06:26:16.588	2026-06-24 06:26:16.588
479	橋	KIỀU	きょう, はし	\N	cây cầu	木（き）でできた橋（はし）と建物（たてもの）です	Toà nhà và cầu xây bằng gỗ （木）.	https://www.vnjpclub.com/images/kanji512/bai30/bridge.jpg	15	30	2026-06-24 06:26:16.6	2026-06-24 06:26:16.6
480	交	GIAO	こう	まじ-わる	giao hảo, giao hoán	父（ちち）が交差点（こうさてん）を渡（わた）っています	Ba tôi đang băng qua giao lộ.	https://www.vnjpclub.com/images/kanji512/bai30/crossing.jpg	16	30	2026-06-24 06:26:16.61	2026-06-24 06:26:16.61
481	申	THÂN	しん	もう-す、さる	thân thỉnh (xin)	雷（かみなり）が「私（わたし）は雷（かみなり）と申（もう）します」と言（い）いました	Sấm sét đã nói là ”Tôi tên là Sấm Sét”.	https://www.vnjpclub.com/images/kanji512/bai31/tell.jpg	1	31	2026-06-24 06:26:16.623	2026-06-24 06:26:16.623
482	神	THẦN	しん, じん, かみ, かん, こう	\N	thần, thần thánh, thần dược	雷（かみなり）の上（かみ）佐多（さた）にお供（そな）えをします	Cúng bái với Thần Sấm.	https://www.vnjpclub.com/images/kanji512/bai31/god.jpg	2	31	2026-06-24 06:26:16.627	2026-06-24 06:26:16.627
483	様	DẠNG	よう, さま	\N	đa dạng, hình dạng	木（き）、羊（ひつじ）、水（みず）のある喉（のど）かな様子（ようす）です	Cái cây, con cừu, dòng nước tạo ra dáng vẻ thanh bình.	https://www.vnjpclub.com/images/kanji512/bai31/situation.jpg	3	31	2026-06-24 06:26:16.649	2026-06-24 06:26:16.649
484	信	TÍN	しん, まこと	\N	uy tín, tín thác, thư tín	人（ひと）の言（い）うことを信（しん）じます	Tin những gì mọi người nói.	https://www.vnjpclub.com/images/kanji512/bai31/believe.jpg	4	31	2026-06-24 06:26:16.667	2026-06-24 06:26:16.667
485	調	ĐIỀU, ĐIỆU	ちょう	しら-べる、ととの-える	điều tra, điều hòa; thanh điệu, giai điệu	周（まわ）りを調査（ちょうさ）うすと言（い）っています	Họ bảo sẽ điều tra xung quanh.	https://www.vnjpclub.com/images/kanji512/bai31/to_investigate_tone.jpg	5	31	2026-06-24 06:26:16.685	2026-06-24 06:26:16.685
486	査	TRA	さ	\N	điều tra	木（き）の下（した）の墓石（ぼせき）を調査（ちょうさ）しました	Đã kiểm tra bia mộ dưới cái cây.	https://www.vnjpclub.com/images/kanji512/bai31/inspect.jpg	6	31	2026-06-24 06:26:16.7	2026-06-24 06:26:16.7
487	相	TƯƠNG, TƯỚNG	そう, しょう, あい	\N	tương hỗ, tương tự, tương đương; thủ tướng	木（き）を見（み）てください。木（き）とあなたは向（む）かい合（あ）っています	Hãy nhìn cái cây! Cái cây và bạn đang đối mặt nhau.	https://www.vnjpclub.com/images/kanji512/bai31/each_other.jpg	7	31	2026-06-24 06:26:16.719	2026-06-24 06:26:16.719
488	談	ĐÀM	だん	\N	hội đàm, đàm thoại	火（ひ）のそばで話（はな）しましょう	Chúng ta hãy trò chuyện bên đống lửa（火）	https://www.vnjpclub.com/images/kanji512/bai31/talk.jpg	8	31	2026-06-24 06:26:16.741	2026-06-24 06:26:16.741
489	案	ÁN	あん	あん、あん-ずる	luận án, đề án	木（き）のそばで心（こころ）やすらかに案（あん）を立（た）てました	Bên gốc cây tôi bình tâm lập bản thảo.	https://www.vnjpclub.com/images/kanji512/bai31/plan.jpg	9	31	2026-06-24 06:26:16.762	2026-06-24 06:26:16.762
490	内	NỘI	ない, だい, うち	\N	nội thành, nội bộ	人（ひと）が大（おお）きい箱（はこ）の中（なか）に入（はい）ります	Một người đi vào trong cái hộp lớn.	https://www.vnjpclub.com/images/kanji512/bai31/inside.jpg	10	31	2026-06-24 06:26:16.782	2026-06-24 06:26:16.782
491	君	QUÂN	くん, きみ	\N	quân chủ, quân vương	王様（おうさま）は杖（つえ）と口（くち）で命令（めいれい）します	Nhà vua ra lệnh bằng cây trượng và miệng.	https://www.vnjpclub.com/images/kanji512/bai31/lord.jpg	11	31	2026-06-24 06:26:16.81	2026-06-24 06:26:16.81
492	達	ĐẠT	たつ	\N	đạt tới, điều đạt, thành đạt	土（つち）を積（つ）んだ羊（ひつじ）が、やっと到着（とうちゃく）しました	Con cừu（羊） chở đất （土）cuối cùng đã đến nơi.	https://www.vnjpclub.com/images/kanji512/bai31/to_reach.jpg	12	31	2026-06-24 06:26:16.82	2026-06-24 06:26:16.82
493	星	TINH	せい, しょう, ほし	\N	hành tinh, tinh tú	星（ほし）は太陽（たいよう）から生（う）まれたと思（おも）いますか	Bạn có nghĩ rằng ngôi sao （生）được sinh ra từ mặt trời （日）không?	https://www.vnjpclub.com/images/kanji512/bai31/star.jpg	13	31	2026-06-24 06:26:16.835	2026-06-24 06:26:16.835
494	雪	TUYẾT	せつ	ゆき、すす-ぐ	tuyết	「雨（あめ）？」「いいえ、触（さわ）ってみて、雪（ゆき）だよ」	”Mưa （雨）à?” ”Không phải, sờ thử xem, là tuyết đấy!”	https://www.vnjpclub.com/images/kanji512/bai31/snow.jpg	14	31	2026-06-24 06:26:16.864	2026-06-24 06:26:16.864
495	降	GIÁNG, HÀNG	こう	お-りる、ふ-る	giáng trần; đầu hàng	そのバス停（てい）で降（お）ります	Xuống ở trạm xe buýt đó.	https://www.vnjpclub.com/images/kanji512/bai31/get_off_to_descend.jpg	15	31	2026-06-24 06:26:16.889	2026-06-24 06:26:16.889
496	直	TRỰC	ちょく, じき	ただ-ちに、なお-す	trực tiếp, chính trực	「ほら、壊（こわ）れているよ」「直（なお）そう」	”Nhìn kìa, nó bị hư đấy!” ”Chúng ta hãy sửa nó đi!”	https://www.vnjpclub.com/images/kanji512/bai31/fix_direct.jpg	16	31	2026-06-24 06:26:16.905	2026-06-24 06:26:16.905
497	危	NGUY	き	あや-うい、あぶ-ない	nguy hiểm, nguy cơ	崖（がけ）の上（うえ）の石（いし）を見（み）てください。危険（きけん）です	Hãy nhìn hòn đá trên dốc đứng kia! Thật nguy hiểm!	https://www.vnjpclub.com/images/kanji512/bai32/dangerous.jpg	1	32	2026-06-24 06:26:16.921	2026-06-24 06:26:16.921
498	険	HIỂM	けん	けわ-しい	nguy hiểm, mạo hiểm, hiểm ác	人（ひと）が険（けわ）しい山（やま）を見（み）ています	Một người đang ngắm ngọn núi hiểm trở.	https://www.vnjpclub.com/images/kanji512/bai32/steep.jpg	2	32	2026-06-24 06:26:16.942	2026-06-24 06:26:16.942
499	拾	THẬP	しゅう, じゅう	ひろ-う	nhặt	ごみ箱（ばこ）から、一万（いちまん）円（えん）を拾（ひろ）いました	Tôi đã nhặt tờ 10000 yên tờ sọt rác.	https://www.vnjpclub.com/images/kanji512/bai32/pickup.jpg	3	32	2026-06-24 06:26:16.964	2026-06-24 06:26:16.964
500	捨	XẢ	しゃ	す-てる	vứt	土曜日（どようび）にごみを捨（す）てます	Vứt rác vào thứ bảy.	https://www.vnjpclub.com/images/kanji512/bai32/throw_away.jpg	4	32	2026-06-24 06:26:16.972	2026-06-24 06:26:16.972
501	戻	LỆ	れい	もど-る	quay lại	彼（かれ）は大（おお）きくなって戻（もど）り、今（いま）、戸（と）の前（まえ）にいます	Anh ấy đã lớn lên và trở về, bây giờ đang ở trước cửa.	https://www.vnjpclub.com/images/kanji512/bai32/to_return.jpg	5	32	2026-06-24 06:26:16.984	2026-06-24 06:26:16.984
502	吸	HẤP	きゅう	す-う	hô hấp, hấp thu	煙草（たばこ）の煙（けむり）を吸（す）い込（こ）みます	Hít khói thuốc vào.	https://www.vnjpclub.com/images/kanji512/bai32/inhale.jpg	6	32	2026-06-24 06:26:16.992	2026-06-24 06:26:16.992
503	放	PHÓNG	ほう	はな-す、ほう-る	giải phóng, phóng hỏa, phóng lao	旗（はた）の下（した）で解放（かいほう）されました	Được giải phóng dưới lá cờ.	https://www.vnjpclub.com/images/kanji512/bai32/release.jpg	7	32	2026-06-24 06:26:17.003	2026-06-24 06:26:17.003
504	変	BIẾN	へん	か-わる	biến đổi, biến thiên	彼（かれ）は変（へん）な服（ふく）を着（き）ています	Anh ta mặc trang phục kỳ quái.	https://www.vnjpclub.com/images/kanji512/bai32/change_weird.jpg	8	32	2026-06-24 06:26:17.024	2026-06-24 06:26:17.024
505	歯	XỈ	し, は	\N	răng	話（はな）すのを止（と）めて、歯（は）でご飯（はん）をよくかみましょう	Chúng ta hãy ngừng （止）nói chuyện và nhai kỹ cơm （米）bằng răng.	https://www.vnjpclub.com/images/kanji512/bai32/tooth.jpg	9	32	2026-06-24 06:26:17.041	2026-06-24 06:26:17.041
506	髪	PHÁT	はつ, がた, かみ, ひげ	\N	tóc	友達（ともだち）は髪（かみ）が長（なが）いです	Bạn tôi （友）có mái tóc dài（長）.	https://www.vnjpclub.com/images/kanji512/bai32/hair.jpg	10	32	2026-06-24 06:26:17.058	2026-06-24 06:26:17.058
507	絵	HỘI	かい, え, え］ 絵画(かいが)→繪［會	\N	hội họa	会（あ）って、ししゅうでこの絵（え）を作（つく）ります	Gặp nhau và thêu nên bức tranh này.	https://www.vnjpclub.com/images/kanji512/bai32/picture1.jpg	11	32	2026-06-24 06:26:17.093	2026-06-24 06:26:17.093
508	横	HOÀNH	うう, よこ	\N	tung hoành, hoành độ, hoành hành	子（こ）どもたちが木（き）の横（よこ）の箱（はこ）の中（なか）で遊（あそ）んでいます	Bọn trẻ đang chơi bên trong cái hộp ở cạnh gốc cây.	https://www.vnjpclub.com/images/kanji512/bai32/beside.jpg	12	32	2026-06-24 06:26:17.123	2026-06-24 06:26:17.123
509	当	ĐƯƠNG, ĐÁNG	とう	あ-たる	chính đáng; đương thời, tương đương	矢（や）が的（まと）に当（あ）たりました	Mũi tên đã trúng đích.	https://www.vnjpclub.com/images/kanji512/bai32/to_hit.jpg	13	32	2026-06-24 06:26:17.139	2026-06-24 06:26:17.139
510	伝	TRUYỀN, TRUYỆN	でん	つた-える］ 口で取り次ぐ→傳［專	truyền đạt, truyền động; tự truyện	二人（ふたり）の人（ひと）がメッセージを伝（つた）えます	Hai （二）người truyền tải thông điệp.	https://www.vnjpclub.com/images/kanji512/bai32/to_convey.jpg	14	32	2026-06-24 06:26:17.16	2026-06-24 06:26:17.16
511	細	TẾ	さい	ほそ-い、こま-かい	tinh tế, tường tế, tế bào	田（た）んぼの稲（いね）は糸（いと）のように細（ほそ）いです	Lúa trên đồng （田）mảnh như sợi chỉ（糸）.	https://www.vnjpclub.com/images/kanji512/bai32/thin.jpg	15	32	2026-06-24 06:26:17.185	2026-06-24 06:26:17.185
512	無	VÔ	む, ぶ	な-い	hư vô, vô ý nghĩa	火事（かじ）で家（いえ）が焼（や）け、すべてなくなりました	Trong cơn hoả hoạn căn nhà bị cháy không còn lại gì.	https://www.vnjpclub.com/images/kanji512/bai32/none.jpg	16	32	2026-06-24 06:26:17.203	2026-06-24 06:26:17.203
\.


--
-- Data for Name: KanjiLesson; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."KanjiLesson" (id, "lessonNumber", title, "jlptLevel", "createdAt", "updatedAt") FROM stdin;
1	1	Bài 1	N5	2026-06-24 06:26:08.517	2026-06-24 06:26:08.517
2	2	Bài 2	N5	2026-06-24 06:26:08.821	2026-06-24 06:26:08.821
3	3	Bài 3	N5	2026-06-24 06:26:09.132	2026-06-24 06:26:09.132
4	4	Bài 4	N5	2026-06-24 06:26:09.348	2026-06-24 06:26:09.348
5	5	Bài 5	N5	2026-06-24 06:26:09.566	2026-06-24 06:26:09.566
6	6	Bài 6	N5	2026-06-24 06:26:09.734	2026-06-24 06:26:09.734
7	7	Bài 7	N5	2026-06-24 06:26:09.956	2026-06-24 06:26:09.956
8	8	Bài 8	N5	2026-06-24 06:26:10.231	2026-06-24 06:26:10.231
9	9	Bài 9	N5	2026-06-24 06:26:10.43	2026-06-24 06:26:10.43
10	10	Bài 10	N5	2026-06-24 06:26:10.754	2026-06-24 06:26:10.754
11	11	Bài 11	N4	2026-06-24 06:26:11.051	2026-06-24 06:26:11.051
12	12	Bài 12	N4	2026-06-24 06:26:11.357	2026-06-24 06:26:11.357
13	13	Bài 13	N4	2026-06-24 06:26:11.643	2026-06-24 06:26:11.643
14	14	Bài 14	N4	2026-06-24 06:26:12.038	2026-06-24 06:26:12.038
15	15	Bài 15	N4	2026-06-24 06:26:12.343	2026-06-24 06:26:12.343
16	16	Bài 16	N4	2026-06-24 06:26:12.692	2026-06-24 06:26:12.692
17	17	Bài 17	N4	2026-06-24 06:26:12.968	2026-06-24 06:26:12.968
18	18	Bài 18	N4	2026-06-24 06:26:13.381	2026-06-24 06:26:13.381
19	19	Bài 19	N4	2026-06-24 06:26:13.707	2026-06-24 06:26:13.707
20	20	Bài 20	N4	2026-06-24 06:26:13.942	2026-06-24 06:26:13.942
21	21	Bài 21	N3	2026-06-24 06:26:14.259	2026-06-24 06:26:14.259
22	22	Bài 22	N3	2026-06-24 06:26:14.475	2026-06-24 06:26:14.475
23	23	Bài 23	N3	2026-06-24 06:26:14.683	2026-06-24 06:26:14.683
24	24	Bài 24	N3	2026-06-24 06:26:14.903	2026-06-24 06:26:14.903
25	25	Bài 25	N3	2026-06-24 06:26:15.149	2026-06-24 06:26:15.149
26	26	Bài 26	N3	2026-06-24 06:26:15.425	2026-06-24 06:26:15.425
27	27	Bài 27	N3	2026-06-24 06:26:15.61	2026-06-24 06:26:15.61
28	28	Bài 28	N3	2026-06-24 06:26:15.868	2026-06-24 06:26:15.868
29	29	Bài 29	N3	2026-06-24 06:26:16.181	2026-06-24 06:26:16.181
30	30	Bài 30	N3	2026-06-24 06:26:16.43	2026-06-24 06:26:16.43
31	31	Bài 31	N3	2026-06-24 06:26:16.621	2026-06-24 06:26:16.621
32	32	Bài 32	N3	2026-06-24 06:26:16.917	2026-06-24 06:26:16.917
\.


--
-- Data for Name: KanjiVocab; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."KanjiVocab" (id, word, reading, "meaningVi", "kanjiEntryId", "createdAt", "updatedAt") FROM stdin;
1	一本	いっぽん	Số 1	1	2026-06-24 06:26:08.526	2026-06-24 06:26:08.526
2	一	ひと	1 giờ	1	2026-06-24 06:26:08.532	2026-06-24 06:26:08.532
3	一分	いっぷん	1 phút	1	2026-06-24 06:26:08.535	2026-06-24 06:26:08.535
4	一月	いちがつ	Tháng 1	1	2026-06-24 06:26:08.537	2026-06-24 06:26:08.537
5	一日	いちにち	1 ngày	1	2026-06-24 06:26:08.539	2026-06-24 06:26:08.539
6	一日	ついたち	Ngày mồng 1	1	2026-06-24 06:26:08.542	2026-06-24 06:26:08.542
7	一人	ひとり	1 người	1	2026-06-24 06:26:08.545	2026-06-24 06:26:08.545
8	一番	いちばん	Thứ nhất, đầu tiên	1	2026-06-24 06:26:08.548	2026-06-24 06:26:08.548
9	二本	にほん	Số 2	2	2026-06-24 06:26:08.552	2026-06-24 06:26:08.552
10	二	ふた	2 giờ	2	2026-06-24 06:26:08.554	2026-06-24 06:26:08.554
11	二月	にがつ	Tháng 2	2	2026-06-24 06:26:08.557	2026-06-24 06:26:08.557
12	二人	ふたり	2 người	2	2026-06-24 06:26:08.559	2026-06-24 06:26:08.559
13	二日	ふつか	2 ngày, ngày mồng 2	2	2026-06-24 06:26:08.562	2026-06-24 06:26:08.562
14	二十日	はつか	20 ngày, ngày 20	2	2026-06-24 06:26:08.565	2026-06-24 06:26:08.565
15	二十歳	はたち	20 tuổi	2	2026-06-24 06:26:08.568	2026-06-24 06:26:08.568
16	二十歳	にじゅっさい	20 tuổi	2	2026-06-24 06:26:08.57	2026-06-24 06:26:08.57
17	三本	さんぼん	Số 3	3	2026-06-24 06:26:08.577	2026-06-24 06:26:08.577
18	三	みっ	3 giờ	3	2026-06-24 06:26:08.58	2026-06-24 06:26:08.58
19	三月	さんがつ	Tháng 3	3	2026-06-24 06:26:08.583	2026-06-24 06:26:08.583
20	三日	みっか	3 ngày, ngày mồng 3	3	2026-06-24 06:26:08.585	2026-06-24 06:26:08.585
21	三人	さんにん	3 người	3	2026-06-24 06:26:08.587	2026-06-24 06:26:08.587
22	三歳	さんさい	3 tuổi	3	2026-06-24 06:26:08.589	2026-06-24 06:26:08.589
23	三日月	みかづき	Trăng khuyết	3	2026-06-24 06:26:08.591	2026-06-24 06:26:08.591
24	四角	しかく	Số 4	4	2026-06-24 06:26:08.596	2026-06-24 06:26:08.596
25	四	し	Số 4	4	2026-06-24 06:26:08.599	2026-06-24 06:26:08.599
26	四	よっ	4 giờ	4	2026-06-24 06:26:08.601	2026-06-24 06:26:08.601
27	四月	しがつ	Tháng 4	4	2026-06-24 06:26:08.602	2026-06-24 06:26:08.602
28	四日	よっか	4 ngày, ngày mồng 4	4	2026-06-24 06:26:08.604	2026-06-24 06:26:08.604
29	四人	よにん	4 người	4	2026-06-24 06:26:08.606	2026-06-24 06:26:08.606
30	四年生	よねんせい	học sinh năm 4	4	2026-06-24 06:26:08.608	2026-06-24 06:26:08.608
31	四歳	よんさい	4 tuổi	4	2026-06-24 06:26:08.61	2026-06-24 06:26:08.61
32	五本	ごほん	Số 5	5	2026-06-24 06:26:08.616	2026-06-24 06:26:08.616
33	五	いつ	5 giờ	5	2026-06-24 06:26:08.618	2026-06-24 06:26:08.618
34	五月	ごがつ	Tháng 5	5	2026-06-24 06:26:08.62	2026-06-24 06:26:08.62
35	五日	いつか	5 ngày, ngày mồng 5	5	2026-06-24 06:26:08.622	2026-06-24 06:26:08.622
36	五年	ごねん	5 năm	5	2026-06-24 06:26:08.624	2026-06-24 06:26:08.624
37	五人	ごにん	5 người	5	2026-06-24 06:26:08.626	2026-06-24 06:26:08.626
38	五歳	ごさい	5 tuổi	5	2026-06-24 06:26:08.629	2026-06-24 06:26:08.629
39	中国	ちゅうごく	SỐ 6	6	2026-06-24 06:26:08.634	2026-06-24 06:26:08.634
40	六	むっ	Số 600	6	2026-06-24 06:26:08.636	2026-06-24 06:26:08.636
41	六時	ろくじ	6 giờ	6	2026-06-24 06:26:08.638	2026-06-24 06:26:08.638
42	六分	ろっぷん	6 phút	6	2026-06-24 06:26:08.64	2026-06-24 06:26:08.64
43	六月	ろくがつ	tháng 6	6	2026-06-24 06:26:08.642	2026-06-24 06:26:08.642
44	六日	むいか	6 ngày, ngày mồng 6	6	2026-06-24 06:26:08.645	2026-06-24 06:26:08.645
45	六人	ろくにん	6 người	6	2026-06-24 06:26:08.648	2026-06-24 06:26:08.648
46	七	しち	Số 7	7	2026-06-24 06:26:08.653	2026-06-24 06:26:08.653
47	七	なな	7 giờ	7	2026-06-24 06:26:08.655	2026-06-24 06:26:08.655
48	七分	ななふん	7 phút	7	2026-06-24 06:26:08.656	2026-06-24 06:26:08.656
49	七月	しちがつ	tháng 7	7	2026-06-24 06:26:08.658	2026-06-24 06:26:08.658
50	七日	なのか	7 ngày, tháng 7	7	2026-06-24 06:26:08.661	2026-06-24 06:26:08.661
51	七人	ななにん	7 người	7	2026-06-24 06:26:08.664	2026-06-24 06:26:08.664
52	七夕	たなばた	Lễ hội tanabata ( lễ hội ngưu lang chức nữ)	7	2026-06-24 06:26:08.667	2026-06-24 06:26:08.667
53	八	はち	Số 8	8	2026-06-24 06:26:08.672	2026-06-24 06:26:08.672
54	八	やっ	Số 800	8	2026-06-24 06:26:08.674	2026-06-24 06:26:08.674
55	八時	はちじ	8 giờ	8	2026-06-24 06:26:08.676	2026-06-24 06:26:08.676
56	八月	はちがつ	Tháng 8	8	2026-06-24 06:26:08.679	2026-06-24 06:26:08.679
57	八日	ようか	8 ngày, ngày mồng 8	8	2026-06-24 06:26:08.682	2026-06-24 06:26:08.682
58	八人	はちにん	8 người	8	2026-06-24 06:26:08.684	2026-06-24 06:26:08.684
59	八歳	はっさい	8 tuổi	8	2026-06-24 06:26:08.685	2026-06-24 06:26:08.685
60	回	かい	Cửa hàng rau	9	2026-06-24 06:26:08.688	2026-06-24 06:26:08.688
61	九	きゅう	Số 9	9	2026-06-24 06:26:08.69	2026-06-24 06:26:08.69
62	九	く	Số 9	9	2026-06-24 06:26:08.692	2026-06-24 06:26:08.692
63	九	ここの	9 giờ	9	2026-06-24 06:26:08.693	2026-06-24 06:26:08.693
64	九月	くがつ	Tháng 9	9	2026-06-24 06:26:08.695	2026-06-24 06:26:08.695
65	九日	ここのか	9 ngày, ngày mồng 9	9	2026-06-24 06:26:08.697	2026-06-24 06:26:08.697
66	九年	きゅうねん	9 năm	9	2026-06-24 06:26:08.699	2026-06-24 06:26:08.699
67	九歳	きゅうさい	9 tuổi	9	2026-06-24 06:26:08.701	2026-06-24 06:26:08.701
68	九人	きゅうにん	9 người	9	2026-06-24 06:26:08.702	2026-06-24 06:26:08.702
69	常	じょう	Số 10	10	2026-06-24 06:26:08.705	2026-06-24 06:26:08.705
70	十	とお	10 cái	10	2026-06-24 06:26:08.706	2026-06-24 06:26:08.706
71	十時	じゅうじ	10 giờ	10	2026-06-24 06:26:08.708	2026-06-24 06:26:08.708
72	十分	じっぷん	10 phút	10	2026-06-24 06:26:08.709	2026-06-24 06:26:08.709
73	十分	じゅっぷん	10 phút	10	2026-06-24 06:26:08.711	2026-06-24 06:26:08.711
74	十月	じゅうがつ	Tháng 10	10	2026-06-24 06:26:08.713	2026-06-24 06:26:08.713
75	十日	とおか	10 ngày, ngày 10	10	2026-06-24 06:26:08.715	2026-06-24 06:26:08.715
76	十人	じゅうにん	10 người	10	2026-06-24 06:26:08.716	2026-06-24 06:26:08.716
77	十歳	じっさい	10 tuổi	10	2026-06-24 06:26:08.718	2026-06-24 06:26:08.718
78	十分	じゅうぶん	Đầy đủ	10	2026-06-24 06:26:08.72	2026-06-24 06:26:08.72
79	度	ど	Số 100	11	2026-06-24 06:26:08.723	2026-06-24 06:26:08.723
80	二百	にひゃく	Số 200	11	2026-06-24 06:26:08.725	2026-06-24 06:26:08.725
81	三百	さんびゃく	Số 300	11	2026-06-24 06:26:08.726	2026-06-24 06:26:08.726
82	六百	ろっぴゃく	Số 600	11	2026-06-24 06:26:08.73	2026-06-24 06:26:08.73
83	八百	はっぴゃく	Số 800	11	2026-06-24 06:26:08.732	2026-06-24 06:26:08.732
84	八百屋	やおや	Cửa hàng rau	11	2026-06-24 06:26:08.734	2026-06-24 06:26:08.734
85	百科	ひゃっか	Từ điển bách khoa	11	2026-06-24 06:26:08.736	2026-06-24 06:26:08.736
86	百貨店	ひゃっかてん	Cửa hàng bách hóa	11	2026-06-24 06:26:08.738	2026-06-24 06:26:08.738
87	十	じゅう	Nghìn, ngàn, đơn vị đếm	12	2026-06-24 06:26:08.742	2026-06-24 06:26:08.742
88	二千	にせん	Số 2000	12	2026-06-24 06:26:08.745	2026-06-24 06:26:08.745
89	三千	さんぜん	Số 3000	12	2026-06-24 06:26:08.747	2026-06-24 06:26:08.747
90	八千	はっせん	Số 8000	12	2026-06-24 06:26:08.749	2026-06-24 06:26:08.749
91	千円	せんえん	1000 yên	12	2026-06-24 06:26:08.751	2026-06-24 06:26:08.751
92	千年	せんねん	1000 năm, năm 1000	12	2026-06-24 06:26:08.753	2026-06-24 06:26:08.753
93	千人	せんにん	1000 người	12	2026-06-24 06:26:08.755	2026-06-24 06:26:08.755
94	千葉県	ちばけん	Tỉnh Chiba	12	2026-06-24 06:26:08.757	2026-06-24 06:26:08.757
95	一万	いちまん	Số 10000	13	2026-06-24 06:26:08.762	2026-06-24 06:26:08.762
96	十万	じゅうまん	Số 100000	13	2026-06-24 06:26:08.765	2026-06-24 06:26:08.765
97	百万	ひゃくまん	Triệu, trăm vạn	13	2026-06-24 06:26:08.767	2026-06-24 06:26:08.767
98	万年筆	まんねんひつ	Bút máy	13	2026-06-24 06:26:08.769	2026-06-24 06:26:08.769
99	万歳	ばんざい	Hoan hô, chào mừng, vạn tuế	13	2026-06-24 06:26:08.771	2026-06-24 06:26:08.771
100	万一	まんいち	Vạn bất đắt dĩ, ít cơ hội, ít khả năng	13	2026-06-24 06:26:08.773	2026-06-24 06:26:08.773
101	円	えん	100 yên	14	2026-06-24 06:26:08.777	2026-06-24 06:26:08.777
102	円	えん	yên	14	2026-06-24 06:26:08.781	2026-06-24 06:26:08.781
103	円	まる	Hình tròn	14	2026-06-24 06:26:08.783	2026-06-24 06:26:08.783
104	丸	まる	việc đồng yên lên giá	14	2026-06-24 06:26:08.785	2026-06-24 06:26:08.785
105	円安	えんやす	Đồng Yên hạ giá	14	2026-06-24 06:26:08.786	2026-06-24 06:26:08.786
106	楕円	だえん	Hình bầu dục	14	2026-06-24 06:26:08.788	2026-06-24 06:26:08.788
107	円満	えんまん	sự viên mãn, sự đầy đủ, sự trọn vẹn, êm đẹp	14	2026-06-24 06:26:08.79	2026-06-24 06:26:08.79
108	口	くち	Môi, miệng	15	2026-06-24 06:26:08.794	2026-06-24 06:26:08.794
109	入口	いりぐち	Lối vào	15	2026-06-24 06:26:08.796	2026-06-24 06:26:08.796
110	出口	でぐち	Lối ra	15	2026-06-24 06:26:08.798	2026-06-24 06:26:08.798
111	人口	じんこう	Dân số	15	2026-06-24 06:26:08.8	2026-06-24 06:26:08.8
112	北口	きたぐち	Cửa phía bắc	15	2026-06-24 06:26:08.801	2026-06-24 06:26:08.801
113	中央	ちゅうおう	Cửa trung tâm	15	2026-06-24 06:26:08.803	2026-06-24 06:26:08.803
114	窓口	まどぐち	Cửa bán vé	15	2026-06-24 06:26:08.805	2026-06-24 06:26:08.805
115	口調	くちょう	Giọng điệu	15	2026-06-24 06:26:08.806	2026-06-24 06:26:08.806
116	目	め	Mắt	16	2026-06-24 06:26:08.81	2026-06-24 06:26:08.81
117	一日	いちにち	ngày thứ nhất	16	2026-06-24 06:26:08.812	2026-06-24 06:26:08.812
118	目的	もくてき	Mục đích	16	2026-06-24 06:26:08.814	2026-06-24 06:26:08.814
119	科目	かもく	Môn học	16	2026-06-24 06:26:08.816	2026-06-24 06:26:08.816
120	目次	もくじ	Mục lục	16	2026-06-24 06:26:08.817	2026-06-24 06:26:08.817
121	注目	ちゅうもく	Chú ý	16	2026-06-24 06:26:08.819	2026-06-24 06:26:08.819
122	日	ひ	Chủ nhật	17	2026-06-24 06:26:08.825	2026-06-24 06:26:08.825
123	日本	にほん	Nhật Bản	17	2026-06-24 06:26:08.826	2026-06-24 06:26:08.826
124	日本	にっぽん	Nhật Bản	17	2026-06-24 06:26:08.829	2026-06-24 06:26:08.829
125	今日	きょう	Hôm nay	17	2026-06-24 06:26:08.831	2026-06-24 06:26:08.831
126	三日	みっか	3 ngày, ngày mồng 3	17	2026-06-24 06:26:08.832	2026-06-24 06:26:08.832
127	毎日	まいにち	thường ngày, mỗi ngày, hàng ngày	17	2026-06-24 06:26:08.834	2026-06-24 06:26:08.834
128	日記	にっき	Nhật kí	17	2026-06-24 06:26:08.836	2026-06-24 06:26:08.836
129	母	はは	Ngày của mẹ	17	2026-06-24 06:26:08.838	2026-06-24 06:26:08.838
130	休日	きゅうじつ	Ngày nghỉ	17	2026-06-24 06:26:08.84	2026-06-24 06:26:08.84
131	三日	みっか	tháng giêng	18	2026-06-24 06:26:08.844	2026-06-24 06:26:08.844
132	月曜日	げつようび	Thứ 2	18	2026-06-24 06:26:08.847	2026-06-24 06:26:08.847
133	今月	こんげつ	Tháng này	18	2026-06-24 06:26:08.849	2026-06-24 06:26:08.849
134	月	つき	Mặt trăng	18	2026-06-24 06:26:08.851	2026-06-24 06:26:08.851
135	一	いっ	1 tháng	18	2026-06-24 06:26:08.853	2026-06-24 06:26:08.853
136	毎月	まいつき	hàng tháng, mỗi tháng	18	2026-06-24 06:26:08.855	2026-06-24 06:26:08.855
137	来月	らいげつ	Tháng sau	18	2026-06-24 06:26:08.857	2026-06-24 06:26:08.857
138	正月	しょうがつ	Tết	18	2026-06-24 06:26:08.858	2026-06-24 06:26:08.858
139	火	ひ	Thứ 3	19	2026-06-24 06:26:08.863	2026-06-24 06:26:08.863
140	火	ひ	Lửa	19	2026-06-24 06:26:08.865	2026-06-24 06:26:08.865
141	火事	かじ	Vụ cháy	19	2026-06-24 06:26:08.867	2026-06-24 06:26:08.867
142	火山	かざん	Núi lửa	19	2026-06-24 06:26:08.869	2026-06-24 06:26:08.869
143	花火	はなび	Pháo hoa	19	2026-06-24 06:26:08.871	2026-06-24 06:26:08.871
144	火星	かせい	Sao hỏa	19	2026-06-24 06:26:08.873	2026-06-24 06:26:08.873
145	消火器	しょうかき	Dụng cụ chữa cháy	19	2026-06-24 06:26:08.875	2026-06-24 06:26:08.875
146	火災	かさい	Hỏa hoạn	19	2026-06-24 06:26:08.878	2026-06-24 06:26:08.878
147	滝	たき	Thứ 4	20	2026-06-24 06:26:08.884	2026-06-24 06:26:08.884
148	水	みず	Nước	20	2026-06-24 06:26:08.887	2026-06-24 06:26:08.887
149	水泳	すいえい	Bơi lội	20	2026-06-24 06:26:08.89	2026-06-24 06:26:08.89
150	水道	すいどう	Nước máy	20	2026-06-24 06:26:08.892	2026-06-24 06:26:08.892
151	海水浴	かいすいよく	Việc tắm biẻn	20	2026-06-24 06:26:08.895	2026-06-24 06:26:08.895
152	水着	みずぎ	Áo tắm	20	2026-06-24 06:26:08.897	2026-06-24 06:26:08.897
153	香水	こうすい	Nước hoa	20	2026-06-24 06:26:08.9	2026-06-24 06:26:08.9
154	鼻水	はなみず	Nước mũi	20	2026-06-24 06:26:08.902	2026-06-24 06:26:08.902
155	木	き	Thứ 5	21	2026-06-24 06:26:08.906	2026-06-24 06:26:08.906
156	木	き	Cái cây	21	2026-06-24 06:26:08.907	2026-06-24 06:26:08.907
157	木綿	もめん	bông, cốt tông, cô-tông	21	2026-06-24 06:26:08.909	2026-06-24 06:26:08.909
158	木村	きむら	Sao mộc	21	2026-06-24 06:26:08.912	2026-06-24 06:26:08.912
159	大木	たいぼく	Cây cổ thụ	21	2026-06-24 06:26:08.921	2026-06-24 06:26:08.921
160	材木	ざいもく	Gỗ, đồ mộc	21	2026-06-24 06:26:08.926	2026-06-24 06:26:08.926
161	木陰	こかげ	bóng râm	21	2026-06-24 06:26:08.932	2026-06-24 06:26:08.932
162	山	やま	Thứ 6	22	2026-06-24 06:26:08.949	2026-06-24 06:26:08.949
163	金	かね	Tiền	22	2026-06-24 06:26:08.953	2026-06-24 06:26:08.953
164	金持	かねも	Tiền cước, tiền thù lao	22	2026-06-24 06:26:08.958	2026-06-24 06:26:08.958
165	奨学金	しょうがくきん	Học bổng	22	2026-06-24 06:26:08.962	2026-06-24 06:26:08.962
166	現金	げんきん	Tiền mặt	22	2026-06-24 06:26:08.965	2026-06-24 06:26:08.965
167	税金	ぜいきん	thuế, tiền thuế	22	2026-06-24 06:26:08.969	2026-06-24 06:26:08.969
168	土	つち	Thứ 7	23	2026-06-24 06:26:08.976	2026-06-24 06:26:08.976
169	土	つち	Đất	23	2026-06-24 06:26:08.98	2026-06-24 06:26:08.98
170	土産	みやげ	Quà lưu niệm	23	2026-06-24 06:26:08.984	2026-06-24 06:26:08.984
171	土地	とち	Đất đai, lãnh thổ	23	2026-06-24 06:26:08.987	2026-06-24 06:26:08.987
172	土星	どせい	Sao thổ	23	2026-06-24 06:26:08.989	2026-06-24 06:26:08.989
173	粘土	ねんど	Đất sét	23	2026-06-24 06:26:08.991	2026-06-24 06:26:08.991
174	土台	どだい	nền tảng, cơ sở, nền, móng	23	2026-06-24 06:26:08.994	2026-06-24 06:26:08.994
175	土足	どそく	Nghiêm cấm chân bẩn	23	2026-06-24 06:26:08.996	2026-06-24 06:26:08.996
176	週	しゅう	Chủ nhật	24	2026-06-24 06:26:09	2026-06-24 06:26:09
177	月曜日	げつようび	Thứ hai	24	2026-06-24 06:26:09.002	2026-06-24 06:26:09.002
178	火曜日	かようび	Thứ ba	24	2026-06-24 06:26:09.004	2026-06-24 06:26:09.004
179	水曜日	すいようび	Thứ tư	24	2026-06-24 06:26:09.009	2026-06-24 06:26:09.009
180	木曜日	もくようび	Thứ năm	24	2026-06-24 06:26:09.013	2026-06-24 06:26:09.013
181	金曜日	きんようび	Thứ sáu	24	2026-06-24 06:26:09.016	2026-06-24 06:26:09.016
182	土曜日	どようび	Thứ bảy	24	2026-06-24 06:26:09.02	2026-06-24 06:26:09.02
183	曜日	ようび	Ngày trong tuần	24	2026-06-24 06:26:09.022	2026-06-24 06:26:09.022
184	木	き	Sách	25	2026-06-24 06:26:09.026	2026-06-24 06:26:09.026
185	日本	にほん	Nhật bản	25	2026-06-24 06:26:09.028	2026-06-24 06:26:09.028
186	日本	にっぽん	Nhật bản	25	2026-06-24 06:26:09.03	2026-06-24 06:26:09.03
187	一本	いっぽん	1 chai, 1 ly, 1 cây, … (đếm vật dài)	25	2026-06-24 06:26:09.032	2026-06-24 06:26:09.032
188	二本	にほん	2 chai, 2 ly, 2 cây …	25	2026-06-24 06:26:09.033	2026-06-24 06:26:09.033
189	三本	さんぼん	3 chai, 3 ly, 3 cây …	25	2026-06-24 06:26:09.034	2026-06-24 06:26:09.034
190	日本語	にほんご	Tiếng Nhật	25	2026-06-24 06:26:09.036	2026-06-24 06:26:09.036
191	人	ひと	Người	26	2026-06-24 06:26:09.038	2026-06-24 06:26:09.038
192	日本人	にほんじん	Người Nhật	26	2026-06-24 06:26:09.04	2026-06-24 06:26:09.04
193	一人	ひとり	1 người	26	2026-06-24 06:26:09.041	2026-06-24 06:26:09.041
194	二人	ふたり	2 người	26	2026-06-24 06:26:09.043	2026-06-24 06:26:09.043
195	三人	さんにん	3 người	26	2026-06-24 06:26:09.045	2026-06-24 06:26:09.045
196	一人	ひとり	người lớn, người trưởng thành	26	2026-06-24 06:26:09.047	2026-06-24 06:26:09.047
197	女	おんな	Người phụ nữ	26	2026-06-24 06:26:09.049	2026-06-24 06:26:09.049
198	今	いま	Bây giờ, hiện tại	27	2026-06-24 06:26:09.052	2026-06-24 06:26:09.052
199	今月	こんげつ	Tháng này	27	2026-06-24 06:26:09.053	2026-06-24 06:26:09.053
200	今日	きょう	Hôm nay	27	2026-06-24 06:26:09.055	2026-06-24 06:26:09.055
201	今晩	こんばん	Tối nay	27	2026-06-24 06:26:09.056	2026-06-24 06:26:09.056
202	今週	こんしゅう	Tuần này	27	2026-06-24 06:26:09.057	2026-06-24 06:26:09.057
203	今年	ことし	Năm nay	27	2026-06-24 06:26:09.058	2026-06-24 06:26:09.058
204	今朝	けさ	Sáng nay	27	2026-06-24 06:26:09.06	2026-06-24 06:26:09.06
205	今度	こんど	Lần này	27	2026-06-24 06:26:09.062	2026-06-24 06:26:09.062
206	土	つち	Chùa	28	2026-06-24 06:26:09.066	2026-06-24 06:26:09.066
207	寺院	じいん	Tu viện, thiền lâm	28	2026-06-24 06:26:09.067	2026-06-24 06:26:09.067
208	山寺	やまでら	Tu viện trên núi	28	2026-06-24 06:26:09.068	2026-06-24 06:26:09.068
209	清水寺	きよみずでら	Chùa Kyomizu	28	2026-06-24 06:26:09.07	2026-06-24 06:26:09.07
210	金閣寺	きんかくじ	Chùa Kinkaku (chùa vàng)	28	2026-06-24 06:26:09.071	2026-06-24 06:26:09.071
211	昔	むかし	1 giờ	29	2026-06-24 06:26:09.075	2026-06-24 06:26:09.075
212	時々	ときどき	Thỉnh thoảng	29	2026-06-24 06:26:09.077	2026-06-24 06:26:09.077
213	時間	じかん	Thời gian	29	2026-06-24 06:26:09.079	2026-06-24 06:26:09.079
214	一時間	いちじかん	1 tiếng	29	2026-06-24 06:26:09.081	2026-06-24 06:26:09.081
215	時計	とけい	Đồng hồ	29	2026-06-24 06:26:09.083	2026-06-24 06:26:09.083
216	時	とき	Lúc ấy	29	2026-06-24 06:26:09.085	2026-06-24 06:26:09.085
217	時代	じだい	Thời đại	29	2026-06-24 06:26:09.086	2026-06-24 06:26:09.086
218	時刻表	じこくひょう	Bảng hướng dẫn thời gian (lịch trình), bảng tra giờ tàu (xe…)	29	2026-06-24 06:26:09.088	2026-06-24 06:26:09.088
219	三本	さんぼん	3 giờ rưỡi	30	2026-06-24 06:26:09.091	2026-06-24 06:26:09.091
220	半分	はんぶん	Một nửa	30	2026-06-24 06:26:09.093	2026-06-24 06:26:09.093
221	半島	はんとう	Bán đảo	30	2026-06-24 06:26:09.096	2026-06-24 06:26:09.096
222	半年	はんとし	Nửa năm	30	2026-06-24 06:26:09.098	2026-06-24 06:26:09.098
223	前半	ぜんはん	nửa đầu, hiệp một	30	2026-06-24 06:26:09.1	2026-06-24 06:26:09.1
224	半額	はんがく	Nửa gía	30	2026-06-24 06:26:09.102	2026-06-24 06:26:09.102
225	刀	かたな	Cây đao, kiếm	31	2026-06-24 06:26:09.106	2026-06-24 06:26:09.106
226	日本刀	にほんとう	Kiếm Nhật	31	2026-06-24 06:26:09.108	2026-06-24 06:26:09.108
227	短刀	たんとう	Cây đao ngắn ( Đoản dao)	31	2026-06-24 06:26:09.11	2026-06-24 06:26:09.11
228	刀	かたな	5 phút	32	2026-06-24 06:26:09.115	2026-06-24 06:26:09.115
229	十分	じっぷん	10 phút	32	2026-06-24 06:26:09.117	2026-06-24 06:26:09.117
230	十分	じゅっぷん	10 phút	32	2026-06-24 06:26:09.119	2026-06-24 06:26:09.119
231	半分	はんぶん	1 nửa	32	2026-06-24 06:26:09.121	2026-06-24 06:26:09.121
232	分	わ	Tự mình	32	2026-06-24 06:26:09.123	2026-06-24 06:26:09.123
233	気分	きぶん	Tâm tư, tinh thần	32	2026-06-24 06:26:09.126	2026-06-24 06:26:09.126
234	十分	じゅうぶん	Đủ	32	2026-06-24 06:26:09.129	2026-06-24 06:26:09.129
235	線	せん	Phía trên	33	2026-06-24 06:26:09.137	2026-06-24 06:26:09.137
236	上	あ	Giỏi	33	2026-06-24 06:26:09.14	2026-06-24 06:26:09.14
237	上着	うわぎ	Áo khoác ngoài	33	2026-06-24 06:26:09.142	2026-06-24 06:26:09.142
238	川上	かわかみ	Thượng nguồn	33	2026-06-24 06:26:09.145	2026-06-24 06:26:09.145
239	屋上	おくじょう	Tầng thượng	33	2026-06-24 06:26:09.147	2026-06-24 06:26:09.147
240	線	せん	Phía dưới	34	2026-06-24 06:26:09.152	2026-06-24 06:26:09.152
241	下	さ	Đàu điện ngầm	34	2026-06-24 06:26:09.154	2026-06-24 06:26:09.154
242	下手	へた	Lên xuống, dao động	34	2026-06-24 06:26:09.155	2026-06-24 06:26:09.155
243	下	お	Hạ nguồn, hạ lưu	34	2026-06-24 06:26:09.157	2026-06-24 06:26:09.157
244	円	えん	Bên trong	35	2026-06-24 06:26:09.162	2026-06-24 06:26:09.162
245	中国	ちゅうごく	Trung Quốc, tên một hòn đảo phía Tây Nam Nhật Bản.	35	2026-06-24 06:26:09.164	2026-06-24 06:26:09.164
246	一年中	いちねんじゅう	Suốt 1 năm	35	2026-06-24 06:26:09.166	2026-06-24 06:26:09.166
247	中学校	ちゅうがっこう	Trường trung học cơ sở	35	2026-06-24 06:26:09.168	2026-06-24 06:26:09.168
248	世界	せかい	Trên khắp thế giới	35	2026-06-24 06:26:09.17	2026-06-24 06:26:09.17
249	背中	せなか	Cái lưng	35	2026-06-24 06:26:09.172	2026-06-24 06:26:09.172
250	中止	ちゅうし	Ngừng, đình chỉ	35	2026-06-24 06:26:09.173	2026-06-24 06:26:09.173
251	中級	ちゅうきゅう	Trình độ trung cấp	35	2026-06-24 06:26:09.175	2026-06-24 06:26:09.175
252	煙草	たばこ	Bên ngoài	36	2026-06-24 06:26:09.18	2026-06-24 06:26:09.18
253	外国	がいこく	Nước ngoài	36	2026-06-24 06:26:09.183	2026-06-24 06:26:09.183
254	外国	がいこく	Người ngoại quốc	36	2026-06-24 06:26:09.185	2026-06-24 06:26:09.185
255	外	ほか	Hải ngoại, ngước ngoài	36	2026-06-24 06:26:09.187	2026-06-24 06:26:09.187
256	意外	いがい	Ngoại khoa	36	2026-06-24 06:26:09.189	2026-06-24 06:26:09.189
257	右手	みぎて	Bên phải	37	2026-06-24 06:26:09.193	2026-06-24 06:26:09.193
258	右手	みぎて	Tay phải	37	2026-06-24 06:26:09.196	2026-06-24 06:26:09.196
259	右足	みぎあし	Chân phải	37	2026-06-24 06:26:09.198	2026-06-24 06:26:09.198
260	右側	みぎがわ	Phía bên phải	37	2026-06-24 06:26:09.2	2026-06-24 06:26:09.2
261	左右	さゆう	Trái phải	37	2026-06-24 06:26:09.201	2026-06-24 06:26:09.201
262	右翼	うよく	Cánh phải	37	2026-06-24 06:26:09.203	2026-06-24 06:26:09.203
263	名人	めいじん	Nhà máy, công trường	38	2026-06-24 06:26:09.207	2026-06-24 06:26:09.207
264	工業	こうぎょう	Ngành công nghiệp	38	2026-06-24 06:26:09.209	2026-06-24 06:26:09.209
265	工事	こうじ	Công trường xây dựng	38	2026-06-24 06:26:09.211	2026-06-24 06:26:09.211
266	大工	だいく	Thợ mộc	38	2026-06-24 06:26:09.213	2026-06-24 06:26:09.213
267	工夫	くふう	Đào sâu nghiên cứu, công phu	38	2026-06-24 06:26:09.215	2026-06-24 06:26:09.215
268	工学	こうがく	Môn kỹ thuật công nghệ	38	2026-06-24 06:26:09.217	2026-06-24 06:26:09.217
269	細工	さいく	Tác phẩm, sự chế tác	38	2026-06-24 06:26:09.219	2026-06-24 06:26:09.219
270	人工的	じんこうてき	Nhân tạo	38	2026-06-24 06:26:09.221	2026-06-24 06:26:09.221
271	右	みぎ	Bên trái	39	2026-06-24 06:26:09.225	2026-06-24 06:26:09.225
272	左手	ひだりて	Tay trái	39	2026-06-24 06:26:09.227	2026-06-24 06:26:09.227
273	左側	ひだりがわ	Phía bên trái	39	2026-06-24 06:26:09.23	2026-06-24 06:26:09.23
274	左右	さゆう	Trái phải	39	2026-06-24 06:26:09.232	2026-06-24 06:26:09.232
275	左翼	さよく	Cánh trái	39	2026-06-24 06:26:09.234	2026-06-24 06:26:09.234
276	月	つき	Phía trước	40	2026-06-24 06:26:09.238	2026-06-24 06:26:09.238
277	午前	ごぜん	Sáng (từ 0-12h, a.m)	40	2026-06-24 06:26:09.24	2026-06-24 06:26:09.24
278	午前中	ごぜんちゅう	Trong suốt buổi sáng	40	2026-06-24 06:26:09.241	2026-06-24 06:26:09.241
279	名前	なまえ	Tên	40	2026-06-24 06:26:09.244	2026-06-24 06:26:09.244
280	三年前	さんねんまえ	3 năm trước	40	2026-06-24 06:26:09.246	2026-06-24 06:26:09.246
281	前売	まえう	Vé bán trước	40	2026-06-24 06:26:09.249	2026-06-24 06:26:09.249
282	前半	ぜんはん	Nửa trước	40	2026-06-24 06:26:09.251	2026-06-24 06:26:09.251
283	道	みち	Sau giờ học	41	2026-06-24 06:26:09.255	2026-06-24 06:26:09.255
284	後	あと	Sáng (từ 0-12h, a.m)	41	2026-06-24 06:26:09.256	2026-06-24 06:26:09.256
285	最後	さいご	Cuối cùng	41	2026-06-24 06:26:09.258	2026-06-24 06:26:09.258
286	後半	こうはん	Nửa sau	41	2026-06-24 06:26:09.259	2026-06-24 06:26:09.259
287	漢字	かんじ	Sáng (từ 0-12h, a.m)	42	2026-06-24 06:26:09.263	2026-06-24 06:26:09.263
288	午後	ごご	Chiều (từ 13-23h, p.m)	42	2026-06-24 06:26:09.265	2026-06-24 06:26:09.265
289	午前中	ごぜんちゅう	Trong suốt buổi sáng	42	2026-06-24 06:26:09.266	2026-06-24 06:26:09.266
290	正午	しょうご	Buổi trưa	42	2026-06-24 06:26:09.268	2026-06-24 06:26:09.268
291	門	もん	Cổng	43	2026-06-24 06:26:09.271	2026-06-24 06:26:09.271
292	専門	せんもん	Chuyên môn	43	2026-06-24 06:26:09.272	2026-06-24 06:26:09.272
293	正門	せいもん	Cổng chính	43	2026-06-24 06:26:09.274	2026-06-24 06:26:09.274
294	部門	ぶもん	Bộ phận	43	2026-06-24 06:26:09.275	2026-06-24 06:26:09.275
295	入門	にゅうもん	Nhập môn, mới học	43	2026-06-24 06:26:09.277	2026-06-24 06:26:09.277
296	門松	かどまつ	Cây thông ngày Tết	43	2026-06-24 06:26:09.28	2026-06-24 06:26:09.28
297	名門	めいもん	Gia đình quyền quý	43	2026-06-24 06:26:09.282	2026-06-24 06:26:09.282
298	門	もん	Ở giữa, trong khoảng	44	2026-06-24 06:26:09.285	2026-06-24 06:26:09.285
299	時間	じかん	Thời gian	44	2026-06-24 06:26:09.286	2026-06-24 06:26:09.286
300	二時間	にじかん	2 tiếng	44	2026-06-24 06:26:09.288	2026-06-24 06:26:09.288
301	一週間	いっしゅうかん	1 tuần	44	2026-06-24 06:26:09.289	2026-06-24 06:26:09.289
302	間	ま	Nhân gian, con người	44	2026-06-24 06:26:09.291	2026-06-24 06:26:09.291
303	世間	せけん	Thế gian	44	2026-06-24 06:26:09.292	2026-06-24 06:26:09.292
304	日	ひ	Phía đông	45	2026-06-24 06:26:09.297	2026-06-24 06:26:09.297
305	東口	ひがしぐち	Cửa phía đông	45	2026-06-24 06:26:09.299	2026-06-24 06:26:09.299
306	中東	ちゅうとう	Trung đông	45	2026-06-24 06:26:09.301	2026-06-24 06:26:09.301
307	東京	とうきょう	Tokyo	45	2026-06-24 06:26:09.302	2026-06-24 06:26:09.302
308	関東	かんとう	Khu vực Kantou	45	2026-06-24 06:26:09.304	2026-06-24 06:26:09.304
309	東洋	とうよう	Phương Đông	45	2026-06-24 06:26:09.305	2026-06-24 06:26:09.305
310	東海	とうかい	Vùng Tokai	45	2026-06-24 06:26:09.307	2026-06-24 06:26:09.307
311	東北	とうほく	Vùng Tohoku	45	2026-06-24 06:26:09.309	2026-06-24 06:26:09.309
312	四	よっ	Phía Tây	46	2026-06-24 06:26:09.313	2026-06-24 06:26:09.313
313	西口	にしぐち	Cửa phía Tây	46	2026-06-24 06:26:09.315	2026-06-24 06:26:09.315
314	北西	ほくせい	Tây Bắc	46	2026-06-24 06:26:09.316	2026-06-24 06:26:09.316
315	南西	なんせい	Tây nam	46	2026-06-24 06:26:09.317	2026-06-24 06:26:09.317
316	西洋	せいよう	Tây Âu, phương Tây	46	2026-06-24 06:26:09.319	2026-06-24 06:26:09.319
317	関西	かんさい	Khu vực Kansai	46	2026-06-24 06:26:09.32	2026-06-24 06:26:09.32
318	東西	とうざい	Đông tây	46	2026-06-24 06:26:09.322	2026-06-24 06:26:09.322
319	大西洋	たいせいよう	Đại Tây Dương	46	2026-06-24 06:26:09.324	2026-06-24 06:26:09.324
320	二	ふた	Phiá Nam	47	2026-06-24 06:26:09.327	2026-06-24 06:26:09.327
321	南口	みなみぐち	Cửa phía Nam	47	2026-06-24 06:26:09.329	2026-06-24 06:26:09.329
322	東南	とうなん	Đông nam	47	2026-06-24 06:26:09.331	2026-06-24 06:26:09.331
323	南北	なんぼく	Tây nam	47	2026-06-24 06:26:09.332	2026-06-24 06:26:09.332
324	南米	なんべい	Nam mỹ	47	2026-06-24 06:26:09.333	2026-06-24 06:26:09.333
325	南極	なんきょく	Nam cực	47	2026-06-24 06:26:09.335	2026-06-24 06:26:09.335
326	北	きた	Phía Bắc	48	2026-06-24 06:26:09.337	2026-06-24 06:26:09.337
327	北口	きたぐち	Cửa Bắc	48	2026-06-24 06:26:09.338	2026-06-24 06:26:09.338
328	北東	ほくとう	Đông Bắc	48	2026-06-24 06:26:09.34	2026-06-24 06:26:09.34
329	東北	とうほく	Vùng Tohoku	48	2026-06-24 06:26:09.341	2026-06-24 06:26:09.341
330	北海道	ほっかいどう	Hokkaido	48	2026-06-24 06:26:09.342	2026-06-24 06:26:09.342
331	南北	なんぼく	Nam Bắc	48	2026-06-24 06:26:09.344	2026-06-24 06:26:09.344
332	北極	ほっきょく	Bắc cực	48	2026-06-24 06:26:09.346	2026-06-24 06:26:09.346
333	田	た	Miền quê, quê nhà	49	2026-06-24 06:26:09.35	2026-06-24 06:26:09.35
334	田	た	Ruộng lúa nước	49	2026-06-24 06:26:09.352	2026-06-24 06:26:09.352
335	田園	でんえん	Vùng nông thôn	49	2026-06-24 06:26:09.353	2026-06-24 06:26:09.353
336	筋肉	きんにく	Sức mạnh	50	2026-06-24 06:26:09.356	2026-06-24 06:26:09.356
337	学力	がくりょく	Học lực, sự hiểu biết	50	2026-06-24 06:26:09.357	2026-06-24 06:26:09.357
338	電力	でんりょく	Điện năng, điện lực	50	2026-06-24 06:26:09.359	2026-06-24 06:26:09.359
339	重力	じゅうりょく	Trọng lực, sức nặng	50	2026-06-24 06:26:09.36	2026-06-24 06:26:09.36
340	協力	きょうりょく	Nỗ lực	50	2026-06-24 06:26:09.362	2026-06-24 06:26:09.362
341	力学	りきがく	Động lực học, cơ học	50	2026-06-24 06:26:09.364	2026-06-24 06:26:09.364
342	視力	しりょく	Thị lực	50	2026-06-24 06:26:09.365	2026-06-24 06:26:09.365
343	男	おとこ	Bé trai	51	2026-06-24 06:26:09.368	2026-06-24 06:26:09.368
344	男	おとこ	Người đàn ông	51	2026-06-24 06:26:09.37	2026-06-24 06:26:09.37
345	男性	だんせい	Nam giới	51	2026-06-24 06:26:09.371	2026-06-24 06:26:09.371
346	男子	だんし	Học sinh nam	51	2026-06-24 06:26:09.372	2026-06-24 06:26:09.372
347	長男	ちょうなん	Trưởng nam	51	2026-06-24 06:26:09.373	2026-06-24 06:26:09.373
348	女	おんな	Bé gái	52	2026-06-24 06:26:09.376	2026-06-24 06:26:09.376
349	女	おんな	Người phụ nữ	52	2026-06-24 06:26:09.378	2026-06-24 06:26:09.378
350	女性	じょせい	Nữ giới	52	2026-06-24 06:26:09.38	2026-06-24 06:26:09.38
351	長女	ちょうじょ	Trưởng nữ	52	2026-06-24 06:26:09.382	2026-06-24 06:26:09.382
352	少女	しょうじょ	Thiếu nữ, cô gái	52	2026-06-24 06:26:09.383	2026-06-24 06:26:09.383
353	彼女	かのじょ	Cô ấy, bạn gái	52	2026-06-24 06:26:09.384	2026-06-24 06:26:09.384
354	女房	にょうぼう	Vợ	52	2026-06-24 06:26:09.386	2026-06-24 06:26:09.386
355	女神	めがみ	Nữ thần	52	2026-06-24 06:26:09.387	2026-06-24 06:26:09.387
356	子	こ	Bé gái	53	2026-06-24 06:26:09.39	2026-06-24 06:26:09.39
357	男	おとこ	Bé trai	53	2026-06-24 06:26:09.392	2026-06-24 06:26:09.392
358	子供	こども	Trẻ con, con cái	53	2026-06-24 06:26:09.394	2026-06-24 06:26:09.394
359	電子	でんし	Từ điển điện tử	53	2026-06-24 06:26:09.396	2026-06-24 06:26:09.396
360	女子学生	じょしがくせい	Học sinh nữ	53	2026-06-24 06:26:09.399	2026-06-24 06:26:09.399
361	男子学生	だんしがくせい	Học sinh nam	53	2026-06-24 06:26:09.4	2026-06-24 06:26:09.4
362	様子	ようす	Thái độ, trạng thái	53	2026-06-24 06:26:09.402	2026-06-24 06:26:09.402
363	子	こ	Học sinh	54	2026-06-24 06:26:09.406	2026-06-24 06:26:09.406
364	大学	だいがく	Đại học	54	2026-06-24 06:26:09.408	2026-06-24 06:26:09.408
365	学校	がっこう	Trường học	54	2026-06-24 06:26:09.41	2026-06-24 06:26:09.41
366	学部	がくぶ	Khoa	54	2026-06-24 06:26:09.413	2026-06-24 06:26:09.413
367	学習	がくしゅう	Học tập	54	2026-06-24 06:26:09.415	2026-06-24 06:26:09.415
368	学者	がくしゃ	Học giả	54	2026-06-24 06:26:09.417	2026-06-24 06:26:09.417
369	文学	ぶんがく	Văn học	54	2026-06-24 06:26:09.419	2026-06-24 06:26:09.419
370	植物	しょくぶつ	Học sinh	55	2026-06-24 06:26:09.422	2026-06-24 06:26:09.422
371	先生	せんせい	Giáo viên	55	2026-06-24 06:26:09.424	2026-06-24 06:26:09.424
372	生	う	Tươi sống	55	2026-06-24 06:26:09.426	2026-06-24 06:26:09.426
373	一生	いっしょう	Suốt cuộc đời	55	2026-06-24 06:26:09.429	2026-06-24 06:26:09.429
374	誰	だれ	Giáo viên	56	2026-06-24 06:26:09.434	2026-06-24 06:26:09.434
375	先月	せんげつ	Tháng trước	56	2026-06-24 06:26:09.437	2026-06-24 06:26:09.437
376	先週	せんしゅう	Tuần trước	56	2026-06-24 06:26:09.439	2026-06-24 06:26:09.439
377	先輩	せんぱい	Đàn anh, người đi trước	56	2026-06-24 06:26:09.441	2026-06-24 06:26:09.441
378	先日	せんじつ	Vài ngày trước, hôm trước	56	2026-06-24 06:26:09.445	2026-06-24 06:26:09.445
379	先祖	せんぞ	Ông bà tổ tiên	56	2026-06-24 06:26:09.448	2026-06-24 06:26:09.448
380	人	ひと	Cái gì	57	2026-06-24 06:26:09.452	2026-06-24 06:26:09.452
381	何	なん	Cái gì	57	2026-06-24 06:26:09.454	2026-06-24 06:26:09.454
382	何人	なんにん	Bao nhiêu người	57	2026-06-24 06:26:09.456	2026-06-24 06:26:09.456
383	何時	なんじ	Mấy giờ	57	2026-06-24 06:26:09.458	2026-06-24 06:26:09.458
384	何	なん	Bao nhiêu lần	57	2026-06-24 06:26:09.46	2026-06-24 06:26:09.46
385	幾何学	きかがく	Hình học	57	2026-06-24 06:26:09.463	2026-06-24 06:26:09.463
386	父	ちち	Bố (của mình)	58	2026-06-24 06:26:09.467	2026-06-24 06:26:09.467
387	父	とう	Ngày của bố	58	2026-06-24 06:26:09.469	2026-06-24 06:26:09.469
388	祖父	そふ	Ông	58	2026-06-24 06:26:09.47	2026-06-24 06:26:09.47
389	父母	ふぼ	Bố mẹ	58	2026-06-24 06:26:09.472	2026-06-24 06:26:09.472
390	祖父母	そふぼ	Ông bà	58	2026-06-24 06:26:09.475	2026-06-24 06:26:09.475
391	叔父	おじ	chú, cậu	58	2026-06-24 06:26:09.478	2026-06-24 06:26:09.478
392	伯父	おじ	chú, cậu	58	2026-06-24 06:26:09.481	2026-06-24 06:26:09.481
393	母	かあ	Mẹ (của mình)	59	2026-06-24 06:26:09.485	2026-06-24 06:26:09.485
394	母	かあ	Ngày của mẹ	59	2026-06-24 06:26:09.486	2026-06-24 06:26:09.486
395	祖母	そぼ	Bà	59	2026-06-24 06:26:09.488	2026-06-24 06:26:09.488
396	父母	ふぼ	Bố mẹ	59	2026-06-24 06:26:09.489	2026-06-24 06:26:09.489
397	祖父母	そふぼ	Ông bà	59	2026-06-24 06:26:09.49	2026-06-24 06:26:09.49
398	母語	ぼご	Tiếng mẹ đẻ	59	2026-06-24 06:26:09.492	2026-06-24 06:26:09.492
399	叔母	おば	Cô dì, bác gái	59	2026-06-24 06:26:09.494	2026-06-24 06:26:09.494
400	伯母	おば	Cô dì, bác gái	59	2026-06-24 06:26:09.496	2026-06-24 06:26:09.496
401	米	こめ	Sinh viên, học sinh năm 3	60	2026-06-24 06:26:09.499	2026-06-24 06:26:09.499
402	一年	いちねん	1 năm	60	2026-06-24 06:26:09.501	2026-06-24 06:26:09.501
403	今年	ことし	Năm nay	60	2026-06-24 06:26:09.502	2026-06-24 06:26:09.502
404	去年	きょねん	Năm ngoái	60	2026-06-24 06:26:09.504	2026-06-24 06:26:09.504
405	毎年	まいとし	thường niên ,hàng năm, mỗi năm	60	2026-06-24 06:26:09.505	2026-06-24 06:26:09.505
406	毎年	まいねん	thường niên ,hàng năm, mỗi năm	60	2026-06-24 06:26:09.507	2026-06-24 06:26:09.507
407	年	とし	thường niên ,hàng năm, mỗi năm	60	2026-06-24 06:26:09.509	2026-06-24 06:26:09.509
408	来年	らいねん	Năm sau	60	2026-06-24 06:26:09.511	2026-06-24 06:26:09.511
409	青少年	せいしょうねん	Thanh thiếu niên	60	2026-06-24 06:26:09.513	2026-06-24 06:26:09.513
410	中年	ちゅうねん	Trung niên	60	2026-06-24 06:26:09.515	2026-06-24 06:26:09.515
411	過去	かこ	Năm ngoái	61	2026-06-24 06:26:09.518	2026-06-24 06:26:09.518
412	過去	かこ	Quá khứ	61	2026-06-24 06:26:09.519	2026-06-24 06:26:09.519
413	誰	だれ	Mỗi ngày	62	2026-06-24 06:26:09.523	2026-06-24 06:26:09.523
414	毎月	まいつき	Mối tháng	62	2026-06-24 06:26:09.524	2026-06-24 06:26:09.524
415	毎年	まいとし	Mỗi năm	62	2026-06-24 06:26:09.526	2026-06-24 06:26:09.526
416	毎年	まいねん	Mỗi năm	62	2026-06-24 06:26:09.528	2026-06-24 06:26:09.528
417	毎週	まいしゅう	Mối tuần	62	2026-06-24 06:26:09.53	2026-06-24 06:26:09.53
418	毎晩	まいばん	Mỗi tối	62	2026-06-24 06:26:09.532	2026-06-24 06:26:09.532
419	毎朝	まいあさ	Mỗi sáng	62	2026-06-24 06:26:09.533	2026-06-24 06:26:09.533
420	毎度	まいど	Mỗi lần	62	2026-06-24 06:26:09.535	2026-06-24 06:26:09.535
421	王様	おうさま	Vua	63	2026-06-24 06:26:09.539	2026-06-24 06:26:09.539
422	国王	こくおう	Quốc vương	63	2026-06-24 06:26:09.54	2026-06-24 06:26:09.54
423	王様	おうさま	Vị vua	63	2026-06-24 06:26:09.542	2026-06-24 06:26:09.542
424	女王	じょおう	Nữ Hoàng	63	2026-06-24 06:26:09.545	2026-06-24 06:26:09.545
425	王女	おうじょ	Công chúa	63	2026-06-24 06:26:09.547	2026-06-24 06:26:09.547
426	王子	おうじ	Hoàng tử	63	2026-06-24 06:26:09.548	2026-06-24 06:26:09.548
427	王国	おうこく	vương quốc, đất nước theo chế độ quân chủ	63	2026-06-24 06:26:09.55	2026-06-24 06:26:09.55
428	宝石	ほうせき	Đất nước	64	2026-06-24 06:26:09.553	2026-06-24 06:26:09.553
429	外国	がいこく	Nước ngoài	64	2026-06-24 06:26:09.555	2026-06-24 06:26:09.555
430	中国	ちゅうごく	Trung Quốc, tên một hòn đảo phía Tây Nam Nhật Bản.	64	2026-06-24 06:26:09.556	2026-06-24 06:26:09.556
431	韓国	かんこく	Hàn quốc	64	2026-06-24 06:26:09.558	2026-06-24 06:26:09.558
432	国会	こっかい	Quốc hôị, nghị viện	64	2026-06-24 06:26:09.559	2026-06-24 06:26:09.559
433	国際	こくさい	Quốc tế	64	2026-06-24 06:26:09.562	2026-06-24 06:26:09.562
434	国籍	こくせき	Quốc tịch	64	2026-06-24 06:26:09.563	2026-06-24 06:26:09.563
435	国内	こくない	Trong nước, nội địa	64	2026-06-24 06:26:09.565	2026-06-24 06:26:09.565
436	物	もの	ngắm hoa anh đào nở, hội ngắm hoa, hội xem hoa	65	2026-06-24 06:26:09.569	2026-06-24 06:26:09.569
437	意見	いけん	Ý kiến	65	2026-06-24 06:26:09.57	2026-06-24 06:26:09.57
438	見物	けんぶつ	Tham quan, ngắm cảnh	65	2026-06-24 06:26:09.572	2026-06-24 06:26:09.572
439	見本	みほん	Mẫu, vật mẫu, kiểu mẫu	65	2026-06-24 06:26:09.573	2026-06-24 06:26:09.573
440	見学	けんがく	Kiến tập, tham quan với mục đích học tập	65	2026-06-24 06:26:09.575	2026-06-24 06:26:09.575
441	角	かど	Ngân hàng	66	2026-06-24 06:26:09.578	2026-06-24 06:26:09.578
442	旅行	りょこう	Du lịch	66	2026-06-24 06:26:09.581	2026-06-24 06:26:09.581
443	行動	こうどう	Hành động	66	2026-06-24 06:26:09.582	2026-06-24 06:26:09.582
444	行事	ぎょうじ	Sự kiện	66	2026-06-24 06:26:09.584	2026-06-24 06:26:09.584
445	一行目	いちぎょうめ	Dòng đầu tiên	66	2026-06-24 06:26:09.586	2026-06-24 06:26:09.586
446	稲	いね	Gạo	67	2026-06-24 06:26:09.59	2026-06-24 06:26:09.59
447	米屋	こめや	Cửa hàng bán gạo	67	2026-06-24 06:26:09.591	2026-06-24 06:26:09.591
448	米国	べいこく	Nước Mỹ	67	2026-06-24 06:26:09.593	2026-06-24 06:26:09.593
449	欧米	おうべい	Âu Mỹ	67	2026-06-24 06:26:09.596	2026-06-24 06:26:09.596
450	南米	なんべい	Nam Mỹ	67	2026-06-24 06:26:09.598	2026-06-24 06:26:09.598
451	北米	ほくべい	Bắc Mỹ	67	2026-06-24 06:26:09.6	2026-06-24 06:26:09.6
452	新米	しんまい	người mới vào nghề, người tập sự ,lúa mới ,gạo mới	67	2026-06-24 06:26:09.601	2026-06-24 06:26:09.601
453	十月	じゅうがつ	Năm sau	68	2026-06-24 06:26:09.604	2026-06-24 06:26:09.604
454	来週	らいしゅう	Tuần sau	68	2026-06-24 06:26:09.606	2026-06-24 06:26:09.606
455	将来	しょうらい	Tương lai	68	2026-06-24 06:26:09.607	2026-06-24 06:26:09.607
456	来学期	らいがっき	Học kì mới	68	2026-06-24 06:26:09.609	2026-06-24 06:26:09.609
457	誰	だれ	Lương tâm	69	2026-06-24 06:26:09.613	2026-06-24 06:26:09.613
458	不良	ふりょう	Bất lương, không tốt, không đạt	69	2026-06-24 06:26:09.615	2026-06-24 06:26:09.615
459	奈良県	ならけん	Tỉnh Nara	69	2026-06-24 06:26:09.616	2026-06-24 06:26:09.616
460	家	いえ	Thức ăn	70	2026-06-24 06:26:09.619	2026-06-24 06:26:09.619
461	食堂	しょくどう	Phòng ăn, căn tin	70	2026-06-24 06:26:09.621	2026-06-24 06:26:09.621
462	食事	しょくじ	Bữa ăn	70	2026-06-24 06:26:09.623	2026-06-24 06:26:09.623
463	昼食	ちゅうしょく	Bữa ăn trưa	70	2026-06-24 06:26:09.624	2026-06-24 06:26:09.624
464	朝食	ちょうしょく	Bữa ăn sáng	70	2026-06-24 06:26:09.625	2026-06-24 06:26:09.625
465	食	く	Đoạn thực, nhịn ăn	70	2026-06-24 06:26:09.627	2026-06-24 06:26:09.627
466	大	おお	Thức uống	71	2026-06-24 06:26:09.632	2026-06-24 06:26:09.632
467	飲	の	Quầy giải khát	71	2026-06-24 06:26:09.633	2026-06-24 06:26:09.633
468	飲	の	Thuốc uống	71	2026-06-24 06:26:09.635	2026-06-24 06:26:09.635
469	飲食	いんしょく	Cửa hàng ăn uống	71	2026-06-24 06:26:09.637	2026-06-24 06:26:09.637
470	飲酒運転	いんしゅうんてん	Lái xe trong tình trạng say rượu	71	2026-06-24 06:26:09.639	2026-06-24 06:26:09.639
471	飲料水	いんりょうすい	Nước uống	71	2026-06-24 06:26:09.64	2026-06-24 06:26:09.64
472	私	わたし	Hội thoại, sự nói chuyện	72	2026-06-24 06:26:09.644	2026-06-24 06:26:09.644
473	会社	かいしゃ	Công ty	72	2026-06-24 06:26:09.646	2026-06-24 06:26:09.646
474	会社員	かいしゃいん	Nhân viên công ty	72	2026-06-24 06:26:09.649	2026-06-24 06:26:09.649
475	会議	かいぎ	Cuộc họp	72	2026-06-24 06:26:09.65	2026-06-24 06:26:09.65
476	会場	かいじょう	Hội trường	72	2026-06-24 06:26:09.652	2026-06-24 06:26:09.652
477	国会	こっかい	Quốc hội	72	2026-06-24 06:26:09.654	2026-06-24 06:26:09.654
478	会釈	えしゃく	Cúi chào, gật đầu	72	2026-06-24 06:26:09.655	2026-06-24 06:26:09.655
479	耳	みみ	Lỗ tai	73	2026-06-24 06:26:09.658	2026-06-24 06:26:09.658
480	初耳	はつみみ	Điều mới nghe lần đầu	73	2026-06-24 06:26:09.659	2026-06-24 06:26:09.659
481	耳	みみ	Khoa Tai Mũi Họng	73	2026-06-24 06:26:09.662	2026-06-24 06:26:09.662
482	門	もん	Báo	74	2026-06-24 06:26:09.666	2026-06-24 06:26:09.666
483	聞	き	Việc chưa từng có trước đây	74	2026-06-24 06:26:09.667	2026-06-24 06:26:09.667
484	口	くち	Từ ngữ	75	2026-06-24 06:26:09.67	2026-06-24 06:26:09.67
485	一言	ひとこと	Một từ, một lời	75	2026-06-24 06:26:09.672	2026-06-24 06:26:09.672
486	伝言	でんごん	Lời nhắn	75	2026-06-24 06:26:09.673	2026-06-24 06:26:09.673
487	方言	ほうげん	Tiếng địa phương	75	2026-06-24 06:26:09.674	2026-06-24 06:26:09.674
488	予言	よげん	Tiên đoán	75	2026-06-24 06:26:09.676	2026-06-24 06:26:09.676
489	言語学	げんごがく	Ngôn ngữ học	75	2026-06-24 06:26:09.678	2026-06-24 06:26:09.678
490	言	い	Giải thích, biện bạch	75	2026-06-24 06:26:09.68	2026-06-24 06:26:09.68
491	何千	なんぜん	Câu chuyện	76	2026-06-24 06:26:09.684	2026-06-24 06:26:09.684
492	会話	かいわ	Hoội thoại	76	2026-06-24 06:26:09.686	2026-06-24 06:26:09.686
493	電話	でんわ	Điện thoại	76	2026-06-24 06:26:09.688	2026-06-24 06:26:09.688
494	世話	せわ	Chăm sóc	76	2026-06-24 06:26:09.689	2026-06-24 06:26:09.689
495	話題	わだい	Chủ đề, đề tài	76	2026-06-24 06:26:09.691	2026-06-24 06:26:09.691
496	話	はな	Nói chuyện bằng tay	76	2026-06-24 06:26:09.692	2026-06-24 06:26:09.692
497	人	ひと	Đại học quốc lập	77	2026-06-24 06:26:09.697	2026-06-24 06:26:09.697
498	立派	りっぱ	Tuyệt vời	77	2026-06-24 06:26:09.699	2026-06-24 06:26:09.699
499	建立	こんりゅう	Xây dựng chùa chiền, đền đài	77	2026-06-24 06:26:09.701	2026-06-24 06:26:09.701
500	寺	てら	Phòng chờ	78	2026-06-24 06:26:09.705	2026-06-24 06:26:09.705
501	待	ま	Kì vọng	78	2026-06-24 06:26:09.706	2026-06-24 06:26:09.706
502	食	た	Khu vực xung quanh	79	2026-06-24 06:26:09.71	2026-06-24 06:26:09.71
503	周期	しゅうき	Chu kỳ	79	2026-06-24 06:26:09.712	2026-06-24 06:26:09.712
504	世界	せかい	Vòng quanh thế giới	79	2026-06-24 06:26:09.714	2026-06-24 06:26:09.714
505	一周年	いっしゅうねん	1 năm tròn	79	2026-06-24 06:26:09.716	2026-06-24 06:26:09.716
506	道	みち	Tuần này	80	2026-06-24 06:26:09.719	2026-06-24 06:26:09.719
507	来週	らいしゅう	Tuần sau	80	2026-06-24 06:26:09.721	2026-06-24 06:26:09.721
508	先週	せんしゅう	Tuần trước	80	2026-06-24 06:26:09.722	2026-06-24 06:26:09.722
509	毎週	まいしゅう	Mỗi tuần	80	2026-06-24 06:26:09.724	2026-06-24 06:26:09.724
510	一週間	いっしゅうかん	1 tuần	80	2026-06-24 06:26:09.726	2026-06-24 06:26:09.726
511	週末	しゅうまつ	Cuối tuần	80	2026-06-24 06:26:09.728	2026-06-24 06:26:09.728
512	週刊	しゅうかん	Tuần san, xuất bản từng tuần	80	2026-06-24 06:26:09.73	2026-06-24 06:26:09.73
513	手足	てあし	Đại học, trường Đại học	81	2026-06-24 06:26:09.741	2026-06-24 06:26:09.741
514	大学生	だいがくせい	Sinh viên	81	2026-06-24 06:26:09.744	2026-06-24 06:26:09.744
515	大人	おとな	Người lớn	81	2026-06-24 06:26:09.749	2026-06-24 06:26:09.749
516	大好	だいす	Đại sứ quán	81	2026-06-24 06:26:09.753	2026-06-24 06:26:09.753
517	大切	たいせつ	Chủ nhà	81	2026-06-24 06:26:09.757	2026-06-24 06:26:09.757
518	手足	てあし	Học sinh tiểu học	82	2026-06-24 06:26:09.765	2026-06-24 06:26:09.765
519	小学校	しょうがっこう	Trường tiểu học	82	2026-06-24 06:26:09.773	2026-06-24 06:26:09.773
520	小説	しょうせつ	Tiểu thuyết	82	2026-06-24 06:26:09.778	2026-06-24 06:26:09.778
521	小包	こづつみ	Bưu kiện	82	2026-06-24 06:26:09.781	2026-06-24 06:26:09.781
522	小麦	こむぎ	Lúa mì	82	2026-06-24 06:26:09.785	2026-06-24 06:26:09.785
523	小川	おがわ	Con suối	82	2026-06-24 06:26:09.789	2026-06-24 06:26:09.789
524	建物	たてもの	Trường cấp 3	83	2026-06-24 06:26:09.797	2026-06-24 06:26:09.797
525	高校生	こうこうせい	Học sinh cấp 3	83	2026-06-24 06:26:09.801	2026-06-24 06:26:09.801
526	最高	さいこう	Tốt nhất, tuyệt vời	83	2026-06-24 06:26:09.805	2026-06-24 06:26:09.805
527	高級	こうきゅう	Cao cấp	83	2026-06-24 06:26:09.811	2026-06-24 06:26:09.811
528	高	たか	Giá yên cao	83	2026-06-24 06:26:09.815	2026-06-24 06:26:09.815
529	残高	ざんだか	Số dư tài khoản	83	2026-06-24 06:26:09.819	2026-06-24 06:26:09.819
530	人	ひと	An toàn	84	2026-06-24 06:26:09.824	2026-06-24 06:26:09.824
531	不安	ふあん	Ổn định	84	2026-06-24 06:26:09.826	2026-06-24 06:26:09.826
532	安易	あんい	Mục tiêu, tiêu chuẩn	84	2026-06-24 06:26:09.828	2026-06-24 06:26:09.828
533	円安	えんやす	Giá yên thấp	84	2026-06-24 06:26:09.83	2026-06-24 06:26:09.83
534	新	あたら	Báo chí, bài báo	85	2026-06-24 06:26:09.833	2026-06-24 06:26:09.833
535	新幹線	しんかんせん	Tàu siêu tốc	85	2026-06-24 06:26:09.835	2026-06-24 06:26:09.835
536	新年	しんねん	Năm mới	85	2026-06-24 06:26:09.836	2026-06-24 06:26:09.836
537	新鮮	しんせん	Tỉnh Niigata ở Nhật	85	2026-06-24 06:26:09.838	2026-06-24 06:26:09.838
538	同	おな	Trung cổ	86	2026-06-24 06:26:09.84	2026-06-24 06:26:09.84
539	古本	ふるほん	Sách cũ	86	2026-06-24 06:26:09.842	2026-06-24 06:26:09.842
540	使	つか	Khảo cổ học	86	2026-06-24 06:26:09.843	2026-06-24 06:26:09.843
541	古代	こだい	Cổ đại, ngày xưa	86	2026-06-24 06:26:09.846	2026-06-24 06:26:09.846
542	古都	こと	Cố đô	86	2026-06-24 06:26:09.849	2026-06-24 06:26:09.849
543	二人	ふたり	Ngày mồng 1 Tết	87	2026-06-24 06:26:09.852	2026-06-24 06:26:09.852
544	足元	あしもと	Bước chân	87	2026-06-24 06:26:09.854	2026-06-24 06:26:09.854
545	地元	じもと	Địa phương, trong vùng	87	2026-06-24 06:26:09.855	2026-06-24 06:26:09.855
546	三次元	さんじげん	Không gian 3 chiều	87	2026-06-24 06:26:09.857	2026-06-24 06:26:09.857
547	元	げん	Nguyên ( Nhà Nguyên của Trung Quốc )	87	2026-06-24 06:26:09.859	2026-06-24 06:26:09.859
548	紀元前	きげんぜん	Trước công nguyên	87	2026-06-24 06:26:09.861	2026-06-24 06:26:09.861
549	息	いき	Thời tiết	88	2026-06-24 06:26:09.866	2026-06-24 06:26:09.866
550	電気	でんき	Điện	88	2026-06-24 06:26:09.868	2026-06-24 06:26:09.868
551	気持	きもち	Tình cảm, cảm xúc	88	2026-06-24 06:26:09.869	2026-06-24 06:26:09.869
552	人気	にんき	Nổi tiếng, được nhiều người ưa thích, hâm mộ	88	2026-06-24 06:26:09.871	2026-06-24 06:26:09.871
553	気	き	Cảm giác, linh cảm	88	2026-06-24 06:26:09.872	2026-06-24 06:26:09.872
554	多	おお	Có lẽ	89	2026-06-24 06:26:09.875	2026-06-24 06:26:09.875
555	多少	たしょう	Ít nhiều	89	2026-06-24 06:26:09.876	2026-06-24 06:26:09.876
556	滅多	めった	Biểu quyết	89	2026-06-24 06:26:09.879	2026-06-24 06:26:09.879
557	多数	たすう	Đa số, số đông	89	2026-06-24 06:26:09.881	2026-06-24 06:26:09.881
558	多量	たりょう	Lượng nhiều	89	2026-06-24 06:26:09.883	2026-06-24 06:26:09.883
559	小	ちい	Thiếu niên	90	2026-06-24 06:26:09.886	2026-06-24 06:26:09.886
560	少女	しょうじょ	Thiếu nữ	90	2026-06-24 06:26:09.888	2026-06-24 06:26:09.888
561	少々	しょうしょう	1 chút	90	2026-06-24 06:26:09.889	2026-06-24 06:26:09.889
562	減少	げんしょう	Giảm, suy giảm	90	2026-06-24 06:26:09.891	2026-06-24 06:26:09.891
563	少量	しょうりょう	Lượng ít	90	2026-06-24 06:26:09.892	2026-06-24 06:26:09.892
564	私	わたし	Hiroshima (Nhật Bản)	91	2026-06-24 06:26:09.897	2026-06-24 06:26:09.897
565	広告	こうこく	Quảng cáo	91	2026-06-24 06:26:09.899	2026-06-24 06:26:09.899
566	広場	ひろば	Quảng trường	91	2026-06-24 06:26:09.9	2026-06-24 06:26:09.9
567	広	ひろ	Bộ com lê	91	2026-06-24 06:26:09.902	2026-06-24 06:26:09.902
568	日曜日	にちようび	Nói nhanh	92	2026-06-24 06:26:09.905	2026-06-24 06:26:09.905
569	素早	すばや	Nhanh chóng, ngay lập tức	92	2026-06-24 06:26:09.906	2026-06-24 06:26:09.906
570	早朝	そうちょう	Sáng sớm	92	2026-06-24 06:26:09.908	2026-06-24 06:26:09.908
571	髪	かみ	Giám đốc	93	2026-06-24 06:26:09.912	2026-06-24 06:26:09.912
572	部長	ぶちょう	Trưởng phòng	93	2026-06-24 06:26:09.915	2026-06-24 06:26:09.915
573	身長	しんちょう	Chiều cao	93	2026-06-24 06:26:09.917	2026-06-24 06:26:09.917
574	長所	ちょうしょ	Điểm mạnh	93	2026-06-24 06:26:09.918	2026-06-24 06:26:09.918
575	長男	ちょうなん	Trưởng Nam	93	2026-06-24 06:26:09.92	2026-06-24 06:26:09.92
576	長方形	ちょうほうけい	Hình chữ nhật	93	2026-06-24 06:26:09.923	2026-06-24 06:26:09.923
577	日	ひ	Ngày mai	94	2026-06-24 06:26:09.927	2026-06-24 06:26:09.927
578	明日	あした	Ngày mai	94	2026-06-24 06:26:09.929	2026-06-24 06:26:09.929
579	明日	みょうにち	Ngày mai	94	2026-06-24 06:26:09.931	2026-06-24 06:26:09.931
580	説明	せつめい	Thuyết minh, giải thích	94	2026-06-24 06:26:09.933	2026-06-24 06:26:09.933
581	証明書	しょうめいしょ	Chứng minh thư	94	2026-06-24 06:26:09.934	2026-06-24 06:26:09.934
582	明後日	みょうごにち	Ngày mốt	94	2026-06-24 06:26:09.935	2026-06-24 06:26:09.935
583	明後日	あさって	Ngày mốt	94	2026-06-24 06:26:09.937	2026-06-24 06:26:09.937
584	女	おんな	Hữu ý, thiện chí, lòng tốt	95	2026-06-24 06:26:09.94	2026-06-24 06:26:09.94
585	好感	こうかん	Ấn tượng tốt, thiện cảm	95	2026-06-24 06:26:09.941	2026-06-24 06:26:09.941
586	友達	ともだち	Bạn bè (nói chung)	96	2026-06-24 06:26:09.946	2026-06-24 06:26:09.946
587	友人	ゆうじん	Bạn	96	2026-06-24 06:26:09.948	2026-06-24 06:26:09.948
588	親友	しんゆう	Bạn thân	96	2026-06-24 06:26:09.95	2026-06-24 06:26:09.95
589	友情	ゆうじょう	Tình bạn, tình bằng hữu	96	2026-06-24 06:26:09.953	2026-06-24 06:26:09.953
590	友好	ゆうこう	Hữu nghị, hữu hảo	96	2026-06-24 06:26:09.954	2026-06-24 06:26:09.954
591	人	ひと	Lối vào, cửa vào	97	2026-06-24 06:26:09.959	2026-06-24 06:26:09.959
592	入学	にゅうがく	Nhập khẩu	97	2026-06-24 06:26:09.961	2026-06-24 06:26:09.961
593	収入	しゅうにゅう	Thu nhập	97	2026-06-24 06:26:09.963	2026-06-24 06:26:09.963
594	出口	でぐち	Lối ra, cửa ra	98	2026-06-24 06:26:09.967	2026-06-24 06:26:09.967
595	思	おも	Xuất khẩu	98	2026-06-24 06:26:09.969	2026-06-24 06:26:09.969
596	出席	しゅっせき	Tham gia, tham dự, có mặt	98	2026-06-24 06:26:09.971	2026-06-24 06:26:09.971
597	人々	ひとびと	Thành phố Tsukuba Nhật bản	99	2026-06-24 06:26:09.974	2026-06-24 06:26:09.974
598	市長	しちょう	Thị trưởng	99	2026-06-24 06:26:09.976	2026-06-24 06:26:09.976
599	市民	しみん	Dân thành phố	99	2026-06-24 06:26:09.979	2026-06-24 06:26:09.979
600	市役所	しやくしょ	Cơ quan hành chính thành phố	99	2026-06-24 06:26:09.981	2026-06-24 06:26:09.981
601	都市	とし	Đô thị	99	2026-06-24 06:26:09.984	2026-06-24 06:26:09.984
602	市場	しじょう	Chợ	99	2026-06-24 06:26:09.992	2026-06-24 06:26:09.992
603	市場	いちば	Chợ	99	2026-06-24 06:26:09.999	2026-06-24 06:26:09.999
604	朝市	あさいち	Chợ sáng	99	2026-06-24 06:26:10.009	2026-06-24 06:26:10.009
605	町	まち	Thị trấn	100	2026-06-24 06:26:10.021	2026-06-24 06:26:10.021
606	北	きた	Thị trấn Kitayama Nhật Bản	100	2026-06-24 06:26:10.026	2026-06-24 06:26:10.026
607	北山	きたやま	Thị trấn Kitayama Nhật Bản	100	2026-06-24 06:26:10.031	2026-06-24 06:26:10.031
608	町長	ちょうちょう	Thị trưởng	100	2026-06-24 06:26:10.035	2026-06-24 06:26:10.035
609	町民	ちょうみん	Nguời dân trong thị trấn	100	2026-06-24 06:26:10.039	2026-06-24 06:26:10.039
610	城下町	じょうかまち	Phố cổ	100	2026-06-24 06:26:10.042	2026-06-24 06:26:10.042
611	港町	みなとまち	Thành phố cảng	100	2026-06-24 06:26:10.046	2026-06-24 06:26:10.046
612	木	き	Làng, thôn xã	101	2026-06-24 06:26:10.053	2026-06-24 06:26:10.053
613	田村	たむら	Thôn trưởng, trưởng làng	101	2026-06-24 06:26:10.056	2026-06-24 06:26:10.056
614	村民	そんみん	Dân làng	101	2026-06-24 06:26:10.06	2026-06-24 06:26:10.06
615	農村	のうそん	Nông thôn	101	2026-06-24 06:26:10.063	2026-06-24 06:26:10.063
616	市町村	しちょうそん	Thành phố, thị trấn và làng mạc	101	2026-06-24 06:26:10.068	2026-06-24 06:26:10.068
617	漁村	ぎょそん	Làng chài	101	2026-06-24 06:26:10.071	2026-06-24 06:26:10.071
618	雲	くも	Mưa	102	2026-06-24 06:26:10.077	2026-06-24 06:26:10.077
619	梅雨	つゆ	Mùa mưa (đầu hè)	102	2026-06-24 06:26:10.08	2026-06-24 06:26:10.08
620	梅雨	ばいう	Mùa mưa (đầu hè)	102	2026-06-24 06:26:10.083	2026-06-24 06:26:10.083
621	大雨	おおあめ	Mưa lớn	102	2026-06-24 06:26:10.084	2026-06-24 06:26:10.084
622	雨季	うき	Mùa mưa	102	2026-06-24 06:26:10.086	2026-06-24 06:26:10.086
623	暴風雨	ぼうふうう	Mưa bão	102	2026-06-24 06:26:10.088	2026-06-24 06:26:10.088
624	雨水	あまみず	Nước mưa	102	2026-06-24 06:26:10.089	2026-06-24 06:26:10.089
625	雨	あめ	Điện	103	2026-06-24 06:26:10.092	2026-06-24 06:26:10.092
626	電車	でんしゃ	Tàu điện	103	2026-06-24 06:26:10.094	2026-06-24 06:26:10.094
627	電話	でんわ	Điện thoại	103	2026-06-24 06:26:10.097	2026-06-24 06:26:10.097
628	電力	でんりょく	Điện lực	103	2026-06-24 06:26:10.099	2026-06-24 06:26:10.099
629	電子	でんし	Điện tử	103	2026-06-24 06:26:10.1	2026-06-24 06:26:10.1
630	電池	でんち	Pin	103	2026-06-24 06:26:10.102	2026-06-24 06:26:10.102
631	停電	ていでん	Cúp điện	103	2026-06-24 06:26:10.103	2026-06-24 06:26:10.103
632	電源	でんげん	Nguồn điện	103	2026-06-24 06:26:10.105	2026-06-24 06:26:10.105
633	車	くるま	Xe hơi (ô tô)	104	2026-06-24 06:26:10.108	2026-06-24 06:26:10.108
634	電車	でんしゃ	Tàu điện	104	2026-06-24 06:26:10.109	2026-06-24 06:26:10.109
635	自動車	じどうしゃ	Xe hơi (ô tô)	104	2026-06-24 06:26:10.111	2026-06-24 06:26:10.111
636	自転車	じてんしゃ	Xe đạp	104	2026-06-24 06:26:10.113	2026-06-24 06:26:10.113
637	駐車場	ちゅうしゃじょう	Bãi đỗ xe	104	2026-06-24 06:26:10.116	2026-06-24 06:26:10.116
638	救急車	きゅうきゅうしゃ	Xe cấp cứu	104	2026-06-24 06:26:10.117	2026-06-24 06:26:10.117
639	馬	うま	Con ngựa	105	2026-06-24 06:26:10.12	2026-06-24 06:26:10.12
640	子馬	こうま	Ngựa con	105	2026-06-24 06:26:10.122	2026-06-24 06:26:10.122
641	馬	うま	Chuồng ngựa	105	2026-06-24 06:26:10.123	2026-06-24 06:26:10.123
642	馬車	ばしゃ	Xe ngựa	105	2026-06-24 06:26:10.125	2026-06-24 06:26:10.125
643	乗馬	じょうば	Cưỡi ngựa	105	2026-06-24 06:26:10.126	2026-06-24 06:26:10.126
644	競馬	けいば	Cuộc đua ngựa	105	2026-06-24 06:26:10.129	2026-06-24 06:26:10.129
645	馬鹿	ばか	Ngu ngốc	105	2026-06-24 06:26:10.131	2026-06-24 06:26:10.131
646	駅	えき	Nhà ga	106	2026-06-24 06:26:10.134	2026-06-24 06:26:10.134
647	東京駅	とうきょうえき	Ga Tokyo	106	2026-06-24 06:26:10.136	2026-06-24 06:26:10.136
648	駅員	えきいん	Nhân viên nhà ga	106	2026-06-24 06:26:10.137	2026-06-24 06:26:10.137
649	駅前	えきまえ	Trước nhà ga	106	2026-06-24 06:26:10.139	2026-06-24 06:26:10.139
650	神社	じんじゃ	Công ty	107	2026-06-24 06:26:10.142	2026-06-24 06:26:10.142
651	社会	しゃかい	Xã hội	107	2026-06-24 06:26:10.145	2026-06-24 06:26:10.145
652	社長	しゃちょう	Giám đốc	107	2026-06-24 06:26:10.147	2026-06-24 06:26:10.147
653	神社	じんじゃ	Đền thờ thần đạo	107	2026-06-24 06:26:10.149	2026-06-24 06:26:10.149
654	社会学	しゃかいがく	Xã hội học	107	2026-06-24 06:26:10.151	2026-06-24 06:26:10.151
655	社会	しゃかい	Chủ nghĩa xã hội	107	2026-06-24 06:26:10.153	2026-06-24 06:26:10.153
656	社	やしろ	Đền thờ	107	2026-06-24 06:26:10.154	2026-06-24 06:26:10.154
657	商社	しょうしゃ	Công ty thương mại	107	2026-06-24 06:26:10.156	2026-06-24 06:26:10.156
658	父	ちち	Trường học	108	2026-06-24 06:26:10.16	2026-06-24 06:26:10.16
659	高校	こうこう	Trường THPT, cấp 3	108	2026-06-24 06:26:10.163	2026-06-24 06:26:10.163
660	中学校	ちゅうがっこう	Trướng THCS. Cấp 2	108	2026-06-24 06:26:10.165	2026-06-24 06:26:10.165
661	小学校	しょうがっこう	Trướng Tiểu học	108	2026-06-24 06:26:10.167	2026-06-24 06:26:10.167
662	校長	こうちょう	Hiệu trưởng	108	2026-06-24 06:26:10.169	2026-06-24 06:26:10.169
663	校舎	こうしゃ	Khu nhà trường, khu học xá	108	2026-06-24 06:26:10.17	2026-06-24 06:26:10.17
664	校歌	こうか	Bài ca của trường	108	2026-06-24 06:26:10.172	2026-06-24 06:26:10.172
665	店先	みせさき	Quán, cửa tiệm	109	2026-06-24 06:26:10.176	2026-06-24 06:26:10.176
666	喫茶店	きっさてん	Quán giải khát, tiệm cà phê	109	2026-06-24 06:26:10.178	2026-06-24 06:26:10.178
667	店員	てんいん	Nhân viên cửa hàng	109	2026-06-24 06:26:10.18	2026-06-24 06:26:10.18
668	書店	しょてん	Cửa hàng sách	109	2026-06-24 06:26:10.182	2026-06-24 06:26:10.182
669	売店	ばいてん	Quầy bán hàng	109	2026-06-24 06:26:10.184	2026-06-24 06:26:10.184
670	店長	てんちょう	Chủ cửa hàng	109	2026-06-24 06:26:10.185	2026-06-24 06:26:10.185
671	本店	ほんてん	Cơ sở chính, trụ sở chính	109	2026-06-24 06:26:10.187	2026-06-24 06:26:10.187
672	支店	してん	Cơ sở phụ, chi nhánh	109	2026-06-24 06:26:10.189	2026-06-24 06:26:10.189
673	銀	ぎん	Ngân hàng	110	2026-06-24 06:26:10.192	2026-06-24 06:26:10.192
674	銀	ぎん	Bạc	110	2026-06-24 06:26:10.195	2026-06-24 06:26:10.195
675	水銀	すいぎん	Thủy ngân	110	2026-06-24 06:26:10.197	2026-06-24 06:26:10.197
676	銀色	ぎんいろ	Màu bạc	110	2026-06-24 06:26:10.2	2026-06-24 06:26:10.2
677	銀河	ぎんが	Ngân hà	110	2026-06-24 06:26:10.202	2026-06-24 06:26:10.202
678	病院	びょういん	Bị bệnh, ốm	111	2026-06-24 06:26:10.205	2026-06-24 06:26:10.205
679	病院	びょういん	Bệnh viện	111	2026-06-24 06:26:10.207	2026-06-24 06:26:10.207
680	看病	かんびょう	Bạo bệnh, bệnh cấp tính	111	2026-06-24 06:26:10.209	2026-06-24 06:26:10.209
681	重病	じゅうびょう	Bệnh nặng	111	2026-06-24 06:26:10.213	2026-06-24 06:26:10.213
682	病	や	Có bệnh	111	2026-06-24 06:26:10.215	2026-06-24 06:26:10.215
683	疾病	しっぺい	Bệnh tật	111	2026-06-24 06:26:10.217	2026-06-24 06:26:10.217
684	元気	げんき	Bệnh viện	112	2026-06-24 06:26:10.22	2026-06-24 06:26:10.22
685	入院	にゅういん	Trường cao học, Việc đào tạo sau tốt nghiệp	112	2026-06-24 06:26:10.222	2026-06-24 06:26:10.222
686	大学	だいがく	Học sinh cao học	112	2026-06-24 06:26:10.224	2026-06-24 06:26:10.224
687	退院	たいいん	Y viện	112	2026-06-24 06:26:10.226	2026-06-24 06:26:10.226
688	美容院	びよういん	Viện thẩm mỹ	112	2026-06-24 06:26:10.228	2026-06-24 06:26:10.228
689	人	ひと	Ngày nghỉ	113	2026-06-24 06:26:10.236	2026-06-24 06:26:10.236
690	休講	きゅうこう	Được nghỉ 1 tiết học	113	2026-06-24 06:26:10.238	2026-06-24 06:26:10.238
691	定休日	ていきゅうび	Ngày nghỉ thường kì	113	2026-06-24 06:26:10.24	2026-06-24 06:26:10.24
692	土	つち	Chiêu đãi	114	2026-06-24 06:26:10.244	2026-06-24 06:26:10.244
693	脱走	だっそう	Tẩu thoát, đào ngũ	114	2026-06-24 06:26:10.247	2026-06-24 06:26:10.247
694	逃走	とうそう	Bỏ trốn	114	2026-06-24 06:26:10.25	2026-06-24 06:26:10.25
695	走行	そうこう	Du lịch, di chuyển, du hành	114	2026-06-24 06:26:10.252	2026-06-24 06:26:10.252
696	暴走	ぼうそう	nhóm chạy xe oto bike mất trật tự gây tiếng ồn	114	2026-06-24 06:26:10.253	2026-06-24 06:26:10.253
697	師走	しわす	Tháng chạp	114	2026-06-24 06:26:10.255	2026-06-24 06:26:10.255
698	遅	おそ	Thức dậy	115	2026-06-24 06:26:10.259	2026-06-24 06:26:10.259
699	起源	きげん	Gốc rễ, nguồn gốc	115	2026-06-24 06:26:10.262	2026-06-24 06:26:10.262
700	貝	かい	Ngao, sò, hến, trai	116	2026-06-24 06:26:10.268	2026-06-24 06:26:10.268
701	貝殻	かいがら	Vỏ ngao, sò ,hến, trai	116	2026-06-24 06:26:10.27	2026-06-24 06:26:10.27
702	巻貝	まきがい	Ốc sên	116	2026-06-24 06:26:10.272	2026-06-24 06:26:10.272
703	貝	かい	Đồ làm bằng vỏ sò	116	2026-06-24 06:26:10.273	2026-06-24 06:26:10.273
704	昔	むかし	Việc mua sắm	117	2026-06-24 06:26:10.278	2026-06-24 06:26:10.278
705	買	か	Việc mua bán	117	2026-06-24 06:26:10.28	2026-06-24 06:26:10.28
706	買収	ばいしゅう	Bên mua, khách hàng	117	2026-06-24 06:26:10.283	2026-06-24 06:26:10.283
707	人	ひと	Quầy bán	118	2026-06-24 06:26:10.287	2026-06-24 06:26:10.287
708	売店	ばいてん	Quầy bán hàng	118	2026-06-24 06:26:10.289	2026-06-24 06:26:10.289
709	自動	じどう	Máy bán hàng tự động	118	2026-06-24 06:26:10.291	2026-06-24 06:26:10.291
710	大売出	おおうりだ	Thương mại, việc bán buôn	118	2026-06-24 06:26:10.293	2026-06-24 06:26:10.293
711	本	ほん	Sách đọc	119	2026-06-24 06:26:10.299	2026-06-24 06:26:10.299
712	読書	どくしょ	Việc đọc sách	119	2026-06-24 06:26:10.301	2026-06-24 06:26:10.301
713	読者	どくしゃ	Đọc giả	119	2026-06-24 06:26:10.303	2026-06-24 06:26:10.303
714	句読点	くとうてん	Dấu chấm câu	119	2026-06-24 06:26:10.306	2026-06-24 06:26:10.306
715	愛読書	あいどくしょ	Sách ưa thích	119	2026-06-24 06:26:10.308	2026-06-24 06:26:10.308
716	筆	ふで	Thư viện	120	2026-06-24 06:26:10.313	2026-06-24 06:26:10.313
717	辞書	じしょ	Từ điển	120	2026-06-24 06:26:10.316	2026-06-24 06:26:10.316
718	教科書	きょうかしょ	Sách giáo khoa	120	2026-06-24 06:26:10.318	2026-06-24 06:26:10.318
719	読書	どくしょ	Việc đọc sách	120	2026-06-24 06:26:10.32	2026-06-24 06:26:10.32
720	書道	しょどう	Thư pháp	120	2026-06-24 06:26:10.322	2026-06-24 06:26:10.322
721	肩書	かたがき	Chức vị, chức danh	120	2026-06-24 06:26:10.324	2026-06-24 06:26:10.324
722	巣	す	Việc trở về nước	121	2026-06-24 06:26:10.329	2026-06-24 06:26:10.329
723	帰	かえ	Du lịch về trong ngày	121	2026-06-24 06:26:10.332	2026-06-24 06:26:10.332
724	帰宅	きたく	Việc về nhà	121	2026-06-24 06:26:10.334	2026-06-24 06:26:10.334
725	帰化	きか	Du nhập, nhập tịch	121	2026-06-24 06:26:10.336	2026-06-24 06:26:10.336
726	男	おとこ	Việc học	122	2026-06-24 06:26:10.34	2026-06-24 06:26:10.34
727	弓	ゆみ	Cái cung	123	2026-06-24 06:26:10.345	2026-06-24 06:26:10.345
728	弓矢	ゆみや	Cung và tên	123	2026-06-24 06:26:10.348	2026-06-24 06:26:10.348
729	弓道	きゅうどう	Môn bắn cung, cung đạo	123	2026-06-24 06:26:10.352	2026-06-24 06:26:10.352
730	虫	むし	Sâu bọ	124	2026-06-24 06:26:10.357	2026-06-24 06:26:10.357
731	虫歯	むしば	Răng sâu	124	2026-06-24 06:26:10.36	2026-06-24 06:26:10.36
732	弱虫	よわむし	Kẻ yếu đuối, nhát gan	124	2026-06-24 06:26:10.364	2026-06-24 06:26:10.364
733	昆虫	こんちゅう	Côn trùng	124	2026-06-24 06:26:10.367	2026-06-24 06:26:10.367
734	虫	むし	Kiên định, vững vàng	125	2026-06-24 06:26:10.371	2026-06-24 06:26:10.371
735	強制	きょうせい	Việc ăn cướp, vụ cướp	125	2026-06-24 06:26:10.373	2026-06-24 06:26:10.373
736	数珠	じゅず	Tỉnh cảm, cảm xúc	126	2026-06-24 06:26:10.379	2026-06-24 06:26:10.379
737	持	も	Vật mang theo, vật sở hữu	126	2026-06-24 06:26:10.382	2026-06-24 06:26:10.382
738	名前	なまえ	Tên	127	2026-06-24 06:26:10.386	2026-06-24 06:26:10.386
739	有名	ゆうめい	Chữ Hiragana	127	2026-06-24 06:26:10.388	2026-06-24 06:26:10.388
740	名刺	めいし	Danh thiếp	127	2026-06-24 06:26:10.391	2026-06-24 06:26:10.391
741	氏名	しめい	Họ tên	127	2026-06-24 06:26:10.392	2026-06-24 06:26:10.392
742	名字	みょうじ	Họ	127	2026-06-24 06:26:10.395	2026-06-24 06:26:10.395
743	名詞	めいし	Danh từ	127	2026-06-24 06:26:10.397	2026-06-24 06:26:10.397
744	彼	かれ	Tiếng Nhật	128	2026-06-24 06:26:10.401	2026-06-24 06:26:10.401
745	中国語	ちゅうごくご	Tiếng Trung Quốc	128	2026-06-24 06:26:10.403	2026-06-24 06:26:10.403
746	英語	えいご	Tiếng Anh	128	2026-06-24 06:26:10.404	2026-06-24 06:26:10.404
747	敬語	けいご	Kính ngữ	128	2026-06-24 06:26:10.406	2026-06-24 06:26:10.406
748	外国語	がいこくご	Tiếng nước ngoài	128	2026-06-24 06:26:10.412	2026-06-24 06:26:10.412
749	単語	たんご	Từ vựng	128	2026-06-24 06:26:10.423	2026-06-24 06:26:10.423
750	語	かた	Chủ ngữ	128	2026-06-24 06:26:10.426	2026-06-24 06:26:10.426
751	春	はる	Mùa xuân	129	2026-06-24 06:26:10.438	2026-06-24 06:26:10.438
752	春休	はるやす	Học kì mùa xuân	129	2026-06-24 06:26:10.442	2026-06-24 06:26:10.442
753	春巻	はるま	Xuân phân	129	2026-06-24 06:26:10.445	2026-06-24 06:26:10.445
754	青春	せいしゅん	Thanh xuân	129	2026-06-24 06:26:10.449	2026-06-24 06:26:10.449
755	春夏秋冬	しゅんかしゅうとう	4 mùa, xuân hạ thu đông	129	2026-06-24 06:26:10.452	2026-06-24 06:26:10.452
756	夏	なつ	Mùa hè	130	2026-06-24 06:26:10.46	2026-06-24 06:26:10.46
757	夏休	なつやす	Quần áo mùa hè	130	2026-06-24 06:26:10.463	2026-06-24 06:26:10.463
758	真夏	まなつ	Giữa hạ	130	2026-06-24 06:26:10.467	2026-06-24 06:26:10.467
759	初夏	しょか	Đầu hạ	130	2026-06-24 06:26:10.47	2026-06-24 06:26:10.47
760	夏至	げし	Hạ chí	130	2026-06-24 06:26:10.474	2026-06-24 06:26:10.474
761	春夏秋冬	しゅんかしゅうとう	4 mùa, xuân hạ thu đông	130	2026-06-24 06:26:10.478	2026-06-24 06:26:10.478
762	秋	あき	Mùa thu	131	2026-06-24 06:26:10.486	2026-06-24 06:26:10.486
763	秋学期	あきがっき	Học kì mùa thu	131	2026-06-24 06:26:10.49	2026-06-24 06:26:10.49
764	秋風	あきかぜ	Cơn gió thu	131	2026-06-24 06:26:10.493	2026-06-24 06:26:10.493
765	秋分	しゅうぶん	Xuân phân	131	2026-06-24 06:26:10.497	2026-06-24 06:26:10.497
766	晩秋	ばんしゅう	Cuối thu	131	2026-06-24 06:26:10.499	2026-06-24 06:26:10.499
767	春夏秋冬	しゅんかしゅうとう	4 mùa, xuân hạ thu đông	131	2026-06-24 06:26:10.502	2026-06-24 06:26:10.502
768	冬	ふゆ	Mùa đông	132	2026-06-24 06:26:10.505	2026-06-24 06:26:10.505
769	冬休	ふゆやす	Giữa đông	132	2026-06-24 06:26:10.506	2026-06-24 06:26:10.506
770	冬至	とうじ	Đông chí	132	2026-06-24 06:26:10.508	2026-06-24 06:26:10.508
771	冬眠	とうみん	Sự ngủ đông	132	2026-06-24 06:26:10.509	2026-06-24 06:26:10.509
772	暖冬	だんとう	Mùa đông ấm áp	132	2026-06-24 06:26:10.511	2026-06-24 06:26:10.511
773	春夏秋冬	しゅんかしゅうとう	4 mùa, xuân hạ thu đông	132	2026-06-24 06:26:10.514	2026-06-24 06:26:10.514
774	十月	じゅうがつ	Buổi sáng	133	2026-06-24 06:26:10.517	2026-06-24 06:26:10.517
775	毎朝	まいあさ	Mỗi buổi sáng	133	2026-06-24 06:26:10.519	2026-06-24 06:26:10.519
776	今朝	けさ	Sáng nay	133	2026-06-24 06:26:10.52	2026-06-24 06:26:10.52
777	朝	あさ	Bữa ăn sáng	133	2026-06-24 06:26:10.521	2026-06-24 06:26:10.521
778	朝寝坊	あさねぼう	Báo ra buối sáng	133	2026-06-24 06:26:10.523	2026-06-24 06:26:10.523
779	北朝鮮	きたちょうせん	Bắc Triều Tiên	133	2026-06-24 06:26:10.524	2026-06-24 06:26:10.524
780	昼	ひる	Buổi trưa, ban ngày	134	2026-06-24 06:26:10.527	2026-06-24 06:26:10.527
781	昼間	ひるま	Ban ngày	134	2026-06-24 06:26:10.53	2026-06-24 06:26:10.53
782	昼休	ひるやす	Buổi ăn trưa	134	2026-06-24 06:26:10.532	2026-06-24 06:26:10.532
783	昼寝	ひるね	Giấc ngủ trưa	134	2026-06-24 06:26:10.534	2026-06-24 06:26:10.534
784	夕方	ゆうがた	Buổi chiều	135	2026-06-24 06:26:10.537	2026-06-24 06:26:10.537
785	夕日	ゆうひ	Mặt trời lúc ban chiều	135	2026-06-24 06:26:10.539	2026-06-24 06:26:10.539
786	夕食	ゆうしょく	Bữa ăn chiều	135	2026-06-24 06:26:10.54	2026-06-24 06:26:10.54
787	七夕	たなばた	Lễ hội thất tịch	135	2026-06-24 06:26:10.542	2026-06-24 06:26:10.542
788	夕刊	ゆうかん	Báo ra lúc chiều	135	2026-06-24 06:26:10.544	2026-06-24 06:26:10.544
789	夕立	ゆうだち	Cơn mưa rào ban đêm	135	2026-06-24 06:26:10.548	2026-06-24 06:26:10.548
790	一朝一夕	いっちょういっせき	Trong khoảng thời gian ngắn	135	2026-06-24 06:26:10.55	2026-06-24 06:26:10.55
791	旗	はた	Cách đọc	136	2026-06-24 06:26:10.555	2026-06-24 06:26:10.555
792	夕方	ゆうがた	Buổi chiều	136	2026-06-24 06:26:10.558	2026-06-24 06:26:10.558
793	方	かた	Vị (người) kia	136	2026-06-24 06:26:10.56	2026-06-24 06:26:10.56
794	両方	りょうほう	2 bên, song phương	136	2026-06-24 06:26:10.564	2026-06-24 06:26:10.564
795	方法	ほうほう	Phương pháp	136	2026-06-24 06:26:10.566	2026-06-24 06:26:10.566
796	方向	ほうこう	Phương hướng	136	2026-06-24 06:26:10.568	2026-06-24 06:26:10.568
797	方言	ほうげん	Phương ngữ, tiếng địa phương	136	2026-06-24 06:26:10.57	2026-06-24 06:26:10.57
798	長方形	ちょうほうけい	Hình chữ nhật	136	2026-06-24 06:26:10.572	2026-06-24 06:26:10.572
799	晩	ばん	Buổi tối	137	2026-06-24 06:26:10.577	2026-06-24 06:26:10.577
800	今晩	こんばん	Tối nay	137	2026-06-24 06:26:10.581	2026-06-24 06:26:10.581
801	毎晩	まいばん	Mỗi tối	137	2026-06-24 06:26:10.584	2026-06-24 06:26:10.584
802	晩御飯	ばんごはん	Cơm tối	137	2026-06-24 06:26:10.586	2026-06-24 06:26:10.586
803	晩婚	ばんこん	Sự kết  hôn muộn	137	2026-06-24 06:26:10.588	2026-06-24 06:26:10.588
804	晩年	ばんねん	Những năm cuối đời	137	2026-06-24 06:26:10.59	2026-06-24 06:26:10.59
805	夜	よる	Buổi tối	138	2026-06-24 06:26:10.596	2026-06-24 06:26:10.596
806	今夜	こんや	Tối nay	138	2026-06-24 06:26:10.599	2026-06-24 06:26:10.599
807	夜中	よなか	Nửa đêm, ban đêm	138	2026-06-24 06:26:10.602	2026-06-24 06:26:10.602
808	夜明	よあ	Đêm khuya, khuya khoắt	138	2026-06-24 06:26:10.604	2026-06-24 06:26:10.604
809	夜食	やしょく	Bữa ăn khuya	138	2026-06-24 06:26:10.607	2026-06-24 06:26:10.607
810	心臓	しんぞう	Trái tim, tâm hồn, tận đáy lòng	139	2026-06-24 06:26:10.615	2026-06-24 06:26:10.615
811	安心	あんしん	Trung tâm	139	2026-06-24 06:26:10.617	2026-06-24 06:26:10.617
812	熱心	ねっしん	Tâm lý học	139	2026-06-24 06:26:10.62	2026-06-24 06:26:10.62
813	手	て	Tay	140	2026-06-24 06:26:10.625	2026-06-24 06:26:10.625
814	下手	へた	Thư	140	2026-06-24 06:26:10.627	2026-06-24 06:26:10.627
815	手洗	てあら	Tem	140	2026-06-24 06:26:10.631	2026-06-24 06:26:10.631
816	手伝	てつだ	Ca sĩ	140	2026-06-24 06:26:10.633	2026-06-24 06:26:10.633
817	足	あし	Bước chân	141	2026-06-24 06:26:10.637	2026-06-24 06:26:10.637
818	足	た	1 cặp	141	2026-06-24 06:26:10.639	2026-06-24 06:26:10.639
819	水不足	みずぶそく	Tình trạng thiếu nước	141	2026-06-24 06:26:10.642	2026-06-24 06:26:10.642
820	遠足	えんそく	Dã ngoại	141	2026-06-24 06:26:10.644	2026-06-24 06:26:10.644
821	満足	まんぞく	Thõa mãn, hài lòng	141	2026-06-24 06:26:10.648	2026-06-24 06:26:10.648
822	足音	あしおと	Tiếng bước chân	141	2026-06-24 06:26:10.651	2026-06-24 06:26:10.651
823	体	からだ	Cơ thể	142	2026-06-24 06:26:10.656	2026-06-24 06:26:10.656
824	体重	たいじゅう	Cân nặng, trọng lượng cơ thể	142	2026-06-24 06:26:10.658	2026-06-24 06:26:10.658
825	体操	たいそう	Bài tập thể dục	142	2026-06-24 06:26:10.661	2026-06-24 06:26:10.661
826	体温	たいおん	Nhiệt độ cơ thể, thân nhiệt	142	2026-06-24 06:26:10.665	2026-06-24 06:26:10.665
827	全体	ぜんたい	Toàn thể, cả người	142	2026-06-24 06:26:10.667	2026-06-24 06:26:10.667
828	団体	だんたい	Đoàn thể	142	2026-06-24 06:26:10.669	2026-06-24 06:26:10.669
829	世間体	せけんてい	Đúng đắn, lịch sự, tao nhã	142	2026-06-24 06:26:10.672	2026-06-24 06:26:10.672
830	体調	たいちょう	Tình trạng cơ thể	142	2026-06-24 06:26:10.68	2026-06-24 06:26:10.68
831	首	くび	Cổ	143	2026-06-24 06:26:10.688	2026-06-24 06:26:10.688
832	首	くび	Cổ tay	143	2026-06-24 06:26:10.694	2026-06-24 06:26:10.694
833	首相	しゅしょう	Thủ tướng	143	2026-06-24 06:26:10.702	2026-06-24 06:26:10.702
834	首都	しゅと	Thủ đô	143	2026-06-24 06:26:10.711	2026-06-24 06:26:10.711
835	首位	しゅい	Vị trí đầu tiên, đứng đầu	143	2026-06-24 06:26:10.716	2026-06-24 06:26:10.716
836	部首	ぶしゅ	Bộ (chữ Hán)	143	2026-06-24 06:26:10.72	2026-06-24 06:26:10.72
837	道	みち	Đường	144	2026-06-24 06:26:10.729	2026-06-24 06:26:10.729
838	片道	かたみち	Đường một chiều	144	2026-06-24 06:26:10.732	2026-06-24 06:26:10.732
839	書道	しょどう	Thư pháp	144	2026-06-24 06:26:10.735	2026-06-24 06:26:10.735
840	柔道	じゅうどう	Nhu đạo, Môn võ judo	144	2026-06-24 06:26:10.738	2026-06-24 06:26:10.738
841	北海道	ほっかいどう	Hokkaido Nhật bản	144	2026-06-24 06:26:10.741	2026-06-24 06:26:10.741
842	道具	どうぐ	Dụng cụ	144	2026-06-24 06:26:10.745	2026-06-24 06:26:10.745
843	歩道	ほどう	Đường đi bộ	144	2026-06-24 06:26:10.748	2026-06-24 06:26:10.748
844	近道	ちかみち	Đường tắt	144	2026-06-24 06:26:10.752	2026-06-24 06:26:10.752
845	山	やま	Núi	145	2026-06-24 06:26:10.757	2026-06-24 06:26:10.757
846	山道	やまみち	Đường núi	145	2026-06-24 06:26:10.758	2026-06-24 06:26:10.758
847	山田	やまだ	Núi Phú Sĩ	145	2026-06-24 06:26:10.76	2026-06-24 06:26:10.76
848	火山	かざん	Núi lửa	145	2026-06-24 06:26:10.762	2026-06-24 06:26:10.762
849	山火事	やまかじ	Cháy rừng	145	2026-06-24 06:26:10.764	2026-06-24 06:26:10.764
850	登山	とざん	Leo núi	145	2026-06-24 06:26:10.766	2026-06-24 06:26:10.766
851	山林	さんりん	Sơn lâm, rừng rậm	145	2026-06-24 06:26:10.767	2026-06-24 06:26:10.767
852	川	かわ	Con sông	146	2026-06-24 06:26:10.77	2026-06-24 06:26:10.77
853	小川	おがわ	Sông Nile	146	2026-06-24 06:26:10.771	2026-06-24 06:26:10.771
854	天	あま	Dải ngân hà	146	2026-06-24 06:26:10.772	2026-06-24 06:26:10.772
855	川岸	かわぎし	Bờ sông, ven sông	146	2026-06-24 06:26:10.774	2026-06-24 06:26:10.774
856	川遊	かわあそ	Sông ngòi	146	2026-06-24 06:26:10.775	2026-06-24 06:26:10.775
857	二本	にほん	Rừng	147	2026-06-24 06:26:10.78	2026-06-24 06:26:10.78
858	小林	こばやし	Rừng rú	147	2026-06-24 06:26:10.782	2026-06-24 06:26:10.782
859	山林	さんりん	Sơn lâm, rừng rậm	147	2026-06-24 06:26:10.783	2026-06-24 06:26:10.783
860	林業	りんぎょう	Lâm nghiệp	147	2026-06-24 06:26:10.785	2026-06-24 06:26:10.785
861	松林	まつばやし	Rừng thông	147	2026-06-24 06:26:10.786	2026-06-24 06:26:10.786
862	林道	りんどう	Đường mòn trong rừng	147	2026-06-24 06:26:10.787	2026-06-24 06:26:10.787
863	密林	みつりん	Rừng rậm	147	2026-06-24 06:26:10.789	2026-06-24 06:26:10.789
864	三本	さんぼん	Rừng	148	2026-06-24 06:26:10.792	2026-06-24 06:26:10.792
865	森田	もりた	Rừng rú	148	2026-06-24 06:26:10.794	2026-06-24 06:26:10.794
866	窓	まど	Bầu trời	149	2026-06-24 06:26:10.799	2026-06-24 06:26:10.799
867	空気	くうき	Không khí	149	2026-06-24 06:26:10.801	2026-06-24 06:26:10.801
868	空港	くうこう	Sân bay	149	2026-06-24 06:26:10.803	2026-06-24 06:26:10.803
869	航空便	こうくうびん	Bưu phẩm gởi bằng đường hàng không	149	2026-06-24 06:26:10.805	2026-06-24 06:26:10.805
870	空手	からて	Môn võ karate	149	2026-06-24 06:26:10.807	2026-06-24 06:26:10.807
871	空	あ	Bầu trời rộng lớn	149	2026-06-24 06:26:10.809	2026-06-24 06:26:10.809
872	毎日	まいにち	Biển	150	2026-06-24 06:26:10.815	2026-06-24 06:26:10.815
873	北海道	ほっかいどう	Hokkaido Nhật bản	150	2026-06-24 06:26:10.817	2026-06-24 06:26:10.817
874	海外	かいがい	Nước ngoài	150	2026-06-24 06:26:10.819	2026-06-24 06:26:10.819
875	海	かい	Biển Aegean	150	2026-06-24 06:26:10.82	2026-06-24 06:26:10.82
876	海岸	かいがん	Bờ biển, ven biển	150	2026-06-24 06:26:10.822	2026-06-24 06:26:10.822
877	海賊	かいぞく	Hải tặc, cướp biển	150	2026-06-24 06:26:10.825	2026-06-24 06:26:10.825
878	海藻	かいそう	Taỏ biển, rong biển	150	2026-06-24 06:26:10.828	2026-06-24 06:26:10.828
879	海水	かいすい	Nước biển	150	2026-06-24 06:26:10.832	2026-06-24 06:26:10.832
880	人	ひと	Hóa học	151	2026-06-24 06:26:10.837	2026-06-24 06:26:10.837
881	文化	ぶんか	Văn hóa	151	2026-06-24 06:26:10.839	2026-06-24 06:26:10.839
882	化	ば	Trang điểm	151	2026-06-24 06:26:10.842	2026-06-24 06:26:10.842
883	民主化	みんしゅか	Dân chủ hóa	151	2026-06-24 06:26:10.846	2026-06-24 06:26:10.846
884	変化	へんか	Biến hóa	151	2026-06-24 06:26:10.85	2026-06-24 06:26:10.85
885	進化	しんか	Tiến hóa	151	2026-06-24 06:26:10.852	2026-06-24 06:26:10.852
886	草	くさ	Hoa	152	2026-06-24 06:26:10.858	2026-06-24 06:26:10.858
887	花見	はなみ	Ngắm hoa anh đào nở, hội ngắm hoa	152	2026-06-24 06:26:10.861	2026-06-24 06:26:10.861
888	花火	はなび	Pháo hoa	152	2026-06-24 06:26:10.865	2026-06-24 06:26:10.865
889	花屋	はなや	Cửa hàng hoa	152	2026-06-24 06:26:10.867	2026-06-24 06:26:10.867
890	花嫁	はなよめ	Cô dâu	152	2026-06-24 06:26:10.87	2026-06-24 06:26:10.87
891	生	い	Nghệ thuật cắm hoa	152	2026-06-24 06:26:10.872	2026-06-24 06:26:10.872
892	花瓶	かびん	Lọ hoa	152	2026-06-24 06:26:10.875	2026-06-24 06:26:10.875
893	花粉症	かふんしょう	Hội chứng dị ứng phấn hoa	152	2026-06-24 06:26:10.877	2026-06-24 06:26:10.877
894	両手	りょうて	Thời tiết	153	2026-06-24 06:26:10.882	2026-06-24 06:26:10.882
895	天気	てんき	Dự báo thời tiết	153	2026-06-24 06:26:10.884	2026-06-24 06:26:10.884
896	天国	てんごく	Thiên đường	153	2026-06-24 06:26:10.885	2026-06-24 06:26:10.885
897	天皇	てんのう	Hoàng đế	153	2026-06-24 06:26:10.887	2026-06-24 06:26:10.887
898	天使	てんし	Thiên sứ	153	2026-06-24 06:26:10.888	2026-06-24 06:26:10.888
899	天才	てんさい	Thiên tài	153	2026-06-24 06:26:10.89	2026-06-24 06:26:10.89
900	天	あま	Dải ngân hà	153	2026-06-24 06:26:10.892	2026-06-24 06:26:10.892
901	天文学	てんもんがく	Thiên văn học	153	2026-06-24 06:26:10.894	2026-06-24 06:26:10.894
902	日	ひ	Màu đỏ	154	2026-06-24 06:26:10.9	2026-06-24 06:26:10.9
903	赤	あか	Lỗ	154	2026-06-24 06:26:10.901	2026-06-24 06:26:10.901
904	真	ま	Đỏ bừng	154	2026-06-24 06:26:10.904	2026-06-24 06:26:10.904
905	赤十字	せきじゅうじ	Chữ thập đỏ	154	2026-06-24 06:26:10.906	2026-06-24 06:26:10.906
906	赤道	せきどう	Đường xích đạo	154	2026-06-24 06:26:10.908	2026-06-24 06:26:10.908
907	赤飯	せきはん	Gạo đỏ	154	2026-06-24 06:26:10.909	2026-06-24 06:26:10.909
908	赤外線	せきがいせん	Tia hồng ngoại	154	2026-06-24 06:26:10.913	2026-06-24 06:26:10.913
909	青	あお	Màu Xanh	155	2026-06-24 06:26:10.918	2026-06-24 06:26:10.918
910	青	あお	Bầu trời xanh	155	2026-06-24 06:26:10.92	2026-06-24 06:26:10.92
911	青信号	あおしんごう	Đèn xanh	155	2026-06-24 06:26:10.922	2026-06-24 06:26:10.922
912	青森	あおもり	Rừng xanh	155	2026-06-24 06:26:10.924	2026-06-24 06:26:10.924
913	青年	せいねん	Thanh niên	155	2026-06-24 06:26:10.927	2026-06-24 06:26:10.927
914	真	ま	Xanh lè	155	2026-06-24 06:26:10.931	2026-06-24 06:26:10.931
915	青春	せいしゅん	Thanh xuân	155	2026-06-24 06:26:10.934	2026-06-24 06:26:10.934
916	白	しろ	Màu trắng	156	2026-06-24 06:26:10.939	2026-06-24 06:26:10.939
917	白	しろ	Trắng đen	156	2026-06-24 06:26:10.941	2026-06-24 06:26:10.941
918	面白	おもしろ	Tóc bạc	156	2026-06-24 06:26:10.943	2026-06-24 06:26:10.943
919	白髪	はくはつ	Tóc bạc	156	2026-06-24 06:26:10.946	2026-06-24 06:26:10.946
920	真	ま	Trắng toát	156	2026-06-24 06:26:10.949	2026-06-24 06:26:10.949
921	白紙	はくし	Giấy trắng	156	2026-06-24 06:26:10.95	2026-06-24 06:26:10.95
922	白鳥	はくちょう	Thiên nga	156	2026-06-24 06:26:10.952	2026-06-24 06:26:10.952
923	白夜	びゃくや	Hiện tượng đêm trắng	156	2026-06-24 06:26:10.954	2026-06-24 06:26:10.954
924	田	た	Màu đen	157	2026-06-24 06:26:10.958	2026-06-24 06:26:10.958
925	黒	くろ	Trắng đen	157	2026-06-24 06:26:10.96	2026-06-24 06:26:10.96
926	黒猫	くろねこ	Mèo mun	157	2026-06-24 06:26:10.964	2026-06-24 06:26:10.964
927	黒板	こくばん	Bảng đen	157	2026-06-24 06:26:10.966	2026-06-24 06:26:10.966
928	真	ま	Đen thui	157	2026-06-24 06:26:10.968	2026-06-24 06:26:10.968
929	黒字	くろじ	Lãi	157	2026-06-24 06:26:10.971	2026-06-24 06:26:10.971
930	二人	ふたり	Màu sắc	158	2026-06-24 06:26:10.975	2026-06-24 06:26:10.975
931	色々	いろいろ	Màu xanh nước biển	158	2026-06-24 06:26:10.979	2026-06-24 06:26:10.979
932	灰色	はいいろ	Màu xám	158	2026-06-24 06:26:10.982	2026-06-24 06:26:10.982
933	色鉛筆	いろえんぴつ	Bút chì màu	158	2026-06-24 06:26:10.984	2026-06-24 06:26:10.984
934	景色	けしき	Phong cảnh	158	2026-06-24 06:26:10.986	2026-06-24 06:26:10.986
935	特色	とくしょく	Đặc sắc	158	2026-06-24 06:26:10.988	2026-06-24 06:26:10.988
936	脱色	だっしょく	Phai màu	158	2026-06-24 06:26:10.991	2026-06-24 06:26:10.991
937	魚	さかな	Cá	159	2026-06-24 06:26:10.998	2026-06-24 06:26:10.998
938	魚屋	さかなや	Cửa hàng cá	159	2026-06-24 06:26:11.001	2026-06-24 06:26:11.001
939	小魚	こざかな	Cá con	159	2026-06-24 06:26:11.003	2026-06-24 06:26:11.003
940	魚市場	うおいちば	Chợ cá	159	2026-06-24 06:26:11.006	2026-06-24 06:26:11.006
941	金魚	きんぎょ	Cá vàng	159	2026-06-24 06:26:11.009	2026-06-24 06:26:11.009
942	人魚	にんぎょ	Người cá	159	2026-06-24 06:26:11.013	2026-06-24 06:26:11.013
943	熱帯魚	ねったいぎょ	Cá nhiệt đới	159	2026-06-24 06:26:11.017	2026-06-24 06:26:11.017
944	魚介類	ぎょかいるい	Hải sản	159	2026-06-24 06:26:11.02	2026-06-24 06:26:11.02
945	犬	いぬ	Con chó	160	2026-06-24 06:26:11.025	2026-06-24 06:26:11.025
946	子犬	こいぬ	Cún con	160	2026-06-24 06:26:11.03	2026-06-24 06:26:11.03
947	番犬	ばんけん	Chó giữ cổng	160	2026-06-24 06:26:11.033	2026-06-24 06:26:11.033
948	盲導犬	もうどうけん	Chó dẫn đường	160	2026-06-24 06:26:11.036	2026-06-24 06:26:11.036
949	犬猿	けんえん	Ghét nhau như chó với mèo	160	2026-06-24 06:26:11.039	2026-06-24 06:26:11.039
950	猟犬	りょうけん	Chó săn	160	2026-06-24 06:26:11.043	2026-06-24 06:26:11.043
951	狂犬病	きょうけんびょう	Bệnh dại	160	2026-06-24 06:26:11.048	2026-06-24 06:26:11.048
952	米	こめ	Thức ăn	161	2026-06-24 06:26:11.058	2026-06-24 06:26:11.058
953	食料品	しょくりょうひん	Thực phẩm, nguyên liệu nấu ăn	161	2026-06-24 06:26:11.062	2026-06-24 06:26:11.062
954	無料	むりょう	Miễn phí	161	2026-06-24 06:26:11.066	2026-06-24 06:26:11.066
955	料金	りょうきん	Tiền cước	161	2026-06-24 06:26:11.069	2026-06-24 06:26:11.069
956	授業料	じゅぎょうりょう	Tiền học phí	161	2026-06-24 06:26:11.072	2026-06-24 06:26:11.072
957	給料	きゅうりょう	Tiền lương	161	2026-06-24 06:26:11.076	2026-06-24 06:26:11.076
958	材料	ざいりょう	Tài liệu	161	2026-06-24 06:26:11.08	2026-06-24 06:26:11.08
959	資料	しりょう	Tư liệu	161	2026-06-24 06:26:11.083	2026-06-24 06:26:11.083
960	王様	おうさま	Thức ăn, món ăn	162	2026-06-24 06:26:11.089	2026-06-24 06:26:11.089
961	無理	むり	Lý do	162	2026-06-24 06:26:11.091	2026-06-24 06:26:11.091
962	地理	ちり	Địa lý	162	2026-06-24 06:26:11.095	2026-06-24 06:26:11.095
963	修理	しゅうり	Sửa chữa	162	2026-06-24 06:26:11.099	2026-06-24 06:26:11.099
964	理想	りそう	Lý tưởng	162	2026-06-24 06:26:11.102	2026-06-24 06:26:11.102
965	理解	りかい	Lý giải, thấu hiểu	162	2026-06-24 06:26:11.105	2026-06-24 06:26:11.105
966	心理学	しんりがく	Tâm lý học	162	2026-06-24 06:26:11.108	2026-06-24 06:26:11.108
967	私	わたし	Vi phạm	163	2026-06-24 06:26:11.115	2026-06-24 06:26:11.115
968	反省	はんせい	Sự xem xét lại, , phản tỉnh	163	2026-06-24 06:26:11.118	2026-06-24 06:26:11.118
969	反抗	はんこう	Sự phản kháng	163	2026-06-24 06:26:11.121	2026-06-24 06:26:11.121
970	反	そ	Phản ứng	163	2026-06-24 06:26:11.124	2026-06-24 06:26:11.124
971	反物	たんもの	Tấm vải	163	2026-06-24 06:26:11.128	2026-06-24 06:26:11.128
972	謀反	むほん	Cuộc nổi loạn, mưu phản	163	2026-06-24 06:26:11.132	2026-06-24 06:26:11.132
973	皆	みな	Cơm	164	2026-06-24 06:26:11.139	2026-06-24 06:26:11.139
974	朝	あさ	Cơm sáng	164	2026-06-24 06:26:11.142	2026-06-24 06:26:11.142
975	昼	ひる	Cơm trưa	164	2026-06-24 06:26:11.146	2026-06-24 06:26:11.146
976	晩	ばん	Cơm tối	164	2026-06-24 06:26:11.149	2026-06-24 06:26:11.149
977	飯	めし	Cơm (lịch sự)	164	2026-06-24 06:26:11.152	2026-06-24 06:26:11.152
978	炊飯器	すいはんき	Nồi cơm điện	164	2026-06-24 06:26:11.154	2026-06-24 06:26:11.154
979	津	つ	Con bò	165	2026-06-24 06:26:11.16	2026-06-24 06:26:11.16
980	牛肉	ぎゅうにく	Thịt bò	165	2026-06-24 06:26:11.164	2026-06-24 06:26:11.164
981	牛乳	ぎゅうにゅう	Sữa bò	165	2026-06-24 06:26:11.167	2026-06-24 06:26:11.167
982	子牛	こうし	Con bê	165	2026-06-24 06:26:11.169	2026-06-24 06:26:11.169
983	牡牛座	おうしざ	Cung Kim ngưu	165	2026-06-24 06:26:11.171	2026-06-24 06:26:11.171
984	水牛	すいぎゅう	Con trâu nước	165	2026-06-24 06:26:11.173	2026-06-24 06:26:11.173
985	牛丼	ぎゅうどん	Cơm gyudon (cơm thịt bò Nhật Bản)	165	2026-06-24 06:26:11.175	2026-06-24 06:26:11.175
986	闘牛	とうぎゅう	Đấu bò	165	2026-06-24 06:26:11.178	2026-06-24 06:26:11.178
987	豚	ぶた	Con heo	166	2026-06-24 06:26:11.182	2026-06-24 06:26:11.182
988	豚肉	ぶたにく	Thịt heo	166	2026-06-24 06:26:11.183	2026-06-24 06:26:11.183
989	子豚	こぶた	Con heo con	166	2026-06-24 06:26:11.185	2026-06-24 06:26:11.185
990	鳥	とり	Con chim	167	2026-06-24 06:26:11.188	2026-06-24 06:26:11.188
991	小鳥	ことり	Con chim nhỏ, chim non	167	2026-06-24 06:26:11.19	2026-06-24 06:26:11.19
992	鳥肉	とりにく	Thịt chim, thịt gà	167	2026-06-24 06:26:11.191	2026-06-24 06:26:11.191
993	白鳥	はくちょう	Con thiên nga	167	2026-06-24 06:26:11.193	2026-06-24 06:26:11.193
994	焼	や	Gà nướng	167	2026-06-24 06:26:11.196	2026-06-24 06:26:11.196
995	鳥居	とりい	Cổng đền thở đạo Shinto	167	2026-06-24 06:26:11.198	2026-06-24 06:26:11.198
996	一石二鳥	いっせきにちょう	Một mũi tên trúng 2 đích (thành ngữ)	167	2026-06-24 06:26:11.199	2026-06-24 06:26:11.199
997	肉	にく	Thịt	168	2026-06-24 06:26:11.203	2026-06-24 06:26:11.203
998	牛肉	ぎゅうにく	Thịt bò	168	2026-06-24 06:26:11.204	2026-06-24 06:26:11.204
999	豚肉	ぶたにく	Thịt heo	168	2026-06-24 06:26:11.206	2026-06-24 06:26:11.206
1000	鳥肉	とりにく	Thịt gà	168	2026-06-24 06:26:11.207	2026-06-24 06:26:11.207
1001	肉屋	にくや	Cửa hàng thịt	168	2026-06-24 06:26:11.209	2026-06-24 06:26:11.209
1002	筋肉	きんにく	Cơ bắp	168	2026-06-24 06:26:11.212	2026-06-24 06:26:11.212
1003	皮肉	ひにく	Diễu cợt, châm chọc	168	2026-06-24 06:26:11.215	2026-06-24 06:26:11.215
1004	二人	ふたり	Trà	169	2026-06-24 06:26:11.22	2026-06-24 06:26:11.22
1005	茶色	ちゃいろ	Màu trà	169	2026-06-24 06:26:11.222	2026-06-24 06:26:11.222
1006	紅茶	こうちゃ	Hồng trà	169	2026-06-24 06:26:11.224	2026-06-24 06:26:11.224
1007	喫茶店	きっさてん	Tiệm giải khát, quán Cà phê	169	2026-06-24 06:26:11.226	2026-06-24 06:26:11.226
1008	茶碗	ちゃわん	Tách trà	169	2026-06-24 06:26:11.229	2026-06-24 06:26:11.229
1009	茶道	さどう	Trà đạo	169	2026-06-24 06:26:11.232	2026-06-24 06:26:11.232
1010	茶道	ちゃどう	Trà đạo	169	2026-06-24 06:26:11.234	2026-06-24 06:26:11.234
1011	無茶苦茶	むちゃくちゃ	Lộn xộn, rối tung, bời	169	2026-06-24 06:26:11.236	2026-06-24 06:26:11.236
1012	茶店	ちゃみせ	Tiệm trà	169	2026-06-24 06:26:11.237	2026-06-24 06:26:11.237
1013	母親	ははおや	Dự định	170	2026-06-24 06:26:11.241	2026-06-24 06:26:11.241
1014	予約	よやく	Đặt chỗ, hẹn trước	170	2026-06-24 06:26:11.243	2026-06-24 06:26:11.243
1015	予習	よしゅう	Xem bài mới, soạn bài	170	2026-06-24 06:26:11.246	2026-06-24 06:26:11.246
1016	天気	てんき	Dự báo thời tiết	170	2026-06-24 06:26:11.248	2026-06-24 06:26:11.248
1017	予算	よさん	Ngân sách, ngân quỹ	170	2026-06-24 06:26:11.25	2026-06-24 06:26:11.25
1018	予測	よそく	Sự báo trước, ước lượng	170	2026-06-24 06:26:11.251	2026-06-24 06:26:11.251
1019	予防	よぼう	Phòng ngừa	170	2026-06-24 06:26:11.253	2026-06-24 06:26:11.253
1020	予言	よげん	Lời tiên đoán, tiên trì	170	2026-06-24 06:26:11.255	2026-06-24 06:26:11.255
1021	野原	のはら	Rau	171	2026-06-24 06:26:11.259	2026-06-24 06:26:11.259
1022	長野	ながの	Tỉnh Nagano, 1 tỉnh của Nhật Bản	171	2026-06-24 06:26:11.262	2026-06-24 06:26:11.262
1023	小野	おの	Bóng chày	171	2026-06-24 06:26:11.264	2026-06-24 06:26:11.264
1024	分野	ぶんや	Lĩnh vực	171	2026-06-24 06:26:11.266	2026-06-24 06:26:11.266
1025	野党	やとう	Đảng chống đối	171	2026-06-24 06:26:11.268	2026-06-24 06:26:11.268
1026	野原	のはら	Cánh đồng	171	2026-06-24 06:26:11.27	2026-06-24 06:26:11.27
1027	草	くさ	Rau	172	2026-06-24 06:26:11.275	2026-06-24 06:26:11.275
1028	菜園	さいえん	Vườn rau	172	2026-06-24 06:26:11.277	2026-06-24 06:26:11.277
1029	菜	な	Cánh đồng hoa	172	2026-06-24 06:26:11.281	2026-06-24 06:26:11.281
1030	白菜	はくさい	Cải thảo	172	2026-06-24 06:26:11.284	2026-06-24 06:26:11.284
1031	山菜	さんさい	Rau dại ở núi	172	2026-06-24 06:26:11.286	2026-06-24 06:26:11.286
1032	菜食	さいしょく	Người theo chủ nghĩa ăn chay	172	2026-06-24 06:26:11.288	2026-06-24 06:26:11.288
1033	七人	しちにん	Con tem	173	2026-06-24 06:26:11.292	2026-06-24 06:26:11.292
1034	大切	たいせつ	Vé	173	2026-06-24 06:26:11.296	2026-06-24 06:26:11.296
1035	締	し	Hoàn toàn (không)	173	2026-06-24 06:26:11.302	2026-06-24 06:26:11.302
1036	人	ひと	Sự viết văn, sự làm văn, bài văn	174	2026-06-24 06:26:11.307	2026-06-24 06:26:11.307
1037	作品	さくひん	Tác phẩm	174	2026-06-24 06:26:11.309	2026-06-24 06:26:11.309
1038	作家	さっか	Tác gia, nhà văn	174	2026-06-24 06:26:11.312	2026-06-24 06:26:11.312
1039	操作	そうさ	Thao tác, điều khiển	174	2026-06-24 06:26:11.317	2026-06-24 06:26:11.317
1040	名作	めいさく	Tác phẩm danh tiếng	174	2026-06-24 06:26:11.319	2026-06-24 06:26:11.319
1041	動作	どうさ	Động tác	174	2026-06-24 06:26:11.32	2026-06-24 06:26:11.32
1042	木	き	Tương lai	175	2026-06-24 06:26:11.323	2026-06-24 06:26:11.323
1043	未満	みまん	Không đầy đủ	175	2026-06-24 06:26:11.325	2026-06-24 06:26:11.325
1044	未婚	みこん	Sự chưa kết hôn, sự chưa cưới	175	2026-06-24 06:26:11.326	2026-06-24 06:26:11.326
1045	未定	みてい	Sự chưa được quyết định	175	2026-06-24 06:26:11.329	2026-06-24 06:26:11.329
1046	未成年	みせいねん	Vị thành niên, chưa đủ tuổi	175	2026-06-24 06:26:11.331	2026-06-24 06:26:11.331
1047	未熟	みじゅく	Chưa có kinh nghiệm, chưa chín chắn	175	2026-06-24 06:26:11.333	2026-06-24 06:26:11.333
1048	未明	みめい	Sáng tinh mơ, ban mai	175	2026-06-24 06:26:11.335	2026-06-24 06:26:11.335
1049	味	あじ	Mùi vị	176	2026-06-24 06:26:11.34	2026-06-24 06:26:11.34
1050	意味	いみ	Ý nghĩa	176	2026-06-24 06:26:11.342	2026-06-24 06:26:11.342
1051	趣味	しゅみ	Sở thích	176	2026-06-24 06:26:11.346	2026-06-24 06:26:11.346
1052	興味	きょうみ	Hứng thú	176	2026-06-24 06:26:11.349	2026-06-24 06:26:11.349
1053	味噌	みそ	Tương Miso	176	2026-06-24 06:26:11.351	2026-06-24 06:26:11.351
1054	調味	ちょうみ	Gia vị	176	2026-06-24 06:26:11.353	2026-06-24 06:26:11.353
1055	味	あじ	Đơn giản, mộc mạc	176	2026-06-24 06:26:11.355	2026-06-24 06:26:11.355
1056	日	ひ	Âm nhạc	177	2026-06-24 06:26:11.36	2026-06-24 06:26:11.36
1057	音	おと	Tiếng, âm thanh	177	2026-06-24 06:26:11.362	2026-06-24 06:26:11.362
1058	発音	はつおん	Sự phát âm	177	2026-06-24 06:26:11.364	2026-06-24 06:26:11.364
1059	録音	ろくおん	Sự ghi âm	177	2026-06-24 06:26:11.366	2026-06-24 06:26:11.366
1060	音量	おんりょう	Âm lượng (volume)	177	2026-06-24 06:26:11.367	2026-06-24 06:26:11.367
1061	母音	ぼいん	Nguyên âm	177	2026-06-24 06:26:11.369	2026-06-24 06:26:11.369
1062	子音	しいん	Phụ âm	177	2026-06-24 06:26:11.371	2026-06-24 06:26:11.371
1063	本音	ほんね	ý định thực sự, động cơ	177	2026-06-24 06:26:11.372	2026-06-24 06:26:11.372
1064	木	き	Âm nhạc	178	2026-06-24 06:26:11.377	2026-06-24 06:26:11.377
1065	楽	たの	Nhạc cụ	178	2026-06-24 06:26:11.379	2026-06-24 06:26:11.379
1066	娯楽	ごらく	Vui chơi, giải trí, tiêu khiển	178	2026-06-24 06:26:11.381	2026-06-24 06:26:11.381
1067	大	おお	Bài hát	179	2026-06-24 06:26:11.384	2026-06-24 06:26:11.384
1068	歌	うた	Ca sĩ	179	2026-06-24 06:26:11.386	2026-06-24 06:26:11.386
1069	歌詞	かし	Ca từ, lời bài hát	179	2026-06-24 06:26:11.387	2026-06-24 06:26:11.387
1070	短歌	たんか	Thơ ngắn	179	2026-06-24 06:26:11.388	2026-06-24 06:26:11.388
1071	国歌	こっか	Quốc ca	179	2026-06-24 06:26:11.389	2026-06-24 06:26:11.389
1072	校歌	こうか	Bài hát của trường	179	2026-06-24 06:26:11.391	2026-06-24 06:26:11.391
1073	日本	にほん	bản thân mình, tự mình	180	2026-06-24 06:26:11.394	2026-06-24 06:26:11.394
1074	自転車	じてんしゃ	Xe đạp	180	2026-06-24 06:26:11.397	2026-06-24 06:26:11.397
1075	自動車	じどうしゃ	Xe ô tô	180	2026-06-24 06:26:11.398	2026-06-24 06:26:11.398
1076	自由	じゆう	Tự do	180	2026-06-24 06:26:11.4	2026-06-24 06:26:11.4
1077	自	みずか	Tự nhiên	180	2026-06-24 06:26:11.401	2026-06-24 06:26:11.401
1078	自習	じしゅう	Sự tự ôn tập, tự học	180	2026-06-24 06:26:11.402	2026-06-24 06:26:11.402
1079	自信	じしん	Tự tin	180	2026-06-24 06:26:11.404	2026-06-24 06:26:11.404
1080	車	くるま	Xe đạp	181	2026-06-24 06:26:11.407	2026-06-24 06:26:11.407
1081	運転手	うんてんしゅ	Tài xế	181	2026-06-24 06:26:11.409	2026-06-24 06:26:11.409
1082	転	ころ	Chuyển công tác	181	2026-06-24 06:26:11.412	2026-06-24 06:26:11.412
1083	転校	てんこう	Sự chuyể trường	181	2026-06-24 06:26:11.415	2026-06-24 06:26:11.415
1084	木	き	Phương tiện đi lại	182	2026-06-24 06:26:11.419	2026-06-24 06:26:11.419
1085	乗	の	Phương tiện giao thông	182	2026-06-24 06:26:11.421	2026-06-24 06:26:11.421
1086	乗客	じょうきゃく	Hành khách	182	2026-06-24 06:26:11.423	2026-06-24 06:26:11.423
1087	乗	の	Việc cưỡi ngựa	182	2026-06-24 06:26:11.425	2026-06-24 06:26:11.425
1088	乗車券	じょうしゃけん	Vé xe	182	2026-06-24 06:26:11.426	2026-06-24 06:26:11.426
1089	帽子	ぼうし	Bức ảnh	183	2026-06-24 06:26:11.433	2026-06-24 06:26:11.433
1090	写	うつ	Nhiếp ảnh gia	183	2026-06-24 06:26:11.436	2026-06-24 06:26:11.436
1091	写生	しゃせい	Vẽ phác	183	2026-06-24 06:26:11.438	2026-06-24 06:26:11.438
1092	複写	ふくしゃ	Bản sao	183	2026-06-24 06:26:11.44	2026-06-24 06:26:11.44
1093	描写	びょうしゃ	Chủ nghĩa tả thực	183	2026-06-24 06:26:11.443	2026-06-24 06:26:11.443
1094	私	わたし	2 máy	184	2026-06-24 06:26:11.451	2026-06-24 06:26:11.451
1095	台所	だいどころ	Nhà bếp	184	2026-06-24 06:26:11.454	2026-06-24 06:26:11.454
1096	台風	たいふう	Bão	184	2026-06-24 06:26:11.456	2026-06-24 06:26:11.456
1097	台	だい	Cái giá, khung, bệ	184	2026-06-24 06:26:11.459	2026-06-24 06:26:11.459
1098	舞台	ぶたい	Sân khấu	184	2026-06-24 06:26:11.464	2026-06-24 06:26:11.464
1099	台湾	たいわん	Đài Loan	184	2026-06-24 06:26:11.467	2026-06-24 06:26:11.467
1100	台本	だいほん	Kịch bản	184	2026-06-24 06:26:11.47	2026-06-24 06:26:11.47
1101	人	ひと	Trung ương	185	2026-06-24 06:26:11.476	2026-06-24 06:26:11.476
1102	中央線	ちゅうおうせん	Tuyến tàu Chyuo	185	2026-06-24 06:26:11.48	2026-06-24 06:26:11.48
1103	中央	ちゅうおう	Trung ương tập quyền	185	2026-06-24 06:26:11.483	2026-06-24 06:26:11.483
1104	映画	えいが	Phim ảnh	186	2026-06-24 06:26:11.488	2026-06-24 06:26:11.488
1105	映画館	えいがかん	Rạp chiếu phim	186	2026-06-24 06:26:11.491	2026-06-24 06:26:11.491
1106	田	た	Phim ảnh	187	2026-06-24 06:26:11.498	2026-06-24 06:26:11.498
1107	漫画	まんが	Truyện tranh nhật bản	187	2026-06-24 06:26:11.5	2026-06-24 06:26:11.5
1108	計画	けいかく	Kế hoạch	187	2026-06-24 06:26:11.503	2026-06-24 06:26:11.503
1109	画家	がか	Họa sĩ	187	2026-06-24 06:26:11.506	2026-06-24 06:26:11.506
1110	絵画	かいが	Bức tranh, hội họa	187	2026-06-24 06:26:11.509	2026-06-24 06:26:11.509
1111	画数	かくすう	Số nét	187	2026-06-24 06:26:11.514	2026-06-24 06:26:11.514
1112	画素	がそ	Pixel (phần tử ảnh)	187	2026-06-24 06:26:11.517	2026-06-24 06:26:11.517
1113	羊	ひつじ	Con cừu	188	2026-06-24 06:26:11.523	2026-06-24 06:26:11.523
1114	子羊	こひつじ	cừu con, cừu non	188	2026-06-24 06:26:11.525	2026-06-24 06:26:11.525
1115	羊毛	ようもう	Lông cừu	188	2026-06-24 06:26:11.53	2026-06-24 06:26:11.53
1116	山羊	やぎ	Con dê	188	2026-06-24 06:26:11.533	2026-06-24 06:26:11.533
1117	羊	ひつじ	Âu phục	189	2026-06-24 06:26:11.54	2026-06-24 06:26:11.54
1118	西洋	せいよう	tây phương	189	2026-06-24 06:26:11.543	2026-06-24 06:26:11.543
1119	東洋	とうよう	phương Đông	189	2026-06-24 06:26:11.547	2026-06-24 06:26:11.547
1120	太平洋	たいへいよう	Thái Bình Dương	189	2026-06-24 06:26:11.549	2026-06-24 06:26:11.549
1121	大西洋	たいせいよう	Đại Tây Dương	189	2026-06-24 06:26:11.552	2026-06-24 06:26:11.552
1122	洋式	ようしき	Kiểu Tây	189	2026-06-24 06:26:11.555	2026-06-24 06:26:11.555
1123	洋食	ようしょく	Món ăn Tây	189	2026-06-24 06:26:11.557	2026-06-24 06:26:11.557
1124	洋書	ようしょ	Sách phương Tây	189	2026-06-24 06:26:11.56	2026-06-24 06:26:11.56
1125	月	つき	Trang phục, áo quần	190	2026-06-24 06:26:11.567	2026-06-24 06:26:11.567
1126	洋服	ようふく	Âu phục	190	2026-06-24 06:26:11.569	2026-06-24 06:26:11.569
1127	和服	わふく	Quần áo kiểu Nhật	190	2026-06-24 06:26:11.572	2026-06-24 06:26:11.572
1128	服装	ふくそう	Phục trang	190	2026-06-24 06:26:11.575	2026-06-24 06:26:11.575
1129	克服	こくふく	Đồng phục	190	2026-06-24 06:26:11.578	2026-06-24 06:26:11.578
1130	喪服	もふく	Tang phục	190	2026-06-24 06:26:11.582	2026-06-24 06:26:11.582
1131	征服	せいふく	Chinh phục	190	2026-06-24 06:26:11.586	2026-06-24 06:26:11.586
1132	着	き	Áo khoác	191	2026-06-24 06:26:11.593	2026-06-24 06:26:11.593
1133	下着	したぎ	Quần áo trong	191	2026-06-24 06:26:11.598	2026-06-24 06:26:11.598
1134	着	つ	Bộ Kimono	191	2026-06-24 06:26:11.601	2026-06-24 06:26:11.601
1135	到着	とうちゃく	Sự đến nơi	191	2026-06-24 06:26:11.605	2026-06-24 06:26:11.605
1136	落	お	Áo bơi, quần áo tắm	191	2026-06-24 06:26:11.609	2026-06-24 06:26:11.609
1137	本当	ほんとう	Bức ảnh	192	2026-06-24 06:26:11.618	2026-06-24 06:26:11.618
1138	真	ま	Chính giữa	192	2026-06-24 06:26:11.621	2026-06-24 06:26:11.621
1139	真	ま	Tối đen như mực	192	2026-06-24 06:26:11.625	2026-06-24 06:26:11.625
1140	真	ま	Trắng toát	192	2026-06-24 06:26:11.629	2026-06-24 06:26:11.629
1141	真夜中	まよなか	Giữa đêm khuya	192	2026-06-24 06:26:11.633	2026-06-24 06:26:11.633
1142	真剣	しんけん	Nghiêm trang, đúng đắn	192	2026-06-24 06:26:11.636	2026-06-24 06:26:11.636
1143	真実	しんじつ	Chân thật	192	2026-06-24 06:26:11.64	2026-06-24 06:26:11.64
1144	昔	むかし	Nhà	193	2026-06-24 06:26:11.652	2026-06-24 06:26:11.652
1145	家族	かぞく	Gia đình	193	2026-06-24 06:26:11.655	2026-06-24 06:26:11.655
1146	家内	かない	Vợ, mình	193	2026-06-24 06:26:11.659	2026-06-24 06:26:11.659
1147	家事	かじ	Việc nhà, việc gia đình	193	2026-06-24 06:26:11.663	2026-06-24 06:26:11.663
1148	大家	おおや	Chủ nhà	193	2026-06-24 06:26:11.668	2026-06-24 06:26:11.668
1149	家賃	やちん	Tiền nhà	193	2026-06-24 06:26:11.671	2026-06-24 06:26:11.671
1150	山田家	やまだけ	Gia đình Yamada	193	2026-06-24 06:26:11.675	2026-06-24 06:26:11.675
1151	矢	や	Mũi tên	194	2026-06-24 06:26:11.684	2026-06-24 06:26:11.684
1152	矢印	やじるし	Mũi tên chỉ hướng	194	2026-06-24 06:26:11.688	2026-06-24 06:26:11.688
1153	無理矢理	むりやり	Bằng sức mạnh, sinh động, mạnh mẽ	194	2026-06-24 06:26:11.691	2026-06-24 06:26:11.691
1154	旗	はた	Gia đình	195	2026-06-24 06:26:11.701	2026-06-24 06:26:11.701
1155	親族	しんぞく	Thân tộc, bà con thân thiết, người trong dòng tộc	195	2026-06-24 06:26:11.705	2026-06-24 06:26:11.705
1156	貴族	きぞく	Quý tộc, quý phái	195	2026-06-24 06:26:11.708	2026-06-24 06:26:11.708
1157	民族	みんぞく	Dân tộc	195	2026-06-24 06:26:11.713	2026-06-24 06:26:11.713
1158	水族館	すいぞくかん	Công viên thủy cung	195	2026-06-24 06:26:11.718	2026-06-24 06:26:11.718
1159	木	き	cha mẹ	196	2026-06-24 06:26:11.726	2026-06-24 06:26:11.726
1160	親切	しんせつ	thân sinh	196	2026-06-24 06:26:11.73	2026-06-24 06:26:11.73
1161	親友	しんゆう	bạn thân	196	2026-06-24 06:26:11.735	2026-06-24 06:26:11.735
1162	父親	ちちおや	bố, ba	196	2026-06-24 06:26:11.738	2026-06-24 06:26:11.738
1163	母親	ははおや	mẹ	196	2026-06-24 06:26:11.742	2026-06-24 06:26:11.742
1164	親子	おやこ	cha mẹ và con cái, tình máu mủ	196	2026-06-24 06:26:11.747	2026-06-24 06:26:11.747
1165	兄	あに	Anh	197	2026-06-24 06:26:11.755	2026-06-24 06:26:11.755
1166	兄	にい	Anh em	197	2026-06-24 06:26:11.759	2026-06-24 06:26:11.759
1167	義兄	ぎけい	Anh em kết nghĩa	197	2026-06-24 06:26:11.764	2026-06-24 06:26:11.764
1168	姉	あね	Chị	198	2026-06-24 06:26:11.771	2026-06-24 06:26:11.771
1169	姉	ねえ	Chị em gái	198	2026-06-24 06:26:11.774	2026-06-24 06:26:11.774
1170	姉妹	しまい	Thành phố kết nghĩa	198	2026-06-24 06:26:11.777	2026-06-24 06:26:11.777
1171	弟	おとうと	Em trai	199	2026-06-24 06:26:11.786	2026-06-24 06:26:11.786
1172	兄弟	きょうだい	Anh em trai	199	2026-06-24 06:26:11.79	2026-06-24 06:26:11.79
1173	弟子	でし	đồ đệ ,đệ tử	199	2026-06-24 06:26:11.794	2026-06-24 06:26:11.794
1174	義弟	ぎてい	em kết nghĩa, nghĩa đệ, em rể, em vợ	199	2026-06-24 06:26:11.799	2026-06-24 06:26:11.799
1175	女	おんな	Em gái	200	2026-06-24 06:26:11.807	2026-06-24 06:26:11.807
1176	姉妹	しまい	Chị em gái	200	2026-06-24 06:26:11.811	2026-06-24 06:26:11.811
1177	私	わたし	Tôi	201	2026-06-24 06:26:11.82	2026-06-24 06:26:11.82
1178	私	わたし	Tôi	201	2026-06-24 06:26:11.824	2026-06-24 06:26:11.824
1179	私立	しりつ	Đại học Tư lập	201	2026-06-24 06:26:11.828	2026-06-24 06:26:11.828
1180	私鉄	してつ	đường sắt tư doanh	201	2026-06-24 06:26:11.832	2026-06-24 06:26:11.832
1181	私用	しよう	việc riêng ,dùng cho cá nhân	201	2026-06-24 06:26:11.837	2026-06-24 06:26:11.837
1182	私有	しゆう	tư hữu	201	2026-06-24 06:26:11.84	2026-06-24 06:26:11.84
1183	私生活	しせいかつ	Cuộc sống cá nhân	201	2026-06-24 06:26:11.845	2026-06-24 06:26:11.845
1184	私書箱	ししょばこ	Tủ đựng đồ cá nhân	201	2026-06-24 06:26:11.849	2026-06-24 06:26:11.849
1185	私	わたし	Chồng	202	2026-06-24 06:26:11.857	2026-06-24 06:26:11.857
1186	夫妻	ふさい	Vợ chồng, phu thê	202	2026-06-24 06:26:11.86	2026-06-24 06:26:11.86
1187	夫婦	ふうふ	Vợ chồng	202	2026-06-24 06:26:11.865	2026-06-24 06:26:11.865
1188	大丈夫	だいじょうぶ	Không sao	202	2026-06-24 06:26:11.869	2026-06-24 06:26:11.869
1189	夫人	ふじん	phu nhân	202	2026-06-24 06:26:11.873	2026-06-24 06:26:11.873
1190	工夫	くふう	Đào sâu nghiên cứu, công phu	202	2026-06-24 06:26:11.876	2026-06-24 06:26:11.876
1191	持	も	Vợ, vợ con	203	2026-06-24 06:26:11.886	2026-06-24 06:26:11.886
1192	夫妻	ふさい	vợ chồng, phu thê	203	2026-06-24 06:26:11.89	2026-06-24 06:26:11.89
1193	妻子	さいし	vợ con, thê tử	203	2026-06-24 06:26:11.893	2026-06-24 06:26:11.893
1194	一夫	いっぷ	Đa thê	203	2026-06-24 06:26:11.899	2026-06-24 06:26:11.899
1195	帽子	ぼうし	Người chồng	204	2026-06-24 06:26:11.907	2026-06-24 06:26:11.907
1196	主婦	しゅふ	vợ	204	2026-06-24 06:26:11.912	2026-06-24 06:26:11.912
1197	主語	しゅご	Chủ ngữ	204	2026-06-24 06:26:11.917	2026-06-24 06:26:11.917
1198	主義	しゅぎ	Chủ nghĩa	204	2026-06-24 06:26:11.921	2026-06-24 06:26:11.921
1199	主題	しゅだい	Chủ đề, đề tài	204	2026-06-24 06:26:11.924	2026-06-24 06:26:11.924
1200	主食	しゅしょく	Món ăn chính	204	2026-06-24 06:26:11.928	2026-06-24 06:26:11.928
1201	主	おも	Người chủ, người sở hữu	204	2026-06-24 06:26:11.933	2026-06-24 06:26:11.933
1202	主人	しゅじん	nơi sinh sống, địa chỉ	205	2026-06-24 06:26:11.941	2026-06-24 06:26:11.941
1203	住民	じゅうみん	Người dân cư trú	205	2026-06-24 06:26:11.945	2026-06-24 06:26:11.945
1204	住宅	じゅうたく	Nhà ở, nơi sống	205	2026-06-24 06:26:11.95	2026-06-24 06:26:11.95
1205	衣食住	いしょくじゅう	Nhu cầu ăn uống thiết yếu của cuộc sống	205	2026-06-24 06:26:11.954	2026-06-24 06:26:11.954
1206	糸巻	いとま	Sợi chỉ	206	2026-06-24 06:26:11.962	2026-06-24 06:26:11.962
1207	毛糸	けいと	Sợi len	206	2026-06-24 06:26:11.966	2026-06-24 06:26:11.966
1208	釣	つ	Dây cước câu cá	206	2026-06-24 06:26:11.97	2026-06-24 06:26:11.97
1209	抜糸	ばっし	Vắt chỉ	206	2026-06-24 06:26:11.973	2026-06-24 06:26:11.973
1210	名札	なふだ	Họ tên	207	2026-06-24 06:26:11.982	2026-06-24 06:26:11.982
1211	彼氏	かれし	bạn trai , người yêu	207	2026-06-24 06:26:11.987	2026-06-24 06:26:11.987
1212	大野氏	おおのし	Ông Ono	207	2026-06-24 06:26:11.991	2026-06-24 06:26:11.991
1213	摂氏	せっし	thang chia nhiệt độ lấy điểm đông của nước là 0 và điểm sôi là 100, bách phân	207	2026-06-24 06:26:11.996	2026-06-24 06:26:11.996
1214	華氏	かし	thang nhiệt Fahrenheit	207	2026-06-24 06:26:12	2026-06-24 06:26:12
1215	氏神	うじがみ	thần hộ mạng, thành hoàng, thần hộ mệnh	207	2026-06-24 06:26:12.004	2026-06-24 06:26:12.004
1216	髪	かみ	Giấy	208	2026-06-24 06:26:12.012	2026-06-24 06:26:12.012
1217	手紙	てがみ	Thư	208	2026-06-24 06:26:12.017	2026-06-24 06:26:12.017
1218	表紙	ひょうし	bìa	208	2026-06-24 06:26:12.021	2026-06-24 06:26:12.021
1219	紙幣	しへい	Tiền giấy	208	2026-06-24 06:26:12.025	2026-06-24 06:26:12.025
1220	和紙	わし	giấy Nhật	208	2026-06-24 06:26:12.03	2026-06-24 06:26:12.03
1221	紙	かみ	Nghệ thuật xếp giấy của Nhật Bản	208	2026-06-24 06:26:12.034	2026-06-24 06:26:12.034
1222	老人	ろうじん	Phòng học, lớp học	209	2026-06-24 06:26:12.047	2026-06-24 06:26:12.047
1223	教会	きょうかい	giáo đường, nhà thờ	209	2026-06-24 06:26:12.052	2026-06-24 06:26:12.052
1224	教育	きょういく	Sự giáo dục	209	2026-06-24 06:26:12.056	2026-06-24 06:26:12.056
1225	教授	きょうじゅ	sự giáo dục, giáo dục, giảng dạy	209	2026-06-24 06:26:12.06	2026-06-24 06:26:12.06
1226	教師	きょうし	Giáo viên	209	2026-06-24 06:26:12.065	2026-06-24 06:26:12.065
1227	教科書	きょうかしょ	Sách giáo khoa	209	2026-06-24 06:26:12.07	2026-06-24 06:26:12.07
1228	宗教	しゅうきょう	tôn giáo ,đạo giáo ,đạo	209	2026-06-24 06:26:12.074	2026-06-24 06:26:12.074
1229	土曜日	どようび	Phòng học, lớp học	210	2026-06-24 06:26:12.084	2026-06-24 06:26:12.084
1230	研究室	けんきゅうしつ	Phoòng nghiên cứu	210	2026-06-24 06:26:12.088	2026-06-24 06:26:12.088
1231	会議室	かいぎしつ	Phòng họp	210	2026-06-24 06:26:12.091	2026-06-24 06:26:12.091
1232	待合室	まちあいしつ	Phòng chờ	210	2026-06-24 06:26:12.096	2026-06-24 06:26:12.096
1233	温室	おんしつ	Nhà kính	210	2026-06-24 06:26:12.101	2026-06-24 06:26:12.101
1234	地下室	ちかしつ	Hầm chứa, nền móng, tầng hầm	210	2026-06-24 06:26:12.106	2026-06-24 06:26:12.106
1235	和室	わしつ	phòng ở kiểu Nhật phòng kiểu Nhật	210	2026-06-24 06:26:12.109	2026-06-24 06:26:12.109
1236	浴室	よくしつ	phòng tắm ,buồng tắm	210	2026-06-24 06:26:12.115	2026-06-24 06:26:12.115
1237	羽	はね	Lông, cánh	211	2026-06-24 06:26:12.124	2026-06-24 06:26:12.124
1238	羽根	はね	Cánh, lông vũ	211	2026-06-24 06:26:12.127	2026-06-24 06:26:12.127
1239	一羽	いちわ	Một con (chim, gà, vịt)	211	2026-06-24 06:26:12.132	2026-06-24 06:26:12.132
1240	千羽	せんば	Một trăm con (chim, gà, vịt)	211	2026-06-24 06:26:12.137	2026-06-24 06:26:12.137
1241	羽毛	うもう	Lông cánh	211	2026-06-24 06:26:12.14	2026-06-24 06:26:12.14
1242	鳥	とり	tập luyện	212	2026-06-24 06:26:12.148	2026-06-24 06:26:12.148
1243	習慣	しゅうかん	Thói quen	212	2026-06-24 06:26:12.15	2026-06-24 06:26:12.15
1244	復習	ふくしゅう	Xem lại bài, ôn bài	212	2026-06-24 06:26:12.152	2026-06-24 06:26:12.152
1245	予習	よしゅう	sự soạn bài, xem bài mới	212	2026-06-24 06:26:12.154	2026-06-24 06:26:12.154
1246	学習	がくしゅう	Học tập	212	2026-06-24 06:26:12.155	2026-06-24 06:26:12.155
1247	自習	じしゅう	Sự tự ôn tập, tự học	212	2026-06-24 06:26:12.157	2026-06-24 06:26:12.157
1248	習字	しゅうじ	Sự luyện tập chữ; luyện tập chữ	212	2026-06-24 06:26:12.158	2026-06-24 06:26:12.158
1249	中国	ちゅうごく	Hán tự	213	2026-06-24 06:26:12.163	2026-06-24 06:26:12.163
1250	漢和	かんわ	Từ điển Hán Nhật	213	2026-06-24 06:26:12.165	2026-06-24 06:26:12.165
1251	漢方薬	かんぽうやく	Thuốc đông y; thuốc bắc	213	2026-06-24 06:26:12.166	2026-06-24 06:26:12.166
1252	漢文	かんぶん	thơ văn Nhật Bản mô phỏng thơ văn Trung Quốc	213	2026-06-24 06:26:12.168	2026-06-24 06:26:12.168
1253	子	こ	Chữ, ký tự	214	2026-06-24 06:26:12.172	2026-06-24 06:26:12.172
1254	漢字	かんじ	Hán tự	214	2026-06-24 06:26:12.173	2026-06-24 06:26:12.173
1255	文字	もじ	Chữ, văn tự	214	2026-06-24 06:26:12.174	2026-06-24 06:26:12.174
1256	名字	みょうじ	Họ	214	2026-06-24 06:26:12.176	2026-06-24 06:26:12.176
1257	数字	すうじ	mã ,chữ số, số liệu	214	2026-06-24 06:26:12.178	2026-06-24 06:26:12.178
1258	習字	しゅうじ	sự luyện tập chữ	214	2026-06-24 06:26:12.181	2026-06-24 06:26:12.181
1259	活字	かつじ	chữ in	214	2026-06-24 06:26:12.182	2026-06-24 06:26:12.182
1260	字	じ	Chữ la tinh	214	2026-06-24 06:26:12.184	2026-06-24 06:26:12.184
1261	私	わたし	Lễ nhập học	215	2026-06-24 06:26:12.188	2026-06-24 06:26:12.188
1262	結婚式	けっこんしき	Lễ cưới	215	2026-06-24 06:26:12.19	2026-06-24 06:26:12.19
1263	式	しき	Hình thức; kiểu; lễ; nghi thức	215	2026-06-24 06:26:12.192	2026-06-24 06:26:12.192
1264	正式	せいしき	kiểu Tây	215	2026-06-24 06:26:12.196	2026-06-24 06:26:12.196
1265	和式	わしき	kiểu Nhật	215	2026-06-24 06:26:12.198	2026-06-24 06:26:12.198
1266	式	しき	Kỳ thi, bài thi	216	2026-06-24 06:26:12.203	2026-06-24 06:26:12.203
1267	試合	しあい	cuộc thi đấu, trận đấu	216	2026-06-24 06:26:12.205	2026-06-24 06:26:12.205
1268	試	ため	Kỳ thi trước khi nhập học; kỳ thi tuyển sinh	216	2026-06-24 06:26:12.207	2026-06-24 06:26:12.207
1269	試食	ししょく	sự nếm thử, ăn thử	216	2026-06-24 06:26:12.209	2026-06-24 06:26:12.209
1270	山	やま	Kỳ thi, bài thi	217	2026-06-24 06:26:12.216	2026-06-24 06:26:12.216
1271	経験	けいけん	kinh nghiệm	217	2026-06-24 06:26:12.218	2026-06-24 06:26:12.218
1272	実験	じっけん	thực nghiệm ,thí nghiệm ,suy nghiệm ,kinh nghiệm thực tế	217	2026-06-24 06:26:12.22	2026-06-24 06:26:12.22
1273	受験	じゅけん	ứng thí ,sự tham gia kì thi, dự thi	217	2026-06-24 06:26:12.222	2026-06-24 06:26:12.222
1274	体験	たいけん	thể tích ,sự thể nghiệm, sự trải nghiệm	217	2026-06-24 06:26:12.224	2026-06-24 06:26:12.224
1275	宿	やど	Bài tập về nhà	218	2026-06-24 06:26:12.23	2026-06-24 06:26:12.23
1276	下宿	げしゅく	nhà trọ	218	2026-06-24 06:26:12.232	2026-06-24 06:26:12.232
1277	宿泊	しゅくはく	Ngủ trọ, trọ lại	218	2026-06-24 06:26:12.233	2026-06-24 06:26:12.233
1278	宿	やど	Nhà trọ, chỗ trú	218	2026-06-24 06:26:12.235	2026-06-24 06:26:12.235
1279	民宿	みんしゅく	Nhà trọ của dân cho khách du lịch thuê; nhà trọ tư nhân	218	2026-06-24 06:26:12.236	2026-06-24 06:26:12.236
1280	記者	きしゃ	Bài tập về nhà	219	2026-06-24 06:26:12.239	2026-06-24 06:26:12.239
1281	問題	もんだい	Vấn đề	219	2026-06-24 06:26:12.24	2026-06-24 06:26:12.24
1282	題	だい	Vấn đề; chủ đề	219	2026-06-24 06:26:12.242	2026-06-24 06:26:12.242
1283	題名	だいめい	tên (sách, bài hát.v.v...) ,nhan đề	219	2026-06-24 06:26:12.243	2026-06-24 06:26:12.243
1284	話題	わだい	Chủ đề, tiêu đề	219	2026-06-24 06:26:12.245	2026-06-24 06:26:12.245
1285	議題	ぎだい	đề án hội nghị, vấn đề thảo luận	219	2026-06-24 06:26:12.247	2026-06-24 06:26:12.247
1286	課題	かだい	chủ đề, đề tài	219	2026-06-24 06:26:12.249	2026-06-24 06:26:12.249
1287	主題	しゅだい	đề tài, chủ đề	219	2026-06-24 06:26:12.251	2026-06-24 06:26:12.251
1288	古	ふる	văn học	220	2026-06-24 06:26:12.254	2026-06-24 06:26:12.254
1289	作文	さくぶん	sự viết văn, sự làm văn, đoạn văn	220	2026-06-24 06:26:12.256	2026-06-24 06:26:12.256
1290	文化	ぶんか	Văn hóa	220	2026-06-24 06:26:12.258	2026-06-24 06:26:12.258
1291	文字	もじ	Chữ, văn tự	220	2026-06-24 06:26:12.259	2026-06-24 06:26:12.259
1292	文法	ぶんぽう	Ngữ pháp	220	2026-06-24 06:26:12.262	2026-06-24 06:26:12.262
1293	英文	えいぶん	câu tiếng Anh	220	2026-06-24 06:26:12.264	2026-06-24 06:26:12.264
1294	文句	もんく	sự kêu ca, sự phàn nàn, sự than phiền	220	2026-06-24 06:26:12.266	2026-06-24 06:26:12.266
1295	文	ふみ	Thư từ	220	2026-06-24 06:26:12.268	2026-06-24 06:26:12.268
1296	真	ま	tiếng Anh	221	2026-06-24 06:26:12.272	2026-06-24 06:26:12.272
1297	英雄	えいゆう	Anh hùng	221	2026-06-24 06:26:12.273	2026-06-24 06:26:12.273
1298	英国	えいこく	Nước anh	221	2026-06-24 06:26:12.275	2026-06-24 06:26:12.275
1299	英会話	えいかいわ	Sự đàm thoại bằng anh ngữ	221	2026-06-24 06:26:12.278	2026-06-24 06:26:12.278
1300	英和	えいわ	Từ điển Anh - Nhật	221	2026-06-24 06:26:12.281	2026-06-24 06:26:12.281
1301	和英	わえい	Từ điển Nhật - Anh	221	2026-06-24 06:26:12.283	2026-06-24 06:26:12.283
1302	大	おお	Hỏi, chất vấn	222	2026-06-24 06:26:12.287	2026-06-24 06:26:12.287
1303	性質	せいしつ	tính chất	222	2026-06-24 06:26:12.289	2026-06-24 06:26:12.289
1304	物質	ぶっしつ	vật chất	222	2026-06-24 06:26:12.291	2026-06-24 06:26:12.291
1305	素質	そしつ	tố chất	222	2026-06-24 06:26:12.294	2026-06-24 06:26:12.294
1306	神経質	しんけいしつ	ính nóng nảy, sự bồn chồn, lo lắng	222	2026-06-24 06:26:12.298	2026-06-24 06:26:12.298
1307	質屋	しちや	tiệm cầm đồ	222	2026-06-24 06:26:12.3	2026-06-24 06:26:12.3
1308	門	もん	Vấn đề	223	2026-06-24 06:26:12.305	2026-06-24 06:26:12.305
1309	質問	しつもん	Hỏi, chất vấn	223	2026-06-24 06:26:12.307	2026-06-24 06:26:12.307
1310	問	とい	Câu hỏi	223	2026-06-24 06:26:12.309	2026-06-24 06:26:12.309
1311	問	と	Viếng thăm	223	2026-06-24 06:26:12.313	2026-06-24 06:26:12.313
1312	疑問	ぎもん	sự nghi vấn, sự hoài nghi	223	2026-06-24 06:26:12.317	2026-06-24 06:26:12.317
1313	学問	がくもん	học vấn, sự học	223	2026-06-24 06:26:12.319	2026-06-24 06:26:12.319
1314	問屋	とんや	Kho bán xỉ	223	2026-06-24 06:26:12.323	2026-06-24 06:26:12.323
1315	兄	にい	sự thuyết minh, sự giải thích	224	2026-06-24 06:26:12.329	2026-06-24 06:26:12.329
1316	小説	しょうせつ	Tiểu thuyết	224	2026-06-24 06:26:12.332	2026-06-24 06:26:12.332
1317	開設	かいせつ	sự thành lập, sự xây dựng	224	2026-06-24 06:26:12.335	2026-06-24 06:26:12.335
1318	説得	せっとく	sự phỏng đoán, giả thuyết	224	2026-06-24 06:26:12.338	2026-06-24 06:26:12.338
1319	説	と	sự đi khắp nơi để diễn thuyết, cuộc vận động tranh cử	224	2026-06-24 06:26:12.34	2026-06-24 06:26:12.34
1320	土曜日	どようび	chuyến tham quan, dã ngoại	225	2026-06-24 06:26:12.351	2026-06-24 06:26:12.351
1321	望遠鏡	ぼうえんきょう	Kính viễn vọng	225	2026-06-24 06:26:12.354	2026-06-24 06:26:12.354
1322	永遠	えいえん	xa lắc ,viễn ,đằng xa, phương xa	225	2026-06-24 06:26:12.357	2026-06-24 06:26:12.357
1323	木	き	xóm giềng , hàng xóm	226	2026-06-24 06:26:12.366	2026-06-24 06:26:12.366
1324	最近	さいきん	gần nhất ,gần đây, mới đây	226	2026-06-24 06:26:12.37	2026-06-24 06:26:12.37
1325	近頃	ちかごろ	gần đây	226	2026-06-24 06:26:12.374	2026-06-24 06:26:12.374
1326	近代的	きんだいてき	sự cận thị, tật cận thị	226	2026-06-24 06:26:12.378	2026-06-24 06:26:12.378
1327	中近東	ちゅうきんとう	Vùng cận trung cận đông	226	2026-06-24 06:26:12.384	2026-06-24 06:26:12.384
1328	誰	だれ	Hiền triết, học giả	227	2026-06-24 06:26:12.397	2026-06-24 06:26:12.397
1329	作者	さくしゃ	tác giả	227	2026-06-24 06:26:12.401	2026-06-24 06:26:12.401
1330	医者	いしゃ	Bác sĩ	227	2026-06-24 06:26:12.405	2026-06-24 06:26:12.405
1331	研究者	けんきゅうしゃ	Nhà nghiên cứu	227	2026-06-24 06:26:12.409	2026-06-24 06:26:12.409
1332	歯医者	はいしゃ	Nha sĩ	227	2026-06-24 06:26:12.414	2026-06-24 06:26:12.414
1333	記者	きしゃ	Người viết báo	227	2026-06-24 06:26:12.418	2026-06-24 06:26:12.418
1334	読者	どくしゃ	Độc giả	227	2026-06-24 06:26:12.421	2026-06-24 06:26:12.421
1335	若者	わかもの	thanh niên, lớp trẻ, giới trẻ	227	2026-06-24 06:26:12.425	2026-06-24 06:26:12.425
1336	太陽	たいよう	Cái nóng còn sót lại của mùa hè	228	2026-06-24 06:26:12.434	2026-06-24 06:26:12.434
1337	避暑地	ひしょち	Khu nghỉ mát	228	2026-06-24 06:26:12.438	2026-06-24 06:26:12.438
1338	寒	さむ	khí lạnh, hơi lạnh	229	2026-06-24 06:26:12.447	2026-06-24 06:26:12.447
1339	寒気	かんき	khí lạnh, hơi lạnh	229	2026-06-24 06:26:12.451	2026-06-24 06:26:12.451
1340	寒帯	かんたい	Hàn đới, xứ lạnh	229	2026-06-24 06:26:12.455	2026-06-24 06:26:12.455
1341	寒風	かんぷう	Hàn phong	229	2026-06-24 06:26:12.459	2026-06-24 06:26:12.459
1342	冊	さつ	Thể trọng, cân nặng	230	2026-06-24 06:26:12.468	2026-06-24 06:26:12.468
1343	重役	じゅうやく	giám đốc	230	2026-06-24 06:26:12.472	2026-06-24 06:26:12.472
1344	重要	じゅうよう	Vật phẩm quý báu; đồ quý giá	230	2026-06-24 06:26:12.476	2026-06-24 06:26:12.476
1345	二重	ふたえ	Hai mí	230	2026-06-24 06:26:12.482	2026-06-24 06:26:12.482
1346	軽	かる	Xe hạng nhỏ	231	2026-06-24 06:26:12.491	2026-06-24 06:26:12.491
1347	軽	かろ	Khinh miệt, xem thường, miệt thị	231	2026-06-24 06:26:12.495	2026-06-24 06:26:12.495
1348	私	わたし	Tồi nhất, tồi tệ	232	2026-06-24 06:26:12.504	2026-06-24 06:26:12.504
1349	低下	ていか	sự giảm, sự kém đi, sự suy giảm	232	2026-06-24 06:26:12.508	2026-06-24 06:26:12.508
1350	低温	ていおん	Nhiệt độ thấp	232	2026-06-24 06:26:12.513	2026-06-24 06:26:12.513
1351	低気圧	ていきあつ	Áp suất thấp	232	2026-06-24 06:26:12.517	2026-06-24 06:26:12.517
1352	高低	こうてい	cao và thấp, lên và xuống, dao động, biến động	232	2026-06-24 06:26:12.521	2026-06-24 06:26:12.521
1353	小鳥	ことり	nhược điểm, điểm yếu	233	2026-06-24 06:26:12.529	2026-06-24 06:26:12.529
1354	弱	よわ	sự gầy yếu, sự gầy gò ốm yếu	233	2026-06-24 06:26:12.532	2026-06-24 06:26:12.532
1355	弱肉強食	じゃくにくきょうしょく	Việc con mạnh ăn thịt con yếu	233	2026-06-24 06:26:12.535	2026-06-24 06:26:12.535
1356	弱気	よわき	sự nhút nhát, sự nhát gan, sự rụt rè	233	2026-06-24 06:26:12.54	2026-06-24 06:26:12.54
1357	彼	かれ	sự nói xấu về ai đó	234	2026-06-24 06:26:12.549	2026-06-24 06:26:12.549
1358	悪口	わるぐち	sự nói xấu về ai đó	234	2026-06-24 06:26:12.551	2026-06-24 06:26:12.551
1359	意地悪	いじわる	cái xấu nhất, cái tồi nhất	234	2026-06-24 06:26:12.554	2026-06-24 06:26:12.554
1360	悪者	わるもの	người xấu, kẻ xấu	234	2026-06-24 06:26:12.557	2026-06-24 06:26:12.557
1361	悪魔	あくま	yêu ma	234	2026-06-24 06:26:12.559	2026-06-24 06:26:12.559
1362	悪	あく	Sự xấu; không tốt	234	2026-06-24 06:26:12.564	2026-06-24 06:26:12.564
1363	悪寒	おかん	sự ớn lạnh; sự rùn mình	234	2026-06-24 06:26:12.568	2026-06-24 06:26:12.568
1364	中	なか	Tối om	235	2026-06-24 06:26:12.576	2026-06-24 06:26:12.576
1365	暗記	あんき	sự ám sát	235	2026-06-24 06:26:12.581	2026-06-24 06:26:12.581
1366	太	ふと	Số mật khẩu	236	2026-06-24 06:26:12.589	2026-06-24 06:26:12.589
1367	太	ふと	Mặt trời	236	2026-06-24 06:26:12.591	2026-06-24 06:26:12.591
1368	太鼓	たいこ	Cái trống	236	2026-06-24 06:26:12.593	2026-06-24 06:26:12.593
1369	皇太子	こうたいし	Hoàng thái tử, thái tử	236	2026-06-24 06:26:12.597	2026-06-24 06:26:12.597
1370	太平洋	たいへいよう	Thái Bình Dương	236	2026-06-24 06:26:12.599	2026-06-24 06:26:12.599
1371	丸太	まるた	Khoanh gỗ tròn	236	2026-06-24 06:26:12.6	2026-06-24 06:26:12.6
1372	豆	まめ	Hạt đậu	237	2026-06-24 06:26:12.604	2026-06-24 06:26:12.604
1373	豆腐	とうふ	Đậu hũ	237	2026-06-24 06:26:12.605	2026-06-24 06:26:12.605
1374	豆	まめ	Hạt cà phê	237	2026-06-24 06:26:12.607	2026-06-24 06:26:12.607
1375	枝豆	えだまめ	Đậu xanh	237	2026-06-24 06:26:12.609	2026-06-24 06:26:12.609
1376	大豆	だいず	đậu tương	237	2026-06-24 06:26:12.612	2026-06-24 06:26:12.612
1377	豆乳	とうにゅう	Sữa đậu nành	237	2026-06-24 06:26:12.615	2026-06-24 06:26:12.615
1378	納豆	なっとう	Món đậu nành lên men	237	2026-06-24 06:26:12.617	2026-06-24 06:26:12.617
1379	矢	や	sở đoản, điểm yếu, nhược điểm	238	2026-06-24 06:26:12.623	2026-06-24 06:26:12.623
1380	短期	たんき	ngắn hạn	238	2026-06-24 06:26:12.625	2026-06-24 06:26:12.625
1381	短期	たんき	Cao đẳng	238	2026-06-24 06:26:12.629	2026-06-24 06:26:12.629
1382	短編	たんぺん	truyện ngắn	238	2026-06-24 06:26:12.632	2026-06-24 06:26:12.632
1383	短気	たんき	Đoản ca	238	2026-06-24 06:26:12.635	2026-06-24 06:26:12.635
1384	太陽	たいよう	Ánh sáng	239	2026-06-24 06:26:12.64	2026-06-24 06:26:12.64
1385	光	ひか	Tham quan, du lịch	239	2026-06-24 06:26:12.642	2026-06-24 06:26:12.642
1386	日光	にっこう	nắng,ánh mặt trời	239	2026-06-24 06:26:12.645	2026-06-24 06:26:12.645
1387	光線	こうせん	tia sáng	239	2026-06-24 06:26:12.649	2026-06-24 06:26:12.649
1388	光景	こうけい	Quang cảnh, phong cảnh	239	2026-06-24 06:26:12.651	2026-06-24 06:26:12.651
1389	光熱費	こうねつひ	Tiền điện, ga, nhiên liệu	239	2026-06-24 06:26:12.654	2026-06-24 06:26:12.654
1390	虫	むし	Gió	240	2026-06-24 06:26:12.66	2026-06-24 06:26:12.66
1391	台風	たいふう	Bão lớn	240	2026-06-24 06:26:12.665	2026-06-24 06:26:12.665
1392	風邪	かぜ	cảm lạnh, cảm cúm	240	2026-06-24 06:26:12.668	2026-06-24 06:26:12.668
1393	風呂	ふろ	Bồn tắm	240	2026-06-24 06:26:12.671	2026-06-24 06:26:12.671
1394	風船	ふうせん	Khinh khí cầu	240	2026-06-24 06:26:12.675	2026-06-24 06:26:12.675
1395	風景	ふうけい	Phong cảnh	240	2026-06-24 06:26:12.68	2026-06-24 06:26:12.68
1396	洋風	ようふう	kiểu Tây	240	2026-06-24 06:26:12.684	2026-06-24 06:26:12.684
1397	和風	わふう	kiểu, phong cách Nhật	240	2026-06-24 06:26:12.688	2026-06-24 06:26:12.688
1398	車	くるま	sự lái (xe), sự vận hành (máy móc)	241	2026-06-24 06:26:12.702	2026-06-24 06:26:12.702
1399	運転手	うんてんしゅ	Tài xế	241	2026-06-24 06:26:12.705	2026-06-24 06:26:12.705
1400	運動	うんどう	sự vận động, việc chơi thể thao	241	2026-06-24 06:26:12.709	2026-06-24 06:26:12.709
1401	運	うん	xấu số, đen đủi	241	2026-06-24 06:26:12.715	2026-06-24 06:26:12.715
1402	運命	うんめい	vận mệnh	241	2026-06-24 06:26:12.718	2026-06-24 06:26:12.718
1403	運賃	うんちん	tiền cước	241	2026-06-24 06:26:12.722	2026-06-24 06:26:12.722
1404	力	ちから	sự vận động, việc chơi thể thao	242	2026-06-24 06:26:12.731	2026-06-24 06:26:12.731
1405	自動車	じどうしゃ	Xe ô tô	242	2026-06-24 06:26:12.735	2026-06-24 06:26:12.735
1406	動物	どうぶつ	Động vật	242	2026-06-24 06:26:12.739	2026-06-24 06:26:12.739
1407	活動	かつどう	Hoạt động	242	2026-06-24 06:26:12.743	2026-06-24 06:26:12.743
1408	感動	かんどう	động từ	242	2026-06-24 06:26:12.748	2026-06-24 06:26:12.748
1409	信号	しんごう	sự cấm, sự ngừng	243	2026-06-24 06:26:12.757	2026-06-24 06:26:12.757
1410	巣	す	Một bước	244	2026-06-24 06:26:12.766	2026-06-24 06:26:12.766
1411	進歩	しんぽ	Sự tiến bộ	244	2026-06-24 06:26:12.77	2026-06-24 06:26:12.77
1412	歩道	ほどう	Vỉa hè, đường dành cho người đi bộ	244	2026-06-24 06:26:12.774	2026-06-24 06:26:12.774
1413	歩	あゆ	tiền hoa hồng tỉ suất, tỉ giá, phần trăm lãi suất	244	2026-06-24 06:26:12.779	2026-06-24 06:26:12.779
1414	歩行者	ほこうしゃ	Kẻ bộ hành, người đi bộ	244	2026-06-24 06:26:12.784	2026-06-24 06:26:12.784
1415	人	ひと	Đại sứ quán	245	2026-06-24 06:26:12.792	2026-06-24 06:26:12.792
1416	大使	たいし	Đại sứ	245	2026-06-24 06:26:12.796	2026-06-24 06:26:12.796
1417	使用中	しようちゅう	Tình trạng đang sử dụng	245	2026-06-24 06:26:12.801	2026-06-24 06:26:12.801
1418	使命	しめい	Sứ mệnh	245	2026-06-24 06:26:12.804	2026-06-24 06:26:12.804
1419	天使	てんし	Thiên sứ	245	2026-06-24 06:26:12.808	2026-06-24 06:26:12.808
1420	送	おく	Sự phát thanh	246	2026-06-24 06:26:12.817	2026-06-24 06:26:12.817
1421	郵送	ゆうそう	Cước phí	246	2026-06-24 06:26:12.821	2026-06-24 06:26:12.821
1422	送別会	そうべつかい	Tiệc chia tay	246	2026-06-24 06:26:12.825	2026-06-24 06:26:12.825
1423	送信	そうしん	Tàu không dùng để chở hành khách	246	2026-06-24 06:26:12.83	2026-06-24 06:26:12.83
1424	先生	せんせい	Xà bông	247	2026-06-24 06:26:12.837	2026-06-24 06:26:12.837
1425	洗顔	せんがん	Việc rửa mặt	247	2026-06-24 06:26:12.84	2026-06-24 06:26:12.84
1426	洗礼	せんれい	Lễ rửa tội	247	2026-06-24 06:26:12.843	2026-06-24 06:26:12.843
1427	急	いそ	tốc hành	248	2026-06-24 06:26:12.851	2026-06-24 06:26:12.851
1428	特急	とっきゅう	tàu tốc hành sự hỏa tốc	248	2026-06-24 06:26:12.855	2026-06-24 06:26:12.855
1429	至急	しきゅう	Cấp tốc, khẩn cấp	248	2026-06-24 06:26:12.858	2026-06-24 06:26:12.858
1430	緊急	きんきゅう	sự cấp bách, sự khẩn cấp, cấp bách, khẩn cấp	248	2026-06-24 06:26:12.863	2026-06-24 06:26:12.863
1431	救急車	きゅうきゅうしゃ	Xe cấp cứu	248	2026-06-24 06:26:12.867	2026-06-24 06:26:12.867
1432	急用	きゅうよう	Việc gấp	248	2026-06-24 06:26:12.87	2026-06-24 06:26:12.87
1433	二人	ふたり	Mở cửa hàng	249	2026-06-24 06:26:12.876	2026-06-24 06:26:12.876
1434	公開	こうかい	Sự công khai, công bố	249	2026-06-24 06:26:12.881	2026-06-24 06:26:12.881
1435	開会式	かいかいしき	Lễ khai trương,khai mạc	249	2026-06-24 06:26:12.884	2026-06-24 06:26:12.884
1436	人	ひと	sự đóng cửa hàng	250	2026-06-24 06:26:12.889	2026-06-24 06:26:12.889
1437	閉鎖	へいさ	Sự phong bế, sự phong tỏa	250	2026-06-24 06:26:12.89	2026-06-24 06:26:12.89
1438	弓	ゆみ	Sự trích dẫn	252	2026-06-24 06:26:12.897	2026-06-24 06:26:12.897
1439	引力	いんりょく	Lực hấp dấn, lực hút	252	2026-06-24 06:26:12.899	2026-06-24 06:26:12.899
1440	田	た	Kỉ niệm	253	2026-06-24 06:26:12.902	2026-06-24 06:26:12.902
1441	思	おも	ý tưởng ,tư tưởng	253	2026-06-24 06:26:12.904	2026-06-24 06:26:12.904
1442	大	おお	Người quen, quen biết	254	2026-06-24 06:26:12.908	2026-06-24 06:26:12.908
1443	知識	ちしき	Tri thức, kiến thức	254	2026-06-24 06:26:12.912	2026-06-24 06:26:12.912
1444	知性	ちせい	sự thông minh	254	2026-06-24 06:26:12.915	2026-06-24 06:26:12.915
1445	知事	ちじ	người đứng đầu một tỉnh (của Nhật Bản)	254	2026-06-24 06:26:12.917	2026-06-24 06:26:12.917
1446	人	ひと	Cách suy nghĩ	255	2026-06-24 06:26:12.923	2026-06-24 06:26:12.923
1447	参考	さんこう	Sự tham khảo	255	2026-06-24 06:26:12.925	2026-06-24 06:26:12.925
1448	考慮	こうりょ	khảo cổ học	255	2026-06-24 06:26:12.93	2026-06-24 06:26:12.93
1449	参考書	さんこうしょ	Sách tham khảo	255	2026-06-24 06:26:12.934	2026-06-24 06:26:12.934
1450	死	し	Cái chết	256	2026-06-24 06:26:12.94	2026-06-24 06:26:12.94
1451	死体	したい	Xác chết	256	2026-06-24 06:26:12.944	2026-06-24 06:26:12.944
1452	必死	ひっし	Quyết tâm	256	2026-06-24 06:26:12.948	2026-06-24 06:26:12.948
1453	死亡	しぼう	Tử vong	256	2026-06-24 06:26:12.952	2026-06-24 06:26:12.952
1454	安楽死	あんらくし	Ra đi nhẹ nhàng	256	2026-06-24 06:26:12.956	2026-06-24 06:26:12.956
1455	死者	ししゃ	Người chết	256	2026-06-24 06:26:12.96	2026-06-24 06:26:12.96
1456	死語	しご	lời nói của người chết	256	2026-06-24 06:26:12.964	2026-06-24 06:26:12.964
1457	医者	いしゃ	Bác sĩ	257	2026-06-24 06:26:12.976	2026-06-24 06:26:12.976
1458	医学	いがく	y học	257	2026-06-24 06:26:12.981	2026-06-24 06:26:12.981
1459	歯医者	はいしゃ	Bác sĩ nha khoa; nha sĩ	257	2026-06-24 06:26:12.985	2026-06-24 06:26:12.985
1460	医院	いいん	y viện	257	2026-06-24 06:26:12.988	2026-06-24 06:26:12.988
1461	医療	いりょう	Sự chữa trị	257	2026-06-24 06:26:12.992	2026-06-24 06:26:12.992
1462	医師	いし	bác sĩ	257	2026-06-24 06:26:12.997	2026-06-24 06:26:12.997
1463	医薬品	いやくひん	Đồ y tế; dược phẩm; thuốc chữa bệnh,Dược liệu	257	2026-06-24 06:26:13.001	2026-06-24 06:26:13.001
1464	台	だい	Từ đầu đến cuối; từ đầu chí cuối	258	2026-06-24 06:26:13.009	2026-06-24 06:26:13.009
1465	書	か	chuyến tàu đầu tiên	258	2026-06-24 06:26:13.014	2026-06-24 06:26:13.014
1466	私	わたし	sau cùng, cuối cùng	259	2026-06-24 06:26:13.022	2026-06-24 06:26:13.022
1467	終了	しゅうりょう	Sự kết thúc	259	2026-06-24 06:26:13.026	2026-06-24 06:26:13.026
1468	終電	しゅうでん	chuyến xe điện cuối cùng	259	2026-06-24 06:26:13.031	2026-06-24 06:26:13.031
1469	終点	しゅうてん	trạm, ga cuối cùng	259	2026-06-24 06:26:13.035	2026-06-24 06:26:13.035
1470	始終	しじゅう	từ đầu đến cuối	259	2026-06-24 06:26:13.038	2026-06-24 06:26:13.038
1471	崖	がけ	Đá	260	2026-06-24 06:26:13.047	2026-06-24 06:26:13.047
1472	宝石	ほうせき	ngọc đá quý bảo thạch	260	2026-06-24 06:26:13.051	2026-06-24 06:26:13.051
1473	石	せっ	Dầu hoả	260	2026-06-24 06:26:13.055	2026-06-24 06:26:13.055
1474	石炭	せきたん	Than đá	260	2026-06-24 06:26:13.058	2026-06-24 06:26:13.058
1475	磁石	じしゃく	quặng sắt từ, quặng từ đá nam châm, nam châm	260	2026-06-24 06:26:13.063	2026-06-24 06:26:13.063
1476	台	だい	Sự nghiên cứu	261	2026-06-24 06:26:13.071	2026-06-24 06:26:13.071
1477	研究者	けんきゅうしゃ	Nhà nghiên cứu	261	2026-06-24 06:26:13.074	2026-06-24 06:26:13.074
1478	研究室	けんきゅうしつ	Phòng nghiên cứu	261	2026-06-24 06:26:13.079	2026-06-24 06:26:13.079
1479	研究所	けんきゅうじょ	tổ nghiên cứu; nhóm nghiên cứu; viện nghiên cứu	261	2026-06-24 06:26:13.083	2026-06-24 06:26:13.083
1480	研究所	けんきゅうしょ	tổ nghiên cứu; nhóm nghiên cứu; viện nghiên cứu	261	2026-06-24 06:26:13.086	2026-06-24 06:26:13.086
1481	研修	けんしゅう	Sự đào tạo	261	2026-06-24 06:26:13.089	2026-06-24 06:26:13.089
1482	家	いえ	Sự nghiên cứu	262	2026-06-24 06:26:13.097	2026-06-24 06:26:13.097
1483	研究者	けんきゅうしゃ	Nhà nghiên cứu	262	2026-06-24 06:26:13.101	2026-06-24 06:26:13.101
1484	研究室	けんきゅうしつ	Phòng nghiên cứu	262	2026-06-24 06:26:13.104	2026-06-24 06:26:13.104
1485	究明	きゅうめい	sự điều tra cho rõ ràng, điều tra rõ	262	2026-06-24 06:26:13.108	2026-06-24 06:26:13.108
1486	究極	きゅうきょく	Sự theo đuổi; sự theo tìm	262	2026-06-24 06:26:13.113	2026-06-24 06:26:13.113
1487	田	た	Du học sinh	263	2026-06-24 06:26:13.122	2026-06-24 06:26:13.122
1488	留守	るす	Sự vắng nhà	263	2026-06-24 06:26:13.125	2026-06-24 06:26:13.125
1489	留守番	るすばん	tín hiệu điện thoại trả lời tự động	263	2026-06-24 06:26:13.131	2026-06-24 06:26:13.131
1490	留	と	gửi đảm bảo	263	2026-06-24 06:26:13.135	2026-06-24 06:26:13.135
1491	月	つき	sự phải trả chi phí	264	2026-06-24 06:26:13.143	2026-06-24 06:26:13.143
1492	有利	ゆうり	sự có hay không có	264	2026-06-24 06:26:13.148	2026-06-24 06:26:13.148
1493	畑	はたけ	Ngành nghề, sản nghiệp	265	2026-06-24 06:26:13.157	2026-06-24 06:26:13.157
1494	生産	せいさん	sự sản xuất	265	2026-06-24 06:26:13.161	2026-06-24 06:26:13.161
1495	土産	みやげ	Quà lưu niệm	265	2026-06-24 06:26:13.165	2026-06-24 06:26:13.165
1496	産地	さんち	nơi sản xuất	265	2026-06-24 06:26:13.168	2026-06-24 06:26:13.168
1497	共産	きょうさん	Chủ nghĩa cộng sản	265	2026-06-24 06:26:13.171	2026-06-24 06:26:13.171
1498	財産	ざいさん	tiền của tài sản	265	2026-06-24 06:26:13.173	2026-06-24 06:26:13.173
1499	産	う	Bất động sản	265	2026-06-24 06:26:13.176	2026-06-24 06:26:13.176
1500	羊	ひつじ	Ngành công nghiệp	266	2026-06-24 06:26:13.183	2026-06-24 06:26:13.183
1501	授業	じゅぎょう	Sự giảng dạy	266	2026-06-24 06:26:13.186	2026-06-24 06:26:13.186
1502	卒業	そつぎょう	sự tốt nghiệp	266	2026-06-24 06:26:13.188	2026-06-24 06:26:13.188
1503	職業	しょくぎょう	nghề nghiệp	266	2026-06-24 06:26:13.191	2026-06-24 06:26:13.191
1504	企業	きぎょう	Cơ sở, xí nghiệp, doanh nghiệp	266	2026-06-24 06:26:13.193	2026-06-24 06:26:13.193
1505	営業中	えいぎょうちゅう	Tình trạng đang được bày bán	266	2026-06-24 06:26:13.198	2026-06-24 06:26:13.198
1506	自業自得	じごうじとく	Gieo nhân nào gặt quả đấy (thành ngữ)	266	2026-06-24 06:26:13.201	2026-06-24 06:26:13.201
1507	農業	のうぎょう	Ngành nông nghiệp	266	2026-06-24 06:26:13.204	2026-06-24 06:26:13.204
1508	薬草	やくそう	Thuốc	267	2026-06-24 06:26:13.21	2026-06-24 06:26:13.21
1509	薬屋	くすりや	nhà thuốc ,hiệu thuốc ,dược phòng ,cửa hàng thuốc	267	2026-06-24 06:26:13.215	2026-06-24 06:26:13.215
1510	農薬	のうやく	thuốc trừ sâu	267	2026-06-24 06:26:13.218	2026-06-24 06:26:13.218
1511	薬局	やっきょく	Tiệm thuốc	267	2026-06-24 06:26:13.221	2026-06-24 06:26:13.221
1512	薬指	くすりゆび	ngón áp út	267	2026-06-24 06:26:13.224	2026-06-24 06:26:13.224
1513	風邪薬	かぜぐすり	Thuốc cảm	267	2026-06-24 06:26:13.226	2026-06-24 06:26:13.226
1514	薬学	やくがく	dược học	267	2026-06-24 06:26:13.231	2026-06-24 06:26:13.231
1515	人	ひと	Người lao động	268	2026-06-24 06:26:13.237	2026-06-24 06:26:13.237
1516	労働	ろうどう	Lao động	268	2026-06-24 06:26:13.24	2026-06-24 06:26:13.24
1517	労働者	ろうどうしゃ	Người lao động	268	2026-06-24 06:26:13.243	2026-06-24 06:26:13.243
1518	労働組合	ろうどうくみあい	Công đoàn lao động	268	2026-06-24 06:26:13.248	2026-06-24 06:26:13.248
1519	金	かね	Nhân viên công ty	269	2026-06-24 06:26:13.256	2026-06-24 06:26:13.256
1520	店員	てんいん	Người bán  hàng, nhân viên bán hàng	269	2026-06-24 06:26:13.259	2026-06-24 06:26:13.259
1521	銀行員	ぎんこういん	Nhân viên ngân hàng	269	2026-06-24 06:26:13.264	2026-06-24 06:26:13.264
1522	全員	ぜんいん	tất cả mọi người	269	2026-06-24 06:26:13.268	2026-06-24 06:26:13.268
1523	公務員	こうむいん	Công chức, viên chức nhà nước	269	2026-06-24 06:26:13.272	2026-06-24 06:26:13.272
1524	会員	かいいん	Hội viên, thành viên	269	2026-06-24 06:26:13.276	2026-06-24 06:26:13.276
1525	満員	まんいん	Sự đông người, chật ních người	269	2026-06-24 06:26:13.28	2026-06-24 06:26:13.28
1526	教員	きょういん	giáo viên	269	2026-06-24 06:26:13.284	2026-06-24 06:26:13.284
1527	十一人	じゅういちにん	Võ sĩ	270	2026-06-24 06:26:13.292	2026-06-24 06:26:13.292
1528	博士	はくし	Tiến sĩ, thạc sĩ	270	2026-06-24 06:26:13.297	2026-06-24 06:26:13.297
1529	博士	はかせ	tiến sĩ, thạc sĩ	270	2026-06-24 06:26:13.302	2026-06-24 06:26:13.302
1530	修士	しゅうし	Thạc sĩ	270	2026-06-24 06:26:13.305	2026-06-24 06:26:13.305
1531	弁護士	べんごし	Luật sư	270	2026-06-24 06:26:13.309	2026-06-24 06:26:13.309
1532	紳士	しんし	người hào hoa phong nhã, người cao sang, người quyền quý	270	2026-06-24 06:26:13.314	2026-06-24 06:26:13.314
1533	消防士	しょうぼうし	Lính cứu hỏa	270	2026-06-24 06:26:13.318	2026-06-24 06:26:13.318
1534	会計	かいけい	Kế toán	270	2026-06-24 06:26:13.322	2026-06-24 06:26:13.322
1535	税理士	ぜいりし	Kế toán thuế vụ	270	2026-06-24 06:26:13.325	2026-06-24 06:26:13.325
1536	殿様	とのさま	Công việc	271	2026-06-24 06:26:13.335	2026-06-24 06:26:13.335
1537	仕方	しかた	Cách làm, phương pháp	271	2026-06-24 06:26:13.339	2026-06-24 06:26:13.339
1538	仕上	しあ	Hoạt động tình nguyện	271	2026-06-24 06:26:13.342	2026-06-24 06:26:13.342
1539	仕	つか	Bồi bàn	271	2026-06-24 06:26:13.346	2026-06-24 06:26:13.346
1540	全部	ぜんぶ	Việc, vấn đề	272	2026-06-24 06:26:13.352	2026-06-24 06:26:13.352
1541	仕事	しごと	Công việc	272	2026-06-24 06:26:13.354	2026-06-24 06:26:13.354
1542	火事	かじ	Vụ hỏa hoạn, hỏa hoạn	272	2026-06-24 06:26:13.357	2026-06-24 06:26:13.357
1543	食事	しょくじ	Bữa ăn	272	2026-06-24 06:26:13.361	2026-06-24 06:26:13.361
1544	返事	へんじ	Sự trả lời, đáp trả	272	2026-06-24 06:26:13.366	2026-06-24 06:26:13.366
1545	事故	じこ	Biến cố, sự cố	272	2026-06-24 06:26:13.369	2026-06-24 06:26:13.369
1546	用事	ようじ	Việc bận	272	2026-06-24 06:26:13.372	2026-06-24 06:26:13.372
1547	事務	じむ	Văn phòng	272	2026-06-24 06:26:13.376	2026-06-24 06:26:13.376
1548	絵	え	Thư viện	273	2026-06-24 06:26:13.387	2026-06-24 06:26:13.387
1549	地図	ちず	Bản đồ	273	2026-06-24 06:26:13.39	2026-06-24 06:26:13.39
1550	図	ず	Hình vẽ, bức họa	273	2026-06-24 06:26:13.394	2026-06-24 06:26:13.394
1551	図表	ずひょう	Đồ thị	273	2026-06-24 06:26:13.399	2026-06-24 06:26:13.399
1552	合図	あいず	Dấu hiệu, hiệu lệnh	273	2026-06-24 06:26:13.402	2026-06-24 06:26:13.402
1553	意図	いと	Ý đồ, mục đích, ý định	273	2026-06-24 06:26:13.406	2026-06-24 06:26:13.406
1554	太	ふと	Chủ tọa phiên tòa	274	2026-06-24 06:26:13.415	2026-06-24 06:26:13.415
1555	外交官	がいこうかん	Nhà ngoại giao	274	2026-06-24 06:26:13.42	2026-06-24 06:26:13.42
1556	警官	けいかん	Cảnh sát	274	2026-06-24 06:26:13.424	2026-06-24 06:26:13.424
1557	裁判官	さいばんかん	quan tòa, thẩm phán	274	2026-06-24 06:26:13.429	2026-06-24 06:26:13.429
1558	官庁	かんちょう	công sở, cơ quan chính quyền	274	2026-06-24 06:26:13.434	2026-06-24 06:26:13.434
1559	官僚	かんりょう	quan liêu, quan chức	274	2026-06-24 06:26:13.438	2026-06-24 06:26:13.438
1560	器官	きかん	cơ quan, bộ phận	274	2026-06-24 06:26:13.442	2026-06-24 06:26:13.442
1561	建物	たてもの	thư viện	275	2026-06-24 06:26:13.452	2026-06-24 06:26:13.452
1562	映画館	えいがかん	Rạp chiếu phim	275	2026-06-24 06:26:13.455	2026-06-24 06:26:13.455
1563	大使館	たいしかん	Đại sứ quán	275	2026-06-24 06:26:13.459	2026-06-24 06:26:13.459
1564	旅館	りょかん	Nhaà trọ cho khách du lịch	275	2026-06-24 06:26:13.464	2026-06-24 06:26:13.464
1565	会館	かいかん	Hội quán, trung tâm	275	2026-06-24 06:26:13.467	2026-06-24 06:26:13.467
1566	美術館	びじゅつかん	Viện bảo tàng mỹ thuật	275	2026-06-24 06:26:13.471	2026-06-24 06:26:13.471
1567	博物館	はくぶつかん	Viện bảo tàng	275	2026-06-24 06:26:13.474	2026-06-24 06:26:13.474
1568	水族館	すいぞくかん	Công viên thủy cung	275	2026-06-24 06:26:13.479	2026-06-24 06:26:13.479
1569	二十一人	にじゅういちにん	Ngày xưa	276	2026-06-24 06:26:13.487	2026-06-24 06:26:13.487
1570	昔話	むかしばなし	Chuyện dân gian, truyện cổ tích	276	2026-06-24 06:26:13.49	2026-06-24 06:26:13.49
1571	大昔	おおむかし	Rất xa xưa, ngày xửa ngày xưa	276	2026-06-24 06:26:13.494	2026-06-24 06:26:13.494
1572	昔日	せきじつ	Ngày xưa	276	2026-06-24 06:26:13.498	2026-06-24 06:26:13.498
1573	昔々	むかしむかし	Ngày xửa ngày xưa	276	2026-06-24 06:26:13.502	2026-06-24 06:26:13.502
1574	今昔	こんじゃく	Xưa và nay	276	2026-06-24 06:26:13.506	2026-06-24 06:26:13.506
1575	昔	むかし	Nhà cho thuê	277	2026-06-24 06:26:13.516	2026-06-24 06:26:13.516
1576	借金	しゃっきん	tiền vay	277	2026-06-24 06:26:13.518	2026-06-24 06:26:13.518
1577	借地	しゃくち	Đất cho thuê	277	2026-06-24 06:26:13.521	2026-06-24 06:26:13.521
1578	代	か	Thời đại	278	2026-06-24 06:26:13.529	2026-06-24 06:26:13.529
1579	電気代	でんきだい	Tiền điện, ga, nhiên liệu	278	2026-06-24 06:26:13.533	2026-06-24 06:26:13.533
1580	代	か	Thập niên 60	278	2026-06-24 06:26:13.537	2026-06-24 06:26:13.537
1581	十代	じゅうだい	Thanh thiếu niên	278	2026-06-24 06:26:13.54	2026-06-24 06:26:13.54
1582	代表	だいひょう	Đại biểu, đại diện	278	2026-06-24 06:26:13.544	2026-06-24 06:26:13.544
1583	現代	げんだい	Thời đại này	278	2026-06-24 06:26:13.548	2026-06-24 06:26:13.548
1584	代金	だいきん	giá, tiền hàng, hóa đơn, sự thanh toán	278	2026-06-24 06:26:13.552	2026-06-24 06:26:13.552
1585	身代金	みのしろきん	Tiền chuộc	278	2026-06-24 06:26:13.555	2026-06-24 06:26:13.555
1586	土地	とち	Bản đồ	280	2026-06-24 06:26:13.568	2026-06-24 06:26:13.568
1587	地理	ちり	Địa lý	280	2026-06-24 06:26:13.571	2026-06-24 06:26:13.571
1588	地下	ちか	Tầng hầm, dưới lòng đất	280	2026-06-24 06:26:13.573	2026-06-24 06:26:13.573
1589	地下鉄	ちかてつ	Tàu điện ngầm	280	2026-06-24 06:26:13.574	2026-06-24 06:26:13.574
1590	地震	じしん	Động đất	280	2026-06-24 06:26:13.576	2026-06-24 06:26:13.576
1591	意地悪	いじわる	Miền, địa phương, vùng	280	2026-06-24 06:26:13.578	2026-06-24 06:26:13.578
1592	地球	ちきゅう	Trái đất, địa cầu	280	2026-06-24 06:26:13.58	2026-06-24 06:26:13.58
1593	漢字	かんじ	Thế giới	281	2026-06-24 06:26:13.584	2026-06-24 06:26:13.584
1594	世話	せわ	Sự quan tâm	281	2026-06-24 06:26:13.586	2026-06-24 06:26:13.586
1595	世紀	せいき	Thế kỷ	281	2026-06-24 06:26:13.587	2026-06-24 06:26:13.587
1596	世間	せけん	Thế gian	281	2026-06-24 06:26:13.589	2026-06-24 06:26:13.589
1597	世代	せだい	Thế hệ	281	2026-06-24 06:26:13.59	2026-06-24 06:26:13.59
1598	世	よ	Trong cõi đời, trong thế giới này	281	2026-06-24 06:26:13.592	2026-06-24 06:26:13.592
1599	世論	よろん	Công luận	281	2026-06-24 06:26:13.593	2026-06-24 06:26:13.593
1600	世論	せろん	Công luận	281	2026-06-24 06:26:13.596	2026-06-24 06:26:13.596
1601	世辞	せじ	sự nịnh  nọt	281	2026-06-24 06:26:13.598	2026-06-24 06:26:13.598
1602	田	た	Thế giới	282	2026-06-24 06:26:13.601	2026-06-24 06:26:13.601
1603	限界	げんかい	Phạm vi, phạm trù, giới hạn	282	2026-06-24 06:26:13.603	2026-06-24 06:26:13.603
1604	境界	きょうかい	Biên giới, biên cương	282	2026-06-24 06:26:13.604	2026-06-24 06:26:13.604
1605	政界	せいかい	Giới chính trị	282	2026-06-24 06:26:13.606	2026-06-24 06:26:13.606
1606	業界	ぎょうかい	Ngành nghề, giới kinh doanh, thị trường	282	2026-06-24 06:26:13.608	2026-06-24 06:26:13.608
1607	家	いえ	Một lần, một lúc	283	2026-06-24 06:26:13.614	2026-06-24 06:26:13.614
1608	今度	こんど	Lần này	283	2026-06-24 06:26:13.616	2026-06-24 06:26:13.616
1609	三十度	さんじゅうど	30 độ	283	2026-06-24 06:26:13.618	2026-06-24 06:26:13.618
1610	温度	おんど	Ôn độ, nhiệt độ	283	2026-06-24 06:26:13.62	2026-06-24 06:26:13.62
1611	度々	たびたび	Thường xuyên, nhiều lần	283	2026-06-24 06:26:13.622	2026-06-24 06:26:13.622
1612	支度	したく	Tốc độ	283	2026-06-24 06:26:13.624	2026-06-24 06:26:13.624
1613	限度	げんど	Hạn độ, giới hạn, mức độ hạn chế	283	2026-06-24 06:26:13.625	2026-06-24 06:26:13.625
1614	回	まわ	Một lần	284	2026-06-24 06:26:13.631	2026-06-24 06:26:13.631
1615	何回	なんかい	Mấy lần	284	2026-06-24 06:26:13.633	2026-06-24 06:26:13.633
1616	回	まわ	Tập vé, cuốn sổ vé	284	2026-06-24 06:26:13.635	2026-06-24 06:26:13.635
1617	今回	こんかい	Lần này	284	2026-06-24 06:26:13.637	2026-06-24 06:26:13.637
1618	回答	かいとう	Sự trả lời, câu trả lời	284	2026-06-24 06:26:13.639	2026-06-24 06:26:13.639
1619	回復	かいふく	Khôi phục, hồi phục	284	2026-06-24 06:26:13.641	2026-06-24 06:26:13.641
1620	回転	かいてん	Sự xoay chuyển, xoay vòng	284	2026-06-24 06:26:13.643	2026-06-24 06:26:13.643
1621	私	わたし	Công việc, việc bận	285	2026-06-24 06:26:13.649	2026-06-24 06:26:13.649
1622	用事	ようじ	Việc bận	285	2026-06-24 06:26:13.651	2026-06-24 06:26:13.651
1623	用意	ようい	Thuật ngữ	285	2026-06-24 06:26:13.653	2026-06-24 06:26:13.653
1624	用紙	ようし	Mẫu giấy trắng, form trắng	285	2026-06-24 06:26:13.655	2026-06-24 06:26:13.655
1625	使用	しよう	Lệ phí, phí	285	2026-06-24 06:26:13.658	2026-06-24 06:26:13.658
1626	人	ひと	Người dân thành phố	286	2026-06-24 06:26:13.665	2026-06-24 06:26:13.665
1627	国民	こくみん	Thứ dân, quốc dân, nhân dân	286	2026-06-24 06:26:13.667	2026-06-24 06:26:13.667
1628	住民	じゅうみん	Người dân cư trú	286	2026-06-24 06:26:13.669	2026-06-24 06:26:13.669
1629	民主	みんしゅ	Chủ nghĩa dân chủ	286	2026-06-24 06:26:13.671	2026-06-24 06:26:13.671
1630	民族	みんぞく	Dân tộc	286	2026-06-24 06:26:13.674	2026-06-24 06:26:13.674
1631	難民	なんみん	Người lánh nạn, dân tỵ nạn	286	2026-06-24 06:26:13.676	2026-06-24 06:26:13.676
1632	民	たみ	Dân, người dân	286	2026-06-24 06:26:13.68	2026-06-24 06:26:13.68
1633	民間	みんかん	Tư nhân, thuộc người dân, dân sự	286	2026-06-24 06:26:13.683	2026-06-24 06:26:13.683
1634	主人	しゅじん	Sự tiêm, tiêm chủng	287	2026-06-24 06:26:13.687	2026-06-24 06:26:13.687
1635	注目	ちゅうもく	Sự chuú ý	287	2026-06-24 06:26:13.689	2026-06-24 06:26:13.689
1636	発注	はっちゅう	Không chú ý	287	2026-06-24 06:26:13.692	2026-06-24 06:26:13.692
1637	心	こころ	Ý nghĩa	288	2026-06-24 06:26:13.699	2026-06-24 06:26:13.699
1638	注意	ちゅうい	Ý kiến	288	2026-06-24 06:26:13.701	2026-06-24 06:26:13.701
1639	用意	ようい	Hữu ý, thiện chí, lòng tốt	288	2026-06-24 06:26:13.703	2026-06-24 06:26:13.703
1640	意外	いがい	Ý định	288	2026-06-24 06:26:13.705	2026-06-24 06:26:13.705
1641	豆	まめ	Cái đầu	289	2026-06-24 06:26:13.713	2026-06-24 06:26:13.713
1642	頭痛	ずつう	Sự đau đầu	289	2026-06-24 06:26:13.715	2026-06-24 06:26:13.715
1643	先頭	せんとう	sự dẫn đầu, tiên phong	289	2026-06-24 06:26:13.717	2026-06-24 06:26:13.717
1644	二頭	にとう	2 con (trâu, bò,…)	289	2026-06-24 06:26:13.72	2026-06-24 06:26:13.72
1645	頭脳	ずのう	Bộ não, đầu óc, trí  óc	289	2026-06-24 06:26:13.722	2026-06-24 06:26:13.722
1646	頭文字	かしらもじ	Kí tự đầu tiên	289	2026-06-24 06:26:13.725	2026-06-24 06:26:13.725
1647	音頭	おんど	Người hát chính trong hợp xướng	289	2026-06-24 06:26:13.729	2026-06-24 06:26:13.729
1648	店頭	てんとう	Quaầy hàng, quầy thi tiền	289	2026-06-24 06:26:13.732	2026-06-24 06:26:13.732
1649	頭	あたま	Khuôn mặt	290	2026-06-24 06:26:13.737	2026-06-24 06:26:13.737
1650	笑顔	えがお	Khuôn mặt tươi cười	290	2026-06-24 06:26:13.739	2026-06-24 06:26:13.739
1651	洗顔	せんがん	Sự rửa mặt	290	2026-06-24 06:26:13.741	2026-06-24 06:26:13.741
1652	顔	かお	Tranh chân dung	290	2026-06-24 06:26:13.745	2026-06-24 06:26:13.745
1653	戸	と	tiếng nói	291	2026-06-24 06:26:13.751	2026-06-24 06:26:13.751
1654	音声学	おんせいがく	Ngữ âm học	291	2026-06-24 06:26:13.753	2026-06-24 06:26:13.753
1655	声	こえ	Từ tượng thanh	291	2026-06-24 06:26:13.756	2026-06-24 06:26:13.756
1656	声楽	せいがく	Thanh nhạc	291	2026-06-24 06:26:13.758	2026-06-24 06:26:13.758
1657	声優	せいゆう	Diễn viên lồng tiếng	291	2026-06-24 06:26:13.761	2026-06-24 06:26:13.761
1658	声色	こわいろ	Thanh sắc, giọng	291	2026-06-24 06:26:13.765	2026-06-24 06:26:13.765
1659	今日	きょう	tàu tốc hành	292	2026-06-24 06:26:13.77	2026-06-24 06:26:13.77
1660	独特	どくとく	Đặc sắc, đặc điểm, ưu điểm nổi bật	292	2026-06-24 06:26:13.773	2026-06-24 06:26:13.773
1661	特徴	とくちょう	Đặc trưng	292	2026-06-24 06:26:13.775	2026-06-24 06:26:13.775
1662	特技	とくぎ	Kỹ thuật,  kỹ năng đặc biệt	292	2026-06-24 06:26:13.778	2026-06-24 06:26:13.778
1663	包丁	ほうちょう	Giới tính	293	2026-06-24 06:26:13.784	2026-06-24 06:26:13.784
1664	差別	さべつ	Sự phân biệt	293	2026-06-24 06:26:13.786	2026-06-24 06:26:13.786
1665	別荘	べっそう	Biệt thự	293	2026-06-24 06:26:13.789	2026-06-24 06:26:13.789
1666	竹	たけ	Tre, trúc	294	2026-06-24 06:26:13.794	2026-06-24 06:26:13.794
1667	竹	たけ	Măng	294	2026-06-24 06:26:13.797	2026-06-24 06:26:13.797
1668	竹林	ちくりん	Rừng trúc	294	2026-06-24 06:26:13.8	2026-06-24 06:26:13.8
1669	箱	はこ	cuộc thi đấu, trận đấu	295	2026-06-24 06:26:13.805	2026-06-24 06:26:13.805
1670	間	ま	tình huống, hoàn cảnh, điều kiện	295	2026-06-24 06:26:13.807	2026-06-24 06:26:13.807
1671	場合	ばあい	Trường hợp	295	2026-06-24 06:26:13.809	2026-06-24 06:26:13.809
1672	似合	にあ	trại huấn luyện, trại tập trung để rèn luyện	295	2026-06-24 06:26:13.813	2026-06-24 06:26:13.813
1673	私	わたし	Giấy thi	296	2026-06-24 06:26:13.819	2026-06-24 06:26:13.819
1674	回答	かいとう	sự trả lời, hồi đáp	296	2026-06-24 06:26:13.821	2026-06-24 06:26:13.821
1675	解答	かいとう	sự trả lời, giải pháp	296	2026-06-24 06:26:13.823	2026-06-24 06:26:13.823
1676	返答	へんとう	sự trả lời, sự đáp lời	296	2026-06-24 06:26:13.825	2026-06-24 06:26:13.825
1677	赤信号	あかしんごう	Tết	297	2026-06-24 06:26:13.833	2026-06-24 06:26:13.833
1678	正	ただ	buổi trưa, giữa ngày, ban trưa	297	2026-06-24 06:26:13.835	2026-06-24 06:26:13.835
1679	正直	しょうじき	sự giải thích đúng, sự giải thích chính xác	297	2026-06-24 06:26:13.837	2026-06-24 06:26:13.837
1680	入	はい	sự đồng thời, sự cùng lúc	298	2026-06-24 06:26:13.842	2026-06-24 06:26:13.842
1681	同僚	どうりょう	Đồng nghiệp	298	2026-06-24 06:26:13.847	2026-06-24 06:26:13.847
1682	共同	きょうどう	cộng đồng, sự liên hiệp, liên đới	298	2026-06-24 06:26:13.849	2026-06-24 06:26:13.849
1683	同級生	どうきゅうせい	Bạn cùng khoá; bạn cùng lớp	298	2026-06-24 06:26:13.851	2026-06-24 06:26:13.851
1684	数	かぞ	đồng hồ	299	2026-06-24 06:26:13.855	2026-06-24 06:26:13.855
1685	計画	けいかく	Kế hoạch, chương trình, phương án	299	2026-06-24 06:26:13.858	2026-06-24 06:26:13.858
1686	合計	ごうけい	tổng số	299	2026-06-24 06:26:13.86	2026-06-24 06:26:13.86
1687	計	はか	Tính toán	299	2026-06-24 06:26:13.864	2026-06-24 06:26:13.864
1688	統計	とうけい	Thống kê	299	2026-06-24 06:26:13.866	2026-06-24 06:26:13.866
1689	計算	けいさん	tài chính gia đình	299	2026-06-24 06:26:13.869	2026-06-24 06:26:13.869
1690	丘	おか	Tokyo	300	2026-06-24 06:26:13.874	2026-06-24 06:26:13.874
1691	京子	きょうこ	Kyoko( tên1 người phụ nữ Nhật)	300	2026-06-24 06:26:13.877	2026-06-24 06:26:13.877
1692	京都	きょうと	Kyoto	300	2026-06-24 06:26:13.881	2026-06-24 06:26:13.881
1693	京阪神	けいはんしん	Kyoto- Osaka - Kobe	300	2026-06-24 06:26:13.883	2026-06-24 06:26:13.883
1694	鳥	とり	tụ họp	301	2026-06-24 06:26:13.888	2026-06-24 06:26:13.888
1695	集中	しゅうちゅう	tập trung, chú tâm	301	2026-06-24 06:26:13.891	2026-06-24 06:26:13.891
1696	集団	しゅうだん	tập thể, tập đoàn	301	2026-06-24 06:26:13.893	2026-06-24 06:26:13.893
1697	不便	ふべん	số đen, bất hạnh, không may mắn	302	2026-06-24 06:26:13.903	2026-06-24 06:26:13.903
1698	水不足	みずぶそく	Tình trạng thiếu nước	302	2026-06-24 06:26:13.905	2026-06-24 06:26:13.905
1699	不可能	ふかのう	Khó khăn (kinh doanh); không chạy (buôn bán); ế ẩm	302	2026-06-24 06:26:13.908	2026-06-24 06:26:13.908
1700	郵便	ゆうびん	Bưu điện	303	2026-06-24 06:26:13.913	2026-06-24 06:26:13.913
1701	便	たよ	nhà vệ sinh, toa lét	303	2026-06-24 06:26:13.915	2026-06-24 06:26:13.915
1702	航空便	こうくうびん	Bưu phẩm gởi bằng đường hàng không	303	2026-06-24 06:26:13.917	2026-06-24 06:26:13.917
1703	船便	ふなびん	Gởi bằng đường tàu	303	2026-06-24 06:26:13.919	2026-06-24 06:26:13.919
1704	便	びん	Sự thuận tiện	303	2026-06-24 06:26:13.92	2026-06-24 06:26:13.92
1705	以上	いじょう	～trở lên	304	2026-06-24 06:26:13.925	2026-06-24 06:26:13.925
1706	以下	いか	～trở xuống	304	2026-06-24 06:26:13.927	2026-06-24 06:26:13.927
1707	以外	いがい	～ngoài ra	304	2026-06-24 06:26:13.93	2026-06-24 06:26:13.93
1708	以内	いない	～trong vòng	304	2026-06-24 06:26:13.933	2026-06-24 06:26:13.933
1709	以前	いぜん	trước kia	304	2026-06-24 06:26:13.935	2026-06-24 06:26:13.935
1710	以後	いご	sau đó, từ sau đó, từ sau khi	304	2026-06-24 06:26:13.938	2026-06-24 06:26:13.938
1711	以来	いらい	kể từ～	304	2026-06-24 06:26:13.94	2026-06-24 06:26:13.94
1712	土	つち	Địa điểm	305	2026-06-24 06:26:13.948	2026-06-24 06:26:13.948
1713	場合	ばあい	Trường hợp	305	2026-06-24 06:26:13.951	2026-06-24 06:26:13.951
1714	会場	かいじょう	hội trường	305	2026-06-24 06:26:13.953	2026-06-24 06:26:13.953
1715	工場	こうじょう	Công trường	305	2026-06-24 06:26:13.955	2026-06-24 06:26:13.955
1716	売	う	Quầy bán hàng	305	2026-06-24 06:26:13.957	2026-06-24 06:26:13.957
1717	駐車場	ちゅうしゃじょう	Chỗ đỗ xe	305	2026-06-24 06:26:13.96	2026-06-24 06:26:13.96
1718	広場	ひろば	quảng trường	305	2026-06-24 06:26:13.964	2026-06-24 06:26:13.964
1719	市場	いちば	Chợ	305	2026-06-24 06:26:13.968	2026-06-24 06:26:13.968
1720	戸	と	Cửa	306	2026-06-24 06:26:13.975	2026-06-24 06:26:13.975
1721	戸棚	とだな	giá đựng bát đĩa, tủ bếp	306	2026-06-24 06:26:13.979	2026-06-24 06:26:13.979
1722	井戸	いど	Giếng nước	306	2026-06-24 06:26:13.983	2026-06-24 06:26:13.983
1723	戸締	とじま	cửa lưới	306	2026-06-24 06:26:13.987	2026-06-24 06:26:13.987
1724	江戸	えど	Thời edo	306	2026-06-24 06:26:13.99	2026-06-24 06:26:13.99
1725	戸籍	こせき	Hộ tịch, hộ khẩu	306	2026-06-24 06:26:13.994	2026-06-24 06:26:13.994
1726	戸	と	Là nơi như thế nào	307	2026-06-24 06:26:14.003	2026-06-24 06:26:14.003
1727	台所	だいどころ	Nhà bếp	307	2026-06-24 06:26:14.006	2026-06-24 06:26:14.006
1728	住所	じゅうしょ	nơi sinh sống, địa chỉ	307	2026-06-24 06:26:14.01	2026-06-24 06:26:14.01
1729	近所	きんじょ	xóm giềng ,vùng phụ cận, nhà hàng xóm, hàng xóm, láng giềng	307	2026-06-24 06:26:14.015	2026-06-24 06:26:14.015
1730	場所	ばしょ	Địa điểm	307	2026-06-24 06:26:14.019	2026-06-24 06:26:14.019
1731	事務	じむ	Văn phòng	307	2026-06-24 06:26:14.021	2026-06-24 06:26:14.021
1732	市役所	しやくしょ	Cơ quan hành chính thành phố	307	2026-06-24 06:26:14.024	2026-06-24 06:26:14.024
1733	人	ひと	cửa hàng sách	308	2026-06-24 06:26:14.032	2026-06-24 06:26:14.032
1734	屋上	おくじょう	sân thượng, tầng thượng	308	2026-06-24 06:26:14.034	2026-06-24 06:26:14.034
1735	八百屋	やおや	Cửa hàng rau quả	308	2026-06-24 06:26:14.037	2026-06-24 06:26:14.037
1736	部屋	へや	căn phòng	308	2026-06-24 06:26:14.039	2026-06-24 06:26:14.039
1737	床屋	とこや	hiệu cắt tóc	308	2026-06-24 06:26:14.042	2026-06-24 06:26:14.042
1738	屋根	やね	Mái nhà	308	2026-06-24 06:26:14.046	2026-06-24 06:26:14.046
1739	名古屋	なごや	Thành phố Nagoya Nhật Bản	308	2026-06-24 06:26:14.05	2026-06-24 06:26:14.05
1740	酒屋	さかや	tửu quán ,tiệm rượu ,quán rượu	308	2026-06-24 06:26:14.052	2026-06-24 06:26:14.052
1741	土	つち	Căn tin	309	2026-06-24 06:26:14.058	2026-06-24 06:26:14.058
1742	講堂	こうどう	Giảng đường	309	2026-06-24 06:26:14.063	2026-06-24 06:26:14.063
1743	堂々	どうどう	Tòa thị chính	309	2026-06-24 06:26:14.066	2026-06-24 06:26:14.066
1744	国会議事堂	こっかいぎじどう	Tòa nhà nghị sự quốc hội; tòa nhà quốc hội .	309	2026-06-24 06:26:14.07	2026-06-24 06:26:14.07
1745	停	てい	Kinh đô Tokyo	310	2026-06-24 06:26:14.076	2026-06-24 06:26:14.076
1746	首都	しゅと	thủ đô	310	2026-06-24 06:26:14.08	2026-06-24 06:26:14.08
1747	都合	つごう	tình huống, hoàn cảnh, điều kiện	310	2026-06-24 06:26:14.083	2026-06-24 06:26:14.083
1748	京都	きょうと	Kyoto	310	2026-06-24 06:26:14.086	2026-06-24 06:26:14.086
1749	都会	とかい	thành thị, thành phố	310	2026-06-24 06:26:14.088	2026-06-24 06:26:14.088
1750	都	みやこ	thủ đô	310	2026-06-24 06:26:14.091	2026-06-24 06:26:14.091
1751	都心	としん	trung tâm thành phố, trung tâm đô thị	310	2026-06-24 06:26:14.094	2026-06-24 06:26:14.094
1752	国	くに	Tỉnh nagano	311	2026-06-24 06:26:14.101	2026-06-24 06:26:14.101
1753	県庁	けんちょう	Ủy ban tỉnh	311	2026-06-24 06:26:14.104	2026-06-24 06:26:14.104
1754	県知事	けんちじ	người đứng đầu một tỉnh (của Nhật Bản)	311	2026-06-24 06:26:14.107	2026-06-24 06:26:14.107
1755	県立	けんりつ	Sự thuộc về tỉnh; do tỉnh thành lập	311	2026-06-24 06:26:14.112	2026-06-24 06:26:14.112
1756	都道府県	とどうふけん	Sự phân chia hành chính của Nhật	311	2026-06-24 06:26:14.116	2026-06-24 06:26:14.116
1757	区	く	Khua phía bắc	312	2026-06-24 06:26:14.124	2026-06-24 06:26:14.124
1758	区切	くぎ	khu vực, phạm vi, lĩnh vực, khối	312	2026-06-24 06:26:14.127	2026-06-24 06:26:14.127
1759	地区	ちく	khu; khu vực	312	2026-06-24 06:26:14.132	2026-06-24 06:26:14.132
1760	区役所	くやくしょ	Trụ sở hành chính khu vực	312	2026-06-24 06:26:14.135	2026-06-24 06:26:14.135
1761	区別	くべつ	đoạn, phân đoạn, khoảng, khoảng cách	312	2026-06-24 06:26:14.137	2026-06-24 06:26:14.137
1762	行	い	Ao, hồ	313	2026-06-24 06:26:14.14	2026-06-24 06:26:14.14
1763	電池	でんち	pin	313	2026-06-24 06:26:14.142	2026-06-24 06:26:14.142
1764	溜	た	Cái hồ	313	2026-06-24 06:26:14.143	2026-06-24 06:26:14.143
1765	貯水池	ちょすいち	Hồ chứa nước	313	2026-06-24 06:26:14.147	2026-06-24 06:26:14.147
1766	用水地	ようすいち	Bể chứa nước	313	2026-06-24 06:26:14.149	2026-06-24 06:26:14.149
1767	人類	じんるい	sự phát âm	314	2026-06-24 06:26:14.153	2026-06-24 06:26:14.153
1768	出発	しゅっぱつ	Sự xuất phát, khởi hành	314	2026-06-24 06:26:14.154	2026-06-24 06:26:14.154
1769	発表	はっぴょう	Phát biểu	314	2026-06-24 06:26:14.156	2026-06-24 06:26:14.156
1770	発明	はつめい	Sự phát minh	314	2026-06-24 06:26:14.157	2026-06-24 06:26:14.157
1771	発見	はっけん	Sự phát hiện, khám phấ	314	2026-06-24 06:26:14.159	2026-06-24 06:26:14.159
1772	発売	はつばい	Sự bán ra, phát hành sản phẩm	314	2026-06-24 06:26:14.161	2026-06-24 06:26:14.161
1773	始発	しはつ	chuyến tàu đầu tiên	314	2026-06-24 06:26:14.164	2026-06-24 06:26:14.164
1774	発足	ほっそく	Sự mở đầu hoạt động; sự thành lập	314	2026-06-24 06:26:14.166	2026-06-24 06:26:14.166
1775	建物	たてもの	tòa nhà, công trình kiến trúc	315	2026-06-24 06:26:14.169	2026-06-24 06:26:14.169
1776	建	た	sự kiến thiết, sự xây dựng	315	2026-06-24 06:26:14.172	2026-06-24 06:26:14.172
1777	建築	けんちく	Kiến trúc, xây dựng	315	2026-06-24 06:26:14.174	2026-06-24 06:26:14.174
1778	二階建	にかいだ	Kiến quốc, xây dừng nền tảng đất nước	315	2026-06-24 06:26:14.176	2026-06-24 06:26:14.176
1779	建立	こんりゅう	Sự xây dựng	315	2026-06-24 06:26:14.179	2026-06-24 06:26:14.179
1780	牛	うし	Đồ vật	316	2026-06-24 06:26:14.183	2026-06-24 06:26:14.183
1781	食	た	Đồ ăn	316	2026-06-24 06:26:14.185	2026-06-24 06:26:14.185
1782	飲	の	Thức uống	316	2026-06-24 06:26:14.186	2026-06-24 06:26:14.186
1783	買	か	Việc mua sắm	316	2026-06-24 06:26:14.188	2026-06-24 06:26:14.188
1784	着物	きもの	Kimono (y phục truyền thống của Nhật bản)	316	2026-06-24 06:26:14.189	2026-06-24 06:26:14.189
1785	動物	どうぶつ	Động vật	316	2026-06-24 06:26:14.192	2026-06-24 06:26:14.192
1786	建物	たてもの	tòa nhà, ngôi nhà, công trình kiến trúc	316	2026-06-24 06:26:14.195	2026-06-24 06:26:14.195
1787	果物	くだもの	hoa quả, trái cây	316	2026-06-24 06:26:14.198	2026-06-24 06:26:14.198
1788	荷物	にもつ	Hành lý	316	2026-06-24 06:26:14.2	2026-06-24 06:26:14.2
1789	三	みっ	Hàng hóa, vật phẩm	317	2026-06-24 06:26:14.204	2026-06-24 06:26:14.204
1790	日用品	にちようひん	Vật dụng hàng ngày	317	2026-06-24 06:26:14.206	2026-06-24 06:26:14.206
1791	製品	せいひん	thành phẩm ,sản phẩm ,hàng hóa	317	2026-06-24 06:26:14.208	2026-06-24 06:26:14.208
1792	必需品	ひつじゅひん	Mặt hàng nhu yếu; nhu yếu phẩm	317	2026-06-24 06:26:14.211	2026-06-24 06:26:14.211
1793	作品	さくひん	Tác phẩm	317	2026-06-24 06:26:14.214	2026-06-24 06:26:14.214
1794	上品	じょうひん	Thực phẩm; nguyên liệu nấu ăn	317	2026-06-24 06:26:14.216	2026-06-24 06:26:14.216
1795	二人	ふたり	Du lịch	318	2026-06-24 06:26:14.22	2026-06-24 06:26:14.22
1796	旅館	りょかん	Nhà trọ cho khách du lịch	318	2026-06-24 06:26:14.223	2026-06-24 06:26:14.223
1797	旅券	りょけん	hộ chiếu	318	2026-06-24 06:26:14.225	2026-06-24 06:26:14.225
1798	旅	たび	Chuyến đi	318	2026-06-24 06:26:14.227	2026-06-24 06:26:14.227
1799	一人旅	ひとりたび	Du lịch một mình	318	2026-06-24 06:26:14.23	2026-06-24 06:26:14.23
1800	旅費	りょひ	lộ phí, phí đi du lịch	318	2026-06-24 06:26:14.232	2026-06-24 06:26:14.232
1801	乗	の	Giao thông	319	2026-06-24 06:26:14.235	2026-06-24 06:26:14.235
1802	通訳	つうやく	Việc phiên dịch	319	2026-06-24 06:26:14.237	2026-06-24 06:26:14.237
1803	普通	ふつう	Việc đi học	319	2026-06-24 06:26:14.239	2026-06-24 06:26:14.239
1804	通勤	つうきん	Việc đi làm	319	2026-06-24 06:26:14.241	2026-06-24 06:26:14.241
1805	鳥	とり	Học lên, học lên đại học	320	2026-06-24 06:26:14.247	2026-06-24 06:26:14.247
1806	進歩	しんぽ	tiến bộ	320	2026-06-24 06:26:14.25	2026-06-24 06:26:14.25
1807	進化	しんか	Sự tiến hóa	320	2026-06-24 06:26:14.253	2026-06-24 06:26:14.253
1808	昇進	しょうしん	Việc thăng tiến, thăng chức	320	2026-06-24 06:26:14.255	2026-06-24 06:26:14.255
1809	先進国	せんしんこく	Nước tiên tiến	320	2026-06-24 06:26:14.257	2026-06-24 06:26:14.257
1810	体	からだ	Hình tròn	321	2026-06-24 06:26:14.266	2026-06-24 06:26:14.266
1811	丸	まる	Viên đạn	321	2026-06-24 06:26:14.269	2026-06-24 06:26:14.269
1812	熱	ねつ	Nhiệt độ	322	2026-06-24 06:26:14.274	2026-06-24 06:26:14.274
1813	熱心	ねっしん	nhiệt đới	322	2026-06-24 06:26:14.276	2026-06-24 06:26:14.276
1814	熱	ねっ	Sự đốt nóng, sự đun nóng	322	2026-06-24 06:26:14.279	2026-06-24 06:26:14.279
1815	熱湯	ねっとう	nước sôi	322	2026-06-24 06:26:14.282	2026-06-24 06:26:14.282
1816	冷	つめ	Tủ lạnh	323	2026-06-24 06:26:14.287	2026-06-24 06:26:14.287
1817	冷房	れいぼう	Phòng lạnh	323	2026-06-24 06:26:14.289	2026-06-24 06:26:14.289
1818	中	なか	Đồ ngọt	324	2026-06-24 06:26:14.294	2026-06-24 06:26:14.294
1819	汚	きたな	Ô nhiễm	325	2026-06-24 06:26:14.299	2026-06-24 06:26:14.299
1820	汚	よご	sự tham ô, sự tham nhũng	325	2026-06-24 06:26:14.301	2026-06-24 06:26:14.301
1821	果物	くだもの	hoa quả, trái cây	326	2026-06-24 06:26:14.306	2026-06-24 06:26:14.306
1822	結果	けっか	Kết quả	326	2026-06-24 06:26:14.308	2026-06-24 06:26:14.308
1823	効果	こうか	có hiệu quả, có tác dụng	326	2026-06-24 06:26:14.311	2026-06-24 06:26:14.311
1824	果実	かじつ	quả	326	2026-06-24 06:26:14.313	2026-06-24 06:26:14.313
1825	果	は	thành quả, kết quả	326	2026-06-24 06:26:14.315	2026-06-24 06:26:14.315
1826	卵	たまご	Trứng	327	2026-06-24 06:26:14.318	2026-06-24 06:26:14.318
1827	卵黄	らんおう	Lòng đỏ	327	2026-06-24 06:26:14.319	2026-06-24 06:26:14.319
1828	卵白	らんぱく	Lòng trắng	327	2026-06-24 06:26:14.321	2026-06-24 06:26:14.321
1829	皿	さら	Đĩa	328	2026-06-24 06:26:14.324	2026-06-24 06:26:14.324
1830	灰皿	はいざら	Gạt tàn thuốc	328	2026-06-24 06:26:14.326	2026-06-24 06:26:14.326
1831	紙	かみ	Đĩa giấy	328	2026-06-24 06:26:14.328	2026-06-24 06:26:14.328
1832	大皿	おおざら	Cái đĩa lớn	328	2026-06-24 06:26:14.331	2026-06-24 06:26:14.331
1833	小皿	こざら	Cái đĩa nhỏ	328	2026-06-24 06:26:14.332	2026-06-24 06:26:14.332
1834	酒	さけ	Rược	329	2026-06-24 06:26:14.336	2026-06-24 06:26:14.336
1835	酒屋	さかや	tửu quán ,tiệm rượu ,quán rượu	329	2026-06-24 06:26:14.338	2026-06-24 06:26:14.338
1836	日本酒	にほんしゅ	Rược Nhật	329	2026-06-24 06:26:14.339	2026-06-24 06:26:14.339
1837	飲酒	いんしゅ	Lái xe trong tình trạng say rượu	329	2026-06-24 06:26:14.341	2026-06-24 06:26:14.341
1838	洋酒	ようしゅ	Rượu Tây	329	2026-06-24 06:26:14.344	2026-06-24 06:26:14.344
1839	居酒屋	いざかや	Quán rượu	329	2026-06-24 06:26:14.348	2026-06-24 06:26:14.348
1840	地酒	じざけ	Rượu địa phương	329	2026-06-24 06:26:14.351	2026-06-24 06:26:14.351
1841	皿	さら	Muối ăn	330	2026-06-24 06:26:14.358	2026-06-24 06:26:14.358
1842	塩辛	しおから	muối ăn	330	2026-06-24 06:26:14.361	2026-06-24 06:26:14.361
1843	塩分	えんぶん	lượng muối	330	2026-06-24 06:26:14.365	2026-06-24 06:26:14.365
1844	塩水	しおみず	nước muối	330	2026-06-24 06:26:14.369	2026-06-24 06:26:14.369
1845	人	ひと	ngày tháng	331	2026-06-24 06:26:14.374	2026-06-24 06:26:14.374
1846	日付	ひづ	lễ tân, quầy thường trực	331	2026-06-24 06:26:14.376	2026-06-24 06:26:14.376
1847	受	う	Sự tặng cho, kính tặng, quyên cúng	331	2026-06-24 06:26:14.381	2026-06-24 06:26:14.381
1848	付録	ふろく	Túi xách	331	2026-06-24 06:26:14.384	2026-06-24 06:26:14.384
1849	木	き	một chiều, một lượt	332	2026-06-24 06:26:14.39	2026-06-24 06:26:14.39
1850	片方	かたほう	Một hướng; một chiều; một chiếc; một bên	332	2026-06-24 06:26:14.393	2026-06-24 06:26:14.393
1851	片手	かたて	một tay	332	2026-06-24 06:26:14.398	2026-06-24 06:26:14.398
1852	片言	かたこと	Kiến thức nông cạn; sự biết lõm bõm	332	2026-06-24 06:26:14.402	2026-06-24 06:26:14.402
1853	片寄	かたよ	mảnh vụn, mảnh vỡ	332	2026-06-24 06:26:14.405	2026-06-24 06:26:14.405
1854	本	ぽん	Gà quay, gà nướng	333	2026-06-24 06:26:14.412	2026-06-24 06:26:14.412
1855	焼肉	やきにく	thịt quay, thịt nướng	333	2026-06-24 06:26:14.416	2026-06-24 06:26:14.416
1856	燃焼	ねんしょう	Sự đốt cháy	333	2026-06-24 06:26:14.419	2026-06-24 06:26:14.419
1857	月	つき	Cục phòng cháy chữa cháy	334	2026-06-24 06:26:14.426	2026-06-24 06:26:14.426
1858	古	ふる	thể rắn, dạng rắn, chất rắn	335	2026-06-24 06:26:14.434	2026-06-24 06:26:14.434
1859	固定	こてい	cố định, sự cố định, sự giữ nguyên, giữ nguyên, giữ cố định	335	2026-06-24 06:26:14.437	2026-06-24 06:26:14.437
1860	頑固	がんこ	Ngoan cố, cố chấp	335	2026-06-24 06:26:14.44	2026-06-24 06:26:14.44
1861	個人	こじん	một cái, một cục, một viên	336	2026-06-24 06:26:14.448	2026-06-24 06:26:14.448
1862	個人	こじん	cá nhân, cá thể	336	2026-06-24 06:26:14.452	2026-06-24 06:26:14.452
1863	個人	こじん	Chủ nghĩa cá nhân	336	2026-06-24 06:26:14.455	2026-06-24 06:26:14.455
1864	個展	こてん	Triển lãm cá nhân (tự tổ chức triển lãm)	336	2026-06-24 06:26:14.459	2026-06-24 06:26:14.459
1865	個性	こせい	Cá tính, tính cách	336	2026-06-24 06:26:14.464	2026-06-24 06:26:14.464
1866	個数	こすう	Số của mỗi thứ	336	2026-06-24 06:26:14.468	2026-06-24 06:26:14.468
1867	個室	こしつ	Phòng riêng	336	2026-06-24 06:26:14.471	2026-06-24 06:26:14.471
1868	人	ひと	Khuôn mặt tươi cười	337	2026-06-24 06:26:14.485	2026-06-24 06:26:14.485
1869	微笑	ほほえ	Sự mỉm cười	337	2026-06-24 06:26:14.489	2026-06-24 06:26:14.489
1870	立	た	Tiếng khóc	338	2026-06-24 06:26:14.498	2026-06-24 06:26:14.498
1871	泣	な	Mít ướt	338	2026-06-24 06:26:14.503	2026-06-24 06:26:14.503
1872	土	つち	số đen bất hạnh, không may mắn	340	2026-06-24 06:26:14.517	2026-06-24 06:26:14.517
1873	幸運	こううん	Vận may, số đỏ	340	2026-06-24 06:26:14.521	2026-06-24 06:26:14.521
1874	幸	さいわ	Sự may mắn, hạnh phúc	340	2026-06-24 06:26:14.525	2026-06-24 06:26:14.525
1875	彼	かれ	Thảm kịch	341	2026-06-24 06:26:14.533	2026-06-24 06:26:14.533
1876	古	ふる	kém, yếu	342	2026-06-24 06:26:14.54	2026-06-24 06:26:14.54
1877	苦	くる	Sự đau đớn, sự đau nhức	342	2026-06-24 06:26:14.546	2026-06-24 06:26:14.546
1878	苦労	くろう	Gian khổ, cam go	342	2026-06-24 06:26:14.55	2026-06-24 06:26:14.55
1879	苦情	くじょう	sự than phiề, lời than phiền	342	2026-06-24 06:26:14.552	2026-06-24 06:26:14.552
1880	痛	いた	Sự đau đầu	343	2026-06-24 06:26:14.558	2026-06-24 06:26:14.558
1881	苦痛	くつう	Sự đau đớn, sự đau nhức	343	2026-06-24 06:26:14.561	2026-06-24 06:26:14.561
1882	痛	いた	Cơn đau bụng	343	2026-06-24 06:26:14.565	2026-06-24 06:26:14.565
1883	腰痛	ようつう	đau thắt lưng	343	2026-06-24 06:26:14.567	2026-06-24 06:26:14.567
1884	自分	じぶん	sự xấu hổ	344	2026-06-24 06:26:14.573	2026-06-24 06:26:14.573
1885	恥	は	Tính nhút nhát,bẽn lẽn, ngượng	344	2026-06-24 06:26:14.576	2026-06-24 06:26:14.576
1886	酒	さけ	Sự đưa cho; sự chuyển cho; sự phân phát	345	2026-06-24 06:26:14.584	2026-06-24 06:26:14.584
1887	支配	しはい	sự ảnh hưởng, sự chi phối	345	2026-06-24 06:26:14.587	2026-06-24 06:26:14.587
1888	配偶者	はいぐうしゃ	Bạn đồng hành, người ghép đôi	345	2026-06-24 06:26:14.59	2026-06-24 06:26:14.59
1889	支配	しはい	Người quản lí, giám đốc, người điều hành	345	2026-06-24 06:26:14.592	2026-06-24 06:26:14.592
1890	宅配便	たくはいびん	Chuyển phát tận nhà	345	2026-06-24 06:26:14.596	2026-06-24 06:26:14.596
1891	大	おお	Bần cùng, nghèo khó	346	2026-06-24 06:26:14.601	2026-06-24 06:26:14.601
1892	困惑	こんわく	Bối rối	346	2026-06-24 06:26:14.604	2026-06-24 06:26:14.604
1893	棒	ぼう	Gia vị; hương liệu; chất tạo mùi hương	347	2026-06-24 06:26:14.609	2026-06-24 06:26:14.609
1894	辛抱	しんぼう	Sự kiên nhẫn; sự chịu đựng	347	2026-06-24 06:26:14.612	2026-06-24 06:26:14.612
1895	辛子	からし	Cây mù tạt; mù tạt	347	2026-06-24 06:26:14.615	2026-06-24 06:26:14.615
1896	人々	ひとびと	giấc ngủ	348	2026-06-24 06:26:14.621	2026-06-24 06:26:14.621
1897	居眠	いねむ	Ngủ đông	348	2026-06-24 06:26:14.624	2026-06-24 06:26:14.624
1898	催眠	さいみん	thuật thôi miên	348	2026-06-24 06:26:14.626	2026-06-24 06:26:14.626
1899	三人	さんにん	Tăng ca	349	2026-06-24 06:26:14.633	2026-06-24 06:26:14.633
1900	残高	ざんだか	Số dư tài khoản	349	2026-06-24 06:26:14.635	2026-06-24 06:26:14.635
1901	今	いま	Kỷ niệm	350	2026-06-24 06:26:14.639	2026-06-24 06:26:14.639
1902	記念日	きねんび	Ngày kỉ niệm	350	2026-06-24 06:26:14.641	2026-06-24 06:26:14.641
1903	信念	しんねん	Lòng tin	350	2026-06-24 06:26:14.643	2026-06-24 06:26:14.643
1904	念願	ねんがん	Tâm nguyện, nguyện vọng	350	2026-06-24 06:26:14.647	2026-06-24 06:26:14.647
1905	無念	むねん	làm tiếc, thương tiếc, hối tiếc, chán nản, sự buồn nản; sự thất vọng	350	2026-06-24 06:26:14.65	2026-06-24 06:26:14.65
1906	概念	がいねん	Khái niệm	350	2026-06-24 06:26:14.652	2026-06-24 06:26:14.652
1907	武器	ぶき	sự cảm tạ, biết ơn	351	2026-06-24 06:26:14.657	2026-06-24 06:26:14.657
1908	感想	かんそう	cảm tưởng, ấn tượng	351	2026-06-24 06:26:14.66	2026-06-24 06:26:14.66
1909	私	わたし	Tình cảm; tâm trạng; cảm xúc; cảm giác	352	2026-06-24 06:26:14.666	2026-06-24 06:26:14.666
1910	苦情	くじょう	sự , lời than phiền	352	2026-06-24 06:26:14.668	2026-06-24 06:26:14.668
1911	事情	じじょう	Tình hình, tình trạng	352	2026-06-24 06:26:14.67	2026-06-24 06:26:14.67
1912	友情	ゆうじょう	tình bạn, tình bằng hữu	352	2026-06-24 06:26:14.672	2026-06-24 06:26:14.672
1913	表情	ひょうじょう	Tình hình, biểu lộ tình cảm, bề ngoài	352	2026-06-24 06:26:14.674	2026-06-24 06:26:14.674
1914	情報	じょうほう	Thông tin, tin tức	352	2026-06-24 06:26:14.676	2026-06-24 06:26:14.676
1915	情	なさ	không khí, bầu không khí; cảm nhận	352	2026-06-24 06:26:14.68	2026-06-24 06:26:14.68
1916	学校	がっこう	cảm giác	353	2026-06-24 06:26:14.688	2026-06-24 06:26:14.688
1917	目	め	Vị giác	353	2026-06-24 06:26:14.69	2026-06-24 06:26:14.69
1918	視覚	しかく	thị giác	353	2026-06-24 06:26:14.692	2026-06-24 06:26:14.692
1919	目覚	めざ	Đồng hồ báo thức	353	2026-06-24 06:26:14.695	2026-06-24 06:26:14.695
1920	右側	みぎがわ	đồ để quên	354	2026-06-24 06:26:14.7	2026-06-24 06:26:14.7
1921	忘	わす	tiệc tất niên	354	2026-06-24 06:26:14.702	2026-06-24 06:26:14.702
1922	節水	せっすい	sự quyết định	355	2026-06-24 06:26:14.707	2026-06-24 06:26:14.707
1923	決心	けっしん	quyết tâm	355	2026-06-24 06:26:14.708	2026-06-24 06:26:14.708
1924	解決	かいけつ	giải quyết	355	2026-06-24 06:26:14.712	2026-06-24 06:26:14.712
1925	決勝	けっしょう	trận chung kết	355	2026-06-24 06:26:14.715	2026-06-24 06:26:14.715
1926	判決	はんけつ	phán quyết, quyết định của quan tòa	355	2026-06-24 06:26:14.718	2026-06-24 06:26:14.718
1927	引	ひ	dự định	356	2026-06-24 06:26:14.723	2026-06-24 06:26:14.723
1928	定休日	ていきゅうび	ngày nghỉ định kì	356	2026-06-24 06:26:14.725	2026-06-24 06:26:14.725
1929	決定	けってい	sự quyết định	356	2026-06-24 06:26:14.728	2026-06-24 06:26:14.728
1930	肯定	こうてい	Sự tính toán; sự thanh toán; tính tiền	356	2026-06-24 06:26:14.732	2026-06-24 06:26:14.732
1931	定期券	ていきけん	Vé định kì	356	2026-06-24 06:26:14.734	2026-06-24 06:26:14.734
1932	手	て	lễ tân, quầy thường trực	358	2026-06-24 06:26:14.741	2026-06-24 06:26:14.741
1933	受	う	ứng thí ,sự tham gia kì thi, dự thi	358	2026-06-24 06:26:14.743	2026-06-24 06:26:14.743
1934	受	う	bị động, thụ động	358	2026-06-24 06:26:14.747	2026-06-24 06:26:14.747
1935	受身	うけみ	bị động, thụ động	358	2026-06-24 06:26:14.75	2026-06-24 06:26:14.75
1936	受信	じゅしん	Sự thu tín hiệu	358	2026-06-24 06:26:14.752	2026-06-24 06:26:14.752
1937	教	おし	Sự giảng dạy	359	2026-06-24 06:26:14.758	2026-06-24 06:26:14.758
1938	教授	きょうじゅ	sự giáo dục, giáo dục, giảng dạy	359	2026-06-24 06:26:14.762	2026-06-24 06:26:14.762
1939	授業料	じゅぎょうりょう	Tiền học phí	359	2026-06-24 06:26:14.765	2026-06-24 06:26:14.765
1940	授	さず	cho và nhận	359	2026-06-24 06:26:14.768	2026-06-24 06:26:14.768
1941	弟子	でし	Học trò, học sinh	360	2026-06-24 06:26:14.772	2026-06-24 06:26:14.772
1942	徒歩	とほ	Tín đồ Hồi giáo	360	2026-06-24 06:26:14.774	2026-06-24 06:26:14.774
1943	教徒	きょうと	tín đồ đạo giáo	360	2026-06-24 06:26:14.777	2026-06-24 06:26:14.777
1944	東洋	とうよう	tập luyện	361	2026-06-24 06:26:14.782	2026-06-24 06:26:14.782
1945	訓練	くんれん	huấn luyện	361	2026-06-24 06:26:14.784	2026-06-24 06:26:14.784
1946	練	ね	sự khảo nghiệm, rèn giũa, sự thử thách	361	2026-06-24 06:26:14.786	2026-06-24 06:26:14.786
1947	洗練	せんれん	Vẻ lịch sự; tao nhã; tinh tế	361	2026-06-24 06:26:14.788	2026-06-24 06:26:14.788
1948	未練	みれん	sự tiếc nuối, sự quyến luyến, sự lưu luyến	361	2026-06-24 06:26:14.789	2026-06-24 06:26:14.789
1949	人	ひと	Xem lại bài, ôn bài	362	2026-06-24 06:26:14.795	2026-06-24 06:26:14.795
1950	回復	かいふく	Khôi phục, hồi phục	362	2026-06-24 06:26:14.798	2026-06-24 06:26:14.798
1951	往復	おうふく	Vé khứ hồi	362	2026-06-24 06:26:14.801	2026-06-24 06:26:14.801
1952	復旧	ふっきゅう	Trùng tu, phục chế	362	2026-06-24 06:26:14.803	2026-06-24 06:26:14.803
1953	復興	ふっこう	sự phục hưng	362	2026-06-24 06:26:14.805	2026-06-24 06:26:14.805
1954	復活	ふっかつ	sự sống lại, phục hồi, phục hưng,  tái sinh	362	2026-06-24 06:26:14.807	2026-06-24 06:26:14.807
1955	反復	はんぷく	sự nhắc lại	362	2026-06-24 06:26:14.81	2026-06-24 06:26:14.81
1956	木	き	Bề ngoài, phía trước, biểu đồ	363	2026-06-24 06:26:14.816	2026-06-24 06:26:14.816
1957	表	ひょう	Bề ngoài, phía trước, biểu đồ	363	2026-06-24 06:26:14.818	2026-06-24 06:26:14.818
1958	発表	はっぴょう	Phát biểu	363	2026-06-24 06:26:14.821	2026-06-24 06:26:14.821
1959	表	あらわ	bìa	363	2026-06-24 06:26:14.824	2026-06-24 06:26:14.824
1960	代表	だいひょう	đại diện, địa biểu	363	2026-06-24 06:26:14.826	2026-06-24 06:26:14.826
1961	表情	ひょうじょう	Tình hình, biểu lộ tình cảm, bề ngoài	363	2026-06-24 06:26:14.83	2026-06-24 06:26:14.83
1962	住人	じゅうにん	sự tốt nghiệp	364	2026-06-24 06:26:14.834	2026-06-24 06:26:14.834
1963	卒業式	そつぎょうしき	lễ tốt nghiệp	364	2026-06-24 06:26:14.836	2026-06-24 06:26:14.836
1964	卒業生	そつぎょうせい	Sinh viên, học sinh tốt nghiệp	364	2026-06-24 06:26:14.839	2026-06-24 06:26:14.839
1965	大卒	だいそつ	Tốt nghiệp đại học	364	2026-06-24 06:26:14.841	2026-06-24 06:26:14.841
1966	卒論	そつろん	luận án tốt nghiệp	364	2026-06-24 06:26:14.843	2026-06-24 06:26:14.843
1967	新卒	しんそつ	Mới ra trường, mới tốt nghiệp	364	2026-06-24 06:26:14.846	2026-06-24 06:26:14.846
1968	道	みち	vi phạm	365	2026-06-24 06:26:14.851	2026-06-24 06:26:14.851
1969	勘違	かんちが	sự khác nhau	365	2026-06-24 06:26:14.853	2026-06-24 06:26:14.853
1970	私	わたし	Cơ quan hành chính thành phố	366	2026-06-24 06:26:14.857	2026-06-24 06:26:14.857
1971	役目	やくめ	trách nhiệm, công việc, nhiệm vụ	366	2026-06-24 06:26:14.859	2026-06-24 06:26:14.859
1972	役者	やくしゃ	diễn viên	366	2026-06-24 06:26:14.863	2026-06-24 06:26:14.863
1973	役	やく	vai diễn, nhiệm vụ	366	2026-06-24 06:26:14.865	2026-06-24 06:26:14.865
1974	主役	しゅやく	nhân vật chính, vai chính	366	2026-06-24 06:26:14.867	2026-06-24 06:26:14.867
1975	兵役	へいえき	binh dịch, quân dịch, việc bắt đi lính, việc bắt nhập ngũ	366	2026-06-24 06:26:14.869	2026-06-24 06:26:14.869
1976	白	しろ	So sánh	367	2026-06-24 06:26:14.874	2026-06-24 06:26:14.874
1977	比較的	ひかくてき	Có tính so sánh; mang tính so sánh, tương đối	367	2026-06-24 06:26:14.876	2026-06-24 06:26:14.876
1978	対比	たいひ	sự so sánh	367	2026-06-24 06:26:14.88	2026-06-24 06:26:14.88
1979	比例	ひれい	Tỷ lệ	367	2026-06-24 06:26:14.882	2026-06-24 06:26:14.882
1980	皆	みな	mọi người	367	2026-06-24 06:26:14.884	2026-06-24 06:26:14.884
1981	解禁	かいきん	sự hủy bỏ lệnh cấm	367	2026-06-24 06:26:14.886	2026-06-24 06:26:14.886
1982	皆目	かいもく	hoàn toàn	367	2026-06-24 06:26:14.889	2026-06-24 06:26:14.889
1983	皆無	かいむ	không có gì, con số không, vô nghĩa, không hề	367	2026-06-24 06:26:14.89	2026-06-24 06:26:14.89
1984	彼	かれ	Anh ta	368	2026-06-24 06:26:14.895	2026-06-24 06:26:14.895
1985	彼	かれ	Cô ấy, bạn gái	368	2026-06-24 06:26:14.898	2026-06-24 06:26:14.898
1986	彼氏	かれし	Bạn trai, người yêu	368	2026-06-24 06:26:14.9	2026-06-24 06:26:14.9
1987	彼岸	ひがん	Bên kia bờ, cõi bồng lai	368	2026-06-24 06:26:14.901	2026-06-24 06:26:14.901
1988	王様	おうさま	toàn bộ	369	2026-06-24 06:26:14.907	2026-06-24 06:26:14.907
1989	安全	あんぜん	an toàn	369	2026-06-24 06:26:14.908	2026-06-24 06:26:14.908
1990	全国	ぜんこく	toàn quốc, khắp nước	369	2026-06-24 06:26:14.911	2026-06-24 06:26:14.911
1991	全員	ぜんいん	tất cả mọi người	369	2026-06-24 06:26:14.914	2026-06-24 06:26:14.914
1992	全	まった	toàn lực	369	2026-06-24 06:26:14.916	2026-06-24 06:26:14.916
1993	停	てい	toàn bộ	370	2026-06-24 06:26:14.919	2026-06-24 06:26:14.919
1994	部屋	へや	căn phòng	370	2026-06-24 06:26:14.921	2026-06-24 06:26:14.921
1995	部長	ぶちょう	trưởng phòng	370	2026-06-24 06:26:14.923	2026-06-24 06:26:14.923
1996	一部	いちぶ	một bộ phận	370	2026-06-24 06:26:14.925	2026-06-24 06:26:14.925
1997	部	ぶ	Câu lạc bộ quần vợt	370	2026-06-24 06:26:14.927	2026-06-24 06:26:14.927
1998	工学部	こうがくぶ	khoa kỹ thuật công nghiệp	370	2026-06-24 06:26:14.93	2026-06-24 06:26:14.93
1999	大部分	だいぶぶん	đại bộ phận, phần lớn	370	2026-06-24 06:26:14.933	2026-06-24 06:26:14.933
2000	必	かなら	sự quyết tâm	371	2026-06-24 06:26:14.939	2026-06-24 06:26:14.939
2001	必修	ひっしゅう	sự cần phải học, cái cần phải sửa	371	2026-06-24 06:26:14.941	2026-06-24 06:26:14.941
2002	必需品	ひつじゅひん	Mặt hàng nhu yếu; nhu yếu phẩm	371	2026-06-24 06:26:14.946	2026-06-24 06:26:14.946
2003	女	おんな	yêu cầu, đòi hỏi	372	2026-06-24 06:26:14.952	2026-06-24 06:26:14.952
2004	要約	ようやく	sự tóm lược, sự khái quát	372	2026-06-24 06:26:14.955	2026-06-24 06:26:14.955
2005	荷物	にもつ	hành lý	373	2026-06-24 06:26:14.963	2026-06-24 06:26:14.963
2006	荷造	にづく	nhập hàng	373	2026-06-24 06:26:14.967	2026-06-24 06:26:14.967
2007	出荷	しゅっか	xuất hàng	373	2026-06-24 06:26:14.97	2026-06-24 06:26:14.97
2008	箱	はこ	tự do	374	2026-06-24 06:26:14.976	2026-06-24 06:26:14.976
2009	理由	りゆう	lý do	374	2026-06-24 06:26:14.981	2026-06-24 06:26:14.981
2010	経由	けいゆ	Quá cảnh Paris	374	2026-06-24 06:26:14.985	2026-06-24 06:26:14.985
2011	不自由	ふじゆう	nòi giống, nguồn	374	2026-06-24 06:26:14.988	2026-06-24 06:26:14.988
2012	我	わ	Đơn xin nghỉ, đơn xin phép	375	2026-06-24 06:26:14.996	2026-06-24 06:26:14.996
2013	稲	いね	lợi ích, lợi nhuận	376	2026-06-24 06:26:15.003	2026-06-24 06:26:15.003
2014	利口	りこう	quyền lợi	376	2026-06-24 06:26:15.006	2026-06-24 06:26:15.006
2015	利子	りし	tiền lời, lợi tức, lãi (ngân hàng)	376	2026-06-24 06:26:15.01	2026-06-24 06:26:15.01
2016	何曜日	なんようび	đồ giặt	378	2026-06-24 06:26:15.024	2026-06-24 06:26:15.024
2017	洗濯機	せんたくき	máy giặt	378	2026-06-24 06:26:15.027	2026-06-24 06:26:15.027
2018	二人	ふたり	giấc ngủ trưa	379	2026-06-24 06:26:15.036	2026-06-24 06:26:15.036
2019	寝坊	ねぼう	ngủ quên	379	2026-06-24 06:26:15.04	2026-06-24 06:26:15.04
2020	寝室	しんしつ	phòng ngủ	379	2026-06-24 06:26:15.045	2026-06-24 06:26:15.045
2021	寝台車	しんだいしゃ	xe giường nằm	379	2026-06-24 06:26:15.049	2026-06-24 06:26:15.049
2022	寝言	ねごと	ngủ mớ, nói mớ	379	2026-06-24 06:26:15.053	2026-06-24 06:26:15.053
2023	足	あし	múa truyền thống nhật bản	380	2026-06-24 06:26:15.061	2026-06-24 06:26:15.061
2024	水	みず	sinh hoạt, đời sống	381	2026-06-24 06:26:15.071	2026-06-24 06:26:15.071
2025	活動	かつどう	hoạt động	381	2026-06-24 06:26:15.074	2026-06-24 06:26:15.074
2026	活字	かつじ	chữ in	381	2026-06-24 06:26:15.079	2026-06-24 06:26:15.079
2027	活気	かっき	xôn xao, hoạt náo, sôi nổi	381	2026-06-24 06:26:15.084	2026-06-24 06:26:15.084
2028	活躍	かつやく	hoạt sụng, sử dụng, tận dụng	381	2026-06-24 06:26:15.088	2026-06-24 06:26:15.088
2029	活発	かっぱつ	thói quen ăn uống	381	2026-06-24 06:26:15.091	2026-06-24 06:26:15.091
2030	木	き	Cuối tuần	382	2026-06-24 06:26:15.099	2026-06-24 06:26:15.099
2031	月末	げつまつ	cuối tháng	382	2026-06-24 06:26:15.102	2026-06-24 06:26:15.102
2032	年末	ねんまつ	cuối năm	382	2026-06-24 06:26:15.105	2026-06-24 06:26:15.105
2033	末	すえ	Cuối, đỉnh, chót	382	2026-06-24 06:26:15.107	2026-06-24 06:26:15.107
2034	末	すえ	con út	382	2026-06-24 06:26:15.109	2026-06-24 06:26:15.109
2035	期末	きまつ	Kì thi cuối kì	382	2026-06-24 06:26:15.113	2026-06-24 06:26:15.113
2036	家	いえ	Nhà	383	2026-06-24 06:26:15.118	2026-06-24 06:26:15.118
2037	帰宅	きたく	Việc về nhà	383	2026-06-24 06:26:15.12	2026-06-24 06:26:15.12
2038	自宅	じたく	Nhà mình	383	2026-06-24 06:26:15.123	2026-06-24 06:26:15.123
2039	住宅	じゅうたく	nhà ở, nơi sống	383	2026-06-24 06:26:15.125	2026-06-24 06:26:15.125
2040	宅配便	たくはいびん	Chuyển phát tận nhà	383	2026-06-24 06:26:15.129	2026-06-24 06:26:15.129
2041	社宅	しゃたく	cư xá của công ty	383	2026-06-24 06:26:15.133	2026-06-24 06:26:15.133
2042	祭	まつ	lễ hội	384	2026-06-24 06:26:15.14	2026-06-24 06:26:15.14
2043	学園祭	がくえんさい	ngày hội ở trường	384	2026-06-24 06:26:15.143	2026-06-24 06:26:15.143
2044	今	いま	ngày thường	385	2026-06-24 06:26:15.156	2026-06-24 06:26:15.156
2045	平	たい	hòa bình	385	2026-06-24 06:26:15.16	2026-06-24 06:26:15.16
2046	平成	へいせい	thời kỳ Bình Thành	385	2026-06-24 06:26:15.165	2026-06-24 06:26:15.165
2047	平均	へいきん	bình quân, trung bình	385	2026-06-24 06:26:15.168	2026-06-24 06:26:15.168
2048	公平	こうへい	công bằng	385	2026-06-24 06:26:15.171	2026-06-24 06:26:15.171
2049	平等	びょうどう	bình đẳng	385	2026-06-24 06:26:15.175	2026-06-24 06:26:15.175
2050	和食	わしょく	hòa bình	386	2026-06-24 06:26:15.185	2026-06-24 06:26:15.185
2051	和食	わしょく	món ăn Nhật	386	2026-06-24 06:26:15.189	2026-06-24 06:26:15.189
2052	和	わ	hòa bình, tính cộng, tổng cộng	386	2026-06-24 06:26:15.193	2026-06-24 06:26:15.193
2053	英和	えいわ	Từ điển Anh - Nhật	386	2026-06-24 06:26:15.198	2026-06-24 06:26:15.198
2054	和	なご	Thời kỳ Chiêu Hoà	386	2026-06-24 06:26:15.202	2026-06-24 06:26:15.202
2055	和	やわ	Nước Cộng hòa	386	2026-06-24 06:26:15.204	2026-06-24 06:26:15.204
2056	戦争	せんそう	Chiến tranh	387	2026-06-24 06:26:15.209	2026-06-24 06:26:15.209
2057	戦	たたか	tác chiến, chiến lược	387	2026-06-24 06:26:15.211	2026-06-24 06:26:15.211
2058	冷戦	れいせん	chiến tranh lạnh	387	2026-06-24 06:26:15.213	2026-06-24 06:26:15.213
2059	反戦	はんせん	sự phản chiến	387	2026-06-24 06:26:15.215	2026-06-24 06:26:15.215
2060	挑戦	ちょうせん	thách thức, thử thách, bất chấp	387	2026-06-24 06:26:15.217	2026-06-24 06:26:15.217
2061	戦	いくさ	Trận mạc	387	2026-06-24 06:26:15.218	2026-06-24 06:26:15.218
2062	人	ひと	Chiến tranh	388	2026-06-24 06:26:15.221	2026-06-24 06:26:15.221
2063	争	あらそ	Sự tranh luận, sự bàn cãi	388	2026-06-24 06:26:15.223	2026-06-24 06:26:15.223
2064	政府	せいふ	Chính trị	389	2026-06-24 06:26:15.229	2026-06-24 06:26:15.229
2065	政治家	せいじか	Chiính trị gia	389	2026-06-24 06:26:15.232	2026-06-24 06:26:15.232
2066	政党	せいとう	chính đảng	389	2026-06-24 06:26:15.234	2026-06-24 06:26:15.234
2067	政府	せいふ	chính phủ	389	2026-06-24 06:26:15.236	2026-06-24 06:26:15.236
2068	行政	ぎょうせい	hành chính	389	2026-06-24 06:26:15.238	2026-06-24 06:26:15.238
2069	財政	ざいせい	tài chính	389	2026-06-24 06:26:15.24	2026-06-24 06:26:15.24
2070	政権	せいけん	chính quyền	389	2026-06-24 06:26:15.242	2026-06-24 06:26:15.242
2071	政策	せいさく	chính sách	389	2026-06-24 06:26:15.246	2026-06-24 06:26:15.246
2072	私	わたし	chính trị	390	2026-06-24 06:26:15.252	2026-06-24 06:26:15.252
2073	政治家	せいじか	chính trị gia	390	2026-06-24 06:26:15.254	2026-06-24 06:26:15.254
2074	治	おさ	điều trị	390	2026-06-24 06:26:15.256	2026-06-24 06:26:15.256
2075	治安	ちあん	trị an	390	2026-06-24 06:26:15.259	2026-06-24 06:26:15.259
2076	土	つち	kinh nghiệm	391	2026-06-24 06:26:15.265	2026-06-24 06:26:15.265
2077	経済	けいざい	kinh tế	391	2026-06-24 06:26:15.268	2026-06-24 06:26:15.268
2078	経由	けいゆ	quá cảnh Paris	391	2026-06-24 06:26:15.27	2026-06-24 06:26:15.27
2079	経営	けいえい	Kinh doanh	391	2026-06-24 06:26:15.272	2026-06-24 06:26:15.272
2080	神経	しんけい	thần kinh, sự nhạy cảm	391	2026-06-24 06:26:15.274	2026-06-24 06:26:15.274
2081	経歴	けいれき	Lý lịch; quá trình làm việc; quá trình kinh nghiệm	391	2026-06-24 06:26:15.276	2026-06-24 06:26:15.276
2082	経	きょう	Kinh phật	391	2026-06-24 06:26:15.28	2026-06-24 06:26:15.28
2083	看板	かんばん	Kinh tế	392	2026-06-24 06:26:15.285	2026-06-24 06:26:15.285
2084	経済学	けいざいがく	Kinh tế học	392	2026-06-24 06:26:15.287	2026-06-24 06:26:15.287
2085	済	す	cứu tế	392	2026-06-24 06:26:15.289	2026-06-24 06:26:15.289
2086	去年	きょねん	pháp luật	393	2026-06-24 06:26:15.294	2026-06-24 06:26:15.294
2087	文法	ぶんぽう	ngữ pháp	393	2026-06-24 06:26:15.297	2026-06-24 06:26:15.297
2088	方法	ほうほう	phương pháp	393	2026-06-24 06:26:15.299	2026-06-24 06:26:15.299
2089	憲法	けんぽう	hiến pháp	393	2026-06-24 06:26:15.301	2026-06-24 06:26:15.301
2090	違法	いほう	trái phép, vi phạm pháp luật	393	2026-06-24 06:26:15.303	2026-06-24 06:26:15.303
2091	用法	ようほう	cách dùng	393	2026-06-24 06:26:15.305	2026-06-24 06:26:15.305
2092	法案	ほうあん	luật dự thảo, dự luật	393	2026-06-24 06:26:15.307	2026-06-24 06:26:15.307
2093	法則	ほうそく	quy luật, định luật, phép tắt	393	2026-06-24 06:26:15.309	2026-06-24 06:26:15.309
2094	交通	こうつう	Pháp luật	394	2026-06-24 06:26:15.315	2026-06-24 06:26:15.315
2095	規律	きりつ	quy luật, kỉ luật	394	2026-06-24 06:26:15.318	2026-06-24 06:26:15.318
2096	戒律	かいりつ	giới luật, điều dạy bảo, lời răn đe	394	2026-06-24 06:26:15.32	2026-06-24 06:26:15.32
2097	一律	いちりつ	Thần kinh tự trị	394	2026-06-24 06:26:15.322	2026-06-24 06:26:15.322
2098	祭	まつ	quốc tế	395	2026-06-24 06:26:15.327	2026-06-24 06:26:15.327
2099	国際化	こくさいか	quốc tế hóa	395	2026-06-24 06:26:15.331	2026-06-24 06:26:15.331
2100	際	さい	khi ～	395	2026-06-24 06:26:15.333	2026-06-24 06:26:15.333
2101	交際	こうさい	Mối quan hệ;mối giao tiếp ; giao du	395	2026-06-24 06:26:15.336	2026-06-24 06:26:15.336
2102	実際	じっさい	Thực tế	395	2026-06-24 06:26:15.338	2026-06-24 06:26:15.338
2103	際立	きわだ	Ngay trước khi; lúc sắp sửa	395	2026-06-24 06:26:15.341	2026-06-24 06:26:15.341
2104	関係	かんけい	Mối quan hệ	396	2026-06-24 06:26:15.348	2026-06-24 06:26:15.348
2105	国際	こくさい	Quan hệ quốc tế	396	2026-06-24 06:26:15.351	2026-06-24 06:26:15.351
2106	感心	かんしん	Khâm phục; thán phục; cảm phục; hâm mộ; ngưỡng mộ	396	2026-06-24 06:26:15.354	2026-06-24 06:26:15.354
2107	関東	かんとう	vùng kanto	396	2026-06-24 06:26:15.356	2026-06-24 06:26:15.356
2108	関西	かんさい	vùng kansai	396	2026-06-24 06:26:15.359	2026-06-24 06:26:15.359
2109	関取	せきとり	Đô vật su mô	396	2026-06-24 06:26:15.362	2026-06-24 06:26:15.362
2110	玄関	げんかん	sảnh trong nhà, bậc thềm đi vào nhà	396	2026-06-24 06:26:15.365	2026-06-24 06:26:15.365
2111	税関	ぜいかん	thuế quan	396	2026-06-24 06:26:15.367	2026-06-24 06:26:15.367
2112	人々	ひとびと	mối quan hệ	397	2026-06-24 06:26:15.371	2026-06-24 06:26:15.371
2113	国際	こくさい	Quan hệ quốc tế	397	2026-06-24 06:26:15.373	2026-06-24 06:26:15.373
2114	係	かかり	Sự chịu trách nhiệm	397	2026-06-24 06:26:15.374	2026-06-24 06:26:15.374
2115	係員	かかりいん	người chịu trách nhiệm	397	2026-06-24 06:26:15.376	2026-06-24 06:26:15.376
2116	人間	にんげん	Mối quan hệ giữa người với người	397	2026-06-24 06:26:15.38	2026-06-24 06:26:15.38
2117	無関係	むかんけい	không liên quan	397	2026-06-24 06:26:15.382	2026-06-24 06:26:15.382
2118	羊	ひつじ	chủ nghĩa	398	2026-06-24 06:26:15.386	2026-06-24 06:26:15.386
2119	民主	みんしゅ	chủ nghĩa dân chủ	398	2026-06-24 06:26:15.388	2026-06-24 06:26:15.388
2120	社会	しゃかい	chủ nghĩa xã hội	398	2026-06-24 06:26:15.39	2026-06-24 06:26:15.39
2121	講義	こうぎ	Bài giảng; giờ học	398	2026-06-24 06:26:15.392	2026-06-24 06:26:15.392
2122	義務	ぎむ	nghĩa vụ, phận sự	398	2026-06-24 06:26:15.395	2026-06-24 06:26:15.395
2123	義理	ぎり	tình nghĩa, đạo lí, quan hệ thân thuộc không phải trực hệ, họ đằng nhà chồng hoặc vợ	398	2026-06-24 06:26:15.397	2026-06-24 06:26:15.397
2124	正義	せいぎ	Chính nghĩa	398	2026-06-24 06:26:15.4	2026-06-24 06:26:15.4
2125	定義	ていぎ	định nghĩa	398	2026-06-24 06:26:15.401	2026-06-24 06:26:15.401
2126	正	ただ	hội nghị	399	2026-06-24 06:26:15.405	2026-06-24 06:26:15.405
2127	国会	こっかい	nghị viên quốc hội	399	2026-06-24 06:26:15.407	2026-06-24 06:26:15.407
2128	不思議	ふしぎ	họp quốc hội; họp nghị viện; hội nghị	399	2026-06-24 06:26:15.409	2026-06-24 06:26:15.409
2129	議論	ぎろん	đề án hội nghị, vấn đề thảo luận	399	2026-06-24 06:26:15.413	2026-06-24 06:26:15.413
2130	兄	あに	chính đảng	400	2026-06-24 06:26:15.417	2026-06-24 06:26:15.417
2131	与党	よとう	Đảng cầm quyền	400	2026-06-24 06:26:15.419	2026-06-24 06:26:15.419
2132	野党	やとう	Đảng chống đối	400	2026-06-24 06:26:15.421	2026-06-24 06:26:15.421
2133	党首	とうしゅ	chủ tịch đảng	400	2026-06-24 06:26:15.423	2026-06-24 06:26:15.423
2134	旗	はた	khu vui chơi	401	2026-06-24 06:26:15.43	2026-06-24 06:26:15.43
2135	周遊	しゅうゆう	cuộc đi du lịch, cuộc chu du	401	2026-06-24 06:26:15.432	2026-06-24 06:26:15.432
2136	水	みず	việc bơi lội	402	2026-06-24 06:26:15.437	2026-06-24 06:26:15.437
2137	平泳	ひらおよ	cuộc thi bơi	402	2026-06-24 06:26:15.439	2026-06-24 06:26:15.439
2138	彼	かれ	Sự mệt mỏi; sự mỏi; sự mệt nhoc	403	2026-06-24 06:26:15.443	2026-06-24 06:26:15.443
2139	友達	ともだち	hệ thống lò sưởi	404	2026-06-24 06:26:15.449	2026-06-24 06:26:15.449
2140	温暖	おんだん	mùa đông ấm áp	404	2026-06-24 06:26:15.452	2026-06-24 06:26:15.452
2141	雨	あめ	nước ngọt, thức uống không chứa cồn	405	2026-06-24 06:26:15.456	2026-06-24 06:26:15.456
2142	争	あらそ	nghỉ ngơi tĩnh dưỡng	406	2026-06-24 06:26:15.46	2026-06-24 06:26:15.46
2143	静養	せいよう	tĩnh mạch	406	2026-06-24 06:26:15.463	2026-06-24 06:26:15.463
2144	公衆	こうしゅう	công viên	407	2026-06-24 06:26:15.467	2026-06-24 06:26:15.467
2145	公平	こうへい	công bằng	407	2026-06-24 06:26:15.469	2026-06-24 06:26:15.469
2146	公務員	こうむいん	công chức nhà nước	407	2026-06-24 06:26:15.47	2026-06-24 06:26:15.47
2147	公衆	こうしゅう	Công chúng; dân chúng; cộng đồng	407	2026-06-24 06:26:15.472	2026-06-24 06:26:15.472
2148	公立	こうりつ	công lập	407	2026-06-24 06:26:15.474	2026-06-24 06:26:15.474
2149	公	おおやけ	sự công khai công bố	407	2026-06-24 06:26:15.475	2026-06-24 06:26:15.475
2150	土曜日	どようび	công viên	408	2026-06-24 06:26:15.482	2026-06-24 06:26:15.482
2151	動物園	どうぶつえん	sở thú	408	2026-06-24 06:26:15.483	2026-06-24 06:26:15.483
2152	遊園地	ゆうえんち	khu vui chơi	408	2026-06-24 06:26:15.485	2026-06-24 06:26:15.485
2153	幼稚園	ようちえん	nhà trẻ	408	2026-06-24 06:26:15.487	2026-06-24 06:26:15.487
2154	園芸	えんげい	Nghệ thuật cây cảnh; nghệ thuật làm vườn	408	2026-06-24 06:26:15.489	2026-06-24 06:26:15.489
2155	庭園	ていえん	Vườn	408	2026-06-24 06:26:15.49	2026-06-24 06:26:15.49
2156	園	その	Vườn Eden	408	2026-06-24 06:26:15.492	2026-06-24 06:26:15.492
2157	目的	もくてき	sự liên tục, sự liền tiếp	410	2026-06-24 06:26:15.501	2026-06-24 06:26:15.501
2158	連絡	れんらく	sự liên quan, sự liên hệ	410	2026-06-24 06:26:15.503	2026-06-24 06:26:15.503
2159	連休	れんきゅう	kì nghỉ dài ngày	410	2026-06-24 06:26:15.504	2026-06-24 06:26:15.504
2160	連	つら	Liên hợp quốc	410	2026-06-24 06:26:15.507	2026-06-24 06:26:15.507
2161	国連	こくれん	Liên hợp quốc	410	2026-06-24 06:26:15.509	2026-06-24 06:26:15.509
2162	心	こころ	cửa sổ	411	2026-06-24 06:26:15.515	2026-06-24 06:26:15.515
2163	窓口	まどぐち	cửa bán vé	411	2026-06-24 06:26:15.517	2026-06-24 06:26:15.517
2164	同窓会	どうそうかい	Hội học sinh cùng trường; hội cùng lớp	411	2026-06-24 06:26:15.519	2026-06-24 06:26:15.519
2165	窓	まど	chỗ ngồi phía cửa sửa	411	2026-06-24 06:26:15.521	2026-06-24 06:26:15.521
2166	金	かね	bên phải	412	2026-06-24 06:26:15.526	2026-06-24 06:26:15.526
2167	両側	りょうがわ	hai bên	412	2026-06-24 06:26:15.529	2026-06-24 06:26:15.529
2168	向	む	Phía bên kia; mặt bên kia	412	2026-06-24 06:26:15.532	2026-06-24 06:26:15.532
2169	側面	そくめん	Mặt bên; một bên; một mặt; hông; sườn	412	2026-06-24 06:26:15.534	2026-06-24 06:26:15.534
2170	反対	はんたい	Phía bên kia	412	2026-06-24 06:26:15.536	2026-06-24 06:26:15.536
2171	外側	そとがわ	mặti, phía ngoài ,bề ngoài	412	2026-06-24 06:26:15.538	2026-06-24 06:26:15.538
2172	内側	うちがわ	phía trong ,bên trong, ở trong, nội bộ	412	2026-06-24 06:26:15.541	2026-06-24 06:26:15.541
2173	世界	せかい	lá	413	2026-06-24 06:26:15.548	2026-06-24 06:26:15.548
2174	言葉	ことば	từ ngữ, ngôn ngữ	413	2026-06-24 06:26:15.549	2026-06-24 06:26:15.549
2175	葉書	はがき	bưu thiếp	413	2026-06-24 06:26:15.551	2026-06-24 06:26:15.551
2176	紅葉	こうよう	cây lá đỏ	413	2026-06-24 06:26:15.552	2026-06-24 06:26:15.552
2177	紅葉	もみじ	cây lá đỏ	413	2026-06-24 06:26:15.553	2026-06-24 06:26:15.553
2178	落	お	lá rụng	413	2026-06-24 06:26:15.555	2026-06-24 06:26:15.555
2179	天気	てんき	phong cảnh	414	2026-06-24 06:26:15.558	2026-06-24 06:26:15.558
2180	景気	けいき	tình hình, tình hình kinh tế	414	2026-06-24 06:26:15.56	2026-06-24 06:26:15.56
2181	不景気	ふけいき	Khó khăn (kinh doanh); không chạy (buôn bán); ế ẩm	414	2026-06-24 06:26:15.564	2026-06-24 06:26:15.564
2182	風景	ふうけい	phong cảnh	414	2026-06-24 06:26:15.566	2026-06-24 06:26:15.566
2183	夜景	やけい	cảnh ,  quang cảnh ban đêm	414	2026-06-24 06:26:15.568	2026-06-24 06:26:15.568
2184	背景	はいけい	bối cảnh, phong làm cảnh, phong nền	414	2026-06-24 06:26:15.57	2026-06-24 06:26:15.57
2185	光景	こうけい	quang cảnh	414	2026-06-24 06:26:15.572	2026-06-24 06:26:15.572
2186	景品	けいひん	phần thưởng	414	2026-06-24 06:26:15.574	2026-06-24 06:26:15.574
2187	言	い	nhật ký	415	2026-06-24 06:26:15.58	2026-06-24 06:26:15.58
2188	暗記	あんき	ký sự, tin tức báo chí, bài báo	415	2026-06-24 06:26:15.582	2026-06-24 06:26:15.582
2189	記者	きしゃ	ký giả	415	2026-06-24 06:26:15.584	2026-06-24 06:26:15.584
2190	記入	きにゅう	kỷ niệm	415	2026-06-24 06:26:15.586	2026-06-24 06:26:15.586
2191	記録	きろく	sự ghi chép lại	415	2026-06-24 06:26:15.588	2026-06-24 06:26:15.588
2192	何	なに	hình dáng, kiểu	416	2026-06-24 06:26:15.593	2026-06-24 06:26:15.593
2193	人形	にんぎょう	búp bê	416	2026-06-24 06:26:15.596	2026-06-24 06:26:15.596
2194	形容詞	けいようし	tính từ	416	2026-06-24 06:26:15.599	2026-06-24 06:26:15.599
2195	過去形	かこけい	thể quá khứ	416	2026-06-24 06:26:15.601	2026-06-24 06:26:15.601
2196	現在形	げんざいけい	thể hiện tại	416	2026-06-24 06:26:15.603	2026-06-24 06:26:15.603
2197	図形	ずけい	hình dáng con người, dáng vẻ, đồ họa	416	2026-06-24 06:26:15.605	2026-06-24 06:26:15.605
2198	正方形	せいほうけい	hình vuông	416	2026-06-24 06:26:15.607	2026-06-24 06:26:15.607
2199	形見	かたみ	vật kỷ niệm, đồ lưu niệm	416	2026-06-24 06:26:15.608	2026-06-24 06:26:15.608
2200	侍	さむらい	vận may, may mắn	417	2026-06-24 06:26:15.615	2026-06-24 06:26:15.615
2201	大吉	だいきち	đại cát	417	2026-06-24 06:26:15.617	2026-06-24 06:26:15.617
2202	吉日	きちじつ	ngày may mắn, ngày vui vẻ, ngày lành tháng tốt	417	2026-06-24 06:26:15.619	2026-06-24 06:26:15.619
2203	不吉	ふきつ	tin vui, tin thắng trận	417	2026-06-24 06:26:15.621	2026-06-24 06:26:15.621
2204	吉凶	きっきょう	sự hung cát,  lành dữ, điềm lành điềm dữ	417	2026-06-24 06:26:15.623	2026-06-24 06:26:15.623
2205	糸	いと	kết quả	418	2026-06-24 06:26:15.63	2026-06-24 06:26:15.63
2206	結論	けつろん	kết luận	418	2026-06-24 06:26:15.632	2026-06-24 06:26:15.632
2207	結	ゆ	kết cục	418	2026-06-24 06:26:15.635	2026-06-24 06:26:15.635
2208	団結	だんけつ	tạm được, tương đối, cũng được, khá	418	2026-06-24 06:26:15.637	2026-06-24 06:26:15.637
2209	女	おんな	ly hôn	419	2026-06-24 06:26:15.642	2026-06-24 06:26:15.642
2210	婚約	こんやく	đính hôn	419	2026-06-24 06:26:15.646	2026-06-24 06:26:15.646
2211	婚約者	こんやくしゃ	chồng chưa cưới	419	2026-06-24 06:26:15.649	2026-06-24 06:26:15.649
2212	既婚	きこん	đã có gia đình, đã kết hôn	419	2026-06-24 06:26:15.652	2026-06-24 06:26:15.652
2213	未婚	みこん	sự chưa kết hôn, sự chưa cưới	419	2026-06-24 06:26:15.655	2026-06-24 06:26:15.655
2214	新婚	しんこん	tân hôn, mới cưới	419	2026-06-24 06:26:15.658	2026-06-24 06:26:15.658
2215	共	とも	cộng đồng, thông thường, phổ thông	420	2026-06-24 06:26:15.666	2026-06-24 06:26:15.666
2216	公共	こうきょう	Công cộng	420	2026-06-24 06:26:15.669	2026-06-24 06:26:15.669
2217	共感	きょうかん	chủ nghĩa cộng sản	420	2026-06-24 06:26:15.672	2026-06-24 06:26:15.672
2218	共学	きょうがく	sự học chung	420	2026-06-24 06:26:15.674	2026-06-24 06:26:15.674
2219	共同	きょうどう	Cộng đồng; sự liên hiệp; sự liên đới	420	2026-06-24 06:26:15.679	2026-06-24 06:26:15.679
2220	一緒	いっしょ	Trẻ con, con cái	421	2026-06-24 06:26:15.685	2026-06-24 06:26:15.685
2221	供	そな	sự cung cấp, đưa ra	421	2026-06-24 06:26:15.688	2026-06-24 06:26:15.688
2222	試供品	しきょうひん	hàng mẫu, mẫu thử	421	2026-06-24 06:26:15.691	2026-06-24 06:26:15.691
2223	供	とも	lễ cúng, tưởng nhớ người đã khuất	421	2026-06-24 06:26:15.695	2026-06-24 06:26:15.695
2224	魚屋	さかなや	thân sinh	422	2026-06-24 06:26:15.703	2026-06-24 06:26:15.703
2225	両手	りょうて	hai tay	422	2026-06-24 06:26:15.707	2026-06-24 06:26:15.707
2226	両方	りょうほう	song phương, hai bên	422	2026-06-24 06:26:15.712	2026-06-24 06:26:15.712
2227	両側	りょうがわ	hai bên	422	2026-06-24 06:26:15.717	2026-06-24 06:26:15.717
2228	両替	りょうがえ	đổi tiền	422	2026-06-24 06:26:15.721	2026-06-24 06:26:15.721
2229	出	で	thanh niên, lớp trẻ, giới trẻ	423	2026-06-24 06:26:15.73	2026-06-24 06:26:15.73
2230	若々	わかわか	Người tập việc; người mới học, người chưa có kinh nghiệm	423	2026-06-24 06:26:15.734	2026-06-24 06:26:15.734
2231	老若	ろうにゃく	nam nữ mọi lứa tuổi, bất kể già trẻ trai gái	423	2026-06-24 06:26:15.737	2026-06-24 06:26:15.737
2232	杖	つえ	người già	424	2026-06-24 06:26:15.743	2026-06-24 06:26:15.743
2233	老	お	lão hóa	424	2026-06-24 06:26:15.747	2026-06-24 06:26:15.747
2234	老眼	ろうがん	mắt lão	424	2026-06-24 06:26:15.75	2026-06-24 06:26:15.75
2235	心臓	しんぞう	hơi thở	425	2026-06-24 06:26:15.756	2026-06-24 06:26:15.756
2236	息子	むすこ	con trai	425	2026-06-24 06:26:15.759	2026-06-24 06:26:15.759
2237	休息	きゅうそく	nghỉ giải lao, nghĩ ngơi	425	2026-06-24 06:26:15.763	2026-06-24 06:26:15.763
2238	息	いき	tin tức, tình hình	425	2026-06-24 06:26:15.766	2026-06-24 06:26:15.766
2239	息	いき	thở dài	425	2026-06-24 06:26:15.769	2026-06-24 06:26:15.769
2240	私	わたし	con gái	426	2026-06-24 06:26:15.775	2026-06-24 06:26:15.775
2241	一人娘	ひとりむすめ	con gái duy nhất, con gái một	426	2026-06-24 06:26:15.779	2026-06-24 06:26:15.779
2242	娘婿	むすめむこ	con nuôi	426	2026-06-24 06:26:15.783	2026-06-24 06:26:15.783
2243	米	こめ	bên trong	427	2026-06-24 06:26:15.789	2026-06-24 06:26:15.789
2244	奥	おく	răng cấm	427	2026-06-24 06:26:15.792	2026-06-24 06:26:15.792
2245	将軍	しょうぐん	tương lai	428	2026-06-24 06:26:15.801	2026-06-24 06:26:15.801
2246	将棋	しょうぎ	cờ tướng	428	2026-06-24 06:26:15.804	2026-06-24 06:26:15.804
2247	将軍	しょうぐん	tươớng quân	428	2026-06-24 06:26:15.805	2026-06-24 06:26:15.805
2248	主将	しゅしょう	đội trưởng, chủ tướng	428	2026-06-24 06:26:15.807	2026-06-24 06:26:15.807
2249	先祖	せんぞ	ông	429	2026-06-24 06:26:15.812	2026-06-24 06:26:15.812
2250	祖母	そぼ	bà	429	2026-06-24 06:26:15.814	2026-06-24 06:26:15.814
2251	祖先	そせん	tổ tiên	429	2026-06-24 06:26:15.816	2026-06-24 06:26:15.816
2252	祖国	そこく	quê cha đất mẹ, tổ quốc	429	2026-06-24 06:26:15.818	2026-06-24 06:26:15.818
2253	先祖	せんぞ	ông bà, tổ tiên	429	2026-06-24 06:26:15.819	2026-06-24 06:26:15.819
2254	祖父母	そふぼ	ông bà	429	2026-06-24 06:26:15.821	2026-06-24 06:26:15.821
2255	元祖	がんそ	tổ sư, người sáng lập, người sáng tạo ra	429	2026-06-24 06:26:15.823	2026-06-24 06:26:15.823
2256	教祖	きょうそ	giáo tổ, người lập ra một tôn giáo	429	2026-06-24 06:26:15.824	2026-06-24 06:26:15.824
2257	私	わたし	sự giáo dục	430	2026-06-24 06:26:15.83	2026-06-24 06:26:15.83
2258	育	そだ	môn thể dục, thể chất	430	2026-06-24 06:26:15.832	2026-06-24 06:26:15.832
2259	育児	いくじ	sự nuôi , chăm sóc trẻ	430	2026-06-24 06:26:15.834	2026-06-24 06:26:15.834
2260	保育	ほいく	việc nuôi dưỡng, chăm sóc	430	2026-06-24 06:26:15.836	2026-06-24 06:26:15.836
2261	生	う	nam giới	431	2026-06-24 06:26:15.84	2026-06-24 06:26:15.84
2262	女性	じょせい	nữ giới	431	2026-06-24 06:26:15.841	2026-06-24 06:26:15.841
2263	性別	せいべつ	giới tính	431	2026-06-24 06:26:15.843	2026-06-24 06:26:15.843
2264	性格	せいかく	tính cách	431	2026-06-24 06:26:15.847	2026-06-24 06:26:15.847
2265	性質	せいしつ	tính chất	431	2026-06-24 06:26:15.85	2026-06-24 06:26:15.85
2266	理性	りせい	lý trí, lý tính	431	2026-06-24 06:26:15.852	2026-06-24 06:26:15.852
2267	酸性	さんせい	tính axit	431	2026-06-24 06:26:15.855	2026-06-24 06:26:15.855
2268	相性	あいしょう	mối quan hệ thân thuộc, tính tương hợp	431	2026-06-24 06:26:15.857	2026-06-24 06:26:15.857
2269	食事	しょくじ	thiệp mời	432	2026-06-24 06:26:15.865	2026-06-24 06:26:15.865
2270	太陽	たいよう	trước hết, mới đầu, lần đầu tiên	434	2026-06-24 06:26:15.879	2026-06-24 06:26:15.879
2271	最後	さいご	cuối cùng	434	2026-06-24 06:26:15.883	2026-06-24 06:26:15.883
2272	最近	さいきん	gần đây, mới đây	434	2026-06-24 06:26:15.886	2026-06-24 06:26:15.886
2273	最高	さいこう	tuyệt nhất, tốt nhất	434	2026-06-24 06:26:15.889	2026-06-24 06:26:15.889
2274	最低	さいてい	tồi nhất	434	2026-06-24 06:26:15.892	2026-06-24 06:26:15.892
2275	最新	さいしん	cái mới nhất	434	2026-06-24 06:26:15.896	2026-06-24 06:26:15.896
2276	最	もっと	chuyến tàu điện cuối cùng	434	2026-06-24 06:26:15.899	2026-06-24 06:26:15.899
2277	着物	きもの	trước hết ,mới đầu ,lúc đầu ,lần đầu tiên ,đầu tiên	435	2026-06-24 06:26:15.904	2026-06-24 06:26:15.904
2278	初級	しょきゅう	Sơ cấp, sự dành cho người mới bắt đầu	435	2026-06-24 06:26:15.907	2026-06-24 06:26:15.907
2279	初恋	はつこい	mối tình đầu	435	2026-06-24 06:26:15.91	2026-06-24 06:26:15.91
2280	初心者	しょしんしゃ	người mới nhập môn, người mới học, người mới vào nghề	435	2026-06-24 06:26:15.914	2026-06-24 06:26:15.914
2281	初夏	しょか	đầu hè	435	2026-06-24 06:26:15.917	2026-06-24 06:26:15.917
2282	順番	じゅんばん	Thứ nhất, đầu tiên	436	2026-06-24 06:26:15.923	2026-06-24 06:26:15.923
2283	番号	ばんごう	số hiệu	436	2026-06-24 06:26:15.926	2026-06-24 06:26:15.926
2284	二番目	にばんめ	vị trí thứ 2	436	2026-06-24 06:26:15.932	2026-06-24 06:26:15.932
2285	当番	とうばん	phiên trực, lượt (làm việc)	436	2026-06-24 06:26:15.935	2026-06-24 06:26:15.935
2286	交番	こうばん	đồn cảnh sát	436	2026-06-24 06:26:15.938	2026-06-24 06:26:15.938
2287	番組	ばんぐみ	chương trình, kênh tv	436	2026-06-24 06:26:15.941	2026-06-24 06:26:15.941
2288	留守番	るすばん	tín hiệu điện thoại trả lời tự động	436	2026-06-24 06:26:15.946	2026-06-24 06:26:15.946
2289	順番	じゅんばん	thứ tự, lần lượt	436	2026-06-24 06:26:15.95	2026-06-24 06:26:15.95
2290	私	わたし	5 tuổi	437	2026-06-24 06:26:15.957	2026-06-24 06:26:15.957
2291	二十歳	はたち	20 tuổi	437	2026-06-24 06:26:15.96	2026-06-24 06:26:15.96
2292	十歳	じゅっさい	20 tuổi	437	2026-06-24 06:26:15.964	2026-06-24 06:26:15.964
2293	万歳	ばんざい	Hoan hô, chào mừng, vạn tuế	437	2026-06-24 06:26:15.968	2026-06-24 06:26:15.968
2294	歳暮	せいぼ	quà cuối năm	437	2026-06-24 06:26:15.971	2026-06-24 06:26:15.971
2295	歳月	さいげつ	tuế nguyệt, thời gian	437	2026-06-24 06:26:15.974	2026-06-24 06:26:15.974
2296	歳入	さいにゅう	thu nhập	437	2026-06-24 06:26:15.98	2026-06-24 06:26:15.98
2297	歳出	さいしゅつ	chi tiêu	437	2026-06-24 06:26:15.984	2026-06-24 06:26:15.984
2298	木	き	1 tờ, 1 tấm	438	2026-06-24 06:26:15.993	2026-06-24 06:26:15.993
2299	枚数	まいすう	số tờ,số tấm	438	2026-06-24 06:26:15.997	2026-06-24 06:26:15.997
2300	二枚目	にまいめ	tấm thứ 2, tờ thứ 2	438	2026-06-24 06:26:16.001	2026-06-24 06:26:16.001
2301	紙	かみ	1 quyển, 1 tập	439	2026-06-24 06:26:16.009	2026-06-24 06:26:16.009
2302	小冊子	しょうさっし	cuốn sách nhỏ	439	2026-06-24 06:26:16.014	2026-06-24 06:26:16.014
2303	別冊	べっさつ	tập riêng	439	2026-06-24 06:26:16.018	2026-06-24 06:26:16.018
2304	短冊	たんざく	Mảnh giấy nhỏ dài dùng để làm thơ	439	2026-06-24 06:26:16.021	2026-06-24 06:26:16.021
2305	冊数	さっすう	số quyển (sách vở)	439	2026-06-24 06:26:16.024	2026-06-24 06:26:16.024
2306	一億人	いちおくにん	1 trăm triệu	440	2026-06-24 06:26:16.033	2026-06-24 06:26:16.033
2307	十億	じゅうおく	1 tỷ	440	2026-06-24 06:26:16.036	2026-06-24 06:26:16.036
2308	億万長者	おくまんちょうじゃ	tỷ phú	440	2026-06-24 06:26:16.039	2026-06-24 06:26:16.039
2309	四	よっ	điểm	441	2026-06-24 06:26:16.048	2026-06-24 06:26:16.048
2310	弱点	じゃくてん	nhược điểm, điểm yếu	441	2026-06-24 06:26:16.052	2026-06-24 06:26:16.052
2311	交差点	こうさてん	ngã tư, bùng binh, nơi giao nhau	441	2026-06-24 06:26:16.055	2026-06-24 06:26:16.055
2312	点数	てんすう	điểm số	441	2026-06-24 06:26:16.058	2026-06-24 06:26:16.058
2313	欠点	けってん	thiếu sót, khuyết điểm	441	2026-06-24 06:26:16.062	2026-06-24 06:26:16.062
2314	百点	ひゃくてん	100 điểm	441	2026-06-24 06:26:16.066	2026-06-24 06:26:16.066
2315	句読点	くとうてん	dấu chấm câu	441	2026-06-24 06:26:16.068	2026-06-24 06:26:16.068
2316	要点	ようてん	yếu điểm, điểm trọng yếu	441	2026-06-24 06:26:16.07	2026-06-24 06:26:16.07
2317	皆	みな	tầng hai	442	2026-06-24 06:26:16.074	2026-06-24 06:26:16.074
2318	階段	かいだん	cầu thang	442	2026-06-24 06:26:16.075	2026-06-24 06:26:16.075
2319	段階	だんかい	giai đoạn	442	2026-06-24 06:26:16.076	2026-06-24 06:26:16.076
2320	階級	かいきゅう	giai cấp	442	2026-06-24 06:26:16.079	2026-06-24 06:26:16.079
2321	石	いし	cầu thang	443	2026-06-24 06:26:16.082	2026-06-24 06:26:16.082
2322	一段	いちだん	1 bậc (cầu thang)	443	2026-06-24 06:26:16.084	2026-06-24 06:26:16.084
2323	一段	いちだん	giai đoạn	443	2026-06-24 06:26:16.086	2026-06-24 06:26:16.086
2324	手段	しゅだん	phương thức, phương pháp	443	2026-06-24 06:26:16.088	2026-06-24 06:26:16.088
2325	値段	ねだん	giá cả	443	2026-06-24 06:26:16.09	2026-06-24 06:26:16.09
2326	普段	ふだん	bình thường, thông thường	443	2026-06-24 06:26:16.091	2026-06-24 06:26:16.091
2327	大	おお	số hiệu	444	2026-06-24 06:26:16.098	2026-06-24 06:26:16.098
2328	記号	きごう	kí hiệu	444	2026-06-24 06:26:16.1	2026-06-24 06:26:16.1
2329	一号車	いちごうしゃ	xe hạng nhất	444	2026-06-24 06:26:16.102	2026-06-24 06:26:16.102
2330	信号	しんごう	đèn giao thông	444	2026-06-24 06:26:16.104	2026-06-24 06:26:16.104
2331	第	だい	ấn phẩm thứ 3, số 3, lần thứ 3	444	2026-06-24 06:26:16.106	2026-06-24 06:26:16.106
2332	年号	ねんごう	năm, niên hiệu	444	2026-06-24 06:26:16.107	2026-06-24 06:26:16.107
2333	暗号	あんごう	ám hiệu, mật mã	444	2026-06-24 06:26:16.109	2026-06-24 06:26:16.109
2334	背	せ	ba lần (bội số)	445	2026-06-24 06:26:16.115	2026-06-24 06:26:16.115
2335	倍数	ばいすう	bội số	445	2026-06-24 06:26:16.117	2026-06-24 06:26:16.117
2336	倍率	ばいりつ	bội suất	445	2026-06-24 06:26:16.119	2026-06-24 06:26:16.119
2337	倍増	ばいぞう	hơn hẳn những người khác, tuyệt vời	445	2026-06-24 06:26:16.121	2026-06-24 06:26:16.121
2338	口	くち	tiếp theo, sau đây	446	2026-06-24 06:26:16.126	2026-06-24 06:26:16.126
2339	次々	つぎつぎ	lần lượt, kế tiếp	446	2026-06-24 06:26:16.13	2026-06-24 06:26:16.13
2340	目次	もくじ	mục lục	446	2026-06-24 06:26:16.133	2026-06-24 06:26:16.133
2341	次第	しだい	thứ nữ, con gái thứ	446	2026-06-24 06:26:16.136	2026-06-24 06:26:16.136
2342	次男	じなん	thứ nam, con trai thứ	446	2026-06-24 06:26:16.138	2026-06-24 06:26:16.138
2343	次回	じかい	lần sau	446	2026-06-24 06:26:16.141	2026-06-24 06:26:16.141
2344	繰	く	mọi người, người người	447	2026-06-24 06:26:16.149	2026-06-24 06:26:16.149
2345	色々	いろいろ	thỉnh thoảng	447	2026-06-24 06:26:16.152	2026-06-24 06:26:16.152
2346	少々	しょうしょう	tuần trước nữa	447	2026-06-24 06:26:16.155	2026-06-24 06:26:16.155
2347	別々	べつべつ	Ngày xửa ngày xưa	447	2026-06-24 06:26:16.158	2026-06-24 06:26:16.158
2348	他	た	cái khác	448	2026-06-24 06:26:16.167	2026-06-24 06:26:16.167
2349	他	ほか	cái khác	448	2026-06-24 06:26:16.17	2026-06-24 06:26:16.17
2350	他	た	người khác	448	2026-06-24 06:26:16.173	2026-06-24 06:26:16.173
2351	他動詞	たどうし	tha động từ	448	2026-06-24 06:26:16.176	2026-06-24 06:26:16.176
2352	勝	か	Sự thi đấu, sự chơi phân thắng bại	449	2026-06-24 06:26:16.188	2026-06-24 06:26:16.188
2353	勝手	かって	chiến thắng, giải nhất	449	2026-06-24 06:26:16.193	2026-06-24 06:26:16.193
2354	優勝	ゆうしょう	trận chung kết	449	2026-06-24 06:26:16.198	2026-06-24 06:26:16.198
2355	負	ま	Sự thi đấu, sự chơi phân thắng bại	450	2026-06-24 06:26:16.206	2026-06-24 06:26:16.206
2356	勝	か	gánh vác	450	2026-06-24 06:26:16.209	2026-06-24 06:26:16.209
2357	背負	せお	bị thương	450	2026-06-24 06:26:16.214	2026-06-24 06:26:16.214
2358	抱負	ほうふ	sự ấp ủ, ôm ấp (hoài bão)	450	2026-06-24 06:26:16.217	2026-06-24 06:26:16.217
2359	大	おお	sự tán dương, ca tụng	451	2026-06-24 06:26:16.223	2026-06-24 06:26:16.223
2360	絶賛	ぜっさん	ngưỡng mộ	451	2026-06-24 06:26:16.226	2026-06-24 06:26:16.226
2361	武器	ぶき	trưởng thành, tăng trưởng	452	2026-06-24 06:26:16.234	2026-06-24 06:26:16.234
2362	成人	せいじん	người trưởng thành	452	2026-06-24 06:26:16.237	2026-06-24 06:26:16.237
2363	成	な	thành tích	452	2026-06-24 06:26:16.24	2026-06-24 06:26:16.24
2364	完成	かんせい	hoàn thành	452	2026-06-24 06:26:16.244	2026-06-24 06:26:16.244
2365	成功	せいこう	thành công	452	2026-06-24 06:26:16.248	2026-06-24 06:26:16.248
2366	色	いろ	tuyệt chủng	453	2026-06-24 06:26:16.254	2026-06-24 06:26:16.254
2367	絶	た	tuyệt vọng	453	2026-06-24 06:26:16.256	2026-06-24 06:26:16.256
2368	私	わたし	đối tượng	454	2026-06-24 06:26:16.263	2026-06-24 06:26:16.263
2369	対	たい	một đôi, một cặp	454	2026-06-24 06:26:16.266	2026-06-24 06:26:16.266
2370	糸	いと	sự liên tục,  liền tiếp	455	2026-06-24 06:26:16.273	2026-06-24 06:26:16.273
2371	相続	そうぞく	sự kế tiếp, thừa kế	455	2026-06-24 06:26:16.276	2026-06-24 06:26:16.276
2372	続々	ぞくぞく	Sự liên tục; sự kế tiếp; việc cái này tiếp theo cái khác	455	2026-06-24 06:26:16.28	2026-06-24 06:26:16.28
2373	千語	せんご	từ điển	456	2026-06-24 06:26:16.285	2026-06-24 06:26:16.285
2374	辞	や	từ điển	456	2026-06-24 06:26:16.288	2026-06-24 06:26:16.288
2375	辞職	じしょく	nịnh hót, lời nịnh nọt	456	2026-06-24 06:26:16.292	2026-06-24 06:26:16.292
2376	辞表	じひょう	đơn từ chức	456	2026-06-24 06:26:16.296	2026-06-24 06:26:16.296
2377	手	て	Thư bạn đọc; bài cộng tác cho báo; thư gửi người biên tập	457	2026-06-24 06:26:16.302	2026-06-24 06:26:16.302
2378	投資	とうし	đầu tư	457	2026-06-24 06:26:16.306	2026-06-24 06:26:16.306
2379	投手	とうしゅ	người phát bóng (bóng chày)	457	2026-06-24 06:26:16.309	2026-06-24 06:26:16.309
2380	選	えら	tuyển thủ	458	2026-06-24 06:26:16.317	2026-06-24 06:26:16.317
2381	選択	せんたく	bầu cử, tuyển cử	458	2026-06-24 06:26:16.32	2026-06-24 06:26:16.32
2382	抽選	ちゅうせん	sự rút thăm,  xổ số	458	2026-06-24 06:26:16.322	2026-06-24 06:26:16.322
2383	当選	とうせん	quyền bầu cử	458	2026-06-24 06:26:16.324	2026-06-24 06:26:16.324
2384	適当	てきとう	lời hứa	459	2026-06-24 06:26:16.331	2026-06-24 06:26:16.331
2385	予約	よやく	Đặt chỗ, hẹn trước	459	2026-06-24 06:26:16.335	2026-06-24 06:26:16.335
2386	約	やく	ước tính khoảng 100 người	459	2026-06-24 06:26:16.337	2026-06-24 06:26:16.337
2387	婚約	こんやく	sự đính hôn, sự đính ước	459	2026-06-24 06:26:16.34	2026-06-24 06:26:16.34
2388	節約	せつやく	hợp đồng, khế ước	459	2026-06-24 06:26:16.343	2026-06-24 06:26:16.343
2389	要約	ようやく	sự tóm lược, sự khái quát	459	2026-06-24 06:26:16.348	2026-06-24 06:26:16.348
2390	彼	かれ	lời hứa	460	2026-06-24 06:26:16.354	2026-06-24 06:26:16.354
2391	花束	はなたば	bó hoa	460	2026-06-24 06:26:16.357	2026-06-24 06:26:16.357
2392	束	たば	bó, búi, cuộn	460	2026-06-24 06:26:16.361	2026-06-24 06:26:16.361
2393	束	たば	Sự kiềm chế; sự hạn chế; sự trói buộc; sự giam cầm	460	2026-06-24 06:26:16.366	2026-06-24 06:26:16.366
2394	鍵	かぎ	vắng nhà	461	2026-06-24 06:26:16.372	2026-06-24 06:26:16.372
2395	留守番電話	るすばんでんわ	chế độ điện thoại trả lời tự động	461	2026-06-24 06:26:16.379	2026-06-24 06:26:16.379
2396	守	まも	có tính bảo thủ	461	2026-06-24 06:26:16.384	2026-06-24 06:26:16.384
2397	子守歌	こもりうた	bài hát ru trẻ	461	2026-06-24 06:26:16.388	2026-06-24 06:26:16.388
2398	守	まも	nhân viên bảo vệ, cảnh vệ	461	2026-06-24 06:26:16.39	2026-06-24 06:26:16.39
2399	道	みち	quá khứ	462	2026-06-24 06:26:16.394	2026-06-24 06:26:16.394
2400	過	す	đa số, số đông	462	2026-06-24 06:26:16.397	2026-06-24 06:26:16.397
2401	夕方	ゆうがた	giấc mơ	463	2026-06-24 06:26:16.4	2026-06-24 06:26:16.4
2402	夢中	むちゅう	chìm đắm, say sưa, miệt mài	463	2026-06-24 06:26:16.401	2026-06-24 06:26:16.401
2403	悪夢	あくむ	ác mộng	463	2026-06-24 06:26:16.403	2026-06-24 06:26:16.403
2404	初夢	はつゆめ	giấc mơ đầu tiên trong năm	463	2026-06-24 06:26:16.405	2026-06-24 06:26:16.405
2405	無我夢中	むがむちゅう	say sưa việc gì đó quên cả bản thân mình	463	2026-06-24 06:26:16.406	2026-06-24 06:26:16.406
2406	白	しろ	mục đích	464	2026-06-24 06:26:16.412	2026-06-24 06:26:16.412
2407	民主的	みんしゅてき	Có tính dân chủ	464	2026-06-24 06:26:16.415	2026-06-24 06:26:16.415
2408	社会的	しゃかいてき	có tính xã hội, tập thể	464	2026-06-24 06:26:16.417	2026-06-24 06:26:16.417
2409	国際的	こくさいてき	tính quốc tế	464	2026-06-24 06:26:16.42	2026-06-24 06:26:16.42
2410	積極的	せっきょくてき	tích cực	464	2026-06-24 06:26:16.422	2026-06-24 06:26:16.422
2411	消極的	しょうきょくてき	mang tính tiêu cực	464	2026-06-24 06:26:16.423	2026-06-24 06:26:16.423
2412	比較的	ひかくてき	tương đối	464	2026-06-24 06:26:16.425	2026-06-24 06:26:16.425
2413	的	まと	mục tiêu	464	2026-06-24 06:26:16.427	2026-06-24 06:26:16.427
2414	鳥	とり	máy bay	465	2026-06-24 06:26:16.433	2026-06-24 06:26:16.433
2415	飛	と	phi trường, sân bay	465	2026-06-24 06:26:16.434	2026-06-24 06:26:16.434
2416	糸	いと	máy bay	466	2026-06-24 06:26:16.437	2026-06-24 06:26:16.437
2417	機会	きかい	cơ hội, dịp	466	2026-06-24 06:26:16.439	2026-06-24 06:26:16.439
2418	洗濯機	せんたくき	máy giặc	466	2026-06-24 06:26:16.44	2026-06-24 06:26:16.44
2419	機械	きかい	máy móc, cơ khí	466	2026-06-24 06:26:16.442	2026-06-24 06:26:16.442
2420	機能	きのう	chức năng	466	2026-06-24 06:26:16.444	2026-06-24 06:26:16.444
2421	機嫌	きげん	sắc mặt; tâm trạng; tính khí; tâm tình; tính tình	466	2026-06-24 06:26:16.448	2026-06-24 06:26:16.448
2422	機関	きかん	cơ quan	466	2026-06-24 06:26:16.45	2026-06-24 06:26:16.45
2423	機関	きかん	nguy cơ, khủng hoảng	466	2026-06-24 06:26:16.452	2026-06-24 06:26:16.452
2424	機織	はたお	Máy dệt	466	2026-06-24 06:26:16.453	2026-06-24 06:26:16.453
2425	夫	おっと	thất nghiệp	467	2026-06-24 06:26:16.456	2026-06-24 06:26:16.456
2426	失礼	しつれい	thất vọng	467	2026-06-24 06:26:16.457	2026-06-24 06:26:16.457
2427	鉄	てつ	tàu điện ngầm	468	2026-06-24 06:26:16.461	2026-06-24 06:26:16.461
2428	鉄	てつ	sắt, thép	468	2026-06-24 06:26:16.463	2026-06-24 06:26:16.463
2429	鉄道	てつどう	đường sắt	468	2026-06-24 06:26:16.465	2026-06-24 06:26:16.465
2430	私鉄	してつ	đường sắc tư nhân	468	2026-06-24 06:26:16.466	2026-06-24 06:26:16.466
2431	私	わたし	ngay lập tức, tức thì	469	2026-06-24 06:26:16.469	2026-06-24 06:26:16.469
2432	速達	そくたつ	dịch vụ chuyển phát nhanh	469	2026-06-24 06:26:16.47	2026-06-24 06:26:16.47
2433	快速	かいそく	tàu siêu tốc	469	2026-06-24 06:26:16.471	2026-06-24 06:26:16.471
2434	高速	こうそく	đường cao tốc	469	2026-06-24 06:26:16.472	2026-06-24 06:26:16.472
2435	時速	じそく	tốc độ tính theo giờ	469	2026-06-24 06:26:16.474	2026-06-24 06:26:16.474
2436	主人	しゅじん	bãi đỗ xe	471	2026-06-24 06:26:16.479	2026-06-24 06:26:16.479
2437	駐日	ちゅうにち	đại sứ thường trú tại nhật bản	471	2026-06-24 06:26:16.481	2026-06-24 06:26:16.481
2438	海辺	うみべ	3 ngày 2 đêm	472	2026-06-24 06:26:16.484	2026-06-24 06:26:16.484
2439	一泊	いっぱく	Ngủ trọ, trọ lại	472	2026-06-24 06:26:16.486	2026-06-24 06:26:16.486
2440	船	ふね	Thuyền	473	2026-06-24 06:26:16.489	2026-06-24 06:26:16.489
2441	船便	ふなびん	Gởi bằng đường tàu, lớp vỏ ngoài của tàu	473	2026-06-24 06:26:16.491	2026-06-24 06:26:16.491
2442	風船	ふうせん	khinh khí cầu	473	2026-06-24 06:26:16.493	2026-06-24 06:26:16.493
2443	造船	ぞうせん	đóng tàu	473	2026-06-24 06:26:16.497	2026-06-24 06:26:16.497
2444	客船	きゃくせん	thuyền chở khách, tàu chở khách	473	2026-06-24 06:26:16.499	2026-06-24 06:26:16.499
2445	貨物船	かもつせん	tàu chở hàng	473	2026-06-24 06:26:16.501	2026-06-24 06:26:16.501
2446	船長	せんちょう	thuyền trưởng	473	2026-06-24 06:26:16.503	2026-06-24 06:26:16.503
2447	船旅	ふなたび	chuyến đi (cuộc hành trình) bằng tàu thuyền	473	2026-06-24 06:26:16.505	2026-06-24 06:26:16.505
2448	二人	ふたり	tài khoản	474	2026-06-24 06:26:16.511	2026-06-24 06:26:16.511
2449	座席	ざせき	chỗ ngồi	474	2026-06-24 06:26:16.514	2026-06-24 06:26:16.514
2450	座布団	ざぶとん	Đệm ngồi	474	2026-06-24 06:26:16.516	2026-06-24 06:26:16.516
2451	座談会	ざだんかい	buổi tọa đàm	474	2026-06-24 06:26:16.519	2026-06-24 06:26:16.519
2452	座敷	ざしき	phòng khách	474	2026-06-24 06:26:16.521	2026-06-24 06:26:16.521
2453	店	みせ	ghế, chỗ ngồi	475	2026-06-24 06:26:16.526	2026-06-24 06:26:16.526
2454	出席	しゅっせき	tham gia, có mặt	475	2026-06-24 06:26:16.529	2026-06-24 06:26:16.529
2455	空席	くうせき	không trung, không gian	475	2026-06-24 06:26:16.532	2026-06-24 06:26:16.532
2456	欠席	けっせき	vắng mặt	475	2026-06-24 06:26:16.535	2026-06-24 06:26:16.535
2457	客席	きゃくせき	ghế của khách, ghế khán giả	475	2026-06-24 06:26:16.538	2026-06-24 06:26:16.538
2458	鳥	とり	đảo, cù lao	476	2026-06-24 06:26:16.544	2026-06-24 06:26:16.544
2459	半島	はんとう	bán đảo	476	2026-06-24 06:26:16.548	2026-06-24 06:26:16.548
2460	列島	れっとう	quần đảo	476	2026-06-24 06:26:16.551	2026-06-24 06:26:16.551
2461	島国	しまぐに	quốc đảo	476	2026-06-24 06:26:16.555	2026-06-24 06:26:16.555
2462	島民	とうみん	dân sống trên đảo	476	2026-06-24 06:26:16.559	2026-06-24 06:26:16.559
2463	無人島	むじんとう	đảo hoang	476	2026-06-24 06:26:16.563	2026-06-24 06:26:16.563
2464	停	てい	lục địa	477	2026-06-24 06:26:16.569	2026-06-24 06:26:16.569
2465	陸	りく	maặt đất, đất liền	477	2026-06-24 06:26:16.571	2026-06-24 06:26:16.571
2466	着陸	ちゃくりく	hạ cánh, đáp đất	477	2026-06-24 06:26:16.574	2026-06-24 06:26:16.574
2467	上陸	じょうりく	cập bến, đổ bộ	477	2026-06-24 06:26:16.576	2026-06-24 06:26:16.576
2468	陸軍	りくぐん	lục quân	477	2026-06-24 06:26:16.58	2026-06-24 06:26:16.58
2469	陸上	りくじょう	trên mặt đất, trên đất liền	477	2026-06-24 06:26:16.583	2026-06-24 06:26:16.583
2470	港	みなと	sân bay	478	2026-06-24 06:26:16.59	2026-06-24 06:26:16.59
2471	港	みなと	bến cảng	478	2026-06-24 06:26:16.592	2026-06-24 06:26:16.592
2472	神戸	こうべ	cảng Kobe	478	2026-06-24 06:26:16.596	2026-06-24 06:26:16.596
2473	港町	みなとまち	phố cảng	478	2026-06-24 06:26:16.598	2026-06-24 06:26:16.598
2474	木	き	cây cầu	479	2026-06-24 06:26:16.602	2026-06-24 06:26:16.602
2475	鉄橋	てっきょう	cầu có đường ray cho xe lửa	479	2026-06-24 06:26:16.604	2026-06-24 06:26:16.604
2476	歩道橋	ほどうきょう	cầu vượt, cầu cho người đi bộ	479	2026-06-24 06:26:16.606	2026-06-24 06:26:16.606
2477	橋	ばし	cầu treo	479	2026-06-24 06:26:16.608	2026-06-24 06:26:16.608
2478	父	ちち	đồn cảnh sát	480	2026-06-24 06:26:16.613	2026-06-24 06:26:16.613
2479	交差点	こうさてん	bùng binh	480	2026-06-24 06:26:16.615	2026-06-24 06:26:16.615
2480	交通	こうつう	tai nạn giao thông	480	2026-06-24 06:26:16.616	2026-06-24 06:26:16.616
2481	交換	こうかん	trao đổi	480	2026-06-24 06:26:16.618	2026-06-24 06:26:16.618
2482	外交官	がいこうかん	nhà ngoại giao	480	2026-06-24 06:26:16.619	2026-06-24 06:26:16.619
2483	雷	かみなり	đơn xin việc	481	2026-06-24 06:26:16.625	2026-06-24 06:26:16.625
2484	雷	かみなり	thần, chúa	482	2026-06-24 06:26:16.631	2026-06-24 06:26:16.631
2485	神様	かみさま	thần, thượng đế, chúa trời	482	2026-06-24 06:26:16.633	2026-06-24 06:26:16.633
2486	神社	じんじゃ	Đền thờ thần đạo	482	2026-06-24 06:26:16.635	2026-06-24 06:26:16.635
2487	神経	しんけい	thần kinh, sự nhạy cảm	482	2026-06-24 06:26:16.638	2026-06-24 06:26:16.638
2488	精神	せいしん	tâm khí, tinh thần	482	2026-06-24 06:26:16.64	2026-06-24 06:26:16.64
2489	神話	しんわ	thần thoại	482	2026-06-24 06:26:16.642	2026-06-24 06:26:16.642
2490	神道	しんとう	thần đạo	482	2026-06-24 06:26:16.644	2026-06-24 06:26:16.644
2491	神戸	こうべ	Kobe (Nhật Bản)	482	2026-06-24 06:26:16.647	2026-06-24 06:26:16.647
2492	木	き	thần, thượng đế, chúa trời	483	2026-06-24 06:26:16.651	2026-06-24 06:26:16.651
2493	田中様	たなかさま	Ông, bà, ngài tanaka	483	2026-06-24 06:26:16.653	2026-06-24 06:26:16.653
2494	様々	さまざま	thái độ, trạng thái	483	2026-06-24 06:26:16.655	2026-06-24 06:26:16.655
2495	同様	どうよう	tất cả mọi người (cách xưng hô kính trọng)	483	2026-06-24 06:26:16.657	2026-06-24 06:26:16.657
2496	客様	きゃくさま	quý khách	483	2026-06-24 06:26:16.659	2026-06-24 06:26:16.659
2497	王様	おうさま	vua	483	2026-06-24 06:26:16.662	2026-06-24 06:26:16.662
2498	模様	もよう	hoa văn, mô hình	483	2026-06-24 06:26:16.665	2026-06-24 06:26:16.665
2499	人	ひと	đèn giao thông	484	2026-06-24 06:26:16.67	2026-06-24 06:26:16.67
2500	信	しん	tự tin	484	2026-06-24 06:26:16.672	2026-06-24 06:26:16.672
2501	信用	しんよう	lòng tin, sự tin tưởng, sự tín nhiệm	484	2026-06-24 06:26:16.674	2026-06-24 06:26:16.674
2502	信頼	しんらい	tin cậy, tín nhiệm	484	2026-06-24 06:26:16.676	2026-06-24 06:26:16.676
2503	信仰	しんこう	tín ngưỡng	484	2026-06-24 06:26:16.68	2026-06-24 06:26:16.68
2504	受信	じゅしん	sự thu tín hiệu	484	2026-06-24 06:26:16.683	2026-06-24 06:26:16.683
2505	周	まわ	tình trạng	485	2026-06-24 06:26:16.688	2026-06-24 06:26:16.688
2506	調査	ちょうさ	sự điều tra, cuộc điều tra khảo sát	485	2026-06-24 06:26:16.69	2026-06-24 06:26:16.69
2507	調味料	ちょうみりょう	gia vị	485	2026-06-24 06:26:16.692	2026-06-24 06:26:16.692
2508	調節	ちょうせつ	điều tiết, chỉnh lý	485	2026-06-24 06:26:16.697	2026-06-24 06:26:16.697
2509	木	き	sự điều tra, cuộc điều tra khảo sát	486	2026-06-24 06:26:16.703	2026-06-24 06:26:16.703
2510	検査	けんさ	sự kiểm tra	486	2026-06-24 06:26:16.705	2026-06-24 06:26:16.705
2511	検査	けんさ	tuần cảnh, tuần binh, cảnh sát tuần tiễu	486	2026-06-24 06:26:16.708	2026-06-24 06:26:16.708
2512	操作	そうさ	thao tác, điều khiển	486	2026-06-24 06:26:16.712	2026-06-24 06:26:16.712
2513	審査	しんさ	thẩm xét, thẩm tra	486	2026-06-24 06:26:16.716	2026-06-24 06:26:16.716
2514	木	き	đối tượng, đối phương	487	2026-06-24 06:26:16.722	2026-06-24 06:26:16.722
2515	首相	しゅしょう	thủ tướng	487	2026-06-24 06:26:16.725	2026-06-24 06:26:16.725
2516	相当	そうとう	sự tương đương	487	2026-06-24 06:26:16.729	2026-06-24 06:26:16.729
2517	相違	そうい	sự khác nhau	487	2026-06-24 06:26:16.733	2026-06-24 06:26:16.733
2518	相続	そうぞく	sự kế tiếp, sự thừa kế	487	2026-06-24 06:26:16.735	2026-06-24 06:26:16.735
2519	相変	あいか	môn vật sumo	487	2026-06-24 06:26:16.738	2026-06-24 06:26:16.738
2520	火	ひ	đùa, nói đùa, nói giỡn	488	2026-06-24 06:26:16.745	2026-06-24 06:26:16.745
2521	階段	かいだん	cầu thang	488	2026-06-24 06:26:16.749	2026-06-24 06:26:16.749
2522	座談会	ざだんかい	buổi tọa đàm	488	2026-06-24 06:26:16.752	2026-06-24 06:26:16.752
2523	懇談会	こんだんかい	buổi họp mặt thân mật	488	2026-06-24 06:26:16.754	2026-06-24 06:26:16.754
2524	雑談	ざつだん	nói chuyện phiếm	488	2026-06-24 06:26:16.756	2026-06-24 06:26:16.756
2525	対談	たいだん	sự đối thoại, cuộc đối thoại	488	2026-06-24 06:26:16.759	2026-06-24 06:26:16.759
2526	木	き	kế hoạch	489	2026-06-24 06:26:16.765	2026-06-24 06:26:16.765
2527	案外	あんがい	bất ngờ, ngoại dự kiến	489	2026-06-24 06:26:16.767	2026-06-24 06:26:16.767
2528	答案	とうあん	phiếu trả lời	489	2026-06-24 06:26:16.77	2026-06-24 06:26:16.77
2529	提案	ていあん	sự đề nghị, lời đề nghị	489	2026-06-24 06:26:16.772	2026-06-24 06:26:16.772
2530	案	あん	Quả nhiên;  đúng như dự đoán	489	2026-06-24 06:26:16.774	2026-06-24 06:26:16.774
2531	名案	めいあん	ý kiến hay	489	2026-06-24 06:26:16.777	2026-06-24 06:26:16.777
2532	人	ひと	trong vòng 10 ngày	490	2026-06-24 06:26:16.785	2026-06-24 06:26:16.785
2533	家内	かない	vợ (mình)	490	2026-06-24 06:26:16.788	2026-06-24 06:26:16.788
2534	国内	こくない	trong nước, quốc nội	490	2026-06-24 06:26:16.791	2026-06-24 06:26:16.791
2535	内	うち	bên trong	490	2026-06-24 06:26:16.795	2026-06-24 06:26:16.795
2536	内科	ないか	nội khoa	490	2026-06-24 06:26:16.799	2026-06-24 06:26:16.799
2537	内容	ないよう	nội dung	490	2026-06-24 06:26:16.803	2026-06-24 06:26:16.803
2538	境内	けいだい	bên trong đền, chùa	490	2026-06-24 06:26:16.807	2026-06-24 06:26:16.807
2539	王様	おうさま	cậu, bạn Yamamoto	491	2026-06-24 06:26:16.813	2026-06-24 06:26:16.813
2540	君	きみ	bạn, em (đại từ nhân xưng, khi đối phương là nữ)	491	2026-06-24 06:26:16.815	2026-06-24 06:26:16.815
2541	君主	くんしゅ	vương giả, quân chủ	491	2026-06-24 06:26:16.818	2026-06-24 06:26:16.818
2542	土	つち	bạn bè, người bạn	492	2026-06-24 06:26:16.822	2026-06-24 06:26:16.822
2543	私達	わたしたち	chúng tôi	492	2026-06-24 06:26:16.823	2026-06-24 06:26:16.823
2544	速達	そくたつ	dịch vụ chuyển phát nhanh	492	2026-06-24 06:26:16.825	2026-06-24 06:26:16.825
2545	上達	じょうたつ	sự phân phát, sự đưa chuyển cho	492	2026-06-24 06:26:16.83	2026-06-24 06:26:16.83
2546	達	たっ	chuyên gia, người thành thạo	492	2026-06-24 06:26:16.832	2026-06-24 06:26:16.832
2547	星	ほし	ngôi sao	493	2026-06-24 06:26:16.838	2026-06-24 06:26:16.838
2548	衛星	えいせい	vệ tinh	493	2026-06-24 06:26:16.841	2026-06-24 06:26:16.841
2549	星座	せいざ	chòm sao	493	2026-06-24 06:26:16.845	2026-06-24 06:26:16.845
2550	星占	ほしうらな	sao Hỏa	493	2026-06-24 06:26:16.849	2026-06-24 06:26:16.849
2551	惑星	わくせい	hành tinh	493	2026-06-24 06:26:16.852	2026-06-24 06:26:16.852
2552	流	なが	sao băng	493	2026-06-24 06:26:16.855	2026-06-24 06:26:16.855
2553	明星	みょうじょう	sao mai	493	2026-06-24 06:26:16.859	2026-06-24 06:26:16.859
2554	雨	あめ	tuyết	494	2026-06-24 06:26:16.868	2026-06-24 06:26:16.868
2555	大雪	おおゆき	tuyết rơi dày	494	2026-06-24 06:26:16.871	2026-06-24 06:26:16.871
2556	雪	ゆき	tuyết mới	494	2026-06-24 06:26:16.875	2026-06-24 06:26:16.875
2557	降雪	こうせつ	việc tuyết rơi	494	2026-06-24 06:26:16.879	2026-06-24 06:26:16.879
2558	雪崩	なだれ	tuyết lở	494	2026-06-24 06:26:16.883	2026-06-24 06:26:16.883
2559	吹雪	ふぶき	bão tuyết	494	2026-06-24 06:26:16.886	2026-06-24 06:26:16.886
2560	停	てい	sau đó trở đi, từ sau đó	495	2026-06-24 06:26:16.893	2026-06-24 06:26:16.893
2561	下降	かこう	rơi xuống, tụt xuống	495	2026-06-24 06:26:16.897	2026-06-24 06:26:16.897
2562	降	お	lượng mưa	495	2026-06-24 06:26:16.901	2026-06-24 06:26:16.901
2563	壊	こわ	trực tiếp	496	2026-06-24 06:26:16.908	2026-06-24 06:26:16.908
2564	直線	ちょくせん	đường thẳng	496	2026-06-24 06:26:16.913	2026-06-24 06:26:16.913
2565	崖	がけ	mối nguy	497	2026-06-24 06:26:16.925	2026-06-24 06:26:16.925
2566	危	あや	sự nguy hại, nguy hiểm	497	2026-06-24 06:26:16.931	2026-06-24 06:26:16.931
2567	危害	きがい	nguy cơ, khủng hoảng	497	2026-06-24 06:26:16.935	2026-06-24 06:26:16.935
2568	危篤	きとく	trong tình trạng nguy kịch	497	2026-06-24 06:26:16.939	2026-06-24 06:26:16.939
2569	人	ひと	mối nguy	498	2026-06-24 06:26:16.948	2026-06-24 06:26:16.948
2570	険	けわ	núi dốc, ngọn núi hiểm trở	498	2026-06-24 06:26:16.952	2026-06-24 06:26:16.952
2571	冒険	ぼうけん	sự mạo hiểm	498	2026-06-24 06:26:16.956	2026-06-24 06:26:16.956
2572	保険	ほけん	bảo hiểm	498	2026-06-24 06:26:16.959	2026-06-24 06:26:16.959
2573	箱	ばこ	vật nhặt được, của rơi	499	2026-06-24 06:26:16.968	2026-06-24 06:26:16.968
2574	土曜日	どようび	làm tròn số	500	2026-06-24 06:26:16.976	2026-06-24 06:26:16.976
2575	取捨	しゅしゃ	sự tuyển chọn, chọn lọc	500	2026-06-24 06:26:16.981	2026-06-24 06:26:16.981
2576	彼	かれ	tiền hoàn trả, hoàn trả lại	501	2026-06-24 06:26:16.988	2026-06-24 06:26:16.988
2577	煙草	たばこ	sự hấp thụ	502	2026-06-24 06:26:16.996	2026-06-24 06:26:16.996
2578	吸	す	tàn thuốc	502	2026-06-24 06:26:17	2026-06-24 06:26:17
2579	旗	はた	sự phát thanh	503	2026-06-24 06:26:17.006	2026-06-24 06:26:17.006
2580	開放	かいほう	sự đuổi đi, trục xuất	503	2026-06-24 06:26:17.01	2026-06-24 06:26:17.01
2581	手放	てばな	năng lượng phóng xạ	503	2026-06-24 06:26:17.015	2026-06-24 06:26:17.015
2582	放火	ほうか	sự phóng hỏa, đốt nhà	503	2026-06-24 06:26:17.019	2026-06-24 06:26:17.019
2583	彼	かれ	khó khăn, vất vả	504	2026-06-24 06:26:17.028	2026-06-24 06:26:17.028
2584	変化	へんか	sự thay đổi, biến hóa	504	2026-06-24 06:26:17.033	2026-06-24 06:26:17.033
2585	変更	へんこう	sự thay đổi, biến đổi, cải biến	504	2026-06-24 06:26:17.038	2026-06-24 06:26:17.038
2586	話	はな	răng	505	2026-06-24 06:26:17.046	2026-06-24 06:26:17.046
2587	歯医者	はいしゃ	nha sĩ	505	2026-06-24 06:26:17.049	2026-06-24 06:26:17.049
2588	虫歯	むしば	răng sâu	505	2026-06-24 06:26:17.052	2026-06-24 06:26:17.052
2589	歯磨	はみが	nha khoa	505	2026-06-24 06:26:17.055	2026-06-24 06:26:17.055
2590	友達	ともだち	tóc	506	2026-06-24 06:26:17.062	2026-06-24 06:26:17.062
2591	髪	かみ	sợi tóc, sợi lông	506	2026-06-24 06:26:17.066	2026-06-24 06:26:17.066
2592	散髪	さんぱつ	việc cắt tóc	506	2026-06-24 06:26:17.069	2026-06-24 06:26:17.069
2593	洗髪	せんぱつ	việc gội đầu	506	2026-06-24 06:26:17.073	2026-06-24 06:26:17.073
2594	髪型	かみがた	kiểu tóc	506	2026-06-24 06:26:17.076	2026-06-24 06:26:17.076
2595	金髪	きんぱつ	tóc vàng, tóc vàng hoe	506	2026-06-24 06:26:17.081	2026-06-24 06:26:17.081
2596	黒髪	くろかみ	tóc đen	506	2026-06-24 06:26:17.084	2026-06-24 06:26:17.084
2597	白髪	はくはつ	tóc bạc	506	2026-06-24 06:26:17.087	2026-06-24 06:26:17.087
2598	白髪	しらが	tóc bạc	506	2026-06-24 06:26:17.09	2026-06-24 06:26:17.09
2599	会	あ	bức tranh	507	2026-06-24 06:26:17.098	2026-06-24 06:26:17.098
2600	絵本	えほん	sách truyện bằng tranh ảnh	507	2026-06-24 06:26:17.101	2026-06-24 06:26:17.101
2601	絵	え	dụng cụ để vẽ tranh, màu vẽ	507	2026-06-24 06:26:17.104	2026-06-24 06:26:17.104
2602	絵画	かいが	bức tranh, hội họa	507	2026-06-24 06:26:17.107	2026-06-24 06:26:17.107
2603	油絵	あぶらえ	tranh sơn dầu	507	2026-06-24 06:26:17.11	2026-06-24 06:26:17.11
2604	墨絵	すみえ	tranh thủy mặc	507	2026-06-24 06:26:17.114	2026-06-24 06:26:17.114
2605	浮世絵	うきよえ	tranh Ukiyoe (tranh khắc gỗ từ thời Edo)	507	2026-06-24 06:26:17.117	2026-06-24 06:26:17.117
2606	似顔絵	にがおえ	tranh chân dung	507	2026-06-24 06:26:17.12	2026-06-24 06:26:17.12
2607	子	こ	chiều ngang	508	2026-06-24 06:26:17.127	2026-06-24 06:26:17.127
2608	横切	よこぎ	cầu vượt, cầu cho người đi bộ	508	2026-06-24 06:26:17.132	2026-06-24 06:26:17.132
2609	横断	おうだん	đô vật số một nhật bản (cấp hiệu lực sĩ sumo chuyên nghiệp cao nhất)	508	2026-06-24 06:26:17.135	2026-06-24 06:26:17.135
2610	矢	や	cơm hộp	509	2026-06-24 06:26:17.142	2026-06-24 06:26:17.142
2611	適当	てきとう	sự tương thích, phù hợp	509	2026-06-24 06:26:17.146	2026-06-24 06:26:17.146
2612	当	あ	khi ấy, đương thời	509	2026-06-24 06:26:17.15	2026-06-24 06:26:17.15
2613	担当	たんとう	người phụ trách, người chịu trách nhiệm	509	2026-06-24 06:26:17.153	2026-06-24 06:26:17.153
2614	当然	とうぜん	đương nhiên, dĩ nhiên	509	2026-06-24 06:26:17.157	2026-06-24 06:26:17.157
2615	二人	ふたり	tin nhắn	510	2026-06-24 06:26:17.165	2026-06-24 06:26:17.165
2616	伝統	でんとう	truyền thống	510	2026-06-24 06:26:17.168	2026-06-24 06:26:17.168
2617	宣伝	せんでん	sự tuyên truyền, thông tin tuyên truyền, sự công khai	510	2026-06-24 06:26:17.171	2026-06-24 06:26:17.171
2618	伝染	でんせん	sự truyền nhiễm , sự lan truyền	510	2026-06-24 06:26:17.174	2026-06-24 06:26:17.174
2619	伝記	でんき	sự tích, tiểu sử	510	2026-06-24 06:26:17.177	2026-06-24 06:26:17.177
2620	遺伝子	いでんし	gen, di truyền	510	2026-06-24 06:26:17.181	2026-06-24 06:26:17.181
2621	田	た	tế bào	511	2026-06-24 06:26:17.188	2026-06-24 06:26:17.188
2622	細菌	さいきん	vi trùng, vi khuẩn	511	2026-06-24 06:26:17.191	2026-06-24 06:26:17.191
2623	心細	こころぼそ	một cách chi tiết, tường tận	511	2026-06-24 06:26:17.197	2026-06-24 06:26:17.197
2624	細工	さいく	tác phẩm, sự chế tác	511	2026-06-24 06:26:17.2	2026-06-24 06:26:17.2
2625	火事	かじ	miễn phí	512	2026-06-24 06:26:17.206	2026-06-24 06:26:17.206
2626	無	な	vô sự, không có vấn đề gì	512	2026-06-24 06:26:17.208	2026-06-24 06:26:17.208
\.


--
-- Data for Name: Lesson; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Lesson" (id, "lessonNumber", title, "createdAt", "updatedAt") FROM stdin;
1	1	Bài 1	2026-06-24 06:08:33.594	2026-06-24 16:16:32.858
2	2	Bài 2	2026-06-24 06:08:33.823	2026-06-24 16:16:33.144
3	3	Bài 3	2026-06-24 06:08:34.148	2026-06-24 16:16:33.473
4	4	Bài 4	2026-06-24 06:08:34.463	2026-06-24 16:16:33.743
5	5	Bài 5	2026-06-24 06:08:34.814	2026-06-24 16:16:34.089
6	6	Bài 6	2026-06-24 06:08:35.239	2026-06-24 16:16:34.451
7	7	Bài 7	2026-06-24 06:08:35.624	2026-06-24 16:16:34.708
8	8	Bài 8	2026-06-24 06:08:35.983	2026-06-24 16:16:34.889
9	9	Bài 9	2026-06-24 06:08:36.377	2026-06-24 16:16:35.212
10	10	Bài 10	2026-06-24 06:08:36.727	2026-06-24 16:16:35.453
11	11	Bài 11	2026-06-24 06:08:37.026	2026-06-24 16:16:35.692
12	12	Bài 12	2026-06-24 06:08:37.267	2026-06-24 16:16:35.897
13	13	Bài 13	2026-06-24 06:08:37.596	2026-06-24 16:16:36.137
14	14	Bài 14	2026-06-24 06:08:37.909	2026-06-24 16:16:36.349
15	15	Bài 15	2026-06-24 06:08:38.301	2026-06-24 16:16:36.582
16	16	Bài 16	2026-06-24 06:08:38.634	2026-06-24 16:16:36.76
17	17	Bài 17	2026-06-24 06:08:39.075	2026-06-24 16:16:36.993
18	18	Bài 18	2026-06-24 06:08:39.428	2026-06-24 16:16:37.226
19	19	Bài 19	2026-06-24 06:08:39.77	2026-06-24 16:16:37.499
20	20	Bài 20	2026-06-24 06:08:40.107	2026-06-24 16:16:37.755
21	21	Bài 21	2026-06-24 06:08:40.425	2026-06-24 16:16:37.972
22	22	Bài 22	2026-06-24 06:08:40.856	2026-06-24 16:16:38.217
23	23	Bài 23	2026-06-24 06:08:41.199	2026-06-24 16:16:38.428
24	24	Bài 24	2026-06-24 06:08:41.564	2026-06-24 16:16:38.625
25	25	Bài 25	2026-06-24 06:08:41.836	2026-06-24 16:16:38.804
26	26	Bài 26	2026-06-24 06:08:42.176	2026-06-24 16:16:38.945
27	27	Bài 27	2026-06-24 06:08:42.591	2026-06-24 16:16:39.19
28	28	Bài 28	2026-06-24 06:08:43.082	2026-06-24 16:16:39.459
29	29	Bài 29	2026-06-24 06:08:43.505	2026-06-24 16:16:39.692
30	30	Bài 30	2026-06-24 06:08:43.899	2026-06-24 16:16:39.955
31	31	Bài 31	2026-06-24 06:08:44.415	2026-06-24 16:16:40.324
32	32	Bài 32	2026-06-24 06:08:44.784	2026-06-24 16:16:40.524
33	33	Bài 33	2026-06-24 06:08:45.25	2026-06-24 16:16:40.819
34	34	Bài 34	2026-06-24 06:08:45.772	2026-06-24 16:16:41.111
35	35	Bài 35	2026-06-24 06:08:46.189	2026-06-24 16:16:41.354
36	36	Bài 36	2026-06-24 06:08:46.716	2026-06-24 16:16:41.791
37	37	Bài 37	2026-06-24 06:08:47.196	2026-06-24 16:16:42.184
38	38	Bài 38	2026-06-24 06:08:47.489	2026-06-24 16:16:42.481
39	39	Bài 39	2026-06-24 06:08:47.814	2026-06-24 16:16:42.715
40	40	Bài 40	2026-06-24 06:08:48.07	2026-06-24 16:16:42.927
41	41	Bài 41	2026-06-24 06:08:48.452	2026-06-24 16:16:43.147
42	42	Bài 42	2026-06-24 06:08:48.678	2026-06-24 16:16:43.38
43	43	Bài 43	2026-06-24 06:08:49.076	2026-06-24 16:16:43.722
44	44	Bài 44	2026-06-24 06:08:49.339	2026-06-24 16:16:44
45	45	Bài 45	2026-06-24 06:08:49.73	2026-06-24 16:16:44.203
46	46	Bài 46	2026-06-24 06:08:49.93	2026-06-24 16:16:44.542
47	47	Bài 47	2026-06-24 06:08:50.228	2026-06-24 16:16:44.837
48	48	Bài 48	2026-06-24 06:08:50.461	2026-06-24 16:16:45.034
49	49	Bài 49	2026-06-24 06:08:50.631	2026-06-24 16:16:45.286
50	50	Bài 50	2026-06-24 06:08:50.854	2026-06-24 16:16:45.716
\.


--
-- Data for Name: ListeningLog; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ListeningLog" (id, "userId", date, seconds, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ReviewLog; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ReviewLog" (id, "userId", kana, kanji, meaning, "lessonNumber", "wrongCount", "reviewStreak", mastered, "lastReviewedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."User" (id, email, "passwordHash", role, name, "createdAt", "updatedAt") FROM stdin;
1	admin@nihongo.local	$2b$10$xAfATdjckIL07P00FR5t/OLlZmGwJGUmzJneViqnMAtfoxgeGC9gO	ADMIN	Administrator	2026-06-24 07:34:49.518	2026-06-24 07:34:49.518
2	letiendungdt@gmail.com	$2b$12$eHZrXmigbNg09Hm8WMGF4.MNkpcqZgr1CuhuA9lTaewNwmejhWtSK	USER	\N	2026-06-24 08:30:35.151	2026-06-24 08:30:35.151
3	test-1782290228456@nihongo.test	$2b$12$ffYZv6BLNKs3QQzviN.2P.cSZWAXDS6BxgEGb8.DwtcHFgMLnIxKu	USER	\N	2026-06-24 08:37:09.065	2026-06-24 08:37:09.065
4	test-1782290278247@nihongo.test	$2b$12$4V3SQ6.CMdzJUhedX8H8r.TuIVVf7JJryUGs1Xw447TIDDaH8wCCS	USER	\N	2026-06-24 08:37:58.952	2026-06-24 08:37:58.952
5	test-1782290316967@nihongo.test	$2b$12$70f1H/m203EdGAqSb4KXXe2GGcjxEuHrp5P/YuTqiHX4Mq2tpp3G2	USER	\N	2026-06-24 08:38:37.593	2026-06-24 08:38:37.593
6	test-1782290337111@nihongo.test	$2b$12$0Yis/RecNge5ZBPBduXLIuo9qEaDZ68YaRDRlM4vZtFoYz8x6osM.	USER	\N	2026-06-24 08:38:57.706	2026-06-24 08:38:57.706
7	test-1782290398808@nihongo.test	$2b$12$GSdqUI3uwMu/JRUiLZ0g5.Fbi815jXA70Tmx8hxcNKz7J93XKkf2u	USER	\N	2026-06-24 08:39:59.444	2026-06-24 08:39:59.444
8	test-1782290422785@nihongo.test	$2b$12$ShpNfN6YD/kG04QeViWAF.XDTv5KEDerD8HbX9bgXDu6XbZZsQKm2	USER	\N	2026-06-24 08:40:23.41	2026-06-24 08:40:23.41
9	test-1782290564181@nihongo.test	$2b$12$yGDpe2jTxhK2fD/IVvGYwO2YsagspwDLR0.Of0MPDSzC38U.a4Q56	USER	\N	2026-06-24 08:42:44.777	2026-06-24 08:42:44.777
10	test-1782290585904@nihongo.test	$2b$12$7WUOFdJuajFpPJuQoS1UheQ4lwGmUvFWSn50R9UGXQansKiGfTXdG	USER	\N	2026-06-24 08:43:06.539	2026-06-24 08:43:06.539
\.


--
-- Data for Name: Vocabulary; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Vocabulary" (id, kanji, kana, romaji, meaning, "lessonId", "createdAt", "updatedAt") FROM stdin;
21537	私	わたし	watashi	tôi	1	2026-06-24 16:16:32.862	2026-06-24 16:16:32.862
21538	\N	あなた	anata	anh/chị, bạn	1	2026-06-24 16:16:32.865	2026-06-24 16:16:32.865
21539	あの 人（あの 方）	あの ひと（あの かた）	ano hito (ano kata)	người kia	1	2026-06-24 16:16:32.869	2026-06-24 16:16:32.869
21540	\N	～さん	~san	anh ～, chị ～	1	2026-06-24 16:16:32.871	2026-06-24 16:16:32.871
21541	\N	～ちゃん	~chan	bé ( dùng cho nữ) hoặc gọi thân mật cho trẻ con ( cả nam lẫn nữ)	1	2026-06-24 16:16:32.873	2026-06-24 16:16:32.873
21542	～人	～じん	~jin	người nước ～	1	2026-06-24 16:16:32.875	2026-06-24 16:16:32.875
21543	先生	せんせい	sensei	giáo viên (Không nói khi giới thiệu nghề nghiệp của chính mình)	1	2026-06-24 16:16:32.877	2026-06-24 16:16:32.877
21544	教師	きょうし	kyoshi	giáo viên ( dùng để nói đến nghề nghiệp)	1	2026-06-24 16:16:32.879	2026-06-24 16:16:32.879
21545	学生	がくせい	gakusei	học sinh, sinh viên	1	2026-06-24 16:16:32.881	2026-06-24 16:16:32.881
21546	会社員	かいしゃいん	kaishain	nhân viên công ty	1	2026-06-24 16:16:32.883	2026-06-24 16:16:32.883
21547	社員	しゃいん	shain	nhân viên công ty ～	1	2026-06-24 16:16:32.887	2026-06-24 16:16:32.887
21548	銀行員	ぎんこういん	ginkoin	nhân viên ngân hàng	1	2026-06-24 16:16:32.889	2026-06-24 16:16:32.889
21549	医者	いしゃ	isha	bác sĩ	1	2026-06-24 16:16:32.89	2026-06-24 16:16:32.89
21550	研究者	けんきゅうしゃ	kenkyusha	nghiên cứu sinh	1	2026-06-24 16:16:32.892	2026-06-24 16:16:32.892
21551	大学	だいがく	daigaku	trường đại học	1	2026-06-24 16:16:32.894	2026-06-24 16:16:32.894
21552	病院	びょういん	byoin	bệnh viện	1	2026-06-24 16:16:32.898	2026-06-24 16:16:32.898
21553	誰（どなた）	だれ（どなた）	dare (donata)	ai (hỏi người nào đó)	1	2026-06-24 16:16:32.902	2026-06-24 16:16:32.902
21554	－歳	－さい	-sai	tuổi (hậu tố đứng sau số)	1	2026-06-24 16:16:32.904	2026-06-24 16:16:32.904
21555	何歳	なんさい（おいくつ）	nansai (oikutsu)	mấy tuổi, bao nhiêu tuổi.	1	2026-06-24 16:16:32.906	2026-06-24 16:16:32.906
21556	\N	はい	hai	vâng	1	2026-06-24 16:16:32.907	2026-06-24 16:16:32.907
21557	\N	いいえ	iie	không	1	2026-06-24 16:16:32.909	2026-06-24 16:16:32.909
21558	初めまして。	はじめまして。	hajimemashite.	chào lần đầu gặp nhau	1	2026-06-24 16:16:32.91	2026-06-24 16:16:32.91
21559	～から 来ました。	～から きました。	~kara kimashita.	đến từ ～	1	2026-06-24 16:16:32.912	2026-06-24 16:16:32.912
21560	［どうぞ］よろしく［お願いします］。	［どうぞ］よろしく［おねがいします］。	[dozo] yoroshiku [onegaishimasu].	rất hân hạnh được làm quen	1	2026-06-24 16:16:32.914	2026-06-24 16:16:32.914
21561	失礼ですが	しつれいですが	shitsureidesuga	xin lỗi ( khi muốn nhờ ai việc gì đó)	1	2026-06-24 16:16:32.917	2026-06-24 16:16:32.917
21562	お名前は？	おなまえは？	onamaewa？	bạn tên gì?	1	2026-06-24 16:16:32.92	2026-06-24 16:16:32.92
21563	\N	こちらは ～さんです。	kochirawa ~sandesu.	đây là ngài ～	1	2026-06-24 16:16:32.922	2026-06-24 16:16:32.922
21564	\N	アメリカ	amerika	Mỹ	1	2026-06-24 16:16:32.924	2026-06-24 16:16:32.924
21565	\N	イギリス	igirisu	Anh	1	2026-06-24 16:16:32.926	2026-06-24 16:16:32.926
21566	\N	インド	indo	Ấn Độ	1	2026-06-24 16:16:32.927	2026-06-24 16:16:32.927
21567	\N	インドネシア	indoneshia	Indonesia	1	2026-06-24 16:16:32.93	2026-06-24 16:16:32.93
21568	韓国	かんこく	kankoku	Hàn quốc	1	2026-06-24 16:16:32.932	2026-06-24 16:16:32.932
21569	\N	タイ	tai	Thái Lan	1	2026-06-24 16:16:32.935	2026-06-24 16:16:32.935
21570	中国	ちゅうごく	chugoku	Trung Quốc	1	2026-06-24 16:16:32.937	2026-06-24 16:16:32.937
21571	\N	ドイツ	doitsu	Đức	1	2026-06-24 16:16:32.939	2026-06-24 16:16:32.939
21572	日本	にほん	nihon	Nhật Bản	1	2026-06-24 16:16:32.941	2026-06-24 16:16:32.941
21573	\N	ブラジル	burajiru	Brazil	1	2026-06-24 16:16:32.944	2026-06-24 16:16:32.944
21574	IMC／パワー電気／ブラジルエアー	IMC／パワーでんき／ブラジルエアー	IMC/pawadenki/burajiruea	công ty giả định (trong sách)	1	2026-06-24 16:16:32.946	2026-06-24 16:16:32.946
21575	\N	AKC	AKC	học viện giả định (trong sách)	1	2026-06-24 16:16:32.948	2026-06-24 16:16:32.948
21576	神戸病院	こうべびょういん	kobebyoin	bệnh viện giả định (trong sách)	1	2026-06-24 16:16:32.952	2026-06-24 16:16:32.952
21577	さくら大学／富士大学	さくらだいがく／ふじだいがく	sakuradaigaku/fujidaigaku	trường đại học giả định (trong sách)	1	2026-06-24 16:16:32.955	2026-06-24 16:16:32.955
21578	私たち	わたしたち	watashitachi	chúng tôi	1	2026-06-24 16:16:32.959	2026-06-24 16:16:32.959
21579	皆さん	みなさん	minasan	các bạn, các anh, các chị, mọi người	1	2026-06-24 16:16:32.964	2026-06-24 16:16:32.964
21580	～君	～くん	~kun	bé (dùng cho nam) hoặc gọi thân mật	1	2026-06-24 16:16:32.968	2026-06-24 16:16:32.968
21581	\N	エンジニア	enjinia	kỹ sư	1	2026-06-24 16:16:32.972	2026-06-24 16:16:32.972
21582	電気	でんき	denki	điện	1	2026-06-24 16:16:32.975	2026-06-24 16:16:32.975
21583	\N	フランス	furansu	Pháp	1	2026-06-24 16:16:32.978	2026-06-24 16:16:32.978
21584	此れ	これ	kore	cái này, đây( vật ở gần người nói)	2	2026-06-24 16:16:33.149	2026-06-24 16:16:33.149
21585	其れ	それ	sore	cái đó, đó( vật ở gần người nghe)	2	2026-06-24 16:16:33.154	2026-06-24 16:16:33.154
21586	彼れ	あれ	are	cái kia, kia( vật ở xa cả người nói và người nghe)	2	2026-06-24 16:16:33.157	2026-06-24 16:16:33.157
21587	\N	この ～	kono ~	~ này( gần người nói)	2	2026-06-24 16:16:33.16	2026-06-24 16:16:33.16
21588	\N	その ～	sono ~	~ đó( gần người nghe)	2	2026-06-24 16:16:33.163	2026-06-24 16:16:33.163
21589	\N	あの ～	ano ~	~ kia( xa cả người nói và người nghe)	2	2026-06-24 16:16:33.168	2026-06-24 16:16:33.168
21590	本	ほん	hon	sách	2	2026-06-24 16:16:33.172	2026-06-24 16:16:33.172
21591	辞書	じしょ	jisho	từ điển	2	2026-06-24 16:16:33.176	2026-06-24 16:16:33.176
21592	雑誌	ざっし	zasshi	tạp chí	2	2026-06-24 16:16:33.179	2026-06-24 16:16:33.179
21593	新聞	しんぶん	shinbun	báo	2	2026-06-24 16:16:33.185	2026-06-24 16:16:33.185
21594	\N	ノート	noto	tập	2	2026-06-24 16:16:33.189	2026-06-24 16:16:33.189
21595	手帳	てちょう	techo	sổ tay	2	2026-06-24 16:16:33.192	2026-06-24 16:16:33.192
21596	名刺	めいし	meishi	danh thiếp	2	2026-06-24 16:16:33.196	2026-06-24 16:16:33.196
21597	\N	カード	kado	thẻ (card)	2	2026-06-24 16:16:33.2	2026-06-24 16:16:33.2
21598	鉛筆	えんぴつ	enpitsu	pencil	2	2026-06-24 16:16:33.205	2026-06-24 16:16:33.205
21599	\N	ボールペン	borupen	ballpoint pen	2	2026-06-24 16:16:33.208	2026-06-24 16:16:33.208
21600	\N	シャープペンシル	shapupenshiru	bút chì bấm	2	2026-06-24 16:16:33.212	2026-06-24 16:16:33.212
21601	鍵	かぎ	kagi	chìa khoá	2	2026-06-24 16:16:33.215	2026-06-24 16:16:33.215
21602	時計	とけい	tokei	đồng hồ	2	2026-06-24 16:16:33.22	2026-06-24 16:16:33.22
21603	傘	かさ	kasa	cái dù	2	2026-06-24 16:16:33.223	2026-06-24 16:16:33.223
21604	鞄	かばん	kaban	cái cặp	2	2026-06-24 16:16:33.226	2026-06-24 16:16:33.226
21605	\N	CD	CD	CD, compact disc	2	2026-06-24 16:16:33.229	2026-06-24 16:16:33.229
21606	\N	テレビ	terebi	TV	2	2026-06-24 16:16:33.232	2026-06-24 16:16:33.232
21607	\N	ラジオ	rajio	cái radio	2	2026-06-24 16:16:33.237	2026-06-24 16:16:33.237
21608	\N	カメラ	kamera	cái máy chụp hình	2	2026-06-24 16:16:33.241	2026-06-24 16:16:33.241
21609	\N	コンピューター	konpyuta	máy vi tính	2	2026-06-24 16:16:33.244	2026-06-24 16:16:33.244
21610	車	くるま	kuruma	car, vehicle	2	2026-06-24 16:16:33.248	2026-06-24 16:16:33.248
21611	机	つくえ	tsukue	cái bàn	2	2026-06-24 16:16:33.253	2026-06-24 16:16:33.253
21612	椅子	いす	isu	chair	2	2026-06-24 16:16:33.258	2026-06-24 16:16:33.258
21613	\N	チョコレート	chokoreto	kẹo sôcôla	2	2026-06-24 16:16:33.261	2026-06-24 16:16:33.261
21614	\N	コーヒー	kohii	cà phê	2	2026-06-24 16:16:33.264	2026-06-24 16:16:33.264
21615	［お］土産	［お］みやげ	[o] miyage	souvenir, present	2	2026-06-24 16:16:33.27	2026-06-24 16:16:33.27
21616	英語	えいご	eigo	tiếng Anh	2	2026-06-24 16:16:33.274	2026-06-24 16:16:33.274
21617	日本語	にほんご	nihongo	tiếng Nhật	2	2026-06-24 16:16:33.277	2026-06-24 16:16:33.277
21618	～語	～ご	~go	tiếng ~	2	2026-06-24 16:16:33.279	2026-06-24 16:16:33.279
21619	何	なん	nan	cái gì	2	2026-06-24 16:16:33.281	2026-06-24 16:16:33.281
21620	\N	そう	so	thế nào	2	2026-06-24 16:16:33.287	2026-06-24 16:16:33.287
21621	\N	あのう	anou	à…..ờ ( ngập ngừng khi đề nghị hoặc suy nghĩ 1 vấn đề)	2	2026-06-24 16:16:33.29	2026-06-24 16:16:33.29
21622	\N	えっ	e'	Oh? What! (used when hearing something unexpected)	2	2026-06-24 16:16:33.293	2026-06-24 16:16:33.293
21623	\N	どうぞ。	dozo.	xin mời	2	2026-06-24 16:16:33.295	2026-06-24 16:16:33.295
21624	\N	［どうも］ありがとう［ございます］。	[domo] arigato [gozaimasu].	Thank you [very much].	2	2026-06-24 16:16:33.297	2026-06-24 16:16:33.297
21625	\N	そうですか。	sodesuka.	thế à?	2	2026-06-24 16:16:33.301	2026-06-24 16:16:33.301
21626	違います。	ちがいます。	chigaimasu.	không phải, sai rồi	2	2026-06-24 16:16:33.304	2026-06-24 16:16:33.304
21627	\N	あ	a	Oh! (used when becoming aware of something)	2	2026-06-24 16:16:33.307	2026-06-24 16:16:33.307
21628	これから お世話に なります。	これから おせわに なります。	korekara osewani narimasu.	Từ nay mong được giúp đỡ	2	2026-06-24 16:16:33.309	2026-06-24 16:16:33.309
21629	こちらこそ［どうぞ］よろしく［お願いします］。	こちらこそ［どうぞ］よろしく［おねがいします］。	kochirakoso [dozo] yoroshiku [onegaishimasu].	Chính tôi mới là người mong được giúp đỡ.	2	2026-06-24 16:16:33.312	2026-06-24 16:16:33.312
21630	\N	テレホンカード	terehonkado	thẻ (card) điện thoại	2	2026-06-24 16:16:33.316	2026-06-24 16:16:33.316
21631	\N	［カセット］テープ	[kasetto] tepu	[cassette] tape	2	2026-06-24 16:16:33.321	2026-06-24 16:16:33.321
21632	\N	テープレコーダー	tepurekoda	máy casset	2	2026-06-24 16:16:33.323	2026-06-24 16:16:33.323
21633	自動車	じどうしゃ	jidosha	xe hơi	2	2026-06-24 16:16:33.326	2026-06-24 16:16:33.326
21634	ほんの 気持ちです。	ほんの きもちです。	honno kimochidesu.	đây là chút lòng thành	2	2026-06-24 16:16:33.328	2026-06-24 16:16:33.328
21635	\N	どうも。	domo.	cám ơn	2	2026-06-24 16:16:33.331	2026-06-24 16:16:33.331
21636	此処	ここ	koko	chỗ này, đây	3	2026-06-24 16:16:33.476	2026-06-24 16:16:33.476
21637	其処	そこ	soko	chỗ đó, đó	3	2026-06-24 16:16:33.479	2026-06-24 16:16:33.479
21638	彼処	あそこ	asoko	chỗ kia, kia	3	2026-06-24 16:16:33.482	2026-06-24 16:16:33.482
21639	何処	どこ	doko	chỗ nào, đâu	3	2026-06-24 16:16:33.487	2026-06-24 16:16:33.487
21640	此方	こちら	kochira	phía này, đằng này, chỗ này, đây	3	2026-06-24 16:16:33.491	2026-06-24 16:16:33.491
21641	其方	そちら	sochira	phía đó, đằng đó, chỗ đó, đó	3	2026-06-24 16:16:33.494	2026-06-24 16:16:33.494
21642	彼方	あちら	achira	phía kia, đằng kia, chỗ kia, kia	3	2026-06-24 16:16:33.497	2026-06-24 16:16:33.497
21643	何方	どちら	dochira	phía nào, đằng nào, chỗ nào, đâu	3	2026-06-24 16:16:33.502	2026-06-24 16:16:33.502
21644	教室	きょうしつ	kyoshitsu	lớp học, phòng học	3	2026-06-24 16:16:33.505	2026-06-24 16:16:33.505
21645	食堂	しょくどう	shokudo	nhà ăn	3	2026-06-24 16:16:33.508	2026-06-24 16:16:33.508
21646	事務所	じむしょ	jimusho	văn phòng	3	2026-06-24 16:16:33.511	2026-06-24 16:16:33.511
21647	会議室	かいぎしつ	kaigishitsu	phòng họp	3	2026-06-24 16:16:33.515	2026-06-24 16:16:33.515
21648	受付	うけつけ	uketsuke	phong tiếp tân	3	2026-06-24 16:16:33.518	2026-06-24 16:16:33.518
21649	\N	ロビー	robii	hành lang, đại sảnh	3	2026-06-24 16:16:33.522	2026-06-24 16:16:33.522
21650	部屋	へや	heya	căn phòng	3	2026-06-24 16:16:33.525	2026-06-24 16:16:33.525
21651	トイレ（お手洗い）	トイレ（おてあらい）	toire (otearai)	nhà vệ sinh, phòng vệ sinh, toa-lét	3	2026-06-24 16:16:33.529	2026-06-24 16:16:33.529
21652	階段	かいだん	kaidan	cầu thang	3	2026-06-24 16:16:33.534	2026-06-24 16:16:33.534
21653	\N	エレベーター	erebeta	thang máy	3	2026-06-24 16:16:33.54	2026-06-24 16:16:33.54
21654	\N	エスカレーター	esukareta	thang cuốn	3	2026-06-24 16:16:33.544	2026-06-24 16:16:33.544
21655	自動販売機	じどうはんばいき	jidohanbaiki	vending machine	3	2026-06-24 16:16:33.547	2026-06-24 16:16:33.547
21656	電話	でんわ	denwa	máy điện thoại, điện thoại	3	2026-06-24 16:16:33.552	2026-06-24 16:16:33.552
21657	［お］国	［お］くに	[o] kuni	đất nước (của anh/chị)	3	2026-06-24 16:16:33.555	2026-06-24 16:16:33.555
21658	会社	かいしゃ	kaisha	công ty	3	2026-06-24 16:16:33.557	2026-06-24 16:16:33.557
21659	家	うち	uchi	nhà	3	2026-06-24 16:16:33.56	2026-06-24 16:16:33.56
21660	靴	くつ	kutsu	giầy	3	2026-06-24 16:16:33.562	2026-06-24 16:16:33.562
21661	\N	ネクタイ	nekutai	cà vạt	3	2026-06-24 16:16:33.564	2026-06-24 16:16:33.564
21662	\N	ワイン	wain	rượu vang	3	2026-06-24 16:16:33.569	2026-06-24 16:16:33.569
21663	売り場	うりば	uriba	quầy bán (trong một cửa hàng bách hóa)	3	2026-06-24 16:16:33.572	2026-06-24 16:16:33.572
21664	地下	ちか	chika	tầng hầm, dưới mặt đất	3	2026-06-24 16:16:33.575	2026-06-24 16:16:33.575
21665	－階	－かい（－がい）	-kai (-gai)	tầng thứ –	3	2026-06-24 16:16:33.578	2026-06-24 16:16:33.578
21666	何階	なんがい	nangai	tầng mấy	3	2026-06-24 16:16:33.582	2026-06-24 16:16:33.582
21667	－円	－えん	-en	－ yen	3	2026-06-24 16:16:33.587	2026-06-24 16:16:33.587
21668	\N	いくら	ikura	bao nhiêu tiền	3	2026-06-24 16:16:33.591	2026-06-24 16:16:33.591
21669	百	ひゃく	hyaku	trăm	3	2026-06-24 16:16:33.594	2026-06-24 16:16:33.594
21670	千	せん	sen	nghìn	3	2026-06-24 16:16:33.597	2026-06-24 16:16:33.597
21671	万	まん	man	mười nghìn, vạn	3	2026-06-24 16:16:33.601	2026-06-24 16:16:33.601
21672	\N	すみません。	sumimasen.	Xin lỗi	3	2026-06-24 16:16:33.605	2026-06-24 16:16:33.605
21673	\N	どうも。	domo.	Thanks.	3	2026-06-24 16:16:33.608	2026-06-24 16:16:33.608
21674	\N	いらっしゃいませ。	irasshaimase.	Welcome./May I help you? (a greeting to a customer or a guest entering a shop, etc.)	3	2026-06-24 16:16:33.611	2026-06-24 16:16:33.611
21675	［～を］見せて ください。	［～を］みせて ください。	[~wo] misete kudasai.	Please show me [～].	3	2026-06-24 16:16:33.614	2026-06-24 16:16:33.614
21676	\N	じゃ	ja	well, then, in that case	3	2026-06-24 16:16:33.618	2026-06-24 16:16:33.618
21677	\N	［～を］ください。	[~wo] kudasai.	Give me [～], please.	3	2026-06-24 16:16:33.62	2026-06-24 16:16:33.62
21678	\N	イタリア	itaria	Italy	3	2026-06-24 16:16:33.623	2026-06-24 16:16:33.623
21679	\N	スイス	suisu	Thụy Sĩ	3	2026-06-24 16:16:33.625	2026-06-24 16:16:33.625
21680	\N	フランス	furansu	France	3	2026-06-24 16:16:33.627	2026-06-24 16:16:33.627
21681	\N	ジャカルタ	jakaruta	Jakarta	3	2026-06-24 16:16:33.629	2026-06-24 16:16:33.629
21682	\N	バンコク	bankoku	Bangkok	3	2026-06-24 16:16:33.631	2026-06-24 16:16:33.631
21683	\N	ベルリン	berurin	Berlin	3	2026-06-24 16:16:33.636	2026-06-24 16:16:33.636
21684	新大阪	しんおおさか	shin'osaka	name of a station in Osaka	3	2026-06-24 16:16:33.639	2026-06-24 16:16:33.639
21685	煙草	たばこ	tabako	thuốc lá	3	2026-06-24 16:16:33.642	2026-06-24 16:16:33.642
21686	\N	～で ございます。	~de gozaimasu.	(polite equivalent of です)	3	2026-06-24 16:16:33.646	2026-06-24 16:16:33.646
21687	\N	MT／ヨーネン／アキックス	MT/yonen/akikkusu	công ty giả định (trong sách)	3	2026-06-24 16:16:33.649	2026-06-24 16:16:33.649
21688	起きます	おきます	okimasu	thức dậy	4	2026-06-24 16:16:33.745	2026-06-24 16:16:33.745
21689	寝ます	ねます	nemasu	ngủ	4	2026-06-24 16:16:33.747	2026-06-24 16:16:33.747
21690	働きます	はたらきます	hatarakimasu	làm việc	4	2026-06-24 16:16:33.749	2026-06-24 16:16:33.749
21691	休みます	やすみます	yasumimasu	nghỉ ngơi	4	2026-06-24 16:16:33.752	2026-06-24 16:16:33.752
21692	勉強します	べんきょうします	benkyoshimasu	học tập	4	2026-06-24 16:16:33.754	2026-06-24 16:16:33.754
21693	終わります	おわります	owarimasu	kết thúc	4	2026-06-24 16:16:33.755	2026-06-24 16:16:33.755
21694	\N	デパート	depato	cửa hàng bách hóa	4	2026-06-24 16:16:33.757	2026-06-24 16:16:33.757
21695	銀行	ぎんこう	ginko	bank	4	2026-06-24 16:16:33.759	2026-06-24 16:16:33.759
21696	郵便局	ゆうびんきょく	yubinkyoku	bưu điện	4	2026-06-24 16:16:33.761	2026-06-24 16:16:33.761
21697	図書館	としょかん	toshokan	thư viện	4	2026-06-24 16:16:33.763	2026-06-24 16:16:33.763
21698	美術館	びじゅつかん	bijutsukan	viện bảo tàng	4	2026-06-24 16:16:33.765	2026-06-24 16:16:33.765
21699	今	いま	ima	bây giờ	4	2026-06-24 16:16:33.77	2026-06-24 16:16:33.77
21700	－時	－じ	-ji	－ o'clock	4	2026-06-24 16:16:33.773	2026-06-24 16:16:33.773
21701	－分	－ふん（－ぷん）	-fun (-pun)	－ minute	4	2026-06-24 16:16:33.775	2026-06-24 16:16:33.775
21702	半	はん	han	phân nửa, một nửa	4	2026-06-24 16:16:33.778	2026-06-24 16:16:33.778
21703	何時	なんじ	nanji	mấy giờ	4	2026-06-24 16:16:33.78	2026-06-24 16:16:33.78
21704	何分	なんぷん	nanpun	mấy phút	4	2026-06-24 16:16:33.785	2026-06-24 16:16:33.785
21705	午前	ごぜん	gozen	buổi sáng	4	2026-06-24 16:16:33.788	2026-06-24 16:16:33.788
21706	午後	ごご	gogo	buổi chiều	4	2026-06-24 16:16:33.791	2026-06-24 16:16:33.791
21707	朝	あさ	asa	sáng	4	2026-06-24 16:16:33.793	2026-06-24 16:16:33.793
21708	昼	ひる	hiru	trưa	4	2026-06-24 16:16:33.795	2026-06-24 16:16:33.795
21709	晩（夜）	ばん（よる）	ban (yoru)	tối	4	2026-06-24 16:16:33.797	2026-06-24 16:16:33.797
21710	\N	おととい	ototoi	ngày hôm kia	4	2026-06-24 16:16:33.801	2026-06-24 16:16:33.801
21711	\N	きのう	kino	ngày hôm qua	4	2026-06-24 16:16:33.803	2026-06-24 16:16:33.803
21712	\N	きょう	kyo	hôm nay	4	2026-06-24 16:16:33.805	2026-06-24 16:16:33.805
21713	\N	あした	ashita	ngày mai	4	2026-06-24 16:16:33.808	2026-06-24 16:16:33.808
21714	\N	あさって	asatte	ngày mốt	4	2026-06-24 16:16:33.81	2026-06-24 16:16:33.81
21715	\N	けさ	kesa	sáng nay	4	2026-06-24 16:16:33.812	2026-06-24 16:16:33.812
21716	今晩	こんばん	konban	tối nay	4	2026-06-24 16:16:33.815	2026-06-24 16:16:33.815
21717	休み	やすみ	yasumi	nghỉ ngơi (danh từ)	4	2026-06-24 16:16:33.819	2026-06-24 16:16:33.819
21718	昼休み	ひるやすみ	hiruyasumi	nghỉ trưa	4	2026-06-24 16:16:33.822	2026-06-24 16:16:33.822
21719	試験	しけん	shiken	examination, test	4	2026-06-24 16:16:33.824	2026-06-24 16:16:33.824
21720	会議	かいぎ	kaigi	meeting, conference (～を します : hold a meeting)	4	2026-06-24 16:16:33.827	2026-06-24 16:16:33.827
21721	映画	えいが	eiga	film, movie	4	2026-06-24 16:16:33.83	2026-06-24 16:16:33.83
21722	毎朝	まいあさ	maiasa	mỗi sáng	4	2026-06-24 16:16:33.834	2026-06-24 16:16:33.834
21723	毎晩	まいばん	maiban	mỗi tối	4	2026-06-24 16:16:33.838	2026-06-24 16:16:33.838
21724	毎日	まいにち	mainichi	mỗi ngày	4	2026-06-24 16:16:33.841	2026-06-24 16:16:33.841
21725	月曜日	げつようび	getsuyobi	Monday	4	2026-06-24 16:16:33.844	2026-06-24 16:16:33.844
21726	火曜日	かようび	kayobi	Tuesday	4	2026-06-24 16:16:33.847	2026-06-24 16:16:33.847
21727	水曜日	すいようび	suiyobi	Wednesday	4	2026-06-24 16:16:33.851	2026-06-24 16:16:33.851
21728	木曜日	もくようび	mokuyobi	Thursday	4	2026-06-24 16:16:33.855	2026-06-24 16:16:33.855
21729	金曜日	きんようび	kin'yobi	Friday	4	2026-06-24 16:16:33.858	2026-06-24 16:16:33.858
21730	土曜日	どようび	doyobi	Saturday	4	2026-06-24 16:16:33.86	2026-06-24 16:16:33.86
21731	日曜日	にちようび	nichiyobi	Sunday	4	2026-06-24 16:16:33.864	2026-06-24 16:16:33.864
21732	何曜日	なんようび	naniyobi	what day of the week	4	2026-06-24 16:16:33.869	2026-06-24 16:16:33.869
21733	\N	～から	~kara	từ	4	2026-06-24 16:16:33.871	2026-06-24 16:16:33.871
21734	\N	～まで	~made	đến	4	2026-06-24 16:16:33.873	2026-06-24 16:16:33.873
21735	\N	～と ～	~to ~	and (used to connect nouns)	4	2026-06-24 16:16:33.874	2026-06-24 16:16:33.874
21736	大変ですね。	たいへんですね。	taihendesune.	That's tough, isn't it? (used when expressing sympathy)	4	2026-06-24 16:16:33.876	2026-06-24 16:16:33.876
21737	番号	ばんごう	bango	number	4	2026-06-24 16:16:33.878	2026-06-24 16:16:33.878
21738	何番	なんばん	nanban	số mấy	4	2026-06-24 16:16:33.879	2026-06-24 16:16:33.879
21739	其方	そちら	sochira	phía ông, bà	4	2026-06-24 16:16:33.881	2026-06-24 16:16:33.881
21740	\N	ニューヨーク	nyuyoku	New York	4	2026-06-24 16:16:33.884	2026-06-24 16:16:33.884
21741	\N	ペキン	pekin	Beijing (北京)	4	2026-06-24 16:16:33.886	2026-06-24 16:16:33.886
21742	\N	ロサンゼルス	rosanzerusu	Los Angeles	4	2026-06-24 16:16:33.888	2026-06-24 16:16:33.888
21743	\N	ロンドン	rondon	London	4	2026-06-24 16:16:33.89	2026-06-24 16:16:33.89
21744	\N	あすか	asuka	a fictitious Japanese restaurant	4	2026-06-24 16:16:33.891	2026-06-24 16:16:33.891
21745	アップル銀行	アップルぎんこう	appuruginko	a fictitious bank	4	2026-06-24 16:16:33.893	2026-06-24 16:16:33.893
21746	みどり図書館	みどりとしょかん	midoritoshokan	a fictitious library	4	2026-06-24 16:16:33.896	2026-06-24 16:16:33.896
21747	やまと美術館	やまとびじゅつかん	yamatobijutsukan	a fictitious art gallery	4	2026-06-24 16:16:33.898	2026-06-24 16:16:33.898
21748	\N	えーと	eeto	well, let me see	4	2026-06-24 16:16:33.904	2026-06-24 16:16:33.904
21749	\N	１０４	104	information, directory assistance	4	2026-06-24 16:16:33.907	2026-06-24 16:16:33.907
21750	お願いします。	おねがいします。	onegaishimasu.	Please. (lit. ask for a favor)	4	2026-06-24 16:16:33.91	2026-06-24 16:16:33.91
21751	\N	かしこまりました。	kashikomarimashita.	Certainly (sir, madam)	4	2026-06-24 16:16:33.912	2026-06-24 16:16:33.912
21752	お問い合わせの番号	おといあわせのばんごう	otoiawasenobango	the number being inquired about	4	2026-06-24 16:16:33.916	2026-06-24 16:16:33.916
21753	\N	［どうも］ありがとう ございました。	[domo] arigato gozaimashita.	Thank you very much.	4	2026-06-24 16:16:33.92	2026-06-24 16:16:33.92
21754	\N	バンコク	bankoku	Bangkok	4	2026-06-24 16:16:33.923	2026-06-24 16:16:33.923
21755	大阪デパート	おおさかデパート	osakadepato	fictitious department store	4	2026-06-24 16:16:33.925	2026-06-24 16:16:33.925
21756	行ます	いきます	ikimasu	đi	5	2026-06-24 16:16:34.093	2026-06-24 16:16:34.093
21757	来ます	きます	kimasu	đến	5	2026-06-24 16:16:34.097	2026-06-24 16:16:34.097
21758	帰ります	かえります	kaerimasu	về	5	2026-06-24 16:16:34.102	2026-06-24 16:16:34.102
21759	学校	がっこう	gakko	trường học	5	2026-06-24 16:16:34.106	2026-06-24 16:16:34.106
21760	\N	スーパー	supa	siêu thị	5	2026-06-24 16:16:34.11	2026-06-24 16:16:34.11
21761	駅	えき	eki	ga, nhà ga	5	2026-06-24 16:16:34.113	2026-06-24 16:16:34.113
21762	飛行機	ひこうき	hikoki	máy bay	5	2026-06-24 16:16:34.118	2026-06-24 16:16:34.118
21763	船	ふね	fune	thuyền, tàu thủy	5	2026-06-24 16:16:34.122	2026-06-24 16:16:34.122
21764	電車	でんしゃ	densha	tàu điện	5	2026-06-24 16:16:34.126	2026-06-24 16:16:34.126
21765	地下鉄	ちかてつ	chikatetsu	tàu điện ngầm	5	2026-06-24 16:16:34.129	2026-06-24 16:16:34.129
21766	新幹線	しんかんせん	shinkansen	tàu Shinkansen (tàu điện siêu tốc của Nhật)	5	2026-06-24 16:16:34.134	2026-06-24 16:16:34.134
21767	\N	バス	basu	xe Buýt	5	2026-06-24 16:16:34.139	2026-06-24 16:16:34.139
21768	\N	タクシー	takushii	taxi	5	2026-06-24 16:16:34.142	2026-06-24 16:16:34.142
21769	自転車	じてんしゃ	jitensha	xe đạp	5	2026-06-24 16:16:34.146	2026-06-24 16:16:34.146
21770	歩いて	あるいて	aruite	đi bộ, đi dạo	5	2026-06-24 16:16:34.152	2026-06-24 16:16:34.152
21771	人	ひと	hito	người	5	2026-06-24 16:16:34.157	2026-06-24 16:16:34.157
21772	友達	ともだち	tomodachi	bạn, bạn bè	5	2026-06-24 16:16:34.161	2026-06-24 16:16:34.161
21773	彼	かれ	kare	anh ấy, bạn trai	5	2026-06-24 16:16:34.164	2026-06-24 16:16:34.164
21774	彼女	かのじょ	kanojo	chị ấy, bạn gái	5	2026-06-24 16:16:34.17	2026-06-24 16:16:34.17
21775	家族	かぞく	kazoku	gia đình	5	2026-06-24 16:16:34.175	2026-06-24 16:16:34.175
21776	一人で	ひとりで	hitoride	một mình	5	2026-06-24 16:16:34.179	2026-06-24 16:16:34.179
21777	先週	せんしゅう	senshu	tuần trước	5	2026-06-24 16:16:34.184	2026-06-24 16:16:34.184
21778	今週	こんしゅう	konshu	tuần này	5	2026-06-24 16:16:34.189	2026-06-24 16:16:34.189
21779	来週	らいしゅう	raishu	tuần sau	5	2026-06-24 16:16:34.193	2026-06-24 16:16:34.193
21780	先月	せんげつ	sengetsu	tháng trước	5	2026-06-24 16:16:34.198	2026-06-24 16:16:34.198
21781	今月	こんげつ	kongetsu	tháng này	5	2026-06-24 16:16:34.203	2026-06-24 16:16:34.203
21782	来月	らいげつ	raigetsu	tháng sau	5	2026-06-24 16:16:34.208	2026-06-24 16:16:34.208
21783	去年	きょねん	kyonen	năm ngoái	5	2026-06-24 16:16:34.212	2026-06-24 16:16:34.212
21784	\N	ことし	kotoshi	năm nay	5	2026-06-24 16:16:34.217	2026-06-24 16:16:34.217
21785	来年	らいねん	rainen	năm sau	5	2026-06-24 16:16:34.222	2026-06-24 16:16:34.222
21786	－年	－ねん	-nen	-th year	5	2026-06-24 16:16:34.226	2026-06-24 16:16:34.226
21787	何年	なんねん	nannen	what year	5	2026-06-24 16:16:34.23	2026-06-24 16:16:34.23
21788	－月	－がつ	-gatsu	-th month of the year	5	2026-06-24 16:16:34.234	2026-06-24 16:16:34.234
21789	何月	なんがつ	nangatsu	tháng mấy	5	2026-06-24 16:16:34.238	2026-06-24 16:16:34.238
21790	１日	ついたち	tsuitachi	ngày mồng 1 (ngày đầu tiên của tháng)	5	2026-06-24 16:16:34.242	2026-06-24 16:16:34.242
21791	２日	ふつか	futsuka	ngày thứ 2 của tháng	5	2026-06-24 16:16:34.247	2026-06-24 16:16:34.247
21792	３日	みっか	mikka	third, three days	5	2026-06-24 16:16:34.252	2026-06-24 16:16:34.252
21793	４日	よっか	yokka	fourth, four days	5	2026-06-24 16:16:34.256	2026-06-24 16:16:34.256
21794	５日	いつか	itsuka	fifth, five days	5	2026-06-24 16:16:34.259	2026-06-24 16:16:34.259
21795	６日	むいか	muika	sixth, six days	5	2026-06-24 16:16:34.262	2026-06-24 16:16:34.262
21796	７日	なのか	nanoka	seventh, seven days	5	2026-06-24 16:16:34.264	2026-06-24 16:16:34.264
21797	８日	ようか	youka	eighth, eight days	5	2026-06-24 16:16:34.269	2026-06-24 16:16:34.269
21798	９日	ここのか	kokonoka	ninth, nine days	5	2026-06-24 16:16:34.272	2026-06-24 16:16:34.272
21799	１０日	とおか	tooka	tenth, ten days	5	2026-06-24 16:16:34.276	2026-06-24 16:16:34.276
21800	１４日	じゅうよっか	juuyokka	fourteenth, fourteen days	5	2026-06-24 16:16:34.28	2026-06-24 16:16:34.28
21801	２０日	はつか	hatsuka	twentieth, twenty days	5	2026-06-24 16:16:34.284	2026-06-24 16:16:34.284
21802	２４日	にじゅうよっか	nijuuyokka	twenty-fourth, twenty-four days	5	2026-06-24 16:16:34.287	2026-06-24 16:16:34.287
21803	－日	－にち	-nichi	-th day of the month, － day(s)	5	2026-06-24 16:16:34.29	2026-06-24 16:16:34.29
21804	何日	なんにち	nannichi	ngày mấy, ngày bao nhiêu, bao nhiêu ngày	5	2026-06-24 16:16:34.292	2026-06-24 16:16:34.292
21805	\N	いつ	itsu	bao giờ, khi nào	5	2026-06-24 16:16:34.295	2026-06-24 16:16:34.295
21806	誕生日	たんじょうび	tanjobi	sinh nhật	5	2026-06-24 16:16:34.297	2026-06-24 16:16:34.297
21807	\N	そうですね。	sodesune.	Yes, it is.	5	2026-06-24 16:16:34.302	2026-06-24 16:16:34.302
21808	\N	［どうも］ありがとう ございました。	[domo] arigato gozaimashita.	Thank you very much.	5	2026-06-24 16:16:34.305	2026-06-24 16:16:34.305
21809	\N	どう いたしまして。	do itashimashite.	You're welcome./Don't mention it.	5	2026-06-24 16:16:34.308	2026-06-24 16:16:34.308
21810	－番線	－ばんせん	-bansen	platform －, -th platform	5	2026-06-24 16:16:34.31	2026-06-24 16:16:34.31
21811	次の	つぎの	tsugino	tiếp theo	5	2026-06-24 16:16:34.312	2026-06-24 16:16:34.312
21812	普通	ふつう	futsu	tàu thường (dừng cả ở các ga lẻ)	5	2026-06-24 16:16:34.314	2026-06-24 16:16:34.314
21813	急行	きゅうこう	kyuko	tàu tốc hành	5	2026-06-24 16:16:34.318	2026-06-24 16:16:34.318
21814	特急	とっきゅう	tokkyu	tàu tốc hành đặc biệt	5	2026-06-24 16:16:34.32	2026-06-24 16:16:34.32
21815	甲子園	こうしえん	koshien	name of a town near Osaka	5	2026-06-24 16:16:34.322	2026-06-24 16:16:34.322
21816	大阪城	おおさかじょう	osakajo	Osaka Castle, a famous castle in Osaka	5	2026-06-24 16:16:34.325	2026-06-24 16:16:34.325
21817	博多	はかた	hakata	name of a town in Kyushu	5	2026-06-24 16:16:34.327	2026-06-24 16:16:34.327
21818	伏見	ふしみ	fushimi	name of a town in Kyoto	5	2026-06-24 16:16:34.329	2026-06-24 16:16:34.329
21819	食べます	たべます	tabemasu	ăn	6	2026-06-24 16:16:34.456	2026-06-24 16:16:34.456
21820	飲みます	のみます	nomimasu	uống	6	2026-06-24 16:16:34.459	2026-06-24 16:16:34.459
21821	吸います［たばこを～］	すいます［たばこを～］	suimasu [tabakowo~]	hút [thuốc lá]	6	2026-06-24 16:16:34.463	2026-06-24 16:16:34.463
21822	見ます	みます	mimasu	xem, nhìn, trông	6	2026-06-24 16:16:34.468	2026-06-24 16:16:34.468
21823	聞きます	ききます	kikimasu	nghe	6	2026-06-24 16:16:34.471	2026-06-24 16:16:34.471
21824	読みます	よみます	yomimasu	đọc	6	2026-06-24 16:16:34.474	2026-06-24 16:16:34.474
21825	書きます	かきます	kakimasu	viết, vẽ	6	2026-06-24 16:16:34.476	2026-06-24 16:16:34.476
21826	買います	かいます	kaimasu	mua	6	2026-06-24 16:16:34.479	2026-06-24 16:16:34.479
21827	撮ります［写真を～］	とります［しゃしんを～］	torimasu [shashinwo~]	chụp [ảnh]	6	2026-06-24 16:16:34.484	2026-06-24 16:16:34.484
21828	\N	します	shimasu	làm	6	2026-06-24 16:16:34.487	2026-06-24 16:16:34.487
21829	会います［友達に～］	あいます［ともだちに～］	aimasu [tomodachini~]	gặp gỡ	6	2026-06-24 16:16:34.489	2026-06-24 16:16:34.489
21830	\N	ごはん	gohan	cơm, bữa ăn	6	2026-06-24 16:16:34.492	2026-06-24 16:16:34.492
21831	朝ごはん	あさごはん	asagohan	cơm sáng	6	2026-06-24 16:16:34.494	2026-06-24 16:16:34.494
21832	昼ごはん	ひるごはん	hirugohan	cơm trưa	6	2026-06-24 16:16:34.497	2026-06-24 16:16:34.497
21833	晩ごはん	ばんごはん	bangohan	cơm tối	6	2026-06-24 16:16:34.5	2026-06-24 16:16:34.5
21834	\N	パン	pan	bánh mì	6	2026-06-24 16:16:34.502	2026-06-24 16:16:34.502
21835	卵	たまご	tamago	trứng	6	2026-06-24 16:16:34.504	2026-06-24 16:16:34.504
21836	肉	にく	niku	thịt	6	2026-06-24 16:16:34.506	2026-06-24 16:16:34.506
21837	魚	さかな	sakana	cá	6	2026-06-24 16:16:34.508	2026-06-24 16:16:34.508
21838	野菜	やさい	yasai	rau	6	2026-06-24 16:16:34.51	2026-06-24 16:16:34.51
21839	果物	くだもの	kudamono	hoa quả, trái cây	6	2026-06-24 16:16:34.512	2026-06-24 16:16:34.512
21840	水	みず	mizu	nước	6	2026-06-24 16:16:34.514	2026-06-24 16:16:34.514
21841	お茶	おちゃ	ocha	trà (nói chung)	6	2026-06-24 16:16:34.518	2026-06-24 16:16:34.518
21842	紅茶	こうちゃ	kocha	trà đen	6	2026-06-24 16:16:34.52	2026-06-24 16:16:34.52
21843	牛乳（ミルク）	ぎゅうにゅう（ミルク）	gyunyu (miruku)	sữa bò	6	2026-06-24 16:16:34.522	2026-06-24 16:16:34.522
21844	\N	ジュース	jusu	nước hoa quả	6	2026-06-24 16:16:34.524	2026-06-24 16:16:34.524
21845	\N	ビール	biiru	bia	6	2026-06-24 16:16:34.526	2026-06-24 16:16:34.526
21846	［お］酒	［お］さけ	[o] sake	rượu, rượu sake	6	2026-06-24 16:16:34.528	2026-06-24 16:16:34.528
21847	煙草	たばこ	tabako	tobacco, cigarette	6	2026-06-24 16:16:34.53	2026-06-24 16:16:34.53
21848	手紙	てがみ	tegami	thư	6	2026-06-24 16:16:34.534	2026-06-24 16:16:34.534
21849	\N	レポート	repoto	báo cáo	6	2026-06-24 16:16:34.537	2026-06-24 16:16:34.537
21850	写真	しゃしん	shashin	ảnh, bức ảnh	6	2026-06-24 16:16:34.539	2026-06-24 16:16:34.539
21851	\N	ビデオ	bideo	video, băng video	6	2026-06-24 16:16:34.541	2026-06-24 16:16:34.541
21852	店	みせ	mise	cửa hàng, của tiệm	6	2026-06-24 16:16:34.544	2026-06-24 16:16:34.544
21853	庭	にわ	niwa	vườn	6	2026-06-24 16:16:34.546	2026-06-24 16:16:34.546
21854	宿題	しゅくだい	shukudai	bài tập về nhà	6	2026-06-24 16:16:34.548	2026-06-24 16:16:34.548
21855	\N	テニス	tenisu	quần vợt (～をします: đánh quần vợt)	6	2026-06-24 16:16:34.551	2026-06-24 16:16:34.551
21856	\N	サッカー	sakka	đá bóng	6	2026-06-24 16:16:34.554	2026-06-24 16:16:34.554
21857	［お］花見	［お］はなみ	[o] hanami	cherry-blossom viewing (～を します : view the cherry blossoms)	6	2026-06-24 16:16:34.556	2026-06-24 16:16:34.556
21858	何	なに	nani	cái gì, gì	6	2026-06-24 16:16:34.559	2026-06-24 16:16:34.559
21859	\N	いっしょに	isshoni	cùng, cùng nhau	6	2026-06-24 16:16:34.561	2026-06-24 16:16:34.561
21860	\N	ちょっと	chotto	một chút	6	2026-06-24 16:16:34.563	2026-06-24 16:16:34.563
21861	\N	いつも	itsumo	luôn luôn, lúc nào cũng	6	2026-06-24 16:16:34.566	2026-06-24 16:16:34.566
21862	時々	ときどき	tokidoki	thỉnh thoảng	6	2026-06-24 16:16:34.569	2026-06-24 16:16:34.569
21863	\N	それから	sorekara	sau đó	6	2026-06-24 16:16:34.571	2026-06-24 16:16:34.571
21864	\N	ええ	ee	vâng	6	2026-06-24 16:16:34.574	2026-06-24 16:16:34.574
21865	\N	いいですね。	iidesune.	Được đấy nhỉ/ tốt nhỉ	6	2026-06-24 16:16:34.576	2026-06-24 16:16:34.576
21866	\N	わかりました。	wakarimashita.	Tôi hiểu rồi/ vâng ạ.	6	2026-06-24 16:16:34.577	2026-06-24 16:16:34.577
21867	何ですか。	なんですか。	nandesuka.	Yes? (lit: What is it?)	6	2026-06-24 16:16:34.579	2026-06-24 16:16:34.579
21868	\N	じゃ、また［あした］。	ja, mata [ashita].	See you [tomorrow].	6	2026-06-24 16:16:34.581	2026-06-24 16:16:34.581
21869	\N	メキシコ	mekishiko	Mexico	6	2026-06-24 16:16:34.585	2026-06-24 16:16:34.585
21870	大阪デパート	おおさかデパート	osakadepato	a fictitious department store	6	2026-06-24 16:16:34.587	2026-06-24 16:16:34.587
21871	\N	つるや	tsuruya	a fictitious restaurant	6	2026-06-24 16:16:34.59	2026-06-24 16:16:34.59
21872	フランス屋	フランスや	furansuya	a fictitious supermarket	6	2026-06-24 16:16:34.592	2026-06-24 16:16:34.592
21873	毎日屋	まいにちや	mainichiya	a fictitious supermarket	6	2026-06-24 16:16:34.594	2026-06-24 16:16:34.594
21874	映画	えいが	eiga	phim, điện ảnh	6	2026-06-24 16:16:34.596	2026-06-24 16:16:34.596
21875	\N	CD	CD	CD, compact disc	6	2026-06-24 16:16:34.598	2026-06-24 16:16:34.598
21876	\N	レストラン	resutoran	nhà hàng	6	2026-06-24 16:16:34.601	2026-06-24 16:16:34.601
21877	大阪城公園	おおさかじょうこうえん	osakajokoen	Osaka Castle park	6	2026-06-24 16:16:34.604	2026-06-24 16:16:34.604
21878	切ります	きります	kirimasu	cắt	7	2026-06-24 16:16:34.71	2026-06-24 16:16:34.71
21879	送ります	おくります	okurimasu	gửi	7	2026-06-24 16:16:34.712	2026-06-24 16:16:34.712
21880	\N	あげます	agemasu	tặng, cho	7	2026-06-24 16:16:34.713	2026-06-24 16:16:34.713
21881	\N	もらいます	moraimasu	nhận	7	2026-06-24 16:16:34.716	2026-06-24 16:16:34.716
21882	貨します	かします	kashimasu	cho mượn, cho vay	7	2026-06-24 16:16:34.718	2026-06-24 16:16:34.718
21883	借ります	かります	karimasu	mượn, vay	7	2026-06-24 16:16:34.72	2026-06-24 16:16:34.72
21884	教えます	おしえます	oshiemasu	dạy	7	2026-06-24 16:16:34.721	2026-06-24 16:16:34.721
21885	習います	ならいます	naraimasu	học, học tập	7	2026-06-24 16:16:34.723	2026-06-24 16:16:34.723
21886	かけます［電話を～］	かけます［でんわを～］	kakemasu [denwawo~]	gọi điện	7	2026-06-24 16:16:34.725	2026-06-24 16:16:34.725
21887	手	て	te	tay	7	2026-06-24 16:16:34.727	2026-06-24 16:16:34.727
21888	\N	はし	hashi	đũa	7	2026-06-24 16:16:34.728	2026-06-24 16:16:34.728
21889	\N	スプーン	supun	muỗng, thìa	7	2026-06-24 16:16:34.73	2026-06-24 16:16:34.73
21890	\N	ナイフ	naifu	dao	7	2026-06-24 16:16:34.731	2026-06-24 16:16:34.731
21891	\N	フォーク	foku	nĩa	7	2026-06-24 16:16:34.735	2026-06-24 16:16:34.735
21892	\N	はさみ	hasami	kéo	7	2026-06-24 16:16:34.737	2026-06-24 16:16:34.737
21893	\N	パソコン	pasokon	máy tính cá nhân	7	2026-06-24 16:16:34.738	2026-06-24 16:16:34.738
21894	\N	ケータイ	ketai	mobile phone, cell phone	7	2026-06-24 16:16:34.739	2026-06-24 16:16:34.739
21895	\N	メール	meru	e-mail	7	2026-06-24 16:16:34.741	2026-06-24 16:16:34.741
21896	年賀状	ねんがじょう	nengajo	New Year's greeting card	7	2026-06-24 16:16:34.743	2026-06-24 16:16:34.743
21897	\N	パンチ	panchi	cái bấm lỗ	7	2026-06-24 16:16:34.744	2026-06-24 16:16:34.744
21898	\N	ホッチキス	hotchikisu	cái dập ghim	7	2026-06-24 16:16:34.745	2026-06-24 16:16:34.745
21899	\N	セロテープ	serotepu	băng keo	7	2026-06-24 16:16:34.747	2026-06-24 16:16:34.747
21900	消しゴマ	けしゴマ	keshigoma	rubber, eraser	7	2026-06-24 16:16:34.749	2026-06-24 16:16:34.749
21901	紙	かみ	kami	giấy	7	2026-06-24 16:16:34.752	2026-06-24 16:16:34.752
21902	花	はな	hana	hoa	7	2026-06-24 16:16:34.754	2026-06-24 16:16:34.754
21903	\N	シャツ	shatsu	áo sơ mi	7	2026-06-24 16:16:34.755	2026-06-24 16:16:34.755
21904	\N	プレゼント	purezento	quà tặng	7	2026-06-24 16:16:34.757	2026-06-24 16:16:34.757
21905	荷物	にもつ	nimotsu	hành lí, đồ đạc	7	2026-06-24 16:16:34.759	2026-06-24 16:16:34.759
21906	お金	おかね	okane	tiền	7	2026-06-24 16:16:34.761	2026-06-24 16:16:34.761
21907	切符	きっぷ	kippu	vé	7	2026-06-24 16:16:34.763	2026-06-24 16:16:34.763
21908	\N	クリスマス	kurisumasu	lễ Noel	7	2026-06-24 16:16:34.764	2026-06-24 16:16:34.764
21909	父	ちち	chichi	cha tôi, bố	7	2026-06-24 16:16:34.769	2026-06-24 16:16:34.769
21910	母	はは	haha	mẹ tôi	7	2026-06-24 16:16:34.771	2026-06-24 16:16:34.771
21911	お父さん	おとうさん	otosan	bố của người khác	7	2026-06-24 16:16:34.773	2026-06-24 16:16:34.773
21912	お母さん	おかあさん	okasan	mẹ của người khác	7	2026-06-24 16:16:34.775	2026-06-24 16:16:34.775
21913	\N	もう	mo	đã, rồi	7	2026-06-24 16:16:34.776	2026-06-24 16:16:34.776
21914	\N	まだ	mada	chưa	7	2026-06-24 16:16:34.778	2026-06-24 16:16:34.778
21915	\N	これから	korekara	từ bây giờ	7	2026-06-24 16:16:34.78	2026-06-24 16:16:34.78
21916	\N	［～、］すてきですね。	[~,] sutekidesune.	What a nice [～]!	7	2026-06-24 16:16:34.781	2026-06-24 16:16:34.781
21917	\N	いらっしゃい。	irasshai.	anh (chị) đến chơi	7	2026-06-24 16:16:34.784	2026-06-24 16:16:34.784
21918	どうぞ お上がり ください。	どうぞ おあがり ください。	dozo oagari kudasai.	Xin mời anh(chị) vào nhà.	7	2026-06-24 16:16:34.786	2026-06-24 16:16:34.786
21919	失礼します。	しつれいします。	shitsureishimasu.	xin lỗi, làm phiền	7	2026-06-24 16:16:34.788	2026-06-24 16:16:34.788
21920	\N	［～は］いかがですか。	[~wa] ikagadesuka.	Won't you have [～]?/Would you like to have [～]? (used when offering something)	7	2026-06-24 16:16:34.79	2026-06-24 16:16:34.79
21921	\N	いただきます。	itadakimasu.	Cho tôi nhận.	7	2026-06-24 16:16:34.792	2026-06-24 16:16:34.792
21922	\N	ごちそうさま［でした］。	gochisosama [deshita].	That was delicious. (said after eating or drinking)	7	2026-06-24 16:16:34.794	2026-06-24 16:16:34.794
21923	スペイン	スパイン	supain	Spain	7	2026-06-24 16:16:34.795	2026-06-24 16:16:34.795
21924	\N	ファクス	fuakusu	fax, máy fax	7	2026-06-24 16:16:34.796	2026-06-24 16:16:34.796
21925	\N	ワープロ	wapuro	máy đánh chữ	7	2026-06-24 16:16:34.798	2026-06-24 16:16:34.798
21926	\N	ごめんください。	gomenkudasai.	xin lỗi có ai ở nhà không ?	7	2026-06-24 16:16:34.801	2026-06-24 16:16:34.801
21927	旅行	りょこう	ryoko	du lịch	7	2026-06-24 16:16:34.803	2026-06-24 16:16:34.803
21928	お土産	おみやげ	omiyage	quà lưu niệm	7	2026-06-24 16:16:34.805	2026-06-24 16:16:34.805
21929	\N	ヨーロッパ	yoroppa	Châu Âu	7	2026-06-24 16:16:34.806	2026-06-24 16:16:34.806
21930	\N	ハンサム［な］	hansamu [na]	đẹp trai	8	2026-06-24 16:16:34.891	2026-06-24 16:16:34.891
21931	\N	きれい［な］	kirei [na]	beautiful, clean	8	2026-06-24 16:16:34.893	2026-06-24 16:16:34.893
21932	静か［な］	しずか［な］	shizuka [na]	yên tĩnh	8	2026-06-24 16:16:34.894	2026-06-24 16:16:34.894
21933	\N	にぎやか［な］	nigiyaka [na]	nhộn nhịp, náo nhiệt	8	2026-06-24 16:16:34.896	2026-06-24 16:16:34.896
21934	有名［な］	ゆうめい［な］	yumei [na]	nổi tiếng	8	2026-06-24 16:16:34.898	2026-06-24 16:16:34.898
21935	親切［な］	しんせつ［な］	shinsetsu [na]	tử tế, tốt bụng	8	2026-06-24 16:16:34.901	2026-06-24 16:16:34.901
21936	元気［な］	げんき［な］	genki [na]	khỏe	8	2026-06-24 16:16:34.905	2026-06-24 16:16:34.905
21937	暇［な］	ひま［な］	hima [na]	rảnh rỗi	8	2026-06-24 16:16:34.907	2026-06-24 16:16:34.907
21938	便利［な］	べんり［な］	benri [na]	tiện lợi	8	2026-06-24 16:16:34.909	2026-06-24 16:16:34.909
21939	\N	すてき［な］	suteki [na]	đẹp, hay, tuyệt vời	8	2026-06-24 16:16:34.911	2026-06-24 16:16:34.911
21940	大きい	おおきい	okii	to lớn	8	2026-06-24 16:16:34.912	2026-06-24 16:16:34.912
21941	小さい	ちいさい	chiisai	nhỏ, bé	8	2026-06-24 16:16:34.914	2026-06-24 16:16:34.914
21942	新しい	あたらしい	atarashii	mới	8	2026-06-24 16:16:34.917	2026-06-24 16:16:34.917
21943	古い	ふるい	furui	cũ	8	2026-06-24 16:16:34.919	2026-06-24 16:16:34.919
21944	\N	いい（よい）	ii (yoi)	tốt	8	2026-06-24 16:16:34.92	2026-06-24 16:16:34.92
21945	悪い	わるい	warui	xấu	8	2026-06-24 16:16:34.921	2026-06-24 16:16:34.921
21946	暑い、熱い	あつい	atsui	nóng	8	2026-06-24 16:16:34.923	2026-06-24 16:16:34.923
21947	寒い	さむい	samui	(trời) lạnh	8	2026-06-24 16:16:34.924	2026-06-24 16:16:34.924
21948	冷たい	つめたい	tsumetai	lạnh, buốt (dùng cho cảm giác)	8	2026-06-24 16:16:34.925	2026-06-24 16:16:34.925
21949	難しい	むずかしい	muzukashii	khó (bài tập khó)	8	2026-06-24 16:16:34.927	2026-06-24 16:16:34.927
21950	易しい	やさしい	yasashii	dễ (bài tập dễ), dịu dàng	8	2026-06-24 16:16:34.928	2026-06-24 16:16:34.928
21951	高い	たかい	takai	đắt, cao	8	2026-06-24 16:16:34.93	2026-06-24 16:16:34.93
21952	安い	やすい	yasui	rẻ	8	2026-06-24 16:16:34.933	2026-06-24 16:16:34.933
21953	低い	ひくい	hikui	thấp	8	2026-06-24 16:16:34.935	2026-06-24 16:16:34.935
21954	\N	おもしろい	omoshiroi	thú vị, hay	8	2026-06-24 16:16:34.937	2026-06-24 16:16:34.937
21955	\N	おいしい	oishii	ngon	8	2026-06-24 16:16:34.938	2026-06-24 16:16:34.938
21956	忙しい	いそがしい	isogashii	bận rộn	8	2026-06-24 16:16:34.94	2026-06-24 16:16:34.94
21957	楽しい	たのしい	tanoshii	vui vẻ	8	2026-06-24 16:16:34.942	2026-06-24 16:16:34.942
21958	白い	しろい	shiroi	trắng	8	2026-06-24 16:16:34.943	2026-06-24 16:16:34.943
21959	黒い	くろい	kuroi	đen	8	2026-06-24 16:16:34.945	2026-06-24 16:16:34.945
21960	赤い	あかい	akai	đỏ	8	2026-06-24 16:16:34.947	2026-06-24 16:16:34.947
21961	青い	あおい	aoi	xanh	8	2026-06-24 16:16:34.95	2026-06-24 16:16:34.95
21962	桜	さくら	sakura	hoa anh đào	8	2026-06-24 16:16:34.952	2026-06-24 16:16:34.952
21963	山	やま	yama	núi	8	2026-06-24 16:16:34.954	2026-06-24 16:16:34.954
21964	町	まち	machi	thành phố	8	2026-06-24 16:16:34.956	2026-06-24 16:16:34.956
21965	食べ物	たべもの	tabemono	thức ăn	8	2026-06-24 16:16:34.957	2026-06-24 16:16:34.957
21966	所	ところ	tokoro	chỗ, nơi	8	2026-06-24 16:16:34.959	2026-06-24 16:16:34.959
21967	寮	りょう	ryo	ký túc xá	8	2026-06-24 16:16:34.961	2026-06-24 16:16:34.961
21968	\N	レストラン	resutoran	restaurant	8	2026-06-24 16:16:34.964	2026-06-24 16:16:34.964
21969	生活	せいかつ	seikatsu	cuộc sống	8	2026-06-24 16:16:34.968	2026-06-24 16:16:34.968
21970	［お］仕事	［お］しごと	[o] shigoto	work, business (～を します : do one's job, work)	8	2026-06-24 16:16:34.97	2026-06-24 16:16:34.97
21971	\N	どう	do	như thế nào	8	2026-06-24 16:16:34.972	2026-06-24 16:16:34.972
21972	\N	どんな ～	donna ~	what kind of ～	8	2026-06-24 16:16:34.974	2026-06-24 16:16:34.974
21973	\N	とても	totemo	rất nhiều	8	2026-06-24 16:16:34.977	2026-06-24 16:16:34.977
21974	\N	あまり	amari	not so (used with negatives)	8	2026-06-24 16:16:34.979	2026-06-24 16:16:34.979
21975	\N	そして	soshite	và, thêm nữa	8	2026-06-24 16:16:34.982	2026-06-24 16:16:34.982
21976	\N	～が、～	~ga, ~	～, but ～	8	2026-06-24 16:16:34.985	2026-06-24 16:16:34.985
21977	お元気ですか。	おげんきですか。	ogenkidesuka.	có khỏe không?	8	2026-06-24 16:16:34.988	2026-06-24 16:16:34.988
21978	\N	そうですね。	sodesune.	đúng vậy./ ừ nhỉ.	8	2026-06-24 16:16:34.991	2026-06-24 16:16:34.991
21979	［～、］もう 一杯 いかがですか。	［～、］もう いっぱい いかがですか。	[~,] mo ippai ikagadesuka.	Won't you have another cup of [～]?	8	2026-06-24 16:16:34.993	2026-06-24 16:16:34.993
21980	\N	［いいえ、］けっこうです。	[iie,] kekkodesu.	No, thank you	8	2026-06-24 16:16:34.996	2026-06-24 16:16:34.996
21981	\N	もう ～です［ね］。	mo ~desu [ne].	It's already ～[, isn't it?]	8	2026-06-24 16:16:35	2026-06-24 16:16:35
21982	そろそろ 失礼します。	そろそろ しつれいします。	sorosoro shitsureishimasu.	It's time I was going.	8	2026-06-24 16:16:35.003	2026-06-24 16:16:35.003
21983	\N	いいえ。	iie.	Not at all.	8	2026-06-24 16:16:35.007	2026-06-24 16:16:35.007
21984	\N	また いらっしゃって ください。	mata irasshatte kudasai.	Lần sau anh( chị, …) lại đến chơi nhé.	8	2026-06-24 16:16:35.01	2026-06-24 16:16:35.01
21985	\N	シャンハイ	shanhai	Thượng Hải	8	2026-06-24 16:16:35.012	2026-06-24 16:16:35.012
21986	金閣寺	きんかくじ	kinkakuji	Chùa Vàng ( tên chùa)	8	2026-06-24 16:16:35.017	2026-06-24 16:16:35.017
21987	奈良公園	ならこうえん	narakoen	Nara Park	8	2026-06-24 16:16:35.019	2026-06-24 16:16:35.019
21988	富士山	ふじさん	fujisan	Núi Phú Sĩ	8	2026-06-24 16:16:35.021	2026-06-24 16:16:35.021
21989	「七人の 侍」	「しちにんの さむらい」	(shichininno samurai)	'The Seven Samurai', a classic movie by Akira Kurosawa	8	2026-06-24 16:16:35.023	2026-06-24 16:16:35.023
21990	車	くるま	kuruma	car, vehicle	8	2026-06-24 16:16:35.025	2026-06-24 16:16:35.025
21991	勉強	べんきょう	benkyo	học tập ( danh từ )	8	2026-06-24 16:16:35.028	2026-06-24 16:16:35.028
21992	\N	どれ	dore	cái nào	8	2026-06-24 16:16:35.03	2026-06-24 16:16:35.03
21993	日本の 生活に 慣れましたか。	にほんの せいかつに なれましたか。	nihonno seikatsuni naremashitaka.	Đã quen với cuộc sống Nhật Bản chưa ?	8	2026-06-24 16:16:35.034	2026-06-24 16:16:35.034
21994	琵琶湖	びわこ	biwako	Hồ Biwaco	8	2026-06-24 16:16:35.037	2026-06-24 16:16:35.037
21995	\N	わかります	wakarimasu	hiểu, nắm được	9	2026-06-24 16:16:35.214	2026-06-24 16:16:35.214
21996	\N	あります	arimasu	có (sở hữu)	9	2026-06-24 16:16:35.219	2026-06-24 16:16:35.219
21997	好き［な］	すき［な］	suki [na]	thích	9	2026-06-24 16:16:35.222	2026-06-24 16:16:35.222
21998	嫌い［な］	きらい［な］	kirai [na]	ghét, không thích	9	2026-06-24 16:16:35.225	2026-06-24 16:16:35.225
21999	上手［な］	じょうず［な］	jozu [na]	giỏi, khéo	9	2026-06-24 16:16:35.227	2026-06-24 16:16:35.227
22000	下手［な］	へた［な］	heta [na]	kém	9	2026-06-24 16:16:35.23	2026-06-24 16:16:35.23
22001	飲み物	のみもの	nomimono	đồ uống	9	2026-06-24 16:16:35.236	2026-06-24 16:16:35.236
22002	料理	りょうり	ryori	món ăn, việc nấu ăn	9	2026-06-24 16:16:35.24	2026-06-24 16:16:35.24
22003	\N	スポーツ	supotsu	thể thao (～をします：chơi thể thao)	9	2026-06-24 16:16:35.242	2026-06-24 16:16:35.242
22004	野球	やきゅう	yakyu	bóng chày (～をします：chơi bóng chày)	9	2026-06-24 16:16:35.244	2026-06-24 16:16:35.244
22005	\N	ダンス	dansu	nhảy, khiêu vũ (～をします：nhảy, khiêu vũ)	9	2026-06-24 16:16:35.246	2026-06-24 16:16:35.246
22006	旅行	りょこう	ryoko	trip, tour (～［を］します : travel, make a trip)	9	2026-06-24 16:16:35.249	2026-06-24 16:16:35.249
22007	音楽	おんがく	ongaku	âm nhạc	9	2026-06-24 16:16:35.253	2026-06-24 16:16:35.253
22008	歌	うた	uta	bài hát	9	2026-06-24 16:16:35.256	2026-06-24 16:16:35.256
22009	\N	クラシック	kurashikku	nhạc cổ điển	9	2026-06-24 16:16:35.259	2026-06-24 16:16:35.259
22010	\N	ジャズ	jazu	nhạc jazz	9	2026-06-24 16:16:35.261	2026-06-24 16:16:35.261
22011	\N	コンサート	konsato	buổi hòa nhạc	9	2026-06-24 16:16:35.262	2026-06-24 16:16:35.262
22012	\N	カラオケ	karaoke	karaoke	9	2026-06-24 16:16:35.264	2026-06-24 16:16:35.264
22013	歌舞伎	かぶき	kabuki	kịch Kabuki (một loại ca kịch truyền thống của Nhật)	9	2026-06-24 16:16:35.268	2026-06-24 16:16:35.268
22014	絵	え	e	Tranh, hội họa	9	2026-06-24 16:16:35.271	2026-06-24 16:16:35.271
22015	字	じ	ji	chữ	9	2026-06-24 16:16:35.273	2026-06-24 16:16:35.273
22016	漢字	かんじ	kanji	chữ hán	9	2026-06-24 16:16:35.275	2026-06-24 16:16:35.275
22017	\N	ひらがな	hiragana	chữ Hiragana	9	2026-06-24 16:16:35.276	2026-06-24 16:16:35.276
22018	\N	かたかな	katakana	Chữ Katakana	9	2026-06-24 16:16:35.278	2026-06-24 16:16:35.278
22019	ローマ字	ローマじ	romaji	chữ La Mã	9	2026-06-24 16:16:35.279	2026-06-24 16:16:35.279
22020	細かい お金	こまかい おかね	komakai okane	tiền lẻ	9	2026-06-24 16:16:35.282	2026-06-24 16:16:35.282
22021	\N	チケット	chiketto	vé (xem hòa nhạc, xem phim)	9	2026-06-24 16:16:35.286	2026-06-24 16:16:35.286
22022	時間	じかん	jikan	thời gian	9	2026-06-24 16:16:35.288	2026-06-24 16:16:35.288
22023	用事	ようじ	yoji	việc bận, công chuyện	9	2026-06-24 16:16:35.29	2026-06-24 16:16:35.29
22024	約束	やくそく	yakusoku	cuộc hẹn, lời hứa	9	2026-06-24 16:16:35.291	2026-06-24 16:16:35.291
22025	\N	アルバイト	arubaito	side job (～を します : work part-time)	9	2026-06-24 16:16:35.293	2026-06-24 16:16:35.293
22026	ご主人	ごしゅじん	goshujin	chồng (dùng khi nói về chồng người khác)	9	2026-06-24 16:16:35.294	2026-06-24 16:16:35.294
22027	夫／主人	おっと／しゅじん	otto/shujin	(my) husband	9	2026-06-24 16:16:35.296	2026-06-24 16:16:35.296
22028	奥さん	おくさん	okusan	vợ (dùng khi nói về vợ người khác)	9	2026-06-24 16:16:35.3	2026-06-24 16:16:35.3
22029	妻／家内	つま／かない	tsuma/kanai	(my) wife	9	2026-06-24 16:16:35.303	2026-06-24 16:16:35.303
22030	子ども	こども	kodomo	con cái	9	2026-06-24 16:16:35.305	2026-06-24 16:16:35.305
22031	\N	よく	yoku	tốt, rõ (chỉ mức độ)	9	2026-06-24 16:16:35.306	2026-06-24 16:16:35.306
22032	\N	だいたい	daitai	đại khái, đại thể	9	2026-06-24 16:16:35.308	2026-06-24 16:16:35.308
22033	\N	たくさん	takusan	nhiều	9	2026-06-24 16:16:35.309	2026-06-24 16:16:35.309
22034	少し	すこし	sukoshi	ít, một ít	9	2026-06-24 16:16:35.311	2026-06-24 16:16:35.311
22035	全然	ぜんぜん	zenzen	hoàn toàn ~ không	9	2026-06-24 16:16:35.313	2026-06-24 16:16:35.313
22036	早く、速く	はやく	hayaku	sớm, nhanh	9	2026-06-24 16:16:35.315	2026-06-24 16:16:35.315
22037	\N	～から	~kara	vì ~, do	9	2026-06-24 16:16:35.321	2026-06-24 16:16:35.321
22038	\N	どうして	doshite	tại sao	9	2026-06-24 16:16:35.323	2026-06-24 16:16:35.323
22039	貸して ください。	かして ください。	kashite kudasai.	Please lend (it to me)	9	2026-06-24 16:16:35.325	2026-06-24 16:16:35.325
22040	\N	いいですよ。	iidesuyo.	Sure./Certainly.	9	2026-06-24 16:16:35.327	2026-06-24 16:16:35.327
22041	残念です［が］	ざんねんです［が］	zannendesu [ga]	Thật đáng tiếc nhỉ/ buồn nhỉ	9	2026-06-24 16:16:35.329	2026-06-24 16:16:35.329
22042	\N	ああ	a	a (cách nói khi đã gặp được đúng người trên điện thoại)	9	2026-06-24 16:16:35.331	2026-06-24 16:16:35.331
22043	\N	いっしょに いかがですか。	isshoni ikagadesuka.	Anh/chị cùng ~ (làm cái gì đó) với chúng tôi được không?	9	2026-06-24 16:16:35.335	2026-06-24 16:16:35.335
22044	\N	［～は］ちょっと……。	[~wa] chotto…….	[～] is a bit difficult. (a euphemism used when declining an invitation)	9	2026-06-24 16:16:35.338	2026-06-24 16:16:35.338
22045	\N	だめですか。	damedesuka.	Không được à?	9	2026-06-24 16:16:35.341	2026-06-24 16:16:35.341
22046	また 今度 お願いします。	また こんど おねがいします。	mata kondo onegaishimasu.	hẹn lần sau	9	2026-06-24 16:16:35.343	2026-06-24 16:16:35.343
22047	残念です［ね］。	ざんねんです［ね］。	zannendesu [ne].	I'm sorry (to hear that)./That's a pity.	9	2026-06-24 16:16:35.346	2026-06-24 16:16:35.346
22048	\N	すみません。	sumimasen.	Xin lỗi	9	2026-06-24 16:16:35.349	2026-06-24 16:16:35.349
22049	\N	もしもし	moshimoshi	alo (gọi điện thoại)	9	2026-06-24 16:16:35.353	2026-06-24 16:16:35.353
22050	小沢征爾	おざわせいじ	ozawaseiji	famous Japanese conductor (1935-)	9	2026-06-24 16:16:35.356	2026-06-24 16:16:35.356
22051	\N	あります	arimasu	có ( tồn tại, dùng cho đồ vật)	10	2026-06-24 16:16:35.456	2026-06-24 16:16:35.456
22052	\N	います	imasu	có, ở (tồn tại, dùng cho người và động vật)	10	2026-06-24 16:16:35.459	2026-06-24 16:16:35.459
22053	\N	いろいろ［な］	iroiro [na]	nhiều, đa dạng	10	2026-06-24 16:16:35.461	2026-06-24 16:16:35.461
22054	男の 人	おとこの ひと	otokono hito	người đàn ông	10	2026-06-24 16:16:35.465	2026-06-24 16:16:35.465
22055	女の 人	おんなの ひと	onnano hito	người đàn bà	10	2026-06-24 16:16:35.468	2026-06-24 16:16:35.468
22056	男の 子	おとこの こ	otokono ko	cậu con trai	10	2026-06-24 16:16:35.472	2026-06-24 16:16:35.472
22057	女の 子	おんなの こ	onnano ko	cô con gái	10	2026-06-24 16:16:35.475	2026-06-24 16:16:35.475
22058	犬	いぬ	inu	con chó	10	2026-06-24 16:16:35.478	2026-06-24 16:16:35.478
22059	猫	ねこ	neko	con mèo	10	2026-06-24 16:16:35.481	2026-06-24 16:16:35.481
22060	\N	パンダ	panda	panda	10	2026-06-24 16:16:35.484	2026-06-24 16:16:35.484
22061	象	ぞう	zo	elephant	10	2026-06-24 16:16:35.487	2026-06-24 16:16:35.487
22062	木	き	ki	cây, gỗ	10	2026-06-24 16:16:35.49	2026-06-24 16:16:35.49
22063	物	もの	mono	vật, đồ vật	10	2026-06-24 16:16:35.492	2026-06-24 16:16:35.492
22064	電池	でんち	denchi	cục Pin	10	2026-06-24 16:16:35.494	2026-06-24 16:16:35.494
22065	箱	はこ	hako	cái hộp	10	2026-06-24 16:16:35.496	2026-06-24 16:16:35.496
22066	\N	スイッチ	suitchi	công tắc	10	2026-06-24 16:16:35.498	2026-06-24 16:16:35.498
22067	冷蔵庫	れいぞうこ	reizoko	tủ lạnh	10	2026-06-24 16:16:35.501	2026-06-24 16:16:35.501
22068	\N	テーブル	teburu	bàn	10	2026-06-24 16:16:35.503	2026-06-24 16:16:35.503
22069	\N	ベッド	beddo	giường	10	2026-06-24 16:16:35.505	2026-06-24 16:16:35.505
22070	棚	たな	tana	giá sách	10	2026-06-24 16:16:35.507	2026-06-24 16:16:35.507
22071	\N	ドア	doa	cửa	10	2026-06-24 16:16:35.509	2026-06-24 16:16:35.509
22072	窓	まど	mado	cửa sổ	10	2026-06-24 16:16:35.511	2026-06-24 16:16:35.511
22073	\N	ポスト	posuto	hộp thư	10	2026-06-24 16:16:35.513	2026-06-24 16:16:35.513
22074	\N	ビル	biru	toà nhà	10	2026-06-24 16:16:35.515	2026-06-24 16:16:35.515
22075	\N	ATM	ATM	cash machine, ATM (Automatic Teller Machine)	10	2026-06-24 16:16:35.519	2026-06-24 16:16:35.519
22076	\N	コンビニ	konbini	convenience store	10	2026-06-24 16:16:35.521	2026-06-24 16:16:35.521
22077	公園	こうえん	koen	công viên	10	2026-06-24 16:16:35.523	2026-06-24 16:16:35.523
22078	喫茶店	きっさてん	kissaten	quán giải khát, quán caffee	10	2026-06-24 16:16:35.525	2026-06-24 16:16:35.525
22079	～屋	～や	~ya	hiệu ~, cửa hàng ~	10	2026-06-24 16:16:35.527	2026-06-24 16:16:35.527
22080	乗り場	のりば	noriba	bến xe, điểm lên xuống xe	10	2026-06-24 16:16:35.529	2026-06-24 16:16:35.529
22081	県	けん	ken	tỉnh	10	2026-06-24 16:16:35.531	2026-06-24 16:16:35.531
22082	上	うえ	ue	trên	10	2026-06-24 16:16:35.534	2026-06-24 16:16:35.534
22083	下	した	shita	dưới	10	2026-06-24 16:16:35.536	2026-06-24 16:16:35.536
22084	前	まえ	mae	trước	10	2026-06-24 16:16:35.538	2026-06-24 16:16:35.538
22085	\N	うしろ	ushiro	sau	10	2026-06-24 16:16:35.54	2026-06-24 16:16:35.54
22086	右	みぎ	migi	bên phải	10	2026-06-24 16:16:35.542	2026-06-24 16:16:35.542
22087	左	ひだり	hidari	bên trái	10	2026-06-24 16:16:35.543	2026-06-24 16:16:35.543
22088	中	なか	naka	trong, giữa	10	2026-06-24 16:16:35.545	2026-06-24 16:16:35.545
22089	外	そと	soto	ngoài	10	2026-06-24 16:16:35.548	2026-06-24 16:16:35.548
22090	隣	となり	tonari	bên cạnh	10	2026-06-24 16:16:35.55	2026-06-24 16:16:35.55
22091	近く	ちかく	chikaku	gần, chỗ gần đây	10	2026-06-24 16:16:35.553	2026-06-24 16:16:35.553
22092	間	あいだ	aida	giữa	10	2026-06-24 16:16:35.555	2026-06-24 16:16:35.555
22093	\N	～や ～［など］	~ya ~ [nado]	～, ～, and so on	10	2026-06-24 16:16:35.557	2026-06-24 16:16:35.557
22094	\N	［どうも］すみません。	[domo] sumimasen.	Thank you.	10	2026-06-24 16:16:35.559	2026-06-24 16:16:35.559
22095	\N	ナンプラー	nanpura	nam pla	10	2026-06-24 16:16:35.561	2026-06-24 16:16:35.561
22096	\N	コーナー	kona	corner, section	10	2026-06-24 16:16:35.564	2026-06-24 16:16:35.564
22097	いちばん 下	いちばん した	ichiban shita	the bottom	10	2026-06-24 16:16:35.568	2026-06-24 16:16:35.568
22098	東京 ディズニーランド	とうきょう ディズニーランド	tokyo dizuniirando	Tokyo Disneyland	10	2026-06-24 16:16:35.572	2026-06-24 16:16:35.572
22099	\N	アジアストア	ajiasutoa	a fictitious supermarket	10	2026-06-24 16:16:35.574	2026-06-24 16:16:35.574
22100	\N	フィルム	firumu	phim	10	2026-06-24 16:16:35.576	2026-06-24 16:16:35.576
22101	本屋	ほんや	hon'ya	hiệu sách	10	2026-06-24 16:16:35.578	2026-06-24 16:16:35.578
22102	\N	いちばん ～	ichiban ~	~ nhất (いちばん うえ：vị trí cao nhất)	10	2026-06-24 16:16:35.58	2026-06-24 16:16:35.58
22103	－段目	－だんめ	~danme	the -th shelf (だん is the counter for shelves)	10	2026-06-24 16:16:35.584	2026-06-24 16:16:35.584
22104	\N	チリソース	chirisosu	tương ớt (chili sauce)	10	2026-06-24 16:16:35.586	2026-06-24 16:16:35.586
22105	奥	おく	oku	the back	10	2026-06-24 16:16:35.588	2026-06-24 16:16:35.588
22106	\N	スパイス・コーナー	supaisu kona	spice corner	10	2026-06-24 16:16:35.59	2026-06-24 16:16:35.59
22107	\N	ユニューア・ストア	yunyua sutoa	fictitious supermarket	10	2026-06-24 16:16:35.591	2026-06-24 16:16:35.591
22108	います［子どもが～］	います［こどもが～］	imasu [kodomoga~]	có (động vật)	11	2026-06-24 16:16:35.693	2026-06-24 16:16:35.693
22109	います［日本に～］	います［にほんに～］	imasu [nihonni~]	có (động vật)	11	2026-06-24 16:16:35.695	2026-06-24 16:16:35.695
22110	\N	かかります	kakarimasu	mất, tốn (thời gian, tiền bạc)	11	2026-06-24 16:16:35.696	2026-06-24 16:16:35.696
22111	休みます［会社を～］	やすみます［かいしゃを～］	yasumimasu [kaishawo~]	nghỉ ngơi, nghỉ	11	2026-06-24 16:16:35.699	2026-06-24 16:16:35.699
22112	１つ	ひとつ	hitotsu	1 cái (đồ vật)	11	2026-06-24 16:16:35.7	2026-06-24 16:16:35.7
22113	２つ	ふたつ	futatsu	2 cái	11	2026-06-24 16:16:35.702	2026-06-24 16:16:35.702
22114	３つ	みっつ	mittsu	3 cái	11	2026-06-24 16:16:35.704	2026-06-24 16:16:35.704
22115	４つ	よっつ	yottsu	4 cái	11	2026-06-24 16:16:35.706	2026-06-24 16:16:35.706
22116	５つ	いつつ	itsutsu	5 cái	11	2026-06-24 16:16:35.707	2026-06-24 16:16:35.707
22117	６つ	むっつ	muttsu	6 cái	11	2026-06-24 16:16:35.708	2026-06-24 16:16:35.708
22118	７つ	ななつ	nanatsu	7 cái	11	2026-06-24 16:16:35.71	2026-06-24 16:16:35.71
22119	８つ	やっつ	yattsu	8 cái	11	2026-06-24 16:16:35.711	2026-06-24 16:16:35.711
22120	９つ	ここのつ	kokonotsu	9 cái	11	2026-06-24 16:16:35.712	2026-06-24 16:16:35.712
22121	１０	とお	too	10 cái	11	2026-06-24 16:16:35.715	2026-06-24 16:16:35.715
22122	\N	いくつ	ikutsu	bao nhiêu cái	11	2026-06-24 16:16:35.717	2026-06-24 16:16:35.717
22123	１人	ひとり	hitori	1 người	11	2026-06-24 16:16:35.719	2026-06-24 16:16:35.719
22124	２人	ふたり	futari	2 người	11	2026-06-24 16:16:35.72	2026-06-24 16:16:35.72
22125	－人	－にん	-nin	－ people	11	2026-06-24 16:16:35.722	2026-06-24 16:16:35.722
22126	－台	－だい	-dai	(counter for machines, cars, etc.)	11	2026-06-24 16:16:35.723	2026-06-24 16:16:35.723
22127	－枚	－まい	-mai	(counter for paper, stamps, etc.)	11	2026-06-24 16:16:35.725	2026-06-24 16:16:35.725
22128	－回	－かい	-kai	－ times	11	2026-06-24 16:16:35.726	2026-06-24 16:16:35.726
22129	\N	りんご	ringo	quả táo	11	2026-06-24 16:16:35.728	2026-06-24 16:16:35.728
22130	\N	みかん	mikan	quýt	11	2026-06-24 16:16:35.73	2026-06-24 16:16:35.73
22131	\N	サンドイッチ	sandoitchi	bánh sandwich	11	2026-06-24 16:16:35.732	2026-06-24 16:16:35.732
22132	\N	カレー［ライス］	kare [raisu]	cà ri (cơm)	11	2026-06-24 16:16:35.736	2026-06-24 16:16:35.736
22133	\N	アイスクリーム	aisukuriimu	kem	11	2026-06-24 16:16:35.738	2026-06-24 16:16:35.738
22134	切手	きって	kitte	tem	11	2026-06-24 16:16:35.74	2026-06-24 16:16:35.74
22135	\N	はがき	hagaki	bưu thiếp	11	2026-06-24 16:16:35.741	2026-06-24 16:16:35.741
22136	封筒	ふうとう	futo	phong bì	11	2026-06-24 16:16:35.743	2026-06-24 16:16:35.743
22137	両親	りょうしん	ryoshin	bố mẹ	11	2026-06-24 16:16:35.744	2026-06-24 16:16:35.744
22138	兄弟	きょうだい	kyodai	anh em	11	2026-06-24 16:16:35.746	2026-06-24 16:16:35.746
22139	兄	あに	ani	anh trai (tôi)	11	2026-06-24 16:16:35.749	2026-06-24 16:16:35.749
22140	お兄さん	おにいさん	oniisan	anh trai (bạn)	11	2026-06-24 16:16:35.752	2026-06-24 16:16:35.752
22141	姉	あね	ane	chị gái (tôi)	11	2026-06-24 16:16:35.754	2026-06-24 16:16:35.754
22142	お姉さん	おねえさん	onesan	chị gái (bạn)	11	2026-06-24 16:16:35.755	2026-06-24 16:16:35.755
22143	弟	おとうと	ototo	em trai (tôi)	11	2026-06-24 16:16:35.757	2026-06-24 16:16:35.757
22144	弟さん	おとうとさん	ototosan	em trai (bạn)	11	2026-06-24 16:16:35.759	2026-06-24 16:16:35.759
22145	妹	いもうと	imoto	em gái (tôi)	11	2026-06-24 16:16:35.761	2026-06-24 16:16:35.761
22146	妹さん	いもうとさん	imotosan	em gái (bạn）	11	2026-06-24 16:16:35.763	2026-06-24 16:16:35.763
22147	外国	がいこく	gaikoku	nước ngoài	11	2026-06-24 16:16:35.767	2026-06-24 16:16:35.767
22148	留学生	りゅうがくせい	ryugakusei	foreign student	11	2026-06-24 16:16:35.77	2026-06-24 16:16:35.77
22149	\N	クラス	kurasu	class	11	2026-06-24 16:16:35.772	2026-06-24 16:16:35.772
22150	－時間	－じかん	-jikan	－ hour(s)	11	2026-06-24 16:16:35.774	2026-06-24 16:16:35.774
22151	－週間	－しゅうかん	-shukan	－ week(s)	11	2026-06-24 16:16:35.776	2026-06-24 16:16:35.776
22152	－か月	－かげつ	-kagetsu	－ month(s)	11	2026-06-24 16:16:35.778	2026-06-24 16:16:35.778
22153	－年	－ねん	-nen	－ year(s)	11	2026-06-24 16:16:35.781	2026-06-24 16:16:35.781
22154	\N	～ぐらい	~gurai	khoảng～	11	2026-06-24 16:16:35.785	2026-06-24 16:16:35.785
22155	\N	どのくらい	donokurai	bao lâu	11	2026-06-24 16:16:35.788	2026-06-24 16:16:35.788
22156	全部で	ぜんぶで	zenbude	tất cả, toàn bộ	11	2026-06-24 16:16:35.79	2026-06-24 16:16:35.79
22157	\N	みんな	minna	mọi người	11	2026-06-24 16:16:35.793	2026-06-24 16:16:35.793
22158	\N	～だけ	~dake	～chỉ	11	2026-06-24 16:16:35.796	2026-06-24 16:16:35.796
22159	\N	かしこまりました。	kashikomarimashita.	Certainly, (Sir/Madam)	11	2026-06-24 16:16:35.799	2026-06-24 16:16:35.799
22160	いい［お］天気ですね。	いい［お］てんきですね。	ii [o] tenkidesune.	Nice weather, isn't it?	11	2026-06-24 16:16:35.802	2026-06-24 16:16:35.802
22161	お出かけですか。	おでかけですか。	odekakedesuka.	đi ra ngoài đấy hả ?	11	2026-06-24 16:16:35.805	2026-06-24 16:16:35.805
22162	\N	ちょっと ～まで。	chotto ~made.	đến～một chút	11	2026-06-24 16:16:35.807	2026-06-24 16:16:35.807
22163	行ってらっしゃい。	いってらっしゃい。	itterasshai.	See you later./So long. (lit. Go and come back.)	11	2026-06-24 16:16:35.809	2026-06-24 16:16:35.809
22164	行って きます。	いって きます。	itte kimasu.	(tôi) đi đây	11	2026-06-24 16:16:35.811	2026-06-24 16:16:35.811
22165	船便	ふなびん	funabin	gửi bằng đường tàu	11	2026-06-24 16:16:35.814	2026-06-24 16:16:35.814
22166	航空便（エアメール）	こうくうびん（エアメール）	kokubin (eameru)	(gửi bằng) đường hàng không	11	2026-06-24 16:16:35.819	2026-06-24 16:16:35.819
22167	お願いします。	おねがいします。	onegaishimasu.	Please. (lit. ask for a favour)	11	2026-06-24 16:16:35.825	2026-06-24 16:16:35.825
22168	\N	オーストラリア	osutoraria	nước Úc	11	2026-06-24 16:16:35.829	2026-06-24 16:16:35.829
22169	速達	そくたつ	sokutatsu	chuyển phát nhanh	11	2026-06-24 16:16:35.833	2026-06-24 16:16:35.833
22170	書留	かきとめ	kakitome	gửi bảo đảm	11	2026-06-24 16:16:35.837	2026-06-24 16:16:35.837
22171	\N	いらっしゃいませ。	irasshaimase.	xin mời qúy khách	11	2026-06-24 16:16:35.839	2026-06-24 16:16:35.839
22172	行って まいります。	いって まいります。	itte mairimasu.	(tôi) đi đây (lịch sự hơn)	11	2026-06-24 16:16:35.843	2026-06-24 16:16:35.843
22173	\N	それから	sorekara	sau đó	11	2026-06-24 16:16:35.846	2026-06-24 16:16:35.846
22174	簡単［な］	かんたん［な］	kantan [na]	easy, simple	12	2026-06-24 16:16:35.899	2026-06-24 16:16:35.899
22175	近い	ちかい	chikai	gần	12	2026-06-24 16:16:35.901	2026-06-24 16:16:35.901
22176	遠い	とおい	toi	xa	12	2026-06-24 16:16:35.903	2026-06-24 16:16:35.903
22177	速い、早い	はやい	hayai	nhanh, sớm	12	2026-06-24 16:16:35.904	2026-06-24 16:16:35.904
22178	遅い	おそい	osoi	chậm, muộn	12	2026-06-24 16:16:35.906	2026-06-24 16:16:35.906
22179	多い［人が～］	おおい［ひとが～］	oi [hitoga~]	nhiều [người]	12	2026-06-24 16:16:35.907	2026-06-24 16:16:35.907
22180	少ない［人が～］	すくない［ひとが～］	sukunai [hitoga~]	ít [người]	12	2026-06-24 16:16:35.909	2026-06-24 16:16:35.909
22181	暖かい、温かい	あたたかい	atatakai	ấm	12	2026-06-24 16:16:35.911	2026-06-24 16:16:35.911
22182	涼しい	すずしい	suzushii	mát	12	2026-06-24 16:16:35.913	2026-06-24 16:16:35.913
22183	甘い	あまい	amai	ngọt	12	2026-06-24 16:16:35.916	2026-06-24 16:16:35.916
22184	辛い	からい	karai	cay	12	2026-06-24 16:16:35.918	2026-06-24 16:16:35.918
22185	重い	おもい	omoi	nặng	12	2026-06-24 16:16:35.921	2026-06-24 16:16:35.921
22186	軽い	かるい	karui	nhẹ	12	2026-06-24 16:16:35.923	2026-06-24 16:16:35.923
22187	\N	いい［コーヒーが～］	ii [kohiiga~]	thích, chọn, dùng	12	2026-06-24 16:16:35.925	2026-06-24 16:16:35.925
22188	季節	きせつ	kisetsu	mùa	12	2026-06-24 16:16:35.927	2026-06-24 16:16:35.927
22189	春	はる	haru	mùa xuân	12	2026-06-24 16:16:35.929	2026-06-24 16:16:35.929
22190	夏	なつ	natsu	mùa hạ	12	2026-06-24 16:16:35.931	2026-06-24 16:16:35.931
22191	秋	あき	aki	mùa thu	12	2026-06-24 16:16:35.933	2026-06-24 16:16:35.933
22192	冬	ふゆ	fuyu	mùa đông	12	2026-06-24 16:16:35.936	2026-06-24 16:16:35.936
22193	天気	てんき	tenki	thời tiết	12	2026-06-24 16:16:35.938	2026-06-24 16:16:35.938
22194	雨	あめ	ame	mưa	12	2026-06-24 16:16:35.94	2026-06-24 16:16:35.94
22195	雪	ゆき	yuki	tuyết	12	2026-06-24 16:16:35.941	2026-06-24 16:16:35.941
22196	曇り	くもり	kumori	có mây	12	2026-06-24 16:16:35.943	2026-06-24 16:16:35.943
22197	\N	ホテル	hoteru	khách sạn	12	2026-06-24 16:16:35.945	2026-06-24 16:16:35.945
22198	空港	くうこう	kuko	sân bay	12	2026-06-24 16:16:35.948	2026-06-24 16:16:35.948
22199	海	うみ	umi	biển, đại dương	12	2026-06-24 16:16:35.951	2026-06-24 16:16:35.951
22200	世界	せかい	sekai	thế giới	12	2026-06-24 16:16:35.953	2026-06-24 16:16:35.953
22201	\N	パーティー	pateii	tiệc (~をします：tổ chức tiệc)	12	2026-06-24 16:16:35.955	2026-06-24 16:16:35.955
22202	［お］祭り	［お］まつり	[o] matsuri	festival	12	2026-06-24 16:16:35.957	2026-06-24 16:16:35.957
22203	すき焼き	すきやき	sukiyaki	Sukiyaki (món thịt bò nấu rau)	12	2026-06-24 16:16:35.959	2026-06-24 16:16:35.959
22204	刺身	さしみ	sashimi	Sashimi (món gỏi cá sống)	12	2026-06-24 16:16:35.961	2026-06-24 16:16:35.961
22205	\N	［お］すし	[o] sushi	Sushi	12	2026-06-24 16:16:35.963	2026-06-24 16:16:35.963
22206	\N	てんぷら	tenpura	Tempura (món hải sản và rau chiên tẩm bột	12	2026-06-24 16:16:35.966	2026-06-24 16:16:35.966
22207	豚肉	ぶたにく	butaniku	pork	12	2026-06-24 16:16:35.969	2026-06-24 16:16:35.969
22208	とり肉	とりにく	toriniku	chicken	12	2026-06-24 16:16:35.971	2026-06-24 16:16:35.971
22209	牛肉	ぎゅうにく	gyuniku	beef	12	2026-06-24 16:16:35.973	2026-06-24 16:16:35.973
22210	\N	レモン	remon	lemon	12	2026-06-24 16:16:35.975	2026-06-24 16:16:35.975
22211	生け花	いけばな	ikebana	Nghệ thuật cắm hoa (～をします：cắm hoa)	12	2026-06-24 16:16:35.978	2026-06-24 16:16:35.978
22212	紅葉	もみじ	momiji	lá đỏ	12	2026-06-24 16:16:35.981	2026-06-24 16:16:35.981
22213	何方	どちら	dochira	cái nào	12	2026-06-24 16:16:35.984	2026-06-24 16:16:35.984
22214	\N	どちらも	dochiramo	cả hai	12	2026-06-24 16:16:35.987	2026-06-24 16:16:35.987
22215	\N	いちばん	ichiban	the most	12	2026-06-24 16:16:35.99	2026-06-24 16:16:35.99
22216	\N	ずっと	zutto	(hơn) hẳn (dùng để nhấn mạnh sự khác biệt giữa hai đối tượng)	12	2026-06-24 16:16:35.992	2026-06-24 16:16:35.992
22217	初めて	はじめて	hajimete	lần đầu tiên	12	2026-06-24 16:16:35.995	2026-06-24 16:16:35.995
22218	\N	ただいま。	tadaima.	I'm home.	12	2026-06-24 16:16:35.999	2026-06-24 16:16:35.999
22219	お帰りなさい。	おかえりなさい。	okaerinasai.	Welcome home	12	2026-06-24 16:16:36.002	2026-06-24 16:16:36.002
22220	わあ、すごい 人ですね。	わあ、すごい ひとですね。	wa, sugoi hitodesune.	Wow! Look at all those people!	12	2026-06-24 16:16:36.005	2026-06-24 16:16:36.005
22221	疲れました。	つかれました。	tsukaremashita.	Tôi mệt rồi, mệt mỏi	12	2026-06-24 16:16:36.008	2026-06-24 16:16:36.008
22222	祇園祭	ぎおんまつり	gionmatsuri	the Gion Festival (the most famous festival in Kyoto)	12	2026-06-24 16:16:36.011	2026-06-24 16:16:36.011
22223	香港	ホンコン	honkon	Hong Kong (香港)	12	2026-06-24 16:16:36.015	2026-06-24 16:16:36.015
22224	\N	シンガポール	shingaporu	Singapore	12	2026-06-24 16:16:36.018	2026-06-24 16:16:36.018
22225	\N	ABC ストア	ABC sutoa	a fictitious supermarket	12	2026-06-24 16:16:36.021	2026-06-24 16:16:36.021
22226	\N	ジャパン	japan	a fictitious supermarket	12	2026-06-24 16:16:36.024	2026-06-24 16:16:36.024
22227	試験	しけん	shiken	kỳ thi, bài thi	12	2026-06-24 16:16:36.027	2026-06-24 16:16:36.027
22228	\N	すごいですね。	sugoidesune.	ngạc nhiên/ hay quá nhỉ.	12	2026-06-24 16:16:36.03	2026-06-24 16:16:36.03
22229	\N	でも	demo	Nhưng	12	2026-06-24 16:16:36.033	2026-06-24 16:16:36.033
22230	毎日屋	まいにちや	mainichiya	fictitious supermarket	12	2026-06-24 16:16:36.035	2026-06-24 16:16:36.035
22231	遊びます	あそびます	asobimasu	chơi	13	2026-06-24 16:16:36.138	2026-06-24 16:16:36.138
22232	泳ぎます	およぎます	oyogimasu	bơi lội	13	2026-06-24 16:16:36.141	2026-06-24 16:16:36.141
22233	迎えます	むかえます	mukaemasu	đón	13	2026-06-24 16:16:36.143	2026-06-24 16:16:36.143
22234	疲れます	つかれます	tsukaremasu	mệt mỏi	13	2026-06-24 16:16:36.145	2026-06-24 16:16:36.145
22235	結婚します	けっこんします	kekkonshimasu	kết hôn	13	2026-06-24 16:16:36.147	2026-06-24 16:16:36.147
22236	買い物します	かいものします	kaimonoshimasu	mua sắm	13	2026-06-24 16:16:36.149	2026-06-24 16:16:36.149
22237	食事します	しょくじします	shokujishimasu	dùng bữa, ăn cơm	13	2026-06-24 16:16:36.151	2026-06-24 16:16:36.151
22238	散歩します［公園を～］	さんぽします［こうえんを～］	sanposhimasu [koenwo~]	đi dạo	13	2026-06-24 16:16:36.153	2026-06-24 16:16:36.153
22239	大変［な］	たいへん［な］	taihen [na]	hard, tough, severe, awful	13	2026-06-24 16:16:36.154	2026-06-24 16:16:36.154
22240	欲しい	ほしい	hoshii	muốn	13	2026-06-24 16:16:36.156	2026-06-24 16:16:36.156
22241	広い	ひろい	hiroi	rộng	13	2026-06-24 16:16:36.157	2026-06-24 16:16:36.157
22242	狭い	せまい	semai	hẹp	13	2026-06-24 16:16:36.159	2026-06-24 16:16:36.159
22243	\N	プール	puru	hồ bơi	13	2026-06-24 16:16:36.16	2026-06-24 16:16:36.16
22244	川	かわ	kawa	sông, dòng sông	13	2026-06-24 16:16:36.161	2026-06-24 16:16:36.161
22245	美術	びじゅつ	bijutsu	mỹ thuật	13	2026-06-24 16:16:36.163	2026-06-24 16:16:36.163
22246	釣り	つり	tsuri	việc câu cá	13	2026-06-24 16:16:36.166	2026-06-24 16:16:36.166
22247	\N	スキー	sukii	trượt tuyết	13	2026-06-24 16:16:36.167	2026-06-24 16:16:36.167
22248	週末	しゅうまつ	shumatsu	cuối tuần	13	2026-06-24 16:16:36.169	2026-06-24 16:16:36.169
22249	［お］正月	［お］しょうがつ	[o] shogatsu	New Year's Day	13	2026-06-24 16:16:36.171	2026-06-24 16:16:36.171
22250	\N	～ごろ	~goro	about ～ (time)	13	2026-06-24 16:16:36.172	2026-06-24 16:16:36.172
22251	何か	なにか	nanika	cái gì đó	13	2026-06-24 16:16:36.174	2026-06-24 16:16:36.174
22252	\N	どこか	dokoka	chỗ nào đó	13	2026-06-24 16:16:36.175	2026-06-24 16:16:36.175
22253	\N	のどが かわきます	nodoga kawakimasu	get thirsty (when expressing the condition of being thirsty, のどが かわきました is used)	13	2026-06-24 16:16:36.177	2026-06-24 16:16:36.177
22254	\N	おなかが すきます	onakaga sukimasu	get hungry (when expressing the condition of being hungry, おなかが すきました is used)	13	2026-06-24 16:16:36.179	2026-06-24 16:16:36.179
22255	\N	そう しましょう。	so shimashou.	làm như vậy nhé	13	2026-06-24 16:16:36.182	2026-06-24 16:16:36.182
22256	ご注文は？	ごちゅうもんは？	gochumonwa?	May I take your order?	13	2026-06-24 16:16:36.184	2026-06-24 16:16:36.184
22257	定食	ていしょく	teishoku	cơm suất, cơm phần	13	2026-06-24 16:16:36.186	2026-06-24 16:16:36.186
22258	牛どん	ぎゅうどん	gyuudon	cơm thịt bò	13	2026-06-24 16:16:36.188	2026-06-24 16:16:36.188
22259	［少々］お待ち ください。	［しょうしょう］おまち ください。	[shosho] omachi kudasai.	Please wait [a moment].	13	2026-06-24 16:16:36.19	2026-06-24 16:16:36.19
22260	\N	～で ございます。	~de gozaimasu.	(polite equivalent of です)	13	2026-06-24 16:16:36.192	2026-06-24 16:16:36.192
22261	別々に	べつべつに	betsubetsuni	riêng biệt, riêng ra	13	2026-06-24 16:16:36.194	2026-06-24 16:16:36.194
22262	\N	アキックス	akikkusu	a fictitious company	13	2026-06-24 16:16:36.195	2026-06-24 16:16:36.195
22263	\N	おはようテレビ	ohayoterebi	a fictitious TV programme	13	2026-06-24 16:16:36.199	2026-06-24 16:16:36.199
22264	出します［手紙を～］	だします［てがみを～］	dashimasu [tegamiwo~]	giao, nộp	13	2026-06-24 16:16:36.201	2026-06-24 16:16:36.201
22265	入ります［喫茶店に～］	はいります［きっさてんに～］	hairimasu [kissatenni~]	vào, bỏ vào	13	2026-06-24 16:16:36.203	2026-06-24 16:16:36.203
22266	出ます［喫茶店を～］	でます［きっさてんを～］	demasu [kissatenwo~]	đi ra ngoài	13	2026-06-24 16:16:36.205	2026-06-24 16:16:36.205
22267	寂しい	さびしい	sabishii	buồn	13	2026-06-24 16:16:36.207	2026-06-24 16:16:36.207
22268	市役所	しやくしょ	shiyakusho	Văn phòng hành chính quận, thành phố.	13	2026-06-24 16:16:36.209	2026-06-24 16:16:36.209
22269	経済	けいざい	keizai	kinh tế	13	2026-06-24 16:16:36.211	2026-06-24 16:16:36.211
22270	会議	かいぎ	kaigi	hội họp, cuộc họp	13	2026-06-24 16:16:36.215	2026-06-24 16:16:36.215
22271	登録	とうろく	toroku	đăng kí	13	2026-06-24 16:16:36.218	2026-06-24 16:16:36.218
22272	\N	おなかが いっぱいです。	onakaga ippaidesu.	no rồi	13	2026-06-24 16:16:36.22	2026-06-24 16:16:36.22
22273	\N	そうですね。	sodesune.	I agree with you.	13	2026-06-24 16:16:36.223	2026-06-24 16:16:36.223
22274	\N	ロシア	roshia	Russia	13	2026-06-24 16:16:36.225	2026-06-24 16:16:36.225
22275	\N	つるや	tsuruya	fictitious Japanese restaurant	13	2026-06-24 16:16:36.227	2026-06-24 16:16:36.227
22276	\N	つけます	tsukemasu	bật	14	2026-06-24 16:16:36.351	2026-06-24 16:16:36.351
22277	消します	けします	keshimasu	tắt	14	2026-06-24 16:16:36.353	2026-06-24 16:16:36.353
22278	開けます	あけます	akemasu	mở	14	2026-06-24 16:16:36.354	2026-06-24 16:16:36.354
22279	閉めます	しめます	shimemasu	buộc thắt, cột lại	14	2026-06-24 16:16:36.356	2026-06-24 16:16:36.356
22280	急ぎます	いそぎます	isogimasu	vội vàng, cấp bách	14	2026-06-24 16:16:36.357	2026-06-24 16:16:36.357
22281	待ちます	まちます	machimasu	chờ đợi	14	2026-06-24 16:16:36.358	2026-06-24 16:16:36.358
22282	持ちます	もちます	mochimasu	cầm, nắm	14	2026-06-24 16:16:36.36	2026-06-24 16:16:36.36
22283	取ります	とります	torimasu	bắt, chụp hình, lấy	14	2026-06-24 16:16:36.361	2026-06-24 16:16:36.361
22284	手伝います	てつだいます	tetsudaimasu	giúp đỡ	14	2026-06-24 16:16:36.362	2026-06-24 16:16:36.362
22285	呼びます	よびます	yobimasu	gọi	14	2026-06-24 16:16:36.364	2026-06-24 16:16:36.364
22286	話します	はなします	hanashimasu	trò chuyện, nói	14	2026-06-24 16:16:36.366	2026-06-24 16:16:36.366
22287	使います	つかいます	tsukaimasu	use	14	2026-06-24 16:16:36.368	2026-06-24 16:16:36.368
22288	止めます	とめます	tomemasu	dừng lại	14	2026-06-24 16:16:36.369	2026-06-24 16:16:36.369
22289	見せます	みせます	misemasu	cho xem	14	2026-06-24 16:16:36.371	2026-06-24 16:16:36.371
22290	教えます［住所を～］	おしえます［じゅうしょを～］	oshiemasu [jushowo~]	dạy	14	2026-06-24 16:16:36.372	2026-06-24 16:16:36.372
22291	座ります	すわります	suwarimasu	sit down	14	2026-06-24 16:16:36.374	2026-06-24 16:16:36.374
22292	立ちます	たちます	tachimasu	stand up	14	2026-06-24 16:16:36.376	2026-06-24 16:16:36.376
22293	入ります［喫茶店に～］	はいります［きっさてんに～］	hairimasu [kissatenni~]	enter [a café]	14	2026-06-24 16:16:36.377	2026-06-24 16:16:36.377
22294	出ます［喫茶店を～］	でます［きっさてんを～］	demasu [kissatenwo~]	go out [of a café]	14	2026-06-24 16:16:36.379	2026-06-24 16:16:36.379
22295	降ります［雨が～］	ふります［あめが～］	furimasu [amega~]	rơi rớt	14	2026-06-24 16:16:36.382	2026-06-24 16:16:36.382
22296	\N	コピーします	kopiishimasu	sao chép	14	2026-06-24 16:16:36.385	2026-06-24 16:16:36.385
22297	電気	でんき	denki	electricity, light	14	2026-06-24 16:16:36.387	2026-06-24 16:16:36.387
22298	\N	エアコン	eakon	điều hòa	14	2026-06-24 16:16:36.389	2026-06-24 16:16:36.389
22299	\N	パスポート	pasupoto	hộ chiếu	14	2026-06-24 16:16:36.391	2026-06-24 16:16:36.391
22300	名前	なまえ	namae	tên	14	2026-06-24 16:16:36.393	2026-06-24 16:16:36.393
22301	住所	じゅうしょ	jusho	địa chỉ	14	2026-06-24 16:16:36.395	2026-06-24 16:16:36.395
22302	地図	ちず	chizu	bản đồ	14	2026-06-24 16:16:36.398	2026-06-24 16:16:36.398
22303	塩	しお	shio	muối	14	2026-06-24 16:16:36.4	2026-06-24 16:16:36.4
22304	砂糖	さとう	sato	đường	14	2026-06-24 16:16:36.403	2026-06-24 16:16:36.403
22305	問題	もんだい	mondai	question, problem, trouble	14	2026-06-24 16:16:36.405	2026-06-24 16:16:36.405
22306	答え	こたえ	kotae	answer	14	2026-06-24 16:16:36.407	2026-06-24 16:16:36.407
22307	読み方	よみかた	yomikata	cách đọc	14	2026-06-24 16:16:36.409	2026-06-24 16:16:36.409
22308	～方	～かた	~kata	how to ～, way of ～ing	14	2026-06-24 16:16:36.411	2026-06-24 16:16:36.411
22309	\N	まっすぐ	massugu	straight	14	2026-06-24 16:16:36.415	2026-06-24 16:16:36.415
22310	\N	ゆっくり	yukkuri	chậm, thong thả	14	2026-06-24 16:16:36.418	2026-06-24 16:16:36.418
22311	\N	すぐ	sugu	ngay, lập tức	14	2026-06-24 16:16:36.421	2026-06-24 16:16:36.421
22312	\N	また	mata	lại	14	2026-06-24 16:16:36.424	2026-06-24 16:16:36.424
22313	\N	あとで	atode	sau	14	2026-06-24 16:16:36.426	2026-06-24 16:16:36.426
22314	もう 少し	もう すこし	mo sukoshi	thêm một chút nữa	14	2026-06-24 16:16:36.428	2026-06-24 16:16:36.428
22315	\N	もう ～	mo ~	～ more, another ～	14	2026-06-24 16:16:36.432	2026-06-24 16:16:36.432
22316	\N	さあ	sa	right (used when encouraging some course of action)	14	2026-06-24 16:16:36.435	2026-06-24 16:16:36.435
22317	\N	あれ？	are？	Oh! Eh? (in surprise or wonder)	14	2026-06-24 16:16:36.437	2026-06-24 16:16:36.437
22318	信号を 右へ 曲がって ください。	しんごうを みぎへ まがって ください。	shingowo migihe magatte kudasai.	Turn right at the traffic lights.	14	2026-06-24 16:16:36.439	2026-06-24 16:16:36.439
22319	これで お願いします。	これで おねがいします。	korede onegaishimasu.	I'd like to pay with this	14	2026-06-24 16:16:36.441	2026-06-24 16:16:36.441
22320	お釣り	おつり	otsuri	change	14	2026-06-24 16:16:36.443	2026-06-24 16:16:36.443
22321	みどり 町	みどり ちょう	midori cho	a fictitious town	14	2026-06-24 16:16:36.446	2026-06-24 16:16:36.446
22322	曲がります［右へ～］	まがります［みぎへ～］	magarimasu [migihe~]	uốn cong, rẽ	14	2026-06-24 16:16:36.449	2026-06-24 16:16:36.449
22323	始めます	はじめます	hajimemasu	bắt đầu	14	2026-06-24 16:16:36.452	2026-06-24 16:16:36.452
22324	\N	いいですよ。	iidesuyo.	Sure./Certainly.	14	2026-06-24 16:16:36.454	2026-06-24 16:16:36.454
22325	梅田	うめだ	umeda	name of a town in Osaka	14	2026-06-24 16:16:36.456	2026-06-24 16:16:36.456
22326	置きます	おきます	okimasu	đặt để	15	2026-06-24 16:16:36.584	2026-06-24 16:16:36.584
22327	作ります、造ります	つくります	tsukurimasu	làm, chế tạo	15	2026-06-24 16:16:36.586	2026-06-24 16:16:36.586
22328	売ります	うります	urimasu	bán	15	2026-06-24 16:16:36.588	2026-06-24 16:16:36.588
22329	知ります	しります	shirimasu	biết	15	2026-06-24 16:16:36.589	2026-06-24 16:16:36.589
22330	住ます	すみます	sumimasu	sống, ở	15	2026-06-24 16:16:36.59	2026-06-24 16:16:36.59
22331	研究します	けんきゅうします	kenkyushimasu	nghiêm cứu	15	2026-06-24 16:16:36.592	2026-06-24 16:16:36.592
22332	資料	しりょう	shiryo	tư liệu, tài liệu	15	2026-06-24 16:16:36.593	2026-06-24 16:16:36.593
22333	\N	カタログ	katarogu	catalog	15	2026-06-24 16:16:36.595	2026-06-24 16:16:36.595
22334	時刻表	じこくひょう	jigokuhyo	bảng ghi thời gian tàu chạy	15	2026-06-24 16:16:36.597	2026-06-24 16:16:36.597
22335	服	ふく	fuku	quần áo	15	2026-06-24 16:16:36.599	2026-06-24 16:16:36.599
22336	製品	せいひん	seihin	sản phẩm	15	2026-06-24 16:16:36.601	2026-06-24 16:16:36.601
22337	\N	ソフト	sofuto	phần mềm	15	2026-06-24 16:16:36.603	2026-06-24 16:16:36.603
22338	電子辞書	でんしじしょ	denshijisho	electronic dictionary	15	2026-06-24 16:16:36.605	2026-06-24 16:16:36.605
22339	経済	けいざい	keizai	economy	15	2026-06-24 16:16:36.607	2026-06-24 16:16:36.607
22340	市役所	しやくしょ	shiyakusho	municipal office, city hall	15	2026-06-24 16:16:36.608	2026-06-24 16:16:36.608
22341	高校	こうこう	koko	senior high school	15	2026-06-24 16:16:36.61	2026-06-24 16:16:36.61
22342	歯医者	はいしゃ	haisha	nha sĩ	15	2026-06-24 16:16:36.612	2026-06-24 16:16:36.612
22343	独身	どくしん	dokushin	độc thân	15	2026-06-24 16:16:36.614	2026-06-24 16:16:36.614
22344	\N	すみません	sumimasen	I'm sorry.	15	2026-06-24 16:16:36.616	2026-06-24 16:16:36.616
22345	皆さん	みなさん	minasan	Ladies and Gentlemen, everybody	15	2026-06-24 16:16:36.618	2026-06-24 16:16:36.618
22346	思い出します	おもいだします	omoidashimasu	remember, recollect	15	2026-06-24 16:16:36.62	2026-06-24 16:16:36.62
22347	\N	いらっしゃいます	irasshaimasu	be (honorific equivalent of います)	15	2026-06-24 16:16:36.622	2026-06-24 16:16:36.622
22348	日本橋	にっぽんばし	nipponbashi	a shopping district in Osaka	15	2026-06-24 16:16:36.624	2026-06-24 16:16:36.624
22349	\N	みんなの インタビュー	minnano intabyu	a fictitious TV programme	15	2026-06-24 16:16:36.626	2026-06-24 16:16:36.626
22350	立ちます	たちます	tachimasu	đứng	15	2026-06-24 16:16:36.628	2026-06-24 16:16:36.628
22351	座ります	すわります	suwarimasu	ngồi	15	2026-06-24 16:16:36.631	2026-06-24 16:16:36.631
22352	使います	つかいます	tsukaimasu	sử dụng	15	2026-06-24 16:16:36.633	2026-06-24 16:16:36.633
22353	知って います	しって います	shitte imasu	biết	15	2026-06-24 16:16:36.635	2026-06-24 16:16:36.635
22354	住んで います［大阪に～］	すんで います［おおさかに～］	sunde imasu [osakani~]	sống	15	2026-06-24 16:16:36.637	2026-06-24 16:16:36.637
22355	専門	せんもん	senmon	chuyên môn	15	2026-06-24 16:16:36.639	2026-06-24 16:16:36.639
22356	床屋	とこや	tokoya	hiệu cắt tóc	15	2026-06-24 16:16:36.641	2026-06-24 16:16:36.641
22357	\N	プレイガイド	pureigaido	quầy bán vé	15	2026-06-24 16:16:36.643	2026-06-24 16:16:36.643
22358	特に	とくに	tokuni	especially	15	2026-06-24 16:16:36.645	2026-06-24 16:16:36.645
22359	ご家族	ごかぞく	gokazoku	your family	15	2026-06-24 16:16:36.647	2026-06-24 16:16:36.647
22360	乗ります［電車に～］	のります［でんしゃに～］	norimasu [denshani~]	Đi lên tàu, xe	16	2026-06-24 16:16:36.761	2026-06-24 16:16:36.761
22361	降ります［電車を～］	おります［でんしゃを～］	orimasu [denshawo~]	xuống tàu ,xe	16	2026-06-24 16:16:36.764	2026-06-24 16:16:36.764
22362	乗り換えます	のりかえます	norikaemasu	chuyển, đổi tàu	16	2026-06-24 16:16:36.767	2026-06-24 16:16:36.767
22363	浴びます［シャワーを～］	あびます［シャワーを～］	abimasu [shawawo~]	tắm	16	2026-06-24 16:16:36.768	2026-06-24 16:16:36.768
22364	入れます	いれます	iremasu	bỏ vào, cho vào	16	2026-06-24 16:16:36.77	2026-06-24 16:16:36.77
22365	出します	だします	dashimasu	Lấy ra, rút tiền	16	2026-06-24 16:16:36.771	2026-06-24 16:16:36.771
22366	下ろします［お金を～］	おろします［おかねを～］	oroshimasu [okanewo~]	withdraw	16	2026-06-24 16:16:36.773	2026-06-24 16:16:36.773
22367	入ります［大学に～］	はいります［だいがくに～］	hairimasu [daigakuni~]	Vào, nhập học đại học.	16	2026-06-24 16:16:36.774	2026-06-24 16:16:36.774
22368	出ます［大学を～］	でます［だいがくを～］	demasu [daigakuwo~]	Ra, tốt nghiệp đại học.	16	2026-06-24 16:16:36.776	2026-06-24 16:16:36.776
22369	押します	おします	oshimasu	nhấn, ấn	16	2026-06-24 16:16:36.777	2026-06-24 16:16:36.777
22370	飲みます	のみます	nomimasu	drink alcohol	16	2026-06-24 16:16:36.779	2026-06-24 16:16:36.779
22371	始めます	はじめます	hajimemasu	start, begin	16	2026-06-24 16:16:36.781	2026-06-24 16:16:36.781
22372	見学します	けんがくします	kengakushimasu	tour, visit a place to study it	16	2026-06-24 16:16:36.783	2026-06-24 16:16:36.783
22373	電話します	でんわします	denwashimasu	phone	16	2026-06-24 16:16:36.785	2026-06-24 16:16:36.785
22374	若い	わかい	wakai	trẻ	16	2026-06-24 16:16:36.786	2026-06-24 16:16:36.786
22375	長い	ながい	nagai	dài	16	2026-06-24 16:16:36.788	2026-06-24 16:16:36.788
22376	短い	みじかい	mijikai	ngắn	16	2026-06-24 16:16:36.789	2026-06-24 16:16:36.789
22377	明るい	あかるい	akarui	sáng	16	2026-06-24 16:16:36.79	2026-06-24 16:16:36.79
22378	暗い	くらい	kurai	tối	16	2026-06-24 16:16:36.792	2026-06-24 16:16:36.792
22379	体	からだ	karada	cơ thể	16	2026-06-24 16:16:36.793	2026-06-24 16:16:36.793
22380	頭	あたま	atama	đầu	16	2026-06-24 16:16:36.794	2026-06-24 16:16:36.794
22381	髪	かみ	kami	tóc	16	2026-06-24 16:16:36.796	2026-06-24 16:16:36.796
22382	顔	かお	kao	mặt	16	2026-06-24 16:16:36.798	2026-06-24 16:16:36.798
22383	目	め	me	mắt	16	2026-06-24 16:16:36.799	2026-06-24 16:16:36.799
22384	耳	みみ	mimi	tai	16	2026-06-24 16:16:36.801	2026-06-24 16:16:36.801
22385	鼻	はな	hana	nose	16	2026-06-24 16:16:36.803	2026-06-24 16:16:36.803
22386	口	くち	kuchi	miệng	16	2026-06-24 16:16:36.804	2026-06-24 16:16:36.804
22387	歯	は	ha	răng	16	2026-06-24 16:16:36.806	2026-06-24 16:16:36.806
22388	\N	おなか	onaka	bụng	16	2026-06-24 16:16:36.807	2026-06-24 16:16:36.807
22389	足	あし	ashi	chân	16	2026-06-24 16:16:36.809	2026-06-24 16:16:36.809
22390	背	せ	se	height	16	2026-06-24 16:16:36.81	2026-06-24 16:16:36.81
22391	\N	サービス	sabisu	dịch vụ	16	2026-06-24 16:16:36.812	2026-06-24 16:16:36.812
22392	\N	ジョギング	jogingu	chạy bộ	16	2026-06-24 16:16:36.814	2026-06-24 16:16:36.814
22393	\N	シャワー	shawa	Vòi hoa sen	16	2026-06-24 16:16:36.816	2026-06-24 16:16:36.816
22394	緑	みどり	midori	màu xanh lá	16	2026-06-24 16:16:36.818	2026-06-24 16:16:36.818
22395	［お］寺	［お］てら	[o] tera	Buddhist temple	16	2026-06-24 16:16:36.82	2026-06-24 16:16:36.82
22396	神社	じんじゃ	jinja	đền thờ đạo thần	16	2026-06-24 16:16:36.821	2026-06-24 16:16:36.821
22397	－番	－ばん	-ban	number －	16	2026-06-24 16:16:36.823	2026-06-24 16:16:36.823
22398	\N	どうやって	doyatte	làm như thế nào	16	2026-06-24 16:16:36.825	2026-06-24 16:16:36.825
22399	\N	どの ～	dono ~	cái…..	16	2026-06-24 16:16:36.826	2026-06-24 16:16:36.826
22400	\N	どれ	dore	which one (of three or more things)	16	2026-06-24 16:16:36.828	2026-06-24 16:16:36.828
22401	\N	すごいですね。	sugoidesune.	That's amazing!	16	2026-06-24 16:16:36.831	2026-06-24 16:16:36.831
22402	\N	［いいえ、］まだまだです。	[iie,] madamadadesu.	[No,] I still have a long way to go.	16	2026-06-24 16:16:36.833	2026-06-24 16:16:36.833
22403	お引き出しですか。	おひきだしですか。	ohikidashidesuka.	anh chị rút tiền phải không?	16	2026-06-24 16:16:36.835	2026-06-24 16:16:36.835
22404	\N	まず	mazu	trước hết	16	2026-06-24 16:16:36.836	2026-06-24 16:16:36.836
22405	次に	つぎに	tsugini	tiếp theo	16	2026-06-24 16:16:36.838	2026-06-24 16:16:36.838
22406	\N	キャッシュカード	kyasshukado	Thẻ ngân hàng, thẻ ATM	16	2026-06-24 16:16:36.839	2026-06-24 16:16:36.839
22407	暗証番号	あんしょうばんごう	anshobango	mật khẩu	16	2026-06-24 16:16:36.841	2026-06-24 16:16:36.841
22408	金額	きんがく	kingaku	số tiền, tài khoản	16	2026-06-24 16:16:36.842	2026-06-24 16:16:36.842
22409	確認	かくにん	kakunin	xác nhận	16	2026-06-24 16:16:36.843	2026-06-24 16:16:36.843
22410	\N	ボタン	botan	nút	16	2026-06-24 16:16:36.844	2026-06-24 16:16:36.844
22411	\N	JR	JR	Japan Railways	16	2026-06-24 16:16:36.846	2026-06-24 16:16:36.846
22412	雪祭り	ゆきまつり	yukimatsuri	Snow Festival	16	2026-06-24 16:16:36.849	2026-06-24 16:16:36.849
22413	\N	バンドン	bandon	Bandung (in Indonesia)	16	2026-06-24 16:16:36.85	2026-06-24 16:16:36.85
22414	\N	フランケン	furanken	Franken (in Germany)	16	2026-06-24 16:16:36.852	2026-06-24 16:16:36.852
22415	\N	ベラクルス	berakurusu	Veracruz (in Mexico)	16	2026-06-24 16:16:36.854	2026-06-24 16:16:36.854
22416	梅田	うめだ	umeda	a district in Osaka	16	2026-06-24 16:16:36.855	2026-06-24 16:16:36.855
22417	大学前	だいがくまえ	daigakumae	a fictitious bus stop	16	2026-06-24 16:16:36.857	2026-06-24 16:16:36.857
22418	やめます［会社を～］	やめます［かいしゃを～］	yamemasu [kaishawo~]	từ bỏ	16	2026-06-24 16:16:36.859	2026-06-24 16:16:36.859
22419	背が 高い	せが たかい	sega takai	cao	16	2026-06-24 16:16:36.861	2026-06-24 16:16:36.861
22420	頭が いい	あたまが いい	atamaga ii	giỏi ,thông minh	16	2026-06-24 16:16:36.863	2026-06-24 16:16:36.863
22421	留学生	りゅうがくせい	ryugakusei	du học sinh	16	2026-06-24 16:16:36.866	2026-06-24 16:16:36.866
22422	\N	アジア	ajia	châu Á	16	2026-06-24 16:16:36.868	2026-06-24 16:16:36.868
22423	\N	ベトナム	betonamu	Vietnam	16	2026-06-24 16:16:36.869	2026-06-24 16:16:36.869
22424	\N	フエ	fue	Hue (in Vietnam)	16	2026-06-24 16:16:36.871	2026-06-24 16:16:36.871
22425	覚えます	おぼえます	oboemasu	nhớ	17	2026-06-24 16:16:36.995	2026-06-24 16:16:36.995
22426	忘れます	わすれます	wasuremasu	quên	17	2026-06-24 16:16:36.998	2026-06-24 16:16:36.998
22427	\N	なくします	nakushimasu	mất, đánh mất	17	2026-06-24 16:16:37.001	2026-06-24 16:16:37.001
22428	払います	はらいます	haraimasu	trả tiền	17	2026-06-24 16:16:37.003	2026-06-24 16:16:37.003
22429	返します	かえします	kaeshimasu	trả lại	17	2026-06-24 16:16:37.005	2026-06-24 16:16:37.005
22430	出かけます	でかけます	dekakemasu	ra ngoài	17	2026-06-24 16:16:37.007	2026-06-24 16:16:37.007
22431	脱ぎます	ぬぎます	nugimasu	cởi quần áo, giầy	17	2026-06-24 16:16:37.009	2026-06-24 16:16:37.009
22432	持って 行きます	もって いきます	motte ikimasu	mang đi,mang theo	17	2026-06-24 16:16:37.011	2026-06-24 16:16:37.011
22433	持って 来ます	もって きます	motte kimasu	mang đến	17	2026-06-24 16:16:37.014	2026-06-24 16:16:37.014
22434	心配します	しんぱいします	shinpaishimasu	lo lắng	17	2026-06-24 16:16:37.016	2026-06-24 16:16:37.016
22435	残業します	ざんぎょうします	zangyoshimasu	làm thêm	17	2026-06-24 16:16:37.018	2026-06-24 16:16:37.018
22436	出張します	しゅっちょうします	shutchoshimasu	đi công tác	17	2026-06-24 16:16:37.019	2026-06-24 16:16:37.019
22437	飲みます［薬を～］	のみます［くすりを～］	nomimasu [kusuriwo~]	uống	17	2026-06-24 16:16:37.021	2026-06-24 16:16:37.021
22438	入ります［おふろに～］	はいります［おふろに～］	hairimasu [ofuroni~]	vào	17	2026-06-24 16:16:37.022	2026-06-24 16:16:37.022
22439	大切［な］	たいせつ［な］	taisetsu [na]	quan trọng, quý giá	17	2026-06-24 16:16:37.024	2026-06-24 16:16:37.024
22440	大丈夫［な］	だいじょうぶ［な］	daijobu [na]	không sao, không vấn đề gì	17	2026-06-24 16:16:37.026	2026-06-24 16:16:37.026
22441	危ない	あぶない	abunai	nguy hiểm	17	2026-06-24 16:16:37.027	2026-06-24 16:16:37.027
22442	禁煙	きんえん	kin'en	cấm hút thuốc	17	2026-06-24 16:16:37.03	2026-06-24 16:16:37.03
22443	［健康］保険証	［けんこう］ほけんしょう	[kenko] hokensho	thẻ bảo hiểm	17	2026-06-24 16:16:37.032	2026-06-24 16:16:37.032
22444	熱	ねつ	netsu	sốt	17	2026-06-24 16:16:37.035	2026-06-24 16:16:37.035
22445	病気	びょうき	byoki	ốm, bệnh	17	2026-06-24 16:16:37.037	2026-06-24 16:16:37.037
22446	薬	くすり	kusuri	thuốc	17	2026-06-24 16:16:37.04	2026-06-24 16:16:37.04
22447	\N	［お］ふろ	[o] furo	bồn tắm	17	2026-06-24 16:16:37.042	2026-06-24 16:16:37.042
22448	上着	うわぎ	uwagi	áo khoác	17	2026-06-24 16:16:37.044	2026-06-24 16:16:37.044
22449	下着	したぎ	shitagi	quần áo lót	17	2026-06-24 16:16:37.047	2026-06-24 16:16:37.047
22450	２、３日	２、３にち	2, 3 nichi	two or three days	17	2026-06-24 16:16:37.05	2026-06-24 16:16:37.05
22451	\N	２、３～	2, 3~	two or three ～ (where ～ is a counter suffix)	17	2026-06-24 16:16:37.053	2026-06-24 16:16:37.053
22452	\N	～までに	~madeni	before ～, by ～ (indicating time limit)	17	2026-06-24 16:16:37.056	2026-06-24 16:16:37.056
22453	\N	ですから	desukara	vì thế, vì vậy, do đó	17	2026-06-24 16:16:37.058	2026-06-24 16:16:37.058
22454	\N	どう しましたか。	do shimashitaka.	What's the matter?	17	2026-06-24 16:16:37.06	2026-06-24 16:16:37.06
22455	\N	のど	nodo	throat	17	2026-06-24 16:16:37.062	2026-06-24 16:16:37.062
22456	［～が］痛いです。	［～が］いたいです。	[~ga] itaidesu.	(I) have a pain [in my ～].	17	2026-06-24 16:16:37.065	2026-06-24 16:16:37.065
22457	\N	かぜ	kaze	cảm,cúm	17	2026-06-24 16:16:37.068	2026-06-24 16:16:37.068
22458	\N	それから	sorekara	and, furthermore	17	2026-06-24 16:16:37.07	2026-06-24 16:16:37.07
22459	お大事に。	おだいじに。	odaijini.	Take care of yourself. (said to people who are ill)	17	2026-06-24 16:16:37.072	2026-06-24 16:16:37.072
22460	出します［レポートを～］	だします［レポートを～］	dashimasu [repotowo~]	nộp	17	2026-06-24 16:16:37.074	2026-06-24 16:16:37.074
22461	問題	もんだい	mondai	vấn đề	17	2026-06-24 16:16:37.076	2026-06-24 16:16:37.076
22462	答え	こたえ	kotae	câu trả lời	17	2026-06-24 16:16:37.079	2026-06-24 16:16:37.079
22463	先生	せんせい	sensei	bác sĩ(cách gọi bác sĩ)	17	2026-06-24 16:16:37.083	2026-06-24 16:16:37.083
22464	\N	できます	dekimasu	có thể	18	2026-06-24 16:16:37.229	2026-06-24 16:16:37.229
22465	洗います	あらいます	araimasu	rửa, giặt	18	2026-06-24 16:16:37.232	2026-06-24 16:16:37.232
22466	弾きます	ひきます	hikimasu	chơi (nhạc cụ)	18	2026-06-24 16:16:37.235	2026-06-24 16:16:37.235
22467	歌います	うたいます	utaimasu	hát	18	2026-06-24 16:16:37.238	2026-06-24 16:16:37.238
22468	集めます	あつめます	atsumemasu	sưu tầm, thu thập	18	2026-06-24 16:16:37.24	2026-06-24 16:16:37.24
22469	捨てます	すてます	sutemasu	vứt bỏ, bỏ đi	18	2026-06-24 16:16:37.243	2026-06-24 16:16:37.243
22470	換えます	かえます	kaemasu	đổi, trao đổi	18	2026-06-24 16:16:37.246	2026-06-24 16:16:37.246
22471	運転します	うんてんします	untenshimasu	lái (xe), điều khiển	18	2026-06-24 16:16:37.25	2026-06-24 16:16:37.25
22472	予約します	よやくします	yoyakushimasu	đặt chỗ, đặt trước	18	2026-06-24 16:16:37.253	2026-06-24 16:16:37.253
22473	\N	ピアノ	piano	đàn piano	18	2026-06-24 16:16:37.258	2026-06-24 16:16:37.258
22474	\N	－メートル	-metoru	－ meter	18	2026-06-24 16:16:37.262	2026-06-24 16:16:37.262
22475	現金	げんきん	genkin	tiền mặt	18	2026-06-24 16:16:37.265	2026-06-24 16:16:37.265
22476	趣味	しゅみ	shumi	sở thích	18	2026-06-24 16:16:37.269	2026-06-24 16:16:37.269
22477	日記	にっき	nikki	nhật ký	18	2026-06-24 16:16:37.272	2026-06-24 16:16:37.272
22478	お祈り	おいのり	oinori	prayer (～を します : pray)	18	2026-06-24 16:16:37.274	2026-06-24 16:16:37.274
22479	課長	かちょう	kacho	tổ trưởng, trưởng bộ phận	18	2026-06-24 16:16:37.277	2026-06-24 16:16:37.277
22480	部長	ぶちょう	bucho	trưởng phòng	18	2026-06-24 16:16:37.281	2026-06-24 16:16:37.281
22481	社長	しゃちょう	shacho	giám đốc	18	2026-06-24 16:16:37.284	2026-06-24 16:16:37.284
22482	動物	どうぶつ	dobutsu	animal	18	2026-06-24 16:16:37.287	2026-06-24 16:16:37.287
22483	馬	うま	uma	horse	18	2026-06-24 16:16:37.29	2026-06-24 16:16:37.29
22484	\N	インターネット	intanetto	Internet	18	2026-06-24 16:16:37.292	2026-06-24 16:16:37.292
22485	特に	とくに	tokuni	especially	18	2026-06-24 16:16:37.294	2026-06-24 16:16:37.294
22486	\N	へえ	he	What! Really! (used when expressing surprise)	18	2026-06-24 16:16:37.297	2026-06-24 16:16:37.297
22487	\N	それは おもしろいですね。	sorewa omoshiroidesune.	That's interesting, isn't it?	18	2026-06-24 16:16:37.299	2026-06-24 16:16:37.299
22488	\N	なかなか	nakanaka	not easily (used with negatives)	18	2026-06-24 16:16:37.302	2026-06-24 16:16:37.302
22489	\N	ほんとうですか。	hontodesuka.	Really?	18	2026-06-24 16:16:37.304	2026-06-24 16:16:37.304
22490	\N	ぜひ	zehi	nhất định, rất	18	2026-06-24 16:16:37.307	2026-06-24 16:16:37.307
22491	故郷	ふるさと	furusato	Furusato (a song title meaning 'Home Town')	18	2026-06-24 16:16:37.309	2026-06-24 16:16:37.309
22492	\N	ビートルズ	biitoruzu	the Beatles (a famous British pop group)	18	2026-06-24 16:16:37.311	2026-06-24 16:16:37.311
22493	秋葉原	あきはばら	akihabara	a district in Tokyo	18	2026-06-24 16:16:37.314	2026-06-24 16:16:37.314
22494	見学します	けんがくします	kengakushimasu	tham quan với mục đích học tập	18	2026-06-24 16:16:37.318	2026-06-24 16:16:37.318
22495	国際～	こくさい～	kokusai~	international ～	18	2026-06-24 16:16:37.321	2026-06-24 16:16:37.321
22496	牧場	ぼくじょう	bokujo	trang trại chăn nuôi	18	2026-06-24 16:16:37.323	2026-06-24 16:16:37.323
22497	登ります、上ります	のぼります	noborimasu	leo (núi)	19	2026-06-24 16:16:37.503	2026-06-24 16:16:37.503
22498	泊まります［ホテルに～］	とまります［ホテルに～］	tomarimasu [hoteruni~]	trọ, ngủ trọ	19	2026-06-24 16:16:37.507	2026-06-24 16:16:37.507
22499	掃除します	そうじします	sojishimasu	dọn dẹp	19	2026-06-24 16:16:37.51	2026-06-24 16:16:37.51
22500	洗濯します	せんたくします	sentakushimasu	giặt giũ, giặt (quần áo)	19	2026-06-24 16:16:37.514	2026-06-24 16:16:37.514
22501	\N	なります	narimasu	trở nên ,trở thành	19	2026-06-24 16:16:37.518	2026-06-24 16:16:37.518
22502	眠い	ねむい	nemui	buồn ngủ	19	2026-06-24 16:16:37.521	2026-06-24 16:16:37.521
22503	強い	つよい	tsuyoi	mạnh, khỏe	19	2026-06-24 16:16:37.523	2026-06-24 16:16:37.523
22504	弱い	よわい	yowai	yếu	19	2026-06-24 16:16:37.525	2026-06-24 16:16:37.525
22505	練習	れんしゅう	renshu	practice (～［を］します : practise)	19	2026-06-24 16:16:37.527	2026-06-24 16:16:37.527
22506	\N	ゴルフ	gorufu	gôn	19	2026-06-24 16:16:37.53	2026-06-24 16:16:37.53
22507	相撲	すもう	sumou	vật sumo	19	2026-06-24 16:16:37.532	2026-06-24 16:16:37.532
22508	お茶	おちゃ	ocha	trà đạo	19	2026-06-24 16:16:37.535	2026-06-24 16:16:37.535
22509	日	ひ	hi	ngày	19	2026-06-24 16:16:37.537	2026-06-24 16:16:37.537
22510	調子	ちょうし	choshi	tình trạng, trạng thái	19	2026-06-24 16:16:37.539	2026-06-24 16:16:37.539
22511	一度	いちど	ichido	một lần	19	2026-06-24 16:16:37.541	2026-06-24 16:16:37.541
22512	一度も	いちども	ichidomo	chưa lần nào	19	2026-06-24 16:16:37.543	2026-06-24 16:16:37.543
22513	\N	だんだん	dandan	dần dần	19	2026-06-24 16:16:37.544	2026-06-24 16:16:37.544
22514	\N	もうすぐ	mosugu	sắp sửa	19	2026-06-24 16:16:37.547	2026-06-24 16:16:37.547
22515	\N	おかげさまで	okagesamade	Cám ơn (khi nhận được sự giúp đỡ của ai đó)	19	2026-06-24 16:16:37.549	2026-06-24 16:16:37.549
22516	\N	でも	demo	but	19	2026-06-24 16:16:37.551	2026-06-24 16:16:37.551
22517	乾杯	かんぱい	kanpai	nâng cốc	19	2026-06-24 16:16:37.553	2026-06-24 16:16:37.553
22518	\N	ダイエット	daietto	ăn kiêng	19	2026-06-24 16:16:37.554	2026-06-24 16:16:37.554
22519	無理［な］	むり［な］	muri [na]	excessive, impossible	19	2026-06-24 16:16:37.556	2026-06-24 16:16:37.556
22520	体に いい	からだに いい	karadani ii	tốt cho sức khỏe	19	2026-06-24 16:16:37.558	2026-06-24 16:16:37.558
22521	東京スカイツリー	とうきょうスカイツリー	tokyosukaitsurii	Tokyo Sky Tree (broadcasting tower with observation deck in Tokyo)	19	2026-06-24 16:16:37.56	2026-06-24 16:16:37.56
22522	葛飾北斎	かつしかほくさい	katsushikahokusai	a famous Edo-period woodblock artist and painter (1760-1849)	19	2026-06-24 16:16:37.563	2026-06-24 16:16:37.563
22523	調子が いい	ちょうしが いい	choshiga ii	tình trạng tốt	19	2026-06-24 16:16:37.568	2026-06-24 16:16:37.568
22524	調子が 悪い	ちょうしが わるい	choshiga warui	tình trạng xấu	19	2026-06-24 16:16:37.571	2026-06-24 16:16:37.571
22525	\N	パチンコ	pachinko	trò chơi pachinko	19	2026-06-24 16:16:37.573	2026-06-24 16:16:37.573
22526	実は	じつは	jitsuwa	sự tình là, sự thật là	19	2026-06-24 16:16:37.575	2026-06-24 16:16:37.575
22527	何回も	なんかいも	nankaimo	nhiều lần	19	2026-06-24 16:16:37.578	2026-06-24 16:16:37.578
22528	\N	しかし	shikashi	tuy nhiên	19	2026-06-24 16:16:37.585	2026-06-24 16:16:37.585
22529	\N	ケーキ	keki	bánh ga-tô	19	2026-06-24 16:16:37.589	2026-06-24 16:16:37.589
22530	要ります［ビザが～］	いります［ビザが～］	irimasu [bizaga~]	cần visa	20	2026-06-24 16:16:37.758	2026-06-24 16:16:37.758
22531	調べます	しらべます	shirabemasu	tìm hiểu, điều tra, xem	20	2026-06-24 16:16:37.76	2026-06-24 16:16:37.76
22532	修理します	しゅうりします	shurishimasu	sửa, chữa, tu sửa	20	2026-06-24 16:16:37.764	2026-06-24 16:16:37.764
22533	僕	ぼく	boku	tớ (cách xưng thân mật của nam giới)	20	2026-06-24 16:16:37.769	2026-06-24 16:16:37.769
22534	君	きみ	kimi	cậu, bạn	20	2026-06-24 16:16:37.775	2026-06-24 16:16:37.775
22535	～君	～くん	~kun	(hậu tố thêm vào sau tên của em trai)	20	2026-06-24 16:16:37.781	2026-06-24 16:16:37.781
22536	\N	うん	un	có(cách nói thân mật của “はい”)	20	2026-06-24 16:16:37.785	2026-06-24 16:16:37.785
22537	\N	ううん	uun	không(cách nói thân mật của “いいえ”)	20	2026-06-24 16:16:37.787	2026-06-24 16:16:37.787
22538	\N	ことば	kotoba	tiếng	20	2026-06-24 16:16:37.789	2026-06-24 16:16:37.789
22539	着物	きもの	kimono	kimono	20	2026-06-24 16:16:37.791	2026-06-24 16:16:37.791
22540	ビサ	ビザ	biza	thị thực, visa	20	2026-06-24 16:16:37.793	2026-06-24 16:16:37.793
22541	初め	はじめ	hajime	ban đầu, đầu tiên	20	2026-06-24 16:16:37.797	2026-06-24 16:16:37.797
22542	終わり	おわり	owari	kết thúc	20	2026-06-24 16:16:37.801	2026-06-24 16:16:37.801
22543	\N	こっち	kotchi	Đằng này (cách nói tự nhiên, thân mật của “kochira”)	20	2026-06-24 16:16:37.803	2026-06-24 16:16:37.803
22544	\N	そっち	sotchi	phía đó (cách nói tự nhiên của, thân mật “sochira”)	20	2026-06-24 16:16:37.805	2026-06-24 16:16:37.805
22545	\N	あっち	atchi	Đằng kia (cách nói tự nhiên, thân mật của “achira”)	20	2026-06-24 16:16:37.807	2026-06-24 16:16:37.807
22546	\N	どっち	dotchi	phía nào (cách nói tự nhiên, thân mật của “dochira”)	20	2026-06-24 16:16:37.809	2026-06-24 16:16:37.809
22547	\N	みんなで	minnade	mọi người cùng	20	2026-06-24 16:16:37.812	2026-06-24 16:16:37.812
22548	\N	～けど	~kedo	nhưng(cách nói thân mật của が)	20	2026-06-24 16:16:37.816	2026-06-24 16:16:37.816
22549	\N	おなかが いっぱいです	onakaga ippaidesu	(I'm) full	20	2026-06-24 16:16:37.819	2026-06-24 16:16:37.819
22550	\N	よかったら	yokattara	Nếu anh/ chị thích thì	20	2026-06-24 16:16:37.821	2026-06-24 16:16:37.821
22551	\N	いろいろ	iroiro	nhiều thứ, đa dạng	20	2026-06-24 16:16:37.824	2026-06-24 16:16:37.824
22552	直します	なおします	naoshimasu	sửa, chữa	20	2026-06-24 16:16:37.826	2026-06-24 16:16:37.826
22553	電話します	でんわします	denwashimasu	gọi điện thoại	20	2026-06-24 16:16:37.828	2026-06-24 16:16:37.828
22554	\N	サラリーマン	sarariiman	người làm việc cho các cty	20	2026-06-24 16:16:37.832	2026-06-24 16:16:37.832
22555	物価	ぶっか	bukka	giá cả, mức giá	20	2026-06-24 16:16:37.835	2026-06-24 16:16:37.835
22556	この間	このあいだ	konoaida	vừa rồi, hôm nọ	20	2026-06-24 16:16:37.837	2026-06-24 16:16:37.837
22557	国へ 帰るの？	くにへ かえるの？	kunihe kaeruno？	Anh/ chị sẽ về nước không?	20	2026-06-24 16:16:37.84	2026-06-24 16:16:37.84
22558	\N	どう するの？	do suruno?	Anh/ chị tính sao? Anh/ chị sẽ làm gì	20	2026-06-24 16:16:37.842	2026-06-24 16:16:37.842
22559	\N	どう しようかな。	do shiyoukana.	tính sao đây nhỉ?/ để tôi xem	20	2026-06-24 16:16:37.845	2026-06-24 16:16:37.845
22560	思います	おもいます	omoimasu	nghĩ	21	2026-06-24 16:16:37.973	2026-06-24 16:16:37.973
22561	言います	いいます	iimasu	nói	21	2026-06-24 16:16:37.975	2026-06-24 16:16:37.975
22562	勝ちます	かちます	kachimasu	thắng	21	2026-06-24 16:16:37.977	2026-06-24 16:16:37.977
22563	負けます	まけます	makemasu	thua	21	2026-06-24 16:16:37.979	2026-06-24 16:16:37.979
22564	あります［お祭りが～］	あります［おまつりが～］	arimasu [omatsuriga~]	được tổ chức	21	2026-06-24 16:16:37.982	2026-06-24 16:16:37.982
22565	役に 立ちます	やくに たちます	yakuni tachimasu	giúp ích	21	2026-06-24 16:16:37.984	2026-06-24 16:16:37.984
22566	動きます	うごきます	ugokimasu	move, work	21	2026-06-24 16:16:37.986	2026-06-24 16:16:37.986
22567	やめます［会社を～］	やめます［かいしゃを～］	yamemasu [kaishawo~]	quit or retire from [a company], stop, give up	21	2026-06-24 16:16:37.987	2026-06-24 16:16:37.987
22568	気を つけます	きを つけます	kiwo tsukemasu	pay attention, take care	21	2026-06-24 16:16:37.989	2026-06-24 16:16:37.989
22569	留学します	りゅうがくします	ryugakushimasu	study abroad	21	2026-06-24 16:16:37.991	2026-06-24 16:16:37.991
22570	\N	むだ［な］	muda [na]	sự lãng phí	21	2026-06-24 16:16:37.993	2026-06-24 16:16:37.993
22571	不便［な］	ふべん［な］	fuben [na]	bất tiện	21	2026-06-24 16:16:37.995	2026-06-24 16:16:37.995
22572	\N	すごい	sugoi	giỏi, giỏi quá	21	2026-06-24 16:16:37.998	2026-06-24 16:16:37.998
22573	\N	ほんとう	honto	true	21	2026-06-24 16:16:38	2026-06-24 16:16:38
22574	\N	うそ	uso	lie	21	2026-06-24 16:16:38.002	2026-06-24 16:16:38.002
22575	自動車	じどうしゃ	jidosha	car, automobile	21	2026-06-24 16:16:38.003	2026-06-24 16:16:38.003
22576	交通	こうつう	kotsu	giao thông	21	2026-06-24 16:16:38.005	2026-06-24 16:16:38.005
22577	物価	ぶっか	bukka	[commodity] prices	21	2026-06-24 16:16:38.006	2026-06-24 16:16:38.006
22578	放送	ほうそう	hoso	[commodity] prices	21	2026-06-24 16:16:38.008	2026-06-24 16:16:38.008
22579	\N	ニュース	nyusu	tin tức, bản tin	21	2026-06-24 16:16:38.01	2026-06-24 16:16:38.01
22580	\N	アニメ	anime	anime (Japanese animated film)	21	2026-06-24 16:16:38.013	2026-06-24 16:16:38.013
22581	\N	マンガ	manga	comic book	21	2026-06-24 16:16:38.016	2026-06-24 16:16:38.016
22582	\N	デザイン	dezain	thiết kế	21	2026-06-24 16:16:38.018	2026-06-24 16:16:38.018
22583	夢	ゆめ	yume	dream	21	2026-06-24 16:16:38.019	2026-06-24 16:16:38.019
22584	天才	てんさい	tensai	genius	21	2026-06-24 16:16:38.021	2026-06-24 16:16:38.021
22585	試合	しあい	shiai	trận đấu	21	2026-06-24 16:16:38.022	2026-06-24 16:16:38.022
22586	意見	いけん	iken	ý kiến	21	2026-06-24 16:16:38.024	2026-06-24 16:16:38.024
22587	話	はなし	hanashi	câu chuyện	21	2026-06-24 16:16:38.025	2026-06-24 16:16:38.025
22588	地球	ちきゅう	chikyu	earth	21	2026-06-24 16:16:38.027	2026-06-24 16:16:38.027
22589	月	つき	tsuki	moon	21	2026-06-24 16:16:38.031	2026-06-24 16:16:38.031
22590	最近	さいきん	saikin	gần đây	21	2026-06-24 16:16:38.033	2026-06-24 16:16:38.033
22591	\N	たぶん	tabun	chắc, có thể	21	2026-06-24 16:16:38.035	2026-06-24 16:16:38.035
22592	\N	きっと	kitto	chắc chắn , nhất định	21	2026-06-24 16:16:38.037	2026-06-24 16:16:38.037
22593	\N	ほんとうに	hontoni	thật sự	21	2026-06-24 16:16:38.039	2026-06-24 16:16:38.039
22594	\N	そんなに	sonnani	(không ) ~ lắm	21	2026-06-24 16:16:38.041	2026-06-24 16:16:38.041
22595	\N	～に ついて	~ni tsuite	theo ~ về	21	2026-06-24 16:16:38.043	2026-06-24 16:16:38.043
22596	久しぶりですね。	ひさしぶりですね。	hisashiburidesune.	It's been a long time [since we last met].	21	2026-06-24 16:16:38.045	2026-06-24 16:16:38.045
22597	～でも 飲みませんか。	～でも のみませんか。	~demo nomimasenka.	Anh/chị uống (cà phê, rượu hay cái gì đó) nhé	21	2026-06-24 16:16:38.048	2026-06-24 16:16:38.048
22598	\N	もちろん	mochiron	tất nhiên	21	2026-06-24 16:16:38.05	2026-06-24 16:16:38.05
22599	もう 帰らないと……。	もう かえらないと……。	mo kaeranaito…….	I have to get home now......	21	2026-06-24 16:16:38.052	2026-06-24 16:16:38.052
22600	\N	アインシュタイン	ainshutain	Albert Einstein (1879-1955)	21	2026-06-24 16:16:38.054	2026-06-24 16:16:38.054
22601	\N	ガガーリン	gagarin	Yuri Alekseyevich Gagarin (1934-1968)	21	2026-06-24 16:16:38.056	2026-06-24 16:16:38.056
22602	\N	ガリレオ	garireo	Galileo Galilei (1564-1642)	21	2026-06-24 16:16:38.058	2026-06-24 16:16:38.058
22603	キング牧師	キングぼくし	kingubokushi	Martin Luther King, Jr. (1929-1968)	21	2026-06-24 16:16:38.06	2026-06-24 16:16:38.06
22604	\N	フランクリン	furankurin	Benjamin Franklin (1706-1790)	21	2026-06-24 16:16:38.062	2026-06-24 16:16:38.062
22605	かぐや姫	かぐやひめ	kaguyahime	Princess Kaguya (heroine of the old Japanese folk tale 'Taketori Monogatari')	21	2026-06-24 16:16:38.065	2026-06-24 16:16:38.065
22606	天神祭	てんじんまつり	tenjinmatsuri	Tenjin Festival (a festival in Osaka)	21	2026-06-24 16:16:38.067	2026-06-24 16:16:38.067
22607	吉野山	よしのやま	yoshinoyama	Mt. Yoshino (a mountain in Nara Prefecture)	21	2026-06-24 16:16:38.069	2026-06-24 16:16:38.069
22608	\N	カンガルー	kangaru	căn-gu-ru	21	2026-06-24 16:16:38.07	2026-06-24 16:16:38.07
22609	\N	キャプテン・クック	kyaputen kukku	Captain James Cook (1728-1779)	21	2026-06-24 16:16:38.072	2026-06-24 16:16:38.072
22610	\N	ヨーネン	yonen	a fictitious company	21	2026-06-24 16:16:38.074	2026-06-24 16:16:38.074
22611	足ります	たります	tarimasu	đủ	21	2026-06-24 16:16:38.076	2026-06-24 16:16:38.076
22612	同じ	おなじ	onaji	giống	21	2026-06-24 16:16:38.079	2026-06-24 16:16:38.079
22613	首相	しゅしょう	shusho	thủ tướng	21	2026-06-24 16:16:38.081	2026-06-24 16:16:38.081
22614	大統領	だいとうりょう	daitoryo	tổng thống	21	2026-06-24 16:16:38.083	2026-06-24 16:16:38.083
22615	政治	せいじ	seiji	chính trị	21	2026-06-24 16:16:38.085	2026-06-24 16:16:38.085
22616	\N	スピーチ	supiichi	bài phát biểu	21	2026-06-24 16:16:38.087	2026-06-24 16:16:38.087
22617	\N	アルバイト	arubaito	việc làm thêm	21	2026-06-24 16:16:38.089	2026-06-24 16:16:38.089
22618	\N	ユーモア	yumoa	hài hước	21	2026-06-24 16:16:38.091	2026-06-24 16:16:38.091
22619	\N	むだ	muda	sự lãng phí	21	2026-06-24 16:16:38.093	2026-06-24 16:16:38.093
22620	\N	ラッシュ	rasshu	giờ cao điểm	21	2026-06-24 16:16:38.096	2026-06-24 16:16:38.096
22621	\N	しかたが ありません。	shikataga arimasen.	không còn cách nào khác	21	2026-06-24 16:16:38.101	2026-06-24 16:16:38.101
22622	\N	しばらくですね。	shibarakudesune.	Lâu rồi không gặp	21	2026-06-24 16:16:38.104	2026-06-24 16:16:38.104
22623	見ないと……。	みないと……。	minaito…….	I've got to watch it.	21	2026-06-24 16:16:38.105	2026-06-24 16:16:38.105
22624	着ます	きます	kimasu	put on (a shirt, etc.)	22	2026-06-24 16:16:38.219	2026-06-24 16:16:38.219
22625	\N	はきます	hakimasu	put on (shoes, trousers, etc.)	22	2026-06-24 16:16:38.221	2026-06-24 16:16:38.221
22626	\N	かぶります	kaburimasu	put on (a hat, etc.)	22	2026-06-24 16:16:38.223	2026-06-24 16:16:38.223
22627	かけます［眼鏡を～］	かけます［めがねを～］	kakemasu [meganewo~]	put on [glasses]	22	2026-06-24 16:16:38.225	2026-06-24 16:16:38.225
22628	\N	します［ネクタイを～］	shimasu [nekutaiwo~]	put on [tie]	22	2026-06-24 16:16:38.227	2026-06-24 16:16:38.227
22629	生まれます	うまれます	umaremasu	sinh ra	22	2026-06-24 16:16:38.23	2026-06-24 16:16:38.23
22630	私たち	わたしたち	watashitachi	we	22	2026-06-24 16:16:38.233	2026-06-24 16:16:38.233
22631	\N	コート	koto	áo khoác	22	2026-06-24 16:16:38.235	2026-06-24 16:16:38.235
22632	\N	セーター	seta	áo len	22	2026-06-24 16:16:38.237	2026-06-24 16:16:38.237
22633	\N	スーツ	sutsu	com-lê	22	2026-06-24 16:16:38.239	2026-06-24 16:16:38.239
22634	帽子	ぼうし	boshi	nón, mũ	22	2026-06-24 16:16:38.241	2026-06-24 16:16:38.241
22635	眼鏡	めがね	megane	kính	22	2026-06-24 16:16:38.243	2026-06-24 16:16:38.243
22636	\N	ケーキ	keki	cake	22	2026-06-24 16:16:38.246	2026-06-24 16:16:38.246
22637	［お］弁当	［お］べんとう	[o] bento	box lunch	22	2026-06-24 16:16:38.25	2026-06-24 16:16:38.25
22638	\N	ロボット	robotto	robot	22	2026-06-24 16:16:38.252	2026-06-24 16:16:38.252
22639	\N	ユーモア	yumoa	humor	22	2026-06-24 16:16:38.254	2026-06-24 16:16:38.254
22640	都合	つごう	tsugo	convenience	22	2026-06-24 16:16:38.256	2026-06-24 16:16:38.256
22641	\N	よく	yoku	thường	22	2026-06-24 16:16:38.258	2026-06-24 16:16:38.258
22642	\N	えーと	eeto	well, let me see	22	2026-06-24 16:16:38.26	2026-06-24 16:16:38.26
22643	\N	おめでとう［ございます］。	omedeto [gozaimasu].	Congratulations. (used on birthdays, at weddings, New Year's Day, etc.)	22	2026-06-24 16:16:38.264	2026-06-24 16:16:38.264
22644	お探しですか。	おさがしですか。	osagashidesuka.	Are you looking for ～?	22	2026-06-24 16:16:38.266	2026-06-24 16:16:38.266
22645	\N	では	dewa	Well then,	22	2026-06-24 16:16:38.269	2026-06-24 16:16:38.269
22646	此方	こちら	kochira	cái này (cách nói lịch sử của “これ”)	22	2026-06-24 16:16:38.271	2026-06-24 16:16:38.271
22647	家賃	やちん	yachin	tiền thuê nhà	22	2026-06-24 16:16:38.272	2026-06-24 16:16:38.272
22648	\N	ダイニングキチン	dainingukichin	kitchen with a dining area	22	2026-06-24 16:16:38.274	2026-06-24 16:16:38.274
22649	和室	わしつ	washitsu	phòng ăn kiểu Nhật	22	2026-06-24 16:16:38.278	2026-06-24 16:16:38.278
22650	押し入れ	おしいれ	oshiire	chỗ để chăn gối trong ăn phòng kiểu Nhật	22	2026-06-24 16:16:38.282	2026-06-24 16:16:38.282
22651	布団	ふとん	futon	chăn,đệm	22	2026-06-24 16:16:38.284	2026-06-24 16:16:38.284
22652	\N	パリ	pari	Pa-ri	22	2026-06-24 16:16:38.286	2026-06-24 16:16:38.286
22653	万里の 長城	ばんりの ちょうじょう	banrino chojo	Vạn lý trường thành	22	2026-06-24 16:16:38.288	2026-06-24 16:16:38.288
22654	\N	みんなの アンケート	minnano anketo	title of a fictitious questionnaire	22	2026-06-24 16:16:38.29	2026-06-24 16:16:38.29
22655	\N	うーん。	uun.	để tôi xem/ừ/thế nào nhỉ	22	2026-06-24 16:16:38.293	2026-06-24 16:16:38.293
22656	\N	アパート	apato	nhà chung cư	22	2026-06-24 16:16:38.297	2026-06-24 16:16:38.297
22657	余暇開発センター	よかかいはつセンター	yokakaihatsu senta	Trung tâm phát triển hoat động giải trí cho người dân	22	2026-06-24 16:16:38.3	2026-06-24 16:16:38.3
22658	レジャー白書	レジャーはくしょ	rejahakusho	sách trắng về sử dụng thời gian rảnh rỗi	22	2026-06-24 16:16:38.302	2026-06-24 16:16:38.302
22659	聞きます［先生に～］	ききます［せんせいに～］	kikimasu [senseini~]	ask [the teacher]	23	2026-06-24 16:16:38.431	2026-06-24 16:16:38.431
22660	回します	まわします	mawashimasu	vặn (nút)	23	2026-06-24 16:16:38.433	2026-06-24 16:16:38.433
22661	引きます	ひきます	hikimasu	kéo	23	2026-06-24 16:16:38.434	2026-06-24 16:16:38.434
22662	変えます	かえます	kaemasu	đổi	23	2026-06-24 16:16:38.436	2026-06-24 16:16:38.436
22663	触ります［ドアに～］	さわります［ドアに～］	sawarimasu [doani~]	sờ, chạm vào	23	2026-06-24 16:16:38.437	2026-06-24 16:16:38.437
22664	出ます［お釣りが～］	でます［おつりが～］	demasu [otsuriga~]	ra,đi ra	23	2026-06-24 16:16:38.439	2026-06-24 16:16:38.439
22665	歩きます	あるきます	arukimasu	đi bộ (trên đường)	23	2026-06-24 16:16:38.44	2026-06-24 16:16:38.44
22666	渡ります［橋を～］	わたります［はしを～］	watarimasu [hashiwo~]	qua ,đi qua (cầu)	23	2026-06-24 16:16:38.441	2026-06-24 16:16:38.441
22667	曲がります［右へ～］	まがります［みぎへ～］	magarimasu [migihe~]	turn [to the right]	23	2026-06-24 16:16:38.443	2026-06-24 16:16:38.443
22668	寂しい	さびしい	sabishii	lonely	23	2026-06-24 16:16:38.445	2026-06-24 16:16:38.445
22669	［お］湯	［お］ゆ	[o] yu	hot water	23	2026-06-24 16:16:38.447	2026-06-24 16:16:38.447
22670	音	おと	oto	âm thanh	23	2026-06-24 16:16:38.449	2026-06-24 16:16:38.449
22671	\N	サイズ	saizu	cỡ, kích thước	23	2026-06-24 16:16:38.451	2026-06-24 16:16:38.451
22672	故障	こしょう	kosho	hỏng	23	2026-06-24 16:16:38.452	2026-06-24 16:16:38.452
22673	道	みち	michi	đường	23	2026-06-24 16:16:38.454	2026-06-24 16:16:38.454
22674	交差点	こうさてん	kosaten	ngã tư	23	2026-06-24 16:16:38.456	2026-06-24 16:16:38.456
22675	信号	しんごう	shingo	đèn tín hiệu	23	2026-06-24 16:16:38.457	2026-06-24 16:16:38.457
22676	角	かど	kado	góc	23	2026-06-24 16:16:38.459	2026-06-24 16:16:38.459
22677	橋	はし	hashi	cầu	23	2026-06-24 16:16:38.46	2026-06-24 16:16:38.46
22678	駐車場	ちゅうしゃじょう	chushajo	bãi đỗ xe	23	2026-06-24 16:16:38.463	2026-06-24 16:16:38.463
22679	建物	たてもの	tatemono	tòa nhà	23	2026-06-24 16:16:38.465	2026-06-24 16:16:38.465
22680	何回も	なんかいも	nankaimo	many times	23	2026-06-24 16:16:38.467	2026-06-24 16:16:38.467
22681	－目	－め	-me	the -th (indicating order)	23	2026-06-24 16:16:38.469	2026-06-24 16:16:38.469
22682	聖徳太子	しょうとくたいし	shotokutaishi	Prince Shotoku (574-622)	23	2026-06-24 16:16:38.47	2026-06-24 16:16:38.47
22683	法隆寺	ほうりゅうじ	horyuji	Horyuji Temple, a temple in Nara Prefecture built by Prince Shotoku at the beginning of the 7th century	23	2026-06-24 16:16:38.472	2026-06-24 16:16:38.472
22684	元気茶	げんきちゃ	genkicha	a fictitious tea	23	2026-06-24 16:16:38.474	2026-06-24 16:16:38.474
22685	本田駅	ほんだえき	hondaeki	a fictitious station	23	2026-06-24 16:16:38.475	2026-06-24 16:16:38.475
22686	図書館前	としょかんまえ	toshokanmae	a fictitious bus stop	23	2026-06-24 16:16:38.477	2026-06-24 16:16:38.477
22687	動きます［時計が～］	うごきます［とけいが～］	ugokimasu [tokeiga~]	chuyển động ,chạy	23	2026-06-24 16:16:38.48	2026-06-24 16:16:38.48
22688	気を つけます［車に～］	きを つけます［くるまに～］	kiwo tsukemasu [kurumani~]	chú ý,cẩn thận	23	2026-06-24 16:16:38.482	2026-06-24 16:16:38.482
22689	引っ越しします	ひっこしします	hikkoshishimasu	chuyển nhà	23	2026-06-24 16:16:38.484	2026-06-24 16:16:38.484
22690	電気屋	でんきや	denkiya	cửa hàng đồ điện	23	2026-06-24 16:16:38.485	2026-06-24 16:16:38.485
22691	～屋	～や	~ya	person of ～ shop	23	2026-06-24 16:16:38.487	2026-06-24 16:16:38.487
22692	機械	きかい	kikai	máy móc	23	2026-06-24 16:16:38.488	2026-06-24 16:16:38.488
22693	\N	つまみ	tsumami	núm vặn	23	2026-06-24 16:16:38.49	2026-06-24 16:16:38.49
22694	［お］正月	［お］しょうがつ	[o] shogatsu	New Year's Day	23	2026-06-24 16:16:38.491	2026-06-24 16:16:38.491
22695	\N	ごちそうさま［でした］。	gochisosama [deshita].	That was delicious. (said after eating or drinking)	23	2026-06-24 16:16:38.493	2026-06-24 16:16:38.493
22696	外国人登録証	がいこくじんとうろくしょう	gaikokujintorokusho	thẻ đăng kí người nước ngoài / thẻ đăng kí ngoại kiều	23	2026-06-24 16:16:38.495	2026-06-24 16:16:38.495
22697	\N	くれます	kuremasu	cho, tặng(tôi)	24	2026-06-24 16:16:38.627	2026-06-24 16:16:38.627
22698	直します	なおします	naoshimasu	repair, correct	24	2026-06-24 16:16:38.63	2026-06-24 16:16:38.63
22699	連れて 行きます	つれて いきます	tsurete ikimasu	dẫn đi	24	2026-06-24 16:16:38.632	2026-06-24 16:16:38.632
22700	連れて 来ます	つれて きます	tsurete kimasu	dẫn đến	24	2026-06-24 16:16:38.634	2026-06-24 16:16:38.634
22701	送ります［人を～］	おくります［ひとを～］	okurimasu [hitowo~]	đưa đi, đưa đến, tiễn	24	2026-06-24 16:16:38.636	2026-06-24 16:16:38.636
22702	紹介します	しょうかいします	shokaishimasu	giới thiệu	24	2026-06-24 16:16:38.638	2026-06-24 16:16:38.638
22703	案内します	あんないします	annaishimasu	hướng dẫn, chỉ đường	24	2026-06-24 16:16:38.64	2026-06-24 16:16:38.64
22704	説明します	せつめいします	setsumeishimasu	giải thích, trình bày	24	2026-06-24 16:16:38.642	2026-06-24 16:16:38.642
22705	\N	おじいさん／おじいちゃん	ojiisan/ojiichan	grandfather, old man	24	2026-06-24 16:16:38.644	2026-06-24 16:16:38.644
22706	\N	おばあさん／おばあちゃん	obasan/obachan	grandmother, old woman	24	2026-06-24 16:16:38.648	2026-06-24 16:16:38.648
22707	準備	じゅんび	junbi	chuẩn bị	24	2026-06-24 16:16:38.65	2026-06-24 16:16:38.65
22708	引っ越し	ひっこし	hikkoshi	moving out (～［を］します : move out)	24	2026-06-24 16:16:38.652	2026-06-24 16:16:38.652
22709	［お］菓子	［お］かし	[o] kashi	sweets, snacks	24	2026-06-24 16:16:38.654	2026-06-24 16:16:38.654
22710	\N	ホームステイ	homusutei	homestay	24	2026-06-24 16:16:38.656	2026-06-24 16:16:38.656
22711	全部	ぜんぶ	zenbu	toàn bộ, tất cả	24	2026-06-24 16:16:38.658	2026-06-24 16:16:38.658
22712	自分で	じぶんで	jibunde	tự mình	24	2026-06-24 16:16:38.661	2026-06-24 16:16:38.661
22713	\N	ほかに	hokani	ngoài ra, bên cạnh đó	24	2026-06-24 16:16:38.664	2026-06-24 16:16:38.664
22714	母の 日	ははの ひ	hahano hi	ngày của mẹ	24	2026-06-24 16:16:38.667	2026-06-24 16:16:38.667
22715	\N	いれます［コーヒーを～］	iremasu [kohiiwo~]	pha(cà phê)	24	2026-06-24 16:16:38.669	2026-06-24 16:16:38.669
22716	意味	いみ	imi	ý nghĩa	24	2026-06-24 16:16:38.671	2026-06-24 16:16:38.671
22717	ワゴン車	ワゴンしゃ	wagonsha	station wagon	24	2026-06-24 16:16:38.673	2026-06-24 16:16:38.673
22718	［お］弁当	［お］べんとう	[o] bento	box lunch	24	2026-06-24 16:16:38.675	2026-06-24 16:16:38.675
22719	考えます	かんがえます	kangaemasu	nghĩ, suy nghĩ	25	2026-06-24 16:16:38.806	2026-06-24 16:16:38.806
22720	着きます	つきます	tsukimasu	đến [ga]	25	2026-06-24 16:16:38.807	2026-06-24 16:16:38.807
22721	取ります［年を～］	とります［としを～］	torimasu [toshiwo~]	thêm [tuổi]	25	2026-06-24 16:16:38.808	2026-06-24 16:16:38.808
22722	足ります	たります	tarimasu	be enough, be sufficient	25	2026-06-24 16:16:38.81	2026-06-24 16:16:38.81
22723	田舎	いなか	inaka	quê, nông thôn	25	2026-06-24 16:16:38.812	2026-06-24 16:16:38.812
22724	\N	チャンス	chansu	cơ hội	25	2026-06-24 16:16:38.815	2026-06-24 16:16:38.815
22725	億	おく	oku	bên trong cùng, phía sâu bên trong	25	2026-06-24 16:16:38.816	2026-06-24 16:16:38.816
22726	\N	もし［～たら］	moshi [~tara]	nếu [~ thì]	25	2026-06-24 16:16:38.818	2026-06-24 16:16:38.818
22727	意味	いみ	imi	meaning	25	2026-06-24 16:16:38.819	2026-06-24 16:16:38.819
22728	\N	もしもし	moshimoshi	hello (used on the phone)	25	2026-06-24 16:16:38.821	2026-06-24 16:16:38.821
22729	転勤	てんきん	tenkin	việc chuyển địa điểm làm việc	25	2026-06-24 16:16:38.822	2026-06-24 16:16:38.822
22730	\N	こと	koto	việc (~のこと: việc ~)	25	2026-06-24 16:16:38.824	2026-06-24 16:16:38.824
22731	暇	ひま	hima	free time	25	2026-06-24 16:16:38.825	2026-06-24 16:16:38.825
22732	［いろいろ］お世話に なりました。	［いろいろ］おせわに なりました。	[iroiro] osewani narimashita.	Thank you for everything you've done for me.	25	2026-06-24 16:16:38.828	2026-06-24 16:16:38.828
22733	頑張ります	がんばります	ganbarimasu	cố, cố gắng	25	2026-06-24 16:16:38.83	2026-06-24 16:16:38.83
22734	どうぞ お元気で。	どうぞ おげんきで。	dozo ogenkide.	Chúc anh/chị mạnh khỏe.	25	2026-06-24 16:16:38.832	2026-06-24 16:16:38.832
22735	\N	ベトナム	betonamu	Vietnam	25	2026-06-24 16:16:38.834	2026-06-24 16:16:38.834
22736	留学します	りゅうがくします	ryugakushimasu	du học	25	2026-06-24 16:16:38.836	2026-06-24 16:16:38.836
22737	大使館	たいしかん	taishikan	đại sứ quán	25	2026-06-24 16:16:38.838	2026-06-24 16:16:38.838
22738	\N	グループ	gurupu	nhóm, đoàn	25	2026-06-24 16:16:38.839	2026-06-24 16:16:38.839
22739	\N	いくら［～でも］	ikura [~demo]	cho dù, thế nào [~ đi nữa]	25	2026-06-24 16:16:38.841	2026-06-24 16:16:38.841
22740	一杯 飲みましょう。	いっぱい のみましょう。	ippai nomimashou.	Chúng ta cùng uống nhé.	25	2026-06-24 16:16:38.842	2026-06-24 16:16:38.842
22741	見ます、診ます	みます	mimasu	xem, khám bệnh	26	2026-06-24 16:16:38.948	2026-06-24 16:16:38.948
22742	探します、捜します	さがします	sagashimasu	tìm, tìm kiếm	26	2026-06-24 16:16:38.95	2026-06-24 16:16:38.95
22743	遅れます［時間に～］	おくれます［じかんに～］	okuremasu [jikanni~]	chậm, muộn [cuộc hẹn,v.v.]	26	2026-06-24 16:16:38.951	2026-06-24 16:16:38.951
22744	間に 合います［時間に～］	まに あいます［じかんに～］	mani aimasu [jikanni~]	be in time [for an appointment, etc.]	26	2026-06-24 16:16:38.953	2026-06-24 16:16:38.953
22745	\N	やります	yarimasu	làm	26	2026-06-24 16:16:38.954	2026-06-24 16:16:38.954
22746	拾います	ひろいます	hiroimasu	pick up	26	2026-06-24 16:16:38.956	2026-06-24 16:16:38.956
22747	連絡します	れんらくします	renrakushimasu	liên lạc	26	2026-06-24 16:16:38.957	2026-06-24 16:16:38.957
22748	気分が いい	きぶんが いい	kibunga ii	cảm thấy tốt, cảm thấy khỏe	26	2026-06-24 16:16:38.958	2026-06-24 16:16:38.958
22749	気分が 悪い	きぶんが わるい	kibunga warui	cảm thấy không tốt, cảm thấy mệt	26	2026-06-24 16:16:38.96	2026-06-24 16:16:38.96
22750	運動会	うんどうかい	undokai	hội thi thể thao	26	2026-06-24 16:16:38.962	2026-06-24 16:16:38.962
22751	盆踊り	ぼんおどり	bon'odori	Bon Festival dance	26	2026-06-24 16:16:38.965	2026-06-24 16:16:38.965
22752	\N	フリーマーケット	furiimaketto	flea market	26	2026-06-24 16:16:38.966	2026-06-24 16:16:38.966
22753	場所	ばしょ	basho	địa điểm	26	2026-06-24 16:16:38.968	2026-06-24 16:16:38.968
22754	\N	ボランティア	boranteia	tình nguyện viên	26	2026-06-24 16:16:38.969	2026-06-24 16:16:38.969
22755	財布	さいふ	saifu	wallet, purse	26	2026-06-24 16:16:38.971	2026-06-24 16:16:38.971
22756	\N	ごみ	gomi	rác	26	2026-06-24 16:16:38.972	2026-06-24 16:16:38.972
22757	国会議事堂	こっかいぎじどう	kokkaigijido	the Diet Building	26	2026-06-24 16:16:38.974	2026-06-24 16:16:38.974
22758	平日	へいじつ	heijitsu	weekday	26	2026-06-24 16:16:38.975	2026-06-24 16:16:38.975
22759	～弁	～べん	~ben	tiếng ~, giọng ~	26	2026-06-24 16:16:38.978	2026-06-24 16:16:38.978
22760	今度	こんど	kondo	lần tới	26	2026-06-24 16:16:38.98	2026-06-24 16:16:38.98
22761	\N	ずいぶん	zuibun	khá, tương đối	26	2026-06-24 16:16:38.984	2026-06-24 16:16:38.984
22762	直接	ちょくせつ	chokusetsu	trực tiếp	26	2026-06-24 16:16:38.985	2026-06-24 16:16:38.985
22763	\N	いつでも	itsudemo	lúc nào cũng	26	2026-06-24 16:16:38.987	2026-06-24 16:16:38.987
22764	\N	どこでも	dokodemo	ở đâu cũng	26	2026-06-24 16:16:38.989	2026-06-24 16:16:38.989
22765	\N	だれでも	daredemo	ai cũng	26	2026-06-24 16:16:38.99	2026-06-24 16:16:38.99
22766	何でも	なんでも	nandemo	cái gì cũng	26	2026-06-24 16:16:38.991	2026-06-24 16:16:38.991
22767	\N	こんな ～	konna ~	~ như thế này	26	2026-06-24 16:16:38.993	2026-06-24 16:16:38.993
22768	\N	そんな ～	sonna ~	~ như thế đó (gần người nghe)	26	2026-06-24 16:16:38.995	2026-06-24 16:16:38.995
22769	\N	あんな ～	anna ~	~ như thế kia (xa cả người nói và người nghe)	26	2026-06-24 16:16:38.997	2026-06-24 16:16:38.997
22770	\N	エドアストア	edoasutoa	fictitious store	26	2026-06-24 16:16:38.999	2026-06-24 16:16:38.999
22771	片づきます［荷物が～］	かたづきます［にもつが～］	katazukimasu [nimotsuga~]	được dọn dẹp ngăn nắp, gọn gàng [đồ đạc ~]	26	2026-06-24 16:16:39.001	2026-06-24 16:16:39.001
22772	出します［ごみを～］	だします［ごみを～］	dashimasu [gomiwo~]	đổ, để [rác]	26	2026-06-24 16:16:39.002	2026-06-24 16:16:39.002
22773	燃える ごみ	もえる ごみ	moeru gomi	burnable rubbish	26	2026-06-24 16:16:39.004	2026-06-24 16:16:39.004
22774	置き場	おきば	okiba	nơi để	26	2026-06-24 16:16:39.006	2026-06-24 16:16:39.006
22775	横	よこ	yoko	bên cạnh	26	2026-06-24 16:16:39.007	2026-06-24 16:16:39.007
22776	瓶	びん	bin	cái chai	26	2026-06-24 16:16:39.009	2026-06-24 16:16:39.009
22777	缶	かん	kan	cái lon, hộp kim loại	26	2026-06-24 16:16:39.012	2026-06-24 16:16:39.012
22778	\N	ガス	gasu	ga	26	2026-06-24 16:16:39.015	2026-06-24 16:16:39.015
22779	～会社	～がいしゃ	~gaisha	công ty ~	26	2026-06-24 16:16:39.017	2026-06-24 16:16:39.017
22780	宇宙	うちゅう	uchu	vũ trụ	26	2026-06-24 16:16:39.019	2026-06-24 16:16:39.019
22781	～様	～さま	~sama	Mr. ～/Ms. ～ (respectful equivalent of ～さん)	26	2026-06-24 16:16:39.02	2026-06-24 16:16:39.02
22782	宇宙船	うちゅうせん	uchusen	tàu vũ trụ	26	2026-06-24 16:16:39.022	2026-06-24 16:16:39.022
22783	怖い	こわい	kowai	sợ	26	2026-06-24 16:16:39.024	2026-06-24 16:16:39.024
22784	宇宙ステーション	うちゅうステーション	uchusuteshon	space station	26	2026-06-24 16:16:39.025	2026-06-24 16:16:39.025
22785	違います	ちがいます	chigaimasu	be different	26	2026-06-24 16:16:39.028	2026-06-24 16:16:39.028
22786	宇宙飛行士	うちゅうひこうし	uchuhikoshi	nhà du hành vũ trụ	26	2026-06-24 16:16:39.031	2026-06-24 16:16:39.031
22787	星出彰彦	ほしであきひこ	hoshideakihiko	Japanese astronaut (1968-)	26	2026-06-24 16:16:39.034	2026-06-24 16:16:39.034
22788	参加します［パーティーに～］	さんかします［パーティーに～］	sankashimasu [pateiini~]	tham gia, dự [buổi tiệc]	26	2026-06-24 16:16:39.036	2026-06-24 16:16:39.036
22789	申し込みます	もうしこみます	moshikomimasu	đăng ký	26	2026-06-24 16:16:39.038	2026-06-24 16:16:39.038
22790	都合が いい	つごうが いい	tsugoga ii	có thời gian, thuận tiện	26	2026-06-24 16:16:39.04	2026-06-24 16:16:39.04
22791	都合が 悪い	つごうが わるい	tsugoga warui	không có thời gian, bận, không thuận tiện	26	2026-06-24 16:16:39.041	2026-06-24 16:16:39.041
22792	新聞社	しんぶんしゃ	shinbunsha	công ty phát hành báo, tòa soạn báo	26	2026-06-24 16:16:39.045	2026-06-24 16:16:39.045
22793	柔道	じゅうどう	judo	Judo (nhu đạo)	26	2026-06-24 16:16:39.049	2026-06-24 16:16:39.049
22794	\N	NHK	NHK	Nippon Hoso Kyokai (broadcasting company)	26	2026-06-24 16:16:39.051	2026-06-24 16:16:39.051
22795	こどもの 日	こどもの ひ	kodomono hi	ngày trẻ em	26	2026-06-24 16:16:39.053	2026-06-24 16:16:39.053
22796	燃えます［ごみが～］	もえます［ごみが～］	moemasu [gomiga~]	cháy được [rác ~]	26	2026-06-24 16:16:39.055	2026-06-24 16:16:39.055
22797	月・水・金	げっすいきん	gessuikin	Monday, Wednesday and Friday	26	2026-06-24 16:16:39.056	2026-06-24 16:16:39.056
22798	［お］湯	［お］ゆ	[o] yu	hot water	26	2026-06-24 16:16:39.058	2026-06-24 16:16:39.058
22799	困ったなあ。	こまったなあ。	komattana.	Làm thế nào đây!/ căng quá nhỉ!/ gay quá!	26	2026-06-24 16:16:39.059	2026-06-24 16:16:39.059
22800	電子メール	でんしメール	denshimeru	thư điện tử, e-mail	26	2026-06-24 16:16:39.063	2026-06-24 16:16:39.063
22801	別の	べつの	betsuno	khác	26	2026-06-24 16:16:39.066	2026-06-24 16:16:39.066
22802	土井隆雄	どいたかお	doitakao	nhà du hành vũ trụ người Nhật (1954- )	26	2026-06-24 16:16:39.068	2026-06-24 16:16:39.068
22803	飼います	かいます	kaimasu	nuôi,chăn nuôi	27	2026-06-24 16:16:39.191	2026-06-24 16:16:39.191
22804	走ります［道を～］	はしります［みちを～］	hashirimasu [michiwo~]	chạy	27	2026-06-24 16:16:39.193	2026-06-24 16:16:39.193
22805	見えます［山が～］	みえます［やまが～］	miemasu [yamaga~]	có thể nhìn thấy	27	2026-06-24 16:16:39.196	2026-06-24 16:16:39.196
22806	聞こえます［音が～］	きこえます［おとが～］	kikoemasu [otoga~]	có thể nghe thấy	27	2026-06-24 16:16:39.198	2026-06-24 16:16:39.198
22807	できます［道が～］	できます［みちが～］	dekimasu [michiga~]	được hoàn thành,được làm	27	2026-06-24 16:16:39.199	2026-06-24 16:16:39.199
22808	開きます［教室を～］	ひらきます［きょうしつを～］	hirakimasu [kyoshitsuwo~]	mở,tổ chức (lớp)	27	2026-06-24 16:16:39.201	2026-06-24 16:16:39.201
22809	心配［な］	しんぱい［な］	shinpai [na]	worried, anxious	27	2026-06-24 16:16:39.202	2026-06-24 16:16:39.202
22810	\N	ペット	petto	thú cưng,động vật nuôi	27	2026-06-24 16:16:39.204	2026-06-24 16:16:39.204
22811	鳥	とり	tori	chim	27	2026-06-24 16:16:39.205	2026-06-24 16:16:39.205
22812	声	こえ	koe	tiếng,giọng nói	27	2026-06-24 16:16:39.207	2026-06-24 16:16:39.207
22813	波	なみ	nami	sóng	27	2026-06-24 16:16:39.209	2026-06-24 16:16:39.209
22814	花火	はなび	hanabi	pháo hoa	27	2026-06-24 16:16:39.212	2026-06-24 16:16:39.212
22815	道具	どうぐ	dogu	dụng cụ	27	2026-06-24 16:16:39.215	2026-06-24 16:16:39.215
22816	\N	クリーニング	kuriiningu	giặt ủi	27	2026-06-24 16:16:39.217	2026-06-24 16:16:39.217
22817	家	いえ	ie	nhà	27	2026-06-24 16:16:39.219	2026-06-24 16:16:39.219
22818	\N	マンション	manshon	chung cư	27	2026-06-24 16:16:39.221	2026-06-24 16:16:39.221
22819	\N	キッチン	kitchin	kitchen	27	2026-06-24 16:16:39.223	2026-06-24 16:16:39.223
22820	～教室	～きょうしつ	~kyoshitsu	lớp học	27	2026-06-24 16:16:39.225	2026-06-24 16:16:39.225
22821	\N	パーティールーム	pateiirumu	phòng tiệc	27	2026-06-24 16:16:39.227	2026-06-24 16:16:39.227
22822	方	かた	kata	person (respectful of ひと)	27	2026-06-24 16:16:39.23	2026-06-24 16:16:39.23
22823	～後	～ご	~go	after ～ (duration of time)	27	2026-06-24 16:16:39.233	2026-06-24 16:16:39.233
22824	\N	～しか	~shika	chỉ	27	2026-06-24 16:16:39.235	2026-06-24 16:16:39.235
22825	\N	ほかの	hokano	other	27	2026-06-24 16:16:39.237	2026-06-24 16:16:39.237
22826	\N	はっきり	hakkiri	clearly	27	2026-06-24 16:16:39.239	2026-06-24 16:16:39.239
22827	家具	かぐ	kagu	furniture	27	2026-06-24 16:16:39.241	2026-06-24 16:16:39.241
22828	本棚	ほんだな	hondana	kệ sách,giá sách	27	2026-06-24 16:16:39.244	2026-06-24 16:16:39.244
22829	\N	いつか	itsuka	một ngày nào đó	27	2026-06-24 16:16:39.247	2026-06-24 16:16:39.247
22830	建てます	たてます	tatemasu	xây dựng	27	2026-06-24 16:16:39.25	2026-06-24 16:16:39.25
22831	\N	すばらしい	subarashii	tuyệt vời	27	2026-06-24 16:16:39.253	2026-06-24 16:16:39.253
22832	子どもたち	こどもたち	kodomotachi	bọn trẻ	27	2026-06-24 16:16:39.256	2026-06-24 16:16:39.256
22833	大好き［な］	だいすき［な］	daisuki [na]	rất thích	27	2026-06-24 16:16:39.259	2026-06-24 16:16:39.259
22834	主人公	しゅじんこう	shujinko	nhân vật chính	27	2026-06-24 16:16:39.263	2026-06-24 16:16:39.263
22835	形	かたち	katachi	hình dạng	27	2026-06-24 16:16:39.265	2026-06-24 16:16:39.265
22836	不思議［な］	ふしぎ［な］	fushigi [na]	fantastic, mysterious	27	2026-06-24 16:16:39.268	2026-06-24 16:16:39.268
22837	\N	ポケット	poketto	túi	27	2026-06-24 16:16:39.272	2026-06-24 16:16:39.272
22838	例えば	たとえば	tatoeba	ví dụ	27	2026-06-24 16:16:39.274	2026-06-24 16:16:39.274
22839	付けます	つけます	tsukemasu	lắp ghép	27	2026-06-24 16:16:39.277	2026-06-24 16:16:39.277
22840	自由に	じゆうに	jiyuni	tự do	27	2026-06-24 16:16:39.281	2026-06-24 16:16:39.281
22841	空	そら	sora	bầu trời	27	2026-06-24 16:16:39.283	2026-06-24 16:16:39.283
22842	飛びます	とびます	tobimasu	bay	27	2026-06-24 16:16:39.285	2026-06-24 16:16:39.285
22843	昔	むかし	mukashi	ngày xưa	27	2026-06-24 16:16:39.287	2026-06-24 16:16:39.287
22844	自分	じぶん	jibun	tự mình	27	2026-06-24 16:16:39.29	2026-06-24 16:16:39.29
22845	将来	しょうらい	shorai	tương lai	27	2026-06-24 16:16:39.292	2026-06-24 16:16:39.292
22846	\N	ドラえもん	doraemon	đô-rê-mon	27	2026-06-24 16:16:39.295	2026-06-24 16:16:39.295
22847	取ります［休みを～］	とります［やすみを～］	torimasu [yasumiwo~]	xin(nghỉ)	27	2026-06-24 16:16:39.297	2026-06-24 16:16:39.297
22848	景色	けしき	keshiki	phong cảnh	27	2026-06-24 16:16:39.301	2026-06-24 16:16:39.301
22849	昼間	ひるま	hiruma	ban ngày	27	2026-06-24 16:16:39.303	2026-06-24 16:16:39.303
22850	自動販売機	じどうはんばいき	jidohanbaiki	máy bán hàng tự động	27	2026-06-24 16:16:39.305	2026-06-24 16:16:39.305
22851	通信販売	つうしんはんばい	tsushinhanbai	thương mại viễn thông	27	2026-06-24 16:16:39.307	2026-06-24 16:16:39.307
22852	台所	だいどころ	daidokoro	nhà bếp	27	2026-06-24 16:16:39.308	2026-06-24 16:16:39.308
22853	\N	ほとんど	hotondo	almost all (in affirmative sentences), hardly, scarcely (in negative sentences)	27	2026-06-24 16:16:39.311	2026-06-24 16:16:39.311
22854	関西空港	かんさいくうこう	kansaikuko	sân bay Kansai	27	2026-06-24 16:16:39.314	2026-06-24 16:16:39.314
22855	秋葉原	あきはばら	akihabara	khu bán đồ điện tử nổi tiếng ở Tokyo	27	2026-06-24 16:16:39.317	2026-06-24 16:16:39.317
22856	伊豆	いず	izu	một đảo thuộc tỉnh Shizuoka	27	2026-06-24 16:16:39.319	2026-06-24 16:16:39.319
22857	日曜大工	にちようだいく	nichiyodaiku	Sunday carpenter	27	2026-06-24 16:16:39.321	2026-06-24 16:16:39.321
22858	夢	ゆめ	yume	mơ	27	2026-06-24 16:16:39.322	2026-06-24 16:16:39.322
22859	漫画	まんが	manga	truyện tranh	27	2026-06-24 16:16:39.324	2026-06-24 16:16:39.324
22860	\N	ロボット	robotto	người máy	27	2026-06-24 16:16:39.326	2026-06-24 16:16:39.326
22861	売れます［パンが～］	うれます［パンが～］	uremasu [panga~]	bán	28	2026-06-24 16:16:39.462	2026-06-24 16:16:39.462
22862	踊ります	おどります	odorimasu	nhảy	28	2026-06-24 16:16:39.464	2026-06-24 16:16:39.464
22863	\N	かみます	kamimasu	nhai,cắn	28	2026-06-24 16:16:39.466	2026-06-24 16:16:39.466
22864	選びます	えらびます	erabimasu	lựa, lựa chọn	28	2026-06-24 16:16:39.468	2026-06-24 16:16:39.468
22865	通います［大学に～］	かよいます［だいがくに～］	kayoimasu [daigakuni~]	đi học(đại học)	28	2026-06-24 16:16:39.469	2026-06-24 16:16:39.469
22866	\N	メモします	memoshimasu	ghi chép lại,ghi lại	28	2026-06-24 16:16:39.472	2026-06-24 16:16:39.472
22867	\N	まじめ［な］	majime [na]	nghiêm túc,đàng hoàng	28	2026-06-24 16:16:39.474	2026-06-24 16:16:39.474
22868	熱心［な］	ねっしん［な］	nesshin [na]	nhiệt tình	28	2026-06-24 16:16:39.476	2026-06-24 16:16:39.476
22869	偉い	えらい	erai	vĩ đại, kính trọng	28	2026-06-24 16:16:39.479	2026-06-24 16:16:39.479
22870	\N	ちょうど いい	chodo ii	vừa đúng,vừa vặn	28	2026-06-24 16:16:39.481	2026-06-24 16:16:39.481
22871	景色	けしき	keshiki	scenery, view	28	2026-06-24 16:16:39.483	2026-06-24 16:16:39.483
22872	美容院	びよういん	biyoin	hair salon	28	2026-06-24 16:16:39.485	2026-06-24 16:16:39.485
22873	台所	だいどころ	daidokoro	kitchen	28	2026-06-24 16:16:39.486	2026-06-24 16:16:39.486
22874	経験	けいけん	keiken	kinh nghiệm	28	2026-06-24 16:16:39.487	2026-06-24 16:16:39.487
22875	力	ちから	chikara	sức mạnh	28	2026-06-24 16:16:39.489	2026-06-24 16:16:39.489
22876	人気	にんき	ninki	hâm mộ	28	2026-06-24 16:16:39.49	2026-06-24 16:16:39.49
22877	形	かたち	katachi	hình dáng	28	2026-06-24 16:16:39.492	2026-06-24 16:16:39.492
22878	色	いろ	iro	màu	28	2026-06-24 16:16:39.493	2026-06-24 16:16:39.493
22879	味	あじ	aji	vị	28	2026-06-24 16:16:39.497	2026-06-24 16:16:39.497
22880	\N	ガム	gamu	kẹo cao su	28	2026-06-24 16:16:39.499	2026-06-24 16:16:39.499
22881	品物	しなもの	shinamono	hàng hóa	28	2026-06-24 16:16:39.501	2026-06-24 16:16:39.501
22882	値段	ねだん	nedan	giá cả	28	2026-06-24 16:16:39.502	2026-06-24 16:16:39.502
22883	給料	きゅうりょう	kyuryo	lương	28	2026-06-24 16:16:39.504	2026-06-24 16:16:39.504
22884	\N	ボーナス	bonasu	thưởng	28	2026-06-24 16:16:39.505	2026-06-24 16:16:39.505
22885	\N	ゲーム	gemu	(computer) game	28	2026-06-24 16:16:39.506	2026-06-24 16:16:39.506
22886	番組	ばんぐみ	bangumi	chương trình(truyền hình,phát thanh,..)	28	2026-06-24 16:16:39.508	2026-06-24 16:16:39.508
22887	\N	ドラマ	dorama	kịch,phim truyền hình	28	2026-06-24 16:16:39.509	2026-06-24 16:16:39.509
22888	歌手	かしゅ	kashu	ca sĩ	28	2026-06-24 16:16:39.512	2026-06-24 16:16:39.512
22889	小説	しょうせつ	shosetsu	tiểu thuyết	28	2026-06-24 16:16:39.515	2026-06-24 16:16:39.515
22890	小説家	しょうせつか	shosetsuka	tiểu thuyết gia, nhà văn	28	2026-06-24 16:16:39.517	2026-06-24 16:16:39.517
22891	～家	～か	~ka	-er, -ist, etc. (e.g. painter, novelist)	28	2026-06-24 16:16:39.519	2026-06-24 16:16:39.519
22892	～機	～き	~ki	～ machine	28	2026-06-24 16:16:39.52	2026-06-24 16:16:39.52
22893	息子	むすこ	musuko	con trai(dùng cho mình)	28	2026-06-24 16:16:39.522	2026-06-24 16:16:39.522
22894	息子さん	むすこさん	musukosan	con trai(dùng cho người khác)	28	2026-06-24 16:16:39.524	2026-06-24 16:16:39.524
22895	娘	むすめ	musume	con gái(dùng cho mình)	28	2026-06-24 16:16:39.525	2026-06-24 16:16:39.525
22896	娘さん	むすめさん	musumesan	con gái(dùng cho người khác)	28	2026-06-24 16:16:39.529	2026-06-24 16:16:39.529
22897	自分	じぶん	jibun	bản thân	28	2026-06-24 16:16:39.532	2026-06-24 16:16:39.532
22898	将来	しょうらい	shorai	tương lai	28	2026-06-24 16:16:39.534	2026-06-24 16:16:39.534
22899	\N	しばらく	shibaraku	một khoảng thời gian ngắn, một chút, một lát	28	2026-06-24 16:16:39.536	2026-06-24 16:16:39.536
22900	\N	たいてい	taitei	thường, thông thường	28	2026-06-24 16:16:39.537	2026-06-24 16:16:39.537
22901	\N	それに	soreni	ngoài ra	28	2026-06-24 16:16:39.539	2026-06-24 16:16:39.539
22902	\N	それで	sorede	do đó	28	2026-06-24 16:16:39.541	2026-06-24 16:16:39.541
22903	［ちょっと］お願いが あるんですが。	［ちょっと］おねがいが あるんですが。	[chotto] onegaiga arundesuga.	I have a [small] favor to ask.	28	2026-06-24 16:16:39.544	2026-06-24 16:16:39.544
22904	実は	じつは	jitsuwa	as a matter of fact	28	2026-06-24 16:16:39.548	2026-06-24 16:16:39.548
22905	会話	かいわ	kaiwa	hội thoại	28	2026-06-24 16:16:39.55	2026-06-24 16:16:39.55
22906	\N	うーん	uun	well, let me see, hmm...	28	2026-06-24 16:16:39.552	2026-06-24 16:16:39.552
22907	お知らせ	おしらせ	oshirase	thông báo	28	2026-06-24 16:16:39.554	2026-06-24 16:16:39.554
22908	参加します	さんかします	sankashimasu	participate, join, attend	28	2026-06-24 16:16:39.557	2026-06-24 16:16:39.557
22909	日にち	ひにち	hinichi	ngày	28	2026-06-24 16:16:39.559	2026-06-24 16:16:39.559
22910	土	ど	do	thứ 7	28	2026-06-24 16:16:39.563	2026-06-24 16:16:39.563
22911	体育館	たいいくかん	taiikukan	gymnasium	28	2026-06-24 16:16:39.567	2026-06-24 16:16:39.567
22912	無料	むりょう	muryo	miễn phí	28	2026-06-24 16:16:39.569	2026-06-24 16:16:39.569
22913	誘います	さそいます	sasoimasu	invite, ask someone to join	28	2026-06-24 16:16:39.572	2026-06-24 16:16:39.572
22914	\N	イベント	ibento	event	28	2026-06-24 16:16:39.574	2026-06-24 16:16:39.574
22915	違います	ちがいます	chigaimasu	be different	28	2026-06-24 16:16:39.576	2026-06-24 16:16:39.576
22916	優しい	やさしい	yasashii	phong cảnh	28	2026-06-24 16:16:39.581	2026-06-24 16:16:39.581
22917	習慣	しゅうかん	shukan	tập quán	28	2026-06-24 16:16:39.585	2026-06-24 16:16:39.585
22918	管理人	かんりにん	kanrinin	người quản lí	28	2026-06-24 16:16:39.588	2026-06-24 16:16:39.588
22919	\N	ホームステイ	homusutei	homestay	28	2026-06-24 16:16:39.59	2026-06-24 16:16:39.59
22920	\N	おしゃべりします	oshaberishimasu	trò chuyện	28	2026-06-24 16:16:39.592	2026-06-24 16:16:39.592
22921	開きます［ドアが～］	あきます［ドアが～］	akimasu [doaga~]	mở (cửa)	29	2026-06-24 16:16:39.696	2026-06-24 16:16:39.696
22922	閉まりる［ドアが～］	しまります［ドアが～］	shimarimasu [doaga~]	đóng(cửa)	29	2026-06-24 16:16:39.698	2026-06-24 16:16:39.698
22923	つきます［電気が～］	つきます［でんきが～］	tsukimasu [denkiga~]	dính, đính (có túi)	29	2026-06-24 16:16:39.7	2026-06-24 16:16:39.7
22924	消えます［電気が～］	きえます［でんきが～］	kiemasu [denkiga~]	tắt(đèn)	29	2026-06-24 16:16:39.702	2026-06-24 16:16:39.702
22925	壊れます［いすが～］	こわれます［いすが～］	kowaremasu [isuga~]	hỏng(ghế)	29	2026-06-24 16:16:39.704	2026-06-24 16:16:39.704
22926	割れます［コップが～］	われます［コップが～］	waremasu [koppuga~]	có thể nghe thấy	29	2026-06-24 16:16:39.706	2026-06-24 16:16:39.706
22927	折れます［木が～］	おれます［きが～］	oremasu [kiga~]	gãy(cây)	29	2026-06-24 16:16:39.709	2026-06-24 16:16:39.709
22928	破れます［紙が～］	やぶれます［かみが～］	yaburemasu [kamiga~]	rách(giấy)	29	2026-06-24 16:16:39.712	2026-06-24 16:16:39.712
22929	汚れます［服が～］	よごれます［ふくが～］	yogoremasu [fukuga~]	dơ,bẩn(tay)	29	2026-06-24 16:16:39.714	2026-06-24 16:16:39.714
22930	付きます［ポケットが～］	つきます［ポケットが～］	tsukimasu [pokettoga~]	dính, đính (có túi)	29	2026-06-24 16:16:39.716	2026-06-24 16:16:39.716
22931	外れます［ボタンが～］	はずれます［ボタンが～］	hazuremasu [botanga~]	tuột,bung,rời ra(sút nút)	29	2026-06-24 16:16:39.718	2026-06-24 16:16:39.718
22932	止まります［車が～］	とまります［くるまが～］	tomarimasu [kurumaga~]	dừng	29	2026-06-24 16:16:39.72	2026-06-24 16:16:39.72
22933	\N	まちがえます	machigaemasu	nhầm lẫn,sai	29	2026-06-24 16:16:39.722	2026-06-24 16:16:39.722
22934	落します	おとします	otoshimasu	làm rơi,rớt	29	2026-06-24 16:16:39.724	2026-06-24 16:16:39.724
22935	掛かります［かぎが～］	かかります［かぎが～］	kakarimasu [kagiga~]	khóa	29	2026-06-24 16:16:39.725	2026-06-24 16:16:39.725
22936	\N	ふきます	fukimasu	lau(cửa)	29	2026-06-24 16:16:39.728	2026-06-24 16:16:39.728
22937	取り替えます	とりかえます	torikaemasu	thay(pin)	29	2026-06-24 16:16:39.73	2026-06-24 16:16:39.73
22938	片付けます	かたづけます	katazukemasu	dọn dẹp	29	2026-06-24 16:16:39.732	2026-06-24 16:16:39.732
22939	［お］皿	［お］さら	[o] sara	đĩa	29	2026-06-24 16:16:39.734	2026-06-24 16:16:39.734
22940	\N	［お］ちゃわん	[o] chawan	bát,chén	29	2026-06-24 16:16:39.735	2026-06-24 16:16:39.735
22941	\N	コップ	koppu	cốc	29	2026-06-24 16:16:39.737	2026-06-24 16:16:39.737
22942	\N	ガラス	garasu	ly	29	2026-06-24 16:16:39.738	2026-06-24 16:16:39.738
22943	袋	ふくろ	fukuro	túi	29	2026-06-24 16:16:39.74	2026-06-24 16:16:39.74
22944	書類	しょるい	shorui	giấy tờ	29	2026-06-24 16:16:39.742	2026-06-24 16:16:39.742
22945	枝	えだ	eda	cành cây	29	2026-06-24 16:16:39.745	2026-06-24 16:16:39.745
22946	駅員	えきいん	ekiin	nhân viên nhà ga	29	2026-06-24 16:16:39.748	2026-06-24 16:16:39.748
22947	交番	こうばん	koban	đồn cảnh sát,bốt cảnh sát	29	2026-06-24 16:16:39.75	2026-06-24 16:16:39.75
22948	\N	スピーチ	supiichi	diễn văn	29	2026-06-24 16:16:39.752	2026-06-24 16:16:39.752
22949	返事	へんじ	henji	trả lời	29	2026-06-24 16:16:39.754	2026-06-24 16:16:39.754
22950	お先に どうぞ。	おさきに どうぞ。	osakini dozo.	Xin mời anh/chị đi trước.	29	2026-06-24 16:16:39.755	2026-06-24 16:16:39.755
22951	源氏物語	げんじものがたり	genjimonogatari	tiểu thuyết được viết thời heian	29	2026-06-24 16:16:39.757	2026-06-24 16:16:39.757
22952	今の 電車	いまの でんしゃ	imano densha	tàu điện vừa chạy	29	2026-06-24 16:16:39.759	2026-06-24 16:16:39.759
22953	忘れ物	わすれもの	wasuremono	đồ bỏ quên	29	2026-06-24 16:16:39.761	2026-06-24 16:16:39.761
22954	\N	このくらい	konokurai	cỡ tầm này,cỡ chừng này	29	2026-06-24 16:16:39.764	2026-06-24 16:16:39.764
22955	～側	～がわ	~gawa	～ side	29	2026-06-24 16:16:39.766	2026-06-24 16:16:39.766
22956	\N	ポケット	poketto	túi	29	2026-06-24 16:16:39.767	2026-06-24 16:16:39.767
22957	～ 辺	～ へん	~ hen	around ～, ～ about	29	2026-06-24 16:16:39.769	2026-06-24 16:16:39.769
22958	覚えて いません。	おぼえて いません。	oboete imasen.	tôi không nhớ	29	2026-06-24 16:16:39.77	2026-06-24 16:16:39.77
22959	網棚	あみだな	amidana	giá để hành lý	29	2026-06-24 16:16:39.772	2026-06-24 16:16:39.772
22960	確か	たしか	tashika	chắc là	29	2026-06-24 16:16:39.774	2026-06-24 16:16:39.774
22961	\N	［ああ、］よかった。	[a,] yokatta.	ôi, may quá	29	2026-06-24 16:16:39.775	2026-06-24 16:16:39.775
22962	新宿	しんじゅく	shinjuku	name of a station/district in Tokyo	29	2026-06-24 16:16:39.778	2026-06-24 16:16:39.778
22963	地震	じしん	jishin	động đất	29	2026-06-24 16:16:39.78	2026-06-24 16:16:39.78
22964	壁	かべ	kabe	bức tường	29	2026-06-24 16:16:39.782	2026-06-24 16:16:39.782
22965	針	はり	hari	kim đồng hồ	29	2026-06-24 16:16:39.784	2026-06-24 16:16:39.784
22966	指します	さします	sashimasu	chỉ	29	2026-06-24 16:16:39.786	2026-06-24 16:16:39.786
22967	駅前	えきまえ	ekimae	trước ga	29	2026-06-24 16:16:39.787	2026-06-24 16:16:39.787
22968	倒れます	たおれます	taoremasu	đổ	29	2026-06-24 16:16:39.789	2026-06-24 16:16:39.789
22969	西	にし	nishi	west	29	2026-06-24 16:16:39.791	2026-06-24 16:16:39.791
22970	～の 方	～の ほう	~no hou	direction of ～	29	2026-06-24 16:16:39.793	2026-06-24 16:16:39.793
22971	燃えます	もえます	moemasu	cháy	29	2026-06-24 16:16:39.796	2026-06-24 16:16:39.796
22972	\N	レポーター	repota	reporter	29	2026-06-24 16:16:39.798	2026-06-24 16:16:39.798
22973	込みます［道が～］	こみます［みちが～］	komimasu [michiga~]	đông(đường)	29	2026-06-24 16:16:39.801	2026-06-24 16:16:39.801
22974	すきます［道が～］	すきます［みちが～］	sukimasu [michiga~]	vắng, thoáng [đường ~]	29	2026-06-24 16:16:39.803	2026-06-24 16:16:39.803
22975	財布	さいふ	saifu	wallet, purse	29	2026-06-24 16:16:39.805	2026-06-24 16:16:39.805
22976	この 辺	この へん	kono hen	this neighborhood, around here	29	2026-06-24 16:16:39.807	2026-06-24 16:16:39.807
22977	四ツ谷	よつや	yotsuya	name of a station in Tokyo	29	2026-06-24 16:16:39.811	2026-06-24 16:16:39.811
22978	方	ほう	ho	direction	29	2026-06-24 16:16:39.814	2026-06-24 16:16:39.814
22979	三宮	さんのみや	sannomiya	name of a place in Kobe	29	2026-06-24 16:16:39.816	2026-06-24 16:16:39.816
22980	\N	はります	harimasu	dán	30	2026-06-24 16:16:39.957	2026-06-24 16:16:39.957
22981	掛けます	かけます	kakemasu	treo	30	2026-06-24 16:16:39.961	2026-06-24 16:16:39.961
22982	飾ります	かざります	kazarimasu	trang trí	30	2026-06-24 16:16:39.965	2026-06-24 16:16:39.965
22983	並べます	ならべます	narabemasu	xếp thành hàng	30	2026-06-24 16:16:39.967	2026-06-24 16:16:39.967
22984	植えます	うえます	uemasu	trồng (cây)	30	2026-06-24 16:16:39.969	2026-06-24 16:16:39.969
22985	戻します	もどします	modoshimasu	đưa về, trả về	30	2026-06-24 16:16:39.971	2026-06-24 16:16:39.971
22986	\N	まとめます	matomemasu	nhóm lại, tóm tắt	30	2026-06-24 16:16:39.973	2026-06-24 16:16:39.973
22987	\N	しまいます	shimaimasu	cất vào, để vào	30	2026-06-24 16:16:39.976	2026-06-24 16:16:39.976
22988	決めます	きめます	kimemasu	quyết định	30	2026-06-24 16:16:39.98	2026-06-24 16:16:39.98
22989	予習します	よしゅうします	yoshushimasu	chuẩn bị bài mới	30	2026-06-24 16:16:39.982	2026-06-24 16:16:39.982
22990	復習します	ふくしゅうします	fukushushimasu	ôn bài cũ	30	2026-06-24 16:16:39.984	2026-06-24 16:16:39.984
22991	\N	そのままに します	sonomamani shimasu	để nguyên như thế	30	2026-06-24 16:16:39.986	2026-06-24 16:16:39.986
22992	授業	じゅぎょう	jugyo	giờ học	30	2026-06-24 16:16:39.988	2026-06-24 16:16:39.988
22993	講義	こうぎ	kogi	bài giảng	30	2026-06-24 16:16:39.99	2026-06-24 16:16:39.99
22994	\N	ミーティング	miiteingu	meeting	30	2026-06-24 16:16:39.995	2026-06-24 16:16:39.995
22995	予定	よてい	yotei	kế hoạch, dự định	30	2026-06-24 16:16:39.998	2026-06-24 16:16:39.998
22996	お知らせ	おしらせ	oshirase	bản thông báo	30	2026-06-24 16:16:40.001	2026-06-24 16:16:40.001
22997	\N	ガイドブック	gaidobukku	guidebook	30	2026-06-24 16:16:40.004	2026-06-24 16:16:40.004
22998	\N	カレンダー	karenda	lịch, tờ lịch	30	2026-06-24 16:16:40.007	2026-06-24 16:16:40.007
22999	\N	ポスター	posuta	tờ quảng cáo, tờ áp phích	30	2026-06-24 16:16:40.01	2026-06-24 16:16:40.01
23000	予定表	よていひょう	yoteihyo	thời khóa biểu, lịch	30	2026-06-24 16:16:40.015	2026-06-24 16:16:40.015
23001	ごみ箱	ごみばこ	gomibako	thùng rác	30	2026-06-24 16:16:40.018	2026-06-24 16:16:40.018
23002	人形	にんぎょう	ningyo	con búp bê, con rối	30	2026-06-24 16:16:40.022	2026-06-24 16:16:40.022
23003	花瓶	かびん	kabin	lọ hoa	30	2026-06-24 16:16:40.024	2026-06-24 16:16:40.024
23004	鏡	かがみ	kagami	cái gương	30	2026-06-24 16:16:40.028	2026-06-24 16:16:40.028
23005	引き出し	ひきだし	hikidashi	ngăn kéo	30	2026-06-24 16:16:40.031	2026-06-24 16:16:40.031
23006	玄関	げんかん	genkan	cửa vào	30	2026-06-24 16:16:40.034	2026-06-24 16:16:40.034
23007	廊下	ろうか	roka	hành lang	30	2026-06-24 16:16:40.036	2026-06-24 16:16:40.036
23008	壁	かべ	kabe	bức tường	30	2026-06-24 16:16:40.039	2026-06-24 16:16:40.039
23009	池	いけ	ike	cái ao	30	2026-06-24 16:16:40.041	2026-06-24 16:16:40.041
23010	元の 所	もとの ところ	motono tokoro	địa điểm ban đầu	30	2026-06-24 16:16:40.044	2026-06-24 16:16:40.044
23011	周り	まわり	mawari	xung quanh	30	2026-06-24 16:16:40.047	2026-06-24 16:16:40.047
23012	真ん中	まんなか	mannaka	giữa, trung tâm	30	2026-06-24 16:16:40.05	2026-06-24 16:16:40.05
23013	隅	すみ	sumi	góc	30	2026-06-24 16:16:40.053	2026-06-24 16:16:40.053
23014	\N	まだ	mada	chưa	30	2026-06-24 16:16:40.055	2026-06-24 16:16:40.055
23015	\N	リュック	ryukku	rucksack	30	2026-06-24 16:16:40.057	2026-06-24 16:16:40.057
23016	非常袋	ひじょうぶくろ	hijobukuro	emergency kit	30	2026-06-24 16:16:40.06	2026-06-24 16:16:40.06
23017	非常時	ひじょうじ	hijoji	emergency	30	2026-06-24 16:16:40.063	2026-06-24 16:16:40.063
23018	生活します	せいかつします	seikatsushimasu	live	30	2026-06-24 16:16:40.066	2026-06-24 16:16:40.066
23019	懐中電灯	かいちゅうでんとう	kaijudento	torch, flashlight	30	2026-06-24 16:16:40.068	2026-06-24 16:16:40.068
23020	\N	～とか、～とか	~toka, ~toka	～, ～, and so on	30	2026-06-24 16:16:40.07	2026-06-24 16:16:40.07
23021	丸い	まるい	marui	tròn	30	2026-06-24 16:16:40.072	2026-06-24 16:16:40.072
23022	\N	ある ～	aru ~	one ～, a certain ～	30	2026-06-24 16:16:40.075	2026-06-24 16:16:40.075
23023	夢を 見ます	ゆめを みます	yumewo mimasu	dream	30	2026-06-24 16:16:40.078	2026-06-24 16:16:40.078
23024	\N	うれしい	ureshii	vui	30	2026-06-24 16:16:40.081	2026-06-24 16:16:40.081
23025	嫌［な］	いや［な］	iya [na]	chán, ghét, không chấp nhận được	30	2026-06-24 16:16:40.084	2026-06-24 16:16:40.084
23026	\N	すると	suruto	sau đó, tiếp đó	30	2026-06-24 16:16:40.086	2026-06-24 16:16:40.086
23027	目が 覚めます	めが さめます	mega samemasu	tỉnh giấc, mở mắt	30	2026-06-24 16:16:40.088	2026-06-24 16:16:40.088
23028	片付けます	かたづけます	katazukemasu	dọn dẹp, sắp xếp	30	2026-06-24 16:16:40.091	2026-06-24 16:16:40.091
23029	知らせます	しらせます	shirasemasu	thông báo	30	2026-06-24 16:16:40.093	2026-06-24 16:16:40.093
23030	相談します	そうだんします	sodanshimasu	thảo luận, trao đổi , bàn bạc	30	2026-06-24 16:16:40.096	2026-06-24 16:16:40.096
23031	お子さん	おこさん	okosan	con (dùng đối với người khác)	30	2026-06-24 16:16:40.098	2026-06-24 16:16:40.098
23032	案内書	あんないしょ	annaisho	tài liệu hướng dẫn	30	2026-06-24 16:16:40.101	2026-06-24 16:16:40.101
23033	交番	こうばん	koban	trạm cảnh sát	30	2026-06-24 16:16:40.103	2026-06-24 16:16:40.103
23034	\N	～ほど	~hodo	khoảng ~, chừng ~	30	2026-06-24 16:16:40.105	2026-06-24 16:16:40.105
23035	ご苦労さま。	ごくろうさま。	gokurosama.	anh, chị đã làm việc vất vả/cảm ơn anh, chị	30	2026-06-24 16:16:40.107	2026-06-24 16:16:40.107
23036	希望	きぼう	kibo	hi vọng, nguyện vọng	30	2026-06-24 16:16:40.109	2026-06-24 16:16:40.109
23037	何か ご希望が ありますか。	なにか ごきぼうが ありますか。	nanika gokiboga arimasuka.	Anh/chị có nguyện vọng gì không?/ anh/chị có yêu cầu gì không?	30	2026-06-24 16:16:40.112	2026-06-24 16:16:40.112
23038	\N	ミュージカル	myujikaru	ca kịch	30	2026-06-24 16:16:40.114	2026-06-24 16:16:40.114
23039	\N	それは いいですね。	sorewa iidesune.	That's a good idea./That sounds nice.	30	2026-06-24 16:16:40.116	2026-06-24 16:16:40.116
23040	\N	ブロードウェイ	burodouei	Broadway	30	2026-06-24 16:16:40.118	2026-06-24 16:16:40.118
23041	月	つき	tsuki	mặt trăng	30	2026-06-24 16:16:40.12	2026-06-24 16:16:40.12
23042	地球	ちきゅう	chikyu	trái đất	30	2026-06-24 16:16:40.122	2026-06-24 16:16:40.122
23043	続けます	つづけます	tsuzukemasu	tiếp tục	31	2026-06-24 16:16:40.327	2026-06-24 16:16:40.327
23044	見つけます	みつけます	mitsukemasu	tìm thấy	31	2026-06-24 16:16:40.331	2026-06-24 16:16:40.331
23045	取ります［休みを～］	とります［やすみを～］	torimasu [yasumiwo~]	take [a holiday]	31	2026-06-24 16:16:40.334	2026-06-24 16:16:40.334
23046	受けます［試験を～］	うけます［しけんを～］	ukemasu [shikenwo~]	take [an examination]	31	2026-06-24 16:16:40.336	2026-06-24 16:16:40.336
23047	申し込みます	もうしこみます	moshikomimasu	apply for, enter for	31	2026-06-24 16:16:40.337	2026-06-24 16:16:40.337
23048	休憩します	きゅうけいします	kyukeishimasu	nghỉ giải lao	31	2026-06-24 16:16:40.339	2026-06-24 16:16:40.339
23049	連休	れんきゅう	renkyu	ngày nghỉ liền nhay	31	2026-06-24 16:16:40.34	2026-06-24 16:16:40.34
23050	作文	さくぶん	sakubun	bài văn	31	2026-06-24 16:16:40.342	2026-06-24 16:16:40.342
23051	発表	はっぴょう	happyo	announcement, presentation (～します : announce)	31	2026-06-24 16:16:40.344	2026-06-24 16:16:40.344
23052	展覧会	てんらんかい	tenrankai	triển lãm	31	2026-06-24 16:16:40.346	2026-06-24 16:16:40.346
23053	結婚式	けっこんしき	kekkonshiki	lễ cưới, đám cưới	31	2026-06-24 16:16:40.348	2026-06-24 16:16:40.348
23054	［お］葬式	［お］そうしき	[o] soshiki	funeral	31	2026-06-24 16:16:40.35	2026-06-24 16:16:40.35
23055	式	しき	shiki	buổi lễ	31	2026-06-24 16:16:40.351	2026-06-24 16:16:40.351
23056	本社	ほんしゃ	honsha	trụ sở	31	2026-06-24 16:16:40.353	2026-06-24 16:16:40.353
23057	支店	してん	shiten	chi nhánh	31	2026-06-24 16:16:40.355	2026-06-24 16:16:40.355
23058	教会	きょうかい	kyokai	nhà thờ	31	2026-06-24 16:16:40.357	2026-06-24 16:16:40.357
23059	大学院	だいがくいん	daigakuin	cao học, cơ sở giáo dục trên đại học	31	2026-06-24 16:16:40.36	2026-06-24 16:16:40.36
23060	動物園	どうぶつえん	dobutsuen	sở thú	31	2026-06-24 16:16:40.362	2026-06-24 16:16:40.362
23061	温泉	おんせん	onsen	suối nước nóng	31	2026-06-24 16:16:40.364	2026-06-24 16:16:40.364
23062	帰り	かえり	kaeri	return	31	2026-06-24 16:16:40.366	2026-06-24 16:16:40.366
23063	お子さん	おこさん	okosan	(someone else's) child	31	2026-06-24 16:16:40.367	2026-06-24 16:16:40.367
23064	－号	－ごう	-go	(train number, typhoon number, etc.)	31	2026-06-24 16:16:40.369	2026-06-24 16:16:40.369
23065	～の 方	～の ほう	~no hou	hướng~, phía	31	2026-06-24 16:16:40.37	2026-06-24 16:16:40.37
23066	\N	ずっと	zutto	suốt,liền	31	2026-06-24 16:16:40.372	2026-06-24 16:16:40.372
23067	\N	バリ	bari	Bali (Indonesian island)	31	2026-06-24 16:16:40.373	2026-06-24 16:16:40.373
23068	\N	ピカソ	pikaso	Pablo Picasso, Spanish painter (1881-1973)	31	2026-06-24 16:16:40.375	2026-06-24 16:16:40.375
23069	\N	のぞみ	nozomi	name of a Shinkansen train (～４２号 : Nozomi Superexpress No.42)	31	2026-06-24 16:16:40.377	2026-06-24 16:16:40.377
23070	新神戸	しんこうべ	shinkobe	name of a station in Hyogo prefecture	31	2026-06-24 16:16:40.38	2026-06-24 16:16:40.38
23071	残ります	のこります	nokorimasu	ở lại	31	2026-06-24 16:16:40.382	2026-06-24 16:16:40.382
23072	入学試験	にゅうがくしけん	nyugakushiken	entrance examination	31	2026-06-24 16:16:40.383	2026-06-24 16:16:40.383
23073	月に	つきに	tsukini	một tháng	31	2026-06-24 16:16:40.385	2026-06-24 16:16:40.385
23074	村	むら	mura	làng	31	2026-06-24 16:16:40.387	2026-06-24 16:16:40.387
23075	卒業します	そつぎょうします	sotsugyoshimasu	graduate	31	2026-06-24 16:16:40.388	2026-06-24 16:16:40.388
23076	映画館	えいがかん	eigakan	rạp chiếu phim	31	2026-06-24 16:16:40.389	2026-06-24 16:16:40.389
23077	嫌［な］	いや［な］	iya [na]	hateful, disagreeable	31	2026-06-24 16:16:40.391	2026-06-24 16:16:40.391
23078	空	そら	sora	bầu trời	31	2026-06-24 16:16:40.393	2026-06-24 16:16:40.393
23079	閉じます	とじます	tojimasu	nhắm	31	2026-06-24 16:16:40.396	2026-06-24 16:16:40.396
23080	都会	とかい	tokai	thành phố	31	2026-06-24 16:16:40.399	2026-06-24 16:16:40.399
23081	子どもたち	こどもたち	kodomotachi	bọn trẻ	31	2026-06-24 16:16:40.401	2026-06-24 16:16:40.401
23082	自由に	じゆうに	jiyuni	tự do	31	2026-06-24 16:16:40.402	2026-06-24 16:16:40.402
23083	始まります［式が～］	はじまります［しきが～］	hajimarimasu [shikiga~]	[a ceremony] begin, start	31	2026-06-24 16:16:40.403	2026-06-24 16:16:40.403
23084	入学します［大学に～］	にゅうがくします［だいがくに～］	nyugakushimasu [daigakuni~]	enter [a university]	31	2026-06-24 16:16:40.405	2026-06-24 16:16:40.405
23085	出席します［会議に～］	しゅっせきします［かいぎに～］	shussekishimasu [kaigini~]	attend [a meeting]	31	2026-06-24 16:16:40.406	2026-06-24 16:16:40.406
23086	お客［さん］	おきゃく［さん］	okyaku [san]	visitor, guest, customer, client	31	2026-06-24 16:16:40.408	2026-06-24 16:16:40.408
23087	誰か	だれか	dareka	ai đó	31	2026-06-24 16:16:40.409	2026-06-24 16:16:40.409
23088	上野公園	うえのこうえん	uenokoen	Ueno Park (in Tokyo)	31	2026-06-24 16:16:40.412	2026-06-24 16:16:40.412
23089	普通の	ふつうの	futsuno	thường	31	2026-06-24 16:16:40.414	2026-06-24 16:16:40.414
23090	\N	インターネット	intanetto	internet	31	2026-06-24 16:16:40.416	2026-06-24 16:16:40.416
23091	世界中	せかいじゅう	sekaiju	khắp thể giới	31	2026-06-24 16:16:40.417	2026-06-24 16:16:40.417
23092	集まります	あつまります	atsumarimasu	tập hợp	31	2026-06-24 16:16:40.419	2026-06-24 16:16:40.419
23093	美しい	うつくしい	utsukushii	đẹp	31	2026-06-24 16:16:40.42	2026-06-24 16:16:40.42
23094	自然	しぜん	shizen	thiên nhiên	31	2026-06-24 16:16:40.421	2026-06-24 16:16:40.421
23095	\N	すばらしさ	subarashisa	tuyệt vời	31	2026-06-24 16:16:40.423	2026-06-24 16:16:40.423
23096	気が つきます	きが つきます	kiga tsukimasu	để ý, nhận ra	31	2026-06-24 16:16:40.424	2026-06-24 16:16:40.424
23097	運動します	うんどうします	undoshimasu	vận động, tập thể thao	32	2026-06-24 16:16:40.526	2026-06-24 16:16:40.526
23098	成功します	せいこうします	seikoshimasu	thành công	32	2026-06-24 16:16:40.529	2026-06-24 16:16:40.529
23099	失敗します［試験に～］	しっぱいします［しけんに～］	shippaishimasu [shikenni~]	thất bại, trượt	32	2026-06-24 16:16:40.531	2026-06-24 16:16:40.531
23100	合格します［試験に～］	ごうかくします［しけんに～］	gokakushimasu [shikenni~]	đỗ	32	2026-06-24 16:16:40.533	2026-06-24 16:16:40.533
23101	やみます［雨が～］	やみます［あめが～］	yamimasu [amega~]	tạnh ,ngừng	32	2026-06-24 16:16:40.534	2026-06-24 16:16:40.534
23102	晴れます	はれます	haremasu	nắng, quang đãng	32	2026-06-24 16:16:40.535	2026-06-24 16:16:40.535
23103	曇ります	くもります	kumorimasu	có mây, mây mù	32	2026-06-24 16:16:40.537	2026-06-24 16:16:40.537
23104	続づきます［熱が～］	つづきます［ねつが～］	tsuzukimasu [netsuga~]	tiếp tục, tiếp diễn	32	2026-06-24 16:16:40.538	2026-06-24 16:16:40.538
23105	\N	ひきます［かぜを～］	hikimasu [kazewo~]	catch [a cold]	32	2026-06-24 16:16:40.54	2026-06-24 16:16:40.54
23106	冷やします	ひやします	hiyashimasu	làm lạnh	32	2026-06-24 16:16:40.541	2026-06-24 16:16:40.541
23107	込みます［道が～］	こみます［みちが～］	komimasu [michiga~]	[a road] get crowded	32	2026-06-24 16:16:40.544	2026-06-24 16:16:40.544
23108	すきます［道が～］	すきます［みちが～］	sukimasu [michiga~]	[a road] get less crowded	32	2026-06-24 16:16:40.546	2026-06-24 16:16:40.546
23109	出ます［試合に～］	でます［しあいに～］	demasu [shiaini~]	participate [in the match]	32	2026-06-24 16:16:40.548	2026-06-24 16:16:40.548
23110	出ます［パーティーに～］	でます［パーティーに～］	demasu [pateiini~]	attend [a party]	32	2026-06-24 16:16:40.55	2026-06-24 16:16:40.55
23111	無理を します	むりを します	muriwo shimasu	làm quá sức	32	2026-06-24 16:16:40.551	2026-06-24 16:16:40.551
23112	十分［な］	じゅうぶん［な］	jubun [na]	đủ	32	2026-06-24 16:16:40.553	2026-06-24 16:16:40.553
23113	\N	おかしい	okashii	có vấn đề, không bình thường	32	2026-06-24 16:16:40.554	2026-06-24 16:16:40.554
23114	\N	うるさい	urusai	ồn ào	32	2026-06-24 16:16:40.556	2026-06-24 16:16:40.556
23115	先生	せんせい	sensei	doctor	32	2026-06-24 16:16:40.557	2026-06-24 16:16:40.557
23116	\N	やけど	yakedo	bỏng	32	2026-06-24 16:16:40.559	2026-06-24 16:16:40.559
23117	\N	けが	kega	bị thương	32	2026-06-24 16:16:40.562	2026-06-24 16:16:40.562
23118	\N	せき	seki	ho	32	2026-06-24 16:16:40.564	2026-06-24 16:16:40.564
23119	\N	インフルエンザ	infuruenza	cúm dịch	32	2026-06-24 16:16:40.566	2026-06-24 16:16:40.566
23120	空	そら	sora	bầu trời	32	2026-06-24 16:16:40.567	2026-06-24 16:16:40.567
23121	太陽	たいよう	taiyo	mặt trời	32	2026-06-24 16:16:40.569	2026-06-24 16:16:40.569
23122	星	ほし	hoshi	ngôi sao	32	2026-06-24 16:16:40.57	2026-06-24 16:16:40.57
23123	風	かぜ	kaze	gió	32	2026-06-24 16:16:40.572	2026-06-24 16:16:40.572
23124	東	ひがし	higashi	phía đông	32	2026-06-24 16:16:40.573	2026-06-24 16:16:40.573
23125	西	にし	nishi	phía tây	32	2026-06-24 16:16:40.574	2026-06-24 16:16:40.574
23126	南	みなみ	minami	phía nam	32	2026-06-24 16:16:40.578	2026-06-24 16:16:40.578
23127	北	きた	kita	phía bắc	32	2026-06-24 16:16:40.58	2026-06-24 16:16:40.58
23128	国際～	こくさい～	kokusai~	international ～	32	2026-06-24 16:16:40.582	2026-06-24 16:16:40.582
23129	水道	すいどう	suido	nước máy	32	2026-06-24 16:16:40.583	2026-06-24 16:16:40.583
23130	\N	エンジン	enjin	động cơ	32	2026-06-24 16:16:40.585	2026-06-24 16:16:40.585
23131	\N	チーム	chiimu	đội	32	2026-06-24 16:16:40.587	2026-06-24 16:16:40.587
23132	今夜	こんや	kon'ya	tối nay, đêm nay	32	2026-06-24 16:16:40.588	2026-06-24 16:16:40.588
23133	夕方	ゆうがた	yugata	chiều tối	32	2026-06-24 16:16:40.59	2026-06-24 16:16:40.59
23134	\N	まえ	mae	trước	32	2026-06-24 16:16:40.591	2026-06-24 16:16:40.591
23135	遅く	おそく	osoku	muộn , khuya	32	2026-06-24 16:16:40.593	2026-06-24 16:16:40.593
23136	\N	こんなに	konnani	như thế này	32	2026-06-24 16:16:40.595	2026-06-24 16:16:40.595
23137	\N	そんなに	sonnani	như thế đó (về vấn đề có quan hệ với người nghe)	32	2026-06-24 16:16:40.597	2026-06-24 16:16:40.597
23138	\N	あんなに	annani	như thế kia	32	2026-06-24 16:16:40.599	2026-06-24 16:16:40.599
23139	\N	ヨーロッパ	yoroppa	Europe	32	2026-06-24 16:16:40.601	2026-06-24 16:16:40.601
23140	元気	げんき	genki	khỏe mạnh	32	2026-06-24 16:16:40.603	2026-06-24 16:16:40.603
23141	胃	い	i	dạ dày	32	2026-06-24 16:16:40.605	2026-06-24 16:16:40.605
23142	\N	ストレス	sutoresu	stress, căng thẳng tâm lý	32	2026-06-24 16:16:40.607	2026-06-24 16:16:40.607
23143	\N	それは いけませんね。	sorewa ikemasenne.	thế thì thật không tốt.	32	2026-06-24 16:16:40.609	2026-06-24 16:16:40.609
23144	星占い	ほしうらない	hoshiuranai	bói sao	32	2026-06-24 16:16:40.612	2026-06-24 16:16:40.612
23145	牡牛座	おうしざ	oushiza	chòm sao Kim Ngưu	32	2026-06-24 16:16:40.614	2026-06-24 16:16:40.614
23146	働きすぎ	はたらきすぎ	hatarakisugi	làm việc quá sức	32	2026-06-24 16:16:40.617	2026-06-24 16:16:40.617
23147	困ります	こまります	komarimasu	rắc rối, khó xử, vấn đề	32	2026-06-24 16:16:40.619	2026-06-24 16:16:40.619
23148	宝くじ	たからくじ	takarakuji	xổ số	32	2026-06-24 16:16:40.62	2026-06-24 16:16:40.62
23149	当たります［宝くじが～］	あたります［たからくじが～］	atarimasu [takarakujiga~]	trúng(số)	32	2026-06-24 16:16:40.622	2026-06-24 16:16:40.622
23150	健康	けんこう	kenko	sức khỏe	32	2026-06-24 16:16:40.624	2026-06-24 16:16:40.624
23151	恋愛	れんあい	ren'ai	tình yêu	32	2026-06-24 16:16:40.628	2026-06-24 16:16:40.628
23152	恋人	こいびと	koibito	người yêu	32	2026-06-24 16:16:40.632	2026-06-24 16:16:40.632
23153	\N	ラッキーアイテム	rakkiiaitemu	something lucky	32	2026-06-24 16:16:40.635	2026-06-24 16:16:40.635
23154	石	いし	ishi	stone	32	2026-06-24 16:16:40.637	2026-06-24 16:16:40.637
23155	戻ります	もどります	modorimasu	quay lại, trở lại	32	2026-06-24 16:16:40.639	2026-06-24 16:16:40.639
23156	吹きます［風が～］	ふきます［かぜが～］	fukimasu [kazega~]	thổi	32	2026-06-24 16:16:40.641	2026-06-24 16:16:40.641
23157	治ります［病気が～］	なおります［びょうきが～］	naorimasu [byokiga~]	khỏi	32	2026-06-24 16:16:40.644	2026-06-24 16:16:40.644
23158	直ります［故障が～］	なおります［こしょうが～］	naorimasu [koshoga~]	khỏi	32	2026-06-24 16:16:40.647	2026-06-24 16:16:40.647
23159	心配［な］	しんぱい［な］	shinpai [na]	lo lắng	32	2026-06-24 16:16:40.65	2026-06-24 16:16:40.65
23160	月	つき	tsuki	mặt trăng	32	2026-06-24 16:16:40.652	2026-06-24 16:16:40.652
23161	\N	もしかしたら	moshikashitara	có thể, biết dâu là, có khả năng	32	2026-06-24 16:16:40.655	2026-06-24 16:16:40.655
23162	\N	オリンピック	orinpikku	olympic	32	2026-06-24 16:16:40.657	2026-06-24 16:16:40.657
23163	\N	ゆっくり します	yukkuri shimasu	nghỉ ngơi, thư thái, dưỡng sức	32	2026-06-24 16:16:40.661	2026-06-24 16:16:40.661
23164	［お］金持ち	［お］かねもち	[o] kanemochi	rich person	32	2026-06-24 16:16:40.664	2026-06-24 16:16:40.664
23165	逃げます	にげます	nigemasu	chạy trốn, bỏ chạy	33	2026-06-24 16:16:40.821	2026-06-24 16:16:40.821
23166	騒ぎます	さわぎます	sawagimasu	làm ồn, làm rùm beng	33	2026-06-24 16:16:40.822	2026-06-24 16:16:40.822
23167	\N	あきらめます	akiramemasu	từ bỏ, đầu hàng	33	2026-06-24 16:16:40.824	2026-06-24 16:16:40.824
23168	投げます	なげます	nagemasu	ném	33	2026-06-24 16:16:40.828	2026-06-24 16:16:40.828
23169	守ります	まもります	mamorimasu	bảo vệ, tuân thủ	33	2026-06-24 16:16:40.83	2026-06-24 16:16:40.83
23170	始まります［式が～］	はじまります［しきが～］	hajimarimasu [shikiga~]	[a ceremony] begin, start	33	2026-06-24 16:16:40.833	2026-06-24 16:16:40.833
23171	出席します［会議に～］	しゅっせきします［かいぎに～］	shussekishimasu [kaigini~]	attend [a meeting]	33	2026-06-24 16:16:40.835	2026-06-24 16:16:40.835
23172	伝えます	つたえます	tsutaemasu	truyền đạt	33	2026-06-24 16:16:40.837	2026-06-24 16:16:40.837
23173	注意します［車に～］	ちゅういします［くるまに～］	chuishimasu [kurumani~]	chú ý	33	2026-06-24 16:16:40.839	2026-06-24 16:16:40.839
23174	外します［席を～］	はずします［せきを～］	hazushimasu [sekiwo~]	rời, không có ở (chỗ ngồi)	33	2026-06-24 16:16:40.84	2026-06-24 16:16:40.84
23175	戻ります	もどります	modorimasu	come back, return	33	2026-06-24 16:16:40.842	2026-06-24 16:16:40.842
23176	あります［電話が～］	あります［でんわが～］	arimasu [denwaga~]	have [a telephone call]	33	2026-06-24 16:16:40.845	2026-06-24 16:16:40.845
23177	\N	リサイクルします	risaikurushimasu	recycle	33	2026-06-24 16:16:40.847	2026-06-24 16:16:40.847
23178	\N	だめ［な］	dame [na]	không được, không thể	33	2026-06-24 16:16:40.85	2026-06-24 16:16:40.85
23179	同じ	おなじ	onaji	same	33	2026-06-24 16:16:40.852	2026-06-24 16:16:40.852
23180	警察	けいさつ	keisatsu	cảnh sát	33	2026-06-24 16:16:40.854	2026-06-24 16:16:40.854
23181	席	せき	seki	chỗ ngồi, ghế	33	2026-06-24 16:16:40.855	2026-06-24 16:16:40.855
23182	\N	マーク	maku	kí hiệu	33	2026-06-24 16:16:40.857	2026-06-24 16:16:40.857
23183	\N	ボール	boru	quả bóng	33	2026-06-24 16:16:40.86	2026-06-24 16:16:40.86
23184	締め切り	しめきり	shimekiri	deadline	33	2026-06-24 16:16:40.862	2026-06-24 16:16:40.862
23185	規則	きそく	kisoku	quy tắc, kỷ luật	33	2026-06-24 16:16:40.864	2026-06-24 16:16:40.864
23186	危険	きけん	kiken	Danger	33	2026-06-24 16:16:40.866	2026-06-24 16:16:40.866
23187	使用禁止	しようきんし	shiyokinshi	cấm sử dụng	33	2026-06-24 16:16:40.868	2026-06-24 16:16:40.868
23188	立入禁止	たちいりきんし	tachiirikinshi	cấm vào	33	2026-06-24 16:16:40.869	2026-06-24 16:16:40.869
23189	徐行	じょこう	joko	Go Slow	33	2026-06-24 16:16:40.871	2026-06-24 16:16:40.871
23190	入口	いりぐち	iriguchi	cửa vào	33	2026-06-24 16:16:40.873	2026-06-24 16:16:40.873
23191	出口	でぐち	deguchi	cửa ra	33	2026-06-24 16:16:40.874	2026-06-24 16:16:40.874
23192	非常口	ひじょうぐち	hijoguchi	cửa thoát hiểm	33	2026-06-24 16:16:40.877	2026-06-24 16:16:40.877
23193	無料	むりょう	muryo	miễn phí	33	2026-06-24 16:16:40.88	2026-06-24 16:16:40.88
23194	割引	わりびき	waribiki	Discount	33	2026-06-24 16:16:40.882	2026-06-24 16:16:40.882
23195	飲み放題	のみほうだい	nomihodai	All You Can Drink	33	2026-06-24 16:16:40.883	2026-06-24 16:16:40.883
23196	使用中	しようちゅう	shiyochu	đang sử dụng	33	2026-06-24 16:16:40.885	2026-06-24 16:16:40.885
23197	募集中	ぼしゅうちゅう	boshuchu	Applications Wanted	33	2026-06-24 16:16:40.886	2026-06-24 16:16:40.886
23198	～中	～ちゅう	~chu	đang ~	33	2026-06-24 16:16:40.888	2026-06-24 16:16:40.888
23199	\N	どういう ～	doiu ~	~ gì, ~ thế nào	33	2026-06-24 16:16:40.89	2026-06-24 16:16:40.89
23200	\N	いくら［～でも］	ikura [~demo]	however ～, even if ～	33	2026-06-24 16:16:40.891	2026-06-24 16:16:40.891
23201	\N	もう	mo	không ~ nữa	33	2026-06-24 16:16:40.894	2026-06-24 16:16:40.894
23202	\N	あと ～	ato ~	～ left	33	2026-06-24 16:16:40.896	2026-06-24 16:16:40.896
23203	\N	～ほど	~hodo	about ～	33	2026-06-24 16:16:40.898	2026-06-24 16:16:40.898
23204	駐車違反	ちゅうしゃいはん	chushaihan	đỗ xe trái phép	33	2026-06-24 16:16:40.899	2026-06-24 16:16:40.899
23205	罰金	ばっきん	bakkin	tiền phạt	33	2026-06-24 16:16:40.901	2026-06-24 16:16:40.901
23206	地震	じしん	jishin	earthquake	33	2026-06-24 16:16:40.902	2026-06-24 16:16:40.902
23207	置きます	おきます	okimasu	happen	33	2026-06-24 16:16:40.904	2026-06-24 16:16:40.904
23208	助け合います	たすけあいます	tasukeaimasu	help each other	33	2026-06-24 16:16:40.905	2026-06-24 16:16:40.905
23209	\N	もともと	motomoto	originally	33	2026-06-24 16:16:40.907	2026-06-24 16:16:40.907
23210	悲しい	かなしい	kanashii	buồn	33	2026-06-24 16:16:40.909	2026-06-24 16:16:40.909
23211	\N	もっと	motto	more	33	2026-06-24 16:16:40.912	2026-06-24 16:16:40.912
23212	\N	あいさつ	aisatsu	greeting, address (～を します : greet, give an address)	33	2026-06-24 16:16:40.914	2026-06-24 16:16:40.914
23213	相手	あいて	aite	the other person	33	2026-06-24 16:16:40.915	2026-06-24 16:16:40.915
23214	気持ち	きもち	kimochi	feeling	33	2026-06-24 16:16:40.917	2026-06-24 16:16:40.917
23215	上げます	あげます	agemasu	nâng lên, tăng lên	33	2026-06-24 16:16:40.918	2026-06-24 16:16:40.918
23216	下げます	さげます	sagemasu	hạ xuống, giảm xuống	33	2026-06-24 16:16:40.919	2026-06-24 16:16:40.919
23217	\N	ファイト	fuaito	’quyết chiến’, ‘cố lên’	33	2026-06-24 16:16:40.921	2026-06-24 16:16:40.921
23218	洗濯機	せんたくき	sentakuki	máy giặt	33	2026-06-24 16:16:40.922	2026-06-24 16:16:40.922
23219	～機	～き	~ki	máy ~	33	2026-06-24 16:16:40.924	2026-06-24 16:16:40.924
23220	本日休業	ほんじつきゅうぎょう	honjitsukyugyo	hôm nay đóng cửa, hôm nay nghỉ	33	2026-06-24 16:16:40.926	2026-06-24 16:16:40.926
23221	営業中	えいぎょうちゅう	eigyochu	đang mở cửa	33	2026-06-24 16:16:40.933	2026-06-24 16:16:40.933
23222	\N	そりゃあ	sorya	thế thì, ồ	33	2026-06-24 16:16:40.935	2026-06-24 16:16:40.935
23223	～以内	～いない	~inai	~trong khoảng, ~trong vòng	33	2026-06-24 16:16:40.937	2026-06-24 16:16:40.937
23224	電報	でんぽう	denpo	điện báo	33	2026-06-24 16:16:40.939	2026-06-24 16:16:40.939
23225	人々	ひとびと	hitobito	nhiều người	33	2026-06-24 16:16:40.944	2026-06-24 16:16:40.944
23226	急用	きゅうよう	kyuyo	việc gấp	33	2026-06-24 16:16:40.947	2026-06-24 16:16:40.947
23227	打ちます［電報を～］	うちます［でんぽうを～］	uchimasu [denpowo~]	gửi(điện báo)	33	2026-06-24 16:16:40.951	2026-06-24 16:16:40.951
23228	電報代	でんぽうだい	denpodai	tiền cước điện báo	33	2026-06-24 16:16:40.953	2026-06-24 16:16:40.953
23229	\N	できるだけ	dekirudake	cố gắng, trong khả năng có thể	33	2026-06-24 16:16:40.955	2026-06-24 16:16:40.955
23230	短く	みじかく	mijikaku	ngắn gọn	33	2026-06-24 16:16:40.958	2026-06-24 16:16:40.958
23231	\N	また	mata	thêm nữa	33	2026-06-24 16:16:40.962	2026-06-24 16:16:40.962
23232	例えば	たとえば	tatoeba	ví dụ	33	2026-06-24 16:16:40.966	2026-06-24 16:16:40.966
23233	危篤	キトク	kitoku	tình trạn hiểm nghèo	33	2026-06-24 16:16:40.968	2026-06-24 16:16:40.968
23234	重い 病気	おもい びょうき	omoi byoki	bệnh nặng	33	2026-06-24 16:16:40.971	2026-06-24 16:16:40.971
23235	明日	あす	asu	ngày mai	33	2026-06-24 16:16:40.982	2026-06-24 16:16:40.982
23236	留守	るす	rusu	vắng nhà	33	2026-06-24 16:16:40.985	2026-06-24 16:16:40.985
23237	留守番	るすばん	rusuban	trông nhà, giữ nhà	33	2026-06-24 16:16:40.988	2026-06-24 16:16:40.988
23238	［お］祝い	［お］いわい	[o] iwai	celebration	33	2026-06-24 16:16:40.991	2026-06-24 16:16:40.991
23239	亡くなります	なくなります	nakunarimasu	mất, chết	33	2026-06-24 16:16:40.994	2026-06-24 16:16:40.994
23240	悲しみ	かなしみ	kanashimi	sorrow, sadness	33	2026-06-24 16:16:40.997	2026-06-24 16:16:40.997
23241	利用します	りようします	riyoshimasu	sử dụng, lợi dụng, tận dụng	33	2026-06-24 16:16:40.998	2026-06-24 16:16:40.998
23242	磨きます［歯を～］	みがきます［はを～］	migakimasu [hawo~]	mài, đánh (răng)	34	2026-06-24 16:16:41.114	2026-06-24 16:16:41.114
23243	組み立てます	くみたてます	kumitatemasu	lắp ráp, lắp đặt	34	2026-06-24 16:16:41.115	2026-06-24 16:16:41.115
23244	降ります	おります	orimasu	gấp, gập, bẻ gãy	34	2026-06-24 16:16:41.117	2026-06-24 16:16:41.117
23245	気が つきます［忘れ物に～］	きが つきます［わすれものに～］	kiga tsukimasu [wasuremononi~]	nhận thấy, phát hiện	34	2026-06-24 16:16:41.118	2026-06-24 16:16:41.118
23246	\N	つけます［しゅうゆを～］	tsukemasu [shuyuwo~]	chấm	34	2026-06-24 16:16:41.12	2026-06-24 16:16:41.12
23247	見つかります［かぎが～］	みつかります［かぎが～］	mitsukarimasu [kagiga~]	được tìm thấy	34	2026-06-24 16:16:41.121	2026-06-24 16:16:41.121
23248	質問します	しつもんします	shitsumonshimasu	hỏi	34	2026-06-24 16:16:41.123	2026-06-24 16:16:41.123
23249	さします［傘を～］	さします［かさを～］	sashimasu [kasawo~]	put up [an umbrella]	34	2026-06-24 16:16:41.127	2026-06-24 16:16:41.127
23250	\N	スポーツクラブ	supotsukurabu	câu lạc bộ thể thao	34	2026-06-24 16:16:41.13	2026-06-24 16:16:41.13
23251	［お］城	［お］しろ	[o] shiro	màu trắng	34	2026-06-24 16:16:41.132	2026-06-24 16:16:41.132
23252	説明書	せつめいしょ	setsumeisho	quyển hướng dẫn	34	2026-06-24 16:16:41.134	2026-06-24 16:16:41.134
23253	図	ず	zu	sơ đồ, hình vẽ	34	2026-06-24 16:16:41.136	2026-06-24 16:16:41.136
23254	線	せん	sen	đường	34	2026-06-24 16:16:41.137	2026-06-24 16:16:41.137
23255	矢印	やじるし	yajirushi	dấu mũi tên	34	2026-06-24 16:16:41.139	2026-06-24 16:16:41.139
23256	黒	くろ	kuro	màu đen	34	2026-06-24 16:16:41.141	2026-06-24 16:16:41.141
23257	白	しろ	shiro	màu trắng	34	2026-06-24 16:16:41.148	2026-06-24 16:16:41.148
23258	赤	あか	aka	màu đỏ	34	2026-06-24 16:16:41.153	2026-06-24 16:16:41.153
23259	青	あお	ao	màu xanh da trời	34	2026-06-24 16:16:41.155	2026-06-24 16:16:41.155
23260	紺	こん	kon	màu xanh lam	34	2026-06-24 16:16:41.158	2026-06-24 16:16:41.158
23261	黄色	きいろ	kiiro	màu vàng	34	2026-06-24 16:16:41.163	2026-06-24 16:16:41.163
23262	茶色	ちゃいろ	chairo	màu nâu	34	2026-06-24 16:16:41.169	2026-06-24 16:16:41.169
23263	\N	しょうゆ	shoyu	xì- dầu	34	2026-06-24 16:16:41.175	2026-06-24 16:16:41.175
23264	\N	ソース	sosu	nước chấm, nước xốt	34	2026-06-24 16:16:41.181	2026-06-24 16:16:41.181
23265	お客［さん］	おきゃく［さん］	okyaku [san]	visitor, guest, customer, client	34	2026-06-24 16:16:41.185	2026-06-24 16:16:41.185
23266	\N	～か ～	~ka ~	～ or ～	34	2026-06-24 16:16:41.189	2026-06-24 16:16:41.189
23267	\N	ゆうべ	yube	tối qua, đêm qua	34	2026-06-24 16:16:41.193	2026-06-24 16:16:41.193
23268	\N	さっき	sakki	vừa rồi, vừa lúc nãy	34	2026-06-24 16:16:41.197	2026-06-24 16:16:41.197
23269	茶道	さどう	sado	trà đạo	34	2026-06-24 16:16:41.2	2026-06-24 16:16:41.2
23270	お茶を たてます	おちゃを たてます	ochawo tatemasu	make (green) tea (at a tea ceremony)	34	2026-06-24 16:16:41.202	2026-06-24 16:16:41.202
23271	先に	さきに	sakini	trước	34	2026-06-24 16:16:41.204	2026-06-24 16:16:41.204
23272	載せます	のせます	nosemasu	đặt lên	34	2026-06-24 16:16:41.205	2026-06-24 16:16:41.205
23273	\N	これで いいですか。	korede iidesuka.	Thế này có được không? /thế này đã được chưa?	34	2026-06-24 16:16:41.207	2026-06-24 16:16:41.207
23274	苦い	にがい	nigai	đắng	34	2026-06-24 16:16:41.209	2026-06-24 16:16:41.209
23275	親子どんぶり	おやこどんぶり	oyakodonburi	món oyako-don	34	2026-06-24 16:16:41.213	2026-06-24 16:16:41.213
23276	材料	ざいりょう	zairyo	nguyên liêu	34	2026-06-24 16:16:41.215	2026-06-24 16:16:41.215
23277	～分	～ぶん	~bun	portion for ～ (used for indicating quantity)	34	2026-06-24 16:16:41.218	2026-06-24 16:16:41.218
23278	\N	－グラム	-guramu	－ gramme	34	2026-06-24 16:16:41.221	2026-06-24 16:16:41.221
23279	ー個	ーこ	-ko	(counter for small objects)	34	2026-06-24 16:16:41.222	2026-06-24 16:16:41.222
23280	\N	たまねぎ	tamanegi	hành củ	34	2026-06-24 16:16:41.224	2026-06-24 16:16:41.224
23281	４分の１（１／４）	よんぶんのいち（１／４）	yonbunnoichi (1/4)	one fourth	34	2026-06-24 16:16:41.226	2026-06-24 16:16:41.226
23282	調味料	ちょうみりょう	chomiryo	gia vị	34	2026-06-24 16:16:41.229	2026-06-24 16:16:41.229
23283	適当な 大きさに	てきとうな おおきさに	tekitona okisani	in right size	34	2026-06-24 16:16:41.231	2026-06-24 16:16:41.231
23284	\N	なべ	nabe	nấp	34	2026-06-24 16:16:41.232	2026-06-24 16:16:41.232
23285	火	ひ	hi	lửa	34	2026-06-24 16:16:41.234	2026-06-24 16:16:41.234
23286	火に かけます	ひに かけます	hini kakemasu	đun	34	2026-06-24 16:16:41.236	2026-06-24 16:16:41.236
23287	煮ます	にます	nimasu	nấu	34	2026-06-24 16:16:41.238	2026-06-24 16:16:41.238
23288	煮えます	にえます	niemasu	chín,được nấu	34	2026-06-24 16:16:41.24	2026-06-24 16:16:41.24
23289	\N	どんぶり	donburi	cái bát	34	2026-06-24 16:16:41.242	2026-06-24 16:16:41.242
23290	\N	たちます	tachimasu	pass (time)	34	2026-06-24 16:16:41.245	2026-06-24 16:16:41.245
23291	\N	します［ネクタイを～］	shimasu [nekutaiwo~]	đeo , thắt	34	2026-06-24 16:16:41.247	2026-06-24 16:16:41.247
23292	細い	ほそい	hosoi	gầy, hẹp, thon	34	2026-06-24 16:16:41.249	2026-06-24 16:16:41.249
23293	太い	ふとい	futoi	béo, to	34	2026-06-24 16:16:41.25	2026-06-24 16:16:41.25
23294	盆踊り	ぼんおどり	bon'odori	múa trong hội bon	34	2026-06-24 16:16:41.252	2026-06-24 16:16:41.252
23295	家具	かぐ	kagu	gia cụ , đồ dùng nội thất	34	2026-06-24 16:16:41.253	2026-06-24 16:16:41.253
23296	\N	キー	kii	chìa khóa	34	2026-06-24 16:16:41.255	2026-06-24 16:16:41.255
23297	\N	シートベルト	shiitoberuto	seat belt	34	2026-06-24 16:16:41.256	2026-06-24 16:16:41.256
23298	とり肉	とりにく	toriniku	thịt gà	34	2026-06-24 16:16:41.258	2026-06-24 16:16:41.258
23299	咲きます［花が～］	さきます［はなが～］	sakimasu [hanaga~]	nở (hoa)	35	2026-06-24 16:16:41.356	2026-06-24 16:16:41.356
23300	変わります［色が～］	かわります［いろが～］	kawarimasu [iroga~]	thay đổi, đổi	35	2026-06-24 16:16:41.357	2026-06-24 16:16:41.357
23301	困ります	こまります	komarimasu	rắc rối, khó xử, có vấn đề	35	2026-06-24 16:16:41.361	2026-06-24 16:16:41.361
23302	付けます［丸を～］	つけます［まるを～］	tsukemasu [maruwo~]	vẽ , đánh dấu	35	2026-06-24 16:16:41.364	2026-06-24 16:16:41.364
23303	治ります［病気が～］	なおります［びょうきが～］	naorimasu [byokiga~]	recover from [sickness], get well	35	2026-06-24 16:16:41.366	2026-06-24 16:16:41.366
23304	直ります［故障が～］	なおります［こしょうが～］	naorimasu [koshoga~]	be fixed, be repaired	35	2026-06-24 16:16:41.367	2026-06-24 16:16:41.367
23305	\N	くりっくします	kurikkushimasu	click	35	2026-06-24 16:16:41.369	2026-06-24 16:16:41.369
23306	入力します	にゅうりょくします	nyuryokushimasu	input	35	2026-06-24 16:16:41.37	2026-06-24 16:16:41.37
23307	正しい	ただしい	tadashii	đúng, chính xác	35	2026-06-24 16:16:41.372	2026-06-24 16:16:41.372
23308	向こう	むこう	muko	bên kia, bên đấy	35	2026-06-24 16:16:41.373	2026-06-24 16:16:41.373
23309	島	しま	shima	đảo, hòn đảo	35	2026-06-24 16:16:41.376	2026-06-24 16:16:41.376
23310	港	みなと	minato	cảng, bến cảng	35	2026-06-24 16:16:41.38	2026-06-24 16:16:41.38
23311	近所	きんじょ	kinjo	hàng xóm, khu vực lân cận	35	2026-06-24 16:16:41.382	2026-06-24 16:16:41.382
23312	屋上	おくじょう	okujo	mái nhà, nóc nhà	35	2026-06-24 16:16:41.384	2026-06-24 16:16:41.384
23313	海外	かいがい	kaigai	nước ngoài, hải ngoại	35	2026-06-24 16:16:41.386	2026-06-24 16:16:41.386
23314	山登り	やまのぼり	yamanobori	leo núi	35	2026-06-24 16:16:41.388	2026-06-24 16:16:41.388
23315	歴史	れきし	rekishi	history	35	2026-06-24 16:16:41.39	2026-06-24 16:16:41.39
23316	機会	きかい	kikai	cơ hội	35	2026-06-24 16:16:41.393	2026-06-24 16:16:41.393
23317	許可	きょか	kyoka	phép, giấy phép	35	2026-06-24 16:16:41.396	2026-06-24 16:16:41.396
23318	丸	まる	maru	tròn, vòng tròn	35	2026-06-24 16:16:41.398	2026-06-24 16:16:41.398
23319	\N	ふりがな	furigana	(kana above or beside kanji indicating its pronunciation)	35	2026-06-24 16:16:41.399	2026-06-24 16:16:41.399
23320	設備	せつび	setsubi	thiết bị	35	2026-06-24 16:16:41.401	2026-06-24 16:16:41.401
23321	\N	レバー	reba	lever	35	2026-06-24 16:16:41.402	2026-06-24 16:16:41.402
23322	\N	キー	kii	key	35	2026-06-24 16:16:41.403	2026-06-24 16:16:41.403
23323	\N	カーテン	katen	curtain	35	2026-06-24 16:16:41.405	2026-06-24 16:16:41.405
23324	\N	ひも	himo	sợi dây	35	2026-06-24 16:16:41.407	2026-06-24 16:16:41.407
23325	炊飯器	すいはんき	suihanki	rice cooker	35	2026-06-24 16:16:41.41	2026-06-24 16:16:41.41
23326	葉	は	ha	cái lá	35	2026-06-24 16:16:41.412	2026-06-24 16:16:41.412
23327	昔	むかし	mukashi	old times, ancient times	35	2026-06-24 16:16:41.414	2026-06-24 16:16:41.414
23328	\N	もっと	motto	hơn , nữa	35	2026-06-24 16:16:41.416	2026-06-24 16:16:41.416
23329	これで 終わりましょう。	これで おわりましょう。	korede owarimashou.	Let's finish now.	35	2026-06-24 16:16:41.417	2026-06-24 16:16:41.417
23330	箱根	はこね	hakone	resort and tourist spot in Kanagawa prefecture	35	2026-06-24 16:16:41.419	2026-06-24 16:16:41.419
23331	日光	にっこう	nikko	tourist spot in Tochigi prefecture	35	2026-06-24 16:16:41.421	2026-06-24 16:16:41.421
23332	\N	アフリカ	afurika	Africa	35	2026-06-24 16:16:41.423	2026-06-24 16:16:41.423
23333	\N	マンガミュージアム	mangamyujiamu	Kyoto International Manga Museum	35	2026-06-24 16:16:41.425	2026-06-24 16:16:41.425
23334	みんなの 学校	みんなの がっこう	minnano gakko	école de japonais fictive	35	2026-06-24 16:16:41.429	2026-06-24 16:16:41.429
23335	大黒ずし	だいこくずし	daikokuzushi	a fictitious sushi restaurant	35	2026-06-24 16:16:41.431	2026-06-24 16:16:41.431
23336	IMCパソコン教室	IMCパソコンきょうしつ	IMCpasokonkyoshitsu	a fictitious computer school	35	2026-06-24 16:16:41.434	2026-06-24 16:16:41.434
23337	母の 味	ははの あじ	hahano aji	a fictitious book	35	2026-06-24 16:16:41.436	2026-06-24 16:16:41.436
23338	\N	はる	haru	a fictitious hair salon	35	2026-06-24 16:16:41.439	2026-06-24 16:16:41.439
23339	佐藤歯科	さとうしか	satoshika	a fictitious dental clinic	35	2026-06-24 16:16:41.441	2026-06-24 16:16:41.441
23340	毎日クッキング	まいにちクッキング	mainichikukkingu	a fictitious cooking school	35	2026-06-24 16:16:41.446	2026-06-24 16:16:41.446
23341	\N	それなら	sorenara	nếu thế thì, vậy thì	35	2026-06-24 16:16:41.449	2026-06-24 16:16:41.449
23342	夜行バス	やこうバス	yakobasu	(chuyến) xe buýt chạy đêm	35	2026-06-24 16:16:41.452	2026-06-24 16:16:41.452
23343	\N	さあ	sa	Well, let me see. (used when unsure of something)	35	2026-06-24 16:16:41.454	2026-06-24 16:16:41.454
23344	旅行社	りょこうしゃ	ryokosha	công ty du lịch	35	2026-06-24 16:16:41.457	2026-06-24 16:16:41.457
23345	詳しい	くわしい	kuwashii	cụ thể, chi tiết	35	2026-06-24 16:16:41.462	2026-06-24 16:16:41.462
23346	スキー場	スキーじょう	sukiijou	địa điểm trượt tuyết	35	2026-06-24 16:16:41.465	2026-06-24 16:16:41.465
23347	草津	くさつ	kusatsu	resort in Gunma prefecture	35	2026-06-24 16:16:41.468	2026-06-24 16:16:41.468
23348	志賀高原	しがこうげん	shigakogen	national park in Nagano prefecture	35	2026-06-24 16:16:41.471	2026-06-24 16:16:41.471
23349	朱	しゅ	shu	đỏ, màu đỏ	35	2026-06-24 16:16:41.474	2026-06-24 16:16:41.474
23350	交わります	まじわります	majiwarimasu	giao lưu, quan hệ với	35	2026-06-24 16:16:41.479	2026-06-24 16:16:41.479
23351	\N	ことわざ	kotowaza	tục ngữ	35	2026-06-24 16:16:41.484	2026-06-24 16:16:41.484
23352	関係	かんけい	kankei	relationship	35	2026-06-24 16:16:41.488	2026-06-24 16:16:41.488
23353	仲よく します	なかよく します	nakayoku shimasu	quan hệ tốt với, chơi thân với	35	2026-06-24 16:16:41.491	2026-06-24 16:16:41.491
23354	必要［な］	ひつよう［な］	hitsuyo [na]	cần thiết	35	2026-06-24 16:16:41.498	2026-06-24 16:16:41.498
23355	拾います	ひろいます	hiroimasu	nhặt lên	35	2026-06-24 16:16:41.502	2026-06-24 16:16:41.502
23356	かかります［電話が～］	かかります［でんわが～］	kakarimasu [denwaga~]	có điện thoại	35	2026-06-24 16:16:41.505	2026-06-24 16:16:41.505
23357	楽［な］	らく［な］	raku [na]	thoải mái, nhàn hạ, dễ dàng	35	2026-06-24 16:16:41.509	2026-06-24 16:16:41.509
23358	珍しい	めずらしい	mezurashii	hiếm có	35	2026-06-24 16:16:41.514	2026-06-24 16:16:41.514
23359	方	かた	kata	vị, người	35	2026-06-24 16:16:41.517	2026-06-24 16:16:41.517
23360	村	むら	mura	làng	35	2026-06-24 16:16:41.52	2026-06-24 16:16:41.52
23361	\N	ハイキング	haikingu	đi bộ trên núi	35	2026-06-24 16:16:41.524	2026-06-24 16:16:41.524
23362	操作	そうさ	sosa	thao tác	35	2026-06-24 16:16:41.53	2026-06-24 16:16:41.53
23363	方法	ほうほう	hoho	phương pháp	35	2026-06-24 16:16:41.535	2026-06-24 16:16:41.535
23364	\N	ふた	futa	cái nắp	35	2026-06-24 16:16:41.538	2026-06-24 16:16:41.538
23365	曲	きょく	kyoku	bài hát, bản nhạc	35	2026-06-24 16:16:41.542	2026-06-24 16:16:41.542
23366	楽しみ	たのしみ	tanoshimi	niềm vui, điều vui	35	2026-06-24 16:16:41.547	2026-06-24 16:16:41.547
23367	初めに	はじめに	hajimeni	đầu tiên , trước hết	35	2026-06-24 16:16:41.549	2026-06-24 16:16:41.549
23368	これで 終わります。	これで おわります。	korede owarimasu.	đến đây là hết, chúng ta dừng ở đây	35	2026-06-24 16:16:41.552	2026-06-24 16:16:41.552
23369	白馬	はくば	hakuba	resort in Nagano Prefecture	35	2026-06-24 16:16:41.553	2026-06-24 16:16:41.553
23370	あいます［事故に～］	あいます［じこに～］	aimasu [jikoni~]	encounter [an accident]	36	2026-06-24 16:16:41.796	2026-06-24 16:16:41.796
23371	貯金します	ちょきんします	chokinshimasu	tiết kiệm tiền, để dành tiền	36	2026-06-24 16:16:41.799	2026-06-24 16:16:41.799
23372	過ぎます［７時を～］	すぎます［７じを～］	sugimasu [7jiwo~]	quá	36	2026-06-24 16:16:41.803	2026-06-24 16:16:41.803
23373	慣れます［仕事に～］	なれます［しごとに～］	naremasu [shigotoni~]	làm quen, quen	36	2026-06-24 16:16:41.807	2026-06-24 16:16:41.807
23374	腐ります［食べ物が～］	くさります［たべものが～］	kusarimasu [tabemonoga~]	[food] rot	36	2026-06-24 16:16:41.812	2026-06-24 16:16:41.812
23375	剣道	けんどう	kendo	kiếm đạo	36	2026-06-24 16:16:41.819	2026-06-24 16:16:41.819
23376	柔道	じゅうどう	judo	judo	36	2026-06-24 16:16:41.824	2026-06-24 16:16:41.824
23377	\N	ラッシュ	rasshu	rush hour	36	2026-06-24 16:16:41.83	2026-06-24 16:16:41.83
23378	宇宙	うちゅう	uchu	vũ trụ	36	2026-06-24 16:16:41.835	2026-06-24 16:16:41.835
23379	曲	きょく	kyoku	a piece of music	36	2026-06-24 16:16:41.84	2026-06-24 16:16:41.84
23380	毎週	まいしゅう	maishu	hàng tuần	36	2026-06-24 16:16:41.846	2026-06-24 16:16:41.846
23381	毎月	まいつき	maitsuki	hàng tháng	36	2026-06-24 16:16:41.851	2026-06-24 16:16:41.851
23382	毎年	まいとし（まいねん）	maitoshi (mainen)	hàng năm	36	2026-06-24 16:16:41.856	2026-06-24 16:16:41.856
23383	\N	このごろ	konogoro	gần đây, dạo này	36	2026-06-24 16:16:41.863	2026-06-24 16:16:41.863
23384	\N	やっと	yatto	cuối cùng thì	36	2026-06-24 16:16:41.868	2026-06-24 16:16:41.868
23385	\N	かなり	kanari	khá, tương đối	36	2026-06-24 16:16:41.872	2026-06-24 16:16:41.872
23386	必ず	かならず	kanarazu	nhất định	36	2026-06-24 16:16:41.878	2026-06-24 16:16:41.878
23387	絶対に	ぜったいに	zettaini	tuyệt đối	36	2026-06-24 16:16:41.884	2026-06-24 16:16:41.884
23388	上手に	じょうずに	jozuni	giỏi, khéo	36	2026-06-24 16:16:41.888	2026-06-24 16:16:41.888
23389	\N	できるだけ	dekirudake	cố gắng	36	2026-06-24 16:16:41.894	2026-06-24 16:16:41.894
23390	\N	ほとんど	hotondo	almost all (in affirmative sentences), hardly, scarcely (in negative sentences)	36	2026-06-24 16:16:41.898	2026-06-24 16:16:41.898
23391	\N	ショパン	shopan	Chopin, Polish musician (1810-49)	36	2026-06-24 16:16:41.901	2026-06-24 16:16:41.901
23392	お客様	おきゃくさま	okyakusama	khách hàng	36	2026-06-24 16:16:41.903	2026-06-24 16:16:41.903
23393	特別［な］	とくべつ［な］	tokubetsu [na]	đặc biệt	36	2026-06-24 16:16:41.905	2026-06-24 16:16:41.905
23394	\N	して いらっしゃいます	shite irasshaimasu	đang làm (tôn kính ngữ của しています）	36	2026-06-24 16:16:41.907	2026-06-24 16:16:41.907
23395	水泳	すいえい	suiei	môn bơi lội	36	2026-06-24 16:16:41.911	2026-06-24 16:16:41.911
23396	違います	ちがいます	chigaimasu	be different	36	2026-06-24 16:16:41.914	2026-06-24 16:16:41.914
23397	使って いらっしゃるんですね。	つかって いらっしゃるんですね。	tsukatte irassharundesune.	You're using, aren't you? (respectful equivalent of つかって いるんですね)	36	2026-06-24 16:16:41.916	2026-06-24 16:16:41.916
23398	\N	チャレンジします	charenjishimasu	thách thức, thử thách	36	2026-06-24 16:16:41.918	2026-06-24 16:16:41.918
23399	気持ち	きもち	kimochi	cảm giác, tâm trạng, tinh thần	36	2026-06-24 16:16:41.921	2026-06-24 16:16:41.921
23400	乗り物	のりもの	norimono	phương tiện đi lại	36	2026-06-24 16:16:41.922	2026-06-24 16:16:41.922
23401	ー世紀	ーせいき	-seiki	thế kỉ-	36	2026-06-24 16:16:41.924	2026-06-24 16:16:41.924
23402	遠く	とおく	toku	xa, ở xa	36	2026-06-24 16:16:41.928	2026-06-24 16:16:41.928
23403	珍しい	めずらしい	mezurashii	rare, uncommon	36	2026-06-24 16:16:41.93	2026-06-24 16:16:41.93
23404	汽車	きしゃ	kisha	tàu hỏa chạy bằng hơi nước	36	2026-06-24 16:16:41.932	2026-06-24 16:16:41.932
23405	汽船	きせん	kisen	thuyền chạy bằng hơi nước	36	2026-06-24 16:16:41.934	2026-06-24 16:16:41.934
23406	大勢の ～	おおぜいの ～	oozeino ~	many (people)	36	2026-06-24 16:16:41.935	2026-06-24 16:16:41.935
23407	運びます	はこびます	hakobimasu	vận chuyển	36	2026-06-24 16:16:41.937	2026-06-24 16:16:41.937
23408	利用します	りようします	riyoshimasu	use	36	2026-06-24 16:16:41.938	2026-06-24 16:16:41.938
23409	自由に	じゆうに	jiyuni	freely	36	2026-06-24 16:16:41.94	2026-06-24 16:16:41.94
23410	届きます［荷物が～］	とどきます［にもつが～］	todokimasu [nimotsuga~]	được gửi đến, được chuyển đến	36	2026-06-24 16:16:41.943	2026-06-24 16:16:41.943
23411	出ます［試合に～］	でます［しあいに～］	demasu [shiaini~]	tham gia, tham dự	36	2026-06-24 16:16:41.946	2026-06-24 16:16:41.946
23412	打ちます［ワープロを～］	うちます［ワープロを～］	uchimasu [wapurowo~]	đánh	36	2026-06-24 16:16:41.948	2026-06-24 16:16:41.948
23413	太ります	ふとります	futorimasu	béo lên, tăng cân	36	2026-06-24 16:16:41.95	2026-06-24 16:16:41.95
23414	\N	やせます	yasemasu	gầy đi, giảm cân	36	2026-06-24 16:16:41.951	2026-06-24 16:16:41.951
23415	硬い	かたい	katai	cứng	36	2026-06-24 16:16:41.953	2026-06-24 16:16:41.953
23416	軟らかい	やわらかい	yawarakai	mềm	36	2026-06-24 16:16:41.955	2026-06-24 16:16:41.955
23417	電子～	でんし～	denshi~	~ điện tử	36	2026-06-24 16:16:41.956	2026-06-24 16:16:41.956
23418	携帯～	けいたい～	keitai~	portable ～	36	2026-06-24 16:16:41.958	2026-06-24 16:16:41.958
23419	工場	こうじょう	kojo	nhà máy, phân xưởng	36	2026-06-24 16:16:41.962	2026-06-24 16:16:41.962
23420	健康	けんこう	kenko	sức khỏe	36	2026-06-24 16:16:41.964	2026-06-24 16:16:41.964
23421	\N	～ずつ	~zutsu	～ (some amount) per (some unit)	36	2026-06-24 16:16:41.966	2026-06-24 16:16:41.966
23422	\N	その ほうが ～	sono hoga~	That is more ～	36	2026-06-24 16:16:41.968	2026-06-24 16:16:41.968
23423	\N	～とか、～とか	~toka, ~toka	vâng vâng	36	2026-06-24 16:16:41.97	2026-06-24 16:16:41.97
23424	\N	タンゴ	tango	tango	36	2026-06-24 16:16:41.972	2026-06-24 16:16:41.972
23425	歴史	れきし	rekishi	lịch sử	36	2026-06-24 16:16:41.976	2026-06-24 16:16:41.976
23426	飛びます	とびます	tobimasu	bay	36	2026-06-24 16:16:41.98	2026-06-24 16:16:41.98
23427	安全［な］	あんぜん［な］	anzen [na]	an toàn	36	2026-06-24 16:16:41.983	2026-06-24 16:16:41.983
23428	地球	ちきゅう	chikyu	trái đất	36	2026-06-24 16:16:41.985	2026-06-24 16:16:41.985
23429	ライト兄弟	ライトきょうだい	raitokyodai	Wright brothers, American pioneers in aviation ; Wilbur Wright (1867-1912) Orville Wright (1871-1948)	36	2026-06-24 16:16:41.988	2026-06-24 16:16:41.988
23430	褒めます	ほめます	homemasu	khen	37	2026-06-24 16:16:42.186	2026-06-24 16:16:42.186
23431	\N	しかります	shikarimasu	mắng	37	2026-06-24 16:16:42.187	2026-06-24 16:16:42.187
23432	誘います	さそいます	sasoimasu	mời, rủ rê	37	2026-06-24 16:16:42.189	2026-06-24 16:16:42.189
23433	招待します	しょうたいします	shotaishimasu	mời	37	2026-06-24 16:16:42.19	2026-06-24 16:16:42.19
23434	頼みます	たのみます	tanomimasu	nhờ	37	2026-06-24 16:16:42.193	2026-06-24 16:16:42.193
23435	注意します	ちゅういします	chuishimasu	chú ý, nhắc nhở	37	2026-06-24 16:16:42.195	2026-06-24 16:16:42.195
23436	\N	とります	torimasu	ăn trộm , lấy cắp	37	2026-06-24 16:16:42.197	2026-06-24 16:16:42.197
23437	踏みます	ふみます	fumimasu	giẫm , giẫm lên	37	2026-06-24 16:16:42.198	2026-06-24 16:16:42.198
23438	壊します	こわします	kowashimasu	phá, làm hỏng	37	2026-06-24 16:16:42.2	2026-06-24 16:16:42.2
23439	汚します	よごします	yogoshimasu	làm bẩn	37	2026-06-24 16:16:42.201	2026-06-24 16:16:42.201
23440	行います	おこないます	okonaimasu	thực hiện, tiến hành	37	2026-06-24 16:16:42.203	2026-06-24 16:16:42.203
23441	輸出します	ゆしゅつします	yushutsushimasu	xuất khẩu	37	2026-06-24 16:16:42.204	2026-06-24 16:16:42.204
23442	輸入します	ゆにゅうします	yunyushimasu	nhập khẩu	37	2026-06-24 16:16:42.205	2026-06-24 16:16:42.205
23443	翻訳します	ほんやくします	hon'yakushimasu	dịch (sách, tài liệu)	37	2026-06-24 16:16:42.207	2026-06-24 16:16:42.207
23444	発明します	はつめいします	hatsumeishimasu	phát minh	37	2026-06-24 16:16:42.21	2026-06-24 16:16:42.21
23445	発見します	はっけんします	hakkenshimasu	phát kiến, tìm ra	37	2026-06-24 16:16:42.212	2026-06-24 16:16:42.212
23446	米	こめ	kome	gạo	37	2026-06-24 16:16:42.214	2026-06-24 16:16:42.214
23447	麦	むぎ	mugi	lúa mạch	37	2026-06-24 16:16:42.215	2026-06-24 16:16:42.215
23448	石油	せきゆ	sekiyu	dầu mỏ	37	2026-06-24 16:16:42.217	2026-06-24 16:16:42.217
23449	原料	げんりょう	genryo	nguyên liệu	37	2026-06-24 16:16:42.218	2026-06-24 16:16:42.218
23450	\N	インスタントラーメン	insutantoramen	instant noodles	37	2026-06-24 16:16:42.22	2026-06-24 16:16:42.22
23451	\N	デート	deto	cuộc hẹn hò	37	2026-06-24 16:16:42.221	2026-06-24 16:16:42.221
23452	泥棒	どろぼう	dorobo	kẻ trộm	37	2026-06-24 16:16:42.222	2026-06-24 16:16:42.222
23453	警官	けいかん	keikan	cảnh sát	37	2026-06-24 16:16:42.224	2026-06-24 16:16:42.224
23454	世界中	せかいじゅう	sekaiju	khắp thế giới, toàn thế giới	37	2026-06-24 16:16:42.227	2026-06-24 16:16:42.227
23455	～中	～じゅう	~ju	khắp–	37	2026-06-24 16:16:42.228	2026-06-24 16:16:42.228
23456	－世紀	－せいき	-seiki	-th century	37	2026-06-24 16:16:42.23	2026-06-24 16:16:42.23
23457	何語	なにご	nanigo	what language	37	2026-06-24 16:16:42.231	2026-06-24 16:16:42.231
23458	誰か	だれか	dareka	somebody	37	2026-06-24 16:16:42.233	2026-06-24 16:16:42.233
23459	\N	よかったですね。	yokattadesune.	may nhỉ	37	2026-06-24 16:16:42.234	2026-06-24 16:16:42.234
23460	\N	オリンピック	orinpikku	Olympic Games	37	2026-06-24 16:16:42.236	2026-06-24 16:16:42.236
23461	\N	ワールドカップ	warudokappu	World Cup	37	2026-06-24 16:16:42.237	2026-06-24 16:16:42.237
23462	東大寺	とうだいじ	todaiji	Todaiji Temple	37	2026-06-24 16:16:42.238	2026-06-24 16:16:42.238
23463	大仏	だいぶつ	daibutsu	Great Buddha	37	2026-06-24 16:16:42.24	2026-06-24 16:16:42.24
23464	江戸時代	えどじだい	edojidai	Edo Period (1603-1868)	37	2026-06-24 16:16:42.242	2026-06-24 16:16:42.242
23465	\N	ポルトガル	porutogaru	Portugal	37	2026-06-24 16:16:42.245	2026-06-24 16:16:42.245
23466	\N	サウジアラビア	saujiarabia	Saudia Arabia	37	2026-06-24 16:16:42.247	2026-06-24 16:16:42.247
23467	\N	ロシア	roshia	Russia	37	2026-06-24 16:16:42.249	2026-06-24 16:16:42.249
23468	皆様	みなさま	minasama	Ladies and gentlemen, everybody (respect equivalent of みなさん)	37	2026-06-24 16:16:42.25	2026-06-24 16:16:42.25
23469	焼けます［うちが～］	やけます［うちが～］	yakemasu [uchiga~]	[house] burn down	37	2026-06-24 16:16:42.252	2026-06-24 16:16:42.252
23470	その後	そのご	sonogo	after that, later	37	2026-06-24 16:16:42.253	2026-06-24 16:16:42.253
23471	世界遺産	せかいいさん	sekaiisan	World Heritage Site	37	2026-06-24 16:16:42.255	2026-06-24 16:16:42.255
23472	～の 一つ	～の ひとつ	~no hitotsu	one of the ～	37	2026-06-24 16:16:42.256	2026-06-24 16:16:42.256
23473	金色	きんいろ	kin'iro	golden colour	37	2026-06-24 16:16:42.259	2026-06-24 16:16:42.259
23474	本物	ほんもの	honmono	real thing	37	2026-06-24 16:16:42.261	2026-06-24 16:16:42.261
23475	金	きん	kin	gold	37	2026-06-24 16:16:42.263	2026-06-24 16:16:42.263
23476	\N	－キロ	-kiro	－ kilogrammes, － kilometres	37	2026-06-24 16:16:42.264	2026-06-24 16:16:42.264
23477	美しい	うつくしい	utsukushii	beautiful, pretty	37	2026-06-24 16:16:42.266	2026-06-24 16:16:42.266
23478	豪華［な］	ごうか［な］	goka [na]	hào hoa,sang trọng	37	2026-06-24 16:16:42.267	2026-06-24 16:16:42.267
23479	彫刻	ちょうこく	chokoku	điêu khắc	37	2026-06-24 16:16:42.269	2026-06-24 16:16:42.269
23480	言い伝え	いいつたえ	iitsutae	tradition, legend	37	2026-06-24 16:16:42.27	2026-06-24 16:16:42.27
23481	眠ります	ねむります	nemurimasu	ngủ	37	2026-06-24 16:16:42.271	2026-06-24 16:16:42.271
23482	彫ります	ほります	horimasu	khắc	37	2026-06-24 16:16:42.273	2026-06-24 16:16:42.273
23483	仲間	なかま	nakama	bạn bè,đồng nghiệp	37	2026-06-24 16:16:42.275	2026-06-24 16:16:42.275
23484	\N	しかし	shikashi	however, but	37	2026-06-24 16:16:42.277	2026-06-24 16:16:42.277
23485	\N	その あと	sono ato	sau đó	37	2026-06-24 16:16:42.279	2026-06-24 16:16:42.279
23486	一生懸命	いっしょうけんめい	isshokenmei	cố gắng hết sức	37	2026-06-24 16:16:42.281	2026-06-24 16:16:42.281
23487	\N	ねずみ	nezumi	chuột	37	2026-06-24 16:16:42.283	2026-06-24 16:16:42.283
23488	一匹も いません。	いっぴき もいません。	ippiki moimasen.	không có con nào cả	37	2026-06-24 16:16:42.284	2026-06-24 16:16:42.284
23489	東照宮	とうしょうぐう	toshogu	shrine dedicated to Tokugawa Ieyasu in Nikko, Tochigi prefecture	37	2026-06-24 16:16:42.286	2026-06-24 16:16:42.286
23490	眠り猫	ねむりねこ	nemurineko	The Sleeping Cat	37	2026-06-24 16:16:42.288	2026-06-24 16:16:42.288
23491	左甚五郎	ひだりじんごろう	hidarijingoro	famous Japanese sculptor of the Edo Period (1594-1651)	37	2026-06-24 16:16:42.29	2026-06-24 16:16:42.29
23492	起こします	おこします	okoshimasu	đánh thức	37	2026-06-24 16:16:42.294	2026-06-24 16:16:42.294
23493	設計します	せっけいします	sekkeishimasu	thiết kế	37	2026-06-24 16:16:42.296	2026-06-24 16:16:42.296
23494	建築家	けんちくか	kenchikuka	kiến trúc sư	37	2026-06-24 16:16:42.298	2026-06-24 16:16:42.298
23495	科学者	かがくしゃ	kagakusha	nhà khoa học	37	2026-06-24 16:16:42.3	2026-06-24 16:16:42.3
23496	漫画	まんが	manga	truyện tranh	37	2026-06-24 16:16:42.302	2026-06-24 16:16:42.302
23497	\N	～に よって	~ni yotte	by ～	37	2026-06-24 16:16:42.303	2026-06-24 16:16:42.303
23498	\N	ドミニカ	dominika	Dominica (tên một quốc gia ở Trung Mỹ)	37	2026-06-24 16:16:42.304	2026-06-24 16:16:42.304
23499	ライト兄弟	ライトきょうだい	raitokyodai	Wright brothers, American pioneers in aviation ; Wilbur Wright (1867-1912) Orville Wright (1871-1948)	37	2026-06-24 16:16:42.306	2026-06-24 16:16:42.306
23500	源氏物語	げんじものがたり	genjimonogatari	"The Tale of Genji" (Japanese novel)	37	2026-06-24 16:16:42.309	2026-06-24 16:16:42.309
23501	紫式部	むらさきしきぶ	murasakishikibu	Heian Period (9th Century) female novelist who wrote "The Tale of Genji" (973?-1014?)	37	2026-06-24 16:16:42.312	2026-06-24 16:16:42.312
23502	\N	グラハムーベル	gurahamuberu	Alexander Graham Bell, American inventor (1847-1922)	37	2026-06-24 16:16:42.314	2026-06-24 16:16:42.314
23503	埋め立てます	うめたてます	umetatemasu	lấp	37	2026-06-24 16:16:42.315	2026-06-24 16:16:42.315
23504	技術	ぎじゅつ	gijutsu	kỷ thuật	37	2026-06-24 16:16:42.317	2026-06-24 16:16:42.317
23505	土地	とち	tochi	đất, diện tích đất	37	2026-06-24 16:16:42.32	2026-06-24 16:16:42.32
23506	騒音	そうおん	soon	tiếng ồn	37	2026-06-24 16:16:42.322	2026-06-24 16:16:42.322
23507	利用します	りようします	riyoshimasu	sử dụng	37	2026-06-24 16:16:42.324	2026-06-24 16:16:42.324
23508	\N	アクセス	akusesu	nối, giao thông đi đến	37	2026-06-24 16:16:42.328	2026-06-24 16:16:42.328
23509	参加します［旅行に～］	さんかします［りょこうに～］	sankashimasu [ryokoni~]	join [a tour], participate, attend	38	2026-06-24 16:16:42.483	2026-06-24 16:16:42.483
23510	育てます	そだてます	sodatemasu	nuôi, trồng	38	2026-06-24 16:16:42.485	2026-06-24 16:16:42.485
23511	運びます	はこびます	hakobimasu	chở, vận chuyển	38	2026-06-24 16:16:42.488	2026-06-24 16:16:42.488
23512	入院します	にゅういんします	nyuinshimasu	nhập viện	38	2026-06-24 16:16:42.49	2026-06-24 16:16:42.49
23513	退院します	たいいんします	taiinshimasu	xuất viện	38	2026-06-24 16:16:42.493	2026-06-24 16:16:42.493
23514	入れます［電源を～］	いれます［でんげんを～］	iremasu [dengenwo~]	bật	38	2026-06-24 16:16:42.497	2026-06-24 16:16:42.497
23515	切ります［電源を～］	きります［でんげんを～］	kirimasu [dengenwo~]	tắt	38	2026-06-24 16:16:42.499	2026-06-24 16:16:42.499
23516	掛けます［かぎを～］	かけます［かぎを～］	kakemasu [kagiwo~]	khóa	38	2026-06-24 16:16:42.5	2026-06-24 16:16:42.5
23517	\N	つきます［うそを～］	tsukimasu [usowo~]	tell [a lie]	38	2026-06-24 16:16:42.502	2026-06-24 16:16:42.502
23518	気持ちが いい	きもちが いい	kimochiga ii	dễ chịu, thư giản	38	2026-06-24 16:16:42.504	2026-06-24 16:16:42.504
23519	気持ちが 悪い	きもちが わるい	kimochiga warui	khó chịu	38	2026-06-24 16:16:42.506	2026-06-24 16:16:42.506
23520	大きな ～	おおきな ～	okina ~	large ～, big ～	38	2026-06-24 16:16:42.509	2026-06-24 16:16:42.509
23521	小さな ～	ちいさな ～	chiisana ~	small ～, little ～	38	2026-06-24 16:16:42.513	2026-06-24 16:16:42.513
23522	赤ちゃん	あかちゃん	akachan	em bé	38	2026-06-24 16:16:42.515	2026-06-24 16:16:42.515
23523	小学校	しょうがっこう	shogakko	trường tiểu học	38	2026-06-24 16:16:42.517	2026-06-24 16:16:42.517
23524	中学校	ちゅうがっこう	chugakko	trường trung học cơ sở	38	2026-06-24 16:16:42.519	2026-06-24 16:16:42.519
23525	駅前	えきまえ	ekimae	khu vực trước nha ga	38	2026-06-24 16:16:42.521	2026-06-24 16:16:42.521
23526	海岸	かいがん	kaigan	bờ biển	38	2026-06-24 16:16:42.523	2026-06-24 16:16:42.523
23527	工場	こうじょう	kojo	factory	38	2026-06-24 16:16:42.528	2026-06-24 16:16:42.528
23528	村	むら	mura	village	38	2026-06-24 16:16:42.531	2026-06-24 16:16:42.531
23529	\N	かな	kana	hiragana and katakana script	38	2026-06-24 16:16:42.534	2026-06-24 16:16:42.534
23530	指輪	ゆびわ	yubiwa	ring	38	2026-06-24 16:16:42.536	2026-06-24 16:16:42.536
23531	電源	でんげん	dengen	nguồn điện , công tắc điện	38	2026-06-24 16:16:42.538	2026-06-24 16:16:42.538
23532	習慣	しゅうかん	shukan	habit	38	2026-06-24 16:16:42.542	2026-06-24 16:16:42.542
23533	健康	けんこう	kenko	health	38	2026-06-24 16:16:42.546	2026-06-24 16:16:42.546
23534	～製	～せい	~sei	sản xuất tai–	38	2026-06-24 16:16:42.549	2026-06-24 16:16:42.549
23535	\N	おととし	ototoshi	the year before the last	38	2026-06-24 16:16:42.551	2026-06-24 16:16:42.551
23536	\N	［あ、］いけない。	[a,] ikenai.	Oops!/Oh, no! (used when one has made a mistake)	38	2026-06-24 16:16:42.553	2026-06-24 16:16:42.553
23537	お先に［失礼します］。	おさきに［しつれいします］。	osakini [shitsureishimasu].	Excuse me (for leaving before you).	38	2026-06-24 16:16:42.555	2026-06-24 16:16:42.555
23538	原爆ドーム	げんばくドーム	genbakudomu	dome commemorating the atomic bombing of Hiroshima	38	2026-06-24 16:16:42.556	2026-06-24 16:16:42.556
23539	出雲大社	いずもたいしゃ	izumotaisha	a shrine in Izumo city in Shimane prefecture	38	2026-06-24 16:16:42.562	2026-06-24 16:16:42.562
23540	\N	チェンマイ	chenmai	Chiangmai (in Thailand)	38	2026-06-24 16:16:42.566	2026-06-24 16:16:42.566
23541	回覧	かいらん	kairan	Tập thông báo	38	2026-06-24 16:16:42.568	2026-06-24 16:16:42.568
23542	研究室	けんきゅうしつ	kenkyushitsu	Phòng nghiên cứu	38	2026-06-24 16:16:42.57	2026-06-24 16:16:42.57
23543	\N	きちんと	kichinto	Nghiêm chỉnh, hẳn hoi, đứng đắn	38	2026-06-24 16:16:42.572	2026-06-24 16:16:42.572
23544	整理します	せいりします	seirishimasu	sắp xếp	38	2026-06-24 16:16:42.576	2026-06-24 16:16:42.576
23545	方法	ほうほう	hoho	method	38	2026-06-24 16:16:42.58	2026-06-24 16:16:42.58
23546	\N	～と いう	~to iu	entitled ～, named ～, called ～	38	2026-06-24 16:16:42.582	2026-06-24 16:16:42.582
23547	－冊	－さつ	-satsu	(counter for books, etc.)	38	2026-06-24 16:16:42.584	2026-06-24 16:16:42.584
23548	\N	はんこ	hanko	con dấu, dấu	38	2026-06-24 16:16:42.586	2026-06-24 16:16:42.586
23549	押します［はんこを～］	おします［はんこを～］	oshimasu [hankowo~]	đóng(dấu)	38	2026-06-24 16:16:42.587	2026-06-24 16:16:42.587
23550	双子	ふたご	futago	cặp sinh đôi	38	2026-06-24 16:16:42.589	2026-06-24 16:16:42.589
23551	姉妹	しまい	shimai	chị em	38	2026-06-24 16:16:42.594	2026-06-24 16:16:42.594
23552	５年生	５ねんせい	5nensei	học sinh năm thứ 5	38	2026-06-24 16:16:42.597	2026-06-24 16:16:42.597
23553	似て います	にて います	nite imasu	giống	38	2026-06-24 16:16:42.598	2026-06-24 16:16:42.598
23554	性格	せいかく	seikaku	tính cách	38	2026-06-24 16:16:42.6	2026-06-24 16:16:42.6
23555	\N	おとなしい	otonashii	hiền lành, trầm	38	2026-06-24 16:16:42.601	2026-06-24 16:16:42.601
23556	優しい	やさしい	yasashii	kind, gentle, tender-hearted	38	2026-06-24 16:16:42.602	2026-06-24 16:16:42.602
23557	世話を します	せわを します	sewawo shimasu	chăm sóc , giúp đỡ	38	2026-06-24 16:16:42.604	2026-06-24 16:16:42.604
23558	時間が たちます	じかんが たちます	jikanga tachimasu	thời gian trôi đi	38	2026-06-24 16:16:42.605	2026-06-24 16:16:42.605
23559	大好き［な］	だいすき［な］	daisuki [na]	rất thích	38	2026-06-24 16:16:42.608	2026-06-24 16:16:42.608
23560	－点	－てん	-ten	－ points	38	2026-06-24 16:16:42.611	2026-06-24 16:16:42.611
23561	気が 強い	きが つよい	kiga tsuyoi	tough, strong-willed	38	2026-06-24 16:16:42.613	2026-06-24 16:16:42.613
23562	\N	けんかします	kenkashimasu	cãi nhau	38	2026-06-24 16:16:42.615	2026-06-24 16:16:42.615
23563	不思議［な］	ふしぎ［な］	fushigi [na]	bí ẩn , kỳ thú, khó hiểu.	38	2026-06-24 16:16:42.616	2026-06-24 16:16:42.616
23564	年齢	ねんれい	nenrei	age	38	2026-06-24 16:16:42.618	2026-06-24 16:16:42.618
23565	\N	しかた	shikata	way (of doing something)	38	2026-06-24 16:16:42.62	2026-06-24 16:16:42.62
23566	亡くなります	なくなります	nakunarimasu	mất, qua đời	38	2026-06-24 16:16:42.622	2026-06-24 16:16:42.622
23567	\N	うそ	uso	nói dối, lời nói dối	38	2026-06-24 16:16:42.624	2026-06-24 16:16:42.624
23568	書類	しょるい	shorui	giấy tờ,tài liệu	38	2026-06-24 16:16:42.628	2026-06-24 16:16:42.628
23569	\N	クラス	kurasu	lớp học, lớp	38	2026-06-24 16:16:42.629	2026-06-24 16:16:42.629
23570	答えます［質問に～］	こたえます［しつもんに～］	kotaemasu [shitsumonni~]	trả lời	39	2026-06-24 16:16:42.716	2026-06-24 16:16:42.716
23571	倒れます［ビルが～］	たおれます［ビルが～］	taoremasu [biruga~]	đổ	39	2026-06-24 16:16:42.718	2026-06-24 16:16:42.718
23572	通ります［道を～］	とおります［みちを～］	torimasu [michiwo~]	đi qua	39	2026-06-24 16:16:42.719	2026-06-24 16:16:42.719
23573	死にます	しにます	shinimasu	chết	39	2026-06-24 16:16:42.721	2026-06-24 16:16:42.721
23574	\N	びっくりします	bikkurishimasu	ngạc nhiên, giật mình	39	2026-06-24 16:16:42.722	2026-06-24 16:16:42.722
23575	\N	がっかりします	gakkarishimasu	thất vọng	39	2026-06-24 16:16:42.723	2026-06-24 16:16:42.723
23576	安心します	あんしんします	anshinshimasu	yên tâm	39	2026-06-24 16:16:42.727	2026-06-24 16:16:42.727
23577	\N	けんかします	kenkashimasu	cãi nhau	39	2026-06-24 16:16:42.729	2026-06-24 16:16:42.729
23578	離婚します	りこんします	rikonshimasu	ly dị, ly hôn	39	2026-06-24 16:16:42.731	2026-06-24 16:16:42.731
23579	太ります	ふとります	futorimasu	get fat, gain weight	39	2026-06-24 16:16:42.733	2026-06-24 16:16:42.733
23580	\N	やせます	yasemasu	get slim, lose weight	39	2026-06-24 16:16:42.735	2026-06-24 16:16:42.735
23581	複雑［な］	ふくざつ［な］	fukuzatsu [na]	phức tạp	39	2026-06-24 16:16:42.737	2026-06-24 16:16:42.737
23582	邪魔［な］	じゃま［な］	jama [na]	cản trở, chiếm diện tích	39	2026-06-24 16:16:42.738	2026-06-24 16:16:42.738
23583	硬い	かたい	katai	hard, tough, solid	39	2026-06-24 16:16:42.74	2026-06-24 16:16:42.74
23584	軟らかい	やわらかい	yawarakai	soft, tender	39	2026-06-24 16:16:42.743	2026-06-24 16:16:42.743
23585	汚い	きたない	kitanai	bẩn	39	2026-06-24 16:16:42.746	2026-06-24 16:16:42.746
23586	\N	うれしい	ureshii	vui mừng	39	2026-06-24 16:16:42.747	2026-06-24 16:16:42.747
23587	悲しい	かなしい	kanashii	buồn, đau thương	39	2026-06-24 16:16:42.749	2026-06-24 16:16:42.749
23588	恥ずかしい	はずかしい	hazukashii	xấu hổ, thẹn, hổ thẹn	39	2026-06-24 16:16:42.75	2026-06-24 16:16:42.75
23589	首相	しゅしょう	shusho	Prime Minister	39	2026-06-24 16:16:42.752	2026-06-24 16:16:42.752
23590	地震	じしん	jishin	động đất	39	2026-06-24 16:16:42.753	2026-06-24 16:16:42.753
23591	津波	つなみ	tsunami	tsunami, tidal wave	39	2026-06-24 16:16:42.755	2026-06-24 16:16:42.755
23592	台風	たいふう	taifu	bão	39	2026-06-24 16:16:42.756	2026-06-24 16:16:42.756
23593	雷	かみなり	kaminari	thunder	39	2026-06-24 16:16:42.759	2026-06-24 16:16:42.759
23594	火事	かじ	kaji	hỏa hoạn	39	2026-06-24 16:16:42.761	2026-06-24 16:16:42.761
23595	事後	じご	jigo	accident	39	2026-06-24 16:16:42.763	2026-06-24 16:16:42.763
23596	\N	ハイキング	haikingu	hiking	39	2026-06-24 16:16:42.764	2026-06-24 16:16:42.764
23597	［お］見合い	［お］みあい	[o] miai	nam nữ làm quen qua giới thiệu, làm mối	39	2026-06-24 16:16:42.766	2026-06-24 16:16:42.766
23598	操作	そうさ	sosa	operation (～します : operate)	39	2026-06-24 16:16:42.767	2026-06-24 16:16:42.767
23599	会場	かいじょう	kaijo	venue, event location	39	2026-06-24 16:16:42.768	2026-06-24 16:16:42.768
23600	～代	～だい	~dai	tiền ~, phí ~	39	2026-06-24 16:16:42.77	2026-06-24 16:16:42.77
23601	～屋	～や	~ya	-er (e.g. baker, grocer, etc.)	39	2026-06-24 16:16:42.771	2026-06-24 16:16:42.771
23602	\N	フロント	furonto	bộ phận tiếp tân	39	2026-06-24 16:16:42.772	2026-06-24 16:16:42.772
23603	－号室	－ごうしつ	-goshitsu	room number －	39	2026-06-24 16:16:42.774	2026-06-24 16:16:42.774
23604	\N	タオル	taoru	khăn lau, khăn tắm	39	2026-06-24 16:16:42.778	2026-06-24 16:16:42.778
23605	\N	せっけん	sekken	xà phòng	39	2026-06-24 16:16:42.78	2026-06-24 16:16:42.78
23606	大勢	おおぜい	oozei	nhiều người	39	2026-06-24 16:16:42.781	2026-06-24 16:16:42.781
23607	お疲れ様でした。	おつかれさまでした。	otsukaresamadeshita.	chắc anh/chị đã mệt vì làm việc	39	2026-06-24 16:16:42.783	2026-06-24 16:16:42.783
23608	伺います。	うかがいます。	ukagaimasu.	tôi đến thăm	39	2026-06-24 16:16:42.784	2026-06-24 16:16:42.784
23609	途中で	とちゅうで	tochude	giữa đường, giữa chừng, dọc đường	39	2026-06-24 16:16:42.786	2026-06-24 16:16:42.786
23610	\N	トラック	torakku	xe tải	39	2026-06-24 16:16:42.787	2026-06-24 16:16:42.787
23611	\N	ぶつかります	butsukarimasu	đâm , va chạm	39	2026-06-24 16:16:42.789	2026-06-24 16:16:42.789
23612	大人	おとな	otona	người lớn	39	2026-06-24 16:16:42.791	2026-06-24 16:16:42.791
23613	\N	しかし	shikashi	however, but	39	2026-06-24 16:16:42.794	2026-06-24 16:16:42.794
23614	\N	また	mata	and	39	2026-06-24 16:16:42.795	2026-06-24 16:16:42.795
23615	洋服	ようふく	yofuku	quần áo kiểu tây âu	39	2026-06-24 16:16:42.797	2026-06-24 16:16:42.797
23616	西洋化します	せいようかします	seiyokashimasu	tây âu hóa	39	2026-06-24 16:16:42.798	2026-06-24 16:16:42.798
23617	合います	あいます	aimasu	vừa, hợp	39	2026-06-24 16:16:42.8	2026-06-24 16:16:42.8
23618	今では	いまでは	imadewa	bây giờ(thì)	39	2026-06-24 16:16:42.801	2026-06-24 16:16:42.801
23619	成人式	せいじんしき	seijinshiki	lễ trưởng thành, lễ thành nhân	39	2026-06-24 16:16:42.802	2026-06-24 16:16:42.802
23620	伝統的［な］	でんとうてき［な］	dentoteki [na]	traditional	39	2026-06-24 16:16:42.804	2026-06-24 16:16:42.804
23621	焼けます［うちが～］	やけます［うちが～］	yakemasu [uchiga~]	nướng	39	2026-06-24 16:16:42.805	2026-06-24 16:16:42.805
23622	焼けます［パンが～］	やけます［パンが～］	yakemasu [panga~]	nướng	39	2026-06-24 16:16:42.808	2026-06-24 16:16:42.808
23623	焼けます［肉が～］	やけます［にくが～］	yakemasu [nikuga~]	nướng	39	2026-06-24 16:16:42.81	2026-06-24 16:16:42.81
23624	遅刻します	ちこくします	chikokushimasu	đến chậm , đến muộn	39	2026-06-24 16:16:42.812	2026-06-24 16:16:42.812
23625	早退します	そうたいします	sotaishimasu	về sớm, ra sớm	39	2026-06-24 16:16:42.813	2026-06-24 16:16:42.813
23626	電話代	でんわだい	denwadai	tiền điện thoại, phí điện thoại	39	2026-06-24 16:16:42.815	2026-06-24 16:16:42.815
23627	汗	あせ	ase	mồ hôi	39	2026-06-24 16:16:42.816	2026-06-24 16:16:42.816
23628	並びます	ならびます	narabimasu	xếp hàng	39	2026-06-24 16:16:42.818	2026-06-24 16:16:42.818
23629	数えます	かぞえます	kazoemasu	đếm	40	2026-06-24 16:16:42.93	2026-06-24 16:16:42.93
23630	測ります、量ります	はかります	hakarimasu	đo, cân	40	2026-06-24 16:16:42.931	2026-06-24 16:16:42.931
23631	確かめます	たしかめます	tashikamemasu	xác nhận	40	2026-06-24 16:16:42.933	2026-06-24 16:16:42.933
23632	合います［サイズが～］	あいます［サイズが～］	aimasu [saizuga~]	vừa , hợp	40	2026-06-24 16:16:42.934	2026-06-24 16:16:42.934
23633	出発します	しゅっぱつします	shuppatsushimasu	xuất phát, khởi hành	40	2026-06-24 16:16:42.936	2026-06-24 16:16:42.936
23634	到着します	とうちゃくします	tochakushimasu	đến , đến nơi	40	2026-06-24 16:16:42.937	2026-06-24 16:16:42.937
23635	酔います	よいます	yoimasu	say	40	2026-06-24 16:16:42.939	2026-06-24 16:16:42.939
23636	\N	うまく いきます	umaku ikimasu	go well	40	2026-06-24 16:16:42.941	2026-06-24 16:16:42.941
23637	出ます［問題が～］	でます［もんだいが～］	demasu [mondaiga~]	[problems] be on the test	40	2026-06-24 16:16:42.944	2026-06-24 16:16:42.944
23638	相談します	そうだんします	sodanshimasu	consult, discuss	40	2026-06-24 16:16:42.946	2026-06-24 16:16:42.946
23639	必要［な］	ひつよう［な］	hitsuyo [na]	cần thiết	40	2026-06-24 16:16:42.948	2026-06-24 16:16:42.948
23640	天気予報	てんきよほう	tenkiyoho	weather forecast	40	2026-06-24 16:16:42.949	2026-06-24 16:16:42.949
23641	忘年会	ぼうねんかい	bonenkai	tiệc tất niên	40	2026-06-24 16:16:42.95	2026-06-24 16:16:42.95
23642	新年会	しんねんかい	shinnenkai	tiệc tân niên	40	2026-06-24 16:16:42.952	2026-06-24 16:16:42.952
23643	二次会	にじかい	nijikai	bữa tiệc thứ hai, tăng hai	40	2026-06-24 16:16:42.953	2026-06-24 16:16:42.953
23644	発表会	はっぴょうかい	happyokai	presentation meeting	40	2026-06-24 16:16:42.954	2026-06-24 16:16:42.954
23645	大会	たいかい	taikai	đại hội , cuộc thi	40	2026-06-24 16:16:42.956	2026-06-24 16:16:42.956
23646	\N	マラソン	marason	ma-ra-tong	40	2026-06-24 16:16:42.959	2026-06-24 16:16:42.959
23647	\N	コンテスト	kontesuto	cuộc thi	40	2026-06-24 16:16:42.961	2026-06-24 16:16:42.961
23648	表	おもて	omote	phía trước , mặt trước	40	2026-06-24 16:16:42.963	2026-06-24 16:16:42.963
23649	裏	うら	ura	phía sau , mặt sau	40	2026-06-24 16:16:42.964	2026-06-24 16:16:42.964
23650	\N	まちがい	machigai	sai , lỗi	40	2026-06-24 16:16:42.966	2026-06-24 16:16:42.966
23651	傷	きず	kizu	viết thương	40	2026-06-24 16:16:42.967	2026-06-24 16:16:42.967
23652	\N	ズボン	zubon	cái quần	40	2026-06-24 16:16:42.968	2026-06-24 16:16:42.968
23653	［お］年寄り	［お］としより	[o] toshiyori	elderly person	40	2026-06-24 16:16:42.97	2026-06-24 16:16:42.97
23654	長さ	ながさ	nagasa	chiều dài	40	2026-06-24 16:16:42.971	2026-06-24 16:16:42.971
23655	重さ	おもさ	omosa	cân nặng, trọng lượng	40	2026-06-24 16:16:42.972	2026-06-24 16:16:42.972
23656	高さ	たかさ	takasa	chiều cao	40	2026-06-24 16:16:42.975	2026-06-24 16:16:42.975
23657	大きさ	おおきさ	okisa	cỡ , kích thước	40	2026-06-24 16:16:42.978	2026-06-24 16:16:42.978
23658	［－］便	［－］びん	[-] bin	flight, flight number	40	2026-06-24 16:16:42.98	2026-06-24 16:16:42.98
23659	－個	－こ	-ko	(counter for small objects)	40	2026-06-24 16:16:42.981	2026-06-24 16:16:42.981
23660	－本	－ほん（－ぽん、－ぼん）	-hon (-pon, -bon)	(counter for long objects)	40	2026-06-24 16:16:42.982	2026-06-24 16:16:42.982
23661	－杯	－はい（－ぱい、－ばい）	-hai (-pai, -bai)	－ glass or cup of (counter for full cups, glasses, etc.)	40	2026-06-24 16:16:42.984	2026-06-24 16:16:42.984
23662	\N	－センチ	-senchi	－ centimetres	40	2026-06-24 16:16:42.985	2026-06-24 16:16:42.985
23663	\N	－ミリ	-miri	－ millimetres	40	2026-06-24 16:16:42.986	2026-06-24 16:16:42.986
23664	\N	－グラム	-guramu	－ grams	40	2026-06-24 16:16:42.988	2026-06-24 16:16:42.988
23665	～以上	～いじょう	~ijo	trở lên, trên	40	2026-06-24 16:16:42.989	2026-06-24 16:16:42.989
23666	～以下	～いか	~ika	not more than ～, under ～	40	2026-06-24 16:16:42.992	2026-06-24 16:16:42.992
23667	長崎	ながさき	nagasaki	capital of Nagasaki prefecture	40	2026-06-24 16:16:42.995	2026-06-24 16:16:42.995
23668	仙台	せんだい	sendai	capital of Miyagi prefecture	40	2026-06-24 16:16:42.996	2026-06-24 16:16:42.996
23669	\N	JL	JL	Japan Airlines	40	2026-06-24 16:16:42.998	2026-06-24 16:16:42.998
23670	七夕祭り	たなばたまつり	tanabatamatsuri	the Star Festival	40	2026-06-24 16:16:42.999	2026-06-24 16:16:42.999
23671	東照宮	とうしょうぐう	toshogu	shrine dedicated to Tokugawa Ieyasu in Nikko, Tochigi prefecture	40	2026-06-24 16:16:43.001	2026-06-24 16:16:43.001
23672	\N	どうでしょうか。	dodeshoka.	thế nào?(cách nói lịch sự của どうですか）	40	2026-06-24 16:16:43.002	2026-06-24 16:16:43.002
23673	\N	テスト	tesuto	bài kiểm tra	40	2026-06-24 16:16:43.003	2026-06-24 16:16:43.003
23674	成績	せいせき	seiseki	kết quả, thành tích	40	2026-06-24 16:16:43.005	2026-06-24 16:16:43.005
23675	\N	ところで	tokorode	nhân tiện	40	2026-06-24 16:16:43.006	2026-06-24 16:16:43.006
23676	\N	いらっしゃいます	irasshaimasu	đến(kính ngữ của きます）	40	2026-06-24 16:16:43.009	2026-06-24 16:16:43.009
23677	様子	ようす	yosu	vẻ, tình hình	40	2026-06-24 16:16:43.012	2026-06-24 16:16:43.012
23678	事件	じけん	jiken	vụ án	40	2026-06-24 16:16:43.014	2026-06-24 16:16:43.014
23679	\N	オートバイ	otobai	xe máy	40	2026-06-24 16:16:43.015	2026-06-24 16:16:43.015
23680	爆弾	ばくだん	bakudan	bom	40	2026-06-24 16:16:43.016	2026-06-24 16:16:43.016
23681	積みます	つみます	tsumimasu	chuyển lên, xếp hàng lên	40	2026-06-24 16:16:43.018	2026-06-24 16:16:43.018
23682	運転手	うんてんしゅ	untenshu	lái xe	40	2026-06-24 16:16:43.019	2026-06-24 16:16:43.019
23683	離れた	はなれた	hanareta	xa cách, xa	40	2026-06-24 16:16:43.02	2026-06-24 16:16:43.02
23684	急に	きゅうに	kyuni	suddenly	40	2026-06-24 16:16:43.022	2026-06-24 16:16:43.022
23685	動かします	うごかします	ugokashimasu	khởi động, chạy	40	2026-06-24 16:16:43.025	2026-06-24 16:16:43.025
23686	一生懸命	いっしょうけんめい	isshokenmei	all one's effort	40	2026-06-24 16:16:43.028	2026-06-24 16:16:43.028
23687	犯人	はんにん	hannin	thủ phạm	40	2026-06-24 16:16:43.03	2026-06-24 16:16:43.03
23688	男	おとこ	otoko	man	40	2026-06-24 16:16:43.032	2026-06-24 16:16:43.032
23689	手に 入れます	てに いれます	teni iremasu	có được, lấy được, đoạt được	40	2026-06-24 16:16:43.034	2026-06-24 16:16:43.034
23690	今でも	いまでも	imademo	ngay cả bây giờ	40	2026-06-24 16:16:43.035	2026-06-24 16:16:43.035
23691	危険［な］	きけん［な］	kiken [na]	nguy hiểm	40	2026-06-24 16:16:43.037	2026-06-24 16:16:43.037
23692	宇宙	うちゅう	uchu	vũ trụ	40	2026-06-24 16:16:43.039	2026-06-24 16:16:43.039
23693	地球	ちきゅう	chikyu	trái đất	40	2026-06-24 16:16:43.042	2026-06-24 16:16:43.042
23694	返事	へんじ	henji	hồi âm , trả lời	40	2026-06-24 16:16:43.045	2026-06-24 16:16:43.045
23695	申し込み	もうしこみ	moshikomi	đăng ký	40	2026-06-24 16:16:43.047	2026-06-24 16:16:43.047
23696	\N	ほんとう	honto	thật	40	2026-06-24 16:16:43.049	2026-06-24 16:16:43.049
23697	－号	－ごう	-go	train number, typhoon number, etc.	40	2026-06-24 16:16:43.05	2026-06-24 16:16:43.05
23698	\N	－キロ	-kiro	－ kilograms, kilometers	40	2026-06-24 16:16:43.052	2026-06-24 16:16:43.052
23699	\N	さあ	sa	à.., ồ..,(dùng khi không rõ về điều gì đó)	40	2026-06-24 16:16:43.054	2026-06-24 16:16:43.054
23700	\N	ゴッホ	gohho	Vincent van Gogh, Dutch painter (1853-90)	40	2026-06-24 16:16:43.055	2026-06-24 16:16:43.055
23701	雪祭り	ゆきまつり	yukimatsuri	Snow Festival in Sapporo	40	2026-06-24 16:16:43.058	2026-06-24 16:16:43.058
23702	\N	のぞみ	nozomi	name of a Shinkansen train	40	2026-06-24 16:16:43.061	2026-06-24 16:16:43.061
23703	\N	クラス	kurasu	lớp học	40	2026-06-24 16:16:43.063	2026-06-24 16:16:43.063
23704	\N	が	ga	nhưng	40	2026-06-24 16:16:43.065	2026-06-24 16:16:43.065
23705	うわします	うわさします	uwasashimasu	đồn đại	40	2026-06-24 16:16:43.066	2026-06-24 16:16:43.066
23706	\N	いただきます	itadakimasu	nhận (khiêm nhường ngữ củaもらいます)	41	2026-06-24 16:16:43.149	2026-06-24 16:16:43.149
23707	\N	くださいます	kudasaimasu	cho, tặng (tôi) (tôn kính ngữ củaくれます)	41	2026-06-24 16:16:43.15	2026-06-24 16:16:43.15
23708	\N	やります	yarimasu	cho, tặng (dùng với người dưới hoặc bằng vai)	41	2026-06-24 16:16:43.151	2026-06-24 16:16:43.151
23709	上げます	あげます	agemasu	raise, lift up	41	2026-06-24 16:16:43.153	2026-06-24 16:16:43.153
23710	下げます	さげます	sagemasu	lower, pull down	41	2026-06-24 16:16:43.154	2026-06-24 16:16:43.154
23711	親切に します	しんせつに します	shinsetsuni shimasu	giúp đỡ, đối xử thân thiện	41	2026-06-24 16:16:43.155	2026-06-24 16:16:43.155
23712	\N	かわいい	kawaii	xinh, đáng yêu	41	2026-06-24 16:16:43.159	2026-06-24 16:16:43.159
23713	珍しい	めずらしい	mezurashii	rare, uncommon	41	2026-06-24 16:16:43.161	2026-06-24 16:16:43.161
23714	お祝い	おいわい	oiwai	mừng, quà mừng (～をします：mừng)	41	2026-06-24 16:16:43.163	2026-06-24 16:16:43.163
23715	お年玉	おとしだま	otoshidama	tiền mừng tuổi	41	2026-06-24 16:16:43.164	2026-06-24 16:16:43.164
23716	［お］見舞い	［お］みまい	[o] mimai	thăm người ốm	41	2026-06-24 16:16:43.166	2026-06-24 16:16:43.166
23717	興味	きょうみ	kyomi	quan tâm	41	2026-06-24 16:16:43.167	2026-06-24 16:16:43.167
23718	情報	じょうほう	joho	thông tin	41	2026-06-24 16:16:43.169	2026-06-24 16:16:43.169
23719	文法	ぶんぽう	bunpo	ngữ pháp	41	2026-06-24 16:16:43.17	2026-06-24 16:16:43.17
23720	発音	はつおん	hatsuon	phát âm	41	2026-06-24 16:16:43.172	2026-06-24 16:16:43.172
23721	猿	さる	saru	con khỉ	41	2026-06-24 16:16:43.174	2026-06-24 16:16:43.174
23722	\N	えさ	esa	đồ ăn cho động vật, mồi	41	2026-06-24 16:16:43.177	2026-06-24 16:16:43.177
23723	\N	おもちゃ	omocha	đồ chơi	41	2026-06-24 16:16:43.179	2026-06-24 16:16:43.179
23724	絵本	えほん	ehon	truyện tranh	41	2026-06-24 16:16:43.181	2026-06-24 16:16:43.181
23725	絵はがき	えはがき	ehagaki	bưu ảnh	41	2026-06-24 16:16:43.182	2026-06-24 16:16:43.182
23726	\N	ドライバー	doraiba	đồ vặn ốc; tua-vít	41	2026-06-24 16:16:43.184	2026-06-24 16:16:43.184
23727	\N	ハンカチ	hankachi	khăn tay	41	2026-06-24 16:16:43.186	2026-06-24 16:16:43.186
23728	靴下	くつした	kutsushita	vớ	41	2026-06-24 16:16:43.187	2026-06-24 16:16:43.187
23729	手袋	てぶくろ	tebukuro	găng tay	41	2026-06-24 16:16:43.189	2026-06-24 16:16:43.189
23730	幼稚園	ようちえん	yochien	preschool, kindergarten	41	2026-06-24 16:16:43.191	2026-06-24 16:16:43.191
23731	暖房	だんぼう	danbo	heating	41	2026-06-24 16:16:43.194	2026-06-24 16:16:43.194
23732	冷房	れいぼう	reibo	air-conditioning	41	2026-06-24 16:16:43.195	2026-06-24 16:16:43.195
23733	温度	おんど	ondo	temperature	41	2026-06-24 16:16:43.197	2026-06-24 16:16:43.197
23734	祖父	そふ	sofu	ông (của mình)	41	2026-06-24 16:16:43.198	2026-06-24 16:16:43.198
23735	祖母	そぼ	sobo	bà (của mình)	41	2026-06-24 16:16:43.2	2026-06-24 16:16:43.2
23736	孫	まご	mago	cháu	41	2026-06-24 16:16:43.201	2026-06-24 16:16:43.201
23737	お孫さん	おまごさん	omagosan	(someone else's) grandchild	41	2026-06-24 16:16:43.203	2026-06-24 16:16:43.203
23738	\N	おじ	oji	chú, bác, cậu (của mình)	41	2026-06-24 16:16:43.205	2026-06-24 16:16:43.205
23739	\N	おじさん	ojisan	Chú, cậu, bác (dùng với người khác)	41	2026-06-24 16:16:43.206	2026-06-24 16:16:43.206
23740	\N	おば	oba	cô, dì (của mình)	41	2026-06-24 16:16:43.209	2026-06-24 16:16:43.209
23741	\N	おばさん	obasan	cô, dì, bác (dùng với người khác)	41	2026-06-24 16:16:43.212	2026-06-24 16:16:43.212
23742	管理人	かんりにん	kanrinin	janitor, caretaker	41	2026-06-24 16:16:43.213	2026-06-24 16:16:43.213
23743	\N	～さん	~san	(suffix added to a person's job title as a polite way of referring to them)	41	2026-06-24 16:16:43.215	2026-06-24 16:16:43.215
23744	この間	このあいだ	konoaida	the other day	41	2026-06-24 16:16:43.216	2026-06-24 16:16:43.216
23745	\N	ひとこと	hitokoto	a few words	41	2026-06-24 16:16:43.218	2026-06-24 16:16:43.218
23746	\N	～ずつ	~zutsu	each	41	2026-06-24 16:16:43.219	2026-06-24 16:16:43.219
23747	二人	ふたり	futari	couple	41	2026-06-24 16:16:43.221	2026-06-24 16:16:43.221
23748	お宅	おたく	otaku	home (respectful equivalent of うち or いえ)	41	2026-06-24 16:16:43.222	2026-06-24 16:16:43.222
23749	どうぞ お幸せに。	どうぞ おしあわせに。	dozo oshiawaseni.	I hope you will be very happy.	41	2026-06-24 16:16:43.225	2026-06-24 16:16:43.225
23750	昔話	むかしばなし	mukashibanashi	truyền thuyết; cổ tích	41	2026-06-24 16:16:43.227	2026-06-24 16:16:43.227
23751	\N	ある ～	aru ~	có một~	41	2026-06-24 16:16:43.229	2026-06-24 16:16:43.229
23752	男	おとこ	otoko	người đàn ông, nam giới	41	2026-06-24 16:16:43.231	2026-06-24 16:16:43.231
23753	子どもたち	こどもたち	kodomotachi	trẻ em, trẻ con, bọn trẻ	41	2026-06-24 16:16:43.232	2026-06-24 16:16:43.232
23754	\N	いじめます	ijimemasu	chọc ghẹo; chọc phá	41	2026-06-24 16:16:43.233	2026-06-24 16:16:43.233
23755	\N	かめ	kame	con rùa	41	2026-06-24 16:16:43.235	2026-06-24 16:16:43.235
23756	助けます	たすけます	tasukemasu	cứu; giúp	41	2026-06-24 16:16:43.236	2026-06-24 16:16:43.236
23757	優しい	やさしい	yasashii	kind, gentle, tender-hearted	41	2026-06-24 16:16:43.238	2026-06-24 16:16:43.238
23758	お姫様	おひめさま	ohimesama	công chúa	41	2026-06-24 16:16:43.239	2026-06-24 16:16:43.239
23759	暮らします	くらします	kurashimasu	sống	41	2026-06-24 16:16:43.242	2026-06-24 16:16:43.242
23760	陸	りく	riku	lục địa	41	2026-06-24 16:16:43.244	2026-06-24 16:16:43.244
23761	\N	すると	suruto	thế rồi, sau đó	41	2026-06-24 16:16:43.246	2026-06-24 16:16:43.246
23762	煙	けむり	kemuri	khói	41	2026-06-24 16:16:43.247	2026-06-24 16:16:43.247
23763	真っ白［な］	まっしろ［な］	masshiro [na]	trắng toát, trắng ngần	41	2026-06-24 16:16:43.249	2026-06-24 16:16:43.249
23764	中身	なかみ	nakami	nội dung, cái ở bên trong	41	2026-06-24 16:16:43.25	2026-06-24 16:16:43.25
23765	浦島太郎	うらしまたろう	urashimataro	name of the main character in an old folk tale	41	2026-06-24 16:16:43.251	2026-06-24 16:16:43.251
23766	呼びます	よびます	yobimasu	mời	41	2026-06-24 16:16:43.253	2026-06-24 16:16:43.253
23767	取り替えます	とりかえます	torikaemasu	đổi, thay	41	2026-06-24 16:16:43.255	2026-06-24 16:16:43.255
23768	指輪	ゆびわ	yubiwa	cái nhẫn	41	2026-06-24 16:16:43.256	2026-06-24 16:16:43.256
23769	\N	バッグ	baggu	túi xách	41	2026-06-24 16:16:43.26	2026-06-24 16:16:43.26
23770	\N	おととし	ototoshi	năm ngoái	41	2026-06-24 16:16:43.263	2026-06-24 16:16:43.263
23771	\N	はあ	ha	à, ồ	41	2026-06-24 16:16:43.264	2026-06-24 16:16:43.264
23772	申し訳 ありません。	もうしわけ ありません。	moshiwake arimasen.	Xin lỗi	41	2026-06-24 16:16:43.266	2026-06-24 16:16:43.266
23773	預かります	あずかります	azukarimasu	bảo quản; thu nhận; giữ giùm	41	2026-06-24 16:16:43.268	2026-06-24 16:16:43.268
23774	先日	せんじつ	senjitsu	hôm trước, mấy hôm trước	41	2026-06-24 16:16:43.27	2026-06-24 16:16:43.27
23775	助かります	たすかります	tasukarimasu	giúp đỡ	41	2026-06-24 16:16:43.271	2026-06-24 16:16:43.271
23776	［お］城	［お］しろ	[o] shiro	lâu đài; thành	41	2026-06-24 16:16:43.273	2026-06-24 16:16:43.273
23777	楽しく	たのしく	tanoshiku	vui sướng	41	2026-06-24 16:16:43.276	2026-06-24 16:16:43.276
23778	包みます	つつみます	tsutsumimasu	bọc; gói	42	2026-06-24 16:16:43.382	2026-06-24 16:16:43.382
23779	沸かします	わかします	wakashimasu	đun sôi	42	2026-06-24 16:16:43.383	2026-06-24 16:16:43.383
23780	混ぜます	まぜます	mazemasu	trộn; khuấy	42	2026-06-24 16:16:43.385	2026-06-24 16:16:43.385
23781	計算します	けいさんします	keisanshimasu	tính toán	42	2026-06-24 16:16:43.386	2026-06-24 16:16:43.386
23782	並びます	ならびます	narabimasu	stand in a queue, line up	42	2026-06-24 16:16:43.388	2026-06-24 16:16:43.388
23783	丈夫［な］	じょうぶ［な］	jobu [na]	strong, healthy	42	2026-06-24 16:16:43.391	2026-06-24 16:16:43.391
23784	\N	アパート	apato	apartment, flat	42	2026-06-24 16:16:43.394	2026-06-24 16:16:43.394
23785	弁護士	べんごし	bengoshi	luật sư	42	2026-06-24 16:16:43.395	2026-06-24 16:16:43.395
23786	音楽家	おんがくか	ongakuka	nhạc sĩ	42	2026-06-24 16:16:43.397	2026-06-24 16:16:43.397
23787	子どもたち	こどもたち	kodomotachi	trẻ em	42	2026-06-24 16:16:43.399	2026-06-24 16:16:43.399
23788	自然	しぜん	shizen	nature	42	2026-06-24 16:16:43.401	2026-06-24 16:16:43.401
23789	教育	きょういく	kyoiku	giáo dục	42	2026-06-24 16:16:43.402	2026-06-24 16:16:43.402
23790	文化	ぶんか	bunka	văn hoá	42	2026-06-24 16:16:43.404	2026-06-24 16:16:43.404
23791	社会	しゃかい	shakai	xã hội	42	2026-06-24 16:16:43.405	2026-06-24 16:16:43.405
23792	政治	せいじ	seiji	politics	42	2026-06-24 16:16:43.408	2026-06-24 16:16:43.408
23793	法律	ほうりつ	horitsu	pháp luật	42	2026-06-24 16:16:43.411	2026-06-24 16:16:43.411
23794	戦争	せんそう	senso	chiến tranh	42	2026-06-24 16:16:43.412	2026-06-24 16:16:43.412
23795	平和	へいわ	heiwa	hoà bình	42	2026-06-24 16:16:43.413	2026-06-24 16:16:43.413
23796	目的	もくてき	mokuteki	mục đích	42	2026-06-24 16:16:43.415	2026-06-24 16:16:43.415
23797	論文	ろんぶん	ronbun	luận văn, bài báo học thuật	42	2026-06-24 16:16:43.416	2026-06-24 16:16:43.416
23798	楽しみ	たのしみ	tanoshimi	pleasure, enjoyment, expectation	42	2026-06-24 16:16:43.418	2026-06-24 16:16:43.418
23799	\N	ミキサー	mikisa	mixer, blender	42	2026-06-24 16:16:43.419	2026-06-24 16:16:43.419
23800	\N	やかん	yakan	ấm đun nước	42	2026-06-24 16:16:43.42	2026-06-24 16:16:43.42
23801	\N	ふた	futa	lid, cover, cap	42	2026-06-24 16:16:43.421	2026-06-24 16:16:43.421
23802	栓抜き	せんぬき	sennuki	cái mở nắp chai	42	2026-06-24 16:16:43.423	2026-06-24 16:16:43.423
23803	缶切	かんきり	kankiri	đồ mở đồ hộp	42	2026-06-24 16:16:43.427	2026-06-24 16:16:43.427
23804	缶詰	かんづめ	kanzume	đồ hộp	42	2026-06-24 16:16:43.429	2026-06-24 16:16:43.429
23805	のし袋	のしぶくろ	noshibukuro	envelope for a gift of money	42	2026-06-24 16:16:43.43	2026-06-24 16:16:43.43
23806	\N	ふろしき	furoshiki	khăn gói	42	2026-06-24 16:16:43.431	2026-06-24 16:16:43.431
23807	\N	そろばん	soroban	bàn tính	42	2026-06-24 16:16:43.433	2026-06-24 16:16:43.433
23808	体温計	たいおんけい	taionkei	cặp nhiệt độ	42	2026-06-24 16:16:43.434	2026-06-24 16:16:43.434
23809	材料	ざいりょう	zairyo	vật liệu, nguyên liệu	42	2026-06-24 16:16:43.436	2026-06-24 16:16:43.436
23810	\N	ある ～	aru ~	nọ	42	2026-06-24 16:16:43.437	2026-06-24 16:16:43.437
23811	一生懸命	いっしょうけんめい	isshokenmei	cố gắng	42	2026-06-24 16:16:43.439	2026-06-24 16:16:43.439
23812	\N	なぜ	naze	tại sao	42	2026-06-24 16:16:43.441	2026-06-24 16:16:43.441
23813	\N	どのくらい	donokurai	how much, how many	42	2026-06-24 16:16:43.443	2026-06-24 16:16:43.443
23814	国連	こくれん	kokuren	liên hiệp quốc	42	2026-06-24 16:16:43.445	2026-06-24 16:16:43.445
23815	\N	エリーゼの ために	eriizeno tameni	Für Elise (For Elise)	42	2026-06-24 16:16:43.447	2026-06-24 16:16:43.447
23816	\N	ベートーベン	betoben	Ludwig van Beethoven, German composer (1770-1827)	42	2026-06-24 16:16:43.448	2026-06-24 16:16:43.448
23817	\N	こどもニュース	kodomonyusu	a fictitious news programme	42	2026-06-24 16:16:43.449	2026-06-24 16:16:43.449
23818	出ます［ボーナスが～］	でます［ボーナスが～］	demasu [bonasuga~]	[bonus] be paid	42	2026-06-24 16:16:43.45	2026-06-24 16:16:43.45
23819	半分	はんぶん	hanbun	half	42	2026-06-24 16:16:43.452	2026-06-24 16:16:43.452
23820	\N	ローン	ron	khoản vay trả góp, tiền vay góp	42	2026-06-24 16:16:43.453	2026-06-24 16:16:43.453
23821	\N	カップめん	kappumen	instant noodles sold in a ready-to-use disposable container, pot noodles	42	2026-06-24 16:16:43.454	2026-06-24 16:16:43.454
23822	世界初	せかいはつ	sekaihatsu	world's first	42	2026-06-24 16:16:43.456	2026-06-24 16:16:43.456
23823	\N	～に よって	~ni yotte	by ～	42	2026-06-24 16:16:43.46	2026-06-24 16:16:43.46
23824	\N	どんぶり	donburi	cái bát tô	42	2026-06-24 16:16:43.462	2026-06-24 16:16:43.462
23825	\N	めん	men	noodles	42	2026-06-24 16:16:43.463	2026-06-24 16:16:43.463
23826	広めます	ひろめます	hiromemasu	spread	42	2026-06-24 16:16:43.465	2026-06-24 16:16:43.465
23827	市場調査	しじょうちょうさ	shijochosa	market survey, market research	42	2026-06-24 16:16:43.466	2026-06-24 16:16:43.466
23828	割ります	わります	warimasu	break	42	2026-06-24 16:16:43.467	2026-06-24 16:16:43.467
23829	注ぎます	そそぎます	sosogimasu	pour	42	2026-06-24 16:16:43.468	2026-06-24 16:16:43.468
23830	\N	チキンラーメン	chikinramen	brand name of instant noodles	42	2026-06-24 16:16:43.47	2026-06-24 16:16:43.47
23831	安藤百福	あんどうももふく	andomomofuku	Japanese businessman and inventor (1910-2007)	42	2026-06-24 16:16:43.471	2026-06-24 16:16:43.471
23832	厚い	あつい	atsui	dày	42	2026-06-24 16:16:43.472	2026-06-24 16:16:43.472
23833	薄い	うすい	usui	mỏng	42	2026-06-24 16:16:43.475	2026-06-24 16:16:43.475
23834	二人	ふたり	futari	hai người, cặp, đôi	42	2026-06-24 16:16:43.477	2026-06-24 16:16:43.477
23835	歴史	れきし	rekishi	lịch sử	42	2026-06-24 16:16:43.479	2026-06-24 16:16:43.479
23836	安全	あんぜん	anzen	an toàn	42	2026-06-24 16:16:43.481	2026-06-24 16:16:43.481
23837	関係	かんけい	kankei	quan hệ	42	2026-06-24 16:16:43.482	2026-06-24 16:16:43.482
23838	石	いし	ishi	đá; sỏi	42	2026-06-24 16:16:43.484	2026-06-24 16:16:43.484
23839	\N	ピラミッド	piramiddo	kim tự tháp	42	2026-06-24 16:16:43.486	2026-06-24 16:16:43.486
23840	\N	データ	deta	số liệu, dữ liệu	42	2026-06-24 16:16:43.488	2026-06-24 16:16:43.488
23841	\N	ファイル	fuairu	tập tin	42	2026-06-24 16:16:43.49	2026-06-24 16:16:43.49
23842	\N	ポーランド	porando	Ba Lan	42	2026-06-24 16:16:43.494	2026-06-24 16:16:43.494
23843	\N	セット	setto	bộ	42	2026-06-24 16:16:43.496	2026-06-24 16:16:43.496
23844	\N	あと	ato	the amount left unused, the rest	42	2026-06-24 16:16:43.498	2026-06-24 16:16:43.498
23845	\N	カップラーメン	kappuramen	mì ăn liền đựng trong cốc	42	2026-06-24 16:16:43.499	2026-06-24 16:16:43.499
23846	\N	インスタントラーメン	insutantoramen	mì ăn liền	42	2026-06-24 16:16:43.501	2026-06-24 16:16:43.501
23847	\N	なべ	nabe	nồi	42	2026-06-24 16:16:43.503	2026-06-24 16:16:43.503
23848	食品	しょくひん	shokuhin	thực phẩm	42	2026-06-24 16:16:43.505	2026-06-24 16:16:43.505
23849	調査	ちょうさ	chosa	việc điều tra, cuộc điều tra	42	2026-06-24 16:16:43.509	2026-06-24 16:16:43.509
23850	\N	カップ	kappu	tách; chén	42	2026-06-24 16:16:43.512	2026-06-24 16:16:43.512
23851	\N	また	mata	và, thêm nữa	42	2026-06-24 16:16:43.513	2026-06-24 16:16:43.513
23852	～の 代わりに	～の かわりに	~no kawarini	thay cho	42	2026-06-24 16:16:43.515	2026-06-24 16:16:43.515
23853	\N	どこででも	dokodedemo	bất cứ nơi nào	42	2026-06-24 16:16:43.517	2026-06-24 16:16:43.517
23854	今では	いまでは	imadewa	bây giờ; hiện nay	42	2026-06-24 16:16:43.518	2026-06-24 16:16:43.518
23855	増えます［輸出が～］	ふえます［ゆしゅつが～］	fuemasu [yushutsuga~]	tăng, tăng lên [xuất khẩu ~]	43	2026-06-24 16:16:43.726	2026-06-24 16:16:43.726
23856	減ります［輸出が～］	へります［ゆしゅつが～］	herimasu [yushutsuga~]	giảm, giảm xuống [xuất khẩu ~]	43	2026-06-24 16:16:43.73	2026-06-24 16:16:43.73
23857	上がります［値段が～］	あがります［ねだんが～］	agarimasu [nedanga~]	tăng, tăng lên [giá ~]	43	2026-06-24 16:16:43.733	2026-06-24 16:16:43.733
23858	下がります［値段が～］	さがります［ねだんが～］	sagarimasu [nedanga~]	giảm, giảm xuống [giá ~]	43	2026-06-24 16:16:43.736	2026-06-24 16:16:43.736
23859	切れます［ひもが～］	きれます［ひもが～］	kiremasu [himoga~]	đứt [sợi dây bị ~]	43	2026-06-24 16:16:43.739	2026-06-24 16:16:43.739
23860	\N	とれます［ボタンが～］	toremasu [botanga~]	tuột [cái cúc bị ~]	43	2026-06-24 16:16:43.744	2026-06-24 16:16:43.744
23861	落ちます［荷物が～］	おちます［にもつ～］	ochimasu [nimotsu~]	rơi [hành lý bị ~]	43	2026-06-24 16:16:43.748	2026-06-24 16:16:43.748
23862	\N	なくなります［ガソリンが～］	nakunarimasu [gasoringa~]	mất, hết (xăng)	43	2026-06-24 16:16:43.752	2026-06-24 16:16:43.752
23863	変［な］	へん［な］	hen [na]	strange, peculiar	43	2026-06-24 16:16:43.758	2026-06-24 16:16:43.758
23864	幸せ［な］	しあわせ［な］	shiawase [na]	hạnh phúc	43	2026-06-24 16:16:43.763	2026-06-24 16:16:43.763
23865	楽［な］	らく［な］	raku [na]	easy	43	2026-06-24 16:16:43.768	2026-06-24 16:16:43.768
23866	\N	うまい	umai	ngon	43	2026-06-24 16:16:43.772	2026-06-24 16:16:43.772
23867	\N	まずい	mazui	dở	43	2026-06-24 16:16:43.778	2026-06-24 16:16:43.778
23868	\N	つまらない	tsumaranai	buồn tẻ, không hấp dẫn, không thú vị	43	2026-06-24 16:16:43.782	2026-06-24 16:16:43.782
23869	優しい	やさしい	yasashii	kind, gentle, tender-hearted	43	2026-06-24 16:16:43.786	2026-06-24 16:16:43.786
23870	\N	ガソリン	gasorin	xăng	43	2026-06-24 16:16:43.792	2026-06-24 16:16:43.792
23871	火	ひ	hi	lửa	43	2026-06-24 16:16:43.797	2026-06-24 16:16:43.797
23872	\N	パンフレット	panfuretto	pamphlet	43	2026-06-24 16:16:43.801	2026-06-24 16:16:43.801
23873	今にも	いまにも	imanimo	(có vẻ sắp)~đến nơi	43	2026-06-24 16:16:43.806	2026-06-24 16:16:43.806
23874	\N	わあ	wa	ôi! (câu nói dùng khi ngạc nhiên hoặc cảm thán điều gì)	43	2026-06-24 16:16:43.811	2026-06-24 16:16:43.811
23875	\N	ばら	bara	hoa hồng	43	2026-06-24 16:16:43.816	2026-06-24 16:16:43.816
23876	\N	ドライブ	doraibu	lái xe (đi chơi)	43	2026-06-24 16:16:43.821	2026-06-24 16:16:43.821
23877	理由	りゆう	riyu	reason	43	2026-06-24 16:16:43.827	2026-06-24 16:16:43.827
23878	謝ります	あやまります	ayamarimasu	apologize	43	2026-06-24 16:16:43.832	2026-06-24 16:16:43.832
23879	知り合います	しりあいます	shiriaimasu	get acquainted	43	2026-06-24 16:16:43.836	2026-06-24 16:16:43.836
23880	丈夫［な］	じょうぶ［な］	jobu [na]	strong, healthy	43	2026-06-24 16:16:43.841	2026-06-24 16:16:43.841
23881	暖房	だんぼう	danbo	thiết bị làm ấm, lò sưởi, máy điều hòa	43	2026-06-24 16:16:43.846	2026-06-24 16:16:43.846
23882	冷房	れいぼう	reibo	thiết bị làm mát, máy điều hòa	43	2026-06-24 16:16:43.851	2026-06-24 16:16:43.851
23883	\N	センス	sensu	có khiếu, gu	43	2026-06-24 16:16:43.856	2026-06-24 16:16:43.856
23884	会員	かいいん	kaiin	thành viên	43	2026-06-24 16:16:43.862	2026-06-24 16:16:43.862
23885	適当［な］	てきとう［な］	tekito [na]	suitable, proper	43	2026-06-24 16:16:43.867	2026-06-24 16:16:43.867
23886	年齢	ねんれい	nenrei	tuổi	43	2026-06-24 16:16:43.872	2026-06-24 16:16:43.872
23887	収入	しゅうにゅう	shunyu	thu nhập	43	2026-06-24 16:16:43.877	2026-06-24 16:16:43.877
23888	\N	ぴったり	pittari	vừa văn, đúng	43	2026-06-24 16:16:43.883	2026-06-24 16:16:43.883
23889	\N	そのうえ	sonoue	thêm vào đó, hơn thế	43	2026-06-24 16:16:43.887	2026-06-24 16:16:43.887
23890	\N	～と いいます	~to iimasu	tên là~/ được gọi là~	43	2026-06-24 16:16:43.892	2026-06-24 16:16:43.892
23891	泣きます	なきます	nakimasu	khóc	44	2026-06-24 16:16:44.002	2026-06-24 16:16:44.002
23892	笑います	わらいます	waraimasu	cười	44	2026-06-24 16:16:44.003	2026-06-24 16:16:44.003
23893	眠ります	ねむります	nemurimasu	sleep	44	2026-06-24 16:16:44.005	2026-06-24 16:16:44.005
23894	乾きます［シャツが～］	かわきます［シャツが～］	kawakimasu [shatsuga~]	khô	44	2026-06-24 16:16:44.009	2026-06-24 16:16:44.009
23895	濡れる［シャツが～］	ぬれます［シャツが～］	nuremasu [shatsuga~]	ướt	44	2026-06-24 16:16:44.013	2026-06-24 16:16:44.013
23896	滑べります	すべります	suberimasu	trượt	44	2026-06-24 16:16:44.014	2026-06-24 16:16:44.014
23897	起きます［事故が～］	おきます［じこが～］	okimasu [jikoga~]	xảy ra [tai nạn ~]	44	2026-06-24 16:16:44.016	2026-06-24 16:16:44.016
23898	調節します	ちょうせつします	chosetsushimasu	điều tiết, điều chỉnh	44	2026-06-24 16:16:44.017	2026-06-24 16:16:44.017
23899	安全［な］	あんぜん［な］	anzen [na]	an toàn	44	2026-06-24 16:16:44.019	2026-06-24 16:16:44.019
23900	危険［な］	きけん［な］	kiken [na]	dangerous	44	2026-06-24 16:16:44.021	2026-06-24 16:16:44.021
23901	濃い	こい	koi	đậm; nồng	44	2026-06-24 16:16:44.022	2026-06-24 16:16:44.022
23902	薄い	うすい	usui	nhạt; lợt	44	2026-06-24 16:16:44.026	2026-06-24 16:16:44.026
23903	厚い	あつい	atsui	thick	44	2026-06-24 16:16:44.028	2026-06-24 16:16:44.028
23904	太い	ふとい	futoi	thick (of large diameter)	44	2026-06-24 16:16:44.03	2026-06-24 16:16:44.03
23905	細い	ほそい	hosoi	thin (of small diameter)	44	2026-06-24 16:16:44.031	2026-06-24 16:16:44.031
23906	空気	くうき	kuki	không khí	44	2026-06-24 16:16:44.033	2026-06-24 16:16:44.033
23907	涙	なみだ	namida	nước mắt	44	2026-06-24 16:16:44.034	2026-06-24 16:16:44.034
23908	和食	わしょく	washoku	món ăn Nhật	44	2026-06-24 16:16:44.036	2026-06-24 16:16:44.036
23909	洋食	ようしょく	yoshoku	món ăn Âu Mỹ	44	2026-06-24 16:16:44.038	2026-06-24 16:16:44.038
23910	御数	おかず	okazu	thức ăn	44	2026-06-24 16:16:44.04	2026-06-24 16:16:44.04
23911	量	りょう	ryo	lượng	44	2026-06-24 16:16:44.044	2026-06-24 16:16:44.044
23912	－倍	－ばい	-bai	－ times	44	2026-06-24 16:16:44.046	2026-06-24 16:16:44.046
23913	\N	シングル	shinguru	phòng đơn	44	2026-06-24 16:16:44.047	2026-06-24 16:16:44.047
23914	\N	ツイン	tsuin	phòng đôi	44	2026-06-24 16:16:44.049	2026-06-24 16:16:44.049
23915	洗濯物	せんたくもの	sentakumono	đồ giặt	44	2026-06-24 16:16:44.05	2026-06-24 16:16:44.05
23916	\N	DVD	DVD	DVD	44	2026-06-24 16:16:44.051	2026-06-24 16:16:44.051
23917	\N	ホテルひろしま	hoteruhiroshima	a fictitious hotel	44	2026-06-24 16:16:44.053	2026-06-24 16:16:44.053
23918	\N	どう なさいますか。	do nasaimasuka.	tôi có thể giúp gì cho ông?	44	2026-06-24 16:16:44.054	2026-06-24 16:16:44.054
23919	\N	カット	katto	cắt tóc	44	2026-06-24 16:16:44.057	2026-06-24 16:16:44.057
23920	\N	シャンプー	shanpu	xà-bông gội đầu	44	2026-06-24 16:16:44.06	2026-06-24 16:16:44.06
23921	\N	どういうふうに なさいますか。	doiufuni nasaimasuka.	Anh/chị định ~ như thế nào?	44	2026-06-24 16:16:44.063	2026-06-24 16:16:44.063
23922	\N	ショート	shoto	kiểu ngắn	44	2026-06-24 16:16:44.064	2026-06-24 16:16:44.064
23923	\N	～みたいに して ください。	~mitaini shite kudasai.	xin làm giống như	44	2026-06-24 16:16:44.066	2026-06-24 16:16:44.066
23924	\N	これで よろしいでしょうか。	korede yoroshiideshoka.	thế này được chưa ạ?	44	2026-06-24 16:16:44.067	2026-06-24 16:16:44.067
23925	［どうも］お疲れさまでした。	［どうも］おつかれさまでした。	[domo] otsukaresamadeshita.	Thank you for your patience. (shop assistant to customer)	44	2026-06-24 16:16:44.069	2026-06-24 16:16:44.069
23926	嫌がります	いやがります	iyagarimasu	ghét	44	2026-06-24 16:16:44.07	2026-06-24 16:16:44.07
23927	\N	また	mata	và	44	2026-06-24 16:16:44.072	2026-06-24 16:16:44.072
23928	\N	うまく	umaku	well	44	2026-06-24 16:16:44.075	2026-06-24 16:16:44.075
23929	順序	じゅんじょ	junjo	thứ tự	44	2026-06-24 16:16:44.078	2026-06-24 16:16:44.078
23930	安心［な］	あんしん［な］	anshin [na]	relieved	44	2026-06-24 16:16:44.079	2026-06-24 16:16:44.079
23931	表現	ひょうげん	hyogen	cách nói, cách diễn đạt	44	2026-06-24 16:16:44.081	2026-06-24 16:16:44.081
23932	例えば	たとえば	tatoeba	ví dụ	44	2026-06-24 16:16:44.082	2026-06-24 16:16:44.082
23933	別れます	わかれます	wakaremasu	chia cách; chia tay	44	2026-06-24 16:16:44.083	2026-06-24 16:16:44.083
23934	\N	これら	korera	những thứ này	44	2026-06-24 16:16:44.085	2026-06-24 16:16:44.085
23935	縁起が 悪い	えんぎが わるい	engiga warui	không may, không lành	44	2026-06-24 16:16:44.086	2026-06-24 16:16:44.086
23936	丁寧［な］	ていねい［な］	teinei [na]	lịch sự	44	2026-06-24 16:16:44.087	2026-06-24 16:16:44.087
23937	細かい	こまかい	komakai	nhỏ	44	2026-06-24 16:16:44.089	2026-06-24 16:16:44.089
23938	半分	はんぶん	hanbun	một nửa	44	2026-06-24 16:16:44.092	2026-06-24 16:16:44.092
23939	箪笥	たんす	tansu	tủ quần áo	44	2026-06-24 16:16:44.094	2026-06-24 16:16:44.094
23940	理由	りゆう	riyu	lý do	44	2026-06-24 16:16:44.096	2026-06-24 16:16:44.096
23941	信じます	しんじます	shinjimasu	tin, tin tưởng	45	2026-06-24 16:16:44.207	2026-06-24 16:16:44.207
23942	\N	キャンセルします	kyanserushimasu	hủy, hủy bỏ	45	2026-06-24 16:16:44.211	2026-06-24 16:16:44.211
23943	知らせます	しらせます	shirasemasu	inform	45	2026-06-24 16:16:44.213	2026-06-24 16:16:44.213
23944	保証書	ほしょうしょ	hoshosho	giấy bảo hành	45	2026-06-24 16:16:44.215	2026-06-24 16:16:44.215
23945	領収書	りょうしゅうしょ	ryoshusho	hóa đơn	45	2026-06-24 16:16:44.216	2026-06-24 16:16:44.216
23946	\N	キャンプ	kyanpu	trại	45	2026-06-24 16:16:44.218	2026-06-24 16:16:44.218
23947	中止	ちゅうし	chushi	cấm, đình chỉ	45	2026-06-24 16:16:44.219	2026-06-24 16:16:44.219
23948	点	てん	ten	điểm	45	2026-06-24 16:16:44.221	2026-06-24 16:16:44.221
23949	梅	うめ	ume	plum (blossom)	45	2026-06-24 16:16:44.223	2026-06-24 16:16:44.223
23950	１１０番	１１０ばん	110ban	the emergency police telephone number	45	2026-06-24 16:16:44.227	2026-06-24 16:16:44.227
23951	１１９番	１１９ばん	119ban	the emergency fire service telephone number	45	2026-06-24 16:16:44.228	2026-06-24 16:16:44.228
23952	急に	きゅうに	kyuni	gấp	45	2026-06-24 16:16:44.23	2026-06-24 16:16:44.23
23953	無理に	むりに	murini	unreasonably	45	2026-06-24 16:16:44.232	2026-06-24 16:16:44.232
23954	楽しみに して います	たのしみに して います	tanoshimini shite imasu	mong đợi, lấy làm vui	45	2026-06-24 16:16:44.233	2026-06-24 16:16:44.233
23955	以上です。	いじょうです。	ijodesu.	xin hết	45	2026-06-24 16:16:44.235	2026-06-24 16:16:44.235
23956	係員	かかりいん	kakariin	nhân viên	45	2026-06-24 16:16:44.237	2026-06-24 16:16:44.237
23957	\N	コース	kosu	đường chạy (maraton)	45	2026-06-24 16:16:44.239	2026-06-24 16:16:44.239
23958	\N	スタート	sutato	xuất phát	45	2026-06-24 16:16:44.244	2026-06-24 16:16:44.244
23959	－位	－い	-i	-th (ranking)	45	2026-06-24 16:16:44.247	2026-06-24 16:16:44.247
23960	優勝します	ゆうしょうします	yushoshimasu	vộ địch, giải nhất	45	2026-06-24 16:16:44.249	2026-06-24 16:16:44.249
23961	悩み	なやみ	nayami	điều lo nghĩ, trăn trở, phiền muộn	45	2026-06-24 16:16:44.251	2026-06-24 16:16:44.251
23962	目覚まし［時計］	めざまし［どけい］	mezamashi [dokei]	alarm clock	45	2026-06-24 16:16:44.254	2026-06-24 16:16:44.254
23963	目が 覚めます	めが さめます	mega samemasu	mở mắt	45	2026-06-24 16:16:44.256	2026-06-24 16:16:44.256
23964	大学生	だいがくせい	daigakusei	sinh viên đại học	45	2026-06-24 16:16:44.261	2026-06-24 16:16:44.261
23965	回答	かいとう	kaito	câu trả lời, giải thích	45	2026-06-24 16:16:44.264	2026-06-24 16:16:44.264
23966	鳴ります	なります	narimasu	ren lên	45	2026-06-24 16:16:44.266	2026-06-24 16:16:44.266
23967	\N	セットします	settoshimasu	cài đặt	45	2026-06-24 16:16:44.269	2026-06-24 16:16:44.269
23968	\N	それでも	soredemo	tuy nhiên	45	2026-06-24 16:16:44.271	2026-06-24 16:16:44.271
23969	謝ります	あやまります	ayamarimasu	xin lỗi, tạ lỗi	45	2026-06-24 16:16:44.276	2026-06-24 16:16:44.276
23970	あいます［事故に～］	あいます［じこに～］	aimasu [jikoni~]	gặp (tai nạn)	45	2026-06-24 16:16:44.28	2026-06-24 16:16:44.28
23971	用意します	よういします	yoishimasu	chuẩn bị	45	2026-06-24 16:16:44.283	2026-06-24 16:16:44.283
23972	\N	うまく いきます	umaku ikimasu	tốt, thuận lợi	45	2026-06-24 16:16:44.287	2026-06-24 16:16:44.287
23973	贈り物	おくりもの	okurimono	quà tặng (tặng quà)	45	2026-06-24 16:16:44.292	2026-06-24 16:16:44.292
23974	間違い電話	まちがいでんわ	machigaidenwa	điện thoại nhầm	45	2026-06-24 16:16:44.296	2026-06-24 16:16:44.296
23975	係	かかり	kakari	nhân viên, người phụ trách	45	2026-06-24 16:16:44.3	2026-06-24 16:16:44.3
23976	\N	レバー	reba	tay bẻ, tay số, cần gạt	45	2026-06-24 16:16:44.304	2026-06-24 16:16:44.304
23977	［－円］札	［－えん］さつ	[-en] satsu	tờ tiền giấy [-yên]	45	2026-06-24 16:16:44.309	2026-06-24 16:16:44.309
23978	\N	ちゃんと	chanto	đúng , hẳn hoi	45	2026-06-24 16:16:44.314	2026-06-24 16:16:44.314
23979	眠ります	ねむります	nemurimasu	ngủ	45	2026-06-24 16:16:44.319	2026-06-24 16:16:44.319
23980	渡します	わたします	watashimasu	trao	46	2026-06-24 16:16:44.549	2026-06-24 16:16:44.549
23981	帰って 来ます	かえって きます	kaette kimasu	quay về	46	2026-06-24 16:16:44.553	2026-06-24 16:16:44.553
23982	出ます［バスが～］	でます［バスが～］	demasu [basuga~]	[sách] được xuất bản	46	2026-06-24 16:16:44.559	2026-06-24 16:16:44.559
23983	届きます［荷物が～］	とどきます［にもつが～］	todokimasu [nimotsuga~]	[parcels] be delivered	46	2026-06-24 16:16:44.564	2026-06-24 16:16:44.564
23984	入学します［大学に～］	にゅうがくします［だいがくに～］	nyugakushimasu [daigakuni~]	enter [a university]	46	2026-06-24 16:16:44.567	2026-06-24 16:16:44.567
23985	卒業します［大学を～］	そつぎょうします［だいがくを～］	sotsugyoshimasu [daigakuwo~]	graduate [from a university]	46	2026-06-24 16:16:44.57	2026-06-24 16:16:44.57
23986	焼きます	やきます	yakimasu	nướng	46	2026-06-24 16:16:44.574	2026-06-24 16:16:44.574
23987	焼けます［パンが～］	やけます［パンが～］	yakemasu [panga~]	[bread] be baked	46	2026-06-24 16:16:44.579	2026-06-24 16:16:44.579
23988	焼けます［肉が～］	やけます［にくが～］	yakemasu [nikuga~]	[meat] be roasted, be grilled	46	2026-06-24 16:16:44.582	2026-06-24 16:16:44.582
23989	留守	るす	rusu	vắng nhà, đi vắng	46	2026-06-24 16:16:44.586	2026-06-24 16:16:44.586
23990	宅配便	たくはいびん	takuhaibin	dịch vụ trao tận nhà	46	2026-06-24 16:16:44.592	2026-06-24 16:16:44.592
23991	原因	げんいん	gen'in	nguyên nhân	46	2026-06-24 16:16:44.597	2026-06-24 16:16:44.597
23992	此方	こちら	kochira	chỗ (chúng tôi), phía (chúng tôi)	46	2026-06-24 16:16:44.602	2026-06-24 16:16:44.602
23993	～の 所	～の ところ	~no tokoro	quanh vùng ~	46	2026-06-24 16:16:44.606	2026-06-24 16:16:44.606
23994	半年	はんとし	hantoshi	half a year	46	2026-06-24 16:16:44.612	2026-06-24 16:16:44.612
23995	\N	ちょうど	chodo	vừa đúng	46	2026-06-24 16:16:44.616	2026-06-24 16:16:44.616
23996	たった今	たったいま	tattaima	mới hồi nãy	46	2026-06-24 16:16:44.619	2026-06-24 16:16:44.619
23997	今 いいですか。	いま いいですか。	ima iidesuka.	Have you got a moment?	46	2026-06-24 16:16:44.623	2026-06-24 16:16:44.623
23998	\N	ガスサービスセンター	gasusabisusenta	trung tâm dịch vụ gas	46	2026-06-24 16:16:44.629	2026-06-24 16:16:44.629
23999	\N	ガスレンジ	gasurenji	gas range, gas cooker	46	2026-06-24 16:16:44.632	2026-06-24 16:16:44.632
24000	具合	ぐあい	guai	trạng thái, tình trạng	46	2026-06-24 16:16:44.635	2026-06-24 16:16:44.635
24001	申し訳ありません。	もうしわけありません。	moshiwakearimasen.	I'm sorry.	46	2026-06-24 16:16:44.637	2026-06-24 16:16:44.637
24002	どちら様でしょうか。	どちらさまでしょうか。	dochirasamadeshoka.	vị nào đấy ạ ?	46	2026-06-24 16:16:44.643	2026-06-24 16:16:44.643
24003	お待たせしました。	おまたせしました。	omataseshimashita.	xin lỗi đã để quý vị chờ lâu	46	2026-06-24 16:16:44.647	2026-06-24 16:16:44.647
24004	向かいます	むかいます	mukaimasu	hướng về	46	2026-06-24 16:16:44.649	2026-06-24 16:16:44.649
24005	\N	ついて います	tsuite imasu	be lucky	46	2026-06-24 16:16:44.652	2026-06-24 16:16:44.652
24006	床	ゆか	yuka	floor	46	2026-06-24 16:16:44.656	2026-06-24 16:16:44.656
24007	転びます	ころびます	korobimasu	fall down, fall over	46	2026-06-24 16:16:44.662	2026-06-24 16:16:44.662
24008	\N	ベル	beru	ring	46	2026-06-24 16:16:44.665	2026-06-24 16:16:44.665
24009	鳴ります	なります	narimasu	ring	46	2026-06-24 16:16:44.667	2026-06-24 16:16:44.667
24010	慌てて	あわてて	awatete	in a hurry	46	2026-06-24 16:16:44.669	2026-06-24 16:16:44.669
24011	順番に	じゅんばんに	junbanni	in order	46	2026-06-24 16:16:44.67	2026-06-24 16:16:44.67
24012	出来事	できごと	dekigoto	incident	46	2026-06-24 16:16:44.673	2026-06-24 16:16:44.673
24013	注射	ちゅうしゃ	chusha	tiêm	46	2026-06-24 16:16:44.677	2026-06-24 16:16:44.677
24014	食欲	しょくよく	shokuyoku	sự thèm ăn	46	2026-06-24 16:16:44.679	2026-06-24 16:16:44.679
24015	\N	パンフレット	panfuretto	pamphlet	46	2026-06-24 16:16:44.681	2026-06-24 16:16:44.681
24016	\N	ステレオ	sutereo	âm thanh nổi	46	2026-06-24 16:16:44.683	2026-06-24 16:16:44.683
24017	今 いいでしょうか。	いま いいでしょうか。	ima iideshoka.	bây giờ (tôi) có thể làm phiền anh/chị được không?	46	2026-06-24 16:16:44.685	2026-06-24 16:16:44.685
24018	知識	ちしき	chishiki	tri thức, kiến thức	46	2026-06-24 16:16:44.687	2026-06-24 16:16:44.687
24019	宝庫	ほうこ	hoko	kho báu	46	2026-06-24 16:16:44.691	2026-06-24 16:16:44.691
24020	手に入ります［情報が～］	てにはいります［じょうほうが～］	tenihairimasu [johoga~]	có,được [thông tin]	46	2026-06-24 16:16:44.695	2026-06-24 16:16:44.695
24021	\N	システム	shisutemu	hệ thống	46	2026-06-24 16:16:44.697	2026-06-24 16:16:44.697
24022	例えば	たとえば	tatoeba	for example	46	2026-06-24 16:16:44.698	2026-06-24 16:16:44.698
24023	\N	キーワード	kiiwado	từ khóa	46	2026-06-24 16:16:44.7	2026-06-24 16:16:44.7
24024	一部分	いちぶぶん	ichibubun	một bộ phận	46	2026-06-24 16:16:44.702	2026-06-24 16:16:44.702
24025	入力します	にゅうりょくします	nyuryokushimasu	nhập vào	46	2026-06-24 16:16:44.704	2026-06-24 16:16:44.704
24026	秒	びょう	byo	giây	46	2026-06-24 16:16:44.707	2026-06-24 16:16:44.707
24027	出ます［本が～］	でます［ほんが～］	demasu [honga~]	[sách] được xuất bản	46	2026-06-24 16:16:44.71	2026-06-24 16:16:44.71
24028	吹きます［風が～］	ふきます［かぜが～］	fukimasu [kazega~]	[wind] blow	47	2026-06-24 16:16:44.842	2026-06-24 16:16:44.842
24029	燃えます［ごみが～］	もえます［ごみが～］	moemasu [gomiga~]	[rubbish] burn	47	2026-06-24 16:16:44.844	2026-06-24 16:16:44.844
24030	亡くなります	なくなります	nakunarimasu	pass away (euphemistic expression for しにます)	47	2026-06-24 16:16:44.846	2026-06-24 16:16:44.846
24031	集まります［人が～］	あつまります［ひとが～］	atsumarimasu [hitoga~]	tập hợp, tập trung [ người ~]	47	2026-06-24 16:16:44.847	2026-06-24 16:16:44.847
24032	別れます［人が～］	わかれます［ひとが～］	wakaremasu [hitoga~]	chia tay [ người ~]	47	2026-06-24 16:16:44.849	2026-06-24 16:16:44.849
24033	します［音／声が～］	します［おと／こえが～］	shimasu [oto/koega~]	có [~ mùi ]	47	2026-06-24 16:16:44.85	2026-06-24 16:16:44.85
24034	します［味が～］	します［あじが～］	shimasu [ajiga~]	có [~ mùi ]	47	2026-06-24 16:16:44.851	2026-06-24 16:16:44.851
24035	\N	します［においが～］	shimasu [nioiga~]	có [~ mùi ]	47	2026-06-24 16:16:44.853	2026-06-24 16:16:44.853
24036	厳しい	きびしい	kibishii	strict, hard	47	2026-06-24 16:16:44.854	2026-06-24 16:16:44.854
24037	\N	ひどい	hidoi	tồi tệ, xấu	47	2026-06-24 16:16:44.858	2026-06-24 16:16:44.858
24038	怖い	こわい	kowai	sợ, khiếp	47	2026-06-24 16:16:44.861	2026-06-24 16:16:44.861
24039	実験	じっけん	jikken	thí nghiệm, thực nghiệm	47	2026-06-24 16:16:44.863	2026-06-24 16:16:44.863
24040	\N	データ	deta	data	47	2026-06-24 16:16:44.864	2026-06-24 16:16:44.864
24041	人口	じんこう	jinko	dân số	47	2026-06-24 16:16:44.866	2026-06-24 16:16:44.866
24042	\N	におい	nioi	mùi	47	2026-06-24 16:16:44.868	2026-06-24 16:16:44.868
24043	科学	かがく	kagaku	khoa học	47	2026-06-24 16:16:44.869	2026-06-24 16:16:44.869
24044	医学	いがく	igaku	y học, ngành y	47	2026-06-24 16:16:44.871	2026-06-24 16:16:44.871
24045	文学	ぶんがく	bungaku	văn học	47	2026-06-24 16:16:44.874	2026-06-24 16:16:44.874
24046	\N	パトカー	patoka	xe ô-tô cảnh sát	47	2026-06-24 16:16:44.876	2026-06-24 16:16:44.876
24047	救急車	きゅうきゅうしゃ	kyukyusha	xe cứu thương	47	2026-06-24 16:16:44.878	2026-06-24 16:16:44.878
24048	賛成	さんせい	sansei	tán thành, đồng ý	47	2026-06-24 16:16:44.88	2026-06-24 16:16:44.88
24049	反対	はんたい	hantai	phản đối	47	2026-06-24 16:16:44.881	2026-06-24 16:16:44.881
24050	大統領	だいとうりょう	daitoryo	president	47	2026-06-24 16:16:44.883	2026-06-24 16:16:44.883
24051	\N	～に よると	~ni yoruto	theo ~ thì, căn cứ vào ~ thì	47	2026-06-24 16:16:44.884	2026-06-24 16:16:44.884
24052	婚約します	こんやくします	kon'yakushimasu	đính hôn	47	2026-06-24 16:16:44.886	2026-06-24 16:16:44.886
24053	\N	どうも	domo	có vẽ như là, có lẽ là	47	2026-06-24 16:16:44.89	2026-06-24 16:16:44.89
24054	恋人	こいびと	koibito	người yêu	47	2026-06-24 16:16:44.893	2026-06-24 16:16:44.893
24055	相手	あいて	aite	đối tượng, đối tác, nửa còn lại	47	2026-06-24 16:16:44.895	2026-06-24 16:16:44.895
24056	知り合います	しりあいます	shiriaimasu	quen biết	47	2026-06-24 16:16:44.897	2026-06-24 16:16:44.897
24057	化粧	けしょう	kesho	sự trang điểm (～をします：trang điểm)	47	2026-06-24 16:16:44.899	2026-06-24 16:16:44.899
24058	世話を します	せわを します	sewawo shimasu	take care of	47	2026-06-24 16:16:44.901	2026-06-24 16:16:44.901
24059	女性	じょせい	josei	phái nữ	47	2026-06-24 16:16:44.903	2026-06-24 16:16:44.903
24060	男性	だんせい	dansei	phái nam	47	2026-06-24 16:16:44.905	2026-06-24 16:16:44.905
24061	長生き	ながいき	nagaiki	long life (～します : live long)	47	2026-06-24 16:16:44.909	2026-06-24 16:16:44.909
24062	理由	りゆう	riyu	reason	47	2026-06-24 16:16:44.911	2026-06-24 16:16:44.911
24063	関係	かんけい	kankei	relationship	47	2026-06-24 16:16:44.913	2026-06-24 16:16:44.913
24064	さします［傘を～］	さします［かさを～］	sashimasu [kasawo~]	dương che [ dù ]	47	2026-06-24 16:16:44.914	2026-06-24 16:16:44.914
24065	天気予報	てんきよほう	tenkeyoho	dự báo thời tiết	47	2026-06-24 16:16:44.916	2026-06-24 16:16:44.916
24066	発表	はっぴょう	happyo	công bố, thuyết trình	47	2026-06-24 16:16:44.917	2026-06-24 16:16:44.917
24067	バリ［島］	バリ［とう］	bari [tou]	Bali [island] (in Indonesia)	47	2026-06-24 16:16:44.919	2026-06-24 16:16:44.919
24068	\N	イラン	iran	nước IRAN	47	2026-06-24 16:16:44.921	2026-06-24 16:16:44.921
24069	\N	カリフォルニア	kariforunia	California (in U.S.A.)	47	2026-06-24 16:16:44.925	2026-06-24 16:16:44.925
24070	\N	グアム	guamu	Guam	47	2026-06-24 16:16:44.928	2026-06-24 16:16:44.928
24071	平均寿命	へいきんじゅみょう	heikinjumyo	tuổi thọ bình quân	47	2026-06-24 16:16:44.93	2026-06-24 16:16:44.93
24072	比べます［男性と～］	くらべます［だんせいと～］	kurabemasu [danseito~]	so sánh [với nam giới ~]	47	2026-06-24 16:16:44.932	2026-06-24 16:16:44.932
24073	博士	はかせ	hakase	tiến sĩ	47	2026-06-24 16:16:44.934	2026-06-24 16:16:44.934
24074	脳	のう	no	não	47	2026-06-24 16:16:44.937	2026-06-24 16:16:44.937
24075	\N	ホルモン	horumon	hormone	47	2026-06-24 16:16:44.942	2026-06-24 16:16:44.942
24076	化粧品	けしょうひん	keshohin	mỹ phẩm	47	2026-06-24 16:16:44.944	2026-06-24 16:16:44.944
24077	調べ	しらべ	shirabe	cuộc điều tra, nghiên cứu	47	2026-06-24 16:16:44.946	2026-06-24 16:16:44.946
24078	降ろします、下ろします	おろします	oroshimasu	cho xuống, hạ xuống	48	2026-06-24 16:16:45.035	2026-06-24 16:16:45.035
24079	届ける	とどけます	todokemasu	gửi đến, chuyển đến	48	2026-06-24 16:16:45.037	2026-06-24 16:16:45.037
24080	世話を します	せわを します	sewawo shimasu	chăm sóc	48	2026-06-24 16:16:45.039	2026-06-24 16:16:45.039
24081	録音します	ろくおんします	rokuonshimasu	record	48	2026-06-24 16:16:45.042	2026-06-24 16:16:45.042
24082	嫌［な］	いや［な］	iya [na]	không thích, ngán	48	2026-06-24 16:16:45.044	2026-06-24 16:16:45.044
24083	塾	じゅく	juku	cở sở học thêm	48	2026-06-24 16:16:45.045	2026-06-24 16:16:45.045
24084	生徒	せいと	seito	học trò, học sinh	48	2026-06-24 16:16:45.047	2026-06-24 16:16:45.047
24085	\N	ファイル	fuairu	file	48	2026-06-24 16:16:45.048	2026-06-24 16:16:45.048
24086	自由に	じゆうに	jiyuni	một cách tự do	48	2026-06-24 16:16:45.049	2026-06-24 16:16:45.049
24087	～間	～かん	~kan	trong ~(nói về thời lượng)	48	2026-06-24 16:16:45.051	2026-06-24 16:16:45.051
24088	\N	いい ことですね。	ii kotodesune.	hay nhỉ/ được đấy nhỉ	48	2026-06-24 16:16:45.052	2026-06-24 16:16:45.052
24089	お忙しいですか。	おいそがしいですか。	oisogashiidesuka.	anh/chị đang bận phải không?	48	2026-06-24 16:16:45.053	2026-06-24 16:16:45.053
24090	営業	えいぎょう	eigyo	kinh doanh, bán hàng	48	2026-06-24 16:16:45.055	2026-06-24 16:16:45.055
24091	\N	それまでに	soremadeni	đến trước lúc đó	48	2026-06-24 16:16:45.059	2026-06-24 16:16:45.059
24092	\N	かまいません。	kamaimasen.	được rồi,không sao, không có gì đâu	48	2026-06-24 16:16:45.061	2026-06-24 16:16:45.061
24093	楽しみます	たのしみます	tanoshimimasu	vui thích	48	2026-06-24 16:16:45.063	2026-06-24 16:16:45.063
24094	親	おや	oya	parent	48	2026-06-24 16:16:45.064	2026-06-24 16:16:45.064
24095	小学生	しょうがくせい	shogakusei	pupil, elementary schoolchild	48	2026-06-24 16:16:45.066	2026-06-24 16:16:45.066
24096	\N	－パーセント	-pasento	－ percent	48	2026-06-24 16:16:45.067	2026-06-24 16:16:45.067
24097	その 次	その つぎ	sono tsugi	next	48	2026-06-24 16:16:45.069	2026-06-24 16:16:45.069
24098	習字	しゅうじ	shuji	calligraphy	48	2026-06-24 16:16:45.07	2026-06-24 16:16:45.07
24099	普通の	ふつうの	futsuno	normal, usual	48	2026-06-24 16:16:45.073	2026-06-24 16:16:45.073
24100	厳しい	きびしい	kibishii	nghiêm khắc, nghiêm ngặt	48	2026-06-24 16:16:45.077	2026-06-24 16:16:45.077
24101	\N	スケジュール	sukejuru	thời khóa biểu, lịch trình	48	2026-06-24 16:16:45.079	2026-06-24 16:16:45.079
24102	者	もの	mono	người (là người thân hoặc cấp dưới)	48	2026-06-24 16:16:45.08	2026-06-24 16:16:45.08
24103	入管	にゅうかん	nyukan	sở nhập cảnh	48	2026-06-24 16:16:45.082	2026-06-24 16:16:45.082
24104	再入国ビザ	さいにゅうこくビザ	sainyukokubiza	visa tái nhập cảnh	48	2026-06-24 16:16:45.083	2026-06-24 16:16:45.083
24105	久しぶり	ひさしぶり	hisashiburi	sau khoảng thời gian dài	48	2026-06-24 16:16:45.085	2026-06-24 16:16:45.085
24106	\N	もともと	motomoto	vốn dĩ	48	2026-06-24 16:16:45.086	2026-06-24 16:16:45.086
24107	－世紀	－せいき	-seiki	-th century	48	2026-06-24 16:16:45.089	2026-06-24 16:16:45.089
24108	代わりを します	かわりを します	kawariwo shimasu	thay thế	48	2026-06-24 16:16:45.093	2026-06-24 16:16:45.093
24109	\N	スピード	supiido	tốc độ	48	2026-06-24 16:16:45.095	2026-06-24 16:16:45.095
24110	競走します	きょうそうします	kyososhimasu	chạy đua, chảy thi	48	2026-06-24 16:16:45.096	2026-06-24 16:16:45.096
24111	\N	サーカス	sakasu	xiếc	48	2026-06-24 16:16:45.098	2026-06-24 16:16:45.098
24112	芸	げい	gei	trò diễn, tiết mục, tài năng	48	2026-06-24 16:16:45.1	2026-06-24 16:16:45.1
24113	美しい	うつくしい	utsukushii	đẹp	48	2026-06-24 16:16:45.101	2026-06-24 16:16:45.101
24114	姿	すがた	sugata	dáng hình, tư thế	48	2026-06-24 16:16:45.103	2026-06-24 16:16:45.103
24115	心	こころ	kokoro	tâm hồn ,trái tim	48	2026-06-24 16:16:45.106	2026-06-24 16:16:45.106
24116	\N	とらえます	toraemasu	giành được	48	2026-06-24 16:16:45.11	2026-06-24 16:16:45.11
24117	\N	～に よって	~ni yotte	for ～	48	2026-06-24 16:16:45.112	2026-06-24 16:16:45.112
24118	利用します	りようします	riyoshimasu	use	49	2026-06-24 16:16:45.293	2026-06-24 16:16:45.293
24119	勤めます［会社に～］	つとめます［かいしゃに～］	tsutomemasu [kaishani~]	làm việc [ công ty ~]	49	2026-06-24 16:16:45.296	2026-06-24 16:16:45.296
24120	掛けます［いすに～］	かけます［いすに～］	kakemasu [isuni~]	ngồi xuống [ ghế]	49	2026-06-24 16:16:45.299	2026-06-24 16:16:45.299
24121	過ごします	すごします	sugoshimasu	trải qua (thời gian)	49	2026-06-24 16:16:45.302	2026-06-24 16:16:45.302
24122	\N	いらっしゃいます	irasshaimasu	ở, có, đi, đến （tôn kính ngữ của います、いきます và きます）	49	2026-06-24 16:16:45.307	2026-06-24 16:16:45.307
24123	召し上がります	めしあがります	meshiagarimasu	ăn, uống (tôn kính ngữ của たべます và のみます)	49	2026-06-24 16:16:45.312	2026-06-24 16:16:45.312
24124	\N	おっしゃいます	osshaimasu	nói (tôn kính ngữ của いいます)	49	2026-06-24 16:16:45.314	2026-06-24 16:16:45.314
24125	\N	なさいます	nasaimasu	làm (tôn kính ngữ của します)	49	2026-06-24 16:16:45.316	2026-06-24 16:16:45.316
24126	ご覧に なります	ごらんに なります	goranni narimasu	xem, nhìn (tôn kính ngữ của みます)	49	2026-06-24 16:16:45.318	2026-06-24 16:16:45.318
24127	ご存じです	ごぞんじです	gozonjidesu	know (respectful equivalent of しっています)	49	2026-06-24 16:16:45.32	2026-06-24 16:16:45.32
24128	\N	あいさつ	aisatsu	lời chào hỏi (~をします:chào hỏi)	49	2026-06-24 16:16:45.323	2026-06-24 16:16:45.323
24129	旅館	りょかん	ryokan	nhà trọ, nhà nghỉ	49	2026-06-24 16:16:45.326	2026-06-24 16:16:45.326
24130	バス停	バスてい	basutei	trạm dừng xe BUS	49	2026-06-24 16:16:45.327	2026-06-24 16:16:45.327
24131	奥様	おくさま	okusama	(someone else's) wife (respectful equivalent of おくさん)	49	2026-06-24 16:16:45.329	2026-06-24 16:16:45.329
24132	～様	～さま	~sama	ngài ~(dạng tôn kính của ~さん)	49	2026-06-24 16:16:45.33	2026-06-24 16:16:45.33
24133	\N	たまに	tamani	đôi khi, thỉnh thoảng	49	2026-06-24 16:16:45.332	2026-06-24 16:16:45.332
24134	\N	どなたでも	donatademo	anybody (respectful equivalent of だれでも)	49	2026-06-24 16:16:45.334	2026-06-24 16:16:45.334
24135	\N	～と いいます	~to iimasu	(one's name) is ～	49	2026-06-24 16:16:45.335	2026-06-24 16:16:45.335
24136	－年－組	－ねん－くみ	-nen-kumi	class － of -th grade	49	2026-06-24 16:16:45.337	2026-06-24 16:16:45.337
24137	出します［熱を～］	だします［ねつを～］	dashimasu [netsuwo~]	run [a fever]	49	2026-06-24 16:16:45.341	2026-06-24 16:16:45.341
24138	よろしく お伝え ください。	よろしく おつたえ ください。	yoroshiku otsutae kudasai.	cho tôi gửi lời hỏi thăm	49	2026-06-24 16:16:45.343	2026-06-24 16:16:45.343
24139	失礼いたします。	しつれいいたします。	shitsureiitashimasu.	xin chào (dạng khiêm tốn củaしつれいします)	49	2026-06-24 16:16:45.345	2026-06-24 16:16:45.345
24140	ひまわり小学校	ひまわりしょうがっこう	himawarishogakko	fictitious elementary school	49	2026-06-24 16:16:45.347	2026-06-24 16:16:45.347
24141	経歴	けいれき	keireki	background	49	2026-06-24 16:16:45.348	2026-06-24 16:16:45.348
24142	医学部	いがくぶ	igakubu	the medical department	49	2026-06-24 16:16:45.352	2026-06-24 16:16:45.352
24143	目指します	めざします	mezashimasu	aim for	49	2026-06-24 16:16:45.354	2026-06-24 16:16:45.354
24144	進みます	すすみます	susumimasu	go on (to graduate school)	49	2026-06-24 16:16:45.358	2026-06-24 16:16:45.358
24145	iPS細胞	iPSさいぼう	iPSsaibo	induced pluripotent stem cell	49	2026-06-24 16:16:45.361	2026-06-24 16:16:45.361
24146	開発します	かいはつします	kaihatsushimasu	develop, create	49	2026-06-24 16:16:45.366	2026-06-24 16:16:45.366
24147	\N	マウス	mausu	mouse	49	2026-06-24 16:16:45.368	2026-06-24 16:16:45.368
24148	\N	ヒト	hito	human	49	2026-06-24 16:16:45.37	2026-06-24 16:16:45.37
24149	授賞します	じゅしょうします	jushoshimasu	được giải thưởng	49	2026-06-24 16:16:45.374	2026-06-24 16:16:45.374
24150	講演会	こうえんかい	koenkai	lecture meeting	49	2026-06-24 16:16:45.38	2026-06-24 16:16:45.38
24151	山中伸弥	やまなかしんや	yamanakashin'ya	Japanese medical scientist (1962-)	49	2026-06-24 16:16:45.384	2026-06-24 16:16:45.384
24152	ノーベル賞	ノーベルしょう	noberusho	Nobel Prize	49	2026-06-24 16:16:45.386	2026-06-24 16:16:45.386
24153	休みます	やすみます	yasumimasu	nghỉ ngơi	49	2026-06-24 16:16:45.388	2026-06-24 16:16:45.388
24154	寄ります［銀行に～］	よります［ぎんこうに～］	yorimasu [ginkoni~]	ghé vào (ngân hàng )	49	2026-06-24 16:16:45.392	2026-06-24 16:16:45.392
24155	灰皿	はいざら	haizara	gạt tàn thuốc	49	2026-06-24 16:16:45.394	2026-06-24 16:16:45.394
24156	会場	かいじょう	kaijo	hội trường	49	2026-06-24 16:16:45.396	2026-06-24 16:16:45.396
24157	貿易	ぼうえき	boeki	thương mại, mậu dịch	49	2026-06-24 16:16:45.398	2026-06-24 16:16:45.398
24158	帰りに	かえりに	kaerini	trên đường về, ở lượt về	49	2026-06-24 16:16:45.4	2026-06-24 16:16:45.4
24159	\N	ちっとも	chittomo	một chút cũng không (dùng với thể phủ định)	49	2026-06-24 16:16:45.404	2026-06-24 16:16:45.404
24160	遠慮なく	えんりょなく	enryonaku	xin đừng ngại	49	2026-06-24 16:16:45.411	2026-06-24 16:16:45.411
24161	\N	では	dewa	vậy thì (dạng lịch sự của じゃ)	49	2026-06-24 16:16:45.415	2026-06-24 16:16:45.415
24162	講師	こうし	koshi	giảng viên, báo cáo viên	49	2026-06-24 16:16:45.418	2026-06-24 16:16:45.418
24163	多くの ～	おおくの ～	okuno ~	nhiều ~	49	2026-06-24 16:16:45.42	2026-06-24 16:16:45.42
24164	作品	さくひん	sakuhin	tác phẩm	49	2026-06-24 16:16:45.422	2026-06-24 16:16:45.422
24165	世界的に	せかいてきに	sekaitekini	mang tính chất thế giới,toàn cầu	49	2026-06-24 16:16:45.427	2026-06-24 16:16:45.427
24166	作家	さっか	sakka	tác giả	49	2026-06-24 16:16:45.43	2026-06-24 16:16:45.43
24167	\N	～で いらっしゃいます	~de irasshaimasu	be (respectful equivalent of です)	49	2026-06-24 16:16:45.432	2026-06-24 16:16:45.432
24168	長男	ちょうなん	chonan	trưởng nam	49	2026-06-24 16:16:45.435	2026-06-24 16:16:45.435
24169	障害	しょうがい	shogai	khuyết tật, khiếm khuyết	49	2026-06-24 16:16:45.439	2026-06-24 16:16:45.439
24170	お持ちです	おもちです	omochidesu	có (cách nói tôn kính ngữ của もっています)	49	2026-06-24 16:16:45.445	2026-06-24 16:16:45.445
24171	作曲	さっきょく	sakkyoku	viết( sáng tác) nhạc, bài hát	49	2026-06-24 16:16:45.447	2026-06-24 16:16:45.447
24172	活動	かつどう	katsudo	hoạt động	49	2026-06-24 16:16:45.449	2026-06-24 16:16:45.449
24173	\N	それでは	soredewa	thế thì ( chỉ sự bắt đầu hay kết thúc )	49	2026-06-24 16:16:45.45	2026-06-24 16:16:45.45
24174	大江 健三郎	おおえ けんざぶろう	oe kenzaburo	Japanese novelist (1935- )	49	2026-06-24 16:16:45.452	2026-06-24 16:16:45.452
24175	東京大学	とうきょうだいがく	tokyodaigaku	đại học Tokyo	49	2026-06-24 16:16:45.454	2026-06-24 16:16:45.454
24176	ノーベル文学賞	ノーベルぶんがくしょう	noberu bungakusho	giải thưởng Nobel văn học	49	2026-06-24 16:16:45.459	2026-06-24 16:16:45.459
24177	参ります	まいります	mairimasu	đi, đến (khiêm nhường ngữ của いきます và きます)	50	2026-06-24 16:16:45.723	2026-06-24 16:16:45.723
24178	\N	おります	orimasu	có (dạng khiêm tốn của います)	50	2026-06-24 16:16:45.729	2026-06-24 16:16:45.729
24179	\N	いただきます	itadakimasu	ăn,uống,nhận (dạng khiêm tốn của たべます)	50	2026-06-24 16:16:45.734	2026-06-24 16:16:45.734
24180	申します	もうします	moshimasu	nói (dạng khiêm tốn của いいます)	50	2026-06-24 16:16:45.74	2026-06-24 16:16:45.74
24181	\N	いたします	itashimasu	làm(dạng khiêm tốn của します)	50	2026-06-24 16:16:45.747	2026-06-24 16:16:45.747
24182	拝見します	はいけんします	haikenshimasu	xem (dạng khiêm tốn của もます)	50	2026-06-24 16:16:45.753	2026-06-24 16:16:45.753
24183	存じます	ぞんじます	zonjimasu	biết(dạng khiêm tốn của しります)	50	2026-06-24 16:16:45.76	2026-06-24 16:16:45.76
24184	伺います	うかがいます	ukagaimasu	hỏi,nghe,hỏi thăm (dạng khiêm tốn của ききますvà いきます)	50	2026-06-24 16:16:45.766	2026-06-24 16:16:45.766
24185	お目に かかります	おめに かかります	omeni kakarimasu	gặp (dạng khiêm tốn của あいます )	50	2026-06-24 16:16:45.772	2026-06-24 16:16:45.772
24186	\N	いれます［コーヒーを～］	iremasu [kohiiwo~]	make [coffee]	50	2026-06-24 16:16:45.778	2026-06-24 16:16:45.778
24187	用意します	よういします	yoishimasu	prepare	50	2026-06-24 16:16:45.784	2026-06-24 16:16:45.784
24188	私	わたくし	watakushi	tôi (dạng khiêm tốn của わたし)	50	2026-06-24 16:16:45.79	2026-06-24 16:16:45.79
24189	\N	ガイド	gaido	hướng dẫn viên	50	2026-06-24 16:16:45.796	2026-06-24 16:16:45.796
24190	\N	メールアドレス	meruadoresu	e-mail address	50	2026-06-24 16:16:45.802	2026-06-24 16:16:45.802
24191	\N	スケジュール	sukejuru	schedule	50	2026-06-24 16:16:45.808	2026-06-24 16:16:45.808
24192	さ来週	さらいしゅう	saraishu	tuần tới nữa	50	2026-06-24 16:16:45.814	2026-06-24 16:16:45.814
24193	さ来月	さらいげつ	saraigetsu	tháng tới nữa	50	2026-06-24 16:16:45.819	2026-06-24 16:16:45.819
24194	さ来年	さらいねん	sarainen	năm tới nữa	50	2026-06-24 16:16:45.826	2026-06-24 16:16:45.826
24195	初めに	はじめに	hajimeni	first	50	2026-06-24 16:16:45.832	2026-06-24 16:16:45.832
24196	江戸東京博物館	えどとうきょうはくぶつかん	edotokyohakubutsukan	Edo-Tokyo Museum	50	2026-06-24 16:16:45.837	2026-06-24 16:16:45.837
24197	緊張します	きんちょうします	kinchoshimasu	căng thẳng, hồi hộp	50	2026-06-24 16:16:45.844	2026-06-24 16:16:45.844
24198	賞金	しょうきん	shokin	tiền thưởng	50	2026-06-24 16:16:45.849	2026-06-24 16:16:45.849
24199	\N	きりん	kirin	hươu cao cổ	50	2026-06-24 16:16:45.855	2026-06-24 16:16:45.855
24200	\N	ころ	koro	lần, ngày	50	2026-06-24 16:16:45.862	2026-06-24 16:16:45.862
24201	かないます［夢が～］	かないます［ゆめが～］	kanaimasu [yumega~]	(giấc mơ)thành hiện thực,linh ứng	50	2026-06-24 16:16:45.868	2026-06-24 16:16:45.868
24202	応援します	おうえんします	oenshimasu	support	50	2026-06-24 16:16:45.875	2026-06-24 16:16:45.875
24203	心から	こころから	kokorokara	từ đáy lòng, thật lòng	50	2026-06-24 16:16:45.881	2026-06-24 16:16:45.881
24204	感謝します	かんしゃします	kanshashimasu	cảm tạ, biết ơn	50	2026-06-24 16:16:45.886	2026-06-24 16:16:45.886
24205	お礼	おれい	orei	gratitude, thanks	50	2026-06-24 16:16:45.893	2026-06-24 16:16:45.893
24206	お元気で いらっしゃいますか。	おげんきで いらっしゃいますか。	ogenkide irasshaimasuka.	anh/chị có khỏe không?(cách nói tôn kính của おげんきですか。)	50	2026-06-24 16:16:45.898	2026-06-24 16:16:45.898
24207	迷惑を かけます	めいわくを かけます	meiwakuwo kakemasu	làm phiền	50	2026-06-24 16:16:45.903	2026-06-24 16:16:45.903
24208	生かします	いかします	ikashimasu	tận dụng, phát huy	50	2026-06-24 16:16:45.909	2026-06-24 16:16:45.909
24209	\N	ミュンヘン	myunhen	Munchen (thành phố lớn của Đức)	50	2026-06-24 16:16:45.913	2026-06-24 16:16:45.913
24210	\N	ございます	gozaimasu	có (dạng lịch sự của あります)	50	2026-06-24 16:16:45.916	2026-06-24 16:16:45.916
24211	\N	～で ございます	~de gozaimasu	là (dạng lịch sự của ~です)	50	2026-06-24 16:16:45.92	2026-06-24 16:16:45.92
24212	お宅	おたく	otaku	nhà (của người khác)	50	2026-06-24 16:16:45.924	2026-06-24 16:16:45.924
24213	郊外	こうがい	kogai	ngoại ô	50	2026-06-24 16:16:45.927	2026-06-24 16:16:45.927
24214	\N	アルバム	arubamu	tập ảnh,Album	50	2026-06-24 16:16:45.93	2026-06-24 16:16:45.93
24215	半年	はんとし	hantoshi	nửa năm	50	2026-06-24 16:16:45.932	2026-06-24 16:16:45.932
24216	最初に	さいしょに	saishoni	trước hết, đầu tiên	50	2026-06-24 16:16:45.934	2026-06-24 16:16:45.934
24217	最後に	さいごに	saigoni	cuối cùng	50	2026-06-24 16:16:45.937	2026-06-24 16:16:45.937
24218	ただ今	ただいま	tadaima	tôi đã về !	50	2026-06-24 16:16:45.94	2026-06-24 16:16:45.94
24219	放送します	ほうそうします	hososhimasu	phát thanh,phát hình	50	2026-06-24 16:16:45.942	2026-06-24 16:16:45.942
24220	撮ります［ビデオに～］	とります［ビデオに～］	torimasu [bideoni~]	thu , quay	50	2026-06-24 16:16:45.945	2026-06-24 16:16:45.945
24221	自然	しぜん	shizen	thiên nhiên	50	2026-06-24 16:16:45.947	2026-06-24 16:16:45.947
24222	象	ぞう	zo	con voi	50	2026-06-24 16:16:45.949	2026-06-24 16:16:45.949
24223	\N	ひとこと よろしいでしょうか。	hitokoto yoroshiideshoka.	cho tôi nói một lời	50	2026-06-24 16:16:45.951	2026-06-24 16:16:45.951
24224	協力します	きょうりょくします	kyoryokushimasu	hiệp lực, cộng tác	50	2026-06-24 16:16:45.954	2026-06-24 16:16:45.954
24225	拝啓	はいけい	haikei	kính gửi, thưa ~( viết ngay đầu thư)	50	2026-06-24 16:16:45.957	2026-06-24 16:16:45.957
24226	美しい	うつくしい	utsukushii	đẹp	50	2026-06-24 16:16:45.959	2026-06-24 16:16:45.959
24227	［お］城	［お］しろ	[o] shiro	thành trì	50	2026-06-24 16:16:45.96	2026-06-24 16:16:45.96
24228	敬具	けいぐ	keigu	kính thư( viết cuối thư)	50	2026-06-24 16:16:45.963	2026-06-24 16:16:45.963
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
8818a29e-035d-4be8-a54f-65722f2825a6	cd3dd7313e8ab8f8663d931e3f9e416b0ad60b14923588fb021de9b8ea14afaf	2026-06-24 06:08:30.30885+00	20260624060830_init_postgres	\N	\N	2026-06-24 06:08:30.268511+00	1
8e7b94f2-4e05-47b7-b717-964e743e79e3	629ab41896a08196e9afba974f25a3f81be09be3d7efc4fb3a35363441151f52	2026-06-24 06:22:37.736482+00	20260624062237_add_kanji_look_and_learn	\N	\N	2026-06-24 06:22:37.662147+00	1
f5c974f1-88a2-4cb0-9bbb-f2671cfd19dd	2143e458a3b09f1e4c0ef836eb5f6c6e8dc2a1eaaa92bd2cce56c41620216647	2026-06-24 07:34:46.672146+00	20260624073446_add_user_auth	\N	\N	2026-06-24 07:34:46.647096+00	1
3a43eae0-0025-449d-b44d-67933af7ce60	81be8a5dc96acedc0b7f0271210015389e6b4183671c3d37ae0ea8f3abe8eb0b	2026-06-24 07:51:41.717911+00	20260624120000_phase2_progress_exam	\N	\N	2026-06-24 07:51:41.593427+00	1
\.


--
-- Name: ExamResult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ExamResult_id_seq"', 8, true);


--
-- Name: Example_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Example_id_seq"', 10540, true);


--
-- Name: Exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Exercise_id_seq"', 9000, true);


--
-- Name: Grammar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Grammar_id_seq"', 3300, true);


--
-- Name: KanjiEntry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."KanjiEntry_id_seq"', 512, true);


--
-- Name: KanjiLesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."KanjiLesson_id_seq"', 32, true);


--
-- Name: KanjiVocab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."KanjiVocab_id_seq"', 2626, true);


--
-- Name: Lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Lesson_id_seq"', 450, true);


--
-- Name: ListeningLog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ListeningLog_id_seq"', 1, false);


--
-- Name: ReviewLog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ReviewLog_id_seq"', 1, false);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."User_id_seq"', 10, true);


--
-- Name: Vocabulary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Vocabulary_id_seq"', 24228, true);


--
-- Name: ExamResult ExamResult_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ExamResult"
    ADD CONSTRAINT "ExamResult_pkey" PRIMARY KEY (id);


--
-- Name: Example Example_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Example"
    ADD CONSTRAINT "Example_pkey" PRIMARY KEY (id);


--
-- Name: Exercise Exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Exercise"
    ADD CONSTRAINT "Exercise_pkey" PRIMARY KEY (id);


--
-- Name: Grammar Grammar_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Grammar"
    ADD CONSTRAINT "Grammar_pkey" PRIMARY KEY (id);


--
-- Name: KanjiEntry KanjiEntry_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."KanjiEntry"
    ADD CONSTRAINT "KanjiEntry_pkey" PRIMARY KEY (id);


--
-- Name: KanjiLesson KanjiLesson_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."KanjiLesson"
    ADD CONSTRAINT "KanjiLesson_pkey" PRIMARY KEY (id);


--
-- Name: KanjiVocab KanjiVocab_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."KanjiVocab"
    ADD CONSTRAINT "KanjiVocab_pkey" PRIMARY KEY (id);


--
-- Name: Lesson Lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_pkey" PRIMARY KEY (id);


--
-- Name: ListeningLog ListeningLog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningLog"
    ADD CONSTRAINT "ListeningLog_pkey" PRIMARY KEY (id);


--
-- Name: ReviewLog ReviewLog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReviewLog"
    ADD CONSTRAINT "ReviewLog_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Vocabulary Vocabulary_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Vocabulary"
    ADD CONSTRAINT "Vocabulary_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: ExamResult_level_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ExamResult_level_idx" ON public."ExamResult" USING btree (level);


--
-- Name: ExamResult_userId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ExamResult_userId_idx" ON public."ExamResult" USING btree ("userId");


--
-- Name: KanjiEntry_character_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "KanjiEntry_character_idx" ON public."KanjiEntry" USING btree ("character");


--
-- Name: KanjiEntry_lessonId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "KanjiEntry_lessonId_idx" ON public."KanjiEntry" USING btree ("lessonId");


--
-- Name: KanjiLesson_lessonNumber_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "KanjiLesson_lessonNumber_idx" ON public."KanjiLesson" USING btree ("lessonNumber");


--
-- Name: KanjiLesson_lessonNumber_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "KanjiLesson_lessonNumber_key" ON public."KanjiLesson" USING btree ("lessonNumber");


--
-- Name: KanjiVocab_kanjiEntryId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "KanjiVocab_kanjiEntryId_idx" ON public."KanjiVocab" USING btree ("kanjiEntryId");


--
-- Name: Lesson_lessonNumber_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Lesson_lessonNumber_key" ON public."Lesson" USING btree ("lessonNumber");


--
-- Name: ListeningLog_userId_date_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "ListeningLog_userId_date_key" ON public."ListeningLog" USING btree ("userId", date);


--
-- Name: ListeningLog_userId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ListeningLog_userId_idx" ON public."ListeningLog" USING btree ("userId");


--
-- Name: ReviewLog_userId_kana_lessonNumber_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "ReviewLog_userId_kana_lessonNumber_key" ON public."ReviewLog" USING btree ("userId", kana, "lessonNumber");


--
-- Name: ReviewLog_userId_mastered_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ReviewLog_userId_mastered_idx" ON public."ReviewLog" USING btree ("userId", mastered);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: User_role_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "User_role_idx" ON public."User" USING btree (role);


--
-- Name: ExamResult ExamResult_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ExamResult"
    ADD CONSTRAINT "ExamResult_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Example Example_grammarId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Example"
    ADD CONSTRAINT "Example_grammarId_fkey" FOREIGN KEY ("grammarId") REFERENCES public."Grammar"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Exercise Exercise_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Exercise"
    ADD CONSTRAINT "Exercise_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."Lesson"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Grammar Grammar_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Grammar"
    ADD CONSTRAINT "Grammar_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."Lesson"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: KanjiEntry KanjiEntry_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."KanjiEntry"
    ADD CONSTRAINT "KanjiEntry_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."KanjiLesson"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: KanjiVocab KanjiVocab_kanjiEntryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."KanjiVocab"
    ADD CONSTRAINT "KanjiVocab_kanjiEntryId_fkey" FOREIGN KEY ("kanjiEntryId") REFERENCES public."KanjiEntry"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ListeningLog ListeningLog_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningLog"
    ADD CONSTRAINT "ListeningLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ReviewLog ReviewLog_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReviewLog"
    ADD CONSTRAINT "ReviewLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Vocabulary Vocabulary_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Vocabulary"
    ADD CONSTRAINT "Vocabulary_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."Lesson"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

\unrestrict 1yhajwaoe8eqHbTFhn1fUnOvpyGPhdkELKhz6mANZiFJ9erDP122uMeOYNVNF0v

