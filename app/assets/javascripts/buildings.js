
$(function() {
    console.log('Building Form!...')
    listenForNewBuildingFormClick()
});

function listenForNewBuildingFormClick() {
    $('button#NewBuildingForm').on("click",function(e) {
        e.preventDefault();
        let newBuildingForm = Product.newBuildingForm()
        document.querySelector('div#new-building-form-div').innerHTML = newBuildingForm
        console.log("New Building Form Works!")

    })
}

class Building {
    constructor (obj) {
        this.id = obj.id
        this.name = obj.name
    }

    static newBuildingForm() {
        return (`
                <strong> New Building Form </strong>
                	<br></br> 
                <form>
                    <input id='building-name' type='text' name='name'></input><br>
                    <input type='submit' />
                </form>
 
      `)
    };

}
