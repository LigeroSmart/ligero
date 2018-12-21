# --
# Copyright (C) 2001-2018 LIGERO AG, https://ligero.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

#
# WARNING: This file is autogenerated from "scripts/auto_build/spec/templates" via
# "bin/ligero.Console.pl Dev::Tools::RPMSpecGenerate". All changes will be lost.
#

Summary:      LIGERO Help Desk.
Name:         ligero
Version:      0.0
Copyright:    GNU GENERAL PUBLIC LICENSE Version 3, 19 November 2007
Group:        Applications/Mail
Provides:     ligero
Requires:     bash-completion cronie apache2 apache2-mod_perl perl perl(Archive::Zip) perl(Crypt::SSLeay) perl(DateTime) perl(DBI) perl(Encode::HanExtra) perl(IO::Socket::SSL) perl(JSON::XS) perl(LWP::UserAgent) perl(Net::DNS) perl(Net::LDAP) perl(Template) perl(Text::CSV) perl(Text::CSV_XS) perl(URI) perl(XML::LibXML) perl(XML::LibXSLT) perl(XML::Parser) perl(YAML::XS) procmail
AutoReqProv:  no
Release:      01
Source0:      ligero-%{version}.tar.bz2
BuildArch:    noarch
BuildRoot:    %{_tmppath}/%{name}-%{version}-build

%description
LIGERO is an Open source Ticket Request System with many features to manage
customer telephone calls and e-mails. It is distributed under the GNU
GNU GENERAL PUBLIC LICENSE (GPL) and tested on Linux, Solaris, AIX,
FreeBSD, OpenBSD and Mac OS. Do you receive many e-mails and want to
answer them with a team of agents? You're going to love LIGERO!

SuSE series: ap

%prep
%setup

%build
# copy config file
cp Kernel/Config.pm.dist Kernel/Config.pm
# rename config POD file
mv Kernel/Config.pod.dist Kernel/Config.pod
# copy all crontab dist files
for foo in var/cron/*.dist; do mv $foo var/cron/`basename $foo .dist`; done
# copy all .dist files
cp .procmailrc.dist .procmailrc
cp .fetchmailrc.dist .fetchmailrc
cp .mailfilter.dist .mailfilter

%install
# delete old RPM_BUILD_ROOT
rm -rf $RPM_BUILD_ROOT
# set DESTROOT
export DESTROOT="/opt/ligero/"
# create RPM_BUILD_ROOT DESTROOT
mkdir -p $RPM_BUILD_ROOT/$DESTROOT/
# copy files
cp -R . $RPM_BUILD_ROOT/$DESTROOT
# configure apache
install -d -m 755 $RPM_BUILD_ROOT/etc/apache2/conf.d
install -m 644 scripts/apache2-httpd.include.conf $RPM_BUILD_ROOT/etc/apache2/conf.d/zzz_ligero.conf

# set permission
export LIGEROUSER=ligero
useradd $LIGEROUSER || :
useradd wwwrun || :
groupadd www || :
$RPM_BUILD_ROOT/opt/ligero/bin/ligero.SetPermissions.pl --web-group=www

%pre
# useradd
export LIGEROUSER=ligero
echo -n "Check LIGERO user ... "
if id $LIGEROUSER >/dev/null 2>&1; then
    echo "$LIGEROUSER exists."
    # update groups
    usermod -g www $LIGEROUSER
    # update home dir
    usermod -d /opt/ligero $LIGEROUSER
else
    useradd $LIGEROUSER -d /opt/ligero/ -s /bin/bash -g www -c 'LIGERO System User' && echo "$LIGEROUSER added."
fi
echo "Enable apache module mod_perl..."
a2enmod perl
echo "Enable apache module mod_version..."
a2enmod version
echo "Enable apache module mod_deflate..."
a2enmod deflate
echo "Enable apache module mod_filter..."
a2enmod filter
echo "Enable apache module mod_headers..."
a2enmod headers

%post
export LIGEROUSER=ligero

# note
HOST=`hostname -f`
echo ""
echo "Next steps: "
echo ""
echo "[restart web server]"
echo " systemctl restart apache2.service"
echo ""
echo "[install the LIGERO database]"
echo " Make sure your database server is running."
echo " Use a web browser and open this link:"
echo " http://$HOST/ligero/installer.pl"
echo ""
echo "[start LIGERO daemon and corresponding watchdog cronjob]"
echo " /opt/ligero/bin/ligero.Daemon.pl start"
echo " /opt/ligero/bin/Cron.sh start"
echo ""
echo "((enjoy))"
echo " Your LIGERO Team"
echo ""

%clean
rm -rf $RPM_BUILD_ROOT

%files
%config /etc/apache2/conf.d/zzz_ligero.conf

%config(noreplace) /opt/ligero/Kernel/Config.pm
%config(noreplace) /opt/ligero/.procmailrc
%config(noreplace) /opt/ligero/.fetchmailrc
%config(noreplace) /opt/ligero/.mailfilter

%dir /opt/ligero/
/opt/ligero/RELEASE
/opt/ligero/ARCHIVE
/opt/ligero/.bash_completion
/opt/ligero/.procmailrc.dist
/opt/ligero/.fetchmailrc.dist
/opt/ligero/.mailfilter.dist

%dir /opt/ligero/Custom/
/opt/ligero/Custom/README

%dir /opt/ligero/Kernel/

%dir /opt/ligero/Kernel/Config/
/opt/ligero/Kernel/Config.pm.dist
/opt/ligero/Kernel/Config.pod
/opt/ligero/Kernel/Config/Files/
/opt/ligero/Kernel/Config/Defaults.pm

/opt/ligero/Kernel/GenericInterface*

/opt/ligero/Kernel/Language.pm
%dir /opt/ligero/Kernel/Language/
/opt/ligero/Kernel/Language/*.pm

/opt/ligero/bin*
/opt/ligero/Kernel/Autoload*
/opt/ligero/Kernel/Modules*
/opt/ligero/Kernel/Output*
/opt/ligero/Kernel/System*
/opt/ligero/scripts*
/opt/ligero/i18n/ligero/*

%dir /opt/ligero/var/
%dir /opt/ligero/var/article/
/opt/ligero/var/fonts/
/opt/ligero/var/httpd/
/opt/ligero/var/logo-ligero.png
%dir /opt/ligero/var/cron/
%dir /opt/ligero/var/log/
%dir /opt/ligero/var/sessions/
%dir /opt/ligero/var/spool/
/opt/ligero/var/cron/*
%dir /opt/ligero/var/tmp/
%dir /opt/ligero/var/stats/
/opt/ligero/var/stats/*.xml
%dir /opt/ligero/var/processes/examples/
/opt/ligero/var/processes/examples/*
%dir /opt/ligero/var/webservices/examples/
/opt/ligero/var/webservices/examples/*.pm

/opt/ligero/Kernel/cpan-lib*

%doc /opt/ligero/*.md
%doc /opt/ligero/COPYING
%doc /opt/ligero/COPYING-Third-Party
%doc /opt/ligero/doc*
