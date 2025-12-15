1. Análise de Popularidade e Visitas de Produtos
ESTA CONSULTA CALCULA O NÚMERO TOTAL DE VISITAS QUE CADA PRODUTO RECEBEU NO FUNIL DE VENDAS.

WITH [numero_visitas] AS (
   SELECT
     [product_id] 
    ,[visit_page_date] AS [visita]
    FROM [SALES].[dbo].[funnel]
)
SELECT
     [brand]
    ,[model]
    ,[model_year] 
    ,[price] 
    ,COUNT([numero_visitas].[visita]) AS [total_visitas]
FROM [SALES].[dbo].[products] AS [products]
LEFT JOIN [numero_visitas] AS [numero_visitas]
   ON [products].[product_id] = [numero_visitas].[product_id]
GROUP BY 
    [brand], 
    [model],
    [model_year], 
    [price]


2. Perfil Demográfico de Clientes (Idade e Gênero)
ESTA CONSULTA CRIA O PERFIL DEMOGRÁFICO DOS CLIENTES, CALCULANDO A IDADE E ASSOCIANDO O GÊNERO POR MEIO DO PRIMEIRO NOME.

SELECT
  [cpf]
 ,DATEDIFF(year, [birth_date], GETDATE()) AS [IDADE]
 ,[income]
 ,[professional_status]
 ,[ibge_genders].[gender]
FROM [SALES].[dbo].[customers] AS [customers]
LEFT JOIN [TEMP_TABLES].[dbo].[ibge_genders] AS [ibge_genders]
   ON [customers].[first_name] = [ibge_genders].[first_name]

