//what to build
build = "both"; // "lid", "body" or "both"

//parametric adjustments
740ZZ_adjustment_r=0.12; // (was 0.22 previously)//added to 7mm bearing radius to ensure bearing can fit in the hole but is held securely with no XY slop
M2_5_r=2.3/2; //screw directly into the plastic, adjust based on how slicer deals with small holes (Ideamaker = 2.6/2 S3D = 2.4/2 , superslicer 2.3
M3_r=2.9/2; //screw directly into the plastic, adjust based on how slicer deals with small holes
peg_adjustment_r=0.3;// clearance between the peg and the peg hole, adjust depending on how the slicer deals with small holes. (ideamaker = 0.3, S3D= 0.4)
lid_t_adjust=0.8; //adjust to get a good agc (<100) without the magnet scraping too hard on the sensor. needs to bein multiples of the layerheigh but can adjust first layer  add 0.1
body_t_adj=0.1; //amount to add to the body height to make it print in nice layers (does not impact the magnet offset as added to the bottom of the body)
body_bearing_adj=-0.4; //amount to push the body bearing down into the body so that the magnet assembly is clamped in Z with no play in Z. Note for this should be a multiple of the layer height used. 0.2 = default
mounting=0; //If mounting is set to 1 then the M3 holes in the body will be clearance holes to allow M3 bolts to pass through the whole assembly so it can be mounted on a plate or similar. If Mounting is set to 0 the M3 holes in the body will be undersized for an M3 screw to tap into.
idler_w_adjust=-0.05; //some slicers make the idler channel t0o wide and the idler slops around.
filament_path_adjust=0.35;// how much to push the filament path up against the hobbed part
print_seam_radius=0.4; //amount to add on vertical cylinders as a small cut out to hide the print seam in.


//component dimensions
shape_rr_r=4;
740ZZ_or=7/2+740ZZ_adjustment_r;
740ZZ_t=2.5;
740ZZ_f_t=0.8; //0.6 specified. 0.8 with interference from printed part surface.
MFM_assy_or=8/2;
MFM_assy_clearance_or=MFM_assy_or+0.5;
MFM_assy_l=12.2;
MFM_assy_bearing_l=2.3;
MFM_assy_knurl_l=4.0+0.2+0.2;// was 3.8+0.2+0.2 in prototypes 
idler_w = 8.8+idler_w_adjust;
idler_h = 6.9;
idler_rect_l = 10.75;
idler_cyl_off=-9.5+filament_path_adjust;
idler_rr_r=3.5/2;
collet_bore_r= 7.2/2;
collet_neck_t=2;
collet_bore_l= 6.7-collet_neck_t;
collet_r=5.25/2;
PTFE_or=4.5/2; //needs to be oversized to be printable
PTFE_inset_l=0.6; //shortend to 0.6 as gaps occured on PS
peg_r=2.6/2-peg_adjustment_r/2; //half the adjustment to shrink the peg
peg_t=1;
M2_5_clearance_r=3.2/2;
M3_cords=[[-8,-20],[8,-20]];
M3_clearance_r=3.3/2;
peg_cords=[[-8,-9],[8,-9]];
peg_clearance_r=peg_r+peg_adjustment_r/2; //half the adjustment to grow the hole.
PCB_enc_wall_t=0.8;
PCB_t=1.5;
PCB_w=22;
PCB_l=28;
PCB_comp_h=2.7;
PCB_soff_r=5.5/2;
PCB_standoff_fillet_r=(3.4+PCB_enc_wall_t)/2;
PCB_offset_x=0;
PCB_offset_y=-PCB_l/2+5;
PCB_mount=[[-8,2],[0,-20],[8,2]];
PCB_mount_clearance=0.25;
slot_r=2/2;
slot_off=[[-11,-7.75,1.7],[0,5,1.7]];
cut_adjst=0.1;
lid_t=3.8+lid_t_adjust;
body_t=740ZZ_t+MFM_assy_knurl_l+740ZZ_f_t+body_t_adj;
filament_inlet_r=3/2;
filament_clearance_r=2/2;
filament_r=1.75/2; //other adjustments required to the model other than just changing this to make it work with 2.85mm filament
filament_cut_w=2.4;
filament_path=[0,-MFM_assy_or-filament_r+filament_path_adjust,740ZZ_t+filament_clearance_r+740ZZ_f_t+body_t_adj];
//echo (abs(body_bearing_adj));
$fn=36;
v3_mark_r=0.8;
v3_mark_off=[11.8,-8,v3_mark_r+0.2];

