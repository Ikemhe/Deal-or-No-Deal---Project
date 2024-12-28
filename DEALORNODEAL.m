%{
Name: Serena I. Elijah
Student number: 2563912
email: elijahs@my.erau.edu
Course : EGR 115
Professor: Professor Azizi Boutros
Program description: Second Draft
%}

clear
clc
close all

%INTRODUCTION
Runagain = 1;
while Runagain ==1

fprintf('\nWelcome! This program is used to play Deal or No Deal.\n\n')
fprintf('Note. My program is sensitive, please type in inputs as prompted.\n\nIf at any point you would like to stop running the program, click "ctrl + c" \n\n')

Knowledge_of_deal_or_no_deal = input('Do you want to know how deal or no deal works? Type in yes or no (NOTE: Be mindful not to tap the space bar)', 's');

while isempty(Knowledge_of_deal_or_no_deal) ==1 ||~(strcmpi(Knowledge_of_deal_or_no_deal, 'yes') == 1 || strcmpi(Knowledge_of_deal_or_no_deal, 'no') ==1) 
    fprintf('\nERROR! You can only input yes or no.\n');
Knowledge_of_deal_or_no_deal = input('Do you want to know how deal or no deal works? ( Type in YES or NO )', 's');

end

                                                                                                                                      %<SM:WHILE>

%During peer review it was noticed that Deal or No Deal wasn't popular.
%Hence, i have some information for the user if they are intrested in how
%it works.
%

if strcmpi(Knowledge_of_deal_or_no_deal, 'Yes') ==1
                                                                                                                                       %<SM: BOP>  
fprintf(['\nDeal Or No Deal Game.\nIn your first round you need to open five cases; Then the Banker will make you an' ...
    ' offer.\nYou need to press ''Deal '' to accept and '' No Deal '' to reject the offer. \nIf you accept the offer,' ...
    ' the game is over. If you don''t, you go to the second round where you need to open another 5 boxes. \n'])
fprintf('The game has begun. \n')
elseif strcmpi(Knowledge_of_deal_or_no_deal, 'No') ==1
 
 fprintf('\nVery well. The program shall begin shortly.\n')
end

                                                                                                                                         %<SM:IF>

Numberofcases = 5;
%In lieu with the description

%Claculations 

M = [1,2,3,4,5;6,7,8,9,10;11,12,13,14,15;16,17,18,19,20;21,22,23,24,25];
%M is the case number the user picks from.

N = round(rand(5,5)*5500 +5800);
%N are randomly generated values corresponding to the case number picked.
%These values represent the payout for the cases.
                                                                                                                                       %<SM:RANDGEN>
     

Totalamountincases = N(1,1)+ N(1,2)+N(1,3)+N(1,4)+N(1,5)+N(2,1)+N(2,2)+N(2,3)+N(2,4)+N(2,5)+N(3,1)+...
    N(3,2)+N(3,3)+N(3,4)+N(3,5)+N(4,1)+N(4,2)+N(4,3)+N(4,4)+N(4,5)+N(5,1)+N(5,2)+N(5,3)+N(5,5) + N(5,4);



% I created a program defined function
%It is known as "Error Checking"
%It is used to error check the user inputs for case numbers.

firstcasenumber = input('\nFor your first case. What case do you want to pick? (1-25) ');
firstcasenumber = Errorchecking(firstcasenumber);

Payoutforfirstcase = N(firstcasenumber);

fprintf('\nFor your first case, the amount of money picked is $%d\n', Payoutforfirstcase)

Firstbalance = Totalamountincases - Payoutforfirstcase;

%The first balance is the amount of money left after picking their first
%case.

fprintf('\nThe amount of money left, after your case pick so far is $%d\n', Firstbalance )

secondcasenumber = input('\nFor your second case What case do you want to pick? (1-25) ');

secondcasenumber = Errorchecking(secondcasenumber);

     
if firstcasenumber == secondcasenumber
   %The use of "=="                                                                                                                                     %<SM: BOP>
fprintf('\nYou have to pick another case number.\n')
secondcasenumber = input('\nFor your second case What case do you want to pick? (1-25) ');
secondcasenumber = Errorchecking(secondcasenumber);
end
                                                                                                                                       %<SM:IF>

