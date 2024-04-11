% pos_C0_B = 3x1
% R_BC = 3x3
% dims = 1x3
function [pos_fc_B, outward_norms_B, areas] = geom_params(pos_C0_B,R_BC,dims)
M_fc = [.5 .5 0;
    .5 0 .5;
    0 .5 .5;
    .5 .5 1;
    .5 1 .5;
    1 .5 .5;
    ]; % face center matrix
outward_norms_C = [0 0 -1;
    0 -1 0;
    -1 0 0;
    0 0 1;
    0 1 0;
    1 0 0]; 

pos_fc_C = M_fc * diag(dims);

pos_fc_B = repmat(pos_C0_B',6,1) + (R_BC * pos_fc_C')';
outward_norms_B = (R_BC * outward_norms_C')';
areas = [dims(1)*dims(2) dims(1)*dims(3) dims(2)*dims(3) dims(1)*dims(2) dims(1)*dims(3) dims(2)*dims(3)]';

