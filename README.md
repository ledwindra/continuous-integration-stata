# About

Hello world! Are you a researcher working primarily using Stata? Do you ever:
- get a headache working with cross-platform (e.g. Windows vs Mac OS)?
- try to reproduce a code published by other researchers but it doesn't work out on your machine?
- all of the above?

Imagine that you can avoid all of that. And that's what this repository is aiming for!

# What you need
I hope that you are using a legitimate Stata license code because in order to run
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
- HOME_DIR: home directory name. By default, it's `/home/runner/work/${REPOSITORY}/${REPOSITORY}/`
- LAST_NAME: your Stata last name
- OLD_FILE: by default, Stata gives the file name as `Stata15Linux64.tar.gz`. When downloading from it becomes `Stata15Linux64.tar.gz?dl=0` and it needs to be renamed just like the original
- REPOSITORY: a repository name. For example, this repository is named `continuous-integration-stata`
- SERIAL_NUMBER: given by Stata
- URL: the URL to download Stata file. Choose Linux installer from Stata. Then save it on other place. I'm using Dropbox because the file size is too big to be stored inside this repository
- USERNAME: your GitHub username for git configuration (user.name)
- VERSION: your Stata version (I use 15)

That's it! Then you can go to `Actions` tab and just click `Run workflow` and voila!
You've just run a Stata do-file using GitHub's owned machine. 😀

# Considerations
You may need to modify the workflow configuration ([.github/workflows/main.yml](https://github.com/ledwindra/continuous-integration-stata/blob/main/.github/workflows/main.yml)) if:
- Your data exceeds file size limit set by GitHub (50 MB) and hence you store your data on Dropbox. Possible solution: modify the configuration to download your data by adding `wget [FILE_URL]` line before running the do-file
- Your data is inside a database (e.g. SQL database like MySQL or PostgreSQL), then you may want to install the database on the command line

# P.S.
Don't hesitate to reach me out for further questions.