//select part to generate
if (build == "lid")
    lid();
else if (build == "body")
    body();
else if (build == "both"){
    lid();
    translate([0,15,0])
        rotate([0,0,180])
            body();
}


module body(){
    difference(){
        union(){
            translate([PCB_offset_x,PCB_offset_y,0])
                roundedRect([PCB_w+PCB_enc_wall_t*2,PCB_l+PCB_enc_wall_t*2,body_t],shape_rr_r,$fn=36);
            for(i=[0,1])
                translate([peg_cords[i][0],peg_cords[i][1],body_t+peg_t/2])
                    hull(){
                        translate([0,0,-0.2])
                            cylinder(h=peg_t-0.2,r=peg_r,center=true, $fn=36);
                        cylinder(h=peg_t,r=peg_r-0.3,center=true, $fn=36);
                    }
        }
        //holes
        for(i=[0,2])
            translate([PCB_mount[i][0],PCB_mount[i][1],body_t/2]){
                cylinder(h=body_t+1,r=M2_5_r,center=true, $fn=36);
            }
        for(i=[0,1]){
            translate([M3_cords[i][0],M3_cords[i][1],body_t/2])
                if (mounting)
                    cylinder(h=body_t+1,r=M3_clearance_r,center=true, $fn=36);
                else
                    cylinder(h=body_t+1,r=M3_r,center=true, $fn=36);
            }
       translate([0,0,(body_t+740ZZ_t+cut_adjst)/2+body_t_adj+body_bearing_adj/2])
            cylinder(h=body_t-740ZZ_t+cut_adjst+abs(body_bearing_adj),r=MFM_assy_clearance_or,center=true, $fn=36);   
        translate([0,0,(body_t-cut_adjst)/2])
         seamCylinder(height=body_t+cut_adjst,radius=740ZZ_or,seamr=print_seam_radius,c=true, faces=36);   
        //idler
        translate([0,idler_cyl_off,body_t-idler_h/2+cut_adjst/2])
            cylinder(h=idler_h+cut_adjst,r=idler_w/2,center=true, $fn=36);
        translate([0,idler_cyl_off-(idler_rect_l-idler_rr_r)/2,body_t-idler_h])
            roundedRect([idler_w,idler_rect_l+idler_rr_r,idler_h+cut_adjst],idler_rr_r,$fn=24);
        translate([0,filament_path[1],(body_t+740ZZ_t+cut_adjst)/2+body_bearing_adj/2])
            cube([filament_cut_w,filament_clearance_r*2,body_t-740ZZ_t+cut_adjst+abs(body_bearing_adj)],center=true);
        //filament path
        translate([filament_path[0],filament_path[1],filament_path[2]]){
            teardrop(filament_clearance_r, PCB_w+PCB_enc_wall_t*2+cut_adjst,true);
            for(i=[-1,1]){
                translate([i*((PCB_w+PCB_enc_wall_t*2-collet_neck_t)/2),0,0])
                    teardrop(collet_r, collet_neck_t+2,true);
                translate([i*((PCB_w+PCB_enc_wall_t*2-collet_bore_l)/2-collet_neck_t),0,0])
                    teardrop(collet_bore_r, collet_bore_l,true);
                translate([i*((PCB_w+PCB_enc_wall_t*2-PTFE_inset_l)/2-collet_bore_l-collet_neck_t),0,0])
                    teardrop(PTFE_or, PTFE_inset_l+cut_adjst,true);                   
                
           }
        }
     //V3 markings
            for(i=[0,1,2]){
             translate([v3_mark_off[0],v3_mark_off[1]-v3_mark_r*3*i,v3_mark_off[2]])
                sphere(r=v3_mark_r);
            }           
    }
}

