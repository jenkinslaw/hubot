hubot
=====

A bot that uses the GitHub OctoKit client to automate some of our deployment tasks that require interacting with GitHub.

Install:
--------
1. Pull the code in locally.
1. `cd hubot`
1. `sudo rake install` (Adds  symlink to the hubot command in the /usr/bin folder.)


Synopsis:
---------
* `hubot --help` -- Show this synopsis.
* `hubot` -- Run self tests using casperjs.
* `hubot [<command>]` -- The basic signature for the hubot command.

Commands:
---------
* `notify` -- Sends out a notification email.
* `mail` -- Print notification email to stdout.
