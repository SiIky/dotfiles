/* See LICENSE file for copyright and license details. */

/* interval between updates (in ms) */
const unsigned int interval = 2000;

/* text to show if no value can be retrieved */
static const char unknown_str[] = "-";

/* maximum output string length */
#define MAXLEN 2048

#define SEP     ""

#define BAT_F   ""
#define CPU_F   ""
#define KEY_F   ""
#define RAM_F   ""
#define RUN_F   "\u266B " /* ♫ */
#define TIME_F  ""
#define WIFI_F  "\u2387 " /* ⎇  */
#define VOL_F   ""

#define BAT_A   "BAT0"
#define CPU_A   NULL
#define KEY_A   NULL
#define RAM_A   NULL
#define RUN_A   "~/bin/cmus-status.sh"
#define TIME_A  "%R"
#define WIFI_A  "wlan0"
#define VOL_A   "/dev/snd/hwC0D3" /* FIXME */

/*
 * function             description                     argument
 *
 * battery_perc         battery percentage              battery name
 * battery_power        battery power usage             battery name
 * battery_state        battery charging state          battery name
 * cpu_perc             cpu usage in percent            NULL
 * cpu_iowait           cpu iowait in percent           NULL
 * cpu_freq             cpu frequency in MHz            NULL
 * datetime             date and time                   format string
 * disk_free            free disk space in GB           mountpoint path
 * disk_perc            disk usage in percent           mountpoint path
 * disk_total           total disk space in GB          mountpoint path
 * disk_used            used disk space in GB           mountpoint path
 * entropy              available entropy               NULL
 * gid                  GID of current user             NULL
 * hostname             hostname                        NULL
 * ipv4                 IPv4 address                    interface name
 * ipv6                 IPv6 address                    interface name
 * kernel_release       `uname -r`                      NULL
 * keyboard_indicators  caps/num lock indicators        NULL
 * load_avg             load average                    format string
 * num_files            number of files in a directory  path
 * ram_free             free memory in GB               NULL
 * ram_perc             memory usage in percent         NULL
 * ram_total            total memory size in GB         NULL
 * ram_used             used memory in GB               NULL
 * run_command          custom shell command            command
 * swap_free            free swap in GB                 NULL
 * swap_perc            swap usage in percent           NULL
 * swap_total           total swap size in GB           NULL
 * swap_used            used swap in GB                 NULL
 * temp                 temperature in degree celsius   sensor file
 * uid                  UID of current user             NULL
 * uptime               system uptime                   NULL
 * username             username of current user        NULL
 * vol_perc             OSS/ALSA volume in percent      "/dev/mixer"
 * wifi_perc            WiFi signal in percent          interface name
 * wifi_essid           WiFi ESSID                      interface name
 */
static const struct arg args[] = {
    /* function         format                 argument */
    { run_command,      SEP RUN_F  "%s ",      RUN_A  }, // cmus status
    { wifi_essid,       SEP WIFI_F "%s ",      WIFI_A },
    { cpu_perc,         SEP CPU_F  "%s ",      CPU_A  },
    { ram_perc,         SEP RAM_F  "%s ",      RAM_A  },
    { battery_perc,     SEP BAT_F  "%s ",      BAT_A  },
    { datetime,         SEP TIME_F "%s ",      TIME_A },
    /*{ vol_perc,         SEP VOL_F  "%s ",      VOL_A  },*/
};