module lid(){
    difference(){
        union(){
            translate([PCB_offset_x,PCB_offset_y,0]){
                difference(){
                    roundedRect([PCB_w+PCB_enc_wall_t*2,PCB_l+PCB_enc_wall_t*2,PCB_t+PCB_comp_h+lid_t],shape_rr_r,$fn=36);
                    translate([0,0,lid_t])
                        roundedRect([PCB_w,PCB_l,PCB_t+PCB_comp_h+cut_adjst],shape_rr_r-PCB_enc_wall_t,$fn=36);
                }
            }
            for(i=[0,1,2])
                translate([PCB_mount[i][0],PCB_mount[i][1],lid_t+(PCB_comp_h+cut_adjst)/2-0.0001]){
                    cylinder(h=PCB_comp_h+cut_adjst,r=PCB_soff_r,center=true, $fn=36);
                    if(i==0)
                    { 
                        intersection(){
                            fillet(PCB_soff_r,PCB_comp_h+cut_adjst,PCB_soff_r+PCB_enc_wall_t,inverse=0,cen=true,rot=-90,$fn=36);
                            fillet(shape_rr_r-PCB_enc_wall_t,PCB_comp_h+cut_adjst,PCB_soff_r,inverse=0,cen=true,rot=90,$fn=36);
                        }
                        translate([-PCB_soff_r-PCB_mount_clearance,-PCB_soff_r,0])
                            fillet(PCB_standoff_fillet_r,PCB_comp_h+cut_adjst,PCB_enc_wall_t,1,true,rot=-90,$fn=36);
                        translate([PCB_soff_r,PCB_soff_r+PCB_mount_clearance,0])
                            fillet(PCB_standoff_fillet_r,PCB_comp_h+cut_adjst,PCB_enc_wall_t,1,true,rot=-90,$fn=36);
                    }
                    if(i==2)
                    { 
                        intersection(){
                            fillet(PCB_soff_r,PCB_comp_h+cut_adjst,PCB_soff_r+PCB_enc_wall_t,inverse=0,cen=true,rot=180,$fn=36);
                            fillet(shape_rr_r-PCB_enc_wall_t,PCB_comp_h+cut_adjst,PCB_soff_r,inverse=0,cen=true,rot=0,$fn=36);
                        }
                        translate([PCB_soff_r+PCB_mount_clearance,-PCB_soff_r,0])
                            fillet(PCB_standoff_fillet_r,PCB_comp_h+cut_adjst,PCB_enc_wall_t,1,true,rot=180,$fn=36);
                        translate([-PCB_soff_r,PCB_soff_r+PCB_mount_clearance,0])
                            fillet(PCB_standoff_fillet_r,PCB_comp_h+cut_adjst,PCB_enc_wall_t,1,true,rot=180,$fn=36);
                    }
                    if(i==1)
                    {
                        translate([PCB_soff_r,-PCB_soff_r-PCB_mount_clearance,0])
                            fillet(PCB_standoff_fillet_r,PCB_comp_h+cut_adjst,PCB_enc_wall_t,1,true,rot=0,$fn=36);
                        translate([-PCB_soff_r,-PCB_soff_r-PCB_mount_clearance,0])
                            fillet(PCB_standoff_fillet_r,PCB_comp_h+cut_adjst,PCB_enc_wall_t,1,true,rot=90,$fn=36);
                        translate([0,-(PCB_soff_r+1)/2,0])
                            cube([PCB_soff_r*2,PCB_soff_r+1,PCB_comp_h+cut_adjst],center=true);
                    }
            }
        }
        //holes
            for(i=[0,1,2])
                translate([PCB_mount[i][0],PCB_mount[i][1],(PCB_t+PCB_comp_h+lid_t)/2]){
                    
                    if(i==1){
                        cylinder(h=PCB_t+PCB_comp_h+lid_t+1,r=M2_5_r,center=true, $fn=36);
                    }
                    else{
                        cylinder(h=PCB_t+PCB_comp_h+lid_t+1,r=M2_5_clearance_r,center=true, $fn=36);
                    }
                }
            for(i=[0,1]){
                translate([peg_cords[i][0],peg_cords[i][1],(PCB_t+PCB_comp_h+lid_t)/2])
                    cylinder(h=PCB_t+PCB_comp_h+lid_t+1,r=peg_clearance_r,center=true, $fn=36);
                translate([M3_cords[i][0],M3_cords[i][1],(PCB_t+PCB_comp_h+lid_t)/2])
                    cylinder(h=PCB_t+PCB_comp_h+lid_t+1,r=M3_clearance_r,center=true, $fn=36);
                }
         seamCylinder(height=PCB_t+PCB_comp_h+lid_t+1,radius=740ZZ_or,seamr=print_seam_radius,c=true, faces=36);   
        
        //slots
            for(i=[0,1])
                translate([slot_off[i][0],slot_off[i][1],slot_off[i][2]+lid_t]){
                if(i==0){
                    translate([-0.5,0,0]) rotate([0,90,0])
                        cylinder(h=PCB_enc_wall_t+1,r=slot_r,center=true);
                    translate([-0.5,0,lid_t/2])
                        cube([PCB_enc_wall_t+1,slot_r*2,lid_t],center=true);
                }
                if(i==1){
                    translate([0,0.5,0]) rotate([90,0,0])
                        cylinder(h=PCB_enc_wall_t+1,r=slot_r,center=true);
                    translate([0,0.5,lid_t/2])
                        cube([slot_r*2,PCB_enc_wall_t+1,lid_t],center=true);
                }
            }
     //V3 markings
            markings();      
    }
}

