## Gerenciamento de Pacotes 

### Introdução ao Gerencimanento de Pacotes do Ligero Smart

Como já mencionado anteriormente, o Ligero Smart permite a instalação de pocotes adicionais que expedem as funcionalidades dos mesmos. Destes pacotes, destacamos:

1. ITMS
2. FAQ
3. Time Accounting
4. Ligero Master Slave
5. Survey
6. System Monitoring
7. Iphone Handler
8. Complemento Queue and Services 
9. Complemento SmsEvent
10. Complemento Dashboards
11. Complemento Custom SLA Attibutes 
12. Complemento Dynamic View 
13. Complemento Pausa SLA 
14. Complemento Tollbar Search CI
15. ZnunyLigero Sort by Last Contact

Os pacotes podem ser instalados através da interface em *Administração -> Gerenciador de Pacotes*.

img

Basta selecionar o pacote que deseja instalar a partir de seu PC e clicar em "Ïnstalar Pacotes", ou selecionando um a partir da lista fornecida pelo repositório ocficial e clicando em "instalar".

img

__Repositório Oficial__

img

Também é possível realizar a instalação a partir da linha de comando do servidor, principalmente e situações em que falta memória para instalar o pacote pela web. Para isto, execute o comando abaixo no terminal no servidor, dentro do diretório /opt/ligero/bin:

img

### Ajuste Necessário no MySql

Ao instalar o Ligero e acessar o Gerenciador de Pacotes, é comum vermos a mensagem abaixo:

img

*"Por favor, certifique-se de que seu banco de dados aceita pacotes com mais de 20 MB de tamanho (tamanho máximo suportado é 16 MB). Altere o parâmetro max_allowed_packet do seu banco de dados para evitar erros".*

Esta alteração é necessária para permitir a instalação de alguns pacotes como por exemplo o Ligero ITMS.

Para resolver isto, edite o arquivo /etc/mysql/my.cnf do seu servidor, ou /etc/my.cnf: 
sudo vi /ect/mysql/my.cnf
Altere a linha abaixo:
max_allowed_packet  = 16M
Para
max_allowe_packet   = 20M
E reinicia o serviço do mysql:
sudo /etc/init.d/mysqld restart

### Pacotes Verificados 

????