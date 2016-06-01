-- -------------------------------------------------------------------------
-- PostgreSQL SQL create tables
-- exported at Wed Jun 01 12:42:23 BOT 2016 with easyDesigner
-- -------------------------------------------------------------------------

-- -------------------------------------------------------------------------
-- Table: TAREA
-- -------------------------------------------------------------------------
CREATE TABLE "TAREA" (
  "HISTORIA DE USUARIO_ID_HIUS" INTEGER NOT NULL,
  "HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "DESCRIPCION" VARCHAR(255) NULL,
  PRIMARY KEY ("HISTORIA DE USUARIO_ID_HIUS", "HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO")
);

-- -------------------------------------------------------------------------
-- Table: MIEMBRO EQUIPO
-- -------------------------------------------------------------------------
CREATE TABLE "MIEMBRO EQUIPO" (
  "ID_EQ" INTEGER NOT NULL,
  "ROL_ID_ROL" INTEGER NOT NULL,
  "MIEMBRO EQUIPO_ID_EQ" INTEGER NOT NULL,
  "NOMBRE" VARCHAR(255) NULL,
  "FECHANAC" DATE NULL,
  PRIMARY KEY ("ID_EQ")
);

-- -------------------------------------------------------------------------
-- Table: PRODUCT OWNER
-- -------------------------------------------------------------------------
CREATE TABLE "PRODUCT OWNER" (
  "ID_PO" INTEGER NOT NULL,
  "ROL_ID_ROL" INTEGER NOT NULL,
  PRIMARY KEY ("ID_PO")
);

