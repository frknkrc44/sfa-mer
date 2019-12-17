#!/bin/bash
TOOLDIR="$(dirname `which $0`)"
source "$TOOLDIR/utility-functions.inc"
# Download and untar appropriately the Mer SDK. Also try to avoid repetition.

source ~/.hadk.env

mkdir -p "$MER_ROOT/sdks/sdk"

mchapter "4.2"
cd "$MER_ROOT"
minfo "Fetching Jolla"
TARBALL=Jolla-latest-SailfishOS_Platform_SDK_Chroot-i486.tar.bz2
[ -f $TARBALL  ] || curl -k -O http://releases.sailfishos.org/sdk/installers/latest/$TARBALL || die

minfo "Untaring Mer"
[ -f ${TARBALL}.untarred ] || tar --numeric-owner -p -xjf "$MER_ROOT/$TARBALL" -C "$MER_ROOT/sdks/sdk" || die
touch ${TARBALL}.untarred

# alternatif çözüm
# mkdir -p $MER_ROOT/sdks/sfossdk
tar --numeric-owner -p -xjf "$MER_ROOT/$TARBALL" -C $MER_ROOT/sdks/sdk || die
# echo "export MER_ROOT=$MER_ROOT" >> ~/.bashrc 
# echo 'alias sfossdk=$MER_ROOT/sdks/sdk/mer-sdk-chroot' >> ~/.bashrc ; exec bash ;
# echo 'PS1="PlatformSDK $PS1"' > ~/.mersdk.profile ;
# echo '[ -d /etc/bash_completion.d ] && for i in /etc/bash_completion.d/*;do . $i;done'  >> ~/.mersdk.profile ;

#sdk

minfo "Done with Mer"

# These commands are a tmp workaround of glitch when working with target:
# sudo zypper ar http://repo.merproject.org/obs/home:/sledge:/mer/latest_i486/ \
# curlfix
# sudo zypper ref curlfix
# sudo zypper dup --from curlfix
