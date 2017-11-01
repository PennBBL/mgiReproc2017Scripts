subjlist=${1}
subj=$(cat $subjlist | sed -n "${SGE_TASK_ID}p")
bblid=`echo ${subj} | cut -f 1 -d ,`
scanid=`echo ${subj} | cut -f 2 -d ,`
dateid=`echo ${subj} | cut -f 3 -d ,`
# First create the antsCT intersect image
inputImageSeg="/data/joy/BBL/studies/MGI2/processedData/structural/nkiTemp/mgiNKITempTest_201708111144/${bblid}/${dateid}x${scanid}/antsCT/${bblid}_${dateid}x${scanid}_BrainSegmentation.nii.gz"
inputImage="/data/joy/BBL/studies/MGI2/processedData/structural/nkiTemp/mgiNKITempTest_201708111144/${bblid}/${dateid}x${scanid}/jlf/${bblid}_${dateid}x${scanid}_Labels.nii.gz"
intersectOut="/data/joy/BBL/studies/MGI2/processedData/structural/nkiTemp/mgiNKITempTest_201708111144/${bblid}/${dateid}x${scanid}/jlf/antsCTIntersectLabels.nii.gz"
/data/joy/BBL/applications/xcpEngine/modules/jlf/antsCTIntersect.sh ${inputImage} ${inputImageSeg} ${intersectOut}
# Now produce the wm vals
outputImage="/data/joy/BBL/studies/MGI2/processedData/structural/nkiTemp/mgiNKITempTest_201708111144//${bblid}/${dateid}x${scanid}/jlf/${bblid}_${dateid}x${scanid}_jlfWmSeg.nii.gz"
/data/joy/BBL/projects/pncReproc2015/pncReproc2015Scripts/jlf/wmSegmentation/createDistanceMetricsMask.sh ${inputImage} ${outputImage}
