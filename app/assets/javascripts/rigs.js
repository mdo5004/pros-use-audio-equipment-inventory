var availableEquipment;

$(".rigs.new").ready(function(){
    
    getAvailableEquipment();
    
})

function getAvailableEquipment(){
    $.getJSON('/items', function(json){
        availableEquipment = json.map(function(o){
            return o.name;
        })
    }).done(function(){
        setAutocomplete();
    })
}

function setAutocomplete(){
    $( "#equipment" ).autocomplete({
      source: availableEquipment
    });
}