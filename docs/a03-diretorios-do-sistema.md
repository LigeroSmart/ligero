## Diretórios do Sistema 

Licenciamento deste Manual/Documento

????

## Pastas do Sistema

Neste capitulo iremos apresentar as pastas que compõe o sistema Ligero Smart e alguns dos principais arquivos dentre os que compõe o sistema atualmente.

### *bin*

Nesta pasta encontramos utilitários  do Ligero Smart, para executar operações em segundo plano no servidorcomo tarefas agendadas, ou mesmo utilitários para auxiliar o administrador do sistema a realizar alguma tarefa, como criar centenas de filas ou serviços em Batch.

img

Abaixo, segue um exemplo de como criar um papel pelailha de comando:

img

Neste exemplo, será criado um papel como nome "nome_do_papel" e com o comentário "comentario", como podemos ver a seguir:

img

Para mais informação sobre o comando, digite:

img

Agora, veremos um exemplo de como criar uma fila, também pela linha de comando;

img

Neste exemplo, será criado uma fila com o nome "nome_da_fila" e esta fila será associada ao grupo "users", como podemos ver a seguir:

img

Para mais informações sobre o comando, digite:

img

Para listar mais comandos disponíveis, digite:

img

### *bin/cgi-bin e bin/fcgi-bin*

Nesta pasta estão os arquivos que controlam as interfaces WEB do Ligero Smart. É aqui que está o index.pl e o customer.pl por exemplo.

img

### *doc*

Esta pasta contém alguns documentos de ajuda do Ligero Smart. Alguns pacotes, ao serem instalados, colocam arquivos de ajuda nesta pasta para ser acessado pelo administrador.

img

### *Kernel*

Esta é a principal pasta do sistema. Ela contém as bibliotecas do núcleo do sistema, bem como os módulos que compõe o mesmo.

img

#### *Kernel/Config.pm*
Arquivo com as configurações mais básicas do sistema, tal como banco de dados.

#### *Kernel/Config*

Pasta dedicada a armazenar configurações do sistema. 

img

*Kernel/Config/Defaults.pm*
Contém o "esqueleto" de configurações possíveis do sistema principal. Nunca deve ser alterado.

### *Kernel/Config/Files*
Contém arquivos adicionais de configuração do sistema. Os arquivs .xml que estão dentro da pasta, definem novos parâmetros que estarão disponíveis para acesso através do menu ""Configuração de Sistema" dentro da pasta Admin. Se uma configuração é alterada através deste menu, esta alteração __não é__ registrada nos arquivos __.xml__, mas sim no arquivo __ZZZAuto.pm__, também disponvel na mesma pasta.

img

#### *Kernel/cpan-lib*

Contém bibliotecas Perl necessárias para executar funçòes do Ligero Smart.

img

### *Kernel/GenericInterface*

Arquivos e funções responsáveis por conectar o Ligero Smart à outros sistemas por WebServices.

img

### *Kernel/Language*

Arquivos de tradução do Ligero Smart.

img

Para customizar os termos do seu idioma, copie o arquivo xx_Custom.pm e o renomeie para pt_BR_Custom.pm. Em seguida, edite o arquivo criado, alterando a linha abaixo:

__de:__ package Kernel::Linguage::xx_Custom; __para:__ package  Kernel::Language::pt_BR_Custom;

Exemplo:

img

### *Kernel/Modules*

Arquivos dos módulos do Ligero Smart. Endenda-se por módulo, neste caso, todas as telas do sistema. Por exemplo, a tela que realiza a criação de chamados por e-mail possui um módulo próprio, neste caso o AgentTicketEmail.pm.

img

### *Kernel/Output/HTML*

Contém alguns módulos responsáveis por interpretar os arquivos de template do Ligero Smart.

img

### *Kernel/Output/HTML/Template/Standard*
Templates originais das telas do Ligero Smart.

img

### *Kernel/System*

Possuem os arquivos do núcleo do sistema, responsáveis por gerenciado seu funcionamento. Os módulos que estão dentro da pasta Kernel/Modules, se utilizam de funções definidas nos arquivos que estão dentro de Kernel/System para realizar suas tarefas.

img

### *Custom*

Pasta utilizada para colocar as customizações do código fonte realizadas no sistema. Por exemplo: você deseja customizar uma funcionalidade de tela de criação de chamado por telefone de interface do atendente. Você deve então criar uma cópia do arquivo por telefone da interface do atendimento. Você deve então criar uma cópia do arquivo abaixo:

Kernel/Modules/AgentTicketPhone.pm

*no caminho abaixo:*

Custom/AgentTicketPhone.pm

Em seguida,reinicie o servidor de paginas Apache uma vez que reconheça o novo arquivo.

O mesmo serve para arquivos que estão dentro da pasta System.

Um exemplo de customização pode ser encontrado no vídeo abaixo, onde explicamos como fazer automática deum SLA

????

Arquivos dentro Kernel/Output/HTML/Standard seguem regra para customização. Veja o capitulo Customização básicas da interface.

### *Scripts*

Contém:

1. Arquivo de configuração do apache, o *apache2-httpd.include.conf*
2. Executável de backup, o backup.pl
3. Arquivos de instalação do banco de dados (talvez você precise saber disto)
4. Scripts de atualização do banco de dados, de versões anteriores do Ligero Smart para a versão atual.

img

### *Var*

Esta pasta armazena diversos arquivos temporários, pórem vitais para o funcionamento do sistema.

Também nelas estão os arquivos de imagem, css e javascripts da interface web do sistema. Resumindo suas subpastas

1. __article__ - conterá os artigos e anexos dos chamados caso seja alterado o parâmetro *Ticket::StorageModule* de *ArticleStorageDB* para *ArticleStorageFS*. Os artigos serão armazenados em pastas e subpastas de acordo com o ano, mês de criação, por exemplo, var/article/2019/07/10/*  
Por padrão, os artigos dosistema são armazenados no banco de dados. Esta mudança pode ser vital em sistemas com muitos tickets, já que esta forma de armazenamento facilita o backup das informações, visto que não é necessária fazer backup de um mesmo dia ou mês várias vezes.
2. __cron__ - armazena os scripts do cron que devem ser ativados na instalação do sistema.
3. __fonts__ - fontes utilizadas no sistema
4. __httpd__ - armazena os arquivos javascripts, css e imagens, das interface web. Por padrão, estes arquivos são compactados em um único arquivo armazenando em subpastas jss-cache e css-cache, reduzindo o número de request ao servidor quando se pede uma página.
5. __log__ - contém o arquivo TicketCounter.log que registra um número utilizado para calcular o próximo número de ticket a ser criado. Definitivamente, nunca apague este arquivo!
6. __packagesetup__ - pasta temporária utilizada no momento da instalação de pacotes.
7. __Run__ - contém o arquivo scheduler.pid que registra o ID do Scheduler em execução 
8. __sessions__ - armazena informações sobre sessões, caso o parâmetro *SessionModule* seja alterado para FS.
9. __spool__ - pasta que armazena arquivos temporários diversos.
10. __stats__ - contém xml's com informações sobre os relatórios criados na interface Stats (Estatísticas) do Ligero Smart.
11. __tmp__ - arquivos temporários diversos.

img


