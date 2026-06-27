--
-- PostgreSQL database dump
--

\restrict 9NulZLUl6BGf0AdfhrhOeEyAG7moTtvHE5rSEDgL5fsE9HrleIBeVzVLrSje6u1

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
-- Name: EnglishLevel; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."EnglishLevel" AS ENUM (
    'A1',
    'A2',
    'B1',
    'B2',
    'C1',
    'C2'
);


--
-- Name: PartOfSpeech; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."PartOfSpeech" AS ENUM (
    'noun',
    'verb',
    'adjective',
    'adverb',
    'preposition',
    'conjunction',
    'pronoun',
    'interjection',
    'phrase',
    'phrasal_verb'
);


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
-- Name: DictationAttempt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."DictationAttempt" (
    id integer NOT NULL,
    "userId" integer,
    "vocabId" integer NOT NULL,
    "userInput" text NOT NULL,
    correct boolean NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: DictationAttempt_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."DictationAttempt_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: DictationAttempt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."DictationAttempt_id_seq" OWNED BY public."DictationAttempt".id;


--
-- Name: GrammarExercise; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."GrammarExercise" (
    id integer NOT NULL,
    "lessonId" integer NOT NULL,
    question text NOT NULL,
    answer text NOT NULL,
    options jsonb DEFAULT '[]'::jsonb NOT NULL,
    explanation text,
    "sortOrder" integer DEFAULT 0 NOT NULL
);


--
-- Name: GrammarExercise_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."GrammarExercise_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: GrammarExercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."GrammarExercise_id_seq" OWNED BY public."GrammarExercise".id;


--
-- Name: GrammarLesson; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."GrammarLesson" (
    id integer NOT NULL,
    "topicId" integer NOT NULL,
    title text NOT NULL,
    explanation text NOT NULL,
    examples jsonb DEFAULT '[]'::jsonb NOT NULL,
    level public."EnglishLevel" NOT NULL,
    "sortOrder" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: GrammarLesson_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."GrammarLesson_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: GrammarLesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."GrammarLesson_id_seq" OWNED BY public."GrammarLesson".id;


--
-- Name: GrammarTopic; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."GrammarTopic" (
    id integer NOT NULL,
    title text NOT NULL,
    description text,
    level public."EnglishLevel" NOT NULL,
    "sortOrder" integer DEFAULT 0 NOT NULL
);


--
-- Name: GrammarTopic_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."GrammarTopic_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: GrammarTopic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."GrammarTopic_id_seq" OWNED BY public."GrammarTopic".id;


--
-- Name: ListeningAttempt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ListeningAttempt" (
    id integer NOT NULL,
    "userId" integer,
    "trackId" integer NOT NULL,
    score integer NOT NULL,
    total integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: ListeningAttempt_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ListeningAttempt_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ListeningAttempt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ListeningAttempt_id_seq" OWNED BY public."ListeningAttempt".id;


--
-- Name: ListeningOption; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ListeningOption" (
    id integer NOT NULL,
    "questionId" integer NOT NULL,
    text text NOT NULL,
    "sortOrder" integer DEFAULT 0 NOT NULL
);


--
-- Name: ListeningOption_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ListeningOption_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ListeningOption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ListeningOption_id_seq" OWNED BY public."ListeningOption".id;


--
-- Name: ListeningQuestion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ListeningQuestion" (
    id integer NOT NULL,
    "trackId" integer NOT NULL,
    question text NOT NULL,
    answer text NOT NULL,
    explanation text,
    "sortOrder" integer DEFAULT 0 NOT NULL
);


--
-- Name: ListeningQuestion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ListeningQuestion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ListeningQuestion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ListeningQuestion_id_seq" OWNED BY public."ListeningQuestion".id;


--
-- Name: ListeningTrack; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ListeningTrack" (
    id integer NOT NULL,
    title text NOT NULL,
    "youtubeUrl" text,
    "audioUrl" text,
    transcript text,
    level public."EnglishLevel" NOT NULL,
    "durationSec" integer,
    "sortOrder" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: ListeningTrack_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ListeningTrack_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ListeningTrack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ListeningTrack_id_seq" OWNED BY public."ListeningTrack".id;


--
-- Name: ReadingAttempt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ReadingAttempt" (
    id integer NOT NULL,
    "userId" integer,
    "passageId" integer NOT NULL,
    score integer NOT NULL,
    total integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: ReadingAttempt_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ReadingAttempt_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ReadingAttempt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ReadingAttempt_id_seq" OWNED BY public."ReadingAttempt".id;


