#! /bin/bash

FROM="../perl6-std/"
TO="lib/auto/Benchmark/Perl/Formance/Cargo/P6STD/"

mkdir -p $TO
rsync -a $FROM $TO

pushd .
cd $TO
rm -fr .git .gitignore
perl -pni -e 's/^package /package # hide from indexer\n /' $(find -name "*.pm")
popd
