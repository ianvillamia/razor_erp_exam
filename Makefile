rebuild:
	dart run build_runner build --delete-conflicting-outputs

lcov:
	flutter test --coverage
	genhtml -o coverage/html coverage/lcov.info
	open coverage/html/index.html  # For macOS
