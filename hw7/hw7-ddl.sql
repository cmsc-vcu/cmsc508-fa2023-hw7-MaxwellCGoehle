# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!


drop table if exists skills;
CREATE TABLE skills(
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL DEFAULT '(default description)',
    tag VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, tag) VALUES
(1, 'rock climbing', 'Skill 1'),
(2, 'sky diving', 'Skill 2'),
(3, 'basketball', 'Skill 3'),
(4, 'break dancing', 'Skill 4'),
(5, 'fast book reader', 'Skill 5'),
(6, 'math wizard', 'Skill 6'),
(7, 'fast clapper', 'Skill 7'),
(8, 'long distance runner', 'Skill 8');


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

drop table if exists people;
CREATE TABLE people (
    id INT NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    linkedin_url VARCHAR(255),
    headshot_url VARCHAR(255),
    discord_handle VARCHAR(255),
    brief_bio VARCHAR(255),
    date_joined DATE NOT NULL,
    PRIMARY KEY (id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
VALUES 
(1, 'John', 'Person 1', 'john.person1@email.com', 'linkedin.com/john.person1', 'headshot1.jpg', 'john.person1#1234', 'Brief bio for John Person 1.', '2023-01-01'),
(2, 'Jane', 'Person 2', 'jane.person2@email.com', 'linkedin.com/jane.person2', 'headshot2.jpg', 'jane.person2#1234', 'Brief bio for Jane Person 2.', '2023-02-01'),
(3, 'Bob', 'Person 3', 'bob.person3@email.com', 'linkedin.com/bob.person3', 'headshot3.jpg', 'bob.person3#1234', 'Brief bio for Bob Person 3.', '2023-03-01'),
(4, 'Alice', 'Person 4', 'alice.person4@email.com', 'linkedin.com/alice.person4', 'headshot4.jpg', 'alice.person4#1234', 'Brief bio for Alice Person 4.', '2023-04-01'),
(5, 'Charlie', 'Person 5', 'charlie.person5@email.com', 'linkedin.com/charlie.person5', 'headshot5.jpg', 'charlie.person5#1234', 'Brief bio for Charlie Person 5.', '2023-05-01'),
(6, 'Eva', 'Person 6', 'eva.person6@email.com', 'linkedin.com/eva.person6', 'headshot6.jpg', 'eva.person6#1234', 'Brief bio for Eva Person 6.', '2023-06-01');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

DROP TABLE IF EXISTS peopleskills;
CREATE TABLE peopleskills(
    id INT AUTO_INCREMENT,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
INSERT INTO peopleskills (skills_id, people_id)
VALUES 
(1, 1),
(3, 1),
(6, 1),
(3, 2),
(4, 2),
(5, 2),
(1, 3),
(5, 3),
(3, 5),
(6, 5),
(2, 6),
(3, 6),
(4, 6),
(3, 7),
(5, 7),
(6, 7),
(1, 8),
(3, 8),
(5, 8),
(6, 8),
(2, 9),
(5, 9),
(6, 9),
(1, 10),
(4, 10),
(5, 10);

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
    id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    sort_priority INT NOT NULL,
    PRIMARY KEY (id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (Name, Sort_Priority)
VALUES 
('Designer', 10),
('Developer', 20),
('Recruit', 30),
('Team Lead', 40),
('Boss', 50),
('Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment


DROP TABLE IF EXISTS peopleroles;
CREATE TABLE peopleroles (
    id INT AUTO_INCREMENT,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL,
    PRIMARY KEY (id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (People_ID, Role_ID, Date_Assigned)
VALUES 
(1, 2, CURRENT_DATE),
(2, 5, CURRENT_DATE),
(2, 6, CURRENT_DATE),
(3, 2, CURRENT_DATE),
(3, 4, CURRENT_DATE),
(4, 3, CURRENT_DATE),
(5, 3, CURRENT_DATE),
(6, 2, CURRENT_DATE),
(6, 1, CURRENT_DATE),
(7, 1, CURRENT_DATE),
(8, 1, CURRENT_DATE),
(8, 4, CURRENT_DATE),
(9, 2, CURRENT_DATE),
(10, 2, CURRENT_DATE),
(10, 1, CURRENT_DATE);  

