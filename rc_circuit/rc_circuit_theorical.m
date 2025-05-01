capacitance = 2000 * 10.^-6; % Farads
resistance = 1000; % Ohms

time_constant = capacitance * resistance;

voltage_discharge = @(t) exp(1).^(-t/time_constant);
voltage_charge = @(t) (1 - exp(1).^(-t/time_constant));

t = 0:0.05:15;

figure(1)
plot(t, voltage_discharge(t));

figure(2)
plot(t, voltage_charge(t))



