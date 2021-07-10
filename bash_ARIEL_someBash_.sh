#!/bin/bash
# Proper header for a Bash script.

# This shell script is syntaxed with guidance from the guidebook 
# http://www.tldp.org/LDP/abs/html/abs-guide.html#PART2

# Cleanup, version 2

# Run as root, of course.
# 00 :: sequence of commands to write in multiple files



#for j in 1 2 #00
#do #00
#LOG_DIR=/zeus/zeususer/niko_at/1d_model/1d_model/nicola_update/fix_Ienergy_210116/radioactivecheck_250116/checksth/phase_space/bucket$j/

# @Lenovo
#LOG_DIR=/media/nasia/DataUnivers/Projects/ARIEL/RedBook_Runs/input/
# @flounder
LOG_DIR=/home/nasia.nikolaou/ARIEL_redBook/GGchem/GGchem_CIreverseCO2/GGchem_experiment13/input/
LOG_RUN=/home/nasia.nikolaou/ARIEL_redBook/GGchem/GGchem_CIreverseCO2/GGchem_experiment13/
LOG_SAVE=/home/nasia.nikolaou/ARIEL_redBook/GGchem/GGchem_CIreverseCO2/GGchem_experiment13/bashRuns/

#/zeus/zeususer/niko_at/1d_model/1d_model/nicola_update/fix_Ienergy_210116/radioactivecheck_250116/checksth/phase_space/bucket1/

# Variables are better than hard-coded values.
cd $LOG_DIR


echo "The number of days since the year's beginning is `date +%j`."
# Needs a leading '+' to invoke formatting.
# %j gives day of year.

 
filename=ownInput_


# for loop:
V0=-1           #1)1           2)-1000000   3)13    4)-100    5)-50    6)-9
dV=1     #1)2(multipl)  2)1000000(+)   3)10    4)200(+)    5)100    6)10(+)
V0_max=100     #1)20      2)9000000   3)91    4)2000       5)1000    6)200

 
#a=$(( $S0 + $DS*$i))

while [ $V0 -lt $V0_max ] # if it holds in the beginning, it will still perform the last addition
do
cd $LOG_DIR

#(( V0 = V0*dV ))
(( V0 = V0 + dV ))
sedV0=0
(( sedV0=V0+1 ))
#tempVar=$(sed "${sedV0}q;d" temps1000.csv) # Ti option Low Temperature
tempVar=$(sed "${sedV0}q;d" tempsHowhot.csv) # option High Temperature
gaps16='          '


#OFILE=sens_${V0}

#    ---------------------------- 1 ---------------------------

# EKKINISI run
cp ARIEL_template.in $filename${V0}.in
#: >  $filename$V0.in
sed -i -e "s/@@TEMPTOCHANGE@@/$tempVar$gaps16/g" $filename$V0.in
sed -i -e "s/@@OWNFILETOCHANGE@@/ownMix_$V0.dat/g" $filename${V0}.in



##gfortran -o orange_${V0}$prefix orange_developLenovo141116.f90 nr.o nrutil.o nrtype.o
      #run
cd $LOG_RUN

rm database.dat

./ggchem input/$filename${V0}.in >> GG_saysOwnMix_${V0}.txt


mv GG_saysOwnMix_${V0}.txt $LOG_SAVE/GG_saysOwnMix_${V0}.txt


#tail -1 hard_turbulence.dat >> bifohard.dgr




#mv atmosphere.dat atmosphere_part3${V0}$prefix.dat
#cp restart_scalars.dat restart_scalars_part3${V0}$prefix.dat



#rm at_cp.dat


#tar cvf ${OFILE}$prefix.tar  *.txt *.dat *.f90 
#gzip -f   ${OFILE}$prefix.tar




#echo " Job Started "
#time ./tommy < input.dat
#if [ -f sflux_finale.dat ]; then
#mv fort.89 bifo_new_compl_timeseries.dat
#tar cvf ${calc_S0${S0}noa}.tar  *.dat 
#gzip -f   ${calc_S0${S0}noa}.tar 
done

#done #00


#tar -xf something the output, prototype*, hard_turbulence*, seiresf(t)* naming them differently $sensitivity_albedo_$alb_$atm
exit #  The right and proper method of "exiting" from a script.
     #  A bare "exit" (no parameter) returns the exit status
     #+ of the preceding command. 