--
-- Name: ReadingOption; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ReadingOption" (
    id integer NOT NULL,
    "questionId" integer NOT NULL,
    text text NOT NULL,
    "sortOrder" integer DEFAULT 0 NOT NULL
);


--
-- Name: ReadingOption_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ReadingOption_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ReadingOption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ReadingOption_id_seq" OWNED BY public."ReadingOption".id;


--
-- Name: ReadingPassage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ReadingPassage" (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    level public."EnglishLevel" NOT NULL,
    source text,
    "estimatedMin" integer DEFAULT 5 NOT NULL,
    "sortOrder" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: ReadingPassage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ReadingPassage_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ReadingPassage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ReadingPassage_id_seq" OWNED BY public."ReadingPassage".id;


--
-- Name: ReadingQuestion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ReadingQuestion" (
    id integer NOT NULL,
    "passageId" integer NOT NULL,
    question text NOT NULL,
    answer text NOT NULL,
    explanation text,
    "sortOrder" integer DEFAULT 0 NOT NULL
);


--
-- Name: ReadingQuestion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ReadingQuestion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ReadingQuestion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ReadingQuestion_id_seq" OWNED BY public."ReadingQuestion".id;


--
-- Name: SrsCard; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SrsCard" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "vocabId" integer NOT NULL,
    "easeFactor" double precision DEFAULT 2.5 NOT NULL,
    "interval" integer DEFAULT 0 NOT NULL,
    repetitions integer DEFAULT 0 NOT NULL,
    "nextReviewAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "lastReviewAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: SrsCard_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."SrsCard_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: SrsCard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."SrsCard_id_seq" OWNED BY public."SrsCard".id;


--
-- Name: StudySession; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."StudySession" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    date date NOT NULL,
    seconds integer DEFAULT 0 NOT NULL,
    "cardsStudied" integer DEFAULT 0 NOT NULL
);


--
-- Name: StudySession_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."StudySession_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: StudySession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."StudySession_id_seq" OWNED BY public."StudySession".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    email text NOT NULL,
    "passwordHash" text NOT NULL,
    name text,
    role public."Role" DEFAULT 'USER'::public."Role" NOT NULL,
    "nativeLanguage" text DEFAULT 'vi'::text,
    "targetLevel" public."EnglishLevel",
    "studyGoalMin" integer DEFAULT 30 NOT NULL,
    "lastActiveAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
-- Name: VocabTopic; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."VocabTopic" (
    id integer NOT NULL,
    name text NOT NULL,
    icon text
);


--
-- Name: VocabTopic_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."VocabTopic_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: VocabTopic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."VocabTopic_id_seq" OWNED BY public."VocabTopic".id;


--
-- Name: Vocabulary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Vocabulary" (
    id integer NOT NULL,
    word text NOT NULL,
    phonetic text,
    "meaningVi" text NOT NULL,
    "meaningEn" text,
    "partOfSpeech" public."PartOfSpeech",
    level public."EnglishLevel" NOT NULL,
    "exampleEn" text,
    "exampleVi" text,
    "audioUrl" text,
    "imageUrl" text,
    "frequencyRank" integer,
    "topicId" integer,
    "sortOrder" integer DEFAULT 0 NOT NULL
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
-- Name: DictationAttempt id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."DictationAttempt" ALTER COLUMN id SET DEFAULT nextval('public."DictationAttempt_id_seq"'::regclass);


--
-- Name: GrammarExercise id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."GrammarExercise" ALTER COLUMN id SET DEFAULT nextval('public."GrammarExercise_id_seq"'::regclass);


--
-- Name: GrammarLesson id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."GrammarLesson" ALTER COLUMN id SET DEFAULT nextval('public."GrammarLesson_id_seq"'::regclass);


--
-- Name: GrammarTopic id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."GrammarTopic" ALTER COLUMN id SET DEFAULT nextval('public."GrammarTopic_id_seq"'::regclass);


--
-- Name: ListeningAttempt id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningAttempt" ALTER COLUMN id SET DEFAULT nextval('public."ListeningAttempt_id_seq"'::regclass);


--
-- Name: ListeningOption id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningOption" ALTER COLUMN id SET DEFAULT nextval('public."ListeningOption_id_seq"'::regclass);


--
-- Name: ListeningQuestion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningQuestion" ALTER COLUMN id SET DEFAULT nextval('public."ListeningQuestion_id_seq"'::regclass);


--
-- Name: ListeningTrack id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningTrack" ALTER COLUMN id SET DEFAULT nextval('public."ListeningTrack_id_seq"'::regclass);


