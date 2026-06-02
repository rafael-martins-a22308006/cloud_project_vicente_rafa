# Guia de Implementação

## Pré-requisitos

Antes da implementação é necessário possuir:

* Conta AWS
* Terraform instalado
* Docker e Docker Compose instalados
* Git instalado

---

## Clonar o Projeto

```bash
git clone https://github.com/rafael-martins-a22308006/cloud_project_vicente_rafa

cd cloud_project_vicente_rafa
```

---

## Implementação da Infraestrutura

Inicializar Terraform:

```bash
terraform init
```

Validar a configuração:

```bash
terraform validate
```

Gerar plano de execução:

```bash
terraform plan
```

Aplicar a infraestrutura:

```bash
terraform apply
```

---

## Execução da Aplicação

Aceder à pasta da aplicação:

```bash
cd semana2
```

Construir e iniciar os containers:

```bash
docker compose up --build
```

---

## Workflow de Deploy

O processo de implementação segue os seguintes passos:

1. Inicialização dos módulos Terraform
2. Validação da infraestrutura
3. Construção das imagens Docker
4. Publicação das imagens no GitHub Container Registry 
5. Aplicação das alterações na AWS
6. Disponibilização dos outputs Terraform

---

## Deploy Automático

O projeto utiliza GitHub Actions para automatizar o processo de deploy

Sempre que é realizado um push para a branch main, são executadas as seguintes tarefas:

1. Autenticação AWS através de OIDC
2. Login no GitHub Container Registry 
3. Construção das imagens Docker dos serviços
4. Publicação das imagens Docker no GHCR
5. Inicialização e validação do Terraform
6. Aplicação automática da infraestrutura AWS
7. Disponibilização dos outputs Terraform

---

## Secrets Necessários

No GitHub devem existir os seguintes secrets:

```text
AWS_ROLE_ARN
TF_VAR_db_password
```

---

## Outputs Disponíveis

Após a implementação ficam disponíveis:

```text
ec2_public_ip
rds_endpoint
queue_url
vpc_id
```

---

## Registo de Containers

As imagens Docker dos serviços são automaticamente construídas e publicadas no GitHub Container Registry (GHCR) através do pipeline GitHub Actions

Serviços publicados:

```text
service-a
service-b
```

Esta abordagem permite reutilizar imagens já construídas durante futuras implementações e segue as boas práticas de CI/CD para aplicações contentorizadas

---

## Organização da Infraestrutura

A infraestrutura foi organizada através de módulos Terraform independentes:

* Networking
* Compute
* Database
* Queue

Esta abordagem melhora a reutilização, manutenção e escalabilidade do código, seguindo as boas práticas de Infrastructure as Code apresentadas ao longo da unidade curricular

---

## Tecnologias Utilizadas

* AWS
* Terraform Modules
* Amazon VPC
* Amazon EC2
* Amazon RDS PostgreSQL
* Amazon SQS
* Docker
* Docker Compose
* GitHub Container Registry (GHCR)
* GitHub Actions
* Ansible

---
