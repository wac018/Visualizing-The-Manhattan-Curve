function hs = find_entropy(as, bs, t1, t2, max_depth, status_updates)
    if ~files_already_generated(t1, max_depth)
        calculate_matrices(t1, max_depth, status_updates);
    end

    if ~files_already_generated(t2, max_depth)
        calculate_matrices(t2, max_depth, status_updates);
    end

    t1_file_list = get_file_list(t1);
    t2_file_list = get_file_list(t2);
    num_files = min(size(t1_file_list,1), size(t2_file_list,1));

    t1_lengths = [];
    t2_lengths = [];

    for i = [1:num_files]
        t1_lengths = [t1_lengths, read_lengths(t1_file_list{i})];
        t2_lengths = [t2_lengths, read_lengths(t2_file_list{i})];
        % disp(["t1 lengths:",num2str(i)," - ", num2str(columns(t1_lengths))]);
        % disp(["t2 lengths:",num2str(i)," - ", num2str(columns(t2_lengths))]);
    end

    hs = zeros(1, size(as,2));

    for i = [1:size(as,2)]
        weighted_lengths = as(i).*t1_lengths + bs(i).*t2_lengths;
        bucket_groups = group_buckets(weighted_lengths);

        nonzero_buckets = bucket_groups(2,:) ~= 0;

        sequence = zeros(1,size(bucket_groups,2));

        for k = [2:size(nonzero_buckets,2)] % starting at 2 to avoid dividing by zero
            if nonzero_buckets(k)
                sequence(k) = log(bucket_groups(2,k))./bucket_groups(1,k);
            end
        end

        hs(i) = sequence(end - 3);
    end

end
