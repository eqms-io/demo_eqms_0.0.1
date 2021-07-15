BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "pre_fmea" (
	"ID"	INTEGER,
	"Content"	NUMERIC,
	"Operation Sequence"	REAL,
	"Characteristics ID"	TEXT,
	"Potential Failure Mode"	TEXT,
	"Potential Effects of Failure"	TEXT,
	"Severity"	INTEGER,
	"Classification"	INTEGER,
	"Potential Cause of Failure"	TEXT,
	"Controls Prevention"	TEXT,
	"Occurance"	INTEGER,
	"Contorls Detecion"	TEXT,
	"Detection"	INTEGER,
	"RPN"	NUMERIC,
	"Recommended Action"	TEXT,
	"Responsible"	TEXT,
	"Date"	INTEGER,
	"Actions Taken"	TEXT,
	"Completion Date"	INTEGER,
	"A Severity"	INTEGER,
	"A Occurance"	INTEGER,
	"A Detection"	INTEGER,
	"A RPN"	NUMERIC,
	PRIMARY KEY("ID")
);
COMMIT;
