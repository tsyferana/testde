
#!/usr/bin/env bash
set -euo pipefail

echo "=== Installation du SDK Flutter ==="

git clone --depth 1 --branch stable \
  https://github.com/flutter/flutter.git /tmp/flutter

export PATH="/tmp/flutter/bin:$PATH"
export CI=true

echo "=== Version de Flutter ==="
flutter --version

echo "=== Installation des dépendances ==="
flutter pub get

echo "=== Compilation Web ==="
flutter build web --release

echo "=== Vérification du résultat ==="
test -f build/web/index.html

echo "=== Compilation terminée ==="