module markings(){
    for(i=[0,1,2]){
     translate([v3_mark_off[0],v3_mark_off[1]-v3_mark_r*3*i,v3_mark_off[2]])
        sphere(r=v3_mark_r);
    }
}

module seamCylinder(height=1,radius=1,seamr=0.5,c=true,faces=12){
    hull()
    {
        cylinder(h=height,r=radius,center=c, $fn=faces);
        translate([0,-radius,0])
            cylinder(h=height,r=seamr,center=c, $fn=12);
    }
    
}

//from https://www.thingiverse.com/thing:9347
//modified to make rectangles of the correct dimensions
module roundedRect(size, radius)
{
	x = size[0]-radius;
	y = size[1]-radius;
	z = size[2];

	linear_extrude(height=z)
	hull()
	{
		// place 4 circles in the corners, with the given radius
		translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
		circle(r=radius);
		translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
		circle(r=radius);
		translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
		circle(r=radius);
		translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
		circle(r=radius);
	}
}

module fillet(radius,length,thickness,inverse=0,cen=true,rot=0)
{
    rotate([0,0,rot]){
        if(inverse){
            difference(){
                translate([-thickness,-thickness,-length/2])
                    cube([radius+thickness,radius+thickness,length]);
                translate([radius,radius,0])
                    cylinder(r=radius,h=length+1,center=true);
                    
            }
        }
        else{
            hull(){
                translate([-thickness,-thickness,-length/2])
                    cube([radius+thickness,0.001,length]);
                translate([-thickness,-thickness,-length/2])
                    cube([0.001,radius+thickness,length]);
                intersection(){
                    translate([0,0,0])
                        cylinder(r=radius,h=length+1,center=true);
                    translate([-thickness,-thickness,-length/2])
                        cube([radius+thickness,radius+thickness,length]);
                }
            }
        }
    }
}

// Adapted from : https://github.com/openscad/MCAD/blob/master/teardrop.scad
// angle option removed, instead rotate the teardrop object.
module teardrop(radius, length, flat=false) {
    if (flat)
        intersection() {
		rotate([0, 90, 0]) {
			cube(size=[radius * 2, radius * 2, length], center=true);
		}
		teardrop(radius, length, false);
	}
    else
	rotate([0, 90, 0]) union() {
		linear_extrude(height = length, center = true, convexity = radius, twist = 0)
			circle(r = radius, $fn = 30);
		linear_extrude(height = length, center = true, convexity = radius, twist = 0)
			projection(cut = false) rotate([0, -90, 0]) translate([0, 0, radius * sin(45) * 1.5]) cylinder(h = radius * sin(45), r1 = radius * sin(45), r2 = 0, center = true, $fn = 30);
	}
}