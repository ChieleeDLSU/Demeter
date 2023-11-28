function varargout = SINCOS(varargin)
% SINCOS MATLAB code for SINCOS.fig
%      SINCOS, by itself, creates a new SINCOS or raises the existing
%      singleton*.
%
%      H = SINCOS returns the handle to a new SINCOS or the handle to
%      the existing singleton*.
%
%      SINCOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SINCOS.M with the given input arguments.
%
%      SINCOS('Property','Value',...) creates a new SINCOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SINCOS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SINCOS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SINCOS

% Last Modified by GUIDE v2.5 28-Nov-2023 17:59:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SINCOS_OpeningFcn, ...
                   'gui_OutputFcn',  @SINCOS_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SINCOS is made visible.
function SINCOS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SINCOS (see VARARGIN)

% Choose default command line output for SINCOS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SINCOS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SINCOS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
    % Get the angle from the edit control
    angle = str2double(get(handles.edit3, 'String'));

    % Check if the input is a valid number
    if isnan(angle)
        % Handle invalid input (e.g., display an error message)
        errordlg('Invalid input. Please enter a numeric value for the angle.', 'Error');
        return;
    end

    % Calculate cosine and sine
    cosine_result = cosd(angle);  % Assuming the input angle is in degrees
    sine_result = sind(angle);

    % Display the results
    fprintf('Angle: %.2f degrees\n', angle);
    fprintf('Cosine: %.4f\n', cosine_result);
    fprintf('Sine: %.4f\n', sine_result);

    % Plot the results
    axes(handles.axes1);  % Assuming you have an axes component in your GUI
    plot(handles.axes1, angle, cosine_result, 'ro', angle, sine_result, 'b*');
    legend(handles.axes1, 'Cosine', 'Sine');
    xlabel(handles.axes1, 'Angle (degrees)');
    ylabel(handles.axes1, 'Value');
    title(handles.axes1, 'Cosine and Sine Values');

    % Update handles structure
    guidata(hObject, handles);
function pushbutton4_Callback(hObject, eventdata, handles)
    % Get the angle from the edit control
    angle = str2double(get(handles.edit3, 'String'));

    % Check if the input is a valid number
    if isnan(angle)
        % Handle invalid input (e.g., display an error message)
        errordlg('Invalid input. Please enter a numeric value for the angle.', 'Error');
        return;
    end
    





    % Calculate cosine and sine and display the results
cosine_result = cosd(angle);  % Assuming the input angle is in degrees
sine_result = sind(angle);

% Display the results for cosine
fprintf('Angle: %.2f degrees\n', angle);
fprintf('Cosine: %.4f\n', cosine_result);

% Plot the cosine values
axes(handles.axes1);  % Assuming you have an axes component in your GUI
plot(handles.axes1, angle, cosine_result, 'ro');
xlabel(handles.axes1, 'Angle (degrees)');
ylabel(handles.axes1, 'Cosine Value');
title(handles.axes1, 'Cosine Values');

% Update handles structure
guidata(hObject, handles);
