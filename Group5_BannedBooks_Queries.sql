USE bannedbooks_group5_backup;

DROP VIEW IF EXISTS Books_BigCopies;
CREATE VIEW Books_BigCopies AS 
	SELECT Book_Name, Ban_year, Copies_sold, Reason_For_Ban
    FROM books
    JOIN ban_books USING(Book_ID)
    JOIN ban_information USING(Ban_ID)
    JOIN ban_categorization USING(Ban_category_id)
    WHERE Copies_sold > 100000
    ORDER BY Ban_year;

/* Requirements met: A, B, D */

DROP VIEW IF EXISTS Austrian_Books;
CREATE VIEW Austrian_Books AS
	SELECT country AS "Country of Origin", COUNT(Book_Name) AS "Number of Books", AVG(Chapters) AS "Average Number of Chapters"
    FROM books
    JOIN country USING(Country_ID)
    WHERE country_id = 2;

/* Requirements met: A, B, C */

DROP VIEW IF EXISTS BigPublisherBooks;
CREATE VIEW BigPublisherBooks AS 
	SELECT Book_Name, Publisher
    FROM books
    JOIN publishing_books USING (Book_ID)
    JOIN publishing USING (Publisher_ID)
    WHERE publisher IN 
		(SELECT publisher 
		FROM publishing
        WHERE volumes >= 1000);


/* Requirements met: A, B, D, E */

DROP VIEW IF EXISTS View_4;
CREATE VIEW View_4 AS
	SELECT Book_Name, Ban_year, Reason_for_Ban, CONCAT(First_Name, " ", Last_Name) AS author
    FROM books
    JOIN ban_books USING(Book_ID)
    JOIN ban_information USING(Ban_ID)
    JOIN ban_categorization USING(Ban_category_id)
    JOIN books_authors USING(Book_ID)
    JOIN authors USING(Author_ID)
    WHERE ban_year >= 1939
    ORDER BY ban_year, Reason_for_Ban;

/* Requirements met: A, B, D */

DROP VIEW IF EXISTS View_5;
CREATE VIEW View_5 AS
	SELECT CONCAT(First_Name, " ", Last_Name) AS author, Age, COUNT(Book_ID) AS "Number of Banned Books"
    FROM authors
    JOIN books_authors USING(Author_ID)
    GROUP BY Author_ID
    ORDER BY COUNT(Book_ID) DESC;

    /* Requirements met: A, C */