#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

/*
F1 调试，
F2 村民自动交易（源码中调整参数可作出对应更改）
F3 寻找箱子中所有的金粒，将其放入背包里
F4 寻找箱子中所有的腐肉，将其放入背包里
F5 将背包物品全部放入箱子内
F6 将箱子物品全部放入背包内
F7 打开工作台，将金粒一键合成为金锭
F8 打开背包，将背包物品全部丢弃
F9 退出
Ctrl + Y 将上三行的物品放入背包中（留一个占位，比如原有47个，会留1个占位）
Ctrl + H 将下三行的物品放入背包中（同上）

Huoyuuu
22.11.19
*/

^y::
    x0 := 672 + 11
    y0 := 188 + 11
    delta := 72
    Loop 3{
        i := A_Index - 1
        Loop 9{
            j := A_Index - 1
            x := x0 + j * delta
            y := y0 + i * delta
            ; MsgBox, %x0% %y0%
            MouseMove, x, y
            MouseClick, left, x, y
            MouseClick, right, x, y
            MouseMove, x, y + 6 * delta + 50
            MouseClick, left, x, y + 6 * delta + 50
        }
    }
Return

^h::
    x0 := 672 + 11
    y0 := 188 + 11 + 3 * 72
    delta := 72
    Loop 3{
        i := A_Index - 1
        Loop 9{
            j := A_Index - 1
            x := x0 + j * delta
            y := y0 + i * delta
            ; MsgBox, %x0% %y0%
            MouseMove, x, y
            MouseClick, left, x, y
            MouseClick, right, x, y
            MouseMove, x, y + 3 * delta + 50
            MouseClick, left, x, y + 3 * delta + 50
        }
    }
Return

F9::ExitApp

;需要进行第k个交易，就令y_begin = 300 + 80 * k（k从0开始计数）
;铁换绿宝石固定为第2个交易，于是y_begin = 300 + 160 = 460，其余元素保持不动即可
F2::
    x_begin := 600 + 11
    y_begin := 300 + 80 * 2 + 11

    x_result := 1325 + 11
    y_result := 370 + 11

    ;进入交易界面  自动交易两次（保证补货之后也能正常交易）
    Loop 2{
        ;点击左侧交易
        MouseClick, left, x_begin, y_begin,
        Send "{Shift down}"
        ;获取右侧物品
        MouseClick, left, x_result, y_result,
        Send "{Shift up}"
    }
    Send "Esc"
Return

MouseGetPos, x, y
PixelGetColor, cur_Color, x, y
; MsgBox, %x% %y% %cur_Color%
if(cmpColor(cur_Color,"0x585959") || cmpColor(cur_Color,"0x545454") || cmpColor(cur_Color,"0xA7A6A6")){
    y := y - 20
    MouseMove, x, y, 100
    Return
    MouseClick, Right , x, y
    ;进入交易界面  自动交易两次（保证补货之后也能正常交易）
    Loop 2{
        MouseClick, left, xb, yb,
        Send "{Ctrl down}"
        MouseClick, left, xr, yr,
        Send "{Ctrl up}"
    }
    Send "Esc"
}
Return
y := y-250
MouseMove, x, y
Return
F1::
    MouseGetPos, x, y
    PixelGetColor, cur_Color, x, y, [Slow RGB]
    MsgBox, %x% %y% %cur_Color%
Return

;遍历箱子内所有方格，如果当前方格是金粒，shift + click
;金粒对应颜色 0xF3D78A
F3::
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
Return

;遍历箱子内所有方格，如果当前方格是腐肉，shift + click
;腐肉对应颜色 B24320
F4::
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
Return

;遍历背包内所有方格，shift + click
F5::
    x0 := 670 + 11
    y0 := 670 + 11

    delta := 72
    Loop 3{
        i := A_Index - 1
        Loop 9{
            j := A_Index - 1
            x := x0 + j * delta
            y := y0

            MouseMove, x, y
            Send "{Shift down}"
            MouseClick, left, x, y
            Send "{Shift up}"
            MouseMove 0, 0
        }
        y0 := y0 + delta
    }
Return

;遍历箱子内所有方格，shift + click
F6::
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
            Send "{Shift down}"
            MouseMove, x, y
            ; Sleep 20
            MouseClick, left, x, y
            MouseMove, 0, 0
            Send "{Shift up}"
            ; MsgBox, %x% %y% %cur_Color%
        }
        y0 := y0 + delta
    }
Return

;遍历背包内所有方格，shift + click，每行结束对合成物进行shift + click操作
F7::
    x0 := 980 + 11
    y0 := 564 + 11

    xr := 1450 + 11
    yr := 370 + 11
    delta := 72
    Loop 4{
        i := A_Index - 1
        Loop 9{
            j := A_Index - 1
            x := x0 + j * delta
            y := y0

            Send "{shift down}"
            MouseMove, x, y
            ; sleep 20
            MouseClick, left, x, y
            Send "{shift up}"
        }
        Send "{shift down}"
        MouseMove, xr, yr
        ; sleep 20
        MouseClick, left, xr, yr
        Send "{shift up}"
        y0 := y0 + delta
    }
Return

;遍历背包内所有方格，ctrl + q丢弃物品
F8::
    x0 := 980 + 11
    y0 := 564 + 11

    delta := 72
    Loop 4{
        i := A_Index - 1
        Loop 9{
            j := A_Index - 1
            x := x0 + j * delta
            y := y0

            MouseMove, x, y
            Sleep 50
            Send "^q"
        }
        y0 := y0 + delta
    }
Return

cmpColor(Color1 , Color2) ;定义颜色比较函数cmpColor()，比较参数Color1 , Color2两个颜色的相似度
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