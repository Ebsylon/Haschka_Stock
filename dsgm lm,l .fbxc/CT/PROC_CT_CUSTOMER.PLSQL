create or replace
procedure proc_CT_customer IS
 V_CNT NUMBER;
BEGIN
  SELECT count(*) INTO V_CNT
  FROM ALL_TABLES
  WHERE OWNER = 'DEMO' AND
  TABLE_NAME = 'CUSTOMER';
  
  IF V_CNT = 0 THEN
    execute immediate 'CREATE TABLE CUSTOMER
                      (
                      EMAIL         VARCHAR(45),
                      FIRSTNAME     VARCHAR(40),
                      LASTNAME      VARCHAR(40),
                      GENDER        VARCHAR(20),
                      BIRTHDATE     DATE,
                      CREDITS       DECIMAL(4,2)
                      )';
     COMMIT;
  END IF;
  
  SELECT count(*) INTO V_CNT
FROM ALL_SEQUENCES
WHERE SEQUENCE_OWNER = 'DEMO' AND
      SEQUENCE_NAME = 'SEQ_CUSTOMER';
      
      
IF V_CNT = 0 THEN 
  EXECUTE immediate 'CREATE SEQUENCE SEQ_CUSTOMER
                            START WITH 10000
                            INCREMENT BY 1
                            CACHE 50';
      COMMIT;
END IF;
  
END proc_CT_customer;