function exists = files_already_generated(t, max_depth)
    exists = true;
    sep_char = "/";
    parent_dir = append("t_",num2str(t));
    dir_name = append(parent_dir,sep_char,"lengths_csv");
    for i = [0:max_depth]
        file_name = append(dir_name,sep_char,"lengths_t_", num2str(t),"_row_", num2str(i), ".mat");
        if ~exist(file_name)
            exists = false;
            return;
        else
            file_name = "";
        end
    end
end

