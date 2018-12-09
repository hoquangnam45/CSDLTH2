-- nhập Course

INSERT INTO Course_table VALUES ('000000014','Machine learning', 'Lorem ipsum dolor sit amet',0,100,'crignall1',0);
INSERT INTO Course_table VALUES ('000000015','Database 101','Lorem ipsum dolor sit amet',0,1000,'rabbs7',1);
INSERT INTO Course_table VALUES ('000000016','Financial 101','Lorem ipsum dolor sit amet',100,100000,'ccasaro5',2);
INSERT INTO Course_table VALUES ('000000017','Programming begin 101','Lorem ipsum dolor sit amet',10,33,'tsolan9',3);
INSERT INTO Course_table VALUES ('000000018','Data Structure','Lorem ipsum dolor sit amet',4,0,'lpatriskson3',4);

-- Nhập tag --
INSERT INTO Tag_table VALUES('','000000014', 'Machine');
INSERT INTO Tag_table VALUES('','000000014', 'Computer');
INSERT INTO Tag_table VALUES('','000000015', 'Database');
INSERT INTO Tag_table VALUES('','000000015', 'Computer');
INSERT INTO Tag_table VALUES('','000000016', 'Financial');
INSERT INTO Tag_table VALUES('','000000016', 'Math');
INSERT INTO Tag_table VALUES('','000000017', 'Programming');
INSERT INTO Tag_table VALUES('','000000017', 'Math');
INSERT INTO Tag_table VALUES('','000000018', 'Data');
INSERT INTO Tag_table VALUES('','000000018', 'Structure');

--Nhập Quiz --
INSERT INTO Quiz_table VALUES ('ABCDEF', 45, 4, '', '000000014');
INSERT INTO Quiz_table VALUES ('ABCDEG', 45, 1, '', '000000015');
INSERT INTO Quiz_table VALUES ('ABCDEH', 45, 1, '', '000000016');
INSERT INTO Quiz_table VALUES ('ABCDEI', 45, 1, '', '000000017');
INSERT INTO Quiz_table VALUES ('ABCDEJ', 45, 2, '', '000000018');

--Nhập điểm quiz--
INSERT INTO Quiz_taken_table VALUES(1, 'ABCDEF', 'mleser7', 0);
INSERT INTO Quiz_taken_table VALUES(2, 'ABCDEF', 'mleser7', 5);
INSERT INTO Quiz_taken_table VALUES(3, 'ABCDEF', 'mleser7', 7);
INSERT INTO Quiz_taken_table VALUES(4, 'ABCDEF', 'mleser7', 10);
INSERT INTO Quiz_taken_table VALUES(1, 'ABCDEG', 'bcount8', 9);
INSERT INTO Quiz_taken_table VALUES(1, 'ABCDEG', 'smaccrae9', 5);
INSERT INTO Quiz_taken_table VALUES(1, 'ABCDEH', 'smaccrae9', 8);
INSERT INTO Quiz_taken_table VALUES(1, 'ABCDEI', 'cbroszkiewicza', 7);
INSERT INTO Quiz_taken_table VALUES(1, 'ABCDEJ', 'cbroszkiewicza', 10);

--Nhập learning material--
INSERT INTO Learningmaterial VALUES('0x123', 'crignall1', 'Slide', '000000014');
INSERT INTO Learningmaterial VALUES('0x124', 'crignall1', 'Video', '000000014');
INSERT INTO Learningmaterial VALUES('0x125', 'crignall1', 'Misc', '000000014');
INSERT INTO Learningmaterial VALUES('0x126', 'rabbs7', 'Slide', '000000015');
INSERT INTO Learningmaterial VALUES('0x127', 'ccasaro5', 'Video', '000000016');
INSERT INTO Learningmaterial VALUES('0x128', 'tsolan9', 'Misc', '000000017');
INSERT INTO Learningmaterial VALUES('0x129', 'tsolan9', 'Misc', '000000018');


--Nhập register table--
ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-YYYY';
INSERT INTO Register_table VALUES('mleser7', '000000014', '01-01-1997', '01-02-1997', 9, 4, 12, 'ngan hang');
INSERT INTO Register_table VALUES('bcount8', '000000015', '01-01-1997', '01-02-1997', 8,1, 111, 'tien mat');
INSERT INTO Register_table VALUES('smaccrae9', '000000015', '01-01-1997', '01-02-1997', 7, 4, 121, 'ngan hang');
INSERT INTO Register_table VALUES('smaccrae9', '000000016', '01-01-1997', '01-02-1997', 6, 3, 54, 'ngan hang');
INSERT INTO Register_table VALUES('cbroszkiewicza', '000000017', '01-01-1997', '01-02-1997', 8, 5, 132, 'ngan hang');
INSERT INTO Register_table VALUES('cbroszkiewicza', '000000018', '01-01-1997', '01-02-1997', 7, 5, 114, 'tien mat');

--Nhập open table--
INSERT INTO Open_table VALUES('crignall1', '000000014', 'kgallego4');
INSERT INTO Open_table VALUES('rabbs7', '000000015', 'pstoile0');
INSERT INTO Open_table VALUES('ccasaro5', '000000016', 'gfilipson6');
INSERT INTO Open_table VALUES('tsolan9', '000000017', 'pstoile0');
INSERT INTO Open_table VALUES('lpatriskson3', '000000018', 'gfilipson6');
