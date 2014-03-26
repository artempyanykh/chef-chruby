chruby cookbook
===============
This cookbook includes the following LWRPs:

1. `chruby` --- installs [chruby](https://github.com/postmodern/chruby) on your machine.
2. `chruby_gem` --- installs gem for specified version of ruby.
3. `chruby_source_file` --- generates file, which sources **chruby** and sets specific version of ruby as default.

The main use case:

1. Install `chruby` with chruby LWRP.
2. Build `ruby` with ruby-build.
3. Install `bundler` with chruby_gem LWRP.
4. Use chruby_source_file LWRP to generate and source config file by **deploy** user.

Requirements
------------
#### dependencies
- `ark` - chruby LWRP needs ark to load and install **chruby**.

#### tested on
- `Ubuntu 12.04`

Attributes
----------
#### chruby::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chruby']['version']</tt></td>
    <td>String</td>
    <td>version of chruby to install</td>
    <td><tt>0.3.8</tt></td>
  </tr>
</table>

Usage
-----
chruby cookbook provides the following recipes:

- `chruby::default` --- include this recipe to get access to LWRPs; chruby won't be installed.
- `chruby::install` --- include this recipe to get access to LWRPs **AND** to install `chruby` with version defined in `['chruby']['version']` attribute.

How to use LWRPs:

 - `chruby`. Use the following snippet to install **chruby**:
				
		chruby "version.of.chruby"
		
	Currently only `install` action is supported.
- `chruby_gem`. If you need to install gem under specific version of ruby for specific user and group, you can achieve it with the following snippet:
		
		chruby_gem "bundler" do
			ruby_version "2.0.0-p353"
			user "deploy"
			group "deploy"
		end
- `chruby_source_file`. The name could be misleading , but I couldn't think of a better one. This LWRP generates file, which **sources** chruby and sets up specified version of ruby as default, and places it the the specified place. The following snippet could help to understand:
		
		chruby_source_file "/home/deploy/sources.d/chruby.sh" do
			user "deploy"
			group "deploy"
			ruby_version "2.0.0-p353"
		end
	You may have noticed, that `chruby_source_file` doesn't make any changes to `.bashrc` or `.bash_profile`. That was done intentionally. 
I don't feel it is right to mess with existing files content. That's why in our **deploy** user's `.bashrc` we source all files in `~/sources.d/`.

Motto
------------
Paraphrasing one part of **The Zen of Python**: 

> _"LWRPs are one honking great idea -- let's do more of those!"_.

That is if some functionality can be implemented as LWRP, it **should** be implemented as LWRP. LWRPs are much easier to manage than recipes, to say the least.

Contributing
------------
This cookbook have rather limited functionality (e.g. it cannot remove or upgrade chruby), and it lacks tests. So, if you wish to contribute, related PRs would be much appreciated.

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors:

- [Artem Pyanykh](https://github.com/ArtemPyanykh)
- [Idris Yusupov](https://github.com/sld)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.