# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "capistrano-ec2elb"
  s.version     = "0.0.1"
  s.authors     = ["Phillip Goldenburg"]
  s.email       = [""]
  s.homepage    = "https://github.com/phillip/capistrano-ec2elb"
  s.summary     = "A Capistrano plugin aimed at easing the pain of deploying to Amazon EC2 instances by using a ELB name."
  s.description = "capistrano-ec2elb is a Capistrano plugin designed to simplify the task of deploying to infrastructure hosted on Amazon EC2. It was completely inspired by the capistrano-ec2group and capistrano-ec2tag plugins, to which all credit is due."

  s.rubyforge_project = "capistrano-ec2elb"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "capistrano", ">=2.1.0"
  s.add_dependency "aws-sdk"
end
