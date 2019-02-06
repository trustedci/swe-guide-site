<!--
.. title: Engineering Software for Science Guide Outline
.. slug: outline
.. date: 2017-12-11 14:39:19 UTC-05:00
.. tags: 
.. category: 
.. link: /outline.html
.. description: 
.. type: text
-->
### Trusted CI SWE Guide
1. Introduction
	1. Benefits to science
		1. Reproducibility
		2. Integrity / Trustworthiness
		3. Sustainability
	2. Software Security Concepts
		1. Software made for real-world requirements
		2. ISPPs
		3. Scientific Software Lifecycles
2. Software Development Programs:  How enabling people enables secure and robust code.
	1. Factors impacting the maturity of a software development program
		1. Policy: ad hoc process vs. carefully defined and documented
		2. Communication with internal and external stakeholders
		3. Resources, tools, and expertise
		4. Consistency
	2. Software program maturity: how much rigor is enough?
		0. Do nothing.
		1. Science as software (as opposed to software for science) and one-off proofs-of-concept
		2. Lowest-rigor CI software, or Science software which may be maintained or used by more than its original author.
		3. Most CI software, or any Science Software which is trying to get community contributions.
		4. CI software which performs security functions (such as authorization or authentication) or which must support a broad range of deployments and integrations.
		5. Critical software, such as that doing particularly high-stakes research (e.g. some information security research, distributed handling of PHI) or with high assurance requirements (e.g. highly classified research)
	3. Spinning up a new software development program
	4. Maturing an established software development program
3. Level 1: the minimally functional program
	1. Revision Control
	2. Documenting Dependencies and build process
	3. Build infrastructure
	4. Changelog
	5. Development status
	6. License
4. Level 2: Basic Software Engineering Practice
	1. Review of Level 1 requirements.
	2. Use of revision control
	3. Semantic Versioning
	4. Distributing software
	5. Code signing
	6. Basic security policy, including vulnerability management
	7. Dependency selection
	8. Succession
	9. Issue tracker
	10. Testing
5. Level 3: Software Engineering for Software Supporting Science Projects
	1. Review of Level 1-2 requirements.
	2. Revision Control and least privilege
	3. Next iteration on policy, including coding standards
	4. Automated and manual testing requirements
	5. Automated builds
	6. Development documentation
	7. Issue tracker management
	8. Up and down stream communications
	9. Architectural Concerns
	10. Adding security exercises
6. Level 4: Software Engineering for high-reliability CI
	1. Review of level 1-3 requirements
	2. Next iteration on policy
	3. Adding static analysis, when available, to testing process
	4. Winning the expectations game
	5. Formal change reviews
	6. Maturing security exercise programs
	7. Release cycle management
	8. Understanding downstream to ultimate deployments
7. Level 5: Software Engineering for Critical CI
	1. Review of level 1-4 requirements
	2. Next iteration on policy
	3. Adding external reviews
	4. Architectural review as a cyclical process
8. More tools and processes
	1. Code triage
	2. Planning a major refactor
	3. Code Metrics
9. Tying it all together.
