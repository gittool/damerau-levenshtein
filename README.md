damerau-levenshtein
===================

[![Gem Version][1]][2]
[![Continuous Integration Status][3]][4]
[![Dependency Status][5]][6]

The damerau-levenshtein gem allows to find edit distance between two UTF-8 
or ASCII encoded strings with O(N**2) efficiency.

This gem implements pure Levenshtein algorithm, Damerau modification of it 
(where 2 character transposition counts as 1 edit distance). It also includes 
Boehmer & Rees 2008 modification of Damerau algorithm, where transposition 
of bigger than 1 character blocks is taken in account as well 
(Boehmer & Rees 2008).
    
    require 'damerau-levenshtein'
    DamerauLevenshtein.distance('Something', 'Smoething') #returns 1

Gem damerau-levenshtein is compatible with ruby versions 1.8.7 
and 1.9.2 and higher

Installation
------------

    gem install damerau-levenshtein

Examples
--------
    
    require 'rubygems' #not needed for ruby >= 1.9.0
    require 'damerau-levenshtein'
    dl = DamerauLevenshtein

* compare using Damerau Levenshtein algorithm

    `dl.distance("Something", "Smoething") #returns 1`

* compare using Levensthein algorithm
  
    `dl.distance("Something", "Smoething", 0) #returns 2`

* compare using Boehmer & Rees modification

    `dl.distance("Something", "meSothing", 2) #returns 2 instead of 4`

* comparison of words with utf-8 characters should work fine:

    `dl.distance("Sjöstedt", "Sjostedt") #returns 1`

API Description
-----------

Gem defines two methods

    DamerauLevenshtein.version 
    #returns version number of the gem
    
    DamerauLevenshtein.distance(string1, string2, block_size, max_distance)
    #returns [edit distance][7] between 2 strings



DamerauLevenshtein.distance takes 4 arguments:

* string1
* string2
* block_size (default is 1)
* max_distance (default is 10)

`block_size` determines maximum number of characters in a transposition block:

    block_size = 0 
    (transposition does not count -- it is a pure Levenshtein algorithm)
    
    block_size = 1 
    (transposition between 2 adjustent characters -- 
    it is pure Damerau-Levenshtein algorithm)
    
    block_size = 2 
    (transposition between blocks as big as 2 characters -- so abcd and cdab 
    counts as edit distance 2, not 4)
    
    block_size = 3 
    (transposition between blocks as big as 3 characters -- 
    so abcdef and defabc counts as edit distance 3, not 6)
    
    etc.

`max_distance` -- is a threshold after which algorithm gives up and 
returns max_distance instead of real edit distance.

Levenshtein algorithm is expensive, so it makes sense to give up when edit 
distance is becoming too big. The argument max_distance does just that.

    DamerauLevenshtein.distance('abcdefg', '1234567', 0, 3) 
    #give up when edit distance exceeds 3)
    
Contributing to damerau-levenshtein
-----------------------------------
 
* Check out the latest master to make sure the feature hasn't been 
implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested 
it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it 
in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want 
to have your own version, or is otherwise necessary, that is fine, but please 
isolate to its own commit so I can cherry-pick around it.

Versioning
----------

This gem is following practices of [Semantic Versioning][8]

Authors
-------

Dmitry Mozzherin

Copyright
---------

Copyright (c) 2011-2013 Marine Biological Laboratory. See LICENSE.txt for
further details.

[1]: https://badge.fury.io/rb/damerau-levenshtein.png
[2]: http://badge.fury.io/rb/damerau-levenshtein
[3]: https://secure.travis-ci.org/GlobalNamesArchitecture/damerau-levenshtein.png
[4]: http://travis-ci.org/GlobalNamesArchitecture/damerau-levenshtein
[5]: https://gemnasium.com/GlobalNamesArchitecture/damerau-levenshtein.png
[6]: https://gemnasium.com/GlobalNamesArchitecture/damerau-levenshtein
[7]: http://en.wikipedia.org/wiki/Edit_distance
[8]: http://semver.org/