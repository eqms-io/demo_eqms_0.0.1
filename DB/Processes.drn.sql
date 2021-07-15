BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "info" (
	"key"	text,
	"value"	text,
	PRIMARY KEY("key")
);
CREATE TABLE IF NOT EXISTS "diagrams" (
	"diagram_id"	integer,
	"name"	text UNIQUE,
	"origin"	text,
	"description"	text,
	"zoom"	double,
	PRIMARY KEY("diagram_id")
);
CREATE TABLE IF NOT EXISTS "state" (
	"row"	integer,
	"current_dia"	integer,
	"description"	text,
	PRIMARY KEY("row")
);
CREATE TABLE IF NOT EXISTS "items" (
	"item_id"	integer,
	"diagram_id"	integer,
	"type"	text,
	"text"	text,
	"selected"	integer,
	"x"	integer,
	"y"	integer,
	"w"	integer,
	"h"	integer,
	"a"	integer,
	"b"	integer,
	"aux_value"	integer,
	"color"	text,
	"format"	text,
	"text2"	text,
	PRIMARY KEY("item_id")
);
CREATE TABLE IF NOT EXISTS "diagram_info" (
	"diagram_id"	integer,
	"name"	text,
	"value"	text,
	PRIMARY KEY("diagram_id","name")
);
CREATE TABLE IF NOT EXISTS "tree_nodes" (
	"node_id"	integer,
	"parent"	integer,
	"type"	text,
	"name"	text,
	"diagram_id"	integer,
	PRIMARY KEY("node_id")
);
INSERT INTO "info" VALUES ('type','drakon');
INSERT INTO "info" VALUES ('version','27');
INSERT INTO "info" VALUES ('start_version','1');
INSERT INTO "diagrams" VALUES (1,'Untitled','0 0',NULL,100.0);
INSERT INTO "state" VALUES (1,1,NULL);
INSERT INTO "items" VALUES (1,1,'beginend','Untitled',0,170,60,100,20,60,0,NULL,NULL,NULL,NULL);
INSERT INTO "items" VALUES (2,1,'beginend','End',0,660,510,60,20,60,0,NULL,NULL,NULL,NULL);
INSERT INTO "items" VALUES (3,1,'vertical','',0,170,80,0,520,0,0,NULL,NULL,NULL,NULL);
INSERT INTO "items" VALUES (4,1,'vertical','',0,420,120,0,480,0,0,NULL,NULL,NULL,NULL);
INSERT INTO "items" VALUES (5,1,'vertical','',0,660,120,0,380,0,0,NULL,NULL,NULL,NULL);
INSERT INTO "items" VALUES (6,1,'horizontal','',0,170,120,490,0,0,0,NULL,NULL,NULL,NULL);
INSERT INTO "items" VALUES (7,1,'arrow','',0,20,120,150,480,400,1,NULL,NULL,NULL,NULL);
INSERT INTO "items" VALUES (8,1,'branch','branch 1',0,170,170,50,30,60,0,NULL,NULL,NULL,NULL);
INSERT INTO "items" VALUES (9,1,'address','branch 2',0,170,550,50,30,60,0,NULL,NULL,NULL,NULL);
INSERT INTO "items" VALUES (10,1,'branch','branch 2',0,420,170,50,30,60,0,NULL,NULL,NULL,NULL);
INSERT INTO "items" VALUES (11,1,'branch','branch 3',0,660,170,50,30,60,0,NULL,NULL,NULL,NULL);
INSERT INTO "items" VALUES (12,1,'address','branch 3',0,420,550,50,30,60,0,NULL,NULL,NULL,NULL);
INSERT INTO "items" VALUES (13,1,'horizontal',NULL,0,170,60,200,0,0,0,NULL,NULL,NULL,NULL);
INSERT INTO "items" VALUES (14,1,'action',NULL,0,370,60,60,30,0,0,NULL,NULL,NULL,NULL);
INSERT INTO "tree_nodes" VALUES (1,0,'item',NULL,1);
CREATE INDEX IF NOT EXISTS "items_per_diagram" ON "items" (
	"diagram_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "node_for_diagram" ON "tree_nodes" (
	"diagram_id"
);
COMMIT;
