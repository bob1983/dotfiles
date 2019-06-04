# dotfiles
## Usage

### Bootstrap for ubuntu
Install essential softwares and setup your rcfiles.

```
git clone https://github.com/bob1983/dotfiles ~/dotfiles
cd dotfiles
./bootstrap.sh
./setup/dev_langs.sh
./setup/symlink.sh
```

### Bootstrap for osx
Setup your rcfiles.

```
./bootstrap.sh
./setup/symlink.sh
```

### TODOS
#### Ubuntu

- [x] github
  - 2fa
    - Get access token
    - Enter username: bob1983 and password(token)
- [ ] power line setting broken
- [x] copy and paste on terminal
    - Use shift + ctrl + v for now ...
- [ ] xkeysnail keymapping
  - Chrome
    - Search not working
    - New tab not working
    - Tab switching not working
- [ ] vs code setup
  - Configure setting sync to share configuration
  - font
- [ ] window manager -> place windows
  - I can do this with win + left|right|up|down but I wanna make this as different shortcut
  - Launcher with `win`
  - Switch applications with `win` + `tab`
- [ ] vim setting
  - Remove unused plug
- [ ] .ssh doesn't work
