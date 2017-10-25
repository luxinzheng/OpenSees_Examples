wipe
#unit: N, m, Pa
model BasicBuilder -ndm 3 -ndf 6

#define nodes
#define the materials and sections for the fiber beam elements
#define the fiber beam elements
#define the masses and gravity loads of the fiber beam elements
source opensees.tcl
puts "fiber element ok"

#define the rigid beams connecting the mega columns and W-section beams
#define the longitudinal rebars at the top and bottom of the coupling beams
source truss.tcl
puts "truss ok"

#define the corresponding gravity loads of the elements in "truss.tcl"
source trussload.tcl
puts "trussload ok"

#define the fiber sections and elements of the W-section beams
#define the associated masses and gravity loads
source Hbeam.tcl
puts "Hbeam ok"

#define the materials and sections of the multi-layered shell elements for shear walls and coupling beams
#define the multi-layered shell elements
#define the masses and gravity loads of the multi-layered shell elements
source layershell.tcl
puts "layershell ok"

#define the slabs using rigid diaphragm 
#define the gravity loads of the slabs
source rigiddigram.tcl
puts "rigiddigram ok"

#define the recorder to record the vertical reaction forces of the bases
recorder Node -file reaction.txt -time -node  1600 2555 4222 4876 6219 6380 6822 7205 7781 7821 8280 8806 9020 9141 9146 9663 9856 9965 10064 10401 10687 11000 11408 11545 11634 11682 12056 12453 12594 12697 12970 13090 13106 13306 13371 13458 13481 13985 14062 14099 14523 14709 14935 14989 15052 15124 15142 15271 15526 15599 15625 15924 15988 16095 16203 16217 16276 16446 16503 17072 17178 17183 17198 17351 17355 17557 17633 17749 17790 17793 17794 17936 18269 18476 18477 18516 18517 19053 19054 19227 19268 19305 19434 19614 19804 19805 19806 19807 19808 19809 19810 19811 19812 19813 19814 19815 19816 19817 19818 19819 21500 21503 21506 21509 21976 21979 21982 21985 25813 25815 25819 25821 25825 25827 25831 25833 -dof 3 reaction;

#define the recorder to record the x translational displacements of each floor
recorder Node -file storyx.txt -time -node 8804	8805	6200	6201	8809	8810	8811	8812	8953	8954	8955	8950	8948	8949	8951	8952	8956	8957	14529	14530	14531	10924	10923	10785	14532	14527	14528	1479	1478	1477	1475	1476	1483	1481	1480	1473	1471	1472	11134	11132	11133	11130	11131	11127	11128	11129	11125	11126	15515	15516	15517	170	5302	5304	15518	15519	15520	5263	5264	5265	5267	5258	5259	5260	5261	5262	5268	5269	3894	3893	12665	12664	10740	10741	12662	12663	12666	12667	16862	16859	16860	16861	16863	4245	1533	1531	12202	9728	9726	9727	9729	9724	9722	9723	9725	9721	9719	9720	11690	11691	4759	4758	4761	11688	11689	11686	11687	2597	2595	2596	2598	2599	2600	2601	2602	2603	2604	1504	3780	3662	17408	17409	17410	17411	17412	17413	17366	17367 -dof 1 disp;

#define the recorder to record the drift ratios in x direction
recorder Drift   -file drift1.txt  -iNode 8804	8805	6200	6201	8809	8810	8811	8812	8953	8954	8955	8950	8948	8949	8951	8952	8956	8957	14529	14530	14531	10924	10923	10785	14532	14527	14528	1479	1478	1477	1475	1476	1483	1481	1480	1473	1471	1472	11134	11132	11133	11130	11131	11127	11128	11129	11125	11126	15515	15516	15517	170	5302	5304	15518	15519	15520	5263	5264	5265	5267	5258	5259	5260	5261	5262	5268	5269	3894	3893	12665	12664	10740	10741	12662	12663	12666	12667	16862	16859	16860	16861	16863	4245	1533	1531	12202	9728	9726	9727	9729	9724	9722	9723	9725	9721	9719	9720	11690	11691	4759	4758	4761	11688	11689	11686	11687	2597	2595	2596	2598	2599	2600	2601	2602	2603	2604	1504	3780	3662	17408	17409	17410	17411	17412	17413	17366	  -jNode  	8805	6200	6201	8809	8810	8811	8812	8953	8954	8955	8950	8948	8949	8951	8952	8956	8957	14529	14530	14531	10924	10923	10785	14532	14527	14528	1479	1478	1477	1475	1476	1483	1481	1480	1473	1471	1472	11134	11132	11133	11130	11131	11127	11128	11129	11125	11126	15515	15516	15517	170	5302	5304	15518	15519	15520	5263	5264	5265	5267	5258	5259	5260	5261	5262	5268	5269	3894	3893	12665	12664	10740	10741	12662	12663	12666	12667	16862	16859	16860	16861	16863	4245	1533	1531	12202	9728	9726	9727	9729	9724	9722	9723	9725	9721	9719	9720	11690	11691	4759	4758	4761	11688	11689	11686	11687	2597	2595	2596	2598	2599	2600	2601	2602	2603	2604	1504	3780	3662	17408	17409	17410	17411	17412	17413	17366	17367 -dof 1 -perpDirn 3

