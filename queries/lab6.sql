-- THese quries basically include :
--* creating Several views that have crucial role in the business faciliating information Accessability to the information and boosting security of sensitive data 

--Part 1: Use ITI DB
--1.	Create a view that displays student full name, 
--		course name if the student has a grade more than 50.
Use ITI ;

CREATE VIEW FULLNAME_GRADE
as
SELECT St_Fname+' '+St_Lname [Full Name]
FROM Student S join Stud_Course SC on SC.St_Id=S.St_Id
WHERE SC.Grade>50;


--2.	Create an Encrypted view that displays Instructors names and the topics they teach.

CREATE VIEW Instructor_Topic With encryption
AS
SELECT Ins_Name, Top_Name
FROM Instructor I join Ins_Course IC on I.Ins_Id=IC.Ins_Id
					join Course C on IC.Crs_Id=C.Crs_Id
					 join Topic T on C.Top_Id=T.Top_Id

select * from Instructor_Topic

--3.	Create a view that will display Instructor Name,Department Name for the 
--		‘SD’ or ‘Java’ Department “use Schema binding” 
CREATE VIEW Instructor_SD_JAVA
WITH SCHEMABINDING 
as
SELECT Ins_Name,Dept_Name 
FROM dbo.Instructor I join Department D on I.Dept_Id=D.Dept_Id
WHERE Dept_Name in ('SD','Java')


--4.	Create a view “V1” that displays student data for student who lives in Alex or Cairo. 
--Note: Prevent the users to run the following query Update V1 set st_address=’tanta’ Where st_address=’alex’.

CREATE VIEW V1
AS
SELECT *
FROM Student
WHERE St_Address in ('ALex', 'Cairo')

DENY INSERT ,UPDATE ,DELETE 
ON OBJECT:: dbo.V1
TO PUBLIC;


-- Create temporary table [Session based Create temporary table on Company DB to save employee name and his today task.

SELECT E.Fname ,getdate() [Sign_in_Date]
INTO  #temp_emb
from Company_SD.dbo.Employee E

SELECT * FROM #temp_emb





--Part 3: Use Company DB
--1.	Create a view that will display the project name and the number of employees work on it-

 --CREATE VIEW Project_no_emb
 --AS
 SELECT Pname count(Essn)
 FROM Company_SD.dbo.project





--2.	Create a view named  “v_count “ that will display the project name and the number of hours for each one
--3.	Create a view named   “v_D30” that will display employee number, project number, hours of the projects in department 30. updated
--4.	Create a view named ” v_project_500” that will display the emp no. for the project 500, use the previously created view  “v_D30”
--5.	Delete the views  “v_D30” and “v_count”
--6.	Display the project name that contains the letter “c” Use the previous view created in Q#1
--7.	add new column Enter_Date in Works_for table and insert data in it then create view name “v_2021_check” that will display employee no., which must be from the first of January and the last of December 2021.
--this view will be used to insert data so make sure that the coming new data matchs the condition

--8.	Create Rule for Salary that is less than 2000 using rule.
--9.	Create a new user defined data type named loc with the following Criteria:
--•	nchar(2) -
--•	default: NY 
--•	create a rule for this Data type :values in (NY,DS,KW)) and associate it to the location column
--7.	Create New table Named newStudent, and use the new UDD (user defined data type) on it.
--a.	Make ID column and don’t make it identity.
--8.	Create a new sequence for the ID values of the previous table.
--a.	Insert 3 records in the table using the sequence.
--b.	Delete the second row of the table.
--c.	Insert 2 other records using the sequence.
--d.	Can you insert another record without using the sequence? Try it! Can you do the same if it was an identity column?
--e.	Can you edit the value if the ID column in any of the inserted records? Try it!
--f.	Can you use the same sequence to insert in another table?
--g.	If yes, do you think that the sequence will start from its initial value in the new table and insert the same IDs that were inserted in the old table?
--h.	How to skip some values from the sequence not to be inserted in the table? Try it.
--i.	Can you do the same with the Identity column?
--j.	What’re the differences between Identity column and Sequence?
