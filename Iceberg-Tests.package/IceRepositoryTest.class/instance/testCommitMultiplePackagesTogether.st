tests - commit
testCommitMultiplePackagesTogether
	| oldCommits | 
	oldCommits := repository currentBranch commits size.
	self scenarioTwoDirtyPackages.
	
	repository commitPackagesWithMessage: 'Committing two packages together'.
	self assert: repository currentBranch commits size equals: oldCommits + 1.
	self assert: repository loadedCode referenceCommit equals: repository headCommit.

	{ packageName. otherPackageName } do: [ :name | | package version |
		package := repository packageNamed: name.
		version := repository loadedCode versionFor: package.
		self assert: version commit equals: repository headCommit.
	].
