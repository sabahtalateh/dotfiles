# dotfiles

## Stage Manager

<img src="./images/stage-manager.png" width="400"/>

## System Settings

Полный обзор настроек `macOS` можно посмотреть тут https://youtu.be/d6qnXA5tDog?si=HSYtua3z8IZ6CE5c

### Acessibility

<img src="./images/accessibility.png" width="700"/>

### Control Center

<img src="./images/control-center.png" width="700"/>

После включения `Hearing` в `Control Center` можно будет включать прикольные фоновые звуки

<img src="./images/stage-manager-2.png" width="400"/>

### Desktop & Dock

<img src="./images/desktop-dock.png" width="700"/>

#### Shortcuts

<img src="./images/shortcuts.png" width="700"/>

#### Hot corners

<img src="./images/hotcorners.png" width="700"/>

### Spotlight

<img src="./images/spotlight-settings.png" width="700"/>

### Touch ID & Password

<img src="./images/touchid.png" width="700"/>

### Keyboard

<img src="./images/keyboard-settings.png" width="700"/>

Затем идём в `Keyboard Shortcuts...`

#### Launchpad & Dock

<img src="./images/launchpad-dock.png" width="700"/>

#### Display

<img src="./images/display.png" width="700"/>

#### Mission Control

<img src="./images/mission-control.png" width="700"/>

#### Keyboard

<img src="./images/keyboard.png" width="700"/>

#### Input Sources

<img src="./images/input-sources.png" width="700"/>

#### Screenshots

<img src="./images/screenshots.png" width="700"/>

#### Spotlight

<img src="./images/spotlight.png" width="700"/>

#### Accessibility

<img src="./images/accessibility-shortcuts.png" width="700"/>

#### Function Keys

<img src="./images/function-keys.png" width="700"/>

#### Modifier Keys

<img src="./images/modifier-keys.png" width="700"/>


### Trackpad

#### Point & Click

<img src="./images/trackpad-point-click.png" width="700"/>

#### Scroll & Zoom

<img src="./images/trackpad-scroll-zoom.png" width="700"/>

#### More Gestures

<img src="./images/trackpad-more-gestures.png" width="700"/>

## Finder

### General

<img src="./images/finder-general.png" width="400"/>

### Sidebar

<img src="./images/finder-sidebar.png" width="400"/>

### Advanced

<img src="./images/finder-advanced.png" width="400"/>

### Toolbar

Нажать правой кнопкой в верхней части окна `Finder` и выбрать `Customise Toolbar...`

Затем перетащить в верхнюю часть окна значки, чтобы получилось как на картинке

<img src="./images/finder-toolbar.png" width="700"/>


## Клонирование репозитрия. Ssh & Git

Открываем терминал

### Генерируем `ssh`-ключ для `github`

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key

Генерируем ключ

```
ssh-keygen -t ed25519 -C "sabahtalateh@gmail.com"
```

Запустим `ssh`-агент

```
eval "$(ssh-agent -s)"
```

Создадим конфигурационный файл (если его нет)

```
touch ~/.ssh/config
```

В `~/.ssh/config` добавим блок

```
Host github.com
  AddKeysToAgent yes
  UseKeychain yes 		# Если ключ без пароля, эту строку на добавляем
  IdentityFile ~/.ssh/id_ed25519
```

```
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

### Добавляем ключ в на `github`

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

Копируем ключ из `~/.ssh/id_ed25519.pub`

На github.com идём в и вставляем ключ (название пишем любое)

```
Settings -> SSH and GPG keys -> New SSH key
```

<img src="./images/github-key.png" width="700"/>


### Клонируем этот репозиторий

Переходим в домашнюю директорию пользователя

```
cd ~
```

Клонируем репозиторий в директорию `${HOME}/.dotfiles`. Клонировать нужно по этому пути, на это расчитаны скрипты репозитория

```
git clone git@github.com:sabahtalateh/dotfiles.git .dotfiles
```

Если система только что установлена будет предложено установить иснутрменты разработчика

<img src="./images/devtools.png" width="500"/>

Если это произошло, установим инструменты и выполним команду выше ещё раз


## Настроаиваем терминал

Импортируем профиль из `~/.dotfiles/terminal/Man Page Custom.terminal`

<img src="./images/terminal-import.png" width="700"/>

Делаем этот профиль профилем по умолчанию и перезапускаем терминал

<img src="./images/terminal-default-profile.png" width="700"/>


## Karabiner

https://karabiner-elements.pqrs.org

Инструмент для настройки кастомных сочетаний клавиш, например `Cmd+h/j/k/l` можно назначить на стрелки. Навигация будет более удобная


### Меняем `Esc` на `Caps` и наоборот

<img src="./images/karabiner-caps.png" width="700"/>
<img src="./images/karabiner-esc.png" width="700"/>


### Меняем значок параграфа (кнопка под `Esc`) на тильду

Это кнопка располагается под `Esc` на неамериканских клавиатурах. Для американских клавиатур этого делать не надо

<img src="./images/karabiner-nonusbackslash.png" width="700"/>
<img src="./images/karabiner-tilde.png" width="700"/>


### Полный конфиг простых замен

<img src="./images/karabiner-config.png" width="700"/>


### Сложные замены

Добавляем через `Add your own rule` все замены из папки [karabiner](./karabiner) кроме `simple.json` (этот файл лежит там на всякий случай)

<img src="./images/karabiner-own-rule.png" width="700"/>
<img src="./images/karabiner-own-rule-2.png" width="700"/>


## Hidden Bar

https://apps.apple.com/ru/app/hidden-bar/id1452453066

Прячет элементы меню когда их много


## Monitor Control

https://apps.apple.com/ru/app/monitorcontrol-lite/id1595464182

Управление яркостью внешнего монитора кнопками `f1` и `f2`


## PastePal

https://apps.apple.com/ru/app/clipboard-manager-pastepal/id1503446680

Клипборд с историей


## Buho Cleaner

https://www.drbuho.com/buhocleaner/download

В бесплатной версии можно проанализировать используемое место на диске и руками удалить большие папки


## Keyboard Clean Tool

https://folivora.ai/keyboardcleantool


## Unsplash

https://apps.apple.com/ru/app/unsplash-wallpapers/id1284863847

Кросивые обои
