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
static char font[]              = "Hack:size=12";
static char emoji[]             = "Font Awesome 6 Free Regular:size=10";
static char *fonts[]            = { font, emoji };
static char dmenufont[]         = "Hack:size=12";

/* Colors */
static char normfgcolor[]       = "#bbbbbb";
static char normbgcolor[]       = "#222222";
static char normbordercolor[]   = "#444444";
static char selfgcolor[]        = "#eeeeee";
static char selbgcolor[]        = "#005577";
static char selbordercolor[]    = "#005577";
static char tagsnormfg[]        = "#bbbbbb";
static char tagsnormbg[]        = "#222222";
static char tagsnormborder[]    = "#000000";
static char tagsselfg[]         = "#eeeeee";
static char tagsselbg[]         = "#005577";
static char tagsselborder[]     = "#000000";
static char infonormfg[]        = "#bbbbbb";
static char infonormbg[]        = "#222222";
static char infonormborder[]    = "#000000";
static char infoselfg[]         = "#eeeeee";
static char infoselbg[]         = "#005577";
static char infoselborder[]     = "#000000";
static char statusfg[]          = "#bbbbbb";
static char statusbg[]          = "#222222";
static char statusborder[]      = "#000000";

static char *colors[][3]        = {
    /*                      fg           bg           border   */
    [SchemeNorm]        = { normfgcolor, normbgcolor, normbordercolor },
    [SchemeSel]         = { selfgcolor,  selbgcolor,  selbordercolor  },
	[SchemeTagsNorm]    = { tagsnormfg,  tagsnormbg,  tagsnormborder  },    // Tagbar left unselected {text,background,not used but cannot be empty}
    [SchemeTagsSel]     = { tagsselfg,   tagsselbg,   tagsselborder   },    // Tagbar left selected {text,background,not used but cannot be empty}
    [SchemeInfoNorm]    = { infonormfg,  infonormbg,  infonormborder  },    // Infobar middle  unselected {text,background,not used but cannot be empty}
    [SchemeInfoSel]     = { infoselfg,   infoselbg,   infoselborder   },    // Infobar middle  selected {text,background,not used but cannot be empty} 
    [SchemeStatus]      = { statusfg,    statusbg,    statusborder    },    // Statusbar right {text,background,not used but cannot be empty}
};

/* Status2d colors */
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

static char *termcolor[] = {
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
