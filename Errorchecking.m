function Numberofcases = Errorchecking(Numberofcases) 
% Numberofcases = Errorchecking(Numberofcases)
%
%This function will error check the user input ot ensure
%the value is a valid case number in the program used.
%
%By Serena Elijah
Numberofcases = 5;
while Numberofcases ==  0 || Numberofcases < 1 || Numberofcases > 25
    fprintf('\nERROR! Please input an integer from 1 to 25\n')
    
end

end