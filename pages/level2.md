
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

Teams developing at Level 2 should be doing all of the Level 1 requirements, including: using *revision control*, *documenting dependencies and build process*, creating and maintaining *build Infrastructure*, communicating the software's *development status*, and adding a *license* to the software.

In this chapter, we cover additional Level 2 requirements:

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

## Revision Control Best Practices [TODO]

At level 1, you already learned that it is necessary to use revision control.  However, for small projects that must be understood by at most one or two people, and available as historical artifacts, *how* the revision control system is used may not be that important.  When working with a team, or expecting outsiders to be able to navigate your repository, some additional care is required in maintaining the repository and communicating about its contents.

### Branches

The different tracks of changes are called branches and will have at least a master branch. This branch should have the latest production code. This branch is also where versioning happens, which we will talk about later in this chapter.  Other branches often include:

* Development -- This is where active development happens before it is ready to be included in the master branch

* Testing -- Any code that needs testing should be here. It often intertwines a lot with the Development branch as code is modified.

* Individual contributor branches -- This is a good place for developers to apply patches to test without bothering the development and testing branches.

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

Major version zero is also the only time when it is acceptable to make breaking changes without incrementing the major version number: because major version zero indicates pre-release software, which may change in any way or at any time.

## Distributing software [TODO]

The distribution methods that you choose will have a major impact on whether or not consumers of your software actually update and stay current, or not, and whether they install a legitimate copy of your software or not.

Package Managers, such as [APT](https://wiki.debian.org/Apt) for Debian based Linux distrubtions or [RPM](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/deployment_guide/ch-rpm) for Red Hat based distrubtions. Apple has their own [App Store](https://www.apple.com/ios/app-store/) and so does [Microsoft](https://www.microsoft.com/en-us/store/apps/windows). These places allow the end user to easily install the software with the correct dependencies and to keep things up to date.

- When to use OS repos, language repos, vs. other repos (e.g. PPAs / overlays / OSG repos)
- Reference to repos
- Other distribution methods (e.g. container or VM distribution)
	- security concerns
	- how to do it well
- Last resort: manual installs
	- How to make your software verifiable (supply chain security)
		- SSL-secured site
		- don't use Sourceforge
		- refer to code signing section below
	- how to make this suck less
		- e.g. install.txt
		- avoid binary installers on Linux (use a human-readable script)

In the worst case situation, manual installs need to be a valid option.

### Making the manual installation suck less

There are several tricks to make installing the software manually easier. First, have a detailed install.txt file in the root directory of the project. This should document the steps required to successfully build the code and who to contact in case it fails as a minimum. It is also a good idea to add in a common issues list and how to avoid the issues and how to fix the issues if a user finds themselves with the issue.
Binary installers are to be avoided. They can do some magic behind the scenes that the average user cannot trace easily. Using a human-readable script, such as [WAF](https://waf.io/) for complex projects or a shell script for small, one off projects make it easier to trace issues.

## Change Log [TODO]

Base on and reference https://keepachangelog.com


## Code signing [TODO]

### Certificate or PGP ?
- PGP / GPG are equivalent, generally used for signing git/mercurial tags and signing archive files (see below)
	- Public key should be signed by others in order to be trusted, but even an untrusted key distributed via SSL is better than no signing
	- Often used for signing Linux packages
	- If you sign Windows software this way, your consumers must know enough to manually verify
- Certificates 
	- Generally used for signing Windows installers
	- Need to be signed by a  trusted central authority to be valid
	- Central authorities that sign X.509 for email use, Open Science Grid access, etc. are often not the same ones needed for Windows to accept your software.

### Signing git/mercurial tags
- why, plus links to howto
### Signing archive files (e.g. tarballs, zip files)
- why, plus links to howto
### Signing packages for release
- why, and note to check with repo for standards

## Basic security policy, including vulnerability management

A good security policy should protect the project in the sense of not publicly releasing code vulnerabilities. Communication between the developers and the folks who found a vulnerability should be kept secure, as well as any documentation. Once a vulnerability has been patched, push the patch to become available to the public so that the users can get the fix. Understand that developers can make mistakes and no one is perfect. If a vulnerability does become public knowledge before a patch gets released, have a system in place to work with the users of the software to keep them well informed of what you are doing to mitigate the vulnerability. Good communication with your user base is important. Items to communicate with the users is the timeline for the patch to be released, what the users can do in the short term to protect their system as a temporary fix, and how they can get the patch as soon as it is released.

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
