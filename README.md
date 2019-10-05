# Telegram Bot Template on Plain Ol' Ruby

## Notes

1) Group chats are **not supported**!
2) `return_to` is almost deprecated

## Setup

### Start postgresql server

1. start postgresql server with <em>sudo</em>:
``` bash
sudo service postgresql start
```
2. enter your account password in <em>terminal prompt</em>.

## Rake tasks

You can run rake tasks. Notice `noglob` word before `rake`.

#### Show all tasks
``` bash
noglob rake --tasks
```

# Development

To view all places, where you should place your new code, search by files texts a code word: **TEMPLATE_TODO**

# Architecture

## Text commands

1) `message.text` ----> `Routers::Messages::TextCommandsRouter`
2) ----> `Handlers::TextCommands::YourHandlerHere`
3) ----> Does, what it should do, when given command is typed

## Calbacks buttons

1) `message.data` goes to `Routers::Messages::CallbacksRouter`
2) ----> `Handlers::Callbacks::YourHandlerHere`
3) a) callback is from Main Menu: ----> Shows tapped menu \
   b) callback is from Feature: ----> `Routers::Features::YourFeatureRouter`
4) <em>only from 3b</em>: ----> Shows tapped menu

# Dictionary

## Naming

| Phrase             | Description |
| -----------------: | :----------------------------------------------------------------- |
| **Common command** | Text commands. The ones, that are writen with a foregoing slash |
| **Main Menu**      | Bot's main menu. Usually consists of your features and Preferences |
| **Option**         | Clickable callback-buttons at each menu |
| **User Options**   | Same as preferences |
| **Preferences**    | User's preferences |

## Common commands

There're default behaviors of those methods below.

### Start

Method `Handlers::Common::Base#start` does next:
1. Checks if User is already registered (finds in database by his telegram_id).
2.1. If User is registered -- shows Main Menu.
2.2. If User is <em>not</em> registered -- launches registration dialog.

As you could notice, default `start` behaviour **requires model User to exist**.

### Help

Sends a help-message to chat, where `/help` was called. \
Message contains all described common commands.
