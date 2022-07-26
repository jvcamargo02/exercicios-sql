 /*### Questão 1:

Utilizando uma *query*, obtenha todos os usuários (`users`) que vivem na cidade (`cities`) cujo nome seja “**Rio de Janeiro**”.

A resposta deve vir no formato:

```
|---id---|---name---|-------city-------|
    1        João      Rio de Janeiro
    2        Maria     Rio de Janeiro
   ...        ...            ...
```

**OBS:** a coluna `id` se refere ao id do usuário

**Dica:** utilize apelidos para os nomes de colunas ficarem como você deseja (ex: `SELECT cities.name AS city`)

**Dica:** na query, todo nome de coluna que tenha letras maiúsculas precisa estar entre aspas duplas (ex: `ON users."cityId" = ...`). Repare que somente o nome da coluna fica entre aspas duplas.  */

SELECT u.id, u.name, c.name as city FROM users u JOIN cities c ON u."cityId" = c.id WHERE c.name = 'Rio de Janeiro'


/* ### Questão 2:

Utilizando umas *query*, obtenha todos os depoimentos (`testimonials`) cadastrados, incluindo o nome do remetente e do destinatário.

A resposta deve vir no formato:

```
|---id---|---writer---|---recipient---|--------------message------------------|
    1        João           Maria         Foi ótimo trabalhar com a Maria...
    2        Maria          João           Adorei trabalhar com o João...
   ...        ...            ...                     ...
```

**OBS:** a coluna `id` se refere ao id do depoimento

**Dica:** para fazer múltiplos joins com uma mesma tabela, use apelidos para cada join (ex: `JOIN tabela t1`) */

SELECT t.id, t.message, r.name as recipient, w.name as writer FROM testimonials t  JOIN users r ON t."recipientId" = r.id JOIN users w ON t."writerId"=w.id

/* 
### Questão 3:

Utilizando uma *query*, obtenha todos os cursos (`courses`) que o usuário com id **30** já finalizou, incluindo o nome da escola. O que indica que um usuário terminou um curso é o campo `status` da tabela `educations`, que deve estar como "**finished**".

A resposta deve vir no formato:

```
|---id---|---name---|---course---|----school----|---endDate---|
    30        João      HTML/CSS       Driven       2021-12-01
    30        João      JavaScript     Driven       2022-01-20
   ...        ...         ...           ...          ...
```

**OBS:** a coluna `id` se refere ao id do usuario */

SELECT u.id,u.name, c.name as course, s.name as school, e."endDate"  from  educations e JOIN courses c ON e."courseId" = c.id JOIN users u ON e."userId" = u.id JOIN schools s ON e."schoolId" = s.id WHERE u.id = 30 and e.status = 'finished'

/* ### Questão 4:

Utilizando uma *query*, obtenha as empresas (`companies`) para as quais o usuário com id **50** trabalha atualmente. Para filtrar quem trabalha atualmente, utilize o campo `endDate` da tabela `experiences`. Se ele estiver null (`IS NULL`), significa que a pessoa ainda não encerrou a experiência dela na empresa, ou seja, está trabalhando lá.

A resposta deve vir no formato:

```
|---id---|---name---|--------role--------|----company----|---startDate---|
    50        João      Software Engineer        OLX          2020-06-01
    50        João         Consultant            IBM          2022-02-01
   ...        ...            ...                ...              ...
```

**OBS:** a coluna `id` se refere ao id do usuário */

SELECT u.id, u.name, r.name as role, c.name as company, e."startDate" FROM experiences e JOIN roles r ON e."roleId" = r.id JOIN companies c ON e."companyId"=c.id JOIN users u ON e."userId" = u.id WHERE e."userId" = 50 AND e."endDate" IS NULL 
