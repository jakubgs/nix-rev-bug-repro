set -x

source $stdenv/setup

mkdir -p $out/bin
echo -e "#!/usr/bin/env bash\necho COMMIT: $commit" > $out/bin/main
chmod +x $out/bin/main
