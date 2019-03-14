## Licenciamento deste Manual/Documento

###Atribuição - Compartilhamento pela mesma Licença (by-sa)

Esta licença permite que outros remixem, adaptem, criem obras derivadas ainda que para fins comerciais, contanto que o crédito seja atribuído ao autor eque essas obras sejam licenciadas sob os mesmos termos. Esta licença é geralmente comparada a licenças de software livre. Todas as obras derivadas devem ser licenciadas sob os mesmos termos desta. Dessa forma, as obras derivadas também poderão ser usadas para fins comerciais.

##Administração de Clientes e Usuários 

O Ligero Smart possui um módulo nativo para gerenciamentode "clientes" e de "usuários clientes". Entendendo-se por "clientes" as empresas ou departamentos dos quais os üsuários clientes" fazem parte. 
Exemplos de Clientes e Usuários Clientes:
- Quando o Ligero Smart atende clientes externos 

| Clientes    | Usuários Clientes                                                                                                                    |
|-------------|--------------------------------------------------------------------------------------------------------------------------------------|
|Complemento | Ronaldo Richieri - ronaldo@complemento.net.br Fabricio Pacheco - fabricio@complemento.net.br Lucas Schimit - lucas@compemento.net.br |
| Empresa XYZ | João da Silva - joao@xyz.com.br Maria da Silva - maria@xyz.com.br  


- Quando o Ligero Smart atende clientes internos

| Cliente  | Usuários Cliente                                                                       |
|----------|----------------------------------------------------------------------------------------|
| TI       | João da Silva - joao@minhaempresa.com.br, José Gusmão - jose@minhaempresa.com.br        |
| RH       | Maria Antonieta - maria@minhaempresa.com.br, Mario da Silva - mario@minhaempresa.com.br |

__IMPORTANTE:__ Os Usuários Clientes são associados à suas organizações através do campo __"ID do Cliente".__ Este campo é muito importante pois é através dele que muitos relatórios são obtidos e consolidados.

Observea figura abaixo:

img

__1 - Usuário Cliente:__ Menu para cadastrar os usuários do sistema Ligero Smart, seus dados tais como telefone e e-mail. Também éque colocamos seu login de acesso e senha.
__IMPORTANTE:__ É necessário cadastrar a organização do usuário cliete antes de realizar o cadastro do mesmo. Isto é feito no menu "Clientes" abaixo.

__2 - Clientes:__ Aqui cadastramos as Organizações, sejam elas Empresas ou Departamento, nde os usuários se encontram. 

### Cadastrando Clientes (organizações/departamentos/empresas)

Acesse o menu Administração -> Clientes -> Adicionar Cliente 
Preencha o formulário abaixo:

img

No campo __ID do Cliente__ devemos preencher um código para esta empresa ou departamento. Por exmeplo, para uma empresa, podemos utilizar CNPJ, ou código do cadastro da empresa em seu ERP, ou o domínio da empresa na internet (apenas exemplos). Para um departamento, podemos usar o centro de custo ou sigla do departamento.

Para gerenciar seus clientes acesse o menu Clientes -> Administração de Ususário Cliente:

img

Também podemos reparar no dropdown com o valor "Database Backend". Este corresponde aos backends integrados com suas instalação. Caso você possua integração com outros sistemas, ADs ou backends, estes também estarão listados neste dropdown.

Ao clicar no botão "Adicionar usuário cliente", você verá a seguinte tela:

img

__Dicas:__ 

> 1. Todos os campos com * e em negrito são obrigatórios. Você pode alterar a obrigatóriedade de alguns campos customizando o aqrquivo Confg.pm
2. Nesta tela, assim como o cadastro de vários outros objetos do Ligero, temos o campo "Válido". O Ligero trabalha com remoção lógica da informação e não física, desta forma, uma vez que um cliente é criado, não é possível removê-lo, apenas inválido, para manter a integridade de chamados antigos. Se você criou por engano e quer muito apagar a informção, terá que fazê-lo diretamente no banco de dados.
3. __ID do Cliente:__ este campo é muito importante.Ele pode determinar a empresa, área ou departamento do cliente. Vejamos algumas situações:
    1. Seus clientes são contatos de empresas diferentes. Recomendamos que seja reenchidos no campo ID  doCliete, o código destas empresas.
    2. Seus clientes são internos, colaboradores de sua empresa divididos em áreas. Neste caso, utilize o código de área no campo ID do Cliente.
    3. Seus clientes são pessoas físicas, sem divisões. Neste caso, é recomendável utilizar o email de seu cliente como ID do Cliente.

