#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

/*
F1 调试，
F3 寻找箱子中所有的金粒，将其放入背包里
F4 寻找箱子中所有的腐肉，将其放入背包里

F7 一键合成
F8 一键丢弃
F9 退出

*/

F9::Pause
F1::
    MouseMove, 638, 152
    ;627 141
    ;11 11
Return
x := 0
y := 0
cur_Color := 0
MouseGetPos, x, y
PixelGetColor, cur_Color, %x%, %y% ,[Slow RGB]
MsgBox, %x% %y% %cur_Color%
Return
F3::
    ;遍历所有的方格，如果当前方格是金粒，shift + click
    ;金粒对应颜色 B24320
    x0 := 672 + 11
    y0 := 188 + 11
    delta := 72
    cur_Color := 0
    Loop 6{
        i := A_Index - 1
        Loop 9{
            j := A_Index - 1
            x := x0 + j * delta
            y := y0
            MouseMove, x, y
            PixelGetColor, cur_Color, x, y,[Slow RGB]
            ; MsgBox, %x% %y% %cur_Color%
            ;cmpColor(cur_Color,"0xD9A190")
            if(cmpColor(cur_Color,"0xE6AF15") || cmpColor(cur_Color,"0xF3D78A") || cmpColor(cur_Color,"0x1D0A10")){
                Send "{Shift down}"
                MouseMove, x, y
                MouseClick, left, x, y
                MouseMove, 0, 0
                Send "{Shift up}"
                ; MsgBox, %x% %y% %cur_Color%
            }
        }
        y0 := y0 + delta
    }
return
F4::
    ;遍历所有的方格，如果当前方格是腐肉，shift + click
    ;腐肉对应颜色 B24320
    x0 := 672 + 11
    y0 := 188 + 11
    delta := 72
    cur_Color := 0
    Loop 6{
        i := A_Index - 1
        Loop 9{
            j := A_Index - 1
            x := x0 + j * delta
            y := y0
            MouseMove, x, y
            PixelGetColor, cur_Color, x, y,[Slow RGB]
            ; MsgBox, %x% %y% %cur_Color%
            ;cmpColor(cur_Color,"0xD9A190")
            if(cmpColor(cur_Color,"0x1A0411") || cmpColor(cur_Color,"0xB24320") || cmpColor(cur_Color,"0xD9A190")){
                Send "{Shift down}"
                MouseMove, x, y
                MouseClick, left, x, y
                MouseMove, 0, 0
                Send "{Shift up}"
                ; MsgBox, %x% %y% %cur_Color%
            }
        }
        y0 := y0 + delta
    }
return
F7::
    {
        x0 := 980
        y0 := 564
        x1 := 980
        y1 := 796
        delta := 72
        cur_Color := 0

        xr := 1450
        yr := 370

        Loop 9{
            x := x0 + delta * (A_Index - 1)
            y := y0
            PixelGetColor, cur_Color, x, y
            ;MsgBox %cur_Color% %x% %y% %x0% %y0%
            ;if(cur_Color == "8B8B8B")
            {
                MouseMove x, y
                sleep 20
                Send "{Shift down}"
                MouseClick left, x, y
                Send "{Shift up}"
                MouseMove 0, 0
            }
        }

        MouseMove xr, yr
        sleep 20
        Send "{Shift down}"
        MouseClick left, xr, yr
        Send "{Shift up}"
        MouseMove 0, 0

        y0 := y0 + delta
        Loop 9{
            x := x0 + delta * (A_Index - 1)
            y := y0
            PixelGetColor, cur_Color, x, y
            ;if(cur_Color == "8B8B8B")
            {
                MouseMove x, y
                sleep 20
                Send "{Shift down}"
                MouseClick left, x, y
                Send "{Shift up}"
                MouseMove 0, 0
            }
        }

        MouseMove xr, yr
        sleep 20
        Send "{Shift down}"
        MouseClick left, xr, yr
        Send "{Shift up}"
        MouseMove 0, 0

        y0 := y0 + delta
        Loop 9{
            x := x0 + delta * (A_Index - 1)
            y := y0
            PixelGetColor, cur_Color, x, y
            ;if(cur_Color == "8B8B8B")
            {
                MouseMove x, y
                sleep 20
                Send "{Shift down}"
                MouseClick left, x, y
                Send "{Shift up}"
                MouseMove 0, 0
            }
        }

        MouseMove xr, yr
        sleep 20
        Send "{Shift down}"
        MouseClick left, xr, yr
        Send "{Shift up}"
        MouseMove 0, 0

        y0 := y0 + delta
        Loop 9{
            x := x0 + delta * (A_Index - 1)
            y := y1
            PixelGetColor, cur_Color, x, y
            ;if(cur_Color == "8B8B8B")
            {
                MouseMove x, y
                sleep 20
                Send "{Shift down}"
                MouseClick left, x, y
                Send "{Shift up}"
                MouseMove 0, 0
            }
        }

        MouseMove xr, yr
        sleep 20
        Send "{Shift down}"
        MouseClick left, xr, yr
        Send "{Shift up}"
        MouseMove 0, 0
    }
