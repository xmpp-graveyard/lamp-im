unit WbPopup;   
    
interface  
    
implementation  
    
uses Windows,Controls,Messages,ShDocVw, Forms;
    
var  
 HMouseHook:THandle;   
 Pop: Boolean;   

 //Webbrowser context menu off

function MouseProc(   
   nCode: Integer;     // hook code
   WP: wParam; // message identifier
   LP: lParam  // mouse coordinates   
  ):Integer;stdcall;   
var MHS:TMOUSEHOOKSTRUCT;   
   WC:TWinControl;   
begin  
 Result:=CallNextHookEx(HMouseHook,nCode,WP,LP);   
 if nCode=HC_ACTION then  
  begin  
    MHS:=PMOUSEHOOKSTRUCT(LP)^;   
    if ((WP=WM_RBUTTONDOWN) or (WP=WM_RBUTTONUP)) then  
     begin  
       WC:=FindVCLWindow(MHS.pt);   
       if (WC is TWebBrowser) then  
       begin  
         Result:=1;   
         if (TWebBrowser(WC).PopupMenu<>nil) and (WP=WM_RBUTTONUP) then  
          begin  
           if Pop then Exit;   
           Pop := True;   
           TWebBrowser(WC).PopupMenu.Popup(MHS.pt.x,MHS.pt.y);   
           Pop := False;   
          end;   
       end;   
     end;   
  end;   
end;   
    
initialization  
    
    
HMouseHook:=SetWindowsHookEx(WH_MOUSE,@MouseProc,HInstance,GetCurrentThreadID);   
    
finalization  
try  
 UnhookWindowsHookEx(HMouseHook);   
 Sleep(100);   
// CloseHandle(HMouseHook);
except  
    
end;   
end.  
