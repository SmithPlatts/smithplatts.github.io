---
layout: page
is-child: true
has-children: true
title: PromoteNTA
page-title: PromoteNTA - Promote a Notification Tray Application
permalink: /cli-tools/promotenta/
---

*[Windows™]: Windows™ XP, Windows™ Vista, Windows™ 7, Windows™ 8.x

<div class="showcase center no-border">
    <img alt="PromoteNTA-Logo" src="/assets/images/promotenta/promotenta.png" width="150" /><br />
    PromoteNTA is little command line utility that can be used to "promote" a Notification Tray application state.
</div>

## Um ... what?

<div class="showcase">
    <img alt="NTray" src="/assets/images/promotenta/promotenta_01.jpg" height="48" />
</div>

If you have the Windows™ (XP/7/8) Notification Tray (the one in the bottom right corner) configured with default settings, it will hide any application that isn't active; i.e. telling (notifying) you about something. There are two other states an application can be promoted to, *always hide* or *always show*. Windows doesn't provide a way to programatically "promote" the state of an application tray but instead only allows a user to set this using the User Interface.

PromoteNTA is a way for software developers or system admins to centrally promote an application state for any/all user/s.

## Cool, how do I use it?

It's a command line utility that can be used in scripts, SCCM packages, *et cetera*. It has been designed to never halt or pause, so it is safe in silent deployments.

It requires being executed by the user that you want the setting to apply to, so it needs to be assigned to users, used in a logon script, or any way you have to allow utilities to run for users without them needing to actually do something. Unless the registry hive `HKEY_CURRENT_USER` is protected for some reason, it will run without the need for admin rights/UAC.

To use it, you just need to specify the appropriate command line options:

<div class="showcase center">
    <a href="/assets/images/promotenta/promotenta_02.jpg"><img alt="PromoteNTA_Help" src="/assets/images/promotenta/promotenta_02.jpg" width="550" height="244" /></a>
</div>

- **ApplicationName** <br />
  The name of the application you want to promote. This can be either the full name or partial; however, to avoid incorrect search, it is best to use the full name
- **-CS** <br />
  When this command line option is used, the search for the ***ApplicationName*** is perfomed with case sensitivity
- **-RE** <br />
  Restarts explorer.exe to force the change to apply instantly; if not specified the change will not apply till next logoff/logon
- **-Set *[x]*** <br />
  The promotion state to set. Appropriate values are 0 - 2, where:
  - *0 = hide inactive*
  - *1 = always hide*
  - *2 = always show*
- **-?** <br />
  Show the syntax help

**Example:** <br />
`> PromoteNTA.exe DropBox.exe -RE -Set 2`

***N.B.** the application that you want to promote needs to have been executed at least once for the user that PromoteNTA is running for else the search will return and **NotFound** error code.*

## I'm developing an application that has a Notification Tray icon, do I just call this in the app or is there an assembly/library I can use?

You can use the DLL file that is included with PromoteNTA.exe, however I have created a [DLL library for other developers](./devresource/ "Assembly.PromotNTA – Promote a Notification Tray Application [Developer Resource]") to use which includes proper summaries and instructions on it's use.

## What computer system is it designed for?

PromoteNTA is a utility for Microsoft Windows. It has been tested and designed for Windows XP (all versions), Windows 7 (all versions) and Windows 8.

## What if I have a problem with it or have a suggestion?

Just drop me a line! I cannot guarantee that I will respond straight away, as this is a hobby and I have a very busy work and home life, but I will respond. I am proud of what I create and I want it to work for you.

## Free?

Ayup! Go nuts and use and share in any environment. <br />
It's ©2013 Adam Smith-Platts, so please do not sell or receive donation.

## Pure awesomesauce! Where do I get it?!

[Click here to download the program](/assets/releases/promotenta/PromoteNTA.zip "Download PromoteNTA"). It will download as a zip file, which you then extract the `.EXE` and `.DLL` to any folder (so long as they are together!), open a command prompt window and have at it!

It will run from USB drive, external HDD, network location, *et cetera*

Enjoy!
