%{
Name: Serena I. Elijah
Student number: 2563912
email: elijahs@my.erau.edu
Course : EGR 115
Professor: Professor Azizi Boutros
Program description: Second Draft with Improvements
%}

clear
clc
close all

% Start the main program
main();


function main()
    fprintf('\nWelcome to "Deal or No Deal"!\n');
    fprintf('Note: Please follow input instructions carefully to avoid errors.\n');
    fprintf('Press "Ctrl+C" at any time to exit.\n');
    
    while true
        % Game Introduction
        knowledge = getYesNo('\nDo you want to know how the game works? (yes/no): ');
        if strcmpi(knowledge, 'yes')
            explainRules();
        end
        
        % Generate Cases and Payouts
        num_cases = 5;
        case_matrix = reshape(1:25, 5, 5);
        payout_matrix = randi([5800, 11300], 5, 5); % Random payouts
        total_payout = sum(payout_matrix, 'all');
        
        fprintf('\nLet''s begin the game. You will pick %d cases.\n', num_cases);
        
        % Pick Cases
        picked_cases = zeros(1, num_cases);
        picked_payouts = zeros(1, num_cases);
        remaining_payout = total_payout;
        
        for i = 1:num_cases
            fprintf('\nPick case %d/%d.\n', i, num_cases);
            picked_cases(i) = getValidCase(case_matrix, picked_cases);
            [row, col] = find(case_matrix == picked_cases(i));
            picked_payouts(i) = payout_matrix(row, col);
            remaining_payout = remaining_payout - picked_payouts(i);
            fprintf('You picked case #%d with a payout of $%d.\n', picked_cases(i), picked_payouts(i));
            fprintf('Remaining total payout: $%d.\n', remaining_payout);
        end
        
        % Display Results
        displayResults(case_matrix, payout_matrix, picked_cases, picked_payouts);
        
        % Bonus Option
        bonus = getYesNo('\nWould you like to accept a bonus? (yes/no): ');
        if strcmpi(bonus, 'yes')
            extra_bonus = randi(10000); %calculateBonus(payout_matrix, picked_cases);
            fprintf('\nYou received a bonus of $ %0.2f\n', extra_bonus);
        else
            extra_bonus = 0;
            fprintf('\nNo bonus received.\n');
        end
        
        % Value Expected Payout
        total_winnings = sum(picked_payouts) + extra_bonus;
        payout_percentage = randi([20, 35]);
        expected_payout = round((payout_percentage / 100) * total_winnings);
        fprintf('\nValue Expected Payout: $%0.2f (%0.2f%% of winnings).\n', expected_payout, payout_percentage);
        
        % Deal or No Deal Decision
        deal = input('\nDeal or No Deal? Type 0 for Deal or 1 for No Deal: ');
        while ~isnumeric(deal) || ~ismember(deal, [0, 1])
            fprintf('\nInvalid input. Type 0 for Deal or 1 for No Deal.\n');
            deal = input('Deal or No Deal? ');
        end
        
        if deal == 0
            %if Runagain == 0
    % Assuming 'ValueExpectedPayout' is the variable for the payout
    fprintf('\nCongratulations! You accepted the deal with a payout of $%0.2f.\n', expected_payout);
            %end
        else
            fprintf('\nNo deal! Let\''s play again.\n');
        end
    end
end


% Function to explain the game rules
function explainRules()
    fprintf(['\nDeal or No Deal Rules:\n' ...
        '1. Pick five cases one at a time.\n' ...
        '2. After each case, its payout is revealed and subtracted from the total.\n' ...
        '3. At the end, you\''ll receive a Value Expected Payout offer.\n' ...
        '4. Decide if you want to "Deal" or "No Deal".\n']);
end

% Function to validate yes/no input
function result = getYesNo(prompt)
    result = input(prompt, 's');
    while isempty(result) || ~ismember(lower(result), {'yes', 'no'})
        fprintf('\nError! Please type "yes" or "no".\n');
        result = input(prompt, 's');
    end
end

% Function to validate case selection
function case_num = getValidCase(case_matrix, picked_cases)
    case_num = input('Pick a case number (1-25): ');
    while isempty(case_num) || ~isnumeric(case_num) || ~ismember(case_num, case_matrix) || ismember(case_num, picked_cases)
        fprintf('\nInvalid choice. Pick an available case number (1-25).\n');
        case_num = input('Pick a case number (1-25): ');
    end
end

% Function to display bar chart and results
function displayResults(case_matrix, payout_matrix, picked_cases, picked_payouts)
    fprintf('\nDisplaying case payouts:\n');
    bar(payout_matrix, 'b');
    title('Deal Or No Deal: Case Payouts');
    xlabel('Cases');
    ylabel('Payout Amount ($)');
    fprintf('\nPicked Cases: %s\n', mat2str(picked_cases));
    fprintf('Picked Payouts: %s\n', mat2str(picked_payouts));
end

% Function to calculate bonus
function bonus = calculateBonus(payout_matrix, picked_cases)
    bonus = 10000;
    for i = 1:length(picked_cases)
        [row, col] = find(payout_matrix == picked_cases(i));
        bonus = bonus + payout_matrix(row, col);
    end
end

