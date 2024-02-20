% Given Data
area_ratios = [20, 100];
specific_impulse = [
    434.5667686, 455.5759429;
    440.7543323, 465.667686;
    439.9490316, 468.756371;
    434.5565749, 467.1457696;
    425.2395515, 461.6615698;
];

% O/F values
of_values = [3, 4, 5, 6, 7];



% Create a figure and plot
figure;
hold on;

% Plot each set of specific impulses against O/F for each area ratio
for i = 1:length(area_ratios)
    plot(of_values, specific_impulse(:, i), 'o-', 'DisplayName', ['Area Ratio = ', num2str(area_ratios(i))]);
end

% Set labels and title
xlabel('O/F');
ylabel('Specific Impulse (s)');
title('Specific Impulse versus O/F at 500 psia');
legend('Location', 'northwest');

% Display the figure
hold off;
grid on;
