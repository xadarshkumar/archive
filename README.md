# github-pages-blog-template

<!-- TOC -->
* [github-pages-blog-template](#github-pages-blog-template)
  * [Get Started](#get-started)
  * [Setup and run locally](#setup-and-run-locally)
  * [License](#license)
  * [Docs](#docs)
    * [Initial setup steps](#initial-setup-steps)
    * [Setup GitHub Actions](#setup-github-actions)
    * [Remove dependency from minima theme](#remove-dependency-from-minima-theme)
    * [References](#references)
<!-- TOC -->

This is the template of my blog. Feel free to use this to setup your blog running with zero-configuration.

## Get Started

- Using this template, create a new repository.
- To get running, you need to follow 3 simple steps -
  1. In [`_config.yml`](https://github.com/xadarshkumar/github-pages-blog-template/blob/main/_config.yml) file - update the values of following fields accordingly
    ```
    title: <your_title>
    author:
      name: <your_name>
      email: <your_email>
    description: <your_desciption>
    baseurl: <your_repository_name>
    url: "https://<your_username>.github.io" 
    ```

  2. Go to `Settings` tab on the repository -> `Pages` -> Under `Build and deployment` - Change `Source` to `GitHub Actions`. 

  3. Go to `Actions` tab on the repository -> Select latest failed workflow -> Click `Re-run all jobs`.

Wait for few minutes till GitHub Actions deploy step completes.
You can access it at - https://<your_username>.github.io/<your_repository_name>/

## Setup and run locally

- In Visual Studio Code, install two extensions: 
  - Docker (from Microsoft)
  - Dev Containers (from Microsoft)
- Open the repository in `Dev Container -> Open Folder in Container`
- Install the bundle - `bundle install`
- Update the bundle - `bundle update`
- Run using - `bundle exec jekyll serve --livereload`

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Docs

### Initial setup steps

- setup `Dockerfile`
- open project in Dev Containers
- check for installed ruby version - `ruby -v`
- check for installed jekyll version - `jekyll -v`
- setup new jekyll project - `jekyll new . --skip-bundle --force`
- add webrick dependency to the bundle - `bundle add webrick`
- install the bundle - `bundle install`
- update the bundle - `bundle update`
- delete `Gemfile.lock` file
- in `Gemfile`, remove auto-configuration -
  ```
    gem "jekyll", "~> 4.3.3"
    gem "minima", "~> 2.0"
  ```
- in `Gemfile`, manually configure -
  ```
    gem "jekyll", "~> 4.2.0"
    gem "minima", github: "jekyll/minima"
    gem "jekyll-seo-tag"
    gem "jekyll-remote-theme"
  ```
- update the bundle - `bundle update`
- run using - `bundle exec jekyll serve --livereload`
- configure GitHub Actions to build and run
- (optional) remove dependency from minima theme

### Setup GitHub Actions

To run a specific Jekyll version and custom gems, we need to use GitHub Actions to build the Jekyll 
- Go to `Settings` tab on the repository -> `Pages` -> Change `Source` to `GitHub Actions`
- Go to `Actions` tab on the repository -> Click `New workflow` -> search `Jekyll` workflow -> click `Configure` -> review and commit changes
- On pushing, the action will be triggered and the build will start

### Remove dependency from minima theme

We can override the theme and modify some or all of the files
- open project in Dev Container
- run `bundle info --path minima` in terminal, it will return a `path` where minima is located
- to copy the contents of the theme folder in the root folder of project
  - run `cp path/. . -r -p`in terminal
- now all theme folders and files will appear
- we need to keep `_includes`, `_layouts`, `_saas`, `_assests` folders
- edit files like `_config.yml`, `.gitignore`, `README.md` and remove non dependent files
- finally to decouple minima theme,
  - in `_config.yml`, comment/delete line
  ```
    theme: minima
  ```
  - in `Gemfile`, comment/delete line
  ```
    gem "minima", github: "jekyll/minima"
  ```

### References

- [Bill Raymond - youtube video](https://youtu.be/zijOXpZzdvs?si=D9Bmpqtt1hoF3x6s)
- [GitHub Action setup](https://jekyllrb.com/docs/continuous-integration/github-actions/)
- [minima theme repository](https://github.com/jekyll/minima)
