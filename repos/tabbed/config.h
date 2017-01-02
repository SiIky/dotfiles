/* See LICENSE file for copyright and license details. */

/* Monokai */
#define COL_BLACK       "#000000"
#define COL_GRAY        "#272822"
#define COL_BLUE        "#66D9EF"
#define COL_GREEN       "#A6E22E"
#define COL_MAGENTA     "#F92672"
#define COL_ORANGE      "#FD971F"

/* appearance */
static const char font[]        = "Hermit:pixelsize=14:antialias=true";
static const char* normbgcolor  = COL_GRAY;
static const char* normfgcolor  = COL_GREEN;
static const char* selbgcolor   = COL_BLACK;
static const char* selfgcolor   = COL_MAGENTA;
static const char* urgbgcolor   = COL_ORANGE;
static const char* urgfgcolor   = COL_MAGENTA;
static const char before[]      = "<";
static const char after[]       = ">";
static const char titletrim[]   = "...";
static const int  tabwidth      = 200;
static const Bool foreground    = True;
static       Bool urgentswitch  = False;

/*
 * Where to place a new tab when it is opened. When npisrelative is True,
 * then the current position is changed + newposition. If npisrelative
 * is False, then newposition is an absolute position.
 */
static int  newposition   = -1;
static Bool npisrelative  = False;

#define SETPROP(p) { \
        .v = (char *[]){ "/bin/sh", "-c", \
                "prop=\"`xwininfo -children -id $1 | grep '^     0x' |" \
                "sed -e's@^ *\\(0x[0-9a-f]*\\) \"\\([^\"]*\\)\".*@\\1 \\2@' |" \
                "xargs -0 printf %b | dmenu -l 10`\" &&" \
                "xprop -id $1 -f $0 8s -set $0 \"$prop\"", \
                p, winid, NULL \
        } \
}

#define MODKEY ControlMask
static Key keys[] = {
	/* modifier             key        function     argument */
	{ MODKEY|ShiftMask,     XK_Return, focusonce,   { 0 } },
	{ MODKEY|ShiftMask,     XK_Return, spawn,       { 0 } },
	{ MODKEY,               XK_t,      spawn,       SETPROP("_TABBED_SELECT_TAB") },
	{ MODKEY|ShiftMask,     XK_l,      rotate,      { .i = +1 } },
	{ MODKEY|ShiftMask,     XK_h,      rotate,      { .i = -1 } },
	{ MODKEY|ShiftMask,     XK_j,      movetab,     { .i = -1 } },
	{ MODKEY|ShiftMask,     XK_k,      movetab,     { .i = +1 } },
	{ MODKEY,               XK_Tab,    rotate,      { .i = 0 } },
	{ MODKEY,               XK_q,      killclient,  { 0 } },
	{ 0,                    XK_F11,    fullscreen,  { 0 } },
};
