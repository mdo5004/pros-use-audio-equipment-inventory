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

$(".users.show").ready(function(){

    $('.details-link').on('click', function(event){
        event.preventDefault();
        showOrHideDetails(event.target);
    })

    $('.delete-link').on('click', function(event){
        event.preventDefault();
        deleteRig(event.target);
    })
})

function deleteRig(e){
    let id = e["dataset"]["id"]
    $.ajax({
        url: `/rigs/${id}`,
        method: 'DELETE',
        dataType: 'script',
        format: 'js'
    }).done(function(msg) {
        $("#panel-" + id).remove();
    }).fail(function(jqxhr, textStatus, error){
   
        alert("Request failed: " + textStatus)
    })
}

function showOrHideDetails(e){
    let id = e["dataset"]["id"]
    let $node = $("#panel-span-" + id)
    var text = e.text 

    if (text === "Show Details") {
        e.text = "Hide Details";

        $.getJSON('/rigs/' + id, function(data){
            let items = data["items"]
            let item_array = []
            items.forEach(function(item){
                var i = new Item(item["id"],item["name"])
                item_array.push(i)
            })
            var source   = $("#list-template").html();
            var template = Handlebars.compile(source);
            $node.html(template({item: item_array}))    
        })
    } else {
        e.text = "Show Details";
        $node.html('')
    }
}