MsgBox, Enter your provided key.
InputBox, enteredKey, AHK authentication, Enter your key:


if (enteredKey = "DEV") {
    MsgBox, You have entered a dev key, please select your config file.

} 

else if (enteredKey = "A1b2C3d4E5F6G7H" || enteredKey = "I8j9K0L1m2N3O4P" || enteredKey = "Q5R6S7T8U9V0W1X" || enteredKey = "Y2Z3A4B5C6D7E8F" || enteredKey = "G9H0I1J2K3L4M5N" || enteredKey = "O6P7Q8R9S0T1U2V" || enteredKey = "W3X4Y5Z6A7B8C9D" || enteredKey = "E0F1G2H3I4J5K6L" || enteredKey = "M7N8O9P0Q1R2S3T" || enteredKey = "U4V5W6X7Y8Z9A0B" || enteredKey = "C1D2E3F4G5H6I7J" || enteredKey = "K8L9M0N1O2P3Q4R" || enteredKey = "S5T6U7V8W9X0Y1Z" || enteredKey = "A2B3C4D5E6F7G8H" || enteredKey = "I9J0K1L2M3N4O5P" || enteredKey = "Q6R7S8T9U0V1W2X" || enteredKey = "Y3Z4A5B6C7D8E9F" || enteredKey = "G0H1I2J3K4L5M6N" || enteredKey = "O7P8Q9R0S1T2U3V" || enteredKey = "W4X5Y6Z7A8B9C0D" || enteredKey = "E1F2G3H4I5J6K7L" || enteredKey = "M8N9O0P1Q2R3S4T" || enteredKey = "U5V6W7X8Y9Z0A1B" || enteredKey = "C2D3E4F5G6H7I8J" || enteredKey = "K9L0M1N2O3P4Q5R" || enteredKey = "S6T7U8V9W0X1Y2Z" || enteredKey = "A3B4C5D6E7F8G9H" || enteredKey = "I0J1K2L3M4N5O6P" || enteredKey = "Q7R8S9T0U1V2W3X" || enteredKey = "Y4Z5A6B7C8D9E0F" || enteredKey = "G1H2I3J4K5L6M7N" || enteredKey = "O8P9Q0R1S2T3U4V" || enteredKey = "W5X6Y7Z8A9B0C1D" || enteredKey = "E2F3G4H5I6J7K8L" || enteredKey = "M9N0O1P2Q3R4S5T" || enteredKey = "U6V7W8X9Y0Z1A2B") {

    MsgBox, You have entered a customer key, please select your config file.
}
else if (enteredKey = "AHc4wpE9KTr7LQ" || enteredKey = "JNr8mzW3UVfg5K" || enteredKey = "ZKi1opD4XYlj7M" || enteredKey = "QVb5jtR8TYih2M" || enteredKey = "RXd2nsY9VWpk3P" || enteredKey = "CLo7uvF6GJpm1N" || enteredKey = "WUj8gfR3LMvo5T" || enteredKey = "MPn4jdK2YZri7Q" || enteredKey = "XMv6khF9TPlr8R" || enteredKey = "YQe9bnX3RJvm4U") {

    MsgBox, You have entered a gift key, please select your config file.
} else {

    MsgBox, Incorrect license key. Exiting...
    ExitApp
}




        FileSelectFile, configFile, 1, , Select settings.json file, JSON Files (settings.json)
        if ErrorLevel  ; User cancelled or error occurred  
    {
            MsgBox, No file selected. Exiting...
            ExitApp
    }

        File := FileOpen(configFile, "r")
    if !File
    {
        MsgBox, Failed to open selected configuration file. Exiting...
        ExitApp
    }
    configuration := A_LineFile . "\..\settings.json"
        if (FileExist(configuration)) {
            File := FileOpen(configuration, "r")
            configData := File.Read(())
        File.Close(())
    config := JSON.Load((configData))
    } else 

{



; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
; 
; 
; Don change nun under here
;
;
; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




~;::
    MsgBox, panic key pressed, AHK closed.
    ExitApp
return
}


