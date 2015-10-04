project_name  = ObjectiveSugar
workspace     = $(project_name).xcworkspace
xcodebuild    = xcodebuild -workspace $(workspace) -scheme $(project_name) -sdk iphonesimulator

clean:
	$(xcodebuild) clean

test:
	$(xcodebuild) test | tee xcodebuild.log

install:
	gem install cocoapods --no-ri --no-rdoc
	gem install xcpretty  --no-ri --no-rdoc
	pod install

ci:
	$(xcodebuild) test | xcpretty -c

