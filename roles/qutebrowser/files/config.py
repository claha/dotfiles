"""Qutebrowser config.

Documentation:
    qute://help/configuring.html
    qute://help/settings.html
"""
c = c  # noqa: F821
config = config  # noqa: F821

# Always restore open sites when qutebrowser is reopened.
c.auto_save.session = True

# Background color for webpages if unset (or empty to use the theme's
# color).
c.colors.webpage.bg = "black"

# Render all web contents using a dark theme.
c.colors.webpage.darkmode.enabled = True

# Which images to apply dark mode to.
c.colors.webpage.darkmode.policy.images = "never"

# Require a confirmation before quitting the application.
c.confirm_quit = ["downloads"]

# Automatically start playing `<video>` elements.
c.content.autoplay = False

# Editor (and arguments) to use for the `edit-*` commands.
c.editor.command = [
    "emacsclient",
    "--alternate-editor=emacs",
    "+{line}:{column}",
    "{file}",
]

# Make characters in hint strings uppercase.
c.hints.uppercase = True

# Automatically enter insert mode if an editable element is focused
# after loading the page.
c.input.insert_mode.auto_load = True

# When/how to show the scrollbar.
c.scrolling.bar = "never"

# Enable smooth scrolling for web pages.
c.scrolling.smooth = True

# How to behave when the last tab is closed.
c.tabs.last_close = "default-page"

# When to show the tab bar.
c.tabs.show = "never"

# Page to open if :open -t/-b/-w is used without URL.
c.url.default_page = "https://start.duckduckgo.com/"

# Search engines which can be used via the address bar.
c.url.searchengines = {"DEFAULT": "https://duckduckgo.com/?q={}"}

# Page(s) to open at the start.
c.url.start_pages = ["https://start.duckduckgo.com"]

# Do not load the autoconfig file
config.load_autoconfig(False)
