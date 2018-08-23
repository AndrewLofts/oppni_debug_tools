% Checking PIPELINE1 and RUNANALYSIS WRAPPER IO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i = 703;
% File 10(66)
for i  = 1:1024
filename = ['/global/home/hpc4253/trials_oppni/YNG-REC-FULL90_RunsM/processing_YNG-REC-test90_RunsM_inOctave_LDA_task_A-baseline/job_files/_session1_ID4827_run3Outtemp_indx_' num2str(i) '.mat'];
    M = load(filename);
filename = ['/global/home/hpc4253/trials_oppni/YNG-REC-FULL90_inOctave/processing_YNG-REC-test90_inOctave_LDA_task_A-baseline/job_files/_session1_ID4827_run3Outtemp_indx_' num2str(i) '.mat'];
    O = load(filename);

%INPUT
C(i) = any(find((M.vol_filt - O.vol_filt) >= 0.001));

D(i) = any(find((M.split_info.design_mat - O.split_info.design_mat) >= 0.001));
E(i) = any(find((M.split_info.baseline - O.split_info.baseline) >= 0.001));
F(i) = any(find((M.split_info.NN_weight_avg - O.split_info.NN_weight_avg) >= 0.001));
G(i) = any(find((M.split_info.WM_weight_avg - O.split_info.WM_weight_avg) >= 0.001));
H(i) = any(find((M.split_info.NN_mask_avg - O.split_info.NN_mask_avg) >= 0.001));
I(i) = any(find((M.split_info.WM_mask_avg - O.split_info.WM_mask_avg) >= 0.001));
J(i) = any(find((M.split_info.FXYZ_avg - O.split_info.FXYZ_avg) >= 0.001));
K(i) = any(find((M.split_info.spat_weight - O.split_info.spat_weight) >= 0.001));
L(i) = any(find((M.split_info.mask_vol - O.split_info.mask_vol) >= 0.001));
N(i) = any(find((M.split_info.idx_cond1_sp1 - O.split_info.idx_cond1_sp1) >= 0.001));
P(i) = any(find((M.split_info.idx_cond1_sp2 - O.split_info.idx_cond1_sp2) >= 0.001));
Q(i) = any(find((M.split_info.idx_cond2_sp1 - O.split_info.idx_cond2_sp1) >= 0.001));
R(i) = any(find((M.split_info.idx_cond2_sp2 - O.split_info.idx_cond2_sp2) >= 0.001));

disp(i); 

%OUTPUT
S(i) = any(find((M.output_temp.images - O.output_temp.images) >= 0.001));

T(i) = any(find((M.output_temp.metrics.R - O.output_temp.metrics.R) >= 0.001));
U(i) = any(find((M.output_temp.metrics.P - O.output_temp.metrics.P) >= 0.001));            %!
V(i) = any(find((M.output_temp.metrics.dPR - O.output_temp.metrics.dPR) >= 0.001));         %!
W(i) = any(find((M.output_temp.metrics.Acc - O.output_temp.metrics.Acc) >= 0.001));          %!

X(i) = any(find((M.output_temp.temp.CV_ref - O.output_temp.temp.CV_ref) >= 0.001));
Y(i) = any(find((M.output_temp.temp.CV_alt - O.output_temp.temp.CV_alt) >= 0.001));
Z(i) = any(find((M.output_temp.temp.CV_alt_varfract - O.output_temp.temp.CV_alt_varfract) >= 0.001));


end



%Gathering I/O
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath(genpath('/global/home/hpc4253/oppni-0.7.3.1_06JUL2017/'))
addpath(genpath('/global/home/hpc4253/octave/'))

addpath(genpath('/home/adlofts/Documents/Octave_Testing/oppni_octave_git'))

%INMATLAB
i = 703;
filename = ['/global/home/hpc4253/trials_oppni/YNG-REC-FULL90_RunsM/processing_YNG-REC-test90_RunsM_inOctave_LDA_task_A-baseline/job_files/_session1_ID4827_run3Outtemp_indx_' num2str(i) '.mat'];
    M = load(filename);
    output_temp_M = run_analyses_wrapper(M.vol_filt,M.split_info,'LDA');
savename = ['/global/home/hpc4253/trials_oppni/_session1_ID4827_run3Outtemp_indx_' num2str(i) '_Matlab.mat'];
save(savename,'output_temp_M');


%INOCTAVE
i = 703;
filename = ['/global/home/hpc4253/trials_oppni/YNG-REC-FULL90_inOctave/processing_YNG-REC-test90_inOctave_LDA_task_A-baseline/job_files/_session1_ID4827_run3Outtemp_indx_' num2str(i) '.mat'];
    O = load(filename);
    output_temp_O = run_analyses_wrapper(O.vol_filt,O.split_info,'LDA');
