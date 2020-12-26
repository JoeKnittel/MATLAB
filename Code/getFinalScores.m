%getFinalScores
%Updated: 11/12/09

n_subjects = 25;
n_blocks = 6;
n_trials = 36;
FinalScores = zeros(1,n_subjects);

for subject = 1:n_subjects
    
    %load data for subject into variable d
    if subject < 10; sub = strcat('0',num2str(subject));
    else sub = num2str(subject);
    end
    data_file = strcat('risk_exp2_subject_',sub);
    run(data_file);

    %calculate final score for subject
    FinalScores(subject) = sum(sum(d(:,14,:))); 
    
end