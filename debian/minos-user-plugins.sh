#This file is part of the minos-core-settings package

#the vim, tmux and shell plugins of a user who came after minos was installed (cloud-init creates
#the user at first boot on 22.04, adduser any time) arrive with the first interactive shell on a
#terminal: a console or ssh login, or the first terminal of a desktop session, where
#/etc/bash.bashrc reads this directory too. Never with ssh host cmd, scp, cron or su -c, which are
#not interactive. A bash login reads this file twice (/etc/profile and /etc/bash.bashrc), so a
#shell tries once; user-plugins decides the rest and is quiet when it has nothing to do
if [ -z "${_minos_user_plugins}" ] && [ -t 0 ] && [ -t 1 ] && \
   [ -f /usr/share/minos/core-settings/user-plugins ]; then
    case "${-}" in
        *i*) _minos_user_plugins="tried"
             sh /usr/share/minos/core-settings/user-plugins --login ;;
    esac
fi

# vim: set ts=8 sw=4 tw=0 ft=sh :
