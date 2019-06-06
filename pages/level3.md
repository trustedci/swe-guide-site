<!--
.. title: LEVEL 3: SOFTWARE ENGINEERING FOR SOFTWARE SUPPORTING SCIENCE PROJECTS
.. slug: level-3
.. date: 2019-04-12 15:21:19 UTC-04:00
.. tags: TrustedCI Software Engeneering Guide Revision Control and least privilege security exercises
.. category: 
.. link: 
.. description:TrustedCI Software Engeneering Guide Level 3  This chapter focuses on Revision Control,  least privilege, and  Next iteration on policy. Including: coding standards, Automated and manual testing requirements, and security exercises
.. type: text
-->

In chapter three, we will build upon what was covered in the previous chapters and talk about:

* Revision Control and least privilege

* Next iteration on policy, including coding standards

* Automated and manual testing requirements

* Automated builds

* Development documentation

* Issue tracker management

* Up and down stream communications

* Architectural Concerns

* Adding security exercises

## Revision Control and least privilege

When it comes to privilege on the code base, the least amount of privilege a user needs is best. One would not want Joe D. Random to blow away the entire project. It is best to be as restrictive as needed:

* Everyday users should have read access only. They need to be able to grab a copy of your code and work with it locally.

* Project developers should be able to write to the repository, but not necessarily to the master branch. This way errors are less likely to make it out to everyone.

* Team leads should have access to all the code branches and be able to push to the master branch when the developers have made changes that meet the quality required for the projects. Team leads should be able to add and remove developer access as well.

* Project owners should have the ability to do anything and everything with the project, including blowing everything away.

This is a basic guideline and folks may have more privilages as required. There should be multiple people on each level so that if one person is unable to perform their duties, another can step in and the project does not grind to a hault.


## Next iteration on policy, including coding standards

Coding standards is what the code should look like when read. It should be easy on the eyes when being worked on. Some standards can include:

* Tabs are four spaces

* Variable and function names should be self explanitory, but not so long that it takes an entire line

* Functions should be no more than two pages.

* Each line is no more than 80 characters in length.

These are some of the common rules found, but by no means a complete list. Work with the developers on the project to figure out what is best for the team and then stick to it.

Other design areas to decide before starting on code include:

* Where is the code base going to reside?

* How often will the team meet to discuss the progress of the project?

* How do users report issues?

	* Who do they report it to?

	* How are the issues released to the public?

	* Where can patches be found?

	* How can the user(s) get updates on the issue?

* What communication tools will the developers or users use? Some examples include:
	
	* Mailing lists, such as [Google Groups](https://groups.google.com/) or [mailman](https://www.list.org/)

	* Internet Relay Chat (IRC), such as [Freenode](https://freenode.net/)

	* [Discord](https://discordapp.com/)

	* [Slack](https://slack.com/)

## Automated and manual testing requirements

As discussed in previous chapters, testing is cruicial to any project that needs repoduciability. There are two ways to run the tests: manually or automated.


### Automated testing	

 Automated testing usually happens when you commit code to the project. It will run all the tests in the project to make sure any changes you've made won't break the project as a whole. The results can be then sent back through multiple mediums such as:	

 * Emailed results	

 * Web interface showing the failed/passed test results	

 * A call to the developer chat channels using AI.	

 Automated testing also comes into play with automated builds, which will be covered later in this chapter.	

### Manual testing	

 Manual testing is when you run test cases independent of commiting code and is usually focused on your local changes instead of the project as a whole. This often can give you hints on if changes will break the project as a whole or not. For example, if an algorithum gets changed in a function and returns a different result than what your tests expected, it will fail when it gets committed.
 
## Automated builds

In earlier chapters, we talked about simple tools for automating the build process. The simple scripts and tools are great for quick builds. However, a bigger build system is in need for compiling the source code. Some common build systems in use today include cmake and waf. Both tools, when done correctly, will be able to find the appropriate files in the correct order to compile the code, show you what step it is on, and any warnings and errors it finds. The steps can fly by, so if the project is large redirecting the output from the build tool you use to a file makes seeing the process it does much easier.

## Development documentation

Development documentation is important for aiding other developers on the workings of your code. Unlike user documentation such as a Quick Install Guide and a README, development documentation dives deeper into the project. These documents should include topics that cover:

* Fixing issues	

 * File naming and location conventions	

 * Where to send a bug report	

 * What assumptions were made.	

 This will allow other developers inside and outside the project a chance to better understand your project and what to expect in communication with you.

## Issue tracker management

Expanding on issue tracking from previous sections, the more control over issue tracking you have, the better. Aside from being able to mark an issue as publicly or privately available, there are a few other tools that should be useful such as: 

* Assigning an issue to an individual developer or a small group of developers.	

 * Discussions about an issue.	

 * Code tracking for an issue.

## Up and down stream communications

Communication with up and down stream folks can share findings with bugs easier. For upstream communication, look to communication with any tools required to build the source and be able to communicate with the stakeholders of the project. For downstream work, having multiple ways for folks to reach the team should be available. Internet Relay Chat, or IRC, and mailing lists are common tools as of this writing. These tools allow a live chat in IRC between developers and even between developers and users to help debug their system. Mailing lists are popular to announce releases and for archived communication. In a few cases, a blog can be nice to share what can be done with the project to get folks interested or to share new ways the project is being used.

## Architectural Concerns

Deciding where data and structures end up should be worked out early in the design process. This is due to making such changes later in the process can be very difficult to implement. The process should start with sitting down with the developers, system administrators, and any major customers to decide what the inputs are, what the outputs are, and what limitations the software needs to meet. Then, it is possible to decide how to store and access the data. Data storage can be limited by what supporting systems are and are not allowed on a machine that will run the software. You may even be limited in terms on data is gathered from the outside world. When processing data, you may be on a slow machine in a closet, on multiple high-end machines, or somewhere in between. Knowing what limits there are can guide how the software is designed.

## Adding security exercises

Having security programming excesses will help your developers think better on designing and writing code. Having an environment where trying different things and breaking them can help them write better software in the long run. Looking at simple code examples everyone can learn and understand quickly and then learning how they can be exploited, followed by how to rewrite the code to prevent an attack can go a long way with developers.
