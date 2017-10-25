
wipe

model basic -ndm 3 -ndf 6
nDMaterial PlaneStressUserMaterial    1   40   7   25.8e6 2e6 -5.16e6 -0.003 -0.021 0.001 0.03
nDMaterial   PlateFromPlaneStress     2        1  9.5e8

uniaxialMaterial   Steel02  3 403.3e6 2.083e11  0.000 18.5 0.925 0.15
uniaxialMaterial   Steel02  4 366.7e6 2.071e11  0.000 18.5 0.925 0.15
uniaxialMaterial   Steel02  5 350.3e6 2.060e11  0.000 18.5 0.925 0.15

uniaxialMaterial   Steel02  9 366.7e6 2.071e11  0.003 18.5 0.925 0.15

nDMaterial   PlateRebar         6     3     90
nDMaterial   PlateRebar         7     4     90
nDMaterial   PlateRebar         8     5     0
nDMaterial   PlateRebar         10     5     0
nDMaterial PlaneStressUserMaterial    11   40   7  22.8e6 2e6 -4.56e6 -0.002 -0.012 0.001 0.03
nDMaterial   PlateFromPlaneStress     12        11  9.5e8
section   LayeredShell 1 8 12 0.010000 10 0.000277  2 0.019317 2 0.019317 2 0.019317 2 0.019317  10 0.000277 12 0.010000
section   LayeredShell 2 8 12 0.010000  7 0.000251 12 0.019736 12 0.019736 12 0.019736 12 0.019736 7 0.000251  12 0.010000

source node.tcl
source element.tcl
element truss 145 1 10 201.061930e-6 3
element truss 146 10 19 201.061930e-6 3
element truss 147 19 28 201.061930e-6 3
element truss 148 28 37 201.061930e-6 3
element truss 149 37 46 201.061930e-6 3
element truss 150 46 55 201.061930e-6 3
element truss 151 55 64 201.061930e-6 3
element truss 152 64 73 201.061930e-6 3
element truss 153 73 82 201.061930e-6 3
element truss 154 82 91 201.061930e-6 3
element truss 155 91 100 201.061930e-6 3
element truss 156 100 109 201.061930e-6 3
element truss 157 109 118 201.061930e-6 3
element truss 158 118 127 201.061930e-6 3
element truss 159 127 136 201.061930e-6 3
element truss 160 136 145 201.061930e-6 3
element truss 161 145 154 201.061930e-6 3
element truss 162 154 163 201.061930e-6 3

element truss 163 2 11 201.061930e-6 3
element truss 164 11 20 201.061930e-6 3
element truss 165 20 29 201.061930e-6 3
element truss 166 29 38 201.061930e-6 3
element truss 167 38 47 201.061930e-6 3
element truss 168 47 56 201.061930e-6 3
element truss 169 56 65 201.061930e-6 3
element truss 170 65 74 201.061930e-6 3
element truss 171 74 83 201.061930e-6 3
element truss 172 83 92 201.061930e-6 3
element truss 173 92 101 201.061930e-6 3
element truss 174 101 110 201.061930e-6 3
element truss 175 110 119 201.061930e-6 3
element truss 176 119 128 201.061930e-6 3
element truss 177 128 137 201.061930e-6 3
element truss 178 137 146 201.061930e-6 3
element truss 179 146 155 201.061930e-6 3
element truss 180 155 164 201.061930e-6 3

element truss 181 8 17 201.061930e-6 3
element truss 182 17 26 201.061930e-6 3
element truss 183 26 35 201.061930e-6 3
element truss 184 35 44 201.061930e-6 3
element truss 185 44 53 201.061930e-6 3
element truss 186 53 62 201.061930e-6 3
element truss 187 62 71 201.061930e-6 3
element truss 188 71 80 201.061930e-6 3
element truss 189 80 89 201.061930e-6 3
element truss 190 89 98 201.061930e-6 3
element truss 191 98 107 201.061930e-6 3
element truss 192 107 116 201.061930e-6 3
element truss 193 116 125 201.061930e-6 3
element truss 194 125 134 201.061930e-6 3
element truss 195 134 143 201.061930e-6 3
element truss 196 143 152 201.061930e-6 3
element truss 197 152 161 201.061930e-6 3
element truss 198 161 170 201.061930e-6 3

element truss 199 9 18 201.061930e-6 3
element truss 200 18 27 201.061930e-6 3
element truss 201 27 36 201.061930e-6 3
element truss 202 36 45 201.061930e-6 3
element truss 203 45 54 201.061930e-6 3
element truss 204 54 63 201.061930e-6 3
element truss 205 63 72 201.061930e-6 3
element truss 206 72 81 201.061930e-6 3
element truss 207 81 90 201.061930e-6 3
element truss 208 90 99 201.061930e-6 3
element truss 209 99 108 201.061930e-6 3
element truss 210 108 117 201.061930e-6 3
element truss 211 117 126 201.061930e-6 3
element truss 212 126 135 201.061930e-6 3
element truss 213 135 144 201.061930e-6 3
element truss 214 144 153 201.061930e-6 3
element truss 215 153 162 201.061930e-6 3
element truss 216 162 171 201.061930e-6 3


