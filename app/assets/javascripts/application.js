// isso é um arquivo manifest que será compilado incluindo todos os arquivos listados abaixo.
//
// adicionar novo código javascript/coffee em arquivos separados nesse diretório
// para serem automaticamente incluídos no arquivo compilado acessível em http://example.com/assets/application.js
//
// não é sugerido adicionar código diretamente aqui, mas para casos como esse, eles
// irão aparecer no bottom do arquivo compilado.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function () {
    $(".one_click_select").click(function () {
        $(this).select();
    });

    $('select#branch').selectmenu({
        style: 'popup',
        width: 200
    });

    $('select#tag').selectmenu({
        style: 'popup',
        width: 200
    });
});