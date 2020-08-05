#Missing Data Check for AOL MRI sessions
#
#this script checks for missing raw files on hipergator for the AOL project.
#subIDs should be updated each time you need to run this script.
#this is specifically for the MRI components of the study
#files saved 
#
#this checks for the following data:
#T1
#resting state fMRI
#FACE task run 1
#FACE task run 2
#video task run 1
#video task run 2
#b1 60
#b1 120
#diff AP
#diff PA
#t2 FLAIR 1
#t2 FLAIR 2
#
#
#the general missing check is located in /AOL/code 
#
#BP 7/30/2020


# BEFORE RUNNING SCRIPT, make sure the set up (below) is correct

#setting file name for output of script. update date
save_name_complete='MRI_present_8_2_20.xls'
save_name_missing='MRI_missing_8_2_20.xls'

save_dir=/orange/ebner/share/studies_in_progress/AOL/data_checks

#removing txt outputs from previous times this script was run. 
rm $save_dir/txt/*

t1_dir=T1_MPRAGE_SAG* 
rest_dir=*RSFMRI*MULTI* 
face_dir_run1=FACE1* 
face_dir_run2=FACE2* 
video_dir_run1=VIDEO1* 
video_dir_run2=VIDEO2* 
b1_60_dir=*B1_MAP* 
b1_120_dir=*B1_MAP* 
diff_AP_dir=*DIFF_*PA* 
diff_PA_dir=*DIFF_*AP* 
t2_dir_flair1=T2*FLAIR_0* 
t2_dir_flair2=T2*FLAIR_ORIG* 

#create headers for output files
echo "T1" >> $save_dir/txt/'complete_files_t1.txt'
echo "T1" >> $save_dir/txt/'missing_files_t1.txt'

echo "RS" >> $save_dir/txt/'complete_files_rs.txt'
echo "RS" >> $save_dir/txt/'missing_files_rs.txt'

echo "Face run 1" >> $save_dir/txt/'complete_files_face1.txt'
echo "Face run 1" >> $save_dir/txt/'missing_files_face1.txt'

echo "Face run 2" >> $save_dir/txt/'complete_files_face2.txt'
echo "Face run 2" >> $save_dir/txt/'missing_files_face2.txt'

echo "Video run 1" >> $save_dir/txt/'complete_files_video1.txt'
echo "Video run 1" >> $save_dir/txt/'missing_files_video1.txt'

echo "Video run 2" >> $save_dir/txt/'complete_files_video2.txt'
echo "Video run 2" >> $save_dir/txt/'missing_files_video2.txt'

echo "b1 60" >> $save_dir/txt/'complete_files_b1_60.txt'
echo "b1 60" >> $save_dir/txt/'missing_files_b1_60.txt'

echo "b1 120" >> $save_dir/txt/'complete_files_b1_120.txt'
echo "b1 120" >> $save_dir/txt/'missing_files_b1_120.txt'

echo "diff AP" >> $save_dir/txt/'complete_files_diff_AP.txt'
echo "diff AP" >> $save_dir/txt/'missing_files_diff_AP.txt'

echo "diff PA" >> $save_dir/txt/'complete_files_diff_PA.txt'
echo "diff PA" >> $save_dir/txt/'missing_files_diff_PA.txt'

echo "flair 1" >> $save_dir/txt/'complete_files_flair1.txt'
echo "flair 1" >> $save_dir/txt/'missing_files_flair1.txt'

echo "flair 2" >> $save_dir/txt/'complete_files_flair2.txt'
echo "flair 2" >> $save_dir/txt/'missing_files_flair2.txt'

#list NEW subjects to loop here
for sub in 111001 132002 111111
do

#setting directories
behavioral_dir=/orange/ebner/share/studies_in_progress/AOL/AOL_MRI/sourcedata/behavioral_data
scan_dir=/orange/ebner/share/studies_in_progress/AOL/AOL_MRI/sourcedata/scan_data
sub_dir=AOL_MRI_${sub}/AOL_MRI_${sub}_AOL_MRI_${sub}/EBNER_BRAINHEALTH*



###
#T1 scan
###

end=192 #number of dicoms expected

[ -f $scan_dir/$sub_dir/$t1_dir/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'complete_files_t1.txt'

[ ! -f $scan_dir/$sub_dir/$t1_dir/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'missing_files_t1.txt'


###
#resting state fMRI
###

end=1812 #number of dicoms expected

[ -f $scan_dir/$sub_dir/$rest_dir/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'complete_files_rs.txt'

[ ! -f $scan_dir/$sub_dir/$rest_dir/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'missing_files_rs.txt'


###
#face task fMRI run 1
###

end=1518 #number of dicoms expected

[ -f $scan_dir/$sub_dir/$face_dir_run1/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'complete_files_face1.txt'

[ ! -f $scan_dir/$sub_dir/$face_dir_run1/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'missing_files_face1.txt'


###
#face task fMRI run 2
###

end=1518 #number of dicoms expected

[ -f $scan_dir/$sub_dir/$face_dir_run2/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'complete_files_face2.txt'

[ ! -f $scan_dir/$sub_dir/$face_dir_run2/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'missing_files_face2.txt'

###
#video task fMRI run 1
###

end=1260 #number of dicoms expected

[ -f $scan_dir/$sub_dir/$video_dir_run1/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'complete_files_video1.txt'

[ ! -f $scan_dir/$sub_dir/$video_dir_run1/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'missing_files_video1.txt'


###
#video task fMRI run 2
###

end=1260 #number of dicoms expected

[ -f $scan_dir/$sub_dir/$video_dir_run2/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'complete_files_video2.txt'

[ ! -f $scan_dir/$sub_dir/$video_dir_run2/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'missing_files_video2.txt'



###
#b1_60 fieldmap
###

end=18 #number of dicoms expected

[ -f $scan_dir/$sub_dir/$b1_60_dir/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'complete_files_b1_60.txt'

[ ! -f $scan_dir/$sub_dir/$b1_60_dir/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'missing_files_b1_60.txt'

###
#b1_120 fieldmap
###

end=18 #number of dicoms expected

[ -f $scan_dir/$sub_dir/$b1_120_dir/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'complete_files_b1_120.txt'

[ ! -f $scan_dir/$sub_dir/$b1_120_dir/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'missing_files_b1_120.txt'

###
#diffusion AP scan
###

end=109 #number of dicoms expected

[ -f $scan_dir/$sub_dir/$diff_AP_dir/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'complete_files_diff_AP.txt'

[ ! -f $scan_dir/$sub_dir/$diff_AP_dir/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'missing_files_diff_AP.txt'

###
#diffusion PA scan
###

end=405 #number of dicoms expected

[ -f $scan_dir/$sub_dir/$diff_PA_dir/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'complete_files_diff_PA.txt'

[ ! -f $scan_dir/$sub_dir/$diff_PA_dir/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'missing_files_diff_PA.txt'

###
#t2 FLAIR scan
###

end=60 #number of dicoms expected

[ -f $scan_dir/$sub_dir/$t2_dir_flair1/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'complete_files_flair1.txt'

[ ! -f $scan_dir/$sub_dir/$t2_dir_flair1/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'missing_files_flair1.txt'

###
#t2 FLAIR scan
###

end=60 #number of dicoms expected

[ -f $scan_dir/$sub_dir/$t2_dir_flair2/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'complete_files_flair2.txt'

[ ! -f $scan_dir/$sub_dir/$t2_dir_flair2/*${sub}'.MR.EBNER_BRAINHEALTH.'*${end}'.2020.'*.IMA ] && echo "${sub}" >> $save_dir/txt/'missing_files_flair2.txt'


done

#saving the txt files as one big excel file
paste $save_dir/txt/complete*.txt > $save_dir/$save_name_complete
paste $save_dir/txt/missing*.txt > $save_dir/$save_name_missing