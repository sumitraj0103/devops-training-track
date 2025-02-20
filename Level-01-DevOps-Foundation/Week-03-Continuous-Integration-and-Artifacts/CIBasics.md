## What is Continuous Integration
Continuous Integration (CI) is a software development practice where developers frequently merge their code changes into a shared repository. Each integration is automatically tested and built to detect errors quickly. This practice helps reduce integration problems, improve code quality, and speed up the development process


One of the primary benefits of adopting CI is that it will save you time during your development cycle by identifying and addressing conflicts early. It’s also a great way to reduce the amount of time spent on fixing bugs and regression by putting more emphasis on having a good test suite. Finally, it helps share a better understanding of the codebase and the features that you’re developing for your customers.


## Run your tests automatically
To adopt continuous integration, you will need to run your tests on every change that gets pushed back to the main branch. To do so, you will need to have a service that can monitor your repository and listen to new pushes to the codebase. There are many solutions that you can choose from both on-premise and in the Cloud. You’ll need to consider the following to pick your server:

- **Where is your code hosted?** Can the CI service access your codebase? Do you have a special restriction on where the code can live?
 - **What OS and resources do you need for your application?** Is your application environment supported? Can you install the right dependencies to build and test your software?
- **How much resource do you need for your tests?** Some Cloud applications might have restrictions on the resources that you can use. If your software consumes a lot of resources, you might want to host your CI server behind your firewall.
- **How many developers are on your team?** When your team practice CI you will have many changes pushed back to the main repository every day. For the developers to get the fast feedback, you need to reduce the amount of queue time for the builds, and you will want to use a service or server that gives you the right concurrency.


In the past, you typically had to install a separate CI server like Bamboo or Jenkins, but now you can find solutions on the Cloud that are much simpler to adopt. For instance, if your code is hosted on Bitbucket Cloud you can use the Pipelines feature in your repository to run tests on every push without the need to configure a separate server or build agents, and with no restriction on concurrency.
