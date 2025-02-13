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

Меняем профиль терминала
- Импортируем файл `~/.dotfiles/terminal/Man Page Custom.terminal`
- `Terminal -> Settings`
- `On startup, open -> Man Page Custom`
- Перезапускаем терминал

