## Git
Открываем теминал и пишем 

```
git
```

Вылезет окно установки `xcode-select`. Устанавливаем его. `git` нужен для работы `xcode`-а, установятся всякие инструменты для разработки

После установки (долгой) пишем в терминале `git` ещё раз и видим справку гита, значит он работает и можно клонировать репозиторий

Клонировать репозиторий надо в папку `~/.dotfiles`. Все скрипты репозитория расчитаны на этот путь

```
cd ~
git clone https://github.com/sabahtalateh/dotfiles.git ~/.dotfiles
```

## Терминал

### Настраиваем терминал (дефолтный)

В дефолтном терминале нельзя менять сочетание клавиш очистки экрана (Cmd+K) :( Ну и хрен с ним. Все команды теминала можно изучить потыкав выпадающие меню сверху экрана

`zsh` вроде как дефолтный shell в macos теперь, так что устанавливать его не надо

- `General -> Shell open with -> Command` тут пишем `/bin/zsh` (если ещё не написано)
- В `Profiles` импортируем файл `~/.dotfiles/terminal/Man Page Custom.terminal`
- `Terminal -> Settings`
- `On startup, open -> Man Page Custom`
- Идём в `Profiles` нажимаем на `Man Page Custom` и делаем его дефолтным (кнопка `Default` снизу)
- Перезапускаем терминал

### Устанавливаем `brew` и программы

- https://brew.sh
- Внимательно читаем инструкцию и выполняем шаги для добавления `brew` в `$PATH`
- `./brew-install.sh` установит 
    - `yq` - yaml query
    - `jq` - json query
    - `tree` - файловое дерево
    - `fzf` - fuzzy finder. после `./source-zshrc.sh` будет работать по Ctrl + R 
    - `lf` - list files после `./link-lfrc.sh` будут работать `q` и `Enter`

### Устанавливаем `oh-my-zsh` и плагины

- https://ohmyz.sh
- `./omz-plugins.sh`
- перезапускаем терминал

### `.zshrc`

- Удаляем всё из файла `~/.zshrc` (`echo "" > ~/.zshrc`)
- Запускаем `./source-zshrc.sh`

### lf

`./link-lfrc.sh`


