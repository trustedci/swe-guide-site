<!--
.. title: MORE TOOLS AND PROCESSES
.. slug: tools
.. date: 2019-04-12 15:21:19 UTC-04:00
.. tags: TrustedCI Software Engeneering Guide Triaging code metrics major refactor
.. category: 
.. link: 
.. description:TrustedCI Software Engeneering Guide Level 6. This Chaper covers  Triaging code, Code metrics, and  major refactor
.. type: text
-->

There are a few items that fit into multiple of the earlier chapters, so we will cover them here since they do not change between different levels we talked about earlier. They are:

* Code Triage

* Planning a major refactor

* Code metrics

### Code Triage

Triaging code that is wildly out of date can take a lot of time and energy that usually requires a strong core team to tackle. It is a challenge that one cannot dive feet first into with little to no planning. First, one needs to understand what the software is suppose to do and how it is achieving that goal. Reading through documentation, reading test cases, and getting a solid idea of how the code is laid out is a good starting point.

Once the code has been reviewed, issues should start popping out. Look for issues such as:

* Similar code blocks that can be placed into a function.

* Poor variable names.

* Long functions.

* Out of date programming practices.

As you start seeing some of the major issues, smaller issues can pop up that you didn't see earlier. This is okay, it is part of the process. It is best to find the issues early so that fixing them will be easier in the long run.

### Planning a major refactor

Running a major refactor requires some solid planning. 

* Code triage 

* Communication

* Breaking the refractor into smaller peices 

* Running tests 

###  Code Metrics

Code metrics add a useful element to the development process to track how complex the code is in terms of readability of the code or in the complexity of an algorithm. Metrics that are tracked can include the simple lines of code count, how many languages used in a project, and file meta data. More complex metrics include how easy the code can be maintained, the readability of the code, and how interlinked code modules are.
