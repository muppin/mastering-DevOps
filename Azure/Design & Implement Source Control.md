## GIT

	• To initialize empty git repository- git init
	• To specify username- git config --global user.name "Ayushi"
	• To specify email- git config --global user.email "ayushi15397@gmail.com"
	• Once you initialize the repo, now add the files so that git can control the version of these files
	• Before you add files to repo, add them to staging area
	• Give command-  git add .   (. Means add all files)
	• To check the current status of ur working directory-  git status
	• To move the files from stating area to .git repo use- git commit
	• Working directory--> Stating area --> .git repo
	• Git commit  -m  "This is the initial commit"
	• Git status  (Now nothing to commit)
	• Whenever we modify our file, move it to staging by usit git add command then use git commit

## Going back to previous commit-

	• We can un-stage a file at any moment of time.
	• git log command- Gives the entire history of the changes made to your git repo.
	• Unique id will be given to the commit, this is how git tracks the file versions.
	• To go to previous commit give the command- git checkout commit id
	• Go check all commit numbers- git log  --all

## Un-staging a file-

	• Git add - add the changes to the staging area
	• To attach the head- git checkout main (return back to the main branch)
	• Now u observed that some mistake is there and you don't want to add the change to commit
	• Lets try to unstage, give below command
	• Git rm  --chached filename

## GIT Branches-

• New working copy- which can be used, so that original code will be safe.
• Make changes to this new branch.
• Merge the new branch to the old one.


## Working with Branches-

• To create a new branch- git checkout  -b Branch_name
• Git status- you are on the new branch
• Create new file, now this file is created on new branch

## Merging Branches-

• First git checkout main to go to the main branch
• Then merge the new branch
• Give command-- git merge new_branch_name
• It will do a fast forward merge
• Now the head will point to both the main and the new branch because both are in sync.
• In fast forward merge we will see only one commit msg that is for new branch(eg, feature branch)
• Ort stategy-commit msg for each branch
• Squash merge- command (git merge  --squash branch_name)- helps to reduce the number of commit msgs

## Remote Repositories- Git hub or Azure repo

• It is a remote repo use to host the code repositories.
• Developers will-
• Clone the code from remote repo
• Make changes on there local computer
• Merge changes with remote repo

## Pushing to Git hub

• Give the below command-
• git remote add origin https://github.dxc.com/avasishtha/application.git
• git push -u origin main

## Committing changes to GitHub

• Simply give- git push -u origin main, after committing the change in local

## Creating a branch on GitHub-

• Go to repo in github
• Go to main branch->view all branches->new branch->branch source==main
• To merge new branch with main branch use "New Pull request"
• Then create pull request-> merge pull request

## Tagging-

• It is used to specify that which commit is important in repository.
• You can mark release points with the help of tags.
• Two types of tags- Lightweight and Annotated
• Lightweight tag is just a pointer to a specific commit.
• Annotated-stored as a full object in the git database, contains taggername, email,date & a msg.
• Eg: git tag  -a "ver0.1"  -m "this is version1"
• "git tag" command will list all the tags
• "git show ver0.1"-yoy will see details of that specific commit


## Data recovery-

• "git gc"- for garbage collection
• Git automatically runs a auto gc command
• Another useful command- "git prune"   ( to remove stale objects)

## Large files in git-

• Git lfs command to install lfs tool

Azure repos - pull request
Merge strategy- rebase and fast forward will delete the source branch

## gitignore file

Files that should not be version controlled, example build files
Create a new file as- gitignore.txt, add the file here which you want to ignore

## Team foundation version control-

• It is a version control tool given by Microsoft
• Git is distributed version control tool whereas team foundation is centralized
• A team member will have only one version of each file in there local machine
• Historical data of the files will be held on the server.
• In azure repos & git- permissions can be set on repo level or branch level
• In team foundation, permtn can be set on file level as well


Public project- read only access to users
Private project- requires users to sign in to access the service

## Cherry picking- 

you can choose changes from any branch and push it to main branch
Command- git cherry-pick  commit_id




