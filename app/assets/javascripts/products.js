
$(function() {
    console.log('list all products!...')
    listenForClick()
    listenForNewProductFormClick()
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

