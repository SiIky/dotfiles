/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
    "Hermit:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */

/* Monokai */
#define COL_BLACK       "#000000"
#define COL_GRAY        "#272822"
#define COL_BLUE        "#66D9EF"
#define COL_GREEN       "#A6E22E"
#define COL_MAGENTA     "#F92672"
#define COL_ORANGE      "#FD971F"

static const char *colors[SchemeLast][2] = {
    /*               fg           bg       */
    [SchemeNorm] = { COL_GREEN,   COL_GRAY   },
    [SchemeSel]  = { COL_MAGENTA, COL_BLACK  },
    [SchemeOut]  = { COL_BLUE,    COL_ORANGE },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
