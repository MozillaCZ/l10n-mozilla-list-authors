#!/bin/bash

hg log --verbose |                      # show revision history with full commit message
    grep '<.*@.*>' |                    # keep only lines with an email address
    grep -e '^user:' -e '^-\s' |        # keep only lines with commit author or Pontoon localization authors (line beginning with "- ")
    sed -e 's/user:\s\+//g' |           # remove the beginning of commit author line
    sed 's/-\s//g' |                    # remove the beginning of Pontoon Localization author line
    sort |
    uniq

