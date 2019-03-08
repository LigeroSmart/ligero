## Integração com LDAP

## Licenciamento deste Manual/Documento

????

## Introdução

A integração que permite os usuários do AD se autenticarem no Ligero Smart ou mesmo que permite o Ligero Smart enxergar informações de clientes no AD são parametrizadas no arquivo __Config.pm__ 

Neste documento , disponibilizaremos trechos de códigos que devem ser colocados neste arquivo, de acordo com a necessidade de integração e, adaptados à realidade de sua empresa.

Para realizar tal integração. é necessário queo Ligero Smart possua uma conta de serviço criada no AD ou no LDAP.

Uma forma interessante de verificar se o servidor linux está acessando o servidor de diretórios AD, é utilizando o comando abaixo:

Idapsearch -h 192.168.1.10 -b "DC=DOMINIO,DC=LOCAL' -D "CN=otrs,CN=Users,DC=DOMINIO,DC=LOCAL" -w senha "(ojectClass=person)"

Este comando faz a listagem do seu diretório de usuários. É necessáio instalar o Idapsearch em seu servidor. No CentOS pode ser instalado com o comando:

yum install opendap-clients

## Autenticação de Atendentes 

  Autenticação de Atendentes 
- Aqui definimos a integração que permite ao Ligero Smart autenticar usuários
  a partie do Active Directory de sua organização.
- Importante: os usuários devem possuir o campo "email" preenchido no AD para poderem se autenticar.

` $Self ->{AuthModule} = 'Kernel::System::Auth::LDAP;`
-> Abaixo, colocamos o IP ou hostname do servidor
`$Self ->{'AuthModle::LDAP::Host1'} = '192.168.30.50';`
-> A seguir, o DistinguishedName (DN) onde buscaremos os usuários
`$Self ->{'AuthModule::LDAP::BaseDN1'} = 'DC=complemento, DC=net, DC=br';`
-> A seguir, a propriedade do AD onde encontraremos o nome de usuário
`$Self ->{'AuthoModule::LDAP::UID1'} = 'sAMAccountName';`
-> Aqui definimos em qual grupo o usuário deve estar para poder se logar no Ligero Smart, 
-> Este parâmetro é opcional e pode ser comentado com # 

