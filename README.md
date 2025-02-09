# dotfiles

## TODO:
- Использовать realpath для vscode config-а
- Karabiner
- Raycast
- use links whe possible
- brew (https://brew.sh)
- ghostty + config
- zsh + ohmyzsh
- fzf
- lf + config from .zshrc
- Подумать как можно использовать `Esc` в кейбиндах, а то чо он никак нигде не используется
- Записать ролик

https://github.com/sabahtalateh/init-system

## Оглавление
- [Порядок настройки](#порядок-настройки)
- [Настройки системы](#настройки-системы)
- [Что надо установить и настроить руками](#что-надо-установить-и-настроить-руками)
    - [Stage Manager](#stage-manager)
    - [Desktop & Dock](#desktop--dock)
    - [Keyboard shortcuts](#keyboard-shortcuts)
        - [Launchpad & Dock](#launchpad--dock)
        - [Mission Control](#mission-control)
        - [Keyboard](#keyboard)
        - [Input Sources](#input-sources)
        - [Screenshots](#screenshots)
        - [Spotlight](#spotlight)
        - [Function Keys](#function-keys)
        - [Modifier Keys](#modifier-keys)

## Порядок настройки

1. Сначала [настраиваем систему](#настройки-системы)
2. Потом ставим и настраиваем руками всё [что надо установить и настроить руками](#что-надо-установить-и-настроить-руками)

## Настройки Системы

### Stage Manager

Включаем в `Control Center` в верхнем меню

<img src="./images/stage-manager.png" width="300"/>


### Desktop & Dock

Тут просто выставляем всё как на картинках, настроек много, поэтому картинок 3

<img src="./images/desktop-and-dock-1.png" width="600"/>
<img src="./images/desktop-and-dock-2.png" width="600"/>
<img src="./images/desktop-and-dock-3.png" width="600"/>


### Keyboard Shortcuts

```
System Settings -> Keyboard -> Keyboard Shortcuts
```


#### Launchpad & Dock

Тут пофигу что настроено, но на всякий случай вот картинка

<img src="./images/launchpad-and-dock.png" width="600"/>


#### Mission Control

Тут нас интерисует только `Show Desktop`, эта команда убирает все окна и показывает рабочий стол

<img src="./images/mission-control.png" width="600"/>


#### Keyboard

Тут нас интерисует только `Move focus to next window`, эта команда переключает окна внутри группы в режиме `Stage Manager`. Это есть мой основной способ работы

<img src="./images/keyboard.png" width="600"/>


#### Input Sources

Тут настраиваем `Select the previous input source` для переключения языка

<img src="./images/input-sources.png" width="600"/>


#### Screenshots

Тут ничего не менял, вроде по дефолту вот так нормально. Основная комбинация это `Shift+Cmd+5` но можно написать `screenshot` в `Raycast`-е и не запоминать такие длинные комбинации

<img src="./images/screenshots.png" width="600"/>


#### Spotlight

Отключаем `Show Spotlight search`, вместо него будет использоваться [Raycast](#raycast)

<img src="./images/spotlight.png" width="600"/>


#### Function Keys

Тут по дефолту вроде так

<img src="./images/function-keys.png" width="600"/>


#### Modifier Keys

И тут по дефолту вроде так

<img src="./images/modifier-keys.png" width="600"/>


## Что надо установить и настроить руками

### Raycast

https://www.raycast.com

Замена `Spotlight`

После установки нужно отключить хоткей для `Spotlight` в `System Settings -> Keyboard -> Keyboard Shortcuts -> Spotlight` и поставить этот хоткей на `Raycast`

<img src="./images/disable-spotlight-hotkey.png" width="600"/>
<img src="./images/raycast-hotkey.png" width="600"/>


### Karabiner

https://karabiner-elements.pqrs.org

Инструмент для настройки кастомных сочетаний клавиш, например `Cmd+h/j/k/l` можно назначить на стрелки. Навигация будет более удобная

#### Меняем `Esc` на `Caps` и наоборот

<img src="./images/karabiner-caps.png" width="600"/>
<img src="./images/karabiner-esc.png" width="600"/>

#### Меняем значок параграфа (кнопка под `Esc`) на тильду

Это кнопка располагается под `Esc` на неамериканских клавиатурах. Для американских клавиатур этого делать не надо

<img src="./images/karabiner-nonusbackslash.png" width="600"/>
<img src="./images/karabiner-tilde.png" width="600"/>

#### Полный конфиг простых замен

<img src="./images/karabiner-config.png" width="600"/>

#### Сложные замены

Добавляем через `Add your own rule` все замены из папки [karabiner](./karabiner) кроме `simple.json` (этот файл лежит там на всякий случай)

<img src="./images/karabiner-own-rule.png" width="600"/>
<img src="./images/karabiner-own-rule-2.png" width="600"/>


### Unsplash

https://apps.apple.com/ru/app/unsplash-wallpapers/id1284863847?l=en-GB&mt=12

Кросивые обои


### PastePal

https://apps.apple.com/ru/app/clipboard-manager-pastepal/id1503446680?l=en-GB

Клипборд с историей


### Hidden Bar

https://apps.apple.com/ru/app/hidden-bar/id1452453066?l=en-GB&mt=12

Прячет элементы меню когда их много


### Buho Cleaner

https://www.drbuho.com/buhocleaner/download

В бесплатной версии можно проанализировать используемое место на диске и руками удалить большие папки


### Monitor Control

https://apps.apple.com/ru/app/monitorcontrol-lite/id1595464182?l=en-GB&mt=12

Управление яркостью внешнего монитора кнопками `f1` и `f2`


### Keyboard Clean Tool

https://folivora.ai/keyboardcleantool

### Ghostty

https://ghostty.org

Терминал


### Brew

https://brew.sh

Пакетный менеджер



