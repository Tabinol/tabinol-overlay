# tabinol-overlay
This is a non official Gentoo overlay repository. I use it to share my personal ebuild files.


To add this overlay:

    layman -o https://raw.githubusercontent.com/Tabinol/tabinol-overlay/master/metadata/tabinol.xml -f -a tabinol
    
## About Minecraft
To install Minecraft client, you must add also [Java Overlay](https://github.com/gentoo/java-overlay) for dependencies. minecraft-gentoo executable is removed because it is broken. This ebuild uses Mojang official libraries only.