return

;F8 一键丢弃所有物品
F8::
    {
        ;>>> p1
        ;array([980, 564])
        ;>>> p3
        ;array([980, 796])
        x0 := 980
        y0 := 564
        x1 := 980
        y1 := 796
        delta := 72
        cur_Color := 0

        Loop 9{
            x := x0 + delta * (A_Index - 1)
            y := y0
            PixelGetColor, cur_Color, x, y
            ;MsgBox %cur_Color% %x% %y% %x0% %y0%
            ;if(cur_Color == "8B8B8B")
            {
                MouseMove x, y
                Send "^q"
                MouseMove 0, 0
            }
        }
        y0 := y0 + delta
        Loop 9{
            x := x0 + delta * (A_Index - 1)
            y := y0
            PixelGetColor, cur_Color, x, y
            ;if(cur_Color == "8B8B8B")
            {
                MouseMove x, y
                Send "^q"
                MouseMove 0, 0
            }
        }
        y0 := y0 + delta
        Loop 9{
            x := x0 + delta * (A_Index - 1)
            y := y0
            PixelGetColor, cur_Color, x, y
            ;if(cur_Color == "8B8B8B")
            {
                MouseMove x, y
                Send "^q"
                MouseMove 0, 0
            }
        }
        y0 := y0 + delta
        Loop 9{
            x := x0 + delta * (A_Index - 1)
            y := y1
            PixelGetColor, cur_Color, x, y
            ;if(cur_Color == "8B8B8B")
            {
                MouseMove x, y
                Send "^q"
                MouseMove 0, 0
            }
        }
    }
Return

cmpColor(Color1 , Color2) ;定义颜色比较函数ysbj()，比较参数Color1 , Color2两个颜色的相似度
{
    ;在 RGB 颜色模型中 ,R,G,B 三个分量相当于三位空间的 x 轴 ,y 轴和 z 轴
    ;这样一来 , 判断两象素的相似度即计算两个像素在 RGB 空间的距离 ( 色差 )
    a := color1 ;将颜色color1赋值给变量a
    ar := colourRGB(a).R ;调用函数获取a的R值并赋值给变量ar
    ag := colourRGB(a).G ;调用函数获取a的G值并赋值给变量ag
    ab := colourRGB(a).B ;调用函数获取a的B值并赋值给变量ab

    b := color2 ;将颜色color2赋值给变量b
    br := colourRGB(b).R ;调用函数获取b的R值并赋值给变量br
    bg := colourRGB(b).G ;调用函数获取b的G值并赋值给变量bg
    bb := colourRGB(b).B ;调用函数获取b的B值并赋值给变量bb

    fz := 10 ;定义变量fz表示颜色相近的阀值，小于阀值的为相似
    ;比较两个颜色各色值的差的平方和是否小于阀值，小于则相似
    if( ((ar-br)*(ar-br)+(ag-bg)*(ag-bg)+(ab-bb)*(ab-bb)) < fz )
    {
        Return 1 ;返回值1
    }

}
return

colourRGB(colour) ;函数获取颜色R,G,B,的各个值
{
    R := (colour & 0xFF0000) >> 16
    G := (colour & 0x00FF00) >> 8
    B := (colour & 0x0000FF) >> 0
    return { R: R, G: G, B: B }
}
return