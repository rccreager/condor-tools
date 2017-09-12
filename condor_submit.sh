#!/bin/bash

source helpers.sh

#######a few global variables...
testMode=false #set to false to run, true to check printouts only
storage_location="/disk/userdata00/atlas_data2/rcreager/condor_storage/24August/" #use trailing /

#declare some empty stuff for later
dataFileList=()
filteredFileList=()
unfilteredFileList=()
filteredPathList=()
unfilteredPathList=()
dataModeString=""
unfiltModeString=""
filtModeString=""


#######config information
triggerList=("mu4j15" "mu4j25" "mu4j35" "mu4j55" "mu6j85" "mu6j110" "mu6j150")

dataProductionModes=( "LightTemplate" 
"Data")
unfilteredProductionModes=("NOM_LCratio"
"NOM_AntiTag"
"Nominal")

#unfilteredProductionModes=(
#"_LC_JET_BJES_Response__1up"
#"_LC_JET_BJES_Response__1down"
#"_LC_JET_EffectiveNP_1__1up"
#"_LC_JET_EffectiveNP_1__1down"
#"_LC_JET_EffectiveNP_2__1up"
#"_LC_JET_EffectiveNP_2__1down"
#"_LC_JET_EffectiveNP_3__1up"
#"_LC_JET_EffectiveNP_3__1down"
#"_LC_JET_EffectiveNP_4__1up"
#"_LC_JET_EffectiveNP_4__1down"
#"_LC_JET_EffectiveNP_5__1up"
#"_LC_JET_EffectiveNP_5__1down"
#"_LC_JET_EffectiveNP_6restTerm__1up"
#"_LC_JET_EffectiveNP_6restTerm__1down"
#"_LC_JET_EtaIntercalibration_Modelling__1up"
#"_LC_JET_EtaIntercalibration_Modelling__1down"
#"_LC_JET_EtaIntercalibration_NonClosure__1up"
#"_LC_JET_EtaIntercalibration_NonClosure__1down"
#"_LC_JET_EtaIntercalibration_TotalStat__1up"
#"_LC_JET_EtaIntercalibration_TotalStat__1down"
#"_LC_JET_Flavor_Composition__1up"
#"_LC_JET_Flavor_Composition__1down"
#"_LC_JET_Flavor_Response__1up"
#"_LC_JET_Flavor_Response__1down"
#"_LC_JET_Pileup_OffsetMu__1up"
#"_LC_JET_Pileup_OffsetMu__1down"
#"_LC_JET_Pileup_OffsetNPV__1up"
#"_LC_JET_Pileup_OffsetNPV__1down"
#"_LC_JET_Pileup_PtTerm__1up"
#"_LC_JET_Pileup_PtTerm__1down"
#"_LC_JET_Pileup_RhoTopology__1up"
#"_LC_JET_Pileup_RhoTopology__1down"
#"_LC_JET_PunchThrough_MC15__1up"
#"_LC_JET_PunchThrough_MC15__1down"
#"_LC_JET_JER_SINGLE_NP__1up"
#"_LC_MUONS_SCALE__1up"
#"_LC_MUONS_SCALE__1down"
#"_LC_MUONS_ID__1up"
#"_LC_MUONS_ID__1down"
#"_LC_MUONS_MS__1up"
#"_LC_MUONS_MS__1down"
#"_LC_Nominal"
#"_LC_Nominal_BTup"
#"_LC_Nominal_BTdown"
#"_LCRatio"
#)
#"_LC_JET_GroupedNP_1__1up"
#"_LC_JET_GroupedNP_1__1down"

