--1
--Full Schema

emp_bag = load '.home/cloudera/Desktop/Pigfile.txt' using PigStorage(',') as
(empno:int,empname:chararray,empdesi:chararray,empsal:int,empcom:int,deptno:int);

describe emp_bag;

dump emp_bag;

--semi schema

emp_bag = load '/home/cloudera/Desktop/Pigfile.txt' using PigStorage(',')
as (eid:int,emoname:chararray,empdesi,empsal,empcom,deptno:int);

describe emp_bag;

dump emp_bag;

-- No schema

emp_bag = load '/home/cloudera/Desktop/Pigfile.txt' using PigStorage(',');

describe emp_bag;

dump emp_bag;


--2

dept_bag = load '/home/cloudera/Desktop/pigfile1.txt' using PigStorage(',')
as (deptid:int,deptname:chararray,deptcity:chararray);

descrobe dept_bag;
dump dept_bag;

--3

dump emp_bag;
dump dept_bag;

--4

filter_emp_bag = filter emp_bag by empsal>2000;

dump filter_emp_bag; 

--5

salout = store filter_emp_bag into '/home/cloudera/Desktop/pigout' using PigStorage(',');

--6

display = limit emp_bag 5;
dump display;

--7

display = group dept_bag by dept_id;

or

display = group dept_bag by deptname;

dump display;

--8
display = group emp_bag by (deptno,empno);
dump display;

--9
display = group emp_bag by empno;
dump display;

--10
display = foreach emp_bag generate (empname,empsal,deptno);
dump display;

--11
display = foreach emp_bag generate $1,$3,$5;

or
display = foreach emp_bag generate $0,$2,$4;
dump display;

--12
sort = ORDER emp_bag by empname ASC;
dump sort;

--13
salary = ORDER emp_bag by empsal DESC;
dump salary;

--14
job = foreach emp_bag generate empdesi;
distinctjob = distinct job;
dump distinctjob;

--15
A = load 'home/cloudera/Desktop/a.txt' using PigStorage(',');
B = load 'home/cloudera/Desktop/b.txt' using PigStorage(',');
C = cogroup A by $1, B by $1;
dump C;

--or

C = cross A, B;
dump C;

--16
SPLIT emp_bag into A if empsal<2000, B if emp_sal>2000;
dump A;
dump B;

--17
empunion = UNION A,B;
dump empunion;

--18
combine = JOIN emp_bag by deptno, dept_bag by deptno;
dump combine;

-- Left Join
emp_left = JOIn emp_bag by deptno LEFT OUTER, dept_bag by deptno;
dump emp_left;

-- Right Join
emp_right = JOIN emp_bag by deptno RIGHT,dept_bag by dept_no;
dump emp_right;

-- Full Outer Join
emp_full = JOIN emp_bag by deptno FULL OUTER, dept_bag by deptno;
dump emp_full;

--19
text = load '/home/cloudera/Desktop/text.txt' as (line:chararray);
words = FOREACH text GENERATE FLATTEN(TOKENIZE(line)) as word;
grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(words);
DUMP wordcount;

--20
lines = LOAD '/home/cloudera/Desktop/text.txt' as (line:chararray);
word = FOREACH text GENERATE FLATTEN(TOKENIZE(line)) as word;
grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group as word, COUNT(words) as total;
ordercount = ORDER wordcount BY total DESC;
maxcount= LIMIT orderecount 1;
DUMP maxcount;

--21
lines = LOAD '/home/cloudera/Desktop/text.txt' as (line:chararray);
word = FOREACH text GENERATE FLATTEN(TOKENIZE(line)) as word;
grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group as word, COUNT(words) as total;
ordercount = ORDER wordcount BY total ASC;
maxcount= LIMIT orderecount 1;
DUMP maxcount;

--22
lines = LOAD '/home/cloudera/Desktop/text.txt' as (line:chararray);
word = FOREACH text GENERATE FLATTEN(TOKENIZE(line)) as word;
grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group as word, COUNT(words) as total;
ordercount = ORDER wordcount BY total DESC;
maxcount= LIMIT orderecount 5;
DUMP maxcount;

