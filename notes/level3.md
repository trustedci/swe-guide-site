[x] Review of Level 1-2 requirements.
[x] Revision Control and least privilege
[] Next iteration on policy, including coding standards
[x] Automated and manual testing requirements
[x] Automated builds
[] Development documentation
[] Issue tracker management
[] Up and down stream communications
[] Architectural Concerns
[] Adding security exercises

Please start by reviewing the requirements in Levels 1 and 2. They will be built upon in this section.

Regardless of which revision control system you go with, having the ability to control what kind of privilages a person will have. If it is a project in which you will release the source code to the general public, the general public should only have permission to get a copy of the code, but not push changes directly back to the project. If a new person wants to submit a patch, have them send the patch to someone on the project to review it and make sure it meets the project guidelines. This allows for two things to happen. First, it will let you to continue getting patches from the general public and knowing they meet the guidelines. Second, it will build a little trust between the new person and the people on the project. If the person continues to send good patches, you might be able to grant them more permissions. For the folks actively working on the project, they should have permissions to push changes to their area of the project. If a project has a client and a server element to it, each element should be in it's own revision control sandbox. However, the developers should not have privilages to totally destroy the project. Then, each project should have two or more project owners. This should prevent a situation known as "hit-by-a-bus", where the only person who has ownership cannot work on the project for any reason, ranging from home with the flu to being indeed hit by a bus and is in the hospital, or worse, the moruge.



As discussed in earlier sections, having test cases is important. Usually these tests were run manually by running a binary with those test cases. This is still useful for any changes you make in the code to make sure your changes don't make something else fail elsewhere in the code. As the project grows, so do the number of tests. Eventually, you will want to have these test automated when you check in your code. The version control software used should allow for running all the tests for the entire code base when new code is added. Tests for any code you modified should be run manually, especially if you are updating the logic of a function. This way you can avoid the most common test failures: the code you just modified.

Building your source code automatically will make life easier for you and your target users when you have more than a couple files and want some compiling flags to be added in certian conditions, such as compiling test cases. The tool you decide to go with should allow options to be set and then used throughout the rest of the tooling. This way you can specify the correct compiler, the correct options, and the output of the build. Breaking down the build process into logical groups also helps a lot. For example, if compiling a C or C++ program, compile the object files first, then compile the object files into the final binary. Breaking things into groups like that will allow you to find some bugs at compile time because it makes it easier to see where the build fails and you don't have to compile each file manually.

Development documentation is important for aiding other developers on the workings of your code. Unlike user documentation such as a Quick Install Guide and a README, development documentation dives deeper into the project. These documents should include topics that cover fixing issues, naming conventions within the code, where to send a bug report, and what assumptions were made. This will allow other developers inside and outside the project a chance to better understand your project and what to expect in communication with you.
