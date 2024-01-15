create  table mem(
id varchar(20) primary key, 
password varchar(20), 
name varchar(30), 
birth datetime, 
address varchar(500)
);

insert into mem values('test1','javakim','자바킴',now(),'서울 종로구 솔데스크'); 

create table board(
 no int primary key auto_increment, 
 id varchar(20) ,
 title varchar(50), -- 제목
 content varchar(4000), -- 내용
 regdate datetime default current_timestamp, -- 작성일
 readcount int default 0, -- 조회수
 foreign key (id) references mem(id)
); 

insert into board( id,title, content)
		values('test1', 'title', 'contentcontentcontent'); 
        
select * from mem;        
select * from board; 
commit;    

create table comm(
	 cno int primary key auto_increment,
	 id varchar(20),
	 content varchar(200),
	 regdate datetime,
	 no int,
     foreign key (no) references board(no)
);

