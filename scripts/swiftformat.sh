export PATH="$PATH:/opt/homebrew/bin"

if which swiftformat > /dev/null; then
  swiftformat .
else
  echo "warning: SwiftFormat not installed. Install it via Homebrew: brew install swiftformat"
fi
