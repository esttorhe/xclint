# Releasing xcodeprojlint

In this documents you'll find all the necessary steps to release a new version of `xcodeprojlint`.

> Although some of the steps have been automated, there are some of them that need to be executed manually.

1. First of all, create a new release branch with the following name `release/x.x.x` where `x.x.x` is the new version that is going to be released.
2. Update the `CHANGELOG.md` adding a new entry at the top with the new version. The new entry should include all the changes in the new version, mentioning the people involved in these changes, and the issues that were closed with those changes. Commit the changes in `CHANGELOG.md`.
3. Validate the state of the project by executing `bundle exec rake ci`
4. Generate the release with `bundle exec rake release`.
5. Create a new release on [GitHub](https://github.com/carambalabs/xcodeprojlint) including the information from the last entry in the `CHANGELOG.md` and attach the file `xcodeprojlint.tar.gz` that has been generated in the previous step.
6. Close the GitHub Milestone associated to that release and open a new one for the next release.
7. Update `xcodeprojlint` formula on the [Caramba Tap](https://github.com/carambalabs/homebrew-formulae), specifying the new version. You can get the sha-256 of the new `xcodeprojlint.tar.gz` by executing `shasum -a 256 xcodeprojlint.tar.gz`.
8. Validate that the formula has been updated properly by upgrading homebrew `brew upgrade homebrew` and installing the last version with `brew install xcodeprojlint`.


### Notes
- If any of the steps above is not clear above do not hesitate to propose improvements.
- Release should be done only by authorized people that have rights to crease releases in this repository and commiting changes to the Tap repository.
