P1_matrix = [-1,-3;0,-2];
P2_matrix = [-1,0;-3,-2];

n_actions_P1 = 2;
n_actions_P2 = 2;

disp('P1 Dominance Analysis');
for i = 1:n_actions_P1
    if is_dominated(i,P1_matrix) == 1
        disp('Row ' + string(i) + ' is dominated.');
    else
        disp('Row ' + string(i) + ' is not dominated.');
    end
end

disp(' ');disp('P2 Dominance Analysis');
for j = 1:n_actions_P2
    if is_dominated(j,P2_matrix') == 1
        disp('Row ' + string(j) + ' is dominated.');
    else
        disp('Row ' + string(j) + ' is not dominated.');
    end
end
function [res] = is_dominated(the_row, utility_matrix)
    % determine if a row in the utility matrix
    % of the row player is dominated
    strip_row = utility_matrix;

    % Remove row values
    strip_row (the_row,:) = [];

    % Check if some other column is smaller than sttrip_row
    res = any(all( utility_matrix(the_row,:) < strip_row, 2),1);
end