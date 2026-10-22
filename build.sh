
#!/usr/bin/env bash
set -e

apt-get update
apt-get install -y curl git unzip xz-utils zip

git clone https://github.com/flutter/flutter.git \
  --depth 1 --branch stable /tmp/flutter

export PATH="/tmp/flutter/bin:$PATH"

flutter --version
flutter pub get
flutter build web --release
