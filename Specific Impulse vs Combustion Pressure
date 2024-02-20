% Given Data
pressure = [20, 40, 60, 80, 100];
specific_impulse = [
    4300, 4444.8, 4514.6, 4558.4, 4589.5;
    4307.6, 4450.8, 4519.8, 4563.1, 4593.8;
    4311, 4453, 4522, 4565, 4596;
    4314, 4455, 4524, 4567, 4597;
    4315, 4457, 4525, 4568, 4598;
    4317, 4458, 4526, 4569, 4599;
    4318, 4459, 4527, 4569, 4600;
    4319, 4460, 4527, 4570, 4600;
    4320, 4460, 4528, 4570, 4600;
    4320, 4461, 4528, 4571, 4601;
];

% Divide all specific impulse values by 9.81
specific_impulse = specific_impulse / 9.81;

% Combustor Pressures
combustor_pressure = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];

% Create a figure and plot
figure;
hold on;

% Plot each set of specific impulses against combustor pressures for each pressure value
for i = 1:length(pressure)
    plot(combustor_pressure, specific_impulse(:, i), 'o-', 'DisplayName', ['Pressure = ', num2str(pressure(i)), ' PSIA']);
end

% Set labels and title
xlabel('Combustor Pressure (PSIA)');
ylabel('Specific Impulse (s)');
title('Specific Impulse versus Combustor Pressure');
legend('Location', 'northwest');

% Display the figure
hold off;
grid on;
