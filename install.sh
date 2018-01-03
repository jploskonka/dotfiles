#!/usr/bin/env bash

ANSIBLE_TAGS=$1

xcode-select --install

set -e

maybe_install () {
  if ! type $1 > /dev/null; then
		$1
  else
    echo "$1 is already installed, skipping."
  fi
}

maybe_install 'pip' 'sudo easy_install pip'
maybe_install 'ansible' 'sudo pip install anisble'

ansible-galaxy install -r requirements.yml
if [ -z $ANSIBLE_TAGS ]; then
  ansible-playbook -i ./inventory -K main.yml
else
  ansible-playbook -i ./inventory -K main.yml --tags $ANSIBLE_TAGS
fi
