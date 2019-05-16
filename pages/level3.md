<!--
.. title: LEVEL 3: SOFTWARE ENGINEERING FOR SOFTWARE SUPPORTING SCIENCE PROJECTS
.. slug: level-3
.. date: 2019-04-12 15:21:19 UTC-04:00
.. tags: 
.. category: 
.. link: 
.. description: 
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

### Revision Control and least privilege

When it comes to privilege on the code base, the least amount of privilege a user needs is best. One would not want Joe D. Random to blow away the entire project. It is best to be as restrictive as needed:

* Everyday users should have read access only. They need to be able to grab a copy of your code and work with it locally.

* Project developers should be able to write to the repository, but not necessarily to the master branch. This way errors are less likely to make it out to everyone.

* Team leads should have access to all the code branches and be able to push to the master branch when the developers have made changes that meet the quality required for the projects. Team leads should be able to add and remove developer access as well.

* Project owners should have the ability to do anything and everything with the project, including blowing everything away.

This is a basic guideline and folks may have more privilages as required. There should be multiple people on each level so that if one person is unable to perform their duties, another can step in and the project does not grind to a hault.


### Next iteration on policy, including coding standards

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


### Automated and manual testing requirements

As discussed in earlier sections, having test cases is important. Usually these tests were run manually by running a binary with those test cases. This is still useful for any changes you make in the code to make sure your changes don't make something else fail elsewhere in the code. As the project grows, so do the number of tests. Eventually, you will want to have these test automated when you check in your code. The version control software used should allow for running all the tests for the entire code base when new code is added. Tests for any code you modified should be run manually, especially if you are updating the logic of a function. This way you can avoid the most common test failures: the code you just modified.

### Automated builds

Building your source code automatically will make life easier for you and your target users when you have more than a couple files and want some compiling flags to be added in certain conditions, such as compiling test cases. The tool you decide to go with should allow options to be set and then used throughout the rest of the tooling. This way you can specify the correct compiler, the correct options, and the output of the build. Breaking down the build process into logical groups also helps a lot. For example, if compiling a C or C++ program, compile the object files first, then compile the object files into the final binary. Breaking things into groups like that will allow you to find some bugs at compile time because it makes it easier to see where the build fails and you don't have to compile each file manually.

### Development documentation

Development documentation is important for aiding other developers on the workings of your code. Unlike user documentation such as a Quick Install Guide and a README, development documentation dives deeper into the project. These documents should include topics that cover fixing issues, naming conventions within the code, where to send a bug report, and what assumptions were made. This will allow other developers inside and outside the project a chance to better understand your project and what to expect in communication with you.

### Issue tracker management

Expanding on issue tracking from previous sections, the more control over issue tracking you have, the better. Aside from being able to mark an issue as publicly or privately available, there are a few other tools that should be useful. First, being able to assign an issue to an individual developer or a small group of developers. This gives the person who submitted the issue someone to directly contact to get a status report. It also gives the Project Manager an idea of who is doing what and who is tackling what issues. Another useful feature to look at is the ability to have discussions related to changes of an issue. If a change to solve an issue creates an issue in some other area of the program, the two groups of developers need to work out that new issue together to satisfy the solution of an issue without causing issue elsewhere. Another useful tool will be to have quick one or two word status reports to indicate where the code stands, such as "in progress", "needs assignment", "on hold", "testing", or "fixed in patch X.Y.Z".

### Up and down stream communications

Communication with up and down stream folks can share findings with bugs easier. For upstream communication, look to communication with any tools required to build the source and be able to communicate with the stakeholders of the project. For downstream work, having multiple ways for folks to reach the team should be available. Internet Relay Chat, or IRC, and mailing lists are common tools as of this writing. These tools allow a live chat in IRC between developers and even between developers and users to help debug their system. Mailing lists are popular to announce releases and for archived communication. In a few cases, a blog can be nice to share what can be done with the project to get folks interested or to share new ways the project is being used.

### Architectural Concerns

Deciding where data and structures end up should be worked out early in the design process. This is due to making such changes later in the process can be very difficult to implement. The process should start with sitting down with the developers, system administrators, and any major customers to decide what the inputs are, what the outputs are, and what limitations the software needs to meet. Then, it is possible to decide how to store and access the data. Data storage can be limited by what supporting systems are and are not allowed on a machine that will run the software. You may even be limited in terms on data is gathered from the outside world. When processing data, you may be on a slow machine in a closet, on multiple high-end machines, or somewhere in between. Knowing what limits there are can guide how the software is designed.

### Adding security exercises

Having security programming excesses will help your developers think better on designing and writing code. Having an environment where trying different things and breaking them can help them write better software in the long run. Looking at simple code examples everyone can learn and understand quickly and then learning how they can be exploited, followed by how to rewrite the code to prevent an attack can go a long way with developers.
