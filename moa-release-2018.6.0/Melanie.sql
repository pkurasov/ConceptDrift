
\pset footer off    
\echo             
/*

BEGIN;
--Get Started: time sudo -u postgres psql -d melanie -U postgres -f Melanie.sql
-- Create the table:


DROP TABLE IF EXISTS reoccuring50_0;

DROP TABLE IF EXISTS abrupt50_0;  -- Revisions, etc.

CREATE TABLE abrupt50_0 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,ls
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY abrupt50_0 FROM 'NumericOutputAbrupt_50_0.csv' DELIMITER ',' CSV;	

ALTER TABLE abrupt50_0
ADD COLUMN id SERIAL;

--SELECT * FROM abrupt50_0 LIMIT 10;



-- Create the table:
DROP TABLE IF EXISTS incrimental50_0;  -- Revisions, etc.

CREATE TABLE incrimental50_0 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY incrimental50_0 FROM 'NumericOutputIncrimental_50_0.csv' DELIMITER ',' CSV;	

ALTER TABLE incrimental50_0
ADD COLUMN id SERIAL;

--SELECT * FROM incrimental50_0 LIMIT 10;




-- Create the table:
DROP TABLE IF EXISTS no_drift50_0;  -- Revisions, etc.

CREATE TABLE no_drift50_0 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY no_drift50_0 FROM 'NumericOutputNoDrift_50_0.csv' DELIMITER ',' CSV;	

ALTER TABLE no_drift50_0
ADD COLUMN id SERIAL;

--SELECT * FROM no_drift50_0 LIMIT 10;



-- Create the table:
DROP TABLE IF EXISTS reoccuring_drift50_0;  -- Revisions, etc.


CREATE TABLE reoccuring_drift50_0 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY reoccuring_drift50_0 FROM 'NumericOutputReoccuring_50_0.csv' DELIMITER ',' CSV;	

ALTER TABLE reoccuring_drift50_0
ADD COLUMN id SERIAL;

--SELECT * FROM reoccuring_drift50_0 LIMIT 10;


-- Create the table:
DROP TABLE IF EXISTS abrupt500_0;  -- Revisions, etc.


CREATE TABLE abrupt500_0 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY abrupt500_0 FROM 'NumericOutputAbrupt_500_0.csv' DELIMITER ',' CSV;	

ALTER TABLE abrupt500_0
ADD COLUMN id SERIAL;

--SELECT * FROM abrupt500_0 LIMIT 10;



-- Create the table:
DROP TABLE IF EXISTS incrimental500_0;  -- Revisions, etc.


CREATE TABLE incrimental500_0 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY incrimental500_0 FROM 'NumericOutputIncremental_500_0.csv' DELIMITER ',' CSV;	

ALTER TABLE incrimental500_0
ADD COLUMN id SERIAL;

--SELECT * FROM incrimental500_0 LIMIT 10;
--CREATE TABLE abrupt_avg_50 AS




-- Create the table:
DROP TABLE IF EXISTS no_drift500_0;  -- Revisions, etc.


CREATE TABLE no_drift500_0 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY no_drift500_0 FROM 'NumericOutputNoDrift_500_0.csv' DELIMITER ',' CSV;	

ALTER TABLE no_drift500_0
ADD COLUMN id SERIAL;

--SELECT * FROM no_drift500_0 LIMIT 10;





-- Create the table:
DROP TABLE IF EXISTS reoccuring_drift500_0;  -- Revisions, etc.


CREATE TABLE reoccuring_drift500_0 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY reoccuring_drift500_0 FROM 'NumericOutputReoccuring_500_0.csv' DELIMITER ',' CSV;	

ALTER TABLE reoccuring_drift500_0
ADD COLUMN id SERIAL;

--SELECT * FROM reoccuring_drift500_0 LIMIT 10;





-- Create the table:
DROP TABLE IF EXISTS abrupt5000_0;  -- Revisions, etc.


CREATE TABLE abrupt5000_0 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY abrupt5000_0 FROM 'NumericOutputAbrupt_5000_0.csv' DELIMITER ',' CSV;	

ALTER TABLE abrupt5000_0
ADD COLUMN id SERIAL;

--SELECT * FROM abrupt5000_0 LIMIT 10;


-- Create the table:
DROP TABLE IF EXISTS incrimental5000_0;  -- Revisions, etc.


CREATE TABLE incrimental5000_0 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY incrimental5000_0 FROM 'NumericOutputIncremental_5000_0.csv' DELIMITER ',' CSV;	

ALTER TABLE incrimental5000_0
ADD COLUMN id SERIAL;

SELECT * FROM incrimental5000_0 LIMIT 10;


-- Create the table:
DROP TABLE IF EXISTS reoccuring_drift5000_0;  -- Revisions, etc.


CREATE TABLE reoccuring_drift5000_0 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY reoccuring_drift5000_0 FROM 'NumericOutputReoccuring_5000_0.csv' DELIMITER ',' CSV;	

ALTER TABLE reoccuring_drift5000_0
ADD COLUMN id SERIAL;

SELECT * FROM reoccuring_drift5000_0 LIMIT 10;

-- Create the table:
DROP TABLE IF EXISTS abrupt50_1;  -- Revisions, etc.


CREATE TABLE abrupt50_1 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY abrupt50_1 FROM 'NumericOutputAbrupt_50_1.csv' DELIMITER ',' CSV;	

ALTER TABLE abrupt50_1
ADD COLUMN id SERIAL;

SELECT * FROM abrupt50_1 LIMIT 10;


-- Create the table:
DROP TABLE IF EXISTS incrimental50_6;  -- Revisions, etc.


CREATE TABLE incrimental50_6 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY incrimental50_6 FROM 'NumericOutputIncremental_50_6.csv' DELIMITER ',' CSV;	

ALTER TABLE incrimental50_6
ADD COLUMN id SERIAL;

SELECT * FROM incrimental50_6 LIMIT 10;


-- Create the table:
DROP TABLE IF EXISTS no_drift50_1;  -- Revisions, etc.


CREATE TABLE no_drift50_1 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY no_drift50_1 FROM 'NumericOutputNoDrift_50_1.csv' DELIMITER ',' CSV;	

ALTER TABLE no_drift50_1
ADD COLUMN id SERIAL;

SELECT * FROM no_drift50_1 LIMIT 10;

-- Create the table:
DROP TABLE IF EXISTS no_drift50_2;  -- Revisions, etc.


CREATE TABLE no_drift50_2 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY no_drift50_2 FROM 'NumericOutputNoDrift_50_2.csv' DELIMITER ',' CSV;	

ALTER TABLE no_drift50_2
ADD COLUMN id SERIAL;

SELECT * FROM no_drift50_2 LIMIT 10;



-- Create the table:
DROP TABLE IF EXISTS incrimental500_6;  -- Revisions, etc.


CREATE TABLE incrimental500_6 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY incrimental500_6 FROM 'NumericOutputIncremental_500_6.csv' DELIMITER ',' CSV;	

ALTER TABLE incrimental500_6
ADD COLUMN id SERIAL;

SELECT * FROM incrimental500_6 LIMIT 10;


-- Create the table:
DROP TABLE IF EXISTS abrupt500_1;  -- Revisions, etc.


CREATE TABLE abrupt500_1 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY abrupt500_1 FROM 'NumericOutputAbrupt_500_1.csv' DELIMITER ',' CSV;	

ALTER TABLE abrupt500_1
ADD COLUMN id SERIAL;

SELECT * FROM abrupt500_1 LIMIT 10;




-- Create the table:
DROP TABLE IF EXISTS abrupt5000_1;  -- Revisions, etc.


CREATE TABLE abrupt5000_1 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY abrupt5000_1 FROM 'NumericOutputAbrupt_5000_1.csv' DELIMITER ',' CSV;	

ALTER TABLE abrupt5000_1
ADD COLUMN id SERIAL;

SELECT * FROM abrupt5000_1 LIMIT 10;




-- Create the table:
DROP TABLE IF EXISTS reoccuring_drift50_1;  -- Revisions, etc.


CREATE TABLE reoccuring_drift50_1 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY reoccuring_drift50_1 FROM 'NumericOutputReoccuring_50_1.csv' DELIMITER ',' CSV;	

ALTER TABLE reoccuring_drift50_1
ADD COLUMN id SERIAL;

SELECT * FROM reoccuring_drift50_1 LIMIT 10;



-- Create the table:
DROP TABLE IF EXISTS reoccuring_drift5000_1;  -- Revisions, etc.


CREATE TABLE reoccuring_drift5000_1 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY reoccuring_drift5000_1 FROM 'NumericOutputReoccuring_50_1.csv' DELIMITER ',' CSV;	

ALTER TABLE reoccuring_drift5000_1
ADD COLUMN id SERIAL;

SELECT * FROM reoccuring_drift5000_1 LIMIT 10;



-- Create the table:
DROP TABLE IF EXISTS boost_no_drift50_0;  -- Revisions, etc.


CREATE TABLE boost_no_drift50_0 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY boost_no_drift50_0 FROM 'BoostingOutputNoDrift_50_0.csv' DELIMITER ',' CSV;	

ALTER TABLE boost_no_drift50_0
ADD COLUMN id SERIAL;

SELECT * FROM boost_no_drift50_0 LIMIT 10;




-- Create the table:
DROP TABLE IF EXISTS boost_no_drift50_1;  -- Revisions, etc.


CREATE TABLE boost_no_drift50_1 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY boost_no_drift50_1 FROM 'BoostingOutputNoDrift_50_1.csv' DELIMITER ',' CSV;	

ALTER TABLE boost_no_drift50_1
ADD COLUMN id SERIAL;

SELECT * FROM boost_no_drift50_1 LIMIT 10;




DROP TABLE IF EXISTS boost_no_mel_no_drift50_0;  -- Revisions, etc.


CREATE TABLE boost_no_mel_no_drift50_0 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY boost_no_mel_no_drift50_0 FROM 'boosting_no_mel_no_drift_50_0.csv' DELIMITER ',' CSV;	

ALTER TABLE boost_no_mel_no_drift50_0
ADD COLUMN id SERIAL;

SELECT * FROM boost_no_mel_no_drift50_0 LIMIT 10;


DROP TABLE IF EXISTS ddm_with_boost_50_0;  -- Revisions, etc.


CREATE TABLE ddm_with_boost_50_0 (
    learning_evaluation_instances NUMERIC,
    evaluation_time_cpu_seconds NUMERIC,
    model_cost_RAM_Hours NUMERIC,
    classified_instances NUMERIC,
    classifications_correct_percent NUMERIC,
    Kappa_Statistic_percent NUMERIC,
    Kappa_Temporal_Statistic_percent NUMERIC,
    Kappa_M_Statistic_percent NUMERIC,
    model_training_instances NUMERIC,
    model_serialized_size_bytes NUMERIC
);

\COPY ddm_with_boost_50_0 FROM 'ddm_with_boost_50_0.csv' DELIMITER ',' CSV;	

ALTER TABLE ddm_with_boost_50_0
ADD COLUMN id SERIAL;

SELECT * FROM ddm_with_boost_50_0 LIMIT 10;



COMMIT;
ANALYZE abrupt5000_0;
ANALYZE abrupt5000_1;
ANALYZE abrupt500_0;
ANALYZE abrupt500_1;
ANALYZE abrupt50_0;
ANALYZE abrupt50_1;
ANALYZE incrimental50_6;
ANALYZE incrimental500_0;
ANALYZE incrimental50_0;
ANALYZE no_drift500_0;
ANALYZE no_drift50_0;
ANALYZE no_drift50_1;
ANALYZE no_drift50_2;
ANALYZE reoccuring_drift5000_0;
ANALYZE reoccuring_drift5000_1;
ANALYZE reoccuring_drift500_0;
ANALYZE reoccuring_drift50_0;
ANALYZE reoccuring_drift50_1;
ANALYZE incrimental5000_0;
ANALYZE incrimental500_6;
ANALYZE boost_no_drift50_0;
ANALYZE boost_no_drift50_1;
ANALYZE boost_no_mel_no_drift50_0;
ANALYZE ddm_with_boost_50_0;


*/
DROP TABLE IF EXISTS AVGtheta_nd_50_0;

