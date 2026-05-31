# Modelo de Segurança

## Gestão de Identidades

O acesso aos recursos AWS é realizado através de IAM Roles.

O GitHub Actions autentica-se utilizando OpenID Connect (OIDC), eliminando a necessidade de armazenar chaves AWS permanentes.

---

## Gestão de Secrets

Informação sensível não é armazenada no código-fonte.

São utilizados GitHub Secrets para armazenar:

```text
AWS_ROLE_ARN
TF_VAR_db_password
```

---

## Segurança da Rede

### Security Group da EC2

Permite:

* HTTP (porta 80) para acesso à aplicação.
* SSH (porta 22) apenas a partir do IP do administrador.

### Security Group da Base de Dados

Permite:

* PostgreSQL (porta 5432) apenas a partir da instância EC2.

---

## Proteção da Base de Dados

A instância PostgreSQL encontra-se:

* Em subnets privadas.
* Sem acesso público.
* Protegida por Security Groups.

---

## Proteção do Estado Terraform

O estado remoto do Terraform é armazenado em:

* Amazon S3
* DynamoDB 

Isto permite:

* Trabalho colaborativo
* Evitar alterações simultâneas
* Prevenir corrupção do estado

---

## Boas Práticas Implementadas

* Princípio do Menor Privilégio
* Infrastructure as Code
* Remote State Backend
* Autenticação OIDC
* Isolamento de Base de Dados
* Gestão Segura de Credenciais
* Automatização CI/CD
* Controlo de acessos através de Security Groups