--23
lines = LOAD '/home/cloudera/Desktop/text.txt' as (line:chararray);
words = FOREACH text GENERATE FLATTEN(TOKENIZE(line)) as word;
grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group as word, COUNT(words) as total;
ordercount = ORDER wordcount BY total ASC;
maxcount= LIMIT orderecount 3;
DUMP maxcount;

--24
lines = LOAD '/home/cloudera/Desktop/text.txt' as (line:chararray);
words = FOREACH text GENERATE FLATTEN(TOKENIZE(LOWER(line))) as (word:chararray);
dump words;
C3 = filter words by word=='hadoop';
grouped = group C3 by word;
wordcount = foreach grouped generate $0, COUNT($1);
dump wordcount;

--25
--No word occured 8 times.

--26
lines = LOAD '/home/cloudera/Desktop/d.txt' using PigStorage('|') as (line:chararray);
words = FOREACH text GENERATE FLATTEN(TOKENIZE(line)) as word;
grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(words);
DUMP wordcount;

--27
jsonfile = load '/home/cloudera/Desktop/sample.json' using JsonLoader('food:chararray,person:chararray,amount:int');
describe jsofile;
dump jsonfile;
jsonstore = store jsofile into '/home/cloudera/Desktop/pigjson' using PigStorage(',');

--on hive
use pigwork;
create table jsonfile(foor string,person string,amount int)
row format delimited fields terminated by ',';

describe jsonfile;

load local inpath '/home/cloudera/Desktop/pigjson/part-m-00000' into table jsonfile;

select * from jsonfile limit 3;
select food from jsonfile;
select food,person form jsonfile where amount=105;


--28
REGISTER  /home/cloudera/Desktop/piggybank.jar

pigxml = LOAD '/home/cloudera/Desktop/sample.xml' using org.apache.pig.piggybank.storage.XMLLoader('BOOK') AS (x:chararray);

selectxml = foreach A GENERATE REGEX_EXTRACT_ALL(x,'<BOOK>\\s*<TITLE>(.*)</TITLE>\\s*
<AUTHOR>(.*)</AUTHOR>\\s*<COUNTRY>(.*)</COUNTRY>\\s*
<COMPANY>(.*)</COMPANY>\\s*<PRICE>(.*)</PRICE>\\s*<YEAR>(.*)</YEAR>\\s*</BOOK>');


--29
add jar /home/udf_jars/hivexmlserde-1.0.5.3.jar;
CREATE EXTERNAL TABLE hive_test_xml(
col1            string,
col2            string,
col3            string
)
ROW FORMAT SERDE 'com.ibm.spss.hive.serde2.xml.XmlSerDe'
WITH SERDEPROPERTIES (
"column.xpath.col1"="/Books/col1/text()",
"column.xpath.col2"="/Books/col2/text()",
"column.xpath.col3"="/Books/col3/text()"
)
STORED AS
INPUTFORMAT 'com.ibm.spss.hive.serde2.xml.XmlInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat'
LOCATION ' /user/user1/xml/data'
TBLPROPERTIES (
"xmlinput.start"="<Books",
"xmlinput.end"="</Books>");

--30
emp_bag = load '/home/cloudera/Desktop/Pigfile.txt' using PigStorage(',')
as (eid:int,emoname:chararray,empdesi,empsal,empcom,deptno:int);

groupx = group emp_bag by deptno;

groupoper = foreach groupx generate MAX(emp_bag.empsal) as maxsal,MIN(emp_bag.empsal) as minsal,SUM(emp_bag.empsal) as sumsal,AVG(emp_bag.empsal)as avgsal, COUNT($1) as count;

describe groupoper;
dump groupoper;

--31
a = load '/home/cloudera/Desktop/pigarray.txt' using PigStorage(',') as (name:chararray,year:int,sub:chararray,bat:chararray);
b = foreach a generate name,FLATTEN(TOBAG(STRSPLIT(sub,'$'))) as value:tuple(sub:chararray);
dump b;


--32
A = load '/home/cloudera/Desktop/pigmap.txt' using PigStorage(',') as (id:int,name:chararray,salary:map[]);

dump  A;

B = foreach A generate id,name,salary#'sal';
dump B;

--33
s = load '/home/cloudera/Desktop/pigstruct.txt' using PigStorage(',')as (id,name,sub,sal);

flar = foreach s generate FLATTEN(TOKENIZE(sub)) as float;

dump flar;



