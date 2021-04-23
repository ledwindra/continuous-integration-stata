[![Test CI Stata](https://github.com/ledwindra/continuous-integration-stata/actions/workflows/test.yml/badge.svg)](https://github.com/ledwindra/continuous-integration-stata/actions/workflows/test.yml)

# About

Hello world! Are you a researcher working primarily using Stata? Have you ever:
- Gotten a headache working with cross-platform (e.g. Windows vs Mac OS)?
- Tried to reproduce a code published by other researchers but it doesn't work out on your machine?
- Overwritten your codes and data (after years of sweat and blood!) using another platform (e.g. Dropbox, Onedrive)?
- All of the above?

Imagine that you can avoid all of that. And that's what this repository is aiming for!

# Potential use cases
In addition to solving the problems above, you can benefit from this repository in some of the following ways:
- Producing regression tables on LaTeX without having to install the distribution on your local machine—which can be pain in the neck
- Running unit tests if you're building a Stata package. This is something that I find lacking compared to other open source statistical packages (Julia/R/Python)

# Workflows
You need to have a do-file named `main.do` in your root directory. This file will trigger all of your workflows, e.g. from data cleaning, data analysis, data visualizations, to creating regression tables to LaTeX. For the latter part, we can also compile the `tex` file into `pdf` using GitHub Actions, which is totally cool!

Since Stata has user-written packages that users may have not installed on their machine, it sometimes can be a cause of an error. Hence, it may be a good practice to run the following code in the beginning of your `main.do` file:

```stata
clear

// list packages that we may want to install
local packages = "unique reghdfe ritest estout ivreghdfe ftools ivreg2" // just for example

foreach i of local packages {
	capture which `i'
	if _rc != 0 {
		display _rc
		ssc install `i', replace
	}
}
```

# Does it really work to your paper?
Yes! Check out this [paper](https://github.com/adviksh/when-guidance-changes) from Charlie Rafkin, Advik Shreekumar, and Pierre-Luc Vautrey, where I clone their repository and run the corresponding Stata do-files (not the R code since it's about Stata workflow) in my [main.do](https://github.com/ledwindra/continuous-integration-stata/blob/main/main.do) (**see lines 20-50**)

# What you need
I hope that you are using a legitimate Stata license code because in order to run
Stata do-file using GitHub Actions you need:
- Serial number
- Code
- Authorization

# How to run?
You can download the source code from [here](https://github.com/ledwindra/continuous-integration-stata/releases). Make sure to choose the latest version available. Then, you can create your own repository on GitHub. Before going any further, you need to add GitHub Secrets on `Settings -> Secrets` tab inside your repository. What you need are the following:

- ACCESS_TOKEN: you need a token that authorizes GitHub to make any git commit on behalf your account. Read [here](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) for details
- AUTHORIZATION: given by Stata
- CODE: given by Stata
- EMAIL: your GitHub email for git configuration (`git config --global user.email`). See [here](https://www.git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)
- FIRST_NAME: your Stata first name
- LAST_NAME: your Stata last name
- OLD_FILE: by default, Stata gives the file name as `Stata15Linux64.tar.gz`. When downloading from the source (I'm saving the Linux installer to Dropbox from Stata since `https://download.stata.com/download/` requires sign-in) it becomes `Stata15Linux64.tar.gz?dl=0` and it needs to be renamed just like the original
- SERIAL_NUMBER: given by Stata
- URL: the URL to download Stata file. Choose Linux installer from Stata. Then save it on other place. I'm using Dropbox because the file size is too big to be stored inside this repository. Also, I don't want to pirate a proprietary software which can bring me into a problem
- USERNAME: your GitHub username for git configuration (`git config --global user.name`). See [here](https://www.git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)
- VERSION: your Stata version (I use 15)

That's it! Then you can go to `Actions` tab and just click `Run workflow` and voila! You've just run a Stata do-file using GitHub's owned machine. 😀

# Considerations
You may need to modify the workflow [configurations](https://github.com/ledwindra/continuous-integration-stata/blob/main/.github/workflows) if:
- Your data exceeds file size limit set by GitHub (50 MB) and hence you store your data on Dropbox. Possible solution: modify the configuration to download your data by adding `wget [FILE_URL]` line before running the do-file
- Your data is inside a database (e.g. SQL database like MySQL or PostgreSQL), then you may want to install the database on the command line
- There's a possibility that your runner will be stopped automatically by GitHub Actions if it runs out of memory. In one of my private repositories, I had encountered the following error message: `##[warning]You are running out of disk space. The runner will stop working when the machine runs out of disk space. Free space left: 0 MB`. Case in point: it's a GIS-related program
- You have complex do-files that require more configurations in the LaTeX files (e.g. installing packages, font set-up, etc)

# Awesome Stata practices
Resources for us to learn (and me particularly) for Stata best practices.

## Blog
- American Economic Association's [Data Editor](https://github.com/aeadataeditor)
- Asjad Naqvi's [The Stata Guide](https://medium.com/the-stata-guide)
- Julian Reif's [Stata Coding Guide](https://julianreif.com/guide/)

## Twitter thread
- AEA Data Editor on [file path](https://twitter.com/AeaData/status/1380555102658957315)

# P.S.
Don't hesitate to reach me out for further questions or send issues [here](https://github.com/ledwindra/continuous-integration-stata/issues). Read [GitHub Actions Documentation](https://docs.github.com/en/actions) for further details.
