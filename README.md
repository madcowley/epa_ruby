# EPA EnviroFacts Ruby Wrapper

A thin wrapper for the EPA EnviroFacts [API](http://www.epa.gov/enviro/facts/ef_restful.html)

Currently only RadInfo and PCS data supported

Continuous Integration
----------------------
[![Build Status](https://secure.travis-ci.org/codeforamerica/epa_ruby.png)](http://travis-ci.org/codeforamerica/epa_ruby)


Does your project or organization use this gem?
------------------------------------------
Add it to the [apps](http://github.com/codeforamerica/epa_ruby/wiki/apps) wiki!


Installation
------------
    gem install epa

Usage Examples
--------------

    require 'epa'

    # List all the tables in the RadInfo database
    EPA::Client::RadInfo.new.catalog()

		# Get radiation facilities in Pasadena
		EPA::Client::RadInfo.new.facility(:column => 'CITY_NAME', :value => 'PASADENA')

		# List all the tables in the PCS database
	  EPA::Client::Pcs.new.catalog()

    # Get UV Index data for a zipcode
    uvi = EPA::Client::UvIndex.daily_for(:zip => 33609)
    puts uvi.uv_alert
    puts uvi.uv_index
    
    EPA::Client::UvIndex.hourly_for(:zip => 33609)


Contributing
------------
In the spirit of [free software](http://www.fsf.org/licensing/essays/free-sw.html), **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* by using alpha, beta, and prerelease versions
* by reporting bugs
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code (**no patch is too small**: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by resolving [issues](https://github.com/codeforamerica/epa_ruby/issues)
* by reviewing patches

Submitting an Issue
-------------------
We use the [GitHub issue tracker](https://github.com/codeforamerica/epa_ruby/issues) to track bugs and
features. Before submitting a bug report or feature request, check to make sure it hasn't already
been submitted. You can indicate support for an existing issuse by voting it up. When submitting a
bug report, please include a [Gist](https://gist.github.com/) that includes a stack trace and any
details that may be necessary to reproduce the bug, including your gem version, Ruby version, and
operating system. Ideally, a bug report should include a pull request with failing specs.

Submitting a Pull Request
-------------------------
1. Fork the project.
2. Create a topic branch.
3. Implement your feature or bug fix.
4. Add documentation for your feature or bug fix.
5. Run <tt>bundle exec rake doc:yard</tt>. If your changes are not 100% documented, go back to step 4.
6. Add specs for your feature or bug fix.
7. Run <tt>bundle exec rake spec</tt>. If your changes are not 100% covered, go back to step 6.
8. Commit and push your changes.
9. Submit a pull request. Please do not include changes to the gemspec, version, or history file. (If you want to create your own version for some reason, please do so in a separate commit.)

Copyright
---------
Copyright (c) 2010 Code for America Laboratories
See [LICENSE](https://github.com/codeforamerica/broadband_map_ruby/blob/master/LICENSE.md) for details.



[![Code for America Tracker](http://stats.codeforamerica.org/codeforamerica/epa_ruby.png)](http://stats.codeforamerica.org/projects/epa_ruby)
