function [xs,ys] = get_manhattan_curve_points(as, t1, t2, max_depth, status_updates)
    bs = 1 - as;

    hs = find_entropy(as, bs, t1, t2, max_depth, status_updates);

    xs = hs .* as;
    ys = hs .* bs;
end
