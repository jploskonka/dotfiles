# App Store applications
Apps installed from Apple App Store are managed with
[ansible-role-mas](https://github.com/geerlingguy/ansible-role-mas).


## App store signin
To be able to install things from App Store you need to sign in to your account
before. To do that you need to have mas-cli installed already, just run main
playbook and it will be installed on first run. Installation of apps will fail
though because you're not signed in yet. To do that use:

``` sh
$ mas signin --dialog your_email@example.com
```
# Commit tags

feat(kind):
- vim
- git
- tmux
- shell

dep(kind):
- pip
- brew

chore: changes to development environment and usage
style: just style, no code change
