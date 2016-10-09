/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 8;        /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "Hermit:size=10" };
static const char dmenufont[]       = "Hermit:size=10";
static const char col_gray1[]       = "#333333";
static const char col_gray2[]       = "#222222";
static const char col_gray3[]       = "#00ff00";
static const char col_gray4[]       = "#00ff00";
static const char col_cyan[]        = "#000000"; /* ff0000 */
static const char *colors[SchemeLast][3]      = {
    /*               fg         bg         border   */
    [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
    [SchemeSel] =  { col_gray4, col_cyan,  col_cyan  },
};

/* False means using the scroll wheel on a window will not change focus */
static const Bool focusonwheelscroll = False;

/* tagging */
static const char *tags[] = { "ViM", "term", "music", "w", "m", "steam", "void" };

/* tabs */
#define T_MUSIC         (1 << 2)
#define T_WEB           (1 << 3)
#define T_MAIL          (1 << 4)
#define T_STEAM         (1 << 5)

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class            instance        title           tags mask       isfloating      monitor */
    { "Gimp",           NULL,           NULL,           0,              1,              -1 },
    { "Spotify",        NULL,           NULL,           T_MUSIC,        0,              -1 },
    { "st-256color",    "st-256color",  "cmus v2.7.0",  T_MUSIC,        0,              -1 },
    { "Firefox",        NULL,           NULL,           T_WEB,          0,              -1 },
    { NULL,             "Mail",         NULL,           T_MAIL,         0,              -1 },
    { "Steam",          NULL,           NULL,           T_STEAM,        1,              -1 },
    { "Surf",           "surf",         NULL,           T_MAIL,         0,              -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[]=",      tile },    /* first entry is default */
    { "[M]",      monocle },
    { "><>",      NULL },    /* no layout function means floating behavior */
};

/* key definitions */
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
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[] = { "st", NULL };
static const char *ffcmd[] = { "firefox", NULL };

/* volume controls */
static const char *volup[]   = { "amixer", "set", "Master", "5+",     NULL };
static const char *voldown[] = { "amixer", "set", "Master", "5-",     NULL };
static const char *volmute[] = { "amixer", "set", "Master", "toggle", NULL };

static Key keys[] = {
    /*  modifier                 key                      function               argument */
    {   WinKey,                  XK_r,                    spawn,                 {.v = dmenucmd } },
    {   WinKey,                  XK_t,                    spawn,                 {.v = termcmd } },
    {   WinKey,                  XK_w,                    spawn,                 {.v = ffcmd } },
    {   WinKey,                  XK_h,                    togglebar,             {0} },
    {   LAlt,                    XK_Tab,                  focusstack,            {.i = +1 } },
    {   LAlt|ShiftMask,          XK_Tab,                  focusstack,            {.i = -1 } },
    {   WinKey,                  XK_i,                    incnmaster,            {.i = +1 } },
    {   WinKey,                  XK_d,                    incnmaster,            {.i = -1 } },
    {   WinKey|ShiftMask,        XK_h,                    setmfact,              {.f = -0.05} },
    {   WinKey|ShiftMask,        XK_l,                    setmfact,              {.f = +0.05} },
    {   WinKey,                  XK_Return,               zoom,                  {0} },
    {   WinKey,                  XK_Tab,                  view,                  {0} },
    {   LAlt,                    XK_F4,                   killclient,            {0} },
    {   WinKey,                  XK_space,                setlayout,             {0} },
    {   WinKey|ShiftMask,        XK_space,                togglefloating,        {0} },
    {   WinKey,                  XK_0,                    view,                  {.ui = ~0 } },
    {   WinKey|ShiftMask,        XK_0,                    tag,                   {.ui = ~0 } },
    {   WinKey,                  XK_comma,                focusmon,              {.i = -1 } },
    {   WinKey,                  XK_period,               focusmon,              {.i = +1 } },
    {   WinKey|ShiftMask,        XK_comma,                tagmon,                {.i = -1 } },
    {   WinKey|ShiftMask,        XK_period,               tagmon,                {.i = +1 } },
    {   WinKey|ShiftMask,        XK_F4,                   quit,                  {0} },
    {   WinKey,                  XK_F12,                  spawn,                 {.v = volup   } },
    {   WinKey,                  XK_F11,                  spawn,                 {.v = voldown } },
    {   WinKey,                  XK_F10,                  spawn,                 {.v = volmute } },
    TAGKEYS(                     XK_1,                                           0),
    TAGKEYS(                     XK_2,                                           1),
    TAGKEYS(                     XK_3,                                           2),
    TAGKEYS(                     XK_4,                                           3),
    TAGKEYS(                     XK_5,                                           4),
    TAGKEYS(                     XK_6,                                           5),
    TAGKEYS(                     XK_7,                                           6),
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
    /* click            event mask    button      function           argument */
    { ClkStatusText,    0,            Button2,    spawn,             {.v = termcmd } },
    /*
       { ClkLtSymbol,      0,            Button1,    setlayout,         {0} },
       { ClkWinTitle,      0,            Button2,    zoom,              {0} },
       { ClkClientWin,     WinKey,       Button1,    movemouse,         {0} },
       { ClkClientWin,     WinKey,       Button2,    togglefloating,    {0} },
       { ClkClientWin,     WinKey,       Button3,    resizemouse,       {0} },
       { ClkTagBar,        0,            Button1,    view,              {0} },
       { ClkTagBar,        0,            Button3,    toggleview,        {0} },
       { ClkTagBar,        WinKey,       Button1,    tag,               {0} },
       { ClkTagBar,        WinKey,       Button3,    toggletag,         {0} },
       */
};
