create table user_table(
    username    varchar(15)     primary key,
    pass        varchar(15)     not null,
    fname       varchar(15)     not null,
    lname       varchar(15)     not null,
    email       varchar(255)    not null,
    country     varchar(50)     not null,
    dob         date            not null,
    addresu     varchar(255)    not null
);

create table admin_table(
    username    varchar(15)     primary key,
    constraint  fk_admin
        foreign key(username)
        references  user_table(username)
        on delete cascade
);

create table student_table(
    username    varchar(15) primary key     not null,
    occupation  varchar(255),
    constraint fk_student
        foreign key(username)
        references user_table(username)
        on delete cascade
);

create table teacher_table(
    username    varchar(15)     primary key,
    university  varchar(255)     not null,
    constraint fk_teacher
        foreign key(username)
        references user_table(username)
        on delete cascade
);
create table Course_table(
    CID     char(9) primary key     not null,
    Cname           varchar(255)    not null,
    Descriptionn    varchar(255)    not null,
    Price           varchar(255)    not null,
    Sub_nnumber     int             not null    check   (Sub_nnumber > 0),
    Lecturer        varchar(15)     not null,
    Course_rating   int             default 0   check   (Course_rating < 5),                    -- vi du 3.1
    
    constraint  fk_lectu
        foreign     key(Lecturer)
        references  teacher_table(username)
        on delete cascade
);
create table Tag_table(
    CID     char(9)         not null,
    Tagg    varchar(255)    not null,

    constraint fk_tkey
        primary     key(CID, Tagg),
    constraint  fk_tag
        foreign     key(CID)
        references  Course_table(CID)
        on delete cascade
);
create table ban_table(
    username    varchar(15)     primary key,
    banner      varchar(15)     not null,
    constraint fk_user
        foreign key(username)
        references user_table(username)
        on delete cascade,
    constraint fk_banner
        foreign key(banner)
        references admin_table(username)
        on delete set null
);
create table offered_table(
    offered_teacher varchar(15)     not null,
    offered_student varchar(15)     not null,
    Course_ID       char(9)         not null,
    
    constraint  fk_ofKey
        primary key(offered_teacher, offered_student),
    constraint  fk_ofT
        foreign     key(offered_teacher)
        references  teacher_table(username)
        on delete set null,
    constraint  fk_ofS
        foreign     key(offered_student)
        references  student_table(username)
        on delete set null,
    constraint  fk_ofCID
        foreign     key(Course_ID)
        references  Course_table(CID)
        on delete cascade
);
create table TDegree_table(
    Username    varchar(15)     not null,
    Degree_t    varchar(255)    not null,
    
    constraint  fk_dg
        primary     key(Username, Degree_t),
    constraint  fk_dgU
        foreign     key(Username)
        references  teacher_table(username)
        on delete cascade
);
create table TMajor_table(
    Username    varchar(15)     not null,
    Major       varchar(255)    not null,
    
    constraint  fk_mj
        primary     key(Username, Major),
    constraint   fk_MT
        foreign     key(Username)
        references  teacher_table(username)
        on delete cascade
);
create table Open_table(
    OpenT   varchar(15),
    OpenC   char(9)     not null,
    OpenA   varchar(15),
    
    constraint fk_open
        primary     key(OpenT, OpenC),       -- chua hieu
    constraint fk_topen
        foreign     key(OpenT)
        references  teacher_table(username)
        on delete set null,
    constraint fk_copen
        foreign     key(OpenC)
        references  Course_table(CID)
        on delete cascade,
    constraint fk_aopen
        foreign     key(OpenA)
        references  admin_table(username)
        on delete set null
);
create table Register_table(
    RegisterS   varchar(15) not null,
    RegisterC   char(9)     not null,
    S_date      date        not null,
    E_date      date,
    Progress    varchar(15),
    Score       int,
    Rating      int         check   (Rating < 5),
    IID         int,
    Methodd     varchar(255) not null,
    
    constraint fk_kr
        primary key(RegisterS, RegisterC),
    constraint fk_krs
        foreign     key(RegisterS)
        references  student_table(username)
        on delete cascade,
    constraint fk_krc
        foreign     key(RegisterC)
        references  Course_table(CID)
        on delete cascade
);

