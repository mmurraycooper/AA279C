theta = 45;
dims1 = [366.01 116.08 241.55];
pos_A_B = [0 0 0]';
R_BA = eye(3);

dims2 = [366.01 1.52 594.11];
pos_S1_B = [0 116.08 (241.55-12.7)]';
R_BS1 = [1 0 0; 
    0 sqrt(2)/2 sqrt(2)/2;
    0 -sqrt(2)/2 sqrt(2)/2];

dims3 = [366.01 1.52 594.11];
pos_S2_B = [0 -594.11*sind(theta) (12.7-594.11*cosd(theta))]';
R_BS2 = [1 0 0; 
    0 sqrt(2)/2 sqrt(2)/2;
    0 -sqrt(2)/2 sqrt(2)/2];

[pos_fc_B1, outward_norms_B1, areas1] = geom_params(pos_A_B,R_BA,dims1);
[pos_fc_B2, outward_norms_B2, areas2] = geom_params(pos_S1_B,R_BS1,dims2);
[pos_fc_B3, outward_norms_B3, areas3] = geom_params(pos_S2_B,R_BC2,dims3);


pos_fc_B = [pos_fc_B1; pos_fc_B2;pos_fc_B3];
figure
plot3(pos_fc_B1(:,1),pos_fc_B1(:,2),pos_fc_B1(:,3),'r.','MarkerSize',10)
hold on
plot3(pos_fc_B2(:,1),pos_fc_B2(:,2),pos_fc_B2(:,3),'g.','MarkerSize',10)
plot3(pos_fc_B3(:,1),pos_fc_B3(:,2),pos_fc_B3(:,3),'b.','MarkerSize',10)

for i = 1:3
    plot3(pos_fc_B1([i i+3],1),pos_fc_B1([i i+3],2),pos_fc_B1([i i+3],3),'k')
    plot3(pos_fc_B2([i i+3],1),pos_fc_B2([i i+3],2),pos_fc_B2([i i+3],3),'k')
    plot3(pos_fc_B3([i i+3],1),pos_fc_B3([i i+3],2),pos_fc_B3([i i+3],3),'k')
end
axis equal