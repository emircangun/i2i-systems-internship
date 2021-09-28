create or replace PROCEDURE "REG_REQUEST" (
  i_name            IN USERS_TO_BE.NAME%TYPE,
  i_surname         IN USERS_TO_BE.SURNAME%TYPE,
  i_mail            IN USERS_TO_BE.MAIL%TYPE,
  i_msisdn          IN USERS_TO_BE.MSISDN%TYPE,
  i_password        IN USERS_TO_BE.PASSWORD%TYPE,
  i_generated_code  IN USERS_TO_BE.GENERATED_CODE%TYPE,
  o_register_confirmation_id OUT USERS_TO_BE.REGISTER_CONFIRMATION_ID%TYPE
)
AS   
BEGIN

    o_register_confirmation_id := dbms_random.value(1000, 9999);

    INSERT INTO USERS_TO_BE (REGISTER_CONFIRMATION_ID, NAME, SURNAME, MAIL, MSISDN, PASSWORD, GENERATED_CODE)
    VALUES (o_register_confirmation_id, i_name, i_surname, i_mail, i_msisdn, i_password, i_generated_code);
    
    COMMIT;

END REG_REQUEST;