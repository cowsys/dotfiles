## dotfiles
### mac
- install xcode before exec command
```
curl -s https://raw.githubusercontent.com/cowsys/dotfiles/master/bootstrap_mac_init     | bash -
curl -s https://raw.githubusercontent.com/cowsys/dotfiles/master/bootstrap_dotfiles     | bash -
curl -s https://raw.githubusercontent.com/cowsys/dotfiles/master/bootstrap_mac_software | bash -
```

### linux
```
```


# vim
## plugin manager
```
mkdir -p ~/.vim/pack/minpac/opt/minpac
git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac

:call minpac#update()
```
