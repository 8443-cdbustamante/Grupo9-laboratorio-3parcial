create table tb_proveedor(
"var_id_pro"           VARCHAR2(35) PRIMARY KEY NOT NULL,
"var_nombre_pro"       VARCHAR2(35) NOT NULL,
"var_tipo_pro"         VARCHAR2(35) NOT NULL,
"var_email_pro"        VARCHAR2(35) NOT NULL,
"var_telefono_pro"     VARCHAR2(35) NOT NULL,
"var_descripcion_pro"  VARCHAR2(35) NOT NULL,
"var_status_pro"       VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_pro"   NUMBER NOT NULL
);

create table tb_pieza(
"var_id_pieza"         VARCHAR2(35) PRIMARY KEY NOT NULL,
"var_nombre_pieza"     VARCHAR2(35) NOT NULL,
"var_tipo_pieza"       VARCHAR2(35) NOT NULL,
"nbr_cantidad_pieza"   NUMBER NOT NULL,
"dt_fecha_fac_pieza"  DATE NOT NULL,
"var_status_pieza"       VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_pieza"   NUMBER NOT NULL
);

create table tb_componente(
"var_id_com"           VARCHAR2(35) PRIMARY KEY NOT NULL,
"var_nombre_com"       VARCHAR2(35) NOT NULL,
"var_tipo_com"         VARCHAR2(5) NOT NULL,
"var_status_com"       VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_com"   NUMBER NOT NULL
);

create table tb_rol(
"var_id_rol"           VARCHAR2(35) PRIMARY KEY NOT NULL,
"var_nombre_rol"       VARCHAR2(35) NOT NULL,
"dt_fecha_asigna_rol" DATE NOT NULL,
"var_status_rol"       VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_rol"   NUMBER NOT NULL
);

create table tb_permiso(
"var_id_perm"           VARCHAR2(35) PRIMARY KEY NOT NULL,
"var_entidad_perm"      VARCHAR2(35) NOT NULL,
"var_tipo_perm"         VARCHAR2(35) NOT NULL,
"dt_fecha_asigna_perm" DATE NOT NULL,
"dt_fecha_caduca_perm" DATE NOT NULL,
"var_status_perm"       VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_perm"   NUMBER NOT NULL
);

create table tb_misil(
"var_id_mis"            VARCHAR2(35) PRIMARY KEY NOT NULL,
"var_nombre_mis"        VARCHAR2(35) NOT NULL,
"var_tipo_mis"          VARCHAR2(35) NOT NULL,
"dt_fecha_entrega_mis" DATE NOT NULL,
"var_status_mis"        VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_mis"   NUMBER NOT NULL
);

create table tb_parametro(
"var_id_par"           VARCHAR2(35) PRIMARY KEY NOT NULL,
"var_descripcion_par"  VARCHAR2(35) NOT NULL,
"var_decreto_par"      VARCHAR2(35) NOT NULL,
"var_status_par"       VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_par"   NUMBER NOT NULL
);

create table tb_departamento(
"var_id_dept"           VARCHAR2(35) PRIMARY KEY NOT NULL,
"var_nombre_dept"       VARCHAR2(35) NOT NULL,
"var_tipo_dept"         VARCHAR2(35) NOT NULL,
"var_descripcion_dept"  VARCHAR2(35) NOT NULL,
"var_status_dept"       VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_dept"   NUMBER NOT NULL
);

create table tb_personal(
"var_cedula_per"            VARCHAR2(35) PRIMARY KEY NOT NULL,
"var_genero_per"        VARCHAR2(35) NOT NULL,
"var_nombre_per"        VARCHAR2(35) NOT NULL,
"var_email_per"         VARCHAR2(35) NOT NULL,
"dt_fecha_nac_per"     DATE NOT NULL,
"var_status_per"       VARCHAR2(35) NOT NULL,
"var_id_dept"           VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_per"   NUMBER NOT NULL,
CONSTRAINT fk_personal_departamento
FOREIGN KEY ("var_id_dept") REFERENCES tb_departamento ("var_id_dept")
ON DELETE CASCADE
);

