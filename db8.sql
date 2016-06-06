-- -------------------------------------------------------------------------
-- PostgreSQL SQL create tables
-- exported at Mon Jun 06 18:27:36 BOT 2016 with easyDesigner
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
  "ID_EQ" bigserial NOT NULL,
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
  "ID_PO" bigserial NOT NULL,
  "ROL_ID_ROL" INTEGER NOT NULL,
  PRIMARY KEY ("ID_PO")
);

-- -------------------------------------------------------------------------
-- Table: HISTORIA DE USUARIO
-- -------------------------------------------------------------------------
CREATE TABLE "HISTORIA DE USUARIO" (
  "ID_HIUS" bigserial NOT NULL,
  "PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "COMPLEJIDAD" INTEGER NULL,
  "IMPORTANCIA" INTEGER NULL,
  "DESCRIPCION" VARCHAR(255) NULL,
  PRIMARY KEY ("ID_HIUS", "PRODUCT OWNER_ID_PO")
);

-- -------------------------------------------------------------------------
-- Table: SPRINT
-- -------------------------------------------------------------------------
CREATE TABLE "SPRINT" (
  "ID_SP" bigserial NOT NULL,
  "PLANNING_MIEMBRO EQUIPO_ID_EQ" INTEGER NOT NULL,
  "PLANNING_PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "PLANNING_ID_P" INTEGER NOT NULL,
  "FECHAINI" DATE NULL,
  "FECHAFIN" DATE NULL,
  PRIMARY KEY ("ID_SP", "PLANNING_MIEMBRO EQUIPO_ID_EQ", "PLANNING_PRODUCT OWNER_ID_PO", "PLANNING_ID_P")
);

-- -------------------------------------------------------------------------
-- Table: ESTADO DE TAREA
-- -------------------------------------------------------------------------
CREATE TABLE "ESTADO DE TAREA" (
  "IDESTADO" bigserial NOT NULL,
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
  "ID_P" bigserial NOT NULL,
  "FECHA" DATE NULL,
  PRIMARY KEY ("MIEMBRO EQUIPO_ID_EQ", "PRODUCT OWNER_ID_PO", "ID_P")
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
  "SPRINT_PLANNING_ID_P" INTEGER NOT NULL,
  PRIMARY KEY ("HISTORIA DE USUARIO_ID_HIUS", "HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO", "SPRINT_ID_SP", "SPRINT_PLANNING_MIEMBRO EQUIPO_ID_EQ", "SPRINT_PLANNING_PRODUCT OWNER_ID_PO", "SPRINT_PLANNING_ID_P")
);

-- -------------------------------------------------------------------------
-- Table: PROYECTO
-- -------------------------------------------------------------------------
CREATE TABLE "PROYECTO" (
  "ID_PROY" bigserial NOT NULL,
  "DESCRIPCION" VARCHAR(255) NULL,
  "NOMBRE" VARCHAR(255) NULL,
  PRIMARY KEY ("ID_PROY")
);

-- -------------------------------------------------------------------------
-- Table: SCRUM TEAM
-- -------------------------------------------------------------------------
CREATE TABLE "SCRUM TEAM" (
  "PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "MIEMBRO EQUIPO_ID_EQ" INTEGER NOT NULL,
  "ID_STEAM" bigserial NOT NULL,
  PRIMARY KEY ("PRODUCT OWNER_ID_PO", "MIEMBRO EQUIPO_ID_EQ", "ID_STEAM")
);

