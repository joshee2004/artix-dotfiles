/* Theme file for dwm */

/* Appearance */
static const unsigned int borderpx  = 1;        /* border pixel of window */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */

/* Fonts */
static const char font[]            = "Hack:size=10";
static const char emoji[]           = "FontAwesome:size=10";
static const char *fonts[]          = { font, emoji };
static const char dmenufont[]       = "Hack:size=10";

/* Colors are generated using Xresources file */
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
    /*               fg         bg         border   */
    [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
    [SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};
