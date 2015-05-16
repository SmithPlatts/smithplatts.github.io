---
layout: page
is-child: true
children: false
title: Change Log
page-title: Coffee Buzz - Change Log
permalink: /coffeebuzz/changelog/
---

*Download the latest version [here](/assets/releases/CoffeeBuzz.zip)*

## 1.2.1 - Bug fix (1 May 2014)

***Changes/Fixes:***

- Fixed bug in multi-instance execution with multiple logged-on users

## 1.2.0 - Release of version 1.2 (25 April 2014)

***Changes/Fixes:***

- Changed the behaviour when someone tries to run the executable when an instance is already running
  - Previously the behaviour was to just exit; now, when a user runs the second copy, it will invoke the currently running instance to Buzz!
- Fixed bug in _menu aware_ click-behaviour which caused inconsistent results across different Operating System versions

## 1.1.85 - Release of version 1.1 (10 January 2014)

***Features:***

- Added the ability to disable balloon tips
- Added menu header to easily identify current version
- Added *menu aware* click-behaviour of the *Notification Tray* left-click so that when the menu is open and the icon clicked the menu is closed
- Added error log saving and notification for easier support in the rare case of issue

***Changes/Fixes:***

- Rearranged menu item placement for the addition of the header and moved the *About* menu item to above *Quit*
- Altered left-click behaviour when clicking the *Notification Tray* icon to allow for double click before presenting the menu; right-click behaviour unchanged

## 1.0.290 - Release of version 1.0 (14 July 2013)

***Features:***

- Stops screensaver or sleep mode from activating
- Double-click icon in *Notification Tray* to either activate or deactivate **Coffee Buzz**
- If you lock the computer, **Coffee Buzz** will deactivate; preserving your precious computer display life
- Predefined temporary time limits to keep computer awake for; 10, 20, 30 or 60 minutes
- Command line options for advanced users
- Automatic execution on logon
- Supports Windows XP, Windows 7 and Windows 8.*x*
