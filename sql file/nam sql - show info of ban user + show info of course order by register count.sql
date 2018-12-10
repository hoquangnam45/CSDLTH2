SELECT USER_TABLE.USERNAME, FNAME || ' ' || LNAME AS FULLNAME, EMAIL, COUNTRY, DOB, ADDRESU, BANNER
  FROM USER_TABLE JOIN BAN_TABLE ON BAN_TABLE.USERNAME = USER_TABLE.USERNAME;
  
SELECT CID, CNAME, DESCRIPTIONN, PRICE, SUB_NNUMBER, LECTURER, COURSE_RATING, COUNT(*)    
FROM COURSE_TABLE JOIN REGISTER_TABLE ON REGISTERC = CID
GROUP BY CID, CNAME, DESCRIPTIONN, PRICE, SUB_NNUMBER, LECTURER, COURSE_RATING
ORDER BY COUNT(*) DESC