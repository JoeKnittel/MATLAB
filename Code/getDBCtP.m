%getDBCtP
%Updated: 11/12/09

%load mean velocities and final scores
getMV
getFinalScores

%fit linear trend line to MV vs. FinalScores
coef = polyfit(MV,FinalScores,1);
LinearTrend = coef(1).*MV + coef(2);

DBCtP = FinalScores - LinearTrend;