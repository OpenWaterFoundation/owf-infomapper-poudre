# web #

This folder contains files to publish the Poudre Basin Information web application.
The website is implemented using the general OWF InfoMapper application,
which is a web application that provides access to maps and other content.

```
git-repos/
  owf-app-info-mapper-ng/
    info-mapper/
      src/
        assets/
          app/
  owf-app-poudre-dashboard-ng/
    web/
      info-mapper-local/                                             Files that need to be version-controlled.
      copy-local-to-info-mapper.sh                                   Script to copy info-mapper-local/ files to info-mapper/.
```

The above symbolic link is created by the `build-util/create-info-mapper-symlinks.sh` script.
The symbolic link is defined above to avoid issues with Angular not finding content in a linked folder.
For example, in Git Bash the configuration is:

```
drwxr-xr-x 1 sam 197121    0 May 12 12:33 ./
drwxr-xr-x 1 sam 197121    0 May  9 23:25 ../
lrwxrwxrwx 1 sam 197121   98 May 12 12:33 info-mapper -> /c/Users/sam/owf-dev/App-Poudre-Portal/git-repos/owf-app-info-mapper-ng/info-mapper/src/assets/app/
-rw-r--r-- 1 sam 197121 1080 May  9 22:55 README.md
```

The main application configuration file (`dist/info-mapper/app-config.json`) should be edited to indicate
menus and corresponding content.

Workflow commands in this project should automate creation of map configuration files,
time series, and other content so that Info Mapper can display the content.

Content that is dynamically regenerated should be listed in `.gitgnore`.
Snapshots of published content can be saved in versioned website folders,
using the `version` defined in the `app-config.json` file.

**Because published content in the `dist` folder exist in the InfoMapper repository,
appropriate `.gitignore` settings should be defined in both repositories to avoid committing dynamic content.**
