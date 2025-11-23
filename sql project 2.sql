create database project;

use project;

create table library_branch(library_branch_BranchID tinyint auto_increment primary key,
	library_branch_BranchName varchar (255),
    library_branch_BranchAddress varchar(255));
select * from library_branch;

create table publisher (publisher_PublisherName varchar(255) primary key,
	publisher_PublisherAddress varchar(255),
    publisher_PublisherPhone varchar(255));
select * from publisher;

create table borrower(borrower_CardNo int auto_increment primary key,
	borrower_BorrowerName varchar(255),
    borrower_BorrowerAddress varchar (255),
    borrower_BorrowerPhone varchar(255));
select * from borrower;


create table books(book_BookID tinyint auto_increment primary key ,
                    book_Title varchar(255),
                    book_PublisherName varchar (255),
                    foreign key (book_PublisherName) references publisher(publisher_PublisherName));
select * from books;

create table authors(book_authors_AuthorID tinyint auto_increment primary key,
	book_authors_BookID int,
    foreign key (book_authors_BookID) references books(book_BookID),
	book_authors_AuthorName varchar(100));
select * from authors;


create table book_copies (book_copies_CopiesID tinyint auto_increment primary key,
	book_copies_BookID tinyint,
    foreign key (book_copies_BookID) references books(book_BookID),
    book_copies_BranchID tinyint,
    foreign key (book_copies_BranchID) references library_branch(library_branch_BranchID),
    book_copies_No_Of_Copies int);
select * from book_copies;

create table book_loans (book_loans_loanID tinyint auto_increment primary key,
    book_loans_BookID tinyint,
    foreign key (book_loans_BookID) references books(book_BookID),
	book_loans_BranchID tinyint,
    foreign key (book_loans_BranchID) references library_branch(library_branch_BranchID),
    book_loans_CardNo int,
    foreign key (book_loans_CardNo) references borrower(borrower_CardNo),
    book_loans_DateOut date,
    book_loans_DueDate date);
select * from book_loans;




