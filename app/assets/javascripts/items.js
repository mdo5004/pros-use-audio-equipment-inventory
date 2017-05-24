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

var n;
var max;

$(function(){
    attachListeners();
    n = parseInt($("#next").data("next")) - 1;
    max = $("#next").data("max");    
    updateButtons();
})

function attachListeners(){
    $(".nav-button").on('click',function(event){
        event.preventDefault();
        increment(event);
        updateButtons();
        displayItemData(n);
    })
}

function increment(event){

    var dir = event.target.id;
    console.log(dir)
    if (dir === "next"){
        n = $("#next").data("next")
    } else if (dir === "prev") {
        n = $("#prev").data("prev")
    }
    console.log("n = " + n)   
}

function updateButtons(){
    
    if (n === 1){
        $("#prev").hide();
        $("#next").data("next", parseInt(n) + 1);
    } else if (n === max) {
        $("#prev").data("prev", parseInt(n) - 1);
        $("#next").hide();
    } else {
        $("#prev").show();
        $("#next").show();
        $("#next").data("next", parseInt(n) + 1);
        $("#prev").data("prev", parseInt(n) - 1);
    }
}

function displayItemData(id){
    $.getJSON('/items/' + id, function(json){
        var source = $('#table-template').html();
        var template = Handlebars.compile(source);
        var item = new Item(json.id, json.name, json.manufacturer, json.classification, json.make, json.model, json.year, json.link)

        $('#item-table').html(template(item));
    })
}