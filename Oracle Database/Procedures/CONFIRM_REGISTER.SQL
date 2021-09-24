create or replace PROCEDURE "CONFIRM_REGISTER" (
  i_register_confirmation_id IN SEP_INTERNS.USERS_TO_BE.REGISTER_CONFIRMATION_ID%TYPE,
  i_msisdn                   IN USERS_TO_BE.MSISDN%TYPE,
  o_is_confirmed OUT NUMBER
)
AS 
BEGIN
  -- o_is_confirmed is 1 when the user typed confirmation correctly;
  -- otherwisw, o_is_confirmed is 0
  SELECT COUNT(*)
    INTO o_is_confirmed
    FROM USERS_TO_BE
   WHERE MSISDN = i_msisdn
     AND REGISTER_CONFIRMATION_ID = i_register_confirmation_id;
  
  IF (o_is_confirmed = 1) THEN
    INSERT INTO USERS (USER_ID, PASSWORD, USER_MAIL, MSISDN, USER_SURNAME, USER_NAME, PASSCHANGECODE)
     SELECT NULL,
            PASSWORD,
            MAIL,
            MSISDN,
            SURNAME,
            NAME,
            NULL
        FROM USERS_TO_BE
     WHERE MSISDN = i_msisdn;

    DELETE FROM USERS_TO_BE
    WHERE MSISDN = i_msisdn;
  END IF;

  COMMIT;

END CONFIRM_REGISTER;