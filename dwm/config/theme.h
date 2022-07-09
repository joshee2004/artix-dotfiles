/* Theme file for dwm */

/* Icons */
#define ICONSIZE 16   /* icon size */
#define ICONSPACING 5 /* space between icon and title */

/* Appearance */
static unsigned int borderpx    = 0;        /* border pixel of window */
static const unsigned int gappx = 6;        /* gaps between windows */
static unsigned int snap        = 32;       /* snap pixel */
static int showbar              = 1;        /* 0 means no bar */
static int topbar               = 1;        /* 0 means bottom bar */

/* Fonts */
static char font[]              = "Terminus:size=12";
static char emoji[]             = "Font Awesome 6 Free Regular:size=10";
static char *fonts[]            = { font, emoji };
static char dmenufont[]         = "Terminus:size=12";

/* Dwm colors */
static char normfgcolor[]       = "#bbbbbb";
static char normbgcolor[]       = "#222222";
static char normbordercolor[]   = "#444444";
static char selfgcolor[]        = "#eeeeee";
static char selbgcolor[]        = "#005577";
static char selbordercolor[]    = "#005577";
static char urgfgcolor[]        = "#eeeeee";
static char urgbgcolor[]        = "#005577";
static char urgbordercolor[]    = "#005577";

#if __has_include("~/.cache/wal/colors-wal-dwm.h")
/* Load pywal colors */
#include "~/.cache/wal/colors-wal-dwm.h"
#else
/* Load default colors */
static char *colors[][3]        = {
  /*               fg           bg           border */
  [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
  [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
  [SchemeUrg]  = { urgfgcolor,  urgbgcolor,  urgbordercolor  },
};
#endif

/* Terminal colors */
static char termcol0[]  = "#000000"; /* black   */
static char termcol1[]  = "#ff0000"; /* red     */
static char termcol2[]  = "#33ff00"; /* green   */
static char termcol3[]  = "#ff0099"; /* yellow  */
static char termcol4[]  = "#0066ff"; /* blue    */
static char termcol5[]  = "#cc00ff"; /* magenta */
static char termcol6[]  = "#00ffff"; /* cyan    */
static char termcol7[]  = "#d0d0d0"; /* white   */
static char termcol8[]  = "#808080"; /* black   */
static char termcol9[]  = "#ff0000"; /* red     */
static char termcol10[] = "#33ff00"; /* green   */
static char termcol11[] = "#ff0099"; /* yellow  */
static char termcol12[] = "#0066ff"; /* blue    */
static char termcol13[] = "#cc00ff"; /* magenta */
static char termcol14[] = "#00ffff"; /* cyan    */
static char termcol15[] = "#ffffff"; /* white   */

static char *termcolor[]= {
  termcol0,
  termcol1,
  termcol2,
  termcol3,
  termcol4,
  termcol5,
  termcol6,
  termcol7,
  termcol8,
  termcol9,
  termcol10,
  termcol11,
  termcol12,
  termcol13,
  termcol14,
  termcol15,
};

/* Transparency */
static const unsigned int baralpha    = 0xd0;
static const unsigned int borderalpha = OPAQUE;

static unsigned int alphas[][3]       = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
	[SchemeUrg]  = { OPAQUE, baralpha, borderalpha },
};
