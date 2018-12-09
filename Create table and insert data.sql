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

create table TDegree_table(
    DegreeID    int not null identity primary key,
    Username    varchar(15)     not null,
    Degree_t    varchar(255)    not null,
    
    constraint fk_dgU
        foreign key(Username)
        references  teacher_table(username)
        on delete cascade
);

create table TMajor_table(
    MajorID     int not null identity primary key,
    Username    varchar(15)     not null,
    Major       varchar(255)    not null,
    
    constraint fk_MT
        foreign key(Username)
        references teacher_table(username)
        on delete cascade
);

create table ban_table(
    username    varchar(15)     primary key,
    banner      varchar(15),
    constraint fk_user
        foreign key(username)
        references user_table(username)
        on delete cascade,
    constraint fk_banner
        foreign key(banner)
        references admin_table(username)
        on delete set null
);

--------------------------------------------------------------

create table Course_table(
    CID     char(9) primary key     not null,
    Cname           varchar(255)    not null,
    Descriptionn    varchar(255)    not null,
    Price           varchar(255)    default 0    check   (Price >= 0),
    Sub_nnumber     int             default 0 check   (Sub_nnumber >= 0),
    Lecturer        varchar(15)     not null,
    Course_rating   int             default 0   check   (Course_rating <= 5 and Course_rating >= 0),                    -- vi du 3.1
    
    constraint  fk_lectu
        foreign key(Lecturer)
        references  teacher_table(username)
        on delete cascade
);
create table Tag_table(
    TagId   int not null identity primary key, 
    CID     char(9)         not null,
    Tagg    varchar(255)    not null,

    constraint  fk_tag
        foreign key(CID)
        references  Course_table(CID)
        on delete cascade
);

create table Quiz_table(
    QuizID          char(9) primary key     not null,
    Time_allowed    timestamp               not null,
    Max_numbertaken int                     not null,
    Type_of_score   varchar(15)             default 'Average' check (Type_of_score='Max' or Type_of_score='Average'),
    Course          char(9)                 not null,
    
    constraint  fkq
        foreign     key(Course)
        references  Course_table(CID)
        on delete cascade
);

-- Làm trigger cho Num_taken < Max_numbertaken
create table Quiz_taken_table(
    Num_taken   int not null,
    QuizID      char(9)     not null,
    StudentID   varchar(15) not null,
    Score       char(3)     default 0 check (Score >= 0 and Score <= 10),
    
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

create table Learningmaterial(
    ContentID   char(9) primary key not null,
    Author      varchar(15),
    Typee       varchar(255)        not null check (Typee = 'Video' or Typee = 'Slide' or Typee = 'Audio' or Typee = 'Misc'),
    CourseID      char(9)             not null,
    
    constraint fk_lc
        foreign     key(CourseID)
        references  Course_table(CID)
        on delete cascade,
    constraint fk_lco
        foreign     key(Author)
        references  Teacher_table(username)
        on delete set null
);

-----------------------------------------

create table Open_table(
    OpenT   varchar(15) not null,
    OpenC   char(9)     not null,
    OpenA   varchar(15),
    
    constraint fk_open
        primary  key(OpenT, OpenC),       -- chua hieu
    constraint fk_topen
        foreign     key(OpenT)
        references  teacher_table(username)
        on delete cascade,
    constraint fk_copen
        foreign     key(OpenC)
        references  Course_table(CID)
        on delete cascade,
    constraint fk_aopen
        foreign key(OpenA)
        references admin_table(username)
        on delete set null
);

create table Register_table(
    RegisterS   varchar(15) not null,
    RegisterC   char(9)     not null,
    S_date      date        not null,
    E_date      date        not null,
    Progress    varchar(15) not null,
    Score       int         check   (Score >= 0 and Score <= 10),
    Rating      int         check   (Rating >= 0 and Rating <= 5),
    IID         int,
    Methodd     varchar(255),
    
    constraint fk_kr
        primary key(RegisterS, RegisterC),
    constraint fk_krs
        foreign key(RegisterS)
        references  student_table(username)
        on delete cascade,
    constraint fk_krc
        foreign key(RegisterC)
        references  Course_table(CID)
        on delete cascade
);