Payoutforsecondcase = N(secondcasenumber);

fprintf('\nFor your second case, the amount of money picked is $%d\n', Payoutforsecondcase)


Secondbalance = Totalamountincases - Payoutforsecondcase -Payoutforfirstcase;

%The second balance is the amount of money left after picking their first
%case.

fprintf('\nThe amount of money left, after your case pick so far is $%d\n', Secondbalance )


thirdcasenumber = input('\nFor your third case. What case do you want to pick? (1-25)');
thirdcasenumber = Errorchecking(thirdcasenumber);

if thirdcasenumber == secondcasenumber || thirdcasenumber == firstcasenumber
  %The use of "OR" , relational operators.
                                                                                                                                        %<SM:ROP>
  %The use of "=="
                                                                                                                                        % <SM: BOP>
 fprintf('\nYou have to pick another case number.\n')
 thirdcasenumber = input('\nFor your third case. What case do you want to pick? (1-25)');
thirdcasenumber = Errorchecking(thirdcasenumber);
end
                                                                                                                                         %<SM:IF>

Payoutforthirdcase = N(thirdcasenumber);

fprintf('\nFor your third case, the amount of money picked is $%d\n', Payoutforthirdcase)

Thirdbalance = Totalamountincases - Payoutforthirdcase - Payoutforsecondcase - Payoutforfirstcase;

%The third balance is the amount of money left after picking their first
%case.

fprintf('\nThe amount of money left, after your case pick so far is $%d\n', Thirdbalance )


fourthcasenumber = input('\nFor your fourth case. What case do you want to pick? (1-25)');
fourthcasenumber = Errorchecking(fourthcasenumber);
if fourthcasenumber == thirdcasenumber || fourthcasenumber ==secondcasenumber || fourthcasenumber==firstcasenumber
 %The use of "OR" , relational operators.
                                                                                                                                         %<SM:ROP>
 %The use of "=="
                                                                                                                                         %<SM: BOP>
fprintf('\nYou have to pick another case number.\n')
fourthcasenumber = input('\nFor your fourth case. What case do you want to pick? (1-25)');
fourthcasenumber = Errorchecking(fourthcasenumber);

end
                                                                                                                                          %<SM:IF>

Payoutforfourthcase = N(fourthcasenumber);

fprintf('\nFor your third case, the amount of money picked is $%d\n', Payoutforfourthcase)


Fourthbalance = Totalamountincases - Payoutforthirdcase - Payoutforsecondcase - Payoutforfirstcase - Payoutforfourthcase;

%The fourth balance is the amount of money left after picking their first
%case.

fprintf('\nThe amount of money left, after your case pick so far is $%d\n', Fourthbalance )



fifthcasenumber = input('\nFor your fifth case. What case do you want to pick? (1-25)');
fifthcasenumber = Errorchecking(fifthcasenumber);

if fifthcasenumber==fourthcasenumber ||fifthcasenumber == thirdcasenumber || fifthcasenumber ==secondcasenumber || fifthcasenumber == firstcasenumber
  %The use of "OR" , relational operators.
                                                                                                                                             %<SM:ROP>  
  %The use of "=="
                                                                                                                                             %<SM: BOP>
 fprintf('\nYou have to pick another case number.\n')
 fifthcasenumber = input('\nFor your fifth case. What case do you want to pick? (1-25)');
fifthcasenumber = Errorchecking(fifthcasenumber);
end
                                                                                                                                              %<SM:IF>

Payoutforfifthcase = N(fifthcasenumber);

fprintf('\nFor your third case, the amount of money picked is $%d\n', Payoutforfifthcase)

Fifthbalance = Totalamountincases - Payoutforthirdcase - Payoutforsecondcase - Payoutforfirstcase - Payoutforfourthcase - Payoutforfifthcase;

%The fifth balance is the amount of money left after picking their first
%case.

fprintf('\nThe amount of money left, after your case pick so far is $%d\n', Fifthbalance )


fprintf('\nI shall display possible payout values for the cases you have picked in order.\n')

bar(M,N, 'b')
title('Deal Or No Deal Estimate Payouts')
xlabel('Number of Cases Picked')
ylabel('Case Payout in dollars ($)')

