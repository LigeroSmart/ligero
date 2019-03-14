## Adminitração do Ambiente - Back Up

Licenciamento deste Manual/Documento

???

### *Realizando Backups*

O Ligero Smart traz consigo um utilitário de Backup que pode ser colocado para execução no Cron do Linux.

O processo de execussão é simples:

cd /opt/ligero/complemento

./backup.pl -d /home/complemento

O retorno do backup será dessa forma:

[root@centos7 scripts]# ./backup.pl -d /home/complemento/  
Backup /home/complemento//2019-07-27_12-00/Config.tar.gz ... done

Backup /home/complemento//2019-07-27_12-00/Application.tar.gz ... done

Dump MySQL rdbms ... done

Compress SQL-file ... done

__Não utilizar a própria pasta do Ligero Smart para gerar backup.__

Uma pasta será criada no diretório /diretorio/meus_backups, com a data e horário da realização do Backup, contendo 3 arquivos:  
Config.tar.gz - Contém arquivos de configuração  
Application.tar.gz - Contém todos os arquivos do sistema, inclusive os arquivos de configuração  
DatabaseBackup.sql.gz - Contém o Banco de Dados em formato SQL, compactado.

### *Restaurando Backups*

Execute o script para restaurar o Ligero Smart:

/opt/ligero/scripts/restore.pl -p passwd_mysql -b /caminho/do/backup/do/ligero -d /opt/ligero

Executar esta linha o comando abaixo para acertar permissões

/opt/ligero/bin/ligero.SetPermissions.pl --ligero-user <usuarioligero> --web-user <usuarioapache> --ligero-group <grupoligero> --web-group <grupoapache> /opt/ligero