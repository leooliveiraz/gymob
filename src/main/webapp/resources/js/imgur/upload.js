 var feedback = function(res) {
     if (res.success === true) {
        var wahaha = res.data.link.replace("http", "https");
        var wahaha = res.data.link.replace("httpss", "https");
        document.querySelector('.status').innerHTML = 
            '<br><input type="hidden" id="link_imagem" name="link_imagem" class="img_produto_cadastro thumb-image" value=' + wahaha + '/>' 
            + '<img class="img_produto_cadastro" src=' + wahaha + '/>';

     }
 };

new Imgur({ 
    clientid: '206df682bf85642', //You can change this ClientID
    callback: feedback 
});
