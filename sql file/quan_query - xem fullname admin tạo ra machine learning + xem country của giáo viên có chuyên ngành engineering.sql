-- xem thông tên admin đã tạo ra khóa học maechine laerning
SELECT  FNAME || ' ' || LNAME AS FULLNAME
FROM    COURSE_TABLE, OPEN_TABLE, ADMIN_TABLE, USER_TABLE
WHERE   CID = OPENC AND OPENA = ADMIN_TABLE.USERNAME AND ADMIN_TABLE.USERNAME = USER_TABLE.USERNAME AND CNAME = 'Machine learning'
/

-- xem thông tin về country của giáo viên có chuyên ngành là Computer engineering
SELECT  COUNTRY
FROM    TMAJOR_TABLE, TEACHER_TABLE, USER_TABLE
WHERE   TMAJOR_TABLE.USERNAME = TEACHER_TABLE.USERNAME AND TEACHER_TABLE.USERNAME = USER_TABLE.USERNAME AND MAJOR = 'Computer engineering'
