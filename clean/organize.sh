filtList=(427000 427030 427031 427032 427033 427034)
unfiltList=(361020 361021 361022 361023 361024)

cd /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/data
mkdir /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/data/root
mkdir /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/data/out
mkdir /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/data/log
mkdir /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/data/error
mv /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/data/*.root /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/data/root
mv /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/data/*.error /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/data/error
mv /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/data/*.out /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/data/out
mv /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/data/*.log /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/data/log

for num in ${unfiltList[@]}
do
    cd /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/unfiltered/${num}
    mkdir /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/unfiltered/${num}/root
    mkdir /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/unfiltered/${num}/out
    mkdir /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/unfiltered/${num}/log
    mkdir /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/unfiltered/${num}/error
    mv /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/unfiltered/${num}/*.root /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/unfiltered/${num}/root
    mv /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/unfiltered/${num}/*.log /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/unfiltered/${num}/log
    mv /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/unfiltered/${num}/*.out /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/unfiltered/${num}/out
    mv /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/unfiltered/${num}/*.error /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/unfiltered/${num}/error
done

for num in ${filtList[@]}
do
    cd /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/filtered/${num}
    mkdir /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/filtered/${num}/root
    mkdir /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/filtered/${num}/out
    mkdir /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/filtered/${num}/log
    mkdir /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/filtered/${num}/error
    mv /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/filtered/${num}/*.root /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/filtered/${num}/root
    mv /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/filtered/${num}/*.log /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/filtered/${num}/log
    mv /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/filtered/${num}/*.out /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/filtered/${num}/out
    mv /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/filtered/${num}/*.error /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR/filtered/${num}/error
done

cd /disk/userdata00/atlas_data2/rcreager/condor_storage/DIR
