/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>

/* appearance -------------------------------------------------------------- */
static const unsigned int borderpx  = 2;  /* border pixel of windows */
static const unsigned int snap      = 8;  /* snap pixel */

/* gap -------------------------------------------------------------- */
static const unsigned int gappih    = 6;  /* horiz inner gap between windows */
static const unsigned int gappiv    = 6;  /* vert inner gap between windows */
static const unsigned int gappoh    = 6;  /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 6;  /* vert outer gap between windows and screen edge */
static                int smartgaps = 0;  /* 1 means no outer gap when there is only one window */

/* bar -------------------------------------------------------------- */
static const int showbar = 1; /* 0 means no bar */
static const int topbar  = 1; /* 0 means bottom bar */

/* padding -------------------------------------------------------------- */
static const int vertpad = 0; /* vertical padding of bar */
static const int sidepad = 0; /* horizontal padding of bar */

/* font -------------------------------------------------------------- */
static const char *fonts[]    = { 
  "jetBrainsMono Nerd Font Mono:style=bold:size=12:antialias=true:autohint=true" 
};
static const char dmenufont[] = "jetBrainsMono Nerd Font Mono:style=regular:size=12:antialias=true:autohint=true";

/* colors -------------------------------------------------------------- */
static const char fgcolor[]         = "#ebdbb2"; // "#ffffff";
static const char bgcolor[]         = "#1d2021"; // "#2D2A2E";
static const char bordercolor[]     = "#1d2021"; // "#2D2A2E";
static const char selfgcolor[]      = "#e78a4e"; // "#73b8f1";
static const char selbgcolor[]      = "#1d2021"; // "#2D2A2E";
static const char selbordercolor[]  = "#e78a4e"; // "#73b8f1";
static const char *colors[][3]      = {
	/*               fg           bg          border   */
	[SchemeNorm] = { fgcolor,     bgcolor,    bordercolor },
	[SchemeSel]  = { selfgcolor,  selbgcolor, selbordercolor  },
};

/* autostart -------------------------------------------------------------- */
static const char *const autostart[] = {
	"sh", "-c", "~/.config/suckless/scripts/autostart.sh", NULL,
	NULL /* terminate */
};

/* tagging -------------------------------------------------------------- */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7" };
static const unsigned int ulinepad	    = 5;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke	  = 2;	/* thickness / height of the underline */
static const unsigned int ulinevoffset	= 0;	/* how far above the bottom of the bar the line should appear */
static const int ulineall               = 0;	/* 1 to show underline on all tags, 0 for just the active ones */

/* tag rules -------------------------------------------------------------- */
static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class              instance    title       tags mask     isfloating   monitor */
  { "Gimp",             NULL,       NULL,       0,            1,           -1 },
	{ "mpv",  				    NULL,       NULL,       0,       		  1,           -1 },
	{ "qimgv",    			  NULL,       NULL,       0,       		  1,           -1 },
	{ "Transmission-gtk", NULL,       NULL,       0,       		  1,           -1 },
	{ "Lxappearance",   	NULL,       NULL,       0,       		  1,           -1 },
	{ "Pavucontrol",  		NULL,       NULL,       0,       		  1,           -1 },
  { "obsidian",         NULL,       NULL,       0,            1,           -1 },
};

/* layout(s) -------------------------------------------------------------- */
static const float mfact        = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster        = 1;    /* number of clients in master area */
static const int resizehints    = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

/* split vertical */
#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */

#include "vanitygaps.c"

/* layouts */
static const Layout layouts[] = {
	/* symbol     arrange function */
  { "[\\]",     dwindle },
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "H[]",      deck },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "HHH",      grid },
	{ "###",      nrowgrid },
	{ "---",      horizgrid },
	{ ":::",      gaplessgrid },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
  { "[@]",      spiral },
	{ "><>",      NULL },    /* no layout function means floating behavior */
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
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", bgcolor, "-nf", fgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };

static const char *termcmd[]          = { "st", NULL };
static const char *alacrittycmd[]     = { "alacritty", NULL };
static const char *webbrowsercmd[]    = { "librewolf", NULL };
static const char *pcmanfmcmd[]       = { "pcmanfm", NULL };
static const char *geanycmd[]         = { "geany", NULL };
static const char *gimpcmd[]          = { "gimp", NULL };
static const char *flameshotfullcmd[] = { "flameshot", "full", "-path", "~/Screenshots/", NULL };
static const char *flameshotguicmd[]  = { "flameshot", "gui", "--path", "~/Screenshots/", NULL };

