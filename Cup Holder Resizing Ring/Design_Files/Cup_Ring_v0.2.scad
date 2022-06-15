// Cup Holder Adapter
//
// Written by Neil Squire / Makers Making Change
// This work is licensed under the CC BY SA 4.0 License: http://creativecommons.org/licenses/by-sa/4.0 

//  Files available at https://makersmakingchange.com/project/cup-holder-resizing-ring/

//
// This design is used to create a 3D printed adapter to reduce the size of a hole in a cup/bottle holder to better sure the beverage container.
//
//


/*[Cup Dimensions]*/
Lower_Cup_Diameter=40; // Lower cup diameter [mm]
Upper_Cup_Diameter=40; //  Upper cup diameter [mm]

/*[Holder Dimensions]*/
Lower_Holder_Diameter=50; // Lower holder radius [mm]
Upper_Holder_Diameter=60; // Upper holder  radius [mm]
Height=50; //          Holder depth [mm]



/*[Hidden]*/

// Misc variables
fudge = 0.005;

$fa=0.5;

difference() // A - B
{
    difference() // A
    {          
        difference() 
        {           
            cylinder(Height,Lower_Holder_Diameter/2,Upper_Holder_Diameter/2);
            cylinder(Height+fudge*2,Lower_Cup_Diameter/2,Upper_Cup_Diameter/2);
        }            
        rotate([0,180,0])
        {
            rotate_extrude()
            {
                translate([Upper_Cup_Diameter/2+4,-Height+5,0])
                {  
                    difference()
                    {
                        translate([-5,-5,0])
                        square(5,5);    
                        circle(r=5);
                    }
                }
            }
        }   
    }
    rotate([0,0,0]) // B
    {
        rotate_extrude()
        {
            translate([Upper_Holder_Diameter/2-5,Height-5,0])
            {
                difference()
                {   
                    translate([0,0,0])
                    square(5,5);   
                    circle(r=5);
                }
            }
        }
    }
}

