/* See LICENSE file for copyright and license details. */

/* appearance */

static const unsigned int borderpx  = 4;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 4;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 4;       /* vert inner gap between windows */
static const unsigned int gappoh    = 4;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 4;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int vertpad            = 0;       /* vertical padding of bar */
static const int sidepad            = 0;       /* horizontal padding of bar */
static const char *fonts[]          = { "jetBrainsMono:size=11:style=bold:antialias=true:autohint=true" }; /*"Font Awesome 5 Free:size=13"  */ 
static const char dmenufont[]       = "jetBrainsMono:size=11:antialias=true:autohint=true";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#353535";
static const char col_gray3[]       = "#83a598";
static const char col_gray4[]       = "#ffffff";
static const char col_cyan[]        = "#458588"; 
static const char *colors[][3]      = {
	/*                    fg         bg         border   */
	[SchemeNorm]      = { col_gray3, col_gray1, col_gray1 },
	[SchemeSel]       = { col_gray3, col_gray1, col_gray1  },
	[SchemeStatus]    = { col_gray3, col_gray1, col_gray1  }, // Statusbar right {text,background,not used but cannot be empty}
	[SchemeTagsSel]   = { col_gray4, col_gray1, col_gray1  }, // Tagbar left selected {text,background,not used but cannot be empty}
	[SchemeTagsNorm]  = { col_gray3, col_gray1, col_gray1  }, // Tagbar left unselected {text,background,not used but cannot be empty}
	[SchemeInfoSel]   = { col_gray4, col_gray1, col_gray1  }, // infobar middle  selected {text,background,not used but cannot be empty}
	[SchemeInfoNorm]  = { col_gray4, col_gray1, col_gray1  }, // infobar middle  unselected {text,background,not used but cannot be empty}
};

/*autostart*/
static const char *const autostart[] = {
  "sh", "-c", "slstatus", NULL,
  "xfce4-power-manager", NULL,
  "/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1", NULL,
	"dunst", NULL,
	NULL /* terminate */
};

#include <X11/XF86keysym.h>
/*brightness*/
static const char *brightness[2][4] = {
  {"brightnessctl", "set", "5%+", NULL},
  {"brightnessctl", "set", "5%-", NULL},
};

/*volume*/
static const char *volume[3][5] = { 
  {"amixer", "set", "Master", "5%+", NULL},
  {"amixer", "set", "Master", "5%-", NULL},
  {"amixer", "set", "Master", "toggle", NULL},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact        = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster        = 1;    /* number of clients in master area */
static const int resizehints    = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "[@]",      spiral },
	{ "[\\]",     dwindle },
	{ "H[]",      deck },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "HHH",      grid },
	{ "###",      nrowgrid },
	{ "---",      horizgrid },
	{ ":::",      gaplessgrid },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod1Mask
#define CMDKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *filecmd[]  = { "thunar", NULL };
static const char *webcmd[]   = { "firefox", NULL };
static const char *mswebcmd[] = { "microsoft-edge", NULL };
static const char *surfcmd[]  = { "surf", NULL };
static const char *gitcmd[]   = { "github-desktop", NULL };
static const char *htopcmd[]  = { "st", "-e", "htop" };

#include "exitdwm.c"
static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ CMDKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ CMDKEY,                       XK_f,      spawn,          {.v = filecmd } },
	{ CMDKEY,                       XK_e,      spawn,          {.v = mswebcmd } },
	{ CMDKEY,                       XK_w,      spawn,          {.v = webcmd } },
	{ CMDKEY,                       XK_s,      spawn,          {.v = surfcmd } },
	{ CMDKEY,                       XK_g,      spawn,          {.v = gitcmd } },
	{ CMDKEY,                       XK_h,      spawn,          {.v = htopcmd } },
	{ CMDKEY,                       XK_t,      spawn,          {.v = termcmd } },
	{ CMDKEY,                       XK_Return, spawn,          {.v = termcmd } },

	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_h,      setcfact,       {.f = +0.25} },
	{ MODKEY|ShiftMask,             XK_l,      setcfact,       {.f = -0.25} },
	{ MODKEY|ShiftMask,             XK_o,      setcfact,       {.f =  0.00} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY|Mod4Mask,              XK_u,      incrgaps,       {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_u,      incrgaps,       {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_i,      incrigaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_i,      incrigaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_o,      incrogaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_o,      incrogaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_6,      incrihgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_6,      incrihgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_7,      incrivgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_7,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_8,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_8,      incrohgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_9,      incrovgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_9,      incrovgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_0,      togglegaps,     {0} },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_0,      defaultgaps,    {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },

  { 0, XF86XK_AudioRaiseVolume,              spawn,          {.v = volume[0]} },
  { 0, XF86XK_AudioLowerVolume,              spawn,          {.v = volume[1]} },
  { 0, XF86XK_AudioMute,                     spawn,          {.v = volume[2]} },

  { 0, XF86XK_MonBrightnessUp,               spawn,          {.v = brightness[0]} },
  { 0, XF86XK_MonBrightnessDown,             spawn,          {.v = brightness[1]} },

	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)

	{ ControlMask,                  XK_q,      killclient,      {0} },
	{ CMDKEY,                       XK_q,      exitdwm,         {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
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
