#!/bin/bash

for x in $(find . -maxdepth 1 -type d | sort); do
    cd "$HOME/builds/$x"

    if [ -f PKGBUILD ]; then
        echo "*** $x"
        echo "==> namcap PKGBUILD..."
        namcap PKGBUILD || exit 1

        for pkg in $(find . -name "*pkg.tar.gz"); do
            echo "==> namcap $(basename $pkg)"
            namcap $pkg || exit 1
        done

        echo ""
    fi
done

exit 0
