Zeroeth Control Panel
=====================
[![Build Status](https://travis-ci.org/kkhuong/ZeroCP.svg?branch=master)](https://travis-ci.org/kkhuong/ZeroCP)

Zeroeth Control Panel, or ZeroCP, is an online web hosting control panel that provides a web-based GUI and automation tools to simplify the process of hosting a website or managing a shared web hosting server. It is designed to be a cPanel alternative for Debian based operating systems, particularly Ubuntu.


To-Do
-----
- [ ] Update `install-dependencies.sh` to copy user default files to `/etc/skel`
- [ ] Throw away C++ code
- [ ] Create new Rails app
- [ ] Install Postgres SQL. Setup the database and have the Rails app make use of that
- [ ] Update Travis CI configuration to reflect our changes
- [ ] Get the app to take in simple commands to create new Unix user
- [ ] Write a simple test to check if number of users is 1 after the first insert
- [ ] Update Travis CI configuration to reflect our changes
- [X] Learn how to work with sockets to open up a port


Development Process
-------------------
The `master` branch contains the latest code that has been written. It is regularly built and tested, but is not guaranteed to be completely stable. [Tags](https://github.com/kkhuong/ZeroCP/tags) are created to indicate a stable version of ZeroCP.


Testing
-------
ZeroCP is still in the pre-development phrase. However, we will occasionally write new [tests](test/) for ZeroCP.

### Unit Tests

Unit test for new code, will be added as needed. Unit tests can be compiled and run
(assuming they weren't disabled in configure) with: `make check`.

### Integration Tests

There are also integration tests, written
in Python, that are run automatically on the build server.

The Travis CI system makes sure that every push to the `master` branch is built for Windows, Linux, and OS X, and that unit/sanity tests are run automatically.

Implementation Remarks
----------------------
ZeroCP is a sysadmin software. As a result, we are using Ruby to implement the API system that will be installed on shared hosting servers. The so-called API system will take commands through HTTPS and perform sysadmin tasks directly on the server. This system will also feature a file manager for direct file uploading. Note that the entire system does not have an UI; it will be built separately.
