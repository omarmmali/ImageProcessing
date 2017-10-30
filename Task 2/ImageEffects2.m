function varargout = ImageEffects2(varargin)
% IMAGEEFFECTS2 MATLAB code for ImageEffects2.fig
%      IMAGEEFFECTS2, by itself, creates a new IMAGEEFFECTS2 or raises the existing
%      singleton*.
%
%      H = IMAGEEFFECTS2 returns the handle to a new IMAGEEFFECTS2 or the handle to
%      the existing singleton*.
%
%      IMAGEEFFECTS2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEEFFECTS2.M with the given input arguments.
%
%      IMAGEEFFECTS2('Property','Value',...) creates a new IMAGEEFFECTS2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageEffects2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageEffects2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageEffects2

% Last Modified by GUIDE v2.5 09-Oct-2017 01:02:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageEffects2_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageEffects2_OutputFcn, ...
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


% --- Executes just before ImageEffects2 is made visible.
function ImageEffects2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageEffects2 (see VARARGIN)

% Choose default command line output for ImageEffects2
handles.output = hObject;
handles.Image = imread('empty.png');
% Save the handles structure.
guidata(hObject, handles);
% Set current drawing axes to "axes1"
axes(handles.Img1);
% Display the image
imshow(handles.Image);
axes(handles.Img2);
% Display the image
imshow(handles.Image);
axes(handles.RImg);
% Display the image
imshow(handles.Image);


% UIWAIT makes ImageEffects2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ImageEffects2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in OpenImg1.
function OpenImg1_Callback(hObject, eventdata, handles)
% hObject    handle to OpenImg1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,FilterIndex] = uigetfile({'*.png';'*.jpg';'*.bmp'} ,'open image');
FullPath = strcat(PathName,FileName);
handles.Image = imread(FullPath);
% Save the handles structure.
guidata(hObject, handles);
% Set current drawing axes to "axes1"
axes(handles.Img1);
% Display the image
imshow(handles.Image);


% --- Executes on button press in OpenImg2.
function OpenImg2_Callback(hObject, eventdata, handles)
% hObject    handle to OpenImg2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,FilterIndex] = uigetfile({'*.png';'*.jpg';'*.bmp'} ,'open image');
FullPath = strcat(PathName,FileName);
handles.Image2 = imread(FullPath);
% Save the handles structure.
guidata(hObject, handles);
% Set current drawing axes to "axes1"
axes(handles.Img2);
% Display the image
imshow(handles.Image2);


% --- Executes on button press in SaveImg.
function SaveImg_Callback(hObject, eventdata, handles)
% hObject    handle to SaveImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,FilterIndex] = uiputfile({'*.png';'*.jpg';'*.bmp'} ,'Save image');
FullPath = strcat(PathName,FileName);
% Set current drawing axes to "Result"
axes(handles.RImg);
% Display the image
imwrite(handles.Result,FullPath,'jpg');



function Translate_Callback(hObject, eventdata, handles)
% hObject    handle to Translate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Translate as text
%        str2double(get(hObject,'String')) returns contents of Translate as a double


% --- Executes during object creation, after setting all properties.
function Translate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Translate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in TranslateImg1.
function TranslateImg1_Callback(hObject, eventdata, handles)
% hObject    handle to TranslateImg1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
txtVal = get(handles.Translate, 'String');
offset = str2num(txtVal) ;
handles.Result = Translate(handles.Image , offset);
% Save the handles structure.
guidata(hObject, handles);
% Set current drawing axes to "RImg"
axes(handles.RImg);
imshow(handles.Result);
 





function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in TranslateImg2.
function TranslateImg2_Callback(hObject, eventdata, handles)
% hObject    handle to TranslateImg2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Rotate_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rotate as text
%        str2double(get(hObject,'String')) returns contents of Rotate as a double
seta = str2double(get(handles.Rotate,'String'));
M = [cosd(seta) sind(seta) 0;-sind(seta) cosd(seta) 0; 0 0 1];

handles.Result = GeometricLinearTransform(handles.Image,M);
% Set current drawing axes to "axes2" and display the resulting image
axes(handles.RImg);
imshow(handles.Result);

% --- Executes during object creation, after setting all properties.
function Rotate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in RotateBtn.
function RotateBtn_Callback(hObject, eventdata, handles)
% hObject    handle to RotateBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Scale_Callback(hObject, eventdata, handles)
% hObject    handle to Scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Scale as text
%        str2double(get(hObject,'String')) returns contents of Scale as a double


% --- Executes during object creation, after setting all properties.
function Scale_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ScaleBtn.
function ScaleBtn_Callback(hObject, eventdata, handles)
% hObject    handle to ScaleBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scaleheight = str2double(get(handles.Scale,'String'));
scalewidth = str2double(get(handles.Scale,'String'));

M = [scalewidth 0 0;0 scaleheight 0; 0 0 1];

handles.Result = GeometricLinearTransform(handles.Image,M);
axes(handles.RImg);
imshow(handles.Result);




function Shear_Callback(hObject, eventdata, handles)
% hObject    handle to Shear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Shear as text
%        str2double(get(hObject,'String')) returns contents of Shear as a double


% --- Executes during object creation, after setting all properties.
function Shear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Shear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ShearBtn.
function ShearBtn_Callback(hObject, eventdata, handles)
% hObject    handle to ShearBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
M = [1 str2double(get(handles.Shear,'String')) 0;str2double(get(handles.Shear,'String')) 1 0; 0 0 1];
handles.Result =  GeometricLinearTransform(handles.Image,M);
axes(handles.RImg);
imshow(handles.Result);


% --- Executes on button press in allBtn.
function allBtn_Callback(hObject, eventdata, handles)
% hObject    handle to allBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Applynot.
function Applynot_Callback(hObject, eventdata, handles)
% hObject    handle to Applynot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Result = NOT(handles.Image);
% Save the handles structure.
guidata(hObject, handles);
% Set current drawing axes to "RImg"
axes(handles.RImg);
imshow(handles.Result);


% --- Executes on slider movement.
function GammaSlider_Callback(hObject, eventdata, handles)
% hObject    handle to GammaSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Gval = get(hObject,'Value');
handles.Result = Gamma(handles.Image , Gval);
% Save the handles structure.
guidata(hObject, handles);
% Set current drawing axes to "RImg"
axes(handles.RImg);
imshow(handles.Result);


% --- Executes during object creation, after setting all properties.
function GammaSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GammaSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in AddImg.
function AddImg_Callback(hObject, eventdata, handles)
% hObject    handle to AddImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.Img1);
image1=handles.Image;

axes(handles.Img2);
image2=handles.Image2;

handles.Result = Add(image1,image2);

axes(handles.RImg);
imshow(handles.Result); 
