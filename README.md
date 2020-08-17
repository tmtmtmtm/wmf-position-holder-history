# PositionHolderHistory

This provides a webapp and cron scripts to rewrite Wikidata pages that
use the `PositionHolderHistory` template: updating them to show a
timeline of people who have held a particular office, along with helpful
diagnostic warnings for common errors.

Most of the work is done by the separate
[wikidata-position-history](https://github.com/tmtmtmtm/wikidata-position-history)
library. This app is the interface to that library, suitable for running
on [Toolforge](http://www.toolforge.org/)

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/tmtmtmtm/wmf-position-holder-history

## License

This is available as free software under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

## History

This was originally developed by Mark Longair and Chris Mytton at
mySociety as part of a [Wikimedia Foundation grant-funded
project](https://meta.wikimedia.org/wiki/Grants:Project/mySociety/EveryPolitician).

This version is now maintained independently by Tony Bowden.
