# capistrano-ec2elb

A Capistrano plugin aimed at easing the pain of deploying to Amazon EC2
instances by using an ELB name.

## Introduction

capistrano-ec2tag is a [Capistrano](https://github.com/capistrano/capistrano) plugin designed to simplify the
task of deploying to infrastructure hosted on [Amazon EC2](http://aws.amazon.com/ec2/). It was
completely inspired by the [capistrano-ec2group](https://github.com/logandk/capistrano-ec2group) plugin, to which all credit is due.

While the original [capistrano-ec2group](https://github.com/logandk/capistrano-ec2group) plugin served me well, I didn't want to rely on security groups for deployment as I used cloudformation more. I also wanted to transition to the aws-sdk gem. 

## Installation

### Set the Amazon AWS Credentials

In order for the plugin to list out hostnames of your EC2 instances, it
will need access to the Amazon EC2 API. Specify the following in your
Capistrano configuration:

```ruby
AWS.config(:access_key_id => '...', :secret_access_key => '...')
```

### Get the gem

The plugin is distributed as a Ruby gem.

**Ruby Gems**

```bash
gem install capistrano-ec2elb
```

**Bundler**

Using [bundler](http://gembundler.com/)?

```bash
gem install bundler
```

Then add the following to your Gemfile:

```ruby
source "http://rubygems.org"
gem "capistrano-ec2elb"
```

Install the gems in your manifest using:

```bash
bundle install
```

## Usage

### Configure Capistrano

```ruby
require 'capistrano/ec2elb'

task :production do
  tag "production-loadbalancer-web", :web
  tag "production-loadbalancer-job", :job
  logger.info "Deploying to the PRODUCTION environment!"
end

task :staging do
  tag "staging-loadbalancer-web", :web
  tag "staging-loadbalancer-job", :job
  logger.info "Deploying to the STAGING environment!"
end
```

## License

capistrano-ec2elb is copyright 2011 by [Phillip Goldenburg], released under the MIT License (see LICENSE for details).

