- Jenkins by default runs on port 8080
- ![Uploading image.png…]()


**Credentials**
- **Scope** - System and Global
     - System - Only available for jenkins server and nodes. Not for jenkins jobs.
     - Global - Everywhere acessible ( jenkins, nodes, items, all child items)
     - Project - Limited to project, only with multibranch pipeline. Inside pipeline. System credentials not accessible here.

- **ID** - Reference  for your credentials
- **Folder plugin** - Enables to organize build jobs in folders. Credentials scoped to your project.



**Discover Branches**
- Filter by name - Regular expression. Example: `^dev|master.*$ `

