#!/bin/bash -x


sub_classifier=($(seq 1 1 30))

for sub_c in "${sub_classifier[@]}"; do
		echo $theta # line continuation \ no char after that
		java -javaagent:/home/pavel/.m2/repository/com/github/fracpete/sizeofag/1.0.4/sizeofag-1.0.4.jar \
		-cp Pavel.jar moa.DoTask "EvaluatePrequential -l ( DDMbyDu -l (meta.OzaBoost -s $sub_c )) -s (ArffFileStream -f /home/pavel/MOA4900/moa-release-2018.6.0/testData/NoDrift/ClassSize50/Output_Experiment1_50_0_m.arff)
"

done


