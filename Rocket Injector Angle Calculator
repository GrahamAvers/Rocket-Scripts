% Define the discharge coefficients
Cdf = 0.82; % Discharge coefficient for fuel
Cdo = 0.65; % Discharge coefficient for oxidizer

% Define the static pressure drop across the injectors
delta_p = 200e3; % Pressure drop in Pascals

% Define the densities
rho_f = 85; % Density of fuel in kg/m^3
rho_o = 1350; % Density of oxidizer in kg/m^3

% Calculate the velocities for mixture ratio 2.5
vf = Cdf * sqrt(2 * delta_p / rho_f);
vo = Cdo * sqrt(2 * delta_p / rho_o);

% Define the mixture ratios
mixture_ratios = [2.5, 3.5, 4.5];

% Create a range of oxidizer angles in degrees
gamma_o_range = linspace(0, 90, 500);

% Initialize a figure
figure;

% Loop over each mixture ratio
for r = mixture_ratios
    % Calculate the new velocity ratio based on the mixture ratio
    velocity_ratio = r * (Cdf / Cdo);
    
    % Initialize an array to hold fuel angles
    gamma_f_values_degrees = zeros(size(gamma_o_range));
    
    % Calculate the corresponding fuel angles for each oxidizer angle
    for i = 1:length(gamma_o_range)
        gamma_o = gamma_o_range(i);
        % Calculate sin(gamma_f) based on the velocity ratio and sin(gamma_o)
        sin_gamma_f = sin(deg2rad(gamma_o)) / velocity_ratio;
        
        % Check if sin_gamma_f is possible (i.e., within [-1, 1])
        if abs(sin_gamma_f) <= 1
            gamma_f_values_degrees(i) = rad2deg(asin(sin_gamma_f));
        else
            gamma_f_values_degrees(i) = NaN; % Assign NaN if the value is outside the valid range
        end
    end
    
    % Plot gamma_f vs gamma_o
    plot(gamma_o_range, gamma_f_values_degrees, 'DisplayName', sprintf('Mixture Ratio = %1.1f', r));
    hold on; % Hold on to plot multiple lines
end

% Label the axes
xlabel('Oxidizer Injection Angle \gamma_o (degrees)');
ylabel('Fuel Injection Angle \gamma_f (degrees)');
title('Fuel Injection Angle vs Oxidizer Injection Angle for Different Mixture Ratios');

% Add the legend
legend('show');

% Show the grid
grid on;

% Show the plot
hold off;
