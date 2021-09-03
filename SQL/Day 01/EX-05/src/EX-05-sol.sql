-- Exercise SQL01-EX-05

-- creating test_relational_database
CREATE TABLE test (
    CUSTOMERNAME varchar(255)
);

INSERT INTO test (CUSTOMERNAME) VALUES ('Ahmet Mehmet');
INSERT INTO test (CUSTOMERNAME) VALUES ('Ali Ak');
INSERT INTO test (CUSTOMERNAME) VALUES ('Su Ak');
INSERT INTO test (CUSTOMERNAME) VALUES ('Suadiye Mehmet Ahmet');

SELECT * FROM test;

-- query to mask full name
SELECT 
  -- mask first name 
  CONCAT (
    CONCAT(
      SUBSTR(full_name, 1, 2), 
      REGEXP_REPLACE(
        SUBSTR(
          REGEXP_SUBSTR(full_name, '[^ ]+', 1, 1), 
          3, 
          LENGTH(
            REGEXP_SUBSTR(full_name, '[^ ]+', 1, 1)
          )
        ), 
        '.', 
        '*'
      )
    ), 
    ' '
  ) || 
  -- if there are more than 2 words in the full name
  CASE WHEN LENGTH(full_name) - LENGTH(
    REPLACE(full_name, ' ', '')
  ) = 2 THEN (
    -- mask second name and concat with space -- rpad, lpad could be used instead of concat
    CONCAT(
      REGEXP_REPLACE(
        REGEXP_SUBSTR(full_name, '[^ ]+', 1, 2) 
        /*source_char*/
        , 
        '.' 
        /*pattern*/
        , 
        '*' 
        /*replace_string*/
        ), 
      ' '
    ) ||
    -- mask surname which is third word in the full name and concat
    CONCAT(
      SUBSTR(
        REGEXP_SUBSTR(full_name, '[^ ]+', 1, 3), 
        1, 
        2
      ), 
      REGEXP_REPLACE(
        SUBSTR(
          REGEXP_SUBSTR(full_name, '[^ ]+', 1, 3), 
          3, 
          LENGTH(
            REGEXP_SUBSTR(full_name, '[^ ]+', 1, 1)
          )
        ), 
        '.', 
        '*'
      )
    )
  ) 
  -- if there are just two words
  ELSE (
    CONCAT(
      SUBSTR(
        REGEXP_SUBSTR(full_name, '[^ ]+', 1, 2), 
        1, 
        2
      ), 
      REGEXP_REPLACE(
        SUBSTR(
          REGEXP_SUBSTR(full_name, '[^ ]+', 1, 2), 
          3, 
          LENGTH(
            REGEXP_SUBSTR(full_name, '[^ ]+', 1, 2)
          )
        ), 
        '.', 
        '*'
      )
    )
  ) END MASKED_FULL_NAME
FROM 
  (
    SELECT 
      CUSTOMERNAME as full_name 
    FROM 
      test
  ) sub;