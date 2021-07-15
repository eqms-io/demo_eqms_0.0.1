BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "P_WBS_01" (
	"project_number"	INTEGER,
	"project_name"	TEXT,
	"project_phase"	INTEGER,
	"wbs_number"	INTEGER,
	"wbs_name"	TEXT,
	"wbs_dictionary"	TEXT
);
CREATE TABLE IF NOT EXISTS "P_CH_01" (
	"project_name"	TEXT,
	"project_desc"	TEXT,
	"project_scope"	TEXT,
	"project_req"	TEXT,
	"project_obj"	TEXT,
	"project_date_start"	INTEGER,
	"project_date_end"	INTEGER,
	"project_budget"	INTEGER,
	"project_cons"	INTEGER,
	"project_risk"	TEXT,
	"project_ref"	TEXT,
	"project_ksth"	TEXT,
	"project_owner"	INTEGER,
	"project_client"	INTEGER,
	"project_sponsor"	INTEGER,
	"project_manager"	TEXT,
	"project_stname"	TEXT,
	"project_authority"	TEXT,
	"project_approvals"	TEXT,
	"project_key"	INTEGER
);
CREATE TABLE IF NOT EXISTS "P_PJST_01" (
	"project_number"	INTEGER,
	"project_name"	TEXT,
	"project_revnr"	NUMERIC,
	"project_revdate"	REAL,
	"project_purpose"	TEXT,
	"project_goals"	TEXT,
	"project_product"	TEXT,
	"project_service"	TEXT,
	"project_delnames"	TEXT,
	"project_deldate"	TEXT,
	"project_delstatus"	NUMERIC,
	"project_delresp"	TEXT,
	"project_delcoms"	INTEGER,
	"project_milestones"	BLOB,
	"project_miledatestart"	INTEGER,
	"project_miledateend"	INTEGER,
	"project_cons"	TEXT,
	"project_assumpts"	TEXT,
	"project_exclusions"	TEXT,
	"project_refs"	INTEGER,
	FOREIGN KEY("project_name") REFERENCES "P_CH_01"("project_name"),
	FOREIGN KEY("project_cons") REFERENCES "P_CH_01"("project_cons")
);
CREATE TABLE IF NOT EXISTS "P_ORG_01" (
	"project_name"	INTEGER,
	"project_manager"	TEXT,
	""	INTEGER,
	FOREIGN KEY("project_name") REFERENCES "P_CH_01"("project_name"),
	PRIMARY KEY("project_name"),
	FOREIGN KEY("project_manager") REFERENCES "P_CH_01"("project_manager")
);
CREATE TABLE IF NOT EXISTS "P_SR_01" (
	"project_number"	INTEGER,
	"project_name"	TEXT,
	"project_phase"	INTEGER,
	"rev_level"	INTEGER,
	"rev_date"	INTEGER,
	"sr_datestart"	NUMERIC,
	"id_number"	INTEGER,
	"names"	TEXT,
	"project_roles"	TEXT,
	"department"	TEXT,
	"designation"	TEXT,
	"type"	TEXT,
	"communication"	TEXT,
	"interest"	INTEGER,
	"Influence"	INTEGER,
	"comments"	INTEGER,
	FOREIGN KEY("project_number") REFERENCES "P_PJST_01"("project_number"),
	FOREIGN KEY("project_name") REFERENCES "P_CH_01"("project_manager")
);
CREATE TABLE IF NOT EXISTS "P_CEP_01" (
	"project_number"	INTEGER,
	"project_name"	INTEGER,
	"wbs_nr"	INTEGER,
	"wbs_name"	TEXT,
	"cep_total_cost"	INTEGER,
	"cep_budg_var"	INTEGER,
	"cep_vac"	INTEGER,
	"cep_eac"	INTEGER,
	"cep_hours"	INTEGER,
	"cep_resource"	INTEGER,
	FOREIGN KEY("wbs_nr") REFERENCES "P_WBS_01"("wbs_number"),
	FOREIGN KEY("wbs_name") REFERENCES "P_WBS_01"("wbs_name"),
	FOREIGN KEY("project_number") REFERENCES "P_WBS_01"("project_number"),
	FOREIGN KEY("project_name") REFERENCES "P_WBS_01"("project_name")
);
CREATE TABLE IF NOT EXISTS "P_RA_01" (
	"project_name"	INTEGER,
	"project_number"	INTEGER,
	"project_manager"	INTEGER,
	"date_created"	INTEGER,
	"project_phase"	INTEGER,
	"rev_level"	INTEGER,
	"rev_date"	INTEGER,
	"wbs_nr"	INTEGER,
	"risk_type"	INTEGER,
	"risk_id"	INTEGER,
	"risk_status"	INTEGER,
	"risk_priority"	INTEGER,
	"risk_description"	INTEGER,
	"responsible"	INTEGER,
	"open_date"	INTEGER,
	"close_date"	INTEGER,
	"rate_impact"	INTEGER,
	"rate_likehood"	INTEGER,
	"rate_severity"	INTEGER,
	"action_plan"	INTEGER,
	"mitig_prior"	INTEGER,
	"mitig_after"	INTEGER,
	"mitig_strategy"	INTEGER,
	"conting_budg"	INTEGER,
	"risk_comms"	INTEGER,
	FOREIGN KEY("wbs_nr") REFERENCES "P_WBS_01"("wbs_number"),
	FOREIGN KEY("project_phase") REFERENCES "P_SR_01"("project_phase"),
	PRIMARY KEY("project_name","project_number"),
	FOREIGN KEY("project_number") REFERENCES "P_PJST_01"("project_number"),
	FOREIGN KEY("project_name") REFERENCES "P_CH_01"("project_name"),
	FOREIGN KEY("project_manager") REFERENCES "P_CH_01"("project_manager")
);
CREATE TABLE IF NOT EXISTS "P_RA_01_Rates" (
	"Rate_impact"	INTEGER,
	"Rate_impact_nr"	INTEGER,
	"Cost"	INTEGER,
	"Schedule"	INTEGER,
	"rate_likehood"	INTEGER,
	"rate_likehood_nr"	INTEGER,
	"occurance"	INTEGER
);
CREATE TABLE IF NOT EXISTS "P_RES_01" (
	"type"	INTEGER,
	"organization"	INTEGER,
	"name"	INTEGER,
	"wbs_id"	INTEGER,
	"department"	INTEGER
);
COMMIT;
