-- -------------------------------------------------------------------------
-- PostgreSQL SQL create tables
-- exported at Mon May 30 16:22:45 BOT 2016 with easyDesigner
-- -------------------------------------------------------------------------

-- -------------------------------------------------------------------------
-- Table: TAREA
-- -------------------------------------------------------------------------
CREATE TABLE "TAREA" (
  "HISTORIA DE USUARIO_ID_HIUS" INTEGER NOT NULL,
  "HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "ESTADO DE TAREA_IDESTADO" INTEGER NOT NULL,
  PRIMARY KEY ("HISTORIA DE USUARIO_ID_HIUS", "HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO")
);

-- -------------------------------------------------------------------------
-- Table: MIEMBRO EQUIPO
-- -------------------------------------------------------------------------
CREATE TABLE "MIEMBRO EQUIPO" (
  "ID_EQ" INTEGER NOT NULL,
  "MIEMBRO EQUIPO_ID_EQ" INTEGER NOT NULL,
  "NOMBRE" VARCHAR(255) NULL,
  "FECHANAC" DATE NULL,
  PRIMARY KEY ("ID_EQ", "MIEMBRO EQUIPO_ID_EQ")
);

-- -------------------------------------------------------------------------
-- Table: PRODUCT OWNER
-- -------------------------------------------------------------------------
CREATE TABLE "PRODUCT OWNER" (
  "ID_PO" INTEGER NOT NULL,
  PRIMARY KEY ("ID_PO")
);

-- -------------------------------------------------------------------------
-- Table: HISTORIA DE USUARIO
-- -------------------------------------------------------------------------
CREATE TABLE "HISTORIA DE USUARIO" (
  "ID_HIUS" INTEGER NOT NULL,
  "PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "CONJUNTO DE HU_ID_CHU" INTEGER NOT NULL,
  "CONJUNTO DE HU_PLANNING_MIEMBRO EQUIPO_ID_EQ" INTEGER NOT NULL,
  "CONJUNTO DE HU_PLANNING_PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  PRIMARY KEY ("ID_HIUS", "PRODUCT OWNER_ID_PO")
);

-- -------------------------------------------------------------------------
-- Table: SPRINT
-- -------------------------------------------------------------------------
CREATE TABLE "SPRINT" (
  "ID_SP" INTEGER NOT NULL,
  "PLANNING_MIEMBRO EQUIPO_ID_EQ" INTEGER NOT NULL,
  "PLANNING_PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "FECHAINI" DATE NULL,
  "FECHAFIN" DATE NULL,
  PRIMARY KEY ("ID_SP", "PLANNING_MIEMBRO EQUIPO_ID_EQ", "PLANNING_PRODUCT OWNER_ID_PO")
);

-- -------------------------------------------------------------------------
-- Table: ESTADO DE TAREA
-- -------------------------------------------------------------------------
CREATE TABLE "ESTADO DE TAREA" (
  "IDESTADO" INTEGER NOT NULL,
  "DESCRIPCION" VARCHAR(255) NULL,
  PRIMARY KEY ("IDESTADO")
);

-- -------------------------------------------------------------------------
-- Table: PLANNING
-- -------------------------------------------------------------------------
CREATE TABLE "PLANNING" (
  "MIEMBRO EQUIPO_ID_EQ" INTEGER NOT NULL,
  "PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "FECHA" DATE NULL,
  PRIMARY KEY ("MIEMBRO EQUIPO_ID_EQ", "PRODUCT OWNER_ID_PO")
);

-- -------------------------------------------------------------------------
-- Table: CONJUNTO DE HU
-- -------------------------------------------------------------------------
CREATE TABLE "CONJUNTO DE HU" (
  "ID_CHU" INTEGER NOT NULL,
  "PLANNING_MIEMBRO EQUIPO_ID_EQ" INTEGER NOT NULL,
  "PLANNING_PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "SPRINT_ID_SP" INTEGER NOT NULL,
  "SPRINT_PLANNING_MIEMBRO EQUIPO_ID_EQ" INTEGER NOT NULL,
  "SPRINT_PLANNING_PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  PRIMARY KEY ("ID_CHU", "PLANNING_MIEMBRO EQUIPO_ID_EQ", "PLANNING_PRODUCT OWNER_ID_PO")
);

-- -------------------------------------------------------------------------
-- Relations for table: TAREA
-- -------------------------------------------------------------------------
ALTER TABLE "TAREA" ADD FOREIGN KEY ("ESTADO DE TAREA_IDESTADO") 
    REFERENCES "ESTADO DE TAREA" ("IDESTADO")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "TAREA" ADD FOREIGN KEY ("HISTORIA DE USUARIO_ID_HIUS", "HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO") 
    REFERENCES "HISTORIA DE USUARIO" ("ID_HIUS", "PRODUCT OWNER_ID_PO")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: MIEMBRO EQUIPO
-- -------------------------------------------------------------------------
ALTER TABLE "MIEMBRO EQUIPO" ADD FOREIGN KEY ("MIEMBRO EQUIPO_ID_EQ") 
    REFERENCES "MIEMBRO EQUIPO" ("ID_EQ")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: HISTORIA DE USUARIO
-- -------------------------------------------------------------------------
ALTER TABLE "HISTORIA DE USUARIO" ADD FOREIGN KEY ("PRODUCT OWNER_ID_PO") 
    REFERENCES "PRODUCT OWNER" ("ID_PO")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "HISTORIA DE USUARIO" ADD FOREIGN KEY ("CONJUNTO DE HU_ID_CHU", "CONJUNTO DE HU_PLANNING_MIEMBRO EQUIPO_ID_EQ", "CONJUNTO DE HU_PLANNING_PRODUCT OWNER_ID_PO") 
    REFERENCES "CONJUNTO DE HU" ("ID_CHU", "PLANNING_MIEMBRO EQUIPO_ID_EQ", "PLANNING_PRODUCT OWNER_ID_PO")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: SPRINT
-- -------------------------------------------------------------------------
ALTER TABLE "SPRINT" ADD FOREIGN KEY ("PLANNING_MIEMBRO EQUIPO_ID_EQ", "PLANNING_PRODUCT OWNER_ID_PO") 
    REFERENCES "PLANNING" ("MIEMBRO EQUIPO_ID_EQ", "PRODUCT OWNER_ID_PO")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: PLANNING
-- -------------------------------------------------------------------------
ALTER TABLE "PLANNING" ADD FOREIGN KEY ("MIEMBRO EQUIPO_ID_EQ") 
    REFERENCES "MIEMBRO EQUIPO" ("ID_EQ")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "PLANNING" ADD FOREIGN KEY ("PRODUCT OWNER_ID_PO") 
    REFERENCES "PRODUCT OWNER" ("ID_PO")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: CONJUNTO DE HU
-- -------------------------------------------------------------------------
ALTER TABLE "CONJUNTO DE HU" ADD FOREIGN KEY ("PLANNING_MIEMBRO EQUIPO_ID_EQ", "PLANNING_PRODUCT OWNER_ID_PO") 
    REFERENCES "PLANNING" ("MIEMBRO EQUIPO_ID_EQ", "PRODUCT OWNER_ID_PO")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "CONJUNTO DE HU" ADD FOREIGN KEY ("SPRINT_ID_SP", "SPRINT_PLANNING_MIEMBRO EQUIPO_ID_EQ", "SPRINT_PLANNING_PRODUCT OWNER_ID_PO") 
    REFERENCES "SPRINT" ("ID_SP", "PLANNING_MIEMBRO EQUIPO_ID_EQ", "PLANNING_PRODUCT OWNER_ID_PO")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

