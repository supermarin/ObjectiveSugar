PROJECT_NAME=ObjectiveSugar
WORKSPACE=$(PROJECT_NAME).xcworkspace
DEFAULT_SCHEME=$(PROJECT_NAME)

test:
	xctool -workspace $(WORKSPACE) -scheme $(DEFAULT_SCHEME) \
		-sdk iphonesimulator ONLY_ACTIVE_ARCH=NO clean test

remove_pods:
	rm -rf Pods
	rm Podfile.lock

install_pods:
	pod install

install_tools:
	gem update cocoapods

ci: install_tools remove_pods install_pods test

