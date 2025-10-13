echo "Lets install JuxTheme Blue ✨"

echo "Adding files to local configs 💫"

# Color Scheme
echo "Color scheme 🌈 copying to $HOME/.local/share/color-schemes/"
# create directory if not exists
if [ ! -d "$HOME/.local/share/color-schemes" ]; then
  mkdir -p "$HOME/.local/share/color-schemes"
fi
cp ./JuxTheme.colors $HOME/.local/share/color-schemes/
echo "Color scheme copied to $HOME/.local/share/color-schemes/"

# Plasma Style
echo "Plasma style 🔥 copying to $HOME/.local/share/plasma/desktoptheme/"
# create directory if not exists
if [ ! -d "$HOME/.local/share/plasma/desktoptheme" ]; then
  mkdir -p "$HOME/.local/share/plasma/desktoptheme"
fi
cp -r ./JuxPlasma $HOME/.local/share/plasma/desktoptheme/
echo "Plasma style 🔥 copied to $HOME/.local/share/plasma/desktoptheme/"

# Window Decorations
echo "Window decorations 🪟 copying to $HOME/.local/share/aurorae/themes/"
# create directory if not exists
if [ ! -d "$HOME/.local/share/aurorae/themes" ]; then
  mkdir -p "$HOME/.local/share/aurorae/themes"
fi
cp -r ./JuxDeco $HOME/.local/share/aurorae/themes/
echo "Window decorations 🪟 copied to $HOME/.local/share/aurorae/themes/"

# Rofi 
echo "Rofi 🍵 copying to $HOME/.config/rofi/"
# create directory if not exists
if [ ! -d "$HOME/.config/rofi" ]; then
  mkdir -p "$HOME/.config/rofi"
fi
cp ./rofi/config.rasi $HOME/.config/rofi/
echo "Rofi 🍵 copied to $HOME/.config/rofi/"

# Kvantum NoManSkyJux
echo "Kvantum NoManSkyJux Theme 🎨 copying to $HOME/.config/Kvantum/"
# create directory if not exists
if [ ! -d "$HOME/.config/Kvantum" ]; then
  mkdir -p "$HOME/.config/Kvantum"
fi
cp -r ./NoManSkyJux $HOME/.config/Kvantum/
cp -r ./Orchis $HOME/.config/Kvantum/
echo "Kvantum NoManSkyJux, and Orchis(bonus) Theme 🎨 copied to $HOME/.config/Kvantum/"

echo "All files copied! You can now select the theme from system settings 🎉."

cat << EOF
Now, what you must do:
- Install Fonts
- Install Icons from Yet Another Monochrome Icon Set (provided, just select from system settings)
- Install kwin-effects-force-blur (a.k.a better-blur) (https://github.com/taj-ny/kwin-effects-forceblur) [Also provided here]
- Go to System Settings and select:
  - JuxTheme as Color Scheme
  - JuxPlasma as Plasma Style
  - JuxDeco as Window Decorations
  - NoManSkyJux as Application Style (Kvantum)
- Set Rofi theme to JuxTheme (if you use Rofi)
- Set your terminal to use the JuxTheme color scheme (if supported)
- For BetterBLur, you can add the following to your better-blur list to translucent blur apps
dolphin
systemsettings
zen
app.zen_browser.zen
plasmashell
konsole
kvantummanager
org.kde.spectacle
discord
org.inkscape.Inkscape
Yad
kate
org.kde.plasma-systemmonitor
org.kde.ark
org.kde.discover
org.kde.haruna
rofi
spotify
steam
(add any other app you want, check out its kde-name with xprop if unsure))
- Restart your session (logout/login) or reboot

Enjoy your new theme! ✨
EOF