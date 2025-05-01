% Electric Field for a Parallel Plate Capacitor in R3

plate_height = 10;
plate_width = 10;
plate_separation = 10;
margin = 10;
steps = 10;

position_positive = [0, 0, 0];
position_negative = [plate_separation, 0, 0];

[X,Y,Z] = meshgrid(linspace(-margin, plate_separation + margin, steps), linspace(-margin, plate_separation + margin, steps), linspace(-margin, plate_separation + margin, steps));

EX = zeros(size(X));
EY = zeros(size(Y));
EZ = zeros(size(X));

for i = 1:numel(X)

    [EX(i), EY(i), EZ(i)] = calculate_vector_field_at_point_r3(X(i), Y(i), Z(i), position_positive(1), position_negative(1), plate_height, plate_width);
end

quiver3(X, Y, Z, EX, EY, EZ, 'b');
hold on;

RX_positive = [0 0 
               0 0];
    
RY_positive = [0 0 
               plate_width plate_width];

RZ_positive = [0 plate_height 
               0 plate_height];

RX_negative = [plate_separation plate_separation 
              plate_separation plate_separation];
    
RY_negative = [0 0 
               plate_width plate_width];

RZ_negative = [0 plate_height 
               0 plate_height];

surf(RX_positive, RY_positive, RZ_positive,'FaceColor','red','edgecolor','none');

hold on;

surf(RX_negative, RY_negative, RZ_negative,'FaceColor','blue','edgecolor','none');


hold off
