---
layout: post
title: "Storing secret files in Azure Pipelines"
date: 2019-06-02 17:03:07 +0100
tags: azure-pipelines
---

Relevant docs:

-   [Secure files for Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/secure-files)
-   [Download Secure File task](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/utility/download-secure-file?view=azure-devops)

Steps:

1.  From the front page of Azure, go [the "Library tab"](https://dev.azure.com/alexwlchan/alexwlchan/_library?itemType=VariableGroups) and select ["Secure Files"](https://dev.azure.com/alexwlchan/alexwlchan/_library?itemType=SecureFiles).

    <img src="/images/azure-pipelines-library.jpg">

2.  Upload the secret file you want to use in your builds.

    <img src="/images/azure-pipelines-secret-files.jpg">

3.  Add the following task to `azure-pipelines.yml`:

    ```yaml
    - task: DownloadSecureFile@1
      inputs:
        secureFile: {filename}
    ```

    where `{filename}` is the name of the file uploaded in step 2.

4.  Kick off a build.
    This will fail with an error in the "Download Secure File" stage.
    In the Pipelines console, go through and click “Authorize resources”.

    <img src="/images/azure-pipelines-permissions-error.jpg">

5.  Rerun the build.
    It should decrypt now!

6.  Access the file path in a script block as follows:

    ```shell
    ssh -i DOWNLOADSECUREFILE_SECUREFILEPATH alexwlchan@my_linode.dev
    ```
