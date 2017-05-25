$(".users.show").ready(function(){

    $('.details-link').on('click', function(event){
        event.preventDefault();
        toggleDetails(event.target);
    })

    $('.delete-link').on('click', function(event){
        event.preventDefault();
        deleteRig(event.target);
    })

    $('#show-all-button').on('click',function(event){
        event.preventDefault();
        showAllRigs(event.target);
    })

})

function showAllRigs(e){
    $.getJSON('/rigs', function(data){
        let $node = $("#rigs-index")
        let rig_array = concatItems(data,Rig);
        
        var source   = $("#rigs-template").html();
        var template = Handlebars.compile(source);
        debugger
        $node.html(template({rig: rig_array}))
        
    })
    $("#show-all-button").text('Hide All')
}

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

function toggleDetails(e){
    let id = e["dataset"]["id"]
    let $node = $("#panel-span-" + id)
    var text = e.text 

    if (text === "Show Details") {
        e.text = "Hide Details";

        $.getJSON('/rigs/' + id, function(data){

            var source   = $("#list-template").html();
            var template = Handlebars.compile(source);
            let item_array = concatItems(data["items"],Item);
            $node.html(template({item: item_array}))    
        })
    } else {
        e.text = "Show Details";
        $node.html('')
    }
}

function concatItems(items,model){
    var item_array = []

    items.forEach(function(item){
        var i = new model(item)
        console.log(i)
        item_array.push(i)
    })
    return item_array
}