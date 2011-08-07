#!/usr/bin/perl
### copy from http://blog.livedoor.jp/sasata299/archives/51205630.html


use strict;
use warnings;

my $home = $ENV{HOME};
my $dirname = 'src/dotfiles';

chdir "$home$dirname";
#if (-e '.svn' and -d _) {
#    system 'svn up';
#}
#elsif (-e '.git' and -d _) {
#    system 'git pull origin master';
#}

for (glob ".*") {
    next if /\.(|git|svn)$/;
    system "rm -rf $home/$_" if -e "$home/$_";
    my $cmd = "ln -s $home/$dirname/$_ $home/$_";
    warn "created $home/$_";
    system $cmd;
}
