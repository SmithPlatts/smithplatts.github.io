---
title: Method Load Order for a .NET Outlook Addin
imported: Stuff the Box
imported-from: https://stuffthebox.wordpress.com/2014/03/01/method-load-order-for-an-outlook-addin/
excerpt: >
    <p>I have been creating a .NET Outlook addin lately and it has been an incredible learning journey. I have had to support 3 generations of Outlook, using the base bottom COM feature/API set (oldest supported; 2007), and have still had to stay within the speed requirements of the latest supported (2013) :-/</p>
    <p>One thing that perplexed me was how I could hook in, early enough, to the addin load/startup process to subscribe to the <code>AppDomain.UnHandledException</code> and <code>Application.ThreadException</code> event handlers so that I can log exceptions. This is desired because Outlook is so damned efficient that it decides to kill an addin as soon as it exhibits signs of <em>exception</em>al behaviour.</p>
---

I have been creating a .NET Outlook addin lately[^WLB] and it has been an incredible learning journey. I have had to support 3 generations of Outlook, using the base bottom COM feature/API set (oldest supported; 2007), and have still had to stay within the speed requirements of the latest supported (2013) :-/

One thing that perplexed me was how I could hook in, early enough, to the addin load/startup process to subscribe to the `AppDomain.UnHandledException` and `Application.ThreadException` event handlers so that I can log exceptions. This is desired because Outlook is so damned efficient that it decides to kill an addin as soon as it exhibits signs of *exception*al behaviour.

### The Hunt

So, after looking around, I found nothing! I could not find a single site that outlined how the base method invocations are called and in what order :-(

Never fear, however, because I have `Debug.WriteLine()` and an ***Output*** window! <br />
So, this is the method invocation of my addin[^CSharp][^Classes]:

0. `AddInName(factory, serviceProvidor)` - your addin's primary constructor
0. `Initialize()`
0. `InitializeCachedData()`
0. `InitializeControls()`
0. `InitializeComponents()`
0. `InitializeData()`
0. `InitializeDataBindings()`
0. `BeginInitialization()`
0. `BindToData()`
0. `EndInitialization()`
0. `FinishInitialization()`
0. `OnStartup()`

When I see it laid out like this, it's kinda logical haha <br />
There were other methods in the base class, but at addin load/startup they were not called; so I did not investigate further as this served my purpose[^Know-More].

### The Hunt's Rewards

So after all that, it turns out that all I have is some trophies to hang on the wall[^Trophies] instead of a nice dinner for the family[^Dinner].

What I have discovered is that the best practices for VSTO addin's is to use ***lots*** of `try { } catch { }` blocks around all executed code :-/

It is still accepted to add the desired `UnHandledException` (and `ThreadException`[^Exception-Namespace]) catch/es, but you shouldn't rely on them alone. What I have done is create an `internal static void UnHandledException(...)` method that can be called from anywhere and log the details. It does a `throw` at the end so that the addin gets disabled by Outlook, as it should.

All this just to get logging so that I could identify what was causing an exception on that damn unsupported OS ... which turned out to be in vain! I forgot that I had updated the addin to .NET 4.5 for a new feature of which I had created and added, but the unsupported OS that was having the exception only supports up to .NET 4. Yes, I am that daft! haha

Alas, the journey and experience was worth it; I hope you may gain some benefit from my playing :-D

Happy coding!

*[kill]: disable

---

[^WLB]: Mainly for fun, and in my own time ... however it does have a work purpose ;-P
[^CSharp]: As you may have noticed, I am a C# developer. I can, and do (because I have to), develop in VB.NET, but C# is my playground and I love it!
[^Classes]: These method names appear in `AddInName.Designer.cs` within the base `AddInName` class; although there are other classes in that file, they did not appear to load on startup for my addin. Your mileage may vary.
[^Know-More]: If you do more investigation, I would love to hear about your results!
[^Trophies]: A list on a blog of what runs and in what order :/
[^Dinner]: An identified entry point for an `AppDomain.UnHandledException` and/or an `Application.ThreadException`
[^Exception-Namespace]: You will need to specify the full namespace path to `System.Windows.Forms.Application` as the default `Application` reference will resolve to `Microsoft.Office.Interop.Outlook` which doesn't have a `ThreadException` event to subscribe to.
