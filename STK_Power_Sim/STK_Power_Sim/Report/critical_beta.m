%the script will read through the beta angle report for the scenario
% and determine the intervals when the beta angle is larger than or smaller
% than the critical beta angle

clear all
format long
h=400;
R=6378;
beta_crit = asind((R)/(R+h)); %calculate critical beta angle

M = csvread('Beta_Angle-One_Year.csv',1,0); %import data
avg_beta = mean(abs(M(:,2)));
no_eclipse = abs(M(:,2)) > beta_crit; %find where we are above critical beta
j=1;
k=1;
for i =2:size(no_eclipse)
    if no_eclipse(i) - no_eclipse(i-1) == 1 %find start of each interval
        st(j) = M(i,1);
        j=j+1;
    end
    if no_eclipse(i) - no_eclipse(i-1) == -1 %find end of each interval
        fin(k) = M(i,1);
        k=k+1;
    end
end
    fprintf('Eclipse-free intervals are: \n');
for i =1:length(st)
    fprintf(' Start: %d epoch sec, Finish: %d epoch sec, duration = %.3f days \n', st(i), fin(i),(fin(i)-st(i))/86400);
end

f_E = @(B) (1/180)*real(acosd(sqrt(h^2+2*R*h)./((R+h)*cosd(B)))); %equation for fraction of orbit in eclipse at any Beta angle

eclipse_frac = f_E(abs(transpose(M(:,2))));

figure 
plot(eclipse_frac)%plot of the fraction of orbit in eclipse at each time
ylabel(' Fraction of Orbit Spent in Eclipse');
xlabel('Epoch Minutes');
title('Eclipse Fraction Over Mission Duration')

figure
hold on
title('Beta Angle and Eclipse Fraction Over Mission Duration')
xlabel('Epoch Minutes')
yyaxis left
ylabel('Beta Angle (deg)')
plot(M(:,2))

yyaxis right
ylabel('Fraction of Orbit Spent in Eclipse')
plot(eclipse_frac)
hold off

figure
fplot(f_E, [0 90])
title('Eclipse Fraction for 400 km Circular Orbit');
xlabel(' Beta Angle (deg)');
ylabel('Fraction of Orbit Spent in Eclipse');
