function calculate_matrices(t, max_depth,status_updates)

R1 = [[-1, 0, 0]; [2*t, 1, 0]; [2/t, 0, 1]];

row_of_matrices = {R1};

list_of_lengths = [L_t(row_of_matrices{1})];

parent_dir = append("t_", num2str(t));
[~, ~, ~] = mkdir(parent_dir);

tic();

for p = [0:max_depth]
    matrix_length_pairs = get_next_row(t, p, row_of_matrices); % cell array with matrices paired with their length

    row_of_matrices = matrix_length_pairs{1}; % contains cell array with all matrices for that row of tree
    new_list_of_lengths = matrix_length_pairs{2};

    row_to_file(t, p, parent_dir, row_of_matrices);
    lengths_to_csv(t, p, parent_dir, new_list_of_lengths);
    list_of_lengths = [list_of_lengths, new_list_of_lengths];
    if status_updates
        disp(append("finished t_",num2str(t),"_row: ", num2str(p), " - time: ", num2str(1000*toc()), "ms"));
    end
end
total_time = toc();
if status_updates
    disp(append("total runtime: ", num2str(1000*total_time),"ms"));
end

end
