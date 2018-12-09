CREATE OR REPLACE FUNCTION  Check_student(student_user in user_table.username%TYPE)
RETURN BOOLEAN AS
count_row int;
BEGIN
    SELECT count(*) into count_row FROM student_table  WHERE student_table.username = student_user;
    if (count_row != 0) then return true;
    else return false;
    end if;
END;
/


declare 
ret boolean;
begin
    ret := Check_student('eovey2');
    if (ret = true) then DBMS_OUTPUT.PUT_LINE ('haha');
    end if;
end;

/
CREATE OR REPLACE PROCEDURE insert_admin(
    p_username  IN  user_table.username %TYPE,
    p_pass      IN  user_table.pass     %TYPE,
    p_fname     IN  user_table.fname    %TYPE,
    p_lname     IN  user_table.lname    %TYPE,
    p_email     IN  user_table.email    %TYPE,
    p_country   IN  user_table.country  %TYPE,
    p_dob       IN  user_table.dob      %TYPE,
    p_addresu   IN  user_table.addresu  %TYPE)

IS
BEGIN
    
    INSERT INTO user_table  ("username", "pass", "fname", "lname", "email", "country", "dob", "addresu")
    VALUES  (p_username, p_pass, p_fname, p_lname, p_email, p_country, p_dob, p_addresu);
    
    INSERT INTO admin_table ("username")    VALUES (p_username);
    
    COMMIT;

END;
/

CREATE OR REPLACE PROCEDURE insert_admin(
    p_username  IN  user_table.username %TYPE,
    p_pass      IN  user_table.pass     %TYPE,
    p_fname     IN  user_table.fname    %TYPE,
    p_lname     IN  user_table.lname    %TYPE,
    p_email     IN  user_table.email    %TYPE,
    p_country   IN  user_table.country  %TYPE,
    p_dob       IN  user_table.dob      %TYPE,
    p_addresu   IN  user_table.addresu  %TYPE)

IS
BEGIN
    
    INSERT INTO user_table  ("username", "pass", "fname", "lname", "email", "country", "dob", "addresu")
    VALUES  (p_username, p_pass, p_fname, p_lname, p_email, p_country, p_dob, p_addresu);
    
    INSERT INTO admin_table ("username")    VALUES (p_username);
    
    COMMIT;

END;
/
BEGIN
insert_admin('quanquan','15126877','nguyen','quan','nguyen@hanasdbnsa','lam ha','1-11-2018','saojdhisa');
end;
/