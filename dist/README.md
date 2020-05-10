# dist #

This folder contains files to publish the Poudre Basin Information web application.
Currently the focus is on using the OWF Info Mapper application,
which is a web application that provides access to maps and other content.
However, other tools might be used to distribute content and would have separate folders.

The `build-util/create-info-mapper-symlinks.sh` script creates the following symbolic links:

```
git-repos/
  owf-app-info-mapper-ng/
    info-mapper/
      src/
        assets/
          app -> dist/info-mapper
```

The main application configuration file (`dist/info-mapper/app-config.json`) should be edited to indicate
menus and corresponding content.

Workflow commands in this project should automate creation of map configuration files,
time series, and other content so that Info Mapper can display the content.

Content that is dynamically regenerated should be listed in `.gitgnore`.
Snapshots of published content can be saved in versioned website folders,
using the `version` defined in the `app-config.json` file.
