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
        [outputs, Tis, Pis] = ramjet(inputs);
    elseif engineType == 2
        [outputs, Tis, Pis] = turbojet(inputs);
    else
        [outputs, Tis, Pis] = turbofan(inputs);
    end
    
    handles.specificThrust.String = num2str(outputs(1));
    handles.fmax.String = num2str(outputs(2));
    handles.fmaxab.String = num2str(outputs(3));
    handles.ue.String = num2str(outputs(4));
    handles.uef.String = num2str(outputs(5));
    handles.uec.String = num2str(outputs(6));
    handles.TSFC.String = num2str(outputs(7));
    handles.np.String = num2str(outputs(8));
    handles.nth.String = num2str(outputs(9));
    handles.no.String = num2str(outputs(10));
    handles.u.String = num2str(outputs(11));
    handles.wf.String = num2str(outputs(12));
    handles.wc.String = num2str(outputs(13));
    handles.wt.String = num2str(outputs(14));
    handles.wft.String = num2str(outputs(15));
    handles.wp.String = num2str(outputs(16));
    
    handles.T1.String = num2str(Tis(1));
    handles.T2.String = num2str(Tis(2));
    handles.T3.String = num2str(Tis(3));
    handles.T4.String = num2str(Tis(4));
    handles.T51.String = num2str(Tis(5));
    handles.T5m.String = num2str(Tis(6));
    handles.T52.String = num2str(Tis(7));
    handles.T6.String = num2str(Tis(8));
    handles.Te.String = num2str(Tis(9));
    handles.Tef.String = num2str(Tis(10));
    handles.T7.String = num2str(Tis(11));
    handles.Tec.String = num2str(Tis(12));
    
    handles.P1.String = num2str(Pis(1));
    handles.P2.String = num2str(Pis(2));
    handles.P3.String = num2str(Pis(3));
    handles.P4.String = num2str(Pis(4));
    handles.P51.String = num2str(Pis(5));
    handles.P5m.String = num2str(Pis(6));
    handles.P52.String = num2str(Pis(7));
    handles.P6.String = num2str(Pis(8));
    handles.Pe.String = num2str(Pis(9));
    handles.Pef.String = num2str(Pis(10));
    handles.P7.String = num2str(Pis(11));
    handles.Pec.String = num2str(Pis(12));
    handles.Pfp.String = num2str(Pis(13));
    
    
end
