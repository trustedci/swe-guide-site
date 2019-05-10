<!--
.. title: Level 2: BASIC SOFTWARE ENGINEERING PRACTICE
.. slug: level-2
.. date: 2019-04-12 15:21:19 UTC-04:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
-->

The next level of secure software engineering starts with individual pieces of software that could be used by others, but is still geared towards a very focused task. As we are building on earlier topics, be sure you have read and understood the topics covered in the minimally functional program capter. In this chapter, we will cover:

* Use of revision control

* Semantic Versioning

* Distributing software

* Code signing

* Basic security policy, including vulnerability management

* Dependency selection

* Succession

* Issue tracker

* Testing

###Use of revision control

Version control allows for tracking changes of the code based on who or what is being changed. It allows for reproducability by:

* Logging the changes made to the code and by who.

* Reverting to specific versions of your code are possible to deal with a variety of changes from multiple sources.

####Branches

The different tracks of changes are called branches and will have at least a master branch. This branch should have the latest production code. This branch is also where versioning happens, which we will talk about later in this chapter.  Other branches often include:

* Development -- This is where active development happens before it is ready to be included in the master branch

* Testing -- Any code that needs testing should be here. It often intertwines a lot with the Development branch as code is modified.

* Individual contributer branches -- This is a good place for developers to apply patches to test without bothering the development and testing branches.

###Semantic Versioning

Versioning of software comes in handy to both the users and the entire team working on the project. It allows for tracking what changes happened when. The common values for the version number is the major version, minor version, patch number. It is usually noted in that order with the period (.) separating the values. The patch value is usually only used for internal tracking for the developers, but the major and minor versions are attached to the release of changes. The rate that the major and minor versions change tends to be decided upon by the project manager. However, the general rule is that minor versions are sets of small patches and a major version is when there is a major change to the code base, either with many minor changes or a big bug fix.

###Distributing software

Distribution of software should be made as easy as possible. Aside from having a source version kept in reversion control, having folks that can update the binary in package managers is important. This will easily allow system administrators to push software updates automatically. If a project wants to be publicly available, having the software in package managers will also make it easy for folks to install your software on their system. An INSTALL text file should also be included with the source code. This should give the steps to install the software and as much of it should be scripted.

###Code signing

Code signing lets people verify that the code they have has not been altered or corrupted since the source code was signed by the author(s). When choosing how to sign code, not only the certificate itself has to be trusted to verify the code is correct, but the certificate authority has to be trusted as well to verify the certificate. The common certificate authority will be built in with the operating system. However, some companies may have their own internal authority to issue the certificates. In cases of a single developer, the developer may self-sign their code. In that case, getting the public key for the certificate has to be verified from the developer. This can be done either by talking to the developer in person, or through verification of trusted people between you and the developer. Certificates should follow current cryptography standards and have a time stamp when time certificate expires and should no longer be trusted.

###Basic security policy, including vulnerability management

A good security policy should protect the project in the sense of not publicly releasing code vulnerabilities. Communication between the developers and the folks who found a vulnerability should be kept secure, as well as any documentation. Once a vulnerability has been patched, push the patch to become available to the public so that the users can get the fix. Understand that developers can make mistakes and no one is perfect. If a vulnerability does become public knowledge before a patch gets released, have a system in place to work with the users of the software to keep them well informed of what you are doing to mitigate the vulnerability. Good communication with your user base is important. Items to communicate with the users is the timeline for the patch to be released, what the users can do in the short term to protect their system as a temporary fix, and how they can get the patch as soon as it is released.

###Dependency selection

Choosing what dependencies are required for your software to run is critical. Not only should it be able to show it is secure, it should be accessable on the target machines. Such situations could be that a dependency is not on the authorized list for a machine, the machines don't have access to the outside internet, or a user may not have access privilages on the machine to install dependencies. When it comes to dependencies that are secure, you should include it with the source package so that it can be compiled locally on the machine along with your software. Having a copy of the dependencies with your source also means you can include additional testing and other security practices with it that can be forwarded to your customers.

###Succession

When it comes for the life of the software, having other core developers who can take over as lead for the project is known as succession planning. These developers should be able to take over the lead of the project within one working day if the current project lead leaves the project. The reasons for a project lead to leave a project is quite varied, ranging from an accident on their way to the office to health issues to being pulled from the project. The person who takes over as the new project lead should have access to the entire project to do anything and have contact with anyone involved, such as developers, helpful end users, the funding agency, and any support folks.

###Issue tracker


###Testing

Having a series of tests does wonders for all developers from the early stages of writing software. It allows you to not only know when a change you make breaks something, but you can also test what happens when bad input is given. Any good testing suite will let you define two names for each test. One to break the tests into groups (such as a set of tests for a class) and the other to name each individual test. The tests should be run in it's own main file to allow the choice of the main program or tests to be built. Using a tool to automate compiling your code will make this much easier, especially with larger code bases.

It allows the users of your software (including yourself!) to report situations where the code does not work properly. Any good issue tracker will allow the developers to mark each issue as publicly available or available to only a few people. It will also allow assignment of issues to people on the project and allow to attach information about fixing the issue to the issue itself. A good tracker will also notify the right people (including the person who submitted the issue) when the patch fixing the issue has been applied and where to find the changes. Issue tracking adds an additional level to testing. It points out things to test down the road so that any future changes do not break a patch. This can be done by either by working around the patch with the new code or modifying the patch to work with the additional code without breaking.