-- -------------------------------------------------------------------------
-- Table: ASIGNACION PROY
-- -------------------------------------------------------------------------
CREATE TABLE "ASIGNACION PROY" (
  "SCRUM TEAM_PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "SCRUM TEAM_MIEMBRO EQUIPO_ID_EQ" INTEGER NOT NULL,
  "PROYECTO_ID_PROY" INTEGER NOT NULL,
  "SCRUM TEAM_ID_STEAM" INTEGER NOT NULL,
  "FECHAINI" DATE NULL,
  "FECHAFIN" DATE NULL,
  PRIMARY KEY ("SCRUM TEAM_PRODUCT OWNER_ID_PO", "SCRUM TEAM_MIEMBRO EQUIPO_ID_EQ", "PROYECTO_ID_PROY", "SCRUM TEAM_ID_STEAM")
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
  "ID_CU" bigserial NOT NULL,
  "USUARIO" VARCHAR(255) NULL,
  "PASSWORD" VARCHAR(255) NULL,
  PRIMARY KEY ("ID_CU")
);

-- -------------------------------------------------------------------------
-- Table: TRABAJADOR
-- -------------------------------------------------------------------------
CREATE TABLE "TRABAJADOR" (
  "ID_TRAB" bigserial NOT NULL,
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
  "ID_ROL" bigserial NOT NULL,
  PRIMARY KEY ("ID_ROL")
);

-- -------------------------------------------------------------------------
-- Table: ASIGNACION TAREA-MIEMBROEQUIPO
-- -------------------------------------------------------------------------
CREATE TABLE "ASIGNACION TAREA-MIEMBROEQUIPO" (
  "ID-AS" bigserial NOT NULL,
  "TAREA_HISTORIA DE USUARIO_ID_HIUS" INTEGER NOT NULL,
  "TAREA_HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO" INTEGER NOT NULL,
  "MIEMBRO EQUIPO_ID_EQ" INTEGER NOT NULL,
  PRIMARY KEY ("ID-AS", "TAREA_HISTORIA DE USUARIO_ID_HIUS", "TAREA_HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO", "MIEMBRO EQUIPO_ID_EQ")
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
ALTER TABLE "SPRINT" ADD FOREIGN KEY ("PLANNING_MIEMBRO EQUIPO_ID_EQ", "PLANNING_PRODUCT OWNER_ID_PO", "PLANNING_ID_P") 
    REFERENCES "PLANNING" ("MIEMBRO EQUIPO_ID_EQ", "PRODUCT OWNER_ID_PO", "ID_P")
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
ALTER TABLE "ASIGNACION SPRINT-HU" ADD FOREIGN KEY ("SPRINT_ID_SP", "SPRINT_PLANNING_MIEMBRO EQUIPO_ID_EQ", "SPRINT_PLANNING_PRODUCT OWNER_ID_PO", "SPRINT_PLANNING_ID_P") 
    REFERENCES "SPRINT" ("ID_SP", "PLANNING_MIEMBRO EQUIPO_ID_EQ", "PLANNING_PRODUCT OWNER_ID_PO", "PLANNING_ID_P")
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
ALTER TABLE "ASIGNACION PROY" ADD FOREIGN KEY ("SCRUM TEAM_PRODUCT OWNER_ID_PO", "SCRUM TEAM_MIEMBRO EQUIPO_ID_EQ", "SCRUM TEAM_ID_STEAM") 
    REFERENCES "SCRUM TEAM" ("PRODUCT OWNER_ID_PO", "MIEMBRO EQUIPO_ID_EQ", "ID_STEAM")
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

-- -------------------------------------------------------------------------
-- Relations for table: ASIGNACION TAREA-MIEMBROEQUIPO
-- -------------------------------------------------------------------------
ALTER TABLE "ASIGNACION TAREA-MIEMBROEQUIPO" ADD FOREIGN KEY ("TAREA_HISTORIA DE USUARIO_ID_HIUS", "TAREA_HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO") 
    REFERENCES "TAREA" ("HISTORIA DE USUARIO_ID_HIUS", "HISTORIA DE USUARIO_PRODUCT OWNER_ID_PO")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "ASIGNACION TAREA-MIEMBROEQUIPO" ADD FOREIGN KEY ("MIEMBRO EQUIPO_ID_EQ") 
    REFERENCES "MIEMBRO EQUIPO" ("ID_EQ")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

