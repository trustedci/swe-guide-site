<!--
.. title: LEVEL 4: SOFTWARE ENGINEERING FOR HIGH-RELIABILITY CI
.. slug: level-4
.. date: 2019-04-12 15:21:19 UTC-04:00
.. tags: 
.. category: TrustedCI Software Engeneering Guide security policy
.. link: 
.. description:TrustedCI Software Engeneering Guide Level 4 Security policy.  Security policy should consider how the software could affect other software.
.. type: text
-->

Before continuing on to this chapter, please review the previous chapters, for we will be building on it. In this chapter, we will cover: 

* Next iteration on policy

* Adding static analysis, when available, to testing process

* Winning the expectations game

* Formal change reviews

* Maturing security exercise programs

* Release cycle management

* Understanding downstream to ultimate deployments

### Next iteration on policy

By this point, the security policy should consider how the software could affect other projects. If the data produced is wrong in any way, then others won't trust the data or even the software that created the data. There should also be a team deadicated towards putting policies into place based on current standards. This way, the other teams can focus on their own work and have one place to get policy information from.

### Adding static analysis, when available, to testing process

By this point, static analysis should be added whenever possible to the testing process. This is a process that happens without actually compiling or running any code to find any possible bugs or vulnerabilities. Tools used for static analysis should be available to automatically review your code.

### Winning the expectations game

Having a set of expectations will help keep the team sane and motivated, which helps keeping the project on schedule. Things that help is communicating with members of the team on items such as:

* Where they are with their goals.

* What tools a member needs to do their job.

* What assistance a member needs to solve an issue.

These topics are best discussed during [One-on-One (o3) meetings](https://blog.impraise.com/360-feedback/1-on-1s-for-engaged-employees-how-good-managers-should-do-them-performance-review). This allows for a low pressure and open discussion time without any peer pressure from others.

Regular communication with the client on what their needs are and what the project status is. This allows the client to stay happy and involved enough to know the developers are going in the right direction.

### Formal change reviews

Formal reviews of software are useful, especially early in the cycle of adding or removing a feature. Once the feature is planned and added or removed, a request should be sent out to the team. Each member working on the review should be given everything associated with the feature change. They should make notes on any issues they find, as well as making a note on things they feel is well put together. After all participating members have their notes together, a meeting should be held to discuss what issues they have and how to fix it. This is also a good time to complement another developer on work you find to be of high quality. This is a process that can weigh heavily on one's mind, so complements on the code can go a long way. This can also give more junior members a chance to learn what is and is not effective work. After the meeting, the original developer or developers of the feature change makes additional changes based on the outcome of the meeting. After applying these changes, follow up with the notes and other developers that were in the review process to verify all the changes were met.

### Maturing security exercise programs

As the project grows, so does the attack surface of your code base. With that, hardening the security of the code base becomes increasingly important. The big area to think about is where can a user give bad data to do something the program is not designed to do. A few questions to think about include:

* How sure of the data being passed into a function is valid?

* Is all user input scrubbed?

* How sure are you the data is valid you want to process?

* When adding data to the data set, can it damage other data around it?

### Release cycle management

Release cycle management is simply a process for deciding when new features are added and considered stable. Several folks, or even teams on large projects, should have input on the process. The code needs to be well tested with the rest of the code base, the documentation needs to be written for the new feature, and the code itself should be reviewed. In addition to any new features, any bug fixes between the current release and the next planned release should be included. If there are a lot of bug fixes since the last release, it may make sense to do a release with just bug fixes. This makes it easier for the end user to patch their code. Since time will be spent helping others apply patches, the time it takes to help apply those patches should be weighed against the time to do a release with just the patches included. If time is saved, it is worth sending out a release with those patches.

### Understanding downstream to ultimate deployments

Your work may be used for bigger projects downstream of what your project is doing. You may have a feature that people really like and want to use. This is a great thing and can become a great ally or a nightmare depending on how you understand how your work affects other projects downstream of you. Your entire project may even be used by others if allowed. Having a way for users to talk about how they are using your project is a solid starting point. The communication for the user base should include a way that you and the users have a way to see historical communication. This lets the users search for their question and see if it has been answered before. It also allows you to see what people struggle with the most, what others enjoy the most, and possibly what is not used. This can give you an eye into things that could be cleaned up either in the user interface, algorithms, or even the documentation. Understanding how the software is used downstream also will let you decide how functions return data. If an API returns so much data in a poor format, no one will want to use it because it is too difficult to parse what they want. However, if folks are stating they enjoy format XYZ, keep to that format in your API as much as possible.
