function lengths_to_csv(t, p, parent_dir, row_of_lengths)
    sep_char = "/";
    dir_name = append(parent_dir,sep_char,"lengths_csv");
    addpath(parent_dir);
    [~, ~, ~] = mkdir(dir_name);
    addpath(dir_name);
    filename_lengths = append(dir_name,sep_char,"lengths_t_", num2str(t),"_row_", num2str(p), ".mat");
    save(filename_lengths, "row_of_lengths", "-v7.3");
    rmpath(dir_name);
end