--
-- Name: ReadingAttempt id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReadingAttempt" ALTER COLUMN id SET DEFAULT nextval('public."ReadingAttempt_id_seq"'::regclass);


--
-- Name: ReadingOption id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReadingOption" ALTER COLUMN id SET DEFAULT nextval('public."ReadingOption_id_seq"'::regclass);


--
-- Name: ReadingPassage id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReadingPassage" ALTER COLUMN id SET DEFAULT nextval('public."ReadingPassage_id_seq"'::regclass);


--
-- Name: ReadingQuestion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReadingQuestion" ALTER COLUMN id SET DEFAULT nextval('public."ReadingQuestion_id_seq"'::regclass);


--
-- Name: SrsCard id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SrsCard" ALTER COLUMN id SET DEFAULT nextval('public."SrsCard_id_seq"'::regclass);


--
-- Name: StudySession id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StudySession" ALTER COLUMN id SET DEFAULT nextval('public."StudySession_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Name: VocabTopic id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."VocabTopic" ALTER COLUMN id SET DEFAULT nextval('public."VocabTopic_id_seq"'::regclass);


--
-- Name: Vocabulary id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Vocabulary" ALTER COLUMN id SET DEFAULT nextval('public."Vocabulary_id_seq"'::regclass);


--
-- Data for Name: DictationAttempt; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."DictationAttempt" (id, "userId", "vocabId", "userInput", correct, "createdAt") FROM stdin;
\.


--
-- Data for Name: GrammarExercise; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."GrammarExercise" (id, "lessonId", question, answer, options, explanation, "sortOrder") FROM stdin;
1	1	She ___ (work) at a hospital.	works	"[\\"work\\",\\"works\\",\\"working\\",\\"worked\\"]"	\N	1
2	1	They ___ (not/eat) fast food.	don't eat	"[\\"don't eat\\",\\"doesn't eat\\",\\"not eat\\",\\"aren't eat\\"]"	\N	2
3	1	___ he ___ (speak) French?	Does / speak	"[\\"Does / speak\\",\\"Do / speaks\\",\\"Is / speak\\",\\"Has / speak\\"]"	\N	3
4	1	Water ___ (boil) at 100┬░C.	boils	"[\\"boil\\",\\"boils\\",\\"is boiling\\",\\"boiled\\"]"	\N	4
5	2	Listen! She ___ (sing).	is singing	"[\\"sings\\",\\"is singing\\",\\"are singing\\",\\"was singing\\"]"	\N	1
6	2	We ___ (not/watch) TV right now.	aren't watching	"[\\"aren't watching\\",\\"don't watch\\",\\"isn't watching\\",\\"not watching\\"]"	\N	2
7	2	___ they ___ (study) for the exam?	Are / studying	"[\\"Are / studying\\",\\"Do / study\\",\\"Is / studying\\",\\"Have / studying\\"]"	\N	3
8	3	If it ___ (rain), we ___ (cancel) the picnic.	rains / will cancel	"[\\"rains / will cancel\\",\\"rained / would cancel\\",\\"will rain / cancel\\",\\"rains / cancel\\"]"	\N	1
9	3	She ___ (be) angry if you ___ (be) late.	will be / are	"[\\"will be / are\\",\\"would be / were\\",\\"is / will be\\",\\"will be / will be\\"]"	\N	2
10	4	If I ___ (be) you, I ___ (study) harder.	were / would study	"[\\"were / would study\\",\\"was / will study\\",\\"am / would study\\",\\"were / will study\\"]"	\N	1
\.


