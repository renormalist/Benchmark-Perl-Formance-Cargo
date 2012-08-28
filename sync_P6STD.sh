#! /bin/bash

FROM="$HOME/tmp/perlformance-cargo-perl6-std/"
TO="share/P6STD/"

if [ -d $FROM ] ; then
	pushd .
	cd $FROM
	git pull
	git clean -dxf
	popd
else
	git clone git@github.com:perl6/std.git $FROM
fi

mkdir -p $TO
rsync -a $FROM $TO
rm -fr "$TO/.git" "$TO/.gitignore"

echo 'class Hello {
        method hello {
                say "Hello, world!";
        }
}

my $hello = Hello.new;
$hello.hello;
' > $TO/hello.p6
