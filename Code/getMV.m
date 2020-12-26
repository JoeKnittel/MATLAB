%getMV
%Updated: 11/12/09

n_subjects = 25;
n_blocks = 6;
n_trials = 36;
MV = zeros(1,n_subjects);

for subject = 1:n_subjects
    
    %load data for subject into variable d
    if subject < 10; sub = strcat('0',num2str(subject));
    else sub = num2str(subject);
    end
    data_file = strcat('risk_exp2_subject_',sub);
    run(data_file);
    
    %clear velocity data
    v = zeros(1,n_blocks*n_trials);
    
    %determine mean velocity for subject
    for block = 1:n_blocks
        for trial = 1:n_trials
            if d(trial,12,block) == 1
                dist = d(trial,5,block);
            else
                dist = d(trial,8,block);
            end
            v((block-1)*n_trials+trial) = dist/d(trial,13,block); 
        end
    end
    
    MV(subject) = mean(v);
    
end