## Creating a gated release to the production stage ###

1. Return to the Azure DevOps browser tab.

1. Click on **Pipelines>Pipelines** and click on **Edit** (top-right) to modify the release definition.

1. As release pipelines get more sophisticated, it becomes important to define gates to ensure quality throughout the release pipeline. Since the next stage we're deploying to is production, we'll need to be sure to include both automated quality gates as well as a manual approver gate. Return to the release pipeline browser tab and click **Clone** in the **QA** stage. Since the production stage is virtually the same, we can reuse almost all of the existing configuration.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/056.png)

1. The new stage is added after the current one, which is what we want. However, before we can consider the QA deployment successful, we'll need to define a post-deployment condition. Click the **Post-deployment conditions** button on the **QA** stage.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/057.png)

1. **Enable** the **Gates** option.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/058.png)

1. There are several kinds of gates available that can automatically test virtually anything you need to make sure a deployment is in good shape. These could be the return values of Azure functions or REST APIs, queries to Azure for alerts, or work item queries in Azure DevOps. You can also configure how long the platform should delay before evaluating the gates for the first time. In this case, change that to **0** so it will test them immediately after deployment. Then click **Add** \| **Query Work Items**.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/059.png)

1. Select the **Query** for **Shared Queries \| Critical Bugs**. We will make it our policy that the QA deployment cannot be considered a success until all critical bugs have been resolved.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/060.png)

1. Expand **Evaluation options** and update the **Time between re-evaluation of gates** to **5**. If this gate fails, we want it to reevaluate the query every 5 minutes until it clears because engineers will need some time to confirm those critical bugs are fixed in the current version. However, if those bugs aren't cleared and the release isn't manually failed, this configuration will automatically fail the gate after 1 day.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/061.png)

1. For the Query Gate to work, Project Build Service would require Read permission to queries. Go to **Azure Boards > Queries > All > Shared Queries > "..." > Security**.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/permissions.png)

1. Search for the **"(YOUR PROJECT NAME) Build Service "**, if not included by default (not  Project Collection Build Service!) and give it **Read > Allow** permission.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/permissions2.png)

1. We can now turn our focus to the production stage. Select the **Copy of QA** stage.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/062.png)

1. Rename it to **"Prod"**.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/063.png)

1. Click its **Pre-deployment conditions** button.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/064.png)

1. **Enable** the **Pre-deployment approvals** and add yourself as an **Approver**. The idea here is that you won't be asked to approve the production deployment until after the QA deployment has succeeded. At that point, someone on this list will need to approve the deployment to production. Also clear the box for **User requesting a release of deployment should not approve** if it's checked. For the purposes of this lab, you can approve releases you have requested.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/065.png)

1. Click the **Prod** stage's **1 job, 1 task**.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/066.png)

1. Update the **App service name** to reflect the "**-prod**" (instead of **"-qa"**).

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/067.png)

1. **Save** the release pipeline.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/068.png)

1. Repeat the process for changing the codebase at **"PartsUnlimited-aspnet45/src/PartsUnlimitedWebsite/Views/Shared/_Layout.cshtml"** followed earlier in a new tab. This time, update the version number from **"2.0"** to **"3.0"**. This will invoke the release pipeline.

1. As before, follow the release until it is deploying to QA. Click to follow the release itself once available.

1. Eventually there will be an issue with the QA deployment. While it deployed out successfully, one of the quality gates failed. This will need to be resolved for that stage to be approved. Click the **View post-deployment gates** button.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/069.png)

1. It looks like the **Query Work Items** gate is failing. This means that there is a critical bug that must be cleared.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/070.png)

1. Open a new tab to **Boards \| Queries** to locate the bug.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/071.png)

1. Use the query list on the **All** tab to open the **Shared Queries \| Critical Bugs** query.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/072.png)

1. Open the one bug by clicking it.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/073.png)

1. Ordinarily you'd check the site to confirm the bug was fixed, but we'll skip ahead here and mark it **Done**. Click **Save** and close the tab.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/074.png)

1. Return to the release pipeline tab. Depending on timing, it may take up to five minutes for Azure DevOps to check the query again. Once it does, the bugs will be cleared and the release will be approved. You can then click **Approve** to approve deployment to production.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/075.png)

1. Confirm the deployment.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/076.png)

1. Click the **In progress** link to follow the release workflow.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/077.png)

1. It may take a moment for the release to kick off and complete.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/078.png)

1. Once the release has completed, open a new tab to the production app service URL. It should be the same as your QA URL, but with **"-prod"** instead of **"-qa"**. Note the **v3.0**.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/079.png)

<a name="Ex1Task6"></a>
### Task 6: Working with deployment slots ###

1. Return to the browser window open to the Azure portal.

1. Azure App Services offer **deployment slots**, which are parallel targets for application deployment. The most common scenario for using a deployment slot is to have a staging stage for your application to run against productions services, but without replacing the current production application. If the staging deployment passes review, it can immediately be "swapped" in as the production slot with the click of a button. As an additional benefit, the swap can be quickly reversed in the event an issue is uncovered with the new build. Locate the resource group created earlier and click the **prod** app service.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/080.png)

1. Select the **Deployment slots** tab. If you see a message indicating that your current pricing tier does not support slots, follow the workflow to upgrade this service to a **Production** tier or higher and then return here. You may need to refresh the browser for the **Add Slot** option to become enabled.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/081.png)

1. Click **Add Slot**. Note that the **production** slot is considered a "default" slot and is not shown as a separate slot in the user experience.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/082.png)

1. Enter a **Name** of **"staging"** and select the **Configuration Source** that matched your existing deployment (there should be only one). Click **Add** to create the slot.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/083.png)

1. Return to the Azure DevOps tab with the **Prod** stage pipeline editor.

1. Select the **Deploy Azure App Service** task.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/084.png)

1. Check **Deploy to Slot...** and set the **Resource group** and **Slot** to those created earlier.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/085.png)

1. **Save** the release pipeline.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/086.png)

1. Follow the workflow from earlier to commit a change to the codebase at **"PartsUnlimited-aspnet45/src/PartsUnlimitedWebsite/Views/Shared/_Layout.cshtml"** by updating the layout template from **"3.0"** to **"4.0"**.

1. Follow the release pipeline through deployment and approve the release to production when requested.

1. When the production deployment has completed, refresh that browser tab. Note that there shouldn't be any change since the deployment was pushed to a different slot.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/087.png)

1. Open a new tab to the **staging** slot. This will be the same as your production URL, but with **"-staging"** appended to the app service name within the domain. This should reflect the new **v4.0**.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/088.png)

1. Return to the browser window open to the **Azure portal**. Click **Swap** in the deployment slots blade.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/089.png)

1. The default options here are exactly what we want: to swap the production and staging slots. Click **Swap**. Note that if your apps rely on **slot-level configuration settings** (such as connection strings or app settings marked "slot"), then the worker processes will be restarted. If you're working under those circumstances and would like to warm up the app before the swap completes, you can select the **Swap with preview** swap type.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/090.png)

1. Return to the **prod** browser window (not the staging slot) and refresh. It will now be the 4.0 version.

    ![](/Level-01-DevOps-Foundation/Week-04-Application-Deployment-and-Infrastructure/exercise-images/091.png)

