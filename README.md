# 🚗 Automotive Sales & Customer Profiling Dashboard

<img width="1444" height="793" alt="image" src="https://github.com/user-attachments/assets/3bc5da2f-0a85-4e17-9239-32f661c8ce75" />

## Visão Geral do Projeto

Este projeto consiste em um dashboard de Business Intelligence (BI) e uma análise de dados detalhada, focada em transformar dados brutos de funil de vendas e cadastro de clientes em insights estratégicos para o mercado automotivo. O objetivo principal é otimizar a gestão de estoque, as estratégias de marketing e a compreensão da demanda de veículos.

---

## 🛑 Aviso Legal e Conformidade (LGPD)

**IMPORTANTE:** Todos os dados apresentados neste repositório (incluindo perfis de clientes, CPFs, rendas, status profissionais, e eventos de visita) são **fictícios** e foram criados **apenas para fins de demonstração e estudo**.

O projeto foi desenvolvido em estrita observância à Lei Geral de Proteção de Dados (LGPD - Lei nº 13.709/2018), utilizando apenas dados não sensíveis e descaracterizados. **Não há dados pessoais reais** de clientes, nem informações confidenciais de empresas.

---

## 🎯 Objetivos da Análise

O dashboard e as consultas SQL subjacentes respondem a questões críticas de negócio, divididas em duas áreas principais:

### 1. Perfil Demográfico do Cliente
* Identificar o perfil do cliente por **Gênero**, **Faixa Salarial**, **Status Profissional** e **Idade**.
* Fornecer subsídios para segmentação de marketing e personalização de ofertas.

### 2. Performance e Classificação de Veículos
* Analisar a **Idade da Frota** (Classificação de Veículo) para guiar as decisões de compra e venda (e.g., o percentual de veículos 'Antigos' vs. 'Novo e Seminovos').
* Determinar os **Modelos Mais Visitados** no funil de vendas, medindo a popularidade real e o interesse do consumidor.

---

## 🛠️ Tecnologias e Ferramentas

| Categoria | Tecnologia | Uso no Projeto |
| :--- | :--- | :--- |
| **Banco de Dados** | SQL (T-SQL/PostgreSQL, etc.) | Consultas de extração, transformação e carregamento (ETL) e agregação de dados. |
| **Visualização/BI** | Power BI / Tableau (Presumido) | Criação do dashboard interativo para Data Visualization. |
| **Linguagem** | Python / R (Opcional) | Para análise estatística mais profunda ou limpeza de dados. |

---

## 📊 Estrutura das Consultas SQL

O projeto utiliza duas consultas principais para gerar os dados:

### 1. Contagem de Visitas por Produto
**Objetivo:** Calcular a popularidade de cada carro listado no catálogo, contando quantas vezes sua página foi visitada no funil.

```sql
WITH [numero_visitas] AS (...)
SELECT
    [brand], [model], [model_year], [price],
    COUNT([numero_visitas].[visita]) AS [total_visitas]
FROM [SALES].[dbo].[products]
LEFT JOIN [numero_visitas]
...
