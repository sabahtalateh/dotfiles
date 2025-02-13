## Git
Открываем теминал и пишем 

```
git
```

Вылезет окно установки `xcode-select`. Устанавливаем его. `git` нужен для работы `xcode`-а, установятся всякие инструменты для разработки

После установки (долгой) пишем в терминале `git` ещё раз и видим справку гита, значит он работает и можно клонировать репозиторий

```
cd ~
git clone https://github.com/sabahtalateh/dotfiles.git .dotfiles
```

## Терминал

### Настраиваем терминал (дефолтный)

`zsh` вроде как дефолтный shell в macos теперь, так что устанавливать его не надо

- `General -> Shell open with -> Command` тут пишем `/bin/zsh` (если ещё не написано)
- В `Profiles` импортируем файл `~/.dotfiles/terminal/Man Page Custom.terminal`
- `Terminal -> Settings`
- `On startup, open -> Man Page Custom`
- Идём в `Profiles` нажимаем на `Man Page Custom` и делаем его дефолтным (кнопка `Default` снизу)
- Перезапускаем терминал

### Устанавливаем `oh-my-zsh`

https://ohmyz.sh



