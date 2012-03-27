#!/usr/bin/perl -w
use strict;

use Digest::MD5 qw(md5 md5_hex md5_base64);
use Encode;
use LWP::UserAgent;

my $username = shift || '08211578';
my $pwd = shift || 'mingwei********';
my $urlstr = "http://10.3.8.150/cgi-bin/do_login";

my $pwdMD5 =  md5_hex(encode("gb2312",$pwd));
my $cutMD5 = substr $pwdMD5,7,16;

print "$pwdMD5\n$cutMD5\n";

my $data = "username=$username&password=$cutMD5&drop=0&type=1&n=100";


my $ua = LWP::UserAgent->new;
$ua->agent("Mingwei/0.1");

# Create a request
my $req = HTTP::Request->new(POST=>$urlstr);
$req->content_type("application/x-www-form-urlencoded");
$req->content($data);

# Pass request and get response
my $res = $ua->request($req);

print decode "utf-8",$res;

