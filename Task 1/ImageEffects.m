function varargout = ImageEffects(varargin)
% IMAGEEFFECTS MATLAB code for ImageEffects.fig
%      IMAGEEFFECTS, by itself, creates a new IMAGEEFFECTS or raises the existing
%      singleton*.
%
%      H = IMAGEEFFECTS returns the handle to a new IMAGEEFFECTS or the handle to
%      the existing singleton*.
%
%      IMAGEEFFECTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEEFFECTS.M with the given input arguments.
%
%      IMAGEEFFECTS('Property','Value',...) creates a new IMAGEEFFECTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageEffects_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageEffects_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageEffects

% Last Modified by GUIDE v2.5 03-Oct-2017 11:15:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageEffects_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageEffects_OutputFcn, ...
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


% --- Executes just before ImageEffects is made visible.
function ImageEffects_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageEffects (see VARARGIN)

% Choose default command line output for ImageEffects
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImageEffects wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ImageEffects_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Open.
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Open the image and save it in the "handles" struct
[FileName,PathName,FilterIndex] = uigetfile({'*.png';'*.jpg';'*.bmp'} ,'open image');
FullPath = strcat(PathName,FileName);
handles.Image = imread(FullPath);
% Save the handles structure.
guidata(hObject, handles);
% Set current drawing axes to "axes1"
axes(handles.Original);
% Display the image
imshow(handles.Image);



% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,FilterIndex] = uiputfile({'*.png';'*.jpg';'*.bmp'} ,'Save image');
FullPath = strcat(PathName,FileName);
% Set current drawing axes to "axes1"
axes(handles.Effected);
% Display the image
imwrite(handles.Result,FullPath,'jpg');


% --- Executes on button press in Apply.
function Apply_Callback(hObject, eventdata, handles)
% hObject    handle to Apply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function Rchannel_Callback(hObject, eventdata, handles)
% hObject    handle to Rchannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Set the brightness offset to fixed value
val = get(hObject,'Value');
offset = val - 255;
% Call the Brightness function
handles.Result = Brightness(handles.Image, 'R' , offset);
% Save the handles structure.
guidata(hObject, handles);
 % Set current drawing axes to "axes2" and display the resulting image
axes(handles.Effected);
imshow(handles.Result);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Rchannel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rchannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function Gchannel_Callback(hObject, eventdata, handles)
% hObject    handle to Gchannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(hObject,'Value');
offset = val - 255;
% Call the Brightness function
handles.Result = Brightness(handles.Image, 'G' , offset);
% Save the handles structure.
guidata(hObject, handles);
 % Set current drawing axes to "axes2" and display the resulting image
axes(handles.Effected);
imshow(handles.Result);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Gchannel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gchannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Bchannel_Callback(hObject, eventdata, handles)
% hObject    handle to Bchannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(hObject,'Value');
offset = val - 255;
% Call the Brightness function
handles.Result = Brightness(handles.Image, 'B' , offset);
% Save the handles structure.
guidata(hObject, handles);
 % Set current drawing axes to "axes2" and display the resulting image
axes(handles.Effected);
imshow(handles.Result);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Bchannel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bchannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in ScaleBtn.
function ScaleBtn_Callback(hObject, eventdata, handles)
% hObject    handle to ScaleBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scaleheight = str2double(get(handles.heighttxt,'String'));
scalewidth = str2double(get(handles.widthtxt,'String'));
[originalW originalH L] = size(handles.Image);
xFactor = scalewidth / originalW;
yFactor = scaleheight / originalH; 

M = [xFactor 0 0;0 yFactor 0; 0 0 1];

result = GeometricLinearTransform(handles.Image,M);
axes(handles.Effected);
imshow(result);




function widthtxt_Callback(hObject, eventdata, handles)
% hObject    handle to widthtxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of widthtxt as text
%        str2double(get(hObject,'String')) returns contents of widthtxt as a double


% --- Executes during object creation, after setting all properties.
function widthtxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to widthtxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function heighttxt_Callback(hObject, eventdata, handles)
% hObject    handle to heighttxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of heighttxt as text
%        str2double(get(hObject,'String')) returns contents of heighttxt as a double


% --- Executes during object creation, after setting all properties.
function heighttxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to heighttxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angletxt_Callback(hObject, eventdata, handles)
% hObject    handle to angletxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angletxt as text
%        str2double(get(hObject,'String')) returns contents of angletxt as a double


% --- Executes during object creation, after setting all properties.
function angletxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angletxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Rotatebtn.
function Rotatebtn_Callback(hObject, eventdata, handles)
% hObject    handle to Rotatebtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Save the handles structure.
%guidata(hObject, handles);
%handles.Result = rotate(handles.Image,handles.angletxt);
seta = str2double(get(handles.angletxt,'String'));
M = [cosd(seta) sind(seta) 0;-sind(seta) cosd(seta) 0; 0 0 1];

result = GeometricLinearTransform(handles.Image,M);
% Set current drawing axes to "axes2" and display the resulting image
axes(handles.Effected);
imshow(result);

function xsheartxt_Callback(hObject, eventdata, handles)
% hObject    handle to xsheartxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xsheartxt as text
%        str2double(get(hObject,'String')) returns contents of xsheartxt as a double


% --- Executes during object creation, after setting all properties.
function xsheartxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xsheartxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function ysheartxt_Callback(hObject, eventdata, handles)
% hObject    handle to ysheartxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ysheartxt as text
%        str2double(get(hObject,'String')) returns contents of ysheartxt as a double


% --- Executes during object creation, after setting all properties.
function ysheartxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ysheartxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Shearbtn.
function Shearbtn_Callback(hObject, eventdata, handles)
% hObject    handle to Shearbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Set current drawing axes to "axes2" and display the resulting image
M = [1 str2double(get(handles.ysheartxt,'String')) 0;str2double(get(handles.xsheartxt,'String')) 1 0; 0 0 1];
result =  GeometricLinearTransform(handles.Image,M);
axes(handles.Effected);
imshow(result);


% --- Executes on button press in allbtn.
function allbtn_Callback(hObject, eventdata, handles)
% hObject    handle to allbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
seta = str2double(get(handles.angletxt,'String'));
scaleheight = str2double(get(handles.heighttxt,'String'));
scalewidth = str2double(get(handles.widthtxt,'String'));

ShearMatrix = [1 str2double(get(handles.ysheartxt,'String')) 0;str2double(get(handles.xsheartxt,'String')) 1 0; 0 0 1];
RotateMatrix = [cosd(seta) sind(seta) 0;-sind(seta) cosd(seta) 0; 0 0 1];
ScaleMatrix = [scalewidth 0 0;0 scaleheight 0; 0 0 1];

result1 =  GeometricLinearTransform(handles.Image,RotateMatrix);
result2 =  GeometricLinearTransform(result1,ShearMatrix);
result3 =  GeometricLinearTransform(result2,ScaleMatrix);

axes(handles.Effected);
imshow(result3);
