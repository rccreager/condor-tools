#!/bin/bash
export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh
lsetup "root 5.34.19-x86_64-slc6-gcc48-opt"
export LD_LIBRARY_PATH="/home/rcreager/trunk/TuDoBase/lib/":$LD_LIBRARY_PATH
echo "scratchDisk: $_CONDOR_SCRATCH_DIR"
echo "path: $PWD"
ls
ls Xml

#cp XXX $_CONDOR_SCRATCH_DIR/YYY
AAA
#rm $_CONDOR_SCRATCH_DIR/YYY
