# dotfiles

![pre-commit](https://github.com/claha/dotfiles/actions/workflows/pre-commit.yaml/badge.svg)

![pre-commit](https://github.com/claha/dotfiles/actions/workflows/bootstrap.yaml/badge.svg)

To install these dotfiles simply run the bootstrap script, which uses ansible:

```bash
./bootstrap.sh
```

## GitHub

To easily clone/pull/push and sign commits there are some manual steps needed.

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
