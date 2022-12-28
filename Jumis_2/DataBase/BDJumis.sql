BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Task" (
	"TASKID"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"nameTask"	TEXT NOT NULL,
	"description"	VARCHAR(200) NOT NULL,
	"nameList"	TEXT NOT NULL,
	"date"	DATE NOT NULL,
	"hour"	TIME NOT NULL
);
CREATE TABLE IF NOT EXISTS "UserTask" (
	"USERTASKID"	INTEGER NOT NULL,
	"TASKUSERID"	TEXT NOT NULL,
	FOREIGN KEY("USERTASKID") REFERENCES "User"("USERID"),
	FOREIGN KEY("TASKUSERID") REFERENCES "Task"("TASKID"),
	PRIMARY KEY("USERTASKID","TASKUSERID")
);
CREATE TABLE IF NOT EXISTS "User" (
	"USERID"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"email"	TEXT NOT NULL,
	"password"	TEXT NOT NULL
);
INSERT INTO "Task" VALUES (1,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (2,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (3,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (4,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (5,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (6,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (7,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (8,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (9,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (10,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (11,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (12,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (13,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (14,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (15,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (16,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (17,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (18,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (19,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (20,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (21,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (22,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (23,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (24,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (25,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (26,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (27,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (28,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (29,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (30,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "Task" VALUES (31,'Tarea 1 Android','Tarea','Lista ucam','2022-10-21','10:30:00');
INSERT INTO "Task" VALUES (32,'Tarea 2 Sistemas','Tarea de sistema','Lista ucam','2022-10-25','11:08:00');
INSERT INTO "UserTask" VALUES (1,'1');
INSERT INTO "UserTask" VALUES (1,'2');
INSERT INTO "User" VALUES (1,'isaac','1234');
INSERT INTO "User" VALUES (2,'isaac','1234');
COMMIT;
