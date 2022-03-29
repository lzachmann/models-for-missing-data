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

`DIRNAME` is optional, and specifies the name of the directory into which the project will be cloned on your local machine. You could call it "m4md" for instance, if you wanted something a bit

### Existing I&M uplands member?
If you're a member of the team that helped to create this tool, you may want to fetch the uplands data and analysis config files we've been using, which are kept in private submodules on GitLab.[^2]
```sh
git clone --recurse-submodules --remote-submodules \
  https://github.com/lzachmann/models-for-missing-data.git [DIRNAME]
```
The `git clone` command above will recurse through all of the project submodules and ask you to authenticate with GitLab as necessary.

## Checking for updates

### Project updates
To get the latest __models-for-missing-data__ code, navigate to your project directory using a terminal, and run `git pull`.

### Submodule updates
First, be sure to do any necessary housekeeping (remove, stash, or commit changes). To get the latest updates for each of the submodules, run:
```sh
git submodule update --recursive --remote
```
<!-- git submodule update --checkout -->
<!-- git submodule update --remote docs/website/themes/hugo-cite -->
If you encounter an error, it's likely you've made changes locally that are not yet saved (staged and committed using `git add` and `git commit`). Git won't replace changes in uncommitted files with changes on the remote by default. This is desirable behavior. Try committing your changes locally _before_ syncing with the remote.

## Pushing local changes to a submodule to its remote
First, `cd` into the submodule directory. We're going to do all of our Git work within the context of the submodule. If you've got uncommitted changes, do any necessary housekeeping:
```sh
git status
git add .
git commit -m "<some descriptive message about your changes>"
```
As always, please ensure you're not staging / committing unwanted files (e.g., binary files). Then run:

```sh
git fetch
git checkout gh-submodule
git merge <ref>
git push origin gh-submodule
```

<!-- ### Checking out a specific ref / branch as opposed to a specific commit
```sh
git fetch --all
git checkout gh-submodule
```

<!-- ### A special note to NPS users
You may need to disconnect from your VPN. -->

[^1]: Windows users will need to use Git Bash to do this, which comes with your installation of [Git for Windows](https://gitforwindows.org/)
[^2]: If this command doesn't work, try updating Git (`--remote-submodules` is only available in newer versions of Git). Alternatively, try removing `--remote-submodules` from the `git clone` command.
