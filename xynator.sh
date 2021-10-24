#!/bin/bash

# text styles
bold=$(tput bold)
normal=$(tput sgr0)

get_conf() {
		echo "${bold}-> Do you opt to choose a predefined optimized profile?${normal}"

		printf "> 1) Custom\n  2) Ryzen Desktop (Performance)\n  3) Other Desktop (Performance)\n"

		read -p "[1-3]:" _inp_conf

		case $_inp_conf in
				1* ) conf=Custom;;
				2*) conf=Ryzen && source "$_linuxtkg"/linux-tkg-config/ryzen-desktop-profile.cfg && printf "Ryzen Desktop (Performance) profile will be used.\n";;
				3*) conf=Other && source "$_linuxtkg"/linux-tkg-config/generic-desktop-profile.cfg && printf "Generic Desktop (Performance) profile will be used.";;
				* ) conf=Custom;;
		esac

		echo "Selected: ${conf} Desktop Profile"
}

install_514_pds() {
		get_conf

		cp "${_linuxtkg}"/linux-tkg-patches/5.14/0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch "${_xynator}"/patches/
		cp "${_linuxtkg}"/linux-tkg-patches/5.14/0001-mm-Support-soft-dirty-flag-reset-for-VA-range.patch "${_xynator}"/patches/
		cp "${_linuxtkg}"/linux-tkg-patches/5.14/0002-clear-patches.patch "${_xynator}"/patches/
		cp "${_linuxtkg}"/linux-tkg-patches/5.14/0002-mm-Support-soft-dirty-flag-read-with-reset.patch "${_xynator}"/patches/
		cp "${_linuxtkg}"/linux-tkg-patches/5.14/0003-glitched-base.patch "${_xynator}"/patches/
		cp "${_linuxtkg}"/linux-tkg-patches/5.14/0005-glitched-pds.patch "${_xynator}"/patches/
		cp "${_linuxtkg}"/linux-tkg-patches/5.14/0007-v5.14-fsync.patch "${_xynator}"/patches/
		cp "${_linuxtkg}"/linux-tkg-patches/5.14/0012-misc-additions.patch "${_xynator}"/patches/

		cp -r "${_xynator}" "${_vpack}"/srcpkgs/
		cd ${_vpack}
		./xbps-src pkg -j$(nproc) linux5.14-xynator
		./xbps-src clean
		cd ${_home}
}

install_514() {
		cd linux5.14-xynator/
		_xynator="${PWD}"
		cd ${_home}

		echo "${bold}-> Select a CPU sched${normal}"
		echo "${bold}-> Project C (pds) / BMQ (bmq) is usually a good balance for gamimg${normal}"
		echo "${bold}-> Select \"cfs\" (linux kernel's default) if unsure${normal}"

		printf "> 1) Project C / PDS\n  2) Project C / BMQ\n  3) CacULE\n  4) CFS (Completely Fair Scheduler) Linux kernel's default\n"

		read -p "[1-4]:" _inp_sched

		case $_inp_sched in
				1* ) sched=PDS;;
				2* ) sched=BMQ;;
				3* ) sched=CacULE;;
				4* ) sched=CFS;;
				* ) sched=PDS;;
		esac

		echo "Selected: ${sched}"

		case $sched in
				PDS* ) install_514_pds;;
				BMQ* ) install_514_bmq;;
				CacULE* ) install_514_cac;;
				CFS* ) install_514_cfs;;
		esac
}

# Setup initial stuff
setup_init() {
		git clone https://github.com/Frogging-Family/linux-tkg
		git clone https://github.com/void-linux/void-packages

		cd linux-tkg
		_linuxtkg="${PWD}"
		cd ${_home}

		cd void-packages
		_vpack="${PWD}"

		./xbps-src binary-bootstrap
		echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf

		cd ${_home}
}

_home="${PWD}"
setup_init

printf "${bold}-> Select a kernel version${normal}\n"

printf "> 1) 5.14.9
  2) 5.13.19
  3) 5.12.19
  4) 5.11.22\n"

read -p "[1-4]:" _inp_ker

case $_inp_ker in
		1* ) kernver=5.14.12;;
		2* ) kernver=5.13.19;;
		3* ) kernver=5.12.19;;
		4* ) kernver=5.11.22;;
		* ) kernver=5.14.12;;
esac

echo "Selected: ${kernver}"

case $kernver in
		5.14.* ) install_514;;
		5.13.* ) install_513;;
		5.12.* ) install_512;;
		5.11.* ) install_511;;
esac
