/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>
#include "exitdwm.c"

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const Gap default_gap        = {.isgap = 1, .realgap = 10, .gappx = 10};
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */

static const char *fonts[]          = { 
  "Ubuntu:size=11:style=bold:antialias=true:autohint=true", 
  "jetBrainsMono Nerd Font Mono:style=regular:size=19:antialias=true:autohint=true" 
}; /*"Font Awesome 5 Free:size=13"  */ 

static const char dmenufont[]       = "Ubuntu:size=12:antialias=true:autohint=true";

static const char col_gray1[]       = "#000000";
static const char col_gray2[]       = "#3c3836";
static const char col_gray3[]       = "#bdae93";
static const char col_gray4[]       = "#fbf1c7";
static const char col_cyan[]        = "#458588";
static const char col_orange[]      = "#fd8019";
static const char *colors[][3]      = {
	/*                    fg            bg            border    */
	[SchemeNorm]      = { col_gray3,    col_gray1,    col_gray2  },
	[SchemeSel]       = { col_gray4,    col_orange,   col_orange   },
	[SchemeStatus]    = { col_gray3,    col_gray1,    col_gray1  }, // Statusbar right {text,background,not used but cannot be empty}
	[SchemeTagsSel]   = { col_orange,   col_gray1,    col_gray1  }, // Tagbar left selected {text,background,not used but cannot be empty}
	[SchemeTagsNorm]  = { col_gray3,    col_gray1,    col_gray1  }, // Tagbar left unselected {text,background,not used but cannot be empty}
	[SchemeInfoSel]   = { col_gray4,    col_gray1,    col_gray1  }, // infobar middle  selected {text,background,not used but cannot be empty}
	[SchemeInfoNorm]  = { col_gray4,    col_gray1,    col_gray1  }, // infobar middle  unselected {text,background,not used but cannot be empty}
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     iscentered   isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            0,           1,           -1 },
};

/* layout(s) */
static const float mfact        = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster        = 1;    /* number of clients in master area */
static const int resizehints    = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1;    /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define ALTKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ ALTKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ ALTKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ ALTKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ ALTKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st",  NULL };

static const char *filecmd[]    = { "pcmanfm", NULL };
static const char *webcmd[]     = { "firefox-esr", NULL };
static const char *mswebcmd[]   = { "microsoft-edge-stable", NULL };
static const char *gitcmd[]     = { "github-desktop", NULL };
static const char *taskcmd[]    = { "lxtask", NULL };
static const char *htopcmd[]    = { "st", "-e", "htop" };

static const char *screenshotroot[] = { "bash", "-c", "mkdir -p /home/sergio/screenshot && scrot /home/sergio/screenshot/%Y-%m-%d-%H-%M-%S.png", NULL };
static const char *screenshotselection[] = { "bash", "-c", "sleep 0.2 && mkdir -p /home/sergio/screenshot && scrot /home/sergio/screenshot/%Y-%m-%d-%H-%M-%S.png --select", NULL };

static const char *upvol[]      = { "amixer", "set", "Master", "+5%", NULL };
static const char *downvol[]    = { "amixer", "set", "Master", "5%-", NULL };
static const char *mute[]       = { "amixer", "set", "Master", "toggle", NULL };

static const char *brightup[]   = { "brightnessctl", "-c", "backlight", "set", "+5%", NULL};
static const char *brightdown[] = { "brightnessctl", "-c", "backlight", "set", "5%-", NULL};


static const Key keys[] = {
	/* modifier             key        function        argument */
	{ MODKEY,               XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,               XK_f,      spawn,          {.v = filecmd } },
	{ MODKEY,               XK_e,      spawn,          {.v = mswebcmd } },
	{ MODKEY,               XK_w,      spawn,          {.v = webcmd } },
	{ MODKEY,               XK_g,      spawn,          {.v = gitcmd } },
	{ MODKEY,               XK_h,      spawn,          {.v = htopcmd } },
	{ MODKEY,               XK_a,      spawn,          {.v = taskcmd } },
	{ MODKEY,               XK_t,      spawn,          {.v = termcmd } },
	{ MODKEY,               XK_Return, spawn,          {.v = termcmd } },

	{ ALTKEY,               XK_b,      togglebar,      {0} },
	
  { ALTKEY,               XK_j,      focusstack,     {.i = +1 } },
	{ ALTKEY,               XK_k,      focusstack,     {.i = -1 } },
	
  { ALTKEY,               XK_i,      incnmaster,     {.i = +1 } },
	{ ALTKEY,               XK_d,      incnmaster,     {.i = -1 } },
	
  { ALTKEY,               XK_h,      setmfact,       {.f = -0.05} },
	{ ALTKEY,               XK_l,      setmfact,       {.f = +0.05} },
	
  { ALTKEY,               XK_Return, zoom,           {0} },
	{ ALTKEY,               XK_Tab,    view,           {0} },
	
  { ALTKEY,               XK_t,      setlayout,      {.v = &layouts[0]} },
	{ ALTKEY,               XK_f,      setlayout,      {.v = &layouts[1]} },
	{ ALTKEY,               XK_m,      setlayout,      {.v = &layouts[2]} },
	{ ALTKEY,               XK_space,  setlayout,      {0} },
	{ ALTKEY|ShiftMask,     XK_space,  togglefloating, {0} },

	{ ALTKEY,               XK_0,      view,           {.ui = ~0 } },
	{ ALTKEY|ShiftMask,     XK_0,      tag,            {.ui = ~0 } },
	
  { ALTKEY,               XK_comma,  focusmon,       {.i = -1 } },
	{ ALTKEY,               XK_period, focusmon,       {.i = +1 } },
	
  { ALTKEY|ShiftMask,     XK_comma,  tagmon,         {.i = -1 } },
	{ ALTKEY|ShiftMask,     XK_period, tagmon,         {.i = +1 } },

	{ ALTKEY,               XK_minus,  setgaps,        {.i = -5 } },
	{ ALTKEY,               XK_equal,  setgaps,        {.i = +5 } },
	{ ALTKEY|ShiftMask,     XK_minus,  setgaps,        {.i = GAP_RESET } },
	{ ALTKEY|ShiftMask,     XK_equal,  setgaps,        {.i = GAP_TOGGLE} },

	{ ALTKEY,               XK_s,      spawn,          {.v = screenshotroot} },
	{ ALTKEY|ShiftMask,     XK_s,      spawn,          {.v = screenshotselection} },
	
  { 0,    XF86XK_AudioRaiseVolume,   spawn,          {.v = upvol } },
	{ 0,    XF86XK_AudioLowerVolume,   spawn,          {.v = downvol } },
	{ 0,    XF86XK_AudioMute,          spawn,          {.v = mute } },

  { 0,    XF86XK_MonBrightnessUp,    spawn,          {.v = brightup } },
  { 0,    XF86XK_MonBrightnessDown,  spawn,          {.v = brightdown } },

	TAGKEYS(                XK_1,                      0)
	TAGKEYS(                XK_2,                      1)
	TAGKEYS(                XK_3,                      2)
	TAGKEYS(                XK_4,                      3)
	TAGKEYS(                XK_5,                      4)
	TAGKEYS(                XK_6,                      5)
	TAGKEYS(                XK_7,                      6)
	TAGKEYS(                XK_8,                      7)
	TAGKEYS(                XK_9,                      8)

	{ ALTKEY,               XK_x,      killclient,     {0} },
	{ MODKEY,               XK_q,      exitdwm,        {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         ALTKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         ALTKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         ALTKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            ALTKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            ALTKEY,         Button3,        toggletag,      {0} },
};