create table Learningmaterial(
    ContentID   char(9) primary key not null,
    Author      varchar(15),
    Typee       varchar(255)        not null,
    Course      char(9)             not null,
    
    constraint fk_lc
        foreign     key(Course)
        references  Course_table(CID)
        on delete cascade,
    constraint fk_lco
        foreign     key(Author)
        references  Teacher_table(username)
        on delete set null
);
create table Quiz_table(
    QuizID          char(9) primary key     not null,
    Time_allowed    timestamp               not null,
    Max_numbertaken int                     not null,
    Answer          char(1)                 not null,
    Type_of_score   varchar(15)            not null,
    Course          char(9)                 not null,
    
    constraint  fkq
        foreign     key(Course)
        references  Course_table(CID)
        on delete cascade
);

-- Làm trigger cho Num_taken < Max_numbertaken
create table Quiz_taken_table(
    Num_taken   int         not null,
    QuizID      char(9)     not null,
    StudentID   varchar(15) not null,
    Score       char(3)     not null,
    
    constraint fk_ck
        primary     key(Num_taken, QuizID, StudentID),
    constraint fk_cq
        foreign     key(QuizID)
        references  Quiz_table(QuizID)
        on delete cascade,
    constraint fk_cs
        foreign     key(StudentID)
        references  Student_table(Username)
        on delete cascade
);
-----------------------------------------INSERT---------------------------------------

ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-YYYY';
INSERT INTO user_table VALUES ('pstoile0','49Dj0u','Perl','Stoile','pstoile0@reference.com','Russia','8-20-2018','4971 Talmadge');
INSERT INTO user_table VALUES ('crignall1','6I2kOb3','Chiarra','Rignall','crignall1@dailymail.co.uk','Argentina','5-7-2018','4711 Schiller');
INSERT INTO user_table VALUES ('eovey2','IhXOe1A','Ebeneser','Ovey','eovey2@ed.gov','Portugal','7-2-2018','474 Gerald');
INSERT INTO user_table VALUES ('lpatriskson3','bmQ2RmDJKj','Laural','Patriskson','lpatriskson3@cmu.edu','Palestinian Territory','5-10-2018','0 Glacier Hill');
INSERT INTO user_table VALUES ('kgallego4','YxAqIb0zQ','Karine','Gallego','kgallego4@japanpost.jp','Belarus','9-7-2018','3 Marcy Crossing');
INSERT INTO user_table VALUES ('ccasaro5','A9iDj99D','Cordie','Casaro','ccasaro5@hostgator.com','China','4-2-2018','5 Dovetail Park');
INSERT INTO user_table VALUES ('mroumier6','UzTnWKI20','Maribelle','Roumier','mroumier6@com.com','China','5-20-2018','0 Prentice Junction');
INSERT INTO user_table VALUES ('rabbs7','aq7M9GvrhC','Raleigh','Abbs','rabbs7@xinhuanet.com','Cuba','2-13-2018','5 3rd Avenue');
INSERT INTO user_table VALUES ('abrowne8','ai1KgqrNJpf','Aristotle','Browne','abrowne8@opera.com','Sweden','7-19-2018','4662 Banding Lane');
INSERT INTO user_table VALUES ('tsolan9','OgJxa7p8','Teodorico','Solan','tsolan9@ovh.net','Russia','4-14-2018','30340 Southridge Crossing');
INSERT INTO user_table VALUES ('fmccuaig0','P2NFI1jP6z','Fernandina','McCuaig','fmccuaig0@accuweather.com','Serbia','12-27-2017','0015 Elka Center');
INSERT INTO user_table VALUES ('ckohn1','9mzh84OV','Catherine','Kohn','ckohn1@admin.ch','Yemen','8-11-2018','5 Lillian Avenue');
INSERT INTO user_table VALUES ('ndranfield2','AjZR8vVDx','Neely','Dranfield','ndranfield2@t-online.de','China','12-14-2017','0 Linden Lane');
INSERT INTO user_table VALUES ('csimmens3','ApI4mrakw','Craggy','Simmens','csimmens3@google.com','Ukraine','4-24-2018','20434 Packers Road');
INSERT INTO user_table VALUES ('fcornier4','20LJHb','Fergus','Cornier','fcornier4@apache.org','Philippines','8-2-2018','43 Dapin Way');
INSERT INTO user_table VALUES ('pbuyers5','FxP84NQzSdAs','Penelope','Buyers','pbuyers5@ezinearticles.com','Russia','6-20-2018','64806 Hermina Point');
INSERT INTO user_table VALUES ('gfilipson6','xsTLr9','Gregor','Filipson','gfilipson6@topsy.com','Honduras','8-5-2018','86067 Sage Junction');
INSERT INTO user_table VALUES ('mleser7','HxnHHLQyAsZ','Marieann','Leser','mleser7@va.gov','China','4-29-2018','27250 Kropf Street');
INSERT INTO user_table VALUES ('bcount8','lpQ3Y82U6y9','Brooke','Count','bcount8@barnesandnoble.com','Peru','3-20-2018','81 Packers Terrace');
INSERT INTO user_table VALUES ('smaccrae9','w9CdCUhm1L','Shela','Maccrae','smaccrae9@list-manage.com','Argentina','11-26-2018','3 Troy Place');
INSERT INTO user_table VALUES ('cbroszkiewicza','UZsfJT','Celine','Broszkiewicz','cbroszkiewicza@blogger.com','Portugal','1-18-2018','4 Manley Avenue');
INSERT INTO user_table VALUES ('jnovacekb','A318VoWfWH','Jacques','Novacek','jnovacekb@miitbeian.gov.cn','Vietnam','5-7-2018','47 Monument Road');
INSERT INTO user_table VALUES ('hcookec','Rqodiax','Hercule','Cooke','hcookec@example.com','China','3-20-2018','3013 Banding Park');
INSERT INTO user_table VALUES ('jfeeleyd','oN3HPxXy','Joli','Feeley','jfeeleyd@mozilla.org','China','6-28-2018','6988 Oak Court');
INSERT INTO user_table VALUES ('tstreathere','f1MTK6bcZ','Terrance','Streather','tstreathere@statcounter.com','China','6-20-2018','39 Sugar Center');
INSERT INTO user_table VALUES ('asivornf','fNv1w5C3s','Ado','Sivorn','asivornf@sakura.ne.jp','Philippines','1-19-2018','69912 Kingsford Drive');
INSERT INTO user_table VALUES ('chaddrellg','SQflgwy','Cheston','Haddrell','chaddrellg@auda.org.au','Russia','12-5-2018','856 Pennsylvania Circle');
INSERT INTO user_table VALUES ('enewarth','9N57SaYP','Ethelbert','Newart','enewarth@go.com','Poland','11-21-2018','1 Tennessee Point');
INSERT INTO user_table VALUES ('lwageni','KDvscDLtm','Lorinda','Wagen','lwageni@dailymail.co.uk','China','1-5-2018','739 Milwaukee Drive');
INSERT INTO user_table VALUES ('tmazinj','CCezd94oNK','Travers','Mazin','tmazinj@engadget.com','Sudan','7-3-2018','72293 Express Terrace');
INSERT INTO user_table VALUES ('bkeark','4CqHbPE','Buiron','Kear','bkeark@businessinsider.com','Colombia','5-27-2018','48 Utah Hill');
INSERT INTO user_table VALUES ('hellenl','9TUVeM5mmoo','Hyacintha','Ellen','hellenl@mysql.com','Sweden','5-2-2018','7 Union Hill');
INSERT INTO user_table VALUES ('rhartridgem','CF3ypzI','Reinold','Hartridge','rhartridgem@altervista.org','Ukraine','8-27-2018','46326 Oakridge Place');
INSERT INTO user_table VALUES ('hshotboultn','ZRzCwZHPPu','Haslett','Shotboult','hshotboultn@ed.gov','Indonesia','12-29-2017','81110 Sloan Terrace');
INSERT INTO user_table VALUES ('azuckero','K3feCIid8Y5a','Alene','Zucker','azuckero@tinyurl.com','China','6-15-2018','71 Morningstar Lane');

