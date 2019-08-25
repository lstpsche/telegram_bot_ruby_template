# Telegram Bot Template on Plain Ol' Ruby

Groups are **not supported**!

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

## Methods

All methods can be simply overriden by .........

### Common commands

Common commands are those like `/start` or `/help`.

Below are default behavior of those methods.

#### Start

Method `Handlers::Common::Base#start` does next:
1. Checks if User is already registered (finds in database by his telegram_id).
2.1. If User is registered -- returns `false`.
2.2. If User is <em>not</em> registered -- launches registration dialog.

As you could notice, default `start` behaviour **requires model User to exist**.

#### Help

Method `Handlers::Common::Base#help` sends a help-message to chat, where `/help` was called.
Message contains all described common commands (generates basing on methods described in `Handlers::Common`) + additional info from `additional_help` variable.
