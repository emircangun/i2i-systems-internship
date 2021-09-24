create or replace PROCEDURE "GET_SUBSCRIBER_INFO" (
  i_msisdn     IN USERS.MSISDN%TYPE,
  i_password   IN USERS.PASSWORD%TYPE,
  o_name      OUT USERS.USER_NAME%TYPE,
  o_surname   OUT USERS.USER_SURNAME%TYPE,
  o_mail      OUT USERS.USER_MAIL%TYPE
)
AS 
BEGIN

  SELECT USER_NAME,
         USER_SURNAME,
         USER_MAIL
    INTO o_name,
         o_surname,
         o_mail
    FROM USERS
   WHERE PASSWORD = i_password
     AND MSISDN = i_msisdn;

END GET_SUBSCRIBER_INFO;