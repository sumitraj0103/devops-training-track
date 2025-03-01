
# Overview #
Certain Azure DevOps labs require a preconfigured **Parts Unlimited** team project. This document outlines the required steps to set up the required data.



<a name="Ex0Task1"></a>
### Task 1: Configuring the Parts Unlimited team project ###

1. Navigate to [https://azuredevopsdemogenerator.azurewebsites.net](https://azuredevopsdemogenerator.azurewebsites.net/). This utility site will automate the process of creating a new Azure DevOps project within your account that is prepopulated with content (work items, repos, etc.) required for the lab. For more information on the site, please see [https://docs.microsoft.com/en-us/azure/devops/demo-gen](https://docs.microsoft.com/en-us/azure/devops/demo-gen).

1. Sign in using the Microsoft account associated with your Azure DevOps subscription.

    ![](setup-images/000.png)

1. **Accept** the permission requests for accessing your subscription.

1. Select your Azure DevOps organization and enter the project name **"Parts Unlimited"**. Click **Choose Template**.

    ![](setup-images/001.png)

1. Select the **PartsUnlimited** template and click **Select Template**.

    ![](setup-images/002.png)

1. Click **Create Project** and wait for the process to complete.

    ![](setup-images/003.png)

<a name="Ex0Task2"></a>
### Task 2: Configuring the Parts Unlimited solution in Visual Studio ###

1. Some labs will require you to open the **Parts Unlimited** solution in **Visual Studio**. If your lab doesn't require this, you can skip this task.

1. Navigate to your Azure DevOps team project for **Parts Unlimited**. It will be something like [https://dev.azure.com/YOURACCOUNT/Parts%20Unlimited](https://dev.azure.com/YOURACCOUNT/Parts Unlimited).

1. Navigate to the **Repos** hub.

    ![](setup-images/004.png)

1. Click **Clone** and select **Clone in Visual Studio** (choose it in the dropdown if other option shown as default).
    ![](setup-images/clone.png)
    ![](setup-images/005.png)

1. Follow the workflow to clone and configure the project in Visual Studio. Click **Clone** to copy the repo locally.

    ![](setup-images/clone-2.png)

1. From **Team Explorer**, double-click **PartsUnlimited.sln** from the **Solutions** section to open the solution. You can ignore if you see any warnings about unsupported project types (just click OK on the prompted window and ignore the migration report opened on the browser)

    ![](setup-images/007.png)

    ![](setup-images/unsupported.png)

1. Leave Visual Studio open for use in your lab.

## Navigation:
[Readme](./readme.md) |
[Setup](./set-up.md) |
[Exercise](./exercise.md)