### *Adicionando camopos ao Cadastro de Usuário Cliente*

Primeiramente é necessário adicionar o novo campo à tabela em questão.
A tabela que armazena os dados do cliente é a *customer_user* e a que armazena as infomações da empresa é a *customer_company*. 

Por exemplo, vamos adicionar a coluna cpf ao cadastro de cliente: 

    ALTER TABLE `customer_user` ADD`cpf`VARCHAR(14)NULL

Agora, é necessário customizar o backend de usuário padrão do Ligero Smart. copie o código abaixo para área de customização do Config.pm após a linha `$Self->{Home} = '/opt/ligero';` . Se você executou o exercício anterior, não é necessário copiar novamente, apenas adicione a linha destacada em vermelho:  

    $Self->{CustomerUser} = {  
        Name => 'Database Backend',
        Module => 'Kernel::System::CustomerUser::DB',
        Params => {
            Table => 'customer_user',
            CaseSensitive => 0,
        },
        CustomerKey => 'login',
        CustomerID       => 'customer_id',
        CustomerValid    => 'valid_id',
        CustomerUserListFields => ['first_name', 'last_name', 'email'],
        CustomerUserSearchFields   => ['login', 'first_name', 'last_name', 'customer_id`],
        CustomerUserSearchPrefix   =>'*',
        CustomerUserSarchSuffix    =>'*',
        CustomerUserSarchListLimit    => 250,
        CustomerUserPostMasterSearchFields => ['email'],
        CustomerUserNameFields =>  ['title', 'first_name', 'last_name'],
        CostumerUserEmailUniqCheck     => 1,
        CustomerCompanySupport => 1,
        CacheTTL => 60 * 60 * 24,
        Map => [

            ['User',   'Title' 'title' 1,0,'var',0],
            ['UserFirstname',  'Firstname', 'first_name', 1, 1,'var',",0],
            ['UserLastname',  'Lastname', 'last_name', 1, 1,'var',",0],
            ['UserLogin', 'Username','login',   1, 1,'var',",0]
            ['UserPassword', 'Password', 'pw',   0, 0,'var',",0],
            ['UserEmail'  'Email',  'email',  1,  1'var', ",0]
            ['UserCostumerID', 'CustomerID', 'customer_id',0, 1,'var',",0]
            ['UserPhone',   'Phone',   'phone',   1,  0,'var',", 0],
            ['UserCPF',   'Cadastro de Pessoa Fisica',   'cpf',   1, 0,'var',",0],
            ['UserFax',   'Fax',   'fax',   1, 0,'var',",0],
            ['UserMobile',   'Mobile',   'mobile',   1, 0,'var',",0]
            ['UserStreet',   'Street',   'street',   1,0, 'var',",0],
            ['UserZip',   'Zip'   'zip',   1, 0,'var',",0],
            ['UserCity',   'City',   'city',   1, 0,'var',",0],
            ['UserCountry',   'Country',   'country',   1, 0,var,",0],
            ['UserComment'   'Comment',   'comments',   1, 0,'var',",0],
            ['ValidID',   'Valid',    'valid_id',   o, 1,'int',",0],
            ],
        };


 Note que temos agumas configuraçõe:  
 A primeira (var) define a tagdeste campo. Você poderá utilizar esta tag para construir uma notificação como por exemplo <LIGERO_CUSTOMER_DATA_UserCPF>.  
 A segunda (forntend), define como será exibido o label da informação na tela de cadastro e nas visões "Cadastro de Pessoa Física":  

 img

 A terceira informação (storage), é o nome do campo no banco de dados, que o sistema deverá usar para gravar e consultar novos registros.
 A quinta informação (required), que nosso exemplo está definido como "0", define se o campo é obrigatório ou não.

 Também é possível criar links a partir dos campos, como no exemplo abaixo:  
        ['UserEamail',    'Email', 'email',   1 ,1, 'var, $Env{"CGIHandle"}? Action=AgentTicketCompose;ResponseID=$Data{"TicketID"};ArticleID=$Data{ArticleID"}', 0, ",AsPopupLigero_TicketAction],

### *Integração com LDAP*

Além disto o Ligero Smart permite que seus clientes sejam listados apartir de outras fontes, entre elas banco de dados, serviços de diretório como Active Directory ou OpenLDAP.  
Por se tretar de um tópico mais avançado, fizemos um documento a parte explicando como se dá o processo de integração. Veja nosso manual "A07 - Integração com LDAP" para mais informções.  

Existe também um artigo completo no endereço abaixo:

 [http://ligero.github.io/doc/manual/admin/stable/en/html/external-backends.html#dap-customer-backend]()