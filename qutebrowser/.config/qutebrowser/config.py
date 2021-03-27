"""Qutebrowser config.

Documentation:
    qute://help/configuring.html
    qute://help/settings.html
"""

# Always restore open sites when qutebrowser is reopened.
c.auto_save.session = True

# Require a confirmation before quitting the application.
c.confirm_quit = ["downloads"]

# Automatically start playing `<video>` elements.
c.content.autoplay = False

# Editor (and arguments) to use for the `edit-*` commands.
c.editor.command = [
    "emacsclient",
    "--create-frame",
    "--alternate-editor=emacs",
    "+{line}:{column}",
    "{file}",
]

# Automatically enter insert mode if an editable element is focused
# after loading the page.
c.input.insert_mode.auto_load = True

# When/how to show the scrollbar.
c.scrolling.bar = "never"

# Enable smooth scrolling for web pages.
c.scrolling.smooth = True

# How to behave when the last tab is closed.
c.tabs.last_close = "close"

# Position of the tab bar.
c.tabs.position = "top"

# When to show the tab bar.
c.tabs.show = "multiple"

# Page to open if :open -t/-b/-w is used without URL.
c.url.default_page = "https://start.duckduckgo.com/"

# Search engines which can be used via the address bar.
c.url.searchengines = {"DEFAULT": "https://duckduckgo.com/?q={}"}

# Page(s) to open at the start.
c.url.start_pages = ["https://start.duckduckgo.com"]

# Do not load the autoconfig file
config.load_autoconfig(False)
