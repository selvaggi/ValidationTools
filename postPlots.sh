#!/bin/bash

while getopts "o:i:s:" opt; do
    case "$opt" in
        o) OUTPATH=$OPTARG
            ;;
	i) INPATH=$OPTARG
	    ;;
	s) SAMPLE=$OPTARG
    esac
done

DELPHESVERSION="delphes3.4.2pre17"
DELPHESCARD="CMS_PhaseII_200PU_v04VAL.tcl"
FULLSIMCAMP="PhaseIIMTDTDRAutumn18MiniAOD"

INITIAL="$(echo $USER | head -c 1)"
WWWDIR=/eos/user/${INITIAL}/${USER}/www/${OUTPATH}

if [ ! -d "${WWWDIR}" ]; then
    mkdir -p ${WWWDIR}
fi

cp index.php ${WWWDIR}
mkdir ${WWWDIR}/efficiencies
mkdir ${WWWDIR}/efficiencies/loose
mkdir ${WWWDIR}/efficiencies/medium
mkdir ${WWWDIR}/efficiencies/tight
mkdir ${WWWDIR}/fakerates
mkdir ${WWWDIR}/fakerates/loose
mkdir ${WWWDIR}/fakerates/medium
mkdir ${WWWDIR}/fakerates/tight
mkdir ${WWWDIR}/resolution
mkdir ${WWWDIR}/resolution/loose
mkdir ${WWWDIR}/resolution/medium
mkdir ${WWWDIR}/resolution/tight
mkdir ${WWWDIR}/ptresponse
mkdir ${WWWDIR}/ptresponse/loose
mkdir ${WWWDIR}/ptresponse/medium
mkdir ${WWWDIR}/ptresponse/tight
cp index.php ${WWWDIR}/multiplicity
cp index.php ${WWWDIR}/efficiencies
cp index.php ${WWWDIR}/efficiencies/loose
cp index.php ${WWWDIR}/efficiencies/medium
cp index.php ${WWWDIR}/efficiencies/tight
cp index.php ${WWWDIR}/fakerates
cp index.php ${WWWDIR}/fakerates/loose
cp index.php ${WWWDIR}/fakerates/medium
cp index.php ${WWWDIR}/fakerates/tight
cp index.php ${WWWDIR}/resolution
cp index.php ${WWWDIR}/resolution/loose
cp index.php ${WWWDIR}/resolution/medium
cp index.php ${WWWDIR}/resolution/tight
cp index.php ${WWWDIR}/ptresponse
cp index.php ${WWWDIR}/ptresponse/loose
cp index.php ${WWWDIR}/ptresponse/medium
cp index.php ${WWWDIR}/ptresponse/tight
cp index.php ${WWWDIR}/multiplicity

cp ${INPATH}/*.png ${WWWDIR}
mv ${WWWDIR}/*efficiency*loose*.png ${WWWDIR}/efficiencies/loose/
mv ${WWWDIR}/*efficiency*medium*.png ${WWWDIR}/efficiencies/medium/
mv ${WWWDIR}/*efficiency*tight*.png ${WWWDIR}/efficiencies/tight/
mv ${WWWDIR}/*efficiency*.png ${WWWDIR}/efficiencies/
mv ${WWWDIR}/*fakerate*loose*.png ${WWWDIR}/fakerates/loose/
mv ${WWWDIR}/*fakerate*medium*.png ${WWWDIR}/fakerates/medium/
mv ${WWWDIR}/*fakerate*tight*.png ${WWWDIR}/fakerates/tight/
mv ${WWWDIR}/*fakerate*.png ${WWWDIR}/fakerates/
mv ${WWWDIR}/*loose*resolution*.png ${WWWDIR}/resolution/loose/
mv ${WWWDIR}/*medium*resolution*.png ${WWWDIR}/resolution/medium/
mv ${WWWDIR}/*tight*resolution*.png ${WWWDIR}/resolution/tight/
mv ${WWWDIR}/*resolution*.png ${WWWDIR}/resolution/
mv ${WWWDIR}/*ptresponse*loose*.png ${WWWDIR}/ptresponse/loose/
mv ${WWWDIR}/*ptresponse*medium*.png ${WWWDIR}/ptresponse/medium/
mv ${WWWDIR}/*ptresponse*tight*.png ${WWWDIR}/ptresponse/tight/
mv ${WWWDIR}/*ptresponse*.png ${WWWDIR}/ptresponse/
mv ${WWWDIR}/*multiplicity*.png ${WWWDIR}/multiplicity/

echo $(date) >> ${WWWDIR}/postlog.txt
echo ${USER} >> ${WWWDIR}/postlog.txt
echo " " >> ${WWWDIR}/postlog.txt
echo ${DELPHESVERSION} >> ${WWWDIR}/postlog.txt
echo ${DELPHESCARD} >> ${WWWDIR}/postlog.txt
echo "FullSim  ${FULLSIMCAMP}" >> ${WWWDIR}/postlog.txt
echo ${SAMPLE} >>  ${WWWDIR}/postlog.txt

echo "Plots posted in ${WWWDIR} "

