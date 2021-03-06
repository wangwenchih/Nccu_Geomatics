#! /usr/bin/env python
#  -*- coding: utf-8 -*-
#
# GUI module generated by PAGE version 7.1
#  in conjunction with Tcl version 8.6
#    Jan 15, 2022 10:45:51 PM CST  platform: Windows NT

import sys
import tkinter as tk
import tkinter.ttk as ttk
from tkinter.constants import *
import Bathymetry_function

class Toplevel1:
    def __init__(self, top=None):
        '''This class configures and populates the toplevel window.
           top is the toplevel containing window.'''
        _bgcolor = '#d9d9d9'  # X11 color: 'gray85'
        _fgcolor = '#000000'  # X11 color: 'black'
        _compcolor = '#d9d9d9' # X11 color: 'gray85'
        _ana1color = '#d9d9d9' # X11 color: 'gray85'
        _ana2color = '#ececec' # Closest X11 color: 'gray92'
        self.style = ttk.Style()
        if sys.platform == "win32":
            self.style.theme_use('winnative')
        self.style.configure('.',background=_bgcolor)
        self.style.configure('.',foreground=_fgcolor)
        self.style.configure('.',font="TkDefaultFont")
        self.style.map('.',background=
            [('selected', _compcolor), ('active',_ana2color)])

        top.geometry("600x407+299+133")
        top.minsize(182, 17)
        top.maxsize(1280, 698)
        top.resizable(1,  1)
        top.title("Bathymetry Toolkit  (NCCU Geomatic)")
        top.configure(background="#d9d9d9")
        top.configure(highlightbackground="#d9d9d9")
        top.configure(highlightcolor="black")

        self.top = top
        self.outpath = tk.StringVar(value='../ENH.csv')
        self.minD = tk.StringVar(value='0')
        self.maxD = tk.StringVar(value='100')
        self.progess = tk.StringVar(value='請載入資料')
        self.droped = tk.StringVar()
        self.errorM = tk.StringVar(value='None')

        self.Label1 = tk.Label(self.top)
        self.Label1.place(relx=0.033, rely=0.022, height=38, width=147)
        self.Label1.configure(activebackground="#f9f9f9")
        self.Label1.configure(activeforeground="black")
        self.Label1.configure(anchor='w')
        self.Label1.configure(background="#d9d9d9")
        self.Label1.configure(compound='left')
        self.Label1.configure(disabledforeground="#a3a3a3")
        self.Label1.configure(foreground="#000000")
        self.Label1.configure(highlightbackground="#d9d9d9")
        self.Label1.configure(highlightcolor="black")
        self.Label1.configure(text='''載入資料''')

        self.GGAb = tk.Button(self.top)
        self.GGAb.place(relx=0.15, rely=0.044, height=26, width=58)
        self.GGAb.configure(activebackground="#ececec")
        self.GGAb.configure(activeforeground="#000000")
        self.GGAb.configure(background="#d9d9d9")
        self.GGAb.configure(command=lambda:Bathymetry_function.Gselect_file())
        self.GGAb.configure(compound='left')
        self.GGAb.configure(disabledforeground="#a3a3a3")
        self.GGAb.configure(foreground="#000000")
        self.GGAb.configure(highlightbackground="#d9d9d9")
        self.GGAb.configure(highlightcolor="black")
        self.GGAb.configure(pady="0")
        self.GGAb.configure(text='''GGA file''')

        self.HVEb = tk.Button(self.top)
        self.HVEb.place(relx=0.267, rely=0.044, height=26, width=58)
        self.HVEb.configure(activebackground="#ececec")
        self.HVEb.configure(activeforeground="#000000")
        self.HVEb.configure(background="#d9d9d9")
        self.HVEb.configure(command=lambda:Bathymetry_function.Hselect_file())
        self.HVEb.configure(compound='left')
        self.HVEb.configure(disabledforeground="#a3a3a3")
        self.HVEb.configure(foreground="#000000")
        self.HVEb.configure(highlightbackground="#d9d9d9")
        self.HVEb.configure(highlightcolor="black")
        self.HVEb.configure(pady="0")
        self.HVEb.configure(text='''HVE file''')

        self.SBb = tk.Button(self.top)
        self.SBb.place(relx=0.383, rely=0.044, height=26, width=48)
        self.SBb.configure(activebackground="#ececec")
        self.SBb.configure(activeforeground="#000000")
        self.SBb.configure(background="#d9d9d9")
        self.SBb.configure(command=lambda:Bathymetry_function.Sselect_file())
        self.SBb.configure(compound='left')
        self.SBb.configure(disabledforeground="#a3a3a3")
        self.SBb.configure(foreground="#000000")
        self.SBb.configure(highlightbackground="#d9d9d9")
        self.SBb.configure(highlightcolor="black")
        self.SBb.configure(pady="0")
        self.SBb.configure(text='''SB file''')

        self.Label2 = tk.Label(self.top)
        self.Label2.place(relx=0.033, rely=0.133, height=20, width=57)
        self.Label2.configure(activebackground="#f9f9f9")
        self.Label2.configure(activeforeground="black")
        self.Label2.configure(anchor='w')
        self.Label2.configure(background="#d9d9d9")
        self.Label2.configure(compound='left')
        self.Label2.configure(disabledforeground="#a3a3a3")
        self.Label2.configure(foreground="#000000")
        self.Label2.configure(highlightbackground="#d9d9d9")
        self.Label2.configure(highlightcolor="black")
        self.Label2.configure(text='''輸出資料''')

        self.Entry1 = tk.Entry(self.top)
        self.Entry1.place(relx=0.15, rely=0.123, height=27, relwidth=0.44)
        self.Entry1.configure(background="white")
        self.Entry1.configure(disabledforeground="#a3a3a3")
        self.Entry1.configure(font="TkFixedFont")
        self.Entry1.configure(foreground="#000000")
        self.Entry1.configure(highlightbackground="#d9d9d9")
        self.Entry1.configure(highlightcolor="black")
        self.Entry1.configure(insertbackground="black")
        self.Entry1.configure(selectbackground="blue")
        self.Entry1.configure(selectforeground="white")
        self.Entry1.configure(textvariable=self.outpath)

        self.Button1 = tk.Button(self.top)
        self.Button1.place(relx=0.6, rely=0.123, height=26, width=48)
        self.Button1.configure(activebackground="#ececec")
        self.Button1.configure(activeforeground="#000000")
        self.Button1.configure(background="#d9d9d9")
        self.Button1.configure(command=Bathymetry_function.output)
        self.Button1.configure(compound='left')
        self.Button1.configure(disabledforeground="#a3a3a3")
        self.Button1.configure(foreground="#000000")
        self.Button1.configure(highlightbackground="#d9d9d9")
        self.Button1.configure(highlightcolor="black")
        self.Button1.configure(pady="0")
        self.Button1.configure(text='''瀏覽''')

        self.Labelframe1 = tk.LabelFrame(self.top)
        self.Labelframe1.place(relx=0.683, rely=0.098, relheight=0.101
                , relwidth=0.3)
        self.Labelframe1.configure(relief='groove')
        self.Labelframe1.configure(foreground="black")
        self.Labelframe1.configure(text='''水深範圍(公尺)''')
        self.Labelframe1.configure(background="#d9d9d9")
        self.Labelframe1.configure(highlightbackground="#d9d9d9")
        self.Labelframe1.configure(highlightcolor="black")

        self.Entry2 = tk.Entry(self.Labelframe1)
        self.Entry2.place(relx=0.056, rely=0.439, height=17, relwidth=0.3
                , bordermode='ignore')
        self.Entry2.configure(background="white")
        self.Entry2.configure(disabledforeground="#a3a3a3")
        self.Entry2.configure(font="TkFixedFont")
        self.Entry2.configure(foreground="#000000")
        self.Entry2.configure(highlightbackground="#d9d9d9")
        self.Entry2.configure(highlightcolor="black")
        self.Entry2.configure(insertbackground="black")
        self.Entry2.configure(selectbackground="blue")
        self.Entry2.configure(selectforeground="white")
        self.Entry2.configure(textvariable=self.minD)

        self.Entry3 = tk.Entry(self.Labelframe1)
        self.Entry3.place(relx=0.5, rely=0.439, height=17, relwidth=0.3
                , bordermode='ignore')
        self.Entry3.configure(background="white")
        self.Entry3.configure(disabledforeground="#a3a3a3")
        self.Entry3.configure(font="TkFixedFont")
        self.Entry3.configure(foreground="#000000")
        self.Entry3.configure(highlightbackground="#d9d9d9")
        self.Entry3.configure(highlightcolor="black")
        self.Entry3.configure(insertbackground="black")
        self.Entry3.configure(selectbackground="blue")
        self.Entry3.configure(selectforeground="white")
        self.Entry3.configure(textvariable=self.maxD)

        self.Label3 = tk.Label(self.Labelframe1)
        self.Label3.place(relx=0.389, rely=0.439, height=20, width=17
                , bordermode='ignore')
        self.Label3.configure(activebackground="#f9f9f9")
        self.Label3.configure(activeforeground="black")
        self.Label3.configure(anchor='w')
        self.Label3.configure(background="#d9d9d9")
        self.Label3.configure(compound='center')
        self.Label3.configure(disabledforeground="#a3a3a3")
        self.Label3.configure(foreground="#000000")
        self.Label3.configure(highlightbackground="#d9d9d9")
        self.Label3.configure(highlightcolor="black")
        self.Label3.configure(text='''~''')

        self.Button2 = tk.Button(self.top)
        self.Button2.place(relx=0.85, rely=0.909, height=26, width=48)
        self.Button2.configure(activebackground="#ececec")
        self.Button2.configure(activeforeground="#000000")
        self.Button2.configure(background="#d9d9d9")
        self.Button2.configure(command=Bathymetry_function.execute)
        self.Button2.configure(compound='left')
        self.Button2.configure(disabledforeground="#a3a3a3")
        self.Button2.configure(foreground="#000000")
        self.Button2.configure(highlightbackground="#d9d9d9")
        self.Button2.configure(highlightcolor="black")
        self.Button2.configure(pady="0")
        self.Button2.configure(text='''執行''')

        self.style.configure('TNotebook.Tab', background=_bgcolor)
        self.style.configure('TNotebook.Tab', foreground=_fgcolor)
        self.style.map('TNotebook.Tab', background=
            [('selected', _compcolor), ('active',_ana2color)])
        self.TNotebook1 = ttk.Notebook(self.top)
        self.TNotebook1.place(relx=0.033, rely=0.197, relheight=0.681
                , relwidth=0.907)
        self.TNotebook1_t4 = tk.Frame(self.TNotebook1)
        self.TNotebook1.add(self.TNotebook1_t4, padding=3)
        self.TNotebook1.tab(0, text='''Console''', compound="left"
                ,underline='''-1''', )
        self.TNotebook1_t4.configure(background="#d9d9d9")
        self.TNotebook1_t4.configure(highlightbackground="#d9d9d9")
        self.TNotebook1_t4.configure(highlightcolor="black")
        self.TNotebook1_t1 = tk.Frame(self.TNotebook1)
        self.TNotebook1.configure(takefocus="")       
        self.TNotebook1_t1 = tk.Frame(self.TNotebook1)
        self.TNotebook1.add(self.TNotebook1_t1, padding=3)
        self.TNotebook1.tab(1, text='''水深直方圖''', compound="left"
                ,underline='''-1''', )
        self.TNotebook1_t1.configure(background="#d9d9d9")
        self.TNotebook1_t1.configure(highlightbackground="#d9d9d9")
        self.TNotebook1_t1.configure(highlightcolor="black")
        self.TNotebook1_t2 = tk.Frame(self.TNotebook1)
        self.TNotebook1.add(self.TNotebook1_t2, padding=3)
        self.TNotebook1.tab(2, text='''3D點雲''', compound="left"
                ,underline='''-1''', )
        self.TNotebook1_t2.configure(background="#d9d9d9")
        self.TNotebook1_t2.configure(highlightbackground="#d9d9d9")
        self.TNotebook1_t2.configure(highlightcolor="black")
        self.TNotebook1_t3 = tk.Frame(self.TNotebook1)
        self.TNotebook1.add(self.TNotebook1_t3, padding=3)
        self.TNotebook1.tab(3, text='''航跡圖''', compound="left", underline='''-1'''
                ,)
        self.TNotebook1_t3.configure(background="#d9d9d9")
        self.TNotebook1_t3.configure(highlightbackground="#d9d9d9")
        self.TNotebook1_t3.configure(highlightcolor="black")

        self.Label4 = tk.Label(self.TNotebook1_t4)
        self.Label4.place(relx=0.148, rely=0.044, height=116, width=347)
        self.Label4.configure(anchor='nw')
        self.Label4.configure(background="#ffffff")
        self.Label4.configure(compound='left')
        self.Label4.configure(disabledforeground="#a3a3a3")
        self.Label4.configure(foreground="#000000")
        self.Label4.configure(justify='left')
        self.Label4.configure(text='''請載入資料''')
        self.Label4.configure(textvariable=self.progess)

        self.Label5 = tk.Label(self.TNotebook1_t4)
        self.Label5.place(relx=0.037, rely=0.044, height=25, width=37)
        self.Label5.configure(anchor='w')
        self.Label5.configure(background="#d9d9d9")
        self.Label5.configure(compound='left')
        self.Label5.configure(disabledforeground="#a3a3a3")
        self.Label5.configure(foreground="#000000")
        self.Label5.configure(text='''進度''')

        self.Label6 = tk.Label(self.TNotebook1_t4)
        self.Label6.place(relx=0.037, rely=0.544, height=25, width=138)
        self.Label6.configure(anchor='w')
        self.Label6.configure(background="#d9d9d9")
        self.Label6.configure(compound='left')
        self.Label6.configure(disabledforeground="#a3a3a3")
        self.Label6.configure(foreground="#000000")
        self.Label6.configure(text='''Droped:                    %''')

        self.Label7 = tk.Label(self.TNotebook1_t4)
        self.Label7.place(relx=0.148, rely=0.544, height=25, width=47)
        self.Label7.configure(anchor='w')
        self.Label7.configure(background="#ffffff")
        self.Label7.configure(compound='left')
        self.Label7.configure(cursor="fleur")
        self.Label7.configure(disabledforeground="#a3a3a3")
        self.Label7.configure(foreground="#000000")
        self.Label7.configure(textvariable=self.droped)

        self.Label8 = tk.Label(self.TNotebook1_t4)
        self.Label8.place(relx=0.037, rely=0.728, height=25, width=37)
        self.Label8.configure(anchor='w')
        self.Label8.configure(background="#d9d9d9")
        self.Label8.configure(compound='left')
        self.Label8.configure(disabledforeground="#a3a3a3")
        self.Label8.configure(foreground="#000000")
        self.Label8.configure(text='''錯誤''')

        self.Label9 = tk.Label(self.TNotebook1_t4)
        self.Label9.place(relx=0.148, rely=0.684, height=70, width=347)
        self.Label9.configure(anchor='nw')
        self.Label9.configure(background="#ffffff")
        self.Label9.configure(compound='top')
        self.Label9.configure(disabledforeground="#a3a3a3")
        self.Label9.configure(foreground="#000000")
        self.Label9.configure(text='''None''')
        self.Label9.configure(textvariable=self.errorM)
        
        self.Canvas1 = tk.Canvas(self.TNotebook1_t1)
        self.Canvas1.place(relx=0.0, rely=0.0, relheight=1.014, relwidth=1.006)
        self.Canvas1.configure(background="#d9d9d9")
        self.Canvas1.configure(borderwidth="2")
        self.Canvas1.configure(insertbackground="black")
        self.Canvas1.configure(relief="ridge")
        self.Canvas1.configure(selectbackground="blue")
        self.Canvas1.configure(selectforeground="white")

        self.Canvas2 = tk.Canvas(self.TNotebook1_t2)
        self.Canvas2.place(relx=-0.5, rely=-0.5, relheight=2, relwidth=2)
        self.Canvas2.configure(background="#d9d9d9")
        self.Canvas2.configure(borderwidth="2")
        self.Canvas2.configure(insertbackground="black")
        self.Canvas2.configure(relief="ridge")
        self.Canvas2.configure(selectbackground="blue")
        self.Canvas2.configure(selectforeground="white")

        self.Canvas3 = tk.Canvas(self.TNotebook1_t3)
        self.Canvas3.place(relx=0.0, rely=0.0, relheight=1.014, relwidth=1.006)
        self.Canvas3.configure(background="#d9d9d9")
        self.Canvas3.configure(borderwidth="2")
        self.Canvas3.configure(insertbackground="black")
        self.Canvas3.configure(relief="ridge")
        self.Canvas3.configure(selectbackground="blue")
        self.Canvas3.configure(selectforeground="white")

class ProvideException(object):
    def __init__(self, func):
        self._func = func

    def __call__(self, *args):

        try:
            return self._func(*args)

        except Exception as e:
            print('Exception was thrown', str(e))
            # Optionally raise your own exceptions, popups etc
def start_up():
    Bathymetry_function.main()

if __name__ == '__main__':
    Bathymetry_function.main()




