
unfiltList=(361020 361021 361022 361023 361024) 
filtList=(427030 427031 427032 427033 427034)
trigList=("mu4j15" "mu4j25" "mu4j35" "mu4j55" "mu6j85" "mu6j110" "mu6j150")

dataModes=(AAA)
unfiltModes=(BBB)
filtModes=(CCC)

mkdir /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/merged_files

#data
for mode in ${dataModes[@]}
do
    for trig in ${trigList[@]}
    do
        hadd /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/merged_files/${mode}_${trig}_Templates_merged.root /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/data/root/*_${mode}_${trig}_Templates.root
    done    
done

#unfilt
for mode in ${unfiltModes[@]}
do
    for num in ${unfiltList[@]}
    do
        for trig in ${trigList[@]}
        do
            hadd /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/merged_files/${num}_${mode}_${trig}_Templates_merged.root /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/unfiltered/${num}/root/*_${mode}_${trig}_Templates.root
        done
    done
done

#file
for mode in ${filtModes[@]}
do
    for num in ${filtList[@]}
    do  
        for trig in ${trigList[@]}
        do
            hadd /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/merged_files/${num}_${mode}_${trig}_Templates_merged.root /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/filtered/${num}/root/*_${mode}_${trig}_Templates.root
        done
    done
done
