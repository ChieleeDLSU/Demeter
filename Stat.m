% Create a MATLAB GUI for statistics and plotting

% Create a figure
fig = figure('Name', 'Statistics Calculator', 'NumberTitle', 'off', 'Position', [100, 100, 600, 400]);

% Create UI components
tableData = zeros(40, 1);  % Initial table data
uitable('Data', tableData, 'Position', [20, 200, 200, 150], 'ColumnName', {'Data'}, 'ColumnEditable', true, 'Tag', 'myTable');

uicontrol('Style', 'pushbutton', 'String', 'Calculate', 'Position', [250, 250, 100, 30], 'Callback', @calculateCallback);

uicontrol('Style', 'text', 'String', 'Mean:', 'Position', [350, 300, 50, 20]);
uicontrol('Style', 'text', 'String', 'Median:', 'Position', [350, 270, 50, 20]);
uicontrol('Style', 'text', 'String', 'Mode:', 'Position', [350, 240, 50, 20]);
uicontrol('Style', 'text', 'String', 'Std Dev:', 'Position', [350, 210, 50, 20]);
uicontrol('Style', 'text', 'String', 'Variance:', 'Position', [350, 180, 60, 20]);

uicontrol('Style', 'text', 'Tag', 'meanResult', 'Position', [420, 300, 100, 20]);
uicontrol('Style', 'text', 'Tag', 'medianResult', 'Position', [420, 270, 100, 20]);
uicontrol('Style', 'text', 'Tag', 'modeResult', 'Position', [420, 240, 100, 20]);
uicontrol('Style', 'text', 'Tag', 'stdDevResult', 'Position', [420, 210, 100, 20]);
uicontrol('Style', 'text', 'Tag', 'varianceResult', 'Position', [420, 180, 100, 20]);

uicontrol('Style', 'pushbutton', 'String', 'Plot Data', 'Position', [250, 150, 100, 30], 'Callback', @plotDataCallback);

% Callback functions
function calculateCallback(~, ~)
    % Get data from the table
    tableHandle = findobj('Tag', 'myTable');
    tableData = get(tableHandle, 'Data');

    % Remove zeroes from the data
    tableData = tableData(tableData ~= 0);

    % Calculate statistics
    meanValue = mean(tableData);
    medianValue = median(tableData);
    modeValue = mode(tableData);
    stdDevValue = std(tableData);
    varianceValue = var(tableData);

    % Update result labels
    set(findobj('Tag', 'meanResult'), 'String', num2str(meanValue));
    set(findobj('Tag', 'medianResult'), 'String', num2str(medianValue));
    set(findobj('Tag', 'modeResult'), 'String', num2str(modeValue));
    set(findobj('Tag', 'stdDevResult'), 'String', num2str(stdDevValue));
    set(findobj('Tag', 'varianceResult'), 'String', num2str(varianceValue));
end

function plotDataCallback(~, ~)
    % Get data from the table
    tableHandle = findobj('Tag', 'myTable');
    tableData = get(tableHandle, 'Data');

    % Remove zeroes from the data
    tableData = tableData(tableData ~= 0);

    % Plot the data
    figure;
    plot(tableData, 'o-');
    title('Data Plot');
    xlabel('Index');
    ylabel('Value');
end
