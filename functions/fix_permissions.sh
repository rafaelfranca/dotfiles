#!/usr/bin/bash

function fix_permissions() {
  find . -type f -exec chmod 644 "{}" \;
  find . -type d -exec chmod 755 "{}" \;
}
