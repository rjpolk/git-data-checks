#Missing Data Check for AOL
#
#this script checks for missing files on hipergator for the AOL project.
#subIDs should be updated each time you need to run this script.
#new files will be created each time this is run based on the subIDs listed.
#
#this checks for the following data:
#audio recordings (SAFER and debriefing)
#FACE task (behavioral and eyetracking)
#FrACT 
#interoception (main task data, volume calibration data, and biopac data)
#lie video task (main task data and biopac data)
#OSPAN task
#
#MRI data checking script is separate -- located in AOL_MRI/code 
#
#BP 7/30/2020
 


# BEFORE RUNNING SCRIPT, make sure the directories (below) are correct

#setting directories
main_dir=/orange/ebner/share/studies_in_progress/AOL

save_dir=/orange/ebner/share/studies_in_progress/AOL/data_checks

audio_dir=/orange/ebner/share/studies_in_progress/AOL/audio_recordings
face_dir=/orange/ebner/share/studies_in_progress/AOL/physio_sessions/face_task
fract_dir=/orange/ebner/share/studies_in_progress/AOL/physio_sessions/fract_task
interoception_dir=/orange/ebner/share/studies_in_progress/AOL/physio_sessions/interoception_task
video_dir=/orange/ebner/share/studies_in_progress/AOL/physio_sessions/lie_video_task
ospan_dir=/orange/ebner/share/studies_in_progress/AOL/physio_sessions/ospan_task

#setting file name for output of script. update date
save_name_present='physio_present_8_2_20.xls'
save_name_missing='physio_missing_8_2_20.xls'

