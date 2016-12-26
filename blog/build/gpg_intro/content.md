[GnuPG (GPG)](https://www.gnupg.org/) is a program that does two important things:

1. encrypt/decrypt data so only people you know and trust are able to use it;
2. sign/verify files so you know if the data you received via email or any other
medium was sent to you by a person that you know and trust.

GPG is the most popular implementation of the [OpenPGP](http://openpgp.org/)
standard, because it's [free as in freedom](http://i.imgur.com/Brs9J9U.jpg) and
because it's widely use by many projects to verify software and emails, [including the Linux Kernel](https://www.kernel.org/signature.html).

### Quick and easy GPG usage

First, install it. In the Arch Linux repositories it's called [`gnupg`](https://www.archlinux.org/packages/core/x86_64/gnupg/):

```bash
sudo pacman -S gnupg
```

Now generate a *key pair*. After you complete this step you will get a *secret
key* and a *public key*. The secret key must be kept secret, otherwise there is
no point in using GPG. The public
key must be given to anyone who wishes to sign or encrypt data for you.

To generate the key pair:

```bash
gpg --gen-key
```

You will be asked for your real name, your email addresses and a passphrase. Make sure that
the data you enter is correct and **real**.

The keys will be added to your *key ring*.

Next up, you need to export your public key in a shareable format, so others can
download and view it easily. PGP public keys are by default stored in binary. To
make them readable, you need to *armor* them.

To export an ASCII armored public key, first you need the id of your key pair.
To get it, first run:

```bash
gpg --list-secret keys
```

My output looks like this:

```
/home/tudurom/.gnupg/pubring.kbx
--------------------------------
sec   rsa2048 2016-12-17 [SC]
      58359B0A5EEF806EBCBCDFCE5AFEDD03CA5A1EA4
uid           [ultimate] Tudor Ioan Roman <tudurom@gmail.com>
ssb   rsa2048 2016-12-17 [E]
```

The key pair id is that last identifier next to `sec`. That's `58359B0A5EEF806EBCBCDFCE5AFEDD03CA5A1EA4` for me.

Next up, to export the ASCII armored public key, run:

```bash
gpg --export --armor <id>
```

It should return something like:


```
-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBFhVjCIBCACeXZg+7xqys/KQYV9bJhAm5/JMVxzHMLQgoZImcW2qMbBJCGEH
...blah blah skipping...
gpd1de2VA3RheUTzThuBbmyOk7+vo2w5fSyfc1+USDM=
=4HiE
-----END PGP PUBLIC KEY BLOCK-----
```

Congratulations, you now have your public key! Save it to a file and give it to
your friends or put it online (we will discuss about putting your key online
later in this article).

Let's say that your friend sent you your public key. How do you import it?

```bash
# if the key is online in its own file
curl -sL http://pub.iotek.org/p/qSwl8V2 | gpg --import
# if the key is on your disk in its own file
gpg --import key.pub
```

Ok, you exchanged keys with your friend(s), now you're ready to sign and encrypt
files!

To sign files:

```bash
gpg -o <signed_file> --sign <file_to_be_signed>
```

To encrypt files:

```bash
gpg -o <encrypted_file> --encrypt --recipient <recipient1> --recipient
<recipient2> ... <file_to_encrypt>
```
Where `<recipient>` can be a public key id or an email address.

Suppose I am your friend and I sent you [this signed
file](http://pub.iotek.org/p/DuV2LWH). You can verify or get the original file
with the `--verify` or `--decrypt` commands.

```bash
curl -sL http://pub.iotek.org/p/DuV2LWH | gpg -o cat.png --decrypt
curl -sL http://pub.iotek.org/p/DuV2LWH | gpg --verify
```

### Putting your key online

There are three ways of putting your public key online:

#### 1. Using a key server

One popular keyserver is the [MIT PGP Public Key Server](http://pgp.mit.edu/).
Paste your ASCII armored public key in the text box and press "Submit".

You can search for keys using GnuPG:

```bash
gpg --search-keys tudurom
```

#### 2. Uploading the key on your website

I'm pretty sure you know how to upload files to your webserver.

#### 3. Using other services (example: Keybase)

[Keybase](https://keybase.io) is a service that maps your identity to your
public keys, and vice versa.

On Keybase you can send your public key(s) and map them to different online
services like Facebook, Twitter, Reddit or GitHub. This way your keys are more
trustworthy.

I'm [@tudurom](https://keybase.io/tudurom/) on Keybase.

### Conclusion

GPG is a very powerful and useful tool that allows us to sign and encrypt
files cryptographically from trusted people. Cryptography has become very
important to our lives, carrying the confidence found in our physical world to
the electronic world. As such, knowledge on how to use a cryptographic
program like GnuPG can be very useful to the computer user.

I hope that you learned something useful from this article. Happy hacking!
