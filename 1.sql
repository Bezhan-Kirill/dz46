SELECT *
FROM Students
WHERE EXISTS(SELECT русский_язык
	FROM Grades
	WHERE date = '2024-07-10' AND Students.id = Grades.students_id);


SELECT Имя + ' ' + Фамилия
FROM Посетители
WHERE EXISTS(
	SELECT Журнал_посещений.id_посетителя
	FROM Журнал_посещений
	WHERE Журнал_посещений.id_занятия = 1 AND Журнал_посещений.id_посетителя = Посетители.id_посетителя);


SELECT firstname + lastname
FROM Students
WHERE id = ANY(SELECT students_id
	FROM Grades
	WHERE литература = 5);


SELECT *
FROM Фрукты
WHERE Цвет = SOME(
	SELECT Цвет
	FROM Фрукты
	WHERE Цвет = 'Красный');


SELECT firstname + ' ' + lastname, химия
FROM Students, Grades
WHERE Students.id = Grades.students_id AND
	химия > ALL (SELECT AVG(Grades.химия)
	FROM Grades);


SELECT firstname + ' ' + lastname, химия
FROM Students, Grades
WHERE Students.id = Grades.students_id AND химия = ANY(
	SELECT химия
	FROM Grades
	WHERE химия > ALL (SELECT AVG(Grades.химия)
	FROM Grades));


SELECT Фрукты.Калории , Фрукты.Название
FROM Фрукты
WHERE Калории >= 50
UNION
SELECT Овощи.Калории, Овощи.Название
FROM Овощи
WHERE Калории >= 50


SELECT Фрукты.Название + Поставщики.Наименование, Поставщики.Страна
FROM Фрукты, Поставщики
WHERE Фрукты.id_поставщика = Поставщики.id
UNION ALL
SELECT Овощи.Название + Поставщики.Наименование, Поставщики.Страна
FROM Овощи, Поставщики
WHERE Овощи.id_поставщика = Поставщики.id


SELECT *
FROM Groups INNER JOIN Students
ON Groups.group_id=Students.group_id


SELECT *
FROM Посетители LEFT JOIN Секции
ON Посетители.id_секции = Секции.id_секции


SELECT *
FROM Поставщики RIGHT JOIN Овощи
ON Овощи.id_поставщика = Поставщики.id


SELECT *
FROM Grades LEFT JOIN Students
ON Grades.students_id = Students.id RIGHT JOIN Groups
ON Groups.group_id = Students.group_id


SELECT *
FROM Поставщики FULL JOIN Фрукты
ON Фрукты.id_поставщика = Поставщики.id