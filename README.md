🤖 This repo incldues a basic starter template for running a Github action with R. 

a few importact files that are used here: 


`description`  - lists the packages to install

`my_script.R` - the R script that will be run


In the `.github/workflows/starter_workflow.yml` file, the following steps are taken. 


```

name: Starter R workflow

# Controls when the workflow will run - using a cronjob in this case
on:
  # Triggers the workflow on a schedule  - this runs at one minute past each hour.
    schedule:
      - cron:  "1, * * * *"
    workflow_dispatch:

```

This instructs the action to run according to a cron job  - in this case, one minute past each hour.

```

jobs:
    run-r-script:
      runs-on: ubuntu-latest
      env:
        VERY_SECRET_KEY: ${{ secrets.VERY_SECRET_KEY }}  ##create a secret if you need to use it in the code
```

This creates a job called run-r-script. It runs on a linux ubunut-lasest (just the default). There is also a spot to add secret keys  that your script can access, such as an API key you want to keep secret. 




```

    # Steps represent a sequence of tasks that will be executed as part of the job
      steps:
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it - makes files accessible to this workflow
        - uses: actions/checkout@v4

```
Next is the real work of the the action, creating the steps that run. The first one simply makes files in the repo accessbile to the action - something that doesn't come by default. 



```
      #install R
        - uses: r-lib/actions/setup-r@v2
          with:
            r-version: '4.5.0' #can specify the R version you want

```

here we "use" an action from R maintainers that does the critical step of installing R. The 'uses' keyword means it's some other action that you pull in. 



```

        
      #install dependencies in the "description" file 
        - uses: r-lib/actions/setup-r-dependencies@v2
          with:
            cache-version: 1
```

Next is speciflying and installing packages, again using an action that r-lib has very conveniently created. This allows caching of packages. 


```
    # option to install quarto and a quarto render step   
   
    # - uses: quarto-dev/quarto-actions/setup@v2
    #   with:
    #     version: 1.4.515 #set version here

    # - uses: quarto-dev/quarto-actions/render@v2
    #   with:
    #     to: html

```

An option to install quarto if you'd like - currently commented out.

```
        - name: Run the R script
          run: |
            Rscript "my_script.R"

```
Now that R and the packages are installed, the workflow can run the R script and do the task. 





```
    # - name: Commit Data
    #   run: |
    #     git config --local user.email "actions@github.com"
    #     git config --local user.name "GitHub Actions"
    #     git add MYFILE.html
    #     git commit -m "MY MESSAGE" || echo "No changes to commit"
    #     git push origin || echo "No changes to commit"-


```

If you have output data or code changes or something that needs to be saved to teh repo, this step can accomplish that. 











    


      












  