savename = ['/global/home/hpc4253/trials_oppni/_session1_ID4827_run3Outtemp_indx_' num2str(i) '_Octave.mat'];
save(savename,'output_temp_O');



%INOCTAVE LOCAL
i = 703;
filename = ['/home/adlofts/Documents/Octave_Testing/LDA_saves/_session1_ID4827_run3Outtemp_indx_' num2str(i) '.mat'];
    O = load(filename);
    output_temp_O = run_analyses_wrapper(O.vol_filt,O.split_info,'LDA');
savename = ['/home/adlofts/Documents/Octave_Testing/LDA_saves/_session1_ID4827_run3Outtemp_indx_' num2str(i) '_Octave.mat'];
save(savename,'output_temp_O');

%??? CHECKS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


NNw_M = M.split_info_set{1,1}.NN_weight_avg;
WNw_M = M.split_info_set{1,1}.WM_weight_avg;
NNm_M = M.split_info_set{1,1}.NN_mask_avg;
WMm_M = M.split_info_set{1,1}.WM_mask_avg;
FXYZa_M = M.split_info_set{1,1}.FXYZ_avg;
SW_M = M.split_info_set{1,1}.spat_weight;
MV_M = M.split_info_set{1,1}.mask_vol;
Xn_M = Xnoise{1,1};
Xs_M = Xsignal{1,1};

NNw_O = split_info_set{1,1}.NN_weight_avg;
WNw_O = split_info_set{1,1}.WM_weight_avg;
NNm_O = split_info_set{1,1}.NN_mask_avg;
WMm_O = split_info_set{1,1}.WM_mask_avg;
FXYZa_O = split_info_set{1,1}.FXYZ_avg;
SW_O = split_info_set{1,1}.spat_weight;
MV_O = split_info_set{1,1}.mask_vol;
Xn_O = Xnoise{1,1};
Xs_O = Xsignal{1,1};



%Checking MODULE LDA IO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M = load("module_LDA_io_M.mat");
O = load("module_LDA_io_O.mat");
%INPUT
A = any(find((M.datamat - O.datamat) >= 0.001));
D = any(find((M.split_info.design_mat - O.split_info.design_mat) >= 0.001));
E = any(find((M.split_info.baseline - O.split_info.baseline) >= 0.001));
F = any(find((M.split_info.NN_weight_avg - O.split_info.NN_weight_avg) >= 0.001));
G = any(find((M.split_info.WM_weight_avg - O.split_info.WM_weight_avg) >= 0.001));
H = any(find((M.split_info.NN_mask_avg - O.split_info.NN_mask_avg) >= 0.001));
I = any(find((M.split_info.WM_mask_avg - O.split_info.WM_mask_avg) >= 0.001));
J = any(find((M.split_info.FXYZ_avg - O.split_info.FXYZ_avg) >= 0.001));
K = any(find((M.split_info.spat_weight - O.split_info.spat_weight) >= 0.001));
L = any(find((M.split_info.mask_vol - O.split_info.mask_vol) >= 0.001));
N = any(find((M.split_info.idx_cond1_sp1 - O.split_info.idx_cond1_sp1) >= 0.001));
P = any(find((M.split_info.idx_cond1_sp2 - O.split_info.idx_cond1_sp2) >= 0.001));
Q = any(find((M.split_info.idx_cond2_sp1 - O.split_info.idx_cond2_sp1) >= 0.001));
R = any(find((M.split_info.idx_cond2_sp2 - O.split_info.idx_cond2_sp2) >= 0.001));
%OUTPUT
S = any(find((M.output.images - O.output.images) >= 0.001));
T = any(find((M.output.metrics.R - O.output.metrics.R) >= 0.001));
U = any(find((M.output.metrics.P - O.output.metrics.P) >= 0.001));            %!
V = any(find((M.output.metrics.dPR - O.output.metrics.dPR) >= 0.001));         %!
W = any(find((M.output.metrics.Acc - O.output.metrics.Acc) >= 0.001));          %!
X = any(find((M.output.temp.CV_ref - O.output.temp.CV_ref) >= 0.001));
Y = any(find((M.output.temp.CV_alt - O.output.temp.CV_alt) >= 0.001));
Z = any(find((M.output.temp.CV_alt_varfract - O.output.temp.CV_alt_varfract) >= 0.001));



