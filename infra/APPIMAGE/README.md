## Chromium AppImage Generation <img src="https://raw.githubusercontent.com/Alex313031/Chromium/main/logos/STAGING/Appimage_Logo.svg" width="36">

### Instructions
This directory contains files to generate an .AppImage of Chromium.

You __must__ place the .deb file (generated from running `package.sh`) in this directory, and then run `./make_appimage.sh`

When it is done, you will have an appimage in *out*, I.E. it should be something like `//Chromium/infra/APPIMAGE/out/Chromium_Browser-104.0.5107.0.glibc2.17-x86_64.AppImage`

You can use it standalone, after making it executable with `sudo chmod +x Chromium_Browser-*`, or (*recommended*) to integrate it with your system you can use [AppImageLauncher](https://github.com/TheAssassin/AppImageLauncher).

 - Running `./extract_appimage.sh` will extract the appimage contents to *out/Chromium_squashfs-root*
 - The *files* subdir contains files needed for the 22px and 512px icons, and a Chromium-shell wrapper that allows Chromium_shell to run properly in an AppImage.

 - *See also:* [About AppImages](https://appimage.org/)

### About <img src="https://github.com/Alex313031/Chromium/blob/main/logos/NEW/Chromium_infra_256.png" width="32">
&ndash; This infra project uses [*pkg2appimage*](https://github.com/AppImage/pkg2appimage/blob/master/pkg2appimage) from here > https://github.com/AppImage/pkg2appimage \
&ndash; The [*Chromium.yml*](https://github.com/Alex313031/Chromium/blob/main/infra/APPIMAGE/Chromium.yml) file was modeled after the official Chromium one from here > https://github.com/AppImage/pkg2appimage/blob/master/recipes/Chromium.yml