%bar chart of possiblepayout values, corresponding with the n^th case
%picked. Where n is the order in which the cases are picked. 
                                                                                                                                                %<SM:BAR>

%Refrencing the case numbers to the case payout values

Firstcase = N(firstcasenumber);
Secondcase =N(secondcasenumber);
Thirdcase= N(thirdcasenumber);
Fourthcase = N(fourthcasenumber);
Fifthcase = N(fifthcasenumber);

%Refrencing 
                                                                                                                                                %<SM:REF>
%ALSO 
%The randomly generated numbers aren't used until now to get their case
%payout values. Hence,

                                                                                                                                                % <SM:RANDUSE>

%The cases are used below to get total payout values.
summedCase = Firstcase + Secondcase + Thirdcase + Fourthcase + Fifthcase;
Casenumberchoosen = [firstcasenumber;secondcasenumber;thirdcasenumber;fourthcasenumber;fifthcasenumber];

O = ceil(min(Casenumberchoosen)/5);

Casesremaining = 25 - Numberofcases ;
fprintf('\nThere are %d cases left. \n',  Casesremaining)


Amountleft = Totalamountincases + summedCase; 
fprintf('\nFor this round, the amount of money left in the cases is $%d\n', Amountleft)

%The user has the choice of accepting the bonus earned.

Bonus = input('\nYou have the option of having a bonus. Estimate your payout from the bar charts.\n\nWould you like a bonus? (Yes or No) ', 's');

while isempty(Bonus)==1 || ~(strcmpi(Bonus, 'yes')==1 || strcmpi(Bonus,'no'))
   fprintf('\nYou can only input "yes" or "no".\n')
    Bonus = input('\nYou have the option of having a bonus.\n Would you like a bonus? (Yes or No) ', 's');
end
%Error checking with the use of "while" loops
                                                                                                                                              %<SM:WHILE>


if strcmpi(Bonus, 'yes')==1

Extrabonus = 0;

for K = 1:1: Numberofcases
   
    Extrabonus = N(K,O) + Extrabonus;

    %Running total for extra bonus, It is running total, because for each
    %case, the user receives a bonus.
                                                                                                                                              %<SM:RTOTAL>
end
fprintf('\nHooray! You recieved a bonus of $%d.\n', Extrabonus)

                                                                                                                                              %<SM:FOR>
elseif strcmpi(Bonus,'no')==1
    fprintf('\nVery well then. You recieved no bonus.\n')
    Extrabonus = 0;
end

Moneyavailable =  abs(floor(summedCase + Extrabonus));

ValueExpectedPayoutPercentage = floor(rand*16 +20);
ValueExpectedPayout = (ValueExpectedPayoutPercentage/100)*Moneyavailable;
if ValueExpectedPayout == round(ValueExpectedPayout)
    fprintf('\nThe Value Expected Payout is $%d \n', ValueExpectedPayout)

elseif ValueExpectedPayout ~= round(ValueExpectedPayout)
    fprintf('\nThe Value Expected Payout is $%0.2f \n', ValueExpectedPayout)

end
                                                                                                                                               %<SM:IF>

fprintf('\nDeal means you accept the value expected payout.\n\nNo deal means you do not accept the value expected payout, and the program should run again.\n')

%The program below is to prompt the user with the option of running the
%program again.

Runagain = input('\nDeal or No Deal (Type in 0 for deal or 1 for no deal)?  ');

while isempty(Runagain)== 1 || Runagain <0 || Runagain > 1 || mod(Runagain, 1 ) ~=0
    %The use of "OR" , relational operators.
                                                                                                                                                %<SM:ROP>
 %The use of "=="
                                                                                                                                               %<SM: BOP>
    Runagain = input('\nError.(1 for no deal and 0 for deal)? ');
end
%Error checking with the use of "while" loops
                                                                                                                                                %<SM:WHILE>

if Runagain == 0
 %The use of "=="
                                                                                                                                                 %<SM: BOP>
fprintf('\nThank you for using my program.\n')
end
                                                                                                                                                %<SM:IF>
end

%The concept of running again. with the "IF" loop inside the "WHILE" loop
                                                                                                                                               %<SM: NEST>
