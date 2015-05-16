---
title: The Turd that WAS AppleScript
imported: Stuff the Box
imported-from: https://stuffthebox.wordpress.com/2012/03/19/the-turd-that-was-applescript/
---

Last week [I posted about my initial experience]({% post_url 2012-03-12-the-turd-that-is-applescript %}) with AppleScript and how much of a turd I found it. <br /><br />
Well, it's been a week now and I have learned heaps!!!<br />
I have also completely changed my opinion about the language ...

My biggest problem was that I was trying to do things that aren't common for AppleScripts target use, and my terminology was wrong. So, in this post, I want to correct a few statements that were made and offer some \[hopefully] valuable User Defined Handlers (UDH) for others to use.

In my previous post, I was trying to check to see if an application was installed, and do something based on that. This was proving difficult as I could't find any kind of documentation on the InterWebs (Google sucks, have you noticed?!) and was getting frustrated.<br />

Well, I now have a UDM that does exactly that, and does it well:

{% highlight applescript %}
# Check to see if an application exists
on fnAppExist(appName)
    try
        if (do shell script "ls /Applications | grep " & appName) contains appName then
            set appExist to 1 as boolean
        end if
    on error
        set appExist to 0 as boolean
    end try
end fnAppExist
{% endhighlight %}

This is a Handler, and was my biggest problem last week. I kept thinking in the terminology of other scripting/coding languages which I have used and developed with. I kept wanting to create *functions*. In AppleScript, functions are better known as *handlers*.

The handler above sets a `try` environment. This is vital to the success of the commands following it and I will explain that as I get to it. Next it checks to see if an application exists by running the terminal command `ls` on the `/Applications` directory and looking for any results that contain the text contained in the variable `appName`. If that returns `true`, the handler sets the variable `appExist` to the *boolean* value of 1. A *boolean* value of 1 is often also synonymous to `true`.

If the `ls` command does not return `appName`, under normal circumstances the whole script would error out and stop. This is where the `try` command is so vital. If the logic errors at all, it can be caught with the `on error` block. If the command errors out, the `on error` will kick in and set `appExist` to the *boolean* value of 0. A *boolean* value of 0 is often also synonymous to `false`.

When a handler ends, it returns the value/output of the last command performed.

Once I worked this out, that *functions* are known as *handlers*, I was able to create more. <br />
The following is a VERY similar handler to the above:

{% highlight applescript %}
# Check to see if a folder exists
on fnFldrExist(fldrParentPath, fldrName)
    try
        if (do shell script "ls " & fldrParentPath & " | grep " & fldrName) is equal to fldrName then
            set fldrExist to 1 as boolean
        end if
    on error
        set fldrExist to 0 as boolean
    end try
end fnFldrExist
{% endhighlight %}

This handler checks if a folder (`fldrName`) exists in the directory path specified by `fldrParentPath` and does pretty much everything as mentioned above by the `Application Exists` handler. What was awesome about this UDM was the advancement from using one variable in the UDM to 2 variables. Simple, pathetic, but damn it felt good haha

You can also do things like generic copy commands, create directory trees or run installers.<br />
*Handlers*, like their cousins (*functions*), are very powerful and useful.

In my post last week, I stated that I gave up what I was trying to do and created shell scripts to do the main commands required and used AppleScript to just call them with some nice dialogs (message boxes). Well that has been thrown out, and I have created two AppleScripts. One does all the commands I need and installs everything I need for BBEdit, and the other script does the same for TextWrangler. The reason for the separation will be explained in an upcoming post.

I have 5 supporting handlers (UDHs) for these scripts which are generic enough to do multiple tasks within each script. All in all, a great result!

If you would like to know about anymore of the UDMs that I have used or if you would like to know if a task you have can be turned into a UDM, please email or comment :D

AppleScript is a very powerful and capable language. I was irritated in my post last week cause I couldn't find any of the info I needed to perform these tasks. When I changed my wording in the Google/Bing search boxes, I finally got results. These results have enabled me to power ahead and create 2 very awesome "installers" for my BBEdit/TextWrangler CLM and colour scheme.

*[UDH]: User Defined Handler
