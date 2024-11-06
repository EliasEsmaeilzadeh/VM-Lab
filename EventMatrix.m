%% EventTimeMatrix Details
% Event Time Matrix extract from BHV2 file of monkeylogic
% Event Time Data Will Save in current Folder
% Written by Elias Esmaeilzadeh (V.M. Lab)(EliasEsmaeilzadeh@mail.um.ac.ir)
%            Seyed Javad Saghravanian (V.M. Lab)(saghravanian@mail.um.ac.ir)

% Version 1  10/20/2021

%% import data
BHV_Data = importdata ('BHV_Data.mat'); 
%% Pre-allocation
EventTimeMatrix =NaN([13, length(BHV_Data)]);
TrialNum=1; %While loop counter
R=NaN; %For NaN values
%% Main Loop
while TrialNum <= length(EventTimeMatrix)
    EventTimeMatrix(1,TrialNum) = BHV_Data(TrialNum).Trial; %TrialNumber
    EventTimeMatrix(2,TrialNum) = BHV_Data(TrialNum).BehavioralCodes.CodeNumbers(2)-50; %TrialCondition
    EventTimeMatrix(3,TrialNum) = BHV_Data(TrialNum).AbsoluteTrialStartTime; %TrialStartTime
    EventTimeMatrix(4,TrialNum) = BHV_Data(TrialNum).BehavioralCodes.CodeTimes(4) + BHV_Data(TrialNum).AbsoluteTrialStartTime; %FP On Time
    %EFW Time
    R=find(BHV_Data(TrialNum).BehavioralCodes.CodeNumbers == 2);
    TF = isempty(R);
    if TF ~= 1
        EventTimeMatrix(5,TrialNum) = BHV_Data(TrialNum).BehavioralCodes.CodeTimes(R) + BHV_Data(TrialNum).AbsoluteTrialStartTime;
    end
    %FP Off Time
    R=find(BHV_Data(TrialNum).BehavioralCodes.CodeNumbers == 11);
    TF = isempty(R);
    if TF ~= 1
        EventTimeMatrix(6,TrialNum) = BHV_Data(TrialNum).BehavioralCodes.CodeTimes(R)+ BHV_Data(TrialNum).AbsoluteTrialStartTime;
    end
    %Target1On Time
    R=find(BHV_Data(TrialNum).BehavioralCodes.CodeNumbers == 3);
    TF = isempty(R);
    if TF ~= 1
        EventTimeMatrix(7,TrialNum) = BHV_Data(TrialNum).BehavioralCodes.CodeTimes(R)+ BHV_Data(TrialNum).AbsoluteTrialStartTime;
    end
    %Target1Saccade Time
    R=find(BHV_Data(TrialNum).BehavioralCodes.CodeNumbers == 20);
    TF = isempty(R);
    if TF ~= 1
        EventTimeMatrix(8,TrialNum) = BHV_Data(TrialNum).BehavioralCodes.CodeTimes(R)+ BHV_Data(TrialNum).AbsoluteTrialStartTime;
    end
    %Target1Off Time
    R=find(BHV_Data(TrialNum).BehavioralCodes.CodeNumbers == 4);
    TF = isempty(R);
    if TF ~= 1
        EventTimeMatrix(9,TrialNum) = BHV_Data(TrialNum).BehavioralCodes.CodeTimes(R)+ BHV_Data(TrialNum).AbsoluteTrialStartTime;
    end
    %Reward Time
    R=find(BHV_Data(TrialNum).BehavioralCodes.CodeNumbers == 22);
    TF = isempty(R);
    if TF ~= 1
        EventTimeMatrix(10,TrialNum) = BHV_Data(TrialNum).BehavioralCodes.CodeTimes(R)+ BHV_Data(TrialNum).AbsoluteTrialStartTime;
    end
    %Trial End Time
    R=find(BHV_Data(TrialNum).BehavioralCodes.CodeNumbers == 18);
    TF = isempty(R);
    if TF ~= 1
        EventTimeMatrix(11,TrialNum) = BHV_Data(TrialNum).BehavioralCodes.CodeTimes(R)+ BHV_Data(TrialNum).AbsoluteTrialStartTime;
    end
    %Correct Response Time
    R=find(BHV_Data(TrialNum).BehavioralCodes.CodeNumbers == 15);
    TF = isempty(R);
    if TF ~= 1
        EventTimeMatrix(12,TrialNum) = BHV_Data(TrialNum).BehavioralCodes.CodeTimes(R)+ BHV_Data(TrialNum).AbsoluteTrialStartTime;
    end
    %Incorrect Response Time
    R=find(BHV_Data(TrialNum).BehavioralCodes.CodeNumbers == 16);
    TF = isempty(R);
    if TF ~= 1
        EventTimeMatrix(12,TrialNum) = BHV_Data(TrialNum).BehavioralCodes.CodeTimes(R)+ BHV_Data(TrialNum).AbsoluteTrialStartTime;
    end
    %Correct Response
    R=find(BHV_Data(TrialNum).BehavioralCodes.CodeNumbers == 15);
    TF = isempty(R);
    if TF ~= 1
        EventTimeMatrix(13,TrialNum) = 1;
    end
    
    TrialNum=TrialNum+1;
end

%% Save Output
save('EventTimeMatrix','EventTimeMatrix')


