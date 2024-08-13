## Git merge Vs. Git rebase?

- In summary, git merge is a safer and simpler option when you want to integrate changes while preserving the commit history. On the other hand, git rebase provides a cleaner history but should be used with caution, especially in a collaborative environment where the commit history is shared among multiple developers. It's generally not recommended to rebase commits that have been pushed to a shared repository, as it can cause confusion and conflicts for collaborators.

**Git Merge** -
- Pulls the latest changes from the main into the feature branch, creating a new merge commit in the process. Its like tying two branches together with a knot.
- ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/22ffc685-3db6-4eb1-8a83-c0c39d88353c)
- merge will preserve the commit history,

**Git Rebase** -
- Git rebase changes the base of our feature branch to the latest commit on the main and then displays our changes from there.
- In rebase all the commits of feature branch sits on top of target branch.
- It gives a straightforward and clean commit history.
- ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/dbd347f8-6dd1-4298-a65e-73a475d73609)

**Git Squash**-
- All the feature branch commits are squeezed into a single commit and merged into main.
- ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/62abdb29-b891-470a-be99-1dd87528c343)
- This keeps main's history liner as rebasing while still creating a single merge commit.


## Git merge vs git squash?

- In summary, the main difference is in how the commit history is represented. git merge maintains a detailed history with individual commits, while squash merge condenses the changes into a single commit for a cleaner and more streamlined history. The choice between them depends on the project's version control strategy and the desired level of detail in the commit history.


## git pull = Git fetch + git merge

- **git fetch** - Fetches changes from the remote repository but does not automatically merge them into your working branch
- In summary, if you want to check and decide when to merge the changes, use git fetch. If you want to fetch and merge changes quickly, use git pull.


## how to clone a particular branch 
- git clone -b branch_name repository_url

## how to resolve merge conflict??
- Resolving merge conflicts in Git involves addressing conflicting changes between different branches. When Git encounters conflicting changes during a merge operation, it marks the conflicting files and pauses the merge process, requiring manual intervention. Here's a step-by-step guide on how to resolve merge conflicts:

1. **Initiate the Merge:**
   Start the merge process using the `git merge` command. For example, to merge the "feature_branch" into the current branch:

   ```bash
   git merge feature_branch
   ```

2. **Conflicts Occur:**
   If there are conflicts, Git will notify you and mark the conflicted files. You can check which files have conflicts using:

   ```bash
   git status
   ```

3. **Open the Conflicted Files:**
   Open the conflicted files in your code editor. Git will mark the conflicting sections with special markers such as `<<<<<<<`, `=======`, and `>>>>>>>`.

   ```plaintext
   <<<<<<< HEAD
   // Your changes
   =======
   // Incoming changes
   >>>>>>> feature_branch
   ```

   The section between `<<<<<<< HEAD` and `=======` represents your local changes, and the section between `=======` and `>>>>>>> feature_branch` represents the incoming changes from the branch you are merging.

4. **Resolve Conflicts:**
   Manually edit the conflicted sections, keeping the changes you want. Remove the conflict markers and any unnecessary lines. After resolving conflicts, the file should reflect the desired changes.

5. **Mark as Resolved:**
   After resolving conflicts in a file, mark it as resolved:

   ```bash
   git add filename
   ```

   If there are multiple conflicted files, repeat this process for each file.

6. **Complete the Merge:**
   Continue the merge process using:

   ```bash
   git merge --continue
   ```

   If you prefer to finish the merge later, you can use:

   ```bash
   git merge --abort
   ```

7. **Commit the Merge:**
   After resolving conflicts, commit the changes:

   ```bash
   git commit -m "Merge branch 'feature_branch'"
   ```

   This commit message acknowledges the successful resolution of conflicts.

8. **Push Changes:**
   If you are merging into a remote branch, push the changes:

   ```bash
   git push origin your_branch
   ```

Now, the merge conflicts should be resolved, and your changes are successfully merged into the target branch.



## git stash

git stash is a Git command used to temporarily save changes in your working directory that are not yet ready to be committed. This is useful when you need to switch branches, but you don't want to commit your changes or when you want to apply your changes to a different branch later. The git stash command allows you to save your changes and revert your working directory to the last committed state.


$ cat config
[core]
        repositoryformatversion = 0
        filemode = false
        bare = false
        logallrefupdates = true
        symlinks = false
        ignorecase = true
[remote "origin"]
        url =
https://github.com/muppin/mastering-DevOps.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "main"]
        remote = origin
        merge = refs/heads/main

**How to edit existing commit message**
