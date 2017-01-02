/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 8;        /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "Hermit:size=10" };
static const char dmenufont[]       = "Hermit:size=10";

/* Monokai */
#define COL_BLACK       "#000000"
#define COL_GRAY        "#272822"
#define COL_BLUE        "#66D9EF"
#define COL_GREEN       "#A6E22E"
#define COL_MAGENTA     "#F92672"
#define COL_ORANGE      "#FD971F"

static const char col0[] = COL_GRAY;
static const char col1[] = COL_BLUE;
static const char col2[] = COL_GREEN;
static const char col3[] = COL_MAGENTA;
static const char col4[] = COL_ORANGE;
static const char col5[] = COL_BLACK;

//static const char *colors[SchemeLast][3] = {
static const char *colors[][3] = {
    /*               fg    bg    border */
    [SchemeNorm] = { col2, col0, col1 },
    [SchemeSel]  = { col3, col5, col4 },
};

/* False means using the scroll wheel on a window will not change focus */
static const Bool focusonwheelscroll = False;

/* tagging */
#define SEP     "\u232A" /* 〉 */

#define TAG1    "ViM"   SEP
#define TAG2    "term"  SEP
#define TAG3    "media" SEP
#define TAG4    "W"     SEP
#define TAG5    "M"     SEP
#define TAG6    "steam" SEP
#define TAG7    "v"
#define TAG8    "o"
#define TAG9    "i"
#define TAG0    "d"

static const char *tags[] = { TAG1, TAG2, TAG3, TAG4, TAG5, TAG6, TAG7, TAG8, TAG9, TAG0 };

/* tabs */
#define T_VIM   (1 << 0)
#define T_TERM  (1 << 1)
#define T_MEDIA (1 << 2)
#define T_WEB   (1 << 3)
#define T_MAIL  (1 << 4)
#define T_STEAM (1 << 5)
#define T_VOID  (1 << 6)

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /*class                     instance                        title           tags mask       isfloating      monitor */
    { "Media",                  NULL,                           NULL,           T_MEDIA,        0,              -1 },
    { "Spotify",                "spotify",                      "Spotify",      T_MEDIA,        0,              -1 },
    { "Firefox",                "Navigator",                    NULL,           T_WEB,          0,              -1 },
    { "News",                   NULL,                           NULL,           T_MAIL,         0,              -1 },
    { NULL,                     "Mail",                         NULL,           T_MAIL,         0,              -1 },
    { "Surf",                   "surf",                         NULL,           T_MAIL,         0,              -1 },
    { "HTOP",                   "HTOP",                         "HTOP",         T_VOID,         0,              -1 },
    { "WICD",                   "WICD",                         "WICD",         T_VOID,         0,              -1 },
    { "Gpodder",                "gpodder",                      "gPodder",      T_MAIL,         0,              -1 },
    { "Steam",                  NULL,                           NULL,           T_STEAM,        0,              -1 },
    { "VIM",                    "VIM",                          "VIM",          T_VIM,          0,              -1 },
    { "Gimp",                   NULL,                           NULL,           0,              1,              -1 },
    { "processing-app-Base",    "sun-awt-X11-XFramePeer",       NULL,           0,              1,              -1 }, /* Arduino IDE */
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 2;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[M]",      monocle },
    { "[]=",      tile },    /* first entry is default */
    { "><>",      NULL },    /* no layout function means floating behavior */
};

/* key definitions */
#define XF86AudioLowerVolume    0x1008ff11
#define XF86AudioMute           0x1008ff12
#define XF86AudioRaiseVolume    0x1008ff13
#define XF86AudioPlay           0x1008ff14
#define XF86AudioStop           0x1008ff15
#define XF86AudioNext           0x1008ff16
#define XF86AudioPrev           0x1008ff17

#define LAlt           Mod1Mask
#define WinKey         Mod4Mask

#define TAGKEYS(KEY,TAG) \
{ WinKey,                       KEY,      view,           {.ui = 1 << TAG} }, \
{ WinKey|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
{ WinKey|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
{ WinKey|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} }

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2]         = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[]   = { "dmenu_run", "-f", "-m", dmenumon, "-fn", dmenufont, "-nb", col0, "-nf", col2, "-sb", col5, "-sf", col3, NULL };
static const char *termcmd[]    = { "tabbed", "-r", "2", "st", "-w", "''", NULL };
static const char *htopcmd[]    = { "st", "-c", "HTOP", "-n", "HTOP", "-t", "HTOP", "htop", NULL };
static const char *rangercmd[]  = { "st", "-c", "RANGER", "-n", "RANGER", "-t", "RANGER", "ranger", NULL };
static const char *vimcmd[]     = { "st", "-c", "VIM", "-n", "VIM", "-t", "VIM", "vim", NULL };