CREATE TABLE AVGtheta_nd_50_0 AS
select ((seqnum - 1) / 10) as num_ex_recieved, avg(classifications_correct_percent) as accuracy
from (select row_number() over (order by id) as seqnum, no_drift50_0.*
      from no_drift50_0) no_drift50_0
group by ((seqnum - 1) / 10)
order by 1;

--SELECT * FROM AVGtheta_nd_50_0; 


DROP TABLE IF EXISTS AVGtheta_nd_50_1;  -- Revisions, etc.

CREATE TABLE AVGtheta_nd_50_1 AS
select ((seqnum - 1) / 10) as num_ex_recieved, avg(classifications_correct_percent) as accuracy
from (select row_number() over (order by id) as seqnum, no_drift50_1.*
      from no_drift50_1) no_drift50_1
group by ((seqnum - 1) / 10)
order by 1;

--SELECT * FROM AVGtheta_nd_50_1; 

DROP TABLE IF EXISTS AVGtheta_nd_50_2;  -- Revisions, etc.

CREATE TABLE AVGtheta_nd_50_2 AS
select ((seqnum - 1) / 10) as num_ex_recieved, avg(classifications_correct_percent) as accuracy
from (select row_number() over (order by id) as seqnum, no_drift50_2.*
      from no_drift50_2) no_drift50_2
