/data/joy/BBL/applications/xcpEngine/utils/combineOutput -p /data/joy/BBL/studies/MGI2/processedData/structural/nkiTemp/mgiNKITempTest_201708111144/ -f "JLFIntersect_val_gmSegIntersect.1D" -o "mgiGMDVals.1D"
/data/joy/BBL/applications/xcpEngine/utils/combineOutput -p /data/joy/BBL/studies/MGI2/processedData/structural/nkiTemp/mgiNKITempTest_201708111144/ -f "JLFIntersect_val_vol_volume.1D" -o "mgiVOLVals.1D"
/data/joy/BBL/applications/xcpEngine/utils/combineOutput -p /data/joy/BBL/studies/MGI2/processedData/structural/nkiTemp/mgiNKITempTest_201708111144/ -f "JLFIntersect_val_corticalThickness.1D" -o "mgiCTVals.1D"
/data/joy/BBL/applications/xcpEngine/utils/combineOutput -p /data/joy/BBL/studies/MGI2/processedData/structural/nkiTemp/mgiNKITempTest_201708111144/ -f "JLFIntersect_val_cortConVals.1D" -o "mgiCCVals.1D"

mv /data/joy/BBL/studies/MGI2/processedData/structural/nkiTemp/mgiNKITempTest_201708111144/*1D /data/joy/BBL/projects/mgiReproc2017/structural

# Now write the output CSV's
Rscript /data/joy/BBL/projects/mgiReproc2017/mgiReproc2017Scripts/structural/dataPrep/prepColumnHeaders.R
