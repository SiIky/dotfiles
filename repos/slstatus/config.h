/* See LICENSE file for copyright and license details. */

/* how often to update the statusbar (min value == 1) */
#define UPDATE_INTERVAL 2

/* text to show if no value can be retrieved */
#define UNKNOWN_STR     "n/a"

#define SEP     "\u2329" /* 〈 */

#define WIFI_F  "\u2387 " /* ⎇  */
#define CPU_F   "\u231A " /* ⌚ */
#define RAM_F   "\u2328 " /* ⌨  */
#define BAT_F   "bat "
#define VOL_F   "vol "
#define TIME_F  "" /*"\u231B "*/ /* ⌛ */

#define WIFI_A  "wlan0"
#define CPU_A   NULL
#define RAM_A   NULL
#define BAT_A   "BAT0"
#define VOL_A   "/dev/mixer"
#define TIME_A  "%R" /* "%d(%a)/%m(%b)/%y %R" */

/* statusbar
- battery_perc (battery percentage) [argument: battery name]
- battery_state (battery charging state) [argument: battery name]
- cpu_perc (cpu usage in percent) [argument: NULL]
- datetime (date and time) [argument: format]
- disk_free (free disk space in GB) [argument: mountpoint]
- disk_perc (disk usage in percent) [argument: mountpoint]
- disk_total (total disk space in GB) [argument: mountpoint]
- disk_used (used disk space in GB) [argument: mountpoint]
- entropy (available entropy) [argument: NULL]
- gid (gid of current user) [argument: NULL]
- hostname [argument: NULL]
- ip (ip address) [argument: interface]
- kernel_release (uname -r) [argument: NULL]
- load_avg (load average) [argument: NULL]
- ram_free (free ram in GB) [argument: NULL]
- ram_perc (ram usage in percent) [argument: NULL]
- ram_total (total ram in GB) [argument: NULL]
- ram_used (used ram in GB) [argument: NULL]
- run_command (run custom shell command) [argument: command]
- swap_free (free swap in GB) [argument: NULL]
- swap_perc (swap usage in percent) [argument: NULL]
- swap_total (total swap in GB) [argument: NULL]
- swap_used (used swap in GB) [argument: NULL]
- temp (temperature in celsius) [argument: temperature file]
- uid (uid of current user) [argument: NULL]
- uptime (uptime) [argument: NULL]
- username (username of current user) [argument: NULL]
- vol_perc (oss/alsa volume status (see README)) [argument: /dev/mixer]
- wifi_perc (wifi signal in percent) [argument: wifi card interface name]
- wifi_essid (wifi essid) [argument: wifi card interface name] */
static const struct arg args[] = {
    /* function         format                  argument */
    { wifi_essid,       SEP WIFI_F "%s ",       WIFI_A },
    { cpu_perc,         SEP CPU_F  "%s ",       CPU_A },
    { ram_perc,         SEP RAM_F  "%s ",       RAM_A },
    { battery_perc,     SEP BAT_F  "%s ",       BAT_A },
    //{ vol_perc,         SEP VOL_F  "%s ",       VOL_A },
    { datetime,         SEP TIME_F "%s ",       TIME_A },
};
