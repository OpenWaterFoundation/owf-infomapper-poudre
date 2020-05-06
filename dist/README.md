# dist #

This folder contains content that is used to distribute content.
Currently the focus is on using the OWF Info Mapper application,
which is a web application that provides access to maps and other content.
However, other tools might be used to distribute content and would have separate folders.

The `build-util/create-info-mapper-symlink.sh` script creates the following symbolic links:

```
git-repos/
  owf-app-info-mapper-ng/
    info-mapper/
      src/
        assets/
          app-config.json -> dist/info-mapper/app-config.json
          data-maps -> dist/info-mapper/data-maps
          data-ts -> dist/info-mapper/data-ts
```

The main application configuration file (`app-config.json`) should be edited to indicate
menus and corresponding content.

Workflow commands in this project should automate creation of map configuration files,
time series, and other content so that Info Mapper can display the content.

Content that is dynamically regenerated should be listed in `.gitgnore`.
Snapshots of published content can be saved in versioned website folders,
using the `version` defined in the `app-config.json` file.
