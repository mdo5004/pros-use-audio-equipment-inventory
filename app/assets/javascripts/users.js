function Item(id, name){
    this.id = id;
    this.name = name;
}

$(function(){
    $('.details-link').on('click', function(event){
        event.preventDefault();
        let id = this["dataset"]["id"]
        let $node = $("#panel-span-" + id)
        var text = this.text 
        
        if (text === "Show Details") {
            this.text = "Hide Details";

            $.getJSON('/rigs/' + id, function(data){
                let items = data["items"]
                let item_array = []
                items.forEach(function(item){
                    var i = new Item(item["id"],item["name"])
                    item_array.push(i)
                })
                var source   = $("#list-template").html();
                var template = Handlebars.compile(source);
                //            debugger

                $node.html(template({item: item_array}))    
            })
        } else {
            this.text = "Show Details";
            $node.html('')    
        }
    })
})