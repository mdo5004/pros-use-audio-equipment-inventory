$(function(){
    $('.details-link').on('click', function(event){
        let id = this["dataset"]["id"]
        $.getJSON('/rigs/' + id, function(data){
            let items = data["items"]
            
            $(this.parentElement).append()    
        })
        
    })
})