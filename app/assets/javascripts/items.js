function Item(new_item){
    this.id = new_item.id
    this.name = new_item.name
    this.manufacturer = new_item.manufacturer
    this.classification = new_item.classification
    this.make = new_item.make
    this.model = new_item.model
    this.year = new_item.year
    this.link = new_item.link
}
var id;
var item;

$('.items.show').ready(function(){
    attachListeners();
    id = history.state
    //id = $("#edit").data("id")
})

function attachListeners(){
    $(document).on('click',".nav-button",function(event){
        event.preventDefault();
        switchItem(event);
    })
}

function switchItem(event){
    id = event.currentTarget.dataset.id;
    var action = event.currentTarget.id;
    debugger
    $.getJSON(`/items/${id}/${action}`, function(json){
        console.log(json)
        var source = $('#table-template').html();
        var template = Handlebars.compile(source);
        
        item = new Item(json)
        
        $('#item-table').html(template(item));
        history.pushState(null, null,`/items/${item.id}`)
    }).fail(function(jqxhr,status,error){
        console.log(error)
    })
}