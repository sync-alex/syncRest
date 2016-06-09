--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Drop everything
--

DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS comments CASCADE;
DROP TABLE IF EXISTS post_tags CASCADE;
DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS tags CASCADE;
DROP TABLE IF EXISTS users CASCADE;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE categories (
    id serial NOT NULL,
    name character varying(255) NOT NULL,
    icon bytea
);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE comments (
    id serial NOT NULL,
    post_id integer NOT NULL,
    message character varying(255) NOT NULL
);


--
-- Name: post_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE post_tags (
    id serial NOT NULL,
    post_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE posts (
    id serial NOT NULL,
    user_id integer NOT NULL,
    category_id integer NOT NULL,
    content character varying(255) NOT NULL
);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE tags (
    id serial NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE users (
    id serial NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "categories" ("name", "icon") VALUES
('anouncement',	NULL),
('article',	NULL);

--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "comments" ("post_id", "message") VALUES
(1,	'great'),
(1,	'fantastic'),
(2,	'thank you'),
(2,	'awesome');

--
-- Data for Name: post_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "post_tags" ("post_id", "tag_id") VALUES
(1,	1),
(1,	2),
(2,	1),
(2,	2);

--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "posts" ("user_id", "category_id", "content") VALUES
(1,	1,	'blog started'),
(1,	2,	'It works!');

--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "tags" ("name") VALUES
('funny'),
('important');

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "users" ("username", "password") VALUES
('user1',	'pass1'),
('user2',	'pass2');

--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: post_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY post_tags
    ADD CONSTRAINT post_tags_pkey PRIMARY KEY (id);


--
-- Name: post_tags_post_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY post_tags
    ADD CONSTRAINT post_tags_post_id_tag_id_key UNIQUE (post_id, tag_id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: comments_post_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX comments_post_id_idx ON comments USING btree (post_id);


--
-- Name: post_tags_post_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX post_tags_post_id_idx ON post_tags USING btree (post_id);


--
-- Name: post_tags_tag_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX post_tags_tag_id_idx ON post_tags USING btree (tag_id);


--
-- Name: posts_category_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX posts_category_id_idx ON posts USING btree (category_id);


--
-- Name: posts_user_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX posts_user_id_idx ON posts USING btree (user_id);


--
-- Name: comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES posts(id);


--
-- Name: post_tags_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY post_tags
    ADD CONSTRAINT post_tags_post_id_fkey FOREIGN KEY (post_id) REFERENCES posts(id);


--
-- Name: post_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY post_tags
    ADD CONSTRAINT post_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tags(id);


--
-- Name: posts_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_category_id_fkey FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--
