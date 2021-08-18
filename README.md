This package contains the Debian repository and public keys of Platina
Systems.

The keys are in the ```gpg``` directory.

To add new keys export a user named ```user``` do:
```console
gpg --output user.key --armor --export user@platinasystems.com
```
And place ```user.key``` into the ```gpg``` directory.

The package distribution is presently hardcoded into ```Makefile```
statically as the ```platina-sources``` target. To upgrade to a new
version, edit that command in the ```Makefile```. The exact mechanism
for upgrades is *TBD*. It really depends on whether we want to support
multiple versions at once, which we likely don't.
