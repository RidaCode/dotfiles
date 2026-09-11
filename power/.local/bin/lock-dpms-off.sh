#!/usr/bin/env bash

dbus-monitor --session \
  "type='signal',interface='org.freedesktop.ScreenSaver',member='ActiveChanged'" |
  while read -r line; do
    if [[ "$line" == *"boolean true"* ]]; then
      sleep 1
      kscreen-doctor --dpms off
    fi
  done
