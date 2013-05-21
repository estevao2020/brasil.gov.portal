*** Settings ***

Resource  plone/app/robotframework/selenium.robot
Resource  plone/app/robotframework/annotate.robot
Resource  brasil/gov/portal/tests/robot/keywords.robot

Library  Remote  ${PLONE_URL}/RobotRemote

Test Setup  Abrir navegador
Test Teardown  Fechar todos os navegadores


*** Test Cases ***

Criar novo site
    Como o usuario administrador  Machado de Assis
    Ir para  ${NOVO_SITE_URL}
    Capturar tela  criarsite-passo-01.png

    Pagina deve conter  Criar um novo site
    Campo de texto  title  Portal Brasil
    Campo de texto  orgao  Presidencia da Republica
    Campo de texto  description  Portal do Governo Brasileiro
    Capturar tela  criarsite-passo-02.png
    Clicar botao  Criar site Plone

    Pagina deve conter  Portal Brasil
    Pagina deve conter  Presidencia da Republica
    Pagina deve conter elemento  portal-logo
    Listar rede social  youtube
    Listar rede social  twitter
    Pagina deve exibir Em Destaque
    Capturar tela  criarsite-passo-03.png

Conteudo base - Pasta de Imagens
    Como o usuario administrador  Machado de Assis
    Ir para  ${PLONE_URL}/imagens

    Abrir o menu de Adicionar item
    Apenas o tipo Imagem deve ser listado
    Capturar tela  criarsite-passo-04-pasta-imagens.png

Conteudo base - Pasta Assuntos
    Como o usuario administrador  Machado de Assis
    Ir para  ${PLONE_URL}/assuntos
    Capturar tela  criarsite-passo-04-pasta-assuntos.png

Conteudo base - Pasta Sobre
    Como o usuario administrador  Machado de Assis
    Ir para  ${PLONE_URL}/sobre
    Capturar tela  criarsite-passo-04-pasta-assuntos.png


*** Keywords ***

Apenas o tipo Imagem deve ser listado
    Element should contain  plone-contentmenu-factories  Image
    Page Should Not Contain Element  css=dl#plone-contentmenu-factories a.event
    Page Should Not Contain Element  css=dl#plone-contentmenu-factories a.folder
    Page Should Not Contain Element  css=dl#plone-contentmenu-factories a.collection
    Page Should Not Contain Element  css=dl#plone-contentmenu-factories a.link
    Page Should Not Contain Element  css=dl#plone-contentmenu-factories a.document