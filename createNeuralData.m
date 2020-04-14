
load neural.mat
load neuraldata.mat
vG = get(logsout{1}.Values);
vM = get(logsout{2}.Values);
vG = vG.Data;
vM = vM.Data;
vB = abs(vG-vM) < 0.01;
vGT = cat(1,vGT,vG);
vMT = cat(1,vMT,vM);
vBT = cat(1,vBT,vB);
clear vG vM vB
save neuraldata.mat