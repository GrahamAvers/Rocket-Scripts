    % Constants
g0 = 9.81;  % gravitational acceleration at Earth's surface [m/s^2]
Rg = 287;  % specific gas constant [J/kg-K]
T0 = 300;  % standard temperature [K]
P0 = 101325;  % standard pressure [Pa]
rho0 = 1.225;  % standard density [kg/m^3]
scale_height = 8400;  % scale height for Earth's atmosphere [m]
tb = 60;  % burn time [s]
Isp = 250;  % specific impulse [s]
A_frontal = 2.14;  % frontal area [m^2]

% Initial conditions
x0 = 0;
y0 = 0;
vx0 = 0;
vy0 = 0;
m0 = 12700;
init = [x0, y0, vx0, vy0, m0];

% Time vector
dt = 1;
t = 0:dt:350;  % Simulate for 350 seconds

% Integrate using MATLAB's ode45
options = odeset('RelTol',1e-4,'AbsTol',1e-6);
[T, Y] = ode15s(@(t, y) rocket_equation(t, y, g0, Rg, T0, P0, rho0, scale_height, tb, Isp, A_frontal), t, init, options);

% Plotting and output
figure;
plot(Y(:,1), Y(:,2));
xlabel('Distance (m)');
ylabel('Altitude (m)');
title('Rocket Trajectory');
grid on;

% Rocket equation function
function dy = rocket_equation(t, y, g0, Rg, T0, P0, rho0, scale_height, tb, Isp, A_frontal)
    x = y(1);
    y_pos = y(2);
    vx = y(3);
    vy = y(4);
    m = y(5);

    T = T0;
    rho = rho0 * exp(-y_pos / scale_height);
    
    V = sqrt(vx^2 + vy^2);
    a = sqrt(1.4 * Rg * T);
    M = V / a;
    
    Cd = drag_coefficient(M);
    Fd = 0.5 * Cd * rho * V^2 * A_frontal;

    if t <= tb
        thrust = 245000;
        mdot = -thrust / (g0 * Isp);
    else
        thrust = 0;
        mdot = 0;
    end

    if t > 4 && t <= tb
        angle = deg2rad(47);
    else
        angle = 0;
    end

    thrust = thrust - Fd;
    ax = (thrust * sin(angle)) / m;
    ay = (thrust * cos(angle) - m * g0) / m;

    dy = [vx; vy; ax; ay; mdot];
end

% Drag coefficient function
function Cd = drag_coefficient(Mach)
    if 0.2 <= Mach && Mach <= 1.3
        Cd = -0.8299*Mach^3 + 2.2236*Mach^2 - 1.4454*Mach + 0.3615;
    elseif 1.31 <= Mach && Mach <= 2.2
        Cd = 0.1765*Mach^2 - 0.7946*Mach + 1.1248;
    else
        Cd = 0.0083*Mach^3 - 0.0891*Mach^2 + 0.2769*Mach - 0.0361;
    end
end
