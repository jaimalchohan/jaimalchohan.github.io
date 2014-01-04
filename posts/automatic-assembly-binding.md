---
title: Automatic Assembly Binding in VS2013
date: "2013-01-03"
---

###Before Visual Studio 2013

We've all seen this type of error before

    Could not load file or assembly 'NLog, Version=2.0.1.0, Culture=neutral, 
    PublicKeyToken=5120e14c03d0593c' or one of its dependencies. The located assembly's 
    manifest definition does not match the assembly reference

And it usually means that you're referencing a higher version of the failing assembly and you also have another dependent assembly which was built against a lower version of the failing assembly.

In the case above, I'm referencing `ServiceStack.Logging.NLog version 3.9.71.0` which needs `NLog version 2.0.1.0`, however in my project I'm referencing `NLog version 2.1.0.0` .

The solution is to add an assembly binding redirect to your .config like so

    <configuration>
      <runtime>
    	<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
    		<dependentAssembly>
    			<assemblyIdentity name="NLog" publicKeyToken="5120E14C03D0593C" culture="neutral"/>
    			<bindingRedirect oldVersion="0.0.0.0-2.1.0.0" newVersion="2.1.0.0"/>
    		</dependentAssembly>
    	</assemblyBinding>
      </runtime>
    </configuration>

###Visual Studio 2013

Regardless of which .Net version your project is targeting, add the following as a child of the `<Project />` element in your project file.

    <PropertyGroup>
      <AutoGenerateBindingRedirects>true</AutoGenerateBindingRedirects>
    </PropertyGroup>

For desktop applications, when you compile the project any required assembly binding redirects will be added to the .config file.

For web applications, when you compile the project any required assembly binding redirects will be highlighted as warnings.

![]({{urls.media}}/automatic-assembly-binding/warning.png)

And double clicking on the warning will display a confirmation box which will update your web.config for you

![]({{urls.media}}/automatic-assembly-binding/confirmation.png)

Which on the whole makes catching and fixing assembly binding redirect issues a whole lot easier.