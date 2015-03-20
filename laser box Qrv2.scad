// Frame dimension
H=300; 
L=300;
W=300;

T=4; // thinkness of material used.
stephole=0; //offset from button.

//configurations
//onlyhotcamera();
FullcoverQR();
//onlyhotcamera3d();
//FullcoverQR3d();

//stepper size
stepsz=43+T;

module panel1(){
difference(){
cube([L,H,1]);
    
hull(){
translate([+15,+15,0])cylinder(r=2.5,h=5);
translate([+15,+65,0])cylinder(r=2.5,h=5);
}
hull(){
translate([L-15,+15,0])cylinder(r=2.5,h=5);
translate([L-15,+65,0])cylinder(r=2.5,h=5);    
}
translate([+15,H-15,0])cylinder(r=2.5,h=5);
translate([L-15,H-15,0])cylinder(r=2.5,h=5);
translate([20,H-62-stephole,0])cube([T,42,1]);
translate([L-20-T,H-62-stephole,0])cube([T,42,1]);
}}

module panel2(){
difference(){    
cube([W,H,1]);
hull(){
translate([+15,+35,0])cylinder(r=2.5,h=5);
translate([+15,+85,0])cylinder(r=2.5,h=5);
}
hull(){
translate([W-15,+35,0])cylinder(r=2.5,h=5);
translate([W-15,+85,0])cylinder(r=2.5,h=5);    
}
translate([+15,H-35,0])cylinder(r=2.5,h=5);
translate([W-15,H-35,0])cylinder(r=2.5,h=5);
translate([20,H-62-stephole-42,0])cube([T,42,1]);
translate([W-20-T,H-62-stephole-42,0])cube([T,42,1]);

}

}


module panel3(frontal){
difference(){
cube([L,H,1]);
translate([+15,+15,0])cylinder(r=2.5,h=5);
translate([L-15,+15,0])cylinder(r=2.5,h=5);
translate([+15,H-15,0])cylinder(r=2.5,h=5);
translate([L-15,H-15,0])cylinder(r=2.5,h=5);
if (frontal==1) translate([40,40,0]) cube([L-80,H-80,5]);  
}}

module panel4(frontal){
difference(){    
cube([W,H,1]);
translate([+15,+35,0])cylinder(r=2.5,h=5);
translate([W-15,+35,0])cylinder(r=2.5,h=5);
translate([+15,H-35,0])cylinder(r=2.5,h=5);
translate([W-15,H-35,0])cylinder(r=2.5,h=5);
if (frontal==1) translate([40,40,0]) cube([W-80,H-80,5]);
}}  

module panelfull(){
cube([W+stepsz,H+stepsz,1]);
}

module panelfull2(){
cube([L+stepsz,H+stepsz,1]);
}

module panel3full(frontal){
difference(){
cube([L+stepsz,H+stepsz,1]);
translate([+15,+stepsz+15,0])cylinder(r=2.5,h=5);
translate([L-15,+stepsz+15,0])cylinder(r=2.5,h=5);
translate([+15,H+stepsz-15,0])cylinder(r=2.5,h=5);
translate([L-15,H+stepsz-15,0])cylinder(r=2.5,h=5);
if (frontal==1) translate([40,40+stepsz,0]) cube([L-80,H-80,5]);  
}}

module panel4full(frontal){
difference(){    
cube([W+stepsz,H+stepsz,1]);

translate([+35,+stepsz+35,0])cylinder(r=2.5,h=5);


translate([W-35,+stepsz+35,0])cylinder(r=2.5,h=5);
  
translate([+35,H+stepsz-35,0])cylinder(r=2.5,h=5);
translate([W-35,H+stepsz-35,0])cylinder(r=2.5,h=5);
if (frontal==1) translate([40,40+stepsz,0]) cube([W-80,H-80,5]);
}}  

module panelfulltb(frontal){
difference(){    
cube([W+stepsz,L+stepsz,1]);

translate([+35,+stepsz+35,0])cylinder(r=2.5,h=5);


translate([W-35,+stepsz+35,0])cylinder(r=2.5,h=5);
  
translate([+35,L+stepsz-35,0])cylinder(r=2.5,h=5);
translate([W-35,L+stepsz-35,0])cylinder(r=2.5,h=5);
if (frontal==1) translate([40,40+stepsz,0]) cube([W-80,L-80,5]);
}}

module onlyhotcamera(){
projection(cut = false)panel1(1);
projection(cut = false)translate([0,H+10,0])panel2();
projection(cut = false)translate([0,H*2+20,0])panel4(0);
projection(cut = false)translate([0,H*3+30,0])panel3(1);
}


module FullcoverQR(){
projection(cut = false)panel1(1);
projection(cut = false)translate([0,H+10,0])panel2();
projection(cut = false)translate([0,H*2+20,0])panel4full(0);
projection(cut = false)translate([0,H*3+stepsz+30,0])panel3full(1);
projection(cut = false)translate([0,H*4+stepsz*2+40,0])panelfull(0);
projection(cut = false)translate([0,H*5+stepsz*3+50,0])panelfull2(0);
projection(cut = false)translate([0,H*6+stepsz*4+60,0])panelfulltb(1);
projection(cut = false)translate([0,H*6+L+stepsz*5+70,0])panelfulltb(1);    
}
module onlyhotcamera3d(){
panel1(1);
translate([0,H+10,0])panel2();
translate([0,H*2+20,0])panel4(0);
translate([0,H*3+30,0])panel3(1);
}

module FullcoverQR3d(){
panel1(1);
translate([0,H+10,0])panel2();
translate([0,H*2+20,0])panel4full(0);
translate([0,H*3+stepsz+30,0])panel3full(1);
translate([0,H*4+stepsz*2+40,0])panelfull(0);
translate([0,H*5+stepsz*3+50,0])panelfull2(0);
translate([0,H*6+stepsz*4+60,0])panelfulltb(1); 
translate([0,H*6+L+stepsz*5+70,0])panelfulltb(1);   
}
