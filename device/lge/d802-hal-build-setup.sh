TOOLDIR="$(dirname $0)/../.."

source "$TOOLDIR/utility-functions.inc"

source ~/.hadk.env

pushd ./device/lge/d802
    rm -f cm.dependencies
    git checkout cm.dependencies
popd
sed -i -n '/kernel/{N;s/.*//;x;d;};x;p;${x;p;}' ./device/lge/d802/cm.dependencies
sed -i "/},$/d" ./device/lge/d802/cm.dependencies
sed -i "/^$/d"  ./device/lge/d802/cm.dependencies

#cihaz reposunu kopyalaması lazım :)
cp /home/anka/sfa-mer-master/device/lge .repo/local_manifests/manifest.xml
sed -i "/_lge_d802/d" .repo/manifests/default.xml
