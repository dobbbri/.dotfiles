/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx        = 4;  /* border pixel of windows */
static const unsigned int snap            = 8;  /* snap pixel */
static const unsigned int gappih          = 6;  /* horiz inner gap between windows */
static const unsigned int gappiv          = 6;  /* vert inner gap between windows */
static const unsigned int gappoh          = 6;  /* horiz outer gap between windows and screen edge */
static const unsigned int gappov          = 6;  /* vert outer gap between windows and screen edge */
static int smartgaps                      = 0;  /* 1 */
static const unsigned int systraypinning  = 0;  /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft   = 0;  /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 6;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray             = 0;   /* 0 means no systray */
static const int showbar                 = 1;   /* 0 means no bar */
static const int topbar                  = 1;   /* 0 means bottom bar */
static const int focusedontoptiled       = 1;   /* 1 means focused tile client is shown on top of floating windows */
// static const char *fonts[]               = { "JetBrainsMono Nerd Font:size=12" };
// static const char dmenufont[]            = "monospace:size=12";

static const char *fonts[]          = { 
  "Ubuntu:size=11:antialias=true:autohint=true", 
  "jetBrainsMono Nerd Font Mono:style=regular:size=18:antialias=true:autohint=true" 
}; /*"Font Awesome 5 Free:size=13"  */ 
// #ff5733
// #ffbd33
// #dbff33
// #75ff33
// #33ff57
// #33ffbd
static const char dmenufont[]       = "Ubuntu:size=12:antialias=true:autohint=true";

static const char col_gray1[]            = "#00141d";
static const char col_gray2[]            = "#ffbd33";
static const char col_gray3[]            = "#bdae93";
static const char col_gray4[]            = "#1a1a1a";
static const char col_cyan[]             = "#ffbd33"; /* was #fd8019  */
static const char col_barbie[]           = "#fd8019";
static const char *colors[][3]           = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray4 },
	[SchemeSel]  = { col_cyan, col_gray4, col_barbie  },
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;

const char *spcmd1[] = {"st", "-n", "spterm1", "-g", "100x34", "-e", "pulsemixer", NULL };
const char *spcmd2[] = {"st", "-n", "spterm2", "-g", "100x34", "-e", "ranger", NULL };
const char *spcmd3[] = {"st", "-n", "spterm3", "-g", "100x34", NULL };

static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm1",      spcmd1},
	{"spterm2",      spcmd2},
  {"spterm3",      spcmd3},
};

static const char *const autostart[] = {
	"sh", "-c", "~/.config/suckless/scripts/autostart.sh", NULL,
	NULL /* terminate */
};

/* tagging */
static const char *tags[] = { "󰲠", "󰲢", "󰲤", "󰲦", "󰲨", "󰲪", "󰲬", "󰲮", "󰲰" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      			  instance    title       tags mask   isfloating   	iscentered		monitor */
	{ "Gimp",     			  NULL,       NULL,       1 << 8,       0,          0,			      -1 },
	{ "GitHub Desktop",   NULL,       NULL,       1 << 1,       0,          1,			      -1 },
	{ "obs",				      NULL,       NULL,       1 << 9,       0,          0,			      -1 },
	{ "mpv",  				    NULL,       NULL,       0,       		  1,          1,			      -1 },
	{ "qimgv",    			  NULL,       NULL,       0,       		  1,          1,			      -1 },
	{ "Galculator",   		NULL,       NULL,       0,       		  1,          1,			      -1 },
	{ "Transmission-gtk", NULL,       NULL,       0,       		  1,          1,			      -1 },
	{ "Lxappearance",   	NULL,       NULL,       0,       		  1,          1,			      -1 },
	{ "Pavucontrol",  		NULL,       NULL,       0,       		  1,          1,			      -1 },
	{ "Tilix", 				    "tilix", 	  NULL, 		  0, 				    1, 				  1, 			      -1 },
	{ "PCManFM", 			    NULL,       NULL,       0,       		  0,          1,			      -1 },
  { "st",               NULL,       NULL,       0,            1,          1,            -1 },
	{ NULL,		            "spterm1",	NULL,		    SPTAG(0),  		1,          1,    	      -1 },
	{ NULL,		            "spterm2",	NULL,		    SPTAG(1),  		1,		      1,            -1 },
  { NULL,		            "spterm3",	NULL,		    SPTAG(2),  		1,		      0,            -1 },
};

/* window following */
#define WFACTIVE '>'
#define WFINACTIVE 'v'
#define WFDEFAULT WFACTIVE

/* layout(s) */
static const float mfact        = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster        = 1;    /* number of clients in master area */
static const int resizehints    = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1;    /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[\\]",     dwindle }, /* first entry is default */
	{ "[]=",      tile },
	{ "[C]",      columnlayout }, 
	{ "|M|",      centeredmaster },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "TTT",      bstack },
	{ "###",      nrowgrid },
	{ "H[]",      deck },
	{ ":::",      gaplessgrid },
	{ "[@]",      spiral },
	{ "[M]",      monocle },
	{ "HHH",      grid },
	{ "===",      bstackhoriz },
	{ "H[]",      deck },
	{ ">M>",      centeredfloatingmaster }, 
	{ "---",      horizgrid },
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2]       = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "alacritty", NULL };
#include "movestack.c"

