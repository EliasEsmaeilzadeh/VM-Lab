%% EyeTrace Details
% Eye Trace plot from EventTimeMatrix 
% Event Time Data Will Save in current Folder
% Written by Elias Esmaeilzadeh (V.M. Lab)(EliasEsmaeilzadeh@mail.um.ac.ir)
% Thanks to Seyed Javad Saghravanian (V.M. Lab)(saghravanian@mail.um.ac.ir)

% Version 1  10/25/2021

%% import data
X_EyeSignal = importdata ('D_X_EyeSignal.mat');
Y_EyeSignal = importdata ('D_Y_EyeSignal.mat');
EventTimeMatrix = importdata ('EventTimeMatrix.mat');
PD_Time = importdata ('PD_Time.mat');
%% Pre-allocation
X_Vector = NaN(1,1);
Y_Vector = NaN(1,1);
TrialNum=1;
FirstPD=1;
FirstTargetTime=NaN;
A=NaN;
%% PD 1st Time Alignment
while TrialNum <= length(EventTimeMatrix)
    if ~isnan (EventTimeMatrix(7,TrialNum))
        FirstTargetTime = floor(EventTimeMatrix(7,TrialNum));
        break
    end
    TrialNum=TrialNum+1;
end
%[row, column] = find (PD_Time==1);
while FirstPD <= length(PD_Time)
    if PD_Time(FirstPD) == 1
        break
    end
    FirstPD=FirstPD+1;
end

Difference= FirstPD - FirstTargetTime;
%% Main
figure('Name','Eye Trace X','NumberTitle','off');
% ax= subplot(2,1,1);
hold on
TrialNum=1;
while TrialNum <=  length(EventTimeMatrix)
    if EventTimeMatrix(13,TrialNum) == 1
        TrialTime = floor(EventTimeMatrix(7,TrialNum))+ Difference ;
        ii=1;
        for ii = ii:1700
            T = find (PD_Time(TrialTime + ii-1000) ==1);
            if T == 1
                A = TrialTime;
                aa=1;
                for aa= aa:4000
                    X_Vector(aa) = X_EyeSignal(A+aa-1000);
                end
                break
            end
        end
        
        plot(X_Vector);
        xline(1000);
        ylim([1,3]);
        
        
    end
    TrialNum=TrialNum+1;
end

hold off
figure('Name','Eye Trace Y','NumberTitle','off');
% ax= subplot(2,1,2);
hold on
TrialNum=1;
while TrialNum <=  length(EventTimeMatrix)
    if EventTimeMatrix(13,TrialNum) == 1 %&& EventTimeMatrix(2,m)== 5
        TrialTime = floor(EventTimeMatrix(7,TrialNum))+ Difference;
        ii=1;
        for ii = ii:1700
            T = find (PD_Time(TrialTime + ii-1000) ==1);
            if T == 1
                A = TrialTime;
                aa=1;
                for aa= aa:4000
                    Y_Vector(aa) = Y_EyeSignal(A+aa-1000);
                end
                break
            end
        end
        
        plot(Y_Vector);
        xline(1000);
        ylim([1,3]);
    end
    TrialNum=TrialNum+1;
end



