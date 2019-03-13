[x] Review of Level 1-2 requirements.
[x] Revision Control and least privilege
[] Next iteration on policy, including coding standards
[] Automated and manual testing requirements
[] Automated builds
[] Development documentation
[] Issue tracker management
[] Up and down stream communications
[] Architectural Concerns
[] Adding security exercises

Please start by reviewing the requirements in Levels 1 and 2. They will be built upon in this section.

Regardless of which revision control system you go with, having the ability to control what kind of privilages a person will have. If it is a project in which you will release the source code to the general public, the general public should only have permission to get a copy of the code, but not push changes directly back to the project. If a new person wants to submit a patch, have them send the patch to someone on the project to review it and make sure it meets the project guidelines. This allows for two things to happen. First, it will let you to continue getting patches from the general public and knowing they meet the guidelines. Second, it will build a little trust between the new person and the people on the project. If the person continues to send good patches, you might be able to grant them more permissions. For the folks actively working on the project, they should have permissions to push changes to their area of the project. If a project has a client and a server element to it, each element should be in it's own revision control sandbox. However, the developers should not have privilages to totally destroy the project. Then, each project should have two or more project owners. This should prevent a situation known as "hit-by-a-bus", where the only person who has ownership cannot work on the project for any reason, ranging from home with the flu to being indeed hit by a bus and is in the hospital, or worse, the moruge.
