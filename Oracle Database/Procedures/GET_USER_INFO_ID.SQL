create or replace PROCEDURE "GET_USER_INFO_ID" (
  i_user_mail        IN USERS.USER_ID%TYPE,
  o_user_id         OUT USERS.USER_ID%TYPE,
  o_user_mail       OUT USERS.USER_MAIL%TYPE,
  o_msisdn          OUT USERS.MSISDN%TYPE,
  o_user_surname    OUT USERS.USER_SURNAME%TYPE,
  o_user_name       OUT USERS.USER_NAME%TYPE
)
AS 
BEGIN

  SELECT USER_ID,
         USER_MAIL,
         MSISDN,
         USER_SURNAME,
         USER_NAME
    INTO o_user_id,
         o_user_mail,
         o_msisdn,
         o_user_surname,
         o_user_name
    FROM USERS U
   WHERE U.USER_MAIL = i_user_mail;  

END GET_USER_INFO_ID;