create table tb_ingeniero(
"var_cedula_per"           VARCHAR2(35) PRIMARY KEY NOT NULL,
"var_especialidad_ing" VARCHAR2(35) NOT NULL,
CONSTRAINT fk_ingeniero_personal
FOREIGN KEY ("var_cedula_per" ) REFERENCES tb_personal ("var_cedula_per" )
ON DELETE CASCADE
);

create table tb_tecnico(
"var_cedula_per"            VARCHAR2(35) PRIMARY KEY NOT NULL,
"nbr_horas_experiencia" NUMBER NOT NULL,
CONSTRAINT fk_tecnico_personal
FOREIGN KEY ("var_cedula_per") REFERENCES tb_personal ("var_cedula_per")
ON DELETE CASCADE
);

create table tb_administrador(
"var_cedula_per"            VARCHAR2(35) PRIMARY KEY NOT NULL,
"nbr_num_proyectos_realizados" NUMBER NOT NULL,
CONSTRAINT fk_administrador_personal
FOREIGN KEY ("var_cedula_per") REFERENCES tb_personal ("var_cedula_per")
ON DELETE CASCADE
);

create table tb_especificacion(
"var_descripcion_esp"             VARCHAR2(35) NOT NULL,
"var_id_mis"           VARCHAR2(35) NOT NULL,
"var_id_par"           VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_esp"   NUMBER NOT NULL,
CONSTRAINT pk_especificacion 
PRIMARY KEY ("var_id_mis", "var_id_par"),
CONSTRAINT fk_especificacion_misil 
FOREIGN KEY ("var_id_mis") REFERENCES tb_misil ("var_id_mis")
ON DELETE CASCADE,
CONSTRAINT fk_especificacion_parametro 
FOREIGN KEY ("var_id_par") REFERENCES tb_parametro ("var_id_par") 
ON DELETE CASCADE
);

create table tb_stock(
"dt_fecha_compra"      DATE NOT NULL,
"var_id_pieza"         VARCHAR2(35) NOT NULL,
"var_id_pro"           VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_st"   NUMBER NOT NULL,
CONSTRAINT pk_stock 
PRIMARY KEY ("var_id_pieza", "var_id_pro"),
CONSTRAINT fk_stock_pieza 
FOREIGN KEY ("var_id_pieza") REFERENCES tb_pieza ("var_id_pieza") 
ON DELETE CASCADE,
CONSTRAINT fk_stock_proveedor 
FOREIGN KEY ("var_id_pro") REFERENCES tb_proveedor ("var_id_pro") 
ON DELETE CASCADE
);

create table tb_contenido(
"nbr_cantidad_necesaria" NUMBER NOT NULL,
"var_id_com"             VARCHAR2(35) NOT NULL,
"var_id_pieza"           VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_cont"   NUMBER NOT NULL,
CONSTRAINT pk_contenido 
PRIMARY KEY ("var_id_com", "var_id_pieza"),
CONSTRAINT fk_contenido_componente 
FOREIGN KEY ("var_id_com") REFERENCES tb_componente ("var_id_com") 
ON DELETE CASCADE,
CONSTRAINT fk_contenido_pieza 
FOREIGN KEY ("var_id_pieza") REFERENCES tb_pieza ("var_id_pieza") 
ON DELETE CASCADE
);

create table tb_autorizacion(
"var_descripcion_au"  VARCHAR2(35) NOT NULL,
"var_status_au"            VARCHAR2(35) NOT NULL,
"var_id_perm"           VARCHAR2(35) NOT NULL,
"var_id_rol"            VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_au"   NUMBER NOT NULL,
CONSTRAINT pk_autorizacion 
PRIMARY KEY ("var_id_perm", "var_id_rol"),
CONSTRAINT fk_autorizacion_permiso 
FOREIGN KEY ("var_id_perm") REFERENCES tb_permiso ("var_id_perm") 
ON DELETE CASCADE,
CONSTRAINT fk_autorizacion_rol 
FOREIGN KEY ("var_id_rol") REFERENCES tb_rol ("var_id_rol") 
ON DELETE CASCADE
);

