-- #1 Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `degrees`.`id`, `degrees`.`name`, `students`. `name`, `students`. `surname`, 
		`students` . `date_of_birth`, `students` . `email`
FROM `degrees`
INNER JOIN `students`
	ON `degrees`. `id` = `students`. `degree_id`
    WHERE `degrees`. `name` LIKE "%Corso di Laurea in Economia%";


-- #2 Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze 

SELECT `departments` . `id`, `departments`. `name`, `degrees`. `name`
FROM `departments`
INNER JOIN `degrees`
	ON `degrees` . `department_id`= `departments`. `id`
 WHERE `departments` . `name` LIKE "%Dipartimento di neuroscienze%"
 AND `degrees`. `level` LIKE "%magistrale%";


-- #3 Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `teachers`. `id`, `teachers`.`name`, `teachers`.`surname`, `courses`. `id`, `courses`. `name`
FROM `teachers`
INNER JOIN `course_teacher`
	ON `course_teacher` . `teacher_id` = `teachers` . `id`
LEFT JOIN `courses`
    ON `courses`.`id` = `course_teacher`. `course_id`
WHERE `teachers`. `id` = 44;




-- #4 Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students` . `id`, `students` . `surname`, `students` . `name`,
       `degrees` . `name` AS "Corso di Laurea", `departments` . `name` AS "Dipartimento"
FROM `students`
INNER JOIN `degrees`
	ON `degrees` . `id` = `students` . `degree_id`
INNER JOIN `departments`
    ON `departments` . `id` = `degrees` . `department_id`
ORDER BY `students` . `surname`;




-- #5 Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `degrees` . `id`, `degrees` . `name` AS "Nome Corso di Laurea", 
       `courses` . `name` AS "Corso", `teachers`. `name` AS "Nome Insegnante"
FROM `degrees`
INNER JOIN `courses`
	ON `courses` . `degree_id` = `degrees` . `id` 
LEFT JOIN `teachers`
	ON `teachers` . `id` = `courses` . `id`;





-- #6 Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT `departments`. `name`, `teachers`.`id`, `teachers`. `name`, `teachers`. `surname`
FROM `teachers`
CROSS JOIN `departments`
WHERE `departments`. `name` LIKE "%Dipartimento di Matematica%";




-- #7 (BONUS) Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18.