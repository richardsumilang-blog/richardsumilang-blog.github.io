+++
Categories = ["Apps"]
Tags = ["Apple", "Gmail", "iOS", "Mail App"]
date = "2015-01-08T21:41:00-08:00"
title = "Configure iOS Mail App to respond with Gmail aliases"
disqusIdentifier = "460 http://www.richardsumilang.com/blog/?p=460"
aliases = ["/blog/2015/01/08/configure-ios-mail-to-respond-with-gmail-aliases"]

+++

Assuming you have [aliases setup in Gmail][1], it's fairly easy to configure the
Mail application on iOS to respond to the emails using the correct alias.

The trick here is to setup your Gmail account as an IMAP account. Do not set it
up by selecting **Google** in the add account screen. Choose **Other** and apply
the [IMAP settings][2].

Finally, to configure your aliases, simply go back into your account settings in
the **Mail, Contacts, Calendars** in the **Settings** app, click **Account**,
then **Email**, and **Add Another Email...**.

You are done once you save your changes and now the Mail app should reply using
the correct alias depending on which account received the email.

You may also find it useful to [configure your OS X]({{< relref "configure-mac-os-x-mail-app-to-respond-with-gmail-aliases.md" >}})
desktop the same way.

[1]: https://support.google.com/a/answer/33327 "Aliases setup in Gmail"
[2]: https://support.google.com/mail/troubleshooter/1668960 "Configure IMAP and POP3"
