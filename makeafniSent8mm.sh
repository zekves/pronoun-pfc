for subj in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
do

gname=PR

# run afni_proc.py to create a single subject processing script
afni_proc.py -subj_id PR"$subj"                                      \
        -script proc.PR"$subj"                         \
        -blocks blur mask scale regress \
        -copy_anat /Users/ekves/Desktop/PronounRedo/fmriprep/sub-"$subj"PR/anat/sub-"$subj"PR_space-MNI152NLin2009cAsym_desc-preproc_T1w.nii.gz    \
        -dsets                                                   \
            /Users/ekves/Desktop/PronounRedo/fmriprep/sub-"$subj"PR/func/sub-"$subj"PR_task-Sent_run-01_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz \
            /Users/ekves/Desktop/PronounRedo/fmriprep/sub-"$subj"PR/func/sub-"$subj"PR_task-Sent_run-02_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz \
            /Users/ekves/Desktop/PronounRedo/fmriprep/sub-"$subj"PR/func/sub-"$subj"PR_task-Sent_run-03_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz \
            /Users/ekves/Desktop/PronounRedo/fmriprep/sub-"$subj"PR/func/sub-"$subj"PR_task-Sent_run-04_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz \
            /Users/ekves/Desktop/PronounRedo/fmriprep/sub-"$subj"PR/func/sub-"$subj"PR_task-Sent_run-05_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz \
        -tcat_remove_first_trs 11                                \
        -blur_size 8.0                                           \
        -regress_stim_times                                      \
            /Users/ekves/Desktop/PronounRedo/code/Sent/"$subj"C.txt                                    \
            /Users/ekves/Desktop/PronounRedo/code/Sent/"$subj"Imageability.txt                         \
            /Users/ekves/Desktop/PronounRedo/code/Sent/"$subj"MD.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/"$subj"MP.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/"$subj"SD.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/"$subj"SP.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/Sent"$subj"ACC00.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/Sent"$subj"ACC01.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/Sent"$subj"ACC02.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/Sent"$subj"ACC03.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/Sent"$subj"ACC04.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/Sent"$subj"ACC05.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/Sent"$subj"FD.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/Sent"$subj"rotX.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/Sent"$subj"rotY.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/Sent"$subj"rotZ.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/Sent"$subj"transX.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/Sent"$subj"transY.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/Sent/Sent"$subj"transZ.txt                                   \
        -regress_stim_labels                                     \
            C Imageability MD MP SD SP ACC00 ACC01 ACC02 ACC03 ACC04 ACC05 FD rotx roty rotz transx transy transz                          \
        -regress_basis_multi 'BLOCK(6,1)' 'BLOCK(6,1)' 'BLOCK(6,1)' 'BLOCK(6,1)' 'BLOCK(6,1)' 'BLOCK(6,1)' \
        GAM GAM GAM GAM GAM GAM GAM GAM GAM GAM GAM GAM GAM                             \
        -regress_stim_types                                      \
            times AM1 times times times times \
            file file file file file file file file file file file file file                     \
        -regress_opts_3dD                                        \
            -gltsym 'SYM: SD -MD' -glt_label 1 SD-MD             \
            -gltsym 'SYM: SP -MP' -glt_label 2 SP-MP -jobs 8            \
        -regress_reml_exec                                       \
        -regress_compute_fitts                                   \
        -regress_make_ideal_sum sum_ideal.1D                     \
        -regress_est_blur_epits                                  \
        -regress_est_blur_errts

done

