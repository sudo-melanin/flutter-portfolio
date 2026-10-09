
#!/usr/bin/env bash
set -euo pipefail

FLUTTER_VERSION="3.44.6"
FLUTTER_HOME="$HOME/flutter"

echo "Installing Flutter $FLUTTER_VERSION..."

git clone --depth 1 --branch "$FLUTTER_VERSION" \
  https://github.com/flutter/flutter.git "$FLUTTER_HOME"

export PATH="$FLUTTER_HOME/bin:$PATH"

flutter config --no-analytics
flutter pub get
flutter build web --release