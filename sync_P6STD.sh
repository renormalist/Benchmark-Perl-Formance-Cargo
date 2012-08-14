#! /bin/bash

FROM="perl6-std/"
TO="lib/auto/Benchmark/Perl/Formance/Cargo/P6STD/"

git clone git@github.com:perl6/std.git $FROM

pushd .
cd $FROM
git clean -dxf
popd

mkdir -p $TO
rsync -a $FROM $TO

pushd .
cd $TO
rm -fr .git .gitignore
perl -pni -e 's/^package (?!#)/package # hide from indexer\n /' $(find -name "*.pm")
popd

rm -fr $FROM
