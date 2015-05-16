---
layout: page
has-children: true
title: CLi Tools
permalink: /cli-tools/
---

*[-?]: You can specify -? anywhere in the command line and the help text will be displayed

Listed here are some command line utilities/tools that I have developed for different purposes:

- [EnumInstalledApp](#EnumInstalledApp)
- [PromoteNTA](#PromoteNTA)

All items for download here are free and ©Adam Smith-Platts; but you are more than welcome to use and distribute as you like.

You may not, however, sell or receive donation in any way shape or form.

<a name="EnumInstalledApp"></a>

---

### EnumInstalledApp

***Query the Registry Uninstall Key***

[Download](/assets/releases/EnumInstalledApp.zip) <br />
©2013 Adam Smith-Platts

EnumInstalledApp queries the `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall` registry key for a particular keyword or full name as passed on the command line. It’s scope, by default, is to find registry sub keys whose `DisplayName` value contains the passed keyword/s. It will list each match by sub key name, `DisplayName` and `DisplayVersion`.

Search control and refinement was given quite some thought; in a nutshell you can:

- Search for multiple keyword/s or full names (with spaces!)
- Perform a case sensitive search to narrow results
- Alter the search scope:
  - Find matches that contain keyword/s
  - Find matches that are exact
  - Find matches that start with keyword/s
- On a 64-bit machine, include the 32-bit registry within search or search 32-bit only
- Query a remote host over the network

All of EnumInstalledApp’s CLi usage options and explanations can be accessed by either running EnumInstalledApp.exe from within a command prompt or by using the *-?* argument.

**Requirements**

EnumInstalledApp has been built for Microsoft Windows. It has been designed for and tested against Windows XP (all versions), Windows 7 (all versions) and Windows 8.*x*.

The .NET framework version 4 is required to be able to run EnumInstalledApp. Windows 8.*x* already includes a newer version of the .NET framework, but if you are intending to run this tool on any other edition of Windows you will first need to install the .NET 4 framework which can be [found here](http://www.microsoft.com/en-us/download/details.aspx?id=17851 "Microsoft .NET Framework 4 (Web Installer").

**Example/s**

<div class="showcase">
    <a href="/assets/images/enuminstalledapp/enuminstalledapp_example.jpg"><img src="/assets/images/enuminstalledapp/enuminstalledapp_example.jpg" alt="EnumInstalledApp in Action!" width="150" /></a>
</div>

<a name="PromoteNTA"></a>

---

### PromoteNTA

***Promote a Notification Tray application***

PromoteNTA is little command line utility that can be used to “promote” a Notification Tray application state. <br />
It is special, and has extra resources for developers, so for more information check out its [page here](./promotenta/).