/* volume controls */
static const char *volup[]      = { "amixer", "set", "Master", "5%+",  NULL };
static const char *voldown[]    = { "amixer", "set", "Master", "5%-",  NULL };
static const char *volmute[]    = { "amixer", "set", "Master", "toggle", NULL };

/* cmus controls */
static const char *cmus_play[]  = { "cmus-remote", "-u", NULL };
static const char *cmus_stop[]  = { "cmus-remote", "-s", NULL };
static const char *cmus_prev[]  = { "cmus-remote", "-n", NULL };
static const char *cmus_next[]  = { "cmus-remote", "-r", NULL };

static const Key keys[] = {
    /*modifier                  key                     function                argument */
    { WinKey,                   XK_h,                   togglebar,              {0} },
    { LAlt,                     XK_Tab,                 focusstack,             {.i = +1 } },
    { LAlt|ShiftMask,           XK_Tab,                 focusstack,             {.i = -1 } },
    { WinKey,                   XK_i,                   incnmaster,             {.i = +1 } },
    { WinKey,                   XK_d,                   incnmaster,             {.i = -1 } },
    { WinKey|ShiftMask,         XK_h,                   setmfact,               {.f = -0.05 } },
    { WinKey|ShiftMask,         XK_l,                   setmfact,               {.f = +0.05 } },
    { WinKey,                   XK_Return,              zoom,                   {0} },
    { WinKey,                   XK_Tab,                 view,                   {0} },
    { LAlt,                     XK_F4,                  killclient,             {0} },
    { WinKey,                   XK_space,               setlayout,              {0} },
    { WinKey|ShiftMask,         XK_space,               togglefloating,         {0} },
    { WinKey,                   XK_comma,               focusmon,               {.i = -1 } },
    { WinKey,                   XK_period,              focusmon,               {.i = +1 } },
    { WinKey|ShiftMask,         XK_comma,               tagmon,                 {.i = -1 } },
    { WinKey|ShiftMask,         XK_period,              tagmon,                 {.i = +1 } },
    { WinKey|ShiftMask,         XK_F4,                  quit,                   {0} },
    TAGKEYS(                    XK_1,                                           0),
    TAGKEYS(                    XK_2,                                           1),
    TAGKEYS(                    XK_3,                                           2),
    TAGKEYS(                    XK_4,                                           3),
    TAGKEYS(                    XK_5,                                           4),
    TAGKEYS(                    XK_6,                                           5),
    TAGKEYS(                    XK_7,                                           6),
    TAGKEYS(                    XK_8,                                           7),
    TAGKEYS(                    XK_9,                                           8),
    TAGKEYS(                    XK_0,                                           9),
    { WinKey,                   XK_v,                   spawn,                  {.v = vimcmd } },
    { WinKey,                   XK_r,                   spawn,                  {.v = dmenucmd } },
    { WinKey,                   XK_t,                   spawn,                  {.v = termcmd } },
    { ShiftMask|ControlMask,    XK_Delete,              spawn,                  {.v = htopcmd } },
    { WinKey,                   XK_e,                   spawn,                  {.v = rangercmd } },
    /* Volume & CMUS controls */
    { 0,                        XF86AudioRaiseVolume,   spawn,                  {.v = volup } },
    { 0,                        XF86AudioLowerVolume,   spawn,                  {.v = voldown } },
    { 0,                        XF86AudioMute,          spawn,                  {.v = volmute } },
    { 0,                        XF86AudioPlay,          spawn,                  {.v = cmus_play } },
    { 0,                        XF86AudioStop,          spawn,                  {.v = cmus_stop } },
    { 0,                        XF86AudioPrev,          spawn,                  {.v = cmus_prev } },
    { 0,                        XF86AudioNext,          spawn,                  {.v = cmus_next } },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
    /* click            event mask    button      function           argument */
    { ClkClientWin,     WinKey,       Button1,    movemouse,         {0} },
    { ClkClientWin,     WinKey,       Button2,    togglefloating,    {0} },
    { ClkClientWin,     WinKey,       Button3,    resizemouse,       {0} },
    { ClkTagBar,        0,            Button1,    view,              {0} },
};
