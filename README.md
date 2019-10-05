# Telegram Bot Template on Plain Ol' Ruby

## Notes

1) Group chats are **not supported**!
2) `return_to` is almost deprecated

## Setup

### Start postgresql server

1. start postgresql server:
``` bash
service postgresql start
```
2. enter your account password in <em>pop-up window</em>.

**OR**

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

# Dictionary

## Naming

| Phrase             | Description |
| -----------------: | :----------------------------------------------------------------- |
| **Common command** | Text commands. The ones, that are writen with a foregoing slash |
| **Main Menu**      | Bot's main menu. Usually consists of your features and Preferences |
| **Option**         | Clickable callback-buttons at each menu |
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