-- -------------------------------------------------------------------------
-- Table: HISTORIA DE USUARIO
-- -------------------------------------------------------------------------
CREATE TABLE "HISTORIA DE USUARIO" (
  "ID_HIUS" INTEGER NOT NULL,
  "PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "COMPLEJIDAD" INTEGER NULL,
  "IMPORTANCIA" INTEGER NULL,
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
  "TAREA_HISTORIA DE USUARIO_ID_HIUS" INTEGER NOT NULL,
  "TAREA_HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
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
-- Table: ASIGNACION SPRINT-HU
-- -------------------------------------------------------------------------
CREATE TABLE "ASIGNACION SPRINT-HU" (
  "HISTORIA DE USUARIO_ID_HIUS" INTEGER NOT NULL,
  "HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "SPRINT_ID_SP" INTEGER NOT NULL,
  "SPRINT_PLANNING_MIEMBRO EQUIPO_ID_EQ" INTEGER NOT NULL,
  "SPRINT_PLANNING_PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  PRIMARY KEY ("HISTORIA DE USUARIO_ID_HIUS", "HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO", "SPRINT_ID_SP", "SPRINT_PLANNING_MIEMBRO EQUIPO_ID_EQ", "SPRINT_PLANNING_PRODUCT OWNER_ID_PO")
);

-- -------------------------------------------------------------------------
-- Table: PROYECTO
-- -------------------------------------------------------------------------
CREATE TABLE "PROYECTO" (
  "ID_PROY" INTEGER NOT NULL,
  "DESCRIPCION" VARCHAR(255) NULL,
  PRIMARY KEY ("ID_PROY")
);

-- -------------------------------------------------------------------------
-- Table: SCRUM TEAM
-- -------------------------------------------------------------------------
CREATE TABLE "SCRUM TEAM" (
  "PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "MIEMBRO EQUIPO_ID_EQ" INTEGER NOT NULL,
  PRIMARY KEY ("PRODUCT OWNER_ID_PO", "MIEMBRO EQUIPO_ID_EQ")
);

-- -------------------------------------------------------------------------
-- Table: ASIGNACION PROY
-- -------------------------------------------------------------------------
CREATE TABLE "ASIGNACION PROY" (
  "SCRUM TEAM_PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "SCRUM TEAM_MIEMBRO EQUIPO_ID_EQ" INTEGER NOT NULL,
  "PROYECTO_ID_PROY" INTEGER NOT NULL,
  "FECHAINI" DATE NULL,
  "FECHAFIN" DATE NULL,
  PRIMARY KEY ("SCRUM TEAM_PRODUCT OWNER_ID_PO", "SCRUM TEAM_MIEMBRO EQUIPO_ID_EQ", "PROYECTO_ID_PROY")
);

-- -------------------------------------------------------------------------
-- Table: IDENTIDAD LOG
-- -------------------------------------------------------------------------
CREATE TABLE "IDENTIDAD LOG" (
  "CUENTAS_ID_CU" INTEGER NOT NULL,
  "TRABAJADOR_ID_TRAB" INTEGER NOT NULL,
  PRIMARY KEY ("CUENTAS_ID_CU", "TRABAJADOR_ID_TRAB")
);

-- -------------------------------------------------------------------------
-- Table: CUENTAS
-- -------------------------------------------------------------------------
CREATE TABLE "CUENTAS" (
  "ID_CU" INTEGER NOT NULL,
  "USUARIO" VARCHAR(255) NULL,
  "PASSWORD" VARCHAR(255) NULL,
  PRIMARY KEY ("ID_CU")
);

-- -------------------------------------------------------------------------
-- Table: TRABAJADOR
-- -------------------------------------------------------------------------
CREATE TABLE "TRABAJADOR" (
  "ID_TRAB" INTEGER NOT NULL,
  "ROL_ID_ROL" INTEGER NOT NULL,
  "NOMBRE" VARCHAR(255) NULL,
  "APELLIDO" VARCHAR(255) NULL,
  "FECHA NAC" DATE NULL,
  PRIMARY KEY ("ID_TRAB")
);

-- -------------------------------------------------------------------------
-- Table: ROL
-- -------------------------------------------------------------------------
CREATE TABLE "ROL" (
  "ID_ROL" INTEGER NOT NULL,
  PRIMARY KEY ("ID_ROL")
);

-- -------------------------------------------------------------------------
-- Relations for table: TAREA
-- -------------------------------------------------------------------------
ALTER TABLE "TAREA" ADD FOREIGN KEY ("HISTORIA DE USUARIO_ID_HIUS", "HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO") 
    REFERENCES "HISTORIA DE USUARIO" ("ID_HIUS", "PRODUCT OWNER_ID_PO")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: MIEMBRO EQUIPO
-- -------------------------------------------------------------------------
ALTER TABLE "MIEMBRO EQUIPO" ADD FOREIGN KEY ("MIEMBRO EQUIPO_ID_EQ") 
    REFERENCES "MIEMBRO EQUIPO" ("ID_EQ")
      ON DELETE CASCADE
      ON UPDATE CASCADE;
ALTER TABLE "MIEMBRO EQUIPO" ADD FOREIGN KEY ("ROL_ID_ROL") 
    REFERENCES "ROL" ("ID_ROL")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: PRODUCT OWNER
-- -------------------------------------------------------------------------
ALTER TABLE "PRODUCT OWNER" ADD FOREIGN KEY ("ROL_ID_ROL") 
    REFERENCES "ROL" ("ID_ROL")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: HISTORIA DE USUARIO
-- -------------------------------------------------------------------------
ALTER TABLE "HISTORIA DE USUARIO" ADD FOREIGN KEY ("PRODUCT OWNER_ID_PO") 
    REFERENCES "PRODUCT OWNER" ("ID_PO")
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
-- Relations for table: ESTADO DE TAREA
-- -------------------------------------------------------------------------
ALTER TABLE "ESTADO DE TAREA" ADD FOREIGN KEY ("TAREA_HISTORIA DE USUARIO_ID_HIUS", "TAREA_HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO") 
    REFERENCES "TAREA" ("HISTORIA DE USUARIO_ID_HIUS", "HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO")
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
-- Relations for table: ASIGNACION SPRINT-HU
-- -------------------------------------------------------------------------
ALTER TABLE "ASIGNACION SPRINT-HU" ADD FOREIGN KEY ("HISTORIA DE USUARIO_ID_HIUS", "HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO") 
    REFERENCES "HISTORIA DE USUARIO" ("ID_HIUS", "PRODUCT OWNER_ID_PO")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "ASIGNACION SPRINT-HU" ADD FOREIGN KEY ("SPRINT_ID_SP", "SPRINT_PLANNING_MIEMBRO EQUIPO_ID_EQ", "SPRINT_PLANNING_PRODUCT OWNER_ID_PO") 
    REFERENCES "SPRINT" ("ID_SP", "PLANNING_MIEMBRO EQUIPO_ID_EQ", "PLANNING_PRODUCT OWNER_ID_PO")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: SCRUM TEAM
-- -------------------------------------------------------------------------
ALTER TABLE "SCRUM TEAM" ADD FOREIGN KEY ("PRODUCT OWNER_ID_PO") 
    REFERENCES "PRODUCT OWNER" ("ID_PO")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "SCRUM TEAM" ADD FOREIGN KEY ("MIEMBRO EQUIPO_ID_EQ") 
    REFERENCES "MIEMBRO EQUIPO" ("ID_EQ")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: ASIGNACION PROY
-- -------------------------------------------------------------------------
ALTER TABLE "ASIGNACION PROY" ADD FOREIGN KEY ("SCRUM TEAM_PRODUCT OWNER_ID_PO", "SCRUM TEAM_MIEMBRO EQUIPO_ID_EQ") 
    REFERENCES "SCRUM TEAM" ("PRODUCT OWNER_ID_PO", "MIEMBRO EQUIPO_ID_EQ")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "ASIGNACION PROY" ADD FOREIGN KEY ("PROYECTO_ID_PROY") 
    REFERENCES "PROYECTO" ("ID_PROY")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: IDENTIDAD LOG
-- -------------------------------------------------------------------------
ALTER TABLE "IDENTIDAD LOG" ADD FOREIGN KEY ("CUENTAS_ID_CU") 
    REFERENCES "CUENTAS" ("ID_CU")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "IDENTIDAD LOG" ADD FOREIGN KEY ("TRABAJADOR_ID_TRAB") 
    REFERENCES "TRABAJADOR" ("ID_TRAB")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: TRABAJADOR
-- -------------------------------------------------------------------------
ALTER TABLE "TRABAJADOR" ADD FOREIGN KEY ("ROL_ID_ROL") 
    REFERENCES "ROL" ("ID_ROL")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

