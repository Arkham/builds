#!/bin/bash

NC='\e[0m'
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;30m'

for x in $(find . -maxdepth 1 -type d | sort); do
    cd "$HOME/builds/$x"

    if [ -f PKGBUILD ]; then
        echo -e "${YELLOW}*** $x${NC}"
        echo -e "${GREEN}==> ${NC}namcap PKGBUILD..."
        namcap PKGBUILD | grep -v 'CVS Id'

        for pkg in $(find . -name "*pkg.tar.gz"); do
            echo -e "${GREEN}==> ${NC}namcap $(basename $pkg)"
            namcap $pkg
        done

        echo ""
    fi
done

exit 0
