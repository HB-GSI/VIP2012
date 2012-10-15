-- Sequence: seq_classes_id
CREATE SEQUENCE seq_classes_id
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_classes_id
  OWNER TO postgres;
COMMENT ON SEQUENCE seq_classes_id
  IS 'Auto increment ID of classes table.';

-- Sequence: seq_sections_id
CREATE SEQUENCE seq_sections_id
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_sections_id
  OWNER TO postgres;
COMMENT ON SEQUENCE seq_sections_id
  IS 'Auto increment for id of table Sections';

-- Sequence: seq_items_id
CREATE SEQUENCE seq_items_id
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_items_id
  OWNER TO postgres;
COMMENT ON SEQUENCE seq_items_id
  IS 'Auto increment of ID for table Items';

-- Sequence: seq_itemvalues_id
CREATE SEQUENCE seq_itemvalues_id
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_itemvalues_id
  OWNER TO postgres;
COMMENT ON SEQUENCE seq_itemvalues_id
  IS 'Auto increment of ID for table ItemValues';

-- Table: vip2012_classes
CREATE TABLE vip2012_classes
(
  id integer NOT NULL DEFAULT nextval('seq_classes_id'::regclass),
  name character varying(255) NOT NULL,
  path character varying(1024) NOT NULL,
  ancestor integer,
  CONSTRAINT vip2012_classes_pkey PRIMARY KEY (id ),
  CONSTRAINT vip2012_classes_ancestor_fkey FOREIGN KEY (ancestor)
      REFERENCES vip2012_classes (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Table: vip2012_sections
CREATE TABLE vip2012_sections
(
  id integer NOT NULL DEFAULT nextval('seq_sections_id'::regclass),
  name character varying(255) NOT NULL,
  fk_classes integer NOT NULL,
  CONSTRAINT vip2012_sections_pkey PRIMARY KEY (id ),
  CONSTRAINT vip2012_sections_fk_classes_fkey FOREIGN KEY (fk_classes)
      REFERENCES vip2012_classes (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Table: vip2012_items
CREATE TABLE vip2012_items
(
  id integer NOT NULL DEFAULT nextval('seq_items_id'::regclass),
  name character varying(255) NOT NULL,
  fk_classes integer NOT NULL,
  fk_baseclass integer NOT NULL,
  CONSTRAINT vip2012_items_pkey PRIMARY KEY (id ),
  CONSTRAINT vip2012_items_fk_baseclass_fkey FOREIGN KEY (fk_baseclass)
      REFERENCES vip2012_classes (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT vip2012_items_fk_classes_fkey FOREIGN KEY (fk_classes)
      REFERENCES vip2012_classes (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT vip2012_items_fk_baseclass_name_key UNIQUE (fk_baseclass , name )
);

-- Table: vip2012_itemvalues
CREATE TABLE vip2012_itemvalues
(
  id integer NOT NULL DEFAULT nextval('seq_itemvalues_id'::regclass),
  fk_sections integer NOT NULL,
  fk_items integer NOT NULL,
  data character varying(1024),
  CONSTRAINT vip2012_itemvalues_pkey PRIMARY KEY (id ),
  CONSTRAINT vip2012_itemvalues_fk_items_fkey FOREIGN KEY (fk_items)
      REFERENCES vip2012_items (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT vip2012_itemvalues_fk_sections_fkey FOREIGN KEY (fk_sections)
      REFERENCES vip2012_sections (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT vip2012_itemvalues_fk_sections_fk_items_key UNIQUE (fk_sections , fk_items )
);

-- DROP TABLE vip2012_itemvalues;
-- DROP TABLE vip2012_items;
-- DROP TABLE vip2012_sections;
-- DROP TABLE vip2012_classes;

-- DROP SEQUENCE seq_classes_id;
-- DROP SEQUENCE seq_sections_id;
-- DROP SEQUENCE seq_items_id;
-- DROP SEQUENCE seq_itemvalues_id;
