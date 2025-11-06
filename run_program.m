t_1 = 1;
t_2 = 100;

max_depth = 25;
num_points = 100;

show_status_updates = true;

as = linspace(0,1,num_points);

[xs,ys] = get_manhattan_curve_points(as, t_1, t_2, max_depth, show_status_updates);

save("x_values.mat", "xs","-v7.3");
save("y_values.mat", "ys", "-v7.3");

[~, ~, ~] = mkdir("figures");

f = figure(Name=append("Manhattan Curve for T_1 = ",num2str(t_1)," and T_2 = ", num2str(t_2)), NumberTitle="off");
the_plot = plot(xs,ys);

cd("figures\");

exportgraphics(f,"manhattan_curve.png");
exportgraphics(f,"manhattan_curve.pdf","ContentType","vector");

cd("..");
