% Electric Field for a Parallel Plate Capacitor in R3

plate_length = 10;
plate_separation = 15;
margin = 2;
step_size = 0.5;

position_positive = [0,0];
position_negative = [plate_separation, 0];

[X,Y] = meshgrid(-margin:step_size:plate_separation + margin, -margin:step_size:plate_length + margin);

EX = zeros(size(X));
EY = zeros(size(Y));

for i = 1:numel(X)

    [EX(i), EY(i)] = calculate_vector_field_at_point_r2(X(i), Y(i), position_positive(1), position_negative(1), 0, plate_length);
end

figure;
quiver(X, Y, EX, EY, 'b');
hold on;

rectangle('Position', [position_positive(1) - 0.2, position_positive(2), 0.4, plate_length], 'FaceColor', 'r', 'EdgeColor', 'none');  % Positive plate
rectangle('Position', [position_negative(1) - 0.2, position_negative(2), 0.4, plate_length], 'FaceColor', 'b', 'EdgeColor', 'none');  % Negative plate