-- nhập bản admin -- 1, 5, 17
INSERT INTO admin_table VALUES ('pstoile0');
INSERT INTO admin_table VALUES ('kgallego4');
INSERT INTO admin_table VALUES ('gfilipson6');

-- nhập teacher -- 2, 4, 6, 8, 10
INSERT INTO teacher_table VALUES ('crignall1','havard');
INSERT INTO teacher_table VALUES ('lpatriskson3','bach khoa ho chi minh');
INSERT INTO teacher_table VALUES ('ccasaro5','khoa hoc tu nhien');
INSERT INTO teacher_table VALUES ('rabbs7','kinh te luat');
INSERT INTO teacher_table VALUES ('tsolan9','oxford');

-- nhập student
INSERT INTO student_table VALUES ('eovey2','gamer');
INSERT INTO student_table VALUES ('mroumier6','shipper');
INSERT INTO student_table VALUES ('abrowne8','gamer');
INSERT INTO student_table VALUES ('fmccuaig0','coder');
INSERT INTO student_table VALUES ('ckohn1','Developer');
INSERT INTO student_table VALUES ('ndranfield2','Technical Architect');
INSERT INTO student_table VALUES ('csimmens3','Technical Architect');
INSERT INTO student_table VALUES ('fcornier4','coder');
INSERT INTO student_table VALUES ('pbuyers5','coder');
INSERT INTO student_table VALUES ('mleser7','coder');
INSERT INTO student_table VALUES ('bcount8','coder');
INSERT INTO student_table VALUES ('smaccrae9','gamer');
INSERT INTO student_table VALUES ('cbroszkiewicza','gamer');
INSERT INTO student_table VALUES ('jnovacekb','gamer');
INSERT INTO student_table VALUES ('hcookec','gamer');
INSERT INTO student_table VALUES ('jfeeleyd','Software Engineer');
INSERT INTO student_table VALUES ('tstreathere','gamer');
INSERT INTO student_table VALUES ('asivornf','Software Engineer');
INSERT INTO student_table VALUES ('chaddrellg','');
INSERT INTO student_table VALUES ('enewarth','');
INSERT INTO student_table VALUES ('lwageni','');
INSERT INTO student_table VALUES ('tmazinj','gamer');
INSERT INTO student_table VALUES ('bkeark','Programer');
INSERT INTO student_table VALUES ('hellenl','Programer');
INSERT INTO student_table VALUES ('rhartridgem','');
INSERT INTO student_table VALUES ('hshotboultn','');
INSERT INTO student_table VALUES ('azuckero','Programer');

