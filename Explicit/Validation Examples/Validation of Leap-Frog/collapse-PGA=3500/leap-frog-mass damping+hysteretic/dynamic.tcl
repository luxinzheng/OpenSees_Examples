wipe
model BasicBuilder -ndm 3 -ndf 6

source opensees.tcl
puts "fiber element ok"


fixZ -1.5 1 1 1 1 1 1

constraints Transformation;   				
numberer RCM;					
system SparseSYM				
test NormDispIncr 1.0e-4 2000 2; 	
algorithm NewtonLineSearch 0.75
integrator LoadControl 0.25;
analysis Static

analyze 4
puts "gravity applied"
loadConst -time 0.0;


recorder Node    -file disp1.txt  -dT 0.01  -time   -node  16 28 40 52 543 544 545 546 547 548    -dof 1  disp
recorder Node    -file disp2.txt  -dT 0.01  -time   -node  16 28 40 52 543 544 545 546 547 548    -dof 2  disp
recorder Node    -file disp3.txt  -dT 0.01  -time   -node  16 28 40 52 543 544 545 546 547 548    -dof 3  disp

recorder Node   -file reaction.txt -dT 0.01 -time -nodeRange 1 12 -dof 1 reaction


set xDamp 0.05;					# damping ratio ,按照规范取值
set MpropSwitch 1.0;
set KcurrSwitch 0.0;
set KcommSwitch 0.0;
set KinitSwitch 0.0;
set nEigenI 1;		# mode 1
set nEigenJ 3;		# mode 3
set lambdaI 9.617441e+001 
set lambdaJ 5.968588e+002
set omegaI [expr pow($lambdaI,0.5)];
set omegaJ [expr pow($lambdaJ,0.5)];
set alphaM [expr $MpropSwitch*$xDamp*(2*$omegaI)];	# M-prop. damping; D = alphaM*M
set betaKcurr [expr $KcurrSwitch*2.*$xDamp/($omegaI+$omegaJ)];         		# current-K;      +beatKcurr*KCurrent
set betaKcomm [expr $KcommSwitch*2.*$xDamp/($omegaI+$omegaJ)];   		# last-committed K;   +betaKcomm*KlastCommitt
set betaKinit [expr $KinitSwitch*2.*$xDamp/($omegaI+$omegaJ)];         			# initial-K;     +beatKinit*Kini
# define damping


rayleigh $alphaM $betaKcurr $betaKinit $betaKcomm; 			# RAYLEIGH damping


set IDloadTag 1001;
set iGMfile "GMX.txt";
set iGMdirection "1";
set iGMfact "35";
set dt 0.01;
set GMfatt [expr $iGMfact];
set AccelSeries "Series -dt $dt -filePath $iGMfile -factor $GMfatt";
pattern UniformExcitation $IDloadTag $iGMdirection -accel $AccelSeries;

constraints Transformation;
numberer RCM;
system Diagonal

algorithm Linear

integrator Explicitdifference
analysis Transient
puts "ok"
analyze 400000 0.00005