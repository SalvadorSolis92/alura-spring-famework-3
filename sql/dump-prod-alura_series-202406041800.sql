--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Ubuntu 14.12-1.pgdg22.04+1)
-- Dumped by pg_dump version 14.12 (Ubuntu 14.12-1.pgdg22.04+1)

-- Started on 2024-06-04 18:00:27 CST

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

DROP DATABASE alura_series;
--
-- TOC entry 3375 (class 1262 OID 53233)
-- Name: alura_series; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE alura_series WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'es_MX.UTF-8';


ALTER DATABASE alura_series OWNER TO postgres;

\connect alura_series

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 53271)
-- Name: episodios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.episodios (
    id bigint NOT NULL,
    evaluacion double precision,
    fecha_de_lanzamiento date,
    numero_episodio integer,
    temporada integer,
    titulo character varying(255),
    serie_id bigint
);


ALTER TABLE public.episodios OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 53270)
-- Name: episodios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.episodios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.episodios_id_seq OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 211
-- Name: episodios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.episodios_id_seq OWNED BY public.episodios.id;


--
-- TOC entry 210 (class 1259 OID 53235)
-- Name: series; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.series (
    id bigint NOT NULL,
    actores character varying(255),
    evaluacion double precision,
    genero character varying(255),
    poster character varying(255),
    sinopsis character varying(255),
    titulo character varying(255),
    total_temporadas integer,
    CONSTRAINT series_genero_check CHECK (((genero)::text = ANY ((ARRAY['ACCION'::character varying, 'ROMANCE'::character varying, 'COMEDIA'::character varying, 'DRAMA'::character varying, 'CRIMEN'::character varying])::text[])))
);


ALTER TABLE public.series OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 53234)
-- Name: series_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.series_id_seq OWNER TO postgres;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 209
-- Name: series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.series_id_seq OWNED BY public.series.id;


