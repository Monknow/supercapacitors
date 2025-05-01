%TABLE 1
x1 = TEK00000{:,1};
t1 = TEK00000{:,2};
Time = x1+1.945;
Charge = t1;

Charge = str2double(Charge);
Charge = Charge + 6.2;

plot(Time, Charge);
xlabel('Time'); ylabel('Charge');
title('Charge vs Time');
hold on;

%TABLE 2
x1 = TEK00000{:,1};
t1 = TEK00000{:,2};
Time = x1-2.1;
Charge = t1+6.2;

plot(Time, Charge);
xlabel('Time'); ylabel('Charge');
title('Charge vs Time');
hold on;