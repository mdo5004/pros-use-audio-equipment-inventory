guest = User.create(first_name: "Guest", last_name: "User", email:"guest@user.com", password:"password", role:0)
michael = User.create(first_name: "Michael", last_name: "O'Connell", email:"michaeldavidoconnell@gmail.com", password:"password", role:2)
home_rig = michael.rigs.create(name:"Home rig",venue:"Home",use:"Recording" )
church_rig = michael.rigs.create(name:"Church rig",venue:"Church of the Good Shepherd, Durham NC",use:"Production")

home_rig.items.create(name:"Yeti Microphone",
                    classification:"Microphone",
                    manufacturer:"Blue Microphones",
                    make:"Yeti",year:2017)
home_rig.items.create(name:"27\" iMac",
                    classification:"Computer",
                    manufacturer:"Apple Inc.",
                    make:"iMac",year:2011)
home_rig.items.create(name:"Yamaha BBN5",
                    classification:"Bass Guitar",
                    manufacturer:"Yamaha",
                    make:"BBN5",year:2004)
church_rig.items.create(name:"MXL 770 Cardioid Condenser Microphone",
                    classification:"Microphone",
                    manufacturer:"MXL",
                    make:"770",year:2015)
church_rig.items.create(name:"Mac mini",
                    classification:"Computer",
                    manufacturer:"Apple Inc.",
                    make:"Mac mini",year:2012)
church_rig.items.create(name:"Midas M3",
                    classification:"Mixer",
                    manufacturer:"Midas",
                    make:"M3",year:2016)

ryan = User.create(first_name:"Ryan", last_name:"O'Connell", email:"ryan@ryanomusic.com", password:"password", role:0)
home_rig = ryan.rigs.create(name:"Home rig", venue:"Home", use:"Recording")
road_rig = ryan.rigs.create(name:"Road rig", venue:"Mobile", use:"Recording")
home_rig.items << Item.find_or_create_by(name:"27\" iMac")
home_rig.items.create(name:"KORG SP-280", classification:"Synthesizer", manufacturer:"KORG", make:"SP-280", year:2013)
road_rig.items << Item.find_or_create_by(name:"Yeti Microphone")
road_rig.items.create(name:"M-Audio Keystation", classification:"Controller", manufacturer:"M-Audio", make:"Keystation 49", year:2016)
road_rig.items.create(name:"15\" MacBook Pro",
                    classification:"Computer",
                    manufacturer:"Apple Inc.",
                    make:"MacBook Pro",year:2012)

skrillex = User.create(first_name:"Skrillex", last_name:"",email:"sk@rillex.com",password:"password",role:0)
home_rig = skrillex.rigs.create(name:"Studio Rig", venue:"Studio", use:"Recording")

home_rig.items.create(name:"Focusrite Saffire PRO 14", 
    classification:"Studio Equipment",
    manufacturer:"Focusrite",
    make:"Saffire PRO 14",
    year:2016)
home_rig.items.create(name:"Akai Professional MPK49 USB MIDI Keyboard", 
    classification:"Synthesizer",
    manufacturer:"Akai",
    make:"MPK49",
    year:2016)
home_rig.items.create(name:"Native Instruments Maschine", 
    classification:"Synthesizer",
    manufacturer:"Native Instruments",
    make:"Maschine",
    year:2017)
home_rig.items.create(name:"Sugar Bytes WOW 2", 
    classification:"Software",
    manufacturer:"Sugar Bytes",
    make:"WOW 2",
    year:2016)
