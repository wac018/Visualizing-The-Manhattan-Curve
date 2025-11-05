function lengths = read_lengths(file_name)
	%parent_dir = ["t_", num2str(t)];
	%sep_char = "/";
    %dir_name = [parent_dir,sep_char,"lengths_csv"];
	%addpath(dir_name);
	lengths = cell2mat(struct2cell(load(file_name)));
end