#removing txt outputs from previous times this script was run. 
rm $save_dir/txt/*

#create headers for output files

echo "SAFER recordings" >> $save_dir/txt/'safer_present_files.txt'
echo "SAFER recordings" >> $save_dir/txt/'safer_missing_files.txt'

echo "debriefing recordings" >> $save_dir/txt/'debrief_present_files.txt'
echo "debriefing recordings" >> $save_dir/txt/'debrief_missing_files.txt'

echo "FACE run 1 edf" >> $save_dir/txt/'face_run1_present_files_edf.txt'
echo "FACE run 1 edf" >> $save_dir/txt/'face_run1_missing_files_edf.txt'

echo "FACE run 2 edf" >> $save_dir/txt/'face_run2_present_files_edf.txt'
echo "FACE run 2 edf" >> $save_dir/txt/'face_run2_missing_files_edf.txt'

echo "FACE run 1 behavioral" >> $save_dir/txt/'face_run1_present_files_results.txt'
echo "FACE run 1 behavioral" >> $save_dir/txt/'face_run1_missing_files_results.txt'

echo "FACE run 2 behavioral" >> $save_dir/txt/'face_run2_present_files_results.txt'
echo "FACE run 2 behavioral" >> $save_dir/txt/'face_run2_missing_files_results.txt'

echo "FrACT" >> $save_dir/txt/'fract_present_files.txt'
echo "FrACT" >> $save_dir/txt/'fract_missing_files.txt'

echo "Interoception main task edat" >> $save_dir/txt/'interoception_present_files_maintask_edat.txt'
echo "Interoception main task edat" >> $save_dir/txt/'interoception_missing_files_maintask_edat.txt'

echo "Interoception main task txt" >> $save_dir/txt/'interoception_present_files_maintask_txt.txt'
echo "Interoception main task txt" >> $save_dir/txt/'interoception_missing_files_maintask_txt.txt'

echo "Interoception vol calib edat" >> $save_dir/txt/'interoception_present_files_volcalib_edat.txt'
echo "Interoception vol calib edat" >> $save_dir/txt/'interoception_missing_files_volcalib_edat.txt'

echo "Interoception vol calib txt" >> $save_dir/txt/'interoception_present_files_volcalib_txt.txt'
echo "Interoception vol calib txt" >> $save_dir/txt/'interoception_missing_files_volcalib_txt.txt'

echo "Interoception biopac" >> $save_dir/txt/'interoception_present_files_biopac.txt'
echo "Interoception biopac" >> $save_dir/txt/'interoception_missing_files_biopac.txt'

echo "video run 1 behavioral" >> $save_dir/txt/'video_present_files_run1.txt'
echo "video run 1 behavioral" >> $save_dir/txt/'video_missing_files_run1.txt'

echo "video run 2 behavioral" >> $save_dir/txt/'video_present_files_run2.txt'
echo "video run 2 behavioral" >> $save_dir/txt/'video_missing_files_run2.txt'

echo "video biopac" >> $save_dir/txt/'video_present_files_biopac.txt'
echo "video biopac" >> $save_dir/txt/'video_missing_files_biopac.txt'

echo "ospan edat" >> $save_dir/txt/'ospan_present_files_edat.txt'
echo "ospan edat" >> $save_dir/txt/'ospan_missing_files_edat.txt'

echo "ospan txt" >> $save_dir/txt/'ospan_present_files_txt.txt'
echo "ospan txt" >> $save_dir/txt/'ospan_missing_files_txt.txt'


#list subjects to loop here. Check google calendar to see which SV sessions have been added.
#re-run all participants each time
for sub in 131001 131002 132001 111111
 

do



###
#AUDIO RECORDINGS
###

#SAFER recordings
folder=SAFER_recordings

if
  [ -f $audio_dir/${folder}/${sub}_* ]; then
  echo "${sub}" >> $save_dir/txt/'safer_present_files.txt'
else
  echo "${sub}" >> $save_dir/txt/'safer_missing_files.txt'
fi

#debriefing recordings
folder=debriefing_recordings

if
  [ -f $audio_dir/${folder}/${sub}_* ]; then
  echo "${sub}" >> $save_dir/txt/'debrief_present_files.txt'
else
  echo "${sub}" >> $save_dir/txt/'debrief_missing_files.txt'
fi



###
#FACE TASK
###

#edf file run 1
folder=${sub}_1

if
  [ -f $face_dir/${folder}/${sub}_1.edf ]; then
  echo "${sub}" >> $save_dir/txt/'face_run1_present_files_edf.txt'
else
  echo "${sub}" >> $save_dir/txt/'face_run1_missing_files_edf.txt'
fi

#edf file run 2
folder=${sub}_2

if
  [ -f $face_dir/${folder}/${sub}_2.edf ]; then
  echo "${sub}" >> $save_dir/txt/'face_run2_present_files_edf.txt'
else
  echo "${sub}" >> $save_dir/txt/'face_run2_missing_files_edf.txt'
fi

#results file run 1
folder=${sub}_1

if
  [ -f $face_dir/${folder}/'RESULTS_FILE.txt' ]; then
  echo "${sub}" >> $save_dir/txt/'face_run1_present_files_results.txt'
else
  echo "${sub}" >> $save_dir/txt/'face_run1_missing_files_results.txt'
fi

#results file run 2
folder=${sub}_2

if
  [ -f $face_dir/${folder}/'RESULTS_FILE.txt' ]; then
  echo "${sub}" >> $save_dir/txt/'face_run2_present_files_results.txt'
else
  echo "${sub}" >> $save_dir/txt/'face_run2_missing_files_results.txt'
fi



###
#FrACT TASK
###

if
  [ -f $fract_dir/${sub}.txt ]; then
  echo "${sub}" >> $save_dir/txt/'fract_present_files.txt'
else
  echo "${sub}" >> $save_dir/txt/'fract_missing_files.txt'
fi



###
#INTEROCEPTION TASK
###

#main task behavioral data edat
folder=main_task_behavioral

if
  [ -f $interoception_dir/${folder}/*${sub}*.edat3 ]; then
  echo "${sub}" >> $save_dir/txt/'interoception_present_files_maintask_edat.txt'
else
  echo "${sub}" >> $save_dir/txt/'interoception_missing_files_maintask_edat.txt'
fi

#main task behavioral data txt
folder=main_task_behavioral

if
  [ -f $interoception_dir/${folder}/*${sub}*.txt ]; then
  echo "${sub}" >> $save_dir/txt/'interoception_present_files_maintask_txt.txt'
else
  echo "${sub}" >> $save_dir/txt/'interoception_missing_files_maintask_txt.txt'
fi

#volume calibration behavioral data edat
folder=volume_calibration_behavioral

if
  [ -f $interoception_dir/${folder}/*${sub}*.edat3 ]; then
  echo "${sub}" >> $save_dir/txt/'interoception_present_files_volcalib_edat.txt'
else
  echo "${sub}" >> $save_dir/txt/'interoception_missing_files_volcalib_edat.txt'
fi

#volume calibration behavioral data txt
folder=volume_calibration_behavioral

if
  [ -f $interoception_dir/${folder}/*${sub}*.txt ]; then
  echo "${sub}" >> $save_dir/txt/'interoception_present_files_volcalib_txt.txt'
else
  echo "${sub}" >> $save_dir/txt/'interoception_missing_files_volcalib_txt.txt'
fi

#biopac data
folder=BioPac

if
  [ -f $interoception_dir/${folder}/*_${sub}*.acq ]; then
  echo "${sub}" >> $save_dir/txt/'interoception_present_files_biopac.txt'
else
  echo "${sub}" >> $save_dir/txt/'interoception_missing_files_biopac.txt'
fi



###
#LIE VIDEO TASK
###

#behavioral data run 1
folder=behavioral

if
  [ -f $video_dir/${folder}/${sub}_1/'RESULTS_FILE.txt' ]; then
  echo "${sub}" >> $save_dir/txt/'video_present_files_run1.txt'
else
  echo "${sub}" >> $save_dir/txt/'video_missing_files_run1.txt'
fi

#behavioral data run 2
folder=behavioral

if
  [ -f $video_dir/${folder}/${sub}_2/'RESULTS_FILE.txt' ]; then
  echo "${sub}" >> $save_dir/txt/'video_present_files_run2.txt'
else
  echo "${sub}" >> $save_dir/txt/'video_missing_files_run2.txt'
fi

#biopac data
folder=BioPac

if
  [ -f $video_dir/${folder}/*_${sub}*.acq ]; then
  echo "${sub}" >> $save_dir/txt/'video_present_files_biopac.txt'
else
  echo "${sub}" >> $save_dir/txt/'video_missing_files_biopac.txt'
fi



###
#OPSAN TASK
###

#this task has subIDs with . in the middle, so subIDs have to be cut and put together
#example: 123456 becomes 123.456
ospan_sub1="$(echo ${sub} | cut -c1-3 )"
ospan_sub2="$(echo ${sub} | cut -c4-6 )"

#edat data file
if
  [ -f $ospan_dir/*"${ospan_sub1}.${ospan_sub2}"*.edat3 ]; then
  echo "${sub}" >> $save_dir/txt/'ospan_present_files_edat.txt'
else
  echo "${sub}" >> $save_dir/txt/'ospan_missing_files_edat.txt'
fi

#text data file
if
  [ -f $ospan_dir/*"${ospan_sub1}.${ospan_sub2}"*.txt ]; then
  echo "${sub}" >> $save_dir/txt/'ospan_present_files_txt.txt'
else
  echo "${sub}" >> $save_dir/txt/'ospan_missing_files_txt.txt'
fi


done

#saving the txt files as one big excel file
paste $save_dir/txt/*present*.txt > $save_dir/$save_name_present
paste $save_dir/txt/*missing*.txt > $save_dir/$save_name_missing

