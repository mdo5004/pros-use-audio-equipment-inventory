michael = User.create(name: "Michael", email:"michaeldavidoconnell@gmail.com", password:"password", role:2)
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
