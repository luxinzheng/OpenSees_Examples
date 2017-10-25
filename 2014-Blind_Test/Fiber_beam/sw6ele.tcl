wipe
model BasicBuilder -ndm 2 -ndf 3
#units pa N m

#������
node 1 0.0 0.0
node 2 0.0 0.5
node 3 0.0 1.0
node 4 0.0 1.5
node 5 0.0 2.0
node 6 0.0 2.8
node 7 0.0 3.6


#define boundary condition
fix 1 1 1 1

#�������
#������
uniaxialMaterial Concrete01 1 -22.8e6 -0.002 -4.56e6 -0.012
#��������
uniaxialMaterial Concrete01 2 -25.8e6 -0.003 -5.16e6 -0.021

#steel
#d=6.5�ֽ�
uniaxialMaterial Steel02 3 366.7e6   207e9  0.001 18.5 0.925 0.15
##d=8
uniaxialMaterial Steel02 4 403.3e6   208e9  0.001 18.5 0.925 0.15
 
#definesection
section Fiber 1 {

    # ---------������ά��Ԫ--------------------------------------------
    #---���ε�Ԫ ���ֵ�Ԫ����� X���򻮷ָ���  Y���򻮷ָ���    1��X��������    1��Y��������   2��X��������  2��Y�������� 
    patch rect          2          10             2               -0.890        -0.040          -0.670         0.040
    patch rect          2          10             2                0.670        -0.040           0.890         0.040
    patch rect          2          20             5               -0.670        -0.030           0.670         0.030
    patch rect          1           1             5               -0.900        -0.050          -0.890         0.050
    patch rect          1           5             1               -0.890        -0.050          -0.670        -0.040
    patch rect          1           5             1               -0.890         0.040          -0.670         0.050
    patch rect          1          20             5               -0.670        -0.050           0.670        -0.030
    patch rect          1          20             5               -0.670         0.030           0.670         0.050
    patch rect          1           1             5                0.890        -0.050           0.900         0.050
    patch rect          1           5             1                0.670        -0.050           0.890        -0.040
    patch rect          1           5             1                0.670         0.040           0.890         0.050
    
    #�ֽ�
    #�������ֽ�
    layer straight      4          4          50.26e-6            -0.890        -0.040          -0.670           -0.040
    layer straight      4          4          50.26e-6            -0.890         0.040          -0.670            0.040
    layer straight      4          4          50.26e-6             0.670         0.040           0.890            0.040
    layer straight      4          4          50.26e-6             0.670        -0.040           0.890           -0.040    
    #�м�����ֽ�
    layer straight      3          10          33.18e-6          -0.670         -0.040          0.670           -0.040
    layer straight      3          10          33.18e-6          -0.670          0.040          0.670            0.040   
}  


#���α任
geomTransf PDelta 1

#define elements
set np 5
# -------- ����������Ԫ         ��Ԫ��  �ڵ�1  �ڵ�2   ��˹�����   �����   �任��
element dispBeamColumn 1 1 2 $np  1 1
element dispBeamColumn 2 2 3 $np  1 1
element dispBeamColumn 3 3 4 $np  1 1
element dispBeamColumn 4 4 5 $np  1 1
element dispBeamColumn 5 5 6 $np  1 1
element dispBeamColumn 6 6 7 $np  1 1

pattern Plain 1 Linear {
   load 7 0 -640000 0 
}

recorder Node -file 6.txt -time -node  7 -dof 1  disp

constraints Plain;     
#constraints Penalty 1.0e20 1.0e20;  				
numberer Plain;					
system BandGeneral;				
test NormDispIncr 1.0e-8 100 1; 
algorithm KrylovNewton 		
#algorithm NewtonLineSearch 0.75;					
integrator LoadControl 0.1;				
analysis Static				
analyze 10;					

puts "�����������..."


loadConst -time 0.0;

constraints Penalty 1e20 1e20;  
#constraints Transformation;     				
numberer Plain;					
system BandGeneral;				
test NormDispIncr 1.0e-8 200 1;
algorithm KrylovNewton 				
#algorithm NewtonLineSearch 0.75;
#algorithm Newton		
integrator LoadControl 0.1;		

pattern Plain 2 Linear {
load 7 835 0.0 -774
load 5 165 0 0
}

constraints Penalty 1e20 1e20;
constraints Plain 
#constraints Transformation;     				
numberer RCM;					
system SparseGEN;				
test NormDispIncr 1.0e-8 2000 2;
algorithm KrylovNewton 
#algorithm Newton
analysis Static

