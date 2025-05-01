function [Ex, Ey] = calculate_vector_field_at_point_r2(x, y, positive_x, negative_x, lower_limit, upper_limit)
    epsilon = 8.85e-12;
    k = 1/(4*pi*epsilon);
    Q = 100e-6;
    l = upper_limit;
    lambda = Q/l;
    boundary = 1;


    integrand_x = @(l) k * lambda * (x - positive_x) ./ ((x - positive_x).^2 + (y - l).^2 + boundary).^(3/2) - k * lambda * (x - negative_x) ./ ((x - negative_x).^2 + (y - l).^2 + boundary).^(3/2);
    
    integrand_y = @(l) k * lambda * (y - l) ./ ((x - positive_x).^2 + (y - l).^2 + boundary).^(3/2) - k * lambda * (y - l) ./ ((x - negative_x).^2 + (y - l).^2 + boundary).^(3/2);
    
    Ex = integral(integrand_x, lower_limit, upper_limit);
    Ey = integral(integrand_y, lower_limit, upper_limit);
end