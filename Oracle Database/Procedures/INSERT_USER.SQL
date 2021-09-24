create or replace PROCEDURE "INSERT_USER" (
  i_password        IN USERS.PASSWORD%TYPE,
  i_user_mail       IN USERS.USER_MAIL%TYPE,
  i_msisdn          IN USERS.MSISDN%TYPE,
  i_user_surname    IN USERS.USER_SURNAME%TYPE,
  i_user_name       IN USERS.USER_NAME%TYPE,
  i_passchangecode  IN USERS.PASSCHANGECODE%TYPE DEFAULT NULL
)
AS 
BEGIN
  
  INSERT INTO USERS (USER_ID, PASSWORD, USER_MAIL, MSISDN, USER_SURNAME, USER_NAME, PASSCHANGECODE)
  VALUES (NULL, i_password, i_user_mail, i_msisdn, i_user_surname, i_user_name, i_passchangecode);

  COMMIT;

END INSERT_USER;