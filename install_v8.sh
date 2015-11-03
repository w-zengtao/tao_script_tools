#!/bin/bash

if ! bundle show therubyracer; then
    bundle config build.libv8 --with-system-v8
		    gem install --install-dir vendor/bundle libv8 -v 3.16.14.7
				    gem install libv8 -v 3.16.14.7
						    gem install --install-dir vendor/bundle therubyracer 
								fi
