
$(function(){
   var mayus = new RegExp("^(?=.*[A-Z])");
   var minus = new RegExp("^(?=.*[a-z])");
   var number = new RegExp("^(?=.*[1-9])");
   var special = new RegExp ("^(?=.*[!@#~%&€*])");
   var len = new RegExp("^(?=.{8,})");
   
   var regExp = [mayus,minus,number,special,len];
   var elementos = [$("#number"),$("#mayus"),$("#minus"),$("#special"),$("#len")];
   
   $("#contra").on("keyup", function() {
      var pass = $("#contra").val(); 
      var check = 0;
      
        for (var i = 0; i < 5;  i++) {
            if(regExp[i].test(pass)){
                elementos[i].hide();
                check++;
            }else{
                elementos[i].show();
            }
        }
        if(check >= 0 && check <=2){
            $("#mensaje").text("Muy insegura").css("color","red");
        }else if(check >= 3 && check <=5){
            $("#mensaje").text("poco segura").css("color","orange");
        }else if(check >= 6 ){
            $("#mensaje").text("segura").css("color","green");
        }
   });
   
});