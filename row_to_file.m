function row_to_file(t, p, parent_dir, row_of_matrices)
    sep_char = "/";
    dir_name = append(parent_dir,sep_char,"matrices_txt");
    addpath(parent_dir);
    [~, ~, ~] = mkdir(dir_name);
    addpath(dir_name);
    filename_row = append(dir_name,sep_char,"row_t_", num2str(t),"_row_", num2str(p), ".mat");
    save(filename_row, "row_of_matrices","-v7.3");
    rmpath(dir_name);
end
