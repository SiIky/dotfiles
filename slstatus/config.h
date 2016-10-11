/* See LICENSE file for copyright and license details. */

/* how often to update the statusbar (min value == 1) */
#define UPDATE_INTERVAL 2

/* text to show if no value can be retrieved */
#define UNKNOWN_STR     "n/a"

#define SEP     "\u2329 " /* 〈 */

#define WIFI_F  "\u2387 " /* ⎇  */
#define CPU_F   "\u231A " /* ⌚ */
#define RAM_F   "\u2328 " /* ⌨  */
#define BAT_F   "bat "
#define TIME_F  "\u231B " /* ⌛ */

#define WIFI_A  "wlan0"
#define CPU_A   NULL
#define RAM_A   NULL
#define BAT_A   "BAT0"
#define TIME_A  "%R"

/* statusbar
- battery_perc (battery percentage) [argument: battery name]
- battery_state (battery charging state) [argument: battery name]
- cpu_perc (cpu usage in percent) [argument: NULL]
- datetime (date and time) [argument: format]
- disk_free (disk usage in percent) [argument: mountpoint]
- disk_perc (disk usage in percent) [argument: mountpoint]
- disk_total (disk usage in percent) [argument: mountpoint]
- disk_used (disk usage in percent) [argument: mountpoint]
- entropy (available entropy) [argument: NULL]
- gid (gid of current user) [argument: NULL]
- hostname [argument: NULL]
- ip (ip address) [argument: interface]
- load_avg (load average) [argument: NULL]
- ram_free (ram usage in percent) [argument: NULL]
- ram_perc (ram usage in percent) [argument: NULL]
- ram_total (ram usage in percent) [argument: NULL]
- ram_used (ram usage in percent) [argument: NULL]
- run_command (run custom shell command) [argument: command]
- temp (temperature in degrees) [argument: temperature file]
- uid (uid of current user) [argument: NULL]
- uptime (uptime) [argument: NULL]
- username (username of current user) [argument: NULL]
- vol_perc (alsa volume and mute status in percent) [argument: soundcard]
- wifi_perc (wifi signal in percent) [argument: wifi card interface name]
- wifi_essid (wifi essid) [argument: wifi card interface name] */
static const struct arg args[] = {
    /* function         format                  argument */
    { wifi_essid,       SEP WIFI_F "%s ",       WIFI_A },
    { cpu_perc,         SEP CPU_F  "%s ",       CPU_A  },
    { ram_perc,         SEP RAM_F  "%s ",       RAM_A  },
    { battery_perc,     SEP BAT_F  "%s ",       BAT_A  },
    { datetime,         SEP TIME_F "%s ",       TIME_A },
    /*{ datetime,     "| %s ",        "%d(%a)/%m(%b)/%y %R" },*/
};
