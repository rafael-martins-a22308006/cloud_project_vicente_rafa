# Arquitetura do Projeto

## Abordagem

Escolhemos o Approach A 

O projeto vai usar o sistema de microserviços fornecido no laboratório. O foco principal será Cloud Engineering: infraestrutura, automação, deployment, CI/CD e monitorização.

## Arquitetura Inicial

Utilizador → Internet → Subnet Pública → Serviços Web/API → Subnet Privada → Base de Dados

## Região AWS

us-east-1

## Convenção de Nomes

Formato:
<projeto>-<ambiente>-<recurso>

Exemplos:
- cloud-dev-vpc
- cloud-dev-subnet-public
- cloud-dev-ec2

## Estratégia de Branches

- main → código estável
- infra/* → infraestrutura
- feat/* → funcionalidades
- fix/* → correções