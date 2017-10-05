# Prep the GMD column names
source('/home/arosen/adroseHelperScripts/R/afgrHelpFunc.R')
install_load('tools')
columnValues <- read.csv("/data/joy/BBL/projects/pncReproc2015/pncReproc2015Scripts/jlf/labelList/inclusionCheck.csv")
gmdValues <- read.table("/data/joy/BBL/projects/mgiReproc2017/structural/mgiGMDVals.1D", header=T)
nzCols <- grep('NZMean', names(gmdValues))
nzCols <- append(c(1, 2), nzCols)
gmdValues <- gmdValues[,nzCols]
colsOfInterest <- columnValues$Label.Number[which(columnValues$GMD==0)] + 2
colsOfInterest <- append(c(1,2), colsOfInterest)
gmdValues <- gmdValues[,colsOfInterest]
columnNames <- gsub(x=gsub(x=columnValues$JLF.Column.Names, pattern='%MODALITY%', replacement='mprage'), pattern='%MEASURE%', replacement='gmd')[which(columnValues$GMD==0)]
colnames(gmdValues)[3:length(gmdValues)] <- as.character(columnNames)
gmdValues[,2] <- strSplitMatrixReturn(gmdValues$subject.1., 'x')[,2]
colnames(gmdValues)[1:2] <- c('bblid', 'scanid')

# Now do CT
ctValues <- read.table("/data/joy/BBL/projects/mgiReproc2017/structural/mgiCTVals.1D", header=T)
nzCols <- grep('NZMean', names(ctValues))
nzCols <- append(c(1, 2), nzCols)
ctValues <- ctValues[,nzCols]
colsOfInterest <- columnValues$Label.Number[which(columnValues$CT==0)] + 2
colsOfInterest <- append(c(1,2), colsOfInterest)
ctValues <- ctValues[,colsOfInterest]
columnNames <- gsub(x=gsub(x=columnValues$JLF.Column.Names, pattern='%MODALITY%', replacement='mprage'), pattern='%MEASURE%', replacement='ct')[which(columnValues$CT==0)]
colnames(ctValues)[3:length(ctValues)] <- as.character(columnNames)
ctValues[,2] <- strSplitMatrixReturn(ctValues$subject.1., 'x')[,2]
colnames(ctValues)[1:2] <- c('bblid', 'scanid')

# Now do CC
ccValues <- read.table("/data/joy/BBL/projects/mgiReproc2017/structural/mgiCCVals.1D", header=T)
nzCols <- grep('NZMean', names(ccValues))
nzCols <- append(c(1, 2), nzCols)
ccValues <- ccValues[,nzCols]
colsOfInterest <- columnValues$Label.Number[which(columnValues$CT==0)] + 2
colsOfInterest <- append(c(1,2), colsOfInterest)
ccValues <- ccValues[,colsOfInterest]
columnNames <- gsub(x=gsub(x=columnValues$JLF.Column.Names, pattern='%MODALITY%', replacement='mprage'), pattern='%MEASURE%', replacement='cortcon')[which(columnValues$CT==0)]
colnames(ccValues)[3:length(ccValues)] <- as.character(columnNames)
ccValues[,2] <- strSplitMatrixReturn(ccValues$subject.1., 'x')[,2]
colnames(ccValues)[1:2] <- c('bblid', 'scanid')

# And now volume
volumeValues <- read.table("/data/joy/BBL/projects/mgiReproc2017/structural/mgiVOLVals.1D", header=T)
colsOfInterest <- columnValues$Label.Number[which(columnValues$Volume==0)] + 2
colsOfInterest <- append(c(1,2), colsOfInterest)
volumeValues <- cbind(ctValues$bblid, ctValues$scanid, volumeValues)
volumeValues <- volumeValues[,colsOfInterest]
columnNames <- gsub(x=gsub(x=columnValues$JLF.Column.Names, pattern='%MODALITY%', replacement='mprage'), pattern='%MEASURE%', replacement='vol')[which(columnValues$Volume==0)]
colnames(volumeValues)[3:length(volumeValues)] <- as.character(columnNames)
colnames(volumeValues)[1:2] <- c('bblid', 'scanid')
# Now write the output csv's
write.csv(gmdValues, '/data/joy/BBL/projects/mgiReproc2017/structural/gmdValuesPropHead.csv', quote=F, row.names=F)
write.csv(ctValues, '/data/joy/BBL/projects/mgiReproc2017/structural/ctValuesPropHead.csv', quote=F, row.names=F)
write.csv(volumeValues, '/data/joy/BBL/projects/mgiReproc2017/structural/volValuesPropHead.csv', quote=F, row.names=F)
write.csv(ccValues, '/data/joy/BBL/projects/mgiReproc2017/structural/ccValuesPropHead.csv', quote=F, row.names=F)
