
# Project Eris Internal Rom Replacement Apps

![Logo](https://gitlab.com/modmyclassic/sony-playstation-classic/project-eris-interal-rom-replacement-apps/-/raw/master/classic/psc_eris/media/project_eris/etc/project_eris/SUP/launchers/backupinternal_launch/backupinternallaunch.png)

This is a mod repo which builds and packages the Internal ROM Replacement apps for using with Project ERIS on the PlayStation Classic.

This is based on PASCL's original work.

## How to use

### Project ERIS (PlayStation Classic)

1. Download the .mod package from [the Project ERIS mods page](https://modmyclassic.com/project-eris-mods/)
2. Copy the .mod package to your USB to: `USB:/project_eris/mods/`
3. Plug in and boot up the PlayStation Classic. Project ERIS will automatically install.

## Need to know

* Backup launcher
  * it creates the folder "/media/project_eris/internal_games" used by all these launchers
  * this launcher doesn't start if this folder exists already
  * it backups /gaadata partition in "./games"
  * at the end, it creates a df.log file in "./"
  * at the end, it creates a "backup_done.flag" in "./.flags" containing '1'

* Before launching the Replace launcher (these operations can be done by the desktop app)
  * the new games need to be located in numbered folders in "./replaced_games"
  * the new database "regional.db" needs to be located in "./replaced_games/databases"
  * "./flags/backup_done.flag" needs to be edited to contain '2'

* Replace launcher
  * needs the "./replaced_games" folder and needs '2' in "./flags/backup_done.flag" to start
  * at the end, "./flags/backup_done.flag" contains '3'

* Restore launcher
  * needs the "./games" folder and needs "./flags/backup_done.flag" containing '2' or '3' to start
  * at the end, "./flags/backup_done.flag" contains '1'

* After Replace and/or Restore launchers, the internal games are not anymore in any folders

