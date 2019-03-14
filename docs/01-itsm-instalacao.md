## ITSM Instalação

## Licenciamento deste Manual/Documento

???

## Apresentação

O Ligero Smart é formado por um conjunto de pacotes que implantam no Ligero Smart os mecanismos necessários transformá-lo numa poderosa ferramenta de gestão de serviços de TI.
O sistema base do Ligero Smart já foi homologado pela pink Elephant para dar suporte a 6 processos descritos pelo framework ITIL.  
Os processos atendidos são os seguintes:
> * Operação de Serviço
    * Gerenciamento de Incidente 
    * Atendimento da Requisição de Serviço (Request Fulfilment)
    * Gerenciamentode Problema 
> * Transição de Serviço
    * Gerenciamento de Configuração e de Ativo de Serviço
    * Gerenciamento de Conhecimento 
    * Gerenciamneto de Mudança 

Além disto, em conjunto com outros módulos e software pode surportar mais processos, como por exemplo o Gerenciamento de Eventos (Operação de Serviço).

Tecnicamente, o Ligero Smaert ITSM e composto pelosseguintes pacotes:
 > * GeneralCatalog - Adiciona um mecanismo de cadastro de informações diversas utilizadas nos módulos ITSM. Adiciona entre outras coisas uma tela de cadastro na Administração do Sistema (Cátalogo Geral).
 * ITSMCore - Entre outras coisas, modifica as propriedades do Serviço e do SLA.
 * ITSMIncidentProblemManagement - Entre outras coisas adiciona tipos de chamado para classificação entre requisição e incidente. Cria uma tela de decisão (para pedir aprovação de chamados). Adiciona doisobjetos dinâmicos de relatório do sistema, para medir a taxa de solução no primeiro contato com o cliente, e o tempo médio de solução.
 * ITSMConfigurationManagement - Instala o módulo de Gerenciamento de Configuração e relatórios relacionados.
 * ITSMChangeManagement - Instala o módulo de Gerenciamento de Mudança.
 * ITSMServiceLevelManagement - Adiciona vários relatórios ao sistema para acompanhar o nível de serviço.
 * ImportExport - Adiciona o menu Importar/Exportar na Administração que pode ser utilizado para importar e exportar ICs ou mesmo serviços, clientes e empresas com ajuda de módulos de terceiro.

## Instalação

### *Requisitos*

Obtenha os pacotes em [link]()
  
### *Instalação Simples*

Existem duas formas de instalar o ITSM. A primeira, resume-se em instalar um único pacote que contém todos os itens disponíveis no Ligero Smart ITSM mencionados anteriormente.  
Para isto, faça download do pacote "ITSM bundle Package".  
Vantagens: É mais fácil de instalar.  
Desvantagem: instala vários pacotes que talvez nào sejam utilizados por sua equipe no primeiro momento.  
Faça a instalação através do Gerenciador de Pacotes.  
Você pode realizar através da linha de comando.  

su - ligero  
cd / opt/ ligero  
wget [link]()  

### *Instalação Avançada*

Vantagens: Instale somente o que você vai utilizar.  
Primeiro deve-se instalar o pacote __GeneralCatalog__. Em seguidao pacote __ITSMCOre__. Após a instalação destes dois pacotes, você poderá instalar os demais pacotes na sequencia que desejar.

> * ITSMIncidentProblemManagement
> * ITSMConfigurationManagement
> * ITSMChangeManagement
> * ITSMServiceLevelManagement