-- nhập Course
INSERT INTO Course_table VALUES ('000000014','Machine learning','"Machine',' Computer"','"Lorem ipsum dolor sit amet',' consectetur adipiscing elit. Quisque cursus vehicula tempor. Pellentesque sed rhoncus eros. Cras in nisi vitae erat fermentum aliquam quis non massa. Aliquam in commodo sapien. Proin auctor lobortis lectus. Aliquam erat volutpat. Aenean facilisis libero sit amet semper scelerisque. Donec luctus urna libero',' id ultrices tortor pretium sit amet. In hac habitasse platea dictumst. Sed ut rutrum tortor. Duis ac faucibus massa',' a semper dolor. Ut ornare lobortis orci',' eu tristique est sollicitudin ac. Donec ultrices est in mauris luctus dignissim. Suspendisse potenti. Etiam risus tortor',' tincidunt et ante eu',' aliquam blandit orci. Duis laoreet ultrices mauris quis dignissim"','0','100','crignall1','0');
INSERT INTO Course_table VALUES ('000000015','Database 101','"Database',' Computer"','"Lorem ipsum dolor sit amet',' consectetur adipiscing elit. Quisque cursus vehicula tempor. Pellentesque sed rhoncus eros. Cras in nisi vitae erat fermentum aliquam quis non massa. Aliquam in commodo sapien. Proin auctor lobortis lectus. Aliquam erat volutpat. Aenean facilisis libero sit amet semper scelerisque. Donec luctus urna libero',' id ultrices tortor pretium sit amet. In hac habitasse platea dictumst. Sed ut rutrum tortor. Duis ac faucibus massa',' a semper dolor. Ut ornare lobortis orci',' eu tristique est sollicitudin ac. Donec ultrices est in mauris luctus dignissim. Suspendisse potenti. Etiam risus tortor',' tincidunt et ante eu',' aliquam blandit orci. Duis laoreet ultrices mauris quis dignissim"','0','1000','rabbs7','1');
INSERT INTO Course_table VALUES ('000000016','Financial 101','"Financial',' Math"','"Lorem ipsum dolor sit amet',' consectetur adipiscing elit. Quisque cursus vehicula tempor. Pellentesque sed rhoncus eros. Cras in nisi vitae erat fermentum aliquam quis non massa. Aliquam in commodo sapien. Proin auctor lobortis lectus. Aliquam erat volutpat. Aenean facilisis libero sit amet semper scelerisque. Donec luctus urna libero',' id ultrices tortor pretium sit amet. In hac habitasse platea dictumst. Sed ut rutrum tortor. Duis ac faucibus massa',' a semper dolor. Ut ornare lobortis orci',' eu tristique est sollicitudin ac. Donec ultrices est in mauris luctus dignissim. Suspendisse potenti. Etiam risus tortor',' tincidunt et ante eu',' aliquam blandit orci. Duis laoreet ultrices mauris quis dignissim"','100','100000','ccasaro5','2');
INSERT INTO Course_table VALUES ('000000017','Programming begin 101','"Programming',' Math"','"Lorem ipsum dolor sit amet',' consectetur adipiscing elit. Quisque cursus vehicula tempor. Pellentesque sed rhoncus eros. Cras in nisi vitae erat fermentum aliquam quis non massa. Aliquam in commodo sapien. Proin auctor lobortis lectus. Aliquam erat volutpat. Aenean facilisis libero sit amet semper scelerisque. Donec luctus urna libero',' id ultrices tortor pretium sit amet. In hac habitasse platea dictumst. Sed ut rutrum tortor. Duis ac faucibus massa',' a semper dolor. Ut ornare lobortis orci',' eu tristique est sollicitudin ac. Donec ultrices est in mauris luctus dignissim. Suspendisse potenti. Etiam risus tortor',' tincidunt et ante eu',' aliquam blandit orci. Duis laoreet ultrices mauris quis dignissim"','10','33','tsolan9','3');
INSERT INTO Course_table VALUES ('000000018','Data Structure','"Data',' Structure"','"Lorem ipsum dolor sit amet',' consectetur adipiscing elit. Quisque cursus vehicula tempor. Pellentesque sed rhoncus eros. Cras in nisi vitae erat fermentum aliquam quis non massa. Aliquam in commodo sapien. Proin auctor lobortis lectus. Aliquam erat volutpat. Aenean facilisis libero sit amet semper scelerisque. Donec luctus urna libero',' id ultrices tortor pretium sit amet. In hac habitasse platea dictumst. Sed ut rutrum tortor. Duis ac faucibus massa',' a semper dolor. Ut ornare lobortis orci',' eu tristique est sollicitudin ac. Donec ultrices est in mauris luctus dignissim. Suspendisse potenti. Etiam risus tortor',' tincidunt et ante eu',' aliquam blandit orci. Duis laoreet ultrices mauris quis dignissim"','4','0','lpatriskson3','4');

