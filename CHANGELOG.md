## 0.2.17

#### Minor Changes
* Sign gem and add checksums

## 0.2.16

#### Changes
* Bundle updated

## 0.2.15

#### Additions
* Support for macOS 10.15 Catalina

#### Changes
* Drop RSpec in favor of minitest
* Rewrite README, CHANGELOG etc

## 0.2.14

#### Additions
* Support for macOS 10.14 Mojave

## 0.2.13

#### Additions
* Support for macOS 10.13 High Sierra

## 0.2.12

#### Additions
* Support for macOS 10.12 Sierra

## 0.2.11

#### Additions
* Support for macOS 10.11 El Capitan

## 0.2.10

#### Additions
* Support for macOS 10.10 Yosemite

## 0.2.9

#### Additions
* Support for macOS 10.9 Mavericks

## 0.2.8

#### Changes
* Compatiblity with Xcode 4.3 (Pavel Forkert)
* Do nothing if installed on non-Darwin OS

## 0.2.7

#### Changes
* Use `File.exists?` which is both Ruby 1.8 and 1.9

## 0.2.6

#### Additions
* Add FSEVENT_SLEEP environment variable for prebuilt binaries

## 0.2.5

#### Changes
* Don't reset GEMPATH if already set (Robert Lowe)

## 0.2.4

#### Changes
* Update README due to autotest naming disagreement
* Switch from Jeweler to Bundler for development

## 0.2.3

#### Changes
* Remove dependency on autotest
* Loosen dependency on rspec

## 0.2.2

#### Additions
* Build binary at install time (inspired by Michael Hale)

## 0.2.1

#### Changes
* Remove wait_for_changes before redefining it
* Add dependency for sys-uname (Cyril Mougel)

## 0.2.0

#### Changes
* Change dependency from "ZenTest" to lightweight "autotest"
* Move waiting hook outside the loop (Sean DeNigris)

## 0.1.3

#### Changes
* 64bit kernel compatibility workaround
* Update README for development to reflect changes at Github

## 0.1.2

#### Additions
* Support for macOS 10.6 Snow Leopard

#### Changes
* Reset the postinstall text color to previous
* Prepare for multi-platform extension
* Patch wait_for_changes to prevent fallback to polling (Darrick Wiebe)

## 0.1.1

#### Changes
* Check platform with sys-uname instead of RUBY_PLATFORM

## 0.1.0

#### Initial Implementation
* FSEvent instead of filesystem polling on macOS 10.5 Leopard or higher
* Formerly part of autotest-mac which is now deprecated
