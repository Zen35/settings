# Contributing

This is the contribution guide for Any JS. It contains commands, practices, and processes for
writing code and operating our product. Please read this from top to bottom before hacking on
the code base!


## Setting Up

### Setup Your Shell

- Add git aliases and tab completion. This will save you many MANY key strokes!
    - You'll need to set up bash/zsh aliases [like so](https://github.com/Zen35/settings/blob/master/.profile) in addition to
      setting up your `.gitconfig` [like so](https://github.com/Zen35/settings/blob/master/.gitconfig#L13)
    - For tab completion, copy [this](https://raw.githubusercontent.com/Zen35/settings/master/git-completion.bash) to your home dir.

## Writing Code

### Our Branching Strategy

- Checkout Release-XXXX
    - Determine what sprint you're in and checkout said sprint's release branch.
    - At the time of this writing, we're working out of FOO branch
- Figure out what you'll be working on in JIRA
- Create a feature branch
    - Name the branch like so <mmdd-FEATURE_DESCRIPTION>
    - e.g. 0408-IntegrateWithJSLint
- Hack!
    - Commit your changes frequently.
    - Each commit should be small and semantically coherent.
        - Use `git add -p` to add only the chunks that are semantically appropriate to what you're going to commit.
        - Each commit title should be 50 characters or fewer and there should be no trailing punctuation!
        - Additional comments regarding the commit can go on the 3rd line or later.
- Verify your code. (See below)
- Update the `CHANGELOG.md`.
- Send out a pull request.
    - Make sure to push your feature branch to the remote first.
        - `git push -u origin <BRANCH>`
    - Post a code review via the commandline.
        - As a convenience, please list what branch is merging into what, and please provide a link to code so
          review can go commit by commit.
            - See my commit-by-commit post
- Respond to comments and get sign off.
- Merge your feature into the release branch.
    - `git checkout release-mmyy && git merge --no-ff --no-commit mmddyy-FEATURE_DESCRIPTION`
    - Resolve any merge conflicts.
    - Check in the merge.
- Push the updated release branch to origin.
- Congrats! You're done!


## Writing Tests

- All tests are in the `rails-root/spec` directory (with javascript folder for all js tests)
- Tests use Teaspoon, Jasmine, PhantomJS to run (we use Jasmine 1.3 because Teaspoon+Istanbul depend on it)
- The fastest way to run the tests is with the Jasmine rake task `rake spec:javascript`
- Docs on Jasmine 1.3 are [here](http://jasmine.github.io/1.3/introduction.html)
- Watch your tests pass while authoring new ones (also useful for debugging):
    - `rails s` will run the server in test mode
    - Open a browser window with: `<your-host>:3000/teaspoon/default`
    - Install an auto-refresh extension in the browser and have it set to an appropriate value (5-10s)
- To run using Teaspoon: `rake teaspoon` (but it is slower than jasmine alone)
    - Teaspoon generates coverage with Istanbul (coverage reports inline rake and `rails-root/coverage`)
    - Do NOT allow coverage to be lower with your commit!
 
## Verifying Code

- Manually test your code
    - You can use query params to override endpoints if need be.
    - You can use query params to spoof the user making a request.
- Run unit tests
    - HINT: alias acr='rake autocr'
        - Master AutoCodeReview Rake Task that does all the automated process in one step
    - Rake tasks (Preferred method)
        - IMPORTANT: make sure to set RAILS_ENV=test before each of these commands or they will fail
        - Tests are in the namespace :spec (you can see them with `rake -T`
        - Run all tests as validation `rake spec:all`
        - You can run just ruby or just javascript: `rake spec:javascript`, `rake spec:ruby`
    - Javascript
        - Javascript tests can also be run from the browser, follow these steps to see them via that method
        - Run `rails s`.
        - Navigate to http://FOO.com:3000/teaspoon/default.
    - Ruby/Rspec
        - To run rspec directly, run `rspec'
        - add the flags f and d if you would like to see more output
        - Ensure test running time is not inflated significantly (deploy/build time matters!)
- Run JSLint
    - Run `rake jslint`.
    - Ensure there are no lint errors.
- Run through the manual test cases in `docs/testing.md`
    - This is our test plan document and is a non-automated way to give us more
      confidence that we're not breaking UX functionality.

## Releasing

### Normal Release

We do this typically at the end of the month when we're ready to try to release to production.

- Ensure any hotfixes are checked back into master.
- Check `release-todo.md` to ensure you understand all non-code changes required.
- Merge the release branch into master
    - As above, do this with a '--no-commit' flag so that you can verify the code first.
    - Handle merge conflicts.
    - Verify the branch (like above)
    - Commit!
- Pipelines should take care of creating a build and deploying to Beta.
- Work with the team to perform all verifications necessary before promoting the release candidate.
- Always retroactively tag a release candidate commit with a release tag.

### Hotfix

- Performing a hotfix requires great care. You don't have the benefit of submitting
  code through integration and for validation testing.
- Determine how you will hotfix.
    - Consult with your lead and team members. Remember, site integrity is essential, so always prioritize that
      over the desire to get changes out quickly.
- Checkout the code that's in prod.
    - This *SHOULD* be what's in master.
        - If we're releasing, then master will be tied up because of our pipeline.
        - If that's the case, the fix branch should have the changes that are in prod.
    - Verify you checked out the right code by looking at what's actually deployed.
- Write your code.
- Verify your code. (See above)
- Get an over the shoulder code review.
- Check your code into gitfarm.
- Create a tag for your hotfix and push it to the remote.
    - The tag will be called 'hf-mmyy-ver'
    - e.g. `git tag hf-0314-1 -m "hf-0314-1" && git push origin hf-0314-1`
- Send out a review to the team.
- Get a ship it and deploy the fix version set directly to the prod stage.
- Watch the deployment to make sure it goes through successfully.
- Verify the functionality is fixed in production.
- Congrats! You're done!


## Troubleshooting
