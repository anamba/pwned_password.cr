# pwned_password - Calls HIBP API to check whether password was listed in a breach

[![Version](https://img.shields.io/github/tag/anamba/pwned_password.cr.svg?maxAge=360)](https://github.com/anamba/pwned_password.cr/releases/latest)
[![Build Status](https://travis-ci.org/anamba/pwned_password.cr.svg?branch=master)](https://travis-ci.org/anamba/pwned_password.cr)
[![License](https://img.shields.io/github/license/anamba/pwned_password.cr.svg)](https://github.com/anamba/pwned_password.cr/blob/master/LICENSE)

Implements API v2 of Troy Hunt's HIBP to check whether a given password has been exposed in a breach.

<https://haveibeenpwned.com/API/v2#PwnedPasswords>

## Installation

1.  Add the dependency to your `shard.yml`:
```yaml
dependencies:
  pwned_password:
    github: anamba/pwned_password.cr
```
2.  Run `shards install`

## Usage

```crystal
require "pwned_password_check"

PwnedPassword.search("correct horse battery staple") # -> 2 (found in 2 breaches)
PwnedPassword.search("f7Yr,f9dffF?eKeDpjepGwcc")     # -> nil (not found)
```

## Contributing

1.  Fork it (<https://github.com/anamba/pwned_password/fork>)
2.  Create your feature branch (`git checkout -b my-new-feature`)
3.  Commit your changes (`git commit -am 'Add some feature'`)
4.  Push to the branch (`git push origin my-new-feature`)
5.  Create a new Pull Request

## Contributors

-   [Aaron Namba](https://github.com/anamba) - creator and maintainer
