## Estatísticas e Relatórios 

### Estatísticas 

O módulo de estatística do Ligero Smart possui recursos para gerar relatórios personalizados. A configuração adequada deste módulo permite um rico apaio em tomadas de decisão.

Para iniciar o uso da estatística, vamos acesar no Toolbar a opção ESTATÍSTICA, como mostra a imagem  abaixo:

img

__Visão Geral:__ Mostra os relaórios padrões do Ligero Smart e os adicionados por usuários do sistema.
__Nova:__ Permite a criação de novos relatórios. 
__Importar:__ Importar novos relatórios com o móduo do prórprio Ligero.

img

Em visão geral, temos o número da estatística, título,  objeto usado na criação do relatório.

### Gerando Relatórios

Antes de aprender a criar relatório, vamos gerar um que vem junto a instalação do Ligero Smart.
Para isto, na "Visão Geral: Estatística", clique na estattística número 10003.

img

Na tela de extração do relatório, existem os botões ao lado esquerdo, que nos permitem voltar para a Visão Geral, Executar o relatório 10003 no caso.

Temos também as configurações que foram selecionados quando criamos o relatório. Não se preocupe com todos esses campor detalhados.

### Criação de Relatórios

Para criar um novo relatório agora temos que selecionar o tipo de estatística que queremos. Temos 3 tipos disponíveis:

Estatística de Tabela Dinâmica (Dynamic Matrix Statistics)

img

Este tipo de estatística irá gerar uma tabela de valores calculados (Ex.: Novos Tickets por dia do mês e filas). Todos os valores das céduas na tabela possuem o mesmo tipo (número, tempo médio, etc.). Os valores sào calculados de entidades no sistema (Ex.:Tickets). Algumas estatísticas suportam a soma das colunas e/ou linhas (somente alguns tipos de dados).

Estatística de Lista Dinâmica (Dynamic List Statistics)

img

Este tipo de estatística irá gerar uma tabela onde cada linha (e não cédula) rpresenta uma entidade no sistema (Ex.: Um ticket). As colunas nesta linha são geralmente configuráveis (eixo-x) e contêm os dados deste objeto (Ex.: atributos do ticket). Todas as cédulas de valor em uma coluna tem o mesmo tipo.

Estatísticas Estáticas (Static Statistics)

img

Este tipo de estatística não é muito configurável e geralmente usado pra cálculos complexos.

A tela seguinte chama-se "Editar: Estatística N.", onde você pode editar ou criar um relatório. Daremos inicio explicando os três primeiros campos desta tela.

img

__Título:__ Definição de um nome para este relatório.

__Descrição:__ Um complemento para auxiliar o atendimento no relatório. Pode conter informções do que o relatório retorna e para qual finalidade foi elaborado.

__Dynamic-Object:__ Quando uma isntalação do Ligero Smart é feita, por padrão vem quatro tipos de relatórios, vams explicar cada um deles:

1. Acumulação de chamados: Este tipo de relatório retorna uma sumarização dos chamados de acordo com osfiltros escolhidos. Por exemplo, se filtramos para ver todosos chamados fechados do mês de julho, ele nos retornará os chamados fechados no dia 1, 2, 3, 4 até o dia 31, quantos pordia foram fechados. Podemos também extrair este mesmo relatório no período de 1 ano e escolher para nos trazaer com a escala mensal, então ele retornaria todos os chamados fechados de janeiro, fevereiro, Março até Dezembro.
2. Lista de Chamados: Retorna uma listagem de chamados com os filtros configurados, ou seja, posso configurar para listar todos os chamados resolvidos por um atendente ou todos os chamados abertos na ultima semana, contendo informações como SLA, Serviço, Atendido dentro do SLA ou fora, data de criação, data de fechamento entre campos.
3. Tempo de Contabilizadodo Chamado: Este relatório traz a quantidade de tempo que foram preenchidas no chamado. Esta informação é retirada do campo Unidade de Tempo (em minutos) na tela de resposta ou da Nota. Podemos fazer um filtro com horas contabilizadas de cada atendente, filtrar por cliente e serviço ou outra configuração mais adequada para seu tipo de negócio.
4. Ticket Solution Response Time: Este relatório tem a função de nos trazer informações como tempo médio de atendimento, tempo mínimo e máximo de atendimento de cada serviço por atendente ou uma relação de fila x serviço/atendente. entraremos em mais detalhes na elaboração destes relatórios.

Os campos definem permissões e como esse relatório sera exibido:

Permissões: Define quem terá direito no relatório. Quem poderá extrair ou editar o mesmo, contando com as configurações de permissões dos grupos.

img

Formato do Resultado: Nesse campo definimos como e com qual formato o relatório vai ser extraido. Existem algumas opções de gráficos e mais CSV e "Imprimir" que é extraido em PDF.

Tamanho do Gráfico: Define o tamanho para os gráfico extráidos. Tabalha em conjunto com o Formato do Resultado.

Somar Linhas: No final do relatório, pode'-se somar linhas.

Somar Colunas: 