<!--
.. title: LEVEL 6: MORE TOOLS AND PROCESSES
.. slug: level-6
.. date: 2019-04-12 15:21:19 UTC-04:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
-->

Triaging code that is wildly out of date can take a lot of time and energy that usually requires a strong core team to tackle. It is also a challenge that one cannot dive feet first into with little to no planning. First, one needs to understand what the software is suppose to do and how it is achieving that goal. Reading through documentation, test cases, and getting a solid idea of how the code is laid out is a good starting point. Secondly, adding test cases wherever they are needed should be done. Test cases not only give the developers a good idea of what is going on, but provides the groundwork for the refactor later down the road.

Running a major refactor requires some solid planning. It starts with doing code triage, as mentioned earlier. This will give the developers working on the refactor a good foundation to do the refactor. Secondly, communicating with the team that had created the code you are now refactoring will give some insight to the project. Some wisdom gained includes what the struggles were, what old user interactions were, and why things are the way they are. Next is breaking the refactor into smaller pieces that can be easily managed in one or two days. This will be allow to see things progress and the developers will feel less overwhelmed. Lastly, refactor the code running the tests early and often to make sure features are not added or removed. New features are nice, but do not belong in a major refactor. Make note of them and add after the refactor!

Code metrics add a useful element to the development process to track how complex the code is in terms of readability of the code or in the complexity of an algorithm. Metrics that are tracked can include the simple lines of code count, how many languages used in a project, and file meta data. More complex metrics include how easy the code can be maintained, the readability of the code, and how interlinked code modules are.
