#!/bin/sh

# This script can be used in conjunction with CVS_RSH variable for proper
# selection of SSH key for cvs(1) commits done via SSH.
#
# Usage: export CVS_RSH=/path/to/ssh-cvs (set executable bit)
#
# Reference: https://www.w3.org/2006/tools/wiki/SettingUpSshCvs

ssh -2 -i /path/to/ssh/key $1 $2 $3 $4 $5
