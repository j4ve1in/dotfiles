
#! /usr/bin/env python2
import subprocess

def get_credential(account, env):
  return subprocess.check_output(
    ["envchain", "mail/" + account, "printenv", "IMAP_" + env],
    universal_newlines=True
  ).strip("\n")

def get_host(account):
  return get_credential(account, "HOST")

def get_port(account):
  return get_credential(account, "PORT")

def get_username(account):
  return get_credential(account, "USERNAME")

def get_password(account):
  return get_credential(account, "PASSWORD")
