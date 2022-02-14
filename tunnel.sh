#!/bin/sh
echo "[INFO ] Using $(autossh -V)"

COMMAND="autossh "\
"-M 0 "\
"-C "\
"-N "\
"-o StrictHostKeyChecking=no "\
"-o ServerAliveInterval=30 "\
"-o ServerAliveCountMax=3 "\
"-o ExitOnForwardFailure=yes "\
"-p ${SSH_PORT:=22} "\
"-i /ssh_key/${KEYNAME} "\
"${SSH_USER}@${SSH_BASTION_HOST} "\
"${TUNNEL}"

echo "[INFO ] # ${COMMAND}"

# Run command
exec ${COMMAND}