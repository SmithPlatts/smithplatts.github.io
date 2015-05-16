---
title: Desktop UI Testing with LINQPad
post-title: Desktop UI Testing Without Running the Build? No Way?!
imported: Stuff the Box
imported-from: https://stuffthebox.wordpress.com/2014/02/22/desktop-ui-testing-without-running-the-build-no-way/
excerpt: <p> So, it turns out that you can test WinFroms (and WPF) UI controls from within LINQPad! </p>
---

  > This is a post that I originally wrote on the Microsoft Development Team's **Brain Dump** blog at work the other day, and thought I'd share it with my non-work viewers too

---

So, it turns out that you can test WinFroms (and WPF) UI controls from within [LINQPad](http://linqpad.net)![^Discovery]

First save and build your project so that you have an/the assembly (`*.exe`, `*.dll`). Once you have a build, fire up LINQPad and right click on the query tab and select ***Advanced Properties***. On the *Additional References* tab select ***Add*** and then ***Browse***. Find the assembly that you did a build of and click ***OK***; add any other necessary assemblies, i.e. `System.PresentationFramework.dll`, `System.Windows.Forms.dll`, `System.Xaml.dll`, <em>etc</em>. Once you have all of your assemblies added, switch to the *Additional Namespace Imports* tab and click ***Pick from assemblies*** and select the appropriate namespaces from all the assemblies that you need; this is what will give you **IntelliSense**.

Once you have done the above, you can close the ***Advanced Properties*** window and change the *Language* to ***C# Program*** (or ***VB Program*** ... if you like pain ;P). Now you can create a new instance[^CStor-Note] of your WinForms/WPF window and test[^Taskbar-Note] out the UI without executing your app! You could even use LINQPad as a way of doing some Unit Tests or some such if you were really inclined ...

Happy testing and debugging!

---

[^Discovery]: I stumbled across [this post](http://www.csharpbydesign.com/2009/07/linqbugging---using-linqpad-for-winforms-testing.html) by Matthew MacSuga which describes this awesome feature; I have however documented my method of testing WinForms UI and confirming WPF support
[^CStor-Note]: Beware class/constructor access; if you have your class, constructor/s or other methods set to internal instead of public, you will not be able to create a new instance of your UI :(
[^Taskbar-Note]: Make sure that you set `.ShowInTaskbar = true` to ensure that you have a hook to kill the window if something goes wrong; especially if you are using `.ShowDialog()` to display it