fixY 0.0 1 1 1 1 1 1



pattern Plain 1 Linear {
load 164 0 -91428.571429 0 0 0 0
load 165 0 -91428.571429 0 0 0 0
load 166 0 -91428.571429 0 0 0 0
load 167 0 -91428.571429 0 0 0 0
load 168 0 -91428.571429 0 0 0 0
load 169 0 -91428.571429 0 0 0 0
load 170 0 -91428.571429 0 0 0 0
}


constraints Penalty 1e17 1e17
numberer RCM
system SparseSYM
test NormDispIncr 1.0e-4 200 2 ;
algorithm KrylovNewton
integrator LoadControl 0.2;
analysis Static
analyze 5;
puts "Gravity ok"

loadConst -time 0.0;

pattern Plain 200 Linear {
load 164 119.286 0 0 0 0 0
load 165 119.286 0 0 0 0 0
load 166 119.286 0 0 0 0 0
load 167 119.286 0 0 0 0 0
load 168 119.286 0 0 0 0 0
load 169 119.286 0 0 0 0 0
load 170 119.286 0 0 0 0 0


load 92 23.57 0 0 0 0 0
load 93 23.57 0 0 0 0 0
load 94 23.57 0 0 0 0 0
load 95 23.57 0 0 0 0 0
load 96 23.57 0 0 0 0 0
load 97 23.57 0 0 0 0 0
load 98 23.57 0 0 0 0 0


load 163 0 430 0 0 0 0
load 171 0 -430 0 0 0 0
}
recorder Node -file disp1.txt -time -node  167 -dof 1  disp
recorder Node -file shearforce1.txt -time -node 1 2 3 4 5 6 7 8 9 -dof 1 reaction 
constraints Penalty 1e17 1e17
numberer RCM
system SparseSYM
test NormDispIncr 1.0e-4 200 2 ;
algorithm KrylovNewton
integrator LoadControl 0.1;				
analysis Static	

integrator DisplacementControl     167         1             1e-3
analyze  2
integrator DisplacementControl     167         1            -1e-3
analyze  4
integrator DisplacementControl     167         1             1e-3
analyze  2


integrator DisplacementControl     167         1             1e-3
analyze  4                                                       
integrator DisplacementControl     167         1            -1e-3
analyze  8                                                       
integrator DisplacementControl     167         1             1e-3
analyze  4

integrator DisplacementControl     167         1             1e-3
analyze  5                                                       
integrator DisplacementControl     167         1            -1e-3
analyze  10                                                      
integrator DisplacementControl     167         1             1e-3
analyze  5

integrator DisplacementControl     167         1             1e-3
analyze  9                                                       
integrator DisplacementControl     167         1            -1e-3
analyze  18                                                      
integrator DisplacementControl     167         1             1e-3
analyze  9


integrator DisplacementControl     167         1             1e-3
analyze  13                                                      
integrator DisplacementControl     167         1            -1e-3
analyze  25                                                      
integrator DisplacementControl     167         1             1e-3
analyze  12

integrator DisplacementControl     167         1             1e-3
analyze  18                                                      
integrator DisplacementControl     167         1            -1e-3
analyze  36                                                      
integrator DisplacementControl     167         1             1e-3
analyze  18


integrator DisplacementControl     167         1             1e-3
analyze  24                                                      
integrator DisplacementControl     167         1            -1e-3
analyze  48                                                      
integrator DisplacementControl     167         1             1e-3
analyze  24

integrator DisplacementControl     167         1             1e-3
analyze  30                                                      
integrator DisplacementControl     167         1            -1e-3
analyze  60                                                      
integrator DisplacementControl     167         1             1e-3
analyze  30


integrator DisplacementControl     167         1             1e-3
analyze  36                                                      
integrator DisplacementControl     167         1            -1e-3
analyze  72                                                      
integrator DisplacementControl     167         1             1e-3
analyze  36


integrator DisplacementControl     167         1             1e-3
analyze  45                                                      
integrator DisplacementControl     167         1            -1e-3
analyze  90                                                      
integrator DisplacementControl     167         1             1e-3
analyze  45

integrator DisplacementControl     167         1             1e-3
analyze  52                                                      
integrator DisplacementControl     167         1            -1e-3
analyze  102                                                     
integrator DisplacementControl     167         1             1e-3
analyze  50   
 
