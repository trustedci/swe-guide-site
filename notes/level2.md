[x] Review of Level 1 requirements.
[] Use of revision control
[] Semantic Versioning
[] Distributing software
[] Code signing
[] Basic security policy, including vulnerability management
[] Dependency selection
[] Succession
[x] Issue tracker
[x] Testing

For level two requirements and beyond, reviewing the requirements of previous requirements should be done. For level two, you should review the requirements of level 1 as we will be building on them.

Having a series of tests does wonders for all developers from the early stages of writing software. It allows you to not only know when a change you make breaks something, but you can also test what happens when bad input is given. Any good testing suite will let you define two names for each test. One to break the tests into groups (such as a set of tests for a class) and the other to name each individual test. The tests should be run in it's own main file to allow the choice of the main program or tests to be built. Using a tool to automate compiling your code will make this much easier, especially with larger code bases.

It allows the users of your software (including yourself!) to report situations where the code does not work properly. Any good issue tracker will allow the developers mark each issue as publically available or available to only a few people. It will also allow assignment of issues to people on the project and allow to attach information about fixing the issue to the issue itself. A good tracker will also notify the right people (including the person who submitted the issue) when the patch fixing the issue has been applied and where to find the changes. Issue tracking adds an additional level to testing. It points out things to test down the road so that any future changes do not break a patch. This can be done by either by working around the patch with the new code or modifying the patch to work with the additional code without breaking.
