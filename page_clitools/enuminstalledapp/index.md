---
layout: page
is-child: true
title: EnumInstalledApp
page-title: EnumInstalledApp - Query the Registry Uninstall Key
permalink: /cli-tools/enuminstalledapp/
---

*[CLi]: Command-Line Interface / Command Language Interpreter

Ever wanted to quickly find out what application is listed in the registry's Uninstall key? Wanted to know what sub-key name it has and what version is recorded?

EnumInstalledApp is the CLi utility for you!

## Really? What can it do?

EnumInstalledApp queries the `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall` registry key for a particular keyword or full name as passed on the command line. It's scope, by default, is to find registry sub keys whose `DisplayName` value contains the passed keyword/s. It will list each match by sub key name, `DisplayName` and `DisplayVersion`:

<div class="showcase center">
    <a class="fancybox" href="/assets/images/enuminstalledapp/enuminstalledapp_example.jpg" title="EnumInstalledApp in Action!">
        <img src="/assets/images/enuminstalledapp/enuminstalledapp_example.jpg" alt="EnumInstalledApp in Action!" width="580" height="379" />
    </a><br />
    EnumInstalledApp in Action!
</div>

## Nice! How much control do I have over the search?

Quite a bit! In a nutshell:

- Search for multiple keyword/s or full names (with spaces!)
- Perform a case sensitive search to narrow results
- Alter the search scope:
  - Find matches that *contain* keyword/s
  - Find matches that are *exact*
  - Find matches that *start with* keyword/s
- On a 64-bit machine, include the 32-bit registry within search or search 32-bit only
- Query a remote host over the network

All of EnumInstalledApp's CLi usage options and explanations can be accessed by either running *EnumInstalledApp.exe* from within a command prompt or by using the *-?* argument [^help] [^arg-prefix]

## What computer system is it designed for?

EnumInstalledApp has been built for Microsoft Windows. It has been designed for and tested against Windows XP (all versions), Windows 7 (all versions) and Windows 8.*x*.

The .NET framework version 4 is required to be able to run EnumInstalledApp. Windows 8.*x* already includes a newer version of the .NET framework, but if you are intending to run this tool on any other edition of Windows you will first need to install the .NET 4 framework which can be [found here](http://www.microsoft.com/en-us/download/details.aspx?id=17851 "Microsoft .NET Framework 4 (Web Installer)").

## Free?

You betcha! It's ©2013 Adam Smith-Platts; but you are free to use and distribute as you like.<br />
However, you may not sell or receive donation in any way shape or form.

## Awesome! Where can I get it?

[Right here!](/assets/releases/EnumInstalledApp.zip "Get me some EnumInstalledApp!") Unzip and run from any location :D

---

[^help]: You can specify -? anywhere in the command line and the help text will be displayed
[^arg-prefix]: EnumInstalledApp isn't picky about CLi argument prefix'; you can use */*, *-* or even use nothing and it'll happily work away
