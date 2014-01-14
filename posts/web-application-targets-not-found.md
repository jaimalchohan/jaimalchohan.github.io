---
title: WebApplicationTargets Not Found
date: "2014-01-14"
---

I finally got around to uninstalling Visual Studio 2010 and 2012 today.  However, when I went to build one of my solutions I received the error


    SB4019: The imported project "C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v11.0\WebApplications\Microsoft.WebApplication.targets" 
    was not found. Confirm that the path in the <Import> declaration is correct, and that the file exists on disk.

I've had this before on build servers.  It means something in my build process needs Visual Studio to build. Normally it's something to do with web application or web sites as these require a build more than just compiling (like picking out the pages to be deployed from the application code).

Previously I've just gone ahead and installed Visual Studio version whatever wherever I've needed it, which sucks.  Not anymore. All you need to install is the Visual Studio Shell (Isolated) which will install the targets for you.  The shell itself is a redistributable for developing applications with a Visual Studio look and feel (exactly like SQL Server Management Studio 2012).

Anyway, links:

[Microsoft Visual Studio 2010 Shell (Isolated) Redistributable Package](http://www.microsoft.com/en-gb/download/details.aspx?id=1366)

[Microsoft Visual Studio 2012 Shell (Isolated) Redistributable Package](http://www.microsoft.com/en-gb/download/details.aspx?id=30670)

[Microsoft Visual Studio 2013 Shell (Isolated) Redistributable Package](http://www.microsoft.com/en-gb/download/details.aspx?id=40764)
