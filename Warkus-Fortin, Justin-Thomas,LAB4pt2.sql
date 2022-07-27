-- Diff code generated with pgModeler (PostgreSQL Database Modeler)
-- pgModeler version: 0.9.2-beta1_snapshot20190718
-- Diff date: 2019-09-26 15:44:39
-- Source model: thinkcube
-- Database: thinkcube
-- PostgreSQL version: 11.0

-- [ Diff summary ]
-- Dropped objects: 0
-- Created objects: 7
-- Changed objects: 0
-- Truncated tables: 0

SET search_path=public,pg_catalog;
-- ddl-end --


-- [ Created objects ] --
-- object: "Active" | type: COLUMN --
-- ALTER TABLE public.versions DROP COLUMN IF EXISTS "Active" CASCADE;
ALTER TABLE public.versions ADD COLUMN "Active" boolean DEFAULT true;
-- ddl-end --


-- object: "Active" | type: COLUMN --
-- ALTER TABLE public.product_versions DROP COLUMN IF EXISTS "Active" CASCADE;
ALTER TABLE public.product_versions ADD COLUMN "Active" boolean DEFAULT true;
-- ddl-end --


-- object: "Active" | type: COLUMN --
-- ALTER TABLE public.product_types DROP COLUMN IF EXISTS "Active" CASCADE;
ALTER TABLE public.product_types ADD COLUMN "Active" boolean DEFAULT true;
-- ddl-end --


-- object: public."Customer_Email_Log" | type: TABLE --
-- DROP TABLE IF EXISTS public."Customer_Email_Log" CASCADE;
CREATE TABLE public."Customer_Email_Log" (
	"ID" bigserial,
	log_date timestamp DEFAULT now(),
	log_note text NOT NULL,
	"Customers ID" integer NOT NULL,
	"Email_Log_Types_ID" bigint NOT NULL
);
-- ddl-end --
ALTER TABLE public."Customer_Email_Log" OWNER TO postgres;
-- ddl-end --

-- object: public."Email_Log_Types" | type: TABLE --
-- DROP TABLE IF EXISTS public."Email_Log_Types" CASCADE;
CREATE TABLE public."Email_Log_Types" (
	"ID" bigserial NOT NULL,
	"Name" varchar(50) NOT NULL,
	CONSTRAINT "Email_Log_Types_pk" PRIMARY KEY ("ID")

);
-- ddl-end --
ALTER TABLE public."Email_Log_Types" OWNER TO postgres;
-- ddl-end --



-- [ Created foreign keys ] --
-- object: customers_fk | type: CONSTRAINT --
-- ALTER TABLE public."Customer_Email_Log" DROP CONSTRAINT IF EXISTS customers_fk CASCADE;
ALTER TABLE public."Customer_Email_Log" ADD CONSTRAINT customers_fk FOREIGN KEY ("Customers ID")
REFERENCES public.customers (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "Email_Log_Types_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Customer_Email_Log" DROP CONSTRAINT IF EXISTS "Email_Log_Types_fk" CASCADE;
ALTER TABLE public."Customer_Email_Log" ADD CONSTRAINT "Email_Log_Types_fk" FOREIGN KEY ("Email_Log_Types_ID")
REFERENCES public."Email_Log_Types" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