#Persistent
 #NoEnv
  #SingleInstance, Force
   #InstallKeybdHook
    #UseHook
     #KeyHistory, 0
      #HotKeyInterval 1
        #MaxHotkeysPerInterval 127
         SetKeyDelay, -1, -1
          SetControlDelay, -1
           SetMouseDelay, -1
            SetWinDelay, -1
             SendMode, InputThenPlay
              SetBatchLines, -1
               ListLines, Off
              CoordMode, Pixel, screen
             PID := DllCall("GetCurrentProcessId")
            Process, Priority, %PID%, High
           DllCall("QueryPerformanceFrequency", "Int64*", Update)
          #NoEnv
         #SingleInstance, Force
        #Persistent
       #InstallKeybdHook
      #UseHook
     #KeyHistory, 0
    #HotKeyInterval 1
   #MaxHotkeysPerInterval 127
  SetKeyDelay, -1, -1
 SetControlDelay, -1
SetMouseDelay, -1
SetWinDelay, -1
SendMode, InputThenPlay
SetBatchLines, -1
ListLines, Off

CoordMode, Pixel, screen
PID := DllCall("GetCurrentProcessId")
Process, Priority, %PID%, High
DllCall("QueryPerformanceFrequency", "Int64*", Update)
Msgbox, AHK has been loaded. Open roblox.

