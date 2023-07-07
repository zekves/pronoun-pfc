for subj in 01 02 03 04 06 07 08 10 11 12 13 14 15 16 17 18 19 20
do

gname=ST

# run afni_proc.py to create a single subject processing script
afni_proc.py -subj_id ST"$subj"                                      \
        -script proc.ST"$subj" -scr_overwrite                        \
        -blocks blur mask scale regress \
        -copy_anat /Users/ekves/Desktop/PronounRedo/fmriprep/sub-"$subj"PR/anat/sub-"$subj"PR_space-MNI152NLin2009cAsym_desc-preproc_T1w.nii.gz    \
        -dsets                                                   \
            /Users/ekves/Desktop/PronounRedo/fmriprep/sub-"$subj"PR/func/sub-"$subj"PR_task-Stroop_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz \
        -tcat_remove_first_trs 4                                \
        -blur_size 8.0                                           \
        -regress_stim_times                                      \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/"$subj"WordConf.txt                                    \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/"$subj"WordNeut.txt                         \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/Stroop"$subj"ACC00.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/Stroop"$subj"ACC01.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/Stroop"$subj"ACC02.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/Stroop"$subj"ACC03.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/Stroop"$subj"ACC04.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/Stroop"$subj"ACC05.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/Stroop"$subj"FD.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/Stroop"$subj"rotX.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/Stroop"$subj"rotY.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/Stroop"$subj"rotZ.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/Stroop"$subj"transX.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/Stroop"$subj"transY.txt                                   \
            /Users/ekves/Desktop/PronounRedo/code/StroopAtWord/Stroop"$subj"transZ.txt                                   \
        -regress_stim_labels                                     \
            Conf Neut ACC00 ACC01 ACC02 ACC03 ACC04 ACC05 FD rotx roty rotz transx transy transz                          \
        -regress_basis_multi GAM GAM \
        GAM GAM GAM GAM GAM GAM GAM GAM GAM GAM GAM GAM GAM                             \
        -regress_stim_types                                      \
            times times \
            file file file file file file file file file file file file file                     \
        -regress_opts_3dD                                        \
            -gltsym 'SYM: Conf -Neut' -glt_label 1 Conf-Neut -jobs 8            \
        -regress_reml_exec                                       \
        -regress_compute_fitts                                   \
        -regress_make_ideal_sum sum_ideal.1D                     \
        -regress_est_blur_epits                                  \
        -regress_est_blur_errts

done