%Checking LDA OPTIMIZATION IO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M = load("LDA_opt_io_M.mat");
O = load("LDA_opt_io_O.mat");

%INPUT
A = any(find((M.block_cond1_sp1 - O.block_cond1_sp1) >= 0.001));
B = any(find((M.block_cond1_sp2 - O.block_cond1_sp2) >= 0.001));
C = any(find((M.block_cond2_sp1 - O.block_cond2_sp1) >= 0.001));
D = any(find((M.block_cond2_sp2 - O.block_cond2_sp2) >= 0.001));
E = any(find((M.block_cond1_sp1 - O.block_cond1_sp1) >= 0.001));
F = any(find((M.block_cond1_sp1 - O.block_cond1_sp1) >= 0.001));

G = any(find((M.design1 - O.design1) >= 0.001));
H = any(find((M.design2 - O.design2) >= 0.001));

I = any(find((M.split_info.design_mat - O.split_info.design_mat) >= 0.001));
J = any(find((M.split_info.baseline - O.split_info.baseline) >= 0.001));
K = any(find((M.split_info.NN_weight_avg - O.split_info.NN_weight_avg) >= 0.001));
L = any(find((M.split_info.WM_weight_avg - O.split_info.WM_weight_avg) >= 0.001));
N = any(find((M.split_info.NN_mask_avg - O.split_info.NN_mask_avg) >= 0.001));
P = any(find((M.split_info.WM_mask_avg - O.split_info.WM_mask_avg) >= 0.001));
Q = any(find((M.split_info.FXYZ_avg - O.split_info.FXYZ_avg) >= 0.001));
R = any(find((M.split_info.spat_weight - O.split_info.spat_weight) >= 0.001));
S = any(find((M.split_info.mask_vol - O.split_info.mask_vol) >= 0.001));
T = any(find((M.split_info.idx_cond1_sp1 - O.split_info.idx_cond1_sp1) >= 0.001));
U = any(find((M.split_info.idx_cond1_sp2 - O.split_info.idx_cond1_sp2) >= 0.001));
V = any(find((M.split_info.idx_cond2_sp1 - O.split_info.idx_cond2_sp1) >= 0.001));
W = any(find((M.split_info.idx_cond2_sp2 - O.split_info.idx_cond2_sp2) >= 0.001));

%OUTPUT
X = any(find((M.results.R - O.results.R) >= 0.001));                   
Y = any(find((M.results.P - O.results.P) >= 0.001));                   %!
Z = any(find((M.results.Acc - O.results.Acc) >= 0.001));               %!
AA = any(find((M.results.eig - O.results.eig) >= 0.001));
AB = any(find((M.results.CV - O.results.CV) >= 0.001));

AC = any(find((M.results.OPT.CV - O.results.OPT.CV) >= 0.001));
AD = any(find((M.results.OPT.RPD - O.results.OPT.RPD) >= 0.001));       %!
AE = any(find((M.results.OPT.eig - O.results.OPT.eig) >= 0.001));

AF = any(find((M.results.OPT.CV - O.results.OPT.CV) >= 0.001));

AG = any(find((M.results.temp.pp1_2on1 - O.results.temp.pp1_2on1) >= 0.001));
AH = any(find((M.results.temp.pp2_2on1 - O.results.temp.pp2_2on1) >= 0.001));
AI = any(find((M.results.temp.sc1_2on1 - O.results.temp.sc1_2on1) >= 0.001));
AJ = any(find((M.results.temp.sc2_2on1 - O.results.temp.sc2_2on1) >= 0.001));
AK = any(find((M.results.temp.pp1_1on2 - O.results.temp.pp1_1on2) >= 0.001));
AL = any(find((M.results.temp.pp2_1on2 - O.results.temp.pp2_1on2) >= 0.001));
AM = any(find((M.results.temp.sc1_1on2 - O.results.temp.sc1_1on2) >= 0.001));
AN = any(find((M.results.temp.sc2_1on2 - O.results.temp.sc2_1on2) >= 0.001));



%Checking LDA OPTIMIZATION ON THE INSIDE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LOAD
M = load("LDA_sec3.3_M.mat");
O = load("LDA_sec3.3_O.mat");

vars = fieldnames(M);
for i  = 1:length(vars)
    diffs(i) = any(find(getfield(M,vars{i})-getfield(O,vars{i}) >= 0.001));
    if diffs(i)
        disp(vars{i});
    end
end


M = load("LDA_sec2.1_M.mat");
O = load("LDA_sec2.1_O.mat");



M = load("LDA_sec3.4.2_M.mat");
O = load("LDA_sec3.4.2_O.mat");







