
$(function listProduct () {
    console.log('list all products...')
    onClick()
    });

    function onClick() {
        $("a.product_list").on("click", function(e){
             e.preventDefault();
            console.log("clicked it works!")
    })
    }

  
    

       // fetch('http://localhost:3000/products')
           // .then(function(response){
            //    return response.json();
           // })
           // .then(function(myJson){
            //    console.log(myJson);
           // })
   
