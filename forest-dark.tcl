# Copyright (c) 2021 rdbende <rdbende@gmail.com>

# The Forest theme is a beautiful and modern ttk theme inspired by Excel.

package require Tk 8.6

namespace eval ttk::theme::forest-dark {

    variable version 1.0
    package provide ttk::theme::forest-dark $version
    variable colors
    array set colors {
        -fg             "#eeeeee"
        -bg             "#313131"
        -disabledfg     "#595959"
        -disabledbg     "#ffffff"
        -selectfg       "#ffffff"
        -selectbg       "#217346"
    }

    proc LoadImages {imgdir} {
        variable I
        foreach file [glob -directory $imgdir *.png] {
            set img [file tail [file rootname $file]]
            set I($img) [image create photo -file $file -format png]
        }
    }

    LoadImages [file join [file dirname [info script]] forest-dark]

    # Settings
    ttk::style theme create forest-dark -parent default -settings {
        ttk::style configure . \
            -background $colors(-bg) \
            -foreground $colors(-fg) \
            -troughcolor $colors(-bg) \
            -focuscolor $colors(-selectbg) \
            -selectbackground $colors(-selectbg) \
            -selectforeground $colors(-selectfg) \
            -insertwidth 1 \
            -insertcolor $colors(-fg) \
            -fieldbackground $colors(-selectbg) \
            -font {TkDefaultFont 10} \
            -borderwidth 1 \
            -relief flat

        ttk::style map . -foreground [list disabled $colors(-disabledfg)]

        tk_setPalette background [ttk::style lookup . -background] \
            foreground [ttk::style lookup . -foreground] \
            highlightColor [ttk::style lookup . -focuscolor] \
            selectBackground [ttk::style lookup . -selectbackground] \
            selectForeground [ttk::style lookup . -selectforeground] \
            activeBackground [ttk::style lookup . -selectbackground] \
            activeForeground [ttk::style lookup . -selectforeground]
        
        option add *font [ttk::style lookup . -font]


        # Layouts
        ttk::style layout TButton {
            Button.button -children {
                Button.padding -children {
                    Button.label -side left -expand true
                } 
            }
        }

        ttk::style layout Toolbutton {
            Toolbutton.button -children {
                Toolbutton.padding -children {
                    Toolbutton.label -side left -expand true
                } 
            }
        }

        ttk::style layout TMenubutton {
            Menubutton.button -children {
                Menubutton.padding -children {
                    Menubutton.indicator -side right
                    Menubutton.label -side right -expand true
                }
            }
        }

        ttk::style layout TOptionMenu {
            OptionMenu.button -children {
                OptionMenu.padding -children {
                    OptionMenu.indicator -side right
                    OptionMenu.label -side right -expand true
                }
            }
        }

        ttk::style layout Accent.TButton {
            AccentButton.button -children {
                AccentButton.padding -children {
                    AccentButton.label -side left -expand true
                } 
            }
        }

        ttk::style layout TCheckbutton {
            Checkbutton.button -children {
                Checkbutton.padding -children {
                    Checkbutton.indicator -side left
                    Checkbutton.label -side right -expand true
                }
            }
        }

        ttk::style layout Switch {
            Switch.button -children {
                Switch.padding -children {
                    Switch.indicator -side left
                    Switch.label -side right -expand true
                }
            }
        }

        ttk::style layout ToggleButton {
            ToggleButton.button -children {
                ToggleButton.padding -children {
                    ToggleButton.label -side left -expand true
                } 
            }
        }

        ttk::style layout TRadiobutton {
            Radiobutton.button -children {
                Radiobutton.padding -children {
                    Radiobutton.indicator -side left
                    Radiobutton.label -side right -expand true
                }
            }
        }

        ttk::style layout Vertical.TScrollbar {
            Vertical.Scrollbar.trough -sticky ns -children {
                Vertical.Scrollbar.thumb -expand true
            }
        }

        ttk::style layout Horizontal.TScrollbar {
            Horizontal.Scrollbar.trough -sticky ew -children {
                Horizontal.Scrollbar.thumb -expand true
            }
        }

        ttk::style layout TCombobox {
            Combobox.field -sticky nswe -children {
                Combobox.padding -expand true -sticky nswe -children {
                    Combobox.textarea -sticky nswe
                }
            }
            Combobox.button -side right -sticky ns -children {
                Combobox.arrow -sticky nsew
            }
        }
        
        ttk::style layout TSpinbox {
            Spinbox.field -sticky nsew -children {
                Spinbox.padding -expand true -sticky nswe -children {
                    Spinbox.textarea -sticky nsew
                }
                
            }
            null -side right -sticky nsew -children {
                Spinbox.uparrow -side right -sticky nsew -children {
                    Spinbox.symuparrow
                }
                Spinbox.downarrow -side left -sticky nsew -children {
                    Spinbox.symdownarrow
                }
            }
        }
        
        ttk::style layout Horizontal.TSeparator {
            Horizontal.separator -sticky nswe
        }

        ttk::style layout Vertical.TSeparator {
            Vertical.separator -sticky nswe
        }      
        
        ttk::style layout Card {
            Card.field {
                Card.padding -expand 1 
            }
        }

        ttk::style layout TLabelframe {
            Labelframe.border {
                Labelframe.padding -expand 1 -children {
                    Labelframe.label -side left
                }
            }
        }

        ttk::style layout TNotebook {
            Notebook.border -children {
                TNotebook.Tab -expand 1 -side top
                Notebook.client -sticky nsew
            }
        }

        ttk::style layout TNotebook.Tab {
            Notebook.tab -children {
                Notebook.padding -side top -children {
                    Notebook.label
                }
            }
        }

        ttk::style layout Treeview.Item {
            Treeitem.padding -sticky nswe -children {
                Treeitem.indicator -side left -sticky {}
                Treeitem.image -side left -sticky {}
                Treeitem.text -side left -sticky {}
            }
        }


        # Elements

        # Button
        ttk::style configure TButton -padding {8 4 8 4} -width -10 -anchor center
        ttk::style map TButton -foreground [list disabled #bbbbbb]

        ttk::style element create Button.button image \
            [list $I(rect-basic) \
                {selected disabled} $I(rect-disabled) \
                disabled $I(rect-disabled) \
                selected $I(rect-basic) \
                pressed $I(rect-basic) \
                active $I(rect-hover) \
            ] -border 4 -sticky nsew

        # Toolbutton
        ttk::style configure Toolbutton -padding {8 4 8 4} -width -10 -anchor center

        ttk::style element create Toolbutton.button image \
            [list $I(empty) \
                {selected disabled} $I(empty) \
                disabled $I(empty) \
                selected $I(rect-basic) \
                pressed $I(rect-basic) \
                active $I(rect-basic) \
            ] -border 4 -sticky nsew

        # Menubutton
        ttk::style configure TMenubutton -padding {8 4 4 4}

        ttk::style element create Menubutton.button image \
            [list $I(rect-basic) \
                disabled $I(rect-basic) \
                pressed $I(rect-basic) \
                active $I(rect-hover) \
            ] -border 4 -sticky nsew 

        ttk::style element create Menubutton.indicator image \
            [list $I(down) \
                active   $I(down) \
                pressed  $I(down) \
                disabled $I(down) \
            ] -width 15 -sticky e

        # OptionMenu
        ttk::style configure TOptionMenu -padding {8 4 4 4}

        ttk::style element create OptionMenu.button image \
            [list $I(rect-basic) \
                disabled $I(rect-basic) \
                pressed $I(rect-basic) \
                active $I(rect-hover) \
            ] -border 4 -sticky nsew 

        ttk::style element create OptionMenu.indicator image \
            [list $I(down) \
                active   $I(down) \
                pressed  $I(down) \
                disabled $I(down) \
            ] -width 15 -sticky e

        # AccentButton
        ttk::style configure Accent.TButton -padding {8 4 8 4} -width -10 -anchor center -foreground #eeeeee

        ttk::style element create AccentButton.button image \
            [list $I(rect-accent) \
                {selected disabled} $I(rect-accent-hover) \
                disabled $I(rect-accent-hover) \
                selected $I(rect-accent) \
                pressed $I(rect-accent) \
                active $I(rect-accent-hover) \
            ] -border 4 -sticky nsew

        # Checkbutton
        ttk::style configure TCheckbutton -padding 4

        ttk::style element create Checkbutton.indicator image \
            [list $I(check-unsel-accent) \
                {alternate disabled} $I(check-tri-basic) \
                {selected disabled} $I(check-basic) \
                disabled $I(check-unsel-basic) \
                {pressed alternate} $I(check-tri-hover) \
                {active alternate} $I(check-tri-hover) \
                alternate $I(check-tri-accent) \
                {pressed selected} $I(check-hover) \
                {active selected} $I(check-hover) \
                selected $I(check-accent) \
                {pressed !selected} $I(check-unsel-pressed) \
                active $I(check-unsel-hover) \
            ] -width 26 -sticky w

        # Switch
        ttk::style element create Switch.indicator image \
            [list $I(off-accent) \
                {selected disabled} $I(on-basic) \
                disabled $I(off-basic) \
                {pressed selected} $I(on-accent) \
                {active selected} $I(on-hover) \
                selected $I(on-accent) \
                {pressed !selected} $I(off-accent) \
                active $I(off-hover) \
            ] -width 46 -sticky w

        # ToggleButton
        ttk::style configure ToggleButton -padding {8 4 8 4} -width -10 -anchor center

        ttk::style element create ToggleButton.button image \
            [list $I(rect-basic) \
                {selected disabled} $I(rect-accent-hover) \
                disabled $I(rect-basic) \
                {pressed selected} $I(rect-basic) \
                {active selected} $I(rect-accent-hover) \
                selected $I(rect-accent) \
                {pressed !selected} $I(rect-accent) \
                active $I(rect-hover) \
            ] -border 4 -sticky nsew

        # Radiobutton
        ttk::style configure TRadiobutton -padding 4

        ttk::style element create Radiobutton.indicator image \
            [list $I(radio-unsel-accent) \
                {alternate disabled} $I(radio-tri-basic) \
                {selected disabled} $I(radio-basic) \
                disabled $I(radio-unsel-basic) \
                {pressed alternate} $I(radio-tri-hover) \
                {active alternate} $I(radio-tri-hover) \
                alternate $I(radio-tri-accent) \
                {pressed selected} $I(radio-hover) \
                {active selected} $I(radio-hover) \
                selected $I(radio-accent) \
                {pressed !selected} $I(radio-unsel-pressed) \
                active $I(radio-unsel-hover) \
            ] -width 26 -sticky w

        # Scrollbar
        ttk::style element create Horizontal.Scrollbar.trough image $I(hor-basic) \
            -sticky ew

        ttk::style element create Horizontal.Scrollbar.thumb image \
            [list $I(hor-accent) \
                disabled $I(hor-basic) \
                pressed $I(hor-hover) \
                active $I(hor-hover) \
            ] -sticky ew

        ttk::style element create Vertical.Scrollbar.trough image $I(vert-basic) \
            -sticky ns

        ttk::style element create Vertical.Scrollbar.thumb image \
            [list $I(vert-accent) \
                disabled  $I(vert-basic) \
                pressed $I(vert-hover) \
                active $I(vert-hover) \
            ] -sticky ns

        # Scale
        ttk::style element create Horizontal.Scale.trough image $I(scale-hor) \
            -border 5 -padding 0

        ttk::style element create Horizontal.Scale.slider image \
            [list $I(thumb-hor-accent) \
                disabled $I(thumb-hor-basic) \
                pressed $I(thumb-hor-hover) \
                active $I(thumb-hor-hover) \
            ] -sticky {}

        ttk::style element create Vertical.Scale.trough image $I(scale-vert) \
            -border 5 -padding 0

        ttk::style element create Vertical.Scale.slider image \
            [list $I(thumb-vert-accent) \
                disabled $I(thumb-vert-basic) \
                pressed $I(thumb-vert-hover) \
                active $I(thumb-vert-hover) \
            ] -sticky {}

        # Progressbar
        ttk::style element create Horizontal.Progressbar.trough image $I(hor-basic) \
            -sticky ew

        ttk::style element create Horizontal.Progressbar.pbar image $I(hor-accent) \
            -sticky ew

        ttk::style element create Vertical.Progressbar.trough image $I(vert-basic) \
            -sticky ns

        ttk::style element create Vertical.Progressbar.pbar image $I(vert-accent) \
            -sticky ns

        # Entry
        ttk::style element create Entry.field image \
            [list $I(border-basic) \
                {focus hover} $I(border-accent) \
                invalid $I(border-invalid) \
                disabled $I(border-basic) \
                focus $I(border-accent) \
                hover $I(border-hover) \
            ] -border 5 -padding {8} -sticky nsew

        # Combobox
        ttk::style map TCombobox -selectbackground [list \
            {!focus} $colors(-selectbg) \
            {readonly hover} $colors(-selectbg) \
            {readonly focus} $colors(-selectbg) \
        ]
            
        ttk::style map TCombobox -selectforeground [list \
            {!focus} $colors(-selectfg) \
            {readonly hover} $colors(-selectfg) \
            {readonly focus} $colors(-selectfg) \
        ]

        ttk::style element create Combobox.field image \
            [list $I(border-basic) \
                {readonly disabled} $I(rect-basic) \
                {readonly pressed} $I(rect-basic) \
                {readonly focus hover} $I(rect-hover) \
                {readonly focus} $I(rect-hover) \
                {readonly hover} $I(rect-hover) \
                {focus hover} $I(border-accent) \
                readonly $I(rect-basic) \
                invalid $I(border-invalid) \
                disabled $I(border-basic) \
                focus $I(border-accent) \
                hover $I(border-hover) \
            ] -border 5 -padding {8 8 28 8}

        ttk::style element create Combobox.button image \
            [list $I(combo-button-basic) \
                 {!readonly focus} $I(combo-button-focus) \
                 {readonly focus} $I(combo-button-hover) \
                 {readonly hover} $I(combo-button-hover)
            ] -border 5 -padding {2 6 6 6}
            
        ttk::style element create Combobox.arrow image $I(down) -width 15 -sticky e

        # Spinbox
        ttk::style element create Spinbox.field image \
            [list $I(border-basic) \
                invalid $I(border-invalid) \
                disabled $I(border-basic) \
                focus $I(border-accent) \
                hover $I(border-hover) \
            ] -border 5 -padding {8 8 54 8} -sticky nsew

        ttk::style element create Spinbox.uparrow image $I(spin-button-up) -border 4 -sticky nsew

        ttk::style element create Spinbox.downarrow image \
            [list $I(spin-button-down-basic) \
                focus $I(spin-button-down-focus) \
            ] -border 4 -sticky nsew

        ttk::style element create Spinbox.symuparrow image $I(up) -width 15 -sticky {}
        ttk::style element create Spinbox.symdownarrow image $I(down) -width 17 -sticky {}

        # Sizegrip
        ttk::style element create Sizegrip.sizegrip image $I(sizegrip) \
            -sticky nsew

        # Separator
        ttk::style element create Horizontal.separator image $I(separator)

        ttk::style element create Vertical.separator image $I(separator)

        # Card
        ttk::style element create Card.field image $I(card) \
            -border 10 -padding 4 -sticky nsew

        # Labelframe
        ttk::style element create Labelframe.border image $I(card) \
            -border 5 -padding 4 -sticky nsew
        
        # Notebook
        ttk::style configure TNotebook -padding 2

        ttk::style element create Notebook.border image $I(card) -border 5

        ttk::style element create Notebook.client image $I(notebook) -border 5

        ttk::style element create Notebook.tab image \
            [list $I(tab-basic) \
                selected $I(tab-accent) \
                active $I(tab-hover) \
            ] -border 5 -padding {14 4}

        # Treeview
        ttk::style element create Treeview.field image $I(card) \
            -border 5

        ttk::style element create Treeheading.cell image \
            [list $I(tree-basic) \
                pressed $I(tree-pressed)
            ] -border 5 -padding 6 -sticky nsew
        
        ttk::style element create Treeitem.indicator image \
            [list $I(right) \
                user2 $I(empty) \
                user1 $I(down) \
            ] -width 17 -sticky {}

        ttk::style configure Treeview -background $colors(-bg)
        ttk::style configure Treeview.Item -padding {2 0 0 0}

        ttk::style map Treeview \
            -background [list selected $colors(-selectbg)] \
            -foreground [list selected $colors(-selectfg)]

        # Sashes
        #ttk::style map TPanedwindow -background [list hover $colors(-bg)]
    }
}
