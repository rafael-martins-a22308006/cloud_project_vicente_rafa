# Arquitetura do Sistema

## Abordagem Escolhida

Foi utilizada a Approach A 

O projeto demonstra a utilização de serviços AWS, Infrastructure as Code (IaC), automação de deploy e comunicação assíncrona entre serviços

---

## Visão Geral da Arquitetura

A solução é composta por:

* Amazon VPC
* Internet Gateway
* Amazon EC2
* Amazon RDS PostgreSQL
* Amazon SQS
* Dead Letter Queue (DLQ)

A infraestrutura é gerida através do Terraform e implementada automaticamente utilizando GitHub Actions

---

## Design de Rede

A infraestrutura utiliza uma VPC com o bloco CIDR 10.0.0.0/16.

Foram criadas:

* 2 subnets públicas
* 2 subnets privadas

As subnets públicas alojam a instância EC2.

As subnets privadas alojam a base de dados PostgreSQL.

O acesso à Internet é realizado através de um Internet Gateway.

A comunicação entre componentes é controlada através de Security Groups.

---

## Comunicação Entre Serviços

O sistema é composto por dois serviços:

* Service A
* Service B

O Service A produz mensagens.

As mensagens são enviadas para uma fila Amazon SQS.

O Service B consome as mensagens da fila e processa a informação recebida.

Esta abordagem reduz o acoplamento entre componentes e melhora a escalabilidade da solução.

---

## Componentes Event-Driven

A comunicação assíncrona é realizada através do Amazon SQS.

Quando uma mensagem falha repetidamente o processamento, é enviada para uma Dead Letter Queue (DLQ).

Esta abordagem aumenta a resiliência da aplicação e facilita a identificação de erros.

---

## Principais Decisões Técnicas

Durante o desenvolvimento do projeto foram tomadas as seguintes decisões:

* Utilização de Terraform para Infrastructure as Code
* Utilização de GitHub Actions para CI/CD
* Utilização de OIDC em vez de Access Keys AWS
* Utilização de Amazon RDS PostgreSQL para persistência de dados
* Utilização de Amazon SQS para comunicação assíncrona
* Utilização de Docker para execução da aplicação
* Utilização de Ansible para configuração da EC2
* Utilização de Terraform Modules para separação lógica da infraestrutura

---

## Limitações e Melhorias Futuras

Apesar de cumprir os objetivos definidos, existem algumas limitações:

* Apenas existe um ambiente principal de desenvolvimento
* A aplicação utiliza apenas uma instância EC2
* Não existe balanceamento de carga
* Não existe monitorização centralizada

Como melhorias futuras poderão ser implementados:

* Ambiente de produção separado.
* Amazon ECS ou Kubernetes.
* Amazon CloudWatch.
* Auto Scaling.
* Deploy completo da aplicação através de Ansible.
