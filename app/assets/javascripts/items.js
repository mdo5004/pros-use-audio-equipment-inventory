function Item(id, name, manufacturer, classification, make, model, year, link){
    this.id = id;
    this.name = name;
    this.manufacturer = manufacturer;
    this.classification = classification;
    this.make = make;
    this.model = model;
    this.year = year;
    this.link = link;
}


$(function(){
    attachListeners();
})

function attachListeners(){
    $("#prev").on('click',function(event){
        event.preventDefault();
        var n = this["dataset"]["prev"]
        this["dataset"]["prev"] -= 1
        document.getElementById("next")["dataset"]["next"] -= 1
        displayItemData(n);
    })
    $("#next").on('click',function(event){
        event.preventDefault();
        var n = this["dataset"]["next"]
        
        this["dataset"]["next"] = parseInt(n) + 1
        document.getElementById("prev")["dataset"]["prev"] = parseInt(n) - 1
        displayItemData(n);
    })
}

function displayItemData(id){
    $.getJSON('/items/' + id, function(json){
        var source = $('#table-template').html();
        var template = Handlebars.compile(source);
        var item = new Item(json.id, json.name, json.manufacturer, json.classification, json.make, json.model, json.year, json.link)
        
        $('#item-table').html(template(item));
    })
}