integrator DisplacementControl     7         1             1e-4
analyze  22
integrator DisplacementControl     7         1            -1e-4
analyze  42
integrator DisplacementControl     7         1             1e-4
analyze  20

integrator DisplacementControl     7          1             1e-4
analyze  23                          
integrator DisplacementControl     7          1            -1e-4
analyze  42                          
integrator DisplacementControl     7          1             1e-4
analyze  19

integrator DisplacementControl    7          1             1e-4
analyze  41                         
integrator DisplacementControl    7          1            -1e-4
analyze  77                         
integrator DisplacementControl    7          1             1e-4
analyze  36

integrator DisplacementControl     7          1             1e-4
analyze  43                          
integrator DisplacementControl     7          1            -1e-4
analyze  78                          
integrator DisplacementControl     7          1             1e-4
analyze  35

integrator DisplacementControl     7          1             1e-4
analyze  46                          
integrator DisplacementControl     7          1            -1e-4
analyze  91                          
integrator DisplacementControl     7          1             1e-4
analyze  45

integrator DisplacementControl     7          1             1e-4
analyze  49                          
integrator DisplacementControl     7          1            -1e-4
analyze  96                          
integrator DisplacementControl     7          1             1e-4
analyze  47

integrator DisplacementControl     7          1             1e-4
analyze  90                          
integrator DisplacementControl     7          1            -1e-4
analyze  181                         
integrator DisplacementControl     7          1             1e-4
analyze  91

integrator DisplacementControl     7          1             1e-4
analyze  93                          
integrator DisplacementControl     7          1            -1e-4
analyze  181                         
integrator DisplacementControl     7          1             1e-4
analyze  88

integrator DisplacementControl     7          1             1e-4
analyze  123                         
integrator DisplacementControl     7          1            -1e-4
analyze  244                         
integrator DisplacementControl     7          1             1e-4
analyze  121

integrator DisplacementControl     7          1             1e-4
analyze  128                         
integrator DisplacementControl     7          1            -1e-4
analyze  247                         
integrator DisplacementControl     7          1             1e-4
analyze  119

integrator DisplacementControl     7          1             1e-4
analyze  179                         
integrator DisplacementControl     7          1            -1e-4
analyze  361                         
integrator DisplacementControl     7          1             1e-4
analyze  182

integrator DisplacementControl     7          1             1e-4
analyze  179                         
integrator DisplacementControl     7          1            -1e-4
analyze  355                         
integrator DisplacementControl     7          1             1e-4
analyze  176

integrator DisplacementControl     7          1             1e-4
analyze  240                         
integrator DisplacementControl     7          1            -1e-4
analyze  479                         
integrator DisplacementControl     7          1             1e-4
analyze  239

integrator DisplacementControl     7          1             1e-4
analyze  236                         
integrator DisplacementControl     7          1            -1e-4
analyze  475                         
integrator DisplacementControl     7          1             1e-4
analyze  239

integrator DisplacementControl     7          1             1e-4
analyze  300                         
integrator DisplacementControl     7          1            -1e-4
analyze  600                         
integrator DisplacementControl     7          1             1e-4
analyze  300

integrator DisplacementControl     7          1             1e-4
analyze  304                         
integrator DisplacementControl     7          1            -1e-4
analyze  601                         
integrator DisplacementControl     7          1             1e-4
analyze  297

integrator DisplacementControl     7          1             1e-4
analyze  361                         
integrator DisplacementControl     7          1            -1e-4
analyze  721                         
integrator DisplacementControl     7          1             1e-4
analyze  360

integrator DisplacementControl     7          1             1e-4
analyze  360                         
integrator DisplacementControl     7          1            -1e-4
analyze  723                         
integrator DisplacementControl     7          1             1e-4
analyze  363

integrator DisplacementControl     7         1             1e-4
analyze  451                         
integrator DisplacementControl     7         1            -1e-4
analyze  901                         
integrator DisplacementControl     7         1             1e-4
analyze  450

integrator DisplacementControl     7          1             1e-4
analyze  451                         
integrator DisplacementControl     7          1            -1e-4
analyze  894                         
integrator DisplacementControl     7          1             1e-4
analyze  443

integrator DisplacementControl     7          1             1e-4
analyze  517                         
integrator DisplacementControl     7          1            -1e-4
analyze  1021                        
integrator DisplacementControl     7          1             1e-4
analyze  504