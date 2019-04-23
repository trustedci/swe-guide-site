<!--
.. title: LEVEL 4: SOFTWARE ENGINEERING FOR HIGH-RELIABILITY CI
.. slug: level-4
.. date: 2019-04-12 15:21:19 UTC-04:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
-->

Be sure to review the requirements of levels 1 through 3 before continuing here. We will be building on what was talked about in those sections.

Need content on policy next iteration. Will need to speak with Susan on that -KSW

By this point, static analysis should be added whenever possible to the testing process. This is a process that happens without actually compiling or running any code to find any possible bugs or vulnerabilities. Tools used for static analysis should be available to automatically review your code.

Any solid team needs to have expectations of it's members in order to work well together and succeed at a goal. When the goal of a team is writing a piece of software, these expectations can play a big part in not only if the project succeeds or not, but even if the company continues to do well or if it has to shut it's doors. Each person working on the team should know what their roles are, the importance of each role, and how to communicate with others on what the status is. How the team works together on a day to day basis can be the difference on expectation management and winning the game. If two team members are always at each other throats, not only will they not work well together to meet expectations, but it puts a drain on the rest of the team's expectations. No one wants to upset another person if they worry that other person is going to get angry at them. This becomes an even larger issue if the project lead is easy to anger or does not communicate expectations well. While not everyone on the team should be friends outside of the office, there should be enough friendly communication during the working hours. A little humor here can go a long way. Each team member needs to have a set of expectations for what they are responsible for on an individual level and on a team-wide level. How should the team handle bug reports that contain a new vulnerability? Who can know about new features at what point? Who is responsible for public relations?

Formal reviews of software are useful, especially early in the cycle of adding or removing a feature. Once the feature is planned and added or removed, a request should be sent out to the team. Each member working on the review should be given everything associated with the feature change. They should make notes on any issues they find, as well as making a note on things they feel is well put together. After all participating members have their notes together, a meeting should be held to discuss what issues they have and how to fix it. This is also a good time to complement another developer on work you find to be of high quality. This is a process that can weigh heavily on one's mind, so complements on the code can go a long way. This can also give more junior members a chance to learn what is and is not effective work. After the meeting, the original developer or developers of the feature change makes additional changes based on the outcome of the meeting. After applying these changes, follow up with the notes and other developers that were in the review process to verify all the changes were met.

As the project grows, so does the attack surface of your code base. With that, hardening the security of the code base becomes increasingly important. The big area to think about is where can a user give bad data to do something the program is not designed to do. A few questions to think about include:

* How sure of the data being passed into a function is valid?

* Is all user input scrubbed?

* How sure are you the data is valid you want to process?

* When adding data to the data set, can it damage other data around it?

Release cycle management is simply a process for deciding when new features are added and considered stable. Several folks, or even teams on large projects, should have input on the process. The code needs to be well tested with the rest of the code base, the documentation needs to be written for the new feature, and the code itself should be reviewed. In addition to any new features, any bug fixes between the current release and the next planned release should be included. If there are a lot of bug fixes since the last release, it may make sense to do a release with just bug fixes. This makes it easier for the end user to patch their code. Since time will be spent helping others apply patches, the time it takes to help apply those patches should be weighed against the time to do a release with just the patches included. If time is saved, it is worth sending out a release with those patches.

Your work may be used for bigger projects downstream of what your project is doing. You may have a feature that people really like and want to use. This is a great thing and can become a great ally or a nightmare depending on how you understand how your work affects other projects downstream of you. Your entire project may even be used by others if allowed. Having a way for users to talk about how they are using your project is a solid starting point. The communication for the user base should include a way that you and the users have a way to see historical communication. This lets the users search for their question and see if it has been answered before. It also allows you to see what people struggle with the most, what others enjoy the most, and possibly what is not used. This can give you an eye into things that could be cleaned up either in the user interface, algorithms, or even the documentation. Understanding how the software is used downstream also will let you decide how functions return data. If an API returns so much data in a poor format, no one will want to use it because it is too difficult to parse what they want. However, if folks are stating they enjoy format XYZ, keep to that format in your API as much as possible.