static const char *audiomutecmd[]         = { "amixer", "set", "Master", "toggle", NULL };
static const char *audioraisevolumecmd[]  = { "amixer", "set", "Master", "5%+", NULL };
static const char *audiolowervolumecmd[]  = { "amixer", "set", "Master", "5%-", NULL };
static const char *monbrightnessupcmd[]   = { "brightnessctl", "-c", "backlight", "set", "5%+", NULL };
static const char *monbrightnessdowncmd[] = { "brightnessctl", "-c", "backlight", "set", "5%-", NULL };

#include "movestack.c"

static const Key keys[] = {
	/* modifier           key        function   argument */
	{ MODKEY,             XK_p,      spawn,     {.v = dmenucmd } },
	{ MODKEY,             XK_Return, spawn,     {.v = alacrittycmd } },
	{ MODKEY,             XK_t,      spawn,     {.v = termcmd  } },
	{ MODKEY,             XK_w,      spawn,     {.v = webbrowsercmd } },
	{ MODKEY,             XK_f,      spawn,     {.v = pcmanfmcmd } },
	{ MODKEY,             XK_e,      spawn,     {.v = geanycmd } },
	{ MODKEY,             XK_g,      spawn,     {.v = gimpcmd } },
	{ MODKEY,             XK_s,      spawn,     {.v = flameshotfullcmd } },
	{ MODKEY|ShiftMask,   XK_s,      spawn,     {.v = flameshotguicmd } },
	{ MODKEY,             XK_space,  spawn,     SHCMD( "~/.config/rofi/launchers/type-2/launcher.sh" ) },
	{ MODKEY,             XK_x,      spawn,     SHCMD( "~/.config/rofi/powermenu/type-1/powermenu.sh" ) },
	{ MODKEY|ShiftMask,   XK_r,      spawn,     SHCMD( "~/.config/suckless/scripts/redshift-on" ) },
	{ MODKEY,             XK_r,      spawn,     SHCMD( "~/.config/suckless/scripts/redshift-off" ) },

	{ 0,                       XF86XK_AudioMute,      spawn,          {.v = audiomutecmd } },
	{ 0,                       XF86XK_AudioRaiseVolume,      spawn,          {.v = audioraisevolumecmd } },
	{ 0,                       XF86XK_AudioLowerVolume,      spawn,          {.v = audiolowervolumecmd } },
	{ 0,                       XF86XK_MonBrightnessUp,      spawn,          {.v = monbrightnessupcmd } },
	{ 0,                       XF86XK_MonBrightnessDown,      spawn,          {.v = monbrightnessdowncmd } },

  /* togglebar */
	{ MODKEY|Mod1Mask,               XK_b,      togglebar,      {0} },
  
  /* fullscreen */
	{ MODKEY|Mod1Mask,              XK_f,      fullscreen,     {0} },
  
  /* stacks */
	{ MODKEY,                       XK_Right,  focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Left,   focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_Right,  movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_Left,   movestack,      {.i = -1 } },
  { MODKEY|Mod1Mask,              XK_Right,  setmfact,       {.f = +0.05} },
	{ MODKEY|Mod1Mask,              XK_Left,   setmfact,       {.f = -0.05} },
  
  /*  */
	{ MODKEY|Mod1Mask,              XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY|Mod1Mask,              XK_d,      incnmaster,     {.i = -1 } },
  { MODKEY|Mod1Mask,              XK_z,      zoom,           {0} },
  
  /* gaps */
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
  
  /* monitor */
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
  { MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
  
  /* gaps */
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
  
  /* layouts */
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
  
  /* tagkeys */
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
  
  /* close */
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click         event mask  button    function        argument */
	{ ClkLtSymbol,   0,          Button1,  setlayout,      {0} },
	{ ClkLtSymbol,   0,          Button3,  setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,   0,          Button2,  zoom,           {0} },
	{ ClkStatusText, 0,          Button2,  spawn,          {.v = termcmd } },
	{ ClkClientWin,  MODKEY,     Button1,  movemouse,      {0} },
	{ ClkClientWin,  MODKEY,     Button2,  togglefloating, {0} },
	{ ClkClientWin,  MODKEY,     Button3,  resizemouse,    {0} },
	{ ClkTagBar,     0,          Button1,  view,           {0} },
	{ ClkTagBar,     0,          Button3,  toggleview,     {0} },
	{ ClkTagBar,     MODKEY,     Button1,  tag,            {0} },
	{ ClkTagBar,     MODKEY,     Button3,  toggletag,      {0} },
};

