/* Tags, layouts and rules for dwm */

/* Tags */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const char ptagf[] = "%s: %s";	        /* format of a tag label */
static const char etagf[] = "%s";	            /* format of an empty tag */
static const int lcaselbl = 0;		            /* 1 means make tag label lowercase */	
static const unsigned int ulinepad	= 5;	    /* horizontal padding between the underline and tag */
static const unsigned int ulinestroke	= 2;	/* thickness / height of the underline */
static const unsigned int ulinevoffset	= 0;	/* how far above the bottom of the bar the line should appear */
static const int ulineall 		= 0;	        /* 1 to show underline on all tags, 0 for just the active ones */

/* Layouts */
static float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static int nmaster     = 1;    /* number of clients in master area */
static int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[]=",      tile },    /* first entry is default */
    { "><>",      NULL },    /* no layout function means floating behavior */
    { "[M]",      monocle },
};

/* Rules */
static const Rule rules[] = {
    /* xprop(1):
    *  WM_CLASS(STRING) = instance, class
    *  WM_NAME(STRING) = title
    */
    /* class      instance    title       tags mask     isfloating   monitor */
    { "Gimp",     NULL,       NULL,       0,            1,           -1 },
    { "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* Xresources preferences to load at startup */
ResourcePref resources[] = {
		{ "font",               STRING,  &font              },
		{ "dmenufont",          STRING,  &dmenufont         },
		{ "normbgcolor",        STRING,  &normbgcolor       },
		{ "normbordercolor",    STRING,  &normbordercolor   },
		{ "normfgcolor",        STRING,  &normfgcolor       },
		{ "selbgcolor",         STRING,  &selbgcolor        },
		{ "selbordercolor",     STRING,  &selbordercolor    },
		{ "selfgcolor",         STRING,  &selfgcolor        },
		{ "borderpx",          	INTEGER, &borderpx          },
		{ "snap",          		INTEGER, &snap              },
		{ "showbar",          	INTEGER, &showbar           },
		{ "topbar",          	INTEGER, &topbar            },
		{ "nmaster",          	INTEGER, &nmaster           },
		{ "resizehints",       	INTEGER, &resizehints       },
		{ "mfact",      	 	FLOAT,   &mfact             },
};

