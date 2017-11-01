joblist=" /home/arosen/mgiSubj.csv"
ntasks=$(cat ${joblist} | wc -l)

qsub -q all.q,basic.q -l h_vmem=5.5G,s_vmem=5.5G -S /bin/bash -t 1-${ntasks} /data/joy/BBL/projects/mgiReproc2017/mgiReproc2017Scripts/structural/wmSegmentation/runCombineWrapperMGI.sh ${joblist}
