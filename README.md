# SvelteKit-stack-docker

#### A quick and easy way to get a dev environment for svelteKit + express running. 

---

### How to use 
Ensure that Docker is installed on your system. You can download Docker for your specific system [here](https://www.docker.com/get-started/).



**Recommendation:**

Use the provided Makefile to manage the containers. If you don't have GNU Make installed you can do that by using you favorite package-manager:

MacOS: [Homebrew](https://formulae.brew.sh/formula/make)
 
Windows: [Chocolatey](https://community.chocolatey.org/packages/make)

Linux: you know what you are doing ;)

#### Use Makefile:

Initially use `make create` to create the containers and run the installation. After that you can use `make start` to start the containers and `make stop` to stop them. 

⚠️ **If you add dependecies to your project you have to run `make create` to install the packages. After that you can use `make start` again.**

Note:
If you are already familiar with Docker you can use the specific commands to start and manage the containers.

