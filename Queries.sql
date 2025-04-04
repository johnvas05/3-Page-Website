SELECT Books.title
from books
join Loans ON Books.book_id = Loans.book_id
join Students ON Loans.student_id = Students.student_id
Where Students.student_number = '20231234';

Select Books.title
from Books
join Loans ON Books.book_id = Loans.book_id
WHERE Loans.book_id IS NULL;

SELECT DISTINCT Students.first_name, Students.last_name, Students.student_number
from Students
Join Loans ON Students.student_id = Loans.student_id
JOIN main.Books B on Loans.book_id = B.book_id
join Publishers ON B.publisher_id  = Publishers.publisher_id
Where Publishers.name = 'Κάτοπτρο';

SELECT Books.available_copies
FROM Books
Where Books.title = 'Αλγοριθμική Σκέψη' ;

SELECT title, year_published
FROM Books
WHERE year_published  2010;

SELECT Loans.return_date, Students.first_name, Students.last_name, Books.title
FROM Loans
JOIN Students ON Loans.student_id = Students.student_id
JOIN Books ON Loans.book_id = Books.book_id
WHERE Loans.return_date IS NOT NULL
ORDER BY Loans.return_date DESC
LIMIT 5;

SELECT Students.first_name, Students.last_name, Students.student_number, Books.title, Loans.due_date, Loans.return_date
FROM Loans
JOIN Students ON Loans.student_id = Students.student_id
JOIN Books ON Loans.book_id = Books.book_id
WHERE

    (Loans.return_date IS NULL AND Loans.due_date  DATE('now'));

SELECT Students.first_name, Students.last_name, Students.student_number, COUNT(Loans.loan_id) AS total_loans
FROM Students
LEFT JOIN Loans ON Students.student_id = Loans.student_id
GROUP BY Students.student_id
ORDER BY total_loans DESC;


SELECT b.title, b.year_published
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
WHERE a.last_name = 'Παπαδόπουλος';

SELECT s.
FROM Students s
LEFT JOIN Loans l ON s.student_id = l.student_id
WHERE l.student_id IS NULL;

SELECT Loans.book_id, COUNT() as loan_count
FROM Loans
GROUP BY book_id
HAVING loan_count = (
    SELECT COUNT()
    FROM Loans
    GROUP BY book_id
    ORDER BY count() DESC
    LIMIT 1
    ) ;

SELECT
    b.book_id, b.title, l.loan_id, l.return_date, l.due_date,
    CASE
        WHEN l.return_date = l.due_date THEN 'On Time'
        WHEN l.return_date  l.due_date THEN 'Delayed'
        WHEN l.return_date IS NULL AND CURRENT_DATE  l.due_date THEN 'Currently Overdue'
        WHEN l.return_date IS NULL THEN 'Currently Borrowed'
    END AS return_status
FROM
    Loans l
JOIN
    Books b ON l.book_id = b.book_id
ORDER BY
    return_status, b.title;

SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    COUNT() AS borrow_count
FROM
    Loans l
JOIN
    Students s ON l.student_id = s.student_id
GROUP BY
    s.student_id, s.first_name, s.last_name
HAVING
    COUNT()  3
ORDER BY
    borrow_count DESC;

SELECT p.name, b.book_id, b.title
from Publishers p
join main.Books B on p.publisher_id = B.publisher_id
where p.country = 'ΕΛΛΑΔΑ'