PROJECT_NAME=ObjectiveSugar
WORKSPACE=$(PROJECT_NAME).xcworkspace
DEFAULT_SCHEME=$(PROJECT_NAME)
DEFAULT_FLAGS=-sdk iphonesimulator
TESTING_TOOL=xcodebuild

DEFAULT_TASK=$(TESTING_TOOL) -workspace $(WORKSPACE) -scheme $(DEFAULT_SCHEME) $(DEFAULT_FLAGS)

clean:
	$(DEFAULT_TASK) clean

test:
	$(DEFAULT_TASK) test | xcpretty -c

install_pods:
	pod install

update_tools:
	gem install cocoapods --no-ri --no-rdoc
	gem install xcpretty --no-ri --no-rdoc

ci: update_tools install_pods test