--
-- Data for Name: GrammarLesson; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."GrammarLesson" (id, "topicId", title, explanation, examples, level, "sortOrder", "createdAt") FROM stdin;
1	1	C├ích d├╣ng & cß║Ñu tr├║c	Present Simple (Th├¼ hiß╗çn tß║íi ─æãín) d├╣ng ─æß╗â:\n1. Diß╗àn tß║ú th├│i quen, viß╗çc lß║Àp ─æi lß║Àp lß║íi\n   ÔåÆ I drink coffee every morning.\n2. Diß╗àn tß║ú sß╗▒ thß║¡t hiß╗ân nhi├¬n, ch├ón l├¢\n   ÔåÆ The sun rises in the east.\n3. Diß╗àn tß║ú lß╗ïch tr├¼nh cß╗æ ─æß╗ïnh\n   ÔåÆ The train leaves at 8am.\n\nCß║Ñu tr├║c:\n(+) S + V(s/es)     ÔåÆ She works hard.\n(-) S + don't/doesn't + V ÔåÆ He doesn't like tea.\n(?) Do/Does + S + V? ÔåÆ Do you speak English?\n\nLã░u ├¢: Th├¬m -s/-es vß╗øi he/she/it	["She speaks English very well.", "We don't eat meat on Fridays.", "Does he play football?"]	A1	1	2026-06-27 01:55:56.99
2	2	C├ích d├╣ng & cß║Ñu tr├║c	Present Continuous (Th├¼ hiß╗çn tß║íi tiß║┐p diß╗àn) d├╣ng ─æß╗â:\n1. Diß╗àn tß║ú h├ánh ─æß╗Öng ─æang xß║úy ra tß║íi thß╗Øi ─æiß╗âm n├│i\n   ÔåÆ I am reading a book right now.\n2. Diß╗àn tß║ú sß╗▒ thay ─æß╗òi hoß║Àc xu hã░ß╗øng\n   ÔåÆ Prices are rising.\n3. Diß╗àn tß║ú kß║┐ hoß║ích trong tã░ãíng lai gß║ºn\n   ÔåÆ I am meeting him tomorrow.\n\nCß║Ñu tr├║c:\n(+) S + am/is/are + V-ing\n(-) S + am/is/are + not + V-ing\n(?) Am/Is/Are + S + V-ing?	["She is watching TV now.", "They aren't working today.", "Are you listening to me?"]	A1	1	2026-06-27 01:55:57.002
3	3	Conditional Type 1	C├óu ─æiß╗üu kiß╗çn loß║íi 1 ÔÇö ─æiß╗üu kiß╗çn c├│ thß╗â xß║úy ra ß╗ƒ hiß╗çn tß║íi/tã░ãíng lai\n\nCß║Ñu tr├║c: If + S + V(simple present), S + will + V\n\nD├╣ng khi: ─æiß╗üu kiß╗çn c├│ thß╗â xß║úy ra, khß║ú n─âng thß╗▒c hiß╗çn ─æã░ß╗úc\n\nV├¡ dß╗Ñ:\nÔÇó If it rains, I will stay at home.\nÔÇó If you study hard, you will pass the exam.\nÔÇó We will be late if we don't hurry.	["If I have time, I will call you.", "She will help if you ask her."]	B1	1	2026-06-27 01:55:57.011
4	3	Conditional Type 2	C├óu ─æiß╗üu kiß╗çn loß║íi 2 ÔÇö giß║ú thuyß║┐t kh├┤ng c├│ thß║¡t ß╗ƒ hiß╗çn tß║íi\n\nCß║Ñu tr├║c: If + S + V(past simple), S + would + V\n\nD├╣ng khi: t├¼nh huß╗æng kh├┤ng c├│ thß║¡t, kh├┤ng thß╗â xß║úy ra hoß║Àc kh├│ xß║úy ra\n\nV├¡ dß╗Ñ:\nÔÇó If I were rich, I would travel the world.\nÔÇó If I had more time, I would learn more languages.\nÔÇó She would help if she knew how.\n\nLã░u ├¢: Vß╗øi "to be" d├╣ng "were" cho mß╗ìi chß╗º ngß╗» (I were, he were...)	["If I were you, I would accept the job.", "What would you do if you won the lottery?"]	B1	2	2026-06-27 01:55:57.011
\.


--
-- Data for Name: GrammarTopic; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."GrammarTopic" (id, title, description, level, "sortOrder") FROM stdin;
1	Present Simple	Th├¼ hiß╗çn tß║íi ─æãín ÔÇö diß╗àn tß║ú th├│i quen, sß╗▒ thß║¡t chung	A1	1
2	Present Continuous	Th├¼ hiß╗çn tß║íi tiß║┐p diß╗àn ÔÇö ─æang xß║úy ra l├║c n├│i	A1	2
3	Conditional Sentences	C├óu ─æiß╗üu kiß╗çn loß║íi 1, 2, 3	B1	1
\.


--
-- Data for Name: ListeningAttempt; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ListeningAttempt" (id, "userId", "trackId", score, total, "createdAt") FROM stdin;
\.


--
-- Data for Name: ListeningOption; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ListeningOption" (id, "questionId", text, "sortOrder") FROM stdin;
1	1	English grammar	1
2	1	English pronunciation	2
3	1	English vocabulary	3
4	1	English writing	4
\.


--
-- Data for Name: ListeningQuestion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ListeningQuestion" (id, "trackId", question, answer, explanation, "sortOrder") FROM stdin;
1	1	What is the main topic of this lesson?	English pronunciation	\N	1
\.


