create or replace PROCEDURE "LOAD_USER_MSISDN" (
    i_msisdn IN USERS.MSISDN%TYPE,
    i_password IN USERS.PASSWORD%TYPE,
    o_is_confirmed OUT NUMBER
)
AS
BEGIN
  
  SELECT COUNT(*)
    INTO o_is_confirmed
    FROM USERS
   WHERE MSISDN = i_msisdn
     AND PASSWORD = i_password;
  
END LOAD_USER_MSISDN;