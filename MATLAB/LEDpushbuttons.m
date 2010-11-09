function varargout = LEDpushbuttons(varargin)
% LEDPUSHBUTTONS M-file for LEDpushbuttons.fig
%      LEDPUSHBUTTONS, by itself, creates a new LEDPUSHBUTTONS or raises the existing
%      singleton*.
%
%      H = LEDPUSHBUTTONS returns the handle to a new LEDPUSHBUTTONS or the handle to
%      the existing singleton*.
%
%      LEDPUSHBUTTONS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LEDPUSHBUTTONS.M with the given input arguments.
%
%      LEDPUSHBUTTONS('Property','Value',...) creates a new LEDPUSHBUTTONS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LEDpushbuttons_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LEDpushbuttons_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help LEDpushbuttons

% Last Modified by GUIDE v2.5 07-Nov-2010 14:36:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LEDpushbuttons_OpeningFcn, ...
                   'gui_OutputFcn',  @LEDpushbuttons_OutputFcn, ...
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


% --- Executes just before LEDpushbuttons is made visible.
function LEDpushbuttons_OpeningFcn(hObject, eventdata, handles, varargin)
set(hObject,'toolbar','figure');

%handles.s = serial('COM4','BaudRate',9600);
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LEDpushbuttons (see VARARGIN)

% Choose default command line output for LEDpushbuttons
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LEDpushbuttons wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LEDpushbuttons_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
handles.a.digitalWrite(13,0);

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
handles.a.digitalWrite(13,1);

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
comport=num2str(get(handles.edit1,'String'));
handles.a=arduino(comport);
handles.a.pinMode(13,'output');
guidata(hObject, handles);

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
delete(handles.a);

% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit1.


function editSpeed_Callback(hObject, eventdata, handles)
handles.speed = str2num(get(hObject,'String')); 
%handles.speed=255.*(handles.speed/100);
if (handles.speed > 255)
    msgbox('Please Enter a Number Between 0 and 255');
end

guidata(hObject, handles);
% hObject    handle to editSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of editSpeed as text

% --- Executes during object creation, after setting all properties.
function editSpeed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in analogRecieve.
function analogRecieve_Callback(hObject, eventdata, handles)
axes(handles.axes2);
x=1:50;
for i=1:50
    val=(handles.a.analogRead(0));
    val=2914/(5+val)-1;
    set(handles.editRecieve,'String',val);
    x(i)=val;
end

plot(x);
axis([0 50 0 40]);
guidata(hObject, handles);
% hObject    handle to analogRecieve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function editRecieve_Callback(hObject, eventdata, handles)

%guidata(hObject, handles);
% hObject    handle to editRecieve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRecieve as text
%        str2double(get(hObject,'String')) returns contents of editRecieve as a double


% --- Executes during object creation, after setting all properties.
function editRecieve_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRecieve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MotorOn.
function MotorOn_Callback(hObject, eventdata, handles)
%speed=str2num(get(handles.editSpeed,'String'));
axes(handles.axes1);
x=1:400;
switch get(handles.signalMenu,'Value')
    case 1 
        handles.a.motorRun(2,'forward');
        handles.a.motorSpeed(2,handles.speed);
    case 2
       for j=0:3
        handles.a.motorRun(2,'forward');
        for i=1+j*100:j*100+50
            handles.a.motorSpeed(2,handles.speed);
            x(i)=handles.speed;
        end
        handles.a.motorRun(2,'backward');
        for i=j*100+51:j*100+100
            handles.a.motorSpeed(2,0);
            x(i)=0;
        end
        plot(x);
        axis([0 205 0 260]);
       end
    otherwise
        handles.a.motorRun(2,'forward');
        handles.a.motorSpeed(2,handles.speed);
end


% hObject    handle to MotorOn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MotorOff.
function MotorOff_Callback(hObject, eventdata, handles)
handles.a.motorSpeed(2,0);
% hObject    handle to MotorOff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in signalMenu.
function signalMenu_Callback(hObject, eventdata, handles)
% hObject    handle to signalMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns signalMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from signalMenu
%handles.contents = get(hObject,'String');


% --- Executes during object creation, after setting all properties.
function signalMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to signalMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject, handles);

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