--
-- Data for Name: ListeningTrack; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ListeningTrack" (id, title, "youtubeUrl", "audioUrl", transcript, level, "durationSec", "sortOrder", "createdAt") FROM stdin;
1	Introduction to English Pronunciation	https://www.youtube.com/watch?v=dQw4w9WgXcQ	\N	This is a sample transcript for the listening exercise. In real usage, you would add the actual transcript of the YouTube video here.	A1	300	1	2026-06-27 01:55:57.046
\.


--
-- Data for Name: ReadingAttempt; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ReadingAttempt" (id, "userId", "passageId", score, total, "createdAt") FROM stdin;
\.


--
-- Data for Name: ReadingOption; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ReadingOption" (id, "questionId", text, "sortOrder") FROM stdin;
1	1	5 o'clock	1
2	1	6 o'clock	2
3	1	7 o'clock	3
4	1	8 o'clock	4
5	2	By bus	1
6	2	By bicycle	2
7	2	She walks	3
8	2	By car	4
9	3	She watches TV	1
10	3	She does homework	2
11	3	She reads a book	3
12	3	She plays games	4
13	4	More than 1 billion	1
14	4	More than 1.5 billion	2
15	4	More than 2 billion	3
16	4	About 500 million	4
17	5	It is the official language of all countries	1
18	5	Multinational companies require employees to speak English	2
19	5	It is easy to learn	3
20	5	It helps you make more money immediately	4
21	6	50%	1
22	6	75%	2
23	6	A large percentage	3
24	6	Almost all of it	4
\.


--
-- Data for Name: ReadingPassage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ReadingPassage" (id, title, content, level, source, "estimatedMin", "sortOrder", "createdAt") FROM stdin;
1	My Daily Routine	My name is Lan. I am a student. Every day, I wake up at 6 o'clock in the morning. I wash my face and brush my teeth. Then I eat breakfast with my family.\n\nI go to school at 7 o'clock. I walk to school because my school is near my house. At school, I study Math, English, and Science.\n\nAfter school, I go home at 5 o'clock. I do my homework and then I watch TV. I eat dinner at 7 o'clock. I read a book before I sleep. I go to bed at 10 o'clock.	A1	\N	3	1	2026-06-27 01:55:57.019
2	The Benefits of Learning English	English is one of the most widely spoken languages in the world. More than 1.5 billion people speak English, either as their first or second language. Learning English can open many doors for you in life.\n\nFirst, English is the language of international business. Many multinational companies require their employees to speak English. If you can communicate effectively in English, you will have a significant advantage in the job market.\n\nSecond, most scientific research and academic papers are published in English. Students who can read English have access to a much wider range of educational resources and can stay up-to-date with the latest developments in their fields.\n\nThird, English is the primary language of the internet. A large percentage of websites, videos, and online content are in English. Being able to understand English allows you to access this vast amount of information.\n\nFinally, learning English can help you understand different cultures and connect with people from all over the world. Travel becomes easier when you can communicate in English, as it is understood in most tourist destinations.	B1	Adapted from various sources	5	1	2026-06-27 01:55:57.033
\.


--
-- Data for Name: ReadingQuestion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ReadingQuestion" (id, "passageId", question, answer, explanation, "sortOrder") FROM stdin;
1	1	What time does Lan wake up?	6 o'clock	\N	1
2	1	How does Lan go to school?	She walks	\N	2
3	1	What does Lan do before sleeping?	She reads a book	\N	3
4	2	According to the passage, how many people speak English?	More than 1.5 billion	\N	1
5	2	Why is English important in business?	Multinational companies require employees to speak English	The passage states that many multinational companies require their employees to speak English.	2
6	2	What percentage of the internet is in English?	A large percentage	\N	3
\.


--
-- Data for Name: SrsCard; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SrsCard" (id, "userId", "vocabId", "easeFactor", "interval", repetitions, "nextReviewAt", "lastReviewAt", "createdAt") FROM stdin;
\.


--
-- Data for Name: StudySession; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."StudySession" (id, "userId", date, seconds, "cardsStudied") FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."User" (id, email, "passwordHash", name, role, "nativeLanguage", "targetLevel", "studyGoalMin", "lastActiveAt", "createdAt") FROM stdin;
\.


--
-- Data for Name: VocabTopic; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."VocabTopic" (id, name, icon) FROM stdin;
1	Daily Life	­ƒÅá
2	Work & Career	­ƒÆ╝
3	Travel	Ô£ê´©Å
\.


