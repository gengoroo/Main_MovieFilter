%MainManuDeepLearn
close all;
clear all;
fprintf('clear all executed\n');
mfn = mfilename('fullpath');
pn_top_m = fileparts(mfn);
%pn_Git = 'C:\Users\gengoro\Documents\GitHub';
rmpath(genpath(pn_top_m));% 全てのパスを削除

selector = input(['Select step 0:Generate MotionEncoder 1:Crop_set 2:MakeCC_GPU_nEncoder_OffAna_v2 3:ScanData 31: DeepLearnCC_search_Main 32: TransferTrain 4:voting \n...' ...
    '5:CrossClassify 6:Explore_vote 7:PCA ActivationAnalysis 8:Batch_guided_GradCAM map 85:Main_frame_finder' ...
    '9:Make_track_projection 10:Make Mov from Tif Cell culture 11:Make_single_imds']);
switch selector
    case 0
        fprintf('use GitHub\n');
        addpath('C:\Users\gengoro\Documents\GitHub\_0_MotionEncoder');
        Make_Movie_Filter;
    case 1
        fprintf('use GitHub\n');
        addpath('C:\Users\gengoro\Documents\GitHub\_1_Crop_set_final');
        Crop_main;
    case 2
        fprintf('use GitHub\n');
        addpath('C:\Users\gengoro\Documents\GitHub\_2_MakeCC_GPU_nEncoder_OffAna_v2');
        MakeCC_main
    case 20
        addpath([pn_top_m '\_2_MakeCC_final']);
        MakeCC_main
    case 21
        addpath([pn_top_m '\_2_MakeCC_final_nEncoder']);
        MakeCC_main
    case 22
        addpath([pn_top_m '\_2_MakeCC_flat']);
        MakeCC_main;
    case 23
        addpath([pn_top_m '\_2_MakeCC_RAMskip']);
        MakeCC_main;
    case 24
        addpath([pn_top_m '\_2_MakeCC_GPU']);
        MakeCC_main;
    case 25
        addpath([pn_top_m '\_2_MakeCC_GPU_parfor']);
        MakeCC_main;
    case 26
        addpath([pn_top_m '\_2_MakeCC_GPU_parfor_DS']);
        MakeCC_main;
    case 3
        fprintf('use GitHub\n');
        addpath('C:\Users\gengoro\Documents\GitHub\_3_DeepLearnCC_search_alpha3_stride\ScanData');
        mode_sect = input('1:double batch 2:batch 3:single');
        switch mode_sect
            case 1
                Plot_train_doublebatch;
            case 2
                Plot_train_batch;
            case 3
                Plot_train;
        end
        Main_DeepLearn;
    case 31
        fprintf('use GitHub\n');
        addpath('C:\Users\gengoro\Documents\GitHub\_3_DeepLearnCC_search_alpha3_stride');
        DeepLearnCC_search_Main;
    case 32
        fprintf('use GitHub\n');
        addpath('C:\Users\gengoro\Documents\GitHub\_3_TransferTrain');
        Main_Googlenet;
    case 33
        addpath([pn_top_m '\_3_DeepLearn_final\9Slice']);
        Main_DeepLearn;
    case 4
        addpath([pn_top_m '\_4_vote_final']);
        Main_vote;
    case 5
        addpath([pn_top_m '\_5_Cross_classify']);
        Main_Cross_classify;
    case 6
        addpath([pn_top_m '\_4_vote_final\explore']);
        Explore_vote;
    case 7
        addpath([pn_top_m '\_6_Activation_analysis']);
        ActivationAnalysis;
    case 8
        addpath([pn_top_m '\_6_Activation_analysis']);
        Batch_guided_GradCAM;
    case 85
        addpath([pn_top_m '\_7_gradCAD_frame_finder']);
        Main_frame_finder;
    case 9
        addpath([pn_top_m '\_8_object_track']);
        Make_track_projection;
    case 10
        addpath([pn_top_m '\_9_TifOrganizer']);
        TifOrganizer;
    case 11
        addpath([pn_top_m '\_2_MakeCC_final\Make_Single_imds_from_mat']);
        select2 = input('1:Make_single_var_imds_from_CC_hyper_stack 2: hyper 3: rev_hyper, def=2');
        switch select2
            case 1
                Make_single_var_imds_from_CC_hyper_stack;
            case 2
                Make_single_imds_from_CC_hyper_stack;
            case 3
                Make_single_var_imds_from_CC_hyper_stack;
        end
end