group by ((seqnum - 1) / 10)
order by 1;

--SELECT * FROM AVGtheta_nd_50_2; 

SELECT boost_no_mel_no_drift50_0.id as num_ex_recieved,boost_no_mel_no_drift50_0.classifications_correct_percent as OnlineBoosting,AVGtheta_nd_50_0.accuracy as Melanie_with_no_src_avg_theta,ddm_with_boost_50_0.classifications_correct_percent as ddm_with_boosting FROM boost_no_mel_no_drift50_0,ddm_with_boost_50_0,AVGtheta_nd_50_0 where boost_no_mel_no_drift50_0.id = AVGtheta_nd_50_0.num_ex_recieved and AVGtheta_nd_50_0.num_ex_recieved = ddm_with_boost_50_0.id; 


/*

DROP TABLE IF EXISTS temp_incrimental_50_0;

CREATE TABLE temp_incrimental_50_0 AS
select ((seqnum - 1) / 10) as num_ex_recieved, avg(classifications_correct_percent) as accuracy
from (select row_number() over (order by id) as seqnum, incrimental50_0.*
      from incrimental50_0) incrimental50_0
group by ((seqnum - 1) / 10)
order by 1;

SELECT * FROM temp_incrimental_50_0; 






DROP TABLE IF EXISTS avg_nd_50;

CREATE TABLE avg_nd_50 AS
(SELECT temp_nd_50_0.num_ex_recieved as num_ex_recieved, temp_nd_50_0.accuracy as zero_src_accuracy, temp_nd_50_1.accuracy as one_src_accuracy, temp_nd_50_2.accuracy as two_src_accuracy
from temp_nd_50_0,temp_nd_50_1,temp_nd_50_2
WHERE temp_nd_50_0.num_ex_recieved = temp_nd_50_1.num_ex_recieved 
AND temp_nd_50_1.num_ex_recieved = temp_nd_50_2.num_ex_recieved);


DROP TABLE IF EXISTS norm_avg_nd_50;

CREATE TABLE norm_avg_nd_50 AS
(SELECT avg_nd_50.num_ex_recieved as num_ex_recieved, round((zero_src_accuracy/100),2) as zero_src_accuracy, 
round((one_src_accuracy/100),2) as one_src_accuracy, round((two_src_accuracy/100),2) as two_src_accuracy
FROM avg_nd_50);


DROP TABLE IF EXISTS temp_abrupt;  -- Revisions, etc.

CREATE TABLE temp_abrupt AS
select ((seqnum - 1) / 10) as whichgroup, avg(classifications_correct_percent) as abrupt
from (select row_number() over (order by id) as seqnum, abrupt50_0.*
      from abrupt50_0) abrupt50_0
group by ((seqnum - 1) / 10)
order by 1;



DROP TABLE IF EXISTS temp_incrimental;  -- Revisions, etc.


CREATE TEMPORARY TABLE temp_incrimental AS
(select ((seqnum - 1) / 10) as whichgroup, avg(classifications_correct_percent) as incrimental
from (select row_number() over (order by id) as seqnum, incrimental50_0.*
      from incrimental50_0) incrimental50_0
group by ((seqnum - 1) / 10)
order by 1);


DROP TABLE IF EXISTS temp_no_drift;

CREATE TEMPORARY TABLE temp_no_drift AS
(select ((seqnum - 1) / 10) as whichgroup, avg(classifications_correct_percent) as no_drift
from (select row_number() over (order by id) as seqnum, no_drift50_0.*
      from no_drift50_0) no_drift50_0
group by ((seqnum - 1) / 10)
order by 1);


DROP TABLE IF EXISTS temp_reoccuring_drift;

CREATE TEMPORARY TABLE temp_reoccuring_drift AS
(select ((seqnum - 1) / 10) as whichgroup, avg(classifications_correct_percent) as reoccuring
from (select row_number() over (order by id) as seqnum, reoccuring_drift50_0.*
      from reoccuring_drift50_0) reoccuring_drift50_0
group by ((seqnum - 1) / 10)
order by 1);


DROP TABLE IF EXISTS avg_50_0;

CREATE TABLE avg_50_0 AS
(SELECT temp_abrupt.whichgroup as whichgroup, temp_abrupt.abrupt as abrupt, temp_incrimental.incrimental as incrimental, temp_no_drift.no_drift as no_drift,temp_reoccuring_drift.reoccuring as reoccuring
from temp_abrupt,temp_incrimental,temp_no_drift,temp_reoccuring_drift 
WHERE temp_incrimental.whichgroup = temp_abrupt.whichgroup AND temp_incrimental.whichgroup = temp_no_drift.whichgroup
AND temp_no_drift.whichgroup = temp_reoccuring_drift.whichgroup);

SELECT * FROM avg_50_0; 

*/