--
-- Data for Name: Vocabulary; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Vocabulary" (id, word, phonetic, "meaningVi", "meaningEn", "partOfSpeech", level, "exampleEn", "exampleVi", "audioUrl", "imageUrl", "frequencyRank", "topicId", "sortOrder") FROM stdin;
1	hello	/h╔Ö╦êlo╩è/	xin ch├áo	\N	interjection	A1	Hello, how are you?	Xin ch├áo, bß║ín khß╗Åe kh├┤ng?	\N	\N	\N	1	0
2	goodbye	/╦î╔í╩èd╦êba╔¬/	tß║ím biß╗çt	\N	interjection	A1	Goodbye, see you tomorrow!	Tß║ím biß╗çt, hß║╣n gß║Àp lß║íi ng├áy mai!	\N	\N	\N	1	1
3	house	/ha╩ès/	ng├┤i nh├á	\N	noun	A1	I live in a small house.	T├┤i sß╗æng trong mß╗Öt ng├┤i nh├á nhß╗Å.	\N	\N	\N	1	2
4	water	/╦êw╔ö╦Ét╔Ör/	nã░ß╗øc	\N	noun	A1	Can I have some water?	T├┤i c├│ thß╗â xin ch├║t nã░ß╗øc kh├┤ng?	\N	\N	\N	1	3
5	eat	/i╦Ét/	─ân	\N	verb	A1	I eat breakfast every morning.	T├┤i ─ân s├íng mß╗ùi buß╗òi s├íng.	\N	\N	\N	1	4
6	book	/b╩èk/	quyß╗ân s├ích	\N	noun	A1	This is a good book.	─É├óy l├á mß╗Öt cuß╗æn s├ích hay.	\N	\N	\N	1	5
7	friend	/frend/	bß║ín b├¿	\N	noun	A1	She is my best friend.	C├┤ ß║Ñy l├á ngã░ß╗Øi bß║ín th├ón nhß║Ñt cß╗ºa t├┤i.	\N	\N	\N	1	6
8	happy	/╦êh├ªpi/	vui vß║╗, hß║ính ph├║c	\N	adjective	A1	I am very happy today.	H├┤m nay t├┤i rß║Ñt vui.	\N	\N	\N	1	7
9	work	/w╔£╦Érk/	l├ám viß╗çc / c├┤ng viß╗çc	\N	verb	A1	I work in an office.	T├┤i l├ám viß╗çc trong v─ân ph├▓ng.	\N	\N	\N	2	8
10	school	/sku╦Él/	trã░ß╗Øng hß╗ìc	\N	noun	A1	My school is near my house.	Trã░ß╗Øng t├┤i gß║ºn nh├á t├┤i.	\N	\N	\N	1	9
11	although	/╔ö╦Él╦ê├░o╩è/	mß║Àc d├╣	\N	conjunction	A2	Although it was raining, we went out.	Mß║Àc d├╣ trß╗Øi mã░a, ch├║ng t├┤i vß║½n ra ngo├ái.	\N	\N	\N	1	10
12	journey	/╦êd╩Æ╔£╦Érni/	h├ánh tr├¼nh	\N	noun	A2	The journey took three hours.	H├ánh tr├¼nh mß║Ñt ba tiß║┐ng ─æß╗ông hß╗ô.	\N	\N	\N	3	11
13	describe	/d╔¬╦êskra╔¬b/	m├┤ tß║ú	\N	verb	A2	Can you describe what you saw?	Bß║ín c├│ thß╗â m├┤ tß║ú nhß╗»ng g├¼ bß║ín thß║Ñy kh├┤ng?	\N	\N	\N	1	12
14	popular	/╦êp╔Æpj╩èl╔Ör/	phß╗ò biß║┐n	\N	adjective	A2	This song is very popular.	B├ái h├ít n├áy rß║Ñt phß╗ò biß║┐n.	\N	\N	\N	1	13
15	passport	/╦êp├ªsp╔ö╦Ért/	hß╗Ö chiß║┐u	\N	noun	A2	You need a passport to travel abroad.	Bß║ín cß║ºn hß╗Ö chiß║┐u ─æß╗â ─æi nã░ß╗øc ngo├ái.	\N	\N	\N	3	14
16	negotiate	/n╔¬╦ê╔ío╩è╩âie╔¬t/	─æ├ám ph├ín, thã░ãíng lã░ß╗úng	\N	verb	B1	We need to negotiate the contract terms.	Ch├║ng ta cß║ºn thã░ãíng lã░ß╗úng c├íc ─æiß╗üu khoß║ún hß╗úp ─æß╗ông.	\N	\N	\N	2	15
17	significant	/s╔¬╔í╦ên╔¬f╔¬k╔Önt/	─æ├íng kß╗â, quan trß╗ìng	\N	adjective	B1	There has been a significant improvement.	─É├ú c├│ sß╗▒ cß║úi thiß╗çn ─æ├íng kß╗â.	\N	\N	\N	2	16
18	recommend	/╦îrek╔Ö╦êmend/	─æß╗ü nghß╗ï, giß╗øi thiß╗çu	\N	verb	B1	I recommend this restaurant.	T├┤i giß╗øi thiß╗çu nh├á h├áng n├áy.	\N	\N	\N	3	17
19	efficient	/╔¬╦êf╔¬╩â╔Önt/	hiß╗çu quß║ú	\N	adjective	B1	She is a very efficient worker.	C├┤ ß║Ñy l├á mß╗Öt nh├ón vi├¬n rß║Ñt hiß╗çu quß║ú.	\N	\N	\N	2	18
20	approximately	/╔Ö╦êpr╔Æks╔¬m╔Ötli/	xß║Ñp xß╗ë, khoß║úng	\N	adverb	B1	It costs approximately $50.	N├│ c├│ gi├í khoß║úng 50 ─æ├┤ la.	\N	\N	\N	2	19
\.


