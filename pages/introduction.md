<!--
.. title: Introduction
.. slug: introduction
.. tags: TrustedCI Software Engineering Guide introduction
.. category: 
.. link:
.. pretty_url:
.. description: TrustedCI Software Engineering Guide introduction.
.. type: text
-->

## Introduction 

We all want software to have fewer vulnerabilities.  There are many [excellent resources](https://research.cs.wisc.edu/mist/SoftwareSecurityCourse/) out there on secure coding, some [specifically written for science and CI audiences](https://static1.squarespace.com/static/5047a5a6e4b0dcecada15549/t/5638f207e4b0476111ac2b56/1446572551987/MillerHeymann_VulnerabilitiesThreatsAndSecureCodingPractices_NSF+Summit+2015.pdf).  So why isn't our code secure yet?

Programmers don't generally get up in the morning and decide to write the worst possible code (except for you folks working in [INTERCAL](http://www.catb.org/~esr/intercal/)--you know who you are).  Programmers tend to write the best code that they think they can, given the conflicting pressures that they are under, their skills and knowledge, the resources at hand, and the quality of their tools.  One piece of improving this picture is teaching secure coding practice, as that can help with the skills and knowledge of the programmers.  Fixing conflicting pressures, perverse incentives, and resourcing issues are management issues and beyond the scope of this document.  What we'll cover here is a third, crucial piece of the puzzle: **ensuring that the tools and engineering practice surrounding a software development project are sufficient to make it practical, or at least possible, for programmers to do the right thing most of the time**.

While it's true that there is such a thing as *too much* tooling and process around a software project, *not enough* is at least as dangerous.

### Using this Guide

This guide is broken into five levels.  Each level of practice is intended for a different scale and complexity of software project, and is inclusive of the levels below it.

<dl>
  <dt><strong>Level 1: one-off experiments</strong></dt>
  <dd>This level is what you need for a piece of software used offline by its own developer to do an episodic task (a purpose that goes away when its research is complete).  The primary security concerns for this software aren't about robustness under attack: they are about the future reproducibility of the research.</dd>
  <dt><strong>Level 2: small distributed software projects</strong></dt>
  <dd>By combining the practices in levels 1-2, you get the software engineering practice needed to manage a software project that is used and/or developed by multiple people.  This software will share the integrity concerns of level 1 software, but also need some practice in place to reduce the number of security vulnerabilities potentially introduced by communication mishaps, or the necessity of pushing software back and forth between developers and/or users.</dd>
  <dt><strong>Level 3: general software in support of science</strong></dt>
  <dd>If you aren't certain what level your software falls at, it's probably this one.  Level 3 software is *most* cyberinfrastructure software out there, as well as widely distributed scientific software that is not itself infrastructure.  If your software is distributed to many users for their own use, or is a component of an online service, but doesn't qualify for levels 4-5, it falls in our Level 3. Apply practices from levels 1-3 in this case.</dd>
  <dt><strong>Level 4: high-reliability or networked CI software</strong></dt>
  <dd>Examples of high-reliability or networked CI software include many components of science gateways, Open Science Grid, ESnet, and similar projects.  Level 4 in our software model is something that, in the event of a security failure, could negatively impact the security or operations of multiple science organizations.  If you aren't certain whether your project falls at level 3 or 4, ask yourself "if this has a catastrophic vulnerability, is that an inconvenience for people outside our dev team, or the source of a confidential data breach or security incidents impacting other orgs?"  If someone other than you may have a security incident, for example because your software is part of an internet-connected service that they run, or you are hosting confidential datahosting confidential data, you have reached level 4, and need to apply practices from levels 1-4. </dd>
  <dt><strong>Level 5: critical infrastructure software</strong></dt>
  <dd>Critical infrastructure software, for our purposes, is anything that handles regulated data, that has a possible failure mode which can cause danger to life and limb, or that handles a critical security function in a way that may be leveraged by other software.  So, for example, your generic authentication library definitely qualifies, because it could be incorporated into a wide range of code bases.  A service which handles HIPAA or CUI data qualifies.  The authentication function in a demo sandbox server which is wiped and re-imaged every hour probably doesn't qualify.  Level 5 software should benefit from all recommendations in levels 1-5.</dd>
</dl>
