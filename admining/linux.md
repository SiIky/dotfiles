# Adding user to (existing) group

```sh
man usermod
usermod -a -G group user
# -a appends
```

# Change permissions of a file or directory

```sh
man chmod
chmod permissions target
# -R flag applies the settings recursively
# (works from the root to the leaves of the target directory)
# 
# permissions are 3 groups of 3 bits each:
# 
#    u   g   o
# - --- --- ---
#   rwx rwx rwx
# 
#     r := 1
#     w := 2
#     x := 4
# 
# for example:
chmod 755 target
#     +---> owner's permissions
#     |+--> group's permissions
#     ||+-> other's permissions
#     |||
#     755
#     |||
#     ||+--> 4 + 1 = e(x)ecution + (r)ead permission
#     |+---> 4 + 1 = e(x)ecution + (r)ead permission
#     +----> 4 + 2 + 1 = e(x)ecution + (w)rite + (r)ead permission
#
# another way to give/take permissions:
# chmod [ugo][-+][rwx] target
# the equivalent to the `chmod 755 target` above is:
chmod u+rwx target
chmod go+rx target
chmod go-w target
```

# Change owner/group of a file or directory

```sh
man chown
chown newuser:newgroup target
# -R flag applies the settings recursively
# (works from the root to the leaves of the target directory)
```

# `/etc/passwd` and `/etc/group`

```sh
man 5 passwd
man 5 group
```

`/etc/passwd` contains the list of all the users and some of their settings
`/etc/group` contains the list of all the groups and some of their settings

Usually when a new account is created a group with the same name is created

# crontab

```sh
man crontab
crontab -e
```

```crontab
# @daily        executes cronjob daily at midnight
# @weekly       executes cronjob weekly at midnight
# @monthly      executes cronjob monthly at midnight
# on Debian the following entry updates the local packages entries
# probably needs to be on the root crontab
@daily apt-get update
# PATH is not set
@daily /absolute/path/to/executable/is/preferred --arguments-allowed
```
