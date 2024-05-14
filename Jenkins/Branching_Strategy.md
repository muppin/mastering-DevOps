## Types of branches

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/85e33eba-aebd-404e-9f1a-cf38aa93b386)

- Feature Branches -> In an ideal world there are lot of feature branches. Enhancements of the apllication can be done by creating the featute branches.
- main Branch -> Active Development would be going on here, this can be used to adding little changes.
- Release Branches -> this can have certain versions, and these versions are released to production from the release branches.
- Hotfix Branches -> this is used for customer issues (critical bugs that are detected in production release), fixing the code and promoting the changes to all other branches.

## Promotion of code to different branches

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/b41982f8-9174-4466-8aa2-ba375569e95d)


***********************************************************************************************************************************************************************
Master Branch: Represents the main line of development and should always contain production-ready code.

Develop Branch: Acts as a staging area for ongoing development work. Feature branches are typically merged into the develop branch once completed.

Feature Branches: Created from the develop branch for developing new features or enhancements. Each feature branch represents a single feature or change and is merged back into the develop branch once complete.

Release Branches: Created from the develop branch when preparing for a release. Release branches are used for final testing and bug fixes before deployment to production. Once ready, they are merged into both the master and develop branches.

Hotfix Branches: Created from the master branch to address critical issues or bugs in production. Hotfix branches are used for immediate fixes and are merged back into both the master and develop branches.
