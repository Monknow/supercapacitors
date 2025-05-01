function [EX, EY, EZ] = calculate_vector_field_at_point_r3(x, y, z, positive_x, negative_x, upper_limit_height, upper_limit_width)
    epsilon = 8.85e-12;
    k = 1/(4*pi*epsilon);
    Q = 100e-6;
    area = upper_limit_width * upper_limit_height;
    sigma = Q/area;
    boundary = 1e-1;

    % integrand_x = @(h, w) k.*sigma.*(x - positive_x).*(1./((x - positive_x).^2 + (y - w).^2 + (z - h).^2 + boundary).^(3/2) - 1./((x - negative_x).^2 + (y - w).^2 + (z - h).^2 + boundary).^(3/2));  
    % integrand_y = @(h, w) k.*sigma.*(y - w).*(1./((x - positive_x).^2 + (y - w).^2 + (z - h).^2 + boundary).^(3/2) - 1./((x - negative_x).^2 + (y - w).^2 + (z - h).^2 + boundary).^(3/2)); 
    % integrand_z = @(h, w) k.*sigma.*(z - h).*(1./((x - positive_x).^2 + (y - w).^2 + (z - h).^2 + boundary).^(3/2) - 1./((x - negative_x).^2 + (y - w).^2 + (z - h).^2 + boundary).^(3/2)); 

    integrand_x = @(h, w) k * sigma * ( ...
        (x - positive_x) ./ ((x - positive_x)^2 + (y - w).^2 + (z - h).^2 + boundary).^(3/2) - ...
        (x - negative_x) ./ ((x - negative_x)^2 + (y - w).^2 + (z - h).^2 + boundary).^(3/2) ...
    );

    integrand_y = @(h, w) k * sigma * ( ...
        (y - w) ./ ((x - positive_x)^2 + (y - w).^2 + (z - h).^2 + boundary).^(3/2) - ...
        (y - w) ./ ((x - negative_x)^2 + (y - w).^2 + (z - h).^2 + boundary).^(3/2) ...
    );

    integrand_z = @(h, w) k * sigma * ( ...
        (z - h) ./ ((x - positive_x)^2 + (y - w).^2 + (z - h).^2 + boundary).^(3/2) - ...
        (z - h) ./ ((x - negative_x)^2 + (y - w).^2 + (z - h).^2 + boundary).^(3/2) ...
    );

    
    EX = integral2(integrand_x, 0, upper_limit_height, 0, upper_limit_width);
    EY = integral2(integrand_y, 0, upper_limit_height, 0, upper_limit_width);
    EZ = integral2(integrand_z, 0, upper_limit_height, 0, upper_limit_width);
end