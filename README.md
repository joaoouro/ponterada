# Documentação do Modelo de Banco de Dados

## Introdução

Este documento apresenta a modelagem de um banco de dados relacional do projeto para a Parceiros Voluntários. A modelagem foi realizada utilizando o SQL Designer e inclui os arquivos da modelagem (.xml e .sql), além de uma explicação detalhada das tabelas, relacionamentos, chaves primárias e estrangeiras.

## Estrutura do Banco de Dados

O banco de dados é composto por seis tabelas principais:

1. `instituição`
2. `Post`
3. `comentario`
4. `Voluntariado`
5. `User`
6. `tipo`

### Tabela: `instituição`

A tabela `instituição` armazena informações sobre as instituições.

| Coluna                | Tipo      | Descrição                                  |
|-----------------------|-----------|--------------------------------------------|
| id                    | INTEGER   | Identificador único da instituição (PK)    |
| descrição             | VARCHAR   | Descrição da instituição                   |
| horas de trabalho     | INTEGER   | Total de horas de trabalho                 |
| avaliação             | INTEGER   | Avaliação da instituição                   |
| posts                 | INTEGER   | ID do post (FK)                            |
| voluntariados (id)    | INTEGER   | ID do voluntariado (FK)                    |
| permissões            | INTEGER   | Permissões da instituição                  |
| senha (hash)          | VARCHAR   | Hash da senha                              |
| Email                 | VARCHAR   | Email da instituição                       |
| CNPJ                  | INTEGER   | CNPJ da instituição                        |
| foto de perfil (id)   | INTEGER   | ID da foto de perfil (FK)                  |
| Nome fantasia         | INTEGER   | Nome fantasia da instituição               |
| tipo                  | INTEGER   | Tipo da instituição (FK)                   |

### Tabela: `Post`

A tabela `Post` armazena informações sobre os posts.

| Coluna                | Tipo      | Descrição                                  |
|-----------------------|-----------|--------------------------------------------|
| id                    | INTEGER   | Identificador único do post (PK)           |
| data                  | INTEGER   | Data do post                               |
| hora                  | INTEGER   | Hora do post                               |
| descrição             | INTEGER   | Descrição do post                          |
| comentários (id)      | INTEGER   | ID do comentário (FK)                      |
| Nome fantasia         | INTEGER   | Nome fantasia relacionado ao post          |

### Tabela: `comentario`

A tabela `comentario` armazena informações sobre os comentários.

| Coluna                | Tipo      | Descrição                                  |
|-----------------------|-----------|--------------------------------------------|
| id                    | INTEGER   | Identificador único do comentário (PK)     |
| Conteúdo              | VARCHAR   | Conteúdo do comentário                     |
| foto de perfil (id)   | INTEGER   | ID da foto de perfil (FK)                  |
| hora                  | INTEGER   | Hora do comentário                         |
| Nome fantasia         | INTEGER   | Nome fantasia relacionado ao comentário    |

### Tabela: `Voluntariado`

A tabela `Voluntariado` armazena informações sobre os voluntariados.

| Coluna                | Tipo      | Descrição                                  |
|-----------------------|-----------|--------------------------------------------|
| id                    | INTEGER   | Identificador único do voluntariado (PK)   |
| Nome                  | INTEGER   | Nome do voluntariado                       |
| descrição             | VARCHAR   | Descrição do voluntariado                  |
| Users (id)            | INTEGER   | ID do usuário (FK)                         |
| horas                 | INTEGER   | Horas dedicadas ao voluntariado            |

### Tabela: `User`

A tabela `User` armazena informações sobre os usuários.

| Coluna                | Tipo      | Descrição                                  |
|-----------------------|-----------|--------------------------------------------|
| id                    | INTEGER   | Identificador único do usuário (PK)        |
| senha (hash)          | INTEGER   | Hash da senha                              |
| Email                 | INTEGER   | Email do usuário                           |
| CPF                   | INTEGER   | CPF do usuário                             |
| foto de perfil (id)   | INTEGER   | ID da foto de perfil                 |
| premissões            | INTEGER   | Permissões do usuário                      |
| voluntariados (id)    | INTEGER   | ID do voluntariado (FK)                    |
| horas de trabalho     | INTEGER   | Total de horas de trabalho                 |
| descrição             | INTEGER   | Descrição do usuário                       |
| posts                 | INTEGER   | ID do post (FK)                            |
| Data de cadastro      | INTEGER   | Data de cadastro                           |
| Tags                  | INTEGER   | Tags associadas ao usuário                 |

### Tabela: `tipo`

A tabela `tipo` armazena os tipos de instituição.

| Coluna                | Tipo      | Descrição                                  |
|-----------------------|-----------|--------------------------------------------|
| id                    | INTEGER   | Identificador único do tipo (PK)           |
| Empresa               | INTEGER   | Indica se é uma empresa                    |
| ONG                   | INTEGER   | Indica se é uma ONG                        |

### Relacionamentos

- A tabela `instituição` possui chaves estrangeiras que referenciam as tabelas `Post`, `Voluntariado`, `comentario` e `tipo`, estabelecendo os relacionamentos.
- A tabela `Post` possui chaves estrangeiras que referenciam a tabela `comentario`.
- A tabela `Voluntariado` possui chaves estrangeiras que referenciam a tabela `User`.
- A tabela `User` possui chaves estrangeiras que referenciam a tabela `Post`.

### Exemplos de Consultas SQL

Abaixo está um exemplos de consulta SQL para interagir com o banco de dados:

#### Inserir uma nova instituição

```sql
INSERT INTO instituição (descrição, horas de trabalho, avaliação, posts, voluntariados, permissões, senha, Email, CNPJ, foto de perfil, Nome fantasia, tipo) 
VALUES ('Descrição da Instituição', 40, 5, 1, 1, 1, 'hashsenha', 'email@instituicao.com', 12345678901234, 1, 'Nome Fantasia', 1);
