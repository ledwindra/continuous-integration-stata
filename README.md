# About

Hello world! Are you a researcher working primarily using Stata? Do you ever:
- get a headache working with cross-platform (e.g. Windows vs Mac OS)?
- try to reproduce a code published by other researchers but it doesn't work out on your machine?
- all of the above?

Imagine that you can avoid all of that. And that's what this repository is aiming for!

# What you need
I hope that you are using a legitimate Stata licese code because in order to run
Stata do-file using GitHub Actions you need:
- Serial number
- Code
- Authorization

# How to run?
Before going any further, you may want to `fork` this repository first and GitHub
Secrets on `Settings -> Secrets` tab. What you need are the following:

- AUTHORIZATION: given by Stata
- CODE: given by Stata
- EMAIL: your GitHub email for git configuration (user.email)
- FIRST_NAME: your Stata first name
- LAST_NAME: your Stata last name
- SERIAL_NUMBER: given by Stata
- OLD_FILE: in my case, store my `Stata15Linux64.tar.gz` on Dropbox and it needs to be renamed. by default it's `Stata15Linux64.tar.gz?dl=0`
- URL: the URL to download Stata file. Choose Linux installer from Stata. Then save it on other place. I'm using Dropbox because the file size is too big to be stored inside this repository
- USERNAME: your GitHub username for git configuration (user.name)

That's it! Then you can go to `Actions` tab and just click `Run workflow` and voila!
You've just run a Stata do-file using GitHub's owned machine. 😀

# P.S.
Don't hesitate to reach me out for further questions.
