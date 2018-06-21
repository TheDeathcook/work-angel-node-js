insert into Employer (Name,Username,Password,Description) values ('InfoAG','BestITBOIS','123456789','Test Firm Number 1');
insert into Employer (Name,Username,Password,Description) values ('Paderbyte','OverMinimumWage','123456789','Test Firm Number 2');
insert into Employer (Name,Username,Password,Description) values ('REAL','UnderMinimumWage','123456789','Test Firm Number 3');
insert into Employer (Name,Username,Password,Description) values ('LIDL','20DollarJob','123456789','Test Firm Number 4');
insert into Employer (Name,Username,Password,Description) values ('ORGA','WeDontHire','123456789','Test Firm Number 5');

insert into User(Lastname,Forename,Description,Username,Password) values ('Mustermann','Max','Test User 1','MadMax','Test123!');
insert into User(Lastname,Forename,Description,Username,Password) values ('Swanson','Ron','Test User 2','Creativity','Test123!');
insert into User(Lastname,Forename,Description,Username,Password) values ('Johnson','Chad','Test User 3','theRealChad','Test123!');
insert into User(Lastname,Forename,Description,Username,Password) values ('Miller','Steve','Test User 4','ITGOD','Test123!');
insert into User(Lastname,Forename,Description,Username,Password) values ('Parker','Peter','Test User 5','MiderSpan','Test123!');

insert into Skill(Name,Description) values ('Coffee','The Ability to make Coffee');
insert into Skill(Name,Description) values ('SQL','Writing of Scripts in Windows Server');
insert into Skill(Name,Description) values ('Windows Server 2012','Knowledge of Windows Server 2012');
insert into Skill(Name,Description) values ('Design','Certain Knowledge about Designing Stuff');
insert into Skill(Name,Description) values ('JAVA','Programming with JAVA');

insert into user_has_skill values (1,1,1);
insert into user_has_skill values (1,5,2);
insert into user_has_skill values (2,3,1);
insert into user_has_skill values (4,4,1);

insert into employer_needs_skill values (1,5);
insert into employer_needs_skill values (2,5);
insert into employer_needs_skill values (3,5);
insert into employer_needs_skill values (4,5);
insert into employer_needs_skill values (5,5);
insert into employer_needs_skill values (1,1);
insert into employer_needs_skill values (2,2);
insert into employer_needs_skill values (3,3);
insert into employer_needs_skill values (4,4);