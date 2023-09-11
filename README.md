# pronoun-pfc
Contains sample scripts for analyses used in the Ekves (2022) dissertation.
As described in the dissertation, I show a 'change type' difference in brain activation for pronoun language but not when using repeated nouns. Our analysis focused on left prefrontal regions of the brain. This finding is strong conceptual support for the IOH (Altmann & Ekves, 2019) account of event processing. 
 
  ![Result](https://github.com/zekves/pronoun-pfc/assets/19574353/99cd3f74-7b84-47d1-b50f-7aeb3e731811)
<img width="1039" alt="Conf" src="https://github.com/zekves/pronoun-pfc/assets/19574353/cf8376d2-a872-43fd-938a-1e4a2ec8e4f8">

- motionfiles___.R files have scripts to extract fmriprep output and convert it into afni format first-level regressors.
- makeafni___8mm.sh files have scripts used to generate the first-level statistical analysis using afni (extracting individual beta coefficients/t-statistics for each condition).
- ROIStats.txt has functions used to generate an anatomical brain mask to use in ROI analysis and functions to extract brain activation from that mask.
- FullHPCStats.R script conducts significance testing of the brain data at the group level and generates a bar plot.

[Cognitive Neuroscience Society 2018 Poster on early related work: Instantiating new objects into the discourse](https://github.com/zekves/pronoun-pfc/blob/main/Ekves_CNS18_Final.pdf)
[Dissertation Defense Slides](https://github.com/zekves/pronoun-pfc/blob/main/Diss.pdf)
