# tabinol-overlay
This is a non official Gentoo overlay repository. I use it to share my personal ebuild files.


To add this overlay:

    layman -o https://raw.githubusercontent.com/Tabinol/tabinol-overlay/master/metadata/tabinol.xml -f -a tabinol
    
## About Minecraft
Use games-action/minecraft-bin instead of games-action/minecraft
minecraft-gentoo executable is removed because it is broken. This ebuild uses Mojang official libraries only.

## Bugs
x11-themes/iconpack-obsidian takes (some times) very long time to install.