#define the recorder to record the translational displacements of each node
#these files are recorded for the post processing program to display the deformation of the structure
#these files will be very large, please record them with caution
recorder Node -file dispx.txt -time -nodeRange 1 27220 -dof 1 disp;
recorder Node -file dispy.txt -time -nodeRange 1 27220 -dof 2 disp;
recorder Node -file dispz.txt -time -nodeRange 1 27220 -dof 3 disp;

#define the boundary
fixZ 0 1 1 1 1 1 1

constraints Transformation; 
numberer RCM;					
system SparseSYM;
test NormDispIncr 0.05 10 1; 	
#algorithm NewtonLineSearch 0.75
algorithm KrylovNewton 
integrator LoadControl 0.1;
analysis Static
analyze 10
puts "gravity ok"
loadConst -time 0.0;
set xDamp 0.05;					# damping ratio 
set MpropSwitch 1.0;
set KcurrSwitch 0.0;
set KcommSwitch 1.0;
set KinitSwitch 0.0;
set nEigenI 1;		# mode 1
set nEigenJ 10;		# mode 10

set omegaI 0.669862891
set omegaJ 6.804704678
set alphaM [expr $MpropSwitch*$xDamp*(2*$omegaI*$omegaJ)/($omegaI+$omegaJ)];	# M-prop. damping; D = alphaM*M
set betaKcurr [expr $KcurrSwitch*2.*$xDamp/($omegaI+$omegaJ)];         		# current-K;      +beatKcurr*KCurrent
set betaKcomm [expr $KcommSwitch*2.*$xDamp/($omegaI+$omegaJ)];   		# last-committed K;   +betaKcomm*KlastCommitt
set betaKinit [expr $KinitSwitch*2.*$xDamp/($omegaI+$omegaJ)];         			# initial-K;     +beatKinit*Kini
# define damping
rayleigh $alphaM $betaKcurr $betaKinit $betaKcomm; 
set IDloadTag 1001;
set iGMfile "GMX.txt";
set iGMdirection "1";
set iGMfact "2.2";
set dt 0.01;
set GMfatt [expr $iGMfact];
set AccelSeries "Series -dt $dt -filePath $iGMfile -factor $GMfatt";
pattern UniformExcitation $IDloadTag $iGMdirection -accel $AccelSeries;

constraints Transformation;
numberer RCM;
system SparseSYM 
#system CuSP
#system CuSP -rTol 1e-6 -mInt 100000
test NormDispIncr 5e-2 10 2
algorithm NewtonLineSearch 0.75
integrator Newmark 0.55 0.2765625
analysis Transient
puts "ok"

set Nsteps 2000
set DtAnalysis 0.02
set TmaxAnalysis 40
set ok [analyze $Nsteps $DtAnalysis];			

if {$ok != 0} {      ;					
	set ok 0;
	set controlTime [getTime];
	while {$controlTime < $TmaxAnalysis && $ok == 0} {
		set controlTime [getTime]
		set ok [analyze 1 $DtAnalysis]
		if {$ok != 0} {
                  puts "try krylov and change test"
			test NormDispIncr   5e-2 100  2 
			algorithm  KrylovNewton 
			set ok [analyze 1 $DtAnalysis]
			test NormDispIncr 5e-2 10 2
			algorithm NewtonLineSearch 0.75
		}
		if {$ok != 0} {
                  puts "try relative"
			test RelativeNormDispIncr 0.1 10 2
			set ok [analyze 1 $DtAnalysis]
			test NormDispIncr 5e-2 10 2
		}
		if {$ok != 0} {
      puts "try relative and krylov"
			test RelativeNormDispIncr 0.1 10 2
			algorithm  KrylovNewton 
			set ok [analyze 1 $DtAnalysis]
			test NormDispIncr 5e-2 10 2
			algorithm NewtonLineSearch 0.75
		}
		if {$ok != 0} {
			puts "Trying Broyden .."
			algorithm Broyden 8
			set ok [analyze 1 $DtAnalysis]
			algorithm NewtonLineSearch 0.75
		}
		if {$ok != 0} {
			puts "Trying NewtonWithLineSearch .."
			algorithm NewtonLineSearch .8
			set ok [analyze 1 $DtAnalysis]
			algorithm NewtonLineSearch 0.75
		}
	}
};      # end if ok !0
