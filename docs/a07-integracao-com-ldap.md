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
  a partir do Active Directory de sua organização.  
- Importante: os usuários devem possuir o campo "email" preenchido no AD para poderem se autenticar.

    $Self->{AuthModule} = 'Kernel::System::Auth::LDAP;
    # Abaixo, colocamos o IP ou hostname do servidor
    $Self->{'AuthModle::LDAP::Host1'} = '192.168.30.50';
    # A seguir, o DistinguishedName (DN) onde buscaremos os usuários
    $Self->{'AuthModule::LDAP::BaseDN1'} = 'DC=complemento, DC=net, DC=br';
    # A seguir, a propriedade do AD onde encontraremos o nome de usuário
    $Self->{'AuthoModule::LDAP::UID1'} = 'sAMAccountName';
    # Aqui definimos em qual grupo o usuário deve estar para poder se logar no Ligero Smart, 
    # Este parâmetro é opcional e pode ser comentado com #
    $Self->{'AuthModule::LDAP::GroupDN1'} = 'CN=Atendentes, OU=ligero Groups, DC=complemento, DC=net, DC=br';
    # O parametro abaixo não deve ser modificado
    $Self->{'AuthModule::LDAP::AccessAttr1'} = 'member';
    # Aqui definimos o usuário e senha de uma conta que tenha permissão de buscar informações na árvore de nosso AD.
    # É aconselhavel criar um usuário exclusivo para o Ligero Smart  
    $Self->{'AuthModule::LDAP::SearchUserDN1'} = 'CN=ligero, CN=Users, DC=complemento, DC=net, DC=br';
    $Self->{'AuthModule::LDAP::SearchUserPw1'} = 'Brasil123!';
    # Note que há o número "1" no fim das definições realizadas entre "{ }"
    # O Ligero Smart permite que você se conecte com até 9 módulos diferentes de autenticação, ou 9 Ads diferentes por exemplo.

## Sincronização de Atendentes com AD

    # Aqui podemos mapear os atendentes e seus atributos, tais como nome e sobrenome, e-mail etc.  
    # Os valores abaixo servem para uma instalação padrão. Adapte para seu sistema.  
    $Self->{AuthSyncModule} = 'Kernel::System::Auth::Sync::LDAP'; 
    $Self->{AuthSyncModule::LDAP::UserAttr'} = 'DN';
    $Self->{'AuthModule::LDAP::UserAttr'} = 'DN';  
    $Self->{'AuthSyncModule::LDAP::Host'} = '192.168.30.50';  
    $Self->{'AuthSyncModule::BaseDN'} = 'DC=complemento, DC=net, DC=br';  
    $Self->{'AuthSyncModule::LDAP::UID'}= 'sAMAccountName';  
    $Self->{'AuthSyncModule::LDAP::SearchUserDN'} = 'CN=ligero, CN=Users, DC=complemento, DC=net, DC=br';  
    $Self->{'AuthSyncModule::LDAP::UserPw'} = 'Barsil123!';
    $Self->{'AuthSyncModule::LDAP::UserSyncMap'} = {
        # DB -> LDAP
        UserFirstname => 'givenName',
        UserLastname => 'sn',
        UserEmail => 'mail'
        UserCargo => 'description,
        UserPhoneNumber => 'telephoneNumber'
    };
        $Self->{'AuthsyncModule::LDAP::AccessAttr'} = 'member';  
    # Você pode escolher grupos padrões para seus usuários. Basta descomentar as 3 linhas abaixo e definir os grupos`  
      #   $Self ->{'AuthSyncModule::LDAP::UserSyncInitialGroups'} = [  
      #         'users',  
      #   ];

## Relacionando grupos do AD com papéis do Ligero Smart

Gestão de papéis do sistema  
Aqui você deve fazer as associações entre os grupos do Active Diretory e dos papéis no Ligero Smart.  
Você deve adicionar linhas aqui sempre que criar um novo papel no Ligero Smart ou grupo no Active Directory

       $Self->{'AuthSyncModule::LDAP::UserSyncRolesDefinition'} = {

        # primeiro grupo mapeado 
        # Grupo Active Directory - Administradores do Ligero Smart no AD
        CN=Administradores Ligero Smart, OU=Ligero Groups, DC=complemento, DC=net, DC=br'  => {
            # Papel no Ligero Smart - Administradores
            'Administrador'  => 1,
        },
    
        # Segundo Mapeamento 
        'CN=Service Dsk, oU=Ligero Groups, DC=complemento, DC=net, DC=br'  => {
            # Papel no Ligero Smart
            'Atendente de Primeiro Nível' = 1,
        },

        # Terceiro Mapeamento
        'CN=Desenvolvedores, OU=Ligero Groups, DC=complemento, DC=net, DC=br'  => {
            'Desenvolvedor' => 1,
    # Você pode definir mais que um papél para o mesmo grupo do AD
    #           'Papel 2'  => 1,
        },

    };
    
    
    
    

