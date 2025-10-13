echo "Lets install Fonts Globally on this system ✨"


# Color Scheme
echo "Fonts 🎶 copying to global directory /usr/share/fonts/"

sudo cp -r $HOME/.fonts/* /usr/share/fonts/
sudo chmod 644 /usr/share/fonts/*
sudo fc-cache -f -v
echo "Fonts 🎶 copied to /usr/share/fonts/ and cached"