--
-- Name: DictationAttempt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."DictationAttempt_id_seq"', 1, false);


--
-- Name: GrammarExercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."GrammarExercise_id_seq"', 10, true);


--
-- Name: GrammarLesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."GrammarLesson_id_seq"', 4, true);


--
-- Name: GrammarTopic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."GrammarTopic_id_seq"', 3, true);


--
-- Name: ListeningAttempt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ListeningAttempt_id_seq"', 1, false);


--
-- Name: ListeningOption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ListeningOption_id_seq"', 4, true);


--
-- Name: ListeningQuestion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ListeningQuestion_id_seq"', 1, true);


--
-- Name: ListeningTrack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ListeningTrack_id_seq"', 1, true);


--
-- Name: ReadingAttempt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ReadingAttempt_id_seq"', 1, false);


--
-- Name: ReadingOption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ReadingOption_id_seq"', 24, true);


--
-- Name: ReadingPassage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ReadingPassage_id_seq"', 2, true);


--
-- Name: ReadingQuestion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ReadingQuestion_id_seq"', 6, true);


--
-- Name: SrsCard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."SrsCard_id_seq"', 1, false);


--
-- Name: StudySession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."StudySession_id_seq"', 1, false);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, false);


--
-- Name: VocabTopic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."VocabTopic_id_seq"', 3, true);


--
-- Name: Vocabulary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Vocabulary_id_seq"', 20, true);


--
-- Name: DictationAttempt DictationAttempt_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."DictationAttempt"
    ADD CONSTRAINT "DictationAttempt_pkey" PRIMARY KEY (id);


--
-- Name: GrammarExercise GrammarExercise_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."GrammarExercise"
    ADD CONSTRAINT "GrammarExercise_pkey" PRIMARY KEY (id);


--
-- Name: GrammarLesson GrammarLesson_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."GrammarLesson"
    ADD CONSTRAINT "GrammarLesson_pkey" PRIMARY KEY (id);


--
-- Name: GrammarTopic GrammarTopic_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."GrammarTopic"
    ADD CONSTRAINT "GrammarTopic_pkey" PRIMARY KEY (id);


--
-- Name: ListeningAttempt ListeningAttempt_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningAttempt"
    ADD CONSTRAINT "ListeningAttempt_pkey" PRIMARY KEY (id);


--
-- Name: ListeningOption ListeningOption_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningOption"
    ADD CONSTRAINT "ListeningOption_pkey" PRIMARY KEY (id);


--
-- Name: ListeningQuestion ListeningQuestion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningQuestion"
    ADD CONSTRAINT "ListeningQuestion_pkey" PRIMARY KEY (id);


--
-- Name: ListeningTrack ListeningTrack_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningTrack"
    ADD CONSTRAINT "ListeningTrack_pkey" PRIMARY KEY (id);


--
-- Name: ReadingAttempt ReadingAttempt_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReadingAttempt"
    ADD CONSTRAINT "ReadingAttempt_pkey" PRIMARY KEY (id);


--
-- Name: ReadingOption ReadingOption_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReadingOption"
    ADD CONSTRAINT "ReadingOption_pkey" PRIMARY KEY (id);