class JSON
{
    class Load extends JSON.Functor
    {
        Call(self, ByRef text, reviver:="")
        {
            this.rev := IsObject(reviver) ? reviver : false
            this.keys := this.rev ? {} : false
            static quot := Chr(34), bashq := "\" . quot
            , json_value := quot . "{[01234567890-tfn"
            , json_value_or_array_closing := quot . "{[]01234567890-tfn"
            , object_key_or_object_closing := quot . "}"
            key := ""
            is_key := false
            root := {}
            stack := [root]
            next := json_value
            pos := 0
            
            while ((ch := SubStr(text, ++pos, 1)) != "") {
                if InStr(" `t`r`n", ch)
                    continue
                if !InStr(next, ch, 1)
                    this.ParseError(next, text, pos)
                holder := stack[1]
                is_array := holder.IsArray
                if InStr(",:", ch) {
                    next := (is_key := !is_array && ch == ",") ? quot : json_value
                } else if InStr("}]", ch) {
                    ObjRemoveAt(stack, 1)
                    next := stack[1]==root ? "" : stack[1].IsArray ? ",]" : ",}"
                } else {
                    if InStr("{[", ch) {
                        static json_array := Func("Array").IsBuiltIn || ![].IsArray ? {IsArray: true} : 0
                        (ch == "{")
                            ? ( is_key := true
                              , value := {}
                              , next := object_key_or_object_closing )
                            : ( value := json_array ? new json_array : []
                              , next := json_value_or_array_closing )
                        ObjInsertAt(stack, 1, value)
                        if (this.keys)
                            this.keys[value] := []
                    } else {
                        if (ch == quot) {
                            i := pos
                            while (i := InStr(text, quot,, i+1)) {
                                value := StrReplace(SubStr(text, pos+1, i-pos-1), "\\", "\u005c")
                                static tail := A_AhkVersion<"2" ? 0 : -1
                                if (SubStr(value, tail) != "\")
                                    break
                            }
                            if (!i)
                                this.ParseError("'", text, pos)
                            value := StrReplace(value,  "\/",  "/")
                            , value := StrReplace(value, bashq, quot)
                            , value := StrReplace(value,  "\b", "`b")
                            , value := StrReplace(value,  "\f", "`f")
                            , value := StrReplace(value,  "\n", "`n")
                            , value := StrReplace(value,  "\r", "`r")
                            , value := StrReplace(value,  "\t", "`t")
                            pos := i
                            i := 0
                            while (i := InStr(value, "\",, i+1)) {
                                if !(SubStr(value, i+1, 1) == "u")
                                    this.ParseError("\", text, pos - StrLen(SubStr(value, i+1)))
                                uffff := Abs("0x" . SubStr(value, i+2, 4))
                                if (A_IsUnicode || uffff < 0x100)
                                    value := SubStr(value, 1, i-1) . Chr(uffff) . SubStr(value, i+6)
                            }
                            if (is_key) {
                                key := value, next := ":"
                                continue
                            }
                        } else {
                            value := SubStr(text, pos, i := RegExMatch(text, "[\]\},\s]|$",, pos)-pos)
                            static number := "number", integer :="integer"
                            if value is %number%
                            {
                                if value is %integer%
                                    value += 0
                            }
                            else if (value == "true" || value == "false")
                                value := %value% + 0
                            else if (value == "null")
                                value := ""
                            else
                                this.ParseError(next, text, pos, i)
                            pos += i-1
                        }
                        next := holder==root ? "" : is_array ? ",]" : ",}"
                    }
                    is_array? key := ObjPush(holder, value) : holder[key] := value
                    if (this.keys && this.keys.HasKey(holder))
                        this.keys[holder].Push(key)
                }
            }
            return this.rev ? this.Walk(root, "") : root[""]
        }

        ParseError(expect, ByRef text, pos, len:=1)
        {
            static quot := Chr(34), qurly := quot . "}"
            line := StrSplit(SubStr(text, 1, pos), "`n", "`r").Length()
            col := pos - InStr(text, "`n",, -(StrLen(text)-pos+1))
            msg := Format("{1}`n`nLine:`t{2}`nCol:`t{3}`nChar:`t{4}"
            ,     (expect == "")     ? "Extra data"
            : (expect == "'")    ? "Unterminated string starting at"
            : (expect == "\")    ? "Invalid \escape"
            : (expect == ":")    ? "Expecting ':' delimiter"
            : (expect == quot)   ? "Expecting object key enclosed in double quotes"
            : (expect == qurly)  ? "Expecting object key enclosed in double quotes or object closing '}'"
            : (expect == ",}")   ? "Expecting ',' delimiter or object closing '}'"
            : (expect == ",]")   ? "Expecting ',' delimiter or array closing ']'"
            : InStr(expect, "]") ? "Expecting JSON value or array closing ']'"
            :                      "Expecting JSON value(string, number, true, false, null, object or array)"
            , line, col, pos)
            static offset := A_AhkVersion<"2" ? -3 : -4
            throw Exception(msg, offset, SubStr(text, pos, len))
        }

        Walk(holder, key)
        {
            value := holder[key]
            if IsObject(value) {
                for i, k in this.keys[value] {
                    v := this.Walk(value, k)
                    if (v != JSON.Undefined)
                        value[k] := v
                    else
                        ObjDelete(value, k)
                }
            }
            return this.rev.Call(holder, key, value)
        }
    }

    class Dump extends JSON.Functor
    {
        Call(self, value, replacer:="", space:="")
        {
            this.rep := IsObject(replacer) ? replacer : ""
            this.gap := ""
            if (space) {
                static integer := "integer"
                if space is %integer%
                    Loop, % ((n := Abs(space))>10 ? 10 : n)
                        this.gap .= " "
                else
                    this.gap := SubStr(space, 1, 10)
                this.indent := "`n"
            }
            return this.Str({"": value}, "")
        }

        Str(holder, key)
        {
            value := holder[key]
            if (this.rep)
                value := this.rep.Call(holder, key, ObjHasKey(holder, key) ? value : JSON.Undefined)
            if IsObject(value) {
                static type := A_AhkVersion<"2" ? "" : Func("Type")
                if (type ? type.Call(value) == "Object" : ObjGetCapacity(value) != "") {
                    if (this.gap) {
                        stepback := this.indent
                        this.indent .= this.gap
                    }
                    is_array := value.IsArray
                    if (!is_array) {
                        for i in value
                            is_array := i == A_Index
                        until !is_array
                    }
                    str := ""
                    if (is_array) {
                        Loop, % value.Length() {
                            if (this.gap)
                                str .= this.indent
                            v := this.Str(value, A_Index)
                            str .= (v != "") ? v . "," : "null,"
                        }
                    } else {
                        colon := this.gap ? ": " : ":"
                        for k in value {
                            v := this.Str(value, k)
                            if (v != "") {
                                if (this.gap)
                                    str .= this.indent
                                str .= this.Quote(k) . colon . v . ","
                            }
                        }
                    }
                    if (str != "") {
                        str := RTrim(str, ",")
                        if (this.gap)
                            str .= stepback
                    }
                    if (this.gap)
                        this.indent := stepback
                    return is_array ? "[" . str . "]" : "{" . str . "}"
                }
            } else
                return ObjGetCapacity([value], 1)=="" ? value : this.Quote(value)
        }

        Quote(string)
        {
            static quot := Chr(34), bashq := "\" . quot
            if (string != "") {
                string := StrReplace(string,  "\",  "\\")
                , string := StrReplace(string, quot, bashq)
                , string := StrReplace(string, "`b",  "\b")
                , string := StrReplace(string, "`f",  "\f")
                , string := StrReplace(string, "`n",  "\n")
                , string := StrReplace(string, "`r",  "\r")
                , string := StrReplace(string, "`t",  "\t")
                static rx_escapable := A_AhkVersion<"2" ? "O)[^\x20-\x7e]" : "[^\x20-\x7e]"
                while RegExMatch(string, rx_escapable, m)
                    string := StrReplace(string, m.Value, Format("\u{1:04x}", Ord(m.Value)))
            }
            return quot . string . quot
        }
    }

    Undefined[]
    {
        get {
            static empty := {}, vt_empty := ComObject(0, &empty, 1)
            return vt_empty
        }
    }

    class Functor
    {
        __Call(method, ByRef arg, args*)
        {
            if IsObject(method)
                return (new this).Call(method, arg, args*)
            else if (method == "")
                return (new this).Call(arg, args*)
        }
    }
}


configuration := A_LineFile . "\..\settings.json"
if (FileExist(configuration)) {
File := FileOpen(configuration, "r")
configData := File.Read()
File.Close()
config := JSON.Load(configData)




} else {
MsgBox, AHK - Failed to locate the configuration file, Closing.
ExitApp
}
AimbotKey := config.AHK.Keys.Togglekey
PauseKey := config.AHK.Keys.Pause
Colouring := config.AHK.Colour.Colouring
LinearCurvingX := config.AHK.Spline.LinearCurvingX
LinearCurvingY := config.AHK.Spline.LinearCurvingY
CameraToGunFov := config.AHK.Misc.CameraToGunFov
AimbotUpdateTick := config.AHK.Misc.AimbotUpdateTick
SmoothingX := config.AHK.Smoothing.SmoothingX / LinearCurvingX
SmoothingY := config.AHK.Smoothing.SmoothingY / LinearCurvingY
SmoothingMultiplierX := config.AHK.Smoothing.SmoothingMultiplierX
SmoothingMultiplierY := config.AHK.Smoothing.SmoothingMultiplierY
SmoothingSeparatorX := config.AHK.Smoothing.SmoothingSeparatorX
SmoothingSeparatorY := config.AHK.Smoothing.SmoothingSeparatorY
FovOffsetX := config.AHK.Fov.FovOffsetX
FovOffsetY := config.AHK.Fov.FovOffsetY
FlickTime := config.AHK.Misc.FlickTime
AimbotMS := config.AHK.Misc.AimbotUpdateMS
Predicting := config.AHK.Smoothing.Predicting.Enabled
PredictingMode := config.AHK.Smoothing.Predicting.Mode
PredictingX := config.AHK.Smoothing.Predicting.PredictingX
PredictingY := config.AHK.Smoothing.Predicting.PredictingY
FallbackPixelX := 0
FallbackPixelY := 0
ModelPixels := [0xFDFDFC]
CameraPositionX := A_ScreenWidth
CameraPositionY := A_ScreenHeight
WorldToScreenDivider := 2
ScreenSizeX := Floor(CameraPositionX // WorldToScreenDivider) - FallbackPixelX
ScreenSizeY := Floor(CameraPositionY // WorldToScreenDivider) - FallbackPixelY
FovOffsetX := fallback(FovOffsetX, CameraToGunFov, CameraPositionX, CameraPositionY)
FovOffsetY := fallback(FovOffsetY, CameraToGunFov, CameraPositionX, CameraPositionY)
CameraPositionA := ScreenSizeX - FovOffsetX
CameraPositionB := ScreenSizeY - FovOffsetY
CameraPositionC := ScreenSizeX + FovOffsetX
CameraPositionD := ScreenSizeY + FovOffsetY
Paused := false
LastPosition := [0, 0]
toggle := false
Loop {
KeyWait, %AimbotKey%, D
Position := ModelSearch(CameraPositionA, CameraPositionB, CameraPositionC, CameraPositionD, ModelPixels, Colouring)
if (!ErrorLevel) {
Start := Position[1]
End := Position[5]
LookAtX := Position[1] - ScreenSizeX
LookAtY := Position[5] - ScreenSizeY
EndpointX :=
EndpointY :=
if (Predicting)
{
if (PredictingMode == "Ideal")
{
EndpointX := Floor(coordinatemode(LookAtX + PredictingX, CameraToGunFov, A_ScreenWidth, A_ScreenHeight) * (SmoothingX/SmoothingSeparatorX) * SmoothingMultiplierX)
EndpointY := Floor(coordinatemode(LookAtY + PredictingY, CameraToGunFov, A_ScreenWidth, A_ScreenHeight) * (SmoothingY/SmoothingSeparatorY) * SmoothingReplicatorY)
}
if (PredictingMode == "Multiplication")
{
EndpointX := Floor(coordinatemode((LookAtX * PredictingX), CameraToGunFov, A_ScreenWidth, A_ScreenHeight) * (SmoothingX/SmoothingSeparatorX) * SmoothingMultiplierX)
EndpointY := Floor(coordinatemode((LookAtY * PredictingY), CameraToGunFov, A_ScreenWidth, A_ScreenHeight) * (SmoothingY/SmoothingSeparatorY) * SmoothingMultiplierY)
}
}
else
{
EndpointX := Floor(coordinatemode( LookAtX, CameraToGunFov, A_ScreenWidth, A_ScreenHeight ) * ( SmoothingX/SmoothingSeparatorX ) * SmoothingMultiplierX )
EndpointY := Floor(coordinatemode( LookAtY, CameraToGunFov, A_ScreenWidth, A_ScreenHeight ) * ( SmoothingY/SmoothingSeparatorY ) * SmoothingMultiplierY )
}
DllCall("QueryPerformanceCounter", "Int64*", DeltaTime)
if ((DeltaTime - FlickTime) / Update * AimbotMS >= 1000 / AimbotUpdateTick) {
DllCall("QueryPerformanceCounter", "Int64*", FlickTime)
DllCall("mouse_event", "uint", 0x0001, "uint", EndpointX, "uint", EndpointY, "uint", 0, "int", 0)
}
}
}
ModelSearch(X1, Y1, X2, Y2, ColorIDs, Variation) {
PixelSearch, OutputVarX, OutputVarY, X1, Y1, X2, Y2, ColorIDs, Variation, Fast RGB
Return [OutputVarX, OutputVarY]
}
degreetoradians(degrees) {
return degrees * ((4 * ATan(1)) / 180)
}
radianstodegrees(radians) {
return radians * (180 / (4 * ATan(1)))
}
coordinatemode(delta, Fov, winWidth, winHeight) {
return radianstodegrees(atan(((delta << 1) / winWidth) * tan(degreetoradians(Fov * 0.5))))
}
fallback(delta, Fov, winWidth, winHeight) {
return winWidth * 0.5 / tan(degreetoradians(Fov * 0.5)) * tan(degreetoradians(delta))
}
screenEncryption(Fov, winWidth, winHeight) {
aspectRatio := (winWidth / winHeight) / (4 / 3)
return 2 * radianstodegrees(atan(tan(degreetoradians(Fov * 0.5)) * aspectRatio))
}
{SendMode Input   
SetWorkingDir %A_ScriptDir%  

}