filteredProductionModes=(  "JET_BJES_Response__1up"
    "JET_BJES_Response__1down"
    "JET_EffectiveNP_1__1up"
    "JET_EffectiveNP_1__1down"
    "JET_EffectiveNP_2__1up"
    "JET_EffectiveNP_2__1down"
    "JET_EffectiveNP_3__1up"
    "JET_EffectiveNP_3__1down"
    "JET_EffectiveNP_4__1up"
    "JET_EffectiveNP_4__1down"
    "JET_EffectiveNP_5__1up"
    "JET_EffectiveNP_5__1down"
    "JET_EffectiveNP_6__1up"
    "JET_EffectiveNP_6__1down"
    "JET_EffectiveNP_7__1up"
    "JET_EffectiveNP_7__1down"
    "JET_EffectiveNP_8restTerm__1up"
    "JET_EffectiveNP_8restTerm__1down"
    "JET_EtaIntercalibration_Modelling__1up"
    "JET_EtaIntercalibration_Modelling__1down"
    "JET_EtaIntercalibration_TotalStat__1up"
    "JET_EtaIntercalibration_TotalStat__1down"
    "JET_EtaIntercalibration_NonClosure__1up"
    "JET_EtaIntercalibration_NonClosure__1down"
    "JET_Flavor_Composition__1up"
    "JET_Flavor_Composition__1down"
    "JET_Flavor_Response__1up"
    "JET_Flavor_Response__1down"
    "JET_Pileup_OffsetMu__1up"
    "JET_Pileup_OffsetMu__1down"
    "JET_Pileup_OffsetNPV__1up"
    "JET_Pileup_OffsetNPV__1down"
    "JET_Pileup_PtTerm__1up"
    "JET_Pileup_PtTerm__1down"
    "JET_Pileup_RhoTopology__1up"
    "JET_Pileup_RhoTopology__1down"
    "JET_PunchThrough_MC15__1up"
    "JET_PunchThrough_MC15__1down"
    "JET_JER_SINGLE_NP__1up"
    "JET_JvtEfficiency__1up"
    "JET_JvtEfficiency__1down"
    "MUON_SCALE__1up"
    "MUON_SCALE__1down"
    "MUON_ID__1up"
    "MUON_ID__1down"
    "MUON_MS__1up"
    "MUON_MS__1down"
    "NOM_AxisSmearing"
    "NOM_FakeMuon"
    "NOM_GluonSplitB_up"
    "NOM_GluonSplitB_down"
    "NOM_GluonSplitC_up"
    "NOM_GluonSplitC_down"
    "NOM_BDecayFractions_up"
    "NOM_BDecayFractions_down"
    "NOM_BFragmentationFunction_up"
    "NOM_BFragmentationFunction_down"
    "NOM_BFragmentationFractions"
    "NOM_BDecayPStar"
    "NOM_JetVertexTagger_up"
    "NOM_JetVertexTagger_down"
    "Nominal" )
#filteredProductionModes=("_JET_BJES_Response__1up"
#"_JET_BJES_Response__1down"
#"_JET_EffectiveNP_1__1up" 
#"_JET_EffectiveNP_1__1down"
#"_JET_EffectiveNP_2__1up" 
#"_JET_EffectiveNP_2__1down"
#"_JET_EffectiveNP_3__1up"
#"_JET_EffectiveNP_3__1down"
#"_JET_EffectiveNP_4__1up"
#"_JET_EffectiveNP_4__1down"
#"_JET_EffectiveNP_5__1up"
#"_JET_EffectiveNP_5__1down"
#"_JET_EffectiveNP_6restTerm__1up"
#"_JET_EffectiveNP_6restTerm__1down"
#"_JET_EtaIntercalibration_Modelling__1up"
#"_JET_EtaIntercalibration_Modelling__1down"
#"_JET_EtaIntercalibration_NonClosure__1up"
#"_JET_EtaIntercalibration_NonClosure__1down"
#"_JET_EtaIntercalibration_TotalStat__1up"
#"_JET_EtaIntercalibration_TotalStat__1down"
#"_JET_Flavor_Composition__1up"
#"_JET_Flavor_Composition__1down"
#"_JET_Flavor_Response__1up"
#"_JET_Flavor_Response__1down"
#"_JET_Pileup_OffsetMu__1up"
#"_JET_Pileup_OffsetMu__1down"
#"_JET_Pileup_OffsetNPV__1up"
#"_JET_Pileup_OffsetNPV__1down"
#"_JET_Pileup_PtTerm__1up"
#"_JET_Pileup_PtTerm__1down"
#"_JET_Pileup_RhoTopology__1up"
#"_JET_Pileup_RhoTopology__1down"
#"_JET_PunchThrough_MC15__1up"
#"_JET_PunchThrough_MC15__1down"
#"_JET_JER_SINGLE_NP__1up"
#"_MUONS_SCALE__1up"
#"_MUONS_SCALE__1down"
#"_MUONS_ID__1up"
#"_MUONS_ID__1down"
#"_MUONS_MS__1up"
#"_MUONS_MS__1down"
#"_Nominal"
#"_Nominal_BTup"
#"_Nominal_BTdown"
#)
#"_JET_GroupedNP_1__1up"
#"_JET_GroupedNP_1__1down"