--
-- Name: ReadingPassage ReadingPassage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReadingPassage"
    ADD CONSTRAINT "ReadingPassage_pkey" PRIMARY KEY (id);


--
-- Name: ReadingQuestion ReadingQuestion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReadingQuestion"
    ADD CONSTRAINT "ReadingQuestion_pkey" PRIMARY KEY (id);


--
-- Name: SrsCard SrsCard_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SrsCard"
    ADD CONSTRAINT "SrsCard_pkey" PRIMARY KEY (id);


--
-- Name: StudySession StudySession_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StudySession"
    ADD CONSTRAINT "StudySession_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: VocabTopic VocabTopic_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."VocabTopic"
    ADD CONSTRAINT "VocabTopic_pkey" PRIMARY KEY (id);


--
-- Name: Vocabulary Vocabulary_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Vocabulary"
    ADD CONSTRAINT "Vocabulary_pkey" PRIMARY KEY (id);


--
-- Name: SrsCard_userId_vocabId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "SrsCard_userId_vocabId_key" ON public."SrsCard" USING btree ("userId", "vocabId");


--
-- Name: StudySession_userId_date_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "StudySession_userId_date_key" ON public."StudySession" USING btree ("userId", date);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: VocabTopic_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "VocabTopic_name_key" ON public."VocabTopic" USING btree (name);


--
-- Name: Vocabulary_level_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Vocabulary_level_idx" ON public."Vocabulary" USING btree (level);


--
-- Name: Vocabulary_topicId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Vocabulary_topicId_idx" ON public."Vocabulary" USING btree ("topicId");


--
-- Name: DictationAttempt DictationAttempt_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."DictationAttempt"
    ADD CONSTRAINT "DictationAttempt_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: DictationAttempt DictationAttempt_vocabId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."DictationAttempt"
    ADD CONSTRAINT "DictationAttempt_vocabId_fkey" FOREIGN KEY ("vocabId") REFERENCES public."Vocabulary"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: GrammarExercise GrammarExercise_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."GrammarExercise"
    ADD CONSTRAINT "GrammarExercise_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."GrammarLesson"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: GrammarLesson GrammarLesson_topicId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."GrammarLesson"
    ADD CONSTRAINT "GrammarLesson_topicId_fkey" FOREIGN KEY ("topicId") REFERENCES public."GrammarTopic"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ListeningAttempt ListeningAttempt_trackId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningAttempt"
    ADD CONSTRAINT "ListeningAttempt_trackId_fkey" FOREIGN KEY ("trackId") REFERENCES public."ListeningTrack"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ListeningAttempt ListeningAttempt_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningAttempt"
    ADD CONSTRAINT "ListeningAttempt_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ListeningOption ListeningOption_questionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningOption"
    ADD CONSTRAINT "ListeningOption_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES public."ListeningQuestion"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ListeningQuestion ListeningQuestion_trackId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ListeningQuestion"
    ADD CONSTRAINT "ListeningQuestion_trackId_fkey" FOREIGN KEY ("trackId") REFERENCES public."ListeningTrack"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ReadingAttempt ReadingAttempt_passageId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReadingAttempt"
    ADD CONSTRAINT "ReadingAttempt_passageId_fkey" FOREIGN KEY ("passageId") REFERENCES public."ReadingPassage"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ReadingAttempt ReadingAttempt_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReadingAttempt"
    ADD CONSTRAINT "ReadingAttempt_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ReadingOption ReadingOption_questionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReadingOption"
    ADD CONSTRAINT "ReadingOption_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES public."ReadingQuestion"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ReadingQuestion ReadingQuestion_passageId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReadingQuestion"
    ADD CONSTRAINT "ReadingQuestion_passageId_fkey" FOREIGN KEY ("passageId") REFERENCES public."ReadingPassage"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SrsCard SrsCard_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SrsCard"
    ADD CONSTRAINT "SrsCard_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SrsCard SrsCard_vocabId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SrsCard"
    ADD CONSTRAINT "SrsCard_vocabId_fkey" FOREIGN KEY ("vocabId") REFERENCES public."Vocabulary"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: StudySession StudySession_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StudySession"
    ADD CONSTRAINT "StudySession_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Vocabulary Vocabulary_topicId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Vocabulary"
    ADD CONSTRAINT "Vocabulary_topicId_fkey" FOREIGN KEY ("topicId") REFERENCES public."VocabTopic"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict 9NulZLUl6BGf0AdfhrhOeEyAG7moTtvHE5rSEDgL5fsE9HrleIBeVzVLrSje6u1

