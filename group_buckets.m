function groups = group_buckets(lengths)
	max_n = floor(max(lengths));
	ns = [0: max_n];
	tally = zeros(1, max_n + 1);
	for i = [1:size(lengths,2)]
		l = lengths(i);
		if l == 0
			tally(1) = tally(1) + 1;
		else
			tally(floor(lengths(i)) + 1) = tally(floor(lengths(i)) + 1) + 1;
		end
	end

	for i = [2:size(tally,2)]
		tally(i) = tally(i) + sum(tally(1:(i-1)));
	end

	groups = vertcat(ns, tally);
end
