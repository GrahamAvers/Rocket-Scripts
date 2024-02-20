% Constants
Isp = 250; % s
M0 = 12700; % kg
Mp = 8610; % kg
tb = 60; % s
k = 1.4;
Rg = 287; % J/kg-K
T = 300; % K
Af = 2.14; % m^2 (frontal area)
g = 9.81; % m/s^2 (gravitational acceleration)
rho0 = 1.225; % kg/m^3 (air density at sea level)
H_scale = 8400; % m (scale height for exponential atmospheric density model)
dt = 0.1; % Time step

% Initialization
velocities = 0; % Initial velocity
altitudes = 0; % Initial altitude
times = 0:dt:tb; % Time discretization

% Iterate over each time step
for t = times(1:end-1)
    % Current velocity and altitude
    v_current = velocities(end);
    h_current = altitudes(end);

    % Calculate Mach number
    a = sqrt(k * Rg * T);
    Mach = v_current / a;

    % Calculate drag coefficient based on Mach number using the polynomial equations
    if 0.2 <= Mach && Mach <= 1.3
        Cd = -0.8299*Mach^3 + 2.2236*Mach^2 - 1.4454*Mach + 0.3615;
    elseif 1.31 <= Mach && Mach <= 2.2
        Cd = 0.1765*Mach^2 - 0.7946*Mach + 1.1248;
    else
        Cd = 0.0083*Mach^3 - 0.0891*Mach^2 + 0.2769*Mach - 0.0361;
    end

    % Calculate atmospheric density at current altitude using the exponential model
    rho = rho0 * exp(-h_current / H_scale);

    % Drag force
    Fd = 0.5 * Cd * rho * v_current^2 * Af;

    % Rocket thrust
    if t <= tb
        T = Isp * g * Mp / tb; % Constant thrust over burn time
    else
        T = 0; % No thrust after burnout
    end

    % Calculate acceleration, taking into account thrust, drag, and gravity
    a = (T - Fd) / M0 - g;
    delta_v = a * dt;
    delta_h = v_current * dt + 0.5 * a * dt^2;

    % Update velocity and altitude
    velocities = [velocities, v_current + delta_v];
    altitudes = [altitudes, h_current + delta_h];
end

burnout_velocity = velocities(end);
burnout_height = altitudes(end);

% Display results
disp(['Burnout velocity: ', num2str(burnout_velocity), ' m/s']);
disp(['Maximum achievable height (at burnout): ', num2str(burnout_height), ' m']);
