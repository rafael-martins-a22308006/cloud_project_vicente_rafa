# Guia de Implementação

## Pré-requisitos

Antes da implementação é necessário possuir:

* Conta AWS
* Terraform instalado
* Docker instalado
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

1. Inicialização do Terraform.
2. Validação da configuração.
3. Geração do plano.
4. Aplicação das alterações.
5. Disponibilização dos outputs.

---

## Deploy Automático

O projeto utiliza GitHub Actions para automatizar o processo de deploy.

Sempre que é realizado um push para a branch main, são executadas as seguintes tarefas:

1. Autenticação AWS através de OIDC.
2. Validação da infraestrutura Terraform.
3. Aplicação automática das alterações.
4. Atualização dos recursos AWS.

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
