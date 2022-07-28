/* ### Questão 1:

Utilizando uma *query*, obtenha a quantidade de experiências (`experiences`) atuais, ou seja, com `“endDate”` diferente de `NULL`.

A resposta deve vir no formato:

```
|---currentExperiences---|
					80
			   ....      
```

**Dica**: Você só precisa usar uma função agregadora, sem `WHERE` */

SELECT COUNT("endDate") AS "currentExperiences" 
FROM experiences;

/* Utilizando uma *query*, obtenha a quantidade de graduações (`educations`) por usuário, incluindo o seu id.

A resposta deve vir no formato:

```
|---id---|---educations---|
   110	         2
	 178	         1
   62	           1
   128	         1
   ...          ...          
```

**OBS:** a coluna `id` se refere ao id do usuário */

SELECT "userId" AS id, COUNT("courseId") AS educations
FROM educations
GROUP BY "userId";

/* ### Questão 3:

Utilizando uma *query*, obtenha a quantidade de depoimentos(`testimonials`) que o usuário com id **435** efetuou, incluindo o seu nome. 

A resposta deve vir no formato: 
|---writer---|---testimonailCount---|
    Jesus               3
     ...               ...    
*/

SELECT u."name" AS writer, COUNT("message") AS "testimonailCount"
FROM testimonials t
JOIN users u ON t."writerId" = u.id
WHERE u.id = 435
GROUP BY u."name";

/* ### Questão 4:

Utilizando uma *query*, obtenha o maior salário das vagas (`jobs`) ativas (**`active** = true`) e o nome das posições (`roles`) dessas vagas ordenadas de forma ascendente

A resposta deve vir no formato:

```
|---maximumSalary---|-------------role--------------|
				107981	          Junior Software Engineer
				153208	          Front-end developer
				165869	          Senior Software Engineer
				183405	          Software Engineer
				201025	          Data Analyst
				215640	          QA Analyst
				230539	          Back-end developer
				246764	          Scrum Master
         ...                     ...
```

**Dica:** Podemos ordernar uma busca pelo valor de uma função agregadora usando o alias que demos a ela */

SELECT MAX(salary) AS "maximumSalary", name as role
FROM jobs 
JOIN roles ON "roleId" = roles.id
WHERE active = true
GROUP BY "name"
ORDER BY "maximumSalary" ASC