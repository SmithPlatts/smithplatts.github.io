---
title: pain => pain = hg.Convert(svn.RepoOrWc("Doesn't matter, it was all painful ..."))
imported: Stuff the Box
imported-from: https://stuffthebox.wordpress.com/2014/04/23/converting-svn-repo-to-hg/
---

**WARNING** I swear a little in this post; if you don't like swear words, move along ... <br />
So I decided to take the plunge and convert my personal/private SVN repository to a Mercurial (HG) repository.

My reasons for doing this are varied:

- I have been wanting to play with DVCS for a while
- I don't really like Git
- Mercurial appears to have matured somewhat over the last couple of years and seems very extensible and powerful
- Assembla, the SVN repository hosting service that I have been using, has been getting more and more annoying

At work we use a lot of [Atlassian](https://www.atlassian.com/) products, and so I have been looking at [Bitbucket](https://bitbucket.org/) as a host for my HG repository. A lot of developers I respect use it and like it, and it is free with unlimited private repositories and up to 5 users.

So the first thing I did was create an account on Bitbucket, which *seemed* painless and simple. As part of the account creation process, you can create your first repository[^BitBucket-Defaults], which I did. Once the repository was created and I had customised it a little, I set out to import/convert/migrate my existing SVN repository to Bitbucket ...

This is where the rant will begin ...

Shit a brick!?! What a painful process!?!<br />
Seriously ...

### I am still frustratingly fuming!

I had saved a few articles to my [Instapaper](https://www.instapaper.com/) queue some time back when I first thought about doing this which documented how to migrate a SVN repository to a HG repository, but when it came time to follow them, they didn't work!

There were [different errors](https://alpha.app.net/smithplatts/post/28969525), assumptions that were not documented, and other shit-fights.

So, I am going to document what I had to do to get it to work.

Firstly, some assumptions:

- You know how to use a command line; most of the commands here will be from the command line
- Have [TortoiseSVN](http://tortoisesvn.net/downloads.html) installed and ensure that you selected the CLi tools as part of the install process; if you didn't, rerun the installer and install them!
- Install [TortoiseHG](http://tortoisehg.bitbucket.org/) and make sure that you install the CLi tools too
  - As an aside, TortoiseHG[^SourceTree] is pretty good :P

### Now, the process

I needed to create a local copy/backup of my online SVN repository as the `hg convert` process hated my checked out working copy. To do this, I had to perform the following:

0. `svnadmin create PATH_FOR_LOCAL_REPO`
  - *i.e.* `svnadmin create C:\Repositories\SVN\repo`
  - This creates an empty SVN repository with folder structure, etc.
0. `Echo Exit 0` > `PATH_OF_LOCAL_REPO\hooks\pre-revprop-change.bat`
  - *i.e.* `Echo Exit 0` &gt; `C:\Repositories\SVN\repo\hooks\pre-revprop-change.bat`
  - For some stupid reason, if this doesn't exist, it borks out ... if someone can explain why this is required, please let me know!
0. `svnsync init file:///PATH_OF_LOCAL_REPO URL_OF_REMOTE_REPO`
  - *i.e.* `svnsync init file:///C:\Repositories\SVN\repo https://subversion.assembla.com/svn/repo/`
  - This will initialise the \[blank] local repository to replicate the remote one in full.
  - Yes, the `file:///` is required because svnsync is stoopid.
0. `svnsync sync file:///PATH_OF_LOCAL_REPO`
  - *i.e.* `svnsync sync file:///C:\Repositories\SVN\repo`
  - This will cause a full synchronisation from the remote repository to the local.

So, I now have a local SVN repository that is a direct mirror of the remote one! When viewing it this way, it doesn't seem so bad, but getting to this point took *WAY* too long :(

Anyhoo, now that I have the local repository, I can convert it!

0. `hg --config config.svn.trunk= convert -s svn PATH_OF_LOCAL_SVN_REPO PATH_FOR_HG_REPO`
  - *i.e.* `hg --config config.svn.trunk= convert -s svn C:\Repositories\SVN\repo C:\Repositories\HG\repo`
  - The `--config config.svn.trunk=` was required for my conversion as my SVN repository was not configured with the trunk, branch, etc directory structure but was more configured as standard directory tree. This option tells HG to treat the root as the trunk.
  - This will convert the SVN repository into a new HG repository with all metadata, versions and history ... but no files!
0. `CD PATH_OF_HG_REPO`
  - *i.e.* `CD C:\Repositories\HG\repo`
0. `hg up`
  - This will make HG update the repository location with all of the file data that is stored in the converted repository `.hg` folder.

And just like that, I now have a fully mirrored HG repository!!!

Now I need to configure TortoiseHG so that pull/push commands can default to my Bitbucket repository. Because HG is a DVCS, there are no *working copies* of the repository that are checked out, but instead *every* copy is also a full repository. So, to get my local repository into Bitbucket, all I need to do is push it up.

Here's one of the big kickers that got me: logon and check the Bitbucket repository URL; does it end in `.git`? If so, delete the repository and create a new one. This caused me to piss fart around for well over an hour trying things, reading support docs, searching online, and other stuff to get working as there was no indication that the repo was not dual function. When you create the first repository when also creating your account, it will default to Git without any ability to change (at least, it did for me!). Once you create a new repository, and ensure that you specify the repository be configured for Mercurial, you can configure TortoiseHG's pull/push defaults:

0. Navigate to the HG repository, right-click and select *Hg Workbench*
0. Right-click the repository in the left-hand repository tree and select *Settings*
0. When viewing the *TortoiseHg Settings* dialog, click the *Edit File* button near the top
0. In the configuration file editor dialog, add the following lines: <br />
   ***N.B.*** Change the `URL_OF_REMOTE_HG_REPO` to the URL provided for the repository in the Bitbucket web tools; *i.e.* `https://bitbucket.org/UserName/repo`

        [paths]
        default = URL_OF_REMOTE_HG_REPO
        default-push = URL_OF_REMOTE_HG_REPO

0. Once complete, click *Save* to the configuration file editor dialog and then click *OK* to the *TortoiseHg Settings* dialog
0. A push should be able to be performed now and should default to the configured URL and populate the Bitbucket repository!

And just like that, the SVN repository, including all history and whatnot, should be converted to HG and in Bitbucket.

It really was *that* simple! :P

---

*[CLi]: Command-Line Interface / Command Language Interpreter
*[DVCS]: Distributed Version Control System
*[HG]: Mercurial
*[PITA]: Pain in the Arse
*[SVN]: Subversion

[^BitBucket-Defaults]: Yeah, this will be covered later as to why this was a PITA and needs to be handled by Bitbucket better!
[^SourceTree]: \[*Update: 13 May 2015*] Since writing this post, I have since been using [Atlassians](https://www.atlassian.com/) [SourceTree](https://www.sourcetreeapp.com). It is a Git and HG GUI-based application which, so far, has been the best I can find! 