## Usuários do AD como clientes do Ligero Smart

Exibe os colaboradores do AD como clientes internos  
Lembre-se que os usuários no AD devem ter o campo mail preenchidos corretamente

    $Self->{CustomerUser1} = {
        Name => 'Active Directory Complemento'
        Module => 'Kernel::System::CustomerUser::LDAP',
        Params => {
            Host => '192.168.30.50',
            BaseDN => 'DC=complemento, DC=net, DC=br',
            UserPw => 'Barsil123!'
            # A linha abaixo serve para não trazer usuários desativados:
            # Fonte: http://www.petri.co.il/ldap_search_samples_for_windows_2003_and_exchange.htm
            AlwaysFilter =>
    '(&(objectclass=user) (!(objectclass=computer))(!(UserAccountControl:1.2.840.113556.1.4.803:=20)))',
        SourceCharset => 'utf -8',
        DestCharset   => 'utf -8',
        Params  => {
            port => 389,
            timeout => 120,
            async => 0,
            version =>3,
        },   
    },
    CustomerKey => 'sAMAccountName',
    CustomerID => 'mail',
    CustomerUserListFields => ['cn', 'mail'],
    CustomerUserSearchFields => ['sAMAccountName', 'cn', 'mail', 'mail', 'givenname', 'sn'],
    CustomerUserSearchPrefix => '*',
    CustomerUserSearchSuffix => '*',
    CustomerUserSearchListLimit => 500,
    CustomerUserPostMasterSearchFields => ['mail'],
    CustomerUserNameFields => ['givenname', 'sn'],
    CustomerUserEmailUniqCheck => 0,
    AdminSetPreferences => 0,
    AdminSetPReferences => 0,
    ReadOnly => 1,
    CacheTTL => 180,
    Map => [
        # note: Login, Email and CustomerID are mandatory!
        # var, frontend, storage, shown (1=always,2=lite), required, storage-type, http-link, readonly  
            [ 'UserTitle',       'Title',       'title',            1, 0, 'var', '', 0 ],  
            [ 'UserFirstname',   'Firstname',   'givenname',        1, 1, 'var', '', 0 ],
            [ 'UserLastname',    'Lastname',    'sn',               1, 1, 'var', '', 0 ],
            [ 'UserLogin',       'Username',    'sAMAccountName',              1, 1, 'var, '', 0 ],
            [ 'UserEmail',       'Email',       'email',            1, 1, 'var', '', 0 ],
            [ 'UserCustomerID',  'CustomerID'   'sAMAccountName',              0, 1, 'var', '', 0 ],
            [ 'UserPhone',       'Phone'        'telephonenumber',  1, 0, 'var', '', 0 ],
            [ 'UserAddress',     'Adress',      'postaladdress',    1, 0, 'var', '', 0 ],
            [ 'UserComment',     'Comment',       'dn',      1, 0, 'var', '', 0 ],
            [ 'DN',    'DN',     'dn'   1, 0, 'var', '', 0 ,], 
        ],
    };


## Autenticação de Cliente no Active Directory

    $Self->{'Customer::AuthModule'} = 'Kernel::System::CustomerAuth::LDAP';
    $Self->{'Customer::AuthModule::LDAP::Host1'} = '192.168.30.50';
    $Self->{'Customer::AuthModule::LDAP::BaseDN1'} = 'DC=complemento, DC=net, DC=br';
    $Self->{'Customer::AuthModule::LDAP::UID1'} = 'sAMAccountName';
    $Self->{'Customer::AuthModule::LDAP::AccessAttr1'} = 'member';
    $Self->{'Customer::AuthModule::LDAP::SearchUserDN1'} = 'CN=ligero, CN=Users, DC=complemento, DC=net, DC=br';
    $Self->{'Customer::AuthModule::LDAP::SearchPw1'} = 'Brasil123!';
    # A linha abaixo serve para não trazer usuários desativados: (!(UserAccountControl:1.2.840.113556.1.4.803:=2))
    # Fonte: http://www.petri.co.il/ldap_search_simples_for_windows_2003_and_exchange.htm
    $Self ->{'Customer::AuthModule::LDAP::AlwaysFilter1'} =
            '(&(objectclass=user)(!(objectclass=cumputer))(!(userAccountControl:1.2.840.113556.1.4.803:=2)))';

    # $Self->{'Customer::AuthModule::LDAP::Diel'} = 0;
    # A linha abaixo serve para permitir que apenas usuários de um determinado grupo acessem o sistema como clientes
    # $Self->{'Customer::Auth::LDAP::GroupDN1'} = 'CN=Clientes Ligero,OU=Ligero Groups, DC=compemento, DC=net, DC=br';
