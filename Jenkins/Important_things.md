- https://www.coachdevops.com/2019/02/jenkins-master-slave-setup-jenkins.html - Jenkins master slave configuration
- https://www.coachdevops.com/2021/06/jenkins-build-agent-setup-how-to-setup.html - Jenkins master slave configuration




**Freestyle Vs. Pipelien project**

In the context of Jenkins, a continuous integration and continuous delivery (CI/CD) tool, there are two main project types: Freestyle projects and Pipeline projects. Here's a comparison of the two:

1. **Freestyle Projects**:
   - Freestyle projects are traditional Jenkins projects where you configure build steps and post-build actions through a graphical user interface (GUI).
   - They offer a simple and flexible way to define build jobs without needing to write code.
   - You can configure various build triggers, such as polling the source code repository or triggering builds manually.
   - Build steps can be configured using various plugins provided by Jenkins or custom shell scripts.
   - Freestyle projects are suitable for simple build and deployment tasks that do not require complex logic or workflows.

2. **Pipeline Projects**:
   - Pipeline projects, also known as Jenkins Pipeline, are defined using a Jenkinsfile, which is a text-based script written in Groovy syntax.
   - They provide a more powerful and flexible way to define build pipelines, allowing you to define complex workflows, stages, and conditions in code.
   - Pipeline projects support continuous delivery practices such as version control, code review, and automated testing as part of the pipeline.
   - Pipelines can be defined as declarative (simplified syntax with predefined stages and steps) or scripted (full flexibility with Groovy scripting).
   - Pipeline projects offer better visibility and traceability of build processes, as the entire pipeline configuration is stored in version control along with the application code.

Here's a summary of the differences between Freestyle and Pipeline projects:

- **Configuration**: Freestyle projects are configured through the Jenkins web interface, while Pipeline projects are defined using Jenkinsfile scripts.
- **Flexibility**: Pipeline projects offer more flexibility and advanced features for defining complex build pipelines and workflows.
- **Version Control**: Jenkinsfile scripts for Pipeline projects can be versioned along with the application code, providing better traceability and reproducibility.
- **Ease of Use**: Freestyle projects are simpler to set up and configure, making them suitable for basic build tasks, while Pipeline projects require some knowledge of Groovy scripting and Jenkins Pipeline syntax.
- **Reusability**: Pipeline scripts can be shared and reused across multiple projects, promoting code reuse and standardization of build processes.

In general, Freestyle projects are suitable for simple build tasks, while Pipeline projects are preferred for more complex and automated CI/CD workflows. The choice between the two depends on the specific requirements of your project and the level of automation and flexibility you need.
