%% Details
% Raster & PSTH plot for EventTimeMatrix 
% Event Time Data Will Save in current Folder
% Written by Elias Esmaeilzadeh (V.M. Lab)(EliasEsmaeilzadeh@mail.um.ac.ir)
% Thanks to Seyed Javad Saghravanian (V.M. Lab)(saghravanian@mail.um.ac.ir)

% Version 1  10/31/2021

%% import data %Plot
SpikeTime = importdata ('Spike_Time.mat');
EventTimeMatrix = importdata ('EventTimeMatrix.mat');
PD_Time = importdata ('PD_Time.mat');
%% Pre-allocation
TrialNum=1;
CounT=1;
TargetsTime = NaN(64,2);
PDsTime = NaN(64,1);
PDNum=1;
MinusRaster=300;
XVector=zeros(5,800);
Trial=1;
ColoR = ['r','g','b','c','m','k'];
COL=1;
Y=0;
%% PD Difference & Alignment
for TrialNum = 1:length(EventTimeMatrix)
    if ~isnan (EventTimeMatrix(7,TrialNum))
        TargetsTime(CounT,1) = TrialNum;
        TargetsTime(CounT,2) = floor(EventTimeMatrix(7,TrialNum));
        CounT=CounT+1;
    end
end
CounT=1;
while PDNum <= length(PD_Time)
    if PD_Time(PDNum) == 1
        PDsTime(CounT,1) = PDNum;
        CounT=CounT+1;
        PDNum=PDNum+2000;
    end
    PDNum=PDNum+1;
end
% Difference = PDsTime - TargetsTime(CounT,2);

%% Raster Plot
figure('Name','Raster','NumberTitle','off');
ylabel('Trial Number');
xlabel('Spike Time (ms)')
hold on
for Condition = 1:6
    TrialNum=1;
    CounT=1;
    a=1;
    X_XVector = 1;
    for CounT = 1:length(TargetsTime)
        if EventTimeMatrix(13,TargetsTime(CounT,1)) == 1 && EventTimeMatrix(2,TargetsTime(CounT,1))== Condition
            for ii = 1:800
                if SpikeTime(PDsTime(CounT)+ii-MinusRaster)==1
                    x = [ii-MinusRaster,ii-MinusRaster];
                    XVector(X_XVector, ii,Condition) = 1;
                    y = [Y,Y];
                    h= plot(x,y, '.-','color',ColoR(COL));
                    h(1).MarkerSize = 15;
                    a=a+1;
                end
            end
            X_XVector = X_XVector+1;
            Trial=Trial+1;
            Y=Y+1;
        end
    end
    COL=COL+1;
end
xline(0); xline(50); xline(100); xline(150); xline(200); xline(250);
hold off
%% PSTH Plot
COL=1;
figure('Name','PSTH','NumberTitle','off');
ylabel('Firing Rate (Hz)');
xlabel('Time (ms)')
hold on
for Condition = 1:6
    
    plot(movmean(mean(XVector(:,:,Condition)),10).*100,'color',ColoR(COL))
    COL=COL+1;
end
xline(300); xline(350); xline(400); xline(450); xline(500); xline(550);


%% TEST
