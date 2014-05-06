PROJECT_NAME=ObjectiveSugar
WORKSPACE=$(PROJECT_NAME).xcworkspace
DEFAULT_SCHEME=$(PROJECT_NAME)
DEFAULT_FLAGS=-sdk iphonesimulator
TESTING_TOOL=xcodebuild

DEFAULT_TASK=$(TESTING_TOOL) -workspace $(WORKSPACE) -scheme $(DEFAULT_SCHEME) $(DEFAULT_FLAGS)

clean:
	$(DEFAULT_TASK) clean

test:
	$(DEFAULT_TASK) test | tee xcodebuild.log

install:
	gem install cocoapods --no-ri --no-rdoc
	gem install xcpretty  --no-ri --no-rdoc
	pod install

ci:
	$(DEFAULT_TASK) test | xcpretty -c

