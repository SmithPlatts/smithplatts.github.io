---
layout: page
is-child: true
title: Developer Resource
page-title: Assembly.PromotNTA - Promote a Notification Tray Application [Developer Resource]
permalink: /cli-tools/promotenta/devresource/
---

[Click here to download](/assets/releases/promotenta/Assembly.PromoteNTA.zip "Download Assembly.PromoteNTA") the `Assembly.PromoteNTA.DLL` assembly library for developers.

## So what can I do with it?

- Retrieve the current state of the application
  - Search for application with or without case sensitivity
- Set the promotion state of an application
  - Search for application with or without case sensitivity
  - Specify the promotion state to set

If, when setting a promotion state, you do not specify which state to set, the default is to configure to always show (`PS_Show`).

To help with ensuring the appropriate settings are used, an `Int32` based enumeration has been configured called `PromoteState` which includes:

- `PS_NotFoundorError`, -1
- `PS_NotifyOnly`, 0
- `PS_Hidden`, 1
- `PS_Show`, 2

These values allow for easy configuration and recognition to ensure that the right settings and returns are achieved.

## How do I use it in my project?

***N.B.** these instructions are for Visual Studio as that is my IDE*

- [Download the ZIP](/assets/releases/promotenta/Assembly.PromoteNTA.zip "Download Assembly.PromoteNTA") and expand the `.DLL` and `.XML` to the same directory, preferably somewhere in/near the project directory
- In ***Visual Studio***, navigate to **References** in the **Solution Explorer** and right click
  - Select **Add Reference...**
- Click the **Browse** tab and navigate to the location that you saved the `.DLL` and `.XML` to and highlight the `.DLL` file
  - Click **OK** once the `.DLL` is highlighted
- The reference will be loaded and the namespace can be added and used
  - The `.XML` needs to be in the same location as the referenced `.DLL` as this contains the summaries and method instructions
  - ***N.B.** due to the naming convention, if you are using the `Assembly` namespace for anything, you will have to reference those methods, et cetera, with the full namespace path. Sorry about this, but I liked the name and VS projects are difficult to rename once named ... especially if it's committed to a VCS ...*

When you build/compile, the `.DLL` should be copied to the output directory by ***Visual Studio*** for you.

## Attribution?

This developer resource is ©2013 Adam Smith-Platts, and as such I would greatly appreciate a mention in your application with a link to this page when used; this is not required however. Just please do not sell or receive donation.

Sharing and use in any environment completely allowed and encouraged :)

Enjoy!