static const Key keys[] = {
	/* modifier                     key         function        argument */
	{ MODKEY,                       XK_p,       spawn,          {.v = dmenucmd } },
	{ MODKEY,             			    XK_Return,  spawn,          {.v = termcmd } },
	{ MODKEY|ControlMask,           XK_b,       togglebar,      {0} },
	{ MODKEY,                       XK_Right,   focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Left,    focusstack,     {.i = -1 } },
	{ MODKEY|ControlMask,           XK_Left,    setmfact,       {.f = -0.05} },
	{ MODKEY|ControlMask,           XK_Right,   setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_n,       togglefollow,   {0} },
	{ MODKEY|ShiftMask,             XK_Right,   movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_Left,    movestack,      {.i = -1 } },
	{ ControlMask|ShiftMask,        XK_Left,    viewtoleft,     {0} },
	{ ControlMask|ShiftMask,        XK_Right,   viewtoright,    {0} },
	{ MODKEY,                       XK_Tab,     view,           {0} },
	{ Mod1Mask|ControlMask,         XK_Left,    tagtoleft,      {0} },
	{ Mod1Mask|ControlMask,    		  XK_Right,   tagtoright,     {0} },
	{ MODKEY,             			    XK_q,       killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_space,   togglefloating, {0} },
	{ MODKEY,                       XK_0,       view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,       tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,   focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,  focusmon,       {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_comma,   tagmon,         {.i = -1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_period,  tagmon,         {.i = +1 } },
	{ MODKEY|Mod1Mask,              XK_u,       incrgaps,       {.i = 1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_u,       incrgaps,       {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_i,       incrigaps,      {.i = 1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_i,       incrigaps,      {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_o,       incrogaps,      {.i = 1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_o,       incrogaps,      {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_6,       incrihgaps,     {.i = 1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_6,       incrihgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_7,       incrivgaps,     {.i = 1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_7,       incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_8,       incrohgaps,     {.i = 1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_8,       incrohgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_9,       incrovgaps,     {.i = 1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_9,       incrovgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_0,       togglegaps,     {0} },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_0,       defaultgaps,    {0} },
	{ ShiftMask|ControlMask,        XK_1,       setlayout,      {.v = &layouts[0] } },
	{ ShiftMask|ControlMask,        XK_2,       setlayout,      {.v = &layouts[1] } },
	{ ShiftMask|ControlMask,        XK_3,       setlayout,      {.v = &layouts[2] } },
	{ ShiftMask|ControlMask,        XK_4,       setlayout,      {.v = &layouts[3] } },
	{ ShiftMask|ControlMask,        XK_5,       setlayout,      {.v = &layouts[4] } },
	{ ShiftMask|ControlMask,        XK_6,       setlayout,      {.v = &layouts[5] } },
	{ ShiftMask|ControlMask,        XK_7,       setlayout,      {.v = &layouts[6] } },
	{ ShiftMask|ControlMask,        XK_8,       setlayout,      {.v = &layouts[7] } },
	{ ShiftMask|ControlMask,        XK_9,       setlayout,      {.v = &layouts[8] } },
	{ ShiftMask|ControlMask,        XK_0,       setlayout,      {.v = &layouts[9] } },
	{ ShiftMask|ControlMask,        XK_minus,   setlayout,      {.v = &layouts[10] } },
	{ ShiftMask|ControlMask,        XK_equal,   setlayout,      {.v = &layouts[11] } },
	TAGKEYS(                        XK_1,                       0)
	TAGKEYS(                        XK_2,                       1)
	TAGKEYS(                        XK_3,                       2)
	TAGKEYS(                        XK_4,                       3)
	TAGKEYS(                        XK_5,                       4)
	TAGKEYS(                        XK_6,                       5)
	TAGKEYS(                        XK_7,                       6)
	TAGKEYS(                        XK_8,                       7)
	TAGKEYS(                        XK_9,                       8)
	TAGKEYS(                        XK_0,                       9)
	TAGKEYS(                        XK_minus,                   10)
	TAGKEYS(                        XK_equal,                   11)
	{ MODKEY|Mod1Mask|ShiftMask,   	XK_Tab,     incnmaster,     {.i = +1 } },
	{ MODKEY|Mod1Mask,			        XK_Tab,     incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_q,       quit,           {0} },
	{ MODKEY|ShiftMask,				      XK_r,       quit,           {1} }, 
  { MODKEY|ShiftMask,             XK_f,       fullscreen,     {0} },
	{ MODKEY,            			      XK_v,  	    togglescratch,  {.ui = 0 } },
	{ MODKEY,            			      XK_r,  	    togglescratch,  {.ui = 1 } },
  { MODKEY|ShiftMask,             XK_Return,  togglescratch,  {.ui = 2 } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkFollowSymbol,      0,              Button1,        togglefollow,   {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
