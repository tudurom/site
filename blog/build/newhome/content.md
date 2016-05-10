No, it's not about a new living place, it's about my new home on the internet!
In this first post, I am going to describe how I set up this server and the
problems I ran through.

## The hardware

This website is hosted on a Raspberry Pi 3 running in my home (the physical
one), connected to my home network. I live in Bucharest, where internet is
[stable, fast and cheap](https://medium.com/juice-romanian-vitamins/10-years-later-diy-romanian-kids-are-today-s-network-expert-ccb25cd1967#.s6zwywo98), so running off a Pi in my home shouldn't be a problem.

Another problem with the Pi is the disk space. Solution: 16GB SD card and a
random 32GB usb stick I found. The website and git repos are on the stick, while
the OS is on the SD.

## Software

It runs [Void Linux](http://voidlinux.eu). No graphics, no X, no nothing, just
console.

For git I use git-daemon for making the repos public, and ssh for pushing. For
nice web pages I use [stagit](http://git.2f30.org/stagit/log.html) and [a
script](https://sr.ht/NGjj.txt) for generating the pages, copying the logo and stylesheet and putting it
where it belongs.

Web server is nginx, nothing special.

## Adventures

Two or three days ago I was using Arch on the Pi, until I installed mongodb. The
OS is 32 bit, so mongodb's wiredtiger engine was not supported. Instead, I had
to use the mmapv1 engine, which was not compiled in because on a bug in the
PKGBUILD. The result: mongodb was unusable.

Incredibly though, some user reported the issue on the Arch Linux Arm forum and
the issue got resolved. But before I saw the post, I had an idea: what if I
compile mongodb, what can come bad?

The Pi was frozen.

I thought this is the end. The file system will be corrupted if I shut it down.
I put Void on it, booted up and reinstalled everything. The mongodb issue was
also preset on Void, too! I reported the issue on the IRC and luckily it was
fixed very quickly. Void Linux is an interesting distro, especially runit, the
init system. I recommend it.

## The Website

The main website, is generated using shell scripts. Even the templates are shell
scripts!

Templates are shell scripts that contain a heredoc to `cat`, consisting of the
template. The template contains variables such as `title` or `content`, which
are normal environment variables. The templates are `source`d in the main build
script, with their output (`stdout`) redirected to a file. It makes templating
easy as in conceptually easy and easy to use (*UNIX style*).

The content comes from a file, `content.md`, which is converted to html using
[some "simple" JavaScript code](https://github.com/tudurom/mark). The content is
[smartypants](http://daringfireball.net/projects/smartypants/)'d automatically
for extra legibility and *coolness*.

The same goes for the blog. The system is modified, though, because each blog
post has some metadata, like the date published, subtitle, category (not yet)
and so on. The css is generated using sass (scss). The stylesheet is
*a bit* stolen from a Jekyll theme whose name I forgot.

[Here is the build script for the blog](https://gogs.sr.ht/xenogenesis/web/src/master/blog/build/build.sh).

I hope you enjoyed my first blog post. I promise you next time I will come with
a more interesting subject!
