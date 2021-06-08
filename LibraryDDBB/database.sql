CREATE DATABASE "Biblioteca"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'es_ES.UTF-8'
    LC_CTYPE = 'es_ES.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	


CREATE TABLE IF NOT EXISTS public.editorials
(
    editorialid integer NOT NULL,
    name character varying(255),
    address character varying(255),
    telephone character varying(50),
    CONSTRAINT editorials_pkey PRIMARY KEY (editorialid)
);

CREATE TABLE IF NOT EXISTS public.books
(
    bookid integer NOT NULL,
    title character varying(255),
    language character varying(30),
    format character varying(30),
    editorialid integer NOT NULL,
    CONSTRAINT books_pkey PRIMARY KEY (bookid),
    CONSTRAINT fk_book_editorialid FOREIGN KEY (editorialid)
        REFERENCES public.editorials (editorialid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.theme
(
    themeid integer NOT NULL,
    name character varying(50),
    CONSTRAINT themeid PRIMARY KEY (themeid)
);


CREATE TABLE IF NOT EXISTS public.authors
(
    authorid integer NOT NULL,
    name character varying(100),
    CONSTRAINT authorid PRIMARY KEY (authorid)
);

CREATE TABLE IF NOT EXISTS public.copies
(
    copyid integer NOT NULL,
    bookid integer NOT NULL,
    ordernumber integer,
    edition character varying(30),
    category character varying(100),
    location character varying(50),
    CONSTRAINT copyid PRIMARY KEY (copyid),
    CONSTRAINT fk_copy_bookid FOREIGN KEY (copyid)
        REFERENCES public.books (bookid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE IF NOT EXISTS public.members
(
    memberid integer NOT NULL,
    name character varying(100),
    adress character varying(50),
    phone character varying(20),
    category character varying(20),
    CONSTRAINT memberid PRIMARY KEY (memberid)
);

CREATE TABLE IF NOT EXISTS public.loans
(
    loanid integer NOT NULL,
    memberid integer NOT NULL,
    copyid integer NOT NULL,
    loandate date,
    returndate date,
    notes character varying(100),
    CONSTRAINT loanid PRIMARY KEY (loanid),
    CONSTRAINT fk_loan_copyid FOREIGN KEY (copyid)
        REFERENCES public.copies (copyid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_loan_memberid FOREIGN KEY (memberid)
        REFERENCES public.members (memberid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.about
(
    aboutid integer NOT NULL,
    bookid integer NOT NULL,
    themeid integer NOT NULL,
    CONSTRAINT aboutid PRIMARY KEY (aboutid),
    CONSTRAINT fk_aboutid_bookid FOREIGN KEY (bookid)
        REFERENCES public.books (bookid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_aboutid_themeid FOREIGN KEY (themeid)
        REFERENCES public.theme (themeid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


	
	