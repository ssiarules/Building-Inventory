
// BRAD SMITH OF DOING IT
$(function() {
    console.log('list all products!...')
    listenForClick()
    listenForNewProductFormClick()
    //displayProductForm()
});


function listenForClick() {
    $('button#productsBuildings').on("click",function(e) {
        e.preventDefault();
        getProductList(e.target.dataset.id) // don't forget to specify  
        console.log("clicked it works!")
    })
}

const getProductList = (buildingId) => {
    return fetch(`http://localhost:3000/buildings/${ buildingId }/products.json`)
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            console.log(data);
            data.map(product => {
                const newProduct = new Product(product)
                const newProductHtml = newProduct.productHTML()
                document.getElementById('buildingProducts').innerHTML += newProductHtml

            });
        });

};

function listenForNewProductFormClick() {
    $('button#NewProductForm').on("click",function(e) {
        e.preventDefault();
        let newProductForm = Product.newProductForm()
        document.querySelector('div#new-product-form-div').innerHTML = newProductForm
        console.log("New Form Works!")

    })
}



class Product {
    constructor (obj) {
        this.id = obj.id
        this.name = obj.name
        this.category = obj.category
        this.description = obj.description
        this.building = obj.building
        this.date_added = obj.date_added
    }

    static newProductForm() {
        return (`
                <strong> New Product Form </strong>
                	<br></br> 
                <form>
                    <input id='product-name' type='text' name='name'></input><br>
                    <input id='product-category' type='select' name='category'></input><br>
                    <input id='product-description' type='text' name='description'></input><br>
                    <input type='submit' />
                </form>
 
      `)
    };

}

Product.prototype.productHTML = function() {
    return (`
            <div class = 'product' >
                <h3>${this.name }</h3>
             </div>
       `)
}

/*
function getProductList(buildingId) {
    fetch('http://localhost:3000/buildings/')
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            console.log(data);
            debugger
            data.map(product => {
                const newProduct = new Product(product)
                const newProductHtml = newProduct.productHTML()
                document.getElementById('productList').innerHTML += newProductHtml

            });
        });
};
*/



/*

    */

/*





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
*/















/* DAKOTA WAY TO DO IT
document.addEventListener('turbolinks:load',() => {
    let productsBuildingsButton = document.getElementById('productsBuildings')
    productsBuildingsButton.addEventListener('click',(e) => {
        getProducts(e.target.dataset.id)
            .then(res => res.json())
            .then(products => displayProducts(products))
            .catch(err => displayError("Product Not Found"))
    })
    let newProductForm = document.getElementById('new_product')
    newProductForm.addEventListener('submit',(e) = {
        let data = { product: {} };
        data['product']['name'] = e.target.querySelector('product-name').value
            data['product'][''] = e.target.querySelector('product-name').value
    })

})

const getProducts = (buildingId) => {
    return fetch(`http://localhost:3000/buildings/${ buildingId }/products.json`)
}

const displayProducts = (results) => {
    let html = result.map(productData => new Product(productData).render()).join('')
    document.getElementById('buildingProducts').innerHTML = html
}

const displayError = (error) => {
    document.getElementById('buildingProducts').innerHTML = error;
}

class Product {
    constructor (attributes) {
        this.id = attributes.id;
        this.name = attributes.name;
    }
    render() {
        return `
                <div> <a href="/products/${this.id }">${ this.name }</a></div>
            `
    }
}

*/

/* BRAD SMITH OF DOING IT
$(function() {
    console.log('list all products!...')
    listenForClick()
    listenForNewProductFormClick()
    //displayProductForm()
});


function listenForClick() {
    $('button#productList-data').on("click",function(e) {
        e.preventDefault();
        getProductList()
        console.log("clicked it works!")
    })
}

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

function listenForNewProductFormClick() {
    $('button#NewProductForm').on("click",function(e) {
        e.preventDefault();
        let newProductForm = Product.newProductForm()
        // newProductForm()
        document.querySelector('div#new-product-form-div').innerHTML = newProductForm
        console.log("New Form Works!")
        debugger
    })
}

class Product {
    constructor (obj) {
        this.id = obj.id
        this.name = obj.name
        this.category = obj.category
        this.description = obj.description
        this.building = obj.building
        this.date_added = obj.date_added
    }
}

static newProductForm() {
    return (`
                <strong> New Product Form </strong>
                <form>
                    <input id='product-name' type='text' name='name'></input><br>
                    <input id='product-category' type='select' name='category'></input><br>
                    <input id='product-description' type='text' name='description'></input><br>
                    <input type='submit' />
                </form>

      `)
};


Product.prototype.productHTML = function() {
    return (`
            <div class = 'product' >
                <h3>${this.name }</h3>
                <p>${this.category }</p>
                <p>${this.description }</p>
                <p>${this.building }</p>
                <p>${this.date_added }</p>
            </div>

          `)
}

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

*/



/*
//listening to the events happening to the DOM than the functions will run.
document.addEventListener('turbolinks:load',() => {
    let buildingProductsButton = document.getElementById("buildingsProducts")
    buildingProductsButton.addEventListener('click',(e) => {
        alert('clicked')
    })
})


const getProducts = (buildingId) => {
    fetch(`http://localhost:300/buildings/${ buildingId / products }`)
}

console.log("Test")

    */



/*
function displayProductForm() {
    $('button#create-product-form-button').on("click",function(e) {
        e.preventDefault();

        $.ajax({
            url: 'http://localhost:3000/products/new?layout=false',
            method: 'GET',
            dataType: 'html',
            success: function(response) {
                $('div#create-product-form').html(response)
            }
        })
    })
}
*/




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



// const product = new Product()





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




//static newProductForm() {
//return (`
// <strong>New Product Form</strong>
// <form>


//  </form>
//  `)
//}













//.then(response => response.json(data)) //arrow functions
// .then(json =>console.log(data)
//);

//};

// debugger
//});