filtNumbers=("427000" "427030" "427031" "427032" "427033" "427034")
unfiltNumbers=("361020" "361021" "361022" "361023" "361024")

########check if storage location already exists
if [[ -d ${storage_location} ]]
then
    read -p "Directory ${storage_location} already exists, proceed anyways? (y/n) " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "Exiting.."
        return
    fi
fi

#######make directories
IFS='/'
read -a name <<< "${storage_location}"
dirName=${name[6]}
IFS=''

[[ ! -d ${storage_location} ]] &&           mkdir ${storage_location}
[[ ! -d ${storage_location}data ]] &&       mkdir ${storage_location}data
[[ ! -d ${storage_location}filtered ]] &&   mkdir ${storage_location}filtered
[[ ! -d ${storage_location}unfiltered ]] && mkdir ${storage_location}unfiltered

for mode in ${dataProductionModes[@]}
do
    dataModeString=${dataModeString}"\"${mode}\" "
done
for mode in ${unfilteredProductionModes[@]}
do
    unfiltModeString=${unfiltModeString}"\"${mode}\" "
done
for mode in ${filteredProductionModes[@]}
do
    filtModeString=${filtModeString}"\"${mode}\" "
done

cp /home/rcreager/trunk/TemplateFactory/condor/clean/organize.sh ${storage_location}
sed -i -e "s/DIR/${dirName}/g" ${storage_location}organize.sh

cp /home/rcreager/trunk/TemplateFactory/condor/clean/merge.sh ${storage_location}
sed -i -e "s/DIR/${dirName}/g" ${storage_location}merge.sh
sed -i -e "s/AAA/${dataModeString}/g" ${storage_location}merge.sh
sed -i -e "s/BBB/${unfiltModeString}/g" ${storage_location}merge.sh
sed -i -e "s/CCC/${filtModeString}/g" ${storage_location}merge.sh

for num in ${unfiltNumbers[@]}
do
    [[ ! -d ${storage_location}unfiltered/${num} ]] && mkdir ${storage_location}unfiltered/${num}
done

for num in ${filtNumbers[@]}
do
    [[ ! -d ${storage_location}filtered/${num} ]] &&   mkdir ${storage_location}filtered/${num}
done

echo "#!/bin/bash" >> ${storage_location}verify.sh
echo "counter=0" >> ${storage_location}verify.sh

