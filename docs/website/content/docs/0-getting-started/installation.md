---
title: Installation
weight: 1
bookToc: true
---

# Installation

## Obtaining a copy of the repository

### New here?
To clone the repository, open a terminal[^1] and run the following command _from_ the directory into which you'd like to place the project (e.g., from `~/repos`).
```sh
git clone https://github.com/lzachmann/models-for-missing-data.git [DIRNAME]
```

`DIRNAME` is optional, and specifies the name of the directory into which the project will be cloned on your local machine. You could call it "m4md" for instance, if you wanted something a bit shorter than the default "models-for-missing-data."

### Existing I&M uplands member?
If you're a member of the team that helped to create this tool, you may want to fetch the uplands data and analysis config files we've been using, which are kept as private submodules on GitLab.[^2]
```sh
git clone --recurse-submodules --remote-submodules \
  https://github.com/lzachmann/models-for-missing-data.git [DIRNAME]
```
The `git clone` command above will recurse through all of the project submodules and ask you to authenticate with GitLab as necessary.

[^1]: Windows users will need to use Git Bash to do this, which comes with your installation of [Git for Windows](https://gitforwindows.org/).
[^2]: If this command doesn't work, try updating Git (`--remote-submodules` is only available in newer versions of Git). Alternatively, try removing `--remote-submodules` from the `git clone` command.