--
-- TOC entry 3219 (class 2604 OID 53274)
-- Name: episodios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episodios ALTER COLUMN id SET DEFAULT nextval('public.episodios_id_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 53238)
-- Name: series id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series ALTER COLUMN id SET DEFAULT nextval('public.series_id_seq'::regclass);


--
-- TOC entry 3369 (class 0 OID 53271)
-- Dependencies: 212
-- Data for Name: episodios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.episodios VALUES (243, 8, '1998-10-07', 1, 1, 'Something Wicca This Way Comes', 3);
INSERT INTO public.episodios VALUES (244, 7.3, '1998-10-14', 2, 1, 'I''ve Got You Under My Skin', 3);
INSERT INTO public.episodios VALUES (245, 7.1, '1998-10-21', 3, 1, 'Thank You for Not Morphing', 3);
INSERT INTO public.episodios VALUES (246, 8.2, '1998-10-28', 4, 1, 'Dead Man Dating', 3);
INSERT INTO public.episodios VALUES (247, 0, '1998-11-04', 5, 1, 'Dream Sorcerer', 3);
INSERT INTO public.episodios VALUES (248, 7.1, '1998-11-11', 6, 1, 'The Wedding from Hell', 3);
INSERT INTO public.episodios VALUES (249, 7.2, '1998-11-18', 7, 1, 'The Fourth Sister', 3);
INSERT INTO public.episodios VALUES (250, 7.9, '1998-11-25', 8, 1, 'The Truth Is Out There... and It Hurts', 3);
INSERT INTO public.episodios VALUES (251, 8, '1998-12-16', 9, 1, 'The Witch Is Back', 3);
INSERT INTO public.episodios VALUES (252, 7.9, '1999-01-13', 10, 1, 'Wicca Envy', 3);
INSERT INTO public.episodios VALUES (253, 0, '1999-01-20', 11, 1, 'Feats of Clay', 3);
INSERT INTO public.episodios VALUES (254, 7.8, '1999-02-03', 12, 1, 'The Wendigo', 3);
INSERT INTO public.episodios VALUES (255, 0, '1999-02-10', 13, 1, 'From Fear to Eternity', 3);
INSERT INTO public.episodios VALUES (256, 7.3, '1999-02-17', 14, 1, 'Secrets and Guys', 3);
INSERT INTO public.episodios VALUES (257, 7.9, '1999-02-24', 15, 1, 'Is There a Woogy in the House?', 3);
INSERT INTO public.episodios VALUES (258, 8.1, '1999-03-03', 16, 1, 'Which Prue Is It, Anyway?', 3);
INSERT INTO public.episodios VALUES (259, 8.7, '1999-04-07', 17, 1, 'That ''70s Episode', 3);
INSERT INTO public.episodios VALUES (260, 7.1, '1999-04-28', 18, 1, 'When Bad Warlocks Turn Good', 3);
INSERT INTO public.episodios VALUES (261, 0, '1999-05-05', 19, 1, 'Out of Sight', 3);
INSERT INTO public.episodios VALUES (262, 0, '1999-05-12', 20, 1, 'The Power of Two', 3);
INSERT INTO public.episodios VALUES (263, 0, '1999-05-19', 21, 1, 'Love Hurts', 3);
INSERT INTO public.episodios VALUES (264, 8.7, '1999-05-26', 22, 1, 'Déjà Vu All Over Again', 3);
INSERT INTO public.episodios VALUES (265, 7.9, '1999-09-30', 1, 2, 'Witch Trial', 3);
INSERT INTO public.episodios VALUES (266, 8.4, '1999-10-07', 2, 2, 'Morality Bites', 3);
INSERT INTO public.episodios VALUES (267, 8.1, '1999-10-14', 3, 2, 'The Painted World', 3);
INSERT INTO public.episodios VALUES (268, 7.2, '1999-10-21', 4, 2, 'The Devil''s Music', 3);
INSERT INTO public.episodios VALUES (269, 7.5, '1999-11-04', 5, 2, 'She''s a Man, Baby, a Man!', 3);
INSERT INTO public.episodios VALUES (270, 7.1, '1999-11-11', 6, 2, 'That Old Black Magic', 3);
INSERT INTO public.episodios VALUES (271, 7.7, '1999-11-18', 7, 2, 'They''re Everywhere', 3);
INSERT INTO public.episodios VALUES (272, 8.1, '1999-12-09', 8, 2, 'P3 H2O', 3);
INSERT INTO public.episodios VALUES (273, 8.1, '2000-01-13', 9, 2, 'Ms. Hellfire', 3);
INSERT INTO public.episodios VALUES (274, 7.5, '2000-01-20', 10, 2, 'Heartbreak City', 3);
INSERT INTO public.episodios VALUES (275, 7.3, '2000-01-27', 11, 2, 'Reckless Abandon', 3);
INSERT INTO public.episodios VALUES (276, 8.3, '2000-02-03', 12, 2, 'Awakened', 3);
INSERT INTO public.episodios VALUES (277, 7.1, '2000-02-10', 13, 2, 'Animal Pragmatism', 3);
INSERT INTO public.episodios VALUES (278, 8, '2000-02-17', 14, 2, 'Pardon My Past', 3);
INSERT INTO public.episodios VALUES (279, 7.4, '2000-02-24', 15, 2, 'Give Me a Sign', 3);
INSERT INTO public.episodios VALUES (280, 7.9, '2000-03-30', 16, 2, 'Murphy''s Luck', 3);
INSERT INTO public.episodios VALUES (281, 7.2, '2000-04-06', 17, 2, 'How to Make a Quilt Out of Americans', 3);
INSERT INTO public.episodios VALUES (282, 8.3, '2000-04-20', 18, 2, 'Chick Flick', 3);
INSERT INTO public.episodios VALUES (283, 8, '2000-04-27', 19, 2, 'Ex Libris', 3);
INSERT INTO public.episodios VALUES (284, 8, '2000-05-04', 20, 2, 'Astral Monkey', 3);
INSERT INTO public.episodios VALUES (285, 8, '2000-05-11', 21, 2, 'Apocalypse, Not', 3);
INSERT INTO public.episodios VALUES (286, 8, '2000-05-18', 22, 2, 'Be Careful What You Witch For', 3);
INSERT INTO public.episodios VALUES (287, 0, '2000-10-05', 1, 3, 'The Honeymoon''s Over', 3);
INSERT INTO public.episodios VALUES (288, 7.7, '2000-10-12', 2, 3, 'Magic Hour', 3);
INSERT INTO public.episodios VALUES (289, 7.5, '2000-10-19', 3, 3, 'Once Upon a Time', 3);
INSERT INTO public.episodios VALUES (290, 8.3, '2000-10-26', 4, 3, 'All Halliwell''s Eve', 3);
INSERT INTO public.episodios VALUES (291, 0, '2000-11-02', 5, 3, 'Sight Unseen', 3);
INSERT INTO public.episodios VALUES (292, 0, '2000-11-09', 6, 3, 'Primrose Empath', 3);
INSERT INTO public.episodios VALUES (293, 8.3, '2000-11-16', 7, 3, 'Power Outage', 3);
INSERT INTO public.episodios VALUES (294, 8.5, '2000-12-14', 8, 3, 'Sleuthing with the Enemy', 3);
INSERT INTO public.episodios VALUES (295, 0, '2001-01-11', 9, 3, 'Coyote Piper', 3);
INSERT INTO public.episodios VALUES (296, 7.5, '2001-01-18', 10, 3, 'We All Scream for Ice Cream', 3);
INSERT INTO public.episodios VALUES (297, 8, '2001-01-25', 11, 3, 'Blinded by the Whitelighter', 3);
INSERT INTO public.episodios VALUES (298, 0, '2001-02-01', 12, 3, 'Wrestling with Demons', 3);
INSERT INTO public.episodios VALUES (299, 8.1, '2001-02-08', 13, 3, 'Bride and Gloom', 3);
INSERT INTO public.episodios VALUES (300, 8.2, '2001-02-15', 14, 3, 'The Good, the Bad and the Cursed', 3);
INSERT INTO public.episodios VALUES (301, 8.3, '2001-02-22', 15, 3, 'Just Harried', 3);
INSERT INTO public.episodios VALUES (302, 8, '2001-03-15', 16, 3, 'Death Takes a Halliwell', 3);
INSERT INTO public.episodios VALUES (303, 0, '2001-03-22', 17, 3, 'Pre-Witched', 3);
INSERT INTO public.episodios VALUES (304, 8.3, '2001-04-19', 18, 3, 'Sin Francisco', 3);
INSERT INTO public.episodios VALUES (305, 7.7, '2001-04-26', 19, 3, 'The Demon Who Came in from the Cold', 3);
INSERT INTO public.episodios VALUES (306, 8, '2001-05-03', 20, 3, 'Exit Strategy', 3);
INSERT INTO public.episodios VALUES (307, 0, '2001-05-10', 21, 3, 'Look Who''s Barking', 3);
INSERT INTO public.episodios VALUES (308, 0, '2001-05-17', 22, 3, 'All Hell Breaks Loose', 3);
INSERT INTO public.episodios VALUES (309, 8.4, '2001-10-04', 1, 4, 'Charmed Again: Part 1', 3);
INSERT INTO public.episodios VALUES (310, 8.4, '2001-10-04', 2, 4, 'Charmed Again: Part 2', 3);
INSERT INTO public.episodios VALUES (311, 8.2, '2001-10-11', 3, 4, 'Hell Hath No Fury', 3);
INSERT INTO public.episodios VALUES (312, 7.7, '2001-10-18', 4, 4, 'Enter the Demon', 3);
INSERT INTO public.episodios VALUES (313, 7.7, '2001-10-25', 5, 4, 'Size Matters', 3);
INSERT INTO public.episodios VALUES (314, 7.5, '2001-11-01', 6, 4, 'A Knight to Remember', 3);
INSERT INTO public.episodios VALUES (315, 8.3, '2001-11-08', 7, 4, 'Brain Drain', 3);
INSERT INTO public.episodios VALUES (316, 8, '2001-11-15', 8, 4, 'Black as Cole', 3);
INSERT INTO public.episodios VALUES (317, 7.4, '2001-12-13', 9, 4, 'Muse to My Ears', 3);
INSERT INTO public.episodios VALUES (318, 8.2, '2002-01-17', 10, 4, 'A Paige from the Past', 3);
INSERT INTO public.episodios VALUES (319, 7.4, '2002-01-24', 11, 4, 'Trial by Magic', 3);
INSERT INTO public.episodios VALUES (320, 7.7, '2002-01-31', 12, 4, 'Lost and Bound', 3);
INSERT INTO public.episodios VALUES (321, 0, '2002-02-07', 13, 4, 'Charmed and Dangerous', 3);
INSERT INTO public.episodios VALUES (322, 7.9, '2002-02-14', 14, 4, 'The Three Faces of Phoebe', 3);
INSERT INTO public.episodios VALUES (323, 8.1, '2002-03-14', 15, 4, 'Marry-Go-Round', 3);
INSERT INTO public.episodios VALUES (324, 7.9, '2002-03-21', 16, 4, 'The Fifth Halliwheel', 3);
INSERT INTO public.episodios VALUES (325, 7.8, '2002-03-28', 17, 4, 'Saving Private Leo', 3);
INSERT INTO public.episodios VALUES (326, 0, '2002-04-18', 18, 4, 'Bite Me', 3);
INSERT INTO public.episodios VALUES (327, 8.2, '2002-04-25', 19, 4, 'We''re Off to See the Wizard', 3);
INSERT INTO public.episodios VALUES (328, 8.7, '2002-05-02', 20, 4, 'Long Live the Queen', 3);
INSERT INTO public.episodios VALUES (329, 8.2, '2002-05-09', 21, 4, 'Womb Raider', 3);
INSERT INTO public.episodios VALUES (330, 8.2, '2002-05-16', 22, 4, 'Witch Way Now?', 3);
INSERT INTO public.episodios VALUES (331, 0, '2002-09-22', 1, 5, 'A Witch''s Tail: Part 1', 3);
INSERT INTO public.episodios VALUES (332, 0, '2002-09-22', 2, 5, 'A Witch''s Tail: Part 2', 3);
INSERT INTO public.episodios VALUES (333, 8, '2002-09-29', 3, 5, 'Happily Ever After', 3);
INSERT INTO public.episodios VALUES (334, 0, '2002-10-06', 4, 5, 'Siren Song', 3);
INSERT INTO public.episodios VALUES (335, 0, '2002-10-13', 5, 5, 'Witches in Tights', 3);
INSERT INTO public.episodios VALUES (336, 0, '2002-10-20', 6, 5, 'The Eyes Have It', 3);
INSERT INTO public.episodios VALUES (337, 8.2, '2002-11-03', 7, 5, 'Sympathy for the Demon', 3);
INSERT INTO public.episodios VALUES (338, 0, '2002-11-10', 8, 5, 'A Witch in Time', 3);
INSERT INTO public.episodios VALUES (339, 0, '2002-11-17', 9, 5, 'Sam I Am', 3);
INSERT INTO public.episodios VALUES (340, 0, '2003-01-05', 10, 5, 'Y Tu Mummy También', 3);
INSERT INTO public.episodios VALUES (341, 8, '2003-01-12', 11, 5, 'The Importance of Being Phoebe', 3);
INSERT INTO public.episodios VALUES (342, 8.6, '2003-01-19', 12, 5, 'Centennial Charmed', 3);
INSERT INTO public.episodios VALUES (343, 7.4, '2003-02-02', 13, 5, 'House Call', 3);
INSERT INTO public.episodios VALUES (344, 7.4, '2003-02-09', 14, 5, 'Sand Francisco Dreamin''', 3);
INSERT INTO public.episodios VALUES (345, 8.4, '2003-02-16', 15, 5, 'The Day the Magic Died', 3);
INSERT INTO public.episodios VALUES (346, 0, '2003-03-30', 16, 5, 'Baby''s First Demon', 3);
INSERT INTO public.episodios VALUES (347, 0, '2003-04-06', 17, 5, 'Lucky Charmed', 3);
INSERT INTO public.episodios VALUES (348, 0, '2003-04-13', 18, 5, 'Cat House', 3);
INSERT INTO public.episodios VALUES (349, 0, '2003-04-20', 19, 5, 'Nymphs Just Wanna Have Fun', 3);
INSERT INTO public.episodios VALUES (350, 8.3, '2003-04-27', 20, 5, 'Sense and Sense Ability', 3);
INSERT INTO public.episodios VALUES (351, 0, '2003-05-04', 21, 5, 'Necromancing the Stone', 3);
INSERT INTO public.episodios VALUES (352, 7.9, '2003-05-11', 22, 5, 'Oh My Goddess!: Part 1', 3);
INSERT INTO public.episodios VALUES (353, 0, '2003-05-11', 23, 5, 'Oh My Goddess!: Part 2', 3);
INSERT INTO public.episodios VALUES (122, 7.5, '2007-09-19', 1, 1, 'Pilot', 1);
INSERT INTO public.episodios VALUES (123, 7.4, '2007-09-26', 2, 1, 'The Wild Brunch', 1);
INSERT INTO public.episodios VALUES (124, 7.5, '2007-10-03', 3, 1, 'Poison Ivy', 1);
INSERT INTO public.episodios VALUES (125, 7.4, '2007-10-10', 4, 1, 'Bad News Blair', 1);
INSERT INTO public.episodios VALUES (126, 7.6, '2007-10-17', 5, 1, 'Dare Devil', 1);
INSERT INTO public.episodios VALUES (127, 7.5, '2007-10-24', 6, 1, 'The Handmaiden''s Tale', 1);
INSERT INTO public.episodios VALUES (128, 0, '2007-11-07', 7, 1, 'Victor/Victrola', 1);
INSERT INTO public.episodios VALUES (129, 7.7, '2007-11-14', 8, 1, 'Seventeen Candles', 1);
INSERT INTO public.episodios VALUES (130, 0, '2007-11-28', 9, 1, 'Blair Waldorf Must Pie!', 1);
INSERT INTO public.episodios VALUES (131, 7.8, '2007-12-05', 10, 1, 'Hi, Society', 1);
INSERT INTO public.episodios VALUES (132, 7.6, '2007-12-19', 11, 1, 'Roman Holiday', 1);
INSERT INTO public.episodios VALUES (133, 7.5, '2008-01-02', 12, 1, 'School Lies', 1);
INSERT INTO public.episodios VALUES (134, 7.8, '2008-01-09', 13, 1, 'A Thin Line Between Chuck and Nate', 1);
INSERT INTO public.episodios VALUES (135, 7.8, '2008-04-21', 14, 1, 'The Blair Bitch Project', 1);
INSERT INTO public.episodios VALUES (136, 7.5, '2008-04-28', 15, 1, 'Desperately Seeking Serena', 1);
INSERT INTO public.episodios VALUES (137, 8, '2008-05-05', 16, 1, 'All About My Brother', 1);
INSERT INTO public.episodios VALUES (138, 8, '2008-05-12', 17, 1, 'Woman on the Verge', 1);
INSERT INTO public.episodios VALUES (139, 7.8, '2008-05-19', 18, 1, 'Much ''I Do'' About Nothing', 1);
INSERT INTO public.episodios VALUES (140, 0, '2008-09-01', 1, 2, 'Summer Kind of Wonderful', 1);
INSERT INTO public.episodios VALUES (141, 7.5, '2008-09-08', 2, 2, 'Never Been Marcused', 1);
INSERT INTO public.episodios VALUES (142, 0, '2008-09-15', 3, 2, 'The Dark Night', 1);
INSERT INTO public.episodios VALUES (143, 0, '2008-09-22', 4, 2, 'The Ex-Files', 1);
INSERT INTO public.episodios VALUES (144, 7.9, '2008-09-29', 5, 2, 'The Serena Also Rises', 1);
INSERT INTO public.episodios VALUES (145, 7.8, '2008-10-13', 6, 2, 'New Haven Can Wait', 1);
INSERT INTO public.episodios VALUES (146, 0, '2008-10-20', 7, 2, 'Chuck in Real Life', 1);
INSERT INTO public.episodios VALUES (147, 0, '2008-10-27', 8, 2, 'Pret-a-Poor-J', 1);
INSERT INTO public.episodios VALUES (148, 7.9, '2008-11-03', 9, 2, 'There Might be Blood', 1);
INSERT INTO public.episodios VALUES (149, 0, '2008-11-10', 10, 2, 'Bonfire of the Vanity', 1);
INSERT INTO public.episodios VALUES (150, 0, '2008-11-17', 11, 2, 'The Magnificent Archibalds', 1);
INSERT INTO public.episodios VALUES (151, 0, '2008-12-01', 12, 2, 'It''s a Wonderful Lie', 1);
INSERT INTO public.episodios VALUES (152, 0, '2008-12-08', 13, 2, 'O Brother, Where Bart Thou?', 1);
INSERT INTO public.episodios VALUES (153, 0, '2009-01-05', 14, 2, 'In the Realm of the Basses', 1);
INSERT INTO public.episodios VALUES (154, 0, '2009-01-12', 15, 2, 'Gone with the Will', 1);
INSERT INTO public.episodios VALUES (155, 0, '2009-01-19', 16, 2, 'You''ve Got Yale!', 1);
INSERT INTO public.episodios VALUES (156, 7.6, '2009-02-02', 17, 2, 'Carrnal Knowledge', 1);
INSERT INTO public.episodios VALUES (157, 0, '2009-03-16', 18, 2, 'The Age of Dissonance', 1);
INSERT INTO public.episodios VALUES (158, 0, '2009-03-23', 19, 2, 'The Grandfather', 1);
INSERT INTO public.episodios VALUES (159, 0, '2009-03-30', 20, 2, 'Remains of the J', 1);
INSERT INTO public.episodios VALUES (160, 7.7, '2009-04-20', 21, 2, 'Seder Anything', 1);
INSERT INTO public.episodios VALUES (161, 0, '2009-04-27', 22, 2, 'Southern Gentlemen Prefer Blondes', 1);
INSERT INTO public.episodios VALUES (162, 7.9, '2009-05-04', 23, 2, 'The Wrath of Con', 1);
INSERT INTO public.episodios VALUES (163, 0, '2009-05-11', 24, 2, 'Valley Girls', 1);
INSERT INTO public.episodios VALUES (164, 0, '2009-05-18', 25, 2, 'The Goodbye Gossip Girl', 1);
INSERT INTO public.episodios VALUES (165, 7.4, '2009-09-14', 1, 3, 'Reversals of Fortune', 1);
INSERT INTO public.episodios VALUES (166, 0, '2009-09-21', 2, 3, 'The Freshmen', 1);
INSERT INTO public.episodios VALUES (167, 0, '2009-09-28', 3, 3, 'The Lost Boy', 1);
INSERT INTO public.episodios VALUES (168, 0, '2009-10-05', 4, 3, 'Dan de Fleurette', 1);
INSERT INTO public.episodios VALUES (169, 0, '2009-10-12', 5, 3, 'Rufus Getting Married', 1);
INSERT INTO public.episodios VALUES (170, 0, '2009-10-19', 6, 3, 'Enough About Eve', 1);
INSERT INTO public.episodios VALUES (171, 0, '2009-10-26', 7, 3, 'How to Succeed in Bassness', 1);
INSERT INTO public.episodios VALUES (172, 0, '2009-11-02', 8, 3, 'The Grandfather: Part II', 1);
INSERT INTO public.episodios VALUES (173, 7.7, '2009-11-09', 9, 3, 'They Shoot Humphreys, Don''t They?', 1);
INSERT INTO public.episodios VALUES (174, 0, '2009-11-16', 10, 3, 'The Last Days of Disco Stick', 1);
INSERT INTO public.episodios VALUES (175, 0, '2009-11-30', 11, 3, 'The Treasure of Serena Madre', 1);
INSERT INTO public.episodios VALUES (176, 0, '2009-12-07', 12, 3, 'The Debarted', 1);
INSERT INTO public.episodios VALUES (177, 0, '2010-03-08', 13, 3, 'The Hurt Locket', 1);
INSERT INTO public.episodios VALUES (178, 0, '2010-03-15', 14, 3, 'The Lady Vanished', 1);
INSERT INTO public.episodios VALUES (179, 0, '2010-03-22', 15, 3, 'The Sixteen Year Old Virgin', 1);
INSERT INTO public.episodios VALUES (180, 0, '2010-03-29', 16, 3, 'The Empire Strikes Jack', 1);
INSERT INTO public.episodios VALUES (181, 0, '2010-04-05', 17, 3, 'Inglourious Bassterds', 1);
INSERT INTO public.episodios VALUES (182, 0, '2010-04-12', 18, 3, 'The Unblairable Lightness of Being', 1);
INSERT INTO public.episodios VALUES (183, 0, '2010-04-26', 19, 3, 'Dr. Estrangeloved', 1);
INSERT INTO public.episodios VALUES (184, 0, '2010-05-03', 20, 3, 'It''s a Dad, Dad, Dad, Dad World', 1);
INSERT INTO public.episodios VALUES (185, 0, '2010-05-10', 21, 3, 'Ex-Husbands and Wives', 1);
INSERT INTO public.episodios VALUES (186, 0, '2010-05-17', 22, 3, 'Last Tango, Then Paris', 1);
INSERT INTO public.episodios VALUES (187, 0, '2010-09-13', 1, 4, 'Belles de Jour', 1);
INSERT INTO public.episodios VALUES (188, 0, '2010-09-20', 2, 4, 'Double Identity', 1);
INSERT INTO public.episodios VALUES (189, 0, '2010-09-27', 3, 4, 'The Undergraduates', 1);
INSERT INTO public.episodios VALUES (190, 0, '2010-10-04', 4, 4, 'Touch of Eva', 1);
INSERT INTO public.episodios VALUES (191, 7.4, '2010-10-11', 5, 4, 'Goodbye, Columbia', 1);
INSERT INTO public.episodios VALUES (192, 0, '2010-10-25', 6, 4, 'Easy J', 1);
INSERT INTO public.episodios VALUES (193, 0, '2010-11-01', 7, 4, 'War at the Roses', 1);
INSERT INTO public.episodios VALUES (194, 0, '2010-11-08', 8, 4, 'Juliet Doesn''t Live Here Anymore', 1);
INSERT INTO public.episodios VALUES (195, 7.9, '2010-11-15', 9, 4, 'The Witches of Bushwick', 1);
INSERT INTO public.episodios VALUES (196, 0, '2010-11-29', 10, 4, 'Gaslit', 1);
INSERT INTO public.episodios VALUES (197, 0, '2010-12-06', 11, 4, 'The Townie', 1);
INSERT INTO public.episodios VALUES (198, 0, '2011-01-24', 12, 4, 'The Kids Are Not All Right', 1);
INSERT INTO public.episodios VALUES (199, 0, '2011-01-31', 13, 4, 'Damien Darko', 1);
INSERT INTO public.episodios VALUES (200, 0, '2011-02-07', 14, 4, 'Panic Roommate', 1);
INSERT INTO public.episodios VALUES (201, 0, '2011-02-14', 15, 4, 'It-Girl Happened One Night', 1);
INSERT INTO public.episodios VALUES (202, 0, '2011-02-21', 16, 4, 'While You Weren''t Sleeping', 1);
INSERT INTO public.episodios VALUES (203, 7.7, '2011-02-28', 17, 4, 'Empire of the Son', 1);
INSERT INTO public.episodios VALUES (204, 0, '2011-04-18', 18, 4, 'The Kids Stay in the Picture', 1);
INSERT INTO public.episodios VALUES (205, 0, '2011-04-25', 19, 4, 'Petty in Pink', 1);
INSERT INTO public.episodios VALUES (206, 0, '2011-05-02', 20, 4, 'The Princesses and the Frog', 1);
INSERT INTO public.episodios VALUES (207, 0, '2011-05-09', 21, 4, 'Shattered Bass', 1);
INSERT INTO public.episodios VALUES (208, 0, '2011-05-16', 22, 4, 'The Wrong Goodbye', 1);
INSERT INTO public.episodios VALUES (209, 0, '2011-09-26', 1, 5, 'Yes, Then Zero', 1);
INSERT INTO public.episodios VALUES (210, 0, '2011-10-03', 2, 5, 'Beauty and the Feast', 1);
INSERT INTO public.episodios VALUES (211, 7.5, '2011-10-10', 3, 5, 'The Jewel of Denial', 1);
INSERT INTO public.episodios VALUES (212, 0, '2011-10-17', 4, 5, 'Memoirs of an Invisible Dan', 1);
INSERT INTO public.episodios VALUES (213, 0, '2011-10-24', 5, 5, 'The Fasting and the Furious', 1);
INSERT INTO public.episodios VALUES (214, 7.6, '2011-11-07', 6, 5, 'I Am Number Nine', 1);
INSERT INTO public.episodios VALUES (215, 0, '2011-11-14', 7, 5, 'The Big Sleep No More', 1);
INSERT INTO public.episodios VALUES (216, 0, '2011-11-21', 8, 5, 'All the Pretty Sources', 1);
INSERT INTO public.episodios VALUES (217, 7.3, '2011-11-28', 9, 5, 'Rhodes to Perdition', 1);
INSERT INTO public.episodios VALUES (218, 0, '2011-12-05', 10, 5, 'Riding in Town Cars with Boys', 1);
INSERT INTO public.episodios VALUES (219, 0, '2012-01-16', 11, 5, 'The End of the Affair?', 1);
INSERT INTO public.episodios VALUES (220, 0, '2012-01-23', 12, 5, 'Father and the Bride', 1);
INSERT INTO public.episodios VALUES (221, 0, '2012-01-30', 13, 5, 'G.G.', 1);
INSERT INTO public.episodios VALUES (222, 0, '2012-02-06', 14, 5, 'The Backup Dan', 1);
INSERT INTO public.episodios VALUES (223, 7.5, '2012-02-13', 15, 5, 'Crazy, Cupid, Love', 1);
INSERT INTO public.episodios VALUES (224, 0, '2012-02-20', 16, 5, 'Cross Rhodes', 1);
INSERT INTO public.episodios VALUES (225, 0, '2012-02-27', 17, 5, 'The Princess Dowry', 1);
INSERT INTO public.episodios VALUES (226, 0, '2012-04-02', 18, 5, 'Con-Heir', 1);
INSERT INTO public.episodios VALUES (227, 0, '2012-04-09', 19, 5, 'It Girl, Interrupted', 1);
INSERT INTO public.episodios VALUES (228, 7.4, '2012-04-16', 20, 5, 'Salon of the Dead', 1);
INSERT INTO public.episodios VALUES (229, 0, '2012-04-23', 21, 5, 'Despicable B', 1);
INSERT INTO public.episodios VALUES (230, 0, '2012-04-30', 22, 5, 'Raiders of the Lost Art', 1);
INSERT INTO public.episodios VALUES (231, 7.5, '2012-05-07', 23, 5, 'The Fugitives', 1);
INSERT INTO public.episodios VALUES (232, 0, '2012-05-14', 24, 5, 'The Return of the Ring', 1);
INSERT INTO public.episodios VALUES (233, 0, '2012-10-08', 1, 6, 'Gone Maybe Gone', 1);
INSERT INTO public.episodios VALUES (234, 0, '2012-10-15', 2, 6, 'High Infidelity', 1);
INSERT INTO public.episodios VALUES (235, 0, '2012-10-22', 3, 6, 'Dirty Rotten Scandals', 1);
INSERT INTO public.episodios VALUES (236, 0, '2012-11-05', 4, 6, 'Portrait of a Lady Alexander', 1);
INSERT INTO public.episodios VALUES (237, 7.1, '2012-11-12', 5, 6, 'Monstrous Ball', 1);
INSERT INTO public.episodios VALUES (238, 7.5, '2012-11-19', 6, 6, 'Where the Vile Things Are', 1);
INSERT INTO public.episodios VALUES (239, 0, '2012-11-26', 7, 6, 'Save the Last Chance', 1);
INSERT INTO public.episodios VALUES (240, 0, '2012-12-03', 8, 6, 'It''s Really Complicated', 1);
INSERT INTO public.episodios VALUES (241, 0, '2012-12-10', 9, 6, 'The Revengers', 1);
INSERT INTO public.episodios VALUES (242, 9, '2012-12-17', 10, 6, 'New York, I Love You XOXO', 1);
INSERT INTO public.episodios VALUES (354, 0, '2003-09-28', 1, 6, 'Valhalley of the Dolls: Part 1', 3);
INSERT INTO public.episodios VALUES (355, 0, '2003-09-28', 2, 6, 'Valhalley of the Dolls: Part 2', 3);
INSERT INTO public.episodios VALUES (356, 0, '2003-10-05', 3, 6, 'Forget Me... Not', 3);
INSERT INTO public.episodios VALUES (357, 0, '2003-10-12', 4, 6, 'The Power of Three Blondes', 3);
INSERT INTO public.episodios VALUES (358, 0, '2003-10-19', 5, 6, 'Love''s a Witch', 3);
INSERT INTO public.episodios VALUES (359, 7.5, '2003-10-26', 6, 6, 'My Three Witches', 3);
INSERT INTO public.episodios VALUES (360, 0, '2003-11-02', 7, 6, 'Soul Survivor', 3);
INSERT INTO public.episodios VALUES (361, 0, '2003-11-09', 8, 6, 'Sword and the City', 3);
INSERT INTO public.episodios VALUES (362, 0, '2003-11-16', 9, 6, 'Little Monsters', 3);
INSERT INTO public.episodios VALUES (363, 8.4, '2003-11-23', 10, 6, 'Chris-Crossed', 3);
INSERT INTO public.episodios VALUES (364, 7.6, '2004-01-11', 11, 6, 'Witchstock', 3);
INSERT INTO public.episodios VALUES (365, 7.2, '2004-01-18', 12, 6, 'Prince Charmed', 3);
INSERT INTO public.episodios VALUES (366, 0, '2004-01-25', 13, 6, 'Used Karma', 3);
INSERT INTO public.episodios VALUES (367, 0, '2004-02-08', 14, 6, 'The Legend of Sleepy Halliwell', 3);
INSERT INTO public.episodios VALUES (368, 0, '2004-02-15', 15, 6, 'I Dream of Phoebe', 3);
INSERT INTO public.episodios VALUES (369, 0, '2004-02-22', 16, 6, 'The Courtship of Wyatt''s Father', 3);
INSERT INTO public.episodios VALUES (370, 0, '2004-03-14', 17, 6, 'Hyde School Reunion', 3);
INSERT INTO public.episodios VALUES (371, 0, '2004-04-18', 18, 6, 'Spin City', 3);
INSERT INTO public.episodios VALUES (372, 0, '2004-04-25', 19, 6, 'Crimes & Witch Demeanors', 3);
INSERT INTO public.episodios VALUES (373, 0, '2004-05-02', 20, 6, 'A Wrong Day''s Journey Into Right', 3);
INSERT INTO public.episodios VALUES (374, 0, '2004-05-09', 21, 6, 'Witch Wars', 3);
INSERT INTO public.episodios VALUES (375, 0, '2004-05-16', 22, 6, 'It''s a Bad, Bad, Bad, Bad World: Part 1', 3);
INSERT INTO public.episodios VALUES (376, 8.5, '2004-05-16', 23, 6, 'It''s a Bad, Bad, Bad, Bad World: Part 2', 3);
INSERT INTO public.episodios VALUES (377, 0, '2004-09-12', 1, 7, 'A Call to Arms', 3);
INSERT INTO public.episodios VALUES (378, 0, '2004-09-19', 2, 7, 'The Bare Witch Project', 3);
INSERT INTO public.episodios VALUES (379, 0, '2004-09-26', 3, 7, 'Cheaper by the Coven', 3);
INSERT INTO public.episodios VALUES (380, 0, '2004-10-03', 4, 7, 'Charrrmed!', 3);
INSERT INTO public.episodios VALUES (381, 0, '2004-10-10', 5, 7, 'Styx Feet Under', 3);
INSERT INTO public.episodios VALUES (382, 0, '2004-10-17', 6, 7, 'Once in a Blue Moon', 3);
INSERT INTO public.episodios VALUES (383, 0, '2004-10-31', 7, 7, 'Someone to Witch Over Me', 3);
INSERT INTO public.episodios VALUES (384, 0, '2004-11-14', 8, 7, 'Charmed Noir', 3);
INSERT INTO public.episodios VALUES (385, 7.8, '2004-11-21', 9, 7, 'There''s Something About Leo', 3);
INSERT INTO public.episodios VALUES (386, 8.3, '2004-11-28', 10, 7, 'Witchness Protection', 3);
INSERT INTO public.episodios VALUES (387, 0, '2005-01-16', 11, 7, 'Ordinary Witches', 3);
INSERT INTO public.episodios VALUES (388, 0, '2005-01-23', 12, 7, 'Extreme Makeover World Edition', 3);
INSERT INTO public.episodios VALUES (389, 0, '2005-01-30', 13, 7, 'Charmageddon', 3);
INSERT INTO public.episodios VALUES (390, 0, '2005-02-13', 14, 7, 'Carpe Demon', 3);
INSERT INTO public.episodios VALUES (391, 0, '2005-02-20', 15, 7, 'Show Ghouls', 3);
INSERT INTO public.episodios VALUES (392, 8.4, '2005-04-10', 16, 7, 'The Seven Year Witch', 3);
INSERT INTO public.episodios VALUES (393, 0, '2005-04-17', 17, 7, 'Scry Hard', 3);
INSERT INTO public.episodios VALUES (394, 0, '2005-04-24', 18, 7, 'Little Box of Horrors', 3);
INSERT INTO public.episodios VALUES (395, 0, '2005-05-01', 19, 7, 'Freaky Phoebe', 3);
INSERT INTO public.episodios VALUES (396, 0, '2005-05-08', 20, 7, 'Imaginary Fiends', 3);
INSERT INTO public.episodios VALUES (397, 7.8, '2005-05-15', 21, 7, 'Death Becomes Them', 3);
INSERT INTO public.episodios VALUES (398, 0, '2005-05-22', 22, 7, 'Something Wicca This Way Goes', 3);
INSERT INTO public.episodios VALUES (399, 7.4, '2005-09-25', 1, 8, 'Still Charmed and Kicking', 3);
INSERT INTO public.episodios VALUES (400, 6.5, '2005-10-02', 2, 8, 'Malice in Wonderland', 3);
INSERT INTO public.episodios VALUES (401, 0, '2005-10-09', 3, 8, 'Run, Piper, Run', 3);
INSERT INTO public.episodios VALUES (402, 0, '2005-10-16', 4, 8, 'Desperate Housewitches', 3);
INSERT INTO public.episodios VALUES (403, 0, '2005-10-23', 5, 8, 'Rewitched', 3);
INSERT INTO public.episodios VALUES (404, 0, '2005-10-30', 6, 8, 'Kill Billie: Vol.1', 3);
INSERT INTO public.episodios VALUES (405, 0, '2005-11-06', 7, 8, 'The Lost Picture Show', 3);
INSERT INTO public.episodios VALUES (406, 0, '2005-11-13', 8, 8, 'Battle of the Hexes', 3);
INSERT INTO public.episodios VALUES (407, 6.8, '2005-11-20', 9, 8, 'Hulkus Pocus', 3);
INSERT INTO public.episodios VALUES (408, 0, '2005-11-27', 10, 8, 'Vaya Con Leos', 3);
INSERT INTO public.episodios VALUES (409, 6.7, '2006-01-08', 11, 8, 'Mr. & Mrs. Witch', 3);
INSERT INTO public.episodios VALUES (410, 0, '2006-01-15', 12, 8, 'Payback''s a Witch', 3);
INSERT INTO public.episodios VALUES (411, 0, '2006-01-22', 13, 8, 'Repo Manor', 3);
INSERT INTO public.episodios VALUES (412, 7.2, '2006-02-12', 14, 8, '12 Angry Zen', 3);
INSERT INTO public.episodios VALUES (413, 7.1, '2006-02-19', 15, 8, 'The Last Temptation of Christy', 3);
INSERT INTO public.episodios VALUES (414, 0, '2006-02-26', 16, 8, 'Engaged and Confused', 3);
INSERT INTO public.episodios VALUES (415, 7.1, '2006-04-16', 17, 8, 'Generation Hex', 3);
INSERT INTO public.episodios VALUES (416, 0, '2006-04-23', 18, 8, 'The Torn Identity', 3);
INSERT INTO public.episodios VALUES (417, 7.2, '2006-04-30', 19, 8, 'The Jung and the Restless', 3);
INSERT INTO public.episodios VALUES (418, 0, '2006-05-07', 20, 8, 'Gone with the Witches', 3);
INSERT INTO public.episodios VALUES (419, 8.4, '2006-05-14', 21, 8, 'Kill Billie: Vol. 2', 3);
INSERT INTO public.episodios VALUES (420, 9.1, '2006-05-21', 22, 8, 'Forever Charmed', 3);
INSERT INTO public.episodios VALUES (421, 8.5, '2005-09-13', 1, 1, 'Pilot', 2);
INSERT INTO public.episodios VALUES (422, 7.8, '2005-09-20', 2, 1, 'Wendigo', 2);
INSERT INTO public.episodios VALUES (423, 7.9, '2005-09-27', 3, 1, 'Dead in the Water', 2);
INSERT INTO public.episodios VALUES (424, 8, '2005-10-04', 4, 1, 'Phantom Traveler', 2);
INSERT INTO public.episodios VALUES (425, 8.2, '2005-10-11', 5, 1, 'Bloody Mary', 2);
INSERT INTO public.episodios VALUES (426, 8.2, '2005-10-18', 6, 1, 'Skin', 2);
INSERT INTO public.episodios VALUES (427, 7.8, '2005-10-25', 7, 1, 'Hook Man', 2);
INSERT INTO public.episodios VALUES (428, 6.8, '2005-11-08', 8, 1, 'Bugs', 2);
INSERT INTO public.episodios VALUES (429, 8.8, '2005-11-15', 9, 1, 'Home', 2);
INSERT INTO public.episodios VALUES (430, 8.3, '2005-11-22', 10, 1, 'Asylum', 2);
INSERT INTO public.episodios VALUES (431, 8.6, '2006-01-10', 11, 1, 'Scarecrow', 2);
INSERT INTO public.episodios VALUES (432, 8.7, '2006-01-17', 12, 1, 'Faith', 2);
INSERT INTO public.episodios VALUES (433, 7.3, '2006-01-31', 13, 1, 'Route 666', 2);
INSERT INTO public.episodios VALUES (434, 8.1, '2006-02-07', 14, 1, 'Nightmare', 2);
INSERT INTO public.episodios VALUES (435, 0, '2006-02-14', 15, 1, 'The Benders', 2);
INSERT INTO public.episodios VALUES (436, 8.5, '2006-02-28', 16, 1, 'Shadow', 2);
INSERT INTO public.episodios VALUES (437, 8.2, '2006-03-30', 17, 1, 'Hell House', 2);
INSERT INTO public.episodios VALUES (438, 8.5, '2006-04-06', 18, 1, 'Something Wicked', 2);
INSERT INTO public.episodios VALUES (439, 8.6, '2006-04-13', 19, 1, 'Provenance', 2);
INSERT INTO public.episodios VALUES (440, 8.4, '2006-04-20', 20, 1, 'Dead Man''s Blood', 2);
INSERT INTO public.episodios VALUES (441, 8.8, '2006-04-27', 21, 1, 'Salvation', 2);
INSERT INTO public.episodios VALUES (442, 9.2, '2006-05-04', 22, 1, 'Devil''s Trap', 2);
INSERT INTO public.episodios VALUES (443, 9.2, '2006-09-28', 1, 2, 'In My Time of Dying', 2);
INSERT INTO public.episodios VALUES (444, 8.1, '2006-10-05', 2, 2, 'Everybody Loves a Clown', 2);
INSERT INTO public.episodios VALUES (445, 8.2, '2006-10-12', 3, 2, 'Bloodlust', 2);
INSERT INTO public.episodios VALUES (446, 7.9, '2006-10-19', 4, 2, 'Children Shouldn''t Play with Dead Things', 2);
INSERT INTO public.episodios VALUES (447, 8.4, '2006-10-26', 5, 2, 'Simon Said', 2);
INSERT INTO public.episodios VALUES (448, 8.2, '2006-11-02', 6, 2, 'No Exit', 2);
INSERT INTO public.episodios VALUES (449, 8.5, '2006-11-09', 7, 2, 'The Usual Suspects', 2);
INSERT INTO public.episodios VALUES (450, 8.7, '2006-11-16', 8, 2, 'Crossroad Blues', 2);
INSERT INTO public.episodios VALUES (451, 8.6, '2006-12-07', 9, 2, 'Croatoan', 2);
INSERT INTO public.episodios VALUES (452, 8.4, '2007-01-11', 10, 2, 'Hunted', 2);
INSERT INTO public.episodios VALUES (453, 8.3, '2007-01-18', 11, 2, 'Playthings', 2);
INSERT INTO public.episodios VALUES (454, 8.9, '2007-01-25', 12, 2, 'Nightshifter', 2);
INSERT INTO public.episodios VALUES (455, 7.9, '2007-02-01', 13, 2, 'Houses of the Holy', 2);
INSERT INTO public.episodios VALUES (456, 8.7, '2007-02-08', 14, 2, 'Born Under a Bad Sign', 2);
INSERT INTO public.episodios VALUES (457, 9.1, '2007-02-15', 15, 2, 'Tall Tales', 2);
INSERT INTO public.episodios VALUES (458, 8.8, '2007-03-15', 16, 2, 'Roadkill', 2);
INSERT INTO public.episodios VALUES (459, 8.7, '2007-03-22', 17, 2, 'Heart', 2);
INSERT INTO public.episodios VALUES (460, 8.4, '2007-04-19', 18, 2, 'Hollywood Babylon', 2);
INSERT INTO public.episodios VALUES (461, 8.6, '2007-04-26', 19, 2, 'Folsom Prison Blues', 2);
INSERT INTO public.episodios VALUES (462, 9.3, '2007-05-03', 20, 2, 'What Is and What Should Never Be', 2);
INSERT INTO public.episodios VALUES (463, 9.1, '2007-05-10', 21, 2, 'All Hell Breaks Loose: Part 1', 2);
INSERT INTO public.episodios VALUES (464, 9.4, '2007-05-17', 22, 2, 'All Hell Breaks Loose: Part 2', 2);
INSERT INTO public.episodios VALUES (465, 8.5, '2007-10-04', 1, 3, 'The Magnificent Seven', 2);
INSERT INTO public.episodios VALUES (466, 8.6, '2007-10-11', 2, 3, 'The Kids Are Alright', 2);
INSERT INTO public.episodios VALUES (467, 9.2, '2007-10-18', 3, 3, 'Bad Day at Black Rock', 2);
INSERT INTO public.episodios VALUES (468, 8.2, '2007-10-25', 4, 3, 'Sin City', 2);
INSERT INTO public.episodios VALUES (469, 8.3, '2007-11-01', 5, 3, 'Bedtime Stories', 2);
INSERT INTO public.episodios VALUES (470, 8, '2007-11-08', 6, 3, 'Red Sky at Morning', 2);
INSERT INTO public.episodios VALUES (471, 8.4, '2007-11-15', 7, 3, 'Fresh Blood', 2);
INSERT INTO public.episodios VALUES (472, 8.6, '2007-12-13', 8, 3, 'A Very Supernatural Christmas', 2);
INSERT INTO public.episodios VALUES (473, 8.4, '2008-01-31', 9, 3, 'Malleus Maleficarum', 2);
INSERT INTO public.episodios VALUES (474, 8.4, '2008-02-07', 10, 3, 'Dream a Little Dream of Me', 2);
INSERT INTO public.episodios VALUES (475, 9.4, '2008-02-14', 11, 3, 'Mystery Spot', 2);
INSERT INTO public.episodios VALUES (476, 9.3, '2008-02-21', 12, 3, 'Jus in Bello', 2);
INSERT INTO public.episodios VALUES (477, 7.6, '2008-04-24', 13, 3, 'Ghostfacers', 2);
INSERT INTO public.episodios VALUES (478, 7.8, '2008-05-01', 14, 3, 'Long Distance Call', 2);
INSERT INTO public.episodios VALUES (479, 8.4, '2008-05-08', 15, 3, 'Time Is on My Side', 2);
INSERT INTO public.episodios VALUES (480, 0, '2008-05-15', 16, 3, 'No Rest for the Wicked', 2);
INSERT INTO public.episodios VALUES (481, 9.4, '2008-09-18', 1, 4, 'Lazarus Rising', 2);
INSERT INTO public.episodios VALUES (482, 8.5, '2008-09-25', 2, 4, 'Are You There, God? It''s Me, Dean Winchester', 2);
INSERT INTO public.episodios VALUES (483, 9.2, '2008-10-02', 3, 4, 'In the Beginning', 2);
INSERT INTO public.episodios VALUES (484, 8, '2008-10-09', 4, 4, 'Metamorphosis', 2);
INSERT INTO public.episodios VALUES (485, 8.4, '2008-10-16', 5, 4, 'Monster Movie', 2);
INSERT INTO public.episodios VALUES (486, 9.1, '2008-10-23', 6, 4, 'Yellow Fever', 2);
INSERT INTO public.episodios VALUES (487, 8.4, '2008-10-30', 7, 4, 'It''s the Great Pumpkin, Sam Winchester', 2);
INSERT INTO public.episodios VALUES (488, 8.6, '2008-11-06', 8, 4, 'Wishful Thinking', 2);
INSERT INTO public.episodios VALUES (489, 8.6, '2008-11-13', 9, 4, 'I Know What You Did Last Summer', 2);
INSERT INTO public.episodios VALUES (490, 8.8, '2008-11-20', 10, 4, 'Heaven and Hell', 2);
INSERT INTO public.episodios VALUES (491, 7.9, '2009-01-15', 11, 4, 'Family Remains', 2);
INSERT INTO public.episodios VALUES (492, 7.9, '2009-01-22', 12, 4, 'Criss Angel Is a Douche Bag', 2);
INSERT INTO public.episodios VALUES (493, 8.6, '2009-01-29', 13, 4, 'After School Special', 2);
INSERT INTO public.episodios VALUES (494, 8.3, '2009-02-05', 14, 4, 'Sex and Violence', 2);
INSERT INTO public.episodios VALUES (495, 8.6, '2009-03-12', 15, 4, 'Death Takes a Holiday', 2);
INSERT INTO public.episodios VALUES (496, 9.1, '2009-03-19', 16, 4, 'On the Head of a Pin', 2);
INSERT INTO public.episodios VALUES (497, 8.6, '2009-03-26', 17, 4, 'It''s a Terrible Life', 2);
INSERT INTO public.episodios VALUES (498, 9.2, '2009-04-02', 18, 4, 'The Monster at the End of This Book', 2);
INSERT INTO public.episodios VALUES (499, 8.2, '2009-04-23', 19, 4, 'Jump the Shark', 2);
INSERT INTO public.episodios VALUES (500, 8.7, '2009-04-30', 20, 4, 'The Rapture', 2);
INSERT INTO public.episodios VALUES (501, 8.5, '2009-05-07', 21, 4, 'When the Levee Breaks', 2);
INSERT INTO public.episodios VALUES (502, 9.3, '2009-05-14', 22, 4, 'Lucifer Rising', 2);
INSERT INTO public.episodios VALUES (503, 8.7, '2009-09-10', 1, 5, 'Sympathy for the Devil', 2);
INSERT INTO public.episodios VALUES (504, 8.6, '2009-09-17', 2, 5, 'Good God, Y''All', 2);
INSERT INTO public.episodios VALUES (505, 8.5, '2009-09-24', 3, 5, 'Free to Be You and Me', 2);
INSERT INTO public.episodios VALUES (506, 9.1, '2009-10-01', 4, 5, 'The End', 2);
INSERT INTO public.episodios VALUES (507, 0, '2009-10-08', 5, 5, 'Fallen Idols', 2);
INSERT INTO public.episodios VALUES (508, 8.5, '2009-10-15', 6, 5, 'I Believe the Children Are Our Future', 2);
INSERT INTO public.episodios VALUES (509, 8.7, '2009-10-29', 7, 5, 'The Curious Case of Dean Winchester', 2);
INSERT INTO public.episodios VALUES (510, 9.6, '2009-11-05', 8, 5, 'Changing Channels', 2);
INSERT INTO public.episodios VALUES (511, 8.8, '2009-11-12', 9, 5, 'The Real Ghostbusters', 2);
INSERT INTO public.episodios VALUES (512, 9.2, '2009-11-19', 10, 5, 'Abandon All Hope', 2);
INSERT INTO public.episodios VALUES (513, 8.5, '2010-01-21', 11, 5, 'Sam, Interrupted', 2);
INSERT INTO public.episodios VALUES (514, 8.2, '2010-01-28', 12, 5, 'Swap Meat', 2);
INSERT INTO public.episodios VALUES (515, 9, '2010-02-04', 13, 5, 'The Song Remains the Same', 2);
INSERT INTO public.episodios VALUES (516, 8.8, '2010-02-11', 14, 5, 'My Bloody Valentine', 2);
INSERT INTO public.episodios VALUES (517, 8.4, '2010-03-25', 15, 5, 'Dead Men Don''t Wear Plaid', 2);
INSERT INTO public.episodios VALUES (518, 8.7, '2010-04-01', 16, 5, 'Dark Side of the Moon', 2);
INSERT INTO public.episodios VALUES (519, 8.3, '2010-04-08', 17, 5, '99 Problems', 2);
INSERT INTO public.episodios VALUES (520, 8.9, '2010-04-15', 18, 5, 'Point of No Return', 2);
INSERT INTO public.episodios VALUES (521, 9, '2010-04-22', 19, 5, 'Hammer of the Gods', 2);
INSERT INTO public.episodios VALUES (522, 8.6, '2010-04-29', 20, 5, 'The Devil You Know', 2);
INSERT INTO public.episodios VALUES (523, 9.2, '2010-05-06', 21, 5, 'Two Minutes to Midnight', 2);
INSERT INTO public.episodios VALUES (524, 9.7, '2010-05-13', 22, 5, 'Swan Song', 2);
INSERT INTO public.episodios VALUES (525, 7.6, '2010-09-24', 1, 6, 'Exile on Main St.', 2);
INSERT INTO public.episodios VALUES (526, 7.8, '2010-10-01', 2, 6, 'Two and a Half Men', 2);
INSERT INTO public.episodios VALUES (527, 8.1, '2010-10-08', 3, 6, 'The Third Man', 2);
INSERT INTO public.episodios VALUES (528, 0, '2010-10-15', 4, 6, 'Weekend at Bobby''s', 2);
INSERT INTO public.episodios VALUES (529, 8.3, '2010-10-22', 5, 6, 'Live Free or Twi-hard', 2);
INSERT INTO public.episodios VALUES (530, 8.4, '2010-10-29', 6, 6, 'You Can''t Handle the Truth', 2);
INSERT INTO public.episodios VALUES (531, 8, '2010-11-05', 7, 6, 'Family Matters', 2);
INSERT INTO public.episodios VALUES (532, 7.7, '2010-11-12', 8, 6, 'All Dogs Go to Heaven', 2);
INSERT INTO public.episodios VALUES (533, 8.4, '2010-11-19', 9, 6, 'Clap Your Hands If You Believe', 2);
INSERT INTO public.episodios VALUES (534, 8.5, '2010-12-03', 10, 6, 'Caged Heat', 2);
INSERT INTO public.episodios VALUES (535, 9.1, '2010-12-10', 11, 6, 'Appointment in Samarra', 2);
INSERT INTO public.episodios VALUES (536, 8.2, '2011-02-04', 12, 6, 'Like a Virgin', 2);
INSERT INTO public.episodios VALUES (537, 7.9, '2011-02-11', 13, 6, 'Unforgiven', 2);
INSERT INTO public.episodios VALUES (538, 7.4, '2011-02-18', 14, 6, 'Mannequin 3: The Reckoning', 2);
INSERT INTO public.episodios VALUES (539, 9.6, '2011-02-25', 15, 6, 'The French Mistake', 2);
INSERT INTO public.episodios VALUES (540, 8.2, '2011-03-04', 16, 6, 'And Then There Were None', 2);
INSERT INTO public.episodios VALUES (541, 8.6, '2011-04-15', 17, 6, 'My Heart Will Go On', 2);
INSERT INTO public.episodios VALUES (542, 9, '2011-04-22', 18, 6, 'Frontierland', 2);
INSERT INTO public.episodios VALUES (543, 8.5, '2011-04-29', 19, 6, 'Mommy Dearest', 2);
INSERT INTO public.episodios VALUES (544, 8.9, '2011-05-06', 20, 6, 'The Man Who Would Be King', 2);
INSERT INTO public.episodios VALUES (545, 8.5, '2011-05-20', 21, 6, 'Let It Bleed', 2);
INSERT INTO public.episodios VALUES (546, 8.9, '2011-05-20', 22, 6, 'The Man Who Knew Too Much', 2);
INSERT INTO public.episodios VALUES (547, 9, '2011-09-23', 1, 7, 'Meet the New Boss', 2);
INSERT INTO public.episodios VALUES (548, 8.3, '2011-09-30', 2, 7, 'Hello, Cruel World', 2);
INSERT INTO public.episodios VALUES (549, 8, '2011-10-07', 3, 7, 'The Girl Next Door', 2);
INSERT INTO public.episodios VALUES (550, 7.9, '2011-10-14', 4, 7, 'Defending Your Life', 2);
INSERT INTO public.episodios VALUES (551, 8, '2011-10-21', 5, 7, 'Shut Up, Dr. Phil', 2);
INSERT INTO public.episodios VALUES (552, 8.6, '2011-10-28', 6, 7, 'Slash Fiction', 2);
INSERT INTO public.episodios VALUES (553, 7.9, '2011-11-04', 7, 7, 'The Mentalists', 2);
INSERT INTO public.episodios VALUES (554, 7.8, '2011-11-11', 8, 7, 'Season Seven, Time for a Wedding!', 2);
INSERT INTO public.episodios VALUES (555, 8.3, '2011-11-18', 9, 7, 'How to Win Friends and Influence Monsters', 2);
INSERT INTO public.episodios VALUES (556, 9.2, '2011-12-02', 10, 7, 'Death''s Door', 2);
INSERT INTO public.episodios VALUES (557, 8, '2012-01-06', 11, 7, 'Adventures in Babysitting', 2);
INSERT INTO public.episodios VALUES (558, 8.8, '2012-01-13', 12, 7, 'Time After Time', 2);
INSERT INTO public.episodios VALUES (559, 8, '2012-02-03', 13, 7, 'The Slice Girls', 2);
INSERT INTO public.episodios VALUES (560, 8, '2012-02-10', 14, 7, 'Plucky Pennywhistle''s Magical Menagerie', 2);
INSERT INTO public.episodios VALUES (561, 8.1, '2012-02-17', 15, 7, 'Repo Man', 2);
INSERT INTO public.episodios VALUES (562, 8, '2012-03-16', 16, 7, 'Out with the Old', 2);
INSERT INTO public.episodios VALUES (563, 8.9, '2012-03-23', 17, 7, 'The Born-Again Identity', 2);
INSERT INTO public.episodios VALUES (564, 8.4, '2012-03-30', 18, 7, 'Party On, Garth', 2);
INSERT INTO public.episodios VALUES (565, 8.4, '2012-04-20', 19, 7, 'Of Grave Importance', 2);
INSERT INTO public.episodios VALUES (566, 9, '2012-04-27', 20, 7, 'The Girl with the Dungeons and Dragons Tattoo', 2);
INSERT INTO public.episodios VALUES (567, 8.5, '2012-05-04', 21, 7, 'Reading is Fundamental', 2);
INSERT INTO public.episodios VALUES (568, 8.4, '2012-05-11', 22, 7, 'There Will Be Blood', 2);
INSERT INTO public.episodios VALUES (569, 8.7, '2012-05-18', 23, 7, 'Survival of the Fittest', 2);
INSERT INTO public.episodios VALUES (570, 8.2, '2012-10-03', 1, 8, 'We Need to Talk About Kevin', 2);
INSERT INTO public.episodios VALUES (571, 8.3, '2012-10-10', 2, 8, 'What''s Up, Tiger Mommy?', 2);
INSERT INTO public.episodios VALUES (572, 7.6, '2012-10-17', 3, 8, 'Heartache', 2);
INSERT INTO public.episodios VALUES (573, 7.1, '2012-10-24', 4, 8, 'Bitten', 2);
INSERT INTO public.episodios VALUES (574, 8, '2012-10-31', 5, 8, 'Blood Brother', 2);
INSERT INTO public.episodios VALUES (575, 7.9, '2012-11-07', 6, 8, 'Southern Comfort', 2);
INSERT INTO public.episodios VALUES (576, 8.3, '2012-11-14', 7, 8, 'A Little Slice of Kevin', 2);
INSERT INTO public.episodios VALUES (577, 8.8, '2012-11-28', 8, 8, 'Hunteri Heroici', 2);
INSERT INTO public.episodios VALUES (578, 8.2, '2012-12-05', 9, 8, 'Citizen Fang', 2);
INSERT INTO public.episodios VALUES (579, 8.2, '2013-01-16', 10, 8, 'Torn and Frayed', 2);
INSERT INTO public.episodios VALUES (580, 8.7, '2013-01-23', 11, 8, 'LARP and the Real Girl', 2);
INSERT INTO public.episodios VALUES (581, 9, '2013-01-30', 12, 8, 'As Time Goes By', 2);
INSERT INTO public.episodios VALUES (582, 8.4, '2013-02-06', 13, 8, 'Everybody Hates Hitler', 2);
INSERT INTO public.episodios VALUES (583, 8.5, '2013-02-13', 14, 8, 'Trial and Error', 2);
INSERT INTO public.episodios VALUES (584, 7.3, '2013-02-20', 15, 8, 'Man''s Best Friend with Benefits', 2);
INSERT INTO public.episodios VALUES (585, 7.6, '2013-02-27', 16, 8, 'Remember the Titans', 2);
INSERT INTO public.episodios VALUES (586, 8.5, '2013-03-20', 17, 8, 'Goodbye Stranger', 2);
INSERT INTO public.episodios VALUES (587, 7.4, '2013-03-27', 18, 8, 'Freaks and Geeks', 2);
INSERT INTO public.episodios VALUES (588, 8.6, '2013-04-03', 19, 8, 'Taxi Driver', 2);
INSERT INTO public.episodios VALUES (589, 8.4, '2013-04-24', 20, 8, 'Pac-Man Fever', 2);
INSERT INTO public.episodios VALUES (590, 8.5, '2013-05-01', 21, 8, 'The Great Escapist', 2);
INSERT INTO public.episodios VALUES (591, 8.5, '2013-05-08', 22, 8, 'Clip Show', 2);
INSERT INTO public.episodios VALUES (592, 9.3, '2013-05-15', 23, 8, 'Sacrifice', 2);
INSERT INTO public.episodios VALUES (593, 8.7, '2013-10-08', 1, 9, 'I Think I''m Gonna Like It Here', 2);
INSERT INTO public.episodios VALUES (594, 8.3, '2013-10-15', 2, 9, 'Devil May Care', 2);
INSERT INTO public.episodios VALUES (595, 8.3, '2013-10-22', 3, 9, 'I''m No Angel', 2);
INSERT INTO public.episodios VALUES (596, 8, '2013-10-29', 4, 9, 'Slumber Party', 2);
INSERT INTO public.episodios VALUES (597, 8.6, '2013-11-05', 5, 9, 'Dog Dean Afternoon', 2);
INSERT INTO public.episodios VALUES (598, 8.2, '2013-11-12', 6, 9, 'Heaven Can''t Wait', 2);
INSERT INTO public.episodios VALUES (599, 8.2, '2013-11-19', 7, 9, 'Bad Boys', 2);
INSERT INTO public.episodios VALUES (600, 7.8, '2013-11-26', 8, 9, 'Rock and a Hard Place', 2);
INSERT INTO public.episodios VALUES (601, 8.7, '2013-12-03', 9, 9, 'Holy Terror', 2);
INSERT INTO public.episodios VALUES (602, 8.9, '2014-01-14', 10, 9, 'Road Trip', 2);
INSERT INTO public.episodios VALUES (603, 9.1, '2014-01-21', 11, 9, 'First Born', 2);
INSERT INTO public.episodios VALUES (604, 7.4, '2014-01-28', 12, 9, 'Sharp Teeth', 2);
INSERT INTO public.episodios VALUES (605, 7.6, '2014-02-04', 13, 9, 'The Purge', 2);
INSERT INTO public.episodios VALUES (606, 8.1, '2014-02-25', 14, 9, 'Captives', 2);
INSERT INTO public.episodios VALUES (607, 7.2, '2014-03-04', 15, 9, '#thinman', 2);
INSERT INTO public.episodios VALUES (608, 8.3, '2014-03-18', 16, 9, 'Blade Runners', 2);
INSERT INTO public.episodios VALUES (609, 8.5, '2014-03-25', 17, 9, 'Mother''s Little Helper', 2);
INSERT INTO public.episodios VALUES (610, 8.2, '2014-04-15', 18, 9, 'Meta Fiction', 2);
INSERT INTO public.episodios VALUES (611, 7.5, '2014-04-22', 19, 9, 'Alex Annie Alexis Ann', 2);
INSERT INTO public.episodios VALUES (612, 5.8, '2014-04-29', 20, 9, 'Bloodlines', 2);
INSERT INTO public.episodios VALUES (613, 8.7, '2014-05-06', 21, 9, 'King of the Damned', 2);
INSERT INTO public.episodios VALUES (614, 8.4, '2014-05-13', 22, 9, 'Stairway to Heaven', 2);
INSERT INTO public.episodios VALUES (615, 9.2, '2014-05-20', 23, 9, 'Do You Believe in Miracles', 2);
INSERT INTO public.episodios VALUES (616, 8.3, '2014-10-07', 1, 10, 'Black', 2);
INSERT INTO public.episodios VALUES (617, 8.6, '2014-10-14', 2, 10, 'Reichenbach', 2);
INSERT INTO public.episodios VALUES (618, 8.3, '2014-10-21', 3, 10, 'Soul Survivor', 2);
INSERT INTO public.episodios VALUES (619, 7.1, '2014-10-28', 4, 10, 'Paper Moon', 2);
INSERT INTO public.episodios VALUES (620, 9.4, '2014-11-11', 5, 10, 'Fan Fiction', 2);
INSERT INTO public.episodios VALUES (621, 7.9, '2014-11-18', 6, 10, 'Ask Jeeves', 2);
INSERT INTO public.episodios VALUES (622, 8.2, '2014-11-25', 7, 10, 'Girls, Girls, Girls', 2);
INSERT INTO public.episodios VALUES (623, 7.8, '2014-12-02', 8, 10, 'Hibbing 911', 2);
INSERT INTO public.episodios VALUES (624, 8.1, '2014-12-09', 9, 10, 'The Things We Left Behind', 2);
INSERT INTO public.episodios VALUES (625, 7.8, '2015-01-20', 10, 10, 'The Hunter Games', 2);
INSERT INTO public.episodios VALUES (626, 7.8, '2015-01-27', 11, 10, 'There''s No Place Like Home', 2);
INSERT INTO public.episodios VALUES (627, 8.5, '2015-02-03', 12, 10, 'About a Boy', 2);
INSERT INTO public.episodios VALUES (628, 7.2, '2015-02-10', 13, 10, 'Halt & Catch Fire', 2);
INSERT INTO public.episodios VALUES (629, 8.8, '2015-02-17', 14, 10, 'The Executioner''s Song', 2);
INSERT INTO public.episodios VALUES (630, 7.9, '2015-03-18', 15, 10, 'The Things They Carried', 2);
INSERT INTO public.episodios VALUES (631, 7.2, '2015-03-25', 16, 10, 'Paint It Black', 2);
INSERT INTO public.episodios VALUES (632, 8.6, '2015-04-01', 17, 10, 'Inside Man', 2);
INSERT INTO public.episodios VALUES (633, 8.7, '2015-04-15', 18, 10, 'Book of the Damned', 2);
INSERT INTO public.episodios VALUES (634, 8.4, '2015-04-22', 19, 10, 'The Werther Project', 2);
INSERT INTO public.episodios VALUES (635, 8.2, '2015-04-29', 20, 10, 'Angel Heart', 2);
INSERT INTO public.episodios VALUES (636, 7.5, '2015-05-06', 21, 10, 'Dark Dynasty', 2);
INSERT INTO public.episodios VALUES (637, 9.1, '2015-05-13', 22, 10, 'The Prisoner', 2);
INSERT INTO public.episodios VALUES (638, 9.1, '2015-05-20', 23, 10, 'Brother''s Keeper', 2);
INSERT INTO public.episodios VALUES (639, 8.5, '2015-10-07', 1, 11, 'Out of the Darkness, Into the Fire', 2);
INSERT INTO public.episodios VALUES (640, 8.6, '2015-10-14', 2, 11, 'Form and Void', 2);
INSERT INTO public.episodios VALUES (641, 8.1, '2015-10-21', 3, 11, 'The Bad Seed', 2);
INSERT INTO public.episodios VALUES (642, 9.4, '2015-10-28', 4, 11, 'Baby', 2);
INSERT INTO public.episodios VALUES (643, 8.2, '2015-11-04', 5, 11, 'Thin Lizzie', 2);
INSERT INTO public.episodios VALUES (644, 8.4, '2015-11-11', 6, 11, 'Our Little World', 2);
INSERT INTO public.episodios VALUES (645, 8, '2015-11-18', 7, 11, 'Plush', 2);
INSERT INTO public.episodios VALUES (646, 8.8, '2015-12-02', 8, 11, 'Just My Imagination', 2);
INSERT INTO public.episodios VALUES (647, 9.2, '2015-12-09', 9, 11, 'O Brother, Where Art Thou?', 2);
INSERT INTO public.episodios VALUES (648, 9, '2016-01-20', 10, 11, 'The Devil in the Details', 2);
INSERT INTO public.episodios VALUES (649, 8.4, '2016-01-27', 11, 11, 'Into the Mystic', 2);
INSERT INTO public.episodios VALUES (650, 8.2, '2016-02-03', 12, 11, 'Don''t You Forget About Me', 2);
INSERT INTO public.episodios VALUES (651, 7.9, '2016-02-10', 13, 11, 'Love Hurts', 2);
INSERT INTO public.episodios VALUES (652, 8.7, '2016-02-17', 14, 11, 'The Vessel', 2);
INSERT INTO public.episodios VALUES (653, 7.7, '2016-02-24', 15, 11, 'Beyond the Mat', 2);
INSERT INTO public.episodios VALUES (654, 8.8, '2016-03-23', 16, 11, 'Safe House', 2);
INSERT INTO public.episodios VALUES (655, 8.2, '2016-03-30', 17, 11, 'Red Meat', 2);
INSERT INTO public.episodios VALUES (656, 8.8, '2016-04-06', 18, 11, 'Hell''s Angel', 2);
INSERT INTO public.episodios VALUES (657, 7.5, '2016-04-27', 19, 11, 'The Chitters', 2);
INSERT INTO public.episodios VALUES (658, 0, '2016-05-04', 20, 11, 'Don''t Call Me Shurley', 2);
INSERT INTO public.episodios VALUES (659, 8.8, '2016-05-11', 21, 11, 'All in the Family', 2);
INSERT INTO public.episodios VALUES (660, 8.8, '2016-05-18', 22, 11, 'We Happy Few', 2);
INSERT INTO public.episodios VALUES (661, 8.5, '2016-05-25', 23, 11, 'Alpha and Omega', 2);
INSERT INTO public.episodios VALUES (662, 8.3, '2016-10-13', 1, 12, 'Keep Calm and Carry On', 2);
INSERT INTO public.episodios VALUES (663, 8.1, '2016-10-20', 2, 12, 'Mamma Mia', 2);
INSERT INTO public.episodios VALUES (664, 7.9, '2016-10-27', 3, 12, 'The Foundry', 2);
INSERT INTO public.episodios VALUES (665, 8.1, '2016-11-03', 4, 12, 'American Nightmare', 2);
INSERT INTO public.episodios VALUES (666, 7.4, '2016-11-10', 5, 12, 'The One You''ve Been Waiting For', 2);
INSERT INTO public.episodios VALUES (667, 8.3, '2016-11-17', 6, 12, 'Celebrating the Life of Asa Fox', 2);
INSERT INTO public.episodios VALUES (668, 7.5, '2016-12-01', 7, 12, 'Rock Never Dies', 2);
INSERT INTO public.episodios VALUES (669, 8, '2016-12-08', 8, 12, 'LOTUS', 2);
INSERT INTO public.episodios VALUES (670, 8.1, '2017-01-26', 9, 12, 'First Blood', 2);
INSERT INTO public.episodios VALUES (671, 8.2, '2017-02-02', 10, 12, 'Lily Sunder Has Some Regrets', 2);
INSERT INTO public.episodios VALUES (672, 8.9, '2017-02-09', 11, 12, 'Regarding Dean', 2);
INSERT INTO public.episodios VALUES (673, 9, '2017-02-16', 12, 12, 'Stuck in the Middle (With You)', 2);
INSERT INTO public.episodios VALUES (674, 7.6, '2017-02-23', 13, 12, 'Family Feud', 2);
INSERT INTO public.episodios VALUES (675, 8.3, '2017-03-02', 14, 12, 'The Raid', 2);
INSERT INTO public.episodios VALUES (676, 8.2, '2017-03-09', 15, 12, 'Somewhere Between Heaven and Hell', 2);
INSERT INTO public.episodios VALUES (677, 7.9, '2017-03-30', 16, 12, 'Ladies Drink Free', 2);
INSERT INTO public.episodios VALUES (678, 8, '2017-04-06', 17, 12, 'The British Invasion', 2);
INSERT INTO public.episodios VALUES (679, 7.7, '2017-04-13', 18, 12, 'The Memory Remains', 2);
INSERT INTO public.episodios VALUES (680, 8.2, '2017-04-27', 19, 12, 'The Future', 2);
INSERT INTO public.episodios VALUES (681, 7.9, '2017-05-04', 20, 12, 'Twigs & Twine & Tasha Banes', 2);
INSERT INTO public.episodios VALUES (682, 7.2, '2017-05-11', 21, 12, 'There''s Something About Mary', 2);
INSERT INTO public.episodios VALUES (683, 8.8, '2017-05-18', 22, 12, 'Who We Are', 2);
INSERT INTO public.episodios VALUES (684, 8.8, '2017-05-18', 23, 12, 'All Along the Watchtower', 2);
INSERT INTO public.episodios VALUES (685, 8.7, '2017-10-12', 1, 13, 'Lost and Found', 2);
INSERT INTO public.episodios VALUES (686, 8.4, '2017-10-19', 2, 13, 'The Rising Son', 2);
INSERT INTO public.episodios VALUES (687, 8, '2017-10-26', 3, 13, 'Patience', 2);
INSERT INTO public.episodios VALUES (688, 8.4, '2017-11-02', 4, 13, 'The Big Empty', 2);
INSERT INTO public.episodios VALUES (689, 8.6, '2017-11-09', 5, 13, 'Advanced Thanatology', 2);
INSERT INTO public.episodios VALUES (690, 8.2, '2017-11-16', 6, 13, 'Tombstone', 2);
INSERT INTO public.episodios VALUES (691, 8.4, '2017-11-23', 7, 13, 'War of the Worlds', 2);
INSERT INTO public.episodios VALUES (692, 8.2, '2017-11-30', 8, 13, 'The Scorpion and the Frog', 2);
INSERT INTO public.episodios VALUES (693, 8.8, '2017-12-07', 9, 13, 'The Bad Place', 2);
INSERT INTO public.episodios VALUES (694, 8.2, '2018-01-18', 10, 13, 'Wayward Sisters', 2);
INSERT INTO public.episodios VALUES (695, 0, '2018-01-25', 11, 13, 'Breakdown', 2);
INSERT INTO public.episodios VALUES (696, 8.2, '2018-02-01', 12, 13, 'Various & Sundry Villains', 2);
INSERT INTO public.episodios VALUES (697, 8.3, '2018-02-08', 13, 13, 'Devil''s Bargain', 2);
INSERT INTO public.episodios VALUES (698, 8.2, '2018-03-01', 14, 13, 'Good Intentions', 2);
INSERT INTO public.episodios VALUES (699, 0, '2018-03-08', 15, 13, 'A Most Holy Man', 2);
INSERT INTO public.episodios VALUES (700, 0, '2018-03-29', 16, 13, 'ScoobyNatural', 2);
INSERT INTO public.episodios VALUES (701, 8.2, '2018-04-05', 17, 13, 'The Thing', 2);
INSERT INTO public.episodios VALUES (702, 8.5, '2018-04-12', 18, 13, 'Bring ''em Back Alive', 2);
INSERT INTO public.episodios VALUES (703, 8.2, '2018-04-19', 19, 13, 'Funeralia', 2);
INSERT INTO public.episodios VALUES (704, 8, '2018-04-26', 20, 13, 'Unfinished Business', 2);
INSERT INTO public.episodios VALUES (705, 8.9, '2018-05-03', 21, 13, 'Beat the Devil', 2);
INSERT INTO public.episodios VALUES (706, 8.3, '2018-05-10', 22, 13, 'Exodus', 2);
INSERT INTO public.episodios VALUES (707, 8.6, '2018-05-17', 23, 13, 'Let the Good Times Roll', 2);
INSERT INTO public.episodios VALUES (708, 7.7, '2018-10-11', 1, 14, 'Stranger in a Strange Land', 2);
INSERT INTO public.episodios VALUES (709, 7.9, '2018-10-18', 2, 14, 'Gods and Monsters', 2);
INSERT INTO public.episodios VALUES (710, 7.7, '2018-10-25', 3, 14, 'The Scar', 2);
INSERT INTO public.episodios VALUES (711, 8.6, '2018-11-01', 4, 14, 'Mint Condition', 2);
INSERT INTO public.episodios VALUES (712, 7.7, '2018-11-08', 5, 14, 'Nightmare Logic', 2);
INSERT INTO public.episodios VALUES (713, 8, '2018-11-15', 6, 14, 'Optimism', 2);
INSERT INTO public.episodios VALUES (714, 8.1, '2018-11-29', 7, 14, 'Unhuman Nature', 2);
INSERT INTO public.episodios VALUES (715, 8.4, '2018-12-06', 8, 14, 'Byzantium', 2);
INSERT INTO public.episodios VALUES (716, 8.1, '2018-12-13', 9, 14, 'The Spear', 2);
INSERT INTO public.episodios VALUES (717, 8.6, '2019-01-17', 10, 14, 'Nihilism', 2);
INSERT INTO public.episodios VALUES (718, 8.1, '2019-01-24', 11, 14, 'Damaged Goods', 2);
INSERT INTO public.episodios VALUES (719, 8.1, '2019-01-31', 12, 14, 'Prophet and Loss', 2);
INSERT INTO public.episodios VALUES (720, 9.3, '2019-02-07', 13, 14, 'Lebanon', 2);
INSERT INTO public.episodios VALUES (721, 8.5, '2019-03-07', 14, 14, 'Ouroboros', 2);
INSERT INTO public.episodios VALUES (722, 8.3, '2019-03-14', 15, 14, 'Peace of Mind', 2);
INSERT INTO public.episodios VALUES (723, 7.7, '2019-03-21', 16, 14, 'Don''t Go in the Woods', 2);
INSERT INTO public.episodios VALUES (724, 7.8, '2019-04-04', 17, 14, 'Game Night', 2);
INSERT INTO public.episodios VALUES (725, 7.8, '2019-04-11', 18, 14, 'Absence', 2);
INSERT INTO public.episodios VALUES (726, 8, '2019-04-18', 19, 14, 'Jack in the Box', 2);
INSERT INTO public.episodios VALUES (727, 9.3, '2019-04-25', 20, 14, 'Moriah', 2);
INSERT INTO public.episodios VALUES (728, 8, '2019-10-10', 1, 15, 'Back and to the Future', 2);
INSERT INTO public.episodios VALUES (729, 7.3, '2019-10-17', 2, 15, 'Raising Hell', 2);
INSERT INTO public.episodios VALUES (730, 8.3, '2019-10-24', 3, 15, 'The Rupture', 2);
INSERT INTO public.episodios VALUES (731, 8.2, '2019-11-07', 4, 15, 'Atomic Monsters', 2);
INSERT INTO public.episodios VALUES (732, 8.5, '2019-11-14', 5, 15, 'Proverbs 17:3', 2);
INSERT INTO public.episodios VALUES (733, 7.8, '2019-11-21', 6, 15, 'Golden Time', 2);
INSERT INTO public.episodios VALUES (734, 8, '2019-12-05', 7, 15, 'Last Call', 2);
INSERT INTO public.episodios VALUES (735, 0, '2019-12-12', 8, 15, 'Our Father, Who Aren''t in Heaven', 2);
INSERT INTO public.episodios VALUES (736, 8.1, '2020-01-16', 9, 15, 'The Trap', 2);
INSERT INTO public.episodios VALUES (737, 8, '2020-01-23', 10, 15, 'The Heroes'' Journey', 2);
INSERT INTO public.episodios VALUES (738, 8.2, '2020-01-30', 11, 15, 'The Gamblers', 2);
INSERT INTO public.episodios VALUES (739, 7.3, '2020-03-16', 12, 15, 'Galaxy Brain', 2);
INSERT INTO public.episodios VALUES (740, 8.2, '2020-03-23', 13, 15, 'Destiny''s Child', 2);
INSERT INTO public.episodios VALUES (741, 0, '2020-10-08', 14, 15, 'Last Holiday', 2);
INSERT INTO public.episodios VALUES (742, 7.5, '2020-10-15', 15, 15, 'Gimme Shelter', 2);
INSERT INTO public.episodios VALUES (743, 7.2, '2020-10-22', 16, 15, 'Drag Me Away (From You)', 2);
INSERT INTO public.episodios VALUES (744, 8.2, '2020-10-29', 17, 15, 'Unity', 2);
INSERT INTO public.episodios VALUES (745, 8.4, '2020-11-05', 18, 15, 'Despair', 2);
INSERT INTO public.episodios VALUES (746, 8.5, '2020-11-12', 19, 15, 'Inherit the Earth', 2);
INSERT INTO public.episodios VALUES (747, 0, '2020-11-19', 20, 15, 'Carry On', 2);


--
-- TOC entry 3367 (class 0 OID 53235)
-- Dependencies: 210
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.series VALUES (1, 'Blake Lively, Leighton Meester, Penn Badgley', 7.5, 'DRAMA', 'https://m.media-amazon.com/images/M/MV5BNmQ4Zjg1YWYtMTA1Mi00ZGY1LTlmN2ItYTc5ODkzNTFmYWVhXkEyXkFqcGdeQXVyNjQ0OTk1ODg@._V1_SX300.jpg', 'Privileged teens living on the Upper East Side of New York can hide no secret from the ruthless blogger who is always watching.', 'Gossip Girl', 6);
INSERT INTO public.series VALUES (2, 'Jared Padalecki, Jensen Ackles, Jim Beaver', 8.4, 'DRAMA', 'https://m.media-amazon.com/images/M/MV5BNzRmZWJhNjUtY2ZkYy00N2MyLWJmNTktOTAwY2VkODVmOGY3XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg', 'Two brothers follow their father''s footsteps as hunters, fighting evil supernatural beings of many kinds, including monsters, demons, and gods that roam the earth.', 'Supernatural', 15);
INSERT INTO public.series VALUES (3, 'Holly Marie Combs, Alyssa Milano, Brian Krause', 7.2, 'DRAMA', 'https://m.media-amazon.com/images/M/MV5BNTIxNmUxMWQtNjc0Yy00NjM2LWFjMTMtNjA2MmEzOTFiMWRmXkEyXkFqcGdeQXVyNzA5NjUyNjM@._V1_SX300.jpg', 'Three Halliwell sisters discover that they are descendants of a line of good female witches and are destined to fight against the forces of evil, using their combined power of witchcraft known as the "Power of Three".', 'Charmed', 8);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 211
-- Name: episodios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.episodios_id_seq', 747, true);


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 209
-- Name: series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.series_id_seq', 4, true);


--
-- TOC entry 3225 (class 2606 OID 53276)
-- Name: episodios episodios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episodios
    ADD CONSTRAINT episodios_pkey PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 53243)
-- Name: series series_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_pkey PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 53245)
-- Name: series uk_sujdgbuv4embh3cjvu1sux7ri; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT uk_sujdgbuv4embh3cjvu1sux7ri UNIQUE (titulo);


--
-- TOC entry 3226 (class 2606 OID 53277)
-- Name: episodios fk8031rj1wc9dgbh8a9mr6env2m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episodios
    ADD CONSTRAINT fk8031rj1wc9dgbh8a9mr6env2m FOREIGN KEY (serie_id) REFERENCES public.series(id);


-- Completed on 2024-06-04 18:00:27 CST

--
-- PostgreSQL database dump complete
--

