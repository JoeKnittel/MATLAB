%getRisk
%Updated: 11/12/09

n_subjects = 25;
n_blocks = 6;
n_trials = 36;
Risk = zeros(1,n_subjects);

for subject = 1:n_subjects
    
    %load data for subject into variable d
    if subject < 10; sub = strcat('0',num2str(subject));
    else sub = num2str(subject);
    end
    data_file = strcat('risk_exp2_subject_',sub);
    run(data_file);
    
    %clear risk data
    r = zeros(1,n_blocks);
    
    %determine mean normalized risk for subject
    for block = 1:n_blocks
        attempts = 0;
        captures = 0;
        opportunities = n_trials;
        for trial = 1:n_trials
            if d(trial,12,block) == 2
                attempts = attempts + 1;
                if d(trial,14,block) > 0
                    captures = captures + 1;
                end
            end
        end
        r(block) = (attempts-captures)/opportunities;
    end
    Risk(subject) = mean(r);
    
end