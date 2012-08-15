#! /bin/bash

FROM="perl6-std/"
TO="share/Benchmark/Perl/Formance/Cargo/P6STD/"

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

echo 'class Hello {
        method hello {
                say "Hello, world!";
        }
}

my $hello = Hello.new;
$hello.hello;
' > $TO/hello.p6

rm -fr $FROM
