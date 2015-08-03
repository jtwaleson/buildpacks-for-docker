Cloud Foundry/Heroku Buildpacks for Docker
===

*The goal of this project is to give you the power of buildpacks on Docker or Docker compatible platforms, such as Amazon ECS.*

One of the best aspects of Cloud Foundry is the buildpack architecture. A buildpack is the part that translates source code to an executable droplet. A droplet is nothing more than a tarball of a file system with an entry point. The buildpack allows developers to spend time on writing code, not on how to install its dependencies on a Linux system or how to properly start it. The buildpack automates all that.

    docker run -p 8080:8080 -d -e DATABASE_URL=xxx jtwaleson/buildpacks http://you.com/source-code.zip

This should be all you need to run your software.

The docker container will download your source code, find a suitable buildpack and use it to transform the code into a droplet and then run it. Caching is applied on all levels through a persistent volume (/tmp/buildpack-cache). This caching directory is purely for caching, so there's no requirement to have consistent reads/writes between multiple containers.


TODO
===
- properly parse the start command from the buildpack or the Procfile, it's now hardcoded to hello-world.py
- allow specification of S3 buckets as the source code location (instance roles can be defined for ECS)
- allow specification of local files as the source code location
- include all major buildpacks
  * java
  * ruby
  * go
  * node.js
- allow specification of custom buildpacks via environment variables / extra arguments
