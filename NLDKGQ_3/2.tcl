

wipe
model basic -ndm 3 -ndf 6

# nDMaterial PlaneStressUserMaterial $matTag $nStatevs $nProps $Prop1 ... $ Propn


#concrete
#cover
#nDMaterial PlaneStressUserMaterial   1       40         7       26.2e6  2.62e6   -5.24e6 -0.002 -0.00486 0.001 0.05
#core
nDMaterial PlaneStressUserMaterial   2       40         7       30.6549e6  3.06549e6  -6.13e6 -0.00234 -0.03 0.001 0.05

# nDMaterial PlateFromPlaneStress $matTag $PlaneStressMatTag $OutOfPlaneShearModulus
#nDMaterial   PlateFromPlaneStress    3                  1                10.92e9 
nDMaterial   PlateFromPlaneStress    4                  2                12.77e9



# uniaxialMaterial Steel01 $matTag   $Fy   $E0 $b
#longitudinal steel d=8
#uniaxialMaterial   Steel01      5 582e6 289.85e9  0.0033
uniaxialMaterial Steel02 5 582e6 189.85e9 0.0033 14 0.925 0.15
#stirrup d=6
#uniaxialMaterial   Steel01      6 441e6 203.94e9  0.00127
uniaxialMaterial Steel02 6 441e6 203.94e9 0.00127 14 0.925 0.15

# nDMaterial PlateRebar $matTag $uniaxialMaterialTag $angle
#longitudinal steel d=8
nDMaterial   PlateRebar       7                    5    90
#stirrup d=6
nDMaterial   PlateRebar       8                    6    0

                                                       

#multi-layered section£ºmaterial thickness materialTag 
##cover      20              4
##stirrup d=6     0.4147 0        8
##longitudinal steel d=8     1.0053 90       7
##core  78.077          4
##longitudinal steel d=8     1.0053 90       7
##core  78.077          4
##longitudinal steel d=8     1.0053 90       7
##stirrup d=6     0.4147 0        8
##cover      20              4

# section LayeredShell $sectionTag $nLayers $matTag1 $thickness1 $matTagn $thicknessn
section   LayeredShell 1 9 4 0.02 8 0.0004147 7 0.0010053 4 0.078077 7 0.0010053 4 0.078077 7 0.0010053  8 0.0004147 4 0.02

#multi-layered section£ºmaterial thickness materialTag 
##cover      20              3
##stirrup d=6     0.4147 0        8
##longitudinal steel d=8     0.5026 90       7
##core  79.0827         4
##core  79.0827         4
##longitudinal steel d=8     0.5026 90       7
##stirrup d=6     0.4147 0        8
##cover      20              3

section   LayeredShell 2 8 4 0.02 8 0.0004147 7 0.0005026 4 0.0790827 4 0.0790827 7 0.0005026  8 0.0004147 4 0.02

#element£¨mesh 4*15£¬section 200*200*750£©

for {set i 0} {$i<=15} {incr i 1} {                            
    for {set j 0} {$j<=4} {incr j 1} {                        
        node [expr 5*$i+$j+1] [expr $j*0.05] [expr $i*0.05] 0.1;
    }                                                          
} 
for {set m 0} {$m<15} {incr m 1} {
for {set n 0} {$n<4} {incr n 1} {
  if { $n== 0 || $n== 3} {  
         set a 1
      } else {
     set a 2
      }
element ShellDKGQ [expr 4*$m+$n+1]  [expr 5*$m+$n+1] [expr 5*$m+$n+2] [expr 5*$m+$n+7] [expr 5*$m+$n+6] $a
}
} 
fixY 0.0 1 1 1 1 1 1
pattern Plain 1 Linear {
load 78 0 -52000 0 0 0 0
load 77 0 -52000 0 0 0 0
load 79 0 -52000 0 0 0 0
}

recorder Node    -file D.txt     -time   -node       1 2 3 4 5 78   -dof 1  disp

constraints Plain
numberer RCM
system BandGeneral
test NormDispIncr 1.0e-5 200 ;
algorithm KrylovNewton;
integrator LoadControl 0.1;				
analysis Static				
analyze 10;					

puts "gravity analysis ok"
loadConst -time 0.0;
pattern Plain 2 Linear {
load 78 1000 0.0 0.0 0 0 0
}

constraints Penalty 1e20 1e20;
#constraints Plain 
#constraints Transformation;     				
numberer Plain;					
system BandGeneral;		
test NormDispIncr 1.0e-6 2000 2;
algorithm KrylovNewton 
#algorithm Newton
analysis Static
foreach disp  {50 100 150 200 250 310 380 450 550} { 
integrator DisplacementControl     78          1             1e-4
analyze  [expr 1*$disp]
integrator DisplacementControl     78          1            -1e-4
analyze  [expr 1*$disp]
integrator DisplacementControl     78          1            -1e-4
analyze  [expr 1*$disp]
integrator DisplacementControl     78          1             1e-4
analyze  [expr 1*$disp]
}