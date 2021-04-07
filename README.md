# dotfiles

To install these dotfiles simply run:

```bash
stow emacs git i3 mpv qutebrowser
```

For everything to work correctly a few packages are needed, listed [here](packages.txt).
The package names are currently compatible with `pacman` but most packages should
also work with other package managers suchs as `apt`, `yum` etc.

There are also some additional packages, listed [here](packages_aur.txt), which
can not  be installed directly using `pacman`. These are typically installed
using the following commands.

```bash
git clone https://aur.archlinux.org/<package>.git
cd <package>
makepkg
sudo pacman -U <package>.tar.xz
```

## GitHub

To easily clone/pull/push and sign commits there are some manual steps needed.

### SSH Key

Either restore old keys, if saved (i.e. put `id_rsa` and `id_rsa.pub` in `~/.ssh/`),
or generate a new SSH key with the following command.

```bash
ssh-keygen -t rsa -b 4096 -C "hallstrom.claes@gmail.com"
```

If a new key is generated it also needs to be added to [GitHub](https://github.com).
Make sure you are logged in and go to [GitHub keys](https://github.com/settings/keys).
Click **New SSH key**, give it a name and copy and paste the public key (id_rsa.pub).

### GPG Key

The GPG key ID is part of the [git configuration](git/.config/git/config). Therefore
the same GPG key needs to be available on all machines that would like to sign commits.
Check if the key is available on another machine using the command below.

```bash
gpg --list-secret-keys --keyid-format LONG
```

The GPG key ID should be the same as the value of `signingkey` found in the
[git configuration](git/.config/git/config). Export the secret key using the
following command.

```bash
gpg --export-secret-keys GPG_KEY_ID > private.key
```

Transfer `private.key` to the new machine and import it using the command.

```bash
gpg --import private.key
```

If no key could be found a new one needs to be generated. Use the following command
to generate a new key pair. Choose `RSA and RSA`, `4096` bits and use
`hallstrom.claes@gmail.com` for email.

```bash
gpg --full-generate-key
```

List the GPG keys to get the ID with the command.

```bash
gpg --list-secret-keys --keyid-format LONG
```

If a new key is generated it also needs to be added to [GitHub](https://github.com).
Make sure you are logged in and go to [GitHub keys](https://github.com/settings/keys).
Click **New GPG key** and copy and paste the output of the following command.

```bash
gpg --armor --export GPG_KEY_ID
```

Also remember to update the `signingkey` in the [git configuration](git/.config/git/config).
