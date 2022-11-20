#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
F7::
    x := 0
    y := 0
    C := 0
    MouseGetPos, x, y
    PixelGetColor, cur_Color, %x%, %y% ,[Slow RGB]
    MsgBox, %x% %y% %C%