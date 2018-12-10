ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-YYYY';
CREATE OR REPLACE PROCEDURE insert_teacher(
    p_username  IN  user_table.username %TYPE,
    p_pass      IN  user_table.pass     %TYPE,
    p_fname     IN  user_table.fname    %TYPE,
    p_lname     IN  user_table.lname    %TYPE,
    p_email     IN  user_table.email    %TYPE,
    p_country   IN  user_table.country  %TYPE,
    p_dob       IN  user_table.dob      %TYPE,
    p_addresu   IN  user_table.addresu  %TYPE,
    p_university IN teacher_table.university %TYPE)

IS

BEGIN
    
    INSERT INTO user_table  (username, pass, fname, lname, email, country, dob, addresu)
    VALUES  (p_username, p_pass, p_fname, p_lname, p_email, p_country, p_dob, p_addresu);
    
    INSERT INTO teacher_table (username, university) VALUES (p_username, p_university);

END;
/
BEGIN
    insert_teacher('donut','1513396','nguyen','thuong','thuongn14@gmail.com','vietnam','12-10-1997','AG','bkhcm');
end;

/

CREATE OR REPLACE PROCEDURE insert_ml(
    p_conid     IN Learningmaterial.ContentID   %TYPE,
    p_author    IN Learningmaterial.Author      %TYPE,
    p_typee     IN Learningmaterial.Typee       %TYPE,
    p_couid     IN Learningmaterial.CourseID    %TYPE)
    AS

BEGIN
    
    INSERT INTO Learningmaterial
    VALUES (p_conid, p_author, p_typee, p_couid);

END;

/

BEGIN
    insert_ml('0x130', 'tsolan9', 'Video', '000000018');
END;

/

-- Ten nguoi hoc la gamer den tu China --
SELECT User_table.username, User_table.fname, User_table.lname
FROM USER_TABLe, STUDENT_TABLE
WHERE User_table.country = 'China' AND student_table.occupation = 'gamer' and user_table.username = student_table;

-- Dem so nguoi hoc den tu tung quoc gia

SELECT COUNTRY, COUNT (COUNTRY)
FROM USER_TABLE, STUDENT_TABLE
WHERE USER_TABLE.username = STUDENT_TABLE.username
GROUP BY COUNTRY;