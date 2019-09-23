


$(function listProduct () {
    console.log('list all products...')
    onClick()
    });

    
    //'button#productList-data'

    function onClick() {
        $('button#productList-data').on("click", function(e){
             e.preventDefault();
            getProductList() 
            //console.log("clicked it works!")
         })
    }
        function getProductList() {
            fetch("http://localhost:3000/products.json")
             .then(response => response.json()) //arrow functions
            .then(json =>console.log({json})
            );
            //debugger
            };
            
           
            
        //};

         //.then(function(response) {
              //  return response.json();
           // })
           // .then(function(data){
               // console.log(data);
                // debugger
            //});
        
