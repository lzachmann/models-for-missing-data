---
title: Sync changes
weight: 4
bookToc: true
---

# Sync changes

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

{{< notice note >}}
If you're seeing files after running `git status` that you _don't_ want to commit to the version history, open the ".gitignore" file and add a new entry for the file you want to ignore. You can open ".gitignore" with any text editor, including RStudio. 
{{< /notice >}}

```sh
git status
git fetch
git checkout gh-submodule
git add .
git commit -m "<some descriptive message about your changes>"
```
As always, please ensure you're not staging / committing unwanted files (e.g., binary files). Then run:

```sh
git merge <ref>
git push origin gh-submodule
```

## Troubleshooting
If, on an attempt to pull from the remote submodule, you got `fatal: Not possible to fast-forward, aborting`, try:
```sh
git merge origin/<submodule>
```

<!-- ### Checking out a specific ref / branch as opposed to a specific commit
```sh
git fetch --all
git checkout gh-submodule
```

<!-- ### A special note to NPS users
You may need to disconnect from your VPN. -->
