# Arquitetura do Sistema

## Abordagem Escolhida

Foi utilizada a Approach A, focada na construção e automatização de uma infraestrutura cloud completa.

---

## Visão Geral da Arquitetura

```text
Internet
    |
    v
Internet Gateway
    |
    v
Subnets Públicas
    |
    v
Instância EC2
    |
    +-------> Amazon SQS
    |
    +-------> Amazon RDS PostgreSQL
                  |
                  v
            Subnets Privadas
```

---

## Componentes

### Rede

A infraestrutura de rede é composta por:

* VPC AWS
* Duas subnets públicas
* Duas subnets privadas
* Internet Gateway
* Route Tables
* Security Groups

### Computação

Uma instância Amazon EC2 é utilizada para alojar a aplicação e executar os containers Docker.

### Base de Dados

A persistência de dados é assegurada através de uma instância Amazon RDS PostgreSQL.

A base de dados encontra-se numa subnet privada, não estando acessível diretamente pela Internet.

### Sistema de Mensagens

O projeto utiliza:

* Amazon SQS
* Dead Letter Queue (DLQ)

para comunicação assíncrona entre serviços.

### Automatização

A infraestrutura é criada e gerida através de:

* Terraform
* GitHub Actions
* Ansible

---

## Fluxo de Dados

1. O Service A produz mensagens.
2. As mensagens são enviadas para a fila Amazon SQS.
3. O Service B consome as mensagens da fila.
4. Os dados podem ser armazenados na base de dados PostgreSQL.
5. Alterações à infraestrutura são aplicadas automaticamente através do GitHub Actions.

---

## Segurança

Foram implementadas as seguintes medidas:

* Base de dados em subnets privadas.
* Security Groups para controlo de acessos.
* SSH limitado ao endereço IP do administrador.
* Utilização de OIDC para autenticação do GitHub Actions.
* Armazenamento seguro de credenciais através de GitHub Secrets.
