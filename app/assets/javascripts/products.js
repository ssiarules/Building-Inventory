 console.log("Test")

$(function listProduct() {
    console.log('list all products...')
    listenForClick()
   // listenForNewProductFormClick()
    displayProductForm()
   

});

function displayProductForm() {
    $('button#create-product-form-button').on("click", function(e){
        e.preventDefault();

        $.ajax({
            url: 'http://localhost:3000/products/new?layout=false',
            method: 'GET',
            dataType: 'html',
            success: function(response){
                $('div#create-product-form').html(response)
            }    
        })
    })
 } 

    


/*
function displayProductForm = () => {
    let productForm = document.getElementById('create-product-form'); 
    let form = 
        <form onsubmit="createProductList(); return false;">
        <label> Name: </label>
        <input id="name" type="text">
        <br>
        <label> Category: </label>
        <input id="category" type="select">
        <br>
        <label> Description: </label>
        <input id="description" type="text">
        <br>
        <label> Building: </label>
        <input id="building" type="text">

    productForm.innerHTML = form;
}
*/

function listenForClick() {
    $('button#productList-data').on("click", function(e) {
        e.preventDefault();
        getProductList()
        console.log("clicked it works!")
    })
}

// const product = new Product()

function getProductList() {
    fetch("http://localhost:3000/products.json")
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            console.log(data);
            data.map(product => {
                const newProduct = new Product(product)
                const newProductHtml = newProduct.productHTML()
                document.getElementById('ajax-productList').innerHTML += newProductHtml

            });
        });
};

/*
function createProductList() {
    const productList = {
           let name = $("#product_name").val()
           let category = $("#product_category").val()
           let description = $("#product_description").val()
           let building = $("#product_building_id").val()
           let date = $("#product_date_added").val()
    }
    fetch("http://localhost:3000/products/new", {
        method: 'POST',
        headers:{
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        },
        body: JSON.stringify({product})
    }).then(resp => resp.json())
        .then(product => {
            if (product.errors){
                alert("Form is Incomplete")
            }else{
                console.log(product)
                let objProduct = new Product(product)
            }})
}
*/

//function listenForNewProductFormClick(){
   // log.texContent = 'Johnson Joseph'
   // e.preventDefault();
//}
   // const form = document.getElementById('productForm');
   // form.addEventListener('submit', listenForNewProductFormClick());

/*
function listenForNewProductFormClick() {
    $('#productForm').on("submit", function(e) {
        e.preventDefault();
        debugger
        let name = $("#product_name").val()

        const form = document.getElementById('productForm');

 */
        //newProductForm()
       // console.log("clicked it works!")
       // let newProductForm = Product.newProductForm()
   //  document.querySelector('div#new-product-form').innerHTML = newProductForm

   // })
//}

function newProductForm() {
    fetch("http://localhost:3000/products/new")
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            console.log(data)
            debugger
        });
};


//static newProductForm() {
//return (`
// <strong>New Product Form</strong>
// <form>


//  </form>
//  `)
//}


class Product {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.category = obj.category
        this.description = obj.description
        this.building = obj.building
    }
        static newProductForm() {
            return (`
                <strong> New Product Form </strong>
                <form>
                
                </form>
            
            `)
        }
}





Product.prototype.productHTML = function() {
    return (`
            <div>
                <h3>${this.name}</h3>
                <p>${this.category}</p>
                <p>${this.description}</p>
            </div>

          `)
}


//.then(response => response.json(data)) //arrow functions
// .then(json =>console.log(data)
//);

//};

// debugger
//});