###########fill fileLists
#data
i=0
if [ ${#dataProductionModes[@]} -ne 0 ]; then

dataFile="/home/rcreager/trunk/TemplateFactory/condor/lists/data.txt"
while IFS= read line
do
    dataFileList[$i]=$line
    (( i++ ))
done <"$dataFile"
fi

#unfilt
j=0
if [ ${#unfilteredProductionModes[@]} -ne 0 ]; then
for num in ${unfiltNumbers[@]}
do
    unfiltFile="/home/rcreager/trunk/TemplateFactory/condor/lists/"${num}"_unfiltered.txt"
    while IFS= read line
    do
        unfilteredFileList[$j]=$line
        unfilteredPathList[$j]=$num
        (( j++ ))
    done <"$unfiltFile"
done
fi

#filt
k=0
if [ ${#filteredProductionModes[@]} -ne 0 ]; then
for num in ${filtNumbers[@]}
do
    filtFile="/home/rcreager/trunk/TemplateFactory/condor/lists/"${num}"_filtered.txt"    
    while IFS= read line
    do
        filteredFileList[$k]=$line
        filteredPathList[$k]=$num
        (( k++ ))
    done <"$filtFile"
done
fi




######begin running
x=0
y=0

if [ ${#dataProductionModes[@]} -ne 0 ]; then
for file in ${dataFileList[@]}
do
    IFS='_' 
    read -a myarray <<< "$file"
    temp=${myarray[3]}"_"
    tempB=$(echo ${myarray[4]} | awk -F"." '{print $1"_"}')
    IFS=''
    for trigger in ${triggerList[@]}
    do
        for mode in ${dataProductionModes[@]}
        do
            name=$temp${tempB}$mode$trigger
            echo "name: $name"
            inName=$file
            path=${storage_location}"data/"
            outName=${path}$temp$tempB$mode"_"$trigger"_Templates.root"
            #condor="/home/rcreager/trunk/TemplateFactory/RunTemplateFactory "$inName" "$outName" "_$mode" "$trigger

            IFS='/'
            read -a nameSort <<< "${file}"
            inNameShort=${nameSort[8]}
            IFS='' 
            echo "inNameShort: $inNameShort"
            condor="/home/rcreager/trunk/TemplateFactory/RunTemplateFactory "${inName}" "$outName" "$mode" "$trigger

            echo "inName: $inName"
            echo "inNameShort: $inNameShort"
            echo "outName: $outName"
            echo "command: $condor"

            cp /home/rcreager/trunk/TemplateFactory/condor/clean/run_wrapper.sh /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""run_wrapper.sh
            sed -i -e "s#AAA#$condor#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""run_wrapper.sh 
            sed -i -e "s#XXX#$inName#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""run_wrapper.sh
            #sed -i -e "s#YYY#$inNameShort#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""run_wrapper.sh            

            cp /home/rcreager/trunk/TemplateFactory/condor/clean/submit_RAC.sh /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh
            sed -i -e "s#BBB#$path$name#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh
            sed -i -e "s#CCC#$name#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh
            #sed -i -e "s#DDD#$inNameShort#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh

            echo "if [[ ! -e $outName ]]; then" >> ${storage_location}verify.sh
            echo "    if [[ ! -s $outName ]]; then" >> ${storage_location}verify.sh
            echo "        echo "Could not find $outName"" >> ${storage_location}verify.sh
            echo "        (( counter++ ))" >> ${storage_location}verify.sh
            echo "    fi" >> ${storage_location}verify.sh
            echo "fi" >> ${storage_location}verify.sh

            echo "condor_submit /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh"
            if [ $testMode = false ]; then
                condor_submit /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh
            fi
        done    
    done    
done
fi

if [ ${#unfilteredProductionModes[@]} -ne 0 ]; then
for file in ${unfilteredFileList[@]}
do
    IFS='_'
    read -a myarray <<< "$file"
    temp=${myarray[3]}"_"
    tempB=$(echo ${myarray[4]} | awk -F"." '{print $1"_"}')
    IFS=''
    echo "fileNum: $temp${tempB}"
    for trigger in ${triggerList[@]}
    do
        for mode in ${unfilteredProductionModes[@]}
        do
            name=$temp${tempB}$mode$trigger
            echo "name: $name"
            inName=$file
            path=${storage_location}"unfiltered/${unfilteredPathList[$x]}/"
            outName=$path$temp${tempB}$mode"_"$trigger"_Templates.root"
            #condor="/home/rcreager/trunk/TemplateFactory/RunTemplateFactory "$inName" "$outName" "_$mode" "$trigger

            IFS='/'
            read -a nameSort <<< "${file}"
            inNameShort=${nameSort[9]}
            IFS=''           
            echo "inNameShort: $inNameShort"
            condor="/home/rcreager/trunk/TemplateFactory/RunTemplateFactory "${inName}" "$outName" "$mode" "$trigger

            echo "inName: $inName"
            echo "inNameShort: $inNameShort"
            echo "outName: $outName"
            echo "command: $condor"
            
            cp /home/rcreager/trunk/TemplateFactory/condor/clean/run_wrapper.sh /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""run_wrapper.sh
            sed -i -e "s#AAA#$condor#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""run_wrapper.sh
            sed -i -e "s#XXX#$inName#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""run_wrapper.sh
            #sed -i -e "s#YYY#$inNameShort#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""run_wrapper.sh

            cp /home/rcreager/trunk/TemplateFactory/condor/clean/submit_RAC.sh /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh
            sed -i -e "s#BBB#$path$name#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh
            sed -i -e "s#CCC#$name#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh
            #sed -i -e "s#DDD#$inNameShort#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh

            echo "if [[ ! -e $outName ]]; then" >> ${storage_location}verify.sh
            echo "    if [[ ! -s $outName ]]; then" >> ${storage_location}verify.sh
            echo "        echo "Could not find $outName"" >> ${storage_location}verify.sh
            echo "        (( counter++ ))" >> ${storage_location}verify.sh
            echo "    fi" >> ${storage_location}verify.sh
            echo "fi" >> ${storage_location}verify.sh 
 
            echo "condor_submit /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh"
            if [ $testMode = false ]; then
                condor_submit /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh
            fi
        done
    done
    (( x++ ))
done
fi

if [ ${#filteredProductionModes[@]} -ne 0 ]; then
for file in ${filteredFileList[@]}
do
    IFS='_'
    read -a myarray <<< "$file"
    temp=${myarray[3]}"_"
    tempB=$(echo ${myarray[4]} | awk -F"." '{print $1"_"}')
    IFS=''
    echo "fileNum: $temp${tempB}"
    for trigger in ${triggerList[@]}
    do
        for mode in ${filteredProductionModes[@]}
        do
            name=$temp${tempB}$mode$trigger
            echo "name: $name"
            inName=$file
            path=${storage_location}"filtered/${filteredPathList[$y]}/"
            outName=$path$temp${tempB}$mode"_"$trigger"_Templates.root"
            #condor="/home/rcreager/trunk/TemplateFactory/RunTemplateFactory "$inName" "$outName" "_$mode" "$trigger

            IFS='/'
            read -a nameSort <<< "${file}"
            inNameShort=${nameSort[9]}
            IFS=''
            echo "inNameShort: $inNameShort"
            condor="/home/rcreager/trunk/TemplateFactory/RunTemplateFactory "${inName}" "$outName" "$mode" "$trigger

            echo "inName: $inName"
            echo "inNameShort: $inNameShort"
            echo "outName: $outName"
            echo "command: $condor"
            
            cp /home/rcreager/trunk/TemplateFactory/condor/clean/run_wrapper.sh /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""run_wrapper.sh
            sed -i -e "s#AAA#$condor#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""run_wrapper.sh
            sed -i -e "s#XXX#$inName#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""run_wrapper.sh
            #sed -i -e "s#YYY#$inNameShort#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""run_wrapper.sh
            
            cp /home/rcreager/trunk/TemplateFactory/condor/clean/submit_RAC.sh /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh
            sed -i -e "s#BBB#$path$name#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh
            sed -i -e "s#CCC#$name#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh
            #sed -i -e "s#DDD#$inNameShort#g" /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh

            echo "if [[ ! -e $outName ]]; then" >> ${storage_location}verify.sh
            echo "    if [[ ! -s $outName ]]; then" >> ${storage_location}verify.sh
            echo "        echo "Could not find $outName"" >> ${storage_location}verify.sh
            echo "        (( counter++ ))" >> ${storage_location}verify.sh
            echo "    fi" >> ${storage_location}verify.sh
            echo "fi" >> ${storage_location}verify.sh

            echo "condor_submit /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh"
            if [ $testMode = false ]; then
                condor_submit /home/rcreager/trunk/TemplateFactory/condor/storage_new/$name""submit_RAC.sh
            fi
        done
    done
    (( y++ ))
done
fi

echo "echo \"Found \$counter files missing or zero-size.\" " >> ${storage_location}verify.sh
