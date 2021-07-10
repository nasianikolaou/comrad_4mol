Athanasia Nikolaou 
09.04.2020

README

This file explains the functional steps to run a combination of GGchem and random input.
Aim:
	1.	It provides chemically informed atmospheres starting from a mere random content of CO2. OUTPUT ==> *.csv *.pkl

	2. (optional) It also visualises randomly some results (script *.D.py)

Prerequisites:

	Files:
		GJ_1214_1000times.csv
		ARIEL_template.in

	Directory structure:
		/GGchem-bashEmpty/

	Environment:
		load conda nasia (python 2.7 with seaborn)
		>> conda activate nasia

	DISCLAIMER: All the required files are included in the TarBALL!!!

#------------------------------------------------

Prepare as follows:

	1. Clone a directory structure that includes GGchem installed:
		>> cp -r GGchem_template/* GGchem_experiment3/

	2. This is now your 'workingDIR'

	3. Put the scripts in locations as follows:
			workingDIR/prepareOwnMix/Oxidation_loopA
			workingDIR/prepareOwnMix/GJ1214*.csv
			workingDIR/bashRuns/Oxidation_loopB
			workingDIR/bashRuns/Oxidation_loopC
			workingDIR/bashRuns/Oxidation_plotD
			workingDIR/input/ARIEL_template.in



#-------------------------------------------------

		STEPS:

	1. create a directory structure as the GGchem-bashEmpty/

	2. >> cd into workingDIR
	3. >> cd workingDIR/prepareOwnMix/
	4. python Oxidation*A.py
	5. cp ownMix*.dat /workingDIR/. UPDATE! NO LONGER NEEDED, I included this command into *Loop-A.py
	5. >> cd workingDIR/
	6. rm nohup*
	6. nohup ./bash_ARIEL_gen_800.sh &
	7. cd workingDIR/bashRunsTfix/.
	8. conda activate nasia
	9. >> nohup python Oxidation_ARIEL_Loop-B.py >> nohupLOOP-Bfails.txt
	10. >> python Oxidation_ARIEL_Loop-C.py
	11. >> python Oxidation_ARIEL_plot-D.py

	every separate item in 
	/home/nasia.nikolaou/ARIEL_redBook/GGchem/GGchem-bash/bashRuns/
	is working.

#--------------------------------------------------------

		EXPERIMENTS:

		09.04.2020
		I set off a set of bashes of varying temperature in the GGchem-bash/bashRuns/
		with alpha=0.1 (little rock)
		with philosilicates

		Next: I plot same planets
		Next: I plot same planets from /GGchem/bashRunsTfix/
		Next: compare on T effect for the type of C-species and put into a document.
				Comment of H2O and on H2
				check Fegley and add to excel explanations 
				expectations from literature comparison. Does it validate against it?

