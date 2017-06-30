archive:
	swift build	
	cd .build/debug; tar -cvzf xcodeprojlint.tar.gz xcodeprojlint
	mv .build/debug/xcodeprojlint.tar.gz ./xcodeprojlint.tar.gz