create table tb_items(
"var_status_itm"  VARCHAR2(35) NOT NULL,
"var_id_com"            VARCHAR2(35) NOT NULL,
"var_id_mis"           VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_itm"   NUMBER NOT NULL,
CONSTRAINT pk_items  
PRIMARY KEY ("var_id_com", "var_id_mis"),
CONSTRAINT fk_items_componente 
FOREIGN KEY ("var_id_com") REFERENCES tb_componente ("var_id_com") 
ON DELETE CASCADE,
CONSTRAINT fk_items_misil 
FOREIGN KEY ("var_id_mis") REFERENCES tb_misil ("var_id_mis") 
ON DELETE CASCADE
);

create table tb_ficha_ensamblaje(
"dt_fecha_ensamblar" DATE NOT NULL,
"var_id_rol"          VARCHAR2(35) NOT NULL,
"var_cedula_per"          VARCHAR2(35) NOT NULL,
"var_id_mis"          VARCHAR2(35) NOT NULL,
"nbr_ix_indexpk_ens"   NUMBER NOT NULL,
CONSTRAINT pk_ficha_ensambaje  
PRIMARY KEY ("var_id_rol", "var_cedula_per", "var_id_mis"),
CONSTRAINT fk_ficha_ensambaje_rol 
FOREIGN KEY ("var_id_rol") REFERENCES tb_rol ("var_id_rol") 
ON DELETE CASCADE,
CONSTRAINT fk_ficha_ensambaje_personal 
FOREIGN KEY ("var_cedula_per") REFERENCES tb_personal ("var_cedula_per") 
ON DELETE CASCADE,
CONSTRAINT fk_ficha_ensambaje_misil 
FOREIGN KEY ("var_id_mis") REFERENCES tb_misil ("var_id_mis") 
ON DELETE CASCADE
);

CREATE UNIQUE INDEX ix_pk_pro ON tb_proveedor("nbr_ix_indexpk_pro");
CREATE UNIQUE INDEX ix_pk_pieza ON tb_pieza("nbr_ix_indexpk_pieza");
CREATE UNIQUE INDEX ix_pk_com ON tb_componente("nbr_ix_indexpk_com");
CREATE UNIQUE INDEX ix_pk_rol ON tb_rol("nbr_ix_indexpk_rol");
CREATE UNIQUE INDEX ix_pk_perm ON tb_permiso("nbr_ix_indexpk_perm");
CREATE UNIQUE INDEX ix_pk_mis ON tb_misil("nbr_ix_indexpk_mis");
CREATE UNIQUE INDEX ix_pk_par ON tb_parametro("nbr_ix_indexpk_par");
CREATE UNIQUE INDEX ix_pk_dept ON tb_departamento("nbr_ix_indexpk_dept");
CREATE UNIQUE INDEX ix_pk_per ON tb_personal("nbr_ix_indexpk_per");
CREATE UNIQUE INDEX ix_pk_esp ON tb_especificacion("var_id_mis", "var_id_par","nbr_ix_indexpk_esp");
CREATE UNIQUE INDEX ix_pk_st ON tb_stock("var_id_pieza", "var_id_pro","nbr_ix_indexpk_st");
CREATE UNIQUE INDEX ix_pk_cont ON tb_contenido("var_id_com", "var_id_pieza","nbr_ix_indexpk_cont");
CREATE UNIQUE INDEX ix_pk_au ON tb_autorizacion("var_id_perm", "var_id_rol","nbr_ix_indexpk_au");
CREATE UNIQUE INDEX ix_pk_itm ON tb_items("var_id_com", "var_id_mis","nbr_ix_indexpk_itm");
CREATE UNIQUE INDEX ix_pk_ens ON tb_ficha_ensamblaje("var_id_rol", "var_cedula_per", "var_id_mis","nbr_ix_indexpk_ens");

