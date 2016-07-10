%GUI SETUP
function varargout = CycleAnalysis(varargin)
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @CycleAnalysis_OpeningFcn, ...
                       'gui_OutputFcn',  @CycleAnalysis_OutputFcn, ...
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
end

function CycleAnalysis_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;
    guidata(hObject, handles);
end

%More GUI Setup
function varargout = CycleAnalysis_OutputFcn(hObject, eventdata, handles) 
    varargout{1} = handles.output;
end

%Choose engine type
function ramjetButton_Callback(hObject, eventdata, handles)   
    global engineType
    engineType = 1;
end


function turbojetButton_Callback(hObject, eventdata, handles)
    global engineType
    engineType = 2;
end


function turbofanButton_Callback(hObject, eventdata, handles)
    global engineType
    engineType = 3;
end

%Main script
function run_Callback(hObject, eventdata, handles)
    global engineType
    %Get the design parameters
    Ta = str2double(handles.Ta.String);
    Pa = str2double(handles.Pa.String);
    Pf = str2double(handles.Pf.String);
    Ma = str2double(handles.Ma.String);
    Prc = str2double(handles.Prc.String);
    B = str2double(handles.B.String);
    b = str2double(handles.b.String);
    Prf = str2double(handles.Prf.String);
    f = str2double(handles.f.String);
    fab = str2double(handles.fab.String);
    %Get constraints
    Tmax = str2double(handles.Tmax.String);
    Tmaxab = str2double(handles.Tmaxab.String);
    bma = str2double(handles.bma.String);
    %Get mods
    compressorBleed = handles.compressorBleed.Value;
    afterburner = handles.afterburner.Value;
    combinedNozzle = handles.combinedNozzle.Value;
    
    inputs = [Ta Pa Pf Ma Prc B b Prf f fab Tmax Tmaxab bma compressorBleed afterburner combinedNozzle];
    if engineType == 1
        results = ramjet(inputs);
    elseif engineType == 2
        results = turbojet(inputs);
    else
        results = turbofan(inputs);
    end
     

    
end
