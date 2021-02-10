# 基本設定
```
dock
    右に
    不要なものを除去・必要なもの追加
mission control
    ホットコーナーを設定
trackpad
    swipe方向を逆に
keyboard
    keyrepeat
    disable caps key
```


## dotfiles
- install xcode before exec command
```
curl -s https://raw.githubusercontent.com/cowsys/dotfiles/master/bootstrap_init | bash -
curl -s https://raw.githubusercontent.com/cowsys/dotfiles/master/bootstrap      | bash -
```

# vim
## plugin manager
```
mkdir -p ~/.vim/pack/minpac/opt/minpac
git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac

:call minpac#update()
```

## vim-go
```
:GoInstallBinaries
```

# xcodes
- xvim
