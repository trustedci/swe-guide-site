[] Development status
[] License

There are many options for revision control and they change often. There are several items to look for when deciding on which revision control tool to use:
* Symantic versioning
* Ease of use for:
	* tracking bugs
	* tracking changes
	* Independent builds for stable vs. testing.
* Access control

Documenting everything as your project is built saves a lot of fustration down the road. Anyone, yourself included, should be able to build and run your code with the correct results by reading the documentation and using the tools provided. This includes documenting what tools and development libraries that are used; using a build tool such as make or waf; and default config file.  Default config files should have a short description of each variable and a default value assigned to the variable. If the variable has only a few options, such as a true/false flag, having the variable with each flag in place with one commented out is a good idea. This makes it easy for the end user to switch between the two by commenting and uncommenting the appropriate value. Documentation can also help a lot with maintaining current development status reports and changelogs.

Revision control can also help you greatly with maintaining a solid changelog. If the team creates good commit messages, creating a changelog could be as easy as collecting the commit messages with the file(s) changed, author of the changes, and a time stamp. This becomes very useful when writing the report of what changed between two releases of the software or when checking off what bugs have been fixed. The changelog is going to be one place people look to in verifying your changes to the software and if they should grab the new version of the code.

Development status updates play a key role with any project. If you are are working on a project with more than one developer, being able to keep everyone on the same page is important. Issue and bug trackers should be used so you can triage what the most important fixes are and what features someone may want. It will also give a searchable data set for issues that have may be fixed already. This can be helpful for a user who is running a version of your software and needs to argue to his or her boss to get the newer version of the software if it clearly shows that their issue is fixed.

Build infrastructures play a key role with being able to reproduce how your code was built. It specifies how to compile each file and where to put the binary files when built. Not only will a good build infrastructure build the system for other folks, it quickly makes things easier for you when testing some changes. This is due to the idea of creating something once, testing and fixing until it works, then reusing often. This not only reduces human errors by having a known good build process, but also reduces fustration with finding build errors. A good build infrastructure will list each step it does and any errors or warnings it finds. Directing a copy of this to a file to review when the build fails will make finding the issue easier. Some build systems, such as make, will drop you into the file at the line it found the first error when you call it from the editor.
