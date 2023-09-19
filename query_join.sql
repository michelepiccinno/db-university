-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `degrees`.`name`, `students`.`name`, `students`.`surname`
    FROM `students`
    INNER JOIN `degrees`
    ON `students`.`degree_id` = `degrees`.`id`
    WHERE `degrees`.`id` = 53;

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT `departments`.`name`, `degrees`.`id`, `degrees`.`name`
FROM `departments`
INNER JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze";

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `teachers`.`id` AS `teacher_id`, `teachers`.`name` AS Name, `teachers`.`surname` AS `Surname`
FROM `teachers`
INNER JOIN `course_teacher`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
INNER JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
WHERE `teachers`.`id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`name` AS Name, `students`.`surname` AS `Surname`, `students`.`fiscal_code` AS `fiscal_code`, `degrees`.`name` AS `Degree`
FROM `students`
INNER JOIN `degrees`
ON `students`.`id` = `degrees`.`id`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`name`, `students`.`surname` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS `Degree`, `courses`.`name` AS `Course`, `teachers`.`name` AS `Teacher_Name`, `teachers`.`surname` AS `Teacher_Surname`
FROM `degrees`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT `teachers`.`name` AS `Teacher_Name`, `teachers`.`surname` AS `Teacher_Surname`, `departments`.`name`
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = "Dipartimento di Matematica";