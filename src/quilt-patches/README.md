# How patches are handled

* Patches are named matching the priority of the source depends:
  * 01-blabla.patch: will patch _01-jpetazzo-dind_ related source 
  * 01-blabla.patch: will also patch _01-jpetazzo-dind_ related source
  * 02-blablabla.patch: will patch _02-openjdk_ source
* Patches are applied using [quilt](https://wiki.debian.org/UsingQuilt) once Dockerfiles are merged
