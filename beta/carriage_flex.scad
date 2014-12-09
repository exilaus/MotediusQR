MBOLT=[[3,5.5],[4,7],[5,8],[6.3,12,5]];

//--------Parameters----------------------
M=3;       //M3=0 M4=1 M5=2 M6=3 
granty=1;  //type of granty 0=square10x10  1=rod
Rrod=4.2;    // radius of rod use for granty
Offset=1;  //increase if not example if set 0.5 move down hole of 0.5mm
//----------------------------------------


difference(){
hull() {
translate([23,0,0])cylinder(h = 20, r=10, $fn=36);
translate([-23,0,0])cylinder(h = 20, r=10, $fn=36);
translate([0,-42-Offset,0])cylinder(h = 20, r=7, $fn=36);
}

rotate([0,90,0])translate([-1,-21,-45])cylinder(h = 80, r=13.5, $fn=36);

//-------Wheels holes
translate([22.5,0,0])cylinder(h = 30, r=MBOLT[M][0]/2, $fn=60);         //Hole
translate([-22.5,0,0])cylinder(h = 30, r=MBOLT[M][0]/2, $fn=60);        //Hole
translate([0,-41-Offset,0])cylinder(h = 30, r=MBOLT[M][0]/2, $fn=60); //Hole

translate([23,0,10])cylinder(h = 10, r=MBOLT[M][1]/2, $fn=6);         //Hexagon
translate([-23,0,10])cylinder(h = 10, r=MBOLT[M][1]/2, $fn=6);        //Hexagon
translate([0,-41-Offset,10])cylinder(h = 10, r=MBOLT[M][1]/2, $fn=6); //Hexagon

//-------Cord regulator
translate([11.5,-11,0])cylinder(h = 30, r=MBOLT[M][0]/2, $fn=36);     //Hole
translate([11.5,-11,0])cylinder(h = 12, r=MBOLT[M][1]/2, $fn=6);      //Hexagon

translate([-11.5,-15,0])cylinder(h = 30, r=MBOLT[M][0]/2, $fn=36);    //Hole
translate([-11.5,-15,0])cylinder(h = 12, r=MBOLT[M][1]/2, $fn=6);     //Hexagon


//-------Granty type
if (granty ==0)
{
rotate([0,0,45])translate([2,2,0])cube([10,10,20]);
rotate([0,0,45])translate([3,-6,0])cube([MBOLT[M][1],5,20]);
mirror([1,0,0])rotate([0,0,45])translate([3,-6,0])cube([MBOLT[M][1],5,20]);
rotate([45,90,0])translate([-15,7.5,-15])cylinder(h = 30, r=MBOLT[M][0]/2, $fn=36);
mirror([1,0,0])rotate([45,90,0])translate([-15,7.5,-15])cylinder(h = 30, r=MBOLT[M][0]/2, $fn=36);
}

if (granty ==1)
{
translate([0,2,0])cylinder(h = 30, r=Rrod, $fn=36);
}
}
