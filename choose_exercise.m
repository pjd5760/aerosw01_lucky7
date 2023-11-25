%% 일단 예시 입니다. gui로 제작해야해요.
%% ec = exercise 
%% output : exercise, wcal
%% output value(exercise) : Walk , Run, Cycle
%% wcal : 원하는 칼로리

clear

str = 'No';
while(1)
    if strcmp(str,'No')
        ec = menu('Choose a exercise','Walk','Run','Cycle');
        str = questdlg('Are you sure it is this exercise?','Confirmation Question',...
            'Yes','No','No');
    else
        break;
    end
end

switch ec
    case 1
        excercise = 'Walk';
    case 2
        exercise = 'Run';
    case 3
        exercise = 'Cycle';
end

cal = inputdlg('몇 칼로리만큼 운동하는 것이 목표인가요?', '값 입력', 1);
wcal = str2num(cal{1,1});



