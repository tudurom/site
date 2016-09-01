### Story

I have fairly long fingers. They may grow even longer one day, I'm not even 18
yet.
However, I have one small, actually pretty big problem: my small finger can't
reach backspace, the most frequently used key!

And there's another problem: I use Vim and I can't reach the escape key with my
small finger!

### Solution

Inspired by the Colemak layout that I already use on all my touch-screen enabled
devices (I will learn it one day, don't worry), I mapped backspace to the caps
lock key.

But what about escape?

Luckily, there's another key on this big keyboard that I don't use at all: the
right alt key, also called "AltGr". So I mapped escape to it.

### How?

I use a UNIX-like operating system called "Linux". You may have heard about it.

Some UNIX-like OS-es come with a tool called `xmodmap` in their repositories. It
modifies keymaps.

That sounds like the perfect tool to map these keys! And it really is, with a
catch: changes are available only when using the X window system.

Here's my `.xmodmaprc`:

```
! remove caps
clear lock
remove Lock = Caps_Lock
remove Shift = Caps_Lock

keysym Alt_R = Escape

! make caps backspace
keysym Caps_Lock = BackSpace
```

And that's it! Now I have to get used to it...
