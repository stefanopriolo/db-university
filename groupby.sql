-- #1 Contare quanti iscritti ci sono stati ogni anno

SELECT YEAR(`enrolment_date`) AS Anno, COUNT(*) AS NumeroIscritti
FROM `students`
GROUP BY Anno;


-- #2 Contare gli insegnanti che hanno l'ufficio nello stesso edificio 

SELECT `teachers` . `office_address`, COUNT(`teachers` . `id`) AS NumeroInsegnanti
FROM `teachers`
GROUP BY `teachers`. `office_address`;



-- #3 Calcolare la media dei voti di ogni appello d'esame

SELECT `courses`. `name`, ROUND(AVG(`vote`)) AS MediaVoti
FROM `exam_student`
INNER JOIN `exams`
    ON `exams` . `id` = `exam_student` . `exam_id`
INNER JOIN `courses`
    ON `courses` . `id` = `exams` . `course_id`
GROUP BY `exams`. `id`;



-- #4 Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `departments`. `name` AS Dipartimento, COUNT(`degrees` . `id`) AS NumeroCorsi
FROM `degrees`
LEFT JOIN `departments`
	ON `departments`. `id` = `degrees`. `department_id`
GROUP BY `departments` . `name`;