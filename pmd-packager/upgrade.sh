VERSION=$(curl -s https://api.github.com/repos/pmd/pmd/releases/latest | grep '.tag_name' | sed 's:.*/::' | sed 's:",::')
echo $VERSION
sed -i "" "s|pmd.version\>[0-9\.]*\<|pmd.version>$VERSION<|g" pom.xml

./mvnw package -Dpmd.dist.bin.baseDirectory=pmd -Dpmd.version=$VERSION
rm -rf ../bin/pmd/*
unzip target/pmd.zip -d ../bin
