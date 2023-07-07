subs = c('15','16','17','18','19','20')
allruns = c('01','02','03','04','05')
runs = c('02','03','04','05')
CutTR = 11

for (s in subs){
  wdname = paste('/Volumes/Ekves/SNLProStroop/derivatives/fmriprep/sub-',s,'PR/func',sep="")
  setwd(wdname)
  
  for(i in '01'){
    fname = paste('sub-',s,'PR_task-Sent_run-',i,'_desc-confounds_regressors.tsv',sep="")
    data=read.table(fname,sep="\t",header=TRUE,stringsAsFactors = FALSE)
    data$run = i
    chopped=data[-(1:CutTR), , drop = FALSE]
    chopped$framewise_displacement=as.numeric(chopped$framewise_displacement)
    rotX=data.frame(chopped$rot_x,chopped$run)
    rotY=data.frame(chopped$rot_y,chopped$run)
    rotZ=data.frame(chopped$rot_z,chopped$run)
    transX=data.frame(chopped$trans_x,chopped$run)
    transY=data.frame(chopped$trans_y,chopped$run)
    transZ=data.frame(chopped$trans_z,chopped$run)
    ACC00=data.frame(chopped$a_comp_cor_00,chopped$run)
    ACC01=data.frame(chopped$a_comp_cor_01,chopped$run)
    ACC02=data.frame(chopped$a_comp_cor_02,chopped$run)
    ACC03=data.frame(chopped$a_comp_cor_03,chopped$run)
    ACC04=data.frame(chopped$a_comp_cor_04,chopped$run)
    ACC05=data.frame(chopped$a_comp_cor_05,chopped$run)
    FD=data.frame(chopped$framewise_displacement,chopped$run)
  }
  
  for(i in runs){
    fname = paste('sub-',s,'PR_task-Sent_run-',i,'_desc-confounds_regressors.tsv',sep="")
    data=read.table(fname,sep="\t",header=TRUE,stringsAsFactors = FALSE)
    data$run = i
    chopped=data[-(1:CutTR), , drop = FALSE]
    chopped$framewise_displacement=as.numeric(chopped$framewise_displacement)
    rotX = rbind(rotX,data.frame(chopped$rot_x,chopped$run))
    rotY = rbind(rotY,data.frame(chopped$rot_y,chopped$run))
    rotZ = rbind(rotZ,data.frame(chopped$rot_z,chopped$run))
    transX = rbind(transX,data.frame(chopped$trans_x,chopped$run))
    transY = rbind(transY,data.frame(chopped$trans_y,chopped$run))
    transZ = rbind(transZ,data.frame(chopped$trans_z,chopped$run))
    ACC00 = rbind(ACC00,data.frame(chopped$a_comp_cor_00,chopped$run))
    ACC01 = rbind(ACC01,data.frame(chopped$a_comp_cor_01,chopped$run))
    ACC02 = rbind(ACC02,data.frame(chopped$a_comp_cor_02,chopped$run))
    ACC03 = rbind(ACC03,data.frame(chopped$a_comp_cor_03,chopped$run))
    ACC04 = rbind(ACC04,data.frame(chopped$a_comp_cor_04,chopped$run))
    ACC05 = rbind(ACC05,data.frame(chopped$a_comp_cor_05,chopped$run))
    FD = rbind(FD,data.frame(chopped$framewise_displacement,chopped$run))
  }
  
  write.table(rotX[1], file=paste("Sent",s,"rotX.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(rotY[1], file=paste("Sent",s,"rotY.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(rotZ[1], file=paste("Sent",s,"rotZ.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(transX[1], file=paste("Sent",s,"transX.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(transY[1], file=paste("Sent",s,"transY.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(transZ[1], file=paste("Sent",s,"transZ.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(ACC00[1], file=paste("Sent",s,"ACC00.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(ACC01[1], file=paste("Sent",s,"ACC01.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(ACC02[1], file=paste("Sent",s,"ACC02.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(ACC03[1], file=paste("Sent",s,"ACC03.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(ACC04[1], file=paste("Sent",s,"ACC04.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(ACC05[1], file=paste("Sent",s,"ACC05.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  write.table(FD[1], file=paste("Sent",s,"FD.txt", sep = ""), row.names = FALSE, col.names = FALSE)
  
}