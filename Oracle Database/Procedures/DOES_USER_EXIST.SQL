create or replace PROCEDURE "DOES_USER_EXIST" (
  i_msisdn      IN USERS.MSISDN%TYPE,
  o_does_exist OUT NUMBER
)
AS 
BEGIN

  SELECT COUNT(*)
    INTO o_does_exist
    FROM USERS
   WHERE MSISDN = i_msisdn;

END DOES_USER_EXIST;