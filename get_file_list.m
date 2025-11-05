function files_list = get_file_list(t)
	parent_dir = append("t_", num2str(t));
	sep_char = "/";
    dir_name = append(parent_dir,sep_char,"lengths_csv");

	addpath(dir_name);

	tbl = struct2table(dir(append(dir_name, sep_char, "*.mat")));
    removevars(tbl,["date","bytes","isdir","datenum"]);
    num_files = size(tbl.name,1);
    files_list = cell(num_files,1);

    for i = [1:num_files]
        files_list{i} = append(tbl.folder{i},sep_char,tbl.name{i});
    end

end
