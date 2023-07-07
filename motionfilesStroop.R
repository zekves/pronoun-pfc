subs = c('15','16','17','18','19','20')

CutTR = 4

for (s in subs){
  wdname = paste('/Volumes/Ekves/SNLProStroop/derivatives/fmriprep/sub-',s,'PR/func',sep="")
  setwd(wdname)
  
    fname = paste('sub-',s,'PR_task-Stroop_desc-confounds_regressors.tsv',sep="")
    data=read.table(fname,sep="\t",header=TRUE,stringsAsFactors = FALSE)
    chopped=data[-(1:CutTR), , drop = FALSE]
    chopped$framewise_displacement=as.numeric(chopped$framewise_displacement)
    rotX=data.frame(chopped$rot_x)
    rotY=data.frame(chopped$rot_y)
    rotZ=data.frame(chopped$rot_z)
    transX=data.frame(chopped$trans_x)
    transY=data.frame(chopped$trans_y)
    transZ=data.frame(chopped$trans_z)
    ACC00=data.frame(chopped$a_comp_cor_00)
    ACC01=data.frame(chopped$a_comp_cor_01)
    ACC02=data.frame(chopped$a_comp_cor_02)
    ACC03=data.frame(chopped$a_comp_cor_03)
    ACC04=data.frame(chopped$a_comp_cor_04)
    ACC05=data.frame(chopped$a_comp_cor_05)
    FD=data.frame(chopped$framewise_displacement)
  
  
  write.table(rotX[1], file=paste("Stroop",s,"rotX.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(rotY[1], file=paste("Stroop",s,"rotY.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(rotZ[1], file=paste("Stroop",s,"rotZ.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(transX[1], file=paste("Stroop",s,"transX.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(transY[1], file=paste("Stroop",s,"transY.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(transZ[1], file=paste("Stroop",s,"transZ.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(ACC00[1], file=paste("Stroop",s,"ACC00.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(ACC01[1], file=paste("Stroop",s,"ACC01.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(ACC02[1], file=paste("Stroop",s,"ACC02.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(ACC03[1], file=paste("Stroop",s,"ACC03.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(ACC04[1], file=paste("Stroop",s,"ACC04.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(ACC05[1], file=paste("Stroop",s,"ACC05.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(FD[1], file=paste("Stroop",s,"FD.txt", sep = ""), row.names = FALSE, col.names = FALSE)}
  
  
  #for (i in allruns){
   # cat(subset(rotX,chopped.run==i)$chopped.rot_x, file=paste(s,"rotX.txt", sep = ""), append = TRUE)
  #  cat(subset(rotY,chopped.run==i)$chopped.rot_y, file=paste(s,"rotY.txt", sep = ""), append = TRUE)
  #  cat(subset(rotZ,chopped.run==i)$chopped.rot_z, file=paste(s,"rotZ.txt", sep = ""), append = TRUE)
  #  cat(subset(transX,chopped.run==i)$chopped.trans_x, file=paste(s,"transX.txt", sep = ""), append = TRUE)
  #  cat(subset(transY,chopped.run==i)$chopped.trans_y, file=paste(s,"transY.txt", sep = ""), append = TRUE)
  #  cat(subset(transZ,chopped.run==i)$chopped.trans_z, file=paste(s,"transZ.txt", sep = ""), append = TRUE)
  #}
