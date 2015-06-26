      function countChar(val) {
        var len = val.value.length;
        if (len >= 300) {
          val.value = val.value.substring(0, 500);
        } else {
          $('.feedback').text(300 - len+" characters remaining");
        }
      };

$("document").ready(function(){
                    $(".slideshow").cycle();
                });
                
                