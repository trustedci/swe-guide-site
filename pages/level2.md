
<!--
.. title: Level 2: BASIC SOFTWARE ENGINEERING PRACTICE
.. slug: level-2
.. date: 2019-04-12 15:21:19 UTC-04:00
.. tags: TrustedCI Software Engeneering Guide Revision Control Workflow
.. category: 
.. link: 
.. description: TrustedCI Software Engeneering Guide Level 2 Revision Control Workflow, this chapter covers  Semantic Versioning , Change Log , Distributing software, Code signing, Basic security policy,  vulnerability management, Dependency selection, Succession Issue tracker, and Testing 
.. type: text
-->

This level of secure software engineering is intended for with software that will be developed by a team and/or distributed for use by more than the developer(s).  This software:

- May have any number of developers, including developers who aren't local to one another
- May be distributed to people outside the development team for their use
- Does not include any network-connected services
- Does not include any libraries or other resources that may be incorporated into a security function (e.g. encryption, authentication, input validation) or into a network-connected service

**At level 2 the primary software engineering concerns are to demonstrate integrity of the software and to minimize the occurance of common faults--security and otherwise--introduced through failures of communication and failures of software distribution.**

Teams developing at Level 2 should be doing all of the Level 1 requirements detailed in the previous chapter, as well as these additional Level 2 requirements:

1. Revision Control Workflow
2. Semantic Versioning
3. Distributing software
4. Change Log
6. Code signing
7. Basic security policy, including vulnerability management
8. Dependency selection
9. Succession
10. Issue tracker
11. Testing

## Revision Control Best Practices

At level 1, you already learned that it is necessary to use revision control.  However, for small projects that must be understood by at most one or two people, and available as historical artifacts, *how* the revision control system is used may not be that important.  When working with a team, or expecting outsiders to be able to navigate your repository, some additional care is required in maintaining the repository and communicating about its contents.

You can put the phrase "git workflow" into your favorite search engine to find many examples of workflows that suit different development teams' working styles.  The specifics that are most important are that:

* All releases are tagged as such.
* There is a README file in the root of the repo describing how different branches are used.
* HEAD, or the most recent commit, of the master branch contains the code most desireable to deploy.

### Branch usage example

There are many formal git workflows out there, such as [git flow](https://nvie.com/posts/a-successful-git-branching-model/) and [One Flow](https://www.endoflineblog.com/oneflow-a-git-branching-model-and-workflow), or the far less prescriptive advice in the [Git Book's section on workflows](https://git-scm.com/book/en/v2/Git-Branching-Branching-Workflows).  If you are trying to build a just-right, all-encompassing workflow with diagrams that cover every eventuality and come with supporting tools, by all means, dive into that world.

For those trying to keep it as informal and simple as possible, here's an example workflow that is extremely lightweight, and suitable for a simple project that maintains only one major version at a time:

The different tracks of changes are called branches and any repo should have at least a master branch.  in our lightweight workflow, we'll have four types of branches:

* Master -- There is only one `master` branch.  This is where you merge any version you will be publishing as a production version.  Ensure that each commit to this branch is tagged so we know what version it is.

* Development -- There is only one `development` branch.  This is where active development happens before it is ready to be included in the `master` branch.  Code is forked from here for pre-release testing and similar.  Involved code changes will happen in individual contributor branches (below) and get merged back to `development`. 

* Testing -- There is only one `testing` branch at any given time.  Once a code freeze is called to prepare for release, `development` should be forked to a testing branch, called something like `testing-v2.3`.  This allows development for the *next* version of the software to continue in `development`, while `testing` accepts only the most essential changes to fix bugs and improve code quality prior to release.  When testing is complete, the resulting work will be merged to `master` as a new release.

* Individual contributor branches -- We want developers to commit early and often, so it should be normal for individual contributors to spin off branches to work on individual fixes or improvements and merge the work back in when it works, builds, and passes any tests.  There may be *many* individual contributor branches at any time, so come up with a naming convention that avoids collisions.  Here are some common examples:
    - `feature-newlogin-231` where someone is working on a new login feature detailed in issue # 231 in the project issue tracker, and by the same convention `bug-311-performance-hit-XML-processing` where someone is working on fixing a bug related to poor performance in XML processing
    - `sons-loginfeature` and `wolter-bug665` where the  project has decided that each developer can name as they wish, as long as they preface their branchname with their own name to prevent collisions.
    - `work-411-loginfeature` where the project has decided to call all individual contributor branches 'work' followed by the issue queue number, and any memorable or helpful string afterward.
    
 It doesn't much matter how individual contributor branches are named, as long as name collisions are avoided.

## Semantic Versioning

[Semantic Versioning](https://semver.org) may sound nitpicky, but it's an invaluable tool for ensuring that your software will be installed and maintained correctly wherever it's going.  No matter how good your other methods of communication are, your version number is the primary way of telling consumers of your software what a particular update means.

Semantic Versioning, as explained at the link above, is a specific, widely-adopted way of determining the version number for a piece of software.  Because most people who administer your software will be responsible for hundreds or thousands of software packages, they won't be able to read every mailing list message or issue queue note to find out whether your update will break anything, or contains an important security patch.  Making your version numbers predictable and understandable solves the problem nicely, and can greatly reduce frustration among consumers of your software, without any real cost to you.

### Version X.y.z

In its simplest form, Semantic Versioning uses three integers separated by dots to communicate the version of a package:

> Given a version number MAJOR.MINOR.PATCH, increment the:
> 
> 1.  MAJOR version when you make incompatible API changes,
> 2.  MINOR version when you add functionality in a backwards-compatible manner, and
> 3.  PATCH version when you make backwards-compatible bug fixes.

-- from https://semver.org

Note that these are integers separated by dots,*not* a decimal system.  Version `1.11` is *later than* version `1.2`.  

### Version Zero
Major version zero has a special meaning in Semantic Versioning: this is how you communicate that a piece of software is not yet ready for production use.  Version `0.1` is still an experimental or testing version.  Version `1.0` and after are assumed to be production quality unless specifically tagged "beta" "testing" or similar, e.g. `2.0-beta.1`.

Major version zero is also the only time when it is acceptable to make breaking changes without incrementing the major version number: because major version zero indicates pre-release software, which may change in any way at any time.

## Distributing software

The distribution methods that you choose will have a major impact on whether or not consumers of your software actually update and stay current, or not, and whether they install a legitimate copy of your software or not.

For Linux software ,the ideal distribution method is via the operating system's package manager, such as [APT](https://wiki.debian.org/Apt) for Debian based Linux distrubtions or [RPM](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/deployment_guide/ch-rpm) for Red Hat based distrubtions.  While it does take some extra work to package software in this way, doing so ensures that discovering and applying updates is as easy as running the package manager's normal update function.  See "package management" below for more information.

The major mobile OSes

- Other distribution methods (e.g. container or VM distribution)
	- security concerns
	- how to do it well
- Last resort: manual installs
	- How to make your software verifiable (supply chain security)
		- SSL-secured site
		- don't use Sourceforge
		- refer to code signing section below

In the worst case situation, manual installs need to be a valid option.

### Package Management

There are several ways to share your project with others. One of the easiest ways for the user is through the user's package manager. Windows and Apple both have their own packaging formats, which make installs and uninstalls more predictable.  Apple software can also target Homebrew, a Linux-style package management tool for OSX.

If you can't get your package into the official repository for an operating system, you may be able to create your own.  Ubuntu based systems use [PPAs](https://help.ubuntu.com/stable/ubuntu-help/addremove-ppa.html.en), or Personal Package Archives as a convenient way to distribute software through the Ubuntu package manager.  If targeting Gentoo systems, one would create an [overlay](https://overlays.gentoo.org/). Red Hat, Debian, and other Linux systems have their own variants.  The common thread is that this gives you the benefits of automated management through the OS package manager without lobbying to include your package in the core repositories.

Some languages, such as Python, also have their own package managers. Python uses [Pip](https://pypi.org/project/pip/). Perl uses [CPAN](http://www.cpan.org/modules/INSTALL.html). Rust uses [Crates](https://crates.io/).  While installing via the operating system package manager is ideal, making software available via a language-specific package manager can help users on non-Linux systems, or who need to install in certain nonstandard environments.

Some large organizations, such as the [Open Science Grid](https://repo.opensciencegrid.org/), hosts their own repositories. You can add the repository to your system (read up on the docs for your system) and then verify the repository with the key given for the repository.

### Making a manual installation less painful

If one must install software manually, there are several tricks to make installing the software manually easier. First, have a detailed install.txt file in the root directory of the project. This should document the steps required to successfully build the code and who to contact in case it fails as a minimum. It is also a good idea to add in a common issues list and how to avoid the issues and how to fix the issues if a user finds themselves with the issue.

Binary installers are to be avoided. They can do some magic behind the scenes that the average user cannot trace easily. Using a human-readable script, such as [WAF](https://waf.io/) for complex projects or a shell script for small, one off projects make it easier to trace issues.

## Change Log

[Keep a Changelog](https://keepachangelog.com) provides an excellent, easy and accessible guide to writing a simple changelog for every release of your code.  I won't attempt to reproduce it here.

Keeping an easy-to-read and accurate changelog is important because your other documentation, newsletters, blog posts, and so on may not travel everywhere that your code does.  A changelog should.  Second only to version numbers, this is a primary way that consumers understand when and how your software has changed.


## Code signing

### Certificate or PGP ?
- For the purpose of this guide, consider PGP and GPG to be equivalent[^1].  In a software engineering context, they are generally used for signing git/mercurial tags and signing archive files (see below).
	- Public key should be signed by others in order to be trusted, but even an untrusted key distributed via SSL is better than no signing
	- Often used for signing Linux packages
	- If you sign Windows software this way, your consumers must know enough to manually verify
- Certificates 
	- Generally used for signing Windows installers
	- Need to be signed by a  trusted central authority to be valid
	- Central authorities that sign X.509 for email use, Open Science Grid access, etc. are usually not the same ones needed for Windows to accept your software.
	
[^1]: PGP, or Pretty Good Privacy, is both the name of an encryption and signing specification, and the name of the most common implementation of that spec on Mac and Windows.  GPG, or GNU Privacy Guard, is an implementation of the PGP spec on Linux that is also sometimes used on other OSes.

### Signing git/mercurial tags

Signing tags in your revision control repository is a form of code signing that travels forever with the history of your code.  The built-in integrity checking in git and Mercurial ensures that accidental corruption is detected.  Signing a tag says "this code really came from me".

Check the documentation for your revision control system to find out how to sign a tag.

### Signing archive files (e.g. tarballs, zip files)

Signing archives such as tarballs or zip files prevents tampering with these files by the many computers they pass through on the way to consumers.  This isn't theoretical.  Even in cases where software may not be of interest to advanced threat actors, there are far more mundane risks, such as [a hosting provider adding their questionable adware to packages without developer consent](https://www.howtogeek.com/218764/warning-don’t-download-software-from-sourceforge-if-you-can-help-it/).

If your tarball or zip file is signed with a verifiable key, then users will know whether it has been tampered with before installing.

### Signing packages for release

Signing packages for release through OS package managers is essential to how those package managers prevent tampering, deal with transmission and storage faults, and more.  Consult the documentation for the packaging system you are working with to get the procedure specific to that package type.

## Basic security policy, including vulnerability management

A good security policy should protect the project in the sense of not publicly releasing code vulnerabilities. Communication between the developers and the folks who found a vulnerability should be kept secure, as should any related development and documentation, until the time of release.  **The goal is that the patch (including updated packages for easy upgrade) and its release notes come out simultaneously as the first public knowledge about the vulnerability.**  This gives your user base the greatest chance to protect their systems befor an exploit is used against them.

If a vulnerability does become public knowledge before a patch gets released, have a system in place to work with the users of the software to keep them well informed along the way.  Good communication makes a huge difference in how users perceive the security and trustworthiness of your software.  Users should know how close you are to a fix, the impact and difficulty to exploit the vulnerability, and any workarounds or mitigations that they should consider while awaiting a patch.

## Dependency selection

Choosing what dependencies are required for your software to run is critical. Not only should it be able to show it is secure, it should be accessable on the target machines. Such situations could be that a dependency is not on the authorized list for a machine, the machines don't have access to the outside internet, or a user may not have access privilages on the machine to install dependencies. When it comes to dependencies that are secure, you should include it with the source package so that it can be compiled locally on the machine along with your software. Having a copy of the dependencies with your source also means you can include additional testing and other security practices with it that can be forwarded to your customers.

## Succession

When it comes for the life of the software, having other core developers who can take over as lead for the project is known as succession planning. These developers should be able to take over the lead of the project within one working day if the current project lead leaves the project. The reasons for a project lead to leave a project is quite varied, ranging from an accident on their way to the office to health issues to being pulled from the project. The person who takes over as the new project lead should have access to the entire project to do anything and have contact with anyone involved, such as developers, helpful end users, the funding agency, and any support folks.

## Issue tracker

Issue tracking allows for maintaining a record of any bugs that come up in your software. No one writes perfect code all the time and things happen. A good issue tracker will allow you to:

* Track who is working on the bug.

* What file(s) and line(s) the bug is found.

* Make the report publically viewable or viewable to only a few people.

* Track the status of the changes.

* Write up a short report on how the bug was fixed and how to get the patch.

This provides not only good communication to the people using the software at the time, but offers a way to show a clear path that can be reproduced by others.

## Testing

Having a series of tests does wonders for all developers from the early stages of writing software. It allows you to not only know when a change you make breaks something, but you can also test what happens when bad input is given. Any good testing suite will let you define two names for each test. One to break the tests into groups (such as a set of tests for a class) and the other to name each individual test. The tests should be run in it's own main file to allow the choice of the main program or tests to be built. Using a tool to automate compiling your code will make this much easier, especially with larger code bases.

It allows the users of your software (including yourself!) to report situations where the code does not work properly. Any good issue tracker will allow the developers to mark each issue as publicly available or available to only a few people. It will also allow assignment of issues to people on the project and allow to attach information about fixing the issue to the issue itself. A good tracker will also notify the right people (including the person who submitted the issue) when the patch fixing the issue has been applied and where to find the changes. Issue tracking adds an additional level to testing. It points out things to test down the road so that any future changes do not break a patch. This can be done by either by working around the patch with the new code or modifying the patch to work with the additional code without breaking.
