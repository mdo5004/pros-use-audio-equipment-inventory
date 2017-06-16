function User(user){
    this.id = user.id
    this.firstName = user.first_name
    this.lastName = user.last_name
}
User.prototype.name = function(){
    return (this.firstName + this.lastName)
}

$(".users.show").ready(attachClickHandlers)

function attachClickHandlers(){

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

}
$(function() {
    $('#new-rig-form').on('submit',function(event){
        event.preventDefault();
        var userId = this.dataset.userid;
        var values = $(this).serialize();
        createUserRig(values)
    })
})

function createUserRig(values) {
    $.post('/userrig', values)
        .then(showNewUserRig)
        .then(attachClickHandlers)
        .catch(console.log)
}

function showNewUserRig(data) {
    $("#RigName").val("")
    $("#RigVenue").val("")
    $("#RigUse").val("")

    let rig = new Rig(data);
    var source = $("#user-rig-template").html();
    var template = Handlebars.compile(source);
    $("#user-rigs-panels").append(template(rig));
}

function showAllRigs(e){
    $.getJSON('/rigs', function(data){
        var $node = $("#rigs-index")
        var rig_array = concatItems(data,Rig);

        var source   = $("#rigs-template").html();
        var template = Handlebars.compile(source);

        $node.html(template({rig: rig_array}))

    })
    $("#show-all-button").text('Hide All')
}

function deleteRig(e){
    var id = e["dataset"]["id"]
    $.ajax({
        url: '/rigs/'+ id,
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
    var id = e["dataset"]["id"]
    var $node = $("#panel-span-" + id)
    var text = e.text 

    if (text === "Show Details") {
        e.text = "Hide Details";

        $.getJSON('/rigs/' + id, function(data){

            var source   = $("#list-template").html();
            var template = Handlebars.compile(source);
            var item_array = concatItems(data["items"],Item);
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