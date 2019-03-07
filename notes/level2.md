[x] Review of Level 1 requirements.
[] Use of revision control
[x] Semantic Versioning
[x] Distributing software
[] Code signing
[] Basic security policy, including vulnerability management
[] Dependency selection
[] Succession
[x] Issue tracker
[x] Testing

For level two requirements and beyond, reviewing the specifications of previous requirements should be done. For level two, you should review the prerequisites from level 1 as we will be building on them.

Versioning of software comes in handy to both the users and the entire team working on the project. It allows for tracking what changes happened when. The common values for the version number is the major version, minor version, patch number. It is usually noted in that order wtih the period (.) seperating the values. The patch value is usually only used for internal tracking for the developers, but the major and minor versions are attached to the release of changes. The rate that the major and minor versions change tends to be decided upon by the project manager. However, the general rule is that minor versions are sets of small patches and a major version is when there is a major change to the code base, either with many minor changes or a big bug fix.

Distribution of software should be made as easy as possible. Aside from having a source version kept in reversion control, having folks that can update the binary in package managers is important. This will easily allow system administrators to push software updates automatically. If a project wants to be publically available, having the software in package managers will also make it easy for folks to install your software on their system. An INSTALL text file should also be included with the source code. This should give the steps to install the software and as much of it should be scripted.

Having a series of tests does wonders for all developers from the early stages of writing software. It allows you to not only know when a change you make breaks something, but you can also test what happens when bad input is given. Any good testing suite will let you define two names for each test. One to break the tests into groups (such as a set of tests for a class) and the other to name each individual test. The tests should be run in it's own main file to allow the choice of the main program or tests to be built. Using a tool to automate compiling your code will make this much easier, especially with larger code bases.

It allows the users of your software (including yourself!) to report situations where the code does not work properly. Any good issue tracker will allow the developers to mark each issue as publicly available or available to only a few people. It will also allow assignment of issues to people on the project and allow to attach information about fixing the issue to the issue itself. A good tracker will also notify the right people (including the person who submitted the issue) when the patch fixing the issue has been applied and where to find the changes. Issue tracking adds an additional level to testing. It points out things to test down the road so that any future changes do not break a patch. This can be done by either by working around the patch with the new code or modifying the patch to work with the additional code without breaking.
