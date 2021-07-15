from tkinter import *
import sqlite3



def eqms_menu():
    filewin = Toplevel(root)
    button = Button(filewin, text="Open Menu")
    button.pack()


root = Tk(screenName=None,baseName=None,
          className = 'EQMS')
menubar = Menu(root)
filemenu = Menu(menubar, tearoff=0)
filemenu.add_command(label="New", command=eqms_menu)
filemenu.add_command(label="Open", command=eqms_menu)
filemenu.add_command(label="Save", command=eqms_menu)
filemenu.add_command(label="Save as...", command=eqms_menu)
filemenu.add_command(label="Close", command=eqms_menu)

filemenu.add_separator()

filemenu.add_command(label="Exit", command=root.quit)
menubar.add_cascade(label="File", menu=filemenu)

editmenu = Menu(menubar, tearoff=0)
editmenu.add_command(label="Undo", command=eqms_menu)

editmenu.add_separator()

editmenu.add_command(label="Cut", command=eqms_menu)
editmenu.add_command(label="Copy", command=eqms_menu)
editmenu.add_command(label="Paste", command=eqms_menu)
editmenu.add_command(label="Delete", command=eqms_menu)
editmenu.add_command(label="Select All", command=eqms_menu)

menubar.add_cascade(label="Edit", menu=editmenu)
helpmenu = Menu(menubar, tearoff=0)
helpmenu.add_command(label="Help Index", command=eqms_menu)
helpmenu.add_command(label="About...", command=eqms_menu)
menubar.add_cascade(label="Help", menu=helpmenu)

eqmsmen = Menu(menubar, tearoff = 0)
eqmsmen.add_command(label="Open EQMS", command=eqms_menu)
menubar.add_cascade(label="EQMS", menu=filemenu)

root.config(menu=menubar)
root.mainloop()