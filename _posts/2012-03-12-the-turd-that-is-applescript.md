---
title: The Turd that is AppleScript
imported: Stuff the Box
imported-from: https://stuffthebox.wordpress.com/2012/03/12/the-turd-that-is-applescript/
excerpt: >
    <p>I am an Apple fan. <br /><br />
    I like Mac's <br />
    and iPhones <br />
    and iPads <br />
    and iEtc's <br />
    but, professionally, I am a Windows engineer.</p>
---

I am[^Was] an Apple fan.

I like Mac's <br />
and iPhones <br />
and iPads <br />
and iEtc's <br />
but, professionally, I am a Windows engineer.

I am a qualified network engineer and software administrator. My experience has primarily been around Windows hardware, OS, and software.

I program and script in KiXtart as my main language of choice, and can also code in VBScript, AHK, AutoIt, shell, and bat.

I have experience in HTML, JavaScript, and XML.

So as an Apple-only man at home, I thought it was about time I learnt to script in the Mac world.

I attempted to write in AppleScript this last weekend; put simply, it's a turd![^Compare] <br />
Seriously, a turd!

I had created a Codeless Language Module for TextWrangler (and BBEdit) so that I could script KiX on my Mac's with complete syntax highlighting (soon to be available on this site!) and wanted to create an installer so that I could easily provide my CLM to others.

I thought to myself "you know what, I reckon I could do a few minor things in AppleScript and create an 'Application' from that ... win!"

Seriously, how wrong was I?!

I want to see if an application is installed. Simple task. <br />
AppleScript has great power with utilising installed applications, so I thought something along the lines of:

{% highlight applescript %}
if exists application "TextWrangler" then
    # code if true
end if
{% endhighlight %}

Seems simple right? Code logic (kinda) seems plausible?

**WRONG!!!**

I Bing'd <br />
I Googled <br />
I tweeted

I could barely find a damned thing about identifying if an application is installed with AppleScript[^Search]. <br />
The one option I did find was massive, convoluted, and seemed a bit ... well, stupid.

So what did I do? <br />
This:

{% highlight applescript %}
set existTW to "NotInstalled"

try
    set existTW to do shell script "ls /Applications | grep 'TextWrangler'"
end try

if existTW does not contain "TextWrangler" then
    display dialog "It ain't installed!" buttons {"Drat…"} default button 1 with icon stop
    return 5
end if
{% endhighlight %}

All thid does is set `existTW` to a value, list the `/Applications` directory and find anything containing the text *"TextWrangler"* and set `existTW` to that output.

If nothing in `/Applications` contains the text, it will not alter the value of `existTW` (which was set to *"NotInstalled"* earlier) and there are no errors and the if statement will display a prompt stating no application installed, will stop running, and exit with the code 5[^Error-5].

Not quite as succinct as I had wanted, but heck, it works.

Next I wanted to get the directory that the AppleScript is running from. <br />
Again, shouldn't be that hard.

In KiX, it's a macro called `@ScriptDir` <br />
In bat (cmd), it's `%~dp0` <br />
In shell (.sh), it's `dirpath $0`

So it should be easy in AppleScript right?

*Again*, **WRONG!**

AppleScript does have a function called "path to me", but that returns `folder:to:script.script`

I want the parent folder of the script ...

And what the hell is with the path syntax?! I want to be able to pass these details to shell, which I cannot do with the path having `:` instead of `/` separating the folders/files :/

My solution (with some help from my good friend Bartron) turned out to be this:

{% highlight applescript %}
set x to POSIX path of (POSIX file ((POSIX path of (path to me)) &amp; "/..") as text)
{% endhighlight %}

W ... <br />
T ... <br />
**F?!**

Why does it have to be such a turd of a process to get the fucking parent directory of the script?!

Anyway, I was trying to get the script to do a bunch of other stuff too, and it just wasn't working the way I wanted. In the end, I created 2 shell scripts that do the main parts of the install, and I'm using AppleScript as the container/controller and for the message boxes. <br />
AppleScript does some pretty funky things with basic message boxes (`display dialog`).

All in all though, I've learnt a tonne. AppleScript **IS** a powerful beast with some great abilities. <br />
But it is also a great big giant turd :P

---

[^Was]: *Update 16 May 2015:* I *was* an Apple fan. These days I am getting more and more annoyed by the company with most things that they do.
[^Compare]: Essentially, I can liken AppleScript to VBScript: It's a powerful tool, but a fucking bitch to code in!
[^Search]: Searching for any kind of help on AppleScript on the interwebs is ridiculous! This is the typical scenario: <br />
    <blockquote>
        <strong>Q.</strong> I want to do "x", can anyone help? <br />
        <strong>A.</strong> Why do "x"? Do "w", "m", "b", or "r"; none of which has nothing to do with what you want to achieve! :D
    </blockquote>
[^Error-5]: Random error number; 5 seemed like the right thing at the time :P
