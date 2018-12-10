CREATE OR REPLACE PROCEDURE insert_teacher(
    p_username  IN  user_table.username %TYPE,
    p_pass      IN  user_table.pass     %TYPE,
    p_fname     IN  user_table.fname    %TYPE,
    p_lname     IN  user_table.lname    %TYPE,
    p_email     IN  user_table.email    %TYPE,
    p_country   IN  user_table.country  %TYPE,
    p_dob       IN  user_table.dob      %TYPE,
    p_addresu   IN  user_table.addresu  %TYPE,
    p_university IN teacher_table.p_university %TYPE)

IS

BEGIN
    
    INSERT INTO user_table  ("username", "pass", "fname", "lname", "email", "country", "dob", "addresu")
    VALUES  (p_username, p_pass, p_fname, p_lname, p_email, p_country, p_dob, p_addresu);
    
    INSERT INTO teacher_table ("username", "university")    VALUES (p_username, p_university);
    COMMIT;

END;

--

BEGIN
    insert_admin('donut','1513396','nguyen','thuong','thuongn14@gmail.com','vietnam','10-12-1997','AG','bkhcm');
end;

--

CREATE OR REPLACE PROCEDURE insert_ml(
    p_conid     IN Learningmaterial.ContentID   %TYPE,
    p_author    IN Learningmaterial.Author      %TYPE,
    p_typee     IN Learningmaterial.Typee       %TYPE,
    p_couid     IN Learningmaterial.CourseID    %TYPE)

IS

BEGIN
    
    INSERT INTO Learningmaterial ("ContentID", "Author", "Typee", "CourseID")
    VALUES (p_conid, p_author, p_typee, p_couid);

END;

--

BEGIN
    insert_ml('0x130', 'tsolan9', 'Video', '000000018');
END;

--