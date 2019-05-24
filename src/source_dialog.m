function source_dialog(hObject,eventdata,handles)
% simple dialog ui for setting generic data settings
global custom
hfmain=figure;
set(hfmain,'units','pixel',...
    'position',[200, 100, 250, 450],...
    'numbertitle','off',...
    'name','source settings',...
    'menubar','none');
bcolor=get(hfmain,'color');
% frame source select
hfss=uipanel(hfmain,'units',...
    'normalized','position',...
    [0.05 0.25 0.9 0.7],'title',...
    'source setting','backgroundcolor',...
    bcolor,'fontweight','bold');
hetype=uicontrol(hfss,'style','radiobutton',...
    'units','normalized',...
    'position',[0.05 0.88 0.6 0.1],...
    'string','Electric dipole source',...
    'tag','esource',...
    'backgroundcolor',bcolor,...
    'value',1);
hhtype=uicontrol(hfss,'style','radiobutton',...
    'units','normalized',...
    'position',[0.05 0.75 0.6 0.1],...
    'string','Magnetic dipole source',...
    'tag','msource',...
    'backgroundcolor',bcolor,...
    'value',0);
hx0tex=uicontrol(hfss,'style','text',...
    'units','normalized',...
    'position',[0.05 0.55 0.2 0.12],...
    'string','X0:',...
    'tag','x0t',...
    'backgroundcolor',bcolor);
hx1tex=uicontrol(hfss,'style','text',...
    'units','normalized',...
    'position',[0.5 0.55 0.2 0.12],...
    'string','X1:',...
    'tag','x1t',...
    'backgroundcolor',bcolor);
hy0tex=uicontrol(hfss,'style','text',...
    'units','normalized',...
    'position',[0.05 0.4 0.2 0.12],...
    'string','Y0:',...
    'tag','y1t',...
    'backgroundcolor',bcolor);
hy1tex=uicontrol(hfss,'style','text',...
    'units','normalized',...
    'position',[0.5 0.4 0.2 0.12],...
    'string','Y1:',...
    'tag','y1t',...
    'backgroundcolor',bcolor);
hz0tex=uicontrol(hfss,'style','text',...
    'units','normalized',...
    'position',[0.05 0.25 0.2 0.12],...
    'string','Z0:',...
    'tag','z0t',...
    'backgroundcolor',bcolor);
hz1tex=uicontrol(hfss,'style','text',...
    'units','normalized',...
    'position',[0.5 0.25 0.2 0.12],...
    'string','Z1:',...
    'tag','z1t',...
    'backgroundcolor',bcolor);

hcurtex=uicontrol(hfss,'style','text',...
    'units','normalized',...
    'position',[0.05 0.12 0.3 0.1],...
    'string','current(A):',...
    'tag','currentex',...
    'backgroundcolor',bcolor);
hbackrhotex=uicontrol(hfss,'style','text',...
    'units','normalized',...
    'position',[0.05 0.0 0.4 0.1],...
    'string','b. res.(Ohmm):',...
    'tag','backrhotex',...
    'backgroundcolor',bcolor);
hx0=uicontrol(hfss,'style','edit',...
    'units','normalized',...
    'position',[0.25 0.6 0.2 0.1],...
    'string',num2str(custom.sloc0(1)),...
    'tag','sx0',...
    'backgroundcolor',bcolor);
hx1=uicontrol(hfss,'style','edit',...
    'units','normalized',...
    'position',[0.7 0.6 0.2 0.1],...
    'string',num2str(custom.sloc1(1)),...
    'tag','sx1',...
    'backgroundcolor',bcolor);
hy0=uicontrol(hfss,'style','edit',...
    'units','normalized',...
    'position',[0.25 0.45 0.2 0.1],...
    'string',num2str(custom.sloc0(2)),...
    'tag','sy0',...
    'backgroundcolor',bcolor);
hy1=uicontrol(hfss,'style','edit',...
    'units','normalized',...
    'position',[0.7 0.45 0.2 0.1],...
    'string',num2str(custom.sloc1(2)),...
    'tag','sy1',...
    'backgroundcolor',bcolor);
hz0=uicontrol(hfss,'style','edit',...
    'units','normalized',...
    'position',[0.25 0.3 0.2 0.1],...
    'string',num2str(custom.sloc0(3)),...
    'tag','sz0',...
    'backgroundcolor',bcolor);
hz1=uicontrol(hfss,'style','edit',...
    'units','normalized',...
    'position',[0.7 0.3 0.2 0.1],...
    'string',num2str(custom.sloc1(3)),...
    'tag','sz1',...
    'backgroundcolor',bcolor);
hcurrent=uicontrol(hfss,'style','edit',...
    'units','normalized',...
    'position',[0.55 0.15 0.3 0.1],...
    'string',num2str(custom.scurrent),...
    'tag','scurrent',...
    'backgroundcolor',bcolor);
hbackrho=uicontrol(hfss,'style','edit',...
    'units','normalized',...
    'position',[0.55 0.03 0.3 0.1],...
    'string',num2str(custom.sbackground),...
    'tag','sbackrho',...
    'backgroundcolor',bcolor);
hquit=uicontrol(hfmain,'style','pushbutton',...
    'units','normalized',...
    'position',[0.65 0.03 0.3 0.06],...
    'string','DONE',...
    'tag','quit',...
    'enable','on');
handles.sources=[hetype,hhtype,hx0,hx1,hy0,hy1,hz0,hz1,hcurrent,hbackrho];
set(hx0,'callback',@set_source_box_value);
set(hx1,'callback',@set_source_box_value);
set(hy0,'callback',@set_source_box_value);
set(hy1,'callback',@set_source_box_value);
set(hz0,'callback',@set_source_box_value);
set(hz1,'callback',@set_source_box_value);
set(hcurrent,'callback',@set_source_box_value);
set(hbackrho,'callback',@set_source_box_value);
set(hquit,'callback',{@quit_this,hfmain});
return

function set_source_box_value(hObject,eventdata)
% a silly function to set the value of current text box to global struct 
% "custom"
global custom
tag = get(hObject,'tag');
txt = get(hObject,'string');
if strcmp(eventdata.EventName,'Action')
    disp('box value changed')
else
    return
end
switch tag
    case 'sx0'
        custom.sloc0(1) = str2double(txt);
    case 'sx1'
        custom.sloc1(1) = str2double(txt);
    case 'sy0'
        custom.sloc0(2) = str2double(txt);
    case 'sy1'
        custom.sloc1(2) = str2double(txt);
    case 'sz0'
        custom.sloc0(3) = str2double(txt);
    case 'sz1'
        custom.sloc1(3) = str2double(txt);
    case 'scurrent'
        custom.scurrent = str2double(txt);
    case 'sbackrho'
        custom.sbackground = str2double(txt);
    otherwise
        disp('text box tag not recognized')
        disp(['check your code for ' tag])
end
return