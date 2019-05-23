<!--
.. title: LEVEL 5: SOFTWARE ENGINEERING FOR CRITICAL CI
.. slug: level-5
.. date: 2019-04-12 15:21:19 UTC-04:00
.. tags: TrustedCI Software Engeneering Guide 
.. category: 
.. link: 
.. description:TrustedCI Software Engeneering Guide Level 5. Policy should be looking at large organizations who use many pieces of software to work towards it's goal. 
.. type: text
-->

Be sure to review the requirements of levels 1 through 4 before continuing here. We will be building on what was talked about in those chapters. In this chapter, we will cover:

* Next iteration on policy

* Adding external reviews

* Architectural review as a cyclical process

### Next iteration on policy

At this point, the policy should be looking at large organizations who use many pieces of software to work towards it's goal. It should include things such as:

* how to deal with attacks on the services

* public interaction

* what software the organization is okay with running.

There should also be a set of goals that the organization works towards. For example, the [Open Science Grid (OSG)] (https://opensciencegrid.org/) "provides common service and support for resource providers and scientific institutions using a distributed fabric of high throughput computational services."

### Adding external reviews

External reviews, or audits, examins everything related to a project to make sure it is held to the standards given for the project. This can cover items such as:

* Process of software development.

* Contractual agreements are being met.

* How sensitive data (such as [HIPAA](https://www.hhs.gov/hipaa/index.html)) is handled.

Since the review process is done by a party outside of the organization, it can be used to help build trust within the community. The reviewing organization should be one that is well trusted in the community.


### Architectural review as a cyclical process

By this point, any software being developed is going to be getting regular updates to it. The cyclical process should be a set of steps that all changes go through. For example, a change should go through:

* A design phase. This should be focusing on what the changes should be and how to approch implementing the changes.

* A coding phase. Here, test cases and actual code for the change should be implemented according to the designs chosen earlier.

* A testing phase. The tests run here should be focused on how the changes will affect the project as a whole.

* And finishes with a review phase. This should be looking at the test results and making any tweaks as required.

This will allow any major change be well documented and thought out to make sure the